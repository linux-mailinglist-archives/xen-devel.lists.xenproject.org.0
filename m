Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFEE144891
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 00:51:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu3E3-000386-QZ; Tue, 21 Jan 2020 23:46:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DWdk=3K=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iu3E2-000381-Oe
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 23:46:26 +0000
X-Inumbo-ID: 3750594e-3ca8-11ea-9fd7-bc764e2007e4
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3750594e-3ca8-11ea-9fd7-bc764e2007e4;
 Tue, 21 Jan 2020 23:46:17 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 30B6E329;
 Tue, 21 Jan 2020 18:46:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 21 Jan 2020 18:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HEAcvS
 SENCfb5h9niOs6SfSg+Mj3OIoKTeioCfUWxiU=; b=okxSA2G8BguNPIva0v7zKP
 LSTB+pXx33hMmink+Oc3VZw8fY/fm1VitCOw3D3sYq7w+3vtod0ND/5hMu+SvFz2
 +QzBZcrAUGjn1sCnPUA+Tb/aaVFd+I4PD30o57EJFxCb2Y/1v0gPPhMBsFHNv1Ah
 fwtIDUgZnsqN8mn7HymKVUVULvSfEt2PT/vM94+kLg+rIoIdTn3uZ+WaIIGaW2zL
 baYQ5rK7sG0UR6mR28+c6Vczqh+WjHINLfwspBVeiO2j3nXDaisBwERsnk6SsQWa
 VxfjkeUQtTcYMi7Xh8MVnDA6fYmNubMaDrPuZraELuWtKePj17HTYkluAIkErpyg
 ==
X-ME-Sender: <xms:R40nXqiB-Vqb40UNCjM74eae1K7Tqcya4XYxplgMNZi6sI2tcKdE3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudelgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrh
 hmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:R40nXi_bjyEX1a6nIXTFNxotqOp-bcA0rN_ZlXDn14mt5MuGeDmt-Q>
 <xmx:R40nXpSWJnB2vr9dwGN7CVHOtNGtpPFREqyUAuaFJKNcWwKsPtpS3Q>
 <xmx:R40nXptyCqkzWL17Z4w87hhwaVeOjEKpMVmMHyWVBcaKMgM1VCwkTQ>
 <xmx:R40nXpem2syhLdIrwXkCBjW_Dqr_SJg2mM_PwjaRikKhOT2XS_j10Q>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F378328005E;
 Tue, 21 Jan 2020 18:46:14 -0500 (EST)
Date: Wed, 22 Jan 2020 00:46:11 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Message-ID: <20200121234611.GV1314@mail-itl>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <8d8515cabfdc666bd1afb40f6b7e44ccbe362dbf.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpsuravUxpu2mgyWc4AWYkvUHc9rQvV=bSSCXQ0z+29VgQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKf6xpsuravUxpu2mgyWc4AWYkvUHc9rQvV=bSSCXQ0z+29VgQ@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH v4 12/16] libxl: use vchan for QMP access
 with Linux stubdomain
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============7462912807878038943=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7462912807878038943==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BLHJ+CpGSNuhLkFz"
Content-Disposition: inline


--BLHJ+CpGSNuhLkFz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 12/16] libxl: use vchan for QMP access
 with Linux stubdomain

