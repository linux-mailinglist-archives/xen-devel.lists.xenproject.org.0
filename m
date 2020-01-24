Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA66148F4F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 21:26:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iv5TH-0006Ez-1w; Fri, 24 Jan 2020 20:22:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pCgk=3N=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iv5TG-0006Eu-2J
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 20:22:26 +0000
X-Inumbo-ID: 36ecbcf4-3ee7-11ea-9fd7-bc764e2007e4
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36ecbcf4-3ee7-11ea-9fd7-bc764e2007e4;
 Fri, 24 Jan 2020 20:22:17 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id E74FF84A;
 Fri, 24 Jan 2020 15:22:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 24 Jan 2020 15:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sxSf2U
 fQ1trwTLIAryRSj/Rk+Z6Wz33b/OS5O5zFF/I=; b=E25DabXljL6HpiO8gqF2+n
 VBKOIairHo1LMhdt1zMAyGantm1feVxgvTTZWJzS+VRJYPDU/s3sIsfKSj5PBwVR
 sRwOZBw5xL1YrceFk8waJw5H/i5ROp/9Yn3bSo754fDCOAR7yPW28AxdPwpDSQld
 GXwXEI5uIZUjwOmLrK5mX9j9lLkqmkgAci6h9r0cD2MACUF+c0LR3m98+nPGaPEy
 HRxom6tjKErcWwM12uDos8pX6u6SfZB6mETyI3LvGr+79gsBF2SZJXtZrcBzNMcn
 DM5sDmF3EZD5kmoG6G3mQPcgnRIMDjkyFvLF3bP2bwAJ7DNbYwi1pHbMoWqq9hAg
 ==
X-ME-Sender: <xms:91ErXjWHAPgB4qoMxYw-PLBoks26BU3UWjz50C1eKNLql_INurYRwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvdehgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeefjedrfedtrdegkedrudej
 geenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:91ErXjbr38rAXamEK5mcGU1w6862tMOz5y0KRf7JwG5yCDKYq7y08Q>
 <xmx:91ErXqxCtqL7lxFPkiqVaCNVlYSLzMHAxRLQBqyzONdQoPSdKe3kGg>
 <xmx:91ErXoJD1dAko1HR9_FIEo_0aMLH851mSPyelokiTfda8HFt41eL0w>
 <xmx:91ErXrzjf683QkQw4NPXABCaAkiTfLW2rSAXCWK_Ran_3PQg2OU2CQ>
Received: from mail-itl (37.30.48.174.nat.umts.dynamic.t-mobile.pl
 [37.30.48.174])
 by mail.messagingengine.com (Postfix) with ESMTPA id 410BB306131B;
 Fri, 24 Jan 2020 15:22:12 -0500 (EST)
Date: Fri, 24 Jan 2020 21:22:03 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Rich Persaud <persaur@gmail.com>
Message-ID: <20200124202203.GM1314@mail-itl>
References: <117DED83-B87B-4F38-972C-57FAC9F3EBDC@gmail.com>
MIME-Version: 1.0
In-Reply-To: <117DED83-B87B-4F38-972C-57FAC9F3EBDC@gmail.com>
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
Cc: Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Eric Chanudet <chanudete@ainfosec.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============7301383601181719091=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7301383601181719091==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ma2IebCqBk9lYfxq"
Content-Disposition: inline


--Ma2IebCqBk9lYfxq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 12/16] libxl: use vchan for QMP access
 with Linux stubdomain

