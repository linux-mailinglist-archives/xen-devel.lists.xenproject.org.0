Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D27AB6649
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 10:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984085.1370251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF7jI-0005rn-DR; Wed, 14 May 2025 08:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984085.1370251; Wed, 14 May 2025 08:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF7jI-0005pF-Ag; Wed, 14 May 2025 08:44:44 +0000
Received: by outflank-mailman (input) for mailman id 984085;
 Wed, 14 May 2025 08:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfaI=X6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uF7jG-0005p9-Ma
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 08:44:42 +0000
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac249de2-309f-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 10:44:40 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id CEA4E25401A7;
 Wed, 14 May 2025 04:44:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 14 May 2025 04:44:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 May 2025 04:44:37 -0400 (EDT)
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
X-Inumbo-ID: ac249de2-309f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747212278;
	 x=1747298678; bh=PixPq2A5C5ojjRkw3+Yp0ohQCFr6NmwRCmKaQG1C4t4=; b=
	Y7kWdbnOmCUDl9w+eKe/WPf9S1XHDHzKGkX1DWKroGV4NXu4IZAFvdt2zikYGQDB
	JyGcSk/LJDDe3qIfAWh3Ak7r0wppsO0+UfY80hhxxuPBH28nEV7aka7YnkZQnlr/
	Lp7IP5XhG/ShdzGiWYvSgyPRtpTNNIwgCVlH7vTRlE17LVxpg0SFxIGr1wX6Jf7G
	SHeaAxq+vVEQ2Bycz+PGUbTuXmR8p794nljaXejfE0J9PU6rHLnCEHvkpoflYQBB
	yuWCV3yeW85UnDs5jhZss6EBw8cAuaVAPLb3diZ543x7CfLgogQX8GODzWoNlD2/
	AGStHdLTDBAPArXteZqrIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747212278; x=1747298678; bh=PixPq2A5C5ojjRkw3+Yp0ohQCFr6NmwRCmK
	aQG1C4t4=; b=l5zala0AgaUiCdz4WSLEgUClJLbtinwpngAljiOmFSYGV+b2e34
	u/OhltWvkIuPh0mEUekSA+6EdvYOueyId3AKBv3NmTb7hYIlx4YZ4k0swbmn2Dt8
	ea7mWkvBZM5k7YkmhUfSQU6vIC/Pz3wMQwnJcU3PnlWkTUjpo0hX0eZdvUobDlw/
	aoQEnYZSko7XYC2+eNX3hh6rs04tbk1iCwT0DdX5VYhtHkDMVu1HGpMyICyemYPO
	LTn3Vn7x1H4R5L652l77Jfal0t7yrAkuUqoC7POKX3WDq/DRuHFJhbFvJTJ2ElJE
	3IMWldeTjKE6QG4fDa09cR/n022HkaBqglQ==
X-ME-Sender: <xms:9lckaPcfH6mQl_aLA5B7BIuNyncjwRJ0caPB0kzCgB4L7BLDOi8Yug>
    <xme:9lckaFOiourAHJqh5FssYGWdn1iv7AgY1PzYrxUEtUTXAnbLsZ9Sy2jTUtahN4de-
    gPjVi-lg1YG3g>
X-ME-Received: <xmr:9lckaIgH-prP7Xnsz6GXrfV7OliefPvrNqikpuCOXUdR0YUTJQjNr3KqmCDbD1Yyi8GzZb0W-tKPZuhW-6UuemSXMtmLq5nJxxk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeiheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettd
    dvgeeuteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtih
    htrhhigidrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhr
    ihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprh
    hojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:9lckaA_RfMVBus6SH4mnURFsbI1wY8kjAV2p5u0tvGGvwvYkO2DZRg>
    <xmx:9lckaLtBEDKPJDUUIpGelaIPG9sGhWxHzgJTBFDq2TFfMBOFLF3Z5A>
    <xmx:9lckaPGaRC8ybR6hdgcdwmFFCrUYEw59dgYaiIzW6vQXoUGZb4gbow>
    <xmx:9lckaCMQNApWf3rvJNJDPkWHGinRe_QqpL73s2FlJGRJLyyJnokOFg>
    <xmx:9lckaNEDiT9pRZNK6OhG-irjQYjD1d0XVDp5zc1NUxg3NwbuLVUdQzJ6>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 14 May 2025 10:44:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Assertion 'desc->arch.creator_domid == DOMID_INVALID' failed
