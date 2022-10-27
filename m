Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5686160FA82
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 16:37:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431085.683616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo3zt-0005tD-1a; Thu, 27 Oct 2022 14:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431085.683616; Thu, 27 Oct 2022 14:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo3zs-0005r6-Ub; Thu, 27 Oct 2022 14:36:40 +0000
Received: by outflank-mailman (input) for mailman id 431085;
 Thu, 27 Oct 2022 14:36:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yXv3=24=arm.com=andre.przywara@srs-se1.protection.inumbo.net>)
 id 1oo3zr-0005r0-Fo
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 14:36:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c2857e81-5604-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 16:36:36 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1780423A;
 Thu, 27 Oct 2022 07:36:42 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4C593F7B4;
 Thu, 27 Oct 2022 07:36:34 -0700 (PDT)
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
X-Inumbo-ID: c2857e81-5604-11ed-91b5-6bf2151ebd3b
Date: Thu, 27 Oct 2022 15:36:32 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: "stefanos@xilinx.com" <stefanos@xilinx.com>, Julien Grall
 <julien@xen.org>, bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: GICv3: Aarch32: Need guidance on the atomic access of "union
 host_lpi" or if ITS is supported on R52
Message-ID: <20221027153632.0cf7d004@donnerap.cambridge.arm.com>
In-Reply-To: <7f1bdc88-da6b-9a0c-03d4-319e9d8966d4@amd.com>
References: <bedc03b9-e6b9-c85b-27d6-33860ba7bdd7@amd.com>
	<20221025145506.5708839c@donnerap.cambridge.arm.com>
	<7f1bdc88-da6b-9a0c-03d4-319e9d8966d4@amd.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Oct 2022 14:38:52 +0100
Ayan Kumar Halder <ayankuma@amd.com> wrote:

Hi Ayan,

> On 25/10/2022 14:55, Andre Przywara wrote:
> > On Tue, 25 Oct 2022 13:25:52 +0100
> > Ayan Kumar Halder <ayankuma@amd.com> wrote:
> >
> > Hi, =20
>=20
> Hi Andre,
>=20
> Many thanks for the explanation.
>=20
> I need a clarification on the issue of atomic access to 64bit normal=20
> memory on R52.
>=20
> > =20
> >> Hi Andre/All,
> >>
> >> This came up while porting Xen on R52.
> >>
> >> Refer "ARM DDI 0568A.cID110520", B1.3.1
> >>
> >> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE
> >> must not implement LPI support. "
> >>
> >> Does this mean ITS is not supported on R52 ? I am assuming yes, please
> >> correct me if mistaken. =20
> > An ITS relies on LPIs, so yes: no ITS on a v8-R32 system. I cannot find
> > this restriction anymore in the v8-R64 supplement, so it would only app=
ly
> > to the R52/AArch32.
> > =20
> >> If the answer is no, then my next query is follows :- =20
> > Answering to that anyway ...
> > =20
> >> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
> >> index 9ca74bc321..dea60aac0d 100644
> >> --- a/xen/arch/arm/gic-v3-lpi.c
> >> +++ b/xen/arch/arm/gic-v3-lpi.c
> >> @@ -423,7 +423,7 @@ int gicv3_lpi_init_host_lpis(unsigned int host_lpi=
_bits)
> >>   =C2=A0=C2=A0=C2=A0=C2=A0 int rc;
> >>
> >>   =C2=A0=C2=A0=C2=A0=C2=A0 /* We rely on the data structure being atom=
ically accessible. */
> >> -=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(unsig=
ned long));
> >> +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(sizeof(union host_lpi) > sizeof(uint6=
4_t));
> >>
> >> "unsigned long" on Aarch32 is 32 bits. So this bug gets triggered.
> >>
> >> Is it fine to change it as above ?
> >>
> >> Reading"ARM DDI 0487G.bID07202", E2.2.1, "Requirements for single-copy
> >> atomicity".
> >>
> >> "LDRD and STRD accesses to 64-bit aligned locations are 64-bit
> >> single-copy atomic as seen by translation table walks and accesses to
> >> translation tables" =20
> > This (and the explaining paragraph) indeed suggests that this should
> > work architecturally, if you use normal system memory (where you would
> > hold page tables). It would be confined to ARMv8 AArch32 and ARMv7 w/
> > LPAE, which matches Xen's requirements. =20
>=20
> Does it mean that ldrd/strd will not work atomically on AArch32-v8R as=20
> it uses MPU (not MMU, so no page tables) ?

