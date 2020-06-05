Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAECF1F011E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 22:44:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhJBQ-0005cN-Ma; Fri, 05 Jun 2020 20:43:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wSaP=7S=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jhJBP-0005cI-3J
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 20:43:19 +0000
X-Inumbo-ID: 2eecf520-a76d-11ea-9ad7-bc764e2007e4
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2eecf520-a76d-11ea-9ad7-bc764e2007e4;
 Fri, 05 Jun 2020 20:43:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 25DF141A;
 Fri,  5 Jun 2020 16:43:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 05 Jun 2020 16:43:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=d/klCz
 Dv7E5k4j6UzvEybo7FT4gyETyaRstTK2pm2gI=; b=vBC5RCkv3WuCTKf+SzUH4Q
 SyZdk2iLiUiLI2pdwV4V0VnhWq5vbNPjXIhqVGpR0y8S3qi/V0cNFtgUIUepT4UK
 yuPOtjki3GLySZ1SxwiayaQelO6G6244YXQxFsxjFgCihlV6KhvycC3HuT+4BqqI
 6qk4oquScwRVzQVymvgmg0AMdmTMaSqg2vAfwZ7Yh2aNcqz6uF8SBVG2g7oa3ccq
 SZNonDU+VSarZGf2+bUjWOkkVCSLeOjgKUXsbVC4MF2et/VbZHVdbLjHGqL08qn7
 2Wo6W9LOVankpewBG+MPULy4/dQJMEYoF9Ymn5h0sOSKhqSO5o61UiSCqcMMbC1A
 ==
X-ME-Sender: <xms:Y67aXtAGwXm5FSs9R-7I8bv2ibl5yu5e5s-OyTgxUgPQLXbknd1XgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegfedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepkdforghr
 vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihdkuceomhgrrhhmrghrvghkse
 hinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhep
 fffgudeggedtgeegteehfeevffetieegkeejtdeuleehtddvueffjeeklefhkeehnecuff
 homhgrihhnpehgihhthhhusgdrtghomhenucfkphepledurdeihedrfeegrdeffeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrh
 gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Y67aXrjiBDPeeDdbuaQTPr9XdvXLckMwgdb_FngriPG0sh61kxe9LA>
 <xmx:Y67aXokwxqVrbbVHqjc1o9LGM4OjYzvFEaq_LOHWdz0KfiNmUeD2aQ>
 <xmx:Y67aXnwsLXY6ml3B8IXmeqA9Jx3gXBWnKe-6aDj5XBXda9Vc3JIjVw>
 <xmx:Y67aXpO0zRixllehGLyBoJaORjJojqgjJcoP6mwtYZqMM9RD62zgvg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id C173C3061CCB;
 Fri,  5 Jun 2020 16:43:14 -0400 (EDT)
Date: Fri, 5 Jun 2020 22:43:10 +0200
From: 'Marek =?utf-8?Q?Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
To: paul@xen.org
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
Message-ID: <20200605204310.GK98582@mail-itl>
References: <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <000501d63b29$496ce6e0$dc46b4a0$@xen.org>
 <000701d63b2c$10536930$30fa3b90$@xen.org>
 <0296d5d6-cc7f-6e34-2403-acf34b870b5b@suse.com>
 <002101d63b3f$4e9dc830$ebd95890$@xen.org>
 <e2b8dd67-59c2-7e59-36f6-ce30b2df8b86@suse.com>
 <002201d63b40$1e135ee0$5a3a1ca0$@xen.org>
 <002f01d63b50$c8b49a70$5a1dcf50$@xen.org>
 <20200605171353.GG6329@mail-itl>
 <001501d63b5e$26a991a0$73fcb4e0$@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SR0DFWOzPg+ymaCV"
Content-Disposition: inline
In-Reply-To: <001501d63b5e$26a991a0$73fcb4e0$@xen.org>
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Jan Beulich' <jbeulich@suse.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--SR0DFWOzPg+ymaCV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom

