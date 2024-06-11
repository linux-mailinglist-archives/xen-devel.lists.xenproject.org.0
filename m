Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E3F903EFE
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 16:40:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738478.1145245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH2fJ-0004hp-L6; Tue, 11 Jun 2024 14:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738478.1145245; Tue, 11 Jun 2024 14:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH2fJ-0004fl-I2; Tue, 11 Jun 2024 14:40:01 +0000
Received: by outflank-mailman (input) for mailman id 738478;
 Tue, 11 Jun 2024 14:39:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBrw=NN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sH2fH-0004fb-U4
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 14:39:59 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a08f7cf-2800-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 16:39:58 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57c778b5742so3449981a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2024 07:39:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f117c09c9sm392727466b.138.2024.06.11.07.39.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 07:39:57 -0700 (PDT)
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
X-Inumbo-ID: 7a08f7cf-2800-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718116798; x=1718721598; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0/P4J0zk3QORR/5fLMEjLT6hX7REXkWZcoYqoG1IaII=;
        b=H9zFJW8rektVbQJCx6mTi3AxCiX1szqko0+1VlZhGgpFDs2XB69HiuoczMgZnWBVbh
         AdxFO8/tKQPXHpU46YGD3n0SCAPFZaAC9p3zu7o24ZNp9R/Yui6u4TNljzw+HLMqZbzg
         c0prGV2AHV7AWIpOK/FgIdFIaJz4R4pv/axvP06aKj/T5n/YkXV5GhHCXwLRyHU0xK4P
         OCXh4nruEputhyOK8NJY1dw1pfgp45lOSGIadOo04QB347EGGPy/YCEBRRkRldyyIpVX
         ce8c1iTRwbgDFIXWOh7TzV4UtoxUPSvp6vLp3T3dS2m/8Uv525o18X+wsVzbmXkMIyNm
         39KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718116798; x=1718721598;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/P4J0zk3QORR/5fLMEjLT6hX7REXkWZcoYqoG1IaII=;
        b=u23xOAwyPQ6gVUBHCd/tFNtmaKX51Ro1pw2xtBnwNXpQyToKjfi4AZqdo/vi3fKAnF
         xpFSrwdI0e9g5s0nPYswclO3K9YbaZV/CfGICM4fiaWhf7iX+/KCgC9V7ArKZoYFDnwH
         9pScvsFs23xCXd7zEd/peekF8T/zJUCe4ZcW8+kWIc5POrNGCez7cm1tY3OPFeM/Anb9
         lnzPLNAEyqkl8OXMPIX1T1/M9MscnGSxDFkysZwioW4QyRfj5qMKXC9WuPJCyvLZrXX5
         XetkR3idNmLg/z+nnyCzIi2ZDdGZYaBxdif6c0zPmgokmAoLYWvDVU2tgEWltuxRCcHH
         n0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUpC+RFhp7V3uyZaieOBREXEWTPdgS1SfXefxSspK0DBxl5t9i1bUgR5Wzqa2hqAHJUqarHgtp5FuW6OT4XYvVs3ZlDCVr1E3t4mY0npdg=
X-Gm-Message-State: AOJu0Yz3ifFdO9g2uHobOehCbVDRaomUR/rgmK6/O28EdzDHDjwBKTYm
	DHel0qWpm9IuRAn+WeZs0P2eFiKtkXJJxOV1JkljEVLTJ8qpZUNyPwRHTzktGA==
X-Google-Smtp-Source: AGHT+IGoo9TjyzkRN/eT4S1f70xdYcSENWFBSpVkBKh4O0CNaeqeJdF+c5n0ITbGpxDe+oAckI4Yxw==
X-Received: by 2002:a17:906:ca0b:b0:a6e:fc25:27b6 with SMTP id a640c23a62f3a-a6efc252c38mr510691466b.38.1718116797823;
        Tue, 11 Jun 2024 07:39:57 -0700 (PDT)
