Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HLgOn5fzmnvnAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 14:22:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 520D3388FDC
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 14:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271802.1559832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8H3n-0002iI-Ah; Thu, 02 Apr 2026 12:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271802.1559832; Thu, 02 Apr 2026 12:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8H3n-0002fr-86; Thu, 02 Apr 2026 12:22:07 +0000
Received: by outflank-mailman (input) for mailman id 1271802;
 Thu, 02 Apr 2026 12:22:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8H3m-0002fk-7t
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 12:22:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8H3l-004yf9-EW
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 14:22:05 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce5f6c-5cb7-0a2a0a5109dd-0a2a4503cde2-6
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 14:22:05 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce5f6c-02b3-0a2a45030019-d1558035b812-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 14:22:05 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48891776099so7015075e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 05:22:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e80a5e2sm186986815e9.1.2026.04.02.05.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 05:22:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775132524; x=1775737324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b1vGARey5N3YvRifc1YXop3C+THVXVRbO3vO8dDWXhg=;
        b=HokUVfdU8gamttq4qju5al1Fx1oxvTq5AWrBO2uBGyGRPQJwHhg98uteVRc8bCB19Y
         92MNNQUVSCKn972wRTgP5xA1vYhEiXqp+Vqi96bmM1DqNAy6DUXw+pNfcZR7hryHrZw3
         Ppm4uGnsGQy5v0lvQ66+EaWmIKok3e9Z8cJ6l1TYgLW2SOYJNbkMXOWYzBidT36Ct53C
         vq3+h+jcYmpUCDIbnWHoNE+gNp53CtrrXo7SWNAuzIH7TxzJJJOtazopiw50rIMI6055
         L5MGE9LW6LII/ASmDDzxkyFyhd8dWWkxqVv63nGD0yN4rI1LyCxaYmXVeBPwGHlsVWyA
         y4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132524; x=1775737324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1vGARey5N3YvRifc1YXop3C+THVXVRbO3vO8dDWXhg=;
        b=K42LNAcmwblQbgcePebq3R+ThBk3ZQSXI4N+kbQbf9tkAe/3prpzNuRjfa5tq3FAZY
         dpWMOfKT/PHEi9fTuVPLMq0R5pbDJ33/4jeuRgnxlOLTksTNqaLQ6iPYk7I/7YzO16Rj
         5n4ERDe32Cd+T4gibnplpbqA8euqS6aZAgxM3aPeUPNNlQQQcrlSgv7B64QY6De4l+za
         VISAkhEM+Gh+3nTpX8M2mFkil/DhPbL5VDBU2JVp95OJUQV5b3E4rddTxMYsbC2axZAM
         h16wi7l5IgpJnyTYD/sVmq/SsQv/EFAvCEEtKMQHRHXWFLxma7khLpTN236deVQs/4JZ
         1sdA==
X-Forwarded-Encrypted: i=1; AJvYcCWVl2VFmtoVxzWxDTgpBcUzrEulJ3QbqtBXZlz6CO+NZLvh3o8lnpVk358Hps1bNHmXSAAou+fdgOg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxjMMJ0omHy9g2rEVW0PW+u+Vr/LOtn0FKuRJtKySyZLUOuBbyf
	XVF79NGuRZmDjvGdvmFQd0qtDO8yOUkbPxbXqEuINpkVtOUOQVtOrEYejqC5odFdhQ==
X-Gm-Gg: ATEYQzyJrUtCoF4ttAQAOzweoKeZf3fQ9H7jG++EbLRE2xhn7Chz7hOtfg+vFFlawpt
	2zamHusnQKHsq1qhue99r83FyBaFQDKch8yR3pVx8DSEnOglzk+7sLvcih4qerUofHUA1KjRJCz
	AO9KZPv/efHIxIRw4Hip9CRarSdMn0GJHHsIGS+rPeDACAfxdO+r1Ej1cbqXRHzZ7xURy/Tw0/5
	fu6zPHRH9roH3P0TcSU8h0ODhpZSzjkLUq4kPFfU16j3UG8fA+ODlUf1fsglyPDkJo1ZI5kDHeR
	cfEcBAO99viEMWVcp/pwTiTEayzfjTob74EgKp7sHZvu6aXo/fGmOmbxcMVRCR0pKDrj9C4oovJ
	OHEZKh3l4/UKHQnshsO5fCMoHpZcrudC4TuA24oQkJ6iUAF0dNHsa9QLsF9w3J01wkfttXVIXjU
	0GLx5TOq0ew69xuqsIMUEZ8PqrB2L7vCz9rfqOVAlOmVwjhgasUXf/1gFyFHi0y4OSMV4XP5c7M
	m8QhKbtyB5OlyA=
X-Received: by 2002:a05:600c:1d29:b0:485:3b50:fe54 with SMTP id 5b1f17b1804b1-4888b7129f6mr59190215e9.11.1775132524439;
        Thu, 02 Apr 2026 05:22:04 -0700 (PDT)
Message-ID: <8a8a2afd-6f53-4f45-b8c8-fb34a6fbb970@suse.com>
Date: Thu, 2 Apr 2026 14:22:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 16/27] xen/riscv: implement IRQ mapping for device
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
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <10654a6c38fa929b5fdf6f214badfe4f60fe78d4.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <10654a6c38fa929b5fdf6f214badfe4f60fe78d4.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1775132525-40B6DC9A-B9543FF6/0/0
X-purgate-type: clean
X-purgate-size: 6213
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 520D3388FDC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/setup.h
> +++ b/xen/arch/riscv/include/asm/setup.h
> @@ -5,6 +5,10 @@
>  
>  #include <xen/types.h>
>  
> +struct domain;
> +struct dt_device_node;
> +struct rangeset;
> +
>  #define max_init_domid (0)
>  
>  void setup_mm(void);
> @@ -13,6 +17,19 @@ void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
>  
>  void init_csr_masks(void);
>  
> +/* TODO: move somewhere to common header? */

