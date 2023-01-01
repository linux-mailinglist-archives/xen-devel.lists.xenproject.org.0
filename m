Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CA565AA4F
	for <lists+xen-devel@lfdr.de>; Sun,  1 Jan 2023 16:11:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470121.729561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBzzP-0001ui-ID; Sun, 01 Jan 2023 15:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470121.729561; Sun, 01 Jan 2023 15:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBzzP-0001rw-FS; Sun, 01 Jan 2023 15:11:07 +0000
Received: by outflank-mailman (input) for mailman id 470121;
 Sun, 01 Jan 2023 15:11:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11tG=46=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pBzzO-0001rq-BO
 for xen-devel@lists.xenproject.org; Sun, 01 Jan 2023 15:11:06 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82214e8a-89e6-11ed-91b6-6bf2151ebd3b;
 Sun, 01 Jan 2023 16:11:04 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 312C632005CA;
 Sun,  1 Jan 2023 10:11:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 01 Jan 2023 10:11:02 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Jan 2023 10:10:58 -0500 (EST)
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
X-Inumbo-ID: 82214e8a-89e6-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1672585861; x=
	1672672261; bh=0iWt9Z2gLbDLmZ3Gl405zz+RiInR67FHrOISNpK+eQo=; b=z
	BE/218ltPLi/9QKJiPs+yXwfWBknaWGX3MqAinvoJJK2pbeU37HGeHnLyTRJ4Mc/
	H3vIg+vnQDlkjCZvcG1TFmM+0TUOhw7WCItZwWxZXMnJLczT+Fs5s8rVoEdbVSGO
	17wHZcNCbzn13vsk3C2GPnzskL4B6WxvE8X80xeA7MJsyZSZPPhIETZ0rAku42WZ
	UOc4cOnegc49vvJaTV+Hhy3GzwK5MrLUXAlWfcZOlAKPY/tNushsSZhljg+qaaZ8
	OOjKxJzRm8OPUOf0OWb3R1fIVqXBFy7PuQ6PMn+e8jEIt2BROFHjhzG+4Tgm8Eg2
	GbvNAykWufPc2fJXvoANA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672585861; x=1672672261; bh=0iWt9Z2gLbDLmZ3Gl405zz+RiInR
	67FHrOISNpK+eQo=; b=EpwVUp3YbqvO8XdwOIEzmq+pCZx/oo7PHCZB66fCSJBE
	106S2UdR21RO4LhV16Q4xYCMLyq8X5PEoJCS9N/C6rZKSyW3mpGIP79szDkWQAFi
	jHj1s01lUfKfIalMHi1o2zQU0LQI6VbRjHbrUtcMy6N40j1DKqfE7IzAy8+AhwZG
	NMBHYvpGY0NyHaDyYDrDILS221SdY3tAp+sw3bEOyBX7ye6naQvQ+DXF7NnXFotx
	ocsPfBxTdPkcKzP5cCSU/VhvbnBHx/Ctbm9o5QEy9HUnBxawFckgANTrU+IHQgg5
	aNimGPKLI4Y0xkoxkZ7WPlMY3CgMLM57JiRverxifw==
X-ME-Sender: <xms:haKxY0Z6jaUgamoyy8wz-dhEpWTViKO97OdpLgoipJkxCZ90s53B8g>
    <xme:haKxY_YPlk1xGh9T6x35_XfmJo5Z-LZNtQnIhSeWgOyY2OAun1LUzwF-0IVIP_dKi
    ztozlyLXp9vag>
X-ME-Received: <xmr:haKxY-8nZN3i8KBXJWaQt9LqUsqiY0Avf8aLuh8YY3FInWvxNEcy91c6ozlr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedtgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:haKxY-omvZaoNXPy_P5P4Wk2m6o2KISTD9HFVmwcWjTIYAi6mzcUIA>
    <xmx:haKxY_qReycYgXhkupw-4BXj1GH9WfT3k42x4CpGiLP0_tapneisPg>
    <xmx:haKxY8RfIrRNnuODvqkg2Jp_5USI1meikcN33m7FEOSiwZJSd2oluw>
    <xmx:haKxY20khfJYZ_-y77YRo-2qHWXx0G3cgjPZ8NcrEgAG8wRD7tSeMA>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 1 Jan 2023 16:10:54 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] x86/shskt: Disable CET-SS on parts succeptable to
 fractured updates
Message-ID: <Y7GifofUaQ8u8ugr@mail-itl>
References: <20221231003007.26916-1-andrew.cooper3@citrix.com>
 <20221231003007.26916-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+a2V8WRjif75DJuw"
Content-Disposition: inline
In-Reply-To: <20221231003007.26916-3-andrew.cooper3@citrix.com>


