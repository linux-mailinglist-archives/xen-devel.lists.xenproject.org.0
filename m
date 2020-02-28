Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF4E173E9A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 18:34:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7jTn-000588-Ft; Fri, 28 Feb 2020 17:31:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BI6X=4Q=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1j7jTm-000583-2P
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 17:31:14 +0000
X-Inumbo-ID: 1dc1c5ce-5a50-11ea-b472-bc764e2007e4
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dc1c5ce-5a50-11ea-b472-bc764e2007e4;
 Fri, 28 Feb 2020 17:31:13 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 07D9021BF9;
 Fri, 28 Feb 2020 12:31:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 28 Feb 2020 12:31:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=y+gVbT
 A/jVYnIAYEBe4Spo0+w2H7bvqvs54s++SNS4o=; b=g7H7dcQy2uRHoycuFV54XV
 Ni6fmsEdFnQbaNaCStCM1mtHXfGkyZtF/dTLIVZNChtwh/IPrDAdcT36ikjb98wI
 dB7dvrHa1y2sEKV1EZfHDiFKvGJ/XgBpreA5Any0B3+28Amte7kDvbzFVU4qCzr5
 CdnNe+aHJA4sMP7aA89ik9k4mGYuapT2SknIDDVaglCQbJHZfAbb9MjHNVXi401Q
 wBs1h5WihSRDftpIdMoqxXEawduca5aWqHkTsnb0hx9wt+bWhmMe+44a4/PBT3zS
 N+YXiEzQl4XHsYgaQ5XWGQa6/9aQBhf+u7I2+/RyDJthiWq74hfSObEsgXFz9Ybg
 ==
X-ME-Sender: <xms:YE5ZXpe_rayfi7yD0Dz5V3xVrqrDcJwP4pPIBnt2fysXeE-_ZTETpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleekgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinheptghrvggrthhi
 ohhnrdhtohholhhsnecukfhppeeluddrieehrdefgedrfeefnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhs
 ihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:YE5ZXsycA-XGUQg8YO8TR4nxR7xYad5Ns4qWpOHNXqWxbTs1d1QU-g>
 <xmx:YE5ZXsGSykmvgTIwoYGsHDKwYHSnNHMrxGthE_yVSQn-JsWbBt1bVA>
 <xmx:YE5ZXj0gjPJfcBPfk-yXX9W0agus5HYrF0P4k22WdRLpxWvNoENgGQ>
 <xmx:YE5ZXunOTM3zk9RoOJeiReWuXAeviSx9N0PoWSo_d2qZKVxKc2Amhw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 182663280062;
 Fri, 28 Feb 2020 12:31:10 -0500 (EST)
Date: Fri, 28 Feb 2020 18:30:57 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: =?utf-8?B?UGF3ZcWC?= Marczewski <pawel@invisiblethingslab.com>
Message-ID: <20200228173057.GH2995@mail-itl>
References: <6613fdc72f9e7c4a7eb29ae73c19db810501944f.1582203228.git.pawel@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <6613fdc72f9e7c4a7eb29ae73c19db810501944f.1582203228.git.pawel@invisiblethingslab.com>
Subject: Re: [Xen-devel] [XEN PATCH v2] libxl: wait for console path before
 firing console_available
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============1242948475405994220=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1242948475405994220==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rCb8EA+9TsBVtA92"
Content-Disposition: inline


--rCb8EA+9TsBVtA92
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [XEN PATCH v2] libxl: wait for console path before
 firing console_available

On Thu, Feb 20, 2020 at 02:31:03PM +0100, Pawe=C5=82 Marczewski wrote:
> If we skip the bootloader, the TTY path will be set for xenconsoled.
> However, there is no guarantee that this will happen by the time we
> want to call the console_available callback, so we have to wait.
>=20
> Signed-off-by: Pawe=C5=82 Marczewski <pawel@invisiblethingslab.com>