Counter question: Why ...

> +/*
> + * Retrieves the interrupts configuration from a device tree node and maps
> + * those interrupts to the target domain.
> + *
> + * Returns:
> + *   < 0 error
> + *   0   success
> + */
> +int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
> +                              bool need_mapping,
> +                              struct rangeset *irq_ranges);

... is this not an inline function, when ...

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -79,3 +79,11 @@ int __init intc_make_domu_dt_node(const struct kernel_info *kinfo)
>  
>      return -ENOSYS;
>  }
> +
> +int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
> +                              bool need_mapping,
> +                              struct rangeset *irq_ranges)
> +{
> +    return d->arch.vintc->ops->map_device_irqs_to_domain(d, dev, need_mapping,
> +                                                         irq_ranges);
> +}

... it's merely a wrapper around an indirect function call? And then the
function isn't used anywhere anyway.

> --- a/xen/arch/riscv/vaplic.c
> +++ b/xen/arch/riscv/vaplic.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <xen/errno.h>
> +#include <xen/iocap.h>
>  #include <xen/sched.h>
>  #include <xen/xvmalloc.h>
>  
> @@ -19,6 +20,113 @@
>  
>  #include "aplic-priv.h"
>  
> +struct vaplic_priv {
> +    /* Contains a legal interrupts for a domain */
> +    uint32_t auth_irq_bmp[APLIC_NUM_REGS];
> +};

With it apparently plural that is correct, the first "a" wants dropping
from the comment.

> +static bool is_irq_shared_among_domains(const struct domain *d,
> +                                        const unsigned int irq_num)
> +{
> +    struct domain *tmp;

const

> +    unsigned int reg_num = irq_num / APLIC_NUM_REGS;
> +    unsigned int bit_pos = irq_num % APLIC_NUM_REGS;
> +
> +    for_each_domain ( tmp )

See other uses of the construct for how this needs synchronizing. But looping
over all domains looks pretty inefficient anyway for ...

> +    {
> +        uint32_t *auth_irq_bmp;
> +
> +        if ( tmp == d )
> +            continue;
> +
> +        auth_irq_bmp = tmp->arch.vintc->private;
> +
> +        if ( auth_irq_bmp[reg_num] & BIT(bit_pos, U) )
> +        {
> +            printk("%s: irq%d is shared between %pd and %pd\n", __func__,
> +                   irq_num, tmp, d);
> +
> +            return true;
> +        }

... the intended purpose. If IRQs can't be shared, can't you maintain global
state of which ones are in use _somewhere_?

> +    }
> +
> +    return false;
> +}

This together with ...

> +int vaplic_map_device_irqs_to_domain(struct domain *d,
> +                                     struct dt_device_node *dev,
> +                                     bool need_mapping,
> +                                     struct rangeset *irq_ranges)
> +{
> +    unsigned int i, nirq;
> +    int res, irq;
> +    struct dt_raw_irq rirq;
> +    uint32_t *auth_irq_bmp = d->arch.vintc->private;
> +    unsigned int reg_num;
> +
> +    nirq = dt_number_of_irq(dev);
> +
> +    /* Give permission and map IRQs */
> +    for ( i = 0; i < nirq; i++ )
> +    {
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
> +        if ( rirq.controller != dt_interrupt_controller )
> +        {
> +            dt_dprintk("irq %u not connected to primary controller."
> +                       "Connected to %s\n", i,
> +                       dt_node_full_name(rirq.controller));
> +            continue;
> +        }
> +
> +        irq = platform_get_irq(dev, i);
> +        if ( irq < 0 )
> +        {
> +            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
> +            return irq;
> +        }
> +
> +        res = irq_permit_access(d, irq);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d,
> +                   irq);

This time the other way around: %d please with plain int. (Again at least
once further down.)

> +            return res;
> +        }
> +
> +        reg_num = irq / APLIC_NUM_REGS;
> +
> +        if ( is_irq_shared_among_domains(d, irq) )
> +        {
> +            printk("%s: Shared IRQ isn't supported\n", __func__);
> +            return -EINVAL;
> +        }
> +
> +        auth_irq_bmp[reg_num] |= BIT(irq % APLIC_NUM_REGS, U);

... all of this leaves me with the impression that IRQ numbering isn't really
virtualized. IRQs are merely split into groups, one group per domain (and
maybe some unused). How are you going to fit in truly virtual IRQs?

> +        dt_dprintk("  - IRQ: %u\n", irq);
> +
> +        if ( irq_ranges )
> +        {
> +            res = rangeset_add_singleton(irq_ranges, irq);
> +            if ( res )
> +                return res;
> +        }

What is irq_ranges?

> @@ -34,6 +142,7 @@ static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
>  
>  static const struct vintc_ops vaplic_ops = {
>      .vcpu_init = vcpu_vaplic_init,
> +    .map_device_irqs_to_domain = vaplic_map_device_irqs_to_domain,
>  };

What about the inverse function, needed for domain cleanup?

Jan

