Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE76F48D9E3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 15:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257238.441981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n81Lh-0003CW-5E; Thu, 13 Jan 2022 14:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257238.441981; Thu, 13 Jan 2022 14:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n81Lh-0003A8-2A; Thu, 13 Jan 2022 14:45:09 +0000
Received: by outflank-mailman (input) for mailman id 257238;
 Thu, 13 Jan 2022 14:45:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVjj=R5=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1n81Lf-0003A2-Da
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 14:45:07 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6570ddbd-747f-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 15:45:05 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:51244)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1n81Lc-0004GI-pX (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 13 Jan 2022 14:45:04 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id AD1831FAB6;
 Thu, 13 Jan 2022 14:45:04 +0000 (GMT)
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
X-Inumbo-ID: 6570ddbd-747f-11ec-a563-1748fde96b53
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <26235a19-4c4c-3bb9-3740-94306c773e26@srcf.net>
Date: Thu, 13 Jan 2022 14:45:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] x86/hvm: Improve hvm_set_guest_pat() code generation
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220113135035.23361-1-andrew.cooper3@citrix.com>
 <bfbe31d2-4d67-d7fc-4bb0-5b2caf209460@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <bfbe31d2-4d67-d7fc-4bb0-5b2caf209460@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/01/2022 14:38, Jan Beulich wrote:
> On 13.01.2022 14:50, Andrew Cooper wrote:
>> This is a fastpath on virtual vmentry/exit, and forcing guest_pat to be
>> spilled to the stack is bad.  Performing the shift in a register is far more
>> efficient.
>>
>> Drop the (IMO useless) log message.  MSR_PAT only gets altered on boot, and a
>> bad value will be entirely evident in the ensuing #GP backtrace.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> I'm curious though why ...
>
>> @@ -313,10 +313,9 @@ int hvm_set_guest_pat(struct vcpu *v, u64 guest_pat)
>>          case PAT_TYPE_WRCOMB:
>>          case PAT_TYPE_WRPROT:
>>          case PAT_TYPE_WRTHROUGH:
>> -            break;
>> +            continue;
> ... you're going from "break" to "continue" here.

I went through a couple of iterations, including one not having a switch
statement at all.

Personally, I think continue is clearer to follow in constructs such as
this, because it is clearly bound to the loop, while the break logic
only works due to the switch being the final (only) clause.

~Andrew

P.S. if you want to see a hilarious Clang (mis)feature, check out
https://godbolt.org/z/7z6PnKP31 - scroll to the bottom of the -O2 output.

