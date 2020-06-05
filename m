Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C3F1EFEA0
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 19:15:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhFuu-0001uA-NC; Fri, 05 Jun 2020 17:14:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wSaP=7S=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jhFus-0001u5-NF
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 17:14:02 +0000
X-Inumbo-ID: f2aff4c6-a74f-11ea-affe-12813bfff9fa
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2aff4c6-a74f-11ea-affe-12813bfff9fa;
 Fri, 05 Jun 2020 17:14:00 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id AD5929EB;
 Fri,  5 Jun 2020 13:13:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 05 Jun 2020 13:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EP/+Sz
 PHO77unTFmopxaGtILBXPwmsHYBesDt1ZC6Xc=; b=BSCxHeLqwlA9jWZz2seMOZ
 ZzJgHs3sA34Ie4WlZ68Wh6BEhfa3D04x6NmclfOw8HgpRDEFIRS5DY1+L0GUO9Cv
 DFK6dseHIOsLiMCyFpBGNKfV59ltsAEcdFmYl7T3dUKqT2xXt7W0ctGVH8muArH9
 8uyEOYXLhEQmQ7ego8LY//yrcJ5InwxyczYTE4KjmqBcW3+PMbZEmmLWoKzlamlp
 m+ZhBUXfRf4y3tlw8tjs+IumTcFz5moOO1h2igjo6ObeExZ6Ffe1w55vyupR8YfA
 HB+99s1fKdXLLkftlE/Ed/nbdxeQbCn+MoHxwz3wMPTPBU2dgvhonNcMKaPSVJEw
 ==
X-ME-Sender: <xms:Vn3aXtNUpozRIr8Y1YZ_30zfyz-l_laps5SvMwhBjFN9v5NSgZa05g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegfedgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpedkofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhikdcuoehmrghrmhgrrhgvkhesih
 hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeff
 gfdugeegtdeggeetheefveffteeigeekjedtueelhedtvdeuffejkeelhfekheenucffoh
 hmrghinhepghhithhhuhgsrdgtohhmnecukfhppeeluddrieehrdefgedrfeefnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvg
 hksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Vn3aXv_LgccL8GM_ctqzGIh_WalQYbZ6KgKCNV7gZbPRimcfC3udNw>
 <xmx:Vn3aXsRN_7doWQhUgYwdofgE74UlljHn7ZsU7FeGy-kndqEeQ4tacQ>
 <xmx:Vn3aXpugJaWPUgHdrGIx_kwsQXrpqWfONJ-1K3LEWzVN0sJ30PQhQw>
 <xmx:V33aXrrfDaK-9N3WY116Svz1KZ5nehNQg3jri5LT3wEG4Rxw_AGgEw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 32B7330618C1;
 Fri,  5 Jun 2020 13:13:58 -0400 (EDT)
Date: Fri, 5 Jun 2020 19:13:53 +0200
From: 'Marek =?utf-8?Q?Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
To: paul@xen.org
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
Message-ID: <20200605171353.GG6329@mail-itl>
References: <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <000501d63b29$496ce6e0$dc46b4a0$@xen.org>
 <000701d63b2c$10536930$30fa3b90$@xen.org>
 <0296d5d6-cc7f-6e34-2403-acf34b870b5b@suse.com>
 <002101d63b3f$4e9dc830$ebd95890$@xen.org>
 <e2b8dd67-59c2-7e59-36f6-ce30b2df8b86@suse.com>
 <002201d63b40$1e135ee0$5a3a1ca0$@xen.org>
 <002f01d63b50$c8b49a70$5a1dcf50$@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Content-Disposition: inline
In-Reply-To: <002f01d63b50$c8b49a70$5a1dcf50$@xen.org>
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


--KdquIMZPjGJQvRdI
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom

On Fri, Jun 05, 2020 at 04:48:39PM +0100, Paul Durrant wrote:
> This (untested) patch might help:

It is different now. I don't get domain_crash because of
X86EMUL_UNHANDLEABLE anymore, but I still see handle_pio looping for
some time. But it eventually ends, not really sure why.

I've tried the patch with a modification to make it build:

> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> index c55c4bc4bc..8aa8779ba2 100644
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -109,12 +109,7 @@ static void hvm_io_assist(struct hvm_ioreq_vcpu *sv,=
 uint64_t data)
