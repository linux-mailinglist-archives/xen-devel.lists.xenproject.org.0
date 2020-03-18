Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E66E6189DB2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 15:19:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEZUv-00060x-Eo; Wed, 18 Mar 2020 14:16:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9IjP=5D=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jEZUu-00060P-1W
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 14:16:40 +0000
X-Inumbo-ID: 15949688-6923-11ea-baf0-12813bfff9fa
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15949688-6923-11ea-baf0-12813bfff9fa;
 Wed, 18 Mar 2020 14:16:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6DEFF5C018A
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 10:16:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 18 Mar 2020 10:16:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=U0vYwlZwaDHJa1ond3KAkdqscjCaS
 9gBHYrbO6GZY+U=; b=Vw/8/1i/LPBEga51ROZckG8KV7UuZV2HKSMhf8pZlZy+D
 m5rbGh1oE4dHVY2HMUp+sHrsmdoCLbwx/3lSlnymx5l78bsRBnYgvu6L19PJZLpo
 Y75ZgCQvbMUT/WjpCAlz5C6bJ9lkdlz9SrcVd3XGhMBKe51S1NhIxusmi71qiP8S
 Q1QvVVQFQSbBZ7xISTSgazCqy8bMaxoQeeKDjZ++CQYyVtI82cHXYGNycnFgYpqN
 T50oE1wtxnKGnce+5g499cgu6KRGyP85cz1HYjDzbmwCSz3lig6SDsMxnjJgQBtb
 JpaBMTvZGlUdzptwEj5Di+hInCp5B4R4Gd2H2VfcA==
X-ME-Sender: <xms:Ry1yXrLdAByeKXZd5jHOIv4zOGDhHhnZ0UgQZi68A-VgIsIdDHebIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefjedgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
 dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
 uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
 cuffhomhgrihhnpehquhgsvghsqdhoshdrohhrghenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Ry1yXusOPD0F66wXo2lqM4WJMeK75hWedrJeseyaioDyvFGyVzjlyg>
 <xmx:Ry1yXnwdUfAKNGp6NMLYV94InXoLAN6wCWAwrpMeejzGvT2sfZtPsQ>
 <xmx:Ry1yXkKFyZz8q6NZKyJjttrwvgafH4glW9k_vdYrunCAGIbQJ_QE5A>
 <xmx:Ry1yXvFXXSQGdR-TttQsd7fr-35qpjefmBwF6rNF4448NzWOyvh3Uw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA8923061856
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 10:16:38 -0400 (EDT)
Date: Wed, 18 Mar 2020 15:16:35 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <20200318141635.GW7869@mail-itl>
MIME-Version: 1.0
Subject: [Xen-devel] Xen crash after S3 suspend - Xen 4.13
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
Content-Type: multipart/mixed; boundary="===============8463786739186477969=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8463786739186477969==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JlQgkxKsF3TswZob"
Content-Disposition: inline


--JlQgkxKsF3TswZob
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Xen crash after S3 suspend - Xen 4.13

Hi,

In my test setup (inside KVM with nested virt enabled), I rather
frequently get Xen crash on resume from S3. Full message below.

This is Xen 4.13.0, with some patches, including "sched: fix resuming
=66rom S3 with smt=3D0".

Contrary to the previous issue, this one does not happen always - I
would say in about 40% cases on this setup, but very rarely on physical
setup.

This is _without_ core scheduling enabled, and also with smt=3Doff.

Do you think it would be any different on xen-unstable? I cat try, but
it isn't trivial in this setup, so I'd ask first.


