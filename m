Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C3EAF5B26
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031247.1405014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWySs-00047l-4k; Wed, 02 Jul 2025 14:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031247.1405014; Wed, 02 Jul 2025 14:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWySs-00046C-0z; Wed, 02 Jul 2025 14:29:34 +0000
Received: by outflank-mailman (input) for mailman id 1031247;
 Wed, 02 Jul 2025 14:29:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWySq-000466-2B
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:29:32 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f688be97-5750-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 16:29:29 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a6d1369d4eso3841590f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:29:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c71c3e272sm12037095ad.215.2025.07.02.07.29.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 07:29:28 -0700 (PDT)
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
X-Inumbo-ID: f688be97-5750-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751466569; x=1752071369; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVS6ItOAqNbZvEsr9Poch0d7Y0coplkCqvSKoN65wQE=;
        b=JqiX9q5wrDqZTn5IdXO6Kt2b4thK3DTvgxoZcjVfp2WD2EuefYv/wqXF7yp+aNNV44
         1DkOLczQ74eJgtpUPBB2oFtUQiZIt1shFZB7h1K6h4b/8MCYzr6c06dcsABEEyEy1/QA
         oztCvsFJlcsGTo0ZkHlOL4rc8gZJd0pCYetrPJpSOUU3p3I/tXkyutv9lh99yguM3tcp
         2QGabI5k2jHGL5EeYXh55gdP53eNRdL7bakYzMwnkV/LbAN3yaULdiprt/eIXtKZMsYU
         YWi+l9FXraNv5kx6BM9ejQ5b0t8twYIJNPBzaQdl4bPgBNEk/02G0Vo1R3KmW8nxOe9P
         3XKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466569; x=1752071369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVS6ItOAqNbZvEsr9Poch0d7Y0coplkCqvSKoN65wQE=;
        b=V2qmk0O11TGTh/7bkuziC5jV+54eOGOcmPHQRuwsNMkCNPWYnNYvk9dvBoPBd2Qxl1
         kVKkRtXFl6ApyhpJyP1vw9r1KKRp0fVPt6V5QxaXZW1yfVmdjwwSERz+i4/zV4lJsNFN
         HacdttK3N/NX6OZ4W8nzgY1XFLAYz3kbcdwv/e1Qx/iRW4rmJmX46jHzoIiILD+zReGF
         j+z1xSDW2O+b8ZzCvuZ/hOdkAWrkgkMOR8GrowQxp47vTbniOTjymrPSV/nfqx+t5G3x
         ejEyh4NA2qotT+gvmWIHPqD590lzLEzWPqkMkuyh0ZTXuqdFGfGUdjnsDxoLnBn4uOhm
         Co4w==
X-Forwarded-Encrypted: i=1; AJvYcCWuh0ETuIcZxnM8qLEsETL/tCHs/9T2vdKttKStW+/8LkpI/cApoRi27MtVmU13wWmZ3GPTCFt7IGo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJ5ENghXlsUBXDhK9eGQzmY34lOfnHm0Bk4Ylh17Fyjivn9zch
	O+Jl2yppM4no+yXlxuRBqiBCuAy+5wSDUvgyj/60isRTIUPBF1x3yvq5r9GfwcQusA==
X-Gm-Gg: ASbGncs/7BMqSQ1Xo1mZ6apBvCH20VOLIQOQFzn7EbyLEzjvctk0lsLfCXueFwMZX86
	po1ds/jGQrIN2OtGGlkXeWkT3xWJGeS+AwsJWuVsli1OgHcMQm8e6vgZUT58Ho2cPGOpFt9tCY8
	KZtauY8KddvK09OW1p7D7lH5dpQejHr5kLlcx//IrOZujWjAKUPLrgynf6Y8JFCnNoIJB+7BMg5
	RcXvIzh0cxwsnC0eQz6bPNREVxUqpJ1iZXRc6uyNqDHBt9GfyiLWsFdvZE8xR0qDNNfPQwOoVMc
	iWq+Q2tVfRgYSbLCy8ljNm4hbTdpwQHwM4P+M3NviHeGvQNHkwhe/IQvmnZ6WKf4tYWHiE18QWo
	/gWMAWsLnr30ug3BdgVH8JRWSnS6c0w4bCiUHi8lUkp9qzPkr+c7kCkYz6g==
X-Google-Smtp-Source: AGHT+IHeG3gsgbArRF/hWOrqDH1C//d3o867bvnBG7qQUMw8OHtVGFrd9j2DlXLMDtVxDUIr4qac/Q==
X-Received: by 2002:a05:6000:4704:b0:3a5:2182:bd11 with SMTP id ffacd0b85a97d-3b1fe6b681emr2559038f8f.20.1751466568766;
        Wed, 02 Jul 2025 07:29:28 -0700 (PDT)
Message-ID: <ce7ff2f4-4657-45a6-98ea-7f6d3a448447@suse.com>
Date: Wed, 2 Jul 2025 16:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=C3=B3wka?=
 <mateusz.mowka@intel.com>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5da8e6c9fd2d986cd99be35774b850584e4a43ee.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <5da8e6c9fd2d986cd99be35774b850584e4a43ee.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> From: Krystian Hebel <krystian.hebel@3mdeb.com>
