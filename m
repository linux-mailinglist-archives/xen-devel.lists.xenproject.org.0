Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9943F1EDAB1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 03:47:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgexg-00012w-C9; Thu, 04 Jun 2020 01:46:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SnWc=7R=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jgexe-00012r-IE
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 01:46:26 +0000
X-Inumbo-ID: 3324945e-a605-11ea-ade5-12813bfff9fa
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3324945e-a605-11ea-ade5-12813bfff9fa;
 Thu, 04 Jun 2020 01:46:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 155DD5C00B7
 for <xen-devel@lists.xenproject.org>; Wed,  3 Jun 2020 21:46:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 03 Jun 2020 21:46:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=bx/CQ+vstaFVaJlSsi8G0wcmiGz0b
 8b7zkvx/mq9B/M=; b=0lLRWR14PXyb6sC7675eRhGPAyzTluc6zfYOe4egM4z/P
 GmcqrCtwasfY3lOQt6JCaktpNPakAVN86NQbWTAVmrsLDJjfyE4OtA3k5sLxti6N
 iUpfUfAvca4vudlgriJ854So5ywp6kNeWElvCne2xFi4AlQpFjqRyUAcwBw8Qs/k
 MY9iNeXr+5YtSXEhmEDrzclUBT1o6rtf1C9yy95PBw2OpxmJFKX5L6YsIBqQimvc
 98GgA1Nd+Hd7p4+ljPfKNzc8V1TcNI3DsVunfY6esyCXKr0n5CGr0jUXwBSDD0bn
 gGKlWFH6pZPEvrdqTT4G4rQIHOqgCx1Um5H4jZttg==
X-ME-Sender: <xms:cFLYXiRjOgoJ6eBTI-lYVDwS_Fww9Qme1mnF1sgTKd_h-4RsUlRI1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegtddggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
 dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
 uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
 cuggftrfgrthhtvghrnhepteduteeiudevkeegvefhtdekhfelgffhhedukedvvdeuuddv
 jeehvddtieehudfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepledurd
 eihedrfeegrdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
 hm
X-ME-Proxy: <xmx:cFLYXnyqFLVEzEQQSCmU9IHmMfucuUVylMCUDAIwHiErpv59zNfCig>
 <xmx:cFLYXv1WqFRYcEzezuV1zspEuPMd5N9ARlsg6ysGBRC6pIG10UpN_Q>
 <xmx:cFLYXuDD8yXNCv3GncGZvDAkAdgz0X6QxwFVpY1NFcGbCq6ohwS6Ww>
 <xmx:cVLYXujBXxkiAD61Z4wq2McrLSo5l_qnyHU-JyKGeRYDT9F2EE1puQ>
Received: from mail-itl (unknown [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8630C30614FA
 for <xen-devel@lists.xenproject.org>; Wed,  3 Jun 2020 21:46:24 -0400 (EDT)
Date: Thu, 4 Jun 2020 03:46:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: handle_pio looping during domain shutdown, with qemu 4.2.0 in stubdom
Message-ID: <20200604014621.GA203658@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
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


--bg08WKrSYDhXBjb5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: handle_pio looping during domain shutdown, with qemu 4.2.0 in stubdom

Hi,

(continuation of a thread from #xendevel)

During system shutdown quite often I hit infinite stream of errors like
this:

    (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
    (XEN) domain_crash called from io.c:178

This is all running on Xen 4.13.0 (I think I've got this with 4.13.1
too), nested within KVM. The KVM part means everything is very slow, so
various race conditions are much more likely to happen.

It started happening not long ago, and I'm pretty sure it's about
updating to qemu 4.2.0 (in linux stubdom), previous one was 3.0.0.

Thanks to Andrew and Roger, I've managed to collect more info.

Context:
    dom0: pv
    dom1: hvm
    dom2: stubdom for dom1
    dom3: hvm
    dom4: stubdom for dom3
    dom5: pvh
    dom6: pvh

It starts I think ok:

    (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
    (XEN) d3v0 handle_pio port 0xb004 read 0x0000
    (XEN) d3v0 handle_pio port 0xb004 read 0x0000
    (XEN) d3v0 handle_pio port 0xb004 write 0x0001
    (XEN) d3v0 handle_pio port 0xb004 write 0x2001
    (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
    (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
    (XEN) d1v0 handle_pio port 0xb004 read 0x0000
    (XEN) d1v0 handle_pio port 0xb004 read 0x0000
    (XEN) d1v0 handle_pio port 0xb004 write 0x0001
    (XEN) d1v0 handle_pio port 0xb004 write 0x2001
    (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0

But then (after a second or so) when the toolstack tries to clean it up,
things go sideways:

    (XEN) d0v0 XEN_DOMCTL_destroydomain domain 6
    (XEN) d0v0 XEN_DOMCTL_destroydomain domain 6 got domain_lock
    (XEN) d0v0 XEN_DOMCTL_destroydomain domain 6 ret -85
    (XEN) d0v0 XEN_DOMCTL_destroydomain domain 6
    (XEN) d0v0 XEN_DOMCTL_destroydomain domain 6 got domain_lock
    (XEN) d0v0 XEN_DOMCTL_destroydomain domain 6 ret -85
    (... long stream of domain destroy that can't really finish ...)
   =20
And then, similar also for dom1:

    (XEN) d0v1 XEN_DOMCTL_destroydomain domain 1
    (XEN) d0v1 XEN_DOMCTL_destroydomain domain 1 got domain_lock
    (XEN) d0v1 XEN_DOMCTL_destroydomain domain 1 ret -85
    (... now a stream of this for dom1 and dom6 interleaved ...)

At some point, domain 2 (stubdom for domain 1) and domain 5 join too.=20

Then, we get the main issue:

    (XEN) d3v0 handle_pio port 0xb004 read 0x0000
    (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
    (XEN) domain_crash called from io.c:178

Note, there was no XEN_DOMCTL_destroydomain for domain 3 nor its stubdom
yet. But XEN_DMOP_remote_shutdown for domain 3 was called already.

Full log of the shutdown:
https://gist.github.com/marmarek/fbfe1b5d8f4c7b47df5a5e28bd95ea66

And the patch adding those extra messages:
https://gist.github.com/marmarek/dc739a820928e641a1ed6b4759cdf6f3

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl7YUmwACgkQ24/THMrX
1yzCSQf+OAz2io9qtyBkdpqNjDPcLtz8DfIxhftj9CV/Rp2kqTc/Idl0bxoufa3A
pGIyfp9XIlytEg1c34fwJq8/fQQ2sBLol78wlJI4eW2oi5bJktFjZUi425UJOGc5
ttXMRAZimXswr8FAtcaqw+lbKhbkdZufcNagEAqIdzD37SvKl7ZT7nIbJfSbHPcc
ubxGZ+pBvpvL8bhCsgGCkEkNCfMI0AFXViJJbsTH0iFp3NI7IsF4DH8b2uk5ohvB
UXgpubEfhOteBFEbvHVAjEfnU6Z+HE1p+N185WI+l+kFN6vgpihfoCjn7ix4kToQ
/zggge9iTxL6JC5ycKGbFkt6mKdSWw==
=OgE6
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--