(XEN) Xen BUG at sched_credit2.c:3474
(XEN) ----[ Xen-4.13.0  x86_64  debug=3Dn   Not tainted ]----
(XEN) CPU:    1
(XEN) RIP:    e008:[<ffff82d08022a60a>] sched_credit2.c#csched2_schedule+0x=
afa/0x1350
(XEN) RFLAGS: 0000000000010097   CONTEXT: hypervisor (d5v0)
(XEN) rax: ffff8300a9845000   rbx: 0000000000000001   rcx: ffff8301ba8fb0e0
(XEN) rdx: 000000000000001b   rsi: ffff8300821dcdd0   rdi: ffff82d0803fa720
(XEN) rbp: ffff82d08053aee0   rsp: ffff8301ba907d68   r8:  0000000000000000
(XEN) r9:  ffff8300a98452b8   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: ffff8301ba8fb238   r13: ffff8300821dcec0   r14: ffff8301ba8fbf70
(XEN) r15: 0000000000000001   cr0: 0000000080050033   cr4: 00000000000026e0
(XEN) cr3: 000000008e85e000   cr2: 00007a169cd25a10
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d08022a60a> (sched_credit2.c#csched2_schedule+=
0xafa/0x1350):
(XEN)  65 10 0f 84 b6 f5 ff ff <0f> 0b 0f 1f 40 00 4c 89 ef e8 b8 bb ff ff =
e9 ee
(XEN) Xen stack trace from rsp=3Dffff8301ba907d68:
(XEN)    ffff82d0803fa720 00000051e8e6c8a5 0000000000000001 ffff8300821dcdd0
(XEN)    ffff82d000000000 0000000000000282 0000000000000001 ba90000100000010
(XEN)    00000051e8e7146c ffff83008ec38090 ffff8301ba907fff ffff8300a9845000
(XEN)    0000000000000000 0000000000000000 ffff8300821dcdd0 ffff8301ba919010
(XEN)    0000000000000000 ffff82d0803fa720 ffff8301ba8fbf70 00000051e8e6c8a5
(XEN)    ffff82d08022f469 ffff82d080229b10 ffff8300821dcdd0 0000000000000001
(XEN)    ffff8300821dcdd0 ffff82d08053aee0 0000000000000001 ffff8301ba919010
(XEN)    ffff83008ec38000 ffff82d080233815 ffff8301ba8fb238 ffff82d08051ff88
(XEN)    00000001ba907ef8 ffff8301ba8fb238 ffff83008ec38000 0000000000000000
(XEN)    ffff82d0802eed2f ffff82d08030e494 ffffffffffffffff ffff82d080524880
(XEN)    ffff82d08052c880 0000000000000001 0000000000000000 0000000000000000
(XEN)    ffff82d080234b51 ffff83008ec38000 0000000000000000 0000000000000000
(XEN)    0000000000000000 ffff82d08031233b ffffffff82614780 0000000000000000
(XEN)    0000000000000000 ffffffff82614780 0000000000000000 0000000000000000
(XEN)    000000000002e2b8 0000000000000000 00000000001b2ff4 0000000000000001
(XEN)    ffffffff81a18a10 0000000000000000 0000000000000000 ffffffff82603e58
(XEN)    0000003d0d5893ff 000000fa00000000 ffffffff81a18dee 0000000000000000
(XEN)    0000000000000246 ffffffff82603e90 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000e01000000001
(XEN)    ffff83008ec38000 000000313a3ea000 00000000000026e0 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d08022a60a>] R sched_credit2.c#csched2_schedule+0xafa/0x13=
50
(XEN)    [<ffff82d08022f469>] S schedule.c#do_schedule+0xb9/0x520
(XEN)    [<ffff82d080229b10>] S sched_credit2.c#csched2_schedule+0/0x1350
(XEN)    [<ffff82d080233815>] S schedule.c#schedule+0x1b5/0x230
(XEN)    [<ffff82d0802eed2f>] S hvm_vcpu_has_pending_irq+0x6f/0x90
(XEN)    [<ffff82d08030e494>] S nvmx_switch_guest+0x94/0x1a40
(XEN)    [<ffff82d080234b51>] S softirq.c#__do_softirq+0x51/0x80
(XEN)    [<ffff82d08031233b>] S vmx_asm_do_vmentry+0x2b/0x30
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 1:
(XEN) Xen BUG at sched_credit2.c:3474
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...

Full serial log:
https://openqa.qubes-os.org/tests/6994/file/serial0.txt

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--JlQgkxKsF3TswZob
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl5yLUIACgkQ24/THMrX
1ywf2wf+JqIr/6sjTWU0TUH8cowDr9uNQuga9vK6TPhi7l3NwK0yh2C6pR52wAsr
u3LWuzsq7T9y5futmm3jnz09IT8A5T0tIqgmO17Kb5Qg0kxWD0sj5RYX+pREgKvm
+zSpTAVXbEwp5O+fTG8H9doKX5GUN/OwoHiHD+G0JyaD+PqMWrcrLz9f/Jt1j3OC
Icrhh/w5UzlGA1FIeXdiD5nZoBenPJCa9dgokPonJzrUIzkCIuAxdDL0UnltLWKe
vN36TZ8QzuM/nwEJr4rPzyK7L8W8WSHF2w3/12aTgMUxqZgW3DVRBe646fm/BOWc
RNyZSSvHnEBhH5i2x0f2IUhHTeXqWw==
=8bfE
-----END PGP SIGNATURE-----

--JlQgkxKsF3TswZob--


--===============8463786739186477969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8463786739186477969==--

