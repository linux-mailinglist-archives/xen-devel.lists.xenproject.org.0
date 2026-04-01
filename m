Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBL6Bn40zWlwawYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 17:06:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C35237CAEC
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 17:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270606.1559230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7x8k-0007Jy-C8; Wed, 01 Apr 2026 15:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270606.1559230; Wed, 01 Apr 2026 15:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7x8k-0007IY-9E; Wed, 01 Apr 2026 15:05:54 +0000
Received: by outflank-mailman (input) for mailman id 1270606;
 Wed, 01 Apr 2026 15:05:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7x8j-0007IS-Ea
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 15:05:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7x8i-00BwTF-Lh
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 17:05:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd3437-2eae-0a2a0a5409dd-0a2a450b94c4-36
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 17:05:52 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd3450-bca8-0a2a450b0019-d1558029d0a6-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 17:05:52 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48702d51cd0so82594525e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 08:05:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e56fesm356141f8f.27.2026.04.01.08.05.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 08:05:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1775055952; x=1775660752; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+iaDKuOi3FwVgN1qeXcXFnW7xUHsI7m5CwiI2dqvb60=;
        b=BVDhYstAWoFUcJKyRnGq1Fzq2OGetRnPWuo8bR5txLvK4oJS0pHyGCAWj/mPXhrERr
         50Bi6fCQJEIhh6D+YysC41S+S3Z2spzgvThC9kJ1lF72mxi0IevCvusdQnBF5V+YMSPE
         WzTGADfl7r8L20Y4M20pmlpqAn9qumt7mcxoFztcn8a2TgWono3KNcTvCATfgDf0sZNu
         WCvRS7Gj9iaRiMdPz5o5GeHxHAG/u7UtWLPIl59gagY1R2AVUNNlABqevubVYhKjy6Sx
         BoBeeVKEXW2/LU+q3085wQz51kCIb0lLUfqM4ZB4dmwCXIENyEfzFYvMsPPtDpqwkkzQ
         BjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775055952; x=1775660752;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+iaDKuOi3FwVgN1qeXcXFnW7xUHsI7m5CwiI2dqvb60=;
        b=fnMNvKJQ7lVAymktg0Ck0h8ZrzvbopjS0IH6tC5uEOp6V6NxX9VSjTUadyh4nD/S0O
         nNsoQ+85J+431PJ28CnwwOHmO9n3V+y+KAomMHPI3RA99aHAwrIGOns8XVl0KxQUUWX7
         5ucxXt0mq/++/+zgkDlAExOrtQYDh1gSF2w5SNH7YoF6/EEt6OcP5SYMU5LQbtwwjV9R
         aMaJWC9i/7FdZLp8gP0+89jF0PSu//FpchUMYtg+XUgV1fkF+TySSvhGDPQ6/a7W1dMV
         Sz9/xmiszr/PdxiaGnAp2AvCEMXykfRRz063/9Cr236X2Nx3jNzXRU3cQD/AL4OByC9m
         PiCg==
X-Forwarded-Encrypted: i=1; AJvYcCUD7/fGVbrRs9LtzYv7nI9f7GDMLzYVrUC3XClEiMC3ru/rfpx6w4VsynTN+td/esyYaAZ5I9OhKo8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyojg8egRG/YVM0TwvfgNhLxHc1+r+RyM8s1G2Kue9g/cqNeYPP
	wVouUduLhw5Y1fGzih6WybR9Wn35dWtaskg/mk65BYalNzcTlCLfuZI3s8C2PqPTlA==
X-Gm-Gg: ATEYQzym6tk0xBJKqzLtFXSIjDuI3DI0PvGg7T4KjPPZa/17lVOtovsrnnEwYo/R0iB
	1bkN1IpALD8QOB7wWozTl+SC0mbDZRpHaYW+5rsf4Za1FRXkvZhRkBGKUe9BsshjOaTFwSxT5lW
	WBy2JxjmbvVflAMWyTdKIYUEnKf5QISzmn/Qx8DkeRw7Da3WKjUomhizQ3R7ezamxojbau5AsoJ
	qbYlpfYKUIRQqTKUjjiGB1qVBuD0tehIMiVJiFptE9UYFwByv0qxbY33GFeNiJk/5w12nInH60v
	CXir0kh3Apzsag+5a75SFzCsXbmN2kjwFYJTueLOqX5UH2uLiInRlgWXXR9Z8S7zvP1YaDtOWcm
	dy/KhiBzrruFhXnm8ANsLzwKn83VgqAbe6cG3taGXVIDQaVgSX6hCRQuga+7GwRJK5ElUnsol0w
	x1bsI2l+Lfs/Q58Xe8PqAUxaHSeqmrM892G2VlEUAwTRXx0+dK+OUc47uYWVtl31A0IcYGSqyXm
	a9/B3nBKOCgQmw=
X-Received: by 2002:a05:600c:46d3:b0:485:f1d1:8f3d with SMTP id 5b1f17b1804b1-4888355e820mr65800625e9.6.1775055951859;
        Wed, 01 Apr 2026 08:05:51 -0700 (PDT)