--+a2V8WRjif75DJuw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 1 Jan 2023 16:10:54 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] x86/shskt: Disable CET-SS on parts succeptable to
 fractured updates

On Sat, Dec 31, 2022 at 12:30:07AM +0000, Andrew Cooper wrote:
> Refer to Intel SDM Rev 70 (Dec 2022), Vol3 17.2.3 "Supervisor Shadow Stack
> Token".
>=20
> Architecturally, an event delivery which starts in CPL>3 and switches sha=
dow
> stack will first validate the Supervisor Shstk Token and set the busy bit,
> then pushes LIP/CS/SSP.  One example of this is an NMI interrupting Xen.
>=20
> Some CPUs suffer from an issue called fracturing, whereby a fault/vmexit/=
etc
> between setting the busy bit and completing the event injection renders t=
he
> action non-restartable, because when it comes time to restart, the busy b=
it is
> found to be already set.
>=20
> This is far more easily encountered under virt, yet it is not the fault o=
f the
> hypervisor, nor the fault of the guest kernel.  The fault lies somewhere
> between the architectural specification, and the uarch behaviour.
>=20
> Intel have allocated CPUID.7[1].ecx[18] CET_SSS to enumerate that supervi=
sor
> shadow stacks are safe to use.  Because of how Xen lays out its shadow st=
acks,
> fracturing is not expected to be a problem on native.
>=20
> Detect this case on boot and default to not using shstk if virtualised.
> Specifying `cet=3Dshstk` on the command line will override this heurstic =
and
> enable shadow stacks irrespective.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>=20
> I've got a query out with AMD, but so far it is only Intel CPUs known to =
be
> impacted.
>=20
> This ideally wants backporting to Xen 4.14.  I have no idea how likely it=
 is
