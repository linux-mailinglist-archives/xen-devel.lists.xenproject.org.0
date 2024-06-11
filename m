Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6028903CE1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 15:16:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738386.1145139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1Lq-00080D-K3; Tue, 11 Jun 2024 13:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738386.1145139; Tue, 11 Jun 2024 13:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH1Lq-0007x4-Gy; Tue, 11 Jun 2024 13:15:50 +0000
Received: by outflank-mailman (input) for mailman id 738386;
 Tue, 11 Jun 2024 13:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H2Xh=NN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sH1Lp-0007wy-Nc
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 13:15:49 +0000
Received: from fhigh7-smtp.messagingengine.com
 (fhigh7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b70ce9f8-27f4-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 15:15:47 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 3845411400F8;
 Tue, 11 Jun 2024 09:15:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 11 Jun 2024 09:15:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jun 2024 09:15:45 -0400 (EDT)
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
X-Inumbo-ID: b70ce9f8-27f4-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718111746;
	 x=1718198146; bh=jBLnpq0+MEHS7l7798QLDaAjEcS8410zQss5n3UlQUU=; b=
	fSrF2o3hwS6eKZBKlsNRp76U53Geq/O7wjFtm3tY0XHtC+xHrw3T0Kx94hyRm9up
	WgVPROcR/P8diYGrVTCviZ4rSbaUFs53OGVInUyt6oO2d/jmF/azydKnjk0tu3+Q
	MeHR+zHRF+aILpq7dM0lsuW+XsinWkz7gr69YTef4AIUnJvWcUL76Wxo4L/w1jY8
	0w9rzqYUEsKC6kcwwF/2BdT5pA59VghLr3Z32L3FCzllNHlLNCqH7EDF7yTwwa8E
	JGBjaVBJ6ZS+s2zeQtOui5XsZPFWUuoFUIQqaQS0gvzLxU5AY67uO9uk4yRh4knt
	giVR2NP/N5wPQ4C4yFEVRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718111746; x=1718198146; bh=jBLnpq0+MEHS7l7798QLDaAjEcS8
	410zQss5n3UlQUU=; b=XEa2mPdyztPus9dKyAnf53zARzgxFOPQA0FcfswfEBew
	6QsSt5eeQ7l4ZqwCnbzqMq03jQaZX4aJIRp2BLAwm4MGOOAz12rA5wVtIPv03C6P
	y6PzCsCznAx8zMwlChsMtnlnIkMmrUpiex3QYXbuX2MmTJCm8ZC/kvnWA4L1iEM/
	c3FDmOxx3zYV2KeRjCH+Ji0/XP71ACkC45EzAWsqJyENvHaNbtBIjln/hkQwcB1K
	dUif3Ku1ZZdeehK/LP6gHc/Y1LVKjYtz4qbF9Hix7TuH9OBVxEHi4PsvtK6emTS8
	v+N2IwOHEmP0NM2uw27G8xsvzEJlB6CgMsMIMn2VuQ==
X-ME-Sender: <xms:AU5oZl0KDd3EYM7HIQBu3XtDgtN3uiVzHysxtRAjuONMdcCwlnrl8Q>
    <xme:AU5oZsETj1HfuUjOs4OatmyKBXSdG5xRwJgfgZSBwXwdRJdeXLdgXR1bZjwFsXryc
    OOupN66RsLpjg>
X-ME-Received: <xmr:AU5oZl4n99DrogVEDmbna6LC1YJazBUetYKJv95ly-cvRr8CrbHWFqVy3ql115XzR6vaVAN93zsw5CB3yHEFyK-kn7lBLjoTgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduvddgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:AU5oZi2jJRqhswznDv8wN1KJDybnyzMtibbb0nudCciZBbxLDn_LEw>
    <xmx:AU5oZoGsYKKDd_VXLukuha7hZHetNfRB643DEsMqpJbZUUhAPvGCjQ>
    <xmx:AU5oZj_192PyOwuzxo-GKfYpPVFAfH0jauMIb6L_UGUks3te6ktmLw>
    <xmx:AU5oZlmXm4FYlKqSDL0nUgKTB2oK0pOun6SGBxTjm-2vHvjM8ZE2_Q>
    <xmx:Ak5oZsAjDF0gjvcIHOKIDTxvVcrDxfDIKJGdNipP79Sn15DpR8V_tu4i>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 11 Jun 2024 15:15:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <ZmhN_hNHp7WtyPyD@mail-itl>
References: <cover.68462f37276d69ab6e268be94d049f866a321f73.1716392340.git-series.marmarek@invisiblethingslab.com>
 <30562c807ff2e434731a76d7110d48614a58884b.1716392340.git-series.marmarek@invisiblethingslab.com>
 <ZmgpsZJ4afLd1Fc3@macbook>
 <Zmg3O7zvd9KBC1Fv@mail-itl>
 <ZmhJOjggtJiNccPo@macbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DmQuZvV0PUqnDOdo"
Content-Disposition: inline
In-Reply-To: <ZmhJOjggtJiNccPo@macbook>


--DmQuZvV0PUqnDOdo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 Jun 2024 15:15:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 1/2] x86/mm: add API for marking only part of a MMIO
 page read only

