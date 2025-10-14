Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C656FBDAB0A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Oct 2025 18:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142974.1476864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8iBx-0006br-UY; Tue, 14 Oct 2025 16:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142974.1476864; Tue, 14 Oct 2025 16:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8iBx-0006ZJ-Ru; Tue, 14 Oct 2025 16:48:05 +0000
Received: by outflank-mailman (input) for mailman id 1142974;
 Tue, 14 Oct 2025 16:48:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7Gn=4X=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v8iBw-0006ZD-KF
 for xen-devel@lists.xenproject.org; Tue, 14 Oct 2025 16:48:04 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8994a742-a91d-11f0-980a-7dc792cee155;
 Tue, 14 Oct 2025 18:47:58 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 0395EEC01F6;
 Tue, 14 Oct 2025 12:47:57 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Tue, 14 Oct 2025 12:47:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Oct 2025 12:47:55 -0400 (EDT)
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
X-Inumbo-ID: 8994a742-a91d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1760460477;
	 x=1760546877; bh=EhZBZ3He7/F6ChSG/njRUNoZ9gnTdEW7VFkgsZjwsq4=; b=
	W2Cg+3A+J3qHVcSMXLOLhl+rCbFAnJ7pOkjHRWv46zoQMaJiSWcbLHMn9jUrJre5
	K0hBT0giCLcE/lJqSTBVYpjndUvh7kQoksxQLuCkRvVkoxJhRXvHuthl6gjay6tF
	gF5WXHNwvPEbjNKdayeaGTBdKDUC5b7Jh59pdN3vfjE3v2hnc2VB9V0MDNJrNX/C
	dwUmQbZTp8gwurYN3bCWW57VSY5OcE8qxSSCFcL8NDScFNy4FtlTHv+SLyDUUU33
	AcRvLW7zYAoOvSNxmzCDQH2GVv+vOYEMv83mVsKEDKY+k+dqi6WOo0D6Vp1ySJJy
	urbhyQZ3NZ7sMX8iblNEfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760460477; x=1760546877; bh=EhZBZ3He7/F6ChSG/njRUNoZ9gnTdEW7VFk
	gsZjwsq4=; b=mvC9UTTU/UUen7skGrFVRvSSmwfZDn4tt3evYfHs8abKPLFfj3/
	jgsrHxPgEgbrJKvvgeoFJw3tKt341r3EF/g+VeJGIGAuZIO3ZN4XiVbb0Kx+oDWi
	oj6HkLwBH6jc/XTW4wJqOlAKrQQDIl6sJgD/KH3doSrVmOy548jSxSnfvG4uSjXf
	BwTJGmUIc9K6C8No0NNswypSiu71VujglLnpXkQGCklXeFvIAsFO3sYgp7tgJh9/
	61WJQJo38r086PpQ+fzdR+gjYzArH0veZAadTfyQUdDadqS8Ls85PNLFSfn41Ijt
	hdEWnmiiOqCASSvpgZW7emA8Z0sVyqYfdoA==
X-ME-Sender: <xms:vH7uaEZSO5eiwcvm47OpAymBgR1sfhBGEasC3QxIH_6YfBbJPfnHUw>
    <xme:vH7uaGTS4VfbGxd6rryijYxzCo1gIBMb2eBPqVjmAFmJG_s8A1tnKk4xCX08JGeqN
    2Lu57vpRNG3QRInPBt8dnoOzCueKDkO3dNjP3bjNVHie7yH9Q>
X-ME-Received: <xmr:vH7uaHT_bp2VGdykn8_AKBht1RYw3o85y0DfpfXgp1AkMx5edsjPKWUDng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduvddutdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegt
    ihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvg
    hnphhrohhjvggtthdrohhrghdprhgtphhtthhopehgvghrrghlugdrvghluggvrhdqvhgr
    shhssegtlhhouhgurdgtohhmpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhush
    hsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepohhlvghkshhiihdrkhhurhhotghh
    khhosehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:vH7uaKQmVl7TgH54Ek3CmmMv9fA-rgVhYZ4X2_CZRF_d7OfijDaxaQ>
    <xmx:vH7uaM6Iq51IS9Yd1IxjEXG_f9qkYecL_KJi0ARlkv998uNtb1oXlw>
    <xmx:vH7uaG2t1gSMPhFTvZQEgG0XsOYOahCa2EGm55lFAVdDw0oTBsGxSQ>
    <xmx:vH7uaHAN7avA7_dzRgTdRhzV3F9IgSuRIEEAQ7DBsfHt2XUe2CmhHw>
    <xmx:vH7uaPvRy6qiumWFGFTVZFyOBQIFSnZPZaUKvBQ3xG_Xz_DufJ35jcCQ>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 14 Oct 2025 18:47:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 v2] efi: Protect against unnecessary image
 unloading
