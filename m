Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 649A34545D5
	for <lists+xen-devel@lfdr.de>; Wed, 17 Nov 2021 12:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226786.392036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJHf-0000AS-Ts; Wed, 17 Nov 2021 11:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226786.392036; Wed, 17 Nov 2021 11:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnJHf-00007u-R0; Wed, 17 Nov 2021 11:39:23 +0000
Received: by outflank-mailman (input) for mailman id 226786;
 Wed, 17 Nov 2021 11:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAWr=QE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1mnJHd-00007o-Lu
 for xen-devel@lists.xenproject.org; Wed, 17 Nov 2021 11:39:21 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff9d7d0f-479a-11ec-a9d2-d9f7a1cc8784;
 Wed, 17 Nov 2021 12:39:20 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BA4AF5C0209;
 Wed, 17 Nov 2021 06:39:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 17 Nov 2021 06:39:17 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 06:39:16 -0500 (EST)
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
X-Inumbo-ID: ff9d7d0f-479a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=0RS0wq
	3UVF21owVzpJPXyb1ecifh7eOPcXxp4IMIN9U=; b=MB6ugb/xp5EggALjbeQHpc
	Jz12O7Tpw/EJqclxW1W/gL9eGGPeReCwbj9CxGRCZJYhJzH18KJ1+xz8114FfK0N
	c/umHrFhv26Dxuen4rcEXKz8sFoFO2w7SP54mFEkueG8rlwK5ZPVtItaBBY3DWzI
	iBEbs0PSd+rOCG7vvpgUo42o19nlQzFq1JKe/gyb5PsvSVPdot70HdOt2lPSzA66
	/p7+xNXlvP/4OiN7gVNby+k3li6B46qpOwTcpKm94atgEmSDwGCobuo/V5TFZw+W
	Iq+kE1dpCUePHtjR/ULWVr8cBJErX1IpzmgAldwnnPKiK+jgd59Lllj+N0QWRuFw
	==
X-ME-Sender: <xms:5emUYVlMewQOpyTDwYSft8n1DZcS__jaYN12grLdE0q_cuMk4U3Czg>
    <xme:5emUYQ2UGYdyCDr6b9VqCvFhqVnwZNSrVooV6GXZU3P7ZWR_yF-obt95EH4WzWhKv
    OlghyT8FDyAKg>
X-ME-Received: <xmr:5emUYboPRDov5Y5N0lG73EyAv4IWKI0WrAuJWQy5lhuuu5q2oSuT-Cy28vyQqVkW2eDRiTxh10NYGzyXlSUYuwQ9rWsqOcbH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggddvhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:5emUYVk6dwVN1Hm9sBMufNX3l9GXuQrMJ6gWWiFViBP7LjHGN6uB4g>
    <xmx:5emUYT2Sf6Z49RdN2QRxG_bf5d7qEKjbZ-zg4sFmr_n09mj7RSC7lA>
    <xmx:5emUYUuu1riAlhaLHiKqIVVc8YFGQfu4aVJ4BIo0M0p9I_RApR8gXw>
    <xmx:5emUYc_Xz5Lvml2Yl8innrbanL2KECoMsbWmxPXCOsy9PxGhy5NB8A>
Date: Wed, 17 Nov 2021 12:39:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH for-4.16 4/4] tools/python: fix python libxc bindings to
 pass a max grant version
Message-ID: <YZTp4Oi1EDEyk0Jd@mail-itl>
References: <20211115121741.3719-1-roger.pau@citrix.com>
 <20211115121741.3719-5-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0rDW33ZUHJNBZ5CD"
Content-Disposition: inline
In-Reply-To: <20211115121741.3719-5-roger.pau@citrix.com>


--0rDW33ZUHJNBZ5CD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Nov 2021 12:39:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH for-4.16 4/4] tools/python: fix python libxc bindings to
 pass a max grant version

On Mon, Nov 15, 2021 at 01:17:41PM +0100, Roger Pau Monne wrote:
> Such max version should be provided by the caller, otherwise the
> bindings will default to specifying a max version of 2, which is
> inline with the current defaults in the hypervisor.
>=20
> Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Cc: Ian Jackson <iwj@xenproject.org>
>=20
> Without this fix the python bindings won't be usable, as they will
> attempt to pass a max version of 0 which will be refused by the
> hypervisor. The main risk would be breaking the bindings, but given
> the current state it's unlikely to result in a worse outcome.
> ---
>  tools/python/xen/lowlevel/xc/xc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index 6293d205a3..fd00861032 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -116,7 +116,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
>                                      PyObject *args,
>                                      PyObject *kwds)
>  {
> -    uint32_t dom =3D 0, target =3D 0;
> +    uint32_t dom =3D 0, target =3D 0, max_grant_version =3D 2;
>      int      ret;
>      size_t   i;
>      PyObject *pyhandle =3D NULL;
> @@ -132,12 +132,13 @@ static PyObject *pyxc_domain_create(XcObject *self,
>      };
> =20
>      static char *kwd_list[] =3D { "domid", "ssidref", "handle", "flags",
> -                                "target", "max_vcpus", NULL };
> +                                "target", "max_vcpus", "max_grant_versio=
n",
> +                                NULL };
> =20
> -    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "|iiOiii", kwd_list,
> +    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "|iiOiiii", kwd_list,
>                                        &dom, &config.ssidref, &pyhandle,
>                                        &config.flags, &target,
> -                                      &config.max_vcpus) )
> +                                      &config.max_vcpus, &max_grant_vers=
ion) )
>          return NULL;
>      if ( pyhandle !=3D NULL )
>      {
> @@ -162,6 +163,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
>  #else
>  #error Architecture not supported
>  #endif
> +    config.grant_opts =3D XEN_DOMCTL_GRANT_version(max_grant_version);
> =20
>      if ( (ret =3D xc_domain_create(self->xc_handle, &dom, &config)) < 0 )
>          return pyxc_error_to_exception(self->xc_handle);
> --=20
> 2.33.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--0rDW33ZUHJNBZ5CD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmGU6eIACgkQ24/THMrX
1yxO2Af/aJVdiZMEMieXT7yDPb/DZEwyZLGU7yDoWJOO0IgeQYc3NNMdrM1SnBk3
AgmMX4nQmgm6//JILO0myveXJAncvXIHF9nfKHYQC41InQ2yYC+bUzpqvdc5ID2E
KURX9Z6cgvqNORcVlg3fCB3bXYVAUzLPvDJAfXxT4lU9PrM4lhg5KsjUaTWQQcBC
LNdrLki8Q4QBZ36M8+VLOF1EtjYQnVGHf6gDv4FTaFMknZj26UdQaCktMw0gZylU
2hEqydV8Tyj6vi00uNkfG+rTANnGdP5kjHmIsZGbg05H/CrpeiKOlg4cO9oAb90v
7qdLwq9tHLNSJkOf+JaYyw08gE+hFg==
=0aMq
-----END PGP SIGNATURE-----

--0rDW33ZUHJNBZ5CD--

