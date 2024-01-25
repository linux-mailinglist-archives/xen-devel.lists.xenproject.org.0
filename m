Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBBF83C149
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jan 2024 12:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671466.1044824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSyD8-0000pZ-O6; Thu, 25 Jan 2024 11:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671466.1044824; Thu, 25 Jan 2024 11:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSyD8-0000mP-LR; Thu, 25 Jan 2024 11:47:58 +0000
Received: by outflank-mailman (input) for mailman id 671466;
 Thu, 25 Jan 2024 11:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QGEI=JD=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rSyD7-0000mJ-E7
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2024 11:47:57 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 916b7cc6-bb77-11ee-9b0f-b553b5be7939;
 Thu, 25 Jan 2024 12:47:54 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 204893200B08;
 Thu, 25 Jan 2024 06:47:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 25 Jan 2024 06:47:49 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Jan 2024 06:47:47 -0500 (EST)
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
X-Inumbo-ID: 916b7cc6-bb77-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1706183268;
	 x=1706269668; bh=DMkmXjxEiBHByOXD9PDmM/4xbu4XrklIuLd1RJe/z8E=; b=
	Gjx1VBQOudHLsAXg+XPbWakl9TJkM9r2sOvVqQDDbnKBoYOSGQGsh7y4bWt052oA
	z3ZVEwk3znYYlBW7jHliuJa+szmDMVODepbcEkgayWMbsd6q7ToFEGD5ywEXHu9Z
	kXSmu2VejzR4MlLbzfjyQex+k47zOD3xMVl+C6Ym2u+JgSXM/Ulh6UEV1I2WJ2Hq
	LQCsZgB1z9wVxrrVvX764Ly9wiLL8A52tyEsseJqd6Sgy8ovS6j4kEhtUhLo/IXb
	64dQAr8Wlmx4uvPt/LDRWSA890BgxRul3jK9FDMns2AHfx8zt9mWEaGSkaHBGU72
	VZA/KMsV1HO1GV91o8KekA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706183268; x=1706269668; bh=DMkmXjxEiBHByOXD9PDmM/4xbu4X
	rklIuLd1RJe/z8E=; b=A3iVR0as0ZhQbfQGybAql/RBQuwXAeJgV5CzAM2Urha3
	5X+GfIIYR6k9xz0c+wjsx05Z5EeNOzt6fkxZrLhU+tTYuh0EMBIhfIKMaTTRRcj0
	N0pL0SQvl2HCD30N3KmofLhNURWqv7LmiaqJh1MBhUqA2loy7LE2MSmUGYzp2fV/
	NhpLGkG5/T5gyshDCSCJKFYKvs5qX3CiZ5JUsMMey69uyTGZ5w9hH+7mVm3+jkTi
	pxi/f2aiwc4/xA/YXHb6t8LWsmAbyjjOHoRdSOQ5gURUKnOqNI8T2wqQhLRtAaMs
	8gAKoJcatMfHsrPgrAf7UaFtz2isz4entdluPuatsA==
X-ME-Sender: <xms:ZEqyZUAe2OOdgoBWqwWwbDLbCattB7yo49fQ2Dw0ZVDDeApP_kPN_w>
    <xme:ZEqyZWh9KNlwaKATGcNl29fVOLJbInmxkc4jh9KXygoPkcn30r3M1f5-pQr0bcu2i
    ByeoZm6AsGVxw>
X-ME-Received: <xmr:ZEqyZXktKZqzu2NrOoHlzPKWhuS2Qdu6CRo4exwrglI3k12i14-aaDqRdhdKt0HPcr_T2lQqC3aTjkLpg-MEmKYsN5pbsVJOJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdelgedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleeh
    ffeikefhledvkeeigeevfeejkeelkeegvddtteetteehleelkeeivdekjeelnecuffhomh
    grihhnpehgihhthhhusgdrtghomhdpphhougdrihhnpdhkvggvphgrtghhrghnghgvlhho
    ghdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ZEqyZax-0sB6W2na-6d2m0iW07fQqilJgMOF5tmLV49_eUeVNCfzTQ>
    <xmx:ZEqyZZQ7QmIXe5biIP8mPUYAcwx_PMkEdzLC3zNSB_LLL4pa3Z66vw>
    <xmx:ZEqyZVbyEB2ihFk5azhDtKJHW-RXY2JsQUU2hGfIeaNcaILTCfE7kA>
    <xmx:ZEqyZXNzTjlCCob-bFDydQSvKcl8lHrGoopLQc9eqi9APkQakJ20Cg>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 25 Jan 2024 12:47:43 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 2/2] tools: don't expose XENFEAT_hvm_pirqs by default
Message-ID: <ZbJKX1P3rsa2XLsG@mail-itl>
References: <20240125093041.33087-1-roger.pau@citrix.com>
 <20240125093041.33087-3-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lGKABZGVWp7Eqo+G"
Content-Disposition: inline
In-Reply-To: <20240125093041.33087-3-roger.pau@citrix.com>


--lGKABZGVWp7Eqo+G
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jan 2024 12:47:43 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 2/2] tools: don't expose XENFEAT_hvm_pirqs by default

