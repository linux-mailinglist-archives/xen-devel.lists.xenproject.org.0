Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988125EA6F9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 15:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411799.654867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oco0y-0003OK-AK; Mon, 26 Sep 2022 13:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411799.654867; Mon, 26 Sep 2022 13:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oco0y-0003Lt-6m; Mon, 26 Sep 2022 13:19:16 +0000
Received: by outflank-mailman (input) for mailman id 411799;
 Mon, 26 Sep 2022 13:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uAtp=Z5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oco0x-0003Ln-Kb
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 13:19:15 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfc037d4-3d9d-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 15:19:13 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id AA2165C0129;
 Mon, 26 Sep 2022 09:19:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 26 Sep 2022 09:19:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Sep 2022 09:19:11 -0400 (EDT)
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
X-Inumbo-ID: cfc037d4-3d9d-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664198352; x=
	1664284752; bh=sPBLOFIkGQvztxe4BRzooD8nSugrb0zHKtg4O8Ots8g=; b=a
	gnmJhaDghaRrRNQyB25SnbDn2va70PHs9o3Q8YVP/Aet+BKdpshPAymMXj5k/MM6
	+a2TK80Y9WWJaA/V/zuoUD2lFPcHO5/cVNBTvHUX/RVTGu4VvNolsr/6BGtJB7+h
	2Cl60OBBjIysPirX6vtdhjodaywjbpRKokcOpT/NT1aRUjLPUVdQLan2EOcPnNXj
	pndx1P73MOjSSUAmbOV+P8XY70Yl81+EZhmutFaKuvrBC3dGi+emrg8/nhzKoc6Y
	xD3lOTpCrVaEz570TuZIoacmGQ1QDbaBOB9D5UZU/L0S/+EXNdzVvKE86PBISjoC
	fFd7uhJLOztd+k5nR2r0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664198352; x=1664284752; bh=sPBLOFIkGQvztxe4BRzooD8nSugr
	b0zHKtg4O8Ots8g=; b=jnrw14nMfJPfn5SMHmJE5q9XNZz5x6FRRMthUYl1Irmj
	eLHPrDKYJPYdnKtR/whBsz7UTiw6S9y+dvP71B6V4qB2VsR3ut9SKBjL4r5LUzoP
	QaycIVAWqmsBJlMvw111lBfixLiKJNbdU/x9+wrkuLUYPXG6rBuT7nLHcTfP1ILe
	APD87BpxblK8Kevyemx9xpZxb1Dv14zf4NxB/Lud4BvscwvortWIBmQuuhcWSs0+
	hOSdZTwhqqhfabJoJyhYJL/qZFbTwz96vyHIrnC4owZswQn+kw68OsD9Vn/HN6Dh
	6Yqyp56QlBM4qx1qUWAi26FRkXs/c6vFXDt7+HYCXA==
X-ME-Sender: <xms:0KYxY0Mi362BVQ0sMpHU0SApSJlvEJ8YuudrREj58QvrtRlTaahmow>
    <xme:0KYxY6_kg3h9gUdO3QTq0M_ShcrYWG6O_X-bh3-D3Pqrr1rins12X012uQG_U7hlJ
    EjoiIf6OdTMAQ>
X-ME-Received: <xmr:0KYxY7TwUVrVJnE-uSviJGqo91vuSAbyLOdNdVFAhbcqrSMqipZymZId70sRMaZg_QNn72D2ZoPVA95v8g3Wt-oSPUqfSjt8B2vM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeu
    jeetgeelleetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomh
    grihhnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:0KYxY8ug-FU8cJ_PwDSQN0jdy7CsCX6QAsmWdpUGxtdGZOg9YRswEA>
    <xmx:0KYxY8ecunwIMPAEVXFd8H4jIZ7GM2B1sLlJRRT27ztL0uvg2WN9rQ>
    <xmx:0KYxYw0nql6Li37qt6FaoFx87Zx3gQqjtXQw6K40Ib5n1MGyaZWnmg>
    <xmx:0KYxY9rb-_kvEiaqZ0gil94ArR8W3PJ_Msn9rIFMo-oXJ049qe72NQ>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 26 Sep 2022 15:19:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17] CI: Force CONFIG_XEN_IBT in the buster-gcc-ibt
 test
