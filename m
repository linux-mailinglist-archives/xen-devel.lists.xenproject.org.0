Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l3tuCn+VQmqY+AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 17:55:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514AB6DCFE2
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 17:55:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=NIoIlOsc;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347745.1605583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weEKB-0001Xc-H6; Mon, 29 Jun 2026 15:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347745.1605583; Mon, 29 Jun 2026 15:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weEKB-0001Ur-EN; Mon, 29 Jun 2026 15:55:07 +0000
Received: by outflank-mailman (input) for mailman id 1347745;
 Mon, 29 Jun 2026 15:55:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weEKA-0001Ul-4p
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 15:55:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weEK9-00DRg6-Hv
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:55:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a429552-5cb7-0a2a0a5109dd-0a2a4503a9f0-14
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 17:55:05 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a429559-ec1a-0a2a45030019-d155dd2cb10d-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 17:55:05 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47488efcf30so478823f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 08:55:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926f94f213sm289305505e9.12.2026.06.29.08.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 08:55:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1782748505; x=1783353305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mOD6N0e3JIKS6Wzeodijt4mFf7b4Q4kAJ6WqZhjpH88=;
        b=NIoIlOscNf40pXutDUemaaOgxsX3IwUcxW3kZgrf4IgHVVH9UJNHawf6JY5mEwpYEJ
         xDhn4a4SSMYe2uWunLldpIcD7lUR3JOEPl1MoP6hqd9ax76Kex3HS5f1ZIcLYWwrocLR
         7AmcahtovfKs3Pdhh4puMA3TcJEynFLh0SvKmnA5+OUNh5s1ZJcQv90feZaY2gyxBnvi
         NWu7n1wu8dY0i+5E60vpWcplYsrRB8j3KHdRPtXiF7FfCt6c+mS1OYfGAfTgNVNJ+TkF
         nOLPtQfLGrSsxCO91OjfZE9tCWc3ib2+IPZuRBBDWKwkw7m2nTlTJMKL9SHZms/BfGVX
         2f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748505; x=1783353305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOD6N0e3JIKS6Wzeodijt4mFf7b4Q4kAJ6WqZhjpH88=;
        b=Up5GjYaw7UJqxDMNb/p2a5vhX2H6X6GbBgAtdKSAkbmgyJM0UzxM1lrYuv5vPuVXCp
         2b7AGHnISzslP7H+dnJI/gFGnt9SM4xlB/2MeOx1gdlL87qklHRe1ScKeHBOZkE6No90
         zZx9BO4QrVtdaL1uBa1scdNmsn+FBKX08+/cHfQawoMZSESwvUnHClO00bOJmlXsZn+5
         YWgq43pzOOlK/BlGiFR6SFP3xZp7EonrN4rs/KuPmvK9skGqV2Hv+j7vcPBSDEbEpyTd
         6Yy3bX9s8iSNIXT28aFU/8JgeHuDP2mUXMvEGlld20sKZzYUujR3V4tI3Vc/1t2wfrps
         /I7Q==
X-Forwarded-Encrypted: i=1; AFNElJ82lFIwgCGEancHVMfgayrdKQROLGDjnrUxgyBaaRSeq0lYehVvNG69dbQV4brOrJT63iy8r8n2o0E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3ysZCl/oFgM3Ili13yTL3dlSRPRgZ9f3YekR4QyO4dtgYeeP+
	5CBP73WONtcepgEb6JidkpHMqe0H+GPPmXe/QycBcFYp6HM1bton73kDB9g6T5HLAQ==
X-Gm-Gg: AfdE7cmhKbIPtOcfapSNeNBEGJrRlzULlFCipDwrLzhGhuha/m5Uoq3Kr4K26j5oO3G
	UJ18RuYCmWYBbNLunFOKEiBP0nMqgLVQRX8Z0h+kEjQQN6wRZdoMj494qHrSwK6XECO+4/uWMQR
	rybE8uoEJtommwf4n8wCcLCVJ6rqF3E6r1cuYyc8O6ocOe+udEr7S6xFzic3hr7OMBPmU69MM5r
	ZLls2pVLq/atjKJw4/lQV7Jytwwb4sORM2elq3pF/u7448439VomTD+WWGfqyRSqOG+ey3BCEaZ
	8xJ52vginjOdOHakSWOXqofsJKV5p1xznMy4WkUANd55cLR77ALsYFXO8QZS7qeJOkXTKbLztsK
	gTwmdUJ2BcaKZruxlDTZ8oLntJE/DOuV0klYhWP92yy+Zjyd60/Y2aiDq8HCyBzTKVu/gkACODT
	oSsS3upGqLiJMQBYeFQhvZQdz7k4fDNAlCvjiX7y5yyHxQ35MzvbUv1I5D/2WJbhMqGZF/93Hw1
	7nd
