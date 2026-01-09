Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B081D08671
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 11:03:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198493.1515418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve9Kz-0008Dy-5m; Fri, 09 Jan 2026 10:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198493.1515418; Fri, 09 Jan 2026 10:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ve9Kz-0008Aq-1l; Fri, 09 Jan 2026 10:03:21 +0000
Received: by outflank-mailman (input) for mailman id 1198493;
 Fri, 09 Jan 2026 10:03:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ve9Kx-0008Ak-RI
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 10:03:19 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b284b65-ed42-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 11:03:17 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-477770019e4so32554795e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 02:03:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e199bsm21506916f8f.16.2026.01.09.02.03.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 02:03:16 -0800 (PST)
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
X-Inumbo-ID: 6b284b65-ed42-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767952996; x=1768557796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hha75O21d8a+w1Gr3ybwi7NRwnG6uoExBE7tw9FLn4E=;
        b=AinxTMRjZBywWZQB4kw8/O8J+ciiFa00k47zeykN8wdpTraEWQI8NSk0IBhctnZRe/
         Cee6b6kYRu1Bwrr08Dw2cqI21C4m6R8MqE0tCyrqxJmcOkEPBOB83+cRX7ed7z+o0ikA
         SPqFe8cozOzgl9dDdiP2UXqunrzHOVdBHF3D2vb71nNLIHNjzPxP6u60QhNFlX6aGUUL
         CI18ow4sN/TT5yaGMoGKKFhmdALhPebFmbmcGQYiQdaavmxlDuAAm/ZWxJ/cDhjGsi55
         Kc129dy6W1nV3yWEiTu6YK6s1XmO7a4WNnbLZzr5p+R6sBwtjyGYXRxRtPjn6i2Sbphg
         INyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767952996; x=1768557796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hha75O21d8a+w1Gr3ybwi7NRwnG6uoExBE7tw9FLn4E=;
        b=ppzK7bE0gNYATgfdgENDM/OTCBFS72L6MqOsacx9wmVa/x8yIrE73ZexIhGzQZxSon
         Vbd4V3L/IkU8iDInt4aXVTSb412f1z1dn38rUbji8Gh+lppbo2NyZ5sGvbEBiG2h4577
         aUYkcKa/eK2nHJOy9usuYZjcLdGBrF/AH7xdijeCo8qpWMsx6dzAoEBxqZAUBlN1W43n
         2x1ZzR8qpM67aa26X8PHQRU+ih3D1d1SN/cpGtiNEVX+E4vT351j4V3AoKKmlONvRgxv
         ciiaYdGIAaSMr4dIsxqM23ebWgPWfspeZb+Uun5s+QNAAo+vxCiukP5vua0V6dRhBByd
         BDGg==
X-Forwarded-Encrypted: i=1; AJvYcCV70Mf7jbNSHcc4lmveeO0eEQW7InqTth/9hkAk3vtnvd5H9DxsOp/HsernBcC95BibszH6QXGLo04=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx3sqsX5Jsn3d1Ju3Q05Mbr7oxdQd5UqEcKqiPnweva+vBRmeAU
	N4+G5d6ZYvuyRmliSdrHSZzadFDFK9U9rmwq+IIsHFOsVOekLTBtcXOMkYmqvrVdQg==
X-Gm-Gg: AY/fxX4YOgaW3gkBq9QsvplRb33TlmAvzSCO6mgVh/t6IP1s2jiiugjo6UxUIPpjNnV
	GZkOACUc9OqXBsKybJwi35QImaTiHKrwrjhqtK5wyvbfY5gWuRX88IhlF1ICybLUEovAYAhGLER
	kSuDjEC0gSWCgAlIcq9XTM4RvCqQaSgTO6eqtzviJ2iJ0XsbE5TTq/C6l1io/Hlad6rhr8k5xOS
	RBVv0nKOWIuS0/ZBhtVpopd6xAxzNTpzhwDX57/ArPNwQXCEQs4l4c7zPXznXVXWtetQq0pQegg
	9qrmCE1+bR5se83sVbLQJa2uGuFWxgENWtfw/rFpFQcFEoCEz29j5YC8/b8N5y1ckc7L5IyCDex
	6/Tvpq9R8eFerfTS6JJudRX9ifJ150pbyTm4R4mql6FpoyaUsd4IShpWfyaaUnJwaf3rKzVPoJQ
	0Mktv7+wJ8XR5gHU9H2nsjYrEU22DfNWpgfZhfY9NNxkLUP/IGFKUL9EGNPORSAe8Vfp2esnUDr
	vI=
