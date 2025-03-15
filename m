Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70008A623AF
	for <lists+xen-devel@lfdr.de>; Sat, 15 Mar 2025 02:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915660.1321131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttG31-0004d4-G3; Sat, 15 Mar 2025 01:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915660.1321131; Sat, 15 Mar 2025 01:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttG31-0004ai-DJ; Sat, 15 Mar 2025 01:10:43 +0000
Received: by outflank-mailman (input) for mailman id 915660;
 Sat, 15 Mar 2025 01:10:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ms5H=WC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ttFuh-0000Y2-6J
 for xen-devel@lists.xenproject.org; Sat, 15 Mar 2025 01:02:07 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cadd952-0139-11f0-9899-31a8f345e629;
 Sat, 15 Mar 2025 02:02:05 +0100 (CET)
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
X-Inumbo-ID: 1cadd952-0139-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742000524; x=1742259724;
	bh=tsh50c2cyRTBr90Y+fG7b639MStHK6HWLHBjeB3Y/kE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=fCP9qSXhrnKFiyw5uN14OhOgJFa9rXBG3YOR14OVqZq2A3wtInF8FaXidx0rZswF/
	 4l4OLqk6WMCz7Y66CuzoAF5vjfatd+WPzZEMepYu1/NJyun4n9GPgKDM7zogY61399
	 1yCsOsuFmcBOsDuJY4DY69fKvnckB6KMbzHWzisAqZv+S1cSIMmWDSh3mFglCDLD8r
	 oCFNf3AnZaPof6C2DUwj3ljNU/TbxFqVx/ubrAjSvzTEcbPiykgVe5EgXuNipTB6Qu
	 nq+YsRjRE8gBmxPbmdjIWwdaXeenmESYxhdF0iQU+C1t/0a5nDXURbWVEl3b7sr4ly
	 J/ChopIzQg+iw==
Date: Sat, 15 Mar 2025 01:01:59 +0000
To: Jan Beulich <jbeulich@suse.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/irq: use NR_ISAIRQS instead of open-coded value
Message-ID: <IeEQHciWHQiUOKSFJsgfi8PjmC35rlySSbp2Qt8TtCcu5b17O1-PeMIP-mxhT8dV0ipocTkxGzhpHNQXr_kwDnxQnxaMPkdz9xrJ5KZZJIY=@proton.me>
In-Reply-To: <2f365e4a-1d01-4f1c-85b4-25be22545822@suse.com>
References: <20250314011528.2608217-1-dmukhin@ford.com> <2f365e4a-1d01-4f1c-85b4-25be22545822@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 31c45b9d40aa06da1d2077b27d6f6631ca809a0b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, March 14th, 2025 at 1:51 AM, Jan Beulich <jbeulich@suse.com> wro=
te:

