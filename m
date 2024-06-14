Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71274908814
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 11:48:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740572.1147667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI3X9-0001Sz-5Z; Fri, 14 Jun 2024 09:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740572.1147667; Fri, 14 Jun 2024 09:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI3X9-0001RT-2k; Fri, 14 Jun 2024 09:47:47 +0000
Received: by outflank-mailman (input) for mailman id 740572;
 Fri, 14 Jun 2024 09:47:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J/js=NQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sI3X7-0001RH-EO
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 09:47:45 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 259d77ed-2a33-11ef-90a3-e314d9c70b13;
 Fri, 14 Jun 2024 11:47:44 +0200 (CEST)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-4403bb543a4so11011651cf.1
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 02:47:44 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-441f3111ff4sm14575411cf.53.2024.06.14.02.47.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 02:47:42 -0700 (PDT)
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
X-Inumbo-ID: 259d77ed-2a33-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718358463; x=1718963263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z1rMhTdFN2tBYyOnOGtD6mGUNPVmMbr8TyhzjgcH7oU=;
        b=QfjwTlhonMQs08k1lnW7wM9ojCNXX6d/OIEKJ7WSZBIXGoL2aW4UDfGXT7V9VKNc/6
         BtJnObwYVBWCwfrGnd0ZVrG3aRfkvblTSapvP6PebJ/dXXqPgpsn5IFalQEBzxtKscXQ
         pi+PFpdkt7tsoCdNs0usUXO/jFSMaeCBRXhDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358463; x=1718963263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1rMhTdFN2tBYyOnOGtD6mGUNPVmMbr8TyhzjgcH7oU=;
        b=sMNNVkr0Jp3XZhMVSuacG3wfgJRjeYh1tXNJwj1HqItX3Fsy5uNTQqyOWe6894yDyc
         8YtTSk4gu37tzq9+0QanTdQbdvQAi6OFnU+L0AmjXF5rLpp6BMpjMHNQCsCO4g1rk0Gu
         ZsG/KuPVHXbBxgUjEga64okRNVn0xAmfesQIQGR3UW4VEqDMZid+WsuK6p96bqsLK1jJ
         rbWFzsZ/5bDBCz6p/zknxq3s/O6IhuFahXG4V5qzP7aK0x+AhJ16yA7lcdcOdHMvAjTH
         J5L30sfXalkc1y9RV07lTLONNBHr33lFn6sDqrYDxiPXF0e58eHBM1m+nsY7QjBNp6F+
         QYeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+MrIdaQ+DF4lDSHDK5lw0xwf0uZUZASc5SmnZBAvBES0VX54UlDeFeh7cHjIl1eTTy9vSPlYscsJjRNO5F5pDTYZ2LGGq4SUY3up0WkQ=
X-Gm-Message-State: AOJu0YykFbv/mUy7Amk9M0ifJaf2frmsiQ5AvRAqYZmKTEUfWNfVoRHY
	7k+Otj9mqfY8Hr2Ebhs7mKKGPgSZUZY5nBGt+MX4CMECsE+6N2M6KqytHj1jj7o=
X-Google-Smtp-Source: AGHT+IFWmWrZg58+zkZC0cJPU/UHnJw2XD90HQPdydJnh3ua2xkLmI8onQx5FiAR5JAwkNMwDkKOnA==
X-Received: by 2002:ac8:5786:0:b0:440:4eb7:293f with SMTP id d75a77b69052e-442168a80d0mr27054771cf.12.1718358462786;
        Fri, 14 Jun 2024 02:47:42 -0700 (PDT)
Message-ID: <fa62c314-424e-4e5b-9046-3a2e1eba654e@citrix.com>
Date: Fri, 14 Jun 2024 10:47:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 5/8] xen/riscv: add minimal stuff to mm.h to build
 full Xen
To: "Oleksii K." <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
 <d00b86f41ef2c7d928a28dadd8c34fb845f23d0a.1717008161.git.oleksii.kurochko@gmail.com>
 <70128dba-498f-4d85-8507-bb1621182754@citrix.com>
 <7721c1b4eb0ea76cca5460264954d40d639499b7.camel@gmail.com>
 <e80e30c9-6558-4b70-ab2f-18c34c359dae@citrix.com>
 <1b3b389156ad924f00af8af1d173b89fc533050e.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1b3b389156ad924f00af8af1d173b89fc533050e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/06/2024 7:23 pm, Oleksii K. wrote:
