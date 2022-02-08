Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F964AD9EF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 14:32:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268323.462129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQbF-0005sX-NM; Tue, 08 Feb 2022 13:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268323.462129; Tue, 08 Feb 2022 13:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHQbF-0005pd-KK; Tue, 08 Feb 2022 13:32:05 +0000
Received: by outflank-mailman (input) for mailman id 268323;
 Tue, 08 Feb 2022 13:32:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHQbE-0005pX-DH
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 13:32:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHQbD-00009P-4K; Tue, 08 Feb 2022 13:32:03 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHQbC-0003ff-V4; Tue, 08 Feb 2022 13:32:03 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:Subject:From:MIME-Version:Date:Message-ID;
	bh=fCOKfLyYB9WvaT8PfEPO7Tfd/B8tF3dECzsUjhfvsvM=; b=A3YeuYYUZgymDgrsnCQ9Knd7yA
	tF81K49pJsgi3etKp2yI/ArYx/oWToJmLgODgkC3G3bFQpqN7RVCcUNgYhAp/AbeOt+D2cwq7BULd
	jwYrqDtKW98ZU7OZUhktoG3OfFAswaN6Ut4jxhPRQOfG37Ov6VwCeLba+J8TTXIBRRbU=;
Message-ID: <f7a83207-2b45-ebab-1d62-2e97b0042670@xen.org>
Date: Tue, 8 Feb 2022 13:32:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/efi: Use PrintErrMsg() rather than printk() in
 efi_exit_boot()
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220208105211.96727-1-julien@xen.org>
 <87559a9c-d459-e0df-cd89-6371f45870d2@suse.com>
In-Reply-To: <87559a9c-d459-e0df-cd89-6371f45870d2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 08/02/2022 11:10, Jan Beulich wrote:
> On 08.02.2022 11:52, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The function efi_exit_boot() will be called within the UEFI stub. This
>> means printk() is not available will actually result to a crash when
>> called (at least on Arm).
>>
>> Replace the call to printk() with PrintErrMsg().
>>
>> Fixes: 49450415d6 ("efi: optionally call SetVirtualAddressMap()")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> I think it was intentional to use printk() here, so I'd like to ask
> for more details about the observed crash.
I have reproduced with the following diff:

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 8d65e9ce16ea..032e5ddf0c67 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1089,6 +1089,8 @@ static void __init efi_exit_boot(EFI_HANDLE 
ImageHandle, EFI_SYSTEM_TABLE *Syste
      if ( EFI_ERROR(status) )
          PrintErrMesg(L"Cannot exit boot services", status);

+    printk("Test\n");
+
  #ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
      for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
      {


And got:

Using modules provided by bootloader in FDT
Xen 4.17-unstable (c/s Mon Feb 7 21:14:25 2022 +0000 
git:4ecd67a592-dirty) EFI loader


Synchronous Exception at 0x000000000026BAF8

This is pointing to:

42sh> addr2line -e xen-syms 0x000000000026BAF8 
 

/home/julien/works/upstream/xen/xen/arch/arm/early_printk.c:21

If I disable early printk it seems to work. Hmmm... I think this might 
be related to the issue I posted a few years ago [1].

> That's also to try to
> figure whether x86 would also be affected.

It looks like my x86 setup is not boot using xen.efi. I will need to 
configure it for more testing.

> The problem is that
> without serial console configured in EFI, the output from
> PrintErrMesg() is going to be very unlikely to actually be observable
> (on the console), whereas the printk() output would at least be
> retrievable by "xl dmesg" after the system is up.
> 
> What's worse though:
> 
> 1) PrintErrMesg() invokes blexit() as the last thing. Yet we don't
>     want to prevent Xen from booting; all we want is to disable use of
>     runtime services.

Fair point.

> 
> 2) I'm not convinced you can use StdErr anymore after ExitBootServices()
>     was already called.

I think you are right. From "UEFI Specification, Version 2.9" page 226, 
StdErr should be set to NULL after ExitBootServices() succeeded.

Insterestingly, the EFI firmware I had was still happy to print afterwards.

Anyway, my long term plan for UEFI on Arm is to separate the EFI stub 
from Xen itself (similar to what Linux did). One of the main reason is 
to keep to interface between the two clean and it helps to enforce what 
is used by who.

Therefore, I think I would prefer to move the printk() to Xen (maybe 
runtime.c?). I will have a look as part of the work to support runtime 
services on Arm.

So I will park this patch for now.

Cheers,

[1] 
https://patches.linaro.org/project/Xen/patch/20171221145521.29526-1-julien.grall@linaro.org/

-- 
Julien Grall

