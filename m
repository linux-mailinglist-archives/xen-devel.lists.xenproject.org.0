Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204F2AD4E4B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 10:26:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011344.1389715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPGmD-0000qb-4x; Wed, 11 Jun 2025 08:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011344.1389715; Wed, 11 Jun 2025 08:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPGmD-0000oO-1a; Wed, 11 Jun 2025 08:25:41 +0000
Received: by outflank-mailman (input) for mailman id 1011344;
 Wed, 11 Jun 2025 08:25:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2vy=Y2=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1uPGmB-0000oI-UB
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 08:25:40 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a54ff602-469d-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 10:25:34 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ade76b8356cso390028066b.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 01:25:34 -0700 (PDT)
Received: from smtpclient.apple ([46.149.103.11])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc37faesm845764366b.111.2025.06.11.01.25.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Jun 2025 01:25:33 -0700 (PDT)
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
X-Inumbo-ID: a54ff602-469d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1749630334; x=1750235134; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3YMoULCZrxX5kCQIZXzNE7LlN8oVvvOPg1jTLfDmZc=;
        b=Sq/vbLHc7cgaKdRriA8U3d9PNRdH0tuQ1ZX+6HZxH4njjJIpwALxtU/wteb1zX2B1t
         sKaz8XG/xMjfH0RrqgyyCnNAu9Amg3TI527ZC1BwgiadXcBXmJfdDWnWvxJ1vlu11JQW
         U5i3iEpxAAwUb2WdahOq5azuxtAafVeW6clSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630334; x=1750235134;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3YMoULCZrxX5kCQIZXzNE7LlN8oVvvOPg1jTLfDmZc=;
        b=Ypf3+2kclsApzdj30/rqUuX0PPKvRo5tm7CesDDpUKLX4Y1q9G6nIK6+S91HtNQlSC
         ljYXtpkd+GlAL+8NquFHYeCAgQW3qKoqNdsvG/U5ZyrJ9pTaiMbwamVKbRNd5z3qJCNm
         wMPRmUDhqo1vkNHV9tvJj1ZrDOZsqf/musZh1RLkjADoA60d1wv5sjGwC8Mo6jdu1syM
         8VnxWwmuxNWiRl4wWHp/IUnhJNVbvGS1PKLpRBjawx0sKp6PMwcADq6n0EiIcFeRA7G5
         020Nt1QnDfuy3d0PejOUR/Wpy48004ykoAZ2jQDkFyZrSDEBpv9c4kdSh3YrLFrteAqd
         ll6g==
X-Gm-Message-State: AOJu0YxUHFbnN2UYeu6mJhbwy1frAnr68pXAComeucZpFmLTqu2/lMsX
	sRgrocFb81qLX1i8p8jM3uEIQw5oFujomZ/oIoHOGLckx3iIQqSPzS3I7xv4OWq/RhE=
X-Gm-Gg: ASbGnctTSDlWEBvzFc3rTDD2fwcZZPvHm+NRgOdpuhDnrIw7KESWO1tnIUJ/cd6EMYA
	Pj0sw9Pf8pGwtD6Foj5Op4oLoSebiRUJYwDtbcQpVeD0y4Up+HH/swsy8t6Aa11Ai0SVbfTE93l
	Kp9SO9zjFSL3L8LY2BjfootRd3235x6O3P65YbTspY8ohT2ov8mtfI9AMsD0uUaMgtrkXfCdVqS
	Ih2N9zTpvhCFYHgOncw0ONfb3jM4Ib8yAo3KAE9MeJGT0VTQmNAXCA7CwoBteXdBF6gzO8OwLXz
	DELkvWxyjA5gC6wQr3EawMxJ5iCj6IYeX/Z0Nj5rveKWDUdxf+ABL7JL+hONxy+bkCJLpAjnWaG
	r33Cg2TWFjdQ=
