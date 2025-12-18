Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 905A2CCB019
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 09:49:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189338.1510129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vW9gg-00055J-GX; Thu, 18 Dec 2025 08:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189338.1510129; Thu, 18 Dec 2025 08:48:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vW9gg-00052S-Cn; Thu, 18 Dec 2025 08:48:42 +0000
Received: by outflank-mailman (input) for mailman id 1189338;
 Thu, 18 Dec 2025 08:48:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vW9gf-00052M-HV
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 08:48:41 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5996c4b0-dbee-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 09:48:40 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so2389945e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Dec 2025 00:48:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3020f25sm31698625e9.6.2025.12.18.00.48.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 00:48:39 -0800 (PST)
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
X-Inumbo-ID: 5996c4b0-dbee-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766047719; x=1766652519; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XSBrnSRjqjZN3nIux65z7k+APJ9qn4D9C6S0TDTKL6M=;
        b=I1ELv5RQLK1UXgVnXu+ITApSF6MhegYcXnpWvsQyAdIWaQTI4q2PqJ1T7cmAKQOD+I
         eZS6EfF2NDUnqN2boppu/990erpN0LZJtGreeQA1sSdW4Z7RAWDnxowN6w05HLCH521X
         CU1OfGyf5cJg0hfsCOP7C4r0tGdyQLE61wDWU3Fl7S6baNR0O4lYiMNX8KKYCMvZuty4
         8jMIYPHPTWdxmGqMma5b0TsQJEWYrvUJ1I9lX9DuidsPUBtn0sf6qIXiMpFSFbpixLAD
         bwitv93Hz8y2RrEaYRp0BXwSldAPeMkzXdoILSw1Nld40l4yVhuuezbDGpXC1xa8CE8w
         rEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766047719; x=1766652519;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSBrnSRjqjZN3nIux65z7k+APJ9qn4D9C6S0TDTKL6M=;
        b=Mwk8ymSRydU+rw9FpRZRlNezhkFisjP4R8uY8A0g9gen+AQDyCMXv4TxSU9lTchD5y
         GWG3C+9yVfv+NRMNNaY0hgzZ1ZYN973GNOjC3I2eO3H5UKgC5lbs8Hk9RojvOVAI+Ehq
         lVXLwhMWhWUz9MxL7kQjmVgMH5KsxAhU73Qyh0SuM1hXB9tFJF4PbGTGj8HndkFZhRIf
         zjVzNNQ2SXhjuTBfrGVr4vRQpm4V3T5vCxmaaGV+pZEaH6vioHee/ghxBy1+fdx1gxrf
         qx/9IoWQzNesEVxGZkcN3Ra+YDvxNVKQ8HHohdaOVGt8g1+wy6PRuj0uVlJrDcWGaKLO
         tFCw==
X-Forwarded-Encrypted: i=1; AJvYcCUvaOdwl0O6kgP55SSlMZ6kBc+J6PhGIW4WaHvxP41xGBgsiDL5BINHkwkrGh0+7GNsQQbYO7sYX1E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVdg87NzODGTkbGsT7LlgAIHp35RLXKkKZe7zhNwjgyvmT0k3e
	T+plsgWdBzHMM+Rv/AIis7Tf5oOaFA2o02AEat4vQkHJSspJRNd7G0m4Dh86FLh5Mg==
X-Gm-Gg: AY/fxX61YHiygurY/bp0wSWBMosN6v6DtV2R/pLQPXsAqvB9kU7r2g+L3gOFBzNm/8J
	8Hx897IQ/1gz9ERwi3czARDj+7iV/U+702XkSccwuu5TGrdGA8A8ETBnF3589+nDOOdmqN7GoU/
	SsZT1psPewK6qJwH+w4QJQqg69dSVvmRdfGrY3SHA3GX63H+VQmrhC4TLsqgKshrQqAKnhATAPc
	OTT0aPDHa20vbifHjO0gm18xeE5786VeJs+hokwHCE8hFp4yJiBBv2BAfvIZN74nuH+XVknlbek
	i+sfEVHW+Y5NVhKWR8QY8M48KOhfFspCoH4a4TWH5HcBpeA22uZvzeqQptprmZZGBVLtpmoaFg0
	zhjS0xRSty0rR5RwNv5lc5ZoiFELU/O4ZjkFdXwnSFIqXU1PLyxdELjOrtUflkHlqvu9EtBkUhH
	LIWYLikk0KF3YpQ79G/Lx0mem4oBMKUKxShH6626D4R0HshkAHHqXYaOV9gP0MSimLmy54xlctl
	Xw=
X-Google-Smtp-Source: AGHT+IHdwGMFSnvRmIPI2uo4JfjFPognIkiOM8vqCndTfAKrNRt0olp3OKSer2ooGWp2W+7EZTEzhg==
X-Received: by 2002:a05:600d:6402:20b0:475:da13:2568 with SMTP id 5b1f17b1804b1-47a900bd6b7mr170052385e9.25.1766047719514;
        Thu, 18 Dec 2025 00:48:39 -0800 (PST)
