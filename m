Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1EE2841F9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 23:15:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3085.8936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPXpO-0008EO-4d; Mon, 05 Oct 2020 21:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3085.8936; Mon, 05 Oct 2020 21:15:26 +0000
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
	id 1kPXpO-0008E1-13; Mon, 05 Oct 2020 21:15:26 +0000
Received: by outflank-mailman (input) for mailman id 3085;
 Mon, 05 Oct 2020 21:15:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ntw0=DM=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kPXpM-0008Du-2S
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 21:15:24 +0000
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0adaa178-0210-411b-95f5-ce439d0d8dfb;
 Mon, 05 Oct 2020 21:15:23 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B5B19B54;
 Mon,  5 Oct 2020 17:15:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 05 Oct 2020 17:15:22 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 072453280065;
 Mon,  5 Oct 2020 17:15:19 -0400 (EDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ntw0=DM=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kPXpM-0008Du-2S
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 21:15:24 +0000
X-Inumbo-ID: 0adaa178-0210-411b-95f5-ce439d0d8dfb
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0adaa178-0210-411b-95f5-ce439d0d8dfb;
	Mon, 05 Oct 2020 21:15:23 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id B5B19B54;
	Mon,  5 Oct 2020 17:15:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 05 Oct 2020 17:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=78gGKA
	+FpT1gnP+KjIavvYsyqEE7AX9QTMq1801bMgk=; b=I5lNESO7eMv1EfSA91K6eF
	ch5VD0EmfvLHEwpEV++lUvS8+eU9V5vpZQvNE58O/2uM8wNv87OqcmOoBajTF6L5
	W+wVNqCgMaxezPI81rcAiJ0Rs+hR8lhDqGL+Lc7QsnPGTppjGd5zKTHDzVQDhNix
	YRNU9vQWLN5O8yU1NEY3WlhSVV88BRWJiB69HX5me0CjrAqqy79eN0ovn/izWDqm
	uh1mVjHglEzC6hga7ntAZXthE0llCnkN03A3Jfrys4+XIJtohvvOaLHt0EZHuLlF
	WTXxbx7VokfpVhBcBeSAZKvAme7KnEgBPnCszE7MWXrOCQAtN8w0noDQV6AzgJ1Q
	==
X-ME-Sender: <xms:6Ix7X0EZx_dDD8fTMJcqqFGYGXBRJRvMngekfixT5KOHUc-h3N2GYg>
    <xme:6Ix7X9VCWE63dR7fEnyzCzcn2Q5Dkk9fliTCmj0lG50SX7-GpeiRC7lRZ9Tcff40p
    qoDCu3A6Fk8_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdduieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedtudff
    feefjeduhffgffelueeugefgvdeltdegfeevtdeugeeuieeltdevfeeuhfenucffohhmrg
    hinhepphhrohhtrdhssgenucfkphepledurdeigedrudejtddrkeelnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:6Ix7X-IqXPG079rPQUGB7TSdpHCHNtJMI2_QLrI1UKTCqm8EaSKtXQ>
    <xmx:6Ix7X2G6AFzJwHk_-FkIZwnoWLdLD4v-SV52E6Kx8_mCUUJ1WGyOkw>
    <xmx:6Ix7X6VFcv8e_ifWN-UVdWzwmtlMepgPJ9dm1RAKXKP9sor4cCjHSQ>
    <xmx:6Yx7X9dQNppcg2v79bU_96mTdH8F6FFPj08g0XZXEJQPB47jKkA0aA>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 072453280065;
	Mon,  5 Oct 2020 17:15:19 -0400 (EDT)
Date: Mon, 5 Oct 2020 23:15:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/S3: Restore CR4 earlier during resume
Message-ID: <20201005211517.GB29479@mail-itl>
References: <20201002213650.2197-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline
In-Reply-To: <20201002213650.2197-1-andrew.cooper3@citrix.com>


--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] x86/S3: Restore CR4 earlier during resume

On Fri, Oct 02, 2020 at 10:36:50PM +0100, Andrew Cooper wrote:
> c/s 4304ff420e5 "x86/S3: Drop {save,restore}_rest_processor_state()
> completely" moved CR4 restoration up into C, to account for the fact that=
 MCE
> was explicitly handled later.
>=20
> However, time_resume() ends up making an EFI Runtime Service call, and EFI
> explodes without OSFXSR, presumably when trying to spill %xmm registers o=
nto
> the stack.
>=20
> Given this codepath, and the potential for other issues of a similar kind=
 (TLB
> flushing vs INVPCID, HVM logic vs VMXE, etc), restore CR4 in asm before
> entering C.
>=20
> Ignore the previous MCE special case, because its not actually necessary.=
  The
> handler is already suitably configured from before suspend.
>=20
> Fixes: 4304ff420e5 ("x86/S3: Drop {save,restore}_rest_processor_state() c=
ompletely")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

This one doesn't build, wakeup_prot.S misses #include <asm/asm_defns.h>
=2E With that fixed:

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> This is one definite bug fix.  It doesn't appear to be the only S3 bug
> however.
> ---
>  xen/arch/x86/acpi/power.c       | 3 ---
>  xen/arch/x86/acpi/wakeup_prot.S | 5 +++++
>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
> index 4fb1e7a148..7f162a4df9 100644
> --- a/xen/arch/x86/acpi/power.c
> +++ b/xen/arch/x86/acpi/power.c
> @@ -276,9 +276,6 @@ static int enter_state(u32 state)
> =20
>      mcheck_init(&boot_cpu_data, false);
> =20
> -    /* Restore CR4 from cached value, now MCE is set up. */
> -    write_cr4(read_cr4());
> -
>      printk(XENLOG_INFO "Finishing wakeup from ACPI S%d state.\n", state);
> =20
>      if ( (state =3D=3D ACPI_STATE_S3) && error )
> diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_p=
rot.S
> index c6b3fcc93d..1ee5551fb5 100644
> --- a/xen/arch/x86/acpi/wakeup_prot.S
> +++ b/xen/arch/x86/acpi/wakeup_prot.S
> @@ -110,6 +110,11 @@ ENTRY(s3_resume)
> =20
>          call    load_system_tables
> =20
> +        /* Restore CR4 from the cpuinfo block. */
> +        GET_STACK_END(bx)
> +        mov     STACK_CPUINFO_FIELD(cr4)(%rbx), %rax
> +        mov     %rax, %cr4
> +
>  .Lsuspend_err:
>          pop     %r15
>          pop     %r14

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl97jOQACgkQ24/THMrX
1yxwQAf8Dmth2ZMaDIcy1RZdmJqq+/Zr6s4nHlu0slcjWanu7gIkQt7x4PzLkdGN
LDFqmCjlcUh3/dlmZ+gAT9573Gnv6WZKzUGv9SrXS5B1GVBn+Z3zWhk+S5Tf9F5q
tlIk0AydKFLFzjlASnwrfO89/ypcBi2A13iMCHgKug1BlK4NGpAtx3smn2ZrvIQP
jt70pfwZ0D49lTsKElmjhNEo7GWURtWaWNOEg/n/yhITUcb8Ykk1i43UNQ7y22i5
soWPEAv3cGnSBhPc9a7agODMLV/1smS3i5DluXwlLwWQitwi33fIU8IerjvdASjV
ZV4mXQ0SCKGvJ6jJ2dAipFQnpeYrgw==
=+E2q
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--

