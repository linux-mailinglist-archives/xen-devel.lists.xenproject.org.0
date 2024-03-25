Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D57EC88A65F
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 16:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697786.1088898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1romBd-0004uK-Lg; Mon, 25 Mar 2024 15:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697786.1088898; Mon, 25 Mar 2024 15:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1romBd-0004r7-I2; Mon, 25 Mar 2024 15:24:33 +0000
Received: by outflank-mailman (input) for mailman id 697786;
 Mon, 25 Mar 2024 15:24:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1romBc-0004r1-Dx
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 15:24:32 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c570c38b-eabb-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 16:24:30 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56bf6591865so3135865a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 08:24:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 8-20020a170906308800b00a4652efd795sm3137795ejv.83.2024.03.25.08.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 08:24:27 -0700 (PDT)
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
X-Inumbo-ID: c570c38b-eabb-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711380268; x=1711985068; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EYo/I9l9EypwVCPAeKyFM3D59t3JwJaIWWILJVcw/Ag=;
        b=PLFfxm9xY2oTF8eObk1bPsa3mui+PxB7BmWPtWExAwWvyQ+tIbwNV9PtwNQAH/RBU7
         dCavlyL9hNlQ5gUqSO3B8wryXMRAiIvRgCojfzwNLGScdFL/nJKXals3s1MxI0g8lL3/
         7a9xrvLGVfZsUZ9K4hS88FOetckmGUf2doqiarbCiORojfWv1f3EZQMNY1t7EE/hwE3m
         7YrMGi/HZgz2BOctL5XnyfWqHBewuJctFbwiO713OoKsgpiuibr58kMVz2Nre6XkA/X+
         6/g6Zg0ws5W2Mwz29VT7OAPnaKYoyatqc9vcgFXf1pKjOrsFoMOV8xHjmIGx6QgyxNrc
         TaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711380268; x=1711985068;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EYo/I9l9EypwVCPAeKyFM3D59t3JwJaIWWILJVcw/Ag=;
        b=ogxWYf/NamyhmL5hSkAIUdpwQb0ld5B/ar9q5tv0CrbUoO56Fmvh0kjFm/cvjZANhi
         i35J8ug+u516kMQA594nantDMqnz1rkfwUdau9cYmJv7NE08x1acwL2X1xZyq4bfdTrv
         qUzzSqHeL87R+0D2ZnyGetpo+xF8CwFt+OZqrP08dXniw3wusC5YY3pwG6JKQUQAPSug
         NzytlMdDd+bs9xzn4Ehg1E57ML6YbSGJqnbUibp/3VJZdX4qtIe2AVArr/9VILWD/Xq6
         sNCe7cb94Ik3yH6PELwwVtNUyuQFxkacWJ2XTgn1eHEbgmi75T8jUT5q/lZzVcy5P2fl
         /FOw==
X-Forwarded-Encrypted: i=1; AJvYcCXUzlpaMi/zsKqsRTRmlNmXB+R9OqhgSdvuUNsH9Bi5rezzIuYZfNMg//Cr5THzoqvsfRpYZltTYDDFLr693zkeJLYxu3gR2x2wVAuQcH4=
X-Gm-Message-State: AOJu0YxrD9y39MjrWCrhqGWOSUcP3WOzl1cXfJWaRybWkavlzhPk2r20
	ohpXMZ6o7awMdvQYmtZUylIoL548x+OBsKiu71m2z+p+QdQSm8Auaoo082jD1g==
X-Google-Smtp-Source: AGHT+IEIGMHGuZB3lRbQfRXhxDRwJpthoqR1jHb9vfXCm6QOxrzyE0iDWDKieaP2LPTnyri+GDGUPA==
X-Received: by 2002:a17:906:fa14:b0:a46:c8e3:c9b9 with SMTP id lo20-20020a170906fa1400b00a46c8e3c9b9mr4521728ejb.42.1711380268212;
        Mon, 25 Mar 2024 08:24:28 -0700 (PDT)
Message-ID: <aaaaa735-ce88-42a3-9a2c-22de7f5eeb32@suse.com>
Date: Mon, 25 Mar 2024 16:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] xen/ppc: Introduce stub asm/static-shmem.h
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <0cf8286269a1c5cdc63e2c19d832a4923cd14f39.1710443965.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <0cf8286269a1c5cdc63e2c19d832a4923cd14f39.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 23:15, Shawn Anastasio wrote:
> Required for bootfdt.c to build.
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

As a temporary workaround this may be okay, but was the alternative
considered to properly provide stubs in a single central place for
anything !CONFIG_STATIC_SHM?

Jan

> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/static-shmem.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier:  GPL-2.0-only */
> +
> +#ifndef __ASM_PPC_STATIC_SHMEM_H__
> +#define __ASM_PPC_STATIC_SHMEM_H__
> +
> +static inline int process_shm_node(const void *fdt, int node,
> +                                   uint32_t address_cells, uint32_t size_cells)
> +{
> +    return -EINVAL;
> +}
> +
> +#endif /* __ASM_PPC_STATIC_SHMEM_H__ */


