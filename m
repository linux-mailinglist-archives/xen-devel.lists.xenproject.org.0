Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B519FF956
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 13:25:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863905.1275259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTKFZ-0007uo-TR; Thu, 02 Jan 2025 12:24:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863905.1275259; Thu, 02 Jan 2025 12:24:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTKFZ-0007t7-Qp; Thu, 02 Jan 2025 12:24:29 +0000
Received: by outflank-mailman (input) for mailman id 863905;
 Thu, 02 Jan 2025 12:24:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4GO/=T2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tTKFY-0007t1-IE
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 12:24:28 +0000
Received: from fhigh-a7-smtp.messagingengine.com
 (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 811da116-c904-11ef-a0db-8be0dac302b0;
 Thu, 02 Jan 2025 13:24:26 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id E38CF11400BC;
 Thu,  2 Jan 2025 07:24:24 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Thu, 02 Jan 2025 07:24:24 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jan 2025 07:24:24 -0500 (EST)
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
X-Inumbo-ID: 811da116-c904-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1735820664;
	 x=1735907064; bh=sT6GYu4RKbwEh2Bxw3mOGQTmqoX/hrid1Bfzn7Q27fc=; b=
	qHrUvl8h+qx7NT9jBEJzr6Tb5szhtW2oZoyomt7jGEO0GSgv5p2rNXZuiNRMUnWa
	G46ylVLe+YXkwK3OGTTQuhpGPhzapvealxWj1Jbq/6EabbieI0RNdfZwlhhmDHXy
	NyM9mWQai56hd3RFJwz9wdvfNQ9arhrztE+pWcV0bHURDz0893t4CRvx8xCfBLcV
	yREOpb7m2eG49q6wD9eIppHQIHOj9+qrojJV9LitfqpMkXkPXEhMXH7+xi/4KC1E
	suWeFfrOPs4ddpGk8dHqluLZcxOqMVoq5sBVVmkHSlhjdhF5Zd7Bc1zgVOrF28N7
	PlrTZufp4jBy5l3nBiUQ7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735820664; x=1735907064; bh=sT6GYu4RKbwEh2Bxw3mOGQTmqoX/hrid1Bf
	zn7Q27fc=; b=fuDfWONm+zD7qGZ+MEFr2X6L7+dtQ0kiWgqBxfFAB0T5Hi46q4L
	X0r8lt7nXwMMQ+jwxeRy7e7TaUEvYYwvjZi11pOiFZfS6jcFESGHg4h8j3TRe8uD
	GF9+E7RHdkot+091UzFJIrXAMcGOdgD9Uvb0/SJo2+dYY91duExY3KsMvidSK22U
	ZhI1NN2KUpwx7cgSmVeY4EqGxKD325b8VkquTJMaeq5C1QT+IMkuKRNjX2bYEhxK
	Fly94VCOOvzb6TT/sVVlPZdY4o1r7eZkN5eULgUlES9/ANDFJDZvuVXwMicCYXfr
	+6r5Gk3NVeqVkJOrv2VarsN4l35UjITOLYA==
X-ME-Sender: <xms:eIV2Z64pFV1ufUXfQQELpslxlDCVp3fxUgNJKRDzgKQ6y7Bs3Dh9zQ>
    <xme:eIV2Zz4v0z0CpAFUnGAZvz8af1JnLqU2sktvN4Zl2O7c8mXWhQ707m8wfRD0v2pks
    AGyFshL9pW6tw>
X-ME-Received: <xmr:eIV2Z5cp5Ve_xS7xsTGXItBCjM8bv-P7NmOfkxdrYLRB1IhWzzEEe7YYfIQ9FsbJAht5t2_JH4lRTuHaPW5Wt62FqRWz9iCLOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefvddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepjeejgfekudegheeivdeiffdvffegteektdfhudeljeeikefhteefke
    efgffgieegnecuffhomhgrihhnpehquhgsvghsqdhoshdrohhrghdpghhithhhuhgsrdgt
    ohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghr
    tghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhgrhhoshhsse
    hsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghn
    phhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:eIV2Z3LLB97IY1kNM4tf-LyXhx052Lxm1j2US8sJkOsj7YseUgXHXQ>
    <xmx:eIV2Z-LPdS8z7EQhby8PnaAX71W6RVjocIMz5OZmCg_pNmSCWFysJg>
    <xmx:eIV2Z4wrLS_XqptbkSjXoSaMGbkbOROZaYn9myJSz6r8gzTMEnnCRA>
    <xmx:eIV2ZyLkCKtRq466o-Sc0ILQzJ5SG_mnsFPPk62DTlaZywxeHd-_ww>
    <xmx:eIV2Z1U3wnDXHGEKcfNSRgMA2QKioAVCoOx3uTO5mRYkVVV_dr4mfwNc>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Jan 2025 13:24:21 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
Message-ID: <Z3aFdrygLF9yK2EK@mail-itl>
References: <Z2RGfpJkO0z_nKV6@mail-itl>
 <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
 <6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E+iv+cIVVBOtIZKv"
Content-Disposition: inline
In-Reply-To: <6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com>


--E+iv+cIVVBOtIZKv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Jan 2025 13:24:21 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0

On Thu, Jan 02, 2025 at 12:30:10PM +0100, Juergen Gross wrote:
> On 02.01.25 11:20, J=C3=BCrgen Gro=C3=9F wrote:
> > On 19.12.24 17:14, Marek Marczykowski-G=C3=B3recki wrote:
> > > Hi,
> > >=20
> > > It crashes on boot like below, most of the times. But sometimes (rare=
ly)
> > > it manages to stay alive. Below I'm pasting few of the crashes that l=
ook
> > > distinctly different, if you follow the links, you can find more of
> > > them. IMHO it looks like some memory corruption bug somewhere. I test=
ed
> > > also Linux 6.13-rc2 before, and it had very similar issue.
> >=20
> > ...
> >=20
> > >=20
> > > Full log:
> > > https://openqa.qubes-os.org/tests/122879/logfile?filename=3Dserial0.t=
xt
> >=20
> > I can reproduce a crash with 6.13-rc5 PV dom0.
> >=20
> > What is really interesting in the logs: most crashes seem to happen rig=
ht
> > after a module being loaded (in my reproducer it was right after loading
> > the first module).
> >=20
> > I need to go through the 6.13 commits, but I think I remember having se=
en
> > a patch optimizing module loading by using large pages for addressing t=
he
> > loaded modules. Maybe the case of no large pages being available isn't
> > handled properly.
>=20
> Seems I was right.
>=20
> For me the following diff fixes the issue. Marek, can you please confirm
> it fixes your crashes, too?

Thanks for looking into it!
Will do, I've pushed it to
https://github.com/QubesOS/qubes-linux-kernel/pull/662, CI will build it
and then I'll post it to openQA.

> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index c6d29f283001..b5b7964b34b0 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -1080,7 +1080,7 @@ struct execmem_info __init *execmem_arch_setup(void)
>=20
>         start =3D MODULES_VADDR + offset;
>=20
> -       if (IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX)) {
> +       if (IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) &&
> cpu_feature_enabled(X86_FEATURE_PSE)) {
>                 pgprot =3D PAGE_KERNEL_ROX;
>                 flags =3D EXECMEM_KASAN_SHADOW | EXECMEM_ROX_CACHE;
>         } else {
>=20
>=20
> Juergen






--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--E+iv+cIVVBOtIZKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmd2hXYACgkQ24/THMrX
1yyDCgf8C8BVaZuF0fbcizTHlH7K7trka2LD7itMGWdEEXSBUh22Lx+Z1FRPMhrB
Z3Al4qq+PT1W4NFAnylj0mt80NQqUQEk/KfJDbZhdmmBNniD6IFdwFejc3jIUufb
V2ziJKwrFUAD3D3O1UBSrE44NUfYhD7LRnOo4esvfk5wcru4bhV6u/fl37IA/p2E
c2+Bx8uaUnm8WNhl1U6ijgtc+H540KnuI8mJJSGha6Vp809cykByERGNVJDwWxBi
yLgTR1xjNnNtvEVHUX3uy/JxbiLHVYk+THFfvY9lAg38bQb6yg0/oiH5LFizVH65
qAfFBpR9glHGTUEqbMrd/zbSrbvmow==
=TATy
-----END PGP SIGNATURE-----

--E+iv+cIVVBOtIZKv--