Message-ID: <b7d3a8ad-7993-4010-8afb-16d8614064ce@suse.com>
Date: Thu, 18 Dec 2025 09:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/19] xen/riscv: introduce VMID allocation and
 manegement
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
 <909072f0b5ede1869e6c6993be348ecbdd47e0fa.1765879052.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <909072f0b5ede1869e6c6993be348ecbdd47e0fa.1765879052.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2025 17:55, Oleksii Kurochko wrote:
> Current implementation is based on x86's way to allocate VMIDs:
>   VMIDs partition the physical TLB. In the current implementation VMIDs are
>   introduced to reduce the number of TLB flushes. Each time a guest-physical
>   address space changes, instead of flushing the TLB, a new VMID is
>   assigned. This reduces the number of TLB flushes to at most 1/#VMIDs.
>   The biggest advantage is that hot parts of the hypervisor's code and data
>   retain in the TLB.
> 
>   VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
>   VMIDs are assigned in a round-robin scheme. To minimize the overhead of
>   VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
>   64-bit generation. Only on a generation overflow the code needs to
>   invalidate all VMID information stored at the VCPUs with are run on the
>   specific physical processor. When this overflow appears VMID usage is
>   disabled to retain correctness.
> 
> Only minor changes are made compared to the x86 implementation.
> These include using RISC-V-specific terminology, adding a check to ensure
> the type used for storing the VMID has enough bits to hold VMIDLEN,
> and introducing a new function vmidlen_detect() to clarify the VMIDLEN
> value, rename stuff connected to VMID enable/disable to "VMID use
> enable/disable".
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- /dev/null
> +++ b/xen/arch/riscv/vmid.c
> @@ -0,0 +1,178 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/domain.h>
> +#include <xen/init.h>
> +#include <xen/sections.h>
> +#include <xen/lib.h>
> +#include <xen/param.h>
> +#include <xen/percpu.h>
> +
> +#include <asm/atomic.h>
> +#include <asm/csr.h>
> +#include <asm/flushtlb.h>
> +#include <asm/p2m.h>
> +
> +/* Xen command-line option to enable VMIDs */
> +static bool __ro_after_init opt_vmid = true;
> +boolean_param("vmid", opt_vmid);
> +
> +/*
> + * VMIDs partition the physical TLB. In the current implementation VMIDs are
> + * introduced to reduce the number of TLB flushes. Each time a guest-physical
> + * address space changes, instead of flushing the TLB, a new VMID is
> + * assigned. This reduces the number of TLB flushes to at most 1/#VMIDs.
> + * The biggest advantage is that hot parts of the hypervisor's code and data
> + * retain in the TLB.
> + *
> + * Sketch of the Implementation:
> + *
> + * VMIDs are a hart-local resource.  As preemption of VMIDs is not possible,
> + * VMIDs are assigned in a round-robin scheme. To minimize the overhead of
> + * VMID invalidation, at the time of a TLB flush, VMIDs are tagged with a
> + * 64-bit generation. Only on a generation overflow the code needs to
> + * invalidate all VMID information stored at the VCPUs with are run on the
> + * specific physical processor. When this overflow appears VMID usage is
> + * disabled to retain correctness.
> + */
> +
> +/* Per-Hart VMID management. */
> +struct vmid_data {
> +   uint64_t generation;
> +   uint16_t next_vmid;
> +   uint16_t max_vmid;
> +   bool used;
> +};
> +
> +static DEFINE_PER_CPU(struct vmid_data, vmid_data);
> +
> +/*
> + * vmidlen_detect() is expected to be called during secondary hart bring-up,
> + * so it should not be marked as __init.
> + */
> +static unsigned int vmidlen_detect(void)

I would have omitted this comment, as the function is a helper of ...

> +{
> +    unsigned int vmid_bits;
> +    unsigned char gstage_mode = get_max_supported_mode();
> +
> +    /*
> +     * According to the RISC-V Privileged Architecture Spec:
> +     *   When MODE=Bare, guest physical addresses are equal to supervisor
> +     *   physical addresses, and there is no further memory protection
> +     *   for a guest virtual machine beyond the physical memory protection
> +     *   scheme described in Section "Physical Memory Protection".
> +     *   In this case, the remaining fields in hgatp must be set to zeros.
> +     * Thereby it is necessary to set gstage_mode not equal to Bare.
> +     */
> +    ASSERT(gstage_mode != HGATP_MODE_OFF);
> +    csr_write(CSR_HGATP,
> +              MASK_INSR(gstage_mode, HGATP_MODE_MASK) | HGATP_VMID_MASK);
> +    vmid_bits = MASK_EXTR(csr_read(CSR_HGATP), HGATP_VMID_MASK);
> +    vmid_bits = flsl(vmid_bits);
> +    csr_write(CSR_HGATP, _AC(0, UL));
> +
> +    /* local_hfence_gvma_all() will be called at the end of pre_gstage_init. */
> +
> +    return vmid_bits;
> +}
> +
> +/*
> + * vmid_init() is expected to be called during secondary hart bring-up,
> + * so it should not be marked as __init.
> + */
> +void vmid_init(void)

... this one, and hence necessarily has to follow suit in regard to section
placement.

Jan