On Fri, Jan 24, 2020 at 02:58:56PM -0500, Rich Persaud wrote:
> =EF=BB=BFOn Jan 24, 2020, at 09:07, Jason Andryuk <jandryuk@gmail.com> wr=
ote:
> >=20
> > =EF=BB=BFOn Tue, Jan 21, 2020 at 6:46 PM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> >=20
> >>>> +
> >>>> +    sdss->qmp_proxy_spawn.timeout_ms =3D LIBXL_DEVICE_MODEL_START_T=
IMEOUT * 1000;
> >>>> +    sdss->qmp_proxy_spawn.midproc_cb =3D libxl__spawn_record_pid;
> >>>> +    sdss->qmp_proxy_spawn.confirm_cb =3D qmp_proxy_confirm;
> >>>> +    sdss->qmp_proxy_spawn.failure_cb =3D qmp_proxy_startup_failed;
> >>>> +    sdss->qmp_proxy_spawn.detached_cb =3D qmp_proxy_detached;
> >>>> +
> >>>> +    const int arraysize =3D 6;
> >>>> +    GCNEW_ARRAY(args, arraysize);
> >>>> +    args[nr++] =3D STUBDOM_QMP_PROXY_PATH;
> >>>> +    args[nr++] =3D GCSPRINTF("--state-path=3D%s", sdss->qmp_proxy_s=
pawn.xspath);
> >>>> +    args[nr++] =3D GCSPRINTF("%u", dm_domid);
> >>>> +    args[nr++] =3D GCSPRINTF("%s/device-model/%u/qmp-vchan", dom_pa=
th, guest_domid);
> >>> Thinking of OpenXT"s qmp-helper, this path isn't useful.  But it is
> >>> for vchan-socket-proxy, so qmp-helper could just change to ignore it.
> >> For vchan we could use also a port number (and then it will encode it
> >> into a xenstore path). This is in fact how we use libvchan in Qubes. I
> >> opted for explicit path only because of lack of idea for some meaningf=
ul
> >> port number ;) But I'm open for suggestions.
> >> I guess that would be useful for Argo version then.
> >=20
> > The argo version hard codes the port number, so it's not a command
> > line argument.  The port number would need to get passed to the
> > stubdom or it would need to be standardized.
> >=20
> > I think the arguments for vchan-socket-proxy make sense.  Since it's
> > the one that's submitted upstream, it makes sense to use them.
> >=20
> > Put another way, do we want this to support alternate implementations
> > for a qmp proxy?  Should the arguments be generic for that case?
>=20
>=20
> One advantage of the server+client approach of vchan-socket-proxy is the =
absence of patches for Qemu.  OpenXT qmp-helper requires a Qemu patch for A=
rgo support.  If there was a qmp socket proxy with Argo support, unpatched =
Qemu could be used with libxl and Argo access controls.
>=20
> A generalized qmp-socket-proxy may be useful to other projects.  It would=
 be good if the design supported single-purpose (client or server) binaries=
, e.g. common functions in a library shared by separate client and server s=
ource files, with conditional compilation for vchan and Argo interfaces.

I don't think it's worth separating client and server sources in the
current shape. The whole file has less than 500 lines and majority of it
is the common code. After connection setup, data processing is
symmetric (the whole data_loop and its helper functions).

What may be worth doing, is adding a place to plug qemu->libxl data
filtering/sanitization. This data filtering should indeed be in a
separate source file and only linked into server binary.
I'm not yet sure what I'd like to filter data with. To be honest, I'm
a bit uncomfortable with processing untrusted data in C...
Does Argo have bindings for some other (memory safe) language? That
would be a strong argument to use Argo here exclusively.
Alternatively, I can think of delegating filtering to a separate process
(pass data over stdin/stdout pipes). That could be very flexible, but
could be also an overkill. Also: should such filter see data in both
directions? I think yes, to have some context what libxl could expect
(filter-out unexpected responses, responses not matching schema for a
particular message type etc).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Ma2IebCqBk9lYfxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4rUesACgkQ24/THMrX
1yxQtwf/YuFUzJ88GeiNzrKgsqpzwjukQrkRXYTSmMLYoDoByqY3GY7essAJvKpD
ra9c9KCTQsQLDyqmWosI7fP7WVPnLyjfVlnqD4641kzYMj+I4KImOKVjjlKPzoh9
AJhTcsWmIsG43y9GPq890ERppLR8s1GZsmjJf/ujuLatWUlMnUNUIgYpi1DUngQK
wCBB/u+gsl4pEeQMc0nIstty1o/5/PscbWmF2mYROZucfJNO1KzYRgSqiqEuUHqW
6OXqR0wcDAPfIc6JiXGULxXt3FySafoLk7gnjZAKDPXm/2s6kjJpgq/+wJg2dFXr
oPsvLxMtK43jAC/Q7lavxP4R7xcJ6A==
=4PHL
-----END PGP SIGNATURE-----

--Ma2IebCqBk9lYfxq--


--===============7301383601181719091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7301383601181719091==--

