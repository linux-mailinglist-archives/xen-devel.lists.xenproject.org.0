Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48B13EEBDE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 13:45:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167771.306284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFxW9-0001Dr-7i; Tue, 17 Aug 2021 11:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167771.306284; Tue, 17 Aug 2021 11:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFxW9-0001BN-4g; Tue, 17 Aug 2021 11:44:29 +0000
Received: by outflank-mailman (input) for mailman id 167771;
 Tue, 17 Aug 2021 11:44:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lICV=NI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mFxW8-0001BH-Et
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 11:44:28 +0000
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 799817da-ff50-11eb-a4a6-12813bfff9fa;
 Tue, 17 Aug 2021 11:44:27 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id D880C320094F;
 Tue, 17 Aug 2021 07:44:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 17 Aug 2021 07:44:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Aug 2021 07:44:24 -0400 (EDT)
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
X-Inumbo-ID: 799817da-ff50-11eb-a4a6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FUbAOX
	ASk+scUB3PF9J7iY68IhkAg8p8Of0I2POoJZQ=; b=BBkTnXjLA+L8Ve2ORYD0bR
	hyc0km4ZaPzx9Q2UMieRRfzGMztvknJZYDlHFARti6vyiJ8GrOivj7YvKpTo5xUr
	lefChGdvmEkg2YpH/oD6rFMTUMKq8/orzyTpBOk5YIKRBi2FLx8cEaXmvf3hY3fj
	3qZxYA8XkzecKTBgyqnhsY8FP5xBAOEIvcLSFXWMa9mGaDgQIJ36xKAI4CIEk/tf
	SqoXXcNa2U6l7UFxJ2whNgK+zPzQ88AVXoXWb039u1es2tQECFmgcymAfBQXbzff
	2dDYtMf4hyPBHD8jBGtI0MDmY9kPMeA+aZzpG/uS2iDNOAupgVujbbaGD9UAe0Pw
	==
X-ME-Sender: <xms:GaEbYfESdo9alLcvcq3L99baTQikfpuM_9kXE1sVsF0PRgZLBXHcXA>
    <xme:GaEbYcWybOb07HE6RpOd7FEyihdaP9ulG7VQaL_vP5hc1gUghpMefGhgXVC8ZQTIP
    -ud5Wl6EqS39Q>
X-ME-Received: <xmr:GaEbYRJ04V_bZwYasoQHJQd0KMJw9qSw2YeRfTtGllSLjjs-NiaxFLRKC0qTxWIwcJlCjNO5obL8WqZ9Bl813ItNBsM2_DHJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleefgdeggecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepkeegtdfg
    vdeihefhhedtvdelieeiueetveehteffjeejjedvieejvefhueeffeegnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhm
X-ME-Proxy: <xmx:GaEbYdEDwkIDqMjtzxugCutvFh55QyNvdeNkgq9y8ZIqUFXzscAdJw>
    <xmx:GaEbYVUq-bqBQMGW9Lm25W9MAexPOlmaKTwTkDM1Z930TR2sfCV45Q>
    <xmx:GaEbYYMAYrWc2NqQSsLK-ZLObELgjo6eVogHxN2WIwrzWWlpsEdNow>
    <xmx:GaEbYUCZSNhpavfHLdcwZJJaHy_Z2PAftklRdfOktfuIVpEWIHAjaw>
Date: Tue, 17 Aug 2021 13:44:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 resume issue in xstate_init
Message-ID: <YRuhFWLrplRRV6t+@mail-itl>
References: <YRsQArpQcpLB/Q5h@mail-itl>
 <YRuXNmpT+03aPo+p@mail-itl>
 <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dxypIFesLw4xY+U0"
Content-Disposition: inline
In-Reply-To: <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com>


--dxypIFesLw4xY+U0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Aug 2021 13:44:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 resume issue in xstate_init

