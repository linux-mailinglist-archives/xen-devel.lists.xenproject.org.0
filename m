Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCD436D4E8
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 11:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119141.225514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbghL-0002jQ-Lb; Wed, 28 Apr 2021 09:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119141.225514; Wed, 28 Apr 2021 09:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbghL-0002j1-I4; Wed, 28 Apr 2021 09:41:35 +0000
Received: by outflank-mailman (input) for mailman id 119141;
 Wed, 28 Apr 2021 09:41:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbghK-0002iw-3Z
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 09:41:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d246316-0e2a-47bc-ac4b-16561774e741;
 Wed, 28 Apr 2021 09:41:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6171AF9A;
 Wed, 28 Apr 2021 09:41:31 +0000 (UTC)
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
X-Inumbo-ID: 2d246316-0e2a-47bc-ac4b-16561774e741
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619602891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60GGbupj7K9ZuisOkyzm2T9O0yuwmOZmdJkkt4K4c/c=;
	b=OTE3vumO/a3Ebi9+rCrZMIQbH4QbxwS+LclO0LYX/xmo22aZMdr3zc+bewjL6WfnQdnFqp
	ex/QPKiaN+odiVIwgj4GMarEGT4ZZW6g8HtBMwbIShU9CDZJ7uyp7ParorUvtECimXm4MN
	ZrDEVQIJKJBNJd9VhtlMrLcwNX+sQ8E=
Subject: Re: [PATCH 2/7] x86: introduce ioremap_wc()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6d6da76c-ccc8-afa2-bd06-5ae132c354f2@suse.com>
 <0e1d3e9e-ed29-d7e8-e4fc-e48a0454faa4@suse.com>
 <8cb67c2c-d5f9-a72b-d0d3-9289f6c9b512@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5a2c3037-67b3-7e6e-9080-1a7a97a14ffb@suse.com>
Date: Wed, 28 Apr 2021 11:41:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <8cb67c2c-d5f9-a72b-d0d3-9289f6c9b512@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.04.2021 19:13, Andrew Cooper wrote:
> On 27/04/2021 13:54, Jan Beulich wrote:
>> In order for a to-be-introduced ERMS form of memcpy() to not regress
>> boot performance on certain systems when video output is active, we
>> first need to arrange for avoiding further dependency on firmware
>> setting up MTRRs in a way we can actually further modify. On many
>> systems, due to the continuously growing amounts of installed memory,
>> MTRRs get configured with at least one huge WB range, and with MMIO
>> ranges below 4Gb then forced to UC via overlapping MTRRs. mtrr_add(), as
>> it is today, can't deal with such a setup. Hence on such systems we
>> presently leave the frame buffer mapped UC, leading to significantly
>> reduced performance when using REP STOSB / REP MOVSB.
>>
>> On post-PentiumII hardware (i.e. any that's capable of running 64-bit
>> code), an effective memory type of WC can be achieved without MTRRs, by
>> simply referencing the respective PAT entry from the PTEs. While this
>> will leave the switch to ERMS forms of memset() and memcpy() with
>> largely unchanged performance, the change here on its own improves
>> performance on affected systems quite significantly: Measuring just the
>> individual affected memcpy() invocations yielded a speedup by a factor
>> of over 250 on my initial (Skylake) test system. memset() isn't getting
>> improved by as much there, but still by a factor of about 20.
>>
>> While adding {__,}PAGE_HYPERVISOR_WC, also add {__,}PAGE_HYPERVISOR_WT
>> to, at the very least, make clear what PTE flags this memory type uses.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
> 
> Seeing as MTRRs are full of firmware issues, shouldn't we also
> cross-check that the vram is marked WC, or we'll still fall into bad
> perf from combining down to UC.  (Obviously follow-up work if so.)

VRAM generally isn't marked WC nowadays, at least from my observations.
And it doesn't need to be - there's no "combining down to UC" when the
WC PAT entry is chosen by the PTE. Plus firmware doing so may actually
be counter-productive, as the VRAM address range may easily move when
BARs get re-assigned by an OS.

>> TBD: Both callers are __init, so in principle ioremap_wc() could be so,
>>      too, at least for the time being.
> 
> I don't see us making use this at runtime.  Uses of WC are few and far
> between.

Okay, will mark the function __init then.

>> TBD: If the VGA range is WC in the fixed range MTRRs, reusing the low
>>      1st Mb mapping (like ioremap() does) would be an option.
> 
> It might be fine to do that unconditionally.  The low VRAM has had known
> settings for 2 decades now.
> 
> That said, the low 1MB does use UC- mappings, which means we're entirely
> dependent on MTRRs specifying WC for sensible performance.

The two parts of your reply look to contradict one another: I've been
suggesting to use the low-Mb mapping precisely only when the fixed
range MTRRs covering the range are all saying WC.

