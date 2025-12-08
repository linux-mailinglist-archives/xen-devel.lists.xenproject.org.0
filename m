Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44890CADC22
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 17:31:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180969.1504065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSe9B-0000PV-Ej; Mon, 08 Dec 2025 16:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180969.1504065; Mon, 08 Dec 2025 16:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSe9B-0000NV-Bl; Mon, 08 Dec 2025 16:31:37 +0000
Received: by outflank-mailman (input) for mailman id 1180969;
 Mon, 08 Dec 2025 16:31:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSe9A-0000NP-3D
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 16:31:36 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bed1b04-d453-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 17:31:34 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so55933595e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 08:31:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311fbaf4sm241710885e9.15.2025.12.08.08.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 08:31:32 -0800 (PST)
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
X-Inumbo-ID: 5bed1b04-d453-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765211493; x=1765816293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L3kHDBIUo9jqwK9bi59VkEi/ub252Z5T8ntSaXM2/KA=;
        b=ViEZuwSElGW3E4CRG2Us6MypNB0VNOyS4ZPGQ/WOV+5YImx0e2mXDdeMtoEWUQhuBZ
         jA3XVAZwULf3NjAsYot37pL08C0If8TOxuas6fgXELtuAtOCXrT7CY8qBU6oAhNdOEAr
         M3gLs+vqUqmfaOQ41X2JX4hIOkz4+lha+JsXGwGP67QSf4i4cYIHtjJp1jQDmKyI9jpB
         KjWgaMqtxHF9AKRbFHH7cXfuafDAzfVlvhVoF7Yv9GdyPLXostE5KmsC5CNBPQLJwREI
         5Up4muf4Hnxv1YbrSIUbHvPEiQ6ZHa42gSQDlNrTIMilQKP6V+qyoc4B6sWTCNcSqthc
         TmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211493; x=1765816293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3kHDBIUo9jqwK9bi59VkEi/ub252Z5T8ntSaXM2/KA=;
        b=r/y0aVTTGFXbDXBwqToU97RfSIBWwTA1WkBN7fuvCUL54UsNKDVjZc/RF1eaCYfGXK
         15UvZqSq6+FOIspEqnnTPbbL73Vqv3HXoC788ob3SgppvKUxljLT9dMQR5DdpaVyZ2v0
         yOEQoq+1mbjmUytw9TWThsdYM9++YDr42BF5ggRlsV79rYg12S/Ifa2qLA0J6Wiu9ZMc
         3tes1pzsQzzqueDQym8f/IrwlLUA2GaGHcfWcgSUtsHVdgJe7yJ64DXyzoLhO6pVBtFl
         2g5CdjzrGJDFbpFh4lDSRmJp5Fa1I+GTPs04k46Dlw2hudEnoHRXF+RdAUv9YFdtIIqS
         CANg==
X-Forwarded-Encrypted: i=1; AJvYcCXxFXBKUwSNvgrKxECZwMJsx07QtrthHYeUe7fdbvQX08Nkt8Ze7utF49OMHpBUlcRWhtAUz+9w524=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzX9vKGsPf1nwkZBaWo90pwOqkd3UFSQep0KeVRFDpmCTirCRrk
	9Bg/eRjVARLP8hYGC4w3yolfe9rawKcYJqp0H+Ha+uE6KtKtL2agYkI78nZks0rOtg==
X-Gm-Gg: ASbGnctFtKeUQYV5BsyDV0WZorzrgUNWIYC01vX+vltkZ30YrP9hjhG1BSPB2z5Q2pw
	gaPVOMY7MWBNi1gcxi/RWOxNlx64nBro22nHKqsXX+DnF8AExDTjjZvFh9Cw3z15xFMX+Ek2bO3
	2tS6EPAPu74XuuT3Ja8uK+cG41v1nuLYAVIULzKJDE5yfD43KNY0Jc3ll8AldIilJ2+YI0pa2VC
	51EceF0FsSQZiAFyDZ8Tf51k3p8dvnaJvYUAWv7HUkQXExRx9aU0Ie2NypXxBcKrFQtvpRr2vvk
	RlxKkE/6gkXHa5FX6Pa7ZrOWqPNfmVYkzH2OlA8eNtEiv7cdaWxl5N1KvZjoIMGq0QzP0rxzXEl
	2Rd4vA6q8sTMEzMxP55AcoiZ67UfHGXmMryhsGmbAGS0t67idA0xc4w9RNTSO2/0R2TdHuEqaGZ
	nLRNK/0CHiqYaOKqMVA2Qd5DY4bNOWgIdE4YMvqjDjDQnJDiAMjjAkZREynvzlv/ZsV5RKro/HS
	jk=
X-Google-Smtp-Source: AGHT+IGaM7RzTIbtD/ohzbE3XlqX156N01oajmn7R3jU8zE7rkOVQQC6TmDv9JYFxPYkoxiifUC+Ug==
X-Received: by 2002:a05:600c:154d:b0:477:7b72:bf9a with SMTP id 5b1f17b1804b1-47939e38729mr81014105e9.28.1765211493293;
        Mon, 08 Dec 2025 08:31:33 -0800 (PST)
Message-ID: <dc12d791-c76e-499c-9731-0163c95203da@suse.com>
Date: Mon, 8 Dec 2025 17:31:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/19] xen/riscv: introduce VMID allocation and
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
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <7805662d530eca29c5b0d0afa05a3cd0aac963bb.1763986955.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7805662d530eca29c5b0d0afa05a3cd0aac963bb.1763986955.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 13:33, Oleksii Kurochko wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -3096,3 +3096,12 @@ the hypervisor was compiled with `CONFIG_XSM` enabled.
>  * `silo`: this will deny any unmediated communication channels between
>    unprivileged VMs.  To choose this, the separated option in kconfig must also
>    be enabled.
> +
> +### vmid (RISC-V)
> +> `= <boolean>`
> +
> +> Default: `true`
> +
> +Permit Xen to use Virtual Machine Identifiers. This is an optimisation which
> +tags the TLB entries with an ID per vcpu. This allows for guest TLB flushes
> +to be performed without the overhead of a complete TLB flush.

Please obey to the alphabetic sorting within this file.

> --- /dev/null
> +++ b/xen/arch/riscv/vmid.c
> @@ -0,0 +1,170 @@
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
> +static unsigned int vmidlen_detect(void)
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
> +void vmid_init(void)

With the presently sole caller being __init, this (and likely the helper above)
could be __init. Iirc you intend to also call this as secondary harts come up,
so this may be okay. But then it wants justifing in the description.

Jan