On Tue, Aug 17, 2021 at 12:14:36PM +0100, Andrew Cooper wrote:
> On 17/08/2021 12:02, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Aug 17, 2021 at 03:25:21AM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> >> Hi,
> >>
> >> I've got another S3 issue:
> >>
> >> (XEN) Preparing system for ACPI S3 state.
> >> (XEN) Disabling non-boot CPUs ...
> >> (XEN) Broke affinity for IRQ1, new: ffff
> >> (XEN) Broke affinity for IRQ16, new: ffff
> >> (XEN) Broke affinity for IRQ9, new: ffff
> >> (XEN) Broke affinity for IRQ139, new: ffff
> >> (XEN) Broke affinity for IRQ8, new: ffff
> >> (XEN) Broke affinity for IRQ14, new: ffff
> >> (XEN) Broke affinity for IRQ20, new: ffff
> >> (XEN) Broke affinity for IRQ137, new: ffff
> >> (XEN) Broke affinity for IRQ138, new: ffff
> >> (XEN) Entering ACPI S3 state.
> >> (XEN) mce_intel.c:773: MCA Capability: firstbank 0, extended MCE MSR 0=
, BCAST, CMCI
> >> (XEN) CPU0 CMCI LVT vector (0xf1) already installed
> >> (XEN) Finishing wakeup from ACPI S3 state.
> >> (XEN) microcode: CPU0 updated from revision 0xca to 0xea, date =3D 202=
1-01-05
> >> (XEN) xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
> >> (XEN) Enabling non-boot CPUs  ...
> >> (XEN) xstate: size: 0x440 (uncompressed 0x240) and states: 0x1f
> >> (XEN) Xen BUG at xstate.c:673
> >> (XEN) ----[ Xen-4.16-unstable  x86_64  debug=3Dy  Not tainted ]----
> >> (XEN) CPU:    1
> >> (XEN) RIP:    e008:[<ffff82d040350ee4>] xstate_init+0x24b/0x2ff
> >> (XEN) RFLAGS: 0000000000010087   CONTEXT: hypervisor
> >> (XEN) rax: 0000000000000240   rbx: 000000000000001f   rcx: 00000000000=
00440
> >> (XEN) rdx: 0000000000000001   rsi: 000000000000000a   rdi: 00000000000=
0001f
> >> (XEN) rbp: ffff83025dc9fd38   rsp: ffff83025dc9fd20   r8:  00000000000=
00001
> >> (XEN) r9:  ffff83025dc9fc88   r10: 0000000000000001   r11: 00000000000=
00001
> >> (XEN) r12: ffff83025dc9fd80   r13: 000000000000001f   r14: 00000000000=
00001
> >> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000003=
526e0
> >> (XEN) cr3: 0000000049656000   cr2: 0000000000000000
> >> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 00000000000=
00000
> >> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> >> (XEN) Xen code around <ffff82d040350ee4> (xstate_init+0x24b/0x2ff):
> >> (XEN)  ff e9 a2 00 00 00 0f 0b <0f> 0b 89 f8 89 f1 0f a2 89 f2 4c 8b 0=
d cb b4 0f
> >> (XEN) Xen stack trace from rsp=3Dffff83025dc9fd20:
> >> (XEN)    0000000000000240 ffff83025dc9fd80 0000000000000001 ffff83025d=
c9fd70
> >> (XEN)    ffff82d04027e7a1 000000004035a7f1 7ffafbbf01100800 00000000bf=
ebfbff
> >> (XEN)    0000000000000001 00000000000000c8 ffff83025dc9feb8 ffff82d040=
2e43ce
> >> (XEN)    000000160a9e0106 bfebfbff80000008 2c1008007ffaf3bf 0000000f00=
000121
> >> (XEN)    00000000029c6fbf 0000000000000100 000000009c002e00 02afcd7f00=
000000
> >> (XEN)    756e654700000000 6c65746e49656e69 65746e4904b21920 726f432029=
52286c
> >> (XEN)    376920294d542865 432048303537382d 322e322040205550 000000007a=
484730
> >> (XEN)    ffff830000000000 ffff83025dc9fe18 00002400402e8e0b 000000085d=
c9fe30
> >> (XEN)    00000002402e9f21 0000000000000001 ffffffff00000000 ffff82d040=
2e0040
> >> (XEN)    00000000003526e0 ffff83025dc9fe68 ffff82d04027bd15 0000000000=
000001
> >> (XEN)    ffff8302590a0000 0000000000000000 00000000000000c8 0000000000=
000001
> >> (XEN)    0000000000000001 ffff83025dc9feb8 ffff82d0402e32b7 0000000000=
000001
> >> (XEN)    0000000000000001 00000000000000c8 0000000000000001 ffff83025d=
c9fee8
> >> (XEN)    ffff82d04030e401 0000000000000001 0000000000000000 0000000000=
000000
> >> (XEN)    0000000000000000 0000000000000000 ffff82d040200122 0800002000=
000002
> >> (XEN)    0100000400010000 0000002000000000 2000000000100000 0000001000=
000000
> >> (XEN)    2000000000000000 0000000029000000 0000008000000000 00110000a0=
000000
> >> (XEN)    8000000080000000 4000000000000008 0000100000000000 0200000040=
000080
> >> (XEN)    0004000000000000 0000010000000002 0400002030000000 0000000060=
000000
> >> (XEN)    0400001000010000 0000000010000000 0000004010000000 0000000000=
000000
> >> (XEN) Xen call trace:
> >> (XEN)    [<ffff82d040350ee4>] R xstate_init+0x24b/0x2ff
> >> (XEN)    [<ffff82d04027e7a1>] F identify_cpu+0x318/0x4af
> >> (XEN)    [<ffff82d0402e43ce>] F recheck_cpu_features+0x1f/0x72
> >> (XEN)    [<ffff82d04030e401>] F start_secondary+0x255/0x38a
> >> (XEN)    [<ffff82d040200122>] F __high_start+0x82/0x91
> >> (XEN)=20
> >> (XEN)=20
> >> (XEN) ****************************************
> >> (XEN) Panic on CPU 1:
> >> (XEN) Xen BUG at xstate.c:673
> >> (XEN) ****************************************
> >> (XEN)=20
> >> (XEN) Reboot in five seconds...
> >>
> >> This is with added debug patch:
> >>
> >> diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
> >> index 6aaf9a2f1546..7873a21b356a 100644
> >> --- a/xen/arch/x86/xstate.c
> >> +++ b/xen/arch/x86/xstate.c
> >> @@ -668,6 +668,8 @@ void xstate_init(struct cpuinfo_x86 *c)
> >>      else
> >>      {
> >>          BUG_ON(xfeature_mask !=3D feature_mask);
> >> +        printk("xstate: size: %#x (uncompressed %#x) and states: %#"P=
RIx64"\n",
> >> +               xsave_cntxt_size, hw_uncompressed_size(feature_mask), =
feature_mask);
> >>          BUG_ON(xsave_cntxt_size !=3D hw_uncompressed_size(feature_mas=
k));
> >>      }
> >> =20
> >>
> >> As can be seen above - the xsave size differs between BSP and other
> >> CPU(s) - likely because of (not) loaded ucode update there.
> >> I guess it's a matter of moving ucode loading somewhere else, right?
> >
> > Few more data points:
> >
> > 1. The CPU is i7-8750H (family 6, model 158, stepping 10).
> > 2. I do have "smt=3Doff" on the Xen cmdline, if that matters.
>=20
> As a datapoint, it would be interesting to confirm what the behaviour is
> with SMT enabled.
>=20
> I'd expect it not to make a difference, because smt=3Doff is a purely Xen
> construct and doesn't change the hardware configuration.