> On Tue, 2024-06-11 at 16:53 +0100, Andrew Cooper wrote:
>> On 30/05/2024 7:22 pm, Oleksii K. wrote:
>>> On Thu, 2024-05-30 at 18:23 +0100, Andrew Cooper wrote:
>>>> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>> This patch looks like it can go in independently?  Or does it
>>>> depend
>>>> on
>>>> having bitops.h working in practice?
>>>>
>>>> However, one very strong suggestion...
>>>>
>>>>
>>>>> diff --git a/xen/arch/riscv/include/asm/mm.h
>>>>> b/xen/arch/riscv/include/asm/mm.h
>>>>> index 07c7a0abba..cc4a07a71c 100644
>>>>> --- a/xen/arch/riscv/include/asm/mm.h
>>>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>>>> @@ -3,11 +3,246 @@
>>>>> <snip>
>>>>> +/* PDX of the first page in the frame table. */
>>>>> +extern unsigned long frametable_base_pdx;
>>>>> +
>>>>> +/* Convert between machine frame numbers and page-info
>>>>> structures.
>>>>> */
>>>>> +#define
>>>>> mfn_to_page(mfn)                                            \
>>>>> +    (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
>>>>> +#define
>>>>> page_to_mfn(pg)                                             \
>>>>> +    pdx_to_mfn((unsigned long)((pg) - frame_table) +
>>>>> frametable_base_pdx)
>>>> Do yourself a favour and not introduce frametable_base_pdx to
>>>> begin
>>>> with.
>>>>
>>>> Every RISC-V board I can find has things starting from 0 in
>>>> physical
>>>> address space, with RAM starting immediately after.
>>> I checked Linux kernel and grep there:
>>>    [ok@fedora linux-aia]$ grep -Rni "memory@" arch/riscv/boot/dts/
>>> --
>>>    exclude "*.tmp" -I
>>>    arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-
>>> 2.dtsi:33:    
>>>    memory@40000000 {
>>>    arch/riscv/boot/dts/starfive/jh7100-common.dtsi:28:    
>>> memory@80000000
>>>    {
>>>    arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts:49:     
>>> ddrc_cache:
>>>    memory@1000000000 {
>>>    arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts:33:  
>>> ddrc_cache_lo:
>>>    memory@80000000 {
>>>    arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts:37:  
>>> ddrc_cache_hi:
>>>    memory@1040000000 {
>>>    arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts:34:     
>>> ddrc_cache_lo:
>>>    memory@80000000 {
>>>    arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts:40:     
>>> ddrc_cache_hi:
>>>    memory@1000000000 {
>>>    arch/riscv/boot/dts/microchip/mpfs-polarberry.dts:22:  
>>> ddrc_cache_lo:
>>>    memory@80000000 {
>>>    arch/riscv/boot/dts/microchip/mpfs-polarberry.dts:27:  
>>> ddrc_cache_hi:
>>>    memory@1000000000 {
>>>    arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts:57:  
>>> ddrc_cache_lo:
>>>    memory@80000000 {
>>>    arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts:63:  
>>> ddrc_cache_hi:
>>>    memory@1040000000 {
>>>    arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts:32:  memory@0
>>> {
>>>    arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi:14:     
>>>    memory@0 {
>>>    arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts:26:   
>>> memory@80000000
>>>    {
>>>    arch/riscv/boot/dts/sophgo/cv1812h.dtsi:12:     memory@80000000
>>> {
>>>    arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts:26:
>>> memory@80000000
>>>    {
>>>    arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts:25:
>>> memory@80000000
>>>    {
>>>    arch/riscv/boot/dts/canaan/k210.dtsi:82:        sram:
>>> memory@80000000 {
>>>    
>>> And based on  that majority of supported by Linux kernel boards has
>>> RAM
>>> starting not from 0 in physical address space. Am I confusing
>>> something?
>>>
>>>> Taking the microchip board as an example, RAM actually starts at
>>>> 0x8000000,
>>> Today we had conversation with the guy from SiFive in xen-devel
>>> channel
>>> and he mentioned that they are using "starfive visionfive2 and
>>> sifive
>>> unleashed platforms." which based on the grep above has RAM not at
>>> 0
>>> address.
>>>
>>> Also, QEMU uses 0x8000000.
>>>
>>>>  which means that having frametable_base_pdx and assuming it
>>>> does get set to 0x8000 (which isn't even a certainty, given that
>>>> I
>>>> think
>>>> you'll need struct pages covering the PLICs), then what you are
>>>> trading
>>>> off is:
>>>>
>>>> * Saving 32k of virtual address space only (no need to even
>>>> allocate
>>>> memory for this range of the framtable), by
>>>> * Having an extra memory load and add/sub in every page <-> mfn
>>>> conversion, which is a screaming hotpath all over Xen.
>>>>
>>>> It's a terribly short-sighted tradeoff.
>>>>
>>>> 32k of VA space might be worth saving in a 32bit build (I
>>>> personally
>>>> wouldn't - especially as there's no need to share Xen's VA space
>>>> with
>>>> guests, given no PV guests on ARM/RISC-V), but it's absolutely
>>>> not at
>>>> all in an a 64bit build with TB of VA space available.
>>>>
>>>> Even if we do find a board with the first interesting thing in
>>>> the
>>>> frametable starting sufficiently away from 0 that it might be
>>>> worth
>>>> considering this slide, then it should still be Kconfig-able in a
>>>> similar way to PDX_COMPRESSION.
>>> I found your tradeoffs reasonable, but I don't understand how it
>>> will
>>> work if RAM does not start from 0, as the frametable address and
>>> RAM
>>> address are linked.
>>> I tried to look at the PDX_COMPRESSION config and couldn't find any
>>> "slide" there. Could you please clarify this for me?
>>> If to use this "slide" would it help to avoid the mentioned above
>>> tradeoffs?
>>>
>>> One more question: if we decide to go without frametable_base_pdx,
>>> would it be sufficient to simply remove mentions of it from the
>>> code (
>>> at least, for now )?
>> There is a relationship between system/host physical addresses (what
>> Xen
>> called maddr/mfn), and the frametable.  The frametable has one entry
>> per
>> mfn.
>>
>> In the most simple case, there's a 1:1 relationship.  i.e.
>> frametable[0]
>> = maddr(0), frametable[1] = maddr(4k) etc.  This is very simple, and
>> very easy to calculate (page_to_mfn()/mfn_to_page()).
>>
>> The frametable is one big array.  It starts at a compile-time fixed
>> address, and needs to be long enough to cover everything interesting
>> in
>> memory.  Therefore it potentially takes a large amount of virtual
>> address space.
>>
>> However, only interesting maddrs need to have data in the frametable,
>> so
>> it's fine for the backing RAM to be sparsely allocated/mapped in the
>> frametable virtual addresses.
>>
>> For 64bit, that's really all you need, because there's always far
>> more
>> virtual address space than physical RAM in the system, even when
>> you're
>> looking at TB-scale giant servers.
>>
>>
>> For 32bit, virtual address space is a limited resource.  (Also to an
>> extent, 64bit x86 with PV guests because we give 98% of the virtual
>> address space to the guest kernel to use.)
>>
>> There are two tricks to reduce the virtual address space used, but
>> they
>> both cost performance in fastpaths.
>>
>> 1) PDX Compression.
>>
>> PDX compression makes a non-linear mfn <-> maddr mapping.  This is
>> for a
>> usecase where you've got multiple RAM banks which are separated by a
>> large distance (and evenly spaced), then you can "compress" a single
>> range of 0's out of the middle of the system/host physical address.
>>
>> The cost is that all page <-> mfn conversions need to read two masks
>> and
>> a shift-count from variables in memory, to split/shift/recombine the
>> address bits.
>>
>> 2) A slide, which is frametable_base_pdx in this context.
>>
>> When there's a big gap between 0 and the start of something
>> interesting,
>> you could chop out that range by just subtracting base_pdx.  What
>> qualifies as "big" is subjective, but Qemu starting at 128M certainly
>> does not qualify as big enough to warrant frametable_base_pdx.
>>
>> This is less expensive that PDX compression.  It only adds one memory
>> read to the fastpath, but it also doesn't save as much virtual
>> address
>> space as PDX compression.
>>
>>
>> When virtual address space is a major constraint (32 bit builds),
>> both
>> of these techniques are worth doing.  But when there's no constraint
>> on
>> virtual address space (64 bit builds), there's no reason to use
>> either;
>> and the performance will definitely improve as a result.
> Thanks for such good explanation.
>
> For RISC-V we have PDX config disabled as I haven't seen multiple RAM
> banks at boards which has hypervisor extension. Thereby mfn_to_pdx()
> and pdx_to_mfn() do nothing. The same for frametable_base_pdx, in case
> of PDX disabled, it just an offset ( or a slide ).
>
> IIUUC, you meant that it make sense to map frametable not to the
> address of where RAM is started, but to 0, so then we don't need this
> +-frametable_base_pdx. The price for that is loosing of VA space for
> the range from 0 to RAM start address.
>
> Right now, we are trying to support 3 boards with the following RAM
> address:
> 1. 0x8000_0000 - QEMU and SiFive board
> 2. 0x40_0000_0000 - Microchip board
>
> So if we mapping frametable to 0 ( not RAM start ) we will loose:
> 1. 0x8000_0 ( amount of page entries to cover range [0, 0x8000_0000] )
> * 64 ( size of struct page_info ) = 32 MB
> 2. 0x40_0000_0 ( amount of page entries to cover range [0,
> 0x40_0000_0000] ) * 64 ( size of struct page_info ) = 4 Gb
>
> In terms of available virtual address space for RV-64 we can consider
> both options as acceptable.

For Qemu and SiFive, 32M is definitely not worth worrying about.

I personally wouldn't worry about Microchip either.  That's 4G of 1T VA
space (assuming Sv39).

> [OPTION 1] If we accepting of loosing 4 Gb of VA then we could
> implement mfn_to_page() and page_to_mfn() in the following way:
> ```
>    diff --git a/xen/arch/riscv/include/asm/mm.h
>    b/xen/arch/riscv/include/asm/mm.h
>    index cc4a07a71c..fdac7e0646 100644
>    --- a/xen/arch/riscv/include/asm/mm.h
>    +++ b/xen/arch/riscv/include/asm/mm.h
>    @@ -107,14 +107,11 @@ struct page_info
>    
>     #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
>    
>    -/* PDX of the first page in the frame table. */
>    -extern unsigned long frametable_base_pdx;
>    -
>     /* Convert between machine frame numbers and page-info structures.
> */
>     #define mfn_to_page(mfn)                                          
> \
>    -    (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
>    +    (frame_table + mfn))
>     #define page_to_mfn(pg)                                           
> \
>    -    pdx_to_mfn((unsigned long)((pg) - frame_table) +
>    frametable_base_pdx)
>    +    ((unsigned long)((pg) - frame_table))
>    
>     static inline void *page_to_virt(const struct page_info *pg)
>     {
>    diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
>    index 9c0fd80588..8f6dbdc699 100644
>    --- a/xen/arch/riscv/mm.c
>    +++ b/xen/arch/riscv/mm.c
>    @@ -15,7 +15,7 @@
>     #include <asm/page.h>
>     #include <asm/processor.h>
>    
>    -unsigned long __ro_after_init frametable_base_pdx;
>     unsigned long __ro_after_init frametable_virt_end;
>    
>     struct mmu_desc {
> ```

I firmly recommend option 1, especially at this point.

If specific boards really have a problem with losing 4G of VA space,
then option 2 can be added easily at a later point.

That said, I'd think carefully about doing option 2.  Even subtracting a
constant - which is far better than subtracting a variable - is still
extra overhead in fastpaths.  Option 2 needs careful consideration on a
board-by-board case.

~Andrew