On Thu, Jan 25, 2024 at 10:30:41AM +0100, Roger Pau Monne wrote:
> The HVM pirq feature allows routing interrupts from both physical and emu=
lated
> devices over event channels, this was done a performance improvement.  Ho=
wever
> its usage is fully undocumented, and the only reference implementation is=
 in
> Linux.  It defeats the purpose of local APIC hardware virtualization, bec=
ause
> when using it interrupts avoid the usage of the local APIC altogether.
>=20
> It has also been reported to not work properly with certain devices, at l=
east
> when using some AMD GPUs Linux attempts to route interrupts over event
> channels, but Xen doesn't correctly detect such routing, which leads to t=
he
> hypervisor complaining with:
>=20
> (XEN) d15v0: Unsupported MSI delivery mode 7 for Dom15
>=20
> When MSIs are attempted to be routed over event channels the entry delive=
ry
> mode is set to ExtINT, but Xen doesn't detect such routing and attempts to
> inject the interrupt following the native MSI path, and the ExtINT delive=
ry
> mode is not supported.
>=20
> Disable HVM PIRQs by default and provide a per-domain option in xl.cfg to
> enable such feature.  Also for backwards compatibility keep the feature e=
nabled
> for any resumed domains that don't have an explicit selection.
>=20
> Note that the only user of the feature (Linux) is also able to handle nat=
ive
> interrupts fine, as the feature was already not used if Xen reported loca=
l APIC
> hardware virtualization active.
>=20
> Link: https://github.com/QubesOS/qubes-issues/issues/7971
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

For the python part - it's a bit unfortunate there is no knob to control
the value, but in practice I doubt it would be useful (and especially
for python bindings users), so:

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Changes since v2:
>  - Add changelog entry.
>=20
> Changes since v1:
>  - Fix libxl for PV guests.
> ---
>  CHANGELOG.md                      |  2 ++
>  docs/man/xl.cfg.5.pod.in          |  7 +++++++
>  tools/include/libxl.h             |  7 +++++++
>  tools/libs/light/libxl_create.c   |  7 +++++--
>  tools/libs/light/libxl_types.idl  |  1 +
>  tools/libs/light/libxl_x86.c      | 12 +++++++++---
>  tools/python/xen/lowlevel/xc/xc.c |  4 +++-
>  tools/xl/xl_parse.c               |  1 +
>  8 files changed, 35 insertions(+), 6 deletions(-)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 723d06425431..ddb3ab8db4e7 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepach=
angelog.com/en/1.0.0/)
>  ### Changed
>   - Changed flexible array definitions in public I/O interface headers to=
 not
>     use "1" as the number of array elements.
> + - On x86:
> +   - HVM PIRQs are disabled by default.
> =20
>  ### Added
>   - On x86:
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 2e234b450efb..ea8d41727d8e 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -2460,6 +2460,13 @@ The viridian option can be specified as a boolean.=
 A value of true (1)
