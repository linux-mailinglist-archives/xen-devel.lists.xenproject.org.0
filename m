Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BXyrOgdQIGpW0wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 18:02:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C36F639852
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 18:02:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Ho90vXnb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326934.1592210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUo2X-0006Ap-09; Wed, 03 Jun 2026 16:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326934.1592210; Wed, 03 Jun 2026 16:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUo2W-00068z-T9; Wed, 03 Jun 2026 16:01:56 +0000
Received: by outflank-mailman (input) for mailman id 1326934;
 Wed, 03 Jun 2026 16:01:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUo2V-00068t-O2
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:01:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUo2V-003tZD-3N
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 18:01:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a204fe1-bab6-0a2a0a5309dd-0a2a4507b364-34
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 18:01:54 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a204ff2-229c-0a2a45070019-d155802ad0ae-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 18:01:54 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso118114185e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 09:01:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3444fesm9448957f8f.20.2026.06.03.09.01.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 09:01:53 -0700 (PDT)
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
        d=suse.com; s=google; t=1780502514; x=1781107314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+X2syB7cYzbZ3ZlszoIoK0HC1F6Fr8wnmNl87zYjKVQ=;
        b=Ho90vXnb1LTCfUneL2gEzEjNVQDrx51qHlvF4CkHAppy8TSR7HG2uv1JPnz43rwLWV
         Xb1UD3VN20Q3LvSwpRt6MNEcEs2IYXSLzYgocMVUhqtci8RNuwXwCSMvj2XME/Nh3PNU
         5TfgrfjRgmoMyPuVvlt9FPFSFVY9vE9bHJ2UlphE6MMhsqbI8p7vJBPNPuwLQkv1w5ZK
         s5FlUu2NALRQXDKG9Ee/546ifAZ9ZnqkrCGu+O65C249LgohAjAAn7bF85BbkY/L8tmv
         pjhq2J+X3yw/GvHWxAVNrJ5DwecNHZ7Ligr1i/jtkprEsQzkteA9nOCIY+nc3wiCCKs7
         Gg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780502514; x=1781107314;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+X2syB7cYzbZ3ZlszoIoK0HC1F6Fr8wnmNl87zYjKVQ=;
        b=F9aS0hD3kjhek86tNOk5HgRGAKCivbpi5g/nAwOAlQryAS4I2gaYICpvIBPZLPz1aw
         83v7g/9W9Y4cdiKOZL2ofSy9DjehVqLVhemFh9KYXR60tWSymdbR09HtFzm2Kc4bIPdw
         R3YEk8K3mF/Q6Ff+JOUzzprybapHarmNl3oru5wB5UlIivTB12ahk11ItfFrOh5oIqhg
         y2cVRlZjLSi0Mz1GMQTkrcIbVS0A7cmVx05WZpvy+A4a9/JIt0IKjcjC0KDX26x9XHB/
         WV81cHptFG4POWmqaYtXPe+Jp2MvOahfWzxNn96zGqywzM61Wbn2ttK2WqVElm0sjv5U
         DrnA==
X-Forwarded-Encrypted: i=1; AFNElJ/DkhK5/rsoGvt/b4iscASiJs9+0iKV8HnxZSeeFYN/+/PJjD5IXKyrEJ+Jh+uvEvtKxaGLg95BIEo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVwSu4OdA0dk/EkKqd/f14paopxXOU/1mE17Evxbi/jRv9t34O
	0H+Sl9yEJTWzBoywWsWZ49b8UFSBBxyqSCpdrGj4QUvtwwUoh5mLhTvSvksIt5XS6Q==
X-Gm-Gg: Acq92OFdkP7dfdHo68c7i1vw27T3zIWk+kyd6Mhr4SL8yTrgw9mNn/5ambmQ+He2+Wb
	nwIxW6Xd2sqlz7ZWr57BMFmZlkJsPaJ/gTObKTL/84wAk16c6j6QXKn6F/gHw5XYijRbUGSq/6z
	8J2gOpvw3SUTTwckJ0IsZTs7GwIzejmN76ygEv7XtUOerKL77ZzvMpvpG3Vt8c9nT5M+/To+DSM
	0+DHC9gy1RZrZ+GaOeqEYUcaVUuv6e5LV+jabkEMKtMp9b9Lb1S5IzA3Xl+oqY6n09jWWTjhQKh
	88828pu4Z5pudyObD/kJtTQWJrzSq8tDPXP7zuHmXgaa2HeFZj0P6JjGU4G5UD2o3pMBge80emx
	5fXO274A2Jq9CvaoGlSEKaO1FTNxJcqh0yBMBwLongKT72zdUqTUFFrh6D2bH4kKNVqQ63OXcMz
	Yhx0YqbPDKWfrWkpiB9onnKiEumx0xIP2GWOQBrnXB+NajJvuIUP24VaBdllmNiX455DqUHB6v2
	dSptJsywO2BTS0ZXU9GtjS0BiWeuexn60Vh
