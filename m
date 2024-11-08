Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427F09C2571
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 20:18:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832754.1248038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9UTs-0002kr-58; Fri, 08 Nov 2024 19:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832754.1248038; Fri, 08 Nov 2024 19:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9UTs-0002iR-2S; Fri, 08 Nov 2024 19:17:16 +0000
Received: by outflank-mailman (input) for mailman id 832754;
 Fri, 08 Nov 2024 19:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pHpy=SD=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t9UTr-0002iL-2U
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:17:15 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cb69c28-9e06-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 20:17:10 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1731093423192378.14653418271905;
 Fri, 8 Nov 2024 11:17:03 -0800 (PST)
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
X-Inumbo-ID: 0cb69c28-9e06-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBjYjY5YzI4LTllMDYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDkzNDMxLjI2NjExNSwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1731093425; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=agnQ0oDddt9aBNoa0bze98B9Hip9khjxsv3eXmSsGpm5jBBjVpS6oXcYYSueQXT6BjryxVPisLKwA243+dXEWV4UzWNieOxmWo/SFO1RKHUA7tWFFzvK6Z7fIpTGtRj7p6ro6I2IonGlEVT5hO6kGUIU9DowewhMrZYxGmhH5OU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731093425; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hxcI88TddtcriTmuRuynGcVOBVd9+DzofvoZH7mEp0E=; 
	b=Ef3gLXHc+xXsb/cSRUQ964Jb7t2uX12QUaZ/vjS0obqEKiJEryymNNKxwP0xhFAY1FSTtW7TdkNrlUafBuwOAEccG7UoIw0knttMfRuS6lHv+GkZ9DAuXkBOAbSrVedcUuGrsWcrS2NoWIQNYqwWV2lZdeLOz8bWNcA1KdYnpxo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731093425;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=hxcI88TddtcriTmuRuynGcVOBVd9+DzofvoZH7mEp0E=;
	b=foiUIAPcbnqIBoK4bSipyn/R2buFaMnSXqilVJN9u0uuXs7DMX59YcD9qtLXb4nx
	UvQGka71HvCL1FCh9HWZYijhIlkYVg8mMV2F2EWso9wqXdA94acgMFpbC1KYkBclimA
	I5+A+RrUDPBLw4ATISNFFP4IUtf9dnXTQVv7Bpjc=
Message-ID: <c8d690f9-a357-44de-a6e5-4bbab4256c51@apertussolutions.com>
Date: Fri, 8 Nov 2024 14:17:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] x86/boot: add start and size fields to struct
 boot_module
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-10-dpsmith@apertussolutions.com>
 <bd4fa542-7e05-463d-99d7-b5c57781a56e@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <bd4fa542-7e05-463d-99d7-b5c57781a56e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/7/24 15:47, Jason Andryuk wrote:
