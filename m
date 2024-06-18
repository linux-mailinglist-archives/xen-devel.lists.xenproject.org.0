Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC69490C4DB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2024 10:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742802.1149669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJU5w-000847-8j; Tue, 18 Jun 2024 08:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742802.1149669; Tue, 18 Jun 2024 08:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJU5w-00081s-5y; Tue, 18 Jun 2024 08:21:36 +0000
Received: by outflank-mailman (input) for mailman id 742802;
 Tue, 18 Jun 2024 08:21:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oyK7=NU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sJU5u-00081m-F4
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2024 08:21:34 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4d3c84d-2d4b-11ef-b4bb-af5377834399;
 Tue, 18 Jun 2024 10:21:32 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52bc335e49aso5859406e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2024 01:21:32 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282eedesm1467022e87.83.2024.06.18.01.21.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 01:21:30 -0700 (PDT)
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
X-Inumbo-ID: c4d3c84d-2d4b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718698891; x=1719303691; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5AvF6KVKKcEoMWoZpmiRsX9jafSgmMdcvmYL7YdTlz0=;
        b=f9IyDfkYHKFFcb1pvJxZ/ymKJo+PS6OiY5jxXSBrrrgK4zAT8AMGJQHFVoxzo3zvTe
         z9e2AGg4StdP2m0WTCf9fFnzAN9p+808HFe45PXZDJCq40IZ/awCN8bQxKOlaMSnb9ih
         N6NwOcECnL/nSgtvR9dgicaq+JkxsRitNTJbXiAcVLENQWCd8Q21GeaRK2f89KFe3pIY
         yaaey0NmgY9aqqfFlmVTJsIfbqItTG0UktK7cbE9INPGC3ZAmDfqRaH6veX8ySCzJOb6
         8k85Qv2z4MbIUvo5+6yS6VOmMGUWEmL165rlX/dGpRJv2rzkLMyHaXnmvm0n8CkTPKqc
         qFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718698891; x=1719303691;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AvF6KVKKcEoMWoZpmiRsX9jafSgmMdcvmYL7YdTlz0=;
        b=ePjkCnDshQ83ar2kJgC8muhUAK0Sked1lxwnX+6yv4zzsQFfCeZUmBWmOwa2nVgcih
         smcLIsCBhZNOBXg9eWOjM8ZaM4JFAnUS6rXPb0e6UqXjZ24i6t8ECVkp2vEK4Lnpm2Ht
         kDd1tPkiswQhnpwuWopBLkySaVBeairXANEByHA77MngCKC/9W8V1h8YozNB7UFPrDUZ
         l9tJEVdA24OCwolkVmBpS4dpBRDXnmj0KpxU5lFqD6T0n28NnYOXRTvbJEWUgdw4e69Y
         1r9ao6fslIAbrnLdUHQjI2TdIxmSDn5Jehv1v4KlGy9ohZBh5YqVrMH9jw3TPUs4zenS
         eiMw==
X-Forwarded-Encrypted: i=1; AJvYcCVd7QZycElF7umlrEhVR8AYcNNfgaXl67E0GW4sEI2UHBDl8p3gPkHGIH+AbCxQQXNMJCPB7mckTkJu9QenStRtHbNNyKtW2VWizGTXa5E=
X-Gm-Message-State: AOJu0YxVQP+kWQ4zdC33lMiFNMzrgfBPNV2RR64+QqCRKlplB2U73Nq4
	KZGQg+o7tULDdWV2008eSt/nxqkPke7y9OLlxn4dtvo/soZQ51FX
X-Google-Smtp-Source: AGHT+IHhIIoUv1xyLbGIs+moTcjRoubpenokyM8SWzEx3XXXzNadnKALOTMtdk7nY5VgfaC/8+J4bA==
X-Received: by 2002:a19:c515:0:b0:52c:8479:21fb with SMTP id 2adb3069b0e04-52ca6e64c25mr8492688e87.27.1718698891212;
        Tue, 18 Jun 2024 01:21:31 -0700 (PDT)
