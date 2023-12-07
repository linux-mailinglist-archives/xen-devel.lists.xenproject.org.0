Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D13808A63
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:23:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649920.1015048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFHM-0000HY-NP; Thu, 07 Dec 2023 14:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649920.1015048; Thu, 07 Dec 2023 14:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFHM-0000FA-JD; Thu, 07 Dec 2023 14:23:04 +0000
Received: by outflank-mailman (input) for mailman id 649920;
 Thu, 07 Dec 2023 14:23:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBFHK-0000F2-Cp
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 14:23:02 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1feff1ae-950c-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 15:23:00 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3333fbbeab9so934954f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 06:23:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dh8-20020a0560000a8800b00334b3208700sm1553170wrb.49.2023.12.07.06.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 06:22:59 -0800 (PST)
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
X-Inumbo-ID: 1feff1ae-950c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701958980; x=1702563780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pIsiaEzH5NUQ+ns68qpu+is/X8iyqsCfhMGb8tn4vw8=;
        b=giBNKnDO+4ZpQekFZAAyESD3qV7Q+ku7uNnI/NHTwYZnMEyMYJOUTZRJ8lgVH+iQNf
         nIKWSVOw/gUOdA+WfI0Pg+mWo3jwHVjiiMvnnQyd1U5MtP1+Mq8/1C3+fa7PzLw3nGIT
         RYxEagDQoYedgziSG/weNTGjJXJPGN3iQofuv0GVATBXCVnjPrRhsE53DF2rZ2q0qtDi
         Sowh7VDiib4iRC8kVhNkB0Vp4atZ1JTAVUUOvWTG4shU9EZ1JkuMYD3tBh/B/TM+jNPA
         DqVCpqaKxRYAkKJHZenbTFUXnF3K90fDvcXjPqJfVgzlKVyFmgCRboeyso1i6gs/2KNL
         hUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701958980; x=1702563780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pIsiaEzH5NUQ+ns68qpu+is/X8iyqsCfhMGb8tn4vw8=;
        b=GkYbePN7lAoFuUrr83h70Te4j18U6m0IaYBcDnPjnptZdMocF8xa3UAANA2Hzb2sGj
         Vi6ChXvOEG90vTeK27YEaaNxVCAVbfbyJhtttXwMD5QhjslmYAqFkOteeJk65EiDZChy
         7WESWgjcEOHDCYhRappe+RbJ4ggi4Y23FLXdfCyZeQ4+yJRMEs9vpCFSmZybLyfLXVWN
         CdlucM5xlipwr2a1FLWUiKoIok3TK4BdDbveH+/jI+O6LR58rw4IAIRFMSXbog6eVFHo
         Q/DA8ZH0j/vBfGsnaZDfa+OL4x/oDsgdFItow9dbMvCuq4qXkFhZOBYdI4vEkVhGCAWC
         H30Q==
X-Gm-Message-State: AOJu0YwpUzovHe1Edf6HpsIx0fE0UJIrgSJ22sb8stFL7bfenk4qCdvF
	XSZNrDRwLAgBc0kg/clzEfQf
X-Google-Smtp-Source: AGHT+IFt0P1ocNHBxJKBZAabwIbCiKGGMVmmHpcpVpspEEiDSNxk1Jv3r0W2KtZGYInUluBCp/IbJQ==
X-Received: by 2002:a5d:4cc9:0:b0:333:2fd2:68eb with SMTP id c9-20020a5d4cc9000000b003332fd268ebmr1403779wrt.126.1701958979984;
        Thu, 07 Dec 2023 06:22:59 -0800 (PST)
Message-ID: <ca13b1b0-8b96-47b0-abc5-9711f96ccca0@suse.com>
Date: Thu, 7 Dec 2023 15:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/39] xen/riscv: introduce asm/iommu.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <68be3d368bf6ed96b0bb53b51a2fd07696cb338d.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <68be3d368bf6ed96b0bb53b51a2fd07696cb338d.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/iommu.h
> @@ -0,0 +1,7 @@
> +#ifndef __ASM_RISCV_IOMMU_H__
> +#define __ASM_RISCV_IOMMU_H__
> +
> +struct arch_iommu {
> +};
> +
> +#endif /* __ASM_IOMMU_H__ */

Instead of adding this header, didn't we discuss to make the #include in
xen/iommu.h depend on CONFIG_HAS_PASSTHROUGH? Also - no SPDX or footer
here?

Jan

