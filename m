Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EsixEvpDIGrmzQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:10:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E45FB638FAD
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:10:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=EFupOphn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326776.1592119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnEs-0007VY-EE; Wed, 03 Jun 2026 15:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326776.1592119; Wed, 03 Jun 2026 15:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnEs-0007Rv-8k; Wed, 03 Jun 2026 15:10:38 +0000
Received: by outflank-mailman (input) for mailman id 1326776;
 Wed, 03 Jun 2026 15:10:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUnEq-0007Rb-U7
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:10:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUnEq-007dpr-AN
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:10:36 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2043e3-e002-0a2a0a5209dd-0a2a450c9fbc-26
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:10:36 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2043eb-62f1-0a2a450c0019-d155dd35c584-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:10:35 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-45e9f4a3510so7474560f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:10:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f360bd6sm8756809f8f.36.2026.06.03.08.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 08:10:34 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780499435; x=1781104235; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UKinLmeRL3GcJdjPQdNL/9sDY+GkddPkQfLIcJad4MM=;
        b=EFupOphnhoEteIkCtursp8OHTUo44ExHT8DuF0Yx7ToBauQ7cgLqvJjOY9/QXHH2m1
         D6tCUfgz7spmznEMdPn3/YnUN+L8ygXg59UDb5Ans7YAXzeWq620oU1n/DUKSB42H2Yh
         2W6Po7QhXE+b1RKnT9+ijW4eidGn2xAnsx/dlXfS3OlsrnujH5gahPfqQbgV7iwP4B+v
         qOgyDx6iwOfSDOqnj7CvZjNiREEDwi+dYJFcWHJq1fb2V/6HICrkAOePcQhPhdjdYnQ4
         E1O9bR8N/8H91leQX6cxpNKwEhyWBaHZleqI5BTRC345hU69L/13mJyKBi/uZSfzoh4N
         zqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780499435; x=1781104235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKinLmeRL3GcJdjPQdNL/9sDY+GkddPkQfLIcJad4MM=;
        b=Ofa7Dqo/iWL8SfX0KUDLidj0nF8nlms6SaJsbZSZnOabacxq6+69J3/iiGolaTVytE
         oxP8F5NS8FgfxrpFwQGJtschFv038u58zlFmYLHQfyGLu/7pcTLQJeCf2OizUx0VRqqI
         AjBcHdP+xZ5MQMRzycIAnRng2v9KvipsOC8pszFFRZVNkGcxYhpP0k7zB5rkA3vgLF95
         BqLr9/Jc0KOACb2lt0fgUzemiY4hAvRLzoGggKplUKIIdj67TTKfcbnfPLRz94VjabHY
         zclysAtqCGQRxlZlhJbYOYfpAGcYD05BDMpKy/IEdvI4h2hbLiJriXDUE8QMPyLZXJsU
         Opww==
X-Forwarded-Encrypted: i=1; AFNElJ9ci41EJVQVb+DzLDCmJI52xw9J95HEMtFYRXkUi1feZqorOt9YJa4Q2QF/tZ7WcoW15OxUpAvbuZ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXKO37EAM7avrHkmenGWoSCETNLYKA9y473zg+Eqj1lPNEXj89
	0Q0QE0DTQce/aC8kagJ7+AfYjmj/SjQuGKb2oHlmP0lBnDm7qBOpd0YnRgys9+sT/w==
X-Gm-Gg: Acq92OFm6YnvwUPlLQRs96HQuPWLjuNOoLqzdsYXfWZigU5ODXWV53L+/J6lvXnH1wO
	LBIaQoSGpckxIcLfN6eSX4zNjoFwz5Ii7j4ME3dztvFFZZrQOpDF/3oxQaNUBybopsFTMumVz7Y
	S6ehModPVi70Vuef3Mr3Vb6uNaQh5znSJ7E0ymvvwm2aqs0PB2SceCIM9smNJE8T4FPqgAO5Nyk
	hO2/n0cqT/D4bhYvMiz8nvQmksqWCBSn1f87z2xJKDH8dMBfqOdUhOn4P3iLQrk/11tFrsAEPuv
	mDiOYMasS77ByRFNz8JMOoVnnBKtuIh1+Pta4IQlFu+K3tKQmvExjQh2coVLzRRHzd1caZOLUoZ
	UaL7a7MGXituMdgcQVlmgFc0Cgw52hobo/nKBhydTS27Y5i9MMBzENvf2Owq7GdSBQmn4sv4gKi
	Re6fPmt1/od3qoAPYj4xCVMieS93PNbTYG0xi9UWMAKMOuVKY8/IFmhVpzW5i8WC5u+0OPRR2Af
	x1M2l49JQ24vtlq7DcbwS2DEg==