X-Google-Smtp-Source: AGHT+IEpwj5fQrQnvbTvdERlbeJu0fXZH0Gh2BFfVTYlURRhWQtFo45LGXgLG+ZS2dCUpaM1mVUu1w==
X-Received: by 2002:a05:6000:2209:b0:432:5bf9:cf26 with SMTP id ffacd0b85a97d-432c3761019mr11997411f8f.13.1767952996400;
        Fri, 09 Jan 2026 02:03:16 -0800 (PST)
Message-ID: <ad51f470-fd08-41bd-bb0d-7058b1f18ff0@suse.com>
Date: Fri, 9 Jan 2026 11:03:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] acpi/arm: relax MADT GICC entry length check to
 support newer ACPI revisions
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Yann Dirson <yann.dirson@vates.tech>,
 Yann Sionneau <yann.sionneau@vates.tech>, xen-devel@lists.xenproject.org
References: <a2234959527a420f8736b2789118326b2d3ee35e.1767950420.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a2234959527a420f8736b2789118326b2d3ee35e.1767950420.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2026 10:27, Oleksii Kurochko wrote:
> Newer ACPI revisions define the MADT GICC entry with Length = 82 bytes [1].
> The current BAD_MADT_GICC_ENTRY() check rejects entries whose length does not
> match the known values, which leads to:
>   GICv3: No valid GICC entries exist.
> as observed on the AmpereOne platform.
> 
> To fix this, import the logic from Linux commit 9eb1c92b47c7:
>   The BAD_MADT_GICC_ENTRY check is a little too strict because
>   it rejects MADT entries that don't match the currently known
>   lengths. We should remove this restriction to avoid problems
>   if the table length changes. Future code which might depend on
>   additional fields should be written to validate those fields
>   before using them, rather than trying to globally check
>   known MADT version lengths.
> 
>   Link: https://lkml.kernel.org/r/20181012192937.3819951-1-jeremy.linton@arm.com
>   Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>   [lorenzo.pieralisi@arm.com: added MADT macro comments]
>   Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>   Acked-by: Sudeep Holla <sudeep.holla@arm.com>
>   Cc: Will Deacon <will.deacon@arm.com>
>   Cc: Catalin Marinas <catalin.marinas@arm.com>
>   Cc: Al Stone <ahs3@redhat.com>
>   Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
>   Signed-off-by: Will Deacon <will.deacon@arm.com>
> 
> As ACPI_MADT_GICC_LENGTH is dropped, update the functions where it is
> used. As we rewrite the MADT for hwdom, reuse the host GICC header length
> instead of ACPI_MADT_GICC_LENGTH.
> 
> Mark gic_get_hwdom_madt_size() as __init since its only caller is also
> __init.
> 
> [1] https://uefi.org/specs/ACPI/6.6/05_ACPI_Software_Programming_Model.html#gic-cpu-interface-gicc-structure
> 
> Reported-By: Yann Dirson <yann.dirson@vates.tech>
> Co-developed-by: Yann Sionneau <yann.sionneau@vates.tech>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> I ran CI tests where it made sense for this patch, as I don’t see any CI job
> that builds Xen with CONFIG_ACPI=y:
>   https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/2252409762
> 
> I also built Xen manually with CONFIG_ACPI=y enabled and tested it on the
> AmpereOne platform.
> ---
>  xen/arch/arm/acpi/domain_build.c |  6 ++++++
>  xen/arch/arm/gic-v2.c            |  3 ++-
>  xen/arch/arm/gic-v3.c            |  3 ++-
>  xen/arch/arm/gic.c               | 13 +++++++++++--
>  xen/arch/arm/include/asm/acpi.h  | 21 +++++++++++++++------
>  5 files changed, 36 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
> index 1c3555d814cc..959698d13ac3 100644
> --- a/xen/arch/arm/acpi/domain_build.c
> +++ b/xen/arch/arm/acpi/domain_build.c
> @@ -458,6 +458,12 @@ static int __init estimate_acpi_efi_size(struct domain *d,
>      acpi_size += ROUNDUP(sizeof(struct acpi_table_stao), 8);
>  
>      madt_size = gic_get_hwdom_madt_size(d);
> +    if ( !madt_size )
> +    {
> +        printk("Unable to get hwdom MADT size\n");
> +        return -EINVAL;
> +    }
> +
>      acpi_size += ROUNDUP(madt_size, 8);
>  
>      addr = acpi_os_get_root_pointer();
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index b23e72a3d05d..aae6a7bf3076 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1121,7 +1121,8 @@ static int gicv2_make_hwdom_madt(const struct domain *d, u32 offset)
>      host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
>                               header);
>  
> -    size = ACPI_MADT_GICC_LENGTH;
> +    size = host_gicc->header.length;
> +
>      /* Add Generic Interrupt */
>      for ( i = 0; i < d->max_vcpus; i++ )
>      {
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index bc07f97c16ab..75b89efad462 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -1672,7 +1672,8 @@ static int gicv3_make_hwdom_madt(const struct domain *d, u32 offset)
>  
>      host_gicc = container_of(header, struct acpi_madt_generic_interrupt,
>                               header);
> -    size = ACPI_MADT_GICC_LENGTH;
> +    size = host_gicc->header.length;
> +
>      for ( i = 0; i < d->max_vcpus; i++ )
>      {
>          gicc = (struct acpi_madt_generic_interrupt *)(base_ptr + table_len);
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index ee75258fc3c3..e4fcfd60205d 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -414,12 +414,21 @@ int gic_make_hwdom_madt(const struct domain *d, u32 offset)
>      return gic_hw_ops->make_hwdom_madt(d, offset);
>  }
>  
> -unsigned long gic_get_hwdom_madt_size(const struct domain *d)
> +unsigned long __init gic_get_hwdom_madt_size(const struct domain *d)
>  {
>      unsigned long madt_size;
> +    const struct acpi_subtable_header *header;
> +    const struct acpi_madt_generic_interrupt *host_gicc;
> +
> +    header = acpi_table_get_entry_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT, 0);
> +    if ( !header )
> +        return 0;
> +
> +    host_gicc = container_of(header, const struct acpi_madt_generic_interrupt,
> +                             header);
>  
>      madt_size = sizeof(struct acpi_table_madt)
> -                + ACPI_MADT_GICC_LENGTH * d->max_vcpus
> +                + host_gicc->header.length * d->max_vcpus

Just to double-check: All entries are strictly required to be of the same
length? (Related question further down.)

> --- a/xen/arch/arm/include/asm/acpi.h
> +++ b/xen/arch/arm/include/asm/acpi.h
> @@ -53,13 +53,22 @@ void acpi_smp_init_cpus(void);
>   */
>  paddr_t acpi_get_table_offset(struct membank tbl_add[], EFI_MEM_RES index);
>  
> -/* Macros for consistency checks of the GICC subtable of MADT */
> -#define ACPI_MADT_GICC_LENGTH	\
> -    (acpi_gbl_FADT.header.revision < 6 ? 76 : 80)

Given this, ...

> +/*
> + * MADT GICC minimum length refers to the MADT GICC structure table length as
> + * defined in the earliest ACPI version supported on arm64, ie ACPI 5.1.
> + *
> + * The efficiency_class member was added to the
> + * struct acpi_madt_generic_interrupt to represent the MADT GICC structure
> + * "Processor Power Efficiency Class" field, added in ACPI 6.0 whose offset
> + * is therefore used to delimit the MADT GICC structure minimum length
> + * appropriately.
> + */
> +#define ACPI_MADT_GICC_MIN_LENGTH   ACPI_OFFSET( \
> +    struct acpi_madt_generic_interrupt, efficiency_class)
>  
> -#define BAD_MADT_GICC_ENTRY(entry, end)						\
> -    (!(entry) || (unsigned long)(entry) + sizeof(*(entry)) > (end) ||	\
> -     (entry)->header.length != ACPI_MADT_GICC_LENGTH)
> +#define BAD_MADT_GICC_ENTRY(entry, end) \
> +    (!(entry) || (entry)->header.length < ACPI_MADT_GICC_MIN_LENGTH || \
> +    (unsigned long)(entry) + (entry)->header.length > (end))

... is 76 a valid length when the FADT revision is 6 or higher? And 80 is a
valid length for 6.5 or higher?

Jan

