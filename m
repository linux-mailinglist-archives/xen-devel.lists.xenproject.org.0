Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FSNsDp1bOWo9rAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:58:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8042C6B0E9A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 17:58:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=XUd3YSFT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343982.1603190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbh1p-0007Pk-Tv; Mon, 22 Jun 2026 15:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343982.1603190; Mon, 22 Jun 2026 15:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbh1p-0007Nz-R9; Mon, 22 Jun 2026 15:57:41 +0000
Received: by outflank-mailman (input) for mailman id 1343982;
 Mon, 22 Jun 2026 15:57:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbh1o-0007Lz-9h
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 15:57:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbh1m-00BFEc-Po
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 17:57:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a395b43-e002-0a2a0a5209dd-0a2a4503d2bc-48
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:57:38 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a395b72-a3da-0a2a45030019-d155dd2decf9-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 17:57:38 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-463f1165e16so4524723f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 08:57:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49240efc63fsm190555325e9.1.2026.06.22.08.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 08:57:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1782143858; x=1782748658; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N/aji1K5kjTpbcV5PMjcN9LFuov4EnJbGP3srzrkMlQ=;
        b=XUd3YSFTs1sqW3jfuvtH8U2g7pXig4V9JMQimqaJxpKqo0XBbM6VEsiM4WxAWDUIc+
         yci5WFaORlqROsy6WyDkrXL4ZwgjgNJzOBBEKI0Ei6uVEEGzKixZzccUlqw0zwqMRjbP
         gqpXgkvkclkIc0dGjCGbUfSVmRJWAIStK95A8NosApFcvogKn+F6vsp+4xN+LJm6NJkT
         y6lFOcFRZUYKvUqy5q2D/4GvUiQlL4smoYWMPHJS61380FC1iKBcIci+x9jZtMHwN/Q0
         YZnBjgfezvzQeFFH18J1MlgUhL4mErZsVmQQgWwPFSWCqE6IDyt42mIDtoCtUhqG/U3x
         3fPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782143858; x=1782748658;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/aji1K5kjTpbcV5PMjcN9LFuov4EnJbGP3srzrkMlQ=;
        b=tOx3kORycyw65FzHMnr7f0fe6tIArNCewYopymDa3S30iH/oWLwU6XjM+z8uLUUNPZ
         trO13vy0AoHkPifBuGkkKkISc0zNtjQP5UqElX/EFFVXWf2CATMDXnwx3ZwInkJRby0h
         f+AbdCk9+BSZozGhpHmL4cCP/D1Abzt2doJqN5KjW75ohgsxUyYEaQPKZF6yNuZg2622
         yLgLWmEwaj/9NKieTak0VoO5mdZd8ehos9RdySY/dk608cPfA2avY7ZEcR5p7cxZr0kF
         JuJKUZHUEytTQxpv1qg4p3ewvxHv88iYyCbjprOZJU01PLqqbqgNSOV/2kE9F/wuVWQt
         FwkA==
X-Forwarded-Encrypted: i=1; AFNElJ8mO+rxCA5z48CWAHVb9ZsehT+8W92/G44QlKLMam0Q38ILjquH0MinTK9eB6o3eaDPGid6iN0wroY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzi6aYy7V6wsxVGT5Hh7WOl7deWUuNgpIpTc24QNg1TKhMixB3W
	RQUlIM23GW369iqNUpXLs5uTRC51C2P+kGo1EFVYRJOhi4DV3O+CoiLpEIYRgeytDw==
X-Gm-Gg: AfdE7cnLjy/S01ofjDPCwS2MvjWxJfWEksL6VYZeLxdME1/58gJLXVYmBFbLjgenXGm
	BYtoJiSiZTqQ7vAqQ+xoWPYG9T+qC066u/1wcu4LBABi5yUtw0lOmIj7Nc7oMCQOHI7Nbf0sX1B
	nw1MrC8a62SWAUIWqcBbkE4T9KbmfQvj7rLBqIT0OqAIEKXyJhqnoLk1iHrb05mP/SeoURvpnBp
	z2jv8G8Qw81DjhWTyUuHnhfFD2PGnyVmLi2Pv0q0OkX55ILL+s3bTZdXDcjAWGa8zEzs1jJM+XJ
	qpoCLge8uQox4jy7lWciRGqf2kx172A76h99g2bOUZNsnoYuKKmifa9qSKHorXHeIJDTHx1leRx
	4b33LVs1EyjNeianA9qBAjyOHk3VTpaUpeFDaqMCq6NrgOt+xIh+EVBp2+/cfY2Jpw49VWquqZ1
	xWj9dHUV4lrW/oSEJgYhFLOmwKPwC6zlBhbO/VZnClKQIVBuT7SHcpSSDJkN4jivBRsnbORCEbi
	x0T