X-Received: by 2002:a05:600c:4705:b0:492:46c3:c7dc with SMTP id 5b1f17b1804b1-493b8286a0cmr4742135e9.14.1782748504568;
        Mon, 29 Jun 2026 08:55:04 -0700 (PDT)
Message-ID: <ac1a3a08-dc39-4794-ba96-dab4b88c27a3@suse.com>
Date: Mon, 29 Jun 2026 17:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/25] xen/riscv: implement IRQ routing for device
 passthrough
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <472a77604d35a0bc2a75b71f250fd67b63afde4c.1782487661.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <472a77604d35a0bc2a75b71f250fd67b63afde4c.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1782748505-BC9825D1-76EE97C7/0/0
X-purgate-type: clean
X-purgate-size: 8622
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 514AB6DCFE2

On 26.06.2026 17:46, Oleksii Kurochko wrote:
> dom0less device passthrough requires granting guest domains access to
> device interrupts.  Introduce map_device_irqs_to_domain() to enumerate
> a DT node's interrupt properties, skipping those not owned by
> the primary interrupt controller (as at the moment I haven't seen usages
> of it), and map_irq_to_domain() to grant domain access and configure
> Xen's interrupt descriptor accordingly. Sharing IRQ between domains is
> rejected.
> 
> Both map_irq_to_domain() and map_device_irqs_to_domain() are marked
> __overlay_init, mirroring Arm: without CONFIG_OVERLAY_DTB this expands to
> __init, so the functions are init-only and need no XSM check; with
> CONFIG_OVERLAY_DTB they become runtime-callable, but the only runtime
> entry point is dt_overlay_domctl(), which performs the XSM checks at the
> domctl layer.  RISC-V does not wire up DT overlay yet, so today these are
> strictly __init; if/when overlay support is added, the domctl-level XSM
> gating must be added together with it, as on Arm.
> 
> route_irq_to_guest() and release_irq() manage irq_desc ownership for
> guest-assigned interrupts.  Each assignment carries a small irq_guest
> structure as irqaction::dev_id, recording the owning domain and virtual
> IRQ number which is 1:1 mapped to physical IRQ number.  A per-domain
> vIRQ allocation bitmap (used_irqs in struct vintc), managed by
> vintc_reserve_virq(), prevents the same vIRQ being claimed twice.
> 
> Host and guest interrupts may differ in some operations (EOI timing in
> particular, possibly others): a host IRQ is completed once Xen's handler
> runs, whereas a passthrough IRQ must defer the physical completion until
> the guest issues its own EOI, otherwise a still-asserted level line would
> immediately retrigger and storm.  This affects only the .end callback;
> the rest of hw_interrupt_type is shared, hence the separate host and
> guest hw_interrupt_type instances.
> 
> With APLIC+IMSIC, guest interrupts are delivered directly by hardware
> through the IMSIC, bypassing do_IRQ(). The _IRQ_GUEST branch in
> do_IRQ() is therefore left as BUG() until a platform without direct
> IMSIC delivery is encountered.

And this is secure, i.e. one guest (by mishandling things, e.g. simply
never claiming / servicing an interrupt) cannot affect another guest?

