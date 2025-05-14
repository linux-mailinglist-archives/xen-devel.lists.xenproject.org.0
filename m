Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF92FAB7747
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 22:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984598.1370673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFIyF-0005Re-Gg; Wed, 14 May 2025 20:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984598.1370673; Wed, 14 May 2025 20:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFIyF-0005OW-Dq; Wed, 14 May 2025 20:44:55 +0000
Received: by outflank-mailman (input) for mailman id 984598;
 Wed, 14 May 2025 20:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfaI=X6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uFIyD-0005OQ-De
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 20:44:53 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47468fa0-3104-11f0-9ffb-bf95429c2676;
 Wed, 14 May 2025 22:44:50 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id E9547138013A;
 Wed, 14 May 2025 16:44:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Wed, 14 May 2025 16:44:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 May 2025 16:44:47 -0400 (EDT)
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
X-Inumbo-ID: 47468fa0-3104-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747255488;
	 x=1747341888; bh=iJ0vJqhIGZJBpwt+D86/46QK11/UU8qOT/wKD4IEqYo=; b=
	nGWWn745aAlieKM+nFCwNOjXt3T9eltcGFK9+xyD9S7rhg7/pgQAKZdn/cR9W381
	3swkiKd70lumuxz/cy4XJBfxZtkC5F25MeFXF7ZJ0U6ScuQ25WBURlE0K/sGqsPn
	1AOGA1952r7t4MbTTQMlbAJAHSU3l8mUeaGv9jZhe/cpyH7KtxZjZGvcL3tlIjNt
	Z5w5G61G4f4wLYDT2n3SXryTI235R05W97uLSqPs1MetEYInD4tgt826Ozvz9pUU
	m2Mk0tSMHy6ql6xHPgYH1j5FSEX3152ZyJNMF/CD2qdOqexl1RnXJHbxvNP463oj
	2t4Eu+aoZkbAygWFuchaJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747255488; x=1747341888; bh=iJ0vJqhIGZJBpwt+D86/46QK11/UU8qOT/w
	KD4IEqYo=; b=Y5mDe9MZzmwPKcMzPKGGZk23OZcCTrBYwu0rroduEV9ceXWgVXS
	lcGIyuenccUsQ/GJsMp/WL9bHokcCe/p+SgEUixvCjNp87vZmlGihnYm7KZ9cld0
	0ycKMraFkdEEvAdgY0hYErzBBlJmxHvaSrSTAUqAEU10QMRCky4AxnLGVVagOrpg
	xiNzb85di4DRvFr2mm75gB3VUXW4r734oGTvY2zCUhEjy1rqrfnXqacZEQZ5TgvR
	6j5q1Y7y+hdkn/yh3z5gYDq7GH26DRymMFo6AOw6G56wArPEjsBy0NIEwOvXgEPf
	8sS0Ir2z4zDU6Qc+o5MqQ8D2swWBM49zlNg==
X-ME-Sender: <xms:wAAlaNTDQoNnwubALzXuEg3f_BKXUXCMHdiHxPtni6Eg1fVWu1eTiw>
    <xme:wAAlaGz1w4aRTkgGAFKfYvDjNXMDfqKzmrz-wzSVLahe3TigS2SLyTFmhVf2fojgh
    6eFPW3rDFMe2g>
X-ME-Received: <xmr:wAAlaC3f3k7xx5kZYhXcSMXyfRtMd35FtytskiU9aVRHxA1RE_O6S-l4kGun6hgY28Cu5lhJvFpZgIs_U_afk7EhIfzE6Vczg6k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdejleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepieeluddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejhe
    etuddvkeffudeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtg
    homhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohep
    rghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopeigvg
    hnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:wAAlaFDgxtn2ZVA3J6KW5es95IafqDpiF32KYJi7M2JFEMKCb3sAGQ>
    <xmx:wAAlaGgmOc1cX9FIk0slj2X2t0KgLtZ_MtFUCSUDG3VBwW252TZ8bQ>
    <xmx:wAAlaJpmndKQgbWaX8tlxAh7qsTvatFGmmcb5E6thhdxDUyRhcfOsQ>
    <xmx:wAAlaBidyKuKh0DZ5NhbNIBNsisadyaQGB7a6CS9a2j3fYYZVHzgzA>
    <xmx:wAAlaAZ1XoMKBuKFJIskpL8I_jZFdugl4DG328Dqwxw_hvbeLzad6VsI>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 14 May 2025 22:44:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Assertion 'desc->arch.creator_domid == DOMID_INVALID' failed
