Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1793826BCF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 11:47:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663345.1033229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnA7-0001RR-Ho; Mon, 08 Jan 2024 10:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663345.1033229; Mon, 08 Jan 2024 10:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnA7-0001O5-Ey; Mon, 08 Jan 2024 10:47:19 +0000
Received: by outflank-mailman (input) for mailman id 663345;
 Mon, 08 Jan 2024 10:47:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMnA5-0001Kw-PM
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 10:47:17 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49c6d6a9-ae13-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 11:47:16 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ccbded5aa4so17770711fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 02:47:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j31-20020a056e02221f00b00351287f213bsm2484112ilf.14.2024.01.08.02.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 02:47:15 -0800 (PST)
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
X-Inumbo-ID: 49c6d6a9-ae13-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704710836; x=1705315636; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=888M9SwabwdmT7hmEggD9FkVbqJ79SKXYl/DOiT7WtQ=;
        b=UQaAS6PORCorrz3JHn6rvo8EAG1rRzLnmmmrjB81KsJxMTEl0UGzDPIQUM/LfoNxz4
         du/a46np9/s4HEbjDIhSesUhzY7unFeoD5QpLXa4CuL2LRy9Y/yxztOhM4XjM8qp5IsF
         J5i8zoH5HKMQf7DB0BCw9dW/DU1rDGVf/O3DWb114aIQcuIcyb7OWmg8eQqQ1C2SRxG1
         BRBMIcHdjb8KrGPYjchMScKM/YYNz2ZEtCk47c5Sp9RwpfdTMeUHRYYSRmnKHhfRgpjA
         vmUWQ1f8Vf3v3qRw8IawVWDFau61wJbnbCPYmuLrefFC1SQcK5XiVcAKGe8ECQlqTaPf
         qt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704710836; x=1705315636;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=888M9SwabwdmT7hmEggD9FkVbqJ79SKXYl/DOiT7WtQ=;
        b=g6dpYDhyR1XV4DFooagRRG0Yi56uBRnXrzzBkw2z0LDwnT4qMtncIb1FMzucZwJ7em
         U1K/p164PkwqOQBnijRKpGsCyGPTvllwV7rAh965h3PZU3loa+zCpbjSgrs7lOHCfngc
         Po7372vhCtsgh2HvxJv3IGbKaI1q/dz2aYY53yaCgYkCnm/nZmk6CbVfeLfcYVYPGhNI
         kpc2tW76G7vvTMHm/CZ8lzMqep0Rl/1eFwFGTk+dUZoBhJZkcKCTxkNew6ARUB0kYo+d
         cra1KBXFd1KGy2VvkLZAatZ2U+flBzxPIgmqct5Ar8hFrEIEqJ5d2t6y2xC+Pie1a09y
         L7Tg==
X-Gm-Message-State: AOJu0YwFgYHdtbRrEBCGcOKB3+lTaSxhfqAjGxTTgEd8ZrhpJPSAnAVF
	/4s89KsuND1CYLXMvh7tJZH/U5SnD6qd
X-Google-Smtp-Source: AGHT+IEkyxq6CL0J0J2LO9zHD7XgcrJrZV/w965EMNpnt5glgpOwwbvFntUtro3O7qmdULBO6dPKZQ==
X-Received: by 2002:a2e:8853:0:b0:2cd:1c94:82c4 with SMTP id z19-20020a2e8853000000b002cd1c9482c4mr1474635ljj.99.1704710836011;
        Mon, 08 Jan 2024 02:47:16 -0800 (PST)
Message-ID: <7491befc-e623-446e-99d7-56972bc4fc7d@suse.com>
Date: Mon, 8 Jan 2024 11:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] xen/asm-generic: introduce stub header numa.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 15:08, Oleksii Kurochko wrote:
> <asm/numa.h> is common through some archs so it is moved
> to asm-generic.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

I'd like to withdraw my ack here. As said elsewhere (and see the
respective patch), I don't think a generic header is wanted or
needed here (nor in similar other cases). !NUMA logic ought to live
in xen/numa.h.

Jan

