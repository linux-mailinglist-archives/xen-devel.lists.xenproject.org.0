Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C91C742C1BD
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 15:50:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208500.364647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maeeZ-0000l4-VR; Wed, 13 Oct 2021 13:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208500.364647; Wed, 13 Oct 2021 13:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maeeZ-0000jD-S5; Wed, 13 Oct 2021 13:50:43 +0000
Received: by outflank-mailman (input) for mailman id 208500;
 Wed, 13 Oct 2021 13:50:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dUCo=PB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maeeX-0000j5-Vu
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 13:50:42 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 526e0d2f-3966-48be-9db4-b072b00475ea;
 Wed, 13 Oct 2021 13:50:40 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id z11so11869402lfj.4
 for <xen-devel@lists.xenproject.org>; Wed, 13 Oct 2021 06:50:40 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p9sm1335732lfe.3.2021.10.13.06.50.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 06:50:29 -0700 (PDT)
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
X-Inumbo-ID: 526e0d2f-3966-48be-9db4-b072b00475ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=NSV/K9ePwjVIZfFs78yQ3l0wA286NpS0XFWxQbT0C4E=;
        b=Skrfz1Q1YGyYdb3znOEMI0EbnlOH00fXYJ5Fle3seXfn/GVjkCJCrythYp/wHq2ybH
         4VbQ3oj5VZl/AqRBSGcCYs9ONor3ssR5dnuCZ4bVzMwM2hlFX8VfIWfyuf5XPVOe01R6
         jbQWzR0osgOxUCHH33re0MG/YtQpCX59+mg7/UGnZ1SGVZvdQlH1QL3DjLI8MMZMqEcN
         djygrgcrScZjYj5kcgxG/IQA/PK7LVfkidUjtAfti6WeHf9BmvY2r3rWapbvPF1xyc2T
         0PFTUJ9tLR0II2pIUT7Nh2V7SGxNEECBnONqjFf3k0xRTCBnfSPTSePTnK/WKbmtsM5u
         hVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=NSV/K9ePwjVIZfFs78yQ3l0wA286NpS0XFWxQbT0C4E=;
        b=cYtBygB6zRponP4rmfVhjeSZVwf82q17P6wggxS4Y5VAYgr4Bt+yhZyLHlBfF7bzEO
         XJbxvdE6x/cDST2I/b4gKvfPNAbEJksCtyciUxt5nQwOdaNo9LlaS1tBefehrAucEJhq
         QclF0URBJ8nOk6/GWg+2XkvZ/uERg1t0nV/ut335T2JHIbZVfpxIVSbsByUKFF1ad29u
         Rm4dldLE9CR1Gl3fNw76mrdcctMTW9VyVzj7ytdoWGd7RzGn04GjWgZqUVFb18nKvWEg
         Oc8tOSNi8VxpgE8Q5FCpvsg7il41T4AiIh0TAB33DvCvOlaWtOQVzzC65qVLgHGhdDJk
         vbjg==
X-Gm-Message-State: AOAM533NlZuJITXwog/ntmqqdEW45wfEYQm1WAvP6C0Ajd4Zhu0nyryA
	xZJtxBhuZlShnsdikIIVOjU=
X-Google-Smtp-Source: ABdhPJwBlfPA5wjugLKdl9W8pjFeJrLXeWdjjnx/Jc1/LmH++1zYWA1p+gsByZvoqFbM7t3svANU4g==
X-Received: by 2002:ac2:5edd:: with SMTP id d29mr3776403lfq.511.1634133030232;
        Wed, 13 Oct 2021 06:50:30 -0700 (PDT)
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
From: Oleksandr <olekstysh@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9e6e1378-7ee3-b692-b57d-29b597160661@gmail.com>
 <1634073720-27901-1-git-send-email-olekstysh@gmail.com>
Message-ID: <7ec7e2c5-3b45-c6f5-fabd-0b399cc1229f@gmail.com>
Date: Wed, 13 Oct 2021 16:50:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1634073720-27901-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hi Jan.


May I please ask, are you OK with the proposed changes?


