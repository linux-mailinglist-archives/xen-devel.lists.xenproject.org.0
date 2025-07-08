Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1413AFCC92
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 15:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036580.1408841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8kM-0004B9-QY; Tue, 08 Jul 2025 13:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036580.1408841; Tue, 08 Jul 2025 13:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZ8kM-00049g-Nc; Tue, 08 Jul 2025 13:52:34 +0000
Received: by outflank-mailman (input) for mailman id 1036580;
 Tue, 08 Jul 2025 13:52:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZ8kM-00049a-06
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 13:52:34 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbc42b4e-5c02-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 15:52:32 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a503d9ef59so3338466f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Jul 2025 06:52:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c84597371sm118850025ad.207.2025.07.08.06.52.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 06:52:31 -0700 (PDT)
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
X-Inumbo-ID: cbc42b4e-5c02-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751982752; x=1752587552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hVZpiW/3ejamuw0BChox4o+ywq0ukfVR1KS36NOgF2c=;
        b=MYFkSBLBZRv3JgS+AwKqh/EECNBGwxY9/kSloRdG4t/LuC59adplyUcUhXTz8PH2aH
         vaFBVNLDQ+tSEjlAE2l35lEpg3t7oKwnJ89ZDiV8r+1Iu6qMqnJT2IECn5icNoUXK0Aj
         aNutx2aXSve9EKqSc8S7rSVw/BdyElxU+LkbS3TgEw/gwD165ZtgNSyST/y8vBKe+SET
         tlKI3Hc0RGxqNAunK2BMEIH/agMlGE2rLvu+FMKBTupKaAuP2Lez9O9yVsGKje9A97I7
         dAYDnMl0NzwijD5ANRMKss2kpBld5akv6nJhu72Cq/mgUQ9rtSthX551qSCtZ07N/b9q
         1yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751982752; x=1752587552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVZpiW/3ejamuw0BChox4o+ywq0ukfVR1KS36NOgF2c=;
        b=AiGM0Zp4DyRWRgu616ie+ZG62ZR0CKDPI9ajAdGxi7jt1W/DMux7+8dpKVfw5qyVph
         tMo7iAWIZKcQPUWIilAJb/HenzZYyS0LRXEzSHL13elUxgx+Mjs8re3RYoCfRn2wjLBC
         tlfkkfPH1b6jK3R62FBko++1Zu5gRLqTKCkl0UvixGXqzKFELHzCGEdFsP9w6lDsW6P3
         Pm6qg/R5G62Wy08EuBtwNpn1qdGirsJ80VejM5vInnIg3QDX9B8o9MtkbApTgQow8xd0
         zmp1A+j5+3K+rxlM+wsQhfc8Esgy27Pgv4yponInWuNsT1D24y/DN8FMjf62DufpJ7no
         075A==
X-Forwarded-Encrypted: i=1; AJvYcCWxn2v15EV4/0ofLY+vdbPdghHYqHLH8wywIsDkVdePwCM93ZdZWalJo/WkfFO6O+628Krdf1PZnzg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywv7T5PUfEttsYM5tVcs3f32lRfKoTai+p9apnG27Ti4iH9VOY2
	9r31a1++PD02avAzm6wBENXqbjZEjVXyoZ11PxS6jlUEVa73RiP8ob0Zpn/OPoToQQ==
X-Gm-Gg: ASbGncukuHnYnXnsINcM2FV7HLVyRmIxnJ7jAbLguBliaLRWm2vR6/wtXnL1dH4XF/G
	1Wtmb0kr33HeZL9dTVibfQljSZ2riP/kpy8cadsS0PNrTOuW38bBtaYxug9a6TcDBWTvIDn0ZlG
	KKsRv3FU1zNs1PTs0G5PaEjiTqxJpqee2xOKmVjHZx2WtsTl+J4gpOYzsySPUPJrg6ITWReMBzt
	9xoJ/L22nesh/dx3F+BWG4BWiFNQisZKjk7gezjafVN8aWihwhr03ijQGlPjP638xb1Ra7iY1kZ
	HGbKvdSrZvkN4S3myInHfzTY1pzHt/1LWDcq9hJk1e62E3XD0sFM/KC4B4OozMmsdTBMQ69WkG8
	vGVDCe0BuSXuUxKAQv0YHHEuYmdL5jF5Xsf27RyefkWyr71Y=
X-Google-Smtp-Source: AGHT+IEhrBmV/N1sY0GD1gkDTnqfjyZaUmU7DKeZc8pL442jDbzRuP8zGzW47s09bvMYPEJIGX5dJA==
X-Received: by 2002:a05:6000:24c8:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3b49703db1dmr14924338f8f.53.1751982751991;
        Tue, 08 Jul 2025 06:52:31 -0700 (PDT)
Message-ID: <607f9a3a-6a70-4a9b-9bb0-65138b49b6ae@suse.com>
Date: Tue, 8 Jul 2025 15:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] xen/riscv: imsic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1751876912.git.oleksii.kurochko@gmail.com>
 <73d797ed48fd3e442ca63d94ecdf29f57cd52b62.1751876912.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <73d797ed48fd3e442ca63d94ecdf29f57cd52b62.1751876912.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 11:01, Oleksii Kurochko wrote:
> imsic_init() is introduced to parse device tree node, which has the following
> bindings [2], and based on the parsed information update IMSIC configuration
> which is stored in imsic_cfg.
> 
> The following helpers are introduces for imsic_init() usage:
>   - imsic_parse_node() parses IMSIC node from DTS
>   - imsic_get_parent_hartid() returns the hart ( CPU ) ID of the given device
>     tree node.
> 
> This patch is based on the code from [1].
> 
> Since Microchip originally developed imsic.{c,h}, an internal discussion with
> them led to the decision to use the MIT license.
> 
> [1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/0b1a94f2bc3bb1a81cd26bb75f0bf578f84cb4d4
> [2] https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

I'm curious though:

> --- a/xen/arch/riscv/include/asm/smp.h
> +++ b/xen/arch/riscv/include/asm/smp.h
> @@ -3,6 +3,7 @@
>  #define ASM__RISCV__SMP_H
>  
>  #include <xen/cpumask.h>
> +#include <xen/macros.h>
>  #include <xen/percpu.h>
>  
>  #include <asm/current.h>
> @@ -18,6 +19,18 @@ static inline unsigned long cpuid_to_hartid(unsigned long cpuid)
>      return pcpu_info[cpuid].hart_id;
>  }
>  
> +static inline unsigned int hartid_to_cpuid(unsigned long hartid)
> +{
> +    for ( unsigned int cpu = 0; cpu < ARRAY_SIZE(pcpu_info); cpu++ )
> +    {
> +        if ( hartid == cpuid_to_hartid(cpu) )
> +            return cpu;
> +    }
> +
> +    /* hartid isn't valid for some reason */
> +    return NR_CPUS;
> +}

Since there's no FIXME or alike here, is this really intended to remain this
way? With many CPUs this form of lookup can be pretty inefficient.

JAn

