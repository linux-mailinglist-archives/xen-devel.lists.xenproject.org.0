Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E000A37DDD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 10:07:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889874.1298907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjx6H-0000K7-3i; Mon, 17 Feb 2025 09:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889874.1298907; Mon, 17 Feb 2025 09:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjx6H-0000Gh-0u; Mon, 17 Feb 2025 09:07:37 +0000
Received: by outflank-mailman (input) for mailman id 889874;
 Mon, 17 Feb 2025 09:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjx6G-0000GZ-7g
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 09:07:36 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a068c1ee-ed0e-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 10:07:35 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e033c2f106so2838338a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 01:07:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece287d3fsm6843015a12.72.2025.02.17.01.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 01:07:33 -0800 (PST)
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
X-Inumbo-ID: a068c1ee-ed0e-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739783254; x=1740388054; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e5bzPISgTCvWgEb1dH7v7FAf8upjfstpjg3sjdfcG+w=;
        b=GA0Rkskn5lEGQ/ppf1HrRVcfJpaHYomz7cwJ8rOGh9760qcPQ6rjofabfygH+qslsd
         qhNUyHE3SjydrvZ4A6k6TCXSim0ZHBWauNrj/q0hnfXgmwaQ7wGkdUPYAxTdfqyoFLay
         1uwTGCDh0aUo/3NDDMwuV6n0r6V7QjFSKaKBwHqTI8fhmRH7qxkQBf8RS04giTG6o6wI
         ZcqFXbunW/9zn/QRxLtw4SVPNinmCxW/SkLIyqD6wsgmQggaAdKNqnc/1hbtAA1ekgc+
         CNM8B928c/MImWKjjZipDXPvDXa3qC2NNjsOFlG3NFrrqlnAKypyhtQCZ1Wun/xGkeo+
         C2lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783254; x=1740388054;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5bzPISgTCvWgEb1dH7v7FAf8upjfstpjg3sjdfcG+w=;
        b=Gt9R/bXXgCoWnkCyo9bCey3WLmaW+f7NxJWFBw+BbZdwMalvRCMpBC2YarlpHi5HhH
         IAx/AS65e5btcBBpugQxDtXyk/fmhLRM9HNtXLBapxJYq5Z9Y9vYaGqAy3urA1FgYWQY
         XJ3Aj4eCVL7mrCkVrqmAVhE8zgf0rKvi4Drvg/DwoQqyowf6TXeThql0jxaBMpRhSVXH
         zw2EkK9mVZBG0rt8ZNcqA+cwgDIObaHMIQtUKbiPlDjDVBZ/gdl5p4WkgxqvtW3r3+Pk
         GTTjt27uzHnbJvTpGMR9dN2W3TeeA/NAAfPg9hF4L2CKrmcXh7QfXASxWY82sOoM5CrP
         R3xA==
X-Forwarded-Encrypted: i=1; AJvYcCWz/zJRM0LNRk2G5LXMhIfUPGMZd8cFA9T8GFQEr12LXHxQoXAx6Li6FqRVDqROI7o5d2iM0XG7V8E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZGvNGnc5VPb08RLHUSlQicqOrT77btyVA5aZxZwiYOcLDjQHe
	3CTPeUu/GsQNYW4c4ETLL3SlBs/6yy8GRxJluT5yJl1Pd/h7RoLAEqT6wCdWWA==
X-Gm-Gg: ASbGncvus7slI+0gEPaKmTRtieNt2ipMvPRjaoQR+mYUElMFZPqanThS7VGhoQaFUTN
	NR7E7noZeMa369WG2R0lFIRzria+fix412k71aHSe0ftuS/PLcu63sa+JwpJBVA7jwGxgNaIMQY
	MLtISWdFCcwbt/FD2MfjmvxO/TUc7HPv6Z0Kok0zAsOIGZuD0JeW2vAnYKz2FoHRt3tCGmlPvH8
	u02IdDubhTeGco/2GcXkuS1EeLF4oYu7PIQ7cCMHBfpE2ihmfLwWq3dm50rubaD7ZgK65ttVwvl
	vD/ZcMHTZzv6IK11vJixj0NgF0CAZRozrVYGi8qJNE/q5cSbX2dBgwjuUjOTeQPnqYPEAXqhohW
	c
