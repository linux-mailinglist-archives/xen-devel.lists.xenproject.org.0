Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F16111E2
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 14:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432035.684715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooOo8-0002kz-Ug; Fri, 28 Oct 2022 12:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432035.684715; Fri, 28 Oct 2022 12:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooOo8-0002iX-Rb; Fri, 28 Oct 2022 12:49:56 +0000
Received: by outflank-mailman (input) for mailman id 432035;
 Fri, 28 Oct 2022 12:49:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22xF=25=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1ooOo7-0002iQ-9G
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 12:49:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0227d0bf-56bf-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 14:49:49 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C075D1FB;
 Fri, 28 Oct 2022 05:49:58 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 995923F445;
 Fri, 28 Oct 2022 05:49:51 -0700 (PDT)
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
X-Inumbo-ID: 0227d0bf-56bf-11ed-8fd0-01056ac49cbb
Date: Fri, 28 Oct 2022 13:49:47 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Julien Grall <julien@xen.org>, "stefanos@xilinx.com"
 <stefanos@xilinx.com>, bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: GICv3: Aarch32: Need guidance on the atomic access of "union
 host_lpi" or if ITS is supported on R52
Message-ID: <20221028134947.6cc0b985@donnerap.cambridge.arm.com>
In-Reply-To: <5afda99e-dd57-5820-7075-6b60e7a794f7@amd.com>
References: <bedc03b9-e6b9-c85b-27d6-33860ba7bdd7@amd.com>
	<20221025145506.5708839c@donnerap.cambridge.arm.com>
	<7f1bdc88-da6b-9a0c-03d4-319e9d8966d4@amd.com>
	<20221027153632.0cf7d004@donnerap.cambridge.arm.com>
	<5afda99e-dd57-5820-7075-6b60e7a794f7@amd.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Oct 2022 12:44:08 +0100
Ayan Kumar Halder <ayankuma@amd.com> wrote:

> On 27/10/2022 15:36, Andre Przywara wrote:
> > On Thu, 27 Oct 2022 14:38:52 +0100
> > Ayan Kumar Halder <ayankuma@amd.com> wrote:
> >
> > Hi Ayan, =20
> Hi Andre / Julien,
> > =20
> >> On 25/10/2022 14:55, Andre Przywara wrote: =20
> >>> On Tue, 25 Oct 2022 13:25:52 +0100
> >>> Ayan Kumar Halder <ayankuma@amd.com> wrote:
> >>>
> >>> Hi, =20
> >> Hi Andre,
> >>
> >> Many thanks for the explanation.
> >>
> >> I need a clarification on the issue of atomic access to 64bit normal
> >> memory on R52.
> >> =20
> >>>    =20
> >>>> Hi Andre/All,
> >>>>
> >>>> This came up while porting Xen on R52.
> >>>>
> >>>> Refer "ARM DDI 0568A.cID110520", B1.3.1
> >>>>
> >>>> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE
> >>>> must not implement LPI support. "
> >>>>
> >>>> Does this mean ITS is not supported on R52 ? I am assuming yes, plea=
se
> >>>> correct me if mistaken. =20
> >>> An ITS relies on LPIs, so yes: no ITS on a v8-R32 system. I cannot fi=
nd
> >>> this restriction anymore in the v8-R64 supplement, so it would only a=
pply
> >>> to the R52/AArch32.
> >>>    =20
> >>>> If the answer is no, then my next query is follows :- =20
> >>> Answering to that anyway ...
> >>>    =20
> >>>> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> >>>> index 9ca74bc321..dea60aac0d 100644
> >>>> --- a/xen/arch/arm/gic-v3-lpi.c
> >>>> +++ b/xen/arch/arm/gic-v3-lpi.c
> >>>> @@ -423,7 +423,7 @@ int gicv3_lpi_init_host_lpis(unsigned int host_l=
pi_bits)
> >>>>    =C2=A0=C2=A0=C2=A0=C2=A0 int rc;
> >>>>
> >>>>    =C2=A0=C2=A0=C2=A0=C2=A0 /* We rely on the data structure being a=
tomically accessible. */
> >>>> -=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(uns=
igned long));
> >>>> +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(uin=
t64_t));
> >>>>
> >>>> "unsigned long" on Aarch32 is 32 bits. So this bug gets triggered.
> >>>>
> >>>> Is it fine to change it as above ?
> >>>>
> >>>> Reading"ARM DDI 0487G.bID07202", E2.2.1, "Requirements for single-co=
py
> >>>> atomicity".
> >>>>
> >>>> "LDRD and STRD accesses to 64-bit aligned locations are 64-bit
> >>>> single-copy atomic as seen by translation table walks and accesses to
> >>>> translation tables" =20
> >>> This (and the explaining paragraph) indeed suggests that this should
> >>> work architecturally, if you use normal system memory (where you would
> >>> hold page tables). It would be confined to ARMv8 AArch32 and ARMv7 w/
> >>> LPAE, which matches Xen's requirements. =20
> >> Does it mean that ldrd/strd will not work atomically on AArch32-v8R as
> >> it uses MPU (not MMU, so no page tables) ? =20
> > No, this mentioning of page tables is more an example or a rationale, t=
han
> > a requirement.
> > What this means (in the ARMv7-A/ARMv8-A AArch32 context) it:
> > Because on v7A-LPAE and v8-AArch32 PTEs are 64 bits wide, it's too pain=
ful
> > to use explicit locking to make sure just writing one PTE is atomic. So
> > the architecture demands that 64-bit aligned accesses using ldrd/strd
> > are single-copy atomic, so software can update just one PTE easily. But
> > this is only required for locations where page tables typically reside,=
 so