Message-ID: <YzGmzAtI42VgfdLq@mail-itl>
References: <20220926130213.28274-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/5s/iqeUDXZK6d0Y"
Content-Disposition: inline
In-Reply-To: <20220926130213.28274-1-andrew.cooper3@citrix.com>


--/5s/iqeUDXZK6d0Y
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Sep 2022 15:19:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.17] CI: Force CONFIG_XEN_IBT in the buster-gcc-ibt
 test

On Mon, Sep 26, 2022 at 02:02:13PM +0100, Andrew Cooper wrote:
> buster-gcc-ibt is a dedicated test to run a not-yet-upstreamed compiler p=
atch
> which is relevant to CONFIG_XEN_IBT in 4.17 and later.
>=20
> Force it on, rather than having 50% of the jobs not testing what they're
> supposed to be testing.

Shouldn't this job be with a static (or rather: all yes) config?

> Fixes: 5d59421815d5 ("x86: Use control flow typechecking where possible")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Henry Wang <Henry.Wang@arm.com>
>=20
> For 4.17: This is bugfix to CI only, to avoid it producing a false negati=
ve.
> Currently, the test intermittently fails to spot the error it was intende=
d to
> identify.  It is very low risk as far as the 4.17 release goes.
>=20
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/3084774561#L373 =
for
> proof that CONFIG_XEN_IBT=3Dy is being fed into allrandom.config
> ---
>  automation/gitlab-ci/build.yaml | 2 ++
>  automation/scripts/build        | 5 +++++
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build=
=2Eyaml
> index 720ce6e07ba0..65e06c858ef3 100644
> --- a/automation/gitlab-ci/build.yaml
> +++ b/automation/gitlab-ci/build.yaml
> @@ -299,6 +299,8 @@ debian-buster-gcc-ibt:
>    variables:
>      CONTAINER: debian:buster-gcc-ibt
>      RANDCONFIG: y
> +    EXTRA_FIXED_RANDCONFIG: |
> +      CONFIG_XEN_IBT=3Dy
> =20
>  debian-unstable-clang:
>    extends: .clang-x86-64-build
> diff --git a/automation/scripts/build b/automation/scripts/build
> index 2f15ab3198e6..2d9dd86df904 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -12,6 +12,11 @@ cc-ver()
> =20
>  # random config or default config
>  if [[ "${RANDCONFIG}" =3D=3D "y" ]]; then
> +
> +    # Append job-specific fixed configuration
> +    [[ -n "${EXTRA_FIXED_RANDCONFIG}" ]] &&
> +        echo "${EXTRA_FIXED_RANDCONFIG}" >> xen/tools/kconfig/allrandom.=
config
> +
>      make -j$(nproc) -C xen KCONFIG_ALLCONFIG=3Dtools/kconfig/allrandom.c=
onfig randconfig
>      hypervisor_only=3D"y"
>  else
> --=20
> 2.11.0
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/5s/iqeUDXZK6d0Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMxpswACgkQ24/THMrX
1yy8MQf8DDHXnZXaO7X33RfsqJaEkaiuU+lrmmAKRHKcdWK77Fl4W0nNdaxXBsKF
jC9wSRjo5vX5wn2ThsjgbaCcEgeauvRw9gXt2WljmeodkpZ84lYLLE80DlyWD8OT
zGJdjbPqauNgbchJwnbIgLEhOVGd4uuGxUjKPV0hhn8m+MfbfB62a1VoKDQML43+
BRnr45Jn3m2KFOqcUZvV1WwcGVcLWhZk7QcQg8ura+Rwyo6vhiP6d3AC7vQD3jR+
T2lUf2gtIe5M8bC6w+eSy+CaZltWehUo00TkO8Mo1nDh8jB26sh7EBgxsfnhMeVP
uN/kxLCTmg1rob41pUmljkRe5bhGuw==
=LwEb
-----END PGP SIGNATURE-----

--/5s/iqeUDXZK6d0Y--

