Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4411D904089
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 17:53:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738551.1145345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3oP-0004yM-O9; Tue, 11 Jun 2024 15:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738551.1145345; Tue, 11 Jun 2024 15:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3oP-0004va-Kc; Tue, 11 Jun 2024 15:53:29 +0000
Received: by outflank-mailman (input) for mailman id 738551;
 Tue, 11 Jun 2024 15:53:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eM8s=NN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sH3oN-0004vT-RO
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 15:53:27 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc995427-280a-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 17:53:25 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57c83100cb4so2797702a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 08:53:25 -0700 (PDT)
Received: from [10.125.226.166] ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f0f98a285sm421760966b.210.2024.06.11.08.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 08:53:24 -0700 (PDT)
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
X-Inumbo-ID: bc995427-280a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718121204; x=1718726004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MULxB8npoLyZiEUAp0PTIrbFWoZ8N2zCmpko8qDNTmU=;
        b=IQKPrXcyIT5CK1fA4P9qTaZ6JRNgIMy0WF/NzJnl0bTxvvm1fdOHlpWL268hYp/HeN
         VGDjiU5mxZKE8M8rYD8aOG4k2KRESaSAIy9CgCFotT9yFPX3f1wgzmvkbVClkEFoG7ow
         kodJ/7SxIWB3BhHBDzF4ZR8fM3ytGJZtPiNWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718121204; x=1718726004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MULxB8npoLyZiEUAp0PTIrbFWoZ8N2zCmpko8qDNTmU=;
        b=KgpZ4YRt5rcpoIRgVxEWetQc8A1EmzYIpi3/HHIAzTtK5uAgmyUIkAxLwldwAkPDBU
         sNSyr/8uantWtUqfea0cogKtfOLWfNwMd4Av4gf/c/pRwX6hucD42hCleDDpPPF1rlED
         4po8MNFHyU6GorJpzn5yVCdM72Mj7fnPBsA3vbzbINQdiOKBIipMDFq5kEjIcWncVCXn
         RYVTQ4T1rX1hq8wVp7pn7GSqsSguOhQ15G29oFdUPUSUBUZ+5YHnXcOI6KMyCuOF2Dwy
         fKIjkGA4ZH4v0UViTpTauypdWuvR5+p33fA7NGq2aXXe8/QJXvr6BP/sgfXb8lREsKhI
         laTA==
X-Forwarded-Encrypted: i=1; AJvYcCU44HwxhM5a2L2U4n0MDVyfpngWd/Qd3YBHXZdupFnEiNUW/tUPPkeMlZD19DlR8MBvYTOQu4doiFoehoYGfAiVtmaNTqlay0IJ30YTW/4=
X-Gm-Message-State: AOJu0Yx2zS7AIV2gxIooiDPKnukhELaEaH/R5QG2wxKCbKQ4156F4UXa
	XOIAt5g6YAdVDQbI49pJDW3/mjH6ajHzpDsSf1FnTeyTYVkJNp+bBmH9luOITh5PoR3t1RZ8j30
	sZaA=
X-Google-Smtp-Source: AGHT+IFFDzd1myyds4FSAI+TZUpNGRE6QElKc3qGe2lkweFI9SkFt6N3zQIaaZum6yZL7V7r9X6Hzw==
X-Received: by 2002:a17:907:86a2:b0:a6f:ea5:a168 with SMTP id a640c23a62f3a-a6f0ea5a6a3mr652247066b.57.1718121204545;
        Tue, 11 Jun 2024 08:53:24 -0700 (PDT)
