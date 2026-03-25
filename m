Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPKtK0UvxGkAxQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 19:53:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE432AD2F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 19:53:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262950.1555224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5TLc-00022u-No; Wed, 25 Mar 2026 18:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262950.1555224; Wed, 25 Mar 2026 18:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5TLc-00021O-L9; Wed, 25 Mar 2026 18:52:56 +0000
Received: by outflank-mailman (input) for mailman id 1262950;
 Wed, 25 Mar 2026 18:52:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b6f6=B2=ubuntu.com=enr0n@fe-bounces.ubuntu.com>)
 id 1w5TLa-00021I-0I
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 18:52:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5TLX-00Dk8Z-MX
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 19:52:53 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <SRS0=b6f6=B2=ubuntu.com=enr0n@fe-bounces.ubuntu.com>)
 id 69c42eed-bab6-0a2a0a5309dd-0a2a4501e2ee-26
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 19:52:53 +0100
Received: from [149.28.215.223] (helo=smtp.forwardemail.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <SRS0=b6f6=B2=ubuntu.com=enr0n@fe-bounces.ubuntu.com>)
 id 69c42f03-6400-0a2a45010019-951cd7df6139-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 19:52:52 +0100
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-94de7380eeeso289315241.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 11:52:45 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fe-953a8a3ca9 header.d=ubuntu.com header.i="@ubuntu.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: Content-Type: Cc: To: Subject: Message-ID:
 Date: From: In-Reply-To: References: MIME-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1774464770;
 bh=nBHC2L9kQozGOnVl8ryO7ws91nevlMJi3dCrj7mCwow=;
 b=aLPiAkEpJ81IOmgWxi42I/wnYNs6mZR9Gsuy42pNwFq/PScc2S/2kNYAiFkV6t940iTT6IvIg
 Cw/zHzk6Eoz7+FCDHhVxcXUTaNe0q/uEin4KzEvgr78pmixEtia1j+FElCD6qnzNzHIVKN7Y/Q7
 W62HxzIpo/5XbTn211TjqAMfOT60qW4SQKvV7TLjpAFHQm6BNaTCayh8Wqc28iK98VlBFgcVPNN
 9eXRMFn8Ue9uL1RQ4F5XmUvL3dFL6Sy2xKETK3Dgyy6uph6AxKA2W59TQNxTRYzMAEOa1/aAbQD
 Z0fzs6gdpENHNd4wzbFKkibJ6FKOpCIb0CxHOUtdmp3g==
X-Forward-Email-ID: 69c42efe07e0c3ba78d7a45e
X-Forward-Email-Sender: rfc822; enr0n@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.55
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Gm-Message-State: AOJu0Ywk8+BECjM9sgNfOf2Bymj/yK2+5sKZGW7zQMxO01nJ3Ecfyhkx
	ptAv97GiCVDfxUYhYYWVCMofthMei0eT5cmWO5qyO5DheJhi//ovOZl7pTOrWaG4f0fN+a1E69V
	5qX5bSUO5lFhd0YvgaRgli1j7L/x1zqUq7DU3QvKHY9LxI9sOgkZHCl99BLf+1WxVUVPepwxfAE
	rlXq2vhBAbiQFZFJp2AUQpkGuV49hvW/6Fx0VHTCHZeHvhDQRrWQOXdjzp3ro=
X-Gm-Gg: ATEYQzw9KEc5LrWMQOnoVGimF9zSC+hWM6P1V2MMQHa6gwNUL3EEV6QoH++5JFjyj5r
	zeg8URK69FyLOXkXiFL0lF/JibE62A6DkidU5DXX8XZUyskj2p1FS3uICRvGMcc3bjrpj2s1iPN
	vM5S6LRhQ/1O3RuoN7gLpsymxyjnaC+GunBAgLuVtx6bapdgyship4jNUjNdhq9IftatTRJsQmE
	GWP
X-Received: by 2002:a05:6102:6c4:b0:5ff:ed38:1889 with SMTP id ada2fe7eead31-60386ebc6c1mr2610995137.10.1774464764823;
        Wed, 25 Mar 2026 11:52:44 -0700 (PDT)
