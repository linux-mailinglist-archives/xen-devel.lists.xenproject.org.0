Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572AE9413E3
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 16:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767838.1178550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYnVs-0000li-B9; Tue, 30 Jul 2024 14:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767838.1178550; Tue, 30 Jul 2024 14:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYnVs-0000kG-8c; Tue, 30 Jul 2024 14:07:40 +0000
Received: by outflank-mailman (input) for mailman id 767838;
 Tue, 30 Jul 2024 14:07:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VcTV=O6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sYnVq-0000kA-A0
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 14:07:38 +0000
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1155433b-4e7d-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 16:07:35 +0200 (CEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 2D0091140263;
 Tue, 30 Jul 2024 10:07:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 30 Jul 2024 10:07:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 30 Jul 2024 10:07:30 -0400 (EDT)
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
X-Inumbo-ID: 1155433b-4e7d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1722348452;
	 x=1722434852; bh=uKHshXpn6NI2xQebeGvvJ2qkNlgLstN4wWpO+I1oe5Y=; b=
	CE1z8s1OVNoJEeHC8qEfdNfwyFjN+t34BmQhcwQUOD3XmI1hb8gaOSwHkfOu/9F5
	O+MfEmSA0xccTGcRiM9NdDrBVbWyM7bCX+M3n/O5a87x9KAp8PhMf8X1uDP8OX4C
	2zUB1ZBMzdrkHtTcpD3gO9LWmghGdz7Hidca+SEfdWHd+QKugzqDlXq759mfUyzx
	vXwh5wNJs/ThcDBFvrg932R1flOMCodRvvwxMzVJP3Qwoc80RB/ugMx6xos1qUZn
	0MIAaiYc8MJR/3tm4XTW/GTo9BeTvbxf5qh7q2kmh25A/Wr+17wcgBQvv0bxyGX/
	FvUzMYWpUY0NmbEGVvL6oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1722348452; x=1722434852; bh=uKHshXpn6NI2xQebeGvvJ2qkNlgL
	stN4wWpO+I1oe5Y=; b=SyNw5hoTnpbJYmrvxCH0lufctfHBzBv2PgW1VHtulfTX
	0xOEv2Sh6Zy9iLdnZf4wWmhfk8LmN3gDmMC/mtdyo8ImaOCEZWOLepHKKHxNM3dD
	oqQZwc84eUnJUvoX58KLwI0gGnCB1HbUD5OdeEf7lkSNuqG2zbYbb+cPSuPsZDN3
	UD0xnkI5/jM89fHUB8sH9ByeZTm12gC2ADdgTXboCoJDE2VQsgiwFfVrgtJgVpbL
	zs7YOZM5EYpYsN5Q19mkoo0546Ax84IS/DojPjHpZ87Ph3hYD04uqfCBFpWC9VYT
	eARROWrlLNTGJ730OES938chgqdmzpjUP+qXK16WDQ==
X-ME-Sender: <xms:o_OoZj_ppMlTcaUROxrn08fz_cWWzEMym8G9ES9yhc75kH1Q9bPYxA>
    <xme:o_OoZvsF0PRh_mxudqBximuqUCAKoT9cy8LhoTNSKymZA1I7VtcsomW54wuVemcOo
    YydZ-Pol9uEJA>
X-ME-Received: <xmr:o_OoZhBmtkZuIOErBr2agpnmDgG_V12p2RfGW2oyoWAZ3b9uKkgDkjEWV44O4wS4kx5jKkIhmVKPAv8r8fitEQeqEEvXdLTNpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrjeeggdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevueej
    teegleelteduueevhfetgfffjeevtddvgfeiveehteehleegueelvdejveenucffohhmrg
    hinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomhdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:o_OoZvdA_zb4nPsPabJ7sJ5rJeMK5JGN6lscsp_PT_T-Ys0MeCy6bA>
    <xmx:o_OoZoNXBBEdqvU7HlEULMvd8MzfNPGb01uDHwzSuYwQeBwJe_erHQ>
    <xmx:o_OoZhmRI-24yNqskyvXQfXfq5VOWv1IxWZTMc7vaWOVKjMHgymtGQ>
    <xmx:o_OoZivPKtAaBVuZlf_x_0aYsX7-1wLxKHL0vyORY4cirKfTAirG_Q>
    <xmx:pPOoZtqg-Q1O1lchTHv_hW8MMW5-4dzgD93Oa9IOjhY-339GXUdhbrhb>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 30 Jul 2024 16:07:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, cardoe@cardoe.com
Subject: Re: [PATCH v2] automation: upgrade Yocto to scarthgap
Message-ID: <Zqjzn5eM0z0njNF2@mail-itl>
References: <alpine.DEB.2.22.394.2407261639190.4857@ubuntu-linux-20-04-desktop>
 <ZqjuvjUtmNU7Ud8g@mail-itl>
 <9be4e130-c202-459d-bd58-d589b72af1c2@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iJ85oLtDO3yPPPYw"
Content-Disposition: inline
In-Reply-To: <9be4e130-c202-459d-bd58-d589b72af1c2@citrix.com>


--iJ85oLtDO3yPPPYw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jul 2024 16:07:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, cardoe@cardoe.com
Subject: Re: [PATCH v2] automation: upgrade Yocto to scarthgap

On Tue, Jul 30, 2024 at 03:01:52PM +0100, Andrew Cooper wrote:
> On 30/07/2024 2:46 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Jul 26, 2024 at 05:19:42PM -0700, Stefano Stabellini wrote:
> >> Upgrade Yocto to a newer version. Use ext4 as image format for testing
> >> with QEMU on ARM and ARM64 as the default is WIC and it is not availab=
le
> >> for our xen-image-minimal target.
> >>
> >> Also update the tar.bz2 filename for the rootfs.
> >>
> >> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> >
> >> ---
> >>
> >> all yocto tests pass:
> >> https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1390=
081173
>=20
> That test ran on gitlab-docker-pug, not qubes-ambrosia, so doesn't
> confirm the fix to the xattr issue.

There is one on ambrosia too:
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7423043016

> Seeing as I'm going to need to rebuild the container anyway, I'll see
> about forcing this and double checking.

But double-checking is a good idea anyway.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--iJ85oLtDO3yPPPYw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmao858ACgkQ24/THMrX
1ywOfwf9HQDr0RUjsWdj4LEIzd4NYO37W909+DWxhXxUgjZi7TOYOsLsGviQin4w
uX2F3galFDT3XOtTc7+0/jP6Jn+hsI+AlICa2DFnocitP2MF2VUSAZLh9dWNJCO8
gdFmWw3E0ss1Yg8WZdTbg8TQ4QhNP4w8kA/zV/qBviQDv1m2xxf2E0RGCKytUNot
bnej+Ehk3DQGx+wu/AUVfCwyPjX0i4cOCJDTr77Y37ZpXKXknmdfDSJjtM7KB/kW
Tu3kDXh1jLyJ7FOM24USU6KaQkp6PIlEN5AsWTXzQTPMtjBquijtayBHz7lFH491
QhLZ/0ki6lJJG/jC7xW80zHS9GH0Bw==
=oVTx
-----END PGP SIGNATURE-----

--iJ85oLtDO3yPPPYw--