Message-ID: <e80e30c9-6558-4b70-ab2f-18c34c359dae@citrix.com>
Date: Tue, 11 Jun 2024 16:53:23 +0100
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
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <7721c1b4eb0ea76cca5460264954d40d639499b7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/05/2024 7:22 pm, Oleksii K. wrote:
> On Thu, 2024-05-30 at 18:23 +0100, Andrew Cooper wrote:
>> On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> This patch looks like it can go in independently?  Or does it depend
>> on
>> having bitops.h working in practice?
>>
>> However, one very strong suggestion...
>>
>>
>>> diff --git a/xen/arch/riscv/include/asm/mm.h
>>> b/xen/arch/riscv/include/asm/mm.h
>>> index 07c7a0abba..cc4a07a71c 100644
>>> --- a/xen/arch/riscv/include/asm/mm.h
>>> +++ b/xen/arch/riscv/include/asm/mm.h
>>> @@ -3,11 +3,246 @@
>>> <snip>
>>> +/* PDX of the first page in the frame table. */
>>> +extern unsigned long frametable_base_pdx;
>>> +
>>> +/* Convert between machine frame numbers and page-info structures.
>>> */
>>> +#define
>>> mfn_to_page(mfn)                                            \
>>> +    (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
>>> +#define
>>> page_to_mfn(pg)                                             \
>>> +    pdx_to_mfn((unsigned long)((pg) - frame_table) +
>>> frametable_base_pdx)
>> Do yourself a favour and not introduce frametable_base_pdx to begin
>> with.
>>
>> Every RISC-V board I can find has things starting from 0 in physical
>> address space, with RAM starting immediately after.
> I checked Linux kernel and grep there:
>    [ok@fedora linux-aia]$ grep -Rni "memory@" arch/riscv/boot/dts/ --
>    exclude "*.tmp" -I
>    arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi:33:    
>    memory@40000000 {
>    arch/riscv/boot/dts/starfive/jh7100-common.dtsi:28:     memory@80000000
>    {
>    arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts:49:      ddrc_cache:
>    memory@1000000000 {
>    arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts:33:   ddrc_cache_lo:
>    memory@80000000 {
>    arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts:37:   ddrc_cache_hi:
>    memory@1040000000 {
>    arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts:34:      ddrc_cache_lo:
>    memory@80000000 {
>    arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts:40:      ddrc_cache_hi:
>    memory@1000000000 {
>    arch/riscv/boot/dts/microchip/mpfs-polarberry.dts:22:   ddrc_cache_lo:
>    memory@80000000 {
>    arch/riscv/boot/dts/microchip/mpfs-polarberry.dts:27:   ddrc_cache_hi:
>    memory@1000000000 {
>    arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts:57:   ddrc_cache_lo:
>    memory@80000000 {
>    arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts:63:   ddrc_cache_hi:
>    memory@1040000000 {
>    arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts:32:  memory@0 {
>    arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi:14:     
>    memory@0 {
>    arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts:26:    memory@80000000
>    {
>    arch/riscv/boot/dts/sophgo/cv1812h.dtsi:12:     memory@80000000 {
>    arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts:26: memory@80000000
>    {
>    arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts:25: memory@80000000
>    {
>    arch/riscv/boot/dts/canaan/k210.dtsi:82:        sram: memory@80000000 {
>    
> And based on  that majority of supported by Linux kernel boards has RAM
> starting not from 0 in physical address space. Am I confusing
> something?
>
>> Taking the microchip board as an example, RAM actually starts at
>> 0x8000000,
> Today we had conversation with the guy from SiFive in xen-devel channel
> and he mentioned that they are using "starfive visionfive2 and sifive
> unleashed platforms." which based on the grep above has RAM not at 0
> address.
>
> Also, QEMU uses 0x8000000.
>
>>  which means that having frametable_base_pdx and assuming it
>> does get set to 0x8000 (which isn't even a certainty, given that I
>> think
>> you'll need struct pages covering the PLICs), then what you are
>> trading
>> off is:
>>
>> * Saving 32k of virtual address space only (no need to even allocate
>> memory for this range of the framtable), by
>> * Having an extra memory load and add/sub in every page <-> mfn
>> conversion, which is a screaming hotpath all over Xen.
>>
>> It's a terribly short-sighted tradeoff.
>>
>> 32k of VA space might be worth saving in a 32bit build (I personally
>> wouldn't - especially as there's no need to share Xen's VA space with
>> guests, given no PV guests on ARM/RISC-V), but it's absolutely not at
>> all in an a 64bit build with TB of VA space available.
>>
>> Even if we do find a board with the first interesting thing in the
>> frametable starting sufficiently away from 0 that it might be worth
>> considering this slide, then it should still be Kconfig-able in a
>> similar way to PDX_COMPRESSION.
> I found your tradeoffs reasonable, but I don't understand how it will
> work if RAM does not start from 0, as the frametable address and RAM
> address are linked.
> I tried to look at the PDX_COMPRESSION config and couldn't find any
> "slide" there. Could you please clarify this for me?
> If to use this "slide" would it help to avoid the mentioned above
> tradeoffs?
>
> One more question: if we decide to go without frametable_base_pdx,
> would it be sufficient to simply remove mentions of it from the code (
> at least, for now )?

There is a relationship between system/host physical addresses (what Xen
called maddr/mfn), and the frametable.  The frametable has one entry per
mfn.

In the most simple case, there's a 1:1 relationship.  i.e. frametable[0]
= maddr(0), frametable[1] = maddr(4k) etc.  This is very simple, and
very easy to calculate (page_to_mfn()/mfn_to_page()).

The frametable is one big array.  It starts at a compile-time fixed
address, and needs to be long enough to cover everything interesting in
memory.  Therefore it potentially takes a large amount of virtual
address space.

However, only interesting maddrs need to have data in the frametable, so
it's fine for the backing RAM to be sparsely allocated/mapped in the
frametable virtual addresses.

For 64bit, that's really all you need, because there's always far more
virtual address space than physical RAM in the system, even when you're
looking at TB-scale giant servers.


For 32bit, virtual address space is a limited resource.  (Also to an
extent, 64bit x86 with PV guests because we give 98% of the virtual
address space to the guest kernel to use.)

There are two tricks to reduce the virtual address space used, but they
both cost performance in fastpaths.

1) PDX Compression.

PDX compression makes a non-linear mfn <-> maddr mapping.  This is for a
usecase where you've got multiple RAM banks which are separated by a
large distance (and evenly spaced), then you can "compress" a single
range of 0's out of the middle of the system/host physical address.

The cost is that all page <-> mfn conversions need to read two masks and
a shift-count from variables in memory, to split/shift/recombine the
address bits.

2) A slide, which is frametable_base_pdx in this context.

When there's a big gap between 0 and the start of something interesting,
you could chop out that range by just subtracting base_pdx.  What
qualifies as "big" is subjective, but Qemu starting at 128M certainly
does not qualify as big enough to warrant frametable_base_pdx.

This is less expensive that PDX compression.  It only adds one memory
read to the fastpath, but it also doesn't save as much virtual address
space as PDX compression.


When virtual address space is a major constraint (32 bit builds), both
of these techniques are worth doing.  But when there's no constraint on
virtual address space (64 bit builds), there's no reason to use either;
and the performance will definitely improve as a result.

~Andrew

