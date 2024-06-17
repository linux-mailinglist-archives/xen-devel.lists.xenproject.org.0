Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03390B476
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 17:33:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742487.1149292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJELM-00062R-K3; Mon, 17 Jun 2024 15:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742487.1149292; Mon, 17 Jun 2024 15:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJELM-00060B-H5; Mon, 17 Jun 2024 15:32:28 +0000
Received: by outflank-mailman (input) for mailman id 742487;
 Mon, 17 Jun 2024 15:32:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJELK-000605-Vl
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 15:32:26 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb820edc-2cbe-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 17:32:24 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f09eaf420so524320466b.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 08:32:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f5c8e2ef2sm489337566b.213.2024.06.17.08.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 08:32:23 -0700 (PDT)
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
X-Inumbo-ID: cb820edc-2cbe-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718638344; x=1719243144; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YxdBmjhOhZV+X1e8AMNTWfQMmwwy+lg/TU9LF3pkN2c=;
        b=CTb+a/7Ev2kAfvzymr1mrzU22Cfi34yap1EcSRtqQ8vZTm+DrW2fW3R+xpUSpTye+E
         cWHLTEac2Gkp0wLi2ez8DxS0JeCjTbNjO1ZQNBsJEGbPP1/n6C+nZt4mKtuYd7jk1//X
         +JT2YtFtJn4VOt6QBZ6VP0fCD0sng5CSCpW04HAYS8U5mZpO21TG9ohdad0f+Z6MPYGy
         fFO3BbrQU8/FMQIP19eqUETmpNLxNI9zsk4iIlWoFw/tt0YrmgFiAYY08r0HZJp0Qyc7
         mDdGAkkqkE9VFY26YWSOVz+p38ZuXCTmJSBdWpuuhT83yBXhYUPtgyc+Q0334DxGfpb8
         G2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718638344; x=1719243144;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxdBmjhOhZV+X1e8AMNTWfQMmwwy+lg/TU9LF3pkN2c=;
        b=HKdTY3T46PXXEJy8B8CuHOalx6TxG7iXqDdfsijImj/0kwVpwagCp5ZZVS13odT2oI
         Z/QOlDuisOpfhMOJR1iRTZlRhS2u+/NxGTmmVWc/+fYYAMMvH168ULcBffgofizP8whc
         kgJOj4Q/aG0knAdfduyHyPO4zRQixvxr/Rs9GjrPAVHCT/DQnD/iizjQcHcwBn7LdSSL
         znqbMzx+VhAaw9j+xe8gN8erMBjAWM2IdF9EQP7NQnAjpfu4ZNOTY6AklxlBKaTLVm95
         MGmKOTI++D7ObbroMMt2N/HWJ4TQ0C18zG+F9jddinNpWMwOSRKu0ZxHocdVX2GmEMpq
         2xYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/gY+rJ1SArGOn/k50SkdSNXkKGTkgO2ZtgnkPjtlAPAhSp+oSNOIxgm//OR8noiLCyR04JRSFjYL5s1J6ynVvPPkTVgUBVh9i2SD5m68=
X-Gm-Message-State: AOJu0Yw3qDTf8KbEtjqU9AHl48cjmR8Qk882NulSCTbJuuvPwpVEdJOR
	82p9mpuZz91sgDqubRAdfvw0QkAL8e3V5HdBvHO+R3SM/fg1csMhbQxShTS6jQ==
X-Google-Smtp-Source: AGHT+IF/dqOXbSCxPfnTFu1JETVqYDZxfafj4HkWYTaY1NcpFjHhtzPzJUaR6zxDPZNCS+8MkndlAw==
X-Received: by 2002:a17:906:6bcc:b0:a6f:593f:d334 with SMTP id a640c23a62f3a-a6f60dc5279mr601789366b.51.1718638343578;
        Mon, 17 Jun 2024 08:32:23 -0700 (PDT)
Message-ID: <b4b6cbcd-dd71-44da-aea8-6a4a170d73d5@suse.com>
Date: Mon, 17 Jun 2024 17:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v10 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
 <20240617090035.839640-6-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240617090035.839640-6-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2024 11:00, Jiqian Chen wrote:
> Some type of domain don't have PIRQs, like PVH, it doesn't do
> PHYSDEVOP_map_pirq for each gsi. When passthrough a device
> to guest base on PVH dom0, callstack
> pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
> domain_pirq_to_irq, because PVH has no mapping of gsi, pirq and
> irq on Xen side.
> What's more, current hypercall XEN_DOMCTL_irq_permission requires
> passing in pirq, it is not suitable for dom0 that doesn't have
> PIRQs.
> 
> So, add a new hypercall XEN_DOMCTL_gsi_permission to grant the
> permission of irq(translate from gsi) to dumU when dom0 has no
> PIRQs.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> RFC: it needs review and needs to wait for the corresponding third patch on linux kernel side to be merged.
> ---
>  tools/include/xenctrl.h            |  5 +++
>  tools/libs/ctrl/xc_domain.c        | 15 +++++++
>  tools/libs/light/libxl_pci.c       | 67 +++++++++++++++++++++++++++---
>  xen/arch/x86/domctl.c              | 43 +++++++++++++++++++
>  xen/arch/x86/include/asm/io_apic.h |  2 +
>  xen/arch/x86/io_apic.c             | 17 ++++++++
>  xen/arch/x86/mpparse.c             |  3 +-
>  xen/include/public/domctl.h        |  8 ++++
>  xen/xsm/flask/hooks.c              |  1 +
>  9 files changed, 153 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index a0381f74d24b..f3feb6848e25 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -1382,6 +1382,11 @@ int xc_domain_irq_permission(xc_interface *xch,
>                               uint32_t pirq,
>                               bool allow_access);
>  
> +int xc_domain_gsi_permission(xc_interface *xch,
> +                             uint32_t domid,
> +                             uint32_t gsi,
> +                             bool allow_access);
> +
>  int xc_domain_iomem_permission(xc_interface *xch,
>                                 uint32_t domid,
>                                 unsigned long first_mfn,
> diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
> index f2d9d14b4d9f..8540e84fda93 100644
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -1394,6 +1394,21 @@ int xc_domain_irq_permission(xc_interface *xch,
>      return do_domctl(xch, &domctl);
>  }
>  
> +int xc_domain_gsi_permission(xc_interface *xch,
> +                             uint32_t domid,
> +                             uint32_t gsi,
> +                             bool allow_access)
> +{
> +    struct xen_domctl domctl = {
> +        .cmd = XEN_DOMCTL_gsi_permission,
> +        .domain = domid,
> +        .u.gsi_permission.gsi = gsi,
> +        .u.gsi_permission.allow_access = allow_access,
> +    };
> +
> +    return do_domctl(xch, &domctl);
> +}
> +
>  int xc_domain_iomem_permission(xc_interface *xch,
>                                 uint32_t domid,
>                                 unsigned long first_mfn,
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 376f91759ac6..f027f22c0028 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1431,6 +1431,9 @@ static void pci_add_dm_done(libxl__egc *egc,
>      uint32_t flag = XEN_DOMCTL_DEV_RDM_RELAXED;
>      uint32_t domainid = domid;
>      bool isstubdom = libxl_is_stubdom(ctx, domid, &domainid);
> +#ifdef CONFIG_X86
> +    xc_domaininfo_t info;
> +#endif
>  
>      /* Convenience aliases */
>      bool starting = pas->starting;
> @@ -1516,14 +1519,39 @@ static void pci_add_dm_done(libxl__egc *egc,
>              rc = ERROR_FAIL;
>              goto out;
>          }
> -        r = xc_domain_irq_permission(ctx->xch, domid, irq, 1);
> +#ifdef CONFIG_X86
> +        /* If dom0 doesn't have PIRQs, need to use xc_domain_gsi_permission */
> +        r = xc_domain_getinfo_single(ctx->xch, 0, &info);

Hard-coded 0 is imposing limitations. Ideally you would use DOMID_SELF, but
I didn't check if that can be used with the underlying hypercall(s). Otherwise
you want to pass the actual domid of the local domain here.

>          if (r < 0) {
> -            LOGED(ERROR, domainid,
> -                  "xc_domain_irq_permission irq=%d (error=%d)", irq, r);
> +            LOGED(ERROR, domainid, "getdomaininfo failed (error=%d)", errno);
>              fclose(f);
>              rc = ERROR_FAIL;
>              goto out;
>          }
> +        if (info.flags & XEN_DOMINF_hvm_guest &&

You want to parenthesize the & here.

> +            !(info.arch_config.emulation_flags & XEN_X86_EMU_USE_PIRQ) &&
> +            gsi > 0) {

So if gsi < 0 failure of xc_domain_getinfo_single() would needlessly result
in failure of this function?

> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -36,6 +36,7 @@
>  #include <asm/xstate.h>
>  #include <asm/psr.h>
>  #include <asm/cpu-policy.h>
> +#include <asm/io_apic.h>
>  
>  static int update_domain_cpu_policy(struct domain *d,
>                                      xen_domctl_cpu_policy_t *xdpc)
> @@ -237,6 +238,48 @@ long arch_do_domctl(
>          break;
>      }
>  
> +    case XEN_DOMCTL_gsi_permission:
> +    {
> +        unsigned int gsi = domctl->u.gsi_permission.gsi;
> +        int irq;
> +        bool allow = domctl->u.gsi_permission.allow_access;

See my earlier comments on this conversion of 8 bits into just one.

> +        /* Check all pads are zero */
> +        ret = -EINVAL;
> +        for ( i = 0;
> +              i < sizeof(domctl->u.gsi_permission.pad) /
> +                  sizeof(domctl->u.gsi_permission.pad[0]);

Please don't open-code ARRAY_SIZE().

> +              ++i )
> +            if ( domctl->u.gsi_permission.pad[i] )
> +                goto out;
> +
> +        /*
> +         * If current domain is PV or it has PIRQ flag, it has a mapping
> +         * of gsi, pirq and irq, so it should use XEN_DOMCTL_irq_permission
> +         * to grant irq permission.
> +         */
> +        ret = -EOPNOTSUPP;
> +        if ( is_pv_domain(currd) || has_pirq(currd) )
> +            goto out;

I'm curious what other x86 maintainers think: I for one would not impose such
an artificial restriction.

> +        ret = -EINVAL;
> +        if ( gsi >= nr_irqs_gsi || (irq = gsi_2_irq(gsi)) < 0 )
> +            goto out;
> +
> +        ret = -EPERM;
> +        if ( !irq_access_permitted(currd, irq) ||
> +             xsm_irq_permission(XSM_HOOK, d, irq, allow) )
> +            goto out;
> +
> +        if ( allow )
> +            ret = irq_permit_access(d, irq);
> +        else
> +            ret = irq_deny_access(d, irq);
> +
> +    out:

Please use a less generic name for such a label local to just one case
block. However, with ..

> +        break;

.. this being all that's done here: Why have a label in the first place?

Jan