>  is equivalent to the list [ "defaults" ], and a value of false (0) is
>  equivalent to an empty list.
> =20
> +=3Ditem B<hvm_pirq=3DBOOLEAN>
> +
> +Select whether the guest is allowed to route interrupts from devices (ei=
ther
> +emulated or passed through) over event channels.
> +
> +This option is disabled by default.
> +
>  =3Dback
> =20
>  =3Dhead3 Emulated VGA Graphics Device
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 907aa0a3303a..f1652b1664f0 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -608,6 +608,13 @@
>   * executable in order to not run it as the same user as libxl.
>   */
> =20
> +/*
> + * LIBXL_HAVE_HVM_PIRQ indicates the presence of the u.hvm.pirq filed in
> + * libxl_domain_build_info that signals whether an HVM guest has accesse=
s to
> + * the XENFEAT_hvm_pirqs feature.
> + */
> +#define LIBXL_HAVE_HVM_PIRQ 1
> +
>  /*
>   * libxl memory management
>   *
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_cre=
ate.c
> index ce1d43110336..0008fac607e3 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -376,6 +376,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *gc,
>          libxl_defbool_setdefault(&b_info->u.hvm.usb,                fals=
e);
>          libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         true=
);
>          libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   true=
);
> +        libxl_defbool_setdefault(&b_info->u.hvm.pirq,               fals=
e);
> =20
>          libxl_defbool_setdefault(&b_info->u.hvm.spice.enable, false);
>          if (!libxl_defbool_val(b_info->u.hvm.spice.enable) &&
> @@ -2375,10 +2376,12 @@ int libxl_domain_create_restore(libxl_ctx *ctx, l=
ibxl_domain_config *d_config,
> =20
>      /*
>       * When restoring (either from a save file or for a migration domain=
) set
> -     * the MSR relaxed mode for compatibility with older Xen versions if=
 the
> -     * option is not set as part of the original configuration.
> +     * the MSR relaxed mode and HVM PIRQs for compatibility with older X=
en
> +     * versions if the options are not set as part of the original
> +     * configuration.
>       */
>      libxl_defbool_setdefault(&d_config->b_info.arch_x86.msr_relaxed, tru=
e);
> +    libxl_defbool_setdefault(&d_config->b_info.u.hvm.pirq, true);
> =20
>      return do_domain_create(ctx, d_config, domid, restore_fd, send_back_=
fd,
>                              params, ao_how, aop_console_how);
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index 7d8bd5d21667..899ad3096926 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -692,6 +692,7 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>                                         ("rdm", libxl_rdm_reserve),
>                                         ("rdm_mem_boundary_memkb", MemKB),
>                                         ("mca_caps",         uint64),
> +                                       ("pirq",             libxl_defboo=
l),
>                                         ])),
>                   ("pv", Struct(None, [("kernel", string, {'deprecated_by=
': 'kernel'}),
>                                        ("slack_memkb", MemKB),
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index d16573e72cd4..a50ec37eb3eb 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -9,6 +9,8 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      switch(d_config->c_info.type) {
>      case LIBXL_DOMAIN_TYPE_HVM:
>          config->arch.emulation_flags =3D (XEN_X86_EMU_ALL & ~XEN_X86_EMU=
_VPCI);
> +        if (!libxl_defbool_val(d_config->b_info.u.hvm.pirq))
> +            config->arch.emulation_flags &=3D ~XEN_X86_EMU_USE_PIRQ;
>          break;
>      case LIBXL_DOMAIN_TYPE_PVH:
>          config->arch.emulation_flags =3D XEN_X86_EMU_LAPIC;
> @@ -864,15 +866,19 @@ void libxl__arch_update_domain_config(libxl__gc *gc,
>                                        const libxl_domain_config *src)
>  {
>      /*
> -     * Force MSR relaxed to be set (either to true or false) so it's par=
t of
> -     * the domain configuration when saving or performing a live-migrati=
on.
> +     * Force MSR relaxed and HVM pirq to be set (either to true or false=
) so
> +     * it's part of the domain configuration when saving or performing a
> +     * live-migration.
>       *
> -     * Doing so allows the recovery side to figure out whether the flag =
should
> +     * Doing so allows the recovery side to figure out whether the flags=
 should
>       * be set to true in order to keep backwards compatibility with alre=
ady
>       * started domains.
>       */
>      libxl_defbool_setdefault(&dst->b_info.arch_x86.msr_relaxed,
>                      libxl_defbool_val(src->b_info.arch_x86.msr_relaxed));
> +    if (src->c_info.type =3D=3D LIBXL_DOMAIN_TYPE_HVM )
> +        libxl_defbool_setdefault(&dst->b_info.u.hvm.pirq,
> +                                 libxl_defbool_val(src->b_info.u.hvm.pir=
q));
>  }
> =20
>  /*
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index d3ea350e07b9..9feb12ae2b16 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -159,7 +159,9 @@ static PyObject *pyxc_domain_create(XcObject *self,
> =20
>  #if defined (__i386) || defined(__x86_64__)
>      if ( config.flags & XEN_DOMCTL_CDF_hvm )
> -        config.arch.emulation_flags =3D (XEN_X86_EMU_ALL & ~XEN_X86_EMU_=
VPCI);
> +        config.arch.emulation_flags =3D XEN_X86_EMU_ALL &
> +                                      ~(XEN_X86_EMU_VPCI |
> +                                        XEN_X86_EMU_USE_PIRQ);
>  #elif defined (__arm__) || defined(__aarch64__)
>      config.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>  #else
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index ed983200c3f8..9b358f11b88e 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1801,6 +1801,7 @@ void parse_config_data(const char *config_source,
>          xlu_cfg_get_defbool(config, "hpet", &b_info->u.hvm.hpet, 0);
>          xlu_cfg_get_defbool(config, "vpt_align", &b_info->u.hvm.vpt_alig=
n, 0);
>          xlu_cfg_get_defbool(config, "apic", &b_info->apic, 0);
> +        xlu_cfg_get_defbool(config, "hvm_pirq", &b_info->u.hvm.pirq, 0);
> =20
>          switch (xlu_cfg_get_list(config, "viridian",
>                                   &viridian, &num_viridian, 1))
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--lGKABZGVWp7Eqo+G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmWySl8ACgkQ24/THMrX
1yyCFAgAgGpCrDbCfCCogdFT7JrlnK71yfCddZ5P2A+dFbJhYj8Lmf5YAkTfPSAz
leycGeus/xoQyDNJh4sFPqwQOPzzNa29xC75xGM/NKeh9w3YLe6OWPwxj+7XNO7Q
+WKXcyVBXmnartIUKME9yja2nv5KQN+9DhE+JrB94iiHqydZ+Y09MEbboQIu6Ljb
KZP2inphZxrSx/d0JbvMJ/rGFzvO4ujFCHH9jz7e6uCbxlTxwD0n9oji7G/rLNvc
Q4Rc5n8BMhhK6S9RNL7sZiy79Hupe+xzJW5YbWF0arLHro7McJBJ4uI4riX9rsrY
wvSr54e2AhST4DdAuhACdJAg3kI7/g==
=OYsb
-----END PGP SIGNATURE-----

--lGKABZGVWp7Eqo+G--

