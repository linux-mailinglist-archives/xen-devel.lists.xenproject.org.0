Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HQP1OlFAIGoWzQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:55:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C004638D49
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:55:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=gM79nS8Y;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326759.1592093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmzl-0001sO-Sn; Wed, 03 Jun 2026 14:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326759.1592093; Wed, 03 Jun 2026 14:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmzl-0001pa-P1; Wed, 03 Jun 2026 14:55:01 +0000
Received: by outflank-mailman (input) for mailman id 1326759;
 Wed, 03 Jun 2026 14:55:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUmzk-0001pS-JI
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:55:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmzj-00GKrf-Vu
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:54:59 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a204035-2eae-0a2a0a5409dd-0a2a4504de10-26
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:54:59 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a204043-1dec-0a2a45040019-d1558029d8b2-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:54:59 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490b9318997so6216945e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 07:54:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2e4004sm8149044f8f.9.2026.06.03.07.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 07:54:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1780498499; x=1781103299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qj+PwHHlGq/ImfDVyjeim+1I3WXkpQ4SAfsILTiGNVI=;
        b=gM79nS8Yre/nkB7G8X2UYSslz+FchfxjKfAWsC6JBr43UQ6SKWwUNi63osiMCqIGtr
         ILwyNBi6xZfq+CrcMdobLquZEoAkCbGtL4+qtgLmDzvOq2H8+qQnFk2T7YddizZcxv9S
         HA2CqTN1V7VEPkz6E7vvMdJOeDDWfxrePFTgK+jDZ+7OtaAscwCKhdCw0QjlcMO/Qyox
         T7yY1sKvLCk0bdMJ152dMtfE1thvcJZ29CV4x3EWFbBD2Ce8ZCtfRC8cfiJrUWVqvscp
         noWZ5Qrj3Szb8fY8hSXXowxeOcJl7HlrlQiWbL3chdgdc/p4gSaaGQuBr5KZ41+F+p5b
         3a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498499; x=1781103299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qj+PwHHlGq/ImfDVyjeim+1I3WXkpQ4SAfsILTiGNVI=;
        b=GpuX1pZkrvj4LOFxMdy7Poa8EcYksNOZydoxKyHszzuMIPL/ki1epKw7eFHb+CxQgv
         MYl9r/koVebHbhH115tFhK6ArH3IDLpzX6+ljlun1cjUlCFYMhHIrP5twpIU+8UL8Muw
         GIYn1dqAdXdkPnE09L7CKrViU/fY/rfIqbVp1ARJlDsm+u70tlP5gzGuSCbHb+CpX18l
         adSoj7oqfkmF5L+aRaqH3yoK/kvHxfcIK0QK9dx4+GKHqSptK0rXf2kr2hJ3mu1Sct99
         dJ+bKOsOjgsFZotTeCTg8w7QWDwPr/uuIG2PDprcC9VIpGNPFNbKDbbwx/vK85BqzS9i
         Aejg==
X-Forwarded-Encrypted: i=1; AFNElJ/5NgPrDEaFX0zx/q/txeC2BbL4SJqcRVl4ULQl/N4W3AWhQSjhk/GcscRkFvEBjqwEW97kZDEPyD4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFKT9lbVKJbY8r92zPm4d+8mJ84lck+IPpLw4X6RL9UB0qjNtz
	FwbG2xh8vr/etkiHmczoYS5gSZe4s4TZyKgnQeekO66OWzuG2E99KTX1KgseWrQ5ew==
X-Gm-Gg: Acq92OEzsc+/AIAdbKzBR+W8/Nfr8B39LJhONJuXxGs/3DAugwXvA3aofM9/4wgqLym
	n8jLNDkUneNYw/uwD/AqlhhMhvcSj0IDimuElpYaJxk2w5horKFL2mEMDrDfWLa4J4bxurHhsHy
	4KjVWXRQQdKsbw/YP3Ufcg0ZvihODxxJK68KSrgbUtZoMo/K3B9+jRfty6thIuMHxjB7hGP+dQ2
	avwkh2AEKYIaAednFCalt1Zb1DidGmTcd7xPNuvqTxSycHaWCjgHsl1z6e0LDI7H+FmLh/wn9hK
	hrBuDImGyCqYrpkwiUgl7VsK3edHKFl/50ND4zTmTooiXF08cqIcUC9mW1MvB687Y9oeIZ4rn1L
	p9J/9gCru6j/HCnCJ1ZV1C3VaCw0QXv3kKnxJ0reiwq4NlaloSuMaHhuw7wKgqk8lrE/j07neVi
	S2RVJVz+MLkuRbiF727hrhzEZNB/ypkXCquQO8EDJYokMH14as5IQ8QFxI12Gi7ravrtPdqU9io
	UXVWS4hsPFf4zJpojYfNGMkwQ==
X-Received: by 2002:a05:600c:c4b8:b0:490:b591:b5a3 with SMTP id 5b1f17b1804b1-490b60e9af0mr63964635e9.32.1780498499219;
        Wed, 03 Jun 2026 07:54:59 -0700 (PDT)
Message-ID: <6ec9620d-7224-49d4-860c-6e447e0534e3@suse.com>
Date: Wed, 3 Jun 2026 16:54:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/26] xen/riscv: add very early virtual APLIC (vAPLIC)
 initialization support
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
 <220cf09814744b8b8136b1e3c35ab982226d3f6f.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <220cf09814744b8b8136b1e3c35ab982226d3f6f.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1780498499-409723FF-EFC66997/0/0
