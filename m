Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481EF90B376
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 17:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742448.1149262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDxV-0006mM-79; Mon, 17 Jun 2024 15:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742448.1149262; Mon, 17 Jun 2024 15:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDxV-0006jv-4Z; Mon, 17 Jun 2024 15:07:49 +0000
Received: by outflank-mailman (input) for mailman id 742448;
 Mon, 17 Jun 2024 15:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Jjg=NT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1sJDxT-0006jp-Mb
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 15:07:47 +0000
Received: from fhigh1-smtp.messagingengine.com
 (fhigh1-smtp.messagingengine.com [103.168.172.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5827efd0-2cbb-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 17:07:44 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 9F21611401D7;
 Mon, 17 Jun 2024 11:07:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Jun 2024 11:07:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jun 2024 11:07:40 -0400 (EDT)
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
X-Inumbo-ID: 5827efd0-2cbb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718636861;
	 x=1718723261; bh=zCVsZVjhO+hN9MCUoE86QP37zx9/iqxqHFwDyh/DIpM=; b=
	FPSHjFNgKZlB7kmpd+SSTxnpPxLhHrkZ3behBc6ElGxpuYJK5oodeXPkhWlblC/f
	s2Iu8wxWE9088NQw7vF6ATAcaHIjury195Q8x5tBTzuDjaS7kR8IuZ1p1P0jt7pz
	txQDlA6VLgp8vpq6VL/aszxRRC42/Ml6JCP4e5DVk6M/wp8+Vfhi6f5xnFqQcsb1
	pzwfnnjyY4SNcfPd3JQsq8JXhRznrta1yiuwyBtDynrFFpOvtz/p3v2Urcn6V2A0
	fdJn75K1f3Mbps4IYrhwjm+2B4I/diVgPDIPzFguFmCtNFuF6PcK4Isxc68P2OuI
	H1ErpHl1UpmS5qa8hqCxFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718636861; x=1718723261; bh=zCVsZVjhO+hN9MCUoE86QP37zx9/
	iqxqHFwDyh/DIpM=; b=bYCjz7FTwR1d0I7tJl1/0WO/WVQ1CdApK//MRQjW/Mk3
	xlFW0QPnjUIsAphW32LsZdaHJ/otc9JgN7rp8aZ+Z3yessZ8chUOnqOGUVmgo9so
	K6dzVL2BBvNj3lCAFacpW4I0uCeB7b0tggm/jafWA+wQW6cmiXZmlAgwZL1pX2QV
	nLxqjdcFt6S4OfyEFqlOqfCdAtufzN6jl1aL1jDt5nKmNCgHWOz7EIqE5XisBJnI
	5Sb0d3RTXyItAreh9p9hAL9TvqBmruaLuXHLSHe4f08kV8p75KbrnelCkpHSrkza
	Lh6goJiDcXaybW0ZF9ggLr+cvw8lJug398aPqhV31Q==
X-ME-Sender: <xms:PFFwZjnt_sYQFRQsRe4cmFAyE9-a3nqJFZiIMevSMF5i2awBC6btYw>
    <xme:PFFwZm1TLiqeVaLRkvkKP4AJZaccdoNvsTQWInOLs9KWjsIu3SXb9fogcpiV8MYH3
    164pH04SrqMW3s>
X-ME-Received: <xmr:PFFwZprLifrWvpwLtbvlcQTk8PdHtuYCjMInR7lWHtqzzFsi2Q-0iq8vNbgsBgG0dDoiSv_RVj1_NZpdE1OZXBc_vbYgP1gtshT97OnvFo09QDYk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvhedgkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteekuddvfedtheethedttdfgleet
    ffeghfduieefffdutdejtddvkeeifefhuddunecuffhomhgrihhnpehorghsihhsqdhoph
    gvnhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:PVFwZrl4c_xZ08tTlAAUICNqQ-c5xvtfB6yhuVMSIvdT-DYQ6PQtUA>
    <xmx:PVFwZh1hcDAiW7FyrVM_Ey8a58p3dDzG7gf2YS78YorSVU_WLKIv-g>
    <xmx:PVFwZqsDvMRUgg8xk6orCXMP5WwmAq3wrVoVbJ6g3n4Whdr-H8hTtg>
    <xmx:PVFwZlXDms1JG9MjR58cDR-wYFM5uTkfCQ7BgakeWr0afcaFIVXvKw>
    <xmx:PVFwZroS1g22U3UHAJ6VdNsh3KHFWYgwStsbXmQ1r8YrFaHJr3TWLITU>
Feedback-ID: iac594737:Fastmail
Date: Mon, 17 Jun 2024 11:07:25 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <ZnBRO7hlCy2_HgwW@itl-email>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <ZmwByZnn5vKcVLKI@macbook>
 <Zm-FidjSK3mOieSC@itl-email>
 <Zm_p1QvoZcjQ4gBa@macbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HOhfUfe+b94jgfrk"
Content-Disposition: inline
In-Reply-To: <Zm_p1QvoZcjQ4gBa@macbook>


--HOhfUfe+b94jgfrk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Jun 2024 11:07:25 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen

On Mon, Jun 17, 2024 at 09:46:29AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Sun, Jun 16, 2024 at 08:38:19PM -0400, Demi Marie Obenour wrote:
> > On Fri, Jun 14, 2024 at 10:39:37AM +0200, Roger Pau Monn=C3=A9 wrote:
> > > On Fri, Jun 14, 2024 at 10:12:40AM +0200, Jan Beulich wrote:
> > > > On 14.06.2024 09:21, Roger Pau Monn=C3=A9 wrote:
> > > > > On Fri, Jun 14, 2024 at 08:38:51AM +0200, Jan Beulich wrote:
> > > > >> On 13.06.2024 20:43, Demi Marie Obenour wrote:
> > > > >>> GPU acceleration requires that pageable host memory be able to =
be mapped
> > > > >>> into a guest.
> > > > >>
> > > > >> I'm sure it was explained in the session, which sadly I couldn't=
 attend.
> > > > >> I've been asking Ray and Xenia the same before, but I'm afraid i=
t still
> > > > >> hasn't become clear to me why this is a _requirement_. After all=
 that's
> > > > >> against what we're doing elsewhere (i.e. so far it has always be=
en
> > > > >> guest memory that's mapped in the host). I can appreciate that i=
t might
> > > > >> be more difficult to implement, but avoiding to violate this fun=
damental
> > > > >> (kind of) rule might be worth the price (and would avoid other
> > > > >> complexities, of which there may be lurking more than what you e=
numerate
> > > > >> below).
> > > > >=20
> > > > > My limited understanding (please someone correct me if wrong) is =
that
> > > > > the GPU buffer (or context I think it's also called?) is always
> > > > > allocated from dom0 (the owner of the GPU).  The underling memory
> > > > > addresses of such buffer needs to be mapped into the guest.  The
> > > > > buffer backing memory might be GPU MMIO from the device BAR(s) or
> > > > > system RAM, and such buffer can be paged by the dom0 kernel at any
> > > > > time (iow: changing the backing memory from MMIO to RAM or vice
> > > > > versa).  Also, the buffer must be contiguous in physical address
> > > > > space.
> > > >=20
> > > > This last one in particular would of course be a severe restriction.
> > > > Yet: There's an IOMMU involved, isn't there?
> > >=20
> > > Yup, IIRC that's why Ray said it was much more easier for them to
> > > support VirtIO GPUs from a PVH dom0 rather than classic PV one.
> > >=20
> > > It might be easier to implement from a classic PV dom0 if there's
> > > pv-iommu support, so that dom0 can create it's own contiguous memory
> > > buffers from the device PoV.
> >=20
> > What makes PVH an improvement here?  I thought PV dom0 uses an identity
> > mapping for the IOMMU, while a PVH dom0 uses an IOMMU that mirrors the
> > dom0 second-stage page tables.
>=20
> Indeed, hence finding a physically contiguous buffer on classic PV is
> way more complicated, because the IOMMU identity maps mfns, and the PV
> address space can be completely scattered.
>=20
> OTOH, on PVH the IOMMU page tables are the same as the second stage
> translation, and hence the physical address is way more compact (as it
> would be on native).

Ah, _that_ is what I missed.  I didn't realize that the physical address
space of PV guests was so scattered.

> > In both cases, the device physical
> > addresses are identical to dom0=E2=80=99s physical addresses.
>=20
> Yes, but a PV dom0 physical address space can be very scattered.
>=20
> IIRC there's an hypercall to request physically contiguous memory for
> PV, but you don't want to be using that every time you allocate a
> buffer (not sure it would support the sizes needed by the GPU
> anyway).

That makes sense, thanks!

> > PV is terrible for many reasons, so I=E2=80=99m okay with focusing on P=
VH dom0,
> > but I=E2=80=99d like to know why there is a difference.
> >=20
> > > > > I'm not sure it's possible to ensure that when using system RAM s=
uch
> > > > > memory comes from the guest rather than the host, as it would lik=
ely
> > > > > require some very intrusive hooks into the kernel logic, and
> > > > > negotiation with the guest to allocate the requested amount of
> > > > > memory and hand it over to dom0.  If the maximum size of the buff=
er is
> > > > > known in advance maybe dom0 can negotiate with the guest to alloc=
ate
> > > > > such a region and grant it access to dom0 at driver attachment ti=
me.
> > > >=20
> > > > Besides the thought of transiently converting RAM to kind-of-MMIO, =
this
> > >=20
> > > As a note here, changing the type to MMIO would likely involve
> > > modifying the EPT/NPT tables to propagate the new type.  On a PVH dom0
> > > this would likely involve shattering superpages in order to set the
> > > correct memory types.
> > >=20
> > > Depending on how often and how random those system RAM changes are
> > > necessary this could also create contention on the p2m lock.
> > >=20
> > > > makes me think of another possible option: Could Dom0 transfer owne=
rship
> > > > of the RAM that wants mapping in the guest (remotely resembling
> > > > grant-transfer)? Would require the guest to have ballooned down eno=
ugh
> > > > first, of course. (In both cases it would certainly need working ou=
t how
> > > > the conversion / transfer back could be made work safely and reason=
ably
> > > > cleanly.)
> > >=20
> > > Maybe.  The fact the guest needs to balloon down that amount of memory
> > > seems weird to me, as from the guest PoV that mapped memory is
> > > MMIO-like and not system RAM.
> >=20
> > I don=E2=80=99t like it either.  Furthermore, this would require change=
s to the
> > virtio-GPU driver in the guest, which I=E2=80=99d prefer to avoid.
>=20
> IMO it would be helpful if you (or someone) could write the full
> specification of how VirtIO GPU is supposed to work right now (with
> the KVM model I assume?) as it would be a good starting point to
> provide suggestions about how to make it work (or adapt it) on Xen.
>=20
> I don't think the high level layers on top of VirtIO GPU are relevant,
> but it's important to understand the protocol between the VirtIO GPU
> front and back ends.

virtio-GPU is part of the OASIS VirtIO standard [1].

[1]: https://docs.oasis-open.org/virtio/virtio/v1.3/virtio-v1.3.html

> So far I only had scattered conversation about what's needed, but not
> a formal write-up of how this is supposed to work.

My understanding is that mapping GPU buffers into guests ("blob
resources" in virtio-GPU terms) is the only part of virtio-GPU that
didn't just work.  Furthermore, any solution that uses Linux's
kernel-mode GPU driver on the host will have the same requirements.
I don't consider writing a bespoke GPU driver that uses caller-allocated
buffers to be a reasonable solution that can support many GPU models.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--HOhfUfe+b94jgfrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZwUToACgkQsoi1X/+c
IsFx8w//Zb9R/oVB59xhbuzGwRZYVLeY9sIIdo92vOu8ogQ9JesHGLoVL5HIgGEk
9BYi+u6DehaEdR27/13hd0M1cg88RLkLwQqYRn6DSKpCP2eqhAwX8s2sDSOqULef
cC8ZsH6Cm2LCIlRiRwX0vy5Tty1EhdBtd09cZx8YAv0EmzTrEKef7sCZIc9QbVWv
XRgQzRKKPLVNIjwt/u9+cVESe9IvWJhnGMJ3ltv/JJjTZNnqEswwy76e/BlCbtwc
JFVIVKrt2He5mD1Eg9DyLsDEgt0xFSh7m72bOMGQx1W9NVHAQBWkU8z5q5VK9RlP
v0nl8ndZb2ylpTswX0iTTSF3mjRsmmbi4VsXQIOPF/Ssme6PgRc0Ax6H6ryy/LHJ
GETfCE1+VZRKnOfkzi63gw5cx7bzycXOECPzc9ofWzOMkQtUzcSZ3POOBTn5wZWi
Gw2+yeEvPDHnSZevlO2iz9tRNpwilYNS23CsJ4enkt/oaneCZByLJN08wIpDA5QV
0iufE78UrRATTclMmEoZGTp5bRpfBUZhux46mG0bOG5mQS/0wVh+zQuolXCKgTAm
oXKDSByzYInswrS3KoHubCrxIkjvcS+6NhVBmHfTYnGOptIRl5laSjeE5sZ3L9G6
Qmefux05LGVEAWXwGuiIpRnWBXQQJbJRkkCdrRAINN2GGm5uP/c=
=6EsX
-----END PGP SIGNATURE-----

--HOhfUfe+b94jgfrk--

