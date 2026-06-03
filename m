Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FVI4LH9GIGqZzwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:21:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161CE6391B4
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 17:21:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=V7mgEuJO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1326883.1592165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnP7-00041n-1M; Wed, 03 Jun 2026 15:21:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326883.1592165; Wed, 03 Jun 2026 15:21:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUnP6-0003yz-Ud; Wed, 03 Jun 2026 15:21:12 +0000
Received: by outflank-mailman (input) for mailman id 1326883;
 Wed, 03 Jun 2026 15:21:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUnP5-0003ys-S2
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:21:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUnP4-004MOB-Ok
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 17:21:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a204656-5cb7-0a2a0a5109dd-0a2a450bd9c0-42
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:21:10 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a204666-212f-0a2a450b0019-d155802bd06e-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 17:21:10 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso117569525e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:21:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc23394asm412355e9.0.2026.06.03.08.21.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 08:21:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1780500070; x=1781104870; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PvxM07sqjaEJH3eRQ4iM6WjkpZsLfP2/5/ebD2uOcJ4=;
        b=V7mgEuJOcT6qdcT3Awe4AK6XioBW0txqy0Pn6PdXZ1jk6yWEBlxBjFFmllu3dMLVMp
         nXZs5Q0CrCVq5liVqCSBRu01hGeBZ6rsP4WALmXnXKUO7u+N7/pE/IeudLEUWVJkUyq7
         oLFfmYAxDdb34aHf0PSFs5nrJHxV7OkI93lsow/2QY6NTz8Iu5hSz59fqf+1WZc3kbqj
         j8dUNm8ceOvwLyaAS9+AG8q1Vc7qEWi9MBMzy3WTm7eI5RbFrZwu4SX3wals8dot/cNI
         8/Toi0CCTayyYNbAs69tNu1OefkNGxsCDnlMwE5v3gI9Ly2mZVY9nkp8EjVcZ/D4wShq
         MCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780500070; x=1781104870;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvxM07sqjaEJH3eRQ4iM6WjkpZsLfP2/5/ebD2uOcJ4=;
        b=g3iSX7k9TxjiuIBpJqqvglrFphwknxhgCpDpRq+V6WviVtVMOeQtHi8TAivANtVq+E
         ua9FanXgSaetiJcmWNTpSpZ4QFTX3wYub1HAUSmG7boOkNGu0O8D+GfS5pfTZ6idNtyD
         wgQmSoU8gZ79HZirOZuGItaUM8Yi6k0Cgha5MrxIRQls1dQ/IZz3l3ErkM4xnijVH6GZ
         eZIQC+nmNhI2gAyCc7FOieSEhSB9Fk1vMoS6W5EiSbUBZeoi++X5MNX7Hp2HnqE9UlYP
         jrb+gwd7gzYLsyvDxajE8FwjQVnCj2YddYiLjasD1uOat7UsDF6sELi2+ZHCI9Njj2uw
         RKFw==
X-Forwarded-Encrypted: i=1; AFNElJ8ru8XyIir3S+Gx3ZtfyxD6XQd4n5QPrC+4d9aOffolIWbQ8MBd9afBHuh/ZLBe52SUTrSVRlpND3c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmQgn8+huQjir+D/3iis90cMYfjdKTkqHOu+WxUesy/jnMVX4X
	/AFzY2tETGj4tRu6/tBRJZY9x6BbDpslsCGqAzC5YewaVqCz3//yVConcs0+sRGT0w==
X-Gm-Gg: Acq92OE5/a8DGhRjZaXGjpFU2vfqTEYRPrfkfhflViAtW/1DWD+Knfnh8VBel3sMflM
	NvR5TDOKQa01W3kng2HD9VsTkcHBEyhkcFAtkUZbFHpwhpuS4+mYkyGRlc5jS+ryCITTpcNn64m
	gTy7Z6P7Rc8hFZnmMlCiRoI/1VB0c0l/IzvkbdjdkB7BmLlZhZUFVvz9mNZDjzHXgGwQAwczdoY
	Pc48FWen0RZ6aY34AYZ2qR1q4V4LAbezFFA/6TK4GHeme2OVHs2K/dZX9D1D+xaVSj2bLYWs4mP
	wrOhK+1hQcjcyxFulMqFZFzX63xqY7KJEpAOKtP9nQAMdStHQ7c2gfj8nElKBQPt0wVhdDuKVVs
	rVmPTwxU3zzknxyor7C2D20tD42QdyBChcRXve7wyxfWWjhtvXSwA3lK7qTJeI+/ZGBwpTvYnUW
	sev4kmKpx7zpJceaxk98P2LLqvGPBDjy2s00ltBAwBFAkMEgXC93qvyBBwvkL9qXgOpAc62mncT
	xRuvEH6VM4hVrOT1tugxSkctw==
X-Received: by 2002:a05:600c:3552:b0:48a:563c:c8e2 with SMTP id 5b1f17b1804b1-490b5e73ef3mr58249925e9.3.1780500070003;
        Wed, 03 Jun 2026 08:21:10 -0700 (PDT)
Message-ID: <3da2f796-4dc7-408a-9ec9-f0e8bb02b1a9@suse.com>
Date: Wed, 3 Jun 2026 17:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/26] xen/riscv: generate IMSIC DT node for guest
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
 <19d30d3c34a6ac9aeb668e1fc56301620b177db0.1778250616.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <19d30d3c34a6ac9aeb668e1fc56301620b177db0.1778250616.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1780500070-13F7EF3B-3117D490/10/73395122804
