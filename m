Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CD714465A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 22:22:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu0vE-0007C7-9B; Tue, 21 Jan 2020 21:18:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DWdk=3K=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iu0vC-0007C2-Lb
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 21:18:50 +0000
X-Inumbo-ID: 991c0304-3c93-11ea-b833-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 991c0304-3c93-11ea-b833-bc764e2007e4;
 Tue, 21 Jan 2020 21:18:41 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 998A5499;
 Tue, 21 Jan 2020 16:18:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 21 Jan 2020 16:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PN5Yyn
 8oRNj7Eq6ykoTOlPv7cOtvkuzUFcwidVhZJZg=; b=j2dd26Canhw6cEwBZHz6/P
 pLFQozhpVqylCAs0ii8JKa23uRL3mdn7aAQn5e6ZHl6zCYm1caEpft7cY+qASiqR
 Tx6Nqmi2B6rduDXcqzu8DrxdbO+dG0T6SYPqRc5+tpoGeE5yfwNVpXSILKLJJh2j
 WVsMnNlglmxsyBVV5tmFxZDvcgeNgcyLqlycONArX2Kr4zHS1xDAWxW5HPjKjFbR
 706WjzIOluAG5futBn1wLg4bn6NIf9RNNXzOBzbHQm+/6nePXeerZb8/J2MuAaiY
 +KZTwI+vWzVghlLmg/d1s0x5VSWXHOCFBAVJZZnhkitsI/Pq1jSlkU9arZ60K/Og
 ==
X-ME-Sender: <xms:sGonXhKLS_8yR9AOl0wvWlxeagrjgbTKUc65lv-wyhlx_Zb1Fe3qBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudekgddugeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:sGonXih2n-pleUMzM4dzZcZP3sNntL14xFNrOyBLEoCMjQknGtEd9A>
 <xmx:sGonXp4lGuK3kaEnbKNrpmAiuQaJsjwfk8Uc1otFc_DUsqf5vGDevA>
 <xmx:sGonXiaLqBfCnzR62SCpZhGqdjwAJCruayaOyyXK6R1z4IDuwsEmHQ>
 <xmx:sGonXoheMxpXQfB68J9YsxD0bYW3QsxOd5t7h7Blwvg_g1jckVA7aA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0CFFE3060B2C;
 Tue, 21 Jan 2020 16:18:38 -0500 (EST)
Date: Tue, 21 Jan 2020 22:18:35 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Message-ID: <20200121211835.GQ1314@mail-itl>
References: <cover.f819645cd9f5cf7a6f692f9661cfb4e670a2cd08.1579055705.git-series.marmarek@invisiblethingslab.com>
 <27770209c1e2984cda8b9893ed6313fb2bdf30a6.1579055705.git-series.marmarek@invisiblethingslab.com>
 <CAKf6xpv--A2zUieSAY47L9dppsP43rd=zrJdVB_Rxps3CWTnqQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKf6xpv--A2zUieSAY47L9dppsP43rd=zrJdVB_Rxps3CWTnqQ@mail.gmail.com>
Subject: Re: [Xen-devel] [PATCH v4 05/16] libxl: Handle Linux stubdomain
 specific QEMU options.
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
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Eric Shelton <eshelton@pobox.com>
Content-Type: multipart/mixed; boundary="===============3503094894050038334=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3503094894050038334==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BtjZvq0+OkLkL8An"
Content-Disposition: inline


--BtjZvq0+OkLkL8An
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 05/16] libxl: Handle Linux stubdomain
 specific QEMU options.

