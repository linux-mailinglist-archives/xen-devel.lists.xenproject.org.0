Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B37AAB5D0C
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 21:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983503.1369794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEvAo-00075b-Uu; Tue, 13 May 2025 19:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983503.1369794; Tue, 13 May 2025 19:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEvAo-000735-RV; Tue, 13 May 2025 19:20:18 +0000
Received: by outflank-mailman (input) for mailman id 983503;
 Tue, 13 May 2025 19:20:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sxcy=X5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uEvAn-00072z-8E
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 19:20:17 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a44d004-302f-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 21:20:14 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 0A49913801B5;
 Tue, 13 May 2025 15:20:11 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Tue, 13 May 2025 15:20:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 May 2025 15:20:10 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 4a44d004-302f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1747164011; x=1747250411; bh=iD
	qe/w7TN+oKsfF9smG7KFAElDed+5wEvRF9T0RhlQU=; b=tkRZTvJznwKWUKZgrr
	Pujk1dJjVnfVGLp57d38hhNxNfv/T/YLNqtR9rYkKmt5GviluASTMP6SwctgDwSO
	pBzdXOJrxt2wmze49Jke5LmxQw6WWDKKGSHZsX9Md8XupONsAVXJyk7dC8kLvdMN
	ji6U1sDyIll186tPymuhE1AWbYgM2r5EG2bU4auJlLrDvyHxZ9rgHxOu6WJ/rLun
	Uo7dCsfDh3IGLkVJgY6NjxfON6XTdsGHi8vX6zGLKAmAFRPumtLWz0nkGE9NT0QU
	2LzLXPYRI92cGpVfyzXDBNu5xnjt20zauL7iwyDVg3RJ0qi6BwZG9s2EmTIwr1QP
	L7DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747164011; x=
	1747250411; bh=iDqe/w7TN+oKsfF9smG7KFAElDed+5wEvRF9T0RhlQU=; b=b
	FeZE0hBHtcH9eb4b6TJwso+zH8lvR/WWZwmipwECyWhPen594TsgXYaMxxn0ZtL5
	koVn/nsd1x/ZY6Ygtk0RkZZyb8N7CM8BTXYHDRNf8ZmJkFpilGFMGTOS0pMLbESH
	Ad2GpKEmuhQTco9Oa9xho+G1aBNCDRwMK6ctJ3WbNsqWvZJH9gHfNHbvwbOx0kpd
	+TLyV/O+G8ld8rPnWDevUuXszCqospfwEiPKZr+2JxGmsM56VDdZxR2FSAljCMeL
	XvIyjoUGuWaEuND0vDWRh0EmZj/TUH4GIGfj0Qk7W7hZLoHal92aILt3Ajh3PWgM
	IJ0r+jcYgEBAcudrgV28A==
X-ME-Sender: <xms:apsjaPnnUPtQUv2J1Zu26OxjSx7PUZTV5JyB_JEzhHrJMLPctFR9Ow>
    <xme:apsjaC2XXsEK_fY53JBZomEbIuUBNh2v9D7woOuMMGJYzZJgYKXlAozoaOZnDaKnr
    w9vlTr_GlGF_g>
X-ME-Received: <xmr:apsjaFok9avIYrAdxDmbZwYcV2EzYUlQDsbKIe4jqS-x3sBDu_jBFxxc8E6MaUWCwfq6kcMpnvEmlOURtUvcT-5De6-OxHZVUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegleefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkgggtugesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhephfetuefhiefgtddtlefggffggeevhedtvdefffeugfeiieeiheefte
    efgefggeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnph
    hrohhjvggtthdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidr
    tghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtoh
    hm
