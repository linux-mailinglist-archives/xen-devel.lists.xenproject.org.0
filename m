Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C863A808A8D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 15:28:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649932.1015077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFMm-0003Ha-PZ; Thu, 07 Dec 2023 14:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649932.1015077; Thu, 07 Dec 2023 14:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBFMm-0003Db-Mw; Thu, 07 Dec 2023 14:28:40 +0000
Received: by outflank-mailman (input) for mailman id 649932;
 Thu, 07 Dec 2023 14:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBFMl-0003BS-C3
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 14:28:39 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8c22b54-950c-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 15:28:37 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c2308faedso10500235e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 06:28:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 w8-20020adfcd08000000b003334675634bsm1579129wrm.29.2023.12.07.06.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 06:28:36 -0800 (PST)
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
X-Inumbo-ID: e8c22b54-950c-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701959317; x=1702564117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cCmKBpJRZgaUMf9UAujTHn5BKRdHfb1LXLTwxNOGs30=;
        b=dIqeWo9y1S5cuqFCppXkQCsc7m72goKP+I4m+fk+5zS6DvfK/4svXyHLKnpGypUJMF
         4ZHDCiMfn5Han2QQKOK297Y2w/vzZXY3wlZoF02gd3W+YHZCkbcX/8gqlgw53yImAwvL
         6qBRSFPBNwNQyfdH5cx6tfW1fgVDCmPCcuhrDh/Zb6s6Q0K598UHM1yxDRXGcO29UfxW
         LB9AGavone1hX+4TyLsoe3gcfbKo061QpH9xzPJ9SBIvccPp4FrnX3bcD+dmFvUXMtGz
         fpCJfVTgbaN/7EXl6XaS69WNGQSVmsQ3/PJBZTVu/6toNuTpy9wbjHeAehhDqHqYHTOU
         y2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701959317; x=1702564117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cCmKBpJRZgaUMf9UAujTHn5BKRdHfb1LXLTwxNOGs30=;
        b=fJ0crLhEQ8iQVMcf6Els9pBT7SbdyoYehmU7tgEJ5UYBGeU5sLintoDVVL80pJUCgZ
         I3e0kZEslN1FnOSuhMW15DiznuIEf50isD5HPXTPCYq5PJy0UvlrCQArvpiVgtirPLKl
         ywBc6alYbYQRddgL+rcEAv7ZcecteiNJDKUdxNyGefDNlpVH+bUq1u6OEqdegrtChTV/
         msQ36mOAnnVUtha/u6J+rKvFeJv+zWJ92FzTR1rYcfmxVj6xB1Inm8tZ3ufAKBXQ6qZ6
         RV6RjCv1QkU++OKfyrdBLbqvyRaaVExn2scGD6l2VaKOMslxu9MWHyQqLH8vL8Hcsn03
         iPww==
X-Gm-Message-State: AOJu0YzuBvEQkUrH+Su9DbbnoeQn+uHbpd69R+Z9u8YajpJA4oWog+Q5
	ua6X2NJvI9XX9dfw8k6Ghf8a
X-Google-Smtp-Source: AGHT+IF7emHVHUERF50DACvpu/A04Q/OkPhDEempSwVEI5PWtj3CKJOug5KUW4aBU6VLBtzlwLflEQ==
X-Received: by 2002:a05:600c:ad5:b0:40b:5e1e:cf6 with SMTP id c21-20020a05600c0ad500b0040b5e1e0cf6mr1762990wmr.49.1701959316843;
        Thu, 07 Dec 2023 06:28:36 -0800 (PST)
Message-ID: <028532fb-55d4-4a08-9b93-9ae29ed8e37c@suse.com>
Date: Thu, 7 Dec 2023 15:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/39] xen/riscv: introduce asm/nospec.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <aa2ff1df494f82f7c045f913371d3b9d04962a5e.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <aa2ff1df494f82f7c045f913371d3b9d04962a5e.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/nospec.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved. */
> +
> +#ifndef _ASM_RISCV_NOSPEC_H
> +#define _ASM_RISCV_NOSPEC_H
> +
> +static inline bool evaluate_nospec(bool condition)
> +{
> +    return condition;
> +}
> +
> +static inline void block_speculation(void)
> +{
> +}
> +
> +#endif /* _ASM_RISCV_NOSPEC_H */

This being identical between Arm, PPC, and now RISC-V, wouldn't this be another
asm-generic/ candidate? (Whether such trivial stubs are copyrightable is, as
per earlier remarks, at least questionable to me.)

Jan