X-Google-Smtp-Source: AGHT+IH0Ef8L8cVSfGB8WXLJXRKNtVMQIh1jU41qsEgfwliE0qBeyJRh0LAdlovZ4gRbEZf1Ce/Nvw==
X-Received: by 2002:a17:907:1b1e:b0:ad2:3d34:e2ad with SMTP id a640c23a62f3a-ade8c76f194mr171177966b.26.1749630333881;
        Wed, 11 Jun 2025 01:25:33 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH 3/4] xen: Add DOMAIN_CAPS_DEVICE_MODEL &
 XEN_DOMCTL_CDF_device_model
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20250610225737.469690-4-jason.andryuk@amd.com>
Date: Wed, 11 Jun 2025 09:25:18 +0100
Cc: xen-devel@lists.xenproject.org,
 Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <FE40ABF6-B05E-44AA-9EBD-2F59304875C1@cloud.com>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
 <20250610225737.469690-4-jason.andryuk@amd.com>
To: Jason Andryuk <jason.andryuk@amd.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)

Acked-by: Christian Lindig <christian.lindig@cloud.com>

> On 10 Jun 2025, at 23:57, Jason Andryuk <jason.andryuk@amd.com> wrote:
>=20
> To add more flexibility in system configuration add the new
> DOMAIN_CAPS_DEVICE_MODEL flag and XEN_DOMCTL_CDF_device_model.
>=20
> Thie new flag corresponds to allowing XSM_DM_PRIV for the domain.  =
This
> will enable running device model emulators (QEMU) from the assigne
> domain for multiple target domains.
>=20
> Stubdoms assign target allowing the stubdom to serve as the device
> model for a single domain.  This new flag allows the single domain to
> provide emulators for multiple guests.
>=20
> The specific scenario is a disaggregated system with the hardware =
domain
> providing device models for muitple guest domains.
>=20
> The OCaml code needs the flag added in as well.
>=20
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> tools/ocaml/libs/xc/xenctrl.ml          |  1 +
> tools/ocaml/libs/xc/xenctrl.mli         |  1 +
> xen/arch/arm/domain.c                   |  3 ++-
> xen/common/device-tree/dom0less-build.c |  3 +++
> xen/common/domain.c                     |  3 ++-
> xen/include/public/bootfdt.h            | 12 ++++++++++--
> xen/include/public/domctl.h             |  4 +++-
> xen/include/xen/sched.h                 |  9 +++++++++
> xen/include/xsm/dummy.h                 |  2 ++
> 9 files changed, 33 insertions(+), 5 deletions(-)
>=20
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml =
b/tools/ocaml/libs/xc/xenctrl.ml
> index 2690f9a923..ef0c5dca2a 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -70,6 +70,7 @@ type domain_create_flag =3D
>   | CDF_IOMMU
>   | CDF_NESTED_VIRT
>   | CDF_VPMU
> +  | CDF_DEVICE_MODEL
>=20
> type domain_create_iommu_opts =3D
>   | IOMMU_NO_SHAREPT
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli =
b/tools/ocaml/libs/xc/xenctrl.mli
> index febbe1f6ae..c0156fa5c6 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -63,6 +63,7 @@ type domain_create_flag =3D
>   | CDF_IOMMU
>   | CDF_NESTED_VIRT
>   | CDF_VPMU
> +  | CDF_DEVICE_MODEL
>=20
> type domain_create_iommu_opts =3D
>   | IOMMU_NO_SHAREPT
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 45aeb8bddc..12fda0762f 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -612,7 +612,8 @@ int arch_sanitise_domain_config(struct =
xen_domctl_createdomain *config)
>     unsigned int max_vcpus;
>     unsigned int flags_required =3D (XEN_DOMCTL_CDF_hvm | =
XEN_DOMCTL_CDF_hap);
>     unsigned int flags_optional =3D (XEN_DOMCTL_CDF_iommu | =
XEN_DOMCTL_CDF_vpmu |
> -                                   XEN_DOMCTL_CDF_xs_domain );
> +                                   XEN_DOMCTL_CDF_xs_domain |
> +                                   XEN_DOMCTL_CDF_device_model);
>     unsigned int sve_vl_bits =3D sve_decode_vl(config->arch.sve_vl);
>=20
>     if ( (config->flags & ~flags_optional) !=3D flags_required )
> diff --git a/xen/common/device-tree/dom0less-build.c =
b/xen/common/device-tree/dom0less-build.c
> index 3d503c6973..993ff32f5e 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -884,6 +884,9 @@ void __init create_domUs(void)
>                 d_cfg.flags |=3D XEN_DOMCTL_CDF_xs_domain;
>                 d_cfg.max_evtchn_port =3D -1;
>             }
> +
> +            if ( val & DOMAIN_CAPS_DEVICE_MODEL )
> +                d_cfg.flags |=3D XEN_DOMCTL_CDF_device_model;
>         }
>=20
>         if ( dt_find_property(node, "xen,static-mem", NULL) )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 153cd75340..ab2c8f864d 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -721,7 +721,8 @@ static int sanitise_domain_config(struct =
xen_domctl_createdomain *config)
>          ~(XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap |
>            XEN_DOMCTL_CDF_s3_integrity | XEN_DOMCTL_CDF_oos_off |
>            XEN_DOMCTL_CDF_xs_domain | XEN_DOMCTL_CDF_iommu |
> -           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu) )
> +           XEN_DOMCTL_CDF_nested_virt | XEN_DOMCTL_CDF_vpmu |
> +           XEN_DOMCTL_CDF_device_model) )
>     {
>         dprintk(XENLOG_INFO, "Unknown CDF flags %#x\n", =
config->flags);
>         return -EINVAL;
> diff --git a/xen/include/public/bootfdt.h =
b/xen/include/public/bootfdt.h
> index 86c46b42a9..c6b5afc76a 100644
> --- a/xen/include/public/bootfdt.h
> +++ b/xen/include/public/bootfdt.h
> @@ -25,7 +25,15 @@
> #define DOMAIN_CAPS_HARDWARE (1U << 1)
> /* Xenstore domain. */
> #define DOMAIN_CAPS_XENSTORE (1U << 2)
> -#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL | =
DOMAIN_CAPS_HARDWARE | \
> -                              DOMAIN_CAPS_XENSTORE)
> +/*
> + * Device model capability allows the use of the dm_op hypercalls to =
provide
> + * the device model emulation (run QEMU) for other domains.  This is =
a
> + * subset of the Control capability which can be granted to the
> + * Hardware domain for running QEMU.
> + */
> +#define DOMAIN_CAPS_DEVICE_MODEL (1U << 3)
> +
> +#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL  | =
DOMAIN_CAPS_HARDWARE | \
> +                              DOMAIN_CAPS_XENSTORE | =
DOMAIN_CAPS_DEVICE_MODEL )
>=20
> #endif /* __XEN_PUBLIC_BOOTFDT_H__ */
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 5b2063eed9..2280489be2 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -66,9 +66,11 @@ struct xen_domctl_createdomain {
> #define XEN_DOMCTL_CDF_nested_virt    (1U << =
_XEN_DOMCTL_CDF_nested_virt)
> /* Should we expose the vPMU to the guest? */
> #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
> +/* Allow domain to provide device model for multiple other domains */
> +#define XEN_DOMCTL_CDF_device_model   (1U << 8)
>=20
> /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_vpmu
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_device_model
>=20
>     uint32_t flags;
>=20
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index fe53d4fab7..9863603d93 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1148,6 +1148,15 @@ static always_inline bool =
is_control_domain(const struct domain *d)
>     return evaluate_nospec(d->is_privileged);
> }
>=20
> +/* This check is for functionality specific to a device model domain =
*/
> +static always_inline bool is_dm_domain(const struct domain *d)
> +{
> +    if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
> +        return false;
> +
> +    return evaluate_nospec(d->options & XEN_DOMCTL_CDF_device_model);
> +}
> +
> #define VM_ASSIST(d, t) (test_bit(VMASST_TYPE_ ## t, &(d)->vm_assist))
>=20
> static always_inline bool is_pv_domain(const struct domain *d)
> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> index d8df3f66c4..477fadaefd 100644
> --- a/xen/include/xsm/dummy.h
> +++ b/xen/include/xsm/dummy.h
> @@ -91,6 +91,8 @@ static always_inline int xsm_default_action(
>             return 0;
>         fallthrough;
>     case XSM_DM_PRIV:
> +        if ( is_dm_domain(src) )
> +            return 0;
>         if ( target && evaluate_nospec(src->target =3D=3D target) )
>             return 0;
>         fallthrough;
> --=20
> 2.49.0
>=20


