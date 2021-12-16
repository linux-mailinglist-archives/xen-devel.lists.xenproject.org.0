Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EB1477122
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 12:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247904.427530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxpLF-0004gS-NZ; Thu, 16 Dec 2021 11:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247904.427530; Thu, 16 Dec 2021 11:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxpLF-0004dp-Je; Thu, 16 Dec 2021 11:54:33 +0000
Received: by outflank-mailman (input) for mailman id 247904;
 Thu, 16 Dec 2021 11:54:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sk45=RB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mxpLD-0004dj-9W
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 11:54:31 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ece3a03e-5e66-11ec-9e60-abaf8a552007;
 Thu, 16 Dec 2021 12:54:30 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:47032)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mxpLB-00077X-mt (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 16 Dec 2021 11:54:29 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id D83041FA47;
 Thu, 16 Dec 2021 11:54:28 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: ece3a03e-5e66-11ec-9e60-abaf8a552007
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <ff12f0df-a2c4-ae9b-b956-a602cc0bb844@srcf.net>
Date: Thu, 16 Dec 2021 11:54:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH] x86: enable interrupts around dump_execstate()
In-Reply-To: <e717897f-980d-ad44-31d9-39f5e7e1c45e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/12/2021 15:12, Jan Beulich wrote:
> show_hvm_stack() requires interrupts to be enabled to avoids triggering
> the consistency check in check_lock() for the p2m lock. To do so in
> spurious_interrupt() requires adding reentrancy protection / handling
> there.
>
> Fixes: adb715db698b ("x86/HVM: also dump stacks from show_execution_state()")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The obvious (but imo undesirable) alternative is to suppress the call to
> show_hvm_stack() when interrupts are disabled.

show_execution_state() need to work in any context including the #DF
handler, and

    /*
     * Stop interleaving prevention: The necessary P2M lookups
     * involve locking, which has to occur with IRQs enabled.
     */
    console_unlock_recursive_irqrestore(flags);
    
    show_hvm_stack(curr, regs);

is looking distinctly dodgy...

For these kinds of purposes, it ought to be entirely fine to do a
lockless pagewalk of the p2m, because we have to maintain atomicity of
updates vs the hardware pagewalk anyway.  We do not care about any side
effects if the target isn't a RAM page.

That ought to remove any IRQ problems from the equation.

~Andrew