X-Received: by 2002:a05:6102:6c4:b0:5ff:ed38:1889 with SMTP id
 ada2fe7eead31-60386ebc6c1mr2610987137.10.1774464764544; Wed, 25 Mar 2026
 11:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774305918.git.milan_djokic@epam.com> <f04d9186eb3b83a4f5fb27db412bf10fb6fb092c.1774305918.git.milan_djokic@epam.com>
In-Reply-To: <f04d9186eb3b83a4f5fb27db412bf10fb6fb092c.1774305918.git.milan_djokic@epam.com>
From: Nick Rosbrook <enr0n@ubuntu.com>
Date: Wed, 25 Mar 2026 14:52:33 -0400
X-Gmail-Original-Message-ID: <CAEN5XSFA4AdFKXGiyYW58=Ltm+uVRrsSxGrNCC3T8UdHtivcnA@mail.gmail.com>
X-Gm-Features: AQROBzBNzU0BIDGovNQeyVE3tkTBqY0sSAyphFru-oY3R4n_dgn-5eJ_tDiKJzI
Message-ID: <CAEN5XSFA4AdFKXGiyYW58=Ltm+uVRrsSxGrNCC3T8UdHtivcnA@mail.gmail.com>
Subject: Re: [PATCH v2 06/23] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
To: Milan Djokic <milan_djokic@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul Singh <rahul.singh@arm.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, George Dunlap <gwd@xenproject.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1774464772-228E5DF3-8681F2F4/0/0
X-purgate-type: clean
X-purgate-size: 6485
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ubuntu.com,none];
	R_DKIM_ALLOW(-0.20)[ubuntu.com:s=fe-953a8a3ca9];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[enr0n@ubuntu.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:anthony.perard@vates.tech,m:gwd@xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[enr0n@ubuntu.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 16AE432AD2F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 6:51=E2=80=AFPM Milan Djokic <milan_djokic@epam.com=
> wrote:
>
> From: Rahul Singh <rahul.singh@arm.com>
>
> Add new viommu_type field and field values XEN_DOMCTL_CONFIG_VIOMMU_NONE
> XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3 in xen_arch_domainconfig to
> enable/disable vIOMMU support for domains.
>
> Also add viommu=3D"N" parameter to xl domain configuration to enable the
> vIOMMU for the domains. Currently, only the "smmuv3" type is supported
> for ARM.
>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>  docs/man/xl.cfg.5.pod.in             | 13 +++++++++++++
>  tools/golang/xenlight/helpers.gen.go |  2 ++
>  tools/golang/xenlight/types.gen.go   |  1 +
>  tools/include/libxl.h                |  5 +++++
>  tools/libs/light/libxl_arm.c         | 13 +++++++++++++
>  tools/libs/light/libxl_types.idl     |  6 ++++++
>  tools/xl/xl_parse.c                  |  9 +++++++++
>  7 files changed, 49 insertions(+)
>
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 27c455210b..f69cdee55c 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -3162,6 +3162,19 @@ option.
>
>  =3Dback
>
> +=3Dover 4
> +
> +=3Ditem B<viommu=3D"N">
> +
> +To enable viommu, user must specify the following option in the VM
> +config file:
> +
> +viommu =3D "smmuv3"
> +
> +Currently, only the "smmuv3" type is supported for ARM.
> +
> +=3Dback
> +
>  =3Dhead3 x86
>
>  =3Dover 4
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight=
/helpers.gen.go
> index 8909fe8a1b..4f0997f02f 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1195,6 +1195,7 @@ x.ArchArm.NrSpis =3D uint32(xc.arch_arm.nr_spis)
>  if err :=3D x.ArchArm.ArmSci.fromC(&xc.arch_arm.arm_sci);err !=3D nil {
>  return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
>  }
> +x.ArchArm.Viommu =3D ViommuType(xc.arch_arm.viommu)
>  if err :=3D x.ArchX86.MsrRelaxed.fromC(&xc.arch_x86.msr_relaxed);err !=
=3D nil {
>  return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>  }
> @@ -1734,6 +1735,7 @@ xc.arch_arm.nr_spis =3D C.uint32_t(x.ArchArm.NrSpis=
)
>  if err :=3D x.ArchArm.ArmSci.toC(&xc.arch_arm.arm_sci); err !=3D nil {
>  return fmt.Errorf("converting field ArchArm.ArmSci: %v", err)
>  }
> +xc.arch_arm.viommu =3D C.libxl_viommu_type(x.ArchArm.Viommu)
>  if err :=3D x.ArchX86.MsrRelaxed.toC(&xc.arch_x86.msr_relaxed); err !=3D=
 nil {
>  return fmt.Errorf("converting field ArchX86.MsrRelaxed: %v", err)
>  }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/t=
ypes.gen.go
> index ab9d4ca7b4..8a37b52a82 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -610,6 +610,7 @@ Vuart VuartType
>  SveVl SveType
>  NrSpis uint32
>  ArmSci ArmSci
> +Viommu ViommuType
>  }
>  ArchX86 struct {
>  MsrRelaxed Defbool

The generated go code doesn't look right - it appears to be missing a
definition for `ViommuType` and the associated constants for the
"viommu_type" Enumeration added to libxl_types.idl. Does the code need
re-generating?

> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index bc35e412da..f7d5c77e23 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -318,6 +318,11 @@
>   */
>  #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_SCI 1
>
> +/*
> + * libxl_domain_build_info has the arch_arm.viommu_type field.
> + */
> +#define LIBXL_HAVE_BUILDINFO_ARM_VIOMMU 1
> +
>  /*
>   * LIBXL_HAVE_SOFT_RESET indicates that libxl supports performing
>   * 'soft reset' for domains and there is 'soft_reset' shutdown reason
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 7e9f8a1bc3..a248793588 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -247,6 +247,19 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>      }
>      LOG(DEBUG, " - SCI type=3D%u", config->arch.arm_sci_type);
>
> +    switch (d_config->b_info.arch_arm.viommu_type) {
> +    case LIBXL_VIOMMU_TYPE_NONE:
> +        config->arch.viommu_type =3D XEN_DOMCTL_CONFIG_VIOMMU_NONE;
> +        break;
> +    case LIBXL_VIOMMU_TYPE_SMMUV3:
> +        config->arch.viommu_type =3D XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3;
> +        break;
> +    default:
> +        LOG(ERROR, "Unknown vIOMMU type %d",
> +            d_config->b_info.arch_arm.viommu_type);
> +        return ERROR_FAIL;
> +    }
> +
>      return 0;
>  }
>
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index d64a573ff3..c7ad0e77b2 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -561,6 +561,11 @@ libxl_arm_sci =3D Struct("arm_sci", [
>      ("type", libxl_arm_sci_type),
>      ])
>
> +libxl_viommu_type =3D Enumeration("viommu_type", [
> +    (0, "none"),
> +    (1, "smmuv3")
> +    ], init_val =3D "LIBXL_VIOMMU_TYPE_NONE")
> +
>  libxl_rdm_reserve =3D Struct("rdm_reserve", [
>      ("strategy",    libxl_rdm_reserve_strategy),
>      ("policy",      libxl_rdm_reserve_policy),
> @@ -736,6 +741,7 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>                                 ("sve_vl", libxl_sve_type),
>                                 ("nr_spis", uint32, {'init_val': 'LIBXL_N=
R_SPIS_DEFAULT'}),
>                                 ("arm_sci", libxl_arm_sci),
> +                               ("viommu_type", libxl_viommu_type),
>                                ])),
>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>                                ])),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 1a2ea8b5d5..dcae8314fe 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -3033,6 +3033,15 @@ skip_usbdev:
>          }
>      }
>
> +    if (!xlu_cfg_get_string (config, "viommu", &buf, 1)) {
> +        e =3D libxl_viommu_type_from_string(buf, &b_info->arch_arm.viomm=
u_type);
> +        if (e) {
> +            fprintf(stderr,
> +                    "Unknown vIOMMU type \"%s\" specified\n", buf);
> +            exit(-ERROR_FAIL);
> +        }
> +    }
> +
>      parse_vkb_list(config, d_config);
>
>      d_config->virtios =3D NULL;
> --
> 2.43.0

-Nick