Message-ID: <aCRX899NrUI5OOJZ@mail-itl>
References: <aCObaP4xs158L5tV@mail-itl>
 <70e5eeee-f1fa-41b4-91eb-450edc0bcaca@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4VF5uyez0qQDMClv"
Content-Disposition: inline
In-Reply-To: <70e5eeee-f1fa-41b4-91eb-450edc0bcaca@suse.com>


--4VF5uyez0qQDMClv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 May 2025 10:44:34 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Assertion 'desc->arch.creator_domid == DOMID_INVALID' failed

On Wed, May 14, 2025 at 09:09:08AM +0200, Jan Beulich wrote:
> On 13.05.2025 21:20, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > When debugging CI job on Linus' master branch, I added "console=3Dvga v=
ga=3D,keep" and got PV dom0 crash Xen with:
> >=20
> > (XEN) [   40.870435] Assertion 'desc->arch.creator_domid =3D=3D DOMID_I=
NVALID' failed at arch/x86/irq.c:294
> > (XEN) [   40.886925] ----[ Xen-4.21-unstable  x86_64  debug=3Dy ubsan=
=3Dy  Not tainted ]----
> > (XEN) [   40.903356] CPU:    10
> > (XEN) [   40.919824] RIP:    e008:[<ffff82d04059d2ed>] create_irq+0x272=
/0x339
> > (XEN) [   40.936267] RFLAGS: 0000000000010297   CONTEXT: hypervisor (d0=
v13)
> > (XEN) [   40.952709] rax: 00000000fffffff4   rbx: ffff830498007c00   rc=
x: 0000000000001899
>=20
> There looks to be a -ENOMEM in %rax, so ...
>=20
> > (XEN) [   40.969147] rdx: ffff830498007c5e   rsi: 0000000000000002   rd=
i: ffff83049830e398
> > (XEN) [   40.985892] rbp: ffff830498307d18   rsp: ffff830498307ce8   r8=
:  0000000000000000
> > (XEN) [   41.003093] r9:  0000000000000000   r10: 0000000000000000   r1=
1: 0000000000000000
> > (XEN) [   41.020279] r12: 00000000fffffff4   r13: 000000000000007c   r1=
4: ffffffffffffffff
> > (XEN) [   41.037489] r15: 000000000000007c   cr0: 0000000080050033   cr=
4: 0000000000b526e0
> > (XEN) [   41.054699] cr3: 0000000492c34000   cr2: ffff8881001603f0
> > (XEN) [   41.071904] fsb: 0000000000000000   gsb: ffff8882365ac000   gs=
s: 0000000000000000
> > (XEN) [   41.089116] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e0=
10   cs: e008
> > (XEN) [   41.106320] Xen code around <ffff82d04059d2ed> (create_irq+0x2=
72/0x339):
> > (XEN) [   41.123521]  3f d9 ff e9 cc fe ff ff <0f> 0b 48 8d 3d 5a a0 29=
 00 e8 f4 3d d9 ff c6 43