X-purgate-type: clean
X-purgate-size: 5534
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 4C004638D49

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/aplic.c
> +++ b/xen/arch/riscv/aplic.c
> @@ -295,6 +295,11 @@ static void cf_check aplic_set_irq_type(struct irq_desc *desc,
>      spin_unlock(&aplic.lock);
>  }
>  
> +static unsigned int cf_check aplic_irq_num(void)
> +{
> +    return aplic_info.num_irqs;
> +}
> +
>  static const hw_irq_controller aplic_xen_irq_type = {
>      .typename     = "aplic",
>      .startup      = aplic_irq_startup,
> @@ -309,6 +314,7 @@ static const struct intc_hw_operations aplic_ops = {
>      .host_irq_type       = &aplic_xen_irq_type,
>      .handle_interrupt    = aplic_handle_interrupt,
>      .set_irq_type        = aplic_set_irq_type,
> +    .irq_nums            = aplic_irq_num,

Hook handler names and respective field names would preferably match up. It's
unclear why the field uses some kind of plural(?), while the function uses
singular.

> --- a/xen/arch/riscv/domain.c
> +++ b/xen/arch/riscv/domain.c
> @@ -11,6 +11,7 @@
>  #include <asm/bitops.h>
>  #include <asm/cpufeature.h>
>  #include <asm/csr.h>
> +#include <asm/intc.h>
>  #include <asm/riscv_encoding.h>
>  #include <asm/vtimer.h>
>  
> @@ -155,14 +156,10 @@ int arch_vcpu_create(struct vcpu *v)
>      if ( (rc = vcpu_vtimer_init(v)) )
>          goto fail;
>  
> -    /*
> -     * As interrupt controller (IC) is not yet implemented,
> -     * return an error.
> -     *
> -     * TODO: Drop this once IC is implemented.
> -     */
> -    rc = -EOPNOTSUPP;
> -    goto fail;
> +    ASSERT(v->domain->arch.vintc->ops->vcpu_init);
> +
> +    if ( (rc = v->domain->arch.vintc->ops->vcpu_init(v)) )

I don't understand this model of the use of ASSERT(). As previously said
(more than once) - you'll crash anyway if any of the involved pointers is
NULL. If you really think an up-front check is better, then why would you
check only the leaf of the pointer chain, and not also vintc and ops?
(Once you do you'll then likely notice that there are more assertions
than actual code.)

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/vaplic.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * xen/arch/riscv/vaplic.c
> + *
> + * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) Microchip.
> + */
> +
> +#ifndef ASM__RISCV__VAPLIC_H
> +#define ASM__RISCV__VAPLIC_H
> +
> +#include <xen/kernel.h>
> +#include <xen/types.h>
> +
> +#include <asm/intc.h>
> +
> +struct domain;
> +
> +#define to_vaplic(d) container_of(d->arch.vintc, struct vaplic, vintc)

d wants parenthesizing here.

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -78,6 +78,13 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>      intc_set_irq_priority(desc, priority);
>  }
>  
> +unsigned int intc_irq_nums(void)
> +{
> +    ASSERT(intc_hw_ops && intc_hw_ops->irq_nums);
> +
> +    return intc_hw_ops->irq_nums();
> +}

You use this to set domains' properties. As indicated before, I view it as
wrong to do so for any domain, besides perhaps Dom0 / hwdom. If you want to
do so nevertheless, at the very least I'd expect something to be said about
such a decision in the description.

> --- /dev/null
> +++ b/xen/arch/riscv/vaplic.c
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * xen/arch/riscv/vaplic.c
> + *
> + * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) Microchip.
> + * Copyright (c) Vates
> + */
> +
> +#include <xen/errno.h>
> +#include <xen/sched.h>
> +#include <xen/xvmalloc.h>
> +
> +#include <asm/aia.h>
> +#include <asm/imsic.h>
> +#include <asm/intc.h>
> +#include <asm/vaplic.h>
> +
> +#include "aplic-priv.h"
> +
> +#define VAPLIC_NUM_SOURCES 96
> +
> +static int cf_check vcpu_vaplic_init(struct vcpu *v)
> +{
> +    int rc = 0;

Nit: Pointless initializer.

> +    unsigned int vgein_id;
> +
> +    rc = vcpu_imsic_init(v);
> +    if ( rc )
> +        return rc;
> +
> +    if ( !(vgein_id = vgein_assign(v)) )
> +    {
> +        printk("Software interrupt files aren't supported\n");
> +        rc = -EOPNOTSUPP;
> +        goto fail;
> +    }
> +
> +    imsic_set_guest_file_id(v, vgein_id);
> +
> +    return rc;
> +
> + fail:
> +    vcpu_imsic_deinit(v);
> +
> +    return rc;
> +}
> +
> +static const struct vintc_ops vintc_ops = {
> +    .vcpu_init = vcpu_vaplic_init,
> +};
> +
> +int __init domain_vaplic_init(struct domain *d)

Why __init, and why is there no caller? Plus why is the vCPU-init a hook,
but the domain init is not? Either you mean to allow for other ICs, or
you you don't.

> +{
> +    struct vaplic *vaplic = xvzalloc(struct vaplic);
> +
> +    if ( !vaplic )
> +        return -ENOMEM;
> +
> +    d->arch.vintc = &vaplic->vintc;
> +    d->arch.vintc->ops = &vintc_ops;
> +
> +    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
> +
> +    d->arch.vintc->irq_nums = min(intc_irq_nums(),
> +                                  VAPLIC_NUM_SOURCES + 0U);
> +
> +
> +    return 0;
> +}
> +
> +void __init domain_vaplic_deinit(struct domain *d)
> +{
> +    struct vaplic *vaplic = to_vaplic(d);
> +
> +    xvfree(vaplic);
> +}

And d->arch.vintc turns into a dangling pointer. The way you arrange data
types, you can't use XVFREE() here, but imo you really want to make sure
the function is idempotent.

Jan

