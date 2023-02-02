Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43780687D6D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 13:39:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488797.757046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNYrL-0000zu-Tt; Thu, 02 Feb 2023 12:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488797.757046; Thu, 02 Feb 2023 12:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNYrL-0000xg-QK; Thu, 02 Feb 2023 12:38:35 +0000
Received: by outflank-mailman (input) for mailman id 488797;
 Thu, 02 Feb 2023 12:38:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BeXn=56=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pNYrJ-0000xa-LL
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 12:38:33 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e9cccc1-a2f6-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 13:38:30 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7AED05C01F8;
 Thu,  2 Feb 2023 07:38:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 02 Feb 2023 07:38:28 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 07:38:26 -0500 (EST)
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
X-Inumbo-ID: 7e9cccc1-a2f6-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1675341508; x=
	1675427908; bh=Nbhfetj4q7Jidpu3nEODg31NIwL6ONjLl92f2Tx9Dac=; b=U
	D8w4DFKgWjuvd5CiNES2LdbzrrC+l/Seeb7uh+ySiUZ1wivIAkZbpLGPTRDcbQke
	vP0T+Vq9VTOLp8oXvDvQXQ2rF6bMVIsuBcgIrB13eQs5YXWPebqlCivh7vv/FOW6
	LPX+h6yLJCZMFowFvug0QAgDnAfkccuHX+1YoY9VDbZXlMM/x00VLSYANy6XnkEH
	gqMGnc4Z/aXSxsFLDq7G8bxTYzEpaZMPl4BVUuF3E/SkIQWB9ar5D+x0xzrobgfw
	hZlRwD8HE1PrVVCk0cNo+Y30SQ9D/86Ny9pq4s6gIFpIYzl6bawty+hORUNC/Eep
	yuBWk5RBLzyU9ZNQXG+OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1675341508; x=1675427908; bh=Nbhfetj4q7Jidpu3nEODg31NIwL6
	ONjLl92f2Tx9Dac=; b=kEKsHklBDRdmNPsVStjFTVIWgXhd4AKph7hwrtJlxbNv
	iTX+uZpYbSON3/aH/B5EudLQGCWIyhjs1/PMI8Gip1kpVJBWFwRHFB7zVC2Yj5Ux
	FJIGG2oj1/3IGV703dj24eHS5HCtVdU/a9gOQQMvD7FJBgYjRtfpDx+x0SgF3eMC
	AynRBAVOdECoDq7VRsULeLTMqoHo61iB4XZYRIyWDdhX11ICOiX8Cp7pYJM6pj02
	/3GfT6D3WOngQPK37K353bmva0z94f3EJ24AAxtFvhtRlz/ByQF5001NzfzfDnwK
	a38W8ACdDTd2SldE6neYT3QlhNr4aL6ibXXbCylp0w==
X-ME-Sender: <xms:xK7bY3__2Xhu-07vp4HxlMBOImCyuJAZYsDlQUBM6m9uULNGUETN_w>
    <xme:xK7bYzv_Z0PIW7MNgyxS_H0JJwVgWAIKa2iUY1ISaivZrA6W1hsBNml3YjdfplknP
    k1YuYbyPtWnKA>
X-ME-Received: <xmr:xK7bY1AGW45WPtD7e-l7WTPWLNZLT1TDyR1ubTCVybdqZOXJEk6kJCQpv0mAl1GH6V7TzTy6lIL8VT0xOX1Zewlk1czQZPbdEug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhephfet
    udegleeuvdekudfghedufeekuefgffeukeejvdfgkeegtdehhfegueejteelnecuffhomh
    grihhnpehphihthhhonhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:xK7bYzf8ENvTD6aVRYFQK87Ro-M7eqjOaQ_Tu1Kr58pImSGnZoklQw>
    <xmx:xK7bY8ORzPl-znzMuQYvLurEajeeLMsssdtYw_2-uhqs_T00r_VAVg>
    <xmx:xK7bY1neuSGHtrT0fb6J9Q_hVFzx2-KcHJqfP2I7o7xsy5U7m6twtA>
    <xmx:xK7bY9giGO8XuqgfJfMteqrkbOHH_mfyw-EWkcgUGeOCbrOSetjAMw>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Feb 2023 13:38:23 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
	wei.chen@arm.com, George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: Re: [PATCH 08/10] tools: add SVE capability and SVE vector length
 for physinfo
Message-ID: <Y9uuv05ekRLW94CT@mail-itl>
References: <20230202110816.1252419-1-luca.fancellu@arm.com>
 <20230202110816.1252419-9-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BT18ovfx2ox7lBH2"
Content-Disposition: inline
In-Reply-To: <20230202110816.1252419-9-luca.fancellu@arm.com>


--BT18ovfx2ox7lBH2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Feb 2023 13:38:23 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
	wei.chen@arm.com, George Dunlap <george.dunlap@citrix.com>,
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: Re: [PATCH 08/10] tools: add SVE capability and SVE vector length
 for physinfo