Uhm, changing to smt=3Don actually _did_ change it. Now it doesn't crash!

Let me add CPU number to the above printk - is smp_processor_id() the
thing I want?
With that, I get:
https://gist.github.com/marmarek/ae604a1e5cf49639a1eec9e220c037ca
Note that at boot all CPUs reports 0x440 (but only later are parked).
Maybe resume path for the parked CPUs is missing some step?

> > I've tried the same without letting Xen load the ucode update (so,
> > staying at 0xca) and got the same effect. So, I think it isn't about
> > ucode...
>=20
> Any chance of a full boot log?

No problem, see above :)

> This is bizzare.=C2=A0 Looking through start_secondary(), we've got an
> ordering error between updating microcode and checking for dropped
> features, but again I don't think this would be relevant here.
>=20
> I suspect this is going to take some more custom debugging logic.

Hints welcome ;)
I can easily test any Xen patches there.=20

PS I'm pretty happy with my Xen debug setup there - I boot via PXE,
which allows me quickly iterate (build and test with just one reboot,
not two), and then collect crash message via kexec (sadly this laptop
refuses to boot with anything non-SSD plugged into M.2 slot :/). One
thing that could use improvement, is extracting console messages from
memory dump - `crash` doesn't work for me, and with `gdb` I get
`conring` of all zero-es (likely invalid address?). So, I'm using
`strings` :/
I should make some writeup about this setup ;)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dxypIFesLw4xY+U0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEboRUACgkQ24/THMrX
1yzgGwgAkfoyuIlU1HHRHxDgWbeujKukXxolD3yi+28drjw25cszPbztCfBTm+uw
sC+PjDiru7qV2zJ8H4FA+TLMN95W8FhCyLHRLmMfVzC0JDg2TTMZFe4ZaXcgZjoo
UHhYdhbuLpnNkN3EE81CDSCKCdLQxyMq8ERENciSPiJF9BZ46xMqJbYHNs7gKSUa
R6yvDon0XOA4N+QnEo1czoqoC8ZfIdW3/21eJ0lJW/7ha6LFi0/kTuCSHvDsng76
FLBYSpLFLle7ZojbuX3uh0oyQctEJqnJfbeRqrgIeXnA1iCWKtZc/hp1oMG2P29m
aVPu0vj1dJuweib7Q93Q118zreBIAQ==
=k02b
-----END PGP SIGNATURE-----

--dxypIFesLw4xY+U0--