X-Received: by 2002:a05:600c:46ce:b0:490:b4e5:ce7e with SMTP id 5b1f17b1804b1-490b5edcbe3mr60334435e9.25.1780502514216;
        Wed, 03 Jun 2026 09:01:54 -0700 (PDT)
Message-ID: <1941ee36-cbfd-4d7f-a15b-e74843371f3b@suse.com>
Date: Wed, 3 Jun 2026 18:01:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/26] xen/riscv: implement IRQ routing for device
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
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
 <ed5218e94790ff8de36af12852605454606a6d80.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ed5218e94790ff8de36af12852605454606a6d80.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1780502514-0BB78C48-C93811CC/0/0
X-purgate-type: clean
X-purgate-size: 10819
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
X-Rspamd-Queue-Id: 9C36F639852

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/device.c
> @@ -0,0 +1,108 @@
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
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);

Nit: Drop the first "to"?

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
> +    unsigned int i, nirq;
> +    int res, irq;
> +    struct dt_raw_irq rirq;

Move the latter three variables to the loop's scope and ...

> +    nirq = dt_number_of_irq(dev);

... make this the variable's initializer?

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
> +        res = map_irq_to_domain(d, irq, need_mapping, dt_node_name(dev));
> +        if ( res )
> +            return res;
> +
> +
> +        /*
> +         * At the moment there is only one user of map_device_irqs_to_domain()
> +         * for RISC-V which calls it irq_ranges == NULL.
> +         */
> +        if ( irq_ranges )
> +            return -EOPNOTSUPP;

Why is this checked last, and inside the loop (when it's loop invariant)?

> --- a/xen/arch/riscv/include/asm/intc.h
> +++ b/xen/arch/riscv/include/asm/intc.h
> @@ -13,8 +13,11 @@ enum intc_version {
>  };
>  
>  struct cpu_user_regs;
> +struct domain;

I can spot why this is needed, but ...

> +struct dt_device_node;
>  struct irq_desc;
>  struct kernel_info;
> +struct rangeset;
>  struct vcpu;

... I'm at a loss to explain the need for these two additions.

> --- a/xen/arch/riscv/include/asm/setup.h
> +++ b/xen/arch/riscv/include/asm/setup.h
> @@ -5,6 +5,10 @@
>  
>  #include <xen/types.h>
>  
> +struct domain;
> +struct dt_device_node;
> +struct rangeset;

Same here - why would they be needed when you make no other changes
to this header?

> --- a/xen/arch/riscv/intc.c
> +++ b/xen/arch/riscv/intc.c
> @@ -7,7 +7,9 @@
>  #include <xen/init.h>
>  #include <xen/irq.h>
>  #include <xen/lib.h>
> +#include <xen/sched.h>
>  #include <xen/spinlock.h>
> +#include <xen/xvmalloc.h>
>  
>  #include <asm/aia.h>
>  #include <asm/intc.h>
> @@ -86,6 +88,22 @@ unsigned int intc_irq_nums(void)
>      return intc_hw_ops->irq_nums();
>  }
>  
> +int intc_route_irq_to_guest(struct irq_desc *desc,
> +                            unsigned int priority)
> +{
> +    ASSERT(spin_is_locked(&desc->lock));
> +
> +    ASSERT(intc_hw_ops->guest_irq_type);
> +
> +    desc->handler = intc_hw_ops->guest_irq_type;
> +    set_bit(_IRQ_GUEST, &desc->status);

Is desc->status accessed anywhere without holding desc->lock? If not,
__set_bit() or simply |= ?

> @@ -112,6 +130,14 @@ int domain_vintc_init(struct domain *d)
>          break;
>      }
>  
> +    if ( !ret )
> +    {
> +        d->arch.vintc->allocated_irqs =
> +            xvzalloc_array(unsigned long, BITS_TO_LONGS(d->arch.vintc->irq_nums));
> +        if ( !d->arch.vintc->allocated_irqs )
> +            ret = -ENOMEM;
> +    }
> +
>      return ret;
>  }
>  
> @@ -129,4 +155,14 @@ void domain_vintc_deinit(struct domain *d)
>          printk("vintc (ver:%d) isn't implemented\n", ver);
>          break;
>      }
> +
> +    xvfree(d->arch.vintc->allocated_irqs);
> +}

