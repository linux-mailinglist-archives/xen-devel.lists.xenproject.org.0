Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB368505A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 17:53:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvODj-0000mX-DH; Wed, 07 Aug 2019 15:51:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WRzl=WD=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hvODh-0000mP-PV
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 15:51:21 +0000
X-Inumbo-ID: 326cb194-b92b-11e9-9f1e-c78ecde19376
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 326cb194-b92b-11e9-9f1e-c78ecde19376;
 Wed, 07 Aug 2019 15:51:19 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 980B02B9;
 Wed,  7 Aug 2019 11:51:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 07 Aug 2019 11:51:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=V05g9o
 O9w6WGgBv/+TxVbLF+PLiJ22P6HB+xPecGhKY=; b=AJsB7IAvgL9H9I+v9qQNEE
 u3Yi9AixKFkP7OFaBAMkywQ+BtAmrnnl+p/EULygHVymRTsERsvQ6V12r7RSkvOi
 +c176sK0wDcxqRTGE8o+9bj9T6cyiYXZW57F57kFWQuT0UZsI0kXb6fk+DgJSneX
 rn/3afTEqHUPZSW7DAW83TkzRTT1+MZrqL5/xfQQLUfh7kee387U1r19Q/FNyYbt
 MtpU0ekVj1pLwZasRPLSck1q7QYCwJd2IyKpb2wPonGj9jtEVUa9z9M8bjvg0S9H
 udD3Yn7jkoDGEEFnzp99YrjkFpPYRXX8cnmkxAkqOO3fTQtzNy755Mt451p5owhw
 ==
X-ME-Sender: <xms:dfNKXZSNkjVonKjEH29cQG0B72eeTGkJIL3wfIWVvnnekgMD3KPS1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduvddgleefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepvghfihdrihgu
 necukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhs
 thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:dfNKXc2fVqmiuPae5WXy-OqhmI6vgEFrp6PO6VrJX5EDodb1E0RLnw>
 <xmx:dfNKXeuTSnj0hVITKVRaCmm0tFGSvyuGYC627DKlZaHp5__gm4Ch-A>
 <xmx:dfNKXSgYs-2DqbO00Sq_y7yeL-U-HnnLsuNVNLrX_O465NifARf5cg>
 <xmx:dvNKXSZR3-YU3Kh7SYXPhUh1oIn5b0VX5au5cNPdvBKfBy8jFicxBA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D0F52380084;
 Wed,  7 Aug 2019 11:51:16 -0400 (EDT)
Date: Wed, 7 Aug 2019 17:51:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190807155112.GA3257@mail-itl>
References: <20190807132657.GA2852@mail-itl>
 <7e7da376-462f-9bd0-5b82-137c059feb13@suse.com>
 <20190807151703.GA2659@mail-itl>
 <59f6c90b-3dbb-b0eb-ff45-0f8fd4c915de@suse.com>