On 13.10.21 00:22, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> We need to pass info about maximum supported guest physical
> address space size to the toolstack on Arm in order to properly
> calculate the base and size of the extended region (safe range)
> for the guest. The extended region is unused address space which
> could be safely used by domain for foreign/grant mappings on Arm.
> The extended region itself will be handled by the subsequent
> patch.
>
> Currently the same guest physical address space size is used
> for all guests (p2m_ipa_bits variable on Arm, the x86 equivalent
> is hap_paddr_bits).
>
> Add an explicit padding after "gpaddr_bits" field and also
> (while at it) after "domain" field.
>
> Also make sure that full structure is cleared in all cases by
> moving the clearing into getdomaininfo(). Currently it is only
> cleared by the sysctl caller (and only once).
>
> Please note, we do not need to bump XEN_DOMCTL_INTERFACE_VERSION
> as a bump has already occurred in this release cycle. But we do
> need to bump XEN_SYSCTL_INTERFACE_VERSION as the structure is
> re-used in a sysctl.
>
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Ian Jackson <iwj@xenproject.org>
> ---
> Changes RFC -> V2:
>     - update patch subject/description
>     - replace arch-specific sub-struct with common gpaddr_bits
>       field and update code to reflect that
>
> Changes V2 -> V3:
>     - make the field uint8_t and add uint8_t pad[7] after
>     - remove leading blanks in libxl.h
>
> Changes V3 -> V4:
>     - also print gpaddr_bits from output_physinfo()
>     - add Michal's R-b
>
> Changes V4 -> V5:
>     - update patch subject and description
>     - drop Michal's R-b
>     - pass gpaddr_bits via createdomain domctl
>       (struct xen_arch_domainconfig)
>
> Changes V5 -> V6:
>     - update patch subject and description
>     - pass gpaddr_bits via getdomaininfo domctl
>       (struct xen_domctl_getdomaininfo)
>
> Changes V6 -> V7:
>     - update patch description
>     - do not bump XEN_DOMCTL_INTERFACE_VERSION
>     - bump XEN_SYSCTL_INTERFACE_VERSION
>     - add explicit paddings
>     - clear the full structure in getdomaininfo()
>     - add Ian's R-b
> ---
>   tools/include/libxl.h            | 8 ++++++++
>   tools/include/xenctrl.h          | 1 +
>   tools/libs/ctrl/xc_domain.c      | 1 +
>   tools/libs/light/libxl_domain.c  | 1 +
>   tools/libs/light/libxl_types.idl | 1 +
>   xen/arch/arm/domctl.c            | 2 ++
>   xen/arch/x86/domctl.c            | 1 +
>   xen/common/domctl.c              | 6 +++---
>   xen/common/sysctl.c              | 2 +-
>   xen/include/public/domctl.h      | 3 +++
>   xen/include/public/sysctl.h      | 2 +-
>   11 files changed, 23 insertions(+), 5 deletions(-)
>
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index b9ba16d..deb5022 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -874,6 +874,14 @@ typedef struct libxl__ctx libxl_ctx;
>   #define LIBXL_HAVE_DOMINFO_NEVER_STOP 1
>   
>   /*
> + * LIBXL_HAVE_DOMINFO_GPADDR_BITS
> + *
> + * If this is defined, libxl_dominfo will contain an uint8 field called
> + * gpaddr_bits, containing the guest physical address space size.
> + */
> +#define LIBXL_HAVE_DOMINFO_GPADDR_BITS 1
> +
> +/*
>    * LIBXL_HAVE_QXL
>    *
>    * If defined, then the libxl_vga_interface_type will contain another value:
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index a306399..07b96e6 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -462,6 +462,7 @@ typedef struct xc_dominfo {
>       unsigned int  max_vcpu_id;
>       xen_domain_handle_t handle;
>       unsigned int  cpupool;
> +    uint8_t       gpaddr_bits;
>       struct xen_arch_domainconfig arch_config;
>   } xc_dominfo_t;
>   
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index 23322b7..b155d6a 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -396,6 +396,7 @@ int xc_domain_getinfo(xc_interface *xch,
>           info->nr_online_vcpus = domctl.u.getdomaininfo.nr_online_vcpus;
>           info->max_vcpu_id = domctl.u.getdomaininfo.max_vcpu_id;
>           info->cpupool = domctl.u.getdomaininfo.cpupool;
> +        info->gpaddr_bits = domctl.u.getdomaininfo.gpaddr_bits;
>           info->arch_config = domctl.u.getdomaininfo.arch_config;
>   
>           memcpy(info->handle, domctl.u.getdomaininfo.handle,
> diff --git a/tools/libs/light/libxl_domain.c b/tools/libs/light/libxl_domain.c
> index 51a6127..544a9bf 100644
> --- a/tools/libs/light/libxl_domain.c
> +++ b/tools/libs/light/libxl_domain.c
> @@ -306,6 +306,7 @@ void libxl__xcinfo2xlinfo(libxl_ctx *ctx,
>       xlinfo->vcpu_max_id = xcinfo->max_vcpu_id;
>       xlinfo->vcpu_online = xcinfo->nr_online_vcpus;
>       xlinfo->cpupool = xcinfo->cpupool;
> +    xlinfo->gpaddr_bits = xcinfo->gpaddr_bits;
>       xlinfo->domain_type = (xcinfo->flags & XEN_DOMINF_hvm_guest) ?
>           LIBXL_DOMAIN_TYPE_HVM : LIBXL_DOMAIN_TYPE_PV;
>   }
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 3f9fff6..2df7258 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -357,6 +357,7 @@ libxl_dominfo = Struct("dominfo",[
>       ("vcpu_max_id", uint32),
>       ("vcpu_online", uint32),
>       ("cpupool",     uint32),
> +    ("gpaddr_bits", uint8),
>       ("domain_type", libxl_domain_type),
>       ], dir=DIR_OUT)
>   
> diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
> index b7d27f3..6245af6 100644
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -20,6 +20,8 @@ void arch_get_domain_info(const struct domain *d,
>   {
>       /* All ARM domains use hardware assisted paging. */
>       info->flags |= XEN_DOMINF_hap;
> +
> +    info->gpaddr_bits = p2m_ipa_bits;
>   }
>   
>   static int handle_vuart_init(struct domain *d,
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 26a76d2..7d102e0 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -151,6 +151,7 @@ void arch_get_domain_info(const struct domain *d,
>           info->flags |= XEN_DOMINF_hap;
>   
>       info->arch_config.emulation_flags = d->arch.emulation_flags;
> +    info->gpaddr_bits = hap_paddr_bits;
>   }
>   
>   static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op *op,
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 12d6144..2d07a12 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -69,10 +69,10 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>       int flags = XEN_DOMINF_blocked;
>       struct vcpu_runstate_info runstate;
>   
> +    memset(info, 0, sizeof(*info));
> +
>       info->domain = d->domain_id;
>       info->max_vcpu_id = XEN_INVALID_MAX_VCPU_ID;
> -    info->nr_online_vcpus = 0;
> -    info->ssidref = 0;
>   
>       /*
>        * - domain is marked as blocked only if all its vcpus are blocked
> @@ -95,7 +95,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
>   
>       info->cpu_time = cpu_time;
>   
> -    info->flags = (info->nr_online_vcpus ? flags : 0) |
> +    info->flags |= (info->nr_online_vcpus ? flags : 0) |
>           ((d->is_dying == DOMDYING_dead) ? XEN_DOMINF_dying     : 0) |
>           (d->is_shut_down                ? XEN_DOMINF_shutdown  : 0) |
>           (d->controller_pause_count > 0  ? XEN_DOMINF_paused    : 0) |
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 3558641..a7ab95d 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -76,7 +76,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>       case XEN_SYSCTL_getdomaininfolist:
>       {
>           struct domain *d;
> -        struct xen_domctl_getdomaininfo info = { 0 };
> +        struct xen_domctl_getdomaininfo info;
>           u32 num_domains = 0;
>   
>           rcu_read_lock(&domlist_read_lock);
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 4cb3f66..46acc8f 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -106,6 +106,7 @@ struct xen_domctl_createdomain {
>   struct xen_domctl_getdomaininfo {
>       /* OUT variables. */
>       domid_t  domain;              /* Also echoed in domctl.domain */
> +    uint16_t pad1;
>    /* Domain is scheduled to die. */
>   #define _XEN_DOMINF_dying     0
>   #define XEN_DOMINF_dying      (1U<<_XEN_DOMINF_dying)
> @@ -150,6 +151,8 @@ struct xen_domctl_getdomaininfo {
>       uint32_t ssidref;
>       xen_domain_handle_t handle;
>       uint32_t cpupool;
> +    uint8_t gpaddr_bits; /* Guest physical address space size. */
> +    uint8_t pad2[7];
>       struct xen_arch_domainconfig arch_config;
>   };
>   typedef struct xen_domctl_getdomaininfo xen_domctl_getdomaininfo_t;
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 039ccf8..41ef7a2 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -35,7 +35,7 @@
>   #include "domctl.h"
>   #include "physdev.h"
>   
> -#define XEN_SYSCTL_INTERFACE_VERSION 0x00000013
> +#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
>   
>   /*
>    * Read console content from Xen buffer ring.

-- 
Regards,

Oleksandr Tyshchenko