Message-ID: <aCUAvdLJ6J1jI2AI@mail-itl>
References: <aCObaP4xs158L5tV@mail-itl>
 <70e5eeee-f1fa-41b4-91eb-450edc0bcaca@suse.com>
 <aCRX899NrUI5OOJZ@mail-itl>
 <aCRac5s9PUlTGOd_@macbook.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="089t04zKiO2x5yFC"
Content-Disposition: inline
In-Reply-To: <aCRac5s9PUlTGOd_@macbook.lan>


--089t04zKiO2x5yFC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 May 2025 22:44:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Assertion 'desc->arch.creator_domid == DOMID_INVALID' failed

On Wed, May 14, 2025 at 10:55:15AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, May 14, 2025 at 10:44:34AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Wed, May 14, 2025 at 09:09:08AM +0200, Jan Beulich wrote:
> > > On 13.05.2025 21:20, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Hi,
> > > >=20
> > > > When debugging CI job on Linus' master branch, I added "console=3Dv=
ga vga=3D,keep" and got PV dom0 crash Xen with:
> > > >=20
> > > > (XEN) [   40.870435] Assertion 'desc->arch.creator_domid =3D=3D DOM=
ID_INVALID' failed at arch/x86/irq.c:294
> > > > (XEN) [   40.886925] ----[ Xen-4.21-unstable  x86_64  debug=3Dy ubs=
an=3Dy  Not tainted ]----
> > > > (XEN) [   40.903356] CPU:    10
> > > > (XEN) [   40.919824] RIP:    e008:[<ffff82d04059d2ed>] create_irq+0=
x272/0x339
> > > > (XEN) [   40.936267] RFLAGS: 0000000000010297   CONTEXT: hypervisor=
 (d0v13)
> > > > (XEN) [   40.952709] rax: 00000000fffffff4   rbx: ffff830498007c00 =
  rcx: 0000000000001899
> > >=20
> > > There looks to be a -ENOMEM in %rax, so ...
> > >=20
> > > > (XEN) [   40.969147] rdx: ffff830498007c5e   rsi: 0000000000000002 =
  rdi: ffff83049830e398
> > > > (XEN) [   40.985892] rbp: ffff830498307d18   rsp: ffff830498307ce8 =
  r8:  0000000000000000
> > > > (XEN) [   41.003093] r9:  0000000000000000   r10: 0000000000000000 =
  r11: 0000000000000000
> > > > (XEN) [   41.020279] r12: 00000000fffffff4   r13: 000000000000007c =
  r14: ffffffffffffffff
> > > > (XEN) [   41.037489] r15: 000000000000007c   cr0: 0000000080050033 =
  cr4: 0000000000b526e0
> > > > (XEN) [   41.054699] cr3: 0000000492c34000   cr2: ffff8881001603f0
> > > > (XEN) [   41.071904] fsb: 0000000000000000   gsb: ffff8882365ac000 =
  gss: 0000000000000000