> +int __overlay_init map_device_irqs_to_domain(struct domain *d,
> +                                             struct dt_device_node *dev,
> +                                             bool need_mapping,
> +                                             struct rangeset *irq_ranges)
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
> +         * Don't map IRQs that have no physical meaning
> +         * ie: IRQs whose controller is not APLIC/IMSIC/PLIC.
> +         */
> +        if ( rirq.controller != dt_interrupt_controller )
> +        {
> +            dt_dprintk("irq %u not connected to primary controller."
> +                       "Connected to %s\n", i,

Nit: By splitting a format string like this, you pretty effectively hide
that there's a blank missing after the full stop.

Further after an already wrapped function argument there shouldn't follow
another one, to maintain visual clarity.

> @@ -101,12 +119,28 @@ int domain_vintc_init(struct domain *d)
>          break;
>      }
>  
> +    if ( !ret )
> +    {
> +        d->arch.vintc->used_irqs =
> +            xvzalloc_array(unsigned long, BITS_TO_LONGS(d->arch.vintc->nr_virqs));

Nit: Overlong line.

> +        if ( !d->arch.vintc->used_irqs )
> +            ret = -ENOMEM;
> +    }
> +
>      return ret;
>  }
>  
>  void domain_vintc_deinit(struct domain *d)
>  {
>      const enum intc_variant variant = intc_hw_ops->info->hw_variant;
> +    unsigned int virq;
> +
> +    if ( !d->arch.vintc )
> +        return;

Seeing this and ...

> +    for ( virq = 0; virq < d->arch.vintc->nr_virqs; virq++ )
> +        if ( test_bit(virq, d->arch.vintc->used_irqs) )
> +            release_guest_irq(d, virq);
>  
>      switch ( variant )
>      {
> @@ -117,4 +151,14 @@ void domain_vintc_deinit(struct domain *d)
>      default:
>          break;
>      }
> +
> +    XVFREE(d->arch.vintc->used_irqs);

... this, ...

> +}

... where is d->arch.vintc being freed? That would logically look to
belong into this function.

> --- a/xen/arch/riscv/irq.c
> +++ b/xen/arch/riscv/irq.c
> @@ -12,11 +12,20 @@
>  #include <xen/errno.h>
>  #include <xen/init.h>
>  #include <xen/irq.h>
> +#include <xen/sched.h>
>  #include <xen/spinlock.h>
> +#include <xen/xvmalloc.h>
>  
>  #include <asm/hardirq.h>
>  #include <asm/intc.h>
>  
> +/* Describe an IRQ assigned to a guest */
> +struct irq_guest
> +{
> +    struct domain *d;
> +    unsigned int virq;
> +};
> +
>  static irq_desc_t irq_desc[NR_IRQS];
>  
>  static bool irq_validate_new_type(unsigned int curr, unsigned int new)
> @@ -192,6 +201,15 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>      if ( desc->handler->ack )
>          desc->handler->ack(desc);
>  
> +    if ( desc->status & IRQ_GUEST )
> +        /*
> +         * As at the moment APLIC + IMSIC is used for guest interrupts will
> +         * be directly passed to guest. But if/when IMSIC won't be available
> +         * all interrupts will go through Xenand here an irq injection
> +         * will be necessary to do.
> +         */
> +        panic("unimplemented");

The first comment sentence doesn't parse for me. In the 2nd there's a blank
missing between "Xen" and "and".

> @@ -221,3 +239,215 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
>      spin_unlock(&desc->lock);
>      irq_exit();
>  }
> +
> +static inline struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
> +{
> +    ASSERT(spin_is_locked(&desc->lock));
> +    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
> +    ASSERT(desc->action != NULL);
> +
> +    return desc->action->dev_id;
> +}
> +
> +static inline struct domain *irq_get_domain(struct irq_desc *desc)
> +{
> +    return irq_get_guest_info(desc)->d;
> +}

Does this really need a separate helper? (You effectively open-code it
anyway in release_guest_irq().)

For both functions: "inline" generally wants limiting to header files.

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
> +    /*
> +     * Live IRQ unrouting from a running domain is not supported: the tear-down
> +     * drops desc->lock across release_irq()/xvfree() and relies on no
> +     * concurrent route_irq_to_guest() being issued for this domain. Only permit
> +     * it for a dying domain, where assignment is frozen and no new routes can
> +     * appear.
> +     */
> +    if ( !d->is_dying )
> +    {
> +        spin_unlock_irqrestore(&desc->lock, flags);
> +        return -EBUSY;
> +    }

Yet route_irq_to_guest() looks to happily act on dying guests. IOW assignment
doesn't look to be frozen, despite the comment saying so.

> +    /*
> +     * Clear _IRQ_GUEST while still holding the lock so that a concurrent
> +     * release_guest_irq() for the same IRQ observes it and bails out, rather
> +     * than capturing the same 'info' and double-freeing it below.
> +     */
> +    clear_bit(_IRQ_GUEST, &desc->status);

You use __set_bit() / __clear_bit() elsewhere - why not here?

> +    spin_unlock_irqrestore(&desc->lock, flags);
> +
> +    release_irq(desc->irq, info);
> +    xvfree(info);

If, in release_irq(), action isn't freed, it's ->dev_id field will now have
a dangling pointer. (I think I did point this out before.)

Jan