X-ME-Proxy: <xmx:apsjaHnC5EndmAANaFOC6mcEQ5-Q98n4iAUslz7NJQLp5035XkaHrw>
    <xmx:apsjaN1H726tVEGsoh_2u07xYtseId4_8c5eGSwpXgebydR84P-a7w>
    <xmx:apsjaGvDFJ2qAWjFcOKS9aPlDGhESb_ihK2Z5QFBIuau4PzSGZ5z7A>
    <xmx:apsjaBXoquyyW-vrB-URet5sTL5kyMEVvQY8lv-abPh-pZZ18M46qw>
    <xmx:a5sjaHPYgKznOnclwzd2IZ4zaSfR3XWXiaqFih8WqgG6bfp6zjM6ds1B>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 13 May 2025 21:20:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Assertion 'desc->arch.creator_domid == DOMID_INVALID' failed
Message-ID: <aCObaP4xs158L5tV@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/BvfcpyxYdgDCW1s"
Content-Disposition: inline


--/BvfcpyxYdgDCW1s
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 May 2025 21:20:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Assertion 'desc->arch.creator_domid == DOMID_INVALID' failed

Hi,

When debugging CI job on Linus' master branch, I added "console=3Dvga vga=
=3D,keep" and got PV dom0 crash Xen with:

(XEN) [   40.870435] Assertion 'desc->arch.creator_domid =3D=3D DOMID_INVAL=
ID' failed at arch/x86/irq.c:294
(XEN) [   40.886925] ----[ Xen-4.21-unstable  x86_64  debug=3Dy ubsan=3Dy  =
Not tainted ]----
(XEN) [   40.903356] CPU:    10
(XEN) [   40.919824] RIP:    e008:[<ffff82d04059d2ed>] create_irq+0x272/0x3=
39
(XEN) [   40.936267] RFLAGS: 0000000000010297   CONTEXT: hypervisor (d0v13)
(XEN) [   40.952709] rax: 00000000fffffff4   rbx: ffff830498007c00   rcx: 0=
000000000001899
(XEN) [   40.969147] rdx: ffff830498007c5e   rsi: 0000000000000002   rdi: f=
fff83049830e398
(XEN) [   40.985892] rbp: ffff830498307d18   rsp: ffff830498307ce8   r8:  0=
000000000000000
(XEN) [   41.003093] r9:  0000000000000000   r10: 0000000000000000   r11: 0=
000000000000000
(XEN) [   41.020279] r12: 00000000fffffff4   r13: 000000000000007c   r14: f=
fffffffffffffff
(XEN) [   41.037489] r15: 000000000000007c   cr0: 0000000080050033   cr4: 0=
000000000b526e0
(XEN) [   41.054699] cr3: 0000000492c34000   cr2: ffff8881001603f0
(XEN) [   41.071904] fsb: 0000000000000000   gsb: ffff8882365ac000   gss: 0=
000000000000000
(XEN) [   41.089116] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010  =
 cs: e008
