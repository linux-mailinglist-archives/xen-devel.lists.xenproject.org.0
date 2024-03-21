Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287CF885A0C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 14:38:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696414.1087327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnIcL-0005U3-DW; Thu, 21 Mar 2024 13:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696414.1087327; Thu, 21 Mar 2024 13:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnIcL-0005SO-9m; Thu, 21 Mar 2024 13:38:01 +0000
Received: by outflank-mailman (input) for mailman id 696414;
 Thu, 21 Mar 2024 13:38:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnIcK-0005S3-7K
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 13:38:00 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b6cce6e-e788-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 14:37:59 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5658082d2c4so1247444a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 06:37:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 el9-20020a056402360900b0056a2cc5c868sm4411897edb.72.2024.03.21.06.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 06:37:58 -0700 (PDT)
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
X-Inumbo-ID: 3b6cce6e-e788-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711028279; x=1711633079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/nz1BoihA9E1gobI2ipoDOOvJQxw2BfteYL6iVUik+g=;
        b=ST/3/eTSM/b4gW45p5ug1U1FsW9vIb9GZsSVpe6aQgezvWHn1+Pv8vTSBFItmq6paH
         WWoPtvUa4VdBd5wl4IiWs7gPyfGDKCZY5Ni/CRsgEMeoYP51ic2/7Lv9SRhI3+838Fgx
         I3LLbOuwpHCdpbWD0/zOW24hZORNiX4saJwsggRQ66HOxf2Wh7kKW9YuzGiLHNboHahD
         3+EovdpbAtj1onZyGCp8wADS+KLLjH2vTIQU11Cq7+rrI6Mlrceuo9dC+XOU8yt9BfRy
         Hcc+Eet4WFO0RVr0+kUreR9/sLjJaOESiBg7glKQ+SPoWqpprvgSpBjDb1PVBw9VZUEb
         UIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711028279; x=1711633079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/nz1BoihA9E1gobI2ipoDOOvJQxw2BfteYL6iVUik+g=;
        b=d+L5dZVnZBdW9Zzl3KxYiu4WA4Z0tZr/s7JH4NAvXd1IzDZ906aVAjFC9rUfehzF4B
         X2xzYL+TIJ/eJ/UPAl6RyWHVwDU9lgO9RstGqHdZB/fN881k817plZosHmU23WpxPcUL
         FTWBPq+sG2sfavO++XGmCq+jOZoZJDPOlF/ohazb6wMCzwwpIO7Ry93tv3ZlTCnNk7aP
         5Zczccbt8jQIe+RLafPr4OTRT1hDnTOBW0WX5nRt6KZ6HT6qylmYtrE4mgkp3UxG6d+e
         BFBhWXtqUn+BkH0gmdeREyQz3NGFxD3mC+1YqWcM0XNNaSWmCdMfXcCbooSgWpLwp+3m
         B2Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUzY5FR1cChRl90iOOh/Qi3hu3pCKo410KlF9d+Cdzm/czVj4SOTc+xv98vlls+4RFifYEVdjwwQXeqkhuOF213OZZzPWfPVXbViYyERJg=
X-Gm-Message-State: AOJu0YxQ0jgY1KJwuVN2nwNB1mNEeWbq3H7cU00+gAKF2BdwFuRXIDh5
	5dta2TbmNTOheXPgXAO3wig+4jHqUsJLprAiF2WFsq7L3Cy+FRYeufDSOk+A2KuVpC6QtAnm9G8
	=
X-Google-Smtp-Source: AGHT+IEOiBvv9fazJxmAV82RDPwI03jOzvlhlcdUrYhJ6b0zoykMaFiD3qNg46vVs3RAIVIdtgD24g==
X-Received: by 2002:a05:6402:43cb:b0:56b:8f6d:8a99 with SMTP id p11-20020a05640243cb00b0056b8f6d8a99mr5661130edc.22.1711028278970;
        Thu, 21 Mar 2024 06:37:58 -0700 (PDT)
Message-ID: <efb56e95-0290-4199-8f88-dea8fc5a99dc@suse.com>
Date: Thu, 21 Mar 2024 14:37:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 16/20] xen/riscv: add minimal stuff to mm.h to build
 full Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
 <8d9c91cad5b548785780659599ea704f7fdba7a1.1710517542.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8d9c91cad5b548785780659599ea704f7fdba7a1.1710517542.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 19:06, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -3,11 +3,246 @@
>  #ifndef _ASM_RISCV_MM_H
>  #define _ASM_RISCV_MM_H
>  
> +#include <public/xen.h>
> +#include <xen/bug.h>
> +#include <xen/mm-frame.h>
> +#include <xen/pdx.h>
> +#include <xen/types.h>
> +
>  #include <asm/page-bits.h>
>  
>  #define pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
>  #define paddr_to_pfn(pa)  ((unsigned long)((pa) >> PAGE_SHIFT))
>  
> +#define paddr_to_pdx(pa)    mfn_to_pdx(maddr_to_mfn(pa))
> +#define gfn_to_gaddr(gfn)   pfn_to_paddr(gfn_x(gfn))
> +#define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
> +#define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
> +#define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
> +#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)(va)))
> +#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
> +
> +static inline void *maddr_to_virt(unsigned long ma)

paddr_t as parameter type?

> +{
> +    BUG_ON("unimplemented");
> +    return NULL;
> +}
>[...]
> +#define PFN_ORDER(pfn) ((pfn)->v.free.order)

Would be nice if RISC-V wouldn't repeat the parameter mis-naming: Any of
p, pg, or page would be more suitable here.

With the adjustments:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

