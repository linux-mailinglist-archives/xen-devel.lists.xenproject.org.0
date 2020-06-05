Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C4D1EF88E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 15:05:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhC1A-0000Ns-Rj; Fri, 05 Jun 2020 13:04:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wSaP=7S=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jhC18-0000Nn-Qr
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 13:04:15 +0000
X-Inumbo-ID: 0dcbd3b0-a72d-11ea-9b55-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dcbd3b0-a72d-11ea-9b55-bc764e2007e4;
 Fri, 05 Jun 2020 13:04:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C075959D;
 Fri,  5 Jun 2020 09:04:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 05 Jun 2020 09:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=gsMNM6
 L0WQQkqWnkTPeSQhmnMIonhYIndfng/RGnFmc=; b=HI1czHP/JDX0YSS0n8cqj8
 XaqBHO1ZupDP7SvNA7nNGCe9dMgEkQaYMOwJgnOPrE82CJtMRiqehYY3MDwDXelH
 HzjmxyPKYaVB2ljVRj7LH45NI/fR3578yUWTu9UT8n1wcLUq9CjU/iWGapw3BAC2
 1HAbTpoFF420AmHWCJ9WE5hQJFsNOdcLB8c42bODyg+tC3g/e1AEu3DIh15xImnh
 mSHaLSR39ASXw6ck2r36v+8xP+xdFPMd01ROznYp9vBBcZaJ+8euMfkSotW70CQ8
 0y60r+zGp/qmvtgGnl3aH79RZmxG+VEFSn19dhPg6eJwCZrEVFpwNZ4ehyBB4XXQ
 ==
X-ME-Sender: <xms:zELaXgH523bvU7eHsTFwWS8ddi8MdmXofILNAHiWHtZNiRUhBPdpNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegfedghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpedkofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhikdcuoehmrghrmhgrrhgvkhesih
 hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeff
 gfdugeegtdeggeetheefveffteeigeekjedtueelhedtvdeuffejkeelhfekheenucffoh
 hmrghinhepghhithhhuhgsrdgtohhmnecukfhppeeluddrieehrdefgedrfeefnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvg
 hksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:zELaXpUHQvBF0Za524Upa3jzKY3VNOwQ87T5mZdqfFQzqWWRQ_CdFQ>
 <xmx:zELaXqJwqcl1GLvSKSukqs8AMNs5LDyBC7TQknZxvTIysS_tM53c9w>
 <xmx:zELaXiHtka5GC3KZF818Nf_TkQEHm8P_Z5ITNUluu3ueFpwqbiMHhg>
 <xmx:zELaXhC4hQ4OdAQEAnnOrQKPFpbceWtIGVvz2oN6yevN-_uDP_NiYw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5D8B63280059;
 Fri,  5 Jun 2020 09:04:11 -0400 (EDT)
Date: Fri, 5 Jun 2020 15:04:08 +0200
From: 'Marek =?utf-8?Q?Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
To: paul@xen.org
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
Message-ID: <20200605130408.GI98582@mail-itl>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <f22ce6e0-d80b-2fc3-586a-c030fa22b3e8@suse.com>
 <20200605120137.GF98582@mail-itl>
 <000a01d63b36$5ca617b0$15f24710$@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="PqX6tBBuHl4HmZHK"
Content-Disposition: inline
In-Reply-To: <000a01d63b36$5ca617b0$15f24710$@xen.org>
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


--PqX6tBBuHl4HmZHK
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom

On Fri, Jun 05, 2020 at 01:39:31PM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> > Sent: 05 June 2020 13:02
> > To: Jan Beulich <jbeulich@suse.com>
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant <paul@xen.o=
rg>; xen-devel <xen-
> > devel@lists.xenproject.org>
> > Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0=
 in stubdom
