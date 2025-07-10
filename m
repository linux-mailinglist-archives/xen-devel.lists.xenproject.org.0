Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DC4B000E7
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 13:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039425.1411274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZptT-000356-6W; Thu, 10 Jul 2025 11:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039425.1411274; Thu, 10 Jul 2025 11:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZptT-00032B-29; Thu, 10 Jul 2025 11:56:51 +0000
Received: by outflank-mailman (input) for mailman id 1039425;
 Thu, 10 Jul 2025 11:56:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZptR-000324-Kv
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 11:56:49 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f37fd46b-5d84-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 13:56:45 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a510432236so701685f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 04:56:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c3eb65aa2sm2131500a91.40.2025.07.10.04.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 04:56:44 -0700 (PDT)
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
X-Inumbo-ID: f37fd46b-5d84-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752148605; x=1752753405; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E4jzN2F6fP4BFDLlHZbaDNr7w3GWxW/p37sLB0AN0fE=;
        b=T3SjCWz7bjO+Jjx5+ZZHm0UcgnM8hezFIt3fKEG5zJCSF5/A89pWwgTZAY/Mz2ToQA
         iWuOSW36jRBgZu+7Gtt/aAP9R+OtC7vluZsRNjhIVJ6b9RpZADfG9EW8s9rIFjvW4mb5
         CNf6jQfA8f19gd0DV+bvInxP4O4q6Y425fMo588ab7TlzCWPGbR9HrN6M24YmMMyLEaP
         yYczIcGr0/p+VGt8K0l4Iuqq5BgDRIaZlyu6EGbgE3XEymVUFmYkxJbKZXq04AZtGyLD
         hSaG+eQDl11foqGDPeXWsu4la2MXCdz3sYVn7cri21gA5oZlxvdAbYx3ZUL9rRZbCE8Q
         uYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752148605; x=1752753405;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4jzN2F6fP4BFDLlHZbaDNr7w3GWxW/p37sLB0AN0fE=;
        b=D0PcUvgeAjr5eXx2dWqn8xh9N+0xx3MQQLGD5n+/HMfJ7RRg9/rFaxh1HeQoQwoJs7
         Sm0vpbs+RoySFGb4hOlAfYpuXb9IxsX23uCr62Eh6yFBisQ1z3j1mWgUldkFleBrXE1a
         4BCkEsaiC2JAP95sw5V/++i3hRVXu5TOjqIkXateL4/GRFYllCOT4PxOPmwQNRQMV1W2
         uHlP+1pPDXr36hS8ntFY0Kr0LS0CtGrEawQyzPN3kwOA5VUA394entRjqNLMnn3DN2lt
         jp3xaoXwIUlQdQAiTmnhpaR/YMw9u8uKExncdZQTRS2fW4BBUp5Bgfkbzku0ADnPBMX8
         SPNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSS5EGFRz+yPWa1AaXiOMD3vT4iUxtgVEsCNvKBzsoZbKexC/SNNvdCnlO32RM+LPIpSljrYX4rQo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlrSaJSTu6rGLu7DhV/YEUTLuR4NK2ONwv2tFddQQipotjRoNS
	aQ8X7ypo0o/efG6SZqjgRHHi7QJUDayoZ+0y/R8kH3GEW7oG/oHTbLi7115wBl7kuw==
X-Gm-Gg: ASbGncsIGE0s47HedSd8MR93EG/vXJYl+MlGU4FSCpZmm9ioZKFsElEQVv2odFbNGCI
	3ivVtAQYN9S8MJ588s3ircj29ZYfK7eIbyDE9leDHCxa1gMzm70zp8S/KYngyHW3kpsmz7BPYHT
	rhB7Eyuogu2K0/nqefKtixoKVs447gX4+n2hqP2N6MMv2m41hKVEX0+0kl+LRmawnyyXS7XsLkT
	chCB+YvJvTu89r0KNWHedtKpnGc/V0+w1ril0NdCDL/aEPw5SpJhMpCeMlbHoHSJZZ6oIF52Mf1
	Jy2hNfssOu9QY/uN0dy/hamicj5mTOg/9Nm8keAKbshGazzMpCpyo3WW267V9Eqf0OCdN6zM+ZV
	OaddmibJy0oMujqIPVmtjjdpdd5tYUceP5f9R8Nl+QpvD5ew=
X-Google-Smtp-Source: AGHT+IFVemCn+TzsaoENjFDOrjK7iJnXDImT3Ul2FFqNU958jH1RdzfSz7V/GKUkjrwcSnHCh3Mq/g==
X-Received: by 2002:a05:6000:40cb:b0:3a4:e629:6504 with SMTP id ffacd0b85a97d-3b5e86df08amr2661488f8f.49.1752148604601;
        Thu, 10 Jul 2025 04:56:44 -0700 (PDT)
Message-ID: <91b52761-1cb7-48f1-8e68-58722ca32e2d@suse.com>
Date: Thu, 10 Jul 2025 13:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] xen/riscv: aplic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1751876912.git.oleksii.kurochko@gmail.com>
 <a15b1426f14bb8f7f6385db9c13e584b55e4c91a.1751876912.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a15b1426f14bb8f7f6385db9c13e584b55e4c91a.1751876912.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 11:01, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/aplic-priv.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/aplic-priv.h
> + *
> + * Private part of aplic.h header.
> + *
> + * RISC-V Advanced Platform-Level Interrupt Controller support
> + *
> + * Copyright (c) Microchip.
> + * Copyright (c) Vates.
> + */
> +
> +#ifndef ASM_RISCV_PRIV_APLIC_H
> +#define ASM_RISCV_PRIV_APLIC_H

While, as indicated in an earlier reply, I didn't make the section placement
change originally suggested, I did take the liberty to correct the order of
name components of this header guard.

Jan