On Fri, Jun 05, 2020 at 06:24:20PM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: 'Marek Marczykowski-G=C3=B3recki' <marmarek@invisiblethingslab.co=
m>
> > Sent: 05 June 2020 18:14
> > To: paul@xen.org
> > Cc: 'Jan Beulich' <jbeulich@suse.com>; 'Andrew Cooper' <andrew.cooper3@=
citrix.com>; 'xen-devel' <xen-
> > devel@lists.xenproject.org>
> > Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0=
 in stubdom
> >=20
> > On Fri, Jun 05, 2020 at 04:48:39PM +0100, Paul Durrant wrote:
> > > This (untested) patch might help:
> >=20
> > It is different now. I don't get domain_crash because of
> > X86EMUL_UNHANDLEABLE anymore, but I still see handle_pio looping for
> > some time. But it eventually ends, not really sure why.
>=20
> That'll be the shutdown deferral, which I realised later that I forgot ab=
out...
>=20
> >=20
> > I've tried the patch with a modification to make it build:
> >=20
> > > diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> > > index c55c4bc4bc..8aa8779ba2 100644
> > > --- a/xen/arch/x86/hvm/ioreq.c
> > > +++ b/xen/arch/x86/hvm/ioreq.c
> > > @@ -109,12 +109,7 @@ static void hvm_io_assist(struct hvm_ioreq_vcpu =
*sv, uint64_t data)
> > >      ioreq_t *ioreq =3D &v->arch.hvm.hvm_io.io_req;
> > >
> > >      if ( hvm_ioreq_needs_completion(ioreq) )
> > > -    {
> > > -        ioreq->state =3D STATE_IORESP_READY;
> > >          ioreq->data =3D data;
> > > -    }
> > > -    else
> > > -        ioreq->state =3D STATE_IOREQ_NONE;
> > >
> > >      msix_write_completion(v);
> > >      vcpu_end_shutdown_deferral(v);
>=20
> In fact, move both of these lines...
>=20
> > > @@ -209,6 +204,9 @@ bool handle_hvm_io_completion(struct vcpu *v)
> > >          }
> > >      }
> > >
> > > +    ioreq->state =3D hvm_ioreq_needs_completion(&vio->ioreq) ?
> >        vio->io_req->state ... &vio->io_req
> >=20
> > > +        STATE_IORESP_READY : STATE_IOREQ_NONE;
> > > +
>=20
> ... to here too.
>=20
> > >      io_completion =3D vio->io_completion;
> > >      vio->io_completion =3D HVMIO_no_completion;
> > >
> >=20
> > The full patch (together with my debug prints):
> > https://gist.github.com/marmarek/da37da3722179057a6e7add4fb361e06

The current patch:
https://gist.github.com/marmarek/5ae795129c1be2dae13bfc517547c0f1

> I guess it is the destroy being held off by the shutdown deferral? Hopefu=
lly the above tweaks should sort that out.

Yes, now it works (tried 5 times in a row, previously it crashed on
the first or the second one). Thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--SR0DFWOzPg+ymaCV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl7arl4ACgkQ24/THMrX
1yyZxgf/fHIMG20frDFWRvxY7zz087+IPvXEVpbSqGygPKYP35Zs4qp9vyY0V+wx
Co3y+UGloILRX1/z7+eh2hxDJbXPtMEQGbkF1+SFFDNKhLTX5W0MGmW+ujX37NFP
IvPZf6FsHIfA4GNlf+rlCA7YGO4tWGzSD8QEReqBdoLzkdncfJRbSNtPeu4BV31g
OAKhsDIipu9NeN7qPBJkw49tocgsQPEvlyy7GG45IrlCdE+dRUW69Ukaf2u83sgI
GtJwSNJ0+V/ieFI9pv5cU7mjGgjrhz8s46Tmfq6PUhYJKC4vJ+da1x+LW4NRWkoa
k/78vCkZ/EGAalCDCawPI67foVlHCg==
=Cnfr
-----END PGP SIGNATURE-----

--SR0DFWOzPg+ymaCV--

