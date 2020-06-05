Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A489E1EF6F2
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 14:02:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhB2f-0002VV-5p; Fri, 05 Jun 2020 12:01:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wSaP=7S=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jhB2d-0002VQ-J1
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 12:01:43 +0000
X-Inumbo-ID: 5155f347-a724-11ea-afa5-12813bfff9fa
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5155f347-a724-11ea-afa5-12813bfff9fa;
 Fri, 05 Jun 2020 12:01:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3384B60F;
 Fri,  5 Jun 2020 08:01:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 05 Jun 2020 08:01:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Tgwya9
 oSsAp2RwRCuoKIgeUwTMvQcQrcDwbg3ZtqayY=; b=OdEo6UUDSaKwwhyYKEHA3M
 ifv1+yHJeWkbUkZvCyh9lllpq/L+Sel3s/wHf6vMXhtw+it8qDVSPPWPrGX0a/G8
 EQXea0W6avwV971LZx3cZhwpDLvJWBwG+gtv4o2nFR2R2yQbr/HaBqCFTtPqh4mS
 65vRlqIk7Cr2VSr0LEdsAWbf06ep1dF+V9ndK+TbWjASpOfmse4SxR70qXQrGrxC
 i58fa6512Qq/bWIJO9Iz1i9Pb6SLEgDTq181SjibKi7LWZrilv9akCqDnNn32NXU
 K+PrI1T2hd+OAsKb0aJtEfe9L1Z/bzVZi0071SDl+NrQih6IIgjF13FXMz58qc2A
 ==
X-ME-Sender: <xms:JDTaXqPIUGgLmkRGsL_UrDYoP90F7qzFRh2Ukkjha0Z-vX-xeh8Kwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegfedggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeihedrfeegrdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
 gtohhm
X-ME-Proxy: <xmx:JDTaXo_74ZZBQP1N-mwVzBNHmh9qdUgPsg6JdTcEnM_D8BEiw9ISJA>
 <xmx:JDTaXhTubief-GV8L_ixe3oywAoA4RVwnrZWiiH6FVcJIi1-XiwT_Q>
 <xmx:JDTaXqvCdItG-5aj8YYu2xL0kMRPHe_YR2Y4wb4Aq-OlVwUQ2o5EOw>
 <xmx:JDTaXkpxzmpD56UJgnosgedONTu1P-2p2N6UdHlQ3v7uL3cdDKkzGQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D094430618B7;
 Fri,  5 Jun 2020 08:01:39 -0400 (EDT)
Date: Fri, 5 Jun 2020 14:01:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
Message-ID: <20200605120137.GF98582@mail-itl>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <f22ce6e0-d80b-2fc3-586a-c030fa22b3e8@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YCGSkTKVt49j0xAo"
Content-Disposition: inline
In-Reply-To: <f22ce6e0-d80b-2fc3-586a-c030fa22b3e8@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--YCGSkTKVt49j0xAo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom

On Fri, Jun 05, 2020 at 11:22:46AM +0200, Jan Beulich wrote:
> On 05.06.2020 11:09, Jan Beulich wrote:
> > On 04.06.2020 16:25, Marek Marczykowski-G=C3=B3recki wrote:
> >> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> >> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >> (XEN) d3v0 handle_pio port 0xb004 write 0x0001
> >> (XEN) d3v0 handle_pio port 0xb004 write 0x2001
> >> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> >> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
> >> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> >> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> >> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> >> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> >> (XEN) d1v0 handle_pio port 0xb004 write 0x0001
> >> (XEN) d1v0 handle_pio port 0xb004 write 0x2001
> >> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> >> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
> >> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> >> (XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags 0x2 d6
> >> (XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags 0x2 d6
> >> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >=20
> > Perhaps in this message could you also log
> > v->domain->is_shutting_down, v->defer_shutdown, and
> > v->paused_for_shutdown?
>=20
> And v->domain->is_shut_down please.

Here it is:

(XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
(XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_shut=
down 0 paused_for_shutdown 0 is_shut_down 0
(XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_shut=
down 0 paused_for_shutdown 0 is_shut_down 0
(XEN) d3v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 defer_shu=
tdown 0 paused_for_shutdown 0 is_shut_down 0
(XEN) d3v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 defer_shu=
tdown 0 paused_for_shutdown 0 is_shut_down 0
(XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
(XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
(XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
(XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
(XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_shut=
down 0 paused_for_shutdown 0 is_shut_down 0
(XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_shut=
down 0 paused_for_shutdown 0 is_shut_down 0
(XEN) d1v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 defer_shu=
tdown 0 paused_for_shutdown 0 is_shut_down 0
(XEN) d1v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 defer_shu=
tdown 0 paused_for_shutdown 0 is_shut_down 0
(XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
(XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
(XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
(XEN) grant_table.c:3702:d0v1 Grant release 0x3 ref 0x125 flags 0x2 d6
(XEN) grant_table.c:3702:d0v1 Grant release 0x4 ref 0x126 flags 0x2 d6
(XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 1 defer_shut=
down 1 paused_for_shutdown 0 is_shut_down 0
(XEN) d1v0 Unexpected PIO status 1, port 0xb004 read 0xffff

(and then the stacktrace saying it's from vmexit handler)

Regarding BUG/WARN - do you think I could get any more info then? I
really don't mind crashing that system, it's a virtual machine
currently used only for debugging this issue.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--YCGSkTKVt49j0xAo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl7aNCAACgkQ24/THMrX
1yyxzgf9HLTtJBMDyDhKjMlHR/zTr/kgWaborb8SY3XT0jFfEGmIN2i+ufMRz/zO
SKDBDRQfLQCINcu+RnkOEHVDrIzkm2zPpW26eeZ7FnlHpMfPhCONp3rekvXgtHUP
+++54nmnAF1QgHLWfznF2DECuLnDETlDQGVSEgb1pcnqEco2NbvPOYZiBDu844hJ
b4aC0caFB+jUEkt16g/RceDaH8XI0sFJ2K+dnoTa7Wa2heWjKAKhXpFoY0NqgUDd
U4usKPo2BVDM2lBJw3FRw/5I4X8q1YeE2D/jACmteOZdn4IIFseo0RHKASdKX8QS
1zcVKCaoE5Xrxt9zq213UpXE87PY2A==
=4JaN
-----END PGP SIGNATURE-----

--YCGSkTKVt49j0xAo--