Message-ID: <aO5-ubXGM-u9efiT@mail-itl>
References: <20251014130648.2540082-1-andrew.cooper3@citrix.com>
 <aO5QMFtLpC819kbZ@mail-itl>
 <7a206259-3eb7-4b0c-8437-78579931e56b@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3kovRaEOd6+zXfdI"
Content-Disposition: inline
In-Reply-To: <7a206259-3eb7-4b0c-8437-78579931e56b@citrix.com>


--3kovRaEOd6+zXfdI
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Oct 2025 18:47:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.21 v2] efi: Protect against unnecessary image
 unloading

On Tue, Oct 14, 2025 at 04:57:15PM +0100, Andrew Cooper wrote:
> On 14/10/2025 2:29 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Oct 14, 2025 at 02:06:48PM +0100, Andrew Cooper wrote:
> >> From: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> >>
> >> Commit 59a1d6d3ea1e introduced Shim's LoadImage protocol and unloads t=
he
> >> image after loading it (for verification purposes) regardless of the
> >> returned status. The protocol API implies this is the correct behaviour
> >> but we should add a check to protect against the unlikely case this
> >> frees any memory in use.
> >>
> >> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
>=20
> Thanks.
>=20
> > with one comment below (I'm okay with the patch either way)
> >
> >>      EFI_SHIM_LOCK_PROTOCOL *shim_lock;
> >>      EFI_STATUS status;
> >>      bool verified =3D false;
> >> @@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDL=
E ImageHandle)
> >>              verified =3D true;
> >> =20
> >>          /*
> >> -         * Always unload the image.  We only needed LoadImage() to pe=
rform
> >> -         * verification anyway, and in the case of a failure there ma=
y still
> >> -         * be cleanup needing to be performed.
> >> +         * If the kernel was loaded, unload it. We only needed LoadIm=
age() to
> >> +         * perform verification anyway, and in the case of a failure =
there may
> >> +         * still be cleanup needing to be performed.
> >>           */
> >> -        shim_loader->UnloadImage(loaded_kernel);
> >> +        if ( !EFI_ERROR(status) || (status =3D=3D EFI_SECURITY_VIOLAT=
ION) )
> > So, just in case of double-buggy firmware, check loaded_kernel here too?
>=20
> So to be clear, you're asking for:
>=20
> loaded_kernel && (!EFI_ERROR(status) || (status =3D=3D EFI_SECURITY_VIOLA=
TION))
>=20
> here?=C2=A0=20

Yes.

> Yeah, can fix that up on commit.
>=20
> ~Andrew

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3kovRaEOd6+zXfdI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjufrkACgkQ24/THMrX
1yxB0gf/dxfJ/Ics2rhj1DbUEEEoPdTjtdxwWum0Cl113ApglwgdvkwJMsDmKS6f
u0e+SZsx6itn7T7/VLG6y9klzn4wijh8To84OOQKH8+2GPXCrf4/jDQNUz70TWyb
0EsbqYKP2a+rSDJuBD1TW28dvwRI/jw05zuGvc+EhOiOZd0sFAL08JAgUQsb5Pia
jZmqQPKX5LDmTDolQXJoih+VybJCu39ed7Fc64XnoC6p0gsYctDoH6oCGr9MpUrF
6RRwCjW7vVcchXxgvREkVnBb0vBUnYQX0Mi9DG2o62IQjrdHu5xSfkR9zrBFYICO
ndrwn+FrAh4rhLKSc+iCFldw6xgDaA==
=X4gi
-----END PGP SIGNATURE-----

--3kovRaEOd6+zXfdI--

