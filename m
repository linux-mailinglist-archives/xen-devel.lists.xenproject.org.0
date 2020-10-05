Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED72841F7
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 23:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3084.8925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPXnR-00085g-NX; Mon, 05 Oct 2020 21:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3084.8925; Mon, 05 Oct 2020 21:13:25 +0000
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
	id 1kPXnR-00085H-KS; Mon, 05 Oct 2020 21:13:25 +0000
Received: by outflank-mailman (input) for mailman id 3084;
 Mon, 05 Oct 2020 21:13:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ntw0=DM=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kPXnQ-00085C-Cu
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 21:13:24 +0000
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e7d79ff-d43c-492e-9d85-c2e4b5b6871a;
 Mon, 05 Oct 2020 21:13:23 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A340DC4E;
 Mon,  5 Oct 2020 17:13:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 05 Oct 2020 17:13:22 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0E12F306467E;
 Mon,  5 Oct 2020 17:13:19 -0400 (EDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ntw0=DM=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kPXnQ-00085C-Cu
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 21:13:24 +0000
X-Inumbo-ID: 5e7d79ff-d43c-492e-9d85-c2e4b5b6871a
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5e7d79ff-d43c-492e-9d85-c2e4b5b6871a;
	Mon, 05 Oct 2020 21:13:23 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id A340DC4E;
	Mon,  5 Oct 2020 17:13:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 05 Oct 2020 17:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=w44a34
	Xwd/fuPPnSQTUcs7xTsQtjSseIfEuXyMyPW+o=; b=gtbMI/3i2gHBHgJ2p3qmUw
	OpEaN0+DWix2rmLzrXpnpz9+BMoNULHCVAwoIjYzcQK/wfYU52SrIRS3xQ2u7nyT
	EBWW0KWntYtH901W13nxD4Qo38PjQyn+pcr2OP5WSB4WVHFrqRNYu71EWH2lNaPT
	qN9FFZ/y/DCys0mCXfI4qkAzPKd0gaSRji3H+KzbWI2oqqteMTh5DerjnsOJXAp2
	OtAAQIrmlwhDPllwn4brwpCc/yvGGYuIV4kJeCVNtKvSMNPbctVb16SPxvyzD8+F
	GDPxkfwTtYaEV1e/vVIDh89rnEoF7ouUglowVfLUU/87pYe1D+Lu6BYhjd+G5R+A
	==
X-ME-Sender: <xms:cIx7Xx-mYogIl_ajypMfdD4Y_E0LlkdA9hoH7n302RC777vuGTHAIg>
    <xme:cIx7X1uxygEGbXFihGlcQZ0Qsc1cO5mQL4gY860LA4bhfKeChcGY-7vrtDa2_ip7w
    4tUko7FXT8M5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdduieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
    durdeigedrudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:cIx7X_Cd6T-zVK4kPYJvkAWZOUA9PhWhZ_7Drg7dSAb3_f7NZg6Tlw>
    <xmx:cIx7X1dLgRjFOCYbUN_Dmg0MNuUrwO_pYVku9XSqbjPWm3jDb3azaA>
    <xmx:cIx7X2MCNbu_i6MJo6_DMZ1ab_vRVSNr2WGMAJAHbpE3fc5DqZOW9Q>
    <xmx:cYx7X43KX36r3pNap8-fah7oaU7RxVlFFWQ8iVDLO_sApFOQVnbzOw>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0E12F306467E;
	Mon,  5 Oct 2020 17:13:19 -0400 (EDT)
Date: Mon, 5 Oct 2020 23:13:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/smpboot: Unconditionally call
 memguard_unguard_stack() in cpu_smpboot_free()
Message-ID: <20201005211317.GA29479@mail-itl>
References: <20201005122325.17395-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline
In-Reply-To: <20201005122325.17395-1-andrew.cooper3@citrix.com>


--fdj2RfSjLxBAspz7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] x86/smpboot: Unconditionally call
 memguard_unguard_stack() in cpu_smpboot_free()

On Mon, Oct 05, 2020 at 01:23:25PM +0100, Andrew Cooper wrote:
> For simplicity between various configuration, Xen always uses shadow stack
> mappings (Read-only + Dirty) for the guard page, irrespective of whether
> CET-SS is enabled.
>=20
> memguard_guard_stack() writes shadow stack tokens with plain writes.  Thi=
s is
> necessary to configure the BSP shadow stack correctly, and cannot be
> implemented with WRSS.
>=20
> Therefore, unconditionally call memguard_unguard_stack() to return the
> mappings to fully writeable, so a subsequent call to memguard_guard_stack=
()
> will succeed.
>=20
> Fixes: 91d26ed304f ("x86/shstk: Create shadow stacks")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>=20
> This can more easily be demonstrated with CPU hotplug than S3, and the ab=
sence
> of bug reports goes to show how rarely hotplug is used.
> ---
>  xen/arch/x86/smpboot.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> index 5708573c41..c193cc0fb8 100644
> --- a/xen/arch/x86/smpboot.c
> +++ b/xen/arch/x86/smpboot.c
> @@ -971,16 +971,16 @@ static void cpu_smpboot_free(unsigned int cpu, bool=
 remove)
>      if ( IS_ENABLED(CONFIG_PV32) )
>          FREE_XENHEAP_PAGE(per_cpu(compat_gdt, cpu));
> =20
> +    if ( stack_base[cpu] )
> +        memguard_unguard_stack(stack_base[cpu]);
> +
>      if ( remove )
>      {
>          FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
>          FREE_XENHEAP_PAGE(idt_tables[cpu]);
> =20
>          if ( stack_base[cpu] )
> -        {
> -            memguard_unguard_stack(stack_base[cpu]);
>              FREE_XENHEAP_PAGES(stack_base[cpu], STACK_ORDER);
> -        }
>      }
>  }
> =20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl97jGsACgkQ24/THMrX
1ywHXAf/dvZP+pfkZeQTZFiuf+zuR0mbcoZx3l8/kJpZS7e7ojsU432zxp4PvB6R
IYCD62ypvzlq2UA+lwmHSS0rMQl7b9JyHYlV6MdlBQhCUgh4LNtlONkVU02dcRz4
Sn1xR4p0RN6ibdpRQNhIH0F2Upbr4g/x/ancfsrO0jmkAOb7cD7E89FfIoa0i58x
0PIKnZQQUsSYbDEdatQZzPlKN313MFA597dHoFv12D97TCxWDRCCnd5WuY63CX82
csyf4XWNVCI199IUwvQaN2O1NUeWuAbMm/1/0Nqw+1krY279cy/674J5m9m6aIcu
0up4Op1UOgDEI/DJpXyGCY+x0B8y0g==
=Sv2R
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--