> >=20
> > On Fri, Jun 05, 2020 at 11:22:46AM +0200, Jan Beulich wrote:
> > > On 05.06.2020 11:09, Jan Beulich wrote:
> > > > On 04.06.2020 16:25, Marek Marczykowski-G=C3=B3recki wrote:
> > > >> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> > > >> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > > >> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > > >> (XEN) d3v0 handle_pio port 0xb004 write 0x0001
> > > >> (XEN) d3v0 handle_pio port 0xb004 write 0x2001
> > > >> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> > > >> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
> > > >> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> > > >> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> > > >> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> > > >> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> > > >> (XEN) d1v0 handle_pio port 0xb004 write 0x0001
> > > >> (XEN) d1v0 handle_pio port 0xb004 write 0x2001
> > > >> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> > > >> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
> > > >> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> > > >> (XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags 0x=
2 d6
> > > >> (XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags 0x=
2 d6
> > > >> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > > >
> > > > Perhaps in this message could you also log
> > > > v->domain->is_shutting_down, v->defer_shutdown, and
> > > > v->paused_for_shutdown?
> > >
> > > And v->domain->is_shut_down please.
> >=20
> > Here it is:
> >=20
> > (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> > (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_=
shutdown 0 paused_for_shutdown
> > 0 is_shut_down 0
> > (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_=
shutdown 0 paused_for_shutdown
> > 0 is_shut_down 0
> > (XEN) d3v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 defer=
_shutdown 0 paused_for_shutdown
> > 0 is_shut_down 0
> > (XEN) d3v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 defer=
_shutdown 0 paused_for_shutdown
> > 0 is_shut_down 0
> > (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> > (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
> > (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> > (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> > (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_=
shutdown 0 paused_for_shutdown
> > 0 is_shut_down 0
> > (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_=
shutdown 0 paused_for_shutdown
> > 0 is_shut_down 0
> > (XEN) d1v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 defer=
_shutdown 0 paused_for_shutdown
> > 0 is_shut_down 0
> > (XEN) d1v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 defer=
_shutdown 0 paused_for_shutdown
> > 0 is_shut_down 0
> > (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> > (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
> > (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> > (XEN) grant_table.c:3702:d0v1 Grant release 0x3 ref 0x125 flags 0x2 d6
> > (XEN) grant_table.c:3702:d0v1 Grant release 0x4 ref 0x126 flags 0x2 d6
> > (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 1 defer_=
shutdown 1 paused_for_shutdown
> > 0 is_shut_down 0
> > (XEN) d1v0 Unexpected PIO status 1, port 0xb004 read 0xffff
> >=20
> > (and then the stacktrace saying it's from vmexit handler)
> >=20
> > Regarding BUG/WARN - do you think I could get any more info then? I
> > really don't mind crashing that system, it's a virtual machine
> > currently used only for debugging this issue.
>=20
> In your logging, is that handle_pio with is_shutting_down =3D=3D 1 the ve=
ry last one, or is the 'Unexpected PIO' coming from another one issued afte=
rwards?

That's the same function call - handle_pio message is before hvmemul_do_pio=
_buffer() and Unexpected PIO is after.

Here is the current debugging patch: https://gist.github.com/marmarek/da37d=
a3722179057a6e7add4fb361e06

> The reason I ask is that hvmemul_do_io() can call hvm_send_ioreq() to sta=
rt an I/O when is_shutting_down is set, but will write the local io_req.sta=
te back to NONE even when X86EMUL_RETRY is returned. Thus another call to h=
andle_pio() will try to start a new I/O but will fail with X86EMUL_UNHANDLE=
ABLE in hvm_send_ioreq() because the ioreq state in the shared page will no=
t be NONE.

Isn't it a problem that hvm_send_ioreq() can be called called if is_shuttin=
g_down is set?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--PqX6tBBuHl4HmZHK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl7aQscACgkQ24/THMrX
1ywwcQf/Uyl9MhWtHyawitPXnGCrbzUdE2fqJE6R0IKThUCmWa2PIvMIE9HUfvUe
dl5i+gBq1FHYUDSX6M4QxoyCOyw7xnhnJyJFVhMSmljUlqdp73TLYbPdIkgBcX1Z
TF0X4OP4QmtZcArFniYSqhH4NoaILPwBWSF9cfOz2crWUAjEwRBJG9DGwRiuRH9h
DgIQb10a4MOF+hfjjTxWvy3XxQkX3rGaD3k/RjJrhBRLIZs413BMcwyT9WjyfbYJ
+fcyROKEUH7MUe4TZR/NX6YiUPUP1sXKyOGIQirvFu84y0t9WpvCGgpFZCBm2yHx
1px8CN8ypgMNOLw6DQB5TDGn6bE3Lw==
=7dQV
-----END PGP SIGNATURE-----

--PqX6tBBuHl4HmZHK--