> 
> The file contains base address of TXT register spaces, offsets of
> registers within them, error codes and inline functions for accessing
> structures stored on TXT heap.
> 
> xen/arch/x86/tboot.c is updated to use definitions from this new header
> instead of duplicating them.  The change in tboot_protect_mem_regions()
> there is caused by going from NR_TXT_CONFIG_PAGES to
> TXT_CONFIG_SPACE_SIZE which avoids multiplying number of pages by page
> size on every use.
> 
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> ---
>  xen/arch/x86/include/asm/intel-txt.h | 297 +++++++++++++++++++++++++++
>  xen/arch/x86/tboot.c                 |  20 +-
>  2 files changed, 299 insertions(+), 18 deletions(-)
>  create mode 100644 xen/arch/x86/include/asm/intel-txt.h
> 

Btw, a brief rev log would be nice here. I saw you have something in the
cover letter, but having to look in two places isn't very helpful.

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/intel-txt.h
> @@ -0,0 +1,297 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Intel TXT is an implementation of DRTM in CPUs made by Intel (although CPU
> + * alone isn't enough, chipset must support TXT as well).
> + *
> + * Overview:
> + *   https://www.intel.com/content/www/us/en/support/articles/000025873/processors.html
> + * Software Development Guide (SDG):
> + *   https://www.intel.com/content/www/us/en/content-details/315168/
> + */
> +
> +#ifndef X86_INTEL_TXT_H
> +#define X86_INTEL_TXT_H
> +
> +/*
> + * TXT configuration registers (offsets from TXT_{PUB, PRIV}_CONFIG_REGS_BASE)
> + */
> +#define TXT_PUB_CONFIG_REGS_BASE        0xfed30000U
> +#define TXT_PRIV_CONFIG_REGS_BASE       0xfed20000U
> +
> +/*
> + * The same set of registers is exposed twice (with different permissions) and
> + * they are allocated continuously with page alignment.
> + */
> +#define TXT_CONFIG_SPACE_SIZE \
> +    (TXT_PUB_CONFIG_REGS_BASE - TXT_PRIV_CONFIG_REGS_BASE)
> +
> +/* Offsets from pub/priv config space. */
> +#define TXTCR_STS                       0x0000
> +#define TXTCR_ESTS                      0x0008
> +#define TXTCR_ERRORCODE                 0x0030
> +#define TXTCR_CMD_RESET                 0x0038
> +#define TXTCR_CMD_CLOSE_PRIVATE         0x0048
> +#define TXTCR_DIDVID                    0x0110
> +#define TXTCR_VER_EMIF                  0x0200
> +#define TXTCR_CMD_UNLOCK_MEM_CONFIG     0x0218
> +#define TXTCR_SINIT_BASE                0x0270
> +#define TXTCR_SINIT_SIZE                0x0278
> +#define TXTCR_MLE_JOIN                  0x0290
> +#define TXTCR_HEAP_BASE                 0x0300
> +#define TXTCR_HEAP_SIZE                 0x0308
> +#define TXTCR_SCRATCHPAD                0x0378
> +#define TXTCR_CMD_OPEN_LOCALITY1        0x0380
> +#define TXTCR_CMD_CLOSE_LOCALITY1       0x0388
> +#define TXTCR_CMD_OPEN_LOCALITY2        0x0390
> +#define TXTCR_CMD_CLOSE_LOCALITY2       0x0398
> +#define TXTCR_CMD_SECRETS               0x08e0
> +#define TXTCR_CMD_NO_SECRETS            0x08e8
> +#define TXTCR_E2STS                     0x08f0
> +
> +/*
> + * Secure Launch Defined Error Codes used in MLE-initiated TXT resets.
> + *
> + * TXT Specification
> + * Appendix I ACM Error Codes
> + */
> +#define SLAUNCH_ERROR_GENERIC                0xc0008001U
> +#define SLAUNCH_ERROR_TPM_INIT               0xc0008002U
> +#define SLAUNCH_ERROR_TPM_INVALID_LOG20      0xc0008003U
> +#define SLAUNCH_ERROR_TPM_LOGGING_FAILED     0xc0008004U
> +#define SLAUNCH_ERROR_REGION_STRADDLE_4GB    0xc0008005U
> +#define SLAUNCH_ERROR_TPM_EXTEND             0xc0008006U
> +#define SLAUNCH_ERROR_MTRR_INV_VCNT          0xc0008007U
> +#define SLAUNCH_ERROR_MTRR_INV_DEF_TYPE      0xc0008008U
> +#define SLAUNCH_ERROR_MTRR_INV_BASE          0xc0008009U
> +#define SLAUNCH_ERROR_MTRR_INV_MASK          0xc000800aU
> +#define SLAUNCH_ERROR_MSR_INV_MISC_EN        0xc000800bU
> +#define SLAUNCH_ERROR_INV_AP_INTERRUPT       0xc000800cU
> +#define SLAUNCH_ERROR_INTEGER_OVERFLOW       0xc000800dU
> +#define SLAUNCH_ERROR_HEAP_WALK              0xc000800eU
> +#define SLAUNCH_ERROR_HEAP_MAP               0xc000800fU
> +#define SLAUNCH_ERROR_REGION_ABOVE_4GB       0xc0008010U
> +#define SLAUNCH_ERROR_HEAP_INVALID_DMAR      0xc0008011U
> +#define SLAUNCH_ERROR_HEAP_DMAR_SIZE         0xc0008012U
> +#define SLAUNCH_ERROR_HEAP_DMAR_MAP          0xc0008013U
> +#define SLAUNCH_ERROR_HI_PMR_BASE            0xc0008014U
> +#define SLAUNCH_ERROR_HI_PMR_SIZE            0xc0008015U
> +#define SLAUNCH_ERROR_LO_PMR_BASE            0xc0008016U
> +#define SLAUNCH_ERROR_LO_PMR_SIZE            0xc0008017U
> +#define SLAUNCH_ERROR_LO_PMR_MLE             0xc0008018U
> +#define SLAUNCH_ERROR_INITRD_TOO_BIG         0xc0008019U
> +#define SLAUNCH_ERROR_HEAP_ZERO_OFFSET       0xc000801aU
> +#define SLAUNCH_ERROR_WAKE_BLOCK_TOO_SMALL   0xc000801bU
> +#define SLAUNCH_ERROR_MLE_BUFFER_OVERLAP     0xc000801cU
> +#define SLAUNCH_ERROR_BUFFER_BEYOND_PMR      0xc000801dU
> +#define SLAUNCH_ERROR_OS_SINIT_BAD_VERSION   0xc000801eU
> +#define SLAUNCH_ERROR_EVENTLOG_MAP           0xc000801fU
> +#define SLAUNCH_ERROR_TPM_NUMBER_ALGS        0xc0008020U
> +#define SLAUNCH_ERROR_TPM_UNKNOWN_DIGEST     0xc0008021U
> +#define SLAUNCH_ERROR_TPM_INVALID_EVENT      0xc0008022U
> +
> +#define SLAUNCH_BOOTLOADER_MAGIC             0x4c534254
> +
> +#ifndef __ASSEMBLY__
> +
> +/* Need to differentiate between pre- and post paging enabled. */
> +#ifdef __EARLY_SLAUNCH__
> +#include <xen/macros.h>
> +#define _txt(x) _p(x)
> +#else
> +#include <xen/types.h>
> +#include <asm/page.h>   // __va()

Nit: No C++ style comments, please.

> +#define _txt(x) __va(x)
> +#endif

Without any uses the correctness of the above is hard to judge.

> +/*
> + * Always use private space as some of registers are either read-only or not
> + * present in public space.
> + */
> +static inline uint64_t txt_read(unsigned int reg_no)
> +{
> +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
> +    return *reg;
> +}
> +
> +static inline void txt_write(unsigned int reg_no, uint64_t val)
> +{
> +    volatile uint64_t *reg = _txt(TXT_PRIV_CONFIG_REGS_BASE + reg_no);
> +    *reg = val;
> +}
> +
> +static inline void noreturn txt_reset(uint32_t error)
> +{
> +    txt_write(TXTCR_ERRORCODE, error);
> +    txt_write(TXTCR_CMD_NO_SECRETS, 1);
> +    txt_write(TXTCR_CMD_UNLOCK_MEM_CONFIG, 1);
> +    /*
> +     * This serves as TXT register barrier after writing to
> +     * TXTCR_CMD_UNLOCK_MEM_CONFIG. Must be done to ensure that any future
> +     * chipset operations see the write.
> +     */
> +    (void)txt_read(TXTCR_ESTS);

I don't think the cast is needed.

> +    txt_write(TXTCR_CMD_RESET, 1);
> +    unreachable();

What guarantees the write to take immediate effect? That is, shouldn't there
be e.g. an infinite loop here, just in case?

> +static inline uint64_t txt_bios_data_size(const void *heap)
> +{
> +    return *(const uint64_t *)heap - sizeof(uint64_t);

Like you already do here, ...

> +}
> +
> +static inline void *txt_bios_data_start(const void *heap)
> +{
> +    return (void *)heap + sizeof(uint64_t);

... please don't cast away const-ness. I'm pretty sure I said before that
Misra objects to us doing so.

> @@ -409,7 +393,7 @@ int __init tboot_protect_mem_regions(void)
>  
>      /* TXT Private Space */
>      rc = e820_change_range_type(&e820, TXT_PRIV_CONFIG_REGS_BASE,
> -                 TXT_PRIV_CONFIG_REGS_BASE + NR_TXT_CONFIG_PAGES * PAGE_SIZE,
> +                 TXT_PRIV_CONFIG_REGS_BASE + NR_TXT_CONFIG_SIZE,

Was this perhaps meant to be TXT_CONFIG_SPACE_SIZE?

Jan