>=20
>=20
> On 14.03.2025 02:20, dmkhn@proton.me wrote:
>=20
> > Replace the open-coded value 16 with the NR_ISAIRQS symbol to enhance
> > readability.
> >=20
> > No functional changes.
> >=20
> > Signed-off-by: Denis Mukhin dmukhin@ford.com
> > ---
> > xen/arch/x86/hvm/dm.c | 2 +-
> > xen/arch/x86/hvm/irq.c | 17 +++++++++--------
> > xen/arch/x86/hvm/vlapic.c | 10 +++++-----
> > xen/arch/x86/hvm/vpic.c | 4 ++--
> > xen/arch/x86/include/asm/irq.h | 2 +-
> > xen/arch/x86/io_apic.c | 12 ++++++------
> > xen/arch/x86/irq.c | 6 +++---
> > 7 files changed, 27 insertions(+), 26 deletions(-)
> >=20
> > diff --git a/xen/arch/x86/hvm/dm.c b/xen/arch/x86/hvm/dm.c
> > index a1f7a4d30a..36d47664e9 100644
> > --- a/xen/arch/x86/hvm/dm.c
> > +++ b/xen/arch/x86/hvm/dm.c
> > @@ -90,7 +90,7 @@ static int set_pci_intx_level(struct domain *d, uint1=
6_t domain,
> > static int set_isa_irq_level(struct domain *d, uint8_t isa_irq,
> > uint8_t level)
> > {
> > - if ( isa_irq > 15 )
> > + if ( isa_irq >=3D NR_ISAIRQS )
> > return -EINVAL;
> >=20
> > switch ( level )
> > diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
> > index 1eab44defc..1f7d8ca43e 100644
> > --- a/xen/arch/x86/hvm/irq.c
> > +++ b/xen/arch/x86/hvm/irq.c
> > @@ -209,7 +209,7 @@ int hvm_isa_irq_assert(struct domain *d, unsigned i=
nt isa_irq,
> > unsigned int gsi =3D hvm_isa_irq_to_gsi(isa_irq);
> > int vector =3D -1;
> >=20
> > - ASSERT(isa_irq <=3D 15);
> > + ASSERT(isa_irq < NR_ISAIRQS);
> >=20
> > spin_lock(&d->arch.hvm.irq_lock);
> >=20
> > @@ -231,7 +231,7 @@ void hvm_isa_irq_deassert(
> > struct hvm_irq *hvm_irq =3D hvm_domain_irq(d);
> > unsigned int gsi =3D hvm_isa_irq_to_gsi(isa_irq);
> >=20
> > - ASSERT(isa_irq <=3D 15);
> > + ASSERT(isa_irq < NR_ISAIRQS);
> >=20
> > spin_lock(&d->arch.hvm.irq_lock);
> >=20
> > @@ -266,12 +266,12 @@ static void hvm_set_callback_irq_level(struct vcp=
u *v)
> > if ( asserted && (hvm_irq->gsi_assert_count[gsi]++ =3D=3D 0) )
> > {
> > vioapic_irq_positive_edge(d, gsi);
> > - if ( gsi <=3D 15 )
> > + if ( gsi < NR_ISAIRQS )
> > vpic_irq_positive_edge(d, gsi);
> > }
> > else if ( !asserted && (--hvm_irq->gsi_assert_count[gsi] =3D=3D 0) )
> > {
> > - if ( gsi <=3D 15 )
> > + if ( gsi < NR_ISAIRQS )
> > vpic_irq_negative_edge(d, gsi);
> > }
> > break;
> > @@ -328,7 +328,7 @@ int hvm_set_pci_link_route(struct domain *d, u8 lin=
k, u8 isa_irq)
> > u8 old_isa_irq;
> > int i;
> >=20
> > - if ( (link > 3) || (isa_irq > 15) )
> > + if ( (link > 3) || (isa_irq >=3D NR_ISAIRQS) )
> > return -EINVAL;
> >=20
> > spin_lock(&d->arch.hvm.irq_lock);
> > @@ -440,7 +440,8 @@ void hvm_set_callback_via(struct domain *d, uint64_=
t via)
> > {
> > case HVMIRQ_callback_gsi:
> > gsi =3D hvm_irq->callback_via.gsi;
> > - if ( (--hvm_irq->gsi_assert_count[gsi] =3D=3D 0) && (gsi <=3D 15) )
> > + if ( (--hvm_irq->gsi_assert_count[gsi] =3D=3D 0) &&
> > + (gsi < NR_ISAIRQS) )
> > vpic_irq_negative_edge(d, gsi);
> > break;
> > case HVMIRQ_callback_pci_intx:
> > @@ -464,7 +465,7 @@ void hvm_set_callback_via(struct domain *d, uint64_=
t via)
> > (hvm_irq->gsi_assert_count[gsi]++ =3D=3D 0) )
> > {
> > vioapic_irq_positive_edge(d, gsi);
> > - if ( gsi <=3D 15 )
> > + if ( gsi < NR_ISAIRQS )
> > vpic_irq_positive_edge(d, gsi);
> > }
> > break;
> > @@ -764,7 +765,7 @@ static int cf_check irq_check_link(const struct dom=
ain *d,
> > return -EINVAL;
> >=20
> > for ( link =3D 0; link < ARRAY_SIZE(pci_link->route); link++ )
> > - if ( pci_link->route[link] > 15 )
> > + if ( pci_link->route[link] >=3D NR_ISAIRQS )
> > {
> > printk(XENLOG_G_ERR
> > "HVM restore: PCI-ISA link %u out of range (%u)\n",
>=20
>=20
> Up to here I agree with the adjustments made, but ...
>=20
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -123,7 +123,7 @@ static void vlapic_error(struct vlapic *vlapic, uns=
igned int err_bit)
> > * will end up back here. Break the cycle by only injecting LVTERR
> > * if it will succeed, and folding in RECVILL otherwise.
> > */
> > - if ( (lvterr & APIC_VECTOR_MASK) >=3D 16 )
> > + if ( (lvterr & APIC_VECTOR_MASK) >=3D NR_ISAIRQS )
> > inj =3D true;
> > else
> > set_bit(ilog2(APIC_ESR_RECVILL), &vlapic->hw.pending_esr);
> > @@ -136,7 +136,7 @@ static void vlapic_error(struct vlapic *vlapic, uns=
igned int err_bit)
> >=20
> > bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
> > {
> > - if ( unlikely(vec < 16) )
> > + if ( unlikely(vec < NR_ISAIRQS) )
> > return false;
> >=20
> > if ( hvm_funcs.test_pir &&
> > @@ -150,7 +150,7 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t =
vec, uint8_t trig)
> > {
> > struct vcpu *target =3D vlapic_vcpu(vlapic);
> >=20
> > - if ( unlikely(vec < 16) )
> > + if ( unlikely(vec < NR_ISAIRQS) )
> > {
> > vlapic_error(vlapic, ilog2(APIC_ESR_RECVILL));
> > return;
> > @@ -523,7 +523,7 @@ void vlapic_ipi(
> > struct vlapic *target =3D vlapic_lowest_prio(
> > vlapic_domain(vlapic), vlapic, short_hand, dest, dest_mode);
> >=20
> > - if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
> > + if ( unlikely((icr_low & APIC_VECTOR_MASK) < NR_ISAIRQS) )
> > vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
> > else if ( target )
> > vlapic_accept_irq(vlapic_vcpu(target), icr_low);
> > @@ -531,7 +531,7 @@ void vlapic_ipi(
> > }
> >=20
> > case APIC_DM_FIXED:
> > - if ( unlikely((icr_low & APIC_VECTOR_MASK) < 16) )
> > + if ( unlikely((icr_low & APIC_VECTOR_MASK) < NR_ISAIRQS) )
> > {
> > vlapic_error(vlapic, ilog2(APIC_ESR_SENDILL));
> > break;
>=20
>=20
> ... the 16 here has a different origin (in the local APIC spec). Changes
> further down look okay again.

Sorry for that, I did not verify with the spec.

Thanks!

>=20
> Jan

