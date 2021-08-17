Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A93EEB54
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 13:02:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167746.306229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFwrO-00038U-RO; Tue, 17 Aug 2021 11:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167746.306229; Tue, 17 Aug 2021 11:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFwrO-00035W-O2; Tue, 17 Aug 2021 11:02:22 +0000
Received: by outflank-mailman (input) for mailman id 167746;
 Tue, 17 Aug 2021 11:02:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lICV=NI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mFwrM-00035Q-GE
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 11:02:20 +0000
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c2f2cb1-78f4-48f7-8422-4884d5078f9d;
 Tue, 17 Aug 2021 11:02:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 08EA13200930
 for <xen-devel@lists.xenproject.org>; Tue, 17 Aug 2021 07:02:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 17 Aug 2021 07:02:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Tue, 17 Aug 2021 07:02:16 -0400 (EDT)
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
X-Inumbo-ID: 1c2f2cb1-78f4-48f7-8422-4884d5078f9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lpCcBW
	F47A6C2ntCKIp4ebZ7k18+r4LTKGk1FeDdPtk=; b=SN/mJeeMoGrm7la01aNg3q
	L0qIht6l5TsJZB5VbjWWLLmO/5AYVyGhEvrE19D6oEVxXdeKwul2pyZnZ0TB/435
	1PcKCmmPHQvswqyh5hQ0zR1PfLt8XIPLhn4sksuXLHEasrKv+1J8WiTY0JNDlxup
	cByLb/wvfjW7Ke0rBDpcFFETE7dw7IM4fy2xHpJqKdfDL8eSwpoBfkQxGy4pAcD3
	9P14l+P/lEAVv1q4rYIARfjp83cPbINptmyuIur7NLRJZfzcb2QUlRy6YGHKCGOR
	LRwBtorGPCU4C6FfAk+h1rXHiSpanZ4q5GgzpNUy4yOnxwLdHXTbQ76vo/tRXxIw
	==
X-ME-Sender: <xms:OZcbYb2iP4YbYEJ_91iuSsd_Bb2efonTLktZ21aSK797AmAmudQLaQ>
    <xme:OZcbYaE0gIk6kvepgPSrikyHgAQ5li9o0daRJoKoRZkzPyqZ5hBt6RTtiQGDfkXNj
    P_H_ISUxbWOzQ>
X-ME-Received: <xmr:OZcbYb5mq9ThCugewI5zaBNhnSzqQtB9tRqOFLqNA_Z7wSWWe9CTwTFCGLGuSoGLt0ECsBIhAJJlvLOn0u9PKE2qG0jiobpv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleefgdefiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
    dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpeetveffiefghfekhffggeeffffhgeevieektedthfehveei
    heeiiedtudegfeetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgt
    ohhm
X-ME-Proxy: <xmx:OZcbYQ3fVEsrYam_KD1dcPSS1Q3JvDkg3Kw8RIEUvtV7l36lpDXV0g>
    <xmx:OZcbYeFqyHX1WDBJOGK8L9lYwOS1BYnzUthIIM2I-KjiU5dqbC5Odg>
    <xmx:OZcbYR9ErlxJHkcw2sI1VO_GbX7i3TSSdCR1bmh1rC2fWVOrpF4qbg>
    <xmx:OZcbYSTI6EgbKsTIuQyA-IZItQswgSTqJVvRUGV0ZOeUQ4Ga3Z4nvg>
Date: Tue, 17 Aug 2021 13:02:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 resume issue in xstate_init
Message-ID: <YRuXNmpT+03aPo+p@mail-itl>
References: <YRsQArpQcpLB/Q5h@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Jk7Tb4LxiLwD8e7q"
Content-Disposition: inline
In-Reply-To: <YRsQArpQcpLB/Q5h@mail-itl>


--Jk7Tb4LxiLwD8e7q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Aug 2021 13:02:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 resume issue in xstate_init

