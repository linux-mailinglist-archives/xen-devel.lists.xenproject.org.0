Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE97775437
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 09:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580718.909110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTdgb-0005FU-AE; Wed, 09 Aug 2023 07:32:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580718.909110; Wed, 09 Aug 2023 07:32:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTdgb-0005Dn-76; Wed, 09 Aug 2023 07:32:53 +0000
Received: by outflank-mailman (input) for mailman id 580718;
 Wed, 09 Aug 2023 07:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTdgZ-0005Dh-Sa
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 07:32:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f00a463d-3686-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 09:32:48 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 438D44EE073F;
 Wed,  9 Aug 2023 09:32:47 +0200 (CEST)
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
X-Inumbo-ID: f00a463d-3686-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Wed, 09 Aug 2023 09:32:47 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2 1/5] x86: address MISRA C:2012 Rule 5.3
In-Reply-To: <a35a6462-15c6-5413-12de-d089fcf1e298@suse.com>
References: <cover.1691492441.git.nicola.vetrini@bugseng.com>
 <3a9db416c6f8b2d5a549d49ff02238eb408cc905.1691492441.git.nicola.vetrini@bugseng.com>
 <a35a6462-15c6-5413-12de-d089fcf1e298@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <1e0912a2bae65db5c85b18bf1208bf37@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2023 15:46, Jan Beulich wrote:
