Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA46546C3F8
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 20:51:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241776.418254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mugUP-0001k7-Iq; Tue, 07 Dec 2021 19:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241776.418254; Tue, 07 Dec 2021 19:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mugUP-0001iK-FV; Tue, 07 Dec 2021 19:51:01 +0000
Received: by outflank-mailman (input) for mailman id 241776;
 Tue, 07 Dec 2021 19:50:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mugUN-0001iE-Eg
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 19:50:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mugUN-0001NF-5s; Tue, 07 Dec 2021 19:50:59 +0000
Received: from [54.239.6.187] (helo=[10.95.81.235])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mugUM-0002Ab-W2; Tue, 07 Dec 2021 19:50:59 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=HwiU/NtMO6SqQ7Zv8a4/t8OkjeeJTzQ5f4trUOxfoWo=; b=zNZORF5ZZXE5rsC4eljr2O7VKh
	06PN1WqLu4nfjGFNhyOE7OWNRWi0ABWEjcwr0UWzbbSZZ0Lg3HBhbhvbSnXjnRBedS7z49xoZirc9
	9w7xeDK7yLP3WlVF/qT+xbzT4JtLSCzI6ymtzrHvJEoA6bF1V7XNvHn9KlOzgkK20ZY4=;
Message-ID: <8f1c0cec-7f0a-35f6-1157-e23b8a058e6d@xen.org>
Date: Tue, 7 Dec 2021 19:50:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm: Add Kconfig parameter for memory banks number
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20211206153730.49791-1-luca.fancellu@arm.com>
 <f439d5c4-aa6c-4066-3941-e497b67aeae1@xen.org>
 <C96E90F4-611E-4765-9627-EDE75A952E10@arm.com>
 <A6E7CDAA-E4AD-4AC3-8745-216FDC4DD8BF@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <A6E7CDAA-E4AD-4AC3-8745-216FDC4DD8BF@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bertrand and Luca,

On 07/12/2021 11:09, Bertrand Marquis wrote:
>> On 7 Dec 2021, at 10:52, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>
>>
>>
>>> On 6 Dec 2021, at 17:05, Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi Luca,
>>>
>>> On 06/12/2021 15:37, Luca Fancellu wrote:
>>>> Currently the maximum number of memory banks is fixed to
>>>> 128, but on some new platforms that have a large amount
>>>> of memory, this value is not enough
>>>
>>
>> Hi Julien,
>>
>>> Can you provide some information on the setup? Is it using UEFI?
>>
>> Yes it is a platform with 32gb of ram, I’ve built Xen with ACPI support and it’s starting using UEFI+ACPI.
Thanks! That makes more sense now. Although...

>>
>>>
>>>> and prevents Xen
>>>> from booting.
>>>
>>> AFAIK, the restriction should only prevent Xen to use all the memory. If that's not the case, then this should be fixed.
>>
>> The code that it’s failing is this, inside efi_process_memory_map_bootinfo(…) in the arch/arm/efi/efi-boot.h:
>>
>> #ifdef CONFIG_ACPI
>>         else if ( desc_ptr->Type == EfiACPIReclaimMemory )
>>         {
>>             if ( !meminfo_add_bank(&bootinfo.acpi, desc_ptr) )
>>             {
>>                 PrintStr(L"Error: All " __stringify(NR_MEM_BANKS)
>>                           " acpi meminfo mem banks exhausted.\r\n");
>>                 return EFI_LOAD_ERROR;
>>             }
>>         }
>> #endif

... I was expecting bootinfo.mem to be filled rather than bootinfo.acpi:

             if ( !meminfo_add_bank(&bootinfo.mem, desc_ptr) )
             {
                 PrintStr(L"Warning: All " __stringify(NR_MEM_BANKS)
                           " bootinfo mem banks exhausted.\r\n");
                 break;
             }

It is actually quite surprising that you end up with more than 128 
regions here.

>
>>>
>>>> Create a Kconfig parameter to set the value, by default
>>>> 128.
>>>
>>> I think Xen should be able to boot on any platform with the default configuration. So the value should at least be bumped.
>>>
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>> ---
>>>> xen/arch/arm/Kconfig        | 8 ++++++++
>>>> xen/include/asm-arm/setup.h | 2 +-
>>>> 2 files changed, 9 insertions(+), 1 deletion(-)
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index ecfa6822e4d3..805e3c417e89 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -25,6 +25,14 @@ menu "Architecture Features"
>>>>    source "arch/Kconfig"
>>>> +config MEM_BANKS
>>>> +	int "Maximum number of memory banks."
>>>> +	default "128"
>>>> +	help
>>>> +	  Controls the build-time size memory bank array.
>>>> +	  It is the upper bound of the number of logical entities describing
>>>> +	  the memory.
>>>
>>> NR_MEM_BANKS is going to be used by multiple internal structure in Xen (e.g. static memory, reserved memory, normal memory). So how could an admin decide the correct value?
>>>
>>> In particular for UEFI, we are at the mercy of the firmware that can expose any kind of memory map (that's why we had to increase the original number of banks).
>>>
>>> So maybe it is time for us to move out from a static array and re-think how we discover the memory.
>>>
>>> That this is probably going to take some time to get it properly, so
>>> I would be OK with bumping the value + a config gated UNSUPPORTED.
> 
> 
> Looking at what we have, the memory is actually fragmented by ACPI but a long term solution could be to make the code a little bit more smart and try to merge together adjacent banks.

That could work, but I think we could get rid of bootinfo.acpi completely.

If I am not mistaken, bootinfo.acpi is only used by Xen to figure out 
how to create the EFI memory map for dom0. So this could be replaced 
with a walk of the UEFI memory map.

Looking at the code, we have already some boiler plate for x86 to pass 
the UEFI memory map from the stub to Xen. They would need need to be 
adjusted for Arm to:

    * Enable ebmalloc() (see TODOs in common/efi/ebmalloc.c)
    * Switch efi_arch_allocate_mmap_buffer() to use ebmalloc()
    * Adjust the pointers (see end of the efi_exit_boot()). I think we 
would want to pass the physical and let the actual Xen to translate to a 
virtual address

> 
> I would suggest to just increase the existing define to 256 to fix the current issue (which might be encountered by anybody using ACPI) and put a comment in the code for now with a TODO explaining why we currently need such a high value and what should be done to fix this.

I am fine with simply bumping the value (the actual array doesn't take a 
lot of space and will be freed after boot).

Long term, I think it would be better if we start to reduce the number 
of bootinfo.mem* and removing any hardcoded size.

When using UEFI, we could replace with the UEFI memory map. For non-UEFI 
DT boot, we would still need to create the memory map by hand to avoid 
walking the DT every time.

Cheers,

-- 
Julien Grall

