Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C6BAD3CBB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 17:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011046.1389345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0nw-000799-0c; Tue, 10 Jun 2025 15:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011046.1389345; Tue, 10 Jun 2025 15:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP0nv-000779-TJ; Tue, 10 Jun 2025 15:22:23 +0000
Received: by outflank-mailman (input) for mailman id 1011046;
 Tue, 10 Jun 2025 15:22:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uP0nu-000773-4t
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 15:22:22 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3f888fa-460e-11f0-a307-13f23c93f187;
 Tue, 10 Jun 2025 17:22:21 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-441d437cfaaso35600725e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 08:22:21 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452730b9caasm141001195e9.20.2025.06.10.08.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 08:22:20 -0700 (PDT)
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
X-Inumbo-ID: b3f888fa-460e-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749568941; x=1750173741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tmmGaEsnvDUjUnQl8JBKrdKWGYxP5naWay+hjidSRKg=;
        b=MUFkoZROp95LKWqr2drYz3xfMUSgnXKBKRPrX/gjZmDL2jLlgub4f2Gn/2R599G1Pg
         rp0W7yvmFPThdRg9dQsAXt2NpX92TuyznDXqnx9EDhefLyBG4CrNHZz6RiM32znfwNhA
         YrNMq8tUj31BkJVCDOdHiGIDD4q1ukWvALM5MVyIWIj2ocrfEnGg200fucejT90GIL8W
         QgV/9RpWRhccRsJwwD6WEVqcwQblDuGfQ4J394mIS+fwa48QA1tbt5H6IkXp/fuquons
         xdP1qZD8l1SvbV5vEcSiOFbRB9yxW2dCI+8q5K8WJVgIwLpan1S7QhJvWcowv/SozND1
         5gMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568941; x=1750173741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmmGaEsnvDUjUnQl8JBKrdKWGYxP5naWay+hjidSRKg=;
        b=V/kzzxJxaS9ISFREXcerhro47T3LxtOUWkKy3mpKirW5L+byHQd0JcmpgPj78HnJt4
         0gIeh1FabGsXcTV1SJsHyZ3LjmZ4e6sHRS0cbS3/99TZX3zF/666yX6nnnecbYaFMdZu
         0l+iQZMf/6q7oXpgfB1BQR0P1vxmGLy86GrX1+i2JyfMo1ik2wHrfi8OHOxsWOMfustd
         DntY857v9aZ1bnZIvBjSrrrp1u1lKsfFaez+U3Eve9Ivo4fqVVguD/wp6UA1BpXbt301
         1uTIJIVEXDmryqZJLDnqYiWCE+PIrS4FGD+MFMEB9MIab45gJyQfCIHgbV3FhMYjVnkH
         XbJA==
X-Forwarded-Encrypted: i=1; AJvYcCVCSXxIxxfHKvsFFmdh/jThyg26LRT7sYGnzrO8nvKIG2fCARYxsn5CcZLynIQUo8Q7HD6ZNGeMw0s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0ZG1rdaVjyuoiHmEIH1YFrdydDX2qZjjgKfvgeuTSKMXAg4+w
	NdRB+etAU9VREcKcwMDg1cVq9P8zbZE/7qv/tK3IrH6OwBSRZaJKmXV/UISNjRomJw==
X-Gm-Gg: ASbGnctGYqP/E9TJ45pZEMc2a2+B8Pq7AZ9F4gvHaHAlj4jVK4u+3CfpSC1F/lcSFZb
	Kcq6AEGYNM8PpAbGIIih+XKR130HOCP62wASt/ZYAJEWsfSw0N+1L40ehDshUcqDr/60UnIOiTl
	qu+XlBQcw6jSaVXFN23jqsMnthocMljjC8wgYnbeHJTbdLz30Vn7aRPV2p6Wlaqde9qfW+DnIM2
	tDAJRUzWCbwcisHFGyAQpRurbJhESLq2UG3tjJJtPLzSnRYHIaXI5gEcWjGj/r+/KR32Z5l5QLn
	63afsMBckk3gqYov5CY3OV73iKt/Nb20dY5Xea8CFE/wYf3xI5pLepktAhRMckYVO3LFa/gXMPG
	SKAVl9CpMH9KBWHd8YUjp3+n+OFlJtWujh56E5I8U20+byi73vvZxdQLZVEIFpbZPJVE9Yl3iFC
	zOFM2PWPVG9lNFKQPFBNLt
X-Google-Smtp-Source: AGHT+IHNG/tq0IcOnNuzIA/MX+dFPVzd5OruvC4r13JTdmcr9HHZMOGCXxdhk8VFPhyErevx8WpgPw==
X-Received: by 2002:a05:600c:1e8a:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-452014976b1mr149242475e9.21.1749568940641;
        Tue, 10 Jun 2025 08:22:20 -0700 (PDT)
Message-ID: <17943f73-8123-40c1-91cb-56dac6e1976e@suse.com>
Date: Tue, 10 Jun 2025 17:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] xen/riscv: aplic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
 <1913a653568d51ed630dbbda1e1364b41aa5db89.1749121437.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1913a653568d51ed630dbbda1e1364b41aa5db89.1749121437.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.2025 17:59, Oleksii Kurochko wrote:
> +static int __init cf_check aplic_init(void)
> +{
> +    dt_phandle imsic_phandle;
> +    const __be32 *prop;
> +    uint64_t size, paddr;
> +    const struct dt_device_node *imsic_node;
> +    const struct dt_device_node *node = aplic_info.node;
> +    int rc;
> +
> +    /* Check for associated imsic node */
> +    if ( !dt_property_read_u32(node, "msi-parent", &imsic_phandle) )
> +        panic("%s: IDC mode not supported\n", node->full_name);
> +
> +    imsic_node = dt_find_node_by_phandle(imsic_phandle);
> +    if ( !imsic_node )
> +        panic("%s: unable to find IMSIC node\n", node->full_name);
> +
> +    rc = imsic_init(imsic_node);
> +    if ( rc == IRQ_M_EXT )
> +        /* Machine mode imsic node, ignore this aplic node */
> +        return 0;
> +
> +    if ( rc )
> +        panic("%s: Failded to initialize IMSIC\n", node->full_name);

Nit: Stray 'd'.

> +    /* Find out number of interrupt sources */
> +    if ( !dt_property_read_u32(node, "riscv,num-sources",
> +                               &aplic_info.num_irqs) )
> +        panic("%s: failed to get number of interrupt sources\n",
> +              node->full_name);
> +
> +    if ( aplic_info.num_irqs > ARRAY_SIZE(aplic.regs->sourcecfg) )
> +        aplic_info.num_irqs = ARRAY_SIZE(aplic.regs->sourcecfg);
> +
> +    prop = dt_get_property(node, "reg", NULL);
> +    dt_get_range(&prop, node, &paddr, &size);
> +    if ( !paddr )
> +        panic("%s: first MMIO resource not found\n", node->full_name);
> +
> +    if ( !IS_ALIGNED(paddr, KB(4)) )
> +        panic("%s: paddr of memory-mapped control region should be 4Kb "
> +              "aligned:%#lx\n", __func__, paddr);
> +
> +    if ( !IS_ALIGNED(size, KB(4)) && (size < KB(16)) )

DYM || instead of && here?

> +        panic("%s: memory-mapped control region should be a multiple of 4 KiB "
> +              "in size and the smallest valid control is 16Kb: %#lx\n",
> +              __func__, size);

Here and above: See my remark on the earlier patch regarding the wrapping
of format strings.

Jan