> On 08.08.2023 13:08, Nicola Vetrini wrote:
>> --- a/xen/arch/x86/e820.c
>> +++ b/xen/arch/x86/e820.c
>> @@ -543,27 +543,27 @@ static void __init 
>> machine_specific_memory_setup(struct e820map *raw)
>>          clip_to_limit(top_of_ram, "MTRRs do not cover all of 
>> memory.");
>>  }
>> 
>> -/* This function relies on the passed in e820->map[] being sorted. */
>> -int __init e820_add_range(
>> -    struct e820map *e820, uint64_t s, uint64_t e, uint32_t type)
>> +/* This function relies on the global e820->map[] being sorted. */
>> +int __init e820_add_range(uint64_t s, uint64_t e, uint32_t type)
>>  {
>>      unsigned int i;
>> +    struct e820entry *ei = e820.map;
>> 
>> -    for ( i = 0; i < e820->nr_map; ++i )
>> +    for ( i = 0; i < e820.nr_map; ++i )
>>      {
>> -        uint64_t rs = e820->map[i].addr;
>> -        uint64_t re = rs + e820->map[i].size;
>> +        uint64_t rs = ei[i].addr;
>> +        uint64_t re = rs + ei[i].size;
>> 
>> -        if ( rs == e && e820->map[i].type == type )
>> +        if ( rs == e && ei[i].type == type )
>>          {
>> -            e820->map[i].addr = s;
>> +            ei[i].addr = s;
>>              return 1;
>>          }
>> 
>> -        if ( re == s && e820->map[i].type == type &&
>> -             (i + 1 == e820->nr_map || e820->map[i + 1].addr >= e) )
>> +        if ( re == s && ei[i].type == type &&
>> +             (i + 1 == e820.nr_map || ei[i + 1].addr >= e) )
>>          {
>> -            e820->map[i].size += e - s;
>> +            ei[i].size += e - s;
>>              return 1;
>>          }
>> 
>> @@ -574,20 +574,20 @@ int __init e820_add_range(
>>              return 0;
>>      }
>> 
>> -    if ( e820->nr_map >= ARRAY_SIZE(e820->map) )
>> +    if ( e820.nr_map >= ARRAY_SIZE(e820.map) )
>>      {
>>          printk(XENLOG_WARNING "E820: overflow while adding region"
>>                 " %"PRIx64"-%"PRIx64"\n", s, e);
>>          return 0;
>>      }
>> 
>> -    memmove(e820->map + i + 1, e820->map + i,
>> -            (e820->nr_map - i) * sizeof(*e820->map));
>> +    memmove(ei + i + 1, ei + i,
>> +            (e820.nr_map - i) * sizeof(*e820.map));
>> 
>> -    e820->nr_map++;
>> -    e820->map[i].addr = s;
>> -    e820->map[i].size = e - s;
>> -    e820->map[i].type = type;
>> +    e820.nr_map++;
>> +    ei[i].addr = s;
>> +    ei[i].size = e - s;
>> +    ei[i].type = type;
>> 
>>      return 1;
>>  }
> 
> To be honest this isn't quite what I was hoping for; the many ei[i]. 
> are
> (imo) quite a bit harder to read than ei-> would have been (hence my
> earlier suggestion to also update that pointer in the for() loop 
> header).
> Then again I see there is one use of ei[i + 1], which would likely look
> less neat as ei[1].addr when everywhere else we have ei->. So I guess 
> up
> to you whether you adjust further; I'll ack either form.
> 

I'll leave it as is.

>> --- a/xen/arch/x86/guest/hypervisor.c
>> +++ b/xen/arch/x86/guest/hypervisor.c
>> @@ -63,7 +63,7 @@ void hypervisor_resume(void)
>>  void __init hypervisor_e820_fixup(struct e820map *e820)
> 
> What about this one? The function parameter ...
> 
>>  {
>>      if ( ops.e820_fixup )
>> -        ops.e820_fixup(e820);
>> +        ops.e820_fixup();
>>  }
> 
> ... isn't used anymore, and the sole call site passes &e820.
> 

It remained there by accident.

>> --- a/xen/arch/x86/include/asm/e820.h
>> +++ b/xen/arch/x86/include/asm/e820.h
>> @@ -29,8 +29,7 @@ extern int reserve_e820_ram(struct e820map *e820, 
>> uint64_t s, uint64_t e);
>>  extern int e820_change_range_type(
>>      struct e820map *e820, uint64_t s, uint64_t e,
>>      uint32_t orig_type, uint32_t new_type);
> 
> And what about this one? None of the other subjects in the series 
> suggest
> this is then taken care of in a separate patch (as per the earlier
> discussion it indeed doesn't want dealing with right here).
> 

I'll mention this detail. While I work on other rules I'll think of a 
good way to rename.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -686,7 +686,7 @@ static void __init parse_video_info(void)
>>  #endif
>>  }
>> 
>> -static void __init kexec_reserve_area(struct e820map *e820)
>> +static void __init kexec_reserve_area(void)
>>  {
>>  #ifdef CONFIG_KEXEC
>>      unsigned long kdump_start = kexec_crash_area.start;
>> @@ -700,7 +700,7 @@ static void __init kexec_reserve_area(struct 
>> e820map *e820)
>> 
>>      is_reserved = true;
>> 
>> -    if ( !reserve_e820_ram(e820, kdump_start, kdump_start + 
>> kdump_size) )
>> +    if ( !reserve_e820_ram(&boot_e820, kdump_start, kdump_start + 
>> kdump_size) )
>>      {
>>          printk("Kdump: DISABLED (failed to reserve %luMB (%lukB) at 
>> %#lx)"
>>                 "\n", kdump_size >> 20, kdump_size >> 10, 
>> kdump_start);
>> @@ -1308,7 +1308,7 @@ void __init noreturn __start_xen(unsigned long 
>> mbi_p)
>>          if ( e820.map[i].type == E820_RAM )
>>              nr_pages += e820.map[i].size >> PAGE_SHIFT;
>>      set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
>> -    kexec_reserve_area(&boot_e820);
>> +    kexec_reserve_area();
>> 
>>      initial_images = mod;
>>      nr_initial_images = mbi->mods_count;
>> @@ -1495,7 +1495,7 @@ void __init noreturn __start_xen(unsigned long 
>> mbi_p)
>>          reserve_e820_ram(&boot_e820, __pa(_stext), 
>> __pa(__2M_rwdata_end));
>> 
>>      /* Late kexec reservation (dynamic start address). */
>> -    kexec_reserve_area(&boot_e820);
>> +    kexec_reserve_area();
>> 
>>      setup_max_pdx(raw_max_page);
>>      if ( highmem_start )
> 
> Seeing all the knock-on effects for the add_range() change, I think 
> this
> separate adjustment would better have been an independent patch.
> 
> Jan

I can submit it standalone and put together x86/vmsi and delay

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