On Mon, Jan 20, 2020 at 02:24:18PM -0500, Jason Andryuk wrote:
> On Tue, Jan 14, 2020 at 9:42 PM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > From: Eric Shelton <eshelton@pobox.com>
> >
> > This patch creates an appropriate command line for the QEMU instance
> > running in a Linux-based stubdomain.
> >
> > NOTE: a number of items are not currently implemented for Linux-based
> > stubdomains, such as:
> > - save/restore
> > - QMP socket
> > - graphics output (e.g., VNC)
> >
> > Signed-off-by: Eric Shelton <eshelton@pobox.com>
> >
> > Simon:
> >  * fix disk path
> >  * fix cdrom path and "format"
> >  * pass downscript for network interfaces
>=20
> Since this is here...
>=20
> > Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> > [drop Qubes-specific parts]
>=20
> ...maybe mention dropping downscript here?  Otherwise the commit
> message and contents don't match.

Ah, indeed.

>=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
>=20
> <snip>
>=20
> > diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
> > index 142b960..a6d40b7 100644
> > --- a/tools/libxl/libxl_create.c
> > +++ b/tools/libxl/libxl_create.c
> > @@ -169,6 +169,31 @@ int libxl__domain_build_info_setdefault(libxl__gc =
*gc,
> >          }
> >      }
> >
> > +    if (b_info->type =3D=3D LIBXL_DOMAIN_TYPE_HVM &&
> > +        libxl_defbool_val(b_info->device_model_stubdomain)) {
> > +        if (!b_info->stubdomain_kernel) {
> > +            switch (b_info->device_model_version) {
> > +                case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
> > +                    b_info->stubdomain_kernel =3D
> > +                        libxl__abs_path(NOGC, "ioemu-stubdom.gz", libx=
l__xenfirmwaredir_path());
> > +                    b_info->stubdomain_ramdisk =3D NULL;
> > +                    break;
> > +                case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
> > +                    b_info->stubdomain_kernel =3D
> > +                        libxl__abs_path(NOGC,
> > +                                "stubdom-linux-kernel",
>=20
> Not to bikeshed, but this came up in a conversation a little while
> ago.  Stubdom is a generic name, and this code is for a device model.
> So some combination of qemu{,-dm}{,-linux}-kernel seems more
> descriptive.

Minios-based use ioemu-stubdom, so maybe
ioemu-stubdom-linux-{kernel,rootfs}?

> Having said that, I'm fine with it as is since I don't imagine more
> stubdoms showing up.
>=20
> > +                                libxl__xenfirmwaredir_path());
> > +                    b_info->stubdomain_ramdisk =3D
> > +                        libxl__abs_path(NOGC,
> > +                                "stubdom-linux-rootfs",
> > +                                libxl__xenfirmwaredir_path());
> > +                    break;
> > +                default:
> > +                    abort();
>=20
> Can we return an error instead?

For invalid enum value?=20

> > +            }
> > +        }
> > +    }
> > +
> >      if (!b_info->max_vcpus)
> >          b_info->max_vcpus =3D 1;
> >      if (!b_info->avail_vcpus.size) {
>=20
> <snip>
>=20
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--BtjZvq0+OkLkL8An
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4naqsACgkQ24/THMrX
1yxJQAf8C9X2ILPdKssWoYATtsbTvs8MAXIgfm43YOBQSaj+czIbvW+gy7autTIG
gzGpj0xG/078tnJs7pNoU/jcnhTt4P8j227dNIMDmA7c4wQWjXGQM5iGlF7E+s9t
hcyKFD/wp+VDU/3ch2BFAQpEtca/9WfRIEqHmwAzpByhgqqlhblaKkHcDxTNPtbb
ztbFGXgKNxBfUA8ImwczzC6/8ATWNpQFkcLf3+NdvsW/g/FqK/djktMVbeT/r9pQ
r6z/pwXmxBCnjth5yIRmHKSyvrsMhpeoHG3Olu++1Ki1ZZOpEVUbX8SYPt2oCg21
DDkuQ5BEqZX8pMLa9gIMeb8sj4mt4A==
=Jo5C
-----END PGP SIGNATURE-----

--BtjZvq0+OkLkL8An--


--===============3503094894050038334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3503094894050038334==--