MIME-Version: 1.0
In-Reply-To: <59f6c90b-3dbb-b0eb-ff45-0f8fd4c915de@suse.com>
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============8195758834338585570=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8195758834338585570==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2019 at 05:33:05PM +0200, Jan Beulich wrote:
> On 07.08.2019 17:17, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Wed, Aug 07, 2019 at 04:45:43PM +0200, Jan Beulich wrote:
> > > On 07.08.2019 15:26, Marek Marczykowski-G=C3=B3recki  wrote:
> > > > Hi,
> > > >=20
> > > > Xen 4.12 crashes when booting on UEFI (with multiboot2) unless I di=
sable
> > > > runtime services. The crash happens shortly after starting dom0 ker=
nel.
> > > > Unfortunately I don't have serial console there, so the only log I =
have
> > > > is a photo of VGA console (attached). Below I retype part of the me=
ssage:
> > > >=20
> > > > (XEN) ----[ Xen-4.12.0-3.fc29  x86_64  debug=3Dn   Not tainted ]----
> > > > (XEN) CPU:    0
> > > > (XEN) RIP:    e008:[<00000000000000f6>] 00000000000000f6
> > > > (XEN) RFLAGS: 0000000000010287   CONTEXT: hypervisor (d0v0)
> > > > ...
> > > > (XEN) Xen call trace:
> > > > (XEN)    [<00000000000000f6>] 00000000000000f6
> > > > (XEN)    [<ffff82d08026c6ad>] flushtlb.c#pre_flush+0x3d/0x80
> > > > (XEN)    [                  ] efi_runtime_call+0x493/0xbd0
> > > > (XEN)    [                  ] efi_runtime_call+0x441/0xbd0
> > > > (XEN)    [                  ] vcpu_restore_fpu_nonlazy+0xe7/0x180
> > > > (XEN)    [                  ] do_platform_op+0/0x1880
> > > > (XEN)    [                  ] do_platform_op+0xb9c/0x1880
> > > > (XEN)    [                  ] do_platform_op+0xb9c/0x1880
> > > > (XEN)    [                  ] sched_credit2.c#csched2_schedule+0xcd=
0/0x13a0
> > > > (XEN)    [                  ] lstar_enter+0xae/0x120
> > > > (XEN)    [                  ] do_platform_op+0/0x1880
> > > > (XEN)    [                  ] pv_hypercall+0x152/0x220
> > > > (XEN)    [                  ] lstar_enter+0xae/0x120
> > > > (XEN)    [                  ] lstar_enter+0xa2/0x120
> > > > (XEN)    [                  ] lstar_enter+0xae/0x120
> > > > (XEN)    [                  ] lstar_enter+0xa2/0x120
> > > > (XEN)    [                  ] lstar_enter+0xae/0x120
> > > > (XEN)    [                  ] lstar_enter+0xa2/0x120
> > > > (XEN)    [                  ] lstar_enter+0xae/0x120
> > > > (XEN)    [                  ] lstar_enter+0xa2/0x120
> > > > (XEN)    [                  ] lstar_enter+0xae/0x120
> > > > (XEN)    [                  ] lstar_enter+0xa2/0x120
> > > > (XEN)    [                  ] lstar_enter+0xae/0x120
> > > > (XEN)    [                  ] lstar_enter+0x10c/0x120
> > > > (XEN)
> > > > (XEN)
> > > > (XEN) *****************************************
> > > > (XEN) Panic on CPU 0:
> > > > (XEN) FATAL TRAP: vector =3D 0 (divide error)
> > > > (XEN) [error_code=3D0000]
> > > > (XEN) *****************************************
> > > >=20
> > > > Any idea? Lack of serial console doesn't help with collecting logs.=
=2E.
> > >=20
> > > May I suggest that you repeat this with a debug hypervisor, such that
> > > the call trace becomes more usable/sensible?
> >=20
> > Actually, I've already tried, but every other build I try, I get even
> > less useful call trace, for example debug unstable build:
> >=20
> >      Xen call trace:
> >         [<000000007b751c09>] 000000007b751c09
> >         [<8c2b0398e0000daa>] 8c2b0398e0000daa
> > ...
> >      GENERAL PROTECTION FAULT
> >      [error_code=3D0000]
>=20
> But this makes reasonable sense: The faulting insn is "call *0x18(%rax)"
> and %rax is 6954b2b0, which points into a block of type
> EfiBootServicesData (and hence likely reused by the time of the crash
> for other purposes). Hence the "/mapbs" option of xen.efi might help
> here too, but iirc there's no equivalent for it in the MB2 case.

Oh, yes, indeed in Qubes we have /mapbs enabled by default with xen.efi.
I'd like to add it to MB2 case too. Is command line parsed at this point
(efi_exit_boot()) already?=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1K83IACgkQ24/THMrX
1yxuTgf/UtoNoN2XaQ6kxjtsK2xiYIT1Y61idGbUpEKWiHcCshzdcH5qAZ+jLfva
WcgUA2RRJSaZXbCyxEIGsWcIgxaLaz6TzKw0mlkOeRXo+20H19FifoezuAfNSRLE
PnhGi7pdgRhhhQijO0uIt5HxAOkQRPYIGpQ3libzFl18NxCwsv4ipcvxp3DltT1u
rzpnGj/vFLi87/ceG19iddy296i95EyK8g0yAOiPwR6yM97cMZOqoDWodrGGlSJC
PBXYVEzK33kWXiqyFg09xz9Hc3Sqn8hNDWuxPFyPqolNMwAwkYyIqEU2ZtfnVUDu
jWmEItDhdxHpMcvCn0COHAJtG5HUhQ==
=NWKn
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--


--===============8195758834338585570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8195758834338585570==--

