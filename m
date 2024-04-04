Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FA98985A0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 13:03:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700811.1094511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsKrp-0005lT-LB; Thu, 04 Apr 2024 11:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700811.1094511; Thu, 04 Apr 2024 11:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsKrp-0005ir-Hq; Thu, 04 Apr 2024 11:02:49 +0000
Received: by outflank-mailman (input) for mailman id 700811;
 Thu, 04 Apr 2024 11:02:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=56jZ=LJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rsKrn-0005ii-Qy
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 11:02:48 +0000
Received: from wfout6-smtp.messagingengine.com
 (wfout6-smtp.messagingengine.com [64.147.123.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbdf97a2-f272-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 13:02:44 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.west.internal (Postfix) with ESMTP id CC85A1C000D6;
 Thu,  4 Apr 2024 07:02:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 04 Apr 2024 07:02:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Apr 2024 07:02:38 -0400 (EDT)
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
X-Inumbo-ID: dbdf97a2-f272-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1712228560;
	 x=1712314960; bh=yyEnB/2/BVs6Zw8jvtoIqTUYgLj62BPnOPmMawpLiME=; b=
	fp6NLBO9/l2Yrk1mqnn7NjsqEpqpvP2mBzlwce1lR1U7GOtzfCeFoOR/grhbgRSP
	rmIJ9qb13igoSZZgfro/ejXJw7K+wnHAaxcnd7/bhlbBzY1/Te29chwzHF+3xLdB
	VRkht6oGlTf+EaPprEhWPu18FkNexq6huedyRkkhYTEbutuymXwK6zZ4SpfnA2cG
	8rh/yf8O512lHCmE1UAZwXpILZJDKwysLS3n7MxMJATMOW83qa3SV1wzOPagP0Uy
	7ZDu1Uu6TqA3dehYQunw5PDF25/6v2BhwzxrdgyzpM/uhBaVRRERZXjEualL4lXo
	8I3rxvqGchKeVykNwBLT1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712228560; x=1712314960; bh=yyEnB/2/BVs6Zw8jvtoIqTUYgLj6
	2BPnOPmMawpLiME=; b=niqNP9k3IVYsFPg02u1HpPSfDBHvIWIYw7pWOxGRNn4J
	2uTS7rZCAq9u+dZRnDRNvyrleECfolV94ii+CMoMyPU8rMtP+7Vq1a/0IBIjP8gf
	aKr4H4nvxAGUlEjKJ0PdKtQHeQJxGwpIpRGtoHXcv/1n+aOqxQtNURNS6WqPp0E7
	ZtRw8bJxuGrIDd6eFysb/QnhBI9cRaqocxIL8xzMYmRRUhlDVIkyVCiryhbPVikU
	dXwQTdHPxLrfRaGSJlGyQqcrkZr+eymx6RJtbamcrjrxZUOrBDBzbzryEyxr2EqC
	KBYeND/s71OJf2luCVJFoWupH/dHU8PVzOuPIaEKSg==
X-ME-Sender: <xms:z4gOZucwbxdvR_bjfLFj5ZEEzNHa694wXAxCTTofj_-TUmWeorEkHw>
    <xme:z4gOZoN4MY-mN2dKvi-h6rVKDWLgWLO0mlxoqCqABQ4ceLpVxsUKSjidveKgDggeb
    4vwbF8YQ1_vjQ>
X-ME-Received: <xmr:z4gOZvhZehSCyDNdYBeeLYfMqPF9z_HLGmdgooubhC5rwZX10pNNDRgR0nyv2lx-powS35Duqv133rsZzQYC9-zKobbARFpn6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefkedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:z4gOZr-KcOqDgBq00inpaDJjany1pOmp4uq7ud_hEwj0i8QGrXqB9Q>
    <xmx:z4gOZqtx6rS9WXW3Ui69vYY7Tow6QDWOMHtYqBzH1zTE_9fBA2dPLQ>
    <xmx:z4gOZiGkfD73aW8CQZVEMx6rBkW5M8Ti-_OUcpZzx-0lhaJGLpMw7g>
    <xmx:z4gOZpMZkfVsK4VRavZ07w4UcdfPunb7X7dHK7TrPNGZSQs-3s06iw>
    <xmx:0IgOZsInxxpuxkVmSOP_mGEY5f1_ZYb34IRKrtO40QybyHLSwgAddAB_>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 4 Apr 2024 13:02:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/tsx: Cope with RTM_ALWAYS_ABORT vs RTM mismatch
Message-ID: <Zg6IzLAoqQKLxb-c@mail-itl>
References: <Zg1stUacaDBkyDOn@mail-itl>
 <20240404104122.2870129-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BItlCCpQiz4AjJJY"
Content-Disposition: inline
In-Reply-To: <20240404104122.2870129-1-andrew.cooper3@citrix.com>


--BItlCCpQiz4AjJJY
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 4 Apr 2024 13:02:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/tsx: Cope with RTM_ALWAYS_ABORT vs RTM mismatch

On Thu, Apr 04, 2024 at 11:41:22AM +0100, Andrew Cooper wrote:
> It turns out there is something wonky on some but not all CPUs with
> MSR_TSX_FORCE_ABORT.  The presence of RTM_ALWAYS_ABORT causes Xen to think
> it's safe to offer HLE/RTM to guests, but in this case, XBEGIN instructio=
ns
> genuinely #UD.
>=20
> Spot this case and try to back out as cleanly as we can.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks, this makes the test exit with 0, and print just "Got #UD" now in
the "Testing RTM behaviour" section.

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> In the meantime, I'll see if anyone at Intel knows what's going on.  Beca=
use
> these parts are fully out of support now, it's very unlikely that we're g=
oing
> to get a fix.
> ---
>  xen/arch/x86/tsx.c | 55 +++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 45 insertions(+), 10 deletions(-)
>=20
> diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
> index 50d8059f23a9..41bb39d10074 100644
> --- a/xen/arch/x86/tsx.c
> +++ b/xen/arch/x86/tsx.c
> @@ -1,5 +1,6 @@
>  #include <xen/init.h>
>  #include <xen/param.h>
> +#include <asm/microcode.h>
>  #include <asm/msr.h>
> =20
>  /*
> @@ -9,6 +10,7 @@
>   *  -1 =3D> Default, altered to 0/1 (if unspecified) by:
>   *                 - TAA heuristics/settings for speculative safety
>   *                 - "TSX vs PCR3" select for TSX memory ordering safety
> + *  -2 =3D> Implicit tsx=3D0 (from RTM_ALWAYS_ABORT vs RTM mismatch)
>   *  -3 =3D> Implicit tsx=3D1 (feed-through from spec-ctrl=3D0)
>   *
>   * This is arranged such that the bottom bit encodes whether TSX is actu=
ally
> @@ -114,11 +116,50 @@ void tsx_init(void)
> =20
>          if ( cpu_has_tsx_force_abort )
>          {
> +            uint64_t val;
> +
>              /*
> -             * On an early TSX-enable Skylake part subject to the memory
> +             * On an early TSX-enabled Skylake part subject to the memory
>               * ordering erratum, with at least the March 2019 microcode.
>               */
> =20
> +            rdmsrl(MSR_TSX_FORCE_ABORT, val);
> +
> +            /*
> +             * At the time of writing (April 2024), it was discovered th=
at
> +             * some parts (e.g. CoffeeLake 8th Gen, 06-9e-0a, ucode 0xf6)
> +             * advertise RTM_ALWAYS_ABORT, but XBEGIN instructions #UD. =
 Other
> +             * similar parts (e.g. KabyLake Xeon-E3, 06-9e-09, ucode 0xf=
8)
> +             * operate as expected.
> +             *
> +             * In this case:
> +             *  - RTM_ALWAYS_ABORT and MSR_TSX_FORCE_ABORT are enumerate=
d.
> +             *  - XBEGIN instructions genuinely #UD.
> +             *  - MSR_TSX_FORCE_ABORT is write-discard and fails to hold=
 its
> +             *    value.
> +             *  - HLE and RTM are not enumerated, despite
> +             *    MSR_TSX_FORCE_ABORT.TSX_CPUID_CLEAR being clear.
> +             *
> +             * Spot this case, and treat it as if no TSX is available at=
 all.
> +             * This will prevent Xen from thinking it's safe to offer HL=
E/RTM
> +             * to VMs.
> +             */
> +            if ( val =3D=3D 0 && cpu_has_rtm_always_abort && !cpu_has_rt=
m )
> +            {
> +                printk(XENLOG_ERR
> +                       "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: =
RTM_ALWAYS_ABORT vs RTM mismatch\n",
> +                       boot_cpu_data.x86, boot_cpu_data.x86_model,
> +                       boot_cpu_data.x86_mask, this_cpu(cpu_sig).rev);
> +
> +                setup_clear_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT);
> +                setup_clear_cpu_cap(X86_FEATURE_TSX_FORCE_ABORT);
> +
> +                if ( opt_tsx < 0 )
> +                    opt_tsx =3D -2;
> +
> +                goto done_setup;
> +            }
> +
>              /*
>               * Probe for the June 2021 microcode which de-features TSX on
>               * client parts.  (Note - this is a subset of parts impacted=
 by
> @@ -128,15 +169,8 @@ void tsx_init(void)
>               * read as zero if TSX_FORCE_ABORT.ENABLE_RTM has been set b=
efore
>               * we run.
>               */
> -            if ( !has_rtm_always_abort )
> -            {
> -                uint64_t val;
> -
> -                rdmsrl(MSR_TSX_FORCE_ABORT, val);
> -
> -                if ( val & TSX_ENABLE_RTM )
> -                    has_rtm_always_abort =3D true;
> -            }
> +            if ( val & TSX_ENABLE_RTM )
> +                has_rtm_always_abort =3D true;
> =20
>              /*
>               * If no explicit tsx=3D option is provided, pick a default.
> @@ -191,6 +225,7 @@ void tsx_init(void)
>              setup_force_cpu_cap(X86_FEATURE_RTM);
>          }
>      }
> + done_setup:
> =20
>      /*
>       * Note: MSR_TSX_CTRL is enumerated on TSX-enabled MDS_NO and later =
parts.
>=20
> base-commit: 6117179dd99958e4ef2687617d12c9b15bdbae24
> --=20
> 2.30.2
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BItlCCpQiz4AjJJY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYOiMwACgkQ24/THMrX
1yzzhQf/SMfUL6+6G/fC2aPi5P8RayGZlhOtVLBm+NGAP6A4jdEqlYPuIv1YOvSd
ez6ehjgYrYtoatigwFbjQAXV+5NYnh6FGuF1w4rXwoNWjDgXuYNtkqilMSgA0Yg4
NgB3M5WRPZ9GuwNp+9sbt3hTvSniI00eARHvS5DEmYmF8Dv2kXpTdRU6klfHHH6K
uf5SVyzprbgFyGjS2mWBTbs3veeePuVNic+kMZj70ja4lKibOqXfXGK70h3TwWBd
C5GOoZxWHFi90TSmPQ0WgRnXjcYGfzIFkwDtpPlr5c9XE9jeZBiAzHmZhF+MCFXi
NTrM3zit1hSPE5e6FVi5AryBsp03jw==
=M7hq
-----END PGP SIGNATURE-----

--BItlCCpQiz4AjJJY--

