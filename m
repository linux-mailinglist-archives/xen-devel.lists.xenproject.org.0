Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B506C9BF0B1
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 15:51:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831158.1246328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hMk-0000rd-2J; Wed, 06 Nov 2024 14:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831158.1246328; Wed, 06 Nov 2024 14:50:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hMj-0000pg-Vh; Wed, 06 Nov 2024 14:50:37 +0000
Received: by outflank-mailman (input) for mailman id 831158;
 Wed, 06 Nov 2024 14:50:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RQdK=SB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8hMi-0000pV-TX
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 14:50:36 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78b187ed-9c4e-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 15:50:33 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730904625295152.6335008174757;
 Wed, 6 Nov 2024 06:50:25 -0800 (PST)
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
X-Inumbo-ID: 78b187ed-9c4e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc4YjE4N2VkLTljNGUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTA0NjMzLjQ3NjIwMSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730904628; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QD3fEgmN9opbEU9IYOfp7FrjQTWEnEGI1oJiWTJSxVT+kI4Lh3/Eveo01baLUtK/v5Vqgrk9DK01lwX1l9WMInt6+fjP4hc7LZA+wISFP3IrdHzJ2RErghCuRFS7V4sMcLQkxaKdYER0eV46CNhJfSqOIh8o/pUZgMU94guwark=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730904628; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fvljI8DRXGMEXkm48aXLoDUy0iR1Mc4S10rWOr2Clhc=; 
	b=AtqHV/Z17LaFnRorgEHphXG31EcaLxaQ5tvmGRq25hemmOkiREEkXEJL77Wwu5u6WIfhnpuXM/OeHdAZA7aY7oUc6pXZxqfP28Ct7Zj2WnAtAhL1NMm0GedMjJhj/RH620QSP0jL6QZfJ3w5kXzIYZ19QasEbv3qNO6syo1Tex8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730904628;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fvljI8DRXGMEXkm48aXLoDUy0iR1Mc4S10rWOr2Clhc=;
	b=C7SxY3Fv/GrR2f26Ku0Ssv7+FCksKFs9tLjQHw2Et80bMPULCywTVBCxEnTK1TAc
	E9Kyl2JJMOjImU6fXrBPPw+fxF2NcT8oM+lLFoTIEEh0C7CIhT5VmMHmM+2Tptgual/
	jycMAxgwb2EhhrMgvKKO7RThpSr2EVPUEooO5Wi8=
Message-ID: <111206f7-2a87-4a31-a6fd-003b5941cb85@apertussolutions.com>
Date: Wed, 6 Nov 2024 09:50:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] x86/boot: eliminate module_map
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-3-dpsmith@apertussolutions.com>
 <2faf07d6-35a2-46c8-92db-8cf26a304800@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <2faf07d6-35a2-46c8-92db-8cf26a304800@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/6/24 09:34, Andrew Cooper wrote:
> On 02/11/2024 5:25 pm, Daniel P. Smith wrote:
>> With all boot modules now labeled by type, it is no longer necessary to
>> track whether a boot module was identified via the module_map bitmap.
>>
>> Introduce a set of helpers to search the list of boot modules based on type and
>> the reference type, pointer or array index, desired. Then drop all uses of
>> setting a bit in module_map and replace its use for looping with the helpers.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>> Changes since v7:
>> - collapse the three module_map patches into one,
>>    - x86/boot: remove module_map usage from microcode loading
>>    - x86/boot: remove module_map usage from xsm policy loading
>>    - x86/boot: remove module_map usage by ramdisk loading
> 
> Definitely nicer for having been collapsed together.

Most definitely.