On Tue, Jan 21, 2020 at 03:17:39PM -0500, Jason Andryuk wrote:
> On Tue, Jan 14, 2020 at 9:42 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > Access to QMP of QEMU in Linux stubdomain is possible over vchan
> > connection. Handle the actual vchan connection in a separate process
> > (vchan-socket-proxy). This simplified integration with QMP (already
> > quite complex), but also allows preliminary filtering of (potentially
> > malicious) QMP input.
> > Since only one client can be connected to vchan server at the same time
> > and it is not enforced by the libxenvchan itself, additional client-side
> > locking is needed. It is implicitly implemented by vchan-socket-proxy,
> > as it handle only one connection at a time. Note that qemu supports only
> > one simultaneous client on a control socket anyway (but in UNIX socket
> > case, it enforce it server-side), so it doesn't add any extra
> > limitation.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > Changes in v4:
> >  - new patch, in place of both "libxl: use vchan for QMP access ..."
> > ---
> >  tools/configure.ac           |   9 ++-
> >  tools/libxl/libxl_dm.c       | 159 ++++++++++++++++++++++++++++++++++--
> >  tools/libxl/libxl_internal.h |   1 +-
> >  3 files changed, 161 insertions(+), 8 deletions(-)
> >
> > diff --git a/tools/configure.ac b/tools/configure.ac
> > index 8d86c42..20bbdbf 100644
> > --- a/tools/configure.ac
> > +++ b/tools/configure.ac
> > @@ -192,6 +192,15 @@ AC_SUBST(qemu_xen)
> >  AC_SUBST(qemu_xen_path)
> >  AC_SUBST(qemu_xen_systemd)
> >
> > +AC_ARG_WITH([stubdom-qmp-proxy],
> > +    AC_HELP_STRING([--stubdom-qmp-proxy@<:@=3DPATH@:>@],
> > +        [Use supplied binary PATH as a QMP proxy into stubdomain]),[
>=20
> Thanks for making it configurable :)
>=20
> > +    stubdom_qmp_proxy=3D"$withval"
> > +],[
> > +    stubdom_qmp_proxy=3D"$bindir/vchan-socket-proxy"
> > +])
> > +AC_DEFINE_UNQUOTED([STUBDOM_QMP_PROXY_PATH], ["$stubdom_qmp_proxy"], [=
QMP proxy path])
> > +
> >  AC_ARG_WITH([system-seabios],
> >      AS_HELP_STRING([--with-system-seabios@<:@=3DPATH@:>@],
> >         [Use system supplied seabios PATH instead of building and insta=
lling
> > diff --git a/tools/libxl/libxl_dm.c b/tools/libxl/libxl_dm.c
> > index 528ca3e..23ac7e4 100644
> > --- a/tools/libxl/libxl_dm.c
> > +++ b/tools/libxl/libxl_dm.c
> > @@ -1183,7 +1183,7 @@ static int libxl__build_device_model_args_new(lib=
xl__gc *gc,
> >                        "-xen-domid",
> >                        GCSPRINTF("%d", guest_domid), NULL);
> >
> > -    /* There is currently no way to access the QMP socket in the stubd=
om */
> > +    /* QMP access to qemu running in stubdomain is done over vchan, st=
ubdomain setup it itself */
>=20
> I think this would be clearer:
> /* QMP access to qemu running in stubdomain is done over vchan.  The
> stubdomain init script
>  * adds the appropriate monitor options for vchan-socket-proxy. */

Yes, clearer.

> In the block below, the -no-shutdown option is added to qemu, which
> will not be done for linux stubdomain.
> -no-shutdown
>        Don't exit QEMU on guest shutdown, but instead only stop the
>        emulation.  This allows for instance switching to monitor to commit
>        changes to the disk image.
>=20
> It's something I noticed, but I don't know if it matters to us.

I'll move it outside, looks like unrelated change.

> >      if (!is_stubdom) {
> >          flexarray_append(dm_args, "-chardev");
> >          if (state->dm_monitor_fd >=3D 0) {
> > @@ -2178,6 +2178,23 @@ static void stubdom_pvqemu_unpaused(libxl__egc *=
egc,
>=20
> <snip>
>=20
> > @@ -2460,24 +2477,150 @@ static void spawn_stub_launch_dm(libxl__egc *e=
gc,
> >              goto out;
> >      }
> >
> > +    sdss->qmp_proxy_spawn.ao =3D ao;
> > +    if (libxl__stubdomain_is_linux(&guest_config->b_info)) {
> > +        spawn_qmp_proxy(egc, sdss);
> > +    } else {
> > +        qmp_proxy_spawn_outcome(egc, sdss, 0);
> > +    }
> > +
> > +    return;
> > +
> > +out:
> > +    assert(ret);
> > +    qmp_proxy_spawn_outcome(egc, sdss, ret);
> > +}
> > +
> > +static void spawn_qmp_proxy(libxl__egc *egc,
> > +                            libxl__stub_dm_spawn_state *sdss)
> > +{
> > +    STATE_AO_GC(sdss->qmp_proxy_spawn.ao);
> > +    const uint32_t guest_domid =3D sdss->dm.guest_domid;
> > +    const uint32_t dm_domid =3D sdss->pvqemu.guest_domid;
> > +    const char *dom_path =3D libxl__xs_get_dompath(gc, dm_domid);
> > +    char **args;
> > +    int nr =3D 0;
> > +    int rc, logfile_w, null;
> > +
> > +    if (access(STUBDOM_QMP_PROXY_PATH, X_OK) < 0) {
> > +        LOGED(ERROR, guest_domid, "qmp proxy %s is not executable", ST=
UBDOM_QMP_PROXY_PATH);
> > +        rc =3D ERROR_FAIL;
> > +        goto out;
> > +    }
> > +
> > +    sdss->qmp_proxy_spawn.what =3D GCSPRINTF("domain %d device model q=
mp proxy", guest_domid);
> > +    sdss->qmp_proxy_spawn.pidpath =3D GCSPRINTF("%s/image/qmp-proxy-pi=
d", dom_path);
> > +    sdss->qmp_proxy_spawn.xspath =3D GCSPRINTF("%s/image/qmp-proxy-sta=
te", dom_path);
>=20
> Since this is the vchan-socket-proxy in dom0, should it write to
> "device-model/%u/qmp-proxy-state" underneath dom0?

Yes, that would be more consistent. But pid should stay where it is
(it's also where dom0 qemu pid is being written).

> > +
> > +    sdss->qmp_proxy_spawn.timeout_ms =3D LIBXL_DEVICE_MODEL_START_TIME=
OUT * 1000;
> > +    sdss->qmp_proxy_spawn.midproc_cb =3D libxl__spawn_record_pid;
> > +    sdss->qmp_proxy_spawn.confirm_cb =3D qmp_proxy_confirm;
> > +    sdss->qmp_proxy_spawn.failure_cb =3D qmp_proxy_startup_failed;
> > +    sdss->qmp_proxy_spawn.detached_cb =3D qmp_proxy_detached;
> > +
> > +    const int arraysize =3D 6;
> > +    GCNEW_ARRAY(args, arraysize);
> > +    args[nr++] =3D STUBDOM_QMP_PROXY_PATH;
> > +    args[nr++] =3D GCSPRINTF("--state-path=3D%s", sdss->qmp_proxy_spaw=
n.xspath);
> > +    args[nr++] =3D GCSPRINTF("%u", dm_domid);
> > +    args[nr++] =3D GCSPRINTF("%s/device-model/%u/qmp-vchan", dom_path,=
 guest_domid);
>=20
> Thinking of OpenXT"s qmp-helper, this path isn't useful.  But it is
> for vchan-socket-proxy, so qmp-helper could just change to ignore it.

For vchan we could use also a port number (and then it will encode it
into a xenstore path). This is in fact how we use libvchan in Qubes. I
opted for explicit path only because of lack of idea for some meaningful
port number ;) But I'm open for suggestions.
I guess that would be useful for Argo version then.

> > +    args[nr++] =3D (char*)libxl__qemu_qmp_path(gc, guest_domid);
>=20
> qmp-helper takes just the stub_domid and domid.  The domid is just
> used to generate the above path, but taking the path would be cleaner.
>=20
> > +    args[nr++] =3D NULL;
> > +    assert(nr =3D=3D arraysize);
>=20
> This generally looks good.
>=20
> Regards,
> Jason

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--BLHJ+CpGSNuhLkFz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4njUQACgkQ24/THMrX
1yzx8Af/SToDZv4OLTBlVA6HvJNqQCp7+lRPDX2pq22oHHFYxQs9jorQqvslyjnY
SY4+RThHXlgukzwx0ztySp9SW+iEKkhFOxOXuAB92TNIiSAamXZymDQo9Ih2bLwj
93gOShKYcDIGxWEbi8h8XNsqar4rhVDFktqfr8DHjx1fyIm6aNwk+V38+baCqAQN
6f64b3cdhAZTWrM6VQRLbbveMWA5luKUzBeNhcW+HRsdsaoCglugmWSABt4IP/pg
4a03503e2rtkJs65kAY5rFc+cBReSfC9NrtmWMfOeJyVaViK5lKIuY2XGeCvFrNF
ptvk+e7bU0WaS7m4KHh5pfuuPc5lOw==
=hSlM
-----END PGP SIGNATURE-----

--BLHJ+CpGSNuhLkFz--


--===============7462912807878038943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7462912807878038943==--