No, this mentioning of page tables is more an example or a rationale, than
a requirement.
What this means (in the ARMv7-A/ARMv8-A AArch32 context) it:
Because on v7A-LPAE and v8-AArch32 PTEs are 64 bits wide, it's too painful
to use explicit locking to make sure just writing one PTE is atomic. So
the architecture demands that 64-bit aligned accesses using ldrd/strd
are single-copy atomic, so software can update just one PTE easily. But
this is only required for locations where page tables typically reside, so
system memory. This avoids this 64-bit atomicity requirement for *every*
part of the system, for instance separate buses, SRAM or flash on smaller
buses, or MMIO in general.

I don't find anything in the v8-R32 supplement that would step back from
this requirement, although indeed the original reason (atomic PTE writes)
would not apply to v8-R32. Both the LDRD/STRD description and the section
listing differences in the system memory architecture do not mention
anything, so I'd say that the ldrd atomicity requirement still holds.

Please note that this only applies to ARMv7 *LPAE* systems, but Xen
requires LPAE, and R52 is v8, so we are good, and the Xen code can rely on
this.

So for Xen on ARMv8-R32:
*LDRD/STRD* accesses to *64-bit aligned* addresses in *RAM* would be
atomic. You need to satisfy all three requirements:
- You must use ldrd/strd. Just dereferencing a uint64_t pointer in C does
not guarantee that, but read_atomic()/write_atomic() does.
- It must be 64-bit aligned. Shouldn't be a problem if the data type is
64 bits wide. Please note the slight nastiness that ldrd would silently
work on non-aligned addresses, but would lose the atomicity guarantee.
ldrexd would always fault if the address is not aligned.
We might want to check the alignment of data we access (assert?), if not
done already.
- It must be in system RAM, so not MMIO. Also I think TCM might be a
different story, but I would hope Xen would not use that directly.

> If so, then is using ldrexd/strexd the solution for this ?

As mentioned above, you would not need that, just
read_atomic()/write_atomic() would do.

Hope that clears that up.

Cheers,
Andre

P.S. This above is my reading of the ARM ARM and the R32 supplement. I can
double check with the architects, but this might take a while.

> IIUC "Memory accesses caused by LDREXD and STREXD instructions to=20
> doubleword-aligned locations.", then the answer seems yes.
>=20
> - Ayan
>=20
> >
> > But it's only atomic if you are using ldrd/strd, which you cannot know =
for
> > sure in C, because it's up to the compiler to generate the instructions.
> >
> > This is why we have that test. Changing the unsigned long to uint64_t
> > would make the check pointless, since the data structure is 64-bits lon=
g,
> > so it would always be true.
> >
> > So given that you don't seem to need it, right now, it would leave the
> > test alone.
> >
> > If you need that on AArch32 anyway, you would need to replace accesses =
to
> > the host_lpis array with inline assembly accessors, to ensure ldrd/strd
> > instructions. This seems doable (there are only so many places which
> > directly access the array members), but would need a good use case.
> >
> > Cheers,
> > Andre
> > =20
> >> Does this imply that atomicity will be retained (with the above change)
> >> ? Os will this require ldrexd/strexd as R52 supports MPU (not MMU, so
> >> translation tables are irrelevant).
> >> Kind regards,
> >> Ayan
> >> =20