Message-ID: <987f5d21-bbb5-4cdb-975b-91949e802921@suse.com>
Date: Tue, 11 Jun 2024 16:39:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v9 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: Jiqian Chen <Jiqian.Chen@amd.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <Ray.Huang@amd.com>, xen-devel@lists.xenproject.org
References: <20240607081127.126593-1-Jiqian.Chen@amd.com>
 <20240607081127.126593-6-Jiqian.Chen@amd.com>
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
In-Reply-To: <20240607081127.126593-6-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.06.2024 10:11, Jiqian Chen wrote:
> Some type of domain don't have PIRQ, like PVH, it do not do
> PHYSDEVOP_map_pirq for each gsi. When passthrough a device
> to guest on PVH dom0, callstack
> pci_add_dm_done->XEN_DOMCTL_irq_permission will failed at
> domain_pirq_to_irq, because PVH has no mapping of gsi, pirq
> and irq on Xen side.

All of this is, to me at least, in pretty sharp contradiction to what
patch 2 says and does. IOW: Do we want the concept of pIRQ in PVH, or
do we want to keep that to PV?

> What's more, current hypercall XEN_DOMCTL_irq_permission require
> passing in pirq and grant the access of irq, it is not suitable
> for dom0 that has no PIRQ flag, because passthrough a device
> needs gsi and grant the corresponding irq to guest. So, add a
> new hypercall to grant gsi permission when dom0 is not PV or dom0
> has not PIRQ flag.
> 
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

A problem throughout the series as it seems: Who's the author of these
patches? There's no From: saying it's not you, but your S-o-b also
isn't first.

> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1412,6 +1412,37 @@ static bool pci_supp_legacy_irq(void)
>  #define PCI_SBDF(seg, bus, devfn) \
>              ((((uint32_t)(seg)) << 16) | (PCI_DEVID(bus, devfn)))
>  
> +static int pci_device_set_gsi(libxl_ctx *ctx,
> +                              libxl_domid domid,
> +                              libxl_device_pci *pci,
> +                              bool map,
> +                              int *gsi_back)
> +{
> +    int r, gsi, pirq;
> +    uint32_t sbdf;
> +
> +    sbdf = PCI_SBDF(pci->domain, pci->bus, (PCI_DEVFN(pci->dev, pci->func)));
> +    r = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
> +    *gsi_back = r;
> +    if (r < 0)
> +        return r;
> +
> +    gsi = r;
> +    pirq = r;

r is a GSI as per above; why would you store such in a variable named pirq?
And how can ...

> +    if (map)
> +        r = xc_physdev_map_pirq(ctx->xch, domid, gsi, &pirq);
> +    else
> +        r = xc_physdev_unmap_pirq(ctx->xch, domid, pirq);

... that value be the correct one to pass into here? In fact, the pIRQ number
you obtain above in the "map" case isn't handed to the caller, i.e. it is
effectively lost. Yet that's what would need passing into such an unmap call.

> +    if (r)
> +        return r;
> +
> +    r = xc_domain_gsi_permission(ctx->xch, domid, gsi, map);

Looking at the hypervisor side, this will fail for PV Dom0. In which case imo
you better would avoid making the call in the first place.

> +    if (r && errno == EOPNOTSUPP)

Before here you don't really need the pIRQ number; if all it really is needed
for is ...

> +        r = xc_domain_irq_permission(ctx->xch, domid, pirq, map);

... this, then it probably also should only be obtained when it's needed. Yet
overall the intentions here aren't quite clear to me.

> @@ -1485,6 +1516,19 @@ static void pci_add_dm_done(libxl__egc *egc,
>      fclose(f);
>      if (!pci_supp_legacy_irq())
>          goto out_no_irq;
> +
> +    r = pci_device_set_gsi(ctx, domid, pci, 1, &gsi);
> +    if (gsi >= 0) {
> +        if (r < 0) {

This unusual way of error checking likely wants a comment.

> +            rc = ERROR_FAIL;
> +            LOGED(ERROR, domainid,
> +                  "pci_device_set_gsi gsi=%d (error=%d)", gsi, errno);
> +            goto out;
> +        } else {
> +            goto process_permissive;
> +        }

Btw, no need for "else" when the earlier if ends in "goto" or alike.

> @@ -1493,13 +1537,6 @@ static void pci_add_dm_done(libxl__egc *egc,
>          goto out_no_irq;
>      }
>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> -        sbdf = PCI_SBDF(pci->domain, pci->bus,
> -                        (PCI_DEVFN(pci->dev, pci->func)));
> -        r = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
> -        /* if fail, keep using irq; if success, r is gsi, use gsi */
> -        if (r != -1) {
> -            irq = r;
> -        }

If I'm not mistaken, this and ...

> @@ -2255,13 +2302,6 @@ skip_bar:
>      }
>  
>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> -        sbdf = PCI_SBDF(pci->domain, pci->bus,
> -                        (PCI_DEVFN(pci->dev, pci->func)));
> -        r = xc_physdev_gsi_from_dev(ctx->xch, sbdf);
> -        /* if fail, keep using irq; if success, r is gsi, use gsi */
> -        if (r != -1) {
> -            irq = r;
> -        }

... this is code added by the immediately preceding patch. It's pretty odd
for that to be deleted here again right away. Can the interaction of the
two patches perhaps be re-arranged to avoid this anomaly?

> @@ -237,6 +238,43 @@ long arch_do_domctl(
>          break;
>      }
>  
> +    case XEN_DOMCTL_gsi_permission:
> +    {
> +        unsigned int gsi = domctl->u.gsi_permission.gsi;
> +        int irq = gsi_2_irq(gsi);

I'm not sure it is a good idea to issue this call ahead of the basic error
checks below.

> +        bool allow = domctl->u.gsi_permission.allow_access;

This allows any non-zero values to mean "true". I think you want to bail
on values larger than 1, much like you also want to check that the padding
fields are all zero.

> +        /*
> +         * If current domain is PV or it has PIRQ flag, it has a mapping
> +         * of gsi, pirq and irq, so it should use XEN_DOMCTL_irq_permission
> +         * to grant irq permission.
> +         */
> +        if ( is_pv_domain(current->domain) || has_pirq(current->domain) )

Please use currd here (and also again below).

> +        {
> +            ret = -EOPNOTSUPP;
> +            break;
> +        }
> +
> +        if ( gsi >= nr_irqs_gsi || irq < 0 )
> +        {
> +            ret = -EINVAL;
> +            break;
> +        }
> +
> +        if ( !irq_access_permitted(current->domain, irq) ||
> +             xsm_irq_permission(XSM_HOOK, d, irq, allow) )

Daniel, is it okay to issue the XSM check using the translated value, not
the one that was originally passed into the hypercall?

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -955,6 +955,27 @@ static int pin_2_irq(int idx, int apic, int pin)
>      return irq;
>  }
>  
> +int gsi_2_irq(int gsi)
> +{
> +    int entry, ioapic, pin;
> +
> +    ioapic = mp_find_ioapic(gsi);
> +    if ( ioapic < 0 )
> +        return -1;

Can this be a proper errno value (likely -EINVAL), please?

> +    pin = gsi - io_apic_gsi_base(ioapic);

Hmm, instead of the below: Once you have an (ioapic,pin) tuple, can't
you simply call apic_pin_2_gsi_irq()?

> +    entry = find_irq_entry(ioapic, pin, mp_INT);
> +    /*
> +     * If there is no override mapping for irq and gsi in mp_irqs,
> +     * then the default identity mapping applies.
> +     */
> +    if ( entry < 0 )
> +        return gsi;
> +
> +    return pin_2_irq(entry, ioapic, pin);

Under certain conditions this may return 0. Yet you surely don't want
to pass IRQ0 back as a result; you want to hand an error back instead.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -465,6 +465,14 @@ struct xen_domctl_irq_permission {
>  };
>  
>  
> +/* XEN_DOMCTL_gsi_permission */
> +struct xen_domctl_gsi_permission {
> +    uint32_t gsi;
> +    uint8_t allow_access;    /* flag to specify enable/disable of x86 gsi access */
> +    uint8_t pad[3];
> +};
> +
> +

Nit: No (new) double blank lines please. In fact (didn't I say this before
already?) you could insert between the two above, such that the existing issue
also disappears.

Jan

