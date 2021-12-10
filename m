Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568694706D7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 18:16:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244109.422239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvjVH-0006uu-1C; Fri, 10 Dec 2021 17:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244109.422239; Fri, 10 Dec 2021 17:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvjVG-0006t7-UJ; Fri, 10 Dec 2021 17:16:14 +0000
Received: by outflank-mailman (input) for mailman id 244109;
 Fri, 10 Dec 2021 17:16:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a5or=Q3=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1mvjVF-0006t1-PG
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 17:16:13 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ded68ef4-59dc-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 18:16:12 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:36146)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1mvjVC-00059H-87 (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 10 Dec 2021 17:16:10 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 54EC1200D8;
 Fri, 10 Dec 2021 17:16:10 +0000 (GMT)
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
X-Inumbo-ID: ded68ef4-59dc-11ec-ad7a-b7ef48004f0a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <23feef0d-2913-69cf-1a1f-59b1e933ad37@srcf.net>
Date: Fri, 10 Dec 2021 17:16:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126163830.30151-1-andrew.cooper3@citrix.com>
 <f3a94e22-5136-8cb8-6df5-58899a8bc4a7@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v1.1 64/65] x86/efi: Disable CET-IBT around Runtime
 Services calls
In-Reply-To: <f3a94e22-5136-8cb8-6df5-58899a8bc4a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/12/2021 11:06, Jan Beulich wrote:
> On 26.11.2021 17:38, Andrew Cooper wrote:
>> --- a/xen/arch/x86/efi/stub.c
>> +++ b/xen/arch/x86/efi/stub.c
>> @@ -11,6 +11,8 @@
>>  #include <efi/efidevp.h>
>>  #include <efi/efiapi.h>
>>  
>> +bool __initdata efi_no_cet_ibt;
> I'm having trouble seeing what this is needed for - when this file gets
> built, neither boot.c nor runtime.c will get compiled, and hence there
> should not be any reference to the symbol that needs satisfying.
>
>> @@ -735,6 +736,14 @@ static void __init efi_init(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTabl
>>  
>>      StdOut = SystemTable->ConOut;
>>      StdErr = SystemTable->StdErr ?: StdOut;
>> +
>> +#ifdef CONFIG_X86
> CONFIG_XEN_IBT?
>
>> +    /*
>> +     * Heuristic.  Look under an arbitrary function pointer to see if UEFI was
>> +     * compiled with CET-IBT support.  Experimentally some are not.
>> +     */
>> +    efi_no_cet_ibt = !is_endbr64(efi_rs->GetTime);
> I'm afraid I consider this insufficient. Even if the core EFI was built
> with IBT support, some driver may not have been.

That's not an issue.  Everything is built together in practice.

>  Hence I think there
> needs to be a command line control to force turning off IBT. The only
> question is whether we want to also honor its positive form - that
> would, afaict, be a recipe for a guaranteed crash if used wrongly (and
> it would be meaningless when used on IBT-aware firmware).

It turns out that IBT support is lacking from tianocore, so nothing is
going to support IBT for a good while yet.

https://bugzilla.tianocore.org/show_bug.cgi?id=3726 is the proposed
change to the spec to support this.

In the meantime, I'm just going to blanket disable IBT for RS calls.

~Andrew