Message-ID: <0b6350f2d8cfe8f2f8f24f1f2de601f3db529335.camel@gmail.com>
Subject: Re: [PATCH v12 5/8] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Date: Tue, 18 Jun 2024 10:21:30 +0200
In-Reply-To: <fa62c314-424e-4e5b-9046-3a2e1eba654e@citrix.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
	 <d00b86f41ef2c7d928a28dadd8c34fb845f23d0a.1717008161.git.oleksii.kurochko@gmail.com>
	 <70128dba-498f-4d85-8507-bb1621182754@citrix.com>
	 <7721c1b4eb0ea76cca5460264954d40d639499b7.camel@gmail.com>
	 <e80e30c9-6558-4b70-ab2f-18c34c359dae@citrix.com>
	 <1b3b389156ad924f00af8af1d173b89fc533050e.camel@gmail.com>
	 <fa62c314-424e-4e5b-9046-3a2e1eba654e@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Fri, 2024-06-14 at 10:47 +0100, Andrew Cooper wrote:
> On 11/06/2024 7:23 pm, Oleksii K. wrote:
> > On Tue, 2024-06-11 at 16:53 +0100, Andrew Cooper wrote:
> > > On 30/05/2024 7:22 pm, Oleksii K. wrote:
> > > > On Thu, 2024-05-30 at 18:23 +0100, Andrew Cooper wrote:
> > > > > On 29/05/2024 8:55 pm, Oleksii Kurochko wrote:
> > > > > > Signed-off-by: Oleksii Kurochko
> > > > > > <oleksii.kurochko@gmail.com>
> > > > > > Acked-by: Jan Beulich <jbeulich@suse.com>
> > > > > This patch looks like it can go in independently?=C2=A0 Or does i=
t
> > > > > depend
> > > > > on
> > > > > having bitops.h working in practice?
> > > > >=20
> > > > > However, one very strong suggestion...
> > > > >=20
> > > > >=20
> > > > > > diff --git a/xen/arch/riscv/include/asm/mm.h
> > > > > > b/xen/arch/riscv/include/asm/mm.h
> > > > > > index 07c7a0abba..cc4a07a71c 100644
> > > > > > --- a/xen/arch/riscv/include/asm/mm.h
> > > > > > +++ b/xen/arch/riscv/include/asm/mm.h
> > > > > > @@ -3,11 +3,246 @@
> > > > > > <snip>
> > > > > > +/* PDX of the first page in the frame table. */
> > > > > > +extern unsigned long frametable_base_pdx;
> > > > > > +
> > > > > > +/* Convert between machine frame numbers and page-info
> > > > > > structures.
> > > > > > */
> > > > > > +#define
> > > > > > mfn_to_page(mfn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > \
> > > > > > +=C2=A0=C2=A0=C2=A0 (frame_table + (mfn_to_pdx(mfn) -
> > > > > > frametable_base_pdx))
> > > > > > +#define
> > > > > > page_to_mfn(pg)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > \
> > > > > > +=C2=A0=C2=A0=C2=A0 pdx_to_mfn((unsigned long)((pg) - frame_tab=
le) +
> > > > > > frametable_base_pdx)
> > > > > Do yourself a favour and not introduce frametable_base_pdx to
> > > > > begin
> > > > > with.
> > > > >=20
> > > > > Every RISC-V board I can find has things starting from 0 in
> > > > > physical
> > > > > address space, with RAM starting immediately after.
> > > > I checked Linux kernel and grep there:
> > > > =C2=A0=C2=A0 [ok@fedora linux-aia]$ grep -Rni "memory@"
> > > > arch/riscv/boot/dts/
> > > > --
> > > > =C2=A0=C2=A0 exclude "*.tmp" -I
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfiv=
e-
> > > > 2.dtsi:33:=C2=A0=C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 memory@40000000 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/starfive/jh7100-common.dtsi:28:=C2=
=A0=C2=A0=C2=A0=C2=A0
> > > > memory@80000000
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts:49:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > ddrc_cache:
> > > > =C2=A0=C2=A0 memory@1000000000 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts:33:=
=C2=A0=C2=A0
> > > > ddrc_cache_lo:
> > > > =C2=A0=C2=A0 memory@80000000 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts:37:=
=C2=A0=C2=A0
> > > > ddrc_cache_hi:
> > > > =C2=A0=C2=A0 memory@1040000000 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts:34:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > ddrc_cache_lo:
> > > > =C2=A0=C2=A0 memory@80000000 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts:40:=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > ddrc_cache_hi:
> > > > =C2=A0=C2=A0 memory@1000000000 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts:22:=
=C2=A0=C2=A0
> > > > ddrc_cache_lo:
> > > > =C2=A0=C2=A0 memory@80000000 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts:27:=
=C2=A0=C2=A0
> > > > ddrc_cache_hi:
> > > > =C2=A0=C2=A0 memory@1000000000 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts:57:=
=C2=A0=C2=A0
> > > > ddrc_cache_lo:
> > > > =C2=A0=C2=A0 memory@80000000 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts:63:=
=C2=A0=C2=A0
> > > > ddrc_cache_hi:
> > > > =C2=A0=C2=A0 memory@1040000000 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts:32:=
=C2=A0
> > > > memory@0
> > > > {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/thead/th1520-lichee-module-
> > > > 4a.dtsi:14:=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 memory@0 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts:26:=
=C2=A0=C2=A0=C2=A0
> > > > memory@80000000
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/sophgo/cv1812h.dtsi:12:=C2=A0=C2=
=A0=C2=A0=C2=A0
> > > > memory@80000000
> > > > {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts:26=
:
> > > > memory@80000000
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts:25=
:
> > > > memory@80000000
> > > > =C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0 arch/riscv/boot/dts/canaan/k210.dtsi:82:=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sram:
> > > > memory@80000000 {
> > > > =C2=A0=C2=A0=20
> > > > And based on=C2=A0 that majority of supported by Linux kernel board=
s
> > > > has
> > > > RAM
> > > > starting not from 0 in physical address space. Am I confusing
> > > > something?
> > > >=20
> > > > > Taking the microchip board as an example, RAM actually starts
> > > > > at
> > > > > 0x8000000,
> > > > Today we had conversation with the guy from SiFive in xen-devel
> > > > channel
> > > > and he mentioned that they are using "starfive visionfive2 and
> > > > sifive
> > > > unleashed platforms." which based on the grep above has RAM not
> > > > at
> > > > 0
> > > > address.
> > > >=20
> > > > Also, QEMU uses 0x8000000.
> > > >=20
> > > > > =C2=A0which means that having frametable_base_pdx and assuming it
> > > > > does get set to 0x8000 (which isn't even a certainty, given
> > > > > that
> > > > > I
> > > > > think
> > > > > you'll need struct pages covering the PLICs), then what you
> > > > > are
> > > > > trading
> > > > > off is:
> > > > >=20
> > > > > * Saving 32k of virtual address space only (no need to even
> > > > > allocate
> > > > > memory for this range of the framtable), by
> > > > > * Having an extra memory load and add/sub in every page <->
> > > > > mfn
> > > > > conversion, which is a screaming hotpath all over Xen.
> > > > >=20
> > > > > It's a terribly short-sighted tradeoff.
> > > > >=20
> > > > > 32k of VA space might be worth saving in a 32bit build (I
> > > > > personally
> > > > > wouldn't - especially as there's no need to share Xen's VA
> > > > > space
> > > > > with
> > > > > guests, given no PV guests on ARM/RISC-V), but it's
> > > > > absolutely
> > > > > not at
> > > > > all in an a 64bit build with TB of VA space available.
> > > > >=20
> > > > > Even if we do find a board with the first interesting thing
> > > > > in
> > > > > the
> > > > > frametable starting sufficiently away from 0 that it might be
> > > > > worth
> > > > > considering this slide, then it should still be Kconfig-able
> > > > > in a
> > > > > similar way to PDX_COMPRESSION.
> > > > I found your tradeoffs reasonable, but I don't understand how
> > > > it
> > > > will
> > > > work if RAM does not start from 0, as the frametable address
> > > > and
> > > > RAM
> > > > address are linked.
> > > > I tried to look at the PDX_COMPRESSION config and couldn't find
> > > > any
> > > > "slide" there. Could you please clarify this for me?
> > > > If to use this "slide" would it help to avoid the mentioned
> > > > above
> > > > tradeoffs?
> > > >=20
> > > > One more question: if we decide to go without
> > > > frametable_base_pdx,
> > > > would it be sufficient to simply remove mentions of it from the
> > > > code (
> > > > at least, for now )?
> > > There is a relationship between system/host physical addresses
> > > (what
> > > Xen
> > > called maddr/mfn), and the frametable.=C2=A0 The frametable has one
> > > entry
> > > per
> > > mfn.
> > >=20
> > > In the most simple case, there's a 1:1 relationship.=C2=A0 i.e.
> > > frametable[0]
> > > =3D maddr(0), frametable[1] =3D maddr(4k) etc.=C2=A0 This is very sim=
ple,
> > > and
> > > very easy to calculate (page_to_mfn()/mfn_to_page()).
> > >=20
> > > The frametable is one big array.=C2=A0 It starts at a compile-time
> > > fixed
> > > address, and needs to be long enough to cover everything
> > > interesting
> > > in
> > > memory.=C2=A0 Therefore it potentially takes a large amount of virtua=
l
> > > address space.
> > >=20
> > > However, only interesting maddrs need to have data in the
> > > frametable,
> > > so
> > > it's fine for the backing RAM to be sparsely allocated/mapped in
> > > the
> > > frametable virtual addresses.
> > >=20
> > > For 64bit, that's really all you need, because there's always far
> > > more
> > > virtual address space than physical RAM in the system, even when
> > > you're
> > > looking at TB-scale giant servers.
> > >=20
> > >=20
> > > For 32bit, virtual address space is a limited resource.=C2=A0 (Also t=
o
> > > an
> > > extent, 64bit x86 with PV guests because we give 98% of the
> > > virtual
> > > address space to the guest kernel to use.)
> > >=20
> > > There are two tricks to reduce the virtual address space used,
> > > but
> > > they
> > > both cost performance in fastpaths.
> > >=20
> > > 1) PDX Compression.
> > >=20
> > > PDX compression makes a non-linear mfn <-> maddr mapping.=C2=A0 This
> > > is
> > > for a
> > > usecase where you've got multiple RAM banks which are separated
> > > by a
> > > large distance (and evenly spaced), then you can "compress" a
> > > single
> > > range of 0's out of the middle of the system/host physical
> > > address.
> > >=20
> > > The cost is that all page <-> mfn conversions need to read two
> > > masks
> > > and
> > > a shift-count from variables in memory, to split/shift/recombine
> > > the
> > > address bits.
> > >=20
> > > 2) A slide, which is frametable_base_pdx in this context.
> > >=20
> > > When there's a big gap between 0 and the start of something
> > > interesting,
> > > you could chop out that range by just subtracting base_pdx.=C2=A0 Wha=
t
> > > qualifies as "big" is subjective, but Qemu starting at 128M
> > > certainly
> > > does not qualify as big enough to warrant frametable_base_pdx.
> > >=20
> > > This is less expensive that PDX compression.=C2=A0 It only adds one
> > > memory
> > > read to the fastpath, but it also doesn't save as much virtual
> > > address
> > > space as PDX compression.
> > >=20
> > >=20
> > > When virtual address space is a major constraint (32 bit builds),
> > > both
> > > of these techniques are worth doing.=C2=A0 But when there's no
> > > constraint
> > > on
> > > virtual address space (64 bit builds), there's no reason to use
> > > either;
> > > and the performance will definitely improve as a result.
> > Thanks for such good explanation.
> >=20
> > For RISC-V we have PDX config disabled as I haven't seen multiple
> > RAM
> > banks at boards which has hypervisor extension. Thereby
> > mfn_to_pdx()
> > and pdx_to_mfn() do nothing. The same for frametable_base_pdx, in
> > case
> > of PDX disabled, it just an offset ( or a slide ).
> >=20
> > IIUUC, you meant that it make sense to map frametable not to the
> > address of where RAM is started, but to 0, so then we don't need
> > this
> > +-frametable_base_pdx. The price for that is loosing of VA space
> > for
> > the range from 0 to RAM start address.
> >=20
> > Right now, we are trying to support 3 boards with the following RAM
> > address:
> > 1. 0x8000_0000 - QEMU and SiFive board
> > 2. 0x40_0000_0000 - Microchip board
> >=20
> > So if we mapping frametable to 0 ( not RAM start ) we will loose:
> > 1. 0x8000_0 ( amount of page entries to cover range [0,
> > 0x8000_0000] )
> > * 64 ( size of struct page_info ) =3D 32 MB
> > 2. 0x40_0000_0 ( amount of page entries to cover range [0,
> > 0x40_0000_0000] ) * 64 ( size of struct page_info ) =3D 4 Gb
> >=20
> > In terms of available virtual address space for RV-64 we can
> > consider
> > both options as acceptable.
>=20
> For Qemu and SiFive, 32M is definitely not worth worrying about.
>=20
> I personally wouldn't worry about Microchip either.=C2=A0 That's 4G of 1T
> VA
> space (assuming Sv39).
>=20
> > [OPTION 1] If we accepting of loosing 4 Gb of VA then we could
> > implement mfn_to_page() and page_to_mfn() in the following way:
> > ```
> > =C2=A0=C2=A0 diff --git a/xen/arch/riscv/include/asm/mm.h
> > =C2=A0=C2=A0 b/xen/arch/riscv/include/asm/mm.h
> > =C2=A0=C2=A0 index cc4a07a71c..fdac7e0646 100644
> > =C2=A0=C2=A0 --- a/xen/arch/riscv/include/asm/mm.h
> > =C2=A0=C2=A0 +++ b/xen/arch/riscv/include/asm/mm.h
> > =C2=A0=C2=A0 @@ -107,14 +107,11 @@ struct page_info
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 #define frame_table ((struct page_info *)FRAMETABLE_=
VIRT_START)
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 -/* PDX of the first page in the frame table. */
> > =C2=A0=C2=A0 -extern unsigned long frametable_base_pdx;
> > =C2=A0=C2=A0 -
> > =C2=A0=C2=A0=C2=A0 /* Convert between machine frame numbers and page-in=
fo
> > structures.
> > */
> > =C2=A0=C2=A0=C2=A0 #define
> > mfn_to_page(mfn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > \
> > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 (frame_table + (mfn_to_pdx(mfn) - fram=
etable_base_pdx))
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 (frame_table + mfn))
> > =C2=A0=C2=A0=C2=A0 #define
> > page_to_mfn(pg)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > \
> > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0 pdx_to_mfn((unsigned long)((pg) - fram=
e_table) +
> > =C2=A0=C2=A0 frametable_base_pdx)
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 ((unsigned long)((pg) - frame_table))
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 static inline void *page_to_virt(const struct page_i=
nfo *pg)
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0 diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
> > =C2=A0=C2=A0 index 9c0fd80588..8f6dbdc699 100644
> > =C2=A0=C2=A0 --- a/xen/arch/riscv/mm.c
> > =C2=A0=C2=A0 +++ b/xen/arch/riscv/mm.c
> > =C2=A0=C2=A0 @@ -15,7 +15,7 @@
> > =C2=A0=C2=A0=C2=A0 #include <asm/page.h>
> > =C2=A0=C2=A0=C2=A0 #include <asm/processor.h>
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0 -unsigned long __ro_after_init frametable_base_pdx;
> > =C2=A0=C2=A0=C2=A0 unsigned long __ro_after_init frametable_virt_end;
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 struct mmu_desc {
> > ```
>=20
> I firmly recommend option 1, especially at this point.
Jan, as you gave your Acked before, don't you mind to define
mfn_to_page() and page_to_mfn as mentioned above ( Option 1 )?

~ Oleksi

>=20
> If specific boards really have a problem with losing 4G of VA space,
> then option 2 can be added easily at a later point.
>=20
> That said, I'd think carefully about doing option 2.=C2=A0 Even
> subtracting a
> constant - which is far better than subtracting a variable - is still
> extra overhead in fastpaths.=C2=A0 Option 2 needs careful consideration o=
n
> a
> board-by-board case.
>=20
> ~Andrew