>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -5883,6 +5883,20 @@ void __iomem *ioremap(paddr_t pa, size_t
>>      return (void __force __iomem *)va;
>>  }
>>  
>> +void __iomem *ioremap_wc(paddr_t pa, size_t len)
>> +{
>> +    mfn_t mfn = _mfn(PFN_DOWN(pa));
>> +    unsigned int offs = pa & (PAGE_SIZE - 1);
>> +    unsigned int nr = PFN_UP(offs + len);
>> +    void *va;
>> +
>> +    WARN_ON(page_is_ram_type(mfn_x(mfn), RAM_TYPE_CONVENTIONAL));
>> +
>> +    va = __vmap(&mfn, nr, 1, 1, PAGE_HYPERVISOR_WC, VMAP_DEFAULT);
> 
> This doesn't look correct.  granularity and nr are passed the wrong way
> around, but maybe that's related to the fact that only a single mfn is
> passed.  I'm confused.

It's identical to ioremap(). And yes, it's this way because of there
just being a single MFN getting passed in here. If I flipped the 2nd
and 3rd arguments, nr calls to map_pages_to_xen() would result
instead of just one.

> Also, several truncations will occur for a framebuffer > 4G, both with
> calculations here, and the types of __vmap()'s parameters.

Truncations may occur, indeed, but for frame buffers >= 16Tb. I
didn't think I needed to worry about this more here than ioremap()
does.

>> @@ -179,8 +179,7 @@ void __init vesa_mtrr_init(void)
>>  
>>  static void lfb_flush(void)
>>  {
>> -    if ( vesa_mtrr == 3 )
>> -        __asm__ __volatile__ ("sfence" : : : "memory");
>> +    __asm__ __volatile__ ("sfence" : : : "memory");
> 
> wmb(), seeing as that is the operation we mean here?

Not sure, to be honest. It's not been all this long ago that
smp_wmb() and wmb() were the same. And it's also not a write
barrier we mean here, but specifically SFENCE (which merely
happens to be the insn of choice for implementing wmb()). We
don't care about having a full-fledged write barrier here -
other writes getting reordered would in principle be fine.

>> --- a/xen/drivers/video/vga.c
>> +++ b/xen/drivers/video/vga.c
>> @@ -79,7 +79,7 @@ void __init video_init(void)
>>      {
>>      case XEN_VGATYPE_TEXT_MODE_3:
>>          if ( page_is_ram_type(paddr_to_pfn(0xB8000), RAM_TYPE_CONVENTIONAL) ||
>> -             ((video = ioremap(0xB8000, 0x8000)) == NULL) )
>> +             ((video = ioremap_wc(0xB8000, 0x8000)) == NULL) )
>>              return;
>>          outw(0x200a, 0x3d4); /* disable cursor */
>>          columns = vga_console_info.u.text_mode_3.columns;
>> @@ -164,7 +164,11 @@ void __init video_endboot(void)
>>      {
>>      case XEN_VGATYPE_TEXT_MODE_3:
>>          if ( !vgacon_keep )
>> +        {
>>              memset(video, 0, columns * lines * 2);
>> +            iounmap(video);
>> +            video = ZERO_BLOCK_PTR;
>> +        }
>>          break;
> 
> Shouldn't this hunk be in patch 5?

Only if ioremap_wc() unconditionally re-used the low-Mb mapping;
I don't want to introduce another leak, paralleling the one which
patch 5 addresses. And as per above I see ioremap_wc() use __va()
at best conditionally.

>> --- a/xen/include/asm-x86/mm.h
>> +++ b/xen/include/asm-x86/mm.h
>> @@ -615,6 +615,8 @@ void destroy_perdomain_mapping(struct do
>>                                 unsigned int nr);
>>  void free_perdomain_mappings(struct domain *);
>>  
>> +void __iomem *ioremap_wc(paddr_t, size_t);
> 
> I'm not sure we want to add a second prototype.  ARM has ioremap_wc()
> too, and we absolutely don't want them to get out of sync, and we have
> two new architectures on the horizon.
> 
> Perhaps a new xen/ioremap.h which includes asm/ioremap.h  (although
> thinking forward to encrypted RAM, we might want something which can
> also encompass the memremap*() variants.)
> 
> ARM can #define ioremap_wc ioremap_wc and provide their inline wrapper. 
> x86 can fall back to the common prototype.  Other architectures can do
> whatever is best for them.

I'm afraid I don't see how what you suggest would not lead to
duplicate prototypes. Arm wanting the function be an inline
one precludes exposing the extern declaration there. Hence
there will still be a risk of things going out of sync. In
fact I first had the declaration next to ioremap()'s, until I
ran into the build issue on Arm.

Jan