> ---
> Changes in V6:
>  - Rebase only.
> ---
> Changes in V5:
>   - Added Acked-by: Jan Beulich <jbeulich@suse.com>
>   - Updated the comment around first_valid_mfn. ( Arm -> GENERIC )
>   - Added Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> ---
> Changes in V4:
>  - Updated guards name: *ARCH_GENERIC* -> *ASM_GENERIC*.
>  - Moved inclusion of xen/mm-frame.h under "#ifndef CONFIG_NUMA".
>  - Added Reviewed-by: Michal Orzel <michal.orzel@amd.com>.
> ---
> Changes in V3:
>  - Remove old header inclusion in asm-generic numa.h and include
>    <xen/mm-frame.h> and <xen/stdint.h>
>  - Drop Arm and PPC's numa.h and use asm-generic version instead.
> ---
> Changes in V2:
> 	- update the commit message.
> 	- change u8 to uint8_t.
> 	- add ifnded CONFIG_NUMA.
> ---
>  xen/arch/arm/include/asm/Makefile             |  1 +
>  xen/arch/ppc/include/asm/Makefile             |  1 +
>  xen/arch/ppc/include/asm/numa.h               | 26 -------------------
>  .../asm => include/asm-generic}/numa.h        | 16 +++++++-----
>  4 files changed, 12 insertions(+), 32 deletions(-)
>  delete mode 100644 xen/arch/ppc/include/asm/numa.h
>  rename xen/{arch/arm/include/asm => include/asm-generic}/numa.h (67%)
> 
> diff --git a/xen/arch/arm/include/asm/Makefile b/xen/arch/arm/include/asm/Makefile
> index 8221429c2c..0c855a798a 100644
> --- a/xen/arch/arm/include/asm/Makefile
> +++ b/xen/arch/arm/include/asm/Makefile
> @@ -2,6 +2,7 @@
>  generic-y += altp2m.h
>  generic-y += hardirq.h
>  generic-y += iocap.h
> +generic-y += numa.h
>  generic-y += paging.h
>  generic-y += percpu.h
>  generic-y += random.h
> diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
> index a8e848d4d0..f09c5ea8a1 100644
> --- a/xen/arch/ppc/include/asm/Makefile
> +++ b/xen/arch/ppc/include/asm/Makefile
> @@ -4,6 +4,7 @@ generic-y += div64.h
>  generic-y += hardirq.h
>  generic-y += hypercall.h
>  generic-y += iocap.h
> +generic-y += numa.h
>  generic-y += paging.h
>  generic-y += percpu.h
>  generic-y += random.h
> diff --git a/xen/arch/ppc/include/asm/numa.h b/xen/arch/ppc/include/asm/numa.h
> deleted file mode 100644
> index 7fdf66c3da..0000000000
> --- a/xen/arch/ppc/include/asm/numa.h
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -#ifndef __ASM_PPC_NUMA_H__
> -#define __ASM_PPC_NUMA_H__
> -
> -#include <xen/types.h>
> -#include <xen/mm.h>
> -
> -typedef uint8_t nodeid_t;
> -
> -/* Fake one node for now. See also node_online_map. */
> -#define cpu_to_node(cpu) 0
> -#define node_to_cpumask(node)   (cpu_online_map)
> -
> -/*
> - * TODO: make first_valid_mfn static when NUMA is supported on PPC, this
> - * is required because the dummy helpers are using it.
> - */
> -extern mfn_t first_valid_mfn;
> -
> -/* XXX: implement NUMA support */
> -#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
> -#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> -#define __node_distance(a, b) (20)
> -
> -#define arch_want_default_dmazone() (false)
> -
> -#endif /* __ASM_PPC_NUMA_H__ */
> diff --git a/xen/arch/arm/include/asm/numa.h b/xen/include/asm-generic/numa.h
> similarity index 67%
> rename from xen/arch/arm/include/asm/numa.h
> rename to xen/include/asm-generic/numa.h
> index e2bee2bd82..7f95a77e89 100644
> --- a/xen/arch/arm/include/asm/numa.h
> +++ b/xen/include/asm-generic/numa.h
> @@ -1,18 +1,21 @@
> -#ifndef __ARCH_ARM_NUMA_H
> -#define __ARCH_ARM_NUMA_H
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_NUMA_H
> +#define __ASM_GENERIC_NUMA_H
>  
> -#include <xen/mm.h>
> +#include <xen/stdint.h>
>  
> -typedef u8 nodeid_t;
> +typedef uint8_t nodeid_t;
>  
>  #ifndef CONFIG_NUMA
>  
> +#include <xen/mm-frame.h>
> +
>  /* Fake one node for now. See also node_online_map. */
>  #define cpu_to_node(cpu) 0
>  #define node_to_cpumask(node)   (cpu_online_map)
>  
>  /*
> - * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
> + * TODO: make first_valid_mfn static when NUMA is supported on GENERIC, this
>   * is required because the dummy helpers are using it.
>   */
>  extern mfn_t first_valid_mfn;
> @@ -26,7 +29,8 @@ extern mfn_t first_valid_mfn;
>  
>  #define arch_want_default_dmazone() (false)
>  
> -#endif /* __ARCH_ARM_NUMA_H */
> +#endif /* __ASM_GENERIC_NUMA_H */
> +
>  /*
>   * Local variables:
>   * mode: C