> > (XEN) [   41.140739] Xen stack trace from rsp=3Dffff830498307ce8:
> > (XEN) [   41.157931]    000000ff00000001 ffff830497faa000 ffff830498307=
e00 00000000ffffffff
> > (XEN) [   41.175132]    0000000000010000 ffff830497faa160 ffff830498307=
d70 ffff82d0405a6f85
> > (XEN) [   41.192351]    00000000000002a0 ffff830498307e24 0000000000000=
200 00000000ffffffff
> > (XEN) [   41.209551]    ffff830497faa000 0000000000000000 ffff830497faa=
168 0000000000010000
> > (XEN) [   41.226753]    ffff830497faa160 ffff830498307de0 ffff82d0405c9=
ea6 5f24a0ddbbeda194
> > (XEN) [   41.244062]    ffff830498307e10 0000000000000000 0000000000000=
001 ffff830498307e00
> > (XEN) [   41.261387]    ffff830498307e24 ffff830498307e20 ffff830497faa=
000 ffff830498307ef8
> > (XEN) [   41.278730]    ffff830497faa000 ffff830497f5a000 ffffc9004002b=
a78 ffff830498307e68
> > (XEN) [   41.296052]    ffff82d0405cbd4f ffff82d04053fc3e ffffc9004002b=
a78 00000000000000a0
> > (XEN) [   41.313381]    00a0fb0000000001 0000000000000000 0000000000007=
ff0 ffffffffffffffff
> > (XEN) [   41.330708]    000000a000000000 0000000000000000 0000000000000=
000 ffff830498307ef8
> > (XEN) [   41.348026]    ffff830497f5a000 0000000000000021 0000000000000=
000 ffffc9004002ba78
> > (XEN) [   41.365357]    ffff830498307ee8 ffff82d0405427db ffff8881d6961=
b40 0000000000000001
> > (XEN) [   41.382680]    000000a000000000 000000000000000d 0000000000000=
000 ffff830498307ee8
> > (XEN) [   41.400003]    ffff82d0405e7bc2 ffff830497f5a000 0000000000000=
000 ffff830497f5a000
> > (XEN) [   41.417343]    0000000000000000 0000000000000000 ffff830498307=
fff 0000000000000000
> > (XEN) [   41.434674]    00007cfb67cf80e7 ffff82d0402012d3 ffff8881d6961=
b40 ffff888100ef30c0
> > (XEN) [   41.452010]    0000000000000001 0000000000000005 0000000000000=
000 ffff888100ef3000
> > (XEN) [   41.469342]    0000000000000202 0000000000000001 0000000000007=
ff0 ffff8881d6961b40
> > (XEN) [   41.486681]    0000000000000021 ffffffff8229d355 000000a000000=
000 ffffc9004002ba78
> > (XEN) [   41.504015] Xen call trace:
> > (XEN) [   41.521314]    [<ffff82d04059d2ed>] R create_irq+0x272/0x339
>=20
> ... I'd expect the function calling init_one_irq_desc() to have caused th=
is.
> In which case, yes, the assertion is certainly valid to trigger (as it's
> arch_init_one_irq_desc() which sets the field to the expected value, yet
> that won't happen if one of the involved allocations fails). I'll make a
> patch, but this raises the question of how you're running Xen, when
> seemingly small allocations like the ones involved here end up failing.

That's weird, there should be plenty of memory. Xen is started with
dom0_mem=3D4G and it's a 16GB system.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--4VF5uyez0qQDMClv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgkV/MACgkQ24/THMrX
1ywF1wf8CMvCc6ajaKmjbmjMfgVz0xDXTJSoVFMQZJq90shTFLGmeE94tEG3c/yA
ap5zcLd3sSI28igXS0ltPkx+JpKOjjenIU9w0C/M9ofdnmDw5jTpe8/cPjIbYFOi
DuyGZKYYkrhLwBZ0cjZFKQ5pafcPqFqZ7iEtPFsKiwexPi1UWOxUS2njj+SCne/s
9VSs92tMvnq5Y2sle9AMkJosKjAevpXndsFko9H0QUpP8TpPPeMdcEO2Z0/1sCoH
ui/PCTxvszEHIDuNqhAooS6iwJVSqJmevDi+hbdQbxuwdANTDLekPeOcKR9QSnKN
C6em0TSYS0P1jaz+UfGiZgDJVqreDQ==
=Gcsr
-----END PGP SIGNATURE-----

--4VF5uyez0qQDMClv--

