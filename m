Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087B04664E5
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 15:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236590.410426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmjm-0007mh-32; Thu, 02 Dec 2021 14:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236590.410426; Thu, 02 Dec 2021 14:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msmjl-0007kl-WD; Thu, 02 Dec 2021 14:07:02 +0000
Received: by outflank-mailman (input) for mailman id 236590;
 Thu, 02 Dec 2021 14:07:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vx2B=QT=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msmjk-0007ka-Ep
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 14:07:00 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c4bbfba-5379-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 15:06:58 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40386)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msmjg-000Hog-pZ (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 02 Dec 2021 14:06:57 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id C13841FF79;
 Thu,  2 Dec 2021 14:06:56 +0000 (GMT)
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
X-Inumbo-ID: 1c4bbfba-5379-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <923d2203-e832-3fe3-a670-530622a39ab3@srcf.net>
Date: Thu, 2 Dec 2021 14:06:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-4-andrew.cooper3@citrix.com>
 <4615dde8-fe24-020d-0432-6935e9c0c9fa@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 3/8] x86/boot: Fix data placement around __high_start()
In-Reply-To: <4615dde8-fe24-020d-0432-6935e9c0c9fa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2021 11:49, Jan Beulich wrote:
> On 30.11.2021 11:04, Andrew Cooper wrote:
>> multiboot_ptr should be in __initdata - it is only used on the BSP path.
>> Furthermore, the .align 8 then .long means that stack_start is misaligned.
>>
>> Move both into setup.c, which lets the compiler handle the details correctly,
>> as well as providling proper debug information for them.
>>
>> Declare stack_start in setup.h and avoid extern-ing it locally in smpboot.c.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> Nevertheless I'd like to state that defining a variable in C when all
> its uses are in assembly seems a little odd to me.

I don't see it as odd, although I admit that I did try to see if I could
remove multiboot_ptr entirely first.  Xen is after all a single
freestanding binary.

Having the debug information (well - at a minimum, ELF size info) is
important for livepatch binary diffing, and nothing in asm by default
gets any of that.

Letting the compiler do this all for us is physically shorter, and less
prone to errors.

~Andrew

