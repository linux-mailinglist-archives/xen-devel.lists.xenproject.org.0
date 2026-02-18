Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOibGZoolmnxbQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 22:01:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D23C6159B80
	for <lists+xen-devel@lfdr.de>; Wed, 18 Feb 2026 22:01:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1235983.1538795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsofP-00049d-K0; Wed, 18 Feb 2026 21:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235983.1538795; Wed, 18 Feb 2026 21:01:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsofP-00046L-GM; Wed, 18 Feb 2026 21:01:03 +0000
Received: by outflank-mailman (input) for mailman id 1235983;
 Wed, 18 Feb 2026 21:01:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CABg=AW=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vsofN-00046A-In
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 21:01:01 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed66425d-0d0c-11f1-b164-2bf370ae4941;
 Wed, 18 Feb 2026 22:00:59 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-59de0b7c28aso360128e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Feb 2026 13:00:59 -0800 (PST)
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
X-Inumbo-ID: ed66425d-0d0c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1771448459; cv=none;
        d=google.com; s=arc-20240605;
        b=GtkvKriRVl6HTbpVD/E7I/1sseHB4fdtwyagtvPDR6BYLdlshrg4yLfjXzNJ2OKbgo
         gUUp+k21mK0qz9Z5e4gVkvt0PLNFn113Riruu8OTGEXhx5pptAzmFx2Co2LlIrJ6kbKp
         QdlpKKiIJWKQJrZGHqg+OalExK4G43aajmMQCBmwlRxpvSawPWVN2fHGEy3MmKNCmnxO
         TGeKLZ9izxN64tD4DgAw1wGzvqhowIPXGqnM26DRvIUHe9jIERTYa8MxmNr9LLRIeeYP
         QhXlIUilK6hplKBroo3wNpJ+QUAwZp4PUFtGjYa2E+nOrD7/rtyp5rBqEn+zPpn4c1ta
         VsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DTZ6u5gGdRwr4VTl6AL1sSb/XPuOQB72LCs3Lhy/UsU=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=Za0SEojcENRRwvw6ZGBs//onSH7Zl1S0tXn0Od6sQEYQ9aGGmn1+Sr9waxc9VZnLih
         OpUECsNZ0BfKgFp5kXoOu4+xUHNsHkCNoC9gXIBWQ7mdRpjBH4Y4MCa2OBsf7O4+DlfL
         9QbqnXj1JYtbItTkc/hgDvxkLtgMlriCvNntdw4uoQ/oneoZ2E9tGdw5UN7oG2im9U8x
         KdqYYo12Q3jooIbV5VfJyb/xSwmGESW8pJddOHRSo/PexWYElLDWgDDBHNCUjllGIZ1j
         qszhyUDeJIbHvvDyjw5Lc57L68YTPXNnWT1zVcErKqmDaBlIH86IgDt5UNtQByj/Kga4
         5y6w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771448459; x=1772053259; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTZ6u5gGdRwr4VTl6AL1sSb/XPuOQB72LCs3Lhy/UsU=;
        b=dUFIh+umyV/v7Kynl95e+/oKhsMw4efL3SWuaAK59oUN7XcrqwDgMLzTIHbVa+8+KA
         7L7r3WSSB1BM4jYmdkf2GLLiYexvE2KsuyKA+WT5/ELU0GJvBECogzvVkJfMEZZnQUj1
         Od6hKLtEgRbHWHjX3iwqaRFfjRAZTgVNV632KjY0/6u/oUg9jDZV6hPfMY4W92dWf/dL
         ePucUhSLUJAIiDVwTHv+67FvGK4Q60isCZLHKZ5dhpUgqmeVshTsYc1HjDEFLZcMkcN/
         hkA6nE4kPWiknntrbSDbInMd5d6w39UmhrwRFmr9pe+9dYyo9LQ6RI3rwcySpw5aAt2g
         Z/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448459; x=1772053259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DTZ6u5gGdRwr4VTl6AL1sSb/XPuOQB72LCs3Lhy/UsU=;
        b=FoRdW3RuhoSdnHsIpuSpfuDC2Tp+9yPOuMXdreh5yKSUr1IhBXH1gHfAEButikzR2u
         /SHcovXyWM2ZxHSI+9GDwN3+ZCse7HCL+pWa8a9thAA+dM1K+VynbRgxBs1BH3Q9BpND
         nU+eBd/6XgmQYWpEhyMlmht7jAt4D3BAM/aBpUkV0j5wekhFdSiGt9NgLQ620cW4UOtC
         B0zx90TXDoVcRTJw9/ham/LDXCN0tW76+A9XdQTuk22YlYWc/QQHLiQD3uKXKhH71Zg+
         IbWHV7anECztzFrD2f0YANy+TfjOMA188NWq+/HE6zIZGzjl/Tyk3wphLvn1R0wVz2aE
         us5g==
X-Gm-Message-State: AOJu0YxnAtUd4oD5xyfIfWRtSwoLaAQWXSgvEW9ziQ1dKPxa9ANJrg/6
	zjQ0bQPnRTfq0iXY3btnF5xRq+gzLr582oCZW5pZC+u2VpRuwpFhBg8mtrkP1fi8dCiqkzrcXxQ
	9cZA4+osQnyMXMmAWq0ZewKVY44yzvhE=