> > system memory. This avoids this 64-bit atomicity requirement for *every*
> > part of the system, for instance separate buses, SRAM or flash on small=
er
> > buses, or MMIO in general.
> >
> > I don't find anything in the v8-R32 supplement that would step back from
> > this requirement, although indeed the original reason (atomic PTE write=
s)
> > would not apply to v8-R32. Both the LDRD/STRD description and the secti=
on
> > listing differences in the system memory architecture do not mention
> > anything, so I'd say that the ldrd atomicity requirement still holds.
> >
> > Please note that this only applies to ARMv7 *LPAE* systems, but Xen
> > requires LPAE, and R52 is v8, so we are good, and the Xen code can rely=
 on
> > this.
> >
> > So for Xen on ARMv8-R32:
> > *LDRD/STRD* accesses to *64-bit aligned* addresses in *RAM* would be
> > atomic. You need to satisfy all three requirements:
> > - You must use ldrd/strd. Just dereferencing a uint64_t pointer in C do=
es
> > not guarantee that, but read_atomic()/write_atomic() does.
> > - It must be 64-bit aligned. Shouldn't be a problem if the data type is
> > 64 bits wide. Please note the slight nastiness that ldrd would silently
> > work on non-aligned addresses, but would lose the atomicity guarantee.
> > ldrexd would always fault if the address is not aligned.
> > We might want to check the alignment of data we access (assert?), if not
> > done already.
> > - It must be in system RAM, so not MMIO. Also I think TCM might be a
> > different story, but I would hope Xen would not use that directly.
> > =20
> Many thanks for the nice explanation.
>=20
> I am trying to compare this with the atomicity requirement for AArch64=20
> (ARM DDI 0487G.b ID072021, B2.2.1 Requirements for single-copy atomicit )
>=20
> I seethat the alignment requirement is the same as for ARMv8-R32.
>=20
> "-A read that is generated by a load instruction that loads a single=20
> general-purpose register and is aligned to the size of the read in the=20
> instruction is single-copy atomic.
>=20
> -A write that is generated by a store instruction that stores a single=20
> general-purpose register and is aligned to the size of the write in the=20
> instruction is single-copy atomic"
>=20
> I think the following code change should help us to confirm the correct=20
> behavior of atomic read/write on both AArch64 and AArch32 (including R52).
>=20
> diff --git a/xen/arch/arm/include/asm/atomic.h=20
> b/xen/arch/arm/include/asm/atomic.h
> index ac2798d095..f22c65a853 100644
> --- a/xen/arch/arm/include/asm/atomic.h
> +++ b/xen/arch/arm/include/asm/atomic.h
> @@ -78,6 +78,7 @@ static always_inline void read_atomic_size(const=20
> volatile void *p,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *res,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int size)
>  =C2=A0{
> +=C2=A0=C2=A0=C2=A0 ASSERT(IS_ALIGNED((unsigned long)p, size));
>  =C2=A0=C2=A0=C2=A0=C2=A0 switch ( size )
>  =C2=A0=C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0 case 1:
> @@ -102,6 +103,7 @@ static always_inline void write_atomic_size(volatile=
=20
> void *p,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *val,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int size)
>  =C2=A0{
> +=C2=A0=C2=A0=C2=A0 ASSERT(IS_ALIGNED((unsigned long)p, size));
>  =C2=A0=C2=A0=C2=A0=C2=A0 switch ( size )
>  =C2=A0=C2=A0=C2=A0=C2=A0 {
>  =C2=A0=C2=A0=C2=A0=C2=A0 case 1:
>=20
> Please let me know if I misunderstand something.

Yes, that looks correct. Even the more "simple" atomic accesses always
require alignment, so if you do an unaligned 32-bit read in AArch64, it
wouldn't be single-copy atomic either.

Cheers,
Andre

> >> If so, then is using ldrexd/strexd the solution for this ? =20
> > As mentioned above, you would not need that, just
> > read_atomic()/write_atomic() would do.
> >
> > Hope that clears that up.
> >
> > Cheers,
> > Andre
> >
> > P.S. This above is my reading of the ARM ARM and the R32 supplement. I =
can
> > double check with the architects, but this might take a while.
> > =20
> >> IIUC "Memory accesses caused by LDREXD and STREXD instructions to
> >> doubleword-aligned locations.", then the answer seems yes.
> >>
> >> - Ayan
> >> =20
> >>> But it's only atomic if you are using ldrd/strd, which you cannot kno=
w for
> >>> sure in C, because it's up to the compiler to generate the instructio=
ns.
> >>>
> >>> This is why we have that test. Changing the unsigned long to uint64_t
> >>> would make the check pointless, since the data structure is 64-bits l=
ong,
> >>> so it would always be true.
> >>>
> >>> So given that you don't seem to need it, right now, it would leave the
> >>> test alone.
> >>>
> >>> If you need that on AArch32 anyway, you would need to replace accesse=
s to
> >>> the host_lpis array with inline assembly accessors, to ensure ldrd/st=
rd
> >>> instructions. This seems doable (there are only so many places which
> >>> directly access the array members), but would need a good use case.
> >>>
> >>> Cheers,
> >>> Andre
> >>>    =20
> >>>> Does this imply that atomicity will be retained (with the above chan=
ge)
> >>>> ? Os will this require ldrexd/strexd as R52 supports MPU (not MMU, so
> >>>> translation tables are irrelevant).
> >>>> Kind regards,
> >>>> Ayan
> >>>>    =20