> > > > (XEN) [   41.089116] ds: 0000   es: 0000   fs: 0000   gs: 0000   ss=
: e010   cs: e008
> > > > (XEN) [   41.106320] Xen code around <ffff82d04059d2ed> (create_irq=
+0x272/0x339):
> > > > (XEN) [   41.123521]  3f d9 ff e9 cc fe ff ff <0f> 0b 48 8d 3d 5a a=
0 29 00 e8 f4 3d d9 ff c6 43
> > > > (XEN) [   41.140739] Xen stack trace from rsp=3Dffff830498307ce8:
> > > > (XEN) [   41.157931]    000000ff00000001 ffff830497faa000 ffff83049=
8307e00 00000000ffffffff
> > > > (XEN) [   41.175132]    0000000000010000 ffff830497faa160 ffff83049=
8307d70 ffff82d0405a6f85
> > > > (XEN) [   41.192351]    00000000000002a0 ffff830498307e24 000000000=
0000200 00000000ffffffff
> > > > (XEN) [   41.209551]    ffff830497faa000 0000000000000000 ffff83049=
7faa168 0000000000010000
> > > > (XEN) [   41.226753]    ffff830497faa160 ffff830498307de0 ffff82d04=
05c9ea6 5f24a0ddbbeda194
> > > > (XEN) [   41.244062]    ffff830498307e10 0000000000000000 000000000=
0000001 ffff830498307e00
> > > > (XEN) [   41.261387]    ffff830498307e24 ffff830498307e20 ffff83049=
7faa000 ffff830498307ef8
> > > > (XEN) [   41.278730]    ffff830497faa000 ffff830497f5a000 ffffc9004=
002ba78 ffff830498307e68
> > > > (XEN) [   41.296052]    ffff82d0405cbd4f ffff82d04053fc3e ffffc9004=
002ba78 00000000000000a0
> > > > (XEN) [   41.313381]    00a0fb0000000001 0000000000000000 000000000=
0007ff0 ffffffffffffffff
> > > > (XEN) [   41.330708]    000000a000000000 0000000000000000 000000000=
0000000 ffff830498307ef8
> > > > (XEN) [   41.348026]    ffff830497f5a000 0000000000000021 000000000=
0000000 ffffc9004002ba78
> > > > (XEN) [   41.365357]    ffff830498307ee8 ffff82d0405427db ffff8881d=
6961b40 0000000000000001
> > > > (XEN) [   41.382680]    000000a000000000 000000000000000d 000000000=
0000000 ffff830498307ee8
> > > > (XEN) [   41.400003]    ffff82d0405e7bc2 ffff830497f5a000 000000000=
0000000 ffff830497f5a000
> > > > (XEN) [   41.417343]    0000000000000000 0000000000000000 ffff83049=
8307fff 0000000000000000
> > > > (XEN) [   41.434674]    00007cfb67cf80e7 ffff82d0402012d3 ffff8881d=
6961b40 ffff888100ef30c0
> > > > (XEN) [   41.452010]    0000000000000001 0000000000000005 000000000=
0000000 ffff888100ef3000
> > > > (XEN) [   41.469342]    0000000000000202 0000000000000001 000000000=
0007ff0 ffff8881d6961b40
> > > > (XEN) [   41.486681]    0000000000000021 ffffffff8229d355 000000a00=
0000000 ffffc9004002ba78
> > > > (XEN) [   41.504015] Xen call trace:
> > > > (XEN) [   41.521314]    [<ffff82d04059d2ed>] R create_irq+0x272/0x3=
39
> > >=20
> > > ... I'd expect the function calling init_one_irq_desc() to have cause=
d this.
> > > In which case, yes, the assertion is certainly valid to trigger (as i=
t's
> > > arch_init_one_irq_desc() which sets the field to the expected value, =
yet
> > > that won't happen if one of the involved allocations fails). I'll mak=
e a
> > > patch, but this raises the question of how you're running Xen, when
> > > seemingly small allocations like the ones involved here end up failin=
g.
> >=20
> > That's weird, there should be plenty of memory. Xen is started with
> > dom0_mem=3D4G and it's a 16GB system.
>=20
> I wouldn't be surprised that you are impacted by:
>=20
> https://lore.kernel.org/xen-devel/20250514080427.28129-1-roger.pau@citrix=
=2Ecom/
>=20
> If the kernel is built without CONFIG_XEN_UNPOPULATED_ALLOC.  Sorry,
> that was my fault.

This appears to have helped, thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--089t04zKiO2x5yFC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmglAL0ACgkQ24/THMrX
1yy6VQf/WsuUnwvnstQAbbtr14cD6/1nxjrxN3jIzS1x5XZXlltWQUsreUr5zMLT
fLade9aEQVdDwMdblppeKJdLslno2IlPC2xNEIvCsW5CwZDXSgQP+eU2imosR33C
OsPBrT7mhNK8pLfuXmjSALflKjtqtOtcUbZtrZChtIIwLMgzkUcaswtWev9561kw
TV10mAC4yfMS2RXbrvGQBXuFaFGrvR1lh54ygoT2NjiuwW53pAHbdlQ0eGkLacF6
ZCprBU8hlw1N/nTG2C/vyIDM/oyZPROy2AtpPMjqc3NGO7Fl+oq48uruRdUz8Ce5
97qfdyrJCImWjIqDPI9et6yoe8WN0Q==
=Mxj4
-----END PGP SIGNATURE-----

--089t04zKiO2x5yFC--

