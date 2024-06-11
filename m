Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F77590436F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 20:25:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738658.1145468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH69t-0008UX-Mj; Tue, 11 Jun 2024 18:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738658.1145468; Tue, 11 Jun 2024 18:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH69t-0008SS-K1; Tue, 11 Jun 2024 18:23:49 +0000
Received: by outflank-mailman (input) for mailman id 738658;
 Tue, 11 Jun 2024 18:23:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=887E=NN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sH69r-0008S3-Ov
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 18:23:47 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd0d7c7c-281f-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 20:23:45 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a6f1dc06298so179386366b.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 11:23:45 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efb3b3147sm521747766b.185.2024.06.11.11.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:23:44 -0700 (PDT)
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
X-Inumbo-ID: bd0d7c7c-281f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718130225; x=1718735025; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dCdJ3PVijp2foRVxCQFSIFJVXNHooBISSPQnZibTpT8=;
        b=iHlGEdFWAdIQyZMhiUZSfanoLZEOPY09Llm7OFjSPpQwVgdt+0qJixcnBTXUGPG4O7
         mOUyGtVcrajeGUxbOzghj0OiDmBVEboxRJwLIDVDuLdd9mZO50qkt6/U/bHMeS6RIAoO
         EzePMOH6nNW1XnfVPPVLGJOrl5hAqlkszVqDm+5ZZ97xjHmQzcdjF6QWv5EY8lQSTPJH
         QrpZU8mulyrXugWIhYm7KG28xuzaNwKsHdJEjcnXmLTZrWmKoUtixbGwN4W8yQg/kXA+
         9Ay10cJCz/L2z8GV4pshCFena4QgNzk9c43shWU6KhP5ZiLKsG1aj/CsyCwPA17vuKik
         OFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718130225; x=1718735025;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCdJ3PVijp2foRVxCQFSIFJVXNHooBISSPQnZibTpT8=;
        b=JkSghoNDVfbEkjYAPC7k+EPwq172Nupoc3kT/mssGSHIr/j0nnLVpYxS6EBTZVa0XF
         A6W47xaewPseXctWSzHaLdVfCYQ7gCUV0swS5bv6bmMoDN5ZO5S9iL4Eq9dnl9wy5DsC
         SYKf+nEG2xE39kT67whYjIDWC8ft8T4rI+LoI8sDXO9FqDb1pPCaMgPrHPnU5R0ZwWXf
         7NhYtirPsFnHCBYjLsntWXqe2Kxp7qk1w7GTEUHR/K8PSJ63xG3rGiXWA56vlknvUSLd
         oix5tm09v7TE6jnD7T0U+c4YEiYq7itpQxv9kTjuOVS3iFfGxbRl2UGDu7lcdoDGEtRO
         32aQ==
X-Forwarded-Encrypted: i=1; AJvYcCU87K14HZ9uL9xBvAZKM6lLw7i/oCm3x4QWXZtJHkRdsztCD0I18kLl4OswdhziGqhbMU9xqVjaJxT2K1Mpy7sfZR95iAYtI7w2PMvRGHg=
X-Gm-Message-State: AOJu0Yxx1d09zfvVHAw5Gx5DnjXY5wsd8yyLNXZoWh/4psV5R/bC4L3X
	IACHMDWLkjU++IeMNjkmotthIQLOM0EgLAmVhWB+lOe37ADCmj5i
X-Google-Smtp-Source: AGHT+IHYaxNfVBdHubENCTuPUfR879XJj3T+ZmcavHa4Q1LejCpAg5cTavVjiaryVvZMyA0VUUg62w==
X-Received: by 2002:a17:906:28d3:b0:a6f:fbe:d3e8 with SMTP id a640c23a62f3a-a6f0fbed85emr541472466b.54.1718130224495;
        Tue, 11 Jun 2024 11:23:44 -0700 (PDT)
Message-ID: <1b3b389156ad924f00af8af1d173b89fc533050e.camel@gmail.com>
Subject: Re: [PATCH v12 5/8] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Date: Tue, 11 Jun 2024 20:23:43 +0200
In-Reply-To: <e80e30c9-6558-4b70-ab2f-18c34c359dae@citrix.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
	 <d00b86f41ef2c7d928a28dadd8c34fb845f23d0a.1717008161.git.oleksii.kurochko@gmail.com>
	 <70128dba-498f-4d85-8507-bb1621182754@citrix.com>
	 <7721c1b4eb0ea76cca5460264954d40d639499b7.camel@gmail.com>
	 <e80e30c9-6558-4b70-ab2f-18c34c359dae@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-06-11 at 16:53 +0100, Andrew Cooper wrote:
> On 30/05/2024 7:22 pm, Oleksii K. wrote:
> > On Thu, 2024-05-30 at 18:23 +0100, Andrew Cooper wrote:
> > > On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > Acked-by: Jan Beulich <jbeulich@suse.com>
> > > This patch looks like it can go in independently?=C2=A0 Or does it
> > > depend
> > > on
> > > having bitops.h working in practice?
> > >=20
> > > However, one very strong suggestion...
> > >=20
> > >=20
> > > > diff --git a/xen/arch/riscv/include/asm/mm.h
> > > > b/xen/arch/riscv/include/asm/mm.h
> > > > index 07c7a0abba..cc4a07a71c 100644
> > > > --- a/xen/arch/riscv/include/asm/mm.h
> > > > +++ b/xen/arch/riscv/include/asm/mm.h
> > > > @@ -3,11 +3,246 @@
> > > > <snip>
> > > > +/* PDX of the first page in the frame table. */
> > > > +extern unsigned long frametable_base_pdx;
> > > > +
> > > > +/* Convert between machine frame numbers and page-info
> > > > structures.
> > > > */
> > > > +#define
> > > > mfn_to_page(mfn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 (frame_table + (mfn_to_pdx(mfn) - frametable_ba=
se_pdx))
> > > > +#define
> > > > page_to_mfn(pg)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 pdx_to_mfn((unsigned long)((pg) - frame_table) =
+
> > > > frametable_base_pdx)
> > > Do yourself a favour and not introduce frametable_base_pdx to
> > > begin
> > > with.
> > >=20
> > > Every RISC-V board I can find has things starting from 0 in
> > > physical
> > > address space, with RAM starting immediately after.
> > I checked Linux kernel and grep there:
> > =C2=A0=C2=A0 [ok@fedora linux-aia]$ grep -Rni "memory@" arch/riscv/boot=
/dts/
> > --
> > =C2=A0=C2=A0 exclude "*.tmp" -I
> > =C2=A0=C2=A0 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-
> > 2.dtsi:33:=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0 memory@40000000 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/starfive/jh7100-common.dtsi:28:=C2=A0=
=C2=A0=C2=A0=C2=A0
> > memory@80000000
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts:49:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> > ddrc_cache:
> > =C2=A0=C2=A0 memory@1000000000 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts:33:=C2=
=A0=C2=A0
> > ddrc_cache_lo:
> > =C2=A0=C2=A0 memory@80000000 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts:37:=C2=
=A0=C2=A0
> > ddrc_cache_hi:
> > =C2=A0=C2=A0 memory@1040000000 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts:34:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> > ddrc_cache_lo:
> > =C2=A0=C2=A0 memory@80000000 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts:40:=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0
> > ddrc_cache_hi:
> > =C2=A0=C2=A0 memory@1000000000 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts:22:=C2=
=A0=C2=A0
> > ddrc_cache_lo:
> > =C2=A0=C2=A0 memory@80000000 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts:27:=C2=
=A0=C2=A0
> > ddrc_cache_hi:
> > =C2=A0=C2=A0 memory@1000000000 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts:57:=C2=
=A0=C2=A0
> > ddrc_cache_lo:
> > =C2=A0=C2=A0 memory@80000000 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts:63:=C2=
=A0=C2=A0
> > ddrc_cache_hi:
> > =C2=A0=C2=A0 memory@1040000000 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts:32:=C2=
=A0 memory@0
> > {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi:14:=
=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0 memory@0 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts:26:=C2=A0=
=C2=A0=C2=A0
> > memory@80000000
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/sophgo/cv1812h.dtsi:12:=C2=A0=C2=A0=C2=
=A0=C2=A0 memory@80000000
> > {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts:26:
> > memory@80000000
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts:25:
> > memory@80000000
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0 arch/riscv/boot/dts/canaan/k210.dtsi:82:=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 sram:
> > memory@80000000 {
> > =C2=A0=C2=A0=20
> > And based on=C2=A0 that majority of supported by Linux kernel boards ha=
s
> > RAM
> > starting not from 0 in physical address space. Am I confusing
> > something?
> >=20
> > > Taking the microchip board as an example, RAM actually starts at
> > > 0x8000000,
> > Today we had conversation with the guy from SiFive in xen-devel
> > channel
> > and he mentioned that they are using "starfive visionfive2 and
> > sifive
> > unleashed platforms." which based on the grep above has RAM not at
> > 0
> > address.
> >=20
> > Also, QEMU uses 0x8000000.
> >=20
> > > =C2=A0which means that having frametable_base_pdx and assuming it
> > > does get set to 0x8000 (which isn't even a certainty, given that
> > > I
> > > think
> > > you'll need struct pages covering the PLICs), then what you are
> > > trading
> > > off is:
> > >=20
> > > * Saving 32k of virtual address space only (no need to even
> > > allocate
> > > memory for this range of the framtable), by
> > > * Having an extra memory load and add/sub in every page <-> mfn
> > > conversion, which is a screaming hotpath all over Xen.
> > >=20
> > > It's a terribly short-sighted tradeoff.
> > >=20
> > > 32k of VA space might be worth saving in a 32bit build (I
> > > personally
> > > wouldn't - especially as there's no need to share Xen's VA space
> > > with
> > > guests, given no PV guests on ARM/RISC-V), but it's absolutely
> > > not at
> > > all in an a 64bit build with TB of VA space available.
> > >=20
> > > Even if we do find a board with the first interesting thing in
> > > the
> > > frametable starting sufficiently away from 0 that it might be
> > > worth
> > > considering this slide, then it should still be Kconfig-able in a
> > > similar way to PDX_COMPRESSION.
> > I found your tradeoffs reasonable, but I don't understand how it
> > will
> > work if RAM does not start from 0, as the frametable address and
> > RAM
> > address are linked.
> > I tried to look at the PDX_COMPRESSION config and couldn't find any
> > "slide" there. Could you please clarify this for me?
> > If to use this "slide" would it help to avoid the mentioned above
> > tradeoffs?
> >=20
> > One more question: if we decide to go without frametable_base_pdx,
> > would it be sufficient to simply remove mentions of it from the
> > code (
> > at least, for now )?
>=20
> There is a relationship between system/host physical addresses (what
> Xen
> called maddr/mfn), and the frametable.=C2=A0 The frametable has one entry
> per
> mfn.
>=20
> In the most simple case, there's a 1:1 relationship.=C2=A0 i.e.
> frametable[0]
> =3D maddr(0), frametable[1] =3D maddr(4k) etc.=C2=A0 This is very simple,=
 and
> very easy to calculate (page_to_mfn()/mfn_to_page()).
>=20
> The frametable is one big array.=C2=A0 It starts at a compile-time fixed
> address, and needs to be long enough to cover everything interesting
> in
> memory.=C2=A0 Therefore it potentially takes a large amount of virtual
> address space.
>=20
> However, only interesting maddrs need to have data in the frametable,
> so
> it's fine for the backing RAM to be sparsely allocated/mapped in the
> frametable virtual addresses.
>=20
> For 64bit, that's really all you need, because there's always far
> more
> virtual address space than physical RAM in the system, even when
> you're
> looking at TB-scale giant servers.
>=20
>=20
> For 32bit, virtual address space is a limited resource.=C2=A0 (Also to an
> extent, 64bit x86 with PV guests because we give 98% of the virtual
> address space to the guest kernel to use.)
>=20
> There are two tricks to reduce the virtual address space used, but
> they
> both cost performance in fastpaths.
>=20
> 1) PDX Compression.
>=20
> PDX compression makes a non-linear mfn <-> maddr mapping.=C2=A0 This is
> for a
> usecase where you've got multiple RAM banks which are separated by a
> large distance (and evenly spaced), then you can "compress" a single
> range of 0's out of the middle of the system/host physical address.
>=20
> The cost is that all page <-> mfn conversions need to read two masks
> and
> a shift-count from variables in memory, to split/shift/recombine the
> address bits.
>=20
> 2) A slide, which is frametable_base_pdx in this context.
>=20
> When there's a big gap between 0 and the start of something
> interesting,
> you could chop out that range by just subtracting base_pdx.=C2=A0 What
> qualifies as "big" is subjective, but Qemu starting at 128M certainly
> does not qualify as big enough to warrant frametable_base_pdx.
>=20
> This is less expensive that PDX compression.=C2=A0 It only adds one memor=
y
> read to the fastpath, but it also doesn't save as much virtual
> address
> space as PDX compression.
>=20
>=20
> When virtual address space is a major constraint (32 bit builds),
> both
> of these techniques are worth doing.=C2=A0 But when there's no constraint
> on
> virtual address space (64 bit builds), there's no reason to use
> either;
> and the performance will definitely improve as a result.

Thanks for such good explanation.

For RISC-V we have PDX config disabled as I haven't seen multiple RAM
banks at boards which has hypervisor extension. Thereby mfn_to_pdx()
and pdx_to_mfn() do nothing. The same for frametable_base_pdx, in case
of PDX disabled, it just an offset ( or a slide ).

IIUUC, you meant that it make sense to map frametable not to the
address of where RAM is started, but to 0, so then we don't need this
+-frametable_base_pdx. The price for that is loosing of VA space for
the range from 0 to RAM start address.

Right now, we are trying to support 3 boards with the following RAM
address:
1. 0x8000_0000 - QEMU and SiFive board
2. 0x40_0000_0000 - Microchip board

So if we mapping frametable to 0 ( not RAM start ) we will loose:
1. 0x8000_0 ( amount of page entries to cover range [0, 0x8000_0000] )
* 64 ( size of struct page_info ) =3D 32 MB
2. 0x40_0000_0 ( amount of page entries to cover range [0,
0x40_0000_0000] ) * 64 ( size of struct page_info ) =3D 4 Gb

In terms of available virtual address space for RV-64 we can consider
both options as acceptable.

[OPTION 1] If we accepting of loosing 4 Gb of VA then we could
implement mfn_to_page() and page_to_mfn() in the following way:
```
   diff --git a/xen/arch/riscv/include/asm/mm.h
   b/xen/arch/riscv/include/asm/mm.h
   index cc4a07a71c..fdac7e0646 100644
   --- a/xen/arch/riscv/include/asm/mm.h
   +++ b/xen/arch/riscv/include/asm/mm.h
   @@ -107,14 +107,11 @@ struct page_info
  =20
    #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
  =20
   -/* PDX of the first page in the frame table. */
   -extern unsigned long frametable_base_pdx;
   -
    /* Convert between machine frame numbers and page-info structures.
*/
    #define mfn_to_page(mfn)                                         =20
\
   -    (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
   +    (frame_table + mfn))
    #define page_to_mfn(pg)                                          =20
\
   -    pdx_to_mfn((unsigned long)((pg) - frame_table) +
   frametable_base_pdx)
   +    ((unsigned long)((pg) - frame_table))
  =20
    static inline void *page_to_virt(const struct page_info *pg)
    {
   diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
   index 9c0fd80588..8f6dbdc699 100644
   --- a/xen/arch/riscv/mm.c
   +++ b/xen/arch/riscv/mm.c
   @@ -15,7 +15,7 @@
    #include <asm/page.h>
    #include <asm/processor.h>
  =20
   -unsigned long __ro_after_init frametable_base_pdx;
    unsigned long __ro_after_init frametable_virt_end;
  =20
    struct mmu_desc {
```

[OPTION 2] If we are not accepting of loosing 4 Gb of VA I think that
there is no sense to rework that in the following way:
```
   diff --git a/xen/arch/riscv/include/asm/mm.h
   b/xen/arch/riscv/include/asm/mm.h
   index cc4a07a71c..fdac7e0646 100644
   --- a/xen/arch/riscv/include/asm/mm.h
   +++ b/xen/arch/riscv/include/asm/mm.h
   @@ -107,14 +107,11 @@ struct page_info
  =20
    #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
  =20
   -/* PDX of the first page in the frame table. */
   -extern unsigned long frametable_base_pdx;
   -
    /* Convert between machine frame numbers and page-info structures.
*/
    #define mfn_to_page(mfn)                                         =20
\
   -    (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
   +    (frame_table + mfn - FRAMETABLE_BASE_OFFSET))
    #define page_to_mfn(pg)                                          =20
\
   -    pdx_to_mfn((unsigned long)((pg) - frame_table) +
   frametable_base_pdx)
   +    ((unsigned long)((pg) - frame_table) + FRAMETABLE_BASE_OFFSET)
  =20
    static inline void *page_to_virt(const struct page_info *pg)
    {
   diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
   index 9c0fd80588..8f6dbdc699 100644
   --- a/xen/arch/riscv/mm.c
   +++ b/xen/arch/riscv/mm.c
   @@ -15,7 +15,7 @@
    #include <asm/page.h>
    #include <asm/processor.h>
  =20
   -unsigned long __ro_after_init frametable_base_pdx;
    unsigned long __ro_after_init frametable_virt_end;
  =20
    struct mmu_desc {
```

And I am not sure that there is any sense in option 2 as basically it
the same to have the following macros definition with PDX disabled:
```
   /* Convert between machine frame numbers and page-info structures.
   */
   #define mfn_to_page(mfn)                                          =20
   \
       (frame_table + (mfn_to_pdx(mfn) - frametable_base_pdx))
   #define page_to_mfn(pg)                                           =20
   \
       pdx_to_mfn((unsigned long)((pg) - frame_table) +
   frametable_base_pdx)
```
The only sense of option 2 is the case when FRAMETABLE_BASE_OFFSET is
equal to 0, so the compiler will generate the code without additional
sub/add of FRAMETABLE_BASE_OFFSET.

Could you please clarify if my understanding is correct?

Should we still change the definition of mfn_to_page() and
page_to_mfn() with the fact that PDX is disabled? If yes, OPTION_1 is
okay or I am missing something?

Thanks in advance.

~ Oleksii