(XEN) [   41.106320] Xen code around <ffff82d04059d2ed> (create_irq+0x272/0=
x339):
(XEN) [   41.123521]  3f d9 ff e9 cc fe ff ff <0f> 0b 48 8d 3d 5a a0 29 00 =
e8 f4 3d d9 ff c6 43
(XEN) [   41.140739] Xen stack trace from rsp=3Dffff830498307ce8:
(XEN) [   41.157931]    000000ff00000001 ffff830497faa000 ffff830498307e00 =
00000000ffffffff
(XEN) [   41.175132]    0000000000010000 ffff830497faa160 ffff830498307d70 =
ffff82d0405a6f85
(XEN) [   41.192351]    00000000000002a0 ffff830498307e24 0000000000000200 =
00000000ffffffff
(XEN) [   41.209551]    ffff830497faa000 0000000000000000 ffff830497faa168 =
0000000000010000
(XEN) [   41.226753]    ffff830497faa160 ffff830498307de0 ffff82d0405c9ea6 =
5f24a0ddbbeda194
(XEN) [   41.244062]    ffff830498307e10 0000000000000000 0000000000000001 =
ffff830498307e00
(XEN) [   41.261387]    ffff830498307e24 ffff830498307e20 ffff830497faa000 =
ffff830498307ef8
(XEN) [   41.278730]    ffff830497faa000 ffff830497f5a000 ffffc9004002ba78 =
ffff830498307e68
(XEN) [   41.296052]    ffff82d0405cbd4f ffff82d04053fc3e ffffc9004002ba78 =
00000000000000a0
(XEN) [   41.313381]    00a0fb0000000001 0000000000000000 0000000000007ff0 =
ffffffffffffffff
(XEN) [   41.330708]    000000a000000000 0000000000000000 0000000000000000 =
ffff830498307ef8
(XEN) [   41.348026]    ffff830497f5a000 0000000000000021 0000000000000000 =
ffffc9004002ba78
(XEN) [   41.365357]    ffff830498307ee8 ffff82d0405427db ffff8881d6961b40 =
0000000000000001
(XEN) [   41.382680]    000000a000000000 000000000000000d 0000000000000000 =
ffff830498307ee8
(XEN) [   41.400003]    ffff82d0405e7bc2 ffff830497f5a000 0000000000000000 =
ffff830497f5a000
(XEN) [   41.417343]    0000000000000000 0000000000000000 ffff830498307fff =
0000000000000000
(XEN) [   41.434674]    00007cfb67cf80e7 ffff82d0402012d3 ffff8881d6961b40 =
ffff888100ef30c0
(XEN) [   41.452010]    0000000000000001 0000000000000005 0000000000000000 =
ffff888100ef3000
(XEN) [   41.469342]    0000000000000202 0000000000000001 0000000000007ff0 =
ffff8881d6961b40
(XEN) [   41.486681]    0000000000000021 ffffffff8229d355 000000a000000000 =
ffffc9004002ba78
(XEN) [   41.504015] Xen call trace:
(XEN) [   41.521314]    [<ffff82d04059d2ed>] R create_irq+0x272/0x339
(XEN) [   41.538636]    [<ffff82d0405a6f85>] F allocate_and_map_msi_pirq+0x=
51/0x5ec
(XEN) [   41.555960]    [<ffff82d0405c9ea6>] F physdev_map_pirq+0xbf6/0xd30
(XEN) [   41.573282]    [<ffff82d0405cbd4f>] F do_physdev_op+0x1373/0x2c4c
(XEN) [   41.590618]    [<ffff82d0405427db>] F pv_hypercall+0x6be/0x838
(XEN) [   41.607947]    [<ffff82d0402012d3>] F lstar_enter+0x143/0x150
(XEN) [   41.625269]=20
(XEN) [   41.836038]=20
(XEN) [   41.854778] ****************************************
(XEN) [   41.877320] Panic on CPU 10:
(XEN) [   41.897494] Assertion 'desc->arch.creator_domid =3D=3D DOMID_INVAL=
ID' failed at arch/x86/irq.c:294
(XEN) [   41.924180] ****************************************

I got it twice in a row already, so looks rather reliable. As you can
see by the timestamps, it's (expectedly) rather slow - I guess that's
relevant.

This is Xen staging from yesterday. It's on the ADL runner, haven't
tried this one on others yet.

Full console log at https://gist.github.com/marmarek/47d70eb68db03caff14dfb=
b936f9149b

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/BvfcpyxYdgDCW1s
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgjm2gACgkQ24/THMrX
1yyY6gf+K3prYvoBDV7cb5nf7SQkHjpk5aHp3tzXcAkQslDCufeXS9H5m0epdOXt
V2dtEhD3MtG5wc0xY5n+2x6p79/q4t9U4LCrf1b2QkkllmrmZTHTDI7+PcbYdxEj
2XlxRkIrkeO/B16C9tGonppmwHtHeH8Z3BlcKd2nC3FAgRtoxnLVzI18mCwJzCA/
4C7GLLiS6w5dGiO4h3rs6cXj8iyQ77zvY/WxlLNGNbCQw9EhGUYvKeYozy8j2i9x
2VKL1TXQwxeIvzwhxtjmJdXoUlTLgQ9Wh0F6to4mkDVxG+G6uaHkiIf480JZKWCd
ZzeRXcK1gJd1gbYcKZviwAwgPA3PsQ==
=5Mle
-----END PGP SIGNATURE-----

--/BvfcpyxYdgDCW1s--