XVFREE()

> +bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
> +{
> +    if ( virq >= d->arch.vintc->irq_nums )
> +        return false;
> +
> +    return !test_and_set_bit(virq, d->arch.vintc->allocated_irqs);
>  }

As to function / field naming: You don't look to be allocating IRQs. So
is there a reason the field name gives the impression of allocation?
Simply s/allocated/used/ or some such?

> @@ -221,3 +239,160 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
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
> +
> +void release_irq(unsigned int irq, const void *dev_id)
> +{
> +    struct irq_desc *desc;
> +    unsigned long flags;
> +    struct irqaction *action, **action_ptr;
> +
> +    desc = irq_to_desc(irq);
> +
> +    spin_lock_irqsave(&desc->lock,flags);
> +
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
> +#endif
> +
> +    /* If this was the last action, shut down the IRQ */
> +    if ( !desc->action )
> +    {
> +        desc->handler->shutdown(desc);
> +        clear_bit(_IRQ_GUEST, &desc->status);
> +    }
> +
> +    spin_unlock_irqrestore(&desc->lock,flags);
> +
> +    /* Wait to make sure it's not being used on another CPU */
> +    do { smp_mb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );
> +
> +    if ( action->free_on_release )
> +        xvfree(action);

When !IRQ_HAS_MULTIPLE_ACTION desc->action becomes a dangling pointer here.

> +/* Route an IRQ to a specific guest */
> +int route_irq_to_guest(struct domain *d, unsigned int virq,
> +                       unsigned int irq, const char *devname)
> +{
> +    struct irqaction *action;
> +    struct irq_guest *info;
> +    struct irq_desc *desc;
> +    unsigned long flags;
> +    int retval = 0;
> +
> +    desc = irq_to_desc(irq);
> +
> +    action = xvmalloc(struct irqaction);
> +    if ( !action )
> +        return -ENOMEM;

This is freed by release_irq(), but ...

> +    info = xvmalloc(struct irq_guest);
> +    if ( !info )

... where is the (non-error-path) freeing of this?

> +    {
> +        xvfree(action);
> +        return -ENOMEM;
> +    }
> +
> +    info->d = d;
> +    info->virq = virq;
> +
> +    action->dev_id = info;
> +    action->name = devname;
> +    action->free_on_release = 1;

true

> +    spin_lock_irqsave(&desc->lock, flags);
> +
> +    /*
> +     * If the IRQ is already used by someone
> +     *  - If it's the same domain -> Xen doesn't need to update the IRQ desc.
> +     *  For safety check if we are not trying to assign the IRQ to a
> +     *  different vIRQ.
> +     *  - Otherwise -> For now, don't allow the IRQ to be shared between
> +     *  Xen and domains.
> +     */
> +    if ( desc->action != NULL )
> +    {
> +        if ( test_bit(_IRQ_GUEST, &desc->status) )
> +        {
> +            struct domain *ad = irq_get_domain(desc);
> +
> +            if ( d != ad )
> +            {
> +                printk(XENLOG_G_ERR "IRQ %u is already used by domain %u\n",
> +                       irq, ad->domain_id);
> +                retval = -EBUSY;
> +            }
> +            else if ( irq_get_guest_info(desc)->virq != virq )
> +            {
> +                printk(XENLOG_G_ERR
> +                       "d%u: IRQ %u is already assigned to vIRQ %u\n",
> +                       d->domain_id, irq, irq_get_guest_info(desc)->virq);

Please can you get used to using %pd?

> +                retval = -EBUSY;
> +            }
> +        }
> +        else
> +        {
> +            printk(XENLOG_G_ERR "IRQ %u is already used by Xen\n", irq);
> +            retval = -EBUSY;
> +        }
> +        goto out;
> +    }
> +
> +    retval = _setup_irq(desc, 0, action);
> +    if ( retval )
> +        goto out;
> +
> +    retval = intc_route_irq_to_guest(desc, IRQ_NO_PRIORITY);
> +
> +    spin_unlock_irqrestore(&desc->lock, flags);
> +
> +    if ( retval )
> +    {
> +        release_irq(desc->irq, info);

Is de-referencing desc legitimate / race free with desc->lock not held?

Jan

