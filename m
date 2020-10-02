Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFCD281B75
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 21:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2308.6896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOQb0-0002eQ-Hv; Fri, 02 Oct 2020 19:19:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2308.6896; Fri, 02 Oct 2020 19:19:58 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOQb0-0002e1-En; Fri, 02 Oct 2020 19:19:58 +0000
Received: by outflank-mailman (input) for mailman id 2308;
 Fri, 02 Oct 2020 19:19:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUGt=DJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kOQaz-0002dw-AH
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 19:19:57 +0000
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4c7b97c-6489-4acf-a0f7-7ef04b33e76b;
 Fri, 02 Oct 2020 19:19:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C12F5C004B;
 Fri,  2 Oct 2020 15:19:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 02 Oct 2020 15:19:56 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1DAFE3280068;
 Fri,  2 Oct 2020 15:19:54 -0400 (EDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bUGt=DJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kOQaz-0002dw-AH
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 19:19:57 +0000
X-Inumbo-ID: e4c7b97c-6489-4acf-a0f7-7ef04b33e76b
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e4c7b97c-6489-4acf-a0f7-7ef04b33e76b;
	Fri, 02 Oct 2020 19:19:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 5C12F5C004B;
	Fri,  2 Oct 2020 15:19:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 02 Oct 2020 15:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=H1/P9y
	Ei+hlyWeojnApVQmK2oZDybpCtFF/bpTEQcdk=; b=AHUYe9BOfO3qia84hBlUg4
	8WeEP+z4MIdAwPERybK9YI3DbjcdRabsVdXgvVlK9w00/DDwFRGA7MZlB0qIZjOX
	MHHtycIkhoxBOjAIcbvwIEzFJ7LKo8+n2C7bzDFafBMRpz04VOGGwUrv+kCFkoN+
	feqo7V/B+E8GPAZnqTn+AqbgsveDryL+bRJ2WpZI9EofsG7Fx8sOlYXoiHdjtIhW
	4URSBCtUSa9Y/iu97BWI8PokbzZZEiml2zVoMUmSUBiSaZy44ihsFITenIlpphfY
	QetwW+UIxDmLYVrjQEF2fD1P2hJWXHcU2ef1dqwlO89d1nf9Bw02SfNcVCHJutpA
	==
X-ME-Sender: <xms:XH13XwiyeAafWedLfav2N-KAQRauPNXb5GzGyYmDZTGqEGEZweX6Jw>
    <xme:XH13X5AZrYho6DP2C9-Vzr1LqJ8TgxEegd6b38QfZ11uaHSP5okeJXKdaVsqraRYu
    tYWz6qkp-T84w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeeigddufeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejudei
    geeiffekgfduvdetfeefhefhleefudevleejveetffdugeekjedufffhfeenucffohhmrg
    hinhepgigvnhdrohhrghenucfkphepledurdeigedrudejtddrkeelnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:XH13X4Gayx6hRaU4un0PdNJtY8N6BWXR8wRk1-KjLaXKBBiSila-YQ>
    <xmx:XH13XxQbUJshtxgYPYjsT9U2uLORrQn0g7Wz-12XNIduzr8h9LCkRA>
    <xmx:XH13X9xDI6SyE1LJqpQs_SMGxg9-kFuS7UuoW0WCT_6yCQPMszWnig>
    <xmx:XH13X2vuxLJwZ50LV1L2T_P2KK4qyWtNn32afO6MvzuVCpvkyw2lnw>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 1DAFE3280068;
	Fri,  2 Oct 2020 15:19:54 -0400 (EDT)
Date: Fri, 2 Oct 2020 21:19:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Yet another S3 issue in Xen 4.14
Message-ID: <20201002191951.GA104059@mail-itl>
References: <20201001011245.GL3962@mail-itl>
 <a80ad59b-feb1-01c8-2b14-dbf6568d0ff5@suse.com>
 <20201001123129.GJ1482@mail-itl>
 <1e596ccc-a875-93f1-2619-e4dbcbd88b4d@citrix.com>
 <20201002150859.GM3962@mail-itl>
 <454ac9ce-012f-f2e7-722d-c5304fd3146f@suse.com>
 <aa5e1a7b-3724-bdc1-a313-0598aabd181f@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline
In-Reply-To: <aa5e1a7b-3724-bdc1-a313-0598aabd181f@citrix.com>


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Yet another S3 issue in Xen 4.14

On Fri, Oct 02, 2020 at 04:42:50PM +0100, Andrew Cooper wrote:
> On 02/10/2020 16:39, Jan Beulich wrote:
> > On 02.10.2020 17:08, Marek Marczykowski-G=C3=B3recki wrote:
> >> I've done another bisect on the commit broken up in separate changes
> >> (https://xenbits.xen.org/gitweb/?p=3Dpeople/andrewcoop/xen.git;a=3Dsho=
rtlog;h=3Drefs/heads/dbg-s3)
> >> and the bad part seems to be this:
> >>
> >> From dbdb32f8c265295d6af7cd4cd0aa12b6d04a0430 Mon Sep 17 00:00:00 2001
> >> From: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Date: Fri, 2 Oct 2020 15:40:22 +0100
> >> Subject: [PATCH 1/1] CR4
> > Interesting - I was wild guessing so yesterday, but couldn't come
> > up with even a vague reason why this would be. I think you could
> > further split it up:
> >
> >> --- a/xen/arch/x86/acpi/power.c
> >> +++ b/xen/arch/x86/acpi/power.c
> >> @@ -195,7 +195,6 @@ static int enter_state(u32 state)
> >>      unsigned long flags;
> >>      int error;
> >>      struct cpu_info *ci;
> >> -    unsigned long cr4;
> >> =20
> >>      if ( (state <=3D ACPI_STATE_S0) || (state > ACPI_S_STATES_MAX) )
> >>          return -EINVAL;
> >> @@ -270,15 +269,15 @@ static int enter_state(u32 state)
> >> =20
> >>      system_state =3D SYS_STATE_resume;
> >> =20
> >> -    /* Restore CR4 and EFER from cached values. */
> >> -    cr4 =3D read_cr4();
> >> -    write_cr4(cr4 & ~X86_CR4_MCE);
> >> +    /* Restore EFER from cached value. */
> >>      write_efer(read_efer());
> > This one should be possible to leave in place despite ...
> >
> >>      device_power_up(SAVED_ALL);
> >> =20
> >>      mcheck_init(&boot_cpu_data, false);
> >> -    write_cr4(cr4);
> >> +
> >> +    /* Restore CR4 from cached value, now MCE is set up. */
> >> +    write_cr4(read_cr4());
> > ... this change.
> >
> > Further, while I can't see how the set_in_cr4() in mcheck_init()
> > could badly interact with the CR4 writes here, another option
> > might be to suppress it when system_state =3D=3D SYS_STATE_resume
> > && c =3D=3D &boot_cpu_data (or !bsp && c =3D=3D &boot_cpu_data).
> >
> >> --- a/xen/arch/x86/acpi/suspend.c
> >> +++ b/xen/arch/x86/acpi/suspend.c
> >> @@ -23,7 +23,4 @@ void save_rest_processor_state(void)
> >>  void restore_rest_processor_state(void)
> >>  {
> >>      load_system_tables();
> >> -
> >> -    /* Restore full CR4 (inc MCE) now that the IDT is in place. */
> >> -    write_cr4(mmu_cr4_features);
> >>  }
> > This one should be possible to leave in place despite the other
> > changes.
>=20
> We're continuing to debug in private.=C2=A0 mmu_cr4_features and read_cr4=
()
> are equivalent (as expected), but very different from MINIMAL_CR4 which
> is what the trampoline configures, so I think we're suffering a
> CR4-related #UD/#GP somewhere in device_power_up() or mcheck_init().
>=20
> Its not INVPCID.=C2=A0 Trying others.

Some update:
It's OSFXSR + probably other flags, the crash happens in
enter_state()->device_power_up()->time_resume()->efi_get_time()

This also explains the difference between legacy / UEFI boot.

Disabling efi_get_time() or setting CR4 earlier solves _this_ issue, but
applied on top of stable-4.14 still doesn't work. Looks like there is
yet another S3 breakage in between. I'm bisecting it further...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl93fVYACgkQ24/THMrX
1yyInwf7BXxK1fB2WTRqErOugHqtQ004pjpf9I8voItFKYB6DMwW23GHREcFoiJu
kHWl4SNKbhaPT3q8cH6t/VCZ9/e2qg3ENFMpVbinZHhu3fP5kBoQO/skf5Cds6d3
WJPg7q6sPf6toeI5eju4SQiBD/5CbZIKI+qHMbmDd9Y1OTtiHJzEzb2YciX0HzSU
tm4uGv9i3qTIP/n+GU8Y7Z6ypf4xV2VKdasud3zHRkkz8OON17wFOnavTdsz5GfH
n4hdaveIPpahSLwbf2Dt9UoqjCZgP6wt/gir/gRNH5NbuKx/YbuJvoRZoXi3Uc69
D00Yb/oHQS0p8IspgBVYtiqjC2gAEg==
=hwmh
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--

