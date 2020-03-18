Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AB018A7D4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 23:14:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEgtE-0004rD-40; Wed, 18 Mar 2020 22:10:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9IjP=5D=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jEgtB-0004r8-W4
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 22:10:14 +0000
X-Inumbo-ID: 3d225b8a-6965-11ea-a6c1-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d225b8a-6965-11ea-a6c1-bc764e2007e4;
 Wed, 18 Mar 2020 22:10:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E3E336F1;
 Wed, 18 Mar 2020 18:10:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 18 Mar 2020 18:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3I1nld
 0Owic9yhzYZkozN/h8EzZPUkGWFu3rDqgQANw=; b=cpEzdjdi0u/PB7oMAvsVXm
 kraIelwDw5PHCztKRk/oYa97DPydn9qPxTWEDF1Atj4Zw6Xf+QFEE9sl0j5Cy8P6
 FhVaBC6fUGEH5Umkxl8KAmg/wdT6tUdeEeFkNlPqV+WoG+JAEnYHNbwx+A5UKF6F
 8R3XXaU9CRAYhTJ/Ds2F8uTveB5zaXk42j6TWkF1mdRzR2i9r7mZqLMJa+lmG65e
 b2xgMtIpB9k3OeYrlWYECGPyDQZtq4D4JcQ+vAde5wxAsN7ZP3K2Z+xtcCCVOTvD
 mpbjCRB9QpRJNn6SM1j/7uWYP2wPqWvc7JNzNupsXIbNRNxS/539hTAwidwqYTKg
 ==
X-ME-Sender: <xms:Q5xyXhbrCdurQBtA4-VyC8AWnPFMv7FIxe2xGJ14OgKjAL3ml446Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefjedgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Q5xyXkNkCA2jt7QODiXrgudO5WHoIAsEv0KKldTnSSiSk93woIeYRg>
 <xmx:Q5xyXpcg8X15GDqdsu9rzvwyeQwhGXaN0TcKSq4zBgHahvfaeJJdWQ>
 <xmx:Q5xyXiGmIraBYUGuVVHc_xBIiN26nQhkKcgBuEg7-CR_s1LkW65xZw>
 <xmx:Q5xyXphmazozR73piO59otznWnefDmnG9Y4hdX7dw66n8gcdLZRLVQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id BBE8C30624CC;
 Wed, 18 Mar 2020 18:10:10 -0400 (EDT)
Date: Wed, 18 Mar 2020 23:10:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200318221006.GS18599@mail-itl>
References: <20200318141635.GW7869@mail-itl>
 <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
MIME-Version: 1.0
In-Reply-To: <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============8164832650450552573=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8164832650450552573==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6uWySOjkgtH+Mvsi"
Content-Disposition: inline


--6uWySOjkgtH+Mvsi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Xen crash after S3 suspend - Xen 4.13

On Wed, Mar 18, 2020 at 02:50:52PM +0000, Andrew Cooper wrote:
> On 18/03/2020 14:16, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >
> > In my test setup (inside KVM with nested virt enabled), I rather
> > frequently get Xen crash on resume from S3. Full message below.
> >
> > This is Xen 4.13.0, with some patches, including "sched: fix resuming
> > from S3 with smt=3D0".
> >
> > Contrary to the previous issue, this one does not happen always - I
> > would say in about 40% cases on this setup, but very rarely on physical
> > setup.
> >
> > This is _without_ core scheduling enabled, and also with smt=3Doff.
> >
> > Do you think it would be any different on xen-unstable? I cat try, but
> > it isn't trivial in this setup, so I'd ask first.
> >
> >
> > (XEN) Xen BUG at sched_credit2.c:3474
> > (XEN) ----[ Xen-4.13.0  x86_64  debug=3Dn   Not tainted ]----
>=20
> Any chance you can reproduce with a debug build?
>=20
> There is a good chance that an assertion might fire earlier than this BUG=
().

Got it:

(XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) =3D=3D svc->rqd' faile=
d at sched_credit2.c:2137
(XEN) ----[ Xen-4.13.0  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d08022bee9>] sched_credit2.c#csched2_unit_wake+0=
x174/0x176
(XEN) RFLAGS: 0000000000010097   CONTEXT: hypervisor (d0v1)
(XEN) rax: ffff8301ba8fb198   rbx: ffff83008ea2ae10   rcx: 000000000000001b
(XEN) rdx: ffff8301ba8fb0c0   rsi: ffff8301ba8fb040   rdi: 0000000000000001
(XEN) rbp: ffff8300be84fd30   rsp: ffff8300be84fd10   r8:  deadbeefdeadf00d
(XEN) r9:  deadbeefdeadf00d   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: ffff83008ea2af30   r13: ffff82d080430720   r14: 0000000000000001
(XEN) r15: 0000004177a8cc12   cr0: 0000000080050033   cr4: 00000000000006e0
(XEN) cr3: 000000010e658000   cr2: 0000599b4e014010
(XEN) fsb: 00007d6c53bfd700   gsb: ffff88813ff00000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d08022bee9> (sched_credit2.c#csched2_unit_wake=
+0x174/0x176):
(XEN)  ef e8 e4 c3 ff ff eb a7 <0f> 0b 55 48 89 e5 41 57 41 56 41 55 41 54 =
53 48
(XEN) Xen stack trace from rsp=3Dffff8300be84fd10:
(XEN)    ffff83008dc3b000 ffff83008ea2ae10 ffff83008ea2ae10 ffff8301ba8fb198
(XEN)    ffff8300be84fd78 ffff82d0802346c6 0000000000000202 ffff8301ba8fb198
(XEN)    ffff83008dc3b000 ffff83011e6e4000 00007d6c503d2010 0000000000000000
(XEN)    0000000000000001 ffff8300be84fd90 ffff82d0802082f1 ffff83011e6e4000
(XEN)    ffff8300be84fda8 ffff82d08020843e 0000000000000000 ffff8300be84fec0
(XEN)    ffff82d080205ea5 0000000000000206 ffff830100e16060 0000000000007f88
(XEN)    ffff8301ba88b000 ffff8300be84fdf8 ffff82d08023bae1 ffff8301ba88b068
(XEN)    ffff82d080557300 ffff8300be84fe50 0000000000000206 0000001200000004
(XEN)    00007d6c2f6b0005 00007d6c3c00a250 0000000000000005 0000000000000001
(XEN)    00007d6c2f6b0189 000000030000007c 00007d6c10000e20 ffff010a00000005
(XEN)    000000000002cf56 000000000002e846 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000001 0000000554eea2c6 0000000000000001
(XEN)    7ba0548d00000000 ffff8300be84fef8 ffff8301ba88b000 0000000000000001
(XEN)    0000000000000000 0000000000000000 ffff8300be84fee8 ffff82d08034d922
(XEN)    ffff8301ba88b000 0000000000000000 0000000000000000 00007cff417b00e7
(XEN)    ffff82d080354432 ffff88813a157100 00007d6c53bfc590 00007d6c53bfc590
(XEN)    ffff8881358ad3e8 ffff88813a157100 ffff88813a157101 0000000000000282
(XEN)    0000000000000000 ffffc90001953e08 0000000000000000 0000000000000024
(XEN)    ffffffff8100148a 0000000000000000 0000000000000000 00007d6c503d2010
(XEN)    0000010000000000 ffffffff8100148a 000000000000e033 0000000000000282
(XEN) Xen call trace:
(XEN)    [<ffff82d08022bee9>] R sched_credit2.c#csched2_unit_wake+0x174/0x1=
76
(XEN)    [<ffff82d0802346c6>] F vcpu_wake+0xdd/0x3ff
(XEN)    [<ffff82d0802082f1>] F domain_unpause+0x2f/0x3b
(XEN)    [<ffff82d08020843e>] F domain_unpause_by_systemcontroller+0x40/0x60
(XEN)    [<ffff82d080205ea5>] F do_domctl+0x9e4/0x1952
(XEN)    [<ffff82d08034d922>] F pv_hypercall+0x548/0x560
(XEN)    [<ffff82d080354432>] F lstar_enter+0x112/0x120
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'c2rqd(ops, sched_unit_master(unit)) =3D=3D svc->rqd' faile=
d at sched_credit2.c:2137
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--6uWySOjkgtH+Mvsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl5ynD4ACgkQ24/THMrX
1yzENgf/eN963BAFFsTvPyEvn43PbEmE7F9YZGGdSFAfAm4i7CtUcGCmGCAoUtM7
3pnyoeFfPYye5gwWVmhdJz6EqeulT0K18g5L811sar2aLA9rpmqfyG9xnFgT4MTe
zlFjqm25HElbYI81JRu1UDLipDNcP2yzIKT2P3rbK4As4Ue+2NN5PJhbi8VLHuZC
W2bhcH0uuWHqHw0UoqiETEtLld0RjxQqMwjJsrsq1xbKzv4Of5bUBcWK/CXF1Y2Z
S/oI6pZqAKjlb3uT2wDbCP6WO0SJN1g464STtvjYOH8qpW2jhu3t1T7VInz9Jrfc
r0AK6XGOIieD7ACJVauw9cBvAWDwgw==
=filT
-----END PGP SIGNATURE-----

--6uWySOjkgtH+Mvsi--


--===============8164832650450552573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8164832650450552573==--