>> ---
>>   xen/arch/x86/cpu/microcode/core.c   | 12 ++++-----
>>   xen/arch/x86/include/asm/bootinfo.h | 42 ++++++++++++++++++++++++++++-
>>   xen/arch/x86/setup.c                | 28 +++++++++++--------
>>   xen/xsm/xsm_policy.c                | 19 +++++--------
>>   4 files changed, 70 insertions(+), 31 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
>> index f46464241557..b09cf83249f6 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -790,15 +790,13 @@ static int __init early_microcode_load(struct boot_info *bi)
>>   
>>       if ( opt_scan ) /* Scan for a CPIO archive */
>>       {
>> -        for ( idx = 1; idx < bi->nr_modules; ++idx )
>> +        for_each_boot_module_by_type(idx, bi, BOOTMOD_UNKNOWN)
> 
> Minor, but we treat for_each_* as if they were for loops, so this either
> wants to be
> 
> for_each_boot_module_by_type ( idx, bi, BOOTMOD_UNKNOWN )
> 
> or
> 
> for_each_boot_module_by_type (idx, bi, BOOTMOD_UNKNOWN)
> 
> spacing wise.  There's no agreement between maintainers on the extra
> spaces inside brackets or not.

If it is considered a for loop, then I would feel obliged to add the 
spacing per the coding style.

> However, despite looking at this many times, I've only just realised...
> This semantically changes things in a direction that we won't want.
> 
> Today, BOOTMOD_RAMDISK only happens a side effect of being "first
> BOOTMOD_UNKNOWN standing at the end".
> 
> But the EFI boot code ought to set bi->type=RAMDISK explicitly from the
> ramdisk= argument (it can probably set type=MICROCODE too), and future
> plans with a large HL config probably will be similar.
> 
> Anything which sets type=, and type=RAMDISK in particular, prior to
> early_microcode_load() excludes it from the search.  This is definitely
> not what we want.
> 
> 
> It's a latent bug for now, but I'd suggest keeping the plain for loop, with
> 
>              /* Search anything unclaimed or likely to be a CPIO archive. */
>              if ( bm->type != BOOTMOD_UNKNOWN &&
>                   bm->type != BOOTMOD_RAMDISK )
>                  continue;
> 
> as the selection criteria.  Probably also want to start from idx=0 to
> remove assumptions about the dom0 kernel.
> 
> Thoughts?

Yah, as much as it would be nice to use the helper, this is the 
exception where there is a complex match condition to be handled. This 
will be switched over to an explicit for loop.

>>           {
>> +            struct boot_module *bm = &bi->mods[idx];
>>               struct cpio_data cd;
>>   
>> -            if ( !test_bit(idx, bi->module_map) )
>> -                continue;
>> -
>> -            size = bi->mods[idx].mod->mod_end;
>> -            data = bootstrap_map_bm(&bi->mods[idx]);
>> +            size = bm->mod->mod_end;
>> +            data = bootstrap_map_bm(bm);
>>               if ( !data )
>>               {
>>                   printk(XENLOG_WARNING "Microcode: Could not map module %d, size %zu\n",
>> @@ -840,7 +838,7 @@ static int __init early_microcode_load(struct boot_info *bi)
>>               return -ENODEV;
>>           }
>>   
>> -        if ( !__test_and_clear_bit(idx, bi->module_map) )
>> +        if ( bi->mods[idx].type != BOOTMOD_UNKNOWN )
>>           {
>>               printk(XENLOG_WARNING "Microcode: Chosen module %d already used\n", idx);
>>               return -ENODEV;
>> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
>> index fc74e3b224e7..37dfcc14fa7d 100644
>> --- a/xen/arch/x86/include/asm/bootinfo.h
>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>> @@ -43,10 +43,50 @@ struct boot_info {
>>       size_t memmap_length;
>>   
>>       unsigned int nr_modules;
>> -    unsigned long *module_map; /* Temporary */
>>       struct boot_module mods[MAX_NR_BOOTMODS + 1];
>>   };
>>   
>> +/*
>> + * next_boot_module_index:
>> + *     Finds the next boot module of type t, starting at array index start.
>> + *
>> + * Returns:
>> + *      Success - index in boot_module array
>> + *      Failure - a value greater than MAX_NR_BOOTMODS
>> + */
>> +static inline unsigned int __init next_boot_module_index(
>> +    const struct boot_info *bi, enum bootmod_type t, unsigned int start)
>> +{
>> +    unsigned int i;
>> +
>> +    if ( t == BOOTMOD_XEN )
>> +        return bi->nr_modules;
>> +
>> +    for ( i = start; i < bi->nr_modules; i++ )
>> +    {
>> +        if ( bi->mods[i].type == t )
>> +            return i;
>> +    }
>> +
>> +    return MAX_NR_BOOTMODS + 1;
>> +}
>> +
>> +/*
>> + * first_boot_module_index:
>> + *     Finds the first boot module of type t.
>> + *
>> + * Returns:
>> + *      Success - index in boot_module array
>> + *      Failure - a value greater than MAX_NR_BOOTMODS
>> + */
>> +#define first_boot_module_index(bi, t)              \
>> +    next_boot_module_index(bi, t, 0)
>> +
>> +#define for_each_boot_module_by_type(i, b, t)       \
>> +    for ( i = first_boot_module_index(b, t);        \
>> +          i <= (b)->nr_modules;                     \
>> +          i = next_boot_module_index(b, t, i + 1) )
> 
> (i) = first_...

Ack.

>> diff --git a/xen/xsm/xsm_policy.c b/xen/xsm/xsm_policy.c
>> index 4c195411d05b..12c9de5a1fbf 100644
>> --- a/xen/xsm/xsm_policy.c
>> +++ b/xen/xsm/xsm_policy.c
>> @@ -33,22 +33,18 @@
>>   int __init xsm_multiboot_policy_init(
>>       struct boot_info *bi, void **policy_buffer, size_t *policy_size)
>>   {
>> -    int i;
>> +    unsigned int i;
>>       int rc = 0;
>>       u32 *_policy_start;
>>       unsigned long _policy_len;
>>   
>> -    /*
>> -     * Try all modules and see whichever could be the binary policy.
>> -     * Adjust module_map for the module that is the binary policy.
>> -     */
>> -    for ( i = bi->nr_modules - 1; i >= 1; i-- )
>> +    /* Try all unknown modules and see whichever could be the binary policy. */
>> +    for_each_boot_module_by_type(i, bi, BOOTMOD_UNKNOWN)
>>       {
>> -        if ( !test_bit(i, bi->module_map) )
>> -            continue;
>> +        struct boot_module *bm = &bi->mods[i];
>>   
>> -        _policy_start = bootstrap_map(bi->mods[i].mod);
>> -        _policy_len   = bi->mods[i].mod->mod_end;
>> +        _policy_start = bootstrap_map(bm->mod);
>> +        _policy_len   = bm->mod->mod_end;
> 
> Minor, but you ought to switch to bootstrap_map_bm() here straight away,
> which reduces the churn in patch 9.

Ack.

v/r,
dps