>      ioreq_t *ioreq =3D &v->arch.hvm.hvm_io.io_req;
>=20
>      if ( hvm_ioreq_needs_completion(ioreq) )
> -    {
> -        ioreq->state =3D STATE_IORESP_READY;
>          ioreq->data =3D data;
> -    }
> -    else
> -        ioreq->state =3D STATE_IOREQ_NONE;
>=20
>      msix_write_completion(v);
>      vcpu_end_shutdown_deferral(v);
> @@ -209,6 +204,9 @@ bool handle_hvm_io_completion(struct vcpu *v)
>          }
>      }
>=20
> +    ioreq->state =3D hvm_ioreq_needs_completion(&vio->ioreq) ?
       vio->io_req->state ... &vio->io_req

> +        STATE_IORESP_READY : STATE_IOREQ_NONE;
> +
>      io_completion =3D vio->io_completion;
>      vio->io_completion =3D HVMIO_no_completion;
>=20

The full patch (together with my debug prints):
https://gist.github.com/marmarek/da37da3722179057a6e7add4fb361e06

Note some of those X86EMUL_UNHANDLEABLE logged below are about an
intermediate state, not really hvmemul_do_io return value.

And the log:
(XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
(XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_shut=
down 0 paused_for_shutdown 0 is_shut_down 0
(XEN) emulate.c:263:d3v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from hvm_io=
_intercept req state 1
(XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_shut=
down 0 paused_for_shutdown 0 is_shut_down 0
(XEN) d3v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 defer_shu=
tdown 0 paused_for_shutdown 0 is_shut_down 0
(XEN) emulate.c:263:d3v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from hvm_io=
_intercept req state 1
(XEN) d3v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 defer_shu=
tdown 0 paused_for_shutdown 0 is_shut_down 0
(XEN) emulate.c:263:d3v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from hvm_io=
_intercept req state 1
(XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
(XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
(XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
(XEN) d4v0 hvm_destroy_ioreq_server called for 3, id 0
(XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
(XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_shut=
down 0 paused_for_shutdown 0 is_shut_down 0
(XEN) emulate.c:263:d1v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from hvm_io=
_intercept req state 1
(XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_shut=
down 0 paused_for_shutdown 0 is_shut_down 0
(XEN) d1v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 defer_shu=
tdown 0 paused_for_shutdown 0 is_shut_down 0
(XEN) emulate.c:263:d1v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from hvm_io=
_intercept req state 1
(XEN) d1v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 defer_shu=
tdown 0 paused_for_shutdown 0 is_shut_down 0
(XEN) emulate.c:263:d1v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from hvm_io=
_intercept req state 1
(XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
(XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
(XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
(XEN) grant_table.c:3702:d0v0 Grant release 0x24 ref 0x199 flags 0x2 d5
(XEN) grant_table.c:3702:d0v0 Grant release 0x25 ref 0x19a flags 0x2 d5
(XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags 0x2 d6
(XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags 0x2 d6
(XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 1 defer_shut=
down 1 paused_for_shutdown 0 is_shut_down 0
(XEN) emulate.c:263:d3v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from hvm_io=
_intercept req state 1
(XEN) d3v0 handle_pio port 0xb004 write 0xe3f8 is_shutting_down 1 defer_shu=
tdown 1 paused_for_shutdown 0 is_shut_down 0
(XEN) emulate.c:263:d3v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from hvm_io=
_intercept req state 1
(XEN) d3v0 handle_pio port 0xb000 read 0x0000 is_shutting_down 1 defer_shut=
down 1 paused_for_shutdown 0 is_shut_down 0
(XEN) d3v0 handle_pio port 0xb000 read 0x0000 is_shutting_down 1 defer_shut=
down 1 paused_for_shutdown 0 is_shut_down 0

The last one repeats for some time, like 30s or some more (18425 times).
Note the port is different than before. Is it a guest waiting for being
destroyed after requesting so?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl7afVMACgkQ24/THMrX
1yy11wf+K4pJpbx8IauOhjfXwPJhuxDXEJKgqBnyutENjl9GriEfo+45LDCJRdDj
YXX78bYRS7j+eefmzmXKI6zXFVABmFfv99kZCJcfeFJFydAa9TqJDbpsZwchPQgI
0qv1+astDYS3bL1+iADVctbO5trYZC+QKkNkZngOUvV9Mj3nk+45UBt1V1W1cNg1
QeoWokPRphQmtriwq2QQvfNFS6+ntEEiZPsy9KUmv2Gax3W7YoJC2syplK1WUbIJ
Pe2HgE1Zwub0jyr/7sFHB10ZKjoC8VByTdqSNAm3spiBKKsk+pbrMyAZUhj6CAd0
X5VE3MvwKGEk6vNA2EQfJwbLoNlBVw==
=Fr7J
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--