With minor fix below:
Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> Changed since v1:
>   * use xswait mechanism to add a timeout
>=20
> As mentioned before, this is to fix a race condition that appears when
> using libxl via libvirt and not using bootloader (console_available
> fires too early).
>=20
> I have tested the patch on Qubes OS 4.1 (with Xen 4.13), and it seems
> to solve the problem. I also checked the timeout: when xenconsoled is
> stopped, libxl waits for 10 seconds and then aborts domain creation.
>=20
>  tools/libxl/libxl_create.c   | 43 +++++++++++++++++++++++++++++++++---
>  tools/libxl/libxl_internal.h |  1 +
>  2 files changed, 41 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
> index 3a7364e2ac..4b150d92b9 100644
> --- a/tools/libxl/libxl_create.c
> +++ b/tools/libxl/libxl_create.c
> @@ -1190,6 +1190,33 @@ static void domcreate_console_available(libxl__egc=
 *egc,
>                                          dcs->aop_console_how.for_event));
>  }
> =20
> +static void console_xswait_callback(libxl__egc *egc, libxl__xswait_state=
 *xswa,
> +                                    int rc, const char *p)
> +{
> +    EGC_GC;
> +    libxl__domain_create_state *dcs =3D CONTAINER_OF(xswa, *dcs, console=
_xswait);
> +    char *dompath =3D libxl__xs_get_dompath(gc, dcs->guest_domid);
> +    char *tty_path =3D GCSPRINTF("%s/console/tty", dompath);
> +    char *tty;
> +
> +    if (rc) {
> +        if (rc =3D=3D ERROR_TIMEDOUT)
> +            LOG(ERROR, "%s: timed out", xswa->what);
> +        libxl__xswait_stop(gc, xswa);
> +        domcreate_complete(egc, dcs, rc);
> +        return;
> +    }
> +
> +    tty =3D libxl__xs_read(gc, XBT_NULL, tty_path);
> +
> +    if (tty && tty[0] !=3D '\0') {
> +        libxl__xswait_stop(gc, xswa);
> +
> +        domcreate_console_available(egc, dcs);
> +        domcreate_complete(egc, dcs, 0);
> +    }
> +}
> +
>  static void domcreate_bootloader_done(libxl__egc *egc,
>                                        libxl__bootloader_state *bl,
>                                        int rc)
> @@ -1728,9 +1755,18 @@ static void domcreate_attach_devices(libxl__egc *e=
gc,
>          return;
>      }
> =20
> -    domcreate_console_available(egc, dcs);
> -
> -    domcreate_complete(egc, dcs, 0);
> +    dcs->console_xswait.ao =3D ao;
> +    dcs->console_xswait.what =3D GCSPRINTF("domain %d console tty", domi=
d);
> +    dcs->console_xswait.path =3D GCSPRINTF("%s/console/tty",
> +                                         libxl__xs_get_dompath(gc, domid=
));
> +    dcs->console_xswait.timeout_ms =3D 10 * 1000;

Better not use explicit value _here_, but a constant in some header. I
think LIBXL_INIT_TIMEOUT is a good fit here.

> +    dcs->console_xswait.callback =3D console_xswait_callback;
> +    ret =3D libxl__xswait_start(gc, &dcs->console_xswait);
> +    if (ret) {
> +        LOG(ERROR, "unable to set up watch for domain %d console path",
> +            domid);
> +        goto error_out;
> +    }
> =20
>      return;
> =20
> @@ -1861,6 +1897,7 @@ static int do_domain_create(libxl_ctx *ctx, libxl_d=
omain_config *d_config,
> =20
>      libxl__ao_progress_gethow(&cdcs->dcs.aop_console_how, aop_console_ho=
w);
>      cdcs->domid_out =3D domid;
> +    libxl__xswait_init(&cdcs->dcs.console_xswait);
> =20
>      initiate_domain_create(egc, &cdcs->dcs);
> =20
> diff --git a/tools/libxl/libxl_internal.h b/tools/libxl/libxl_internal.h
> index 4936446069..d8129417dc 100644
> --- a/tools/libxl/libxl_internal.h
> +++ b/tools/libxl/libxl_internal.h
> @@ -4180,6 +4180,7 @@ struct libxl__domain_create_state {
>      /* necessary if the domain creation failed and we have to destroy it=
 */
>      libxl__domain_destroy_state dds;
>      libxl__multidev multidev;
> +    libxl__xswait_state console_xswait;
>  };
> =20
>  _hidden int libxl__device_nic_set_devids(libxl__gc *gc,

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--rCb8EA+9TsBVtA92
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl5ZTlEACgkQ24/THMrX
1yz2KwgAkLZUXGPoNP0f4SGZzyrVoyq9rAwpBc0xheWcZAntk0c7Sc8iNbl29Vux
0DhO1bDgfb/c6/x7/INlFZUGt9VtIvJmVISY8eDKPlbqT8OTZDthttyjJJyFgPq/
Aq8cfgHKf1eclV7+YPPAPLQLlCA8DcQ4/tSYmbMBHi4qjoMeIte2yGcM1mCPRf4j
QfRPTJQ3UryBIYB6GF+cnF56Q1L68LV67A7HDQdcoMjiQ9O25H7NsZzD9W/um6oB
+lNatpa4qYsh9/17Z+lpbhoNVZKCrLNZvEz6nABY3Uh0Qrev0mCIAiQiABdTuyIC
NpQx/kt1Rjd4p5sRC5K+6uhOeHD7cg==
=ngXP
-----END PGP SIGNATURE-----

--rCb8EA+9TsBVtA92--


--===============1242948475405994220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1242948475405994220==--