X-Google-Smtp-Source: AGHT+IEY+s4bk4oE86zUXaZIuqPUr4WJcrkDxNFscO75h70NShuO6Ivxx17lAdOhRtbLEDw3/y6RTQ==
X-Received: by 2002:a05:6402:430f:b0:5df:b6e1:4690 with SMTP id 4fb4d7f45d1cf-5e03602e5eemr25880168a12.12.1739783254119;
        Mon, 17 Feb 2025 01:07:34 -0800 (PST)
Message-ID: <4f1fcad5-dd6c-471f-9496-023973fa8857@suse.com>
Date: Mon, 17 Feb 2025 10:07:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, Luca.Fancellu@arm.com,
 roger.pau@citrix.com, marmarek@invisiblethingslab.com,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 xen-devel@lists.xenproject.org
References: <20250216102108.2665222-1-andr2000@gmail.com>
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
In-Reply-To: <20250216102108.2665222-1-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
> 1. Const string arrays reformatting
> In case the length of items change we might need to introduce a bigger
> change wrt new formatting of unaffected lines
> ==============================================================================
> 
> --- a/xen/drivers/acpi/tables.c
> +++ b/xen/drivers/acpi/tables.c
> @@ -38,10 +38,10 @@
> -static const char *__initdata
> -mps_inti_flags_polarity[] = { "dfl", "high", "res", "low" };
> -static const char *__initdata
> -mps_inti_flags_trigger[] = { "dfl", "edge", "res", "level" };
> +static const char *__initdata mps_inti_flags_polarity[] = { "dfl", "high",
> +                                                            "res", "low" };
> +static const char *__initdata mps_inti_flags_trigger[] = { "dfl", "edge", "res",
> 
> --- a/xen/drivers/acpi/utilities/utglobal.c
> +++ b/xen/drivers/acpi/utilities/utglobal.c
>  static const char *const acpi_gbl_region_types[ACPI_NUM_PREDEFINED_REGIONS] = {
> -	"SystemMemory",
> -	"SystemIO",
> -	"PCI_Config",
> -	"EmbeddedControl",
> -	"SMBus",
> -	"CMOS",
> -	"PCIBARTarget",
> -	"DataTable"
> +    "SystemMemory", "SystemIO", "PCI_Config",   "EmbeddedControl",
> +    "SMBus",        "CMOS",     "PCIBARTarget", "DataTable"
>  };

Why in the world would a tool need to touch anything like the two examples
above? My take is that the code is worse readability-wise afterwards.

> 2. Long strings in ptintk violations
> I filed an issue on printk format strings [5]
> ==============================================================================
> @@ -225,9 +231,9 @@ void __init acpi_table_print_madt_entry(struct acpi_subtable_header *header)
>          printk(KERN_DEBUG PREFIX
> -			       "GIC Distributor (gic_id[0x%04x] address[0x%"PRIx64"] gsi_base[%d])\n",
> -			       p->gic_id, p->base_address,
> -			       p->global_irq_base);
> +               "GIC Distributor (gic_id[0x%04x] address[0x%" PRIx64
> +               "] gsi_base[%d])\n",
> +               p->gic_id, p->base_address, p->global_irq_base);
> 
> @@ -629,12 +628,14 @@ acpi_parse_one_rmrr(struct acpi_dmar_header *header)
> -           printk(XENLOG_ERR VTDPREFIX
> -                  "Overlapping RMRRs [%"PRIx64",%"PRIx64"] and [%"PRIx64",%"PRIx64"]\n",
> -                  rmrru->base_address, rmrru->end_address,
> -                  base_addr, end_addr);
> +            printk(XENLOG_ERR VTDPREFIX "Overlapping RMRRs [%" PRIx64
> +                                        ",%" PRIx64 "] and [%" PRIx64
> +                                        ",%" PRIx64 "]\n",
> +                   rmrru->base_address, rmrru->end_address, base_addr,
> +                   end_addr);

This yet more definitely needs avoiding. Seeing that e.g. Linux also
makes line length exceptions for format string literals, I would seem
pretty likely that there already is a control to leave such alone.

> 3. String concatenation after clang - needs manual work to fix
> ==============================================================================
> --- a/xen/drivers/acpi/apei/apei-base.c
> +++ b/xen/drivers/acpi/apei/apei-base.c
> @@ -171,16 +169,19 @@ int __apei_exec_run(struct apei_exec_context *ctx, u8 action,
>                  printk(KERN_WARNING
> -                               "Invalid action table, unknown instruction "
> -                               "type: %d\n", entry->instruction);
> +                       "Invalid action table, unknown instruction " "type: %d\n",
> +                       entry->instruction);

