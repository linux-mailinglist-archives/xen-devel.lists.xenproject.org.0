Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0974090A0F1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 02:39:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741546.1148161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ0OQ-00069g-GN; Mon, 17 Jun 2024 00:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741546.1148161; Mon, 17 Jun 2024 00:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ0OQ-00067x-DC; Mon, 17 Jun 2024 00:38:42 +0000
Received: by outflank-mailman (input) for mailman id 741546;
 Mon, 17 Jun 2024 00:38:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Jjg=NT=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1sJ0OP-00067r-3U
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 00:38:41 +0000
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef10fbf6-2c41-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 02:38:37 +0200 (CEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfout.nyi.internal (Postfix) with ESMTP id 32A8613800DF;
 Sun, 16 Jun 2024 20:38:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sun, 16 Jun 2024 20:38:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jun 2024 20:38:35 -0400 (EDT)
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
X-Inumbo-ID: ef10fbf6-2c41-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1718584716;
	 x=1718671116; bh=buHh/g/ZcgkgzTrs9IOuh36gYSiy5F9j6JuWTipj/KU=; b=
	EKhVMkDZArlB22SdjBx2VDzLwk8U7Q32ZAul4dP18xR/pSp6ad+LDWt28ccs/p4O
	nbUk+3G282VeEPa/oX6+hQoAesAUHxau0ird7NaLAMOzR5pHs9NFK/YuODjb0q0/
	BH24uAhwNsml2icQv+X/IcDC107eJJgaZlkwd8w0arojS72rOrkASqmDSvmIcrUX
	s0tJDkKOUFXPMmvZq3LIbF1LB0sWno0+p0DJIWWHfB1+y3nrvK7Euntl6vHZkfMR
	Ec1+G8Rl+KZbrZU0ZzZq0F0SWnFTnOgFWJj0EmYLNRdGuXWTg5fEouv0YxF2CB6s
	A7ukuKyAiCgCC9tA1qbxKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1718584716; x=1718671116; bh=buHh/g/ZcgkgzTrs9IOuh36gYSiy
	5F9j6JuWTipj/KU=; b=FBy+aty2AcBZ5nMX/8ylG79aNLHk7L3DxwkUapEvepL+
	ddysaDcQRfyFQVFYNk/SFcZw5kZhWaKB3DrvXFm9oA52xRv9uEMVOMStYBcNLWlV
	zFopOYolSoqW5w5rVJckKJkWEo4Lu8UA4Av3sCRcSLhJta53RUgCB/IUcy5YLqPY
	DlhSzbSO5VIe6eQAcZfC3qOtD0Ub1DyiQxP2CCu2CPNuBScyEbmur0edsTvAUS2z
	djICsqGrpfvb/pJNFb1C108gqjj/dn0lz15X6WUj7Vl+/bFWWblCr4uIz1MsMSvE
	0GSclkgKA4URAguh0sCruzd37I4sZHkJY1WXx/fMBQ==
X-ME-Sender: <xms:i4VvZjA1jHBKLSN9wOtRhpc3S1kNV4vzybekT1DtsTVoUuwJerDrqg>
    <xme:i4VvZpjhsdOA6HovByvYSH_xQr_ReYKZSELL5Ptap6_bpv9FoJDgEObv52MoWt7lj
    3SqRhue2_XKQEc>
X-ME-Received: <xmr:i4VvZun167JVpdkErYf-UHbfkQHeHk4zqRe12r2ZsIZQlM3WuoWNgTrOj7aTT6GJToCf9iSKxTih7pYjVBFlySNg9kp51edKrBaqxjyP14ft-Esh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvgedgfeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:i4VvZlx2FjNBBDq_gssfpWZj_9nas5fJEeoZR4NZ_2DtRWTwlyaTzQ>
    <xmx:i4VvZoTR-g82EzePmGoYNbKHEbFyZxiF55y8XsBds-mWgzv0lhcuig>
    <xmx:i4VvZoZpnkQaHBcAVEXOvsHKsXgm0aIanIbh8a7GObJZt2j-g4R-3g>
    <xmx:i4VvZpTjZnj4u3OstGpmPuql78rruO3CfDhm0gfiinCNtEFLKy-8Jw>
    <xmx:jIVvZnFGMXHB4Xij1uSW9_fyC6WigPn2-Mk_PTvzWtXOLDXhbjb3LVYc>
Feedback-ID: iac594737:Fastmail
Date: Sun, 16 Jun 2024 20:38:19 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <Zm-FidjSK3mOieSC@itl-email>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <ZmwByZnn5vKcVLKI@macbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XjN9Y7EgndXGttCA"
Content-Disposition: inline
In-Reply-To: <ZmwByZnn5vKcVLKI@macbook>


--XjN9Y7EgndXGttCA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Jun 2024 20:38:19 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen

On Fri, Jun 14, 2024 at 10:39:37AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jun 14, 2024 at 10:12:40AM +0200, Jan Beulich wrote:
> > On 14.06.2024 09:21, Roger Pau Monn=C3=A9 wrote:
> > > On Fri, Jun 14, 2024 at 08:38:51AM +0200, Jan Beulich wrote:
> > >> On 13.06.2024 20:43, Demi Marie Obenour wrote:
> > >>> GPU acceleration requires that pageable host memory be able to be m=
apped
> > >>> into a guest.
> > >>
> > >> I'm sure it was explained in the session, which sadly I couldn't att=
end.
> > >> I've been asking Ray and Xenia the same before, but I'm afraid it st=
ill
> > >> hasn't become clear to me why this is a _requirement_. After all tha=
t's
> > >> against what we're doing elsewhere (i.e. so far it has always been
> > >> guest memory that's mapped in the host). I can appreciate that it mi=
ght
> > >> be more difficult to implement, but avoiding to violate this fundame=
ntal
> > >> (kind of) rule might be worth the price (and would avoid other
> > >> complexities, of which there may be lurking more than what you enume=
rate
> > >> below).
> > >=20
> > > My limited understanding (please someone correct me if wrong) is that
> > > the GPU buffer (or context I think it's also called?) is always
> > > allocated from dom0 (the owner of the GPU).  The underling memory
> > > addresses of such buffer needs to be mapped into the guest.  The
> > > buffer backing memory might be GPU MMIO from the device BAR(s) or
> > > system RAM, and such buffer can be paged by the dom0 kernel at any
> > > time (iow: changing the backing memory from MMIO to RAM or vice
> > > versa).  Also, the buffer must be contiguous in physical address
> > > space.
> >=20
> > This last one in particular would of course be a severe restriction.
> > Yet: There's an IOMMU involved, isn't there?
>=20
> Yup, IIRC that's why Ray said it was much more easier for them to
> support VirtIO GPUs from a PVH dom0 rather than classic PV one.
>=20
> It might be easier to implement from a classic PV dom0 if there's
> pv-iommu support, so that dom0 can create it's own contiguous memory
> buffers from the device PoV.

What makes PVH an improvement here?  I thought PV dom0 uses an identity
mapping for the IOMMU, while a PVH dom0 uses an IOMMU that mirrors the
dom0 second-stage page tables.  In both cases, the device physical
addresses are identical to dom0=E2=80=99s physical addresses.

PV is terrible for many reasons, so I=E2=80=99m okay with focusing on PVH d=
om0,
but I=E2=80=99d like to know why there is a difference.

> > > I'm not sure it's possible to ensure that when using system RAM such
> > > memory comes from the guest rather than the host, as it would likely
> > > require some very intrusive hooks into the kernel logic, and
> > > negotiation with the guest to allocate the requested amount of
> > > memory and hand it over to dom0.  If the maximum size of the buffer is
> > > known in advance maybe dom0 can negotiate with the guest to allocate
> > > such a region and grant it access to dom0 at driver attachment time.
> >=20
> > Besides the thought of transiently converting RAM to kind-of-MMIO, this
>=20
> As a note here, changing the type to MMIO would likely involve
> modifying the EPT/NPT tables to propagate the new type.  On a PVH dom0
> this would likely involve shattering superpages in order to set the
> correct memory types.
>=20
> Depending on how often and how random those system RAM changes are
> necessary this could also create contention on the p2m lock.
>=20
> > makes me think of another possible option: Could Dom0 transfer ownership
> > of the RAM that wants mapping in the guest (remotely resembling
> > grant-transfer)? Would require the guest to have ballooned down enough
> > first, of course. (In both cases it would certainly need working out how
> > the conversion / transfer back could be made work safely and reasonably
> > cleanly.)
>=20
> Maybe.  The fact the guest needs to balloon down that amount of memory
> seems weird to me, as from the guest PoV that mapped memory is
> MMIO-like and not system RAM.

I don=E2=80=99t like it either.  Furthermore, this would require changes to=
 the
virtio-GPU driver in the guest, which I=E2=80=99d prefer to avoid.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--XjN9Y7EgndXGttCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZvhYkACgkQsoi1X/+c
IsFL3w/+LBsUSGk/DJ2vcKSLsZTx6RXXBzVUVEy/cQ9Irx+j6O2zo+Eia0NSFhNf
PjZ0MgbveQNIznnIhlhPA1HzTmiLXyggr3aqPfneRLnxApf/FJZAetzTKZq3Lpxx
Rh8k7MTFwrjEqw1C/XFsDP3wvnhpnVbEv/s1l4kbodc0CnPLQ8uPo0bCt19t7TGZ
Y+0vG6cAQ3dXwmuf39P14CsxqhnAWroqPmOdoQVb4VKJIfLBTMHh5QrzhrNWZbQd
tWxeSk4unq1j6crV5Zpy6FaBKX1mIq498FhxYFcpTnToCrknSK8j33ObDG3WFEPd
/k4HYJk0CTwv2XEKvL9mhPwBB7JzuAGPuNbgECtUiRGWQai2nVFPmeKld1qgqab7
37LfSnoT3wE64yQIngCc02xdT+zHdxLfMOy4Mzp+cTRl9qbA1W0GFbDF7PyMDUHk
1VM7f3Ij9mbSJjNf6NergKUmIC3ALDq7jnVxDAKQKRxtM3oZSYUNpvHpZnv8SVng
SkXShQcVnXFqxAE1iay6cCe7QEutyVTifcpVlp31+1DHxYb6b8xbxC7exPUn2vbB
DWCvbdJFQpBZLHEXbVTNbMPGbtvxJbStNx+ooYguRMkGfsJ9oB6+t3zahDxV+vl2
wIvP2obafKGq9wJYA2byyc4i11PqgomKGsTRl2n8vE3Hrz7JzcU=
=KfvV
-----END PGP SIGNATURE-----

--XjN9Y7EgndXGttCA--