X-purgate-type: spam
X-purgate-size: 4512
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,microchip.com:email,suse.com:mid,suse.com:from_mime,suse.com:dkim];
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
X-Rspamd-Queue-Id: 161CE6391B4

On 08.05.2026 16:43, Oleksii Kurochko wrote:
> Guests using the IMSIC interrupt controller require a corresponding
> Device Tree description.
> 
> Add support for generating an IMSIC node when building the guest DT.
> This allows guests to discover and use the IMSIC interrupt controller.
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>  - s/imsic_make_reg_property/guest_imsic_make_reg_property.
>  - s/imsic_set_interrupt_extended_prop/guest_imsic_set_interrupt_extended_prop.
>  - Use initalizer for regs[] array in imsic_make_reg_property().
>  - Move buf[] insde the for() loop.
>  - Correct check of returned phandle.
>  - Drop local variable len.
>  - /s/XVFREE/xvfree in imsic_set_interrupt_extended_prop().
>  - Drop initializer for local variable data.
>  - s/uint32_t/unsinged int for pos and cpu in imsic_set_interrupt_extended_prop().
>  - Drop next_phandle as it is now in common code.
>  - Introduce vcpu_imsic_deinit.
>  - Refactor vimsic_make_domu_dt_node() to avoid usage of host IMSIC dt node.
> ---
>  xen/arch/riscv/imsic.c                    | 127 +++++++++++++++++++++-
>  xen/arch/riscv/include/asm/guest-layout.h |   2 +
>  2 files changed, 128 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> index ceea6778d9dc..19cbacdf96e1 100644
> --- a/xen/arch/riscv/imsic.c
> +++ b/xen/arch/riscv/imsic.c
> @@ -13,9 +13,12 @@
>  #include <xen/const.h>
>  #include <xen/cpumask.h>
>  #include <xen/device_tree.h>
> +#include <xen/domain.h>
>  #include <xen/errno.h>
> +#include <xen/fdt-domain-build.h>
>  #include <xen/fdt-kernel.h>
>  #include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
>  #include <xen/macros.h>
>  #include <xen/sched.h>
>  #include <xen/smp.h>
> @@ -35,6 +38,11 @@ static struct imsic_config imsic_cfg = {
>      .lock = SPIN_LOCK_UNLOCKED,
>  };
>  
> +static unsigned int __ro_after_init guest_num_msis;

How come this is __ro_after_init, when it's ...

> @@ -291,6 +299,11 @@ static int imsic_parse_node(const struct dt_device_node *node,
>          return -ENOENT;
>      }
>  
> +    if ( dt_property_read_u32(node, "riscv,num-guest-ids", &tmp) )
> +        guest_num_msis = tmp;
> +    else
> +        guest_num_msis = imsic_cfg.nr_ids;

... written by a non-__init function? Plus are you again inheriting a host
property into guests without saying why?

> @@ -524,8 +537,120 @@ int __init imsic_init(const struct dt_device_node *node)
>      return rc;
>  }
>  
> +static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)

Same question again as to __init throughout here.

> +{
> +    paddr_t base_addr = GUEST_IMSIC_S_BASE;

So you make a local variable for a constant, ...

> +    __be32 regs[4] = {
> +        cpu_to_be32(base_addr >> 32),
> +        cpu_to_be32(base_addr),
> +        cpu_to_be32((IMSIC_MMIO_PAGE_SZ * d->max_vcpus) >> 32),
> +        cpu_to_be32(IMSIC_MMIO_PAGE_SZ * d->max_vcpus),

... but this non-constant expression is spelled out twice.

> +static int __init guest_imsic_set_interrupt_extended_prop(struct domain *d,
> +                                                          void *fdt)
> +{
> +    unsigned int cpu, pos = 0;
> +    uint32_t phandle;
> +    uint32_t *irq_ext;

Doesn't this want to be __be32, seeing ...

> +    int res;
> +
> +    irq_ext = xvzalloc_array(uint32_t, d->max_vcpus * 2);
> +    if ( !irq_ext )
> +        return -ENOMEM;
> +
> +    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
> +    {
> +        char buf[64];
> +
> +        snprintf(buf, sizeof(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
> +        phandle = fdt_get_phandle(fdt, fdt_path_offset(fdt, buf));
> +
> +        if ( !phandle )
> +        {
> +            res = -ENODEV;
> +            goto out;
> +        }
> +
> +        irq_ext[pos++] = cpu_to_be32(phandle);
> +        irq_ext[pos++] = cpu_to_be32(IRQ_S_EXT);

... this?

Also, just like "buf", "phandle" can be local to this loop's body.

> --- a/xen/arch/riscv/include/asm/guest-layout.h
> +++ b/xen/arch/riscv/include/asm/guest-layout.h
> @@ -5,6 +5,8 @@
>  
>  #define GUEST_APLIC_S_BASE 0xd000000
>  
> +#define GUEST_IMSIC_S_BASE 0x28000000
> +
>  #define GUEST_RAM_BANKS   2

Is this going to become an unannotated collection of (seemingly) random
numbers?

Jan