Urgh. Why would it not join together the two literals?

> 4. Looks a bit weird, but correct
> ==============================================================================
> --- a/xen/drivers/acpi/apei/apei-io.c
> +++ b/xen/drivers/acpi/apei/apei-io.c
> @@ -80,13 +78,15 @@ static void __iomem *__init apei_range_map(paddr_t paddr, unsigned long size)
> -       pg = ((((paddr + size -1) & PAGE_MASK)
> -                - (paddr & PAGE_MASK)) >> PAGE_SHIFT) + 1;
> +    pg = ((((paddr + size - 1) & PAGE_MASK) - (paddr & PAGE_MASK)) >>
> +          PAGE_SHIFT) +
> +         1;

It trying to squash as much on the 1st line as it can, does it really put
the lone "1;" at a separate line?

> 7. Parentheses for empty functions
> ==============================================================================
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -1311,7 +1307,9 @@ void panic(const char *fmt, ...)
> -static void cf_check suspend_steal_fn(const char *str, size_t nr) { }
> +static void cf_check suspend_steal_fn(const char *str, size_t nr)
> +{}

While not the end of the world, an option for keeping the braces on the
same line surely would be worthwhile for them to support in the tool?

> 8. Const struct reformatting is weird and inconsistent
> ==============================================================================
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1050,135 +1055,93 @@ static const struct ns16550_config __initconst uart_config[] =
>       .param = param_oxford,
>       },
>      /* Pericom PI7C9X7951 Uno UART */
> -    {
> -        .vendor_id = PCI_VENDOR_ID_PERICOM,
> +    { .vendor_id = PCI_VENDOR_ID_PERICOM,
>       .dev_id = 0x7951,
> -        .param = param_pericom_1port
> -    },
> +     .param = param_pericom_1port },

A matter of some control that needs flipping? Readability again suffers
here quite a bit, imo.

> 9. Define is longer than 80 chars
> ==============================================================================
> --- a/xen/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
> @@ -27,10 +27,8 @@
> -#define MIN_STAT_SAMPLING_RATE                  \
> -    (MIN_SAMPLING_MILLISECS * MILLISECS(1))
> -#define MIN_SAMPLING_RATE                       \
> -    (def_sampling_rate / MIN_SAMPLING_RATE_RATIO)
> +#define MIN_STAT_SAMPLING_RATE               (MIN_SAMPLING_MILLISECS * MILLISECS(1))
> +#define MIN_SAMPLING_RATE                    (def_sampling_rate / MIN_SAMPLING_RATE_RATIO)

Oops. Transformed code violating a fundamental rule?

> 10. Union memebers require an empty line between them
> ==============================================================================
> --- a/xen/drivers/passthrough/amd/iommu-defs.h
> +++ b/xen/drivers/passthrough/amd/iommu-defs.h
> @@ -289,6 +289,7 @@ struct amd_iommu_dte {
>  
>  union amd_iommu_control {
>      uint64_t raw;
> +
>      struct {

This might be acceptable. It's a little wasteful for small unions, but
may be quite helpful for larger ones.

> 11. Multiline string alignment for at the first string, not for the function
> opening bracket. Depends on the macro before the string?
> ==============================================================================
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -748,18 +757,18 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>              printk(XENLOG_WARNING "SR-IOV device %pp has its virtual"
> -                   " functions already enabled (%04x)\n", &pdev->sbdf, ctrl);
> +                                  " functions already enabled (%04x)\n",
> +                   &pdev->sbdf, ctrl);

This kind of line wrapping wants manual adjustment up front then, imo:

            printk(XENLOG_WARNING
                   "SR-IOV device %pp has its virtual functions already enabled (%04x)\n",
                   &pdev->sbdf, ctrl);

Unless of course the tool can be convinced to do the transformations this
way in the first place.

> 11. const struct initializers are inconsistent
> I have filed a bug on clang-format for that [7]
> ==============================================================================
> 
> [snip]
> static const struct ns16550_config __initconst uart_config[] = {
> [snip]
>     /* OXPCIe200 1 Native UART  */
>     {
>      .vendor_id = PCI_VENDOR_ID_OXSEMI,
>      .dev_id = 0xc4cf,
>      .param = param_oxford,
>      },
>     /* Pericom PI7C9X7951 Uno UART */
>     { .vendor_id = PCI_VENDOR_ID_PERICOM,
>      .dev_id = 0x7951,
>      .param = param_pericom_1port },
> [snip]

Odd; related to point 8 I think.

Jan