On Thu, Feb 02, 2023 at 11:08:14AM +0000, Luca Fancellu wrote:
> Recent changes added in struct xen_sysctl_physinfo a new flag for
> arch_capabilities to understand when the platform is SVE capable,
> another field having the maximum SVE vector length in bits was
> added as well, so update the tools to handle these new fields.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from RFC:
>  - new patch
> ---
> This patch is mostly dependent on the decisions we make in the previous, =
anyway
> I touched some part of the toolstack where my knowledge is limited (ocaml=
) so
> I might need a feedback for something I may have done wrong.
> ---
>  tools/golang/xenlight/helpers.gen.go |  4 ++++
>  tools/golang/xenlight/types.gen.go   |  2 ++
>  tools/include/libxl.h                |  8 ++++++++
>  tools/libs/light/libxl.c             |  3 +++
>  tools/libs/light/libxl_types.idl     |  2 ++
>  tools/ocaml/libs/xc/xenctrl.ml       |  4 +++-
>  tools/ocaml/libs/xc/xenctrl.mli      |  4 +++-
>  tools/ocaml/libs/xc/xenctrl_stubs.c  | 17 +++++++++++++----
>  tools/python/xen/lowlevel/xc/xc.c    | 17 +++++++++++++++--
>  tools/xl/xl_info.c                   | 10 ++++++++++
>  10 files changed, 63 insertions(+), 8 deletions(-)

For the python part:

> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index fd008610329b..516fa57161a6 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -870,6 +870,11 @@ static PyObject *pyxc_physinfo(XcObject *self)
>      const char *virtcap_names[] =3D { "hvm", "pv" };
>      const unsigned virtcaps_bits[] =3D { XEN_SYSCTL_PHYSCAP_hvm,
>                                         XEN_SYSCTL_PHYSCAP_pv };
> +#if defined(__aarch64__)
> +    const char py_buildval[] =3D "{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s=
:s,s:i}";
> +#else
> +    const char py_buildval[] =3D "{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s=
:s}";
> +#endif

I don't like this #if for a different return format depending on the
architecture, especially when the underlying structure is in fact the
same (just not all fields are used for every arch). It would make adding
further fields unnecessarily error-prone.

Instead, you can do common stuff with Py_BuildValue and then add
architecture-specific stuff with PyDict_SetItemString:
https://docs.python.org/3/c-api/dict.html

>      if ( xc_physinfo(self->xc_handle, &pinfo) !=3D 0 )
>          return pyxc_error_to_exception(self->xc_handle);
> @@ -893,10 +898,14 @@ static PyObject *pyxc_physinfo(XcObject *self)
>          for ( i =3D 0; i < ARRAY_SIZE(virtcaps_bits); i++ )
>              if ( pinfo.capabilities & virtcaps_bits[i] )
>                p +=3D sprintf(p, "%s_directio ", virtcap_names[i]);
> +#if defined(__aarch64__)
> +    if ( pinfo.arch_capabilities & XEN_SYSCTL_PHYSCAP_ARM_sve )
> +        p +=3D sprintf(p, "%s ", "arm_sve");
> +#endif
>      if ( p !=3D virt_caps )
>        *(p-1) =3D '\0';
> =20
> -    return Py_BuildValue("{s:i,s:i,s:i,s:i,s:l,s:l,s:l,s:i,s:s,s:s}",
> +    return Py_BuildValue(py_buildval,
>                              "nr_nodes",         pinfo.nr_nodes,
>                              "threads_per_core", pinfo.threads_per_core,
>                              "cores_per_socket", pinfo.cores_per_socket,
> @@ -906,7 +915,11 @@ static PyObject *pyxc_physinfo(XcObject *self)
>                              "scrub_memory",     pages_to_kib(pinfo.scrub=
_pages),
>                              "cpu_khz",          pinfo.cpu_khz,
>                              "hw_caps",          cpu_cap,
> -                            "virt_caps",        virt_caps);
> +                            "virt_caps",        virt_caps
> +#if defined(__aarch64__)
> +                            , "arm_sve_vl_bits",  pinfo.arm_sve_vl_bits
> +#endif
> +                            );
>  }
> =20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BT18ovfx2ox7lBH2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPbrr8ACgkQ24/THMrX
1yzfCwgAmpkAq19Pvn0kVPjPK954zXeSLHlrmqHavsUyhd9gCly+GRdGWJu1Q70o
CCm03amB/4peUPWhJIlGvmriQYxfcv4XeLAq8ONBtpCcv6FYjtUALthag0YUEgfx
EM1Jg949vBhb59MDXxELvCjs5lMf51NC64Rf2M0KoHpvnKn1DiVvorCilY2Lhwyl
MQm/FbXu5aB5emwtHqclCT52FJh2+ml6Q3IRC/Z51PyKmFFdb3bU0Xf3R3lfTGqE
dU2TJ1kMJoxJWbIxW/GkFmW7HsdDUNoURFpZWEi7xlJlwzeMSZmYY3KL6gtk4wCc
HPEVUY3H6+R7H5NTWtaZL+Npi67AsA==
=32B2
-----END PGP SIGNATURE-----

--BT18ovfx2ox7lBH2--