X-Gm-Gg: AZuq6aJF030UpD/plpJE0fBgeOrn+4YeOgm1AbhYHYi2ypEEFGlw1AcrbdQpsTPOiD/
	PjHUeV6BNH79qGFeWlVzVgLnGr2YvmxL2HVMFdXKnstUhu/NhULo+Q+VF3bbeSbTX26ruBkN4GE
	KLTXrfRkRRvsqEbV7rQ9L077JtNSp5vFEz+3RQ1TvS3HZOxlZcymepU1MqwF0FcPX9quBnwpgBe
	pYPOaMDuNeZkdUY9KSFHbjvCjJ8tCxzge5Eqwha1oedHqwrbn0B6ZikhrWPB0hdVF0OZZXTzHrP
	EbybMA==
X-Received: by 2002:a05:6512:4007:b0:59e:6269:69ce with SMTP id
 2adb3069b0e04-59f83bbc5a6mr1176368e87.30.1771448459221; Wed, 18 Feb 2026
 13:00:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <61859ae57032ad2da9c0eec5fb30dbe4ecc8c0df.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <61859ae57032ad2da9c0eec5fb30dbe4ecc8c0df.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 18 Feb 2026 23:00:00 +0200
X-Gm-Features: AaiRm53n3EmBwUxALY7GPhvWahItL8c0jiQeFPwEZyPGTixMCakiKxxJgn4efF0
Message-ID: <CAGeoDV-A+0a4vqXCcY1FsL-z9SLiJoTiSiDaGiALS3kwztyQsQ@mail.gmail.com>
Subject: Re: [RFC PATCH 15/19] arm: Add gicv4 to domain creation
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D23C6159B80
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> Allow creating domains with GIC_V4 version.

I am not convinced we should extend the public domctl ABI with
XEN_DOMCTL_CONFIG_GIC_V4/V4_1.

The GIC spec treats v4 as an extension of v3:

  Because GICv4 is an extension of GICv3, all references to GICv3
  in this manual apply equally to GICv4, unless explicitly indicated
  otherwise. Any changes for GICv4.1 are indicated accordingly.

From a guest ABI perspective, a v4-capable system is still a GICv3
programmer's model, with additional optional features (e.g. vLPI/
vPE/ITS commands). Those features should be enabled/queried via the
relevant capability bits, not by inventing new "GIC version" domctl
values.

So I'd prefer:
* keep gic_hw_version accurate internally (v3/v4/v4.1 as needed),
  but
* for domctl configuration, treat v4.x as XEN_DOMCTL_CONFIG_GIC_V3,
  and keep dom0less DT generation using the gicv3 node.

This avoids growing the public ABI and toolstack churn for something
that is effectively a v3 + extensions model.


Best regards,
Mykola


>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/dom0less-build.c |  1 +
>  xen/arch/arm/domain.c         | 16 ++++++++++++++++
>  xen/arch/arm/vgic.c           |  2 ++
>  xen/include/public/arch-arm.h |  2 ++
>  4 files changed, 21 insertions(+)
>
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.=
c
> index 4181c10538..3c4b074b05 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -157,6 +157,7 @@ int __init make_intc_domU_node(struct kernel_info *ki=
nfo)
>      {
>  #ifdef CONFIG_GICV3
>      case GIC_V3:
> +    case GIC_V4:
>          return make_gicv3_domU_node(kinfo);
>  #endif
>  #ifdef CONFIG_VGICV2
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 507df807ed..864e5511c9 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -604,6 +604,14 @@ int arch_sanitise_domain_config(struct xen_domctl_cr=
eatedomain *config)
>              config->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_V3;
>              break;
>
> +        case GIC_V4:
> +            config->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_V4;
> +            break;
> +
> +        case GIC_V4_1:
> +            config->arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_V4_1;
> +            break;
> +
>          default:
>              ASSERT_UNREACHABLE();
>              return -EINVAL;
> @@ -679,6 +687,14 @@ int arch_domain_create(struct domain *d,
>          d->arch.vgic.version =3D GIC_V3;
>          break;
>
> +    case XEN_DOMCTL_CONFIG_GIC_V4:
> +        d->arch.vgic.version =3D GIC_V4;
> +        break;
> +
> +    case XEN_DOMCTL_CONFIG_GIC_V4_1:
> +        d->arch.vgic.version =3D GIC_V4_1;
> +        break;
> +
>      default:
>          BUG();
>      }
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 6baf870ad5..e5752faeb7 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -153,6 +153,7 @@ int domain_vgic_register(struct domain *d, unsigned i=
nt *mmio_count)
>      {
>  #ifdef CONFIG_GICV3
>      case GIC_V3:
> +    case GIC_V4:
>          if ( vgic_v3_init(d, mmio_count) )
>             return -ENODEV;
>          break;
> @@ -929,6 +930,7 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_=
version)
>
>  #ifdef CONFIG_GICV3
>      case XEN_DOMCTL_CONFIG_GIC_V3:
> +    case XEN_DOMCTL_CONFIG_GIC_V4:
>          return 4096;
>  #endif
>
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
> index 96365e5603..12690cf3ac 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -322,6 +322,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  #define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
>  #define XEN_DOMCTL_CONFIG_GIC_V2        1
>  #define XEN_DOMCTL_CONFIG_GIC_V3        2
> +#define XEN_DOMCTL_CONFIG_GIC_V4        3
> +#define XEN_DOMCTL_CONFIG_GIC_V4_1      4
>
>  #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>  #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
> --
> 2.51.2