On Tue, Jun 11, 2024 at 02:55:22PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jun 11, 2024 at 01:38:35PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Tue, Jun 11, 2024 at 12:40:49PM +0200, Roger Pau Monn=C3=A9 wrote:
> > > On Wed, May 22, 2024 at 05:39:03PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > +    if ( !entry )
> > > > +    {
> > > > +        /* iter =3D=3D NULL marks it was a newly allocated entry */
> > > > +        iter =3D NULL;
> > > > +        entry =3D xzalloc(struct subpage_ro_range);
> > > > +        if ( !entry )
> > > > +            return -ENOMEM;
> > > > +        entry->mfn =3D mfn;
> > > > +    }
> > > > +
> > > > +    for ( i =3D offset_s; i <=3D offset_e; i +=3D MMIO_RO_SUBPAGE_=
GRAN )
> > > > +    {
> > > > +        bool oldbit =3D __test_and_set_bit(i / MMIO_RO_SUBPAGE_GRA=
N,
> > > > +                                        entry->ro_elems);
> > > > +        ASSERT(!oldbit);
> > > > +    }
> > > > +
> > > > +    if ( !iter )
> > > > +        list_add(&entry->list, &subpage_ro_ranges);
> > > > +
> > > > +    return iter ? 1 : 0;
> > > > +}
> > > > +
> > > > +/* This needs subpage_ro_lock already taken */
> > > > +static void __init subpage_mmio_ro_remove_page(
> > > > +    mfn_t mfn,
> > > > +    unsigned int offset_s,
> > > > +    unsigned int offset_e)
> > > > +{
> > > > +    struct subpage_ro_range *entry =3D NULL, *iter;
> > > > +    unsigned int i;
> > > > +
> > > > +    list_for_each_entry(iter, &subpage_ro_ranges, list)
> > > > +    {
> > > > +        if ( mfn_eq(iter->mfn, mfn) )
> > > > +        {
> > > > +            entry =3D iter;
> > > > +            break;
> > > > +        }
> > > > +    }
> > > > +    if ( !entry )
> > > > +        return;
> > > > +
> > > > +    for ( i =3D offset_s; i <=3D offset_e; i +=3D MMIO_RO_SUBPAGE_=
GRAN )
> > > > +        __clear_bit(i / MMIO_RO_SUBPAGE_GRAN, entry->ro_elems);
> > > > +
> > > > +    if ( !bitmap_empty(entry->ro_elems, PAGE_SIZE / MMIO_RO_SUBPAG=
E_GRAN) )
> > > > +        return;
> > > > +
> > > > +    list_del(&entry->list);
> > > > +    if ( entry->mapped )
> > > > +        iounmap(entry->mapped);
> > > > +    xfree(entry);
> > > > +}
> > > > +
> > > > +int __init subpage_mmio_ro_add(
> > > > +    paddr_t start,
> > > > +    size_t size)
> > > > +{
> > > > +    mfn_t mfn_start =3D maddr_to_mfn(start);
> > > > +    paddr_t end =3D start + size - 1;
> > > > +    mfn_t mfn_end =3D maddr_to_mfn(end);
> > > > +    unsigned int offset_end =3D 0;
> > > > +    int rc;
> > > > +    bool subpage_start, subpage_end;
> > > > +
> > > > +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
> > > > +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
> > > > +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
> > > > +        size =3D ROUNDUP(size, MMIO_RO_SUBPAGE_GRAN);
> > > > +
> > > > +    if ( !size )
> > > > +        return 0;
> > > > +
> > > > +    if ( mfn_eq(mfn_start, mfn_end) )
> > > > +    {
> > > > +        /* Both starting and ending parts handled at once */
> > > > +        subpage_start =3D PAGE_OFFSET(start) || PAGE_OFFSET(end) !=
=3D PAGE_SIZE - 1;
> > > > +        subpage_end =3D false;
> > >=20
> > > Given the intended usage of this, don't we want to limit to only a
> > > single page?  So that PFN_DOWN(start + size) =3D=3D PFN_DOWN/(start),=
 as
> > > that would simplify the logic here?
> >=20
> > I have considered that, but I haven't found anything in the spec
> > mandating the XHCI DbC registers to not cross page boundary. Currently
> > (on a system I test this on) they don't cross page boundary, but I don't
> > want to assume extra constrains - to avoid issues like before (when
> > on the older system I tested the DbC registers didn't shared page with
> > other registers, but then they shared the page on a newer hardware).
>=20
> Oh, from our conversation at XenSummit I got the impression debug registe=
rs
> where always at the same position.  Looking at patch 2/2, it seems you
> only need to block access to a single register.  Are registers in XHCI
> size aligned?  As this would guarantee it doesn't cross a page
> boundary (as long as the register is <=3D 4096 in size).

It's a couple of registers (one "extended capability"), see
`struct dbc_reg` in xhci-dbc.c. It's location is discovered at startup
(device presents a linked-list of capabilities in one of its BARs).
The spec talks only about alignment of individual registers, not the
whole group...

> > > > +            if ( !addr )
> > > > +            {
> > > > +                gprintk(XENLOG_ERR,
> > > > +                        "Failed to map page for MMIO write at 0x%"=
PRI_mfn"%03x\n",
> > > > +                        mfn_x(mfn), offset);
> > > > +                return;
> > > > +            }
> > > > +
> > > > +            switch ( len )
> > > > +            {
> > > > +            case 1:
> > > > +                writeb(*(const uint8_t*)data, addr);
> > > > +                break;
> > > > +            case 2:
> > > > +                writew(*(const uint16_t*)data, addr);
> > > > +                break;
> > > > +            case 4:
> > > > +                writel(*(const uint32_t*)data, addr);
> > > > +                break;
> > > > +            case 8:
> > > > +                writeq(*(const uint64_t*)data, addr);
> > > > +                break;
> > > > +            default:
> > > > +                /* mmio_ro_emulated_write() already validated the =
size */
> > > > +                ASSERT_UNREACHABLE();
> > > > +                goto write_ignored;
> > > > +            }
> > > > +            return;
> > > > +        }
> > > > +    }
> > > > +    /* Do not print message for pages without any writable parts. =
*/
> > > > +}
> > > > +
> > > > +#ifdef CONFIG_HVM
> > > > +bool subpage_mmio_write_accept(mfn_t mfn, unsigned long gla)
> > > > +{
> > > > +    unsigned int offset =3D PAGE_OFFSET(gla);
> > > > +    const struct subpage_ro_range *entry;
> > > > +
> > > > +    list_for_each_entry(entry, &subpage_ro_ranges, list)
> > > > +        if ( mfn_eq(entry->mfn, mfn) &&
> > > > +             !test_bit(offset / MMIO_RO_SUBPAGE_GRAN, entry->ro_el=
ems) )
> > > > +        {
> > > > +            /*
> > > > +             * We don't know the write size at this point yet, so =
it could be
> > > > +             * an unaligned write, but accept it here anyway and d=
eal with it
> > > > +             * later.
> > > > +             */
> > > > +            return true;
> > >=20
> > > For accesses that fall into the RO region, I think you need to accept
> > > them here and just terminate them?  I see no point in propagating
> > > them further in hvm_hap_nested_page_fault().
> >=20
> > If write hits an R/O region on a page with some writable regions the
> > handling should be the same as it would be just on the mmio_ro_ranges.
> > This is what the patch does.
> > There may be an opportunity to simplify mmio_ro_ranges handling
> > somewhere, but I don't think it belongs to this patch.
>=20
> Maybe worth adding a comment that the logic here intends to deal only
> with the RW bits of a page that's otherwise RO, and that by not
> handling the RO regions the intention is that those are dealt just
> like fully RO pages.

I can extend the comment, but I assumed it's kinda implied already (if
nothing else, by the function name).

> I guess there's some message printed when attempting to write to a RO
> page that you would also like to print here?

If a HVM domain writes to an R/O area, it is crashed, so you will get a
message. This applies to both full page R/O and partial R/O. PV doesn't
go through subpage_mmio_write_accept().

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--DmQuZvV0PUqnDOdo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZoTf4ACgkQ24/THMrX
1yydDQf+Jat3ciKVsBOka9pL2K+Eg8cs3xUHsMhk7LcVs8oDrVZk//jaTUN91Zoz
uzYjaJF9f+PzVMbaV8ByxhlLl+lrnxEQmq9fLFaDrvFzlU8KP7zonbSzYlcFzFhK
rJJiPeqVT29QWI0ZXM4FEPFyzJvv1reJ5qcpsfvNGwFkchBpfyQ+Nl//2gVvgy95
bB5/GIE+hXO4FA0rK209dbHnFlOmn013jOfYMpS8tNHPDYqZWUIjITDP0CVk2uAm
pkErHhQBoPVjqaxPVXukwNfWLUuZ6UVRkD69NYbT1hwA5lru0mcBnods6i/9MM7O
jFzN+Rmoi0pRDUa2E9OqWow3LeWCcA==
=od9M
-----END PGP SIGNATURE-----

--DmQuZvV0PUqnDOdo--