On Tue, Aug 17, 2021 at 03:25:21AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Hi,
>=20
> I've got another S3 issue:
>=20
> (XEN) Preparing system for ACPI S3 state.
> (XEN) Disabling non-boot CPUs ...
> (XEN) Broke affinity for IRQ1, new: ffff
> (XEN) Broke affinity for IRQ16, new: ffff
> (XEN) Broke affinity for IRQ9, new: ffff
> (XEN) Broke affinity for IRQ139, new: ffff
> (XEN) Broke affinity for IRQ8, new: ffff
> (XEN) Broke affinity for IRQ14, new: ffff
> (XEN) Broke affinity for IRQ20, new: ffff
> (XEN) Broke affinity for IRQ137, new: ffff
> (XEN) Broke affinity for IRQ138, new: ffff
> (XEN) Entering ACPI S3 state.
> (XEN) mce_intel.c:773: MCA Capability: firstbank 0, extended MCE MSR 0, B=
CAST, CMCI
> (XEN) CPU0 CMCI LVT vector (0xf1) already installed
> (XEN) Finishing wakeup from ACPI S3 state.
> (XEN) microcode: CPU0 updated from revision 0xca to 0xea, date =3D 2021-0=
1-05
> (XEN) xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
> (XEN) Enabling non-boot CPUs  ...
> (XEN) xstate: size: 0x440 (uncompressed 0x240) and states: 0x1f
> (XEN) Xen BUG at xstate.c:673
> (XEN) ----[ Xen-4.16-unstable  x86_64  debug=3Dy  Not tainted ]----
> (XEN) CPU:    1
> (XEN) RIP:    e008:[<ffff82d040350ee4>] xstate_init+0x24b/0x2ff
> (XEN) RFLAGS: 0000000000010087   CONTEXT: hypervisor
> (XEN) rax: 0000000000000240   rbx: 000000000000001f   rcx: 00000000000004=
40
> (XEN) rdx: 0000000000000001   rsi: 000000000000000a   rdi: 00000000000000=
1f
> (XEN) rbp: ffff83025dc9fd38   rsp: ffff83025dc9fd20   r8:  00000000000000=
01
> (XEN) r9:  ffff83025dc9fc88   r10: 0000000000000001   r11: 00000000000000=
01
> (XEN) r12: ffff83025dc9fd80   r13: 000000000000001f   r14: 00000000000000=
01
> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000003526=
e0
> (XEN) cr3: 0000000049656000   cr2: 0000000000000000
> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000000=
00
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> (XEN) Xen code around <ffff82d040350ee4> (xstate_init+0x24b/0x2ff):
> (XEN)  ff e9 a2 00 00 00 0f 0b <0f> 0b 89 f8 89 f1 0f a2 89 f2 4c 8b 0d c=
b b4 0f
> (XEN) Xen stack trace from rsp=3Dffff83025dc9fd20:
> (XEN)    0000000000000240 ffff83025dc9fd80 0000000000000001 ffff83025dc9f=
d70
> (XEN)    ffff82d04027e7a1 000000004035a7f1 7ffafbbf01100800 00000000bfebf=
bff
> (XEN)    0000000000000001 00000000000000c8 ffff83025dc9feb8 ffff82d0402e4=
3ce
> (XEN)    000000160a9e0106 bfebfbff80000008 2c1008007ffaf3bf 0000000f00000=
121
> (XEN)    00000000029c6fbf 0000000000000100 000000009c002e00 02afcd7f00000=
000
> (XEN)    756e654700000000 6c65746e49656e69 65746e4904b21920 726f432029522=
86c
> (XEN)    376920294d542865 432048303537382d 322e322040205550 000000007a484=
730
> (XEN)    ffff830000000000 ffff83025dc9fe18 00002400402e8e0b 000000085dc9f=
e30
> (XEN)    00000002402e9f21 0000000000000001 ffffffff00000000 ffff82d0402e0=
040
> (XEN)    00000000003526e0 ffff83025dc9fe68 ffff82d04027bd15 0000000000000=
001
> (XEN)    ffff8302590a0000 0000000000000000 00000000000000c8 0000000000000=
001
> (XEN)    0000000000000001 ffff83025dc9feb8 ffff82d0402e32b7 0000000000000=
001
> (XEN)    0000000000000001 00000000000000c8 0000000000000001 ffff83025dc9f=
ee8
> (XEN)    ffff82d04030e401 0000000000000001 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 ffff82d040200122 0800002000000=
002
> (XEN)    0100000400010000 0000002000000000 2000000000100000 0000001000000=
000
> (XEN)    2000000000000000 0000000029000000 0000008000000000 00110000a0000=
000
> (XEN)    8000000080000000 4000000000000008 0000100000000000 0200000040000=
080
> (XEN)    0004000000000000 0000010000000002 0400002030000000 0000000060000=
000
> (XEN)    0400001000010000 0000000010000000 0000004010000000 0000000000000=
000
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040350ee4>] R xstate_init+0x24b/0x2ff
> (XEN)    [<ffff82d04027e7a1>] F identify_cpu+0x318/0x4af
> (XEN)    [<ffff82d0402e43ce>] F recheck_cpu_features+0x1f/0x72
> (XEN)    [<ffff82d04030e401>] F start_secondary+0x255/0x38a
> (XEN)    [<ffff82d040200122>] F __high_start+0x82/0x91
> (XEN)=20
> (XEN)=20
> (XEN) ****************************************
> (XEN) Panic on CPU 1:
> (XEN) Xen BUG at xstate.c:673
> (XEN) ****************************************
> (XEN)=20
> (XEN) Reboot in five seconds...
>=20
> This is with added debug patch:
>=20
> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> index 6aaf9a2f1546..7873a21b356a 100644
> --- a/xen/arch/x86/xstate.c
> +++ b/xen/arch/x86/xstate.c
> @@ -668,6 +668,8 @@ void xstate_init(struct cpuinfo_x86 *c)
>      else
>      {
>          BUG_ON(xfeature_mask !=3D feature_mask);
> +        printk("xstate: size: %#x (uncompressed %#x) and states: %#"PRIx=
64"\n",
> +               xsave_cntxt_size, hw_uncompressed_size(feature_mask), fea=
ture_mask);
>          BUG_ON(xsave_cntxt_size !=3D hw_uncompressed_size(feature_mask));
>      }
> =20
>=20
> As can be seen above - the xsave size differs between BSP and other
> CPU(s) - likely because of (not) loaded ucode update there.
> I guess it's a matter of moving ucode loading somewhere else, right?


