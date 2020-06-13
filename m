Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEE71F8344
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2020 14:41:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jk5SI-00031u-0x; Sat, 13 Jun 2020 12:40:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhnu=72=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jk5SG-00031p-Q8
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2020 12:40:13 +0000
X-Inumbo-ID: 0536ec84-ad73-11ea-8496-bc764e2007e4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0536ec84-ad73-11ea-8496-bc764e2007e4;
 Sat, 13 Jun 2020 12:40:10 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BB06B5C00F7;
 Sat, 13 Jun 2020 08:40:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 13 Jun 2020 08:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7OL6su
 TazXlpOun+H6F6u+RY3HuJaKLFx6Mx6Htn88M=; b=nlMPAyhoQM3KZ4zV9F70UY
 OmLloAGAPI+PjtemNhLGzin0Ecraw9L9kTNM/RGN/8R1gBLib8YtVU9cxxnZF2cf
 qHVMHgo8LPgXoahcnACu1dgfPrkDVtLBCvfGqmCc2Iq8WDzVOZNYL6c7FrQiRZCs
 449b68BmUl61USioLJSbvJ9wUfRUleD+K5I+vcVOqy0toevQS0/QYooauizDkvl/
 34pRYE9nLvoDcyvzghKPHFXTXLoa1ILEr7Jzmd0pvZTmcFJwHowBMrgb/MHLE3bk
 ONeL7Dou76GZP9s1plTgGFOucLSD8KyCuEGmpblQVUQiA/2E9URC1UMwm43qrqJQ
 ==
X-ME-Sender: <xms:KsnkXuBQcr_tS6YDJgCkPf_b5MaRcGnE2XPZhTdZ2UeGpTq4eeeijA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeifedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeihedrfeegrdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
 gtohhm
X-ME-Proxy: <xmx:KsnkXojLy06DtPTChikYQbv_D2x2ZC40CTGGrP-FdlJZVMxjt9WUiQ>
 <xmx:KsnkXhkxYi5eCKSeMTCMYBPp85FnO3I_UVJZhfdjV4sEK2Iq-Dul1A>
 <xmx:KsnkXszJ2i2s4-g10KtMJS1FvDrEtGCWuvT6DXnHL3uFVT8WbUV0FQ>
 <xmx:KsnkXmPnGg5Mh0kKow45pKWjwtMaBfBVKhdS8W5m0HvfPg3p7EuhGA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D6BEC30614FA;
 Sat, 13 Jun 2020 08:40:09 -0400 (EDT)
Date: Sat, 13 Jun 2020 14:40:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH 1/8] vchan-socket-proxy: Ensure UNIX path NUL terminated
Message-ID: <20200613124007.GM6329@mail-itl>
References: <20200525024955.225415-1-jandryuk@gmail.com>
 <20200525024955.225415-2-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J+eNKFoVC4T1DV3f"
Content-Disposition: inline
In-Reply-To: <20200525024955.225415-2-jandryuk@gmail.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--J+eNKFoVC4T1DV3f
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/8] vchan-socket-proxy: Ensure UNIX path NUL terminated

On Sun, May 24, 2020 at 10:49:48PM -0400, Jason Andryuk wrote:
> Check the socket path length to ensure sun_path is NUL terminated.
>=20
> This was spotted by Citrix's Coverity.
>=20
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
>  tools/libvchan/vchan-socket-proxy.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-s=
ocket-proxy.c
> index 13700c5d67..6d860af340 100644
> --- a/tools/libvchan/vchan-socket-proxy.c
> +++ b/tools/libvchan/vchan-socket-proxy.c
> @@ -148,6 +148,12 @@ static int connect_socket(const char *path_or_fd) {
>          return fd;
>      }
> =20
> +    if (strlen(path_or_fd) >=3D sizeof(addr.sun_path)) {
> +        fprintf(stderr, "UNIX socket path \"%s\" too long (%zd >=3D %zd)=
\n",
> +                path_or_fd, strlen(path_or_fd), sizeof(addr.sun_path));
> +        return -1;
> +    }
> +
>      fd =3D socket(AF_UNIX, SOCK_STREAM, 0);
>      if (fd =3D=3D -1)
>          return -1;
> @@ -174,6 +180,12 @@ static int listen_socket(const char *path_or_fd) {
>          return fd;
>      }
> =20
> +    if (strlen(path_or_fd) >=3D sizeof(addr.sun_path)) {
> +        fprintf(stderr, "UNIX socket path \"%s\" too long (%zd >=3D %zd)=
\n",
> +                path_or_fd, strlen(path_or_fd), sizeof(addr.sun_path));
> +        return -1;
> +    }
> +
>      /* if not a number, assume a socket path */
>      fd =3D socket(AF_UNIX, SOCK_STREAM, 0);
>      if (fd =3D=3D -1)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--J+eNKFoVC4T1DV3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl7kySYACgkQ24/THMrX
1yyPGQf9EuMNWFC1HAYIQ/KT5Q0GjxqxcAQL1nJfVq5Ne4Q3XRw8+fUmIa/+tESW
GzfTkAQj+FQUvANshYl2s9FwBirvQt0d0LDSozwY0zmtL/HU/WgjE06gZrD7dqXa
gvUnmpayTKwZbg+4N/DTTVm+teeFJeg3So/aNY9Cx1x+GyhqsCJ3TQoWozwX9xxQ
hVmnRSv/onnlSPmqiW+5CgqhMHEFo4M4skWlmOPEKhS8iuCBQdL5FI6yq4TVrnfg
gobUwb+akk7pWFUFz0Rsxkov2C2ogvMymE3QKkd1CTmc0BbYum4W/3B15Hvno7k/
I+W/1C5r2HhEr3erlEYIFT6hbyJ5DQ==
=/tC+
-----END PGP SIGNATURE-----

--J+eNKFoVC4T1DV3f--