X-Received: by 2002:adf:f58f:0:b0:45d:3cb0:5ab1 with SMTP id ffacd0b85a97d-46021873b26mr3991423f8f.38.1780499435285;
        Wed, 03 Jun 2026 08:10:35 -0700 (PDT)
Message-ID: <76856d69-2f52-4804-92bf-ee9343230c2c@suse.com>
Date: Wed, 3 Jun 2026 17:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/26] xen/riscv: create APLIC DT node for guest
 domains
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <d1377f3e2381a6428b558b54f47db342d0cd5503.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d1377f3e2381a6428b558b54f47db342d0cd5503.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1780499435-F407FCF5-1B25AF43/0/0
X-purgate-type: clean
X-purgate-size: 4173
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:from_mime,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E45FB638FAD

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -14,6 +14,7 @@
>  #include <xen/cpumask.h>
>  #include <xen/device_tree.h>
>  #include <xen/errno.h>
> +#include <xen/fdt-kernel.h>
>  #include <xen/init.h>
>  #include <xen/macros.h>
>  #include <xen/sched.h>
> @@ -522,3 +523,9 @@ int __init imsic_init(const struct dt_device_node *node)
>  
>      return rc;
>  }
> +
> +int __init vimsic_make_domu_dt_node(struct kernel_info *kinfo,
> +                                    unsigned int *phandle)
> +{
> +    return -EOPNOTSUPP;
> +}

This, I assume, is going to be filled properly by the next patch.

> --- a/xen/arch/riscv/vaplic.c
> +++ b/xen/arch/riscv/vaplic.c
> @@ -9,6 +9,8 @@
>   */
>  
>  #include <xen/errno.h>
> +#include <xen/fdt-kernel.h>
> +#include <xen/libfdt/libfdt.h>
>  #include <xen/sched.h>
>  #include <xen/xvmalloc.h>
>  
> @@ -19,8 +21,11 @@
>  
>  #include "aplic-priv.h"
>  
> +#define VAPLIC_COMPATIBLE "riscv,aplic"
>  #define VAPLIC_NUM_SOURCES 96
>  
> +#define FDT_VAPLIC_INT_CELLS 2
> +
>  static int cf_check vcpu_vaplic_init(struct vcpu *v)
>  {
>      int rc = 0;
> @@ -47,6 +52,73 @@ static int cf_check vcpu_vaplic_init(struct vcpu *v)
>      return rc;
>  }
>  
> +static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)

Again - why __init here and ...

> +{
> +    int res = 0;
> +    void *fdt = kinfo->fdt;
> +    unsigned int msi_parent_phandle;
> +    char vaplic_name[128];
> +    paddr_t aplic_addr = GUEST_APLIC_S_BASE;
> +    paddr_t aplic_size = APLIC_SIZE(kinfo->bd.d->max_vcpus);
> +    const __be32 reg[] = {
> +        cpu_to_be32(aplic_addr >> 32),
> +        cpu_to_be32(aplic_addr),
> +        cpu_to_be32(aplic_size >> 32),
> +        cpu_to_be32(aplic_size),
> +    };
> +    struct vintc *vintc = kinfo->bd.d->arch.vintc;
> +
> +    res = snprintf(vaplic_name, sizeof(vaplic_name), "/soc/aplic@%x",
> +                   GUEST_APLIC_S_BASE);
> +    if ( res >= sizeof(vaplic_name) )
> +    {
> +        dprintk(XENLOG_DEBUG, "vaplic name is truncated\n");
> +        return -ENOBUFS;
> +    }
> +
> +    res = vimsic_make_domu_dt_node(kinfo, &msi_parent_phandle);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_begin_node(fdt, vaplic_name);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "#interrupt-cells", FDT_VAPLIC_INT_CELLS);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property(fdt, "reg", reg, sizeof(reg));
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "riscv,num-sources", vintc->irq_nums);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_string(fdt, "compatible", VAPLIC_COMPATIBLE);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "msi-parent", msi_parent_phandle);
> +    if ( res )
> +        return res;
> +
> +    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_intc);
> +    if ( res )
> +        return res;
> +
> +    return fdt_end_node(fdt);
> +}
> +
> +static const struct vintc_init_ops __initdata init_ops = {

... __initdata here? If you really want to have the option of moving
domain creation stuff to .init.* when only dom0less is configured,
then a proper abstraction is needed, along the lines of
init_or_livepatch.

> @@ -60,13 +132,14 @@ int __init domain_vaplic_init(struct domain *d)
>  
>      d->arch.vintc = &vaplic->vintc;
>      d->arch.vintc->ops = &vintc_ops;
> +    d->arch.vintc->init_ops = &init_ops;
>  
> -    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
> +    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
> +                             APLIC_DOMAINCFG_RO80;

This looks unrelated. I don't mind it being done here, but then it
wants mentioning in the description. Or maybe I simply don't understand
what this is about.

Jan

