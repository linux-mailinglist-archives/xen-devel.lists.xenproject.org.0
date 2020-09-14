Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD78268FD4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:27:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHqNh-0001gX-6k; Mon, 14 Sep 2020 15:27:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHqNg-0001gS-8P
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:27:00 +0000
X-Inumbo-ID: 96a7fc64-f18f-4ba5-9de0-2730855daebb
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96a7fc64-f18f-4ba5-9de0-2730855daebb;
 Mon, 14 Sep 2020 15:26:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7C997AFC1;
 Mon, 14 Sep 2020 15:27:13 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] EFI: free unused boot mem in at least some cases
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
References: <5dd2fcea-d8ec-1c20-6514-c7733b59047f@suse.com>
 <f474ff55-cd39-fd6e-f96e-942a17e959ee@suse.com>
 <20200914151608.GF753@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bd8eaf14-0668-003e-d58d-2633e5a22c15@suse.com>
Date: Mon, 14 Sep 2020 17:26:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200914151608.GF753@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.09.2020 17:16, Roger Pau Monné wrote:
> On Mon, Aug 24, 2020 at 02:08:11PM +0200, Jan Beulich wrote:
>> Address at least the primary reason why 52bba67f8b87 ("efi/boot: Don't
>> free ebmalloc area at all") was put in place: Make xen_in_range() aware
>> of the freed range. This is in particular relevant for EFI-enabled
>> builds not actually running on EFI, as the entire range will be unused
>> in this case.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks much.

>> @@ -1145,7 +1146,8 @@ void __init noreturn __start_xen(unsigne
>>  
>>          /*
>>           * This needs to remain in sync with xen_in_range() and the
>> -         * respective reserve_e820_ram() invocation below.
>> +         * respective reserve_e820_ram() invocation below. No need to
>> +         * query efi_boot_mem_unused() here, though.
>>           */
>>          mod[mbi->mods_count].mod_start = virt_to_mfn(_stext);
>>          mod[mbi->mods_count].mod_end = __2M_rwdata_end - _stext;
> 
> I find this extremely confusing, we reuse mod_start/mod_end to contain
> a mfn and a size (in bytes) instead of a start and end address (not
> something that should be fixed here, but seeing this I assumed it was
> wrong).

While perhaps somewhat confusing, I still think it was a fair thing
to do in favor of introducing a completely new way of propagating
respective information, and then having the consumer of this data
look at two different places.

>> +bool efi_boot_mem_unused(unsigned long *start, unsigned long *end)
>> +{
>> +    *start = (unsigned long)ebmalloc_mem + PAGE_ALIGN(ebmalloc_allocated);
>> +    *end = (unsigned long)ebmalloc_mem + sizeof(ebmalloc_mem);
>> +
>> +    return *start < *end;
>> +}
>> +
>>  void __init free_ebmalloc_unused_mem(void)
>>  {
>> -#if 0 /* FIXME: Putting a hole in the BSS breaks the IOMMU mappings for dom0. */
>>      unsigned long start, end;
>>  
>> -    start = (unsigned long)ebmalloc_mem + PAGE_ALIGN(ebmalloc_allocated);
>> -    end = (unsigned long)ebmalloc_mem + sizeof(ebmalloc_mem);
>> +#ifdef CONFIG_X86
>> +    /* FIXME: Putting a hole in .bss would shatter the large page mapping. */
> 
> Could you make the ebmalloc size (EBMALLOC_SIZE) 2MB (and aligned), so
> that you would only shatter the malloc'ed pages but not the
> surrounding mappings?
> 
> That would be a good compromise IMO.

Yes, that's what I've been considering as a compromise as well. In
fact I was further thinking whether to allocate the space from the
linker script instead of having a global/static object. Maybe by
extending into the .pad section, which is already 2Mb aligned anyway.

Another option is to not further align the whole blob at all and
merely free whatever comes past the next 2Mb boundary (and is not
in use). This would avoid having an up to 2Mb block of unused, not
freed memory ahead of the ebmalloc one.

Jan

