Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE36F251741
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 13:17:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAWwS-00009n-Pj; Tue, 25 Aug 2020 11:16:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h+Rh=CD=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kAWwR-00009a-Cv
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:16:39 +0000
X-Inumbo-ID: ec758b5c-4b73-4f12-99ae-312a0d4c5952
Received: from wnew4-smtp.messagingengine.com (unknown [64.147.123.18])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec758b5c-4b73-4f12-99ae-312a0d4c5952;
 Tue, 25 Aug 2020 11:16:38 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id AD820B1B;
 Tue, 25 Aug 2020 07:16:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 25 Aug 2020 07:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=CZwo5/
 WFp3uGQDsthNyyjHHDKtfN+A6TRs/wbxyO2vs=; b=rh5w84ChcOKbeoPc8Bnf4n
 OINLHcBvCTFGqqyEQGkY9Kd3QO3qZjgmdtgZdCO+yDiiyLCG8Ipc4Hu5mFYMLpL6
 VikyVlKSFTXI4EVrjWwiqLf43KumCGo7+eiUsKDzwHZMCqGBSb6DE0PlgJ8OCrjf
 pMjDzG2wRXI9OFj3EvmvZQpA4SCINScTGSHE/KGcjjGE9dOKXpBn2umDl8h+5iaL
 xXU117YJfIEQfWu6LMWcAEjsvYCF06wjyL/4LWewArA8CaOx9HSzz0hIGsrCQmbq
 7MjJEbEj49nUfHBcCy6yshUA01O2darrmU4VFD1HcBTy0O1L/suwmOxiu0KO7jow
 ==
X-ME-Sender: <xms:E_NEX_vUXpYuByg2r1bqjQ3YnwaT7ruDeIpKZjNC3AkWBlvYOX40zw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
 drtghomh
X-ME-Proxy: <xmx:E_NEXwdNFIMZVcqdrtSwXsXh0rijStrjp9xSJCXxdntl1dcNzphOOg>
 <xmx:E_NEXyxurRhbIU3lZBewsYiFdBCWiBF8bdnwRdcTAJCj330-nwEV_Q>
 <xmx:E_NEX-PcRlDji3gpLzUyiQ7_Sswz901wiw1Vb6K6XnN9v6ARBfOx9g>
 <xmx:FPNEXw0TkXUcNLnD9V3AQZBUQrLjY3UzoeEDrWsIcXOFkfpCm_EIk-OdCkw>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id C42FB3280060;
 Tue, 25 Aug 2020 07:16:33 -0400 (EDT)
Date: Tue, 25 Aug 2020 13:16:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>
Subject: Re: [PATCH v3 26/38] tools: move libxenctrl below tools/libs
Message-ID: <20200825111631.GB1626@mail-itl>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-27-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a8kRBn33jkh2Wtq5"
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-27-jgross@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--a8kRBn33jkh2Wtq5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 26/38] tools: move libxenctrl below tools/libs

On Sun, Aug 23, 2020 at 11:35:07AM +0200, Juergen Gross wrote:
> Today tools/libxc needs to be built after tools/libs as libxenctrl is
> depending on some libraries in tools/libs. This in turn blocks moving
> other libraries depending on libxenctrl below tools/libs.
>=20
> So carve out libxenctrl from tools/libxc and move it into
> tools/libs/ctrl.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org> (stubdom part=
s)

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>=
 (python parts)

Some other comments below.

> --- a/tools/libxc/Makefile
> +++ b/tools/libxc/Makefile
> @@ -9,47 +9,10 @@ ifeq ($(CONFIG_LIBXC_MINIOS),y)
>  override CONFIG_MIGRATE :=3D n
>  endif
> =20
=2E..
> +LINK_FILES :=3D xc_private.h xc_core.h xc_core_x86.h xc_core_arm.h xc_bi=
tops.h
> +
> +$(LINK_FILES):
> +	ln -sf $(XEN_ROOT)/tools/libs/ctrl/$(notdir $@) $@

Why symlinks instead of adjusting compiler flags?
But then, if symlinks, why not commit them into git instead of creating at
build time?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--a8kRBn33jkh2Wtq5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl9E8w8ACgkQ24/THMrX
1yyFFQf/fIyCqxBOpm74eiRhYRW79bTYvpJuAeruingSQAq4fMxch6GaKrWyi4tZ
k0PxuPZ7i35y3YwWB3Quppr7W2h878u5zhCExiT0xVWsmATTXshESzSk25j6ctn7
eyOaznjDCa4TJDoLN/wTVEShVi517nSw+ZHeON2Ts9gQq4jljmkr2DZIxFCvCQjk
I/6fgDjjrxtANFUCihz+Yd4XhD2855Xk3znbmWAEOfGoJvHlhHhVUg4B191Hn4G1
0+z4Bhs3NFT2WNPLMY2rvRZ5u+UhYLANnTD+HgG6L0IIEPS+iqUU7kIqu1qDcoR0
eoi8yX9FsPW9dkJGM2BI5R0yLuT2ow==
=Q3ed
-----END PGP SIGNATURE-----

--a8kRBn33jkh2Wtq5--