Message-ID: <93e8407e-cff0-42cc-8cfd-2d82f536a886@suse.com>
Date: Wed, 1 Apr 2026 17:05:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/27] xen/riscv: generate IMSIC DT node for guest
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
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <8154eae081d14da89f27bad581270cc5bba6ccfc.1773157782.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8154eae081d14da89f27bad581270cc5bba6ccfc.1773157782.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775055952-EC9592A1-5420D53C/0/0
X-purgate-type: clean
X-purgate-size: 4271
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
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7C35237CAEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 18:08, Oleksii Kurochko wrote:
> Guests using the IMSIC interrupt controller require a corresponding
> Device Tree description. Add support for generating an IMSIC node when
> building the guest DT.
> 
> Keep a reference to the host IMSIC DT node and reuse its compatible
> property while constructing the guest-visible node.

Again raises a migration concern. Presumably a guest would then be able
to migrate only to other hosts with the same compatible property.

> @@ -487,3 +492,111 @@ int __init imsic_init(const struct dt_device_node *node)
>  
>      return rc;
>  }
> +
> +static int __init imsic_make_reg_property(struct domain *d, void *fdt)
> +{
> +    __be32 regs[4];
> +
> +    regs[0] = cpu_to_be32(imsic_cfg.base_addr >> 32);
> +    regs[1] = cpu_to_be32(imsic_cfg.base_addr);
> +    regs[2] = cpu_to_be32((IMSIC_MMIO_PAGE_SZ * d->max_vcpus) >> 32);
> +    regs[3] = cpu_to_be32(IMSIC_MMIO_PAGE_SZ * d->max_vcpus);

Might be nice to encode as an initializer of the array variable. There don't
look to be any side effects in the expressions used, so Misra should take no
issue with this.

> +    return fdt_property(fdt, "reg", regs, sizeof(regs));
> +}
> +
> +static int __init imsic_set_interrupt_extended_prop(struct domain *d,
> +                                                    void *fdt)
> +{
> +    uint32_t len = 0, pos = 0, cpu, phandle;

At least pos and cpu should be of fixed width types.

> +    uint32_t *irq_ext;
> +    char buf[64];

Move this one into the loop's scope?

> +    int res;
> +
> +    irq_ext = xvzalloc_array(uint32_t, d->max_vcpus * 2);
> +    if ( !irq_ext )
> +        return -ENOMEM;
> +
> +    for ( cpu = 0; cpu < d->max_vcpus; cpu++ )
> +    {
> +        snprintf(buf, sizeof(buf), "/cpus/cpu@%u/interrupt-controller", cpu);
> +        phandle = fdt_get_phandle(fdt, fdt_path_offset(fdt, buf));
> +
> +        if ( phandle <= 0 )
> +            return phandle;

<= is odd to use on an unsigned type. Arm, in a similar situation, uses != .

Yet then - if 0 is an error indicator, aren't you converting this into a
success indicator for the caller?

> +        irq_ext[pos++] = cpu_to_be32(phandle);
> +        len += sizeof(uint32_t);

As before, preferably sizeof(<expression>) to clarify the connection. It's
pretty obvious here, but still. Yet then - do you really need to maintain
"len"? Why not use ...

> +        irq_ext[pos++] = cpu_to_be32(IRQ_S_EXT);
> +        len += sizeof(uint32_t);
> +    }
> +
> +    res = fdt_property(fdt, "interrupts-extended", irq_ext, len);

... "d->max_vcpus * 2 * sizeof(*irq_ext)" here?

> +    XVFREE(irq_ext);

This can be just xvfree(), as the variable goes out of scpoe just afterwards
anyway.

> +    return res;
> +}
> +
> +int __init imsic_make_dt_node(const struct kernel_info *kinfo)

So this function is unused until the next patch. Acceptable as long as Eclair
(or other) scans aren't done for RISC-V, but generally you may want to try to
get used to order patches such that this is avoided.

> +{
> +    uint32_t len;
> +    const void *data = NULL;

Why the initializer?

> +    int res = 0;
> +    void *fdt = kinfo->fdt;
> +    const struct dt_device_node *host_imsic_node = imsic_cfg.host_node;
> +    uint32_t *next_phandle = &kinfo->bd.d->arch.next_phandle;
> +
> +    res = fdt_begin_node(fdt, host_imsic_node->full_name);
> +    if ( res )
> +        return res;
> +
> +    data = dt_get_property(host_imsic_node, "compatible", &len);
> +    if ( !data )
> +    {
> +        printk(XENLOG_ERR "%s: Can't find 'compatible' property\n",
> +               host_imsic_node->full_name);
> +
> +        return -ENOENT;
> +    }

Move fdt_begin_node() down below here?

> --- a/xen/arch/riscv/include/asm/imsic.h
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -57,11 +57,16 @@ struct imsic_config {
>      /* MSI */
>      const struct imsic_msi *msi;
>  
> +    /* DT node of IMSIC */
> +    const struct dt_device_node *host_node;

Does "host" in the name carry much of a meaning? Maybe better dt_node, to
(potentially) distinguish it from a NUMA node which also may need tracking
for an imsic at some point?

Jan