X-Received: by 2002:a05:600c:2305:b0:492:2f59:4969 with SMTP id 5b1f17b1804b1-49240e5b469mr182157355e9.22.1782143857853;
        Mon, 22 Jun 2026 08:57:37 -0700 (PDT)
Message-ID: <3a1aca27-cc18-4b57-bb31-c50161b8c261@suse.com>
Date: Mon, 22 Jun 2026 17:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/23] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <0458468cc5a6db911a9acc64f4c8cf17ceebe4c6.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0458468cc5a6db911a9acc64f4c8cf17ceebe4c6.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782143858-677D2D84-D95CCF5D/0/0
X-purgate-type: clean
X-purgate-size: 7566
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 8042C6B0E9A

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/device.c
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/iocap.h>
> +#include <xen/rangeset.h>
> +#include <xen/sched.h>
> +
> +#include <asm/intc.h>
> +
> +int map_irq_to_domain(struct domain *d, unsigned int irq,
> +                      bool need_mapping, const char *devname)
> +{
> +    int res;
> +
> +    res = irq_permit_access(d, irq);

Such generally needs an XSM check up front, the more that the function isn't
__init, i.e. is (apparently) intended for runtime use as well.

> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Unable to permit %pd access to IRQ %u\n", d, irq);
> +        return res;
> +    }
> +
> +    if ( need_mapping )
> +    {
> +        /*
> +         * Checking the return of vintc_reserve_virq is not
> +         * necessary. It should not fail except when we try to map
> +         * the IRQ twice. This can legitimately happen if the IRQ is shared.
> +         */
> +        vintc_reserve_virq(d, irq);
> +
> +        res = route_irq_to_guest(d, irq, irq, devname);
> +        if ( res < 0 )
> +        {
> +            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
> +            return res;
> +        }
> +    }
> +
> +    dt_dprintk("  - IRQ: %u\n", irq);
> +
> +    return 0;
> +}
> +
> +/*
> + * map_device_irqs_to_domain retrieves the interrupts configuration from
> + * a device tree node and maps those interrupts to the target domain.
> + *
> + * Returns:
> + *   < 0 error
> + *   0   success
> + */
> +int map_device_irqs_to_domain(struct domain *d,
> +                              struct dt_device_node *dev,
> +                              bool need_mapping,
> +                              struct rangeset *irq_ranges)
> +{
> +    unsigned int i, nirq = dt_number_of_irq(dev);
> +
> +    if ( irq_ranges )
> +        return -EOPNOTSUPP;
> +
> +    /* Give permission and map IRQs */
> +    for ( i = 0; i < nirq; i++ )
> +    {
> +        int res, irq;
> +        struct dt_raw_irq rirq;
> +
> +        res = dt_device_get_raw_irq(dev, i, &rirq);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
> +                   i, dt_node_full_name(dev));
> +            return res;
> +        }
> +
> +        /*
> +         * Don't map IRQ that have no physical meaning
> +         * ie: IRQ whose controller is not APLIC/IMSIC/PLIC.
> +         */

Nit: Does this comment mean to use singular or plural for IRQ?

> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -538,10 +538,11 @@ int __init imsic_init(const struct dt_device_node *node)
>  
>  static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
>  {
> +    paddr_t base = GUEST_IMSIC_S_BASE;
>      paddr_t size = IMSIC_MMIO_PAGE_SZ * d->max_vcpus;
>      __be32 regs[4] = {
> -        cpu_to_be32(GUEST_IMSIC_S_BASE >> 32),
> -        cpu_to_be32(GUEST_IMSIC_S_BASE),
> +        cpu_to_be32(base >> 32),
> +        cpu_to_be32(base),
>          cpu_to_be32(size >> 32),
>          cpu_to_be32(size),
>      };

What is this change about? Does it perhaps belong into an earlier patch?

> --- a/xen/arch/riscv/include/asm/intc.h
> +++ b/xen/arch/riscv/include/asm/intc.h
> @@ -13,6 +13,7 @@ enum intc_version {
>  };
>  
>  struct cpu_user_regs;
> +struct domain;
>  struct irq_desc;
>  struct kernel_info;
>  struct vcpu;
> @@ -32,6 +33,9 @@ struct intc_hw_operations {
>      /* hw_irq_controller to enable/disable/eoi host irq */
>      const struct hw_interrupt_type *host_irq_type;
>  
> +    /* hw_irq_controller to enable/disable/eoi guest irq */
> +    const struct hw_interrupt_type *guest_irq_type;

It's likely my limited RISC-V knowledge that I find this extremely odd:
Separate struct hw_interrupt_type-s for host and guest?

> @@ -62,6 +66,8 @@ struct vintc_ops {
>  };
>  
>  struct vintc {
> +    unsigned int irq_nums;

I did ask before: Which word does "nums" stand for?

> @@ -106,12 +124,25 @@ int domain_vintc_init(struct domain *d)
>          break;
>      }
>  
> +    if ( !ret )
> +    {
> +        d->arch.vintc->used_irqs =
> +            xvzalloc_array(unsigned long, BITS_TO_LONGS(d->arch.vintc->irq_nums));
> +        if ( !d->arch.vintc->used_irqs )
> +            ret = -ENOMEM;
> +    }
> +
>      return ret;
>  }
>  
>  void domain_vintc_deinit(struct domain *d)
>  {
>      const enum intc_version ver = intc_hw_ops->info->hw_version;
> +    unsigned int virq;
> +
> +    for ( virq = 0; virq < d->arch.vintc->irq_nums; virq++ )

Here you de-reference d->arch.intc. One of the purposes of ...

> +        if ( test_bit(virq, d->arch.vintc->used_irqs) )
> +            release_guest_irq(d, virq);
>  
>      switch ( ver )
>      {
> @@ -122,4 +153,14 @@ void domain_vintc_deinit(struct domain *d)
>      default:
>          break;
>      }
> +
> +    XVFREE(d->arch.vintc->used_irqs);

... this is to allow the function to be idempotent, i.e. to recognize that
it was called before (or no setup was done at all), and hence it doesn't
need to do anything.

> +void release_irq(unsigned int irq, const void *dev_id)
> +{
> +    struct irq_desc *desc;
> +    unsigned long flags;
> +    struct irqaction *action, **action_ptr;
> +
> +    desc = irq_to_desc(irq);
> +
> +    spin_lock_irqsave(&desc->lock,flags);

Nit: Missing blank after comma (again at least once further down).

> +    action_ptr = &desc->action;
> +#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
> +    for ( ;; )
> +    {
> +        action = *action_ptr;
> +        if ( !action )
> +        {
> +            printk(XENLOG_WARNING "Trying to free already-free IRQ %u\n", irq);
> +            spin_unlock_irqrestore(&desc->lock, flags);
> +            return;
> +        }
> +
> +        if ( action->dev_id == dev_id )
> +            break;
> +
> +        action_ptr = &action->next;
> +    }
> +
> +    /* Found it - remove it from the action list */
> +    *action_ptr = action->next;
> +#else
> +    action = *action_ptr;
> +    *action_ptr = NULL;
> +#endif
> +
> +    /* If this was the last action, shut down the IRQ */
> +    if ( !desc->action )
> +    {
> +        desc->handler->shutdown(desc);
> +        __clear_bit(_IRQ_GUEST, &desc->status);
> +    }
> +
> +    spin_unlock_irqrestore(&desc->lock,flags);
> +
> +    /* Wait to make sure it's not being used on another CPU */
> +    do { smp_mb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );

Can you explain to me what the purpose of this barrier is?

> +int release_guest_irq(struct domain *d, unsigned int virq)
> +{
> +    struct irq_desc *desc = irq_to_desc(virq);
> +    struct irq_guest *info;
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&desc->lock, flags);
> +
> +    if ( !test_bit(_IRQ_GUEST, &desc->status) )
> +        goto unlock_err;
> +
> +    info = irq_get_guest_info(desc);
> +    if ( d != info->d )
> +        goto unlock_err;
> +
> +    spin_unlock_irqrestore(&desc->lock, flags);
> +
> +    release_irq(desc->irq, info);
> +    xvfree(info);

So you drop the lock keeping the info associated with desc in place. How
do you know what you free here is the correct thing, and isn't in use
elsewhere?

Jan