> On 2024-11-02 13:25, Daniel P. Smith wrote:
>> Introduce the start and size fields to struct boot_module and
>> assigns their value during boot_info construction. All uses of 
>> module_t to get
>> the address and size of a module are replaced with start and size.
>>
>> The EFI entry point is a special case, as the EFI file loading boot 
>> service may
>> load a file beyond the 4G barrier. As a result, to make the address 
>> fit in the
>> 32bit integer used by the MB1 module_t structure, the frame number is 
>> stored in
>> mod_start and size in mod_end. Until the EFI entry point is 
>> enlightened to work
>> with boot_info and boot_module, multiboot_fill_boot_info will handle the
>> alternate values in mod_start and mod_end when EFI is detected.
>>
>> A result of the switch to start/size removes all uses of the mod field in
>> struct boot_modules, along with the uses of bootstra_map() and 
>> release_module()
>> functions. With all usage gone, they all are dropped here.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> -- 
>> Changes since v7:
>> - add the start/size change to bootstrap_map_bm()
>> - convert all BM start/size when introduced, consolidates:
>>      x86/boot: populate boot module for xen entry
>>      x86/boot: transition relocation calculations to struct boot_module
>> - consolidates all the removal commits
>>
>> Changes since v6:
>> - put the efi conversion for mod_start and mod_end back along with check
>> - dropped unnecessary cast
>> - updated the population of start and size fields to take into account 
>> efi
>>
>> Changes since v5:
>> - switched EFI population of mod_start/mod_end to addresses
>>
>> a#    edit 336ac1fc0019 x86/boot: introduce boot domain
>> ---
> 
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index d9785acf89b6..18b93d6a272a 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -313,13 +313,29 @@ static struct boot_info *__init 
>> multiboot_fill_boot_info(
>>        */
>>       for ( i = 0; i < MAX_NR_BOOTMODS && i < bi->nr_modules; i++ )
>>       {
>> -        bi->mods[i].mod = &mods[i];
>> -
>>           bi->mods[i].cmdline_pa = mods[i].string;
>> +
>> +        if ( !efi_enabled(EFI_LOADER) )
>> +        {
>> +            /*
>> +             * The EFI loader gives us modules which are already 
>> frame/size.
>> +             * Switch back to address/size.
>> +             */
> 
> This comment...
> 
>> +            bi->mods[i].start = mods[i].mod_start;
>> +            bi->mods[i].size = mods[i].mod_end - mods[i].mod_start;
>> +        }
>> +        else
>> +        {
>> +            /*
>> +             * PVH and BIOS loaders give us modules which are start/end.
>> +             * Switch to address/size.
>> +             */
> 
> And this comment are reversed?  But I would just use positive logic:
> 
> if ( efi_enabled(EFI_LOADER) )
>     /* EFI case */
> else
>     /* non-EFI */

Ack.

>> +            bi->mods[i].start = pfn_to_paddr(mods[i].mod_start);
>> +            bi->mods[i].size = mods[i].mod_end;
>> +        }
>>       }
>>       /* Variable 'i' should be one entry past the last module. */
>> -    bi->mods[i].mod = &mods[bi->nr_modules];
>>       bi->mods[i].type = BOOTMOD_XEN;
>>       return bi;
>> @@ -335,8 +351,8 @@ unsigned long __init 
>> initial_images_nrpages(nodeid_t node)
>>       for ( nr = i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        unsigned long start = bi->mods[i].mod->mod_start;
>> -        unsigned long end   = start + PFN_UP(bi->mods[i].mod->mod_end);
>> +        unsigned long start = bi->mods[i].start;
> 
> This should be paddr_to_pfn(bi->mods[i].start)?

Yes, and honestly probably a bad names for the vars as start/end tends 
to refer to addresses while pages usually have mfn/pfn in their name. 
The question is the churn from variable name not desired.

>> +        unsigned long end   = start + PFN_UP(bi->mods[i].size);
>>           if ( end > node_start && node_end > start )
>>               nr += min(node_end, end) - max(node_start, start);
> 
>> @@ -1745,13 +1733,11 @@ void asmlinkage __init noreturn __start_xen(void)
>>       for ( i = 0; i < bi->nr_modules; ++i )
>>       {
>> -        const struct boot_module *bm = &bi->mods[i];
>> +        unsigned long s = bi->mods[i].start, l = bi->mods[i].size;
>> -        set_pdx_range(bm->mod->mod_start,
>> -                      bm->mod->mod_start + PFN_UP(bm->mod->mod_end));
>> -        map_pages_to_xen((unsigned long)mfn_to_virt(bm->mod->mod_start),
>> -                         _mfn(bm->mod->mod_start),
>> -                         PFN_UP(bm->mod->mod_end), PAGE_HYPERVISOR);
>> +        set_pdx_range(paddr_to_pfn(s), paddr_to_pfn(s) + PFN_UP(l));
> 
> This is fine today since s (.start) is checked for page alignment.  The 
> other option would be `paddr_to_pfn(s + l) + 1`, but I'm not sure that 
> is an improvement.

Out of curiosity, why are you thinking that module start would never be 
paged aligned?

> You don't have to change anything.  Just noting something I noticed.

Ack.

v/r,
dps