> to need to backport the prerequisite patch for new feature words, but we'=
ve
> already had to do that once for security patches...
> ---
>  docs/misc/xen-command-line.pandoc           |  7 +++++-
>  tools/libs/light/libxl_cpuid.c              |  2 ++
>  tools/misc/xen-cpuid.c                      |  1 +
>  xen/arch/x86/cpu/common.c                   | 11 +++++++--
>  xen/arch/x86/setup.c                        | 37 +++++++++++++++++++++++=
+++---
>  xen/include/public/arch-x86/cpufeatureset.h |  1 +
>  6 files changed, 53 insertions(+), 6 deletions(-)
>=20
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index 923910f553c5..19d4d815bdee 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -287,10 +287,15 @@ can be maintained with the pv-shim mechanism.
>      protection.
> =20
>      The option is available when `CONFIG_XEN_SHSTK` is compiled in, and
> -    defaults to `true` on hardware supporting CET-SS.  Specifying
> +    generally defaults to `true` on hardware supporting CET-SS.  Specify=
ing
>      `cet=3Dno-shstk` will cause Xen not to use Shadow Stacks even when s=
upport
>      is available in hardware.
> =20
> +    Some hardware suffers from an issue known as Supervisor Shadow Stack
> +    Fracturing.  On such hardware, Xen will default to not using Shadow =
Stacks
> +    when virtualised.  Specifying `cet=3Dshstk` will override this heuri=
stic and
> +    enable Shadow Stacks unilaterally.
> +
>  *   The `ibt=3D` boolean controls whether Xen uses Indirect Branch Track=
ing for
>      its own protection.
> =20
> diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpui=
d.c
> index 2aa23225f42c..d97a2f3338bc 100644
> --- a/tools/libs/light/libxl_cpuid.c
> +++ b/tools/libs/light/libxl_cpuid.c
> @@ -235,6 +235,8 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list =
*cpuid, const char* str)
>          {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
>          {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
> =20
> +        {"cet-sss",      0x00000007,  1, CPUID_REG_EDX, 18,  1},
> +
>          {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
>          {"mcdt-no",      0x00000007,  2, CPUID_REG_EDX,  5,  1},
> =20
> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index 0091a11a67bc..ea33b587665d 100644
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -208,6 +208,7 @@ static const char *const str_7c1[32] =3D
> =20
>  static const char *const str_7d1[32] =3D
>  {
> +    [18] =3D "cet-sss",
>  };
> =20
>  static const char *const str_7d2[32] =3D
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index b3fcf4680f3a..d962f384a995 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -346,11 +346,18 @@ void __init early_cpu_init(void)
>  	       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86, c->x86,
>  	       c->x86_model, c->x86_model, c->x86_mask, eax);
> =20
> -	if (c->cpuid_level >=3D 7)
> -		cpuid_count(7, 0, &eax, &ebx,
> +	if (c->cpuid_level >=3D 7) {
> +		uint32_t max_subleaf;
> +
> +		cpuid_count(7, 0, &max_subleaf, &ebx,
>  			    &c->x86_capability[FEATURESET_7c0],
>  			    &c->x86_capability[FEATURESET_7d0]);
> =20
> +                if (max_subleaf >=3D 1)

tabs vs spaces ...

Is this file imported from Linux? It uses tabs for indentation, contrary
to the rest of the Xen code base.

> +			cpuid_count(7, 1, &eax, &ebx, &ecx,
> +				    &c->x86_capability[FEATURESET_7d1]);
> +        }
> +
>  	eax =3D cpuid_eax(0x80000000);
>  	if ((eax >> 16) =3D=3D 0x8000 && eax >=3D 0x80000008) {
>  		ebx =3D eax >=3D 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 566422600d94..e052b7b748fa 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -96,7 +96,7 @@ size_param("highmem-start", highmem_start);
>  #endif
> =20
>  #ifdef CONFIG_XEN_SHSTK
> -static bool __initdata opt_xen_shstk =3D true;
> +static int8_t __initdata opt_xen_shstk =3D -1;
>  #else
>  #define opt_xen_shstk false
>  #endif
> @@ -1101,9 +1101,40 @@ void __init noreturn __start_xen(unsigned long mbi=
_p)
>      /* Choose shadow stack early, to set infrastructure up appropriately=
=2E */
>      if ( opt_xen_shstk && boot_cpu_has(X86_FEATURE_CET_SS) )
>      {
> -        printk("Enabling Supervisor Shadow Stacks\n");
> +        /*
> +         * Some CPUs suffer from Shadow Stack Fracturing, an issue where=
by a
> +         * fault/VMExit/etc between setting a Supervisor Busy bit and the
> +         * event delivery completing renders the operation non-restartab=
le.
> +         * On restart, event delivery will find the Busy bit already set.
> +         *
> +         * This is a problem on native, but outside of synthetic cases, =
only
> +         * with #MC against a stack access (in which case we're dead any=
way).
> +         * It is a much bigger problem under virt, because we can VMExit=
 for a
> +         * number of legitimate reasons and tickle this bug.
> +         *
> +         * CPUs with this addressed enumerate CET-SSS to indicate that
> +         * supervisor shadow stacks are now safe to use.
> +         */
> +        bool cpu_has_bug_shstk_fracture =3D
> +            boot_cpu_data.x86_vendor =3D=3D X86_VENDOR_INTEL &&
> +            !boot_cpu_has(X86_FEATURE_CET_SSS);
> +
> +        /*
> +         * On native, assume that Xen won't be impacted by shstk fractur=
ing
> +         * problems.  Under virt, be more conservative and disable shstk=
 by
> +         * default.
> +         */
> +        if ( opt_xen_shstk =3D=3D -1 )
> +            opt_xen_shstk =3D
> +                cpu_has_hypervisor ? !cpu_has_bug_shstk_fracture
> +                                   : true;
> +
> +        if ( opt_xen_shstk )
> +        {
> +            printk("Enabling Supervisor Shadow Stacks\n");
> =20
> -        setup_force_cpu_cap(X86_FEATURE_XEN_SHSTK);
> +            setup_force_cpu_cap(X86_FEATURE_XEN_SHSTK);
> +        }
>      }
> =20
>      if ( opt_xen_ibt && boot_cpu_has(X86_FEATURE_CET_IBT) )
> diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/pu=
blic/arch-x86/cpufeatureset.h
> index 7a896f0e2d92..f6a46f62a549 100644
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -290,6 +290,7 @@ XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Pro=
tected Processor Inventory
> =20
>  /* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
>  /* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
> +XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow =
Stacks safe to use */
> =20
>  /* Intel-defined CPU features, CPUID level 0x00000007:2.edx, word 13 */
>  XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
> --=20
> 2.11.0
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+a2V8WRjif75DJuw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOxon4ACgkQ24/THMrX
1yzQ8Af/eDRIjmUkuoE9Oc63KDRB5WB+pCi8hFiwWELOfAkGpWiUVjqVtTCwIoba
lZaKVgTb1tNX5FSk7BOEzngH09zATAEk4b61ZVldAq/3LLuiW2YGMAZDRDf5al7l
pkMxoy+Tk9Ze+bEhawl2dC0FXzWgTXkVEUWd12AtFtImLcF8Gx4UILI8/USzi5Om
V1UPMppQlI4+d9MvPw47jwnLniWqxb0235ZRQPUqZkGM10HJCtwzN1H2tXD3TgzP
ANxNDptb+oEHqP4HDi5OyDanjm+ht4ARJVwq5nBJ4Rua/zYg/PK+GgxBEyFRMACe
Q8m577inn76kaVNmQbPx7mgkWLCGTw==
=zDH5
-----END PGP SIGNATURE-----

--+a2V8WRjif75DJuw--