Few more data points:

1. The CPU is i7-8750H (family 6, model 158, stepping 10).
2. I do have "smt=3Doff" on the Xen cmdline, if that matters.

I've tried the same without letting Xen load the ucode update (so,
staying at 0xca) and got the same effect. So, I think it isn't about
ucode...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Jk7Tb4LxiLwD8e7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEblzYACgkQ24/THMrX
1yzdxQgAjBnIQxUAaUGr+fhvrSRg52Y3TgJb/fHT/Md+P8m/mkVci8qdkxyZ6jT7
kdImDb5RNQq9Fka4le9zNvbGGf7Igv4ORbHBHkGg4oF+gDjj4Nnb6VlPZwSAkO36
yRS+kv35hZBvk6ha8wayx7TshAGLrAKgwT2bdqkV+yKLnrK6n7un9M+XC1bj6TFX
jG+WUnq/DK5Gy9j0zGABWGJphHSAm1AagtKxBvkvuTTzaTY/BFaCJkX1cHJrvjhj
9Z836baUFAv5wW5ZasAo54PyPEu+b8yQ5kXbuhfeF8peapz2vPi6CQzOzTm3h3CU
sdNuQMTOOx/s79ZTp1h7wGSnqCjiGw==
=EUOY
-----END PGP SIGNATURE-----

--Jk7Tb4LxiLwD8e7q--

