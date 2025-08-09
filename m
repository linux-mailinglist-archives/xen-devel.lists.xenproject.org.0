Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5EFB1F56A
	for <lists+xen-devel@lfdr.de>; Sat,  9 Aug 2025 18:23:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1076047.1437773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukmME-0006E5-Dp; Sat, 09 Aug 2025 16:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1076047.1437773; Sat, 09 Aug 2025 16:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukmME-0006CF-B6; Sat, 09 Aug 2025 16:23:46 +0000
Received: by outflank-mailman (input) for mailman id 1076047;
 Sat, 09 Aug 2025 16:23:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNAa=2V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ukmMD-0005fV-1n
 for xen-devel@lists.xenproject.org; Sat, 09 Aug 2025 16:23:45 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 372cd2e7-753d-11f0-b898-0df219b8e170;
 Sat, 09 Aug 2025 18:23:43 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 97D7FEC0225;
 Sat,  9 Aug 2025 12:23:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Sat, 09 Aug 2025 12:23:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Aug 2025 12:23:41 -0400 (EDT)
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
X-Inumbo-ID: 372cd2e7-753d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1754756622;
	 x=1754843022; bh=F0Ky5wS2PJkSBI2nzoISIIw4CjXdEK0f4y24qO0QVzY=; b=
	MRPC8DJKTKOTBFmqxh2y22cd67UENz6tYpzNhxnADruL450/mxDpkqlcrJT1XlNP
	fi0My4xQS8TfagAJzgkBBN10UwJYn5c25QMsMD9V/YLsJVIdQTI4aDXhEx3mgr0G
	LQSHPnJR19zP6X6X/opoVHSYVsG45TpOvUvbDTSoi8DylLTUb+a08sJy9Er76E3/
	BPQ1UEv2bAYo1obxeBfKOLiU2LxbacfTB7AGtnUYC+96lX5NdiZhSV0fnYMVpumb
	ztfKZaObt5uXSzBkzruCDyZ2mNRvEg9mNSVNEXBndST3QOSOryMJwiJD79mDYSuj
	Tc9j5M7FND2xKgEohBcZ6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1754756622; x=1754843022; bh=F0Ky5wS2PJkSBI2nzoISIIw4CjXdEK0f4y2
	4qO0QVzY=; b=a5upKmTyEL/EtX0uYU9+mwwG13Dg8cRmNisoJqZ2QRzaXkPeQYA
	Xyvba7+t79h8oB5HfcMbz7xHp6XADk34CnGjPKMr3nv4ElXZGaaT60yDeC+LdHZU
	MZcHjq4EQwqlHzOP9rnB4+/2yFJ+UQvr4QkLKfmpV2TS1xoTLj8h/BGMWCfzrMYj
	tiDWLJoyzZnCNQul68Ggh9GafqbMNO2LF6wOc37DIc4Rw3P6P1QgFtUJ/JYWWEjc
	ROr+3Ug+QBwDFSj9ugj4bsZvKkO47qLxKNxGuTg4dN/H4boLXcJqjEa+uMPxRk4G
	u91nz3ZZjYw3+m6B7GWoNdr/9H54UDLdvvQ==
X-ME-Sender: <xms:DnaXaLq60bdfejceYDqHdhUeQqD2CR3LsrW1ffbjCSC0teDS4MFYBQ>
    <xme:DnaXaO8MdQUkrAkn-3pWdIFDxOsCUjmNAdz_Uix7lRH7GpbZoSJqb3A0g_qCoGNKC
    9IqgpmUSeYp8Q>
X-ME-Received: <xmr:DnaXaPcKPxHQKUmDPXNq3juC_k_wN5cRHwLnNLovMpp8ih16HmAvm6UMfMxa9SObWGhHTeY7OP7lvJj1oiLvfgJDKeFpOOr_sIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdejudeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepiedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnthhhohhnhiesgigvnhhprhhojhgv
    tghtrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprh
    hojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihht
    rhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvsh
    drthgvtghhpdhrtghpthhtoheptggrrhguohgvsegtrghrughovgdrtghomhdprhgtphht
    thhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:DnaXaAK0ldhihGmUdaQ-3jkSloFcmh_309v2HNacadG6FOEX6yC7AA>
    <xmx:DnaXaHjnV3MxaHX3x8A0-Wyz0pxBqwGO7xdWQVl_tX2xTSDjv3T-Lw>
    <xmx:DnaXaGRi0Ye9skqsMj3pKpFzMOin8hM5FVewQ4dQVTGfVOqPQ0sTWQ>
    <xmx:DnaXaJWYAEqBmPSVPtgD0EC3G_PGSJ7BiZ4ki-WYGJE1FG8o26gOtw>
    <xmx:DnaXaFHq4C-M7boZP4tmsfFuCZ1-n63hU1cZLDRj5ika1sHsHQE85NJz>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 9 Aug 2025 18:23:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 2/3] CI: Upload junit result as artefact
Message-ID: <aJd2C3tRE7aT9vdL@mail-itl>
References: <20250730152602.45436-1-anthony@xenproject.org>
 <20250730152602.45436-3-anthony@xenproject.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KkaOKcL73dj9wRBK"
Content-Disposition: inline
In-Reply-To: <20250730152602.45436-3-anthony@xenproject.org>


--KkaOKcL73dj9wRBK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 9 Aug 2025 18:23:39 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v2 2/3] CI: Upload junit result as artefact

On Wed, Jul 30, 2025 at 05:26:01PM +0200, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@vates.tech>
>=20
> This allows to investigate the junit file in cases of parse error.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>
> ---
>=20
> Notes:
>     Changes in v2:
>     - more concise patch description.
>=20
>  automation/gitlab-ci/test.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
> index 1f0b27b237..feb03cc7ed 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -155,6 +155,7 @@
>      paths:
>        - smoke.serial
>        - '*.log'
> +      - tests-junit.xml
>      when: always
>    rules:
>      - if: $SELECTED_JOBS_ONLY && $CI_JOB_NAME =3D~ $SELECTED_JOBS_ONLY
> --=20
> Anthony PERARD
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--KkaOKcL73dj9wRBK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiXdgsACgkQ24/THMrX
1yx91wgAgZ2/JmSBI0M7PLlRNyEPrzVlVmcPGpSeHWGmXFRpaG1A7VeP75zaj0W0
j4yJ4xVHflwibNDjA4lFID1NUY63EAkEmVrzWfTRGIFOGjlMXSNWetFaMM7zmOTj
bl/X/merGFGrQA0G1SQfyfwlpg1rWr+7oR1d6PvXGIPD4iMpeN3J4SdCUkyIyJo5
jpGQleSf3N+KIesTHZpEIItGMsrVWmDPh6OIVEtTbgfLO7qu2a3KgpN1t7sUVDF5
AytXLrcM4zOUHP2FIP1KBm0u8j7CknN/ZecSu1JVXxRjg/RybueX0EfMmFuNYgs3
pyOzTornGqp5/HqBZliYFzTA3QssFQ==
=1NpR
-----END PGP SIGNATURE-----

--KkaOKcL73dj9wRBK--

