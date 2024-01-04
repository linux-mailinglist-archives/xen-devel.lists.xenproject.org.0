Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B3182404C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 12:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661510.1031230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLLYs-00014P-9n; Thu, 04 Jan 2024 11:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661510.1031230; Thu, 04 Jan 2024 11:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLLYs-000114-6y; Thu, 04 Jan 2024 11:06:54 +0000
Received: by outflank-mailman (input) for mailman id 661510;
 Thu, 04 Jan 2024 11:06:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLLYq-0000ek-TU
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 11:06:52 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cbd5caa-aaf1-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 12:06:51 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2cd0f4f306fso4421641fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 03:06:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d4-20020a92d5c4000000b0035fac895f48sm9098175ilq.29.2024.01.04.03.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 03:06:50 -0800 (PST)
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
X-Inumbo-ID: 5cbd5caa-aaf1-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704366411; x=1704971211; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vcDVCFcm680gqk+XNaj4OvK5RLa/d4T+NrZmRptQQLI=;
        b=NJZuxowvvD5XGvoAWsGD9wjBC9H5tRoPuhQn3AwmJStYuQJxItPOuz360rC06sK9zi
         /Ua3sAi1SsCimbPhBvpd3tNfif9bfFy7J6ON+j90kSoU45kPjK8hZVLl3QfWk26SFYcD
         gJoOKB8LCYfAkDE4RwyOom79ga71zUMijogjfpH2JsCbWt2KdSX1laMbs3tmAC9atNI/
         bDEsUP9UsYvtf7/WndsR1dVXze9mPuvK7ubXXpC5Lbh1FD0T7At9P80w6fU8oQNByMdZ
         uIyvD/dyrF8kKELgT927gXkAQJzMNw+cyS6o8sqtS+oK5jTGGKXpaew/rxW6McBtKI0J
         XvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704366411; x=1704971211;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcDVCFcm680gqk+XNaj4OvK5RLa/d4T+NrZmRptQQLI=;
        b=dRTjjZ7Gh+UhW9El9p7acOUzFbL6vUsW08Jnk545i7djpxz1Zj34z5Qn9HGkG2h0NS
         Sl3Gu/YNVlvhLgKXqpnnplTK4XI+Rcb6SGnf/bwpCofn11m13CdzlaZ/69SXDjGEaIgd
         ef/zlemz3s7xfDVoCVkOgkb3d7VwtnLVZD3gFIRpIB+KAjC0DQ98EzV7PEGwOAVzhjNU
         k4RHP9dPUuHBUccFFDLNivQRlpg6YEe4+kFqNcHVkPAGubdQDgFtP9xUySyn9RvJwlCD
         y5E2Q/sfJpOlShq1PVNlSfh9tyuz4hkEs30ATkm9yLmWcDtFEzwlqMRr4kTrJCQhmSkf
         hBaw==
X-Gm-Message-State: AOJu0YzLaWqNvMIKPPog7hElUbXovA9jNm9TCPrKZrMRJ6qhK86VnBal
	4mbQyG5kZBm8T0cXfR1cnpr+DVQw6rLy
X-Google-Smtp-Source: AGHT+IEiCKUtDSRqJpy8o1fbINsOv6noWCrar3jxK+dfqeRDgd9tFktKRr64aegL2OS5glwgcK7meA==
X-Received: by 2002:a2e:99ca:0:b0:2cc:8f7d:4e11 with SMTP id l10-20020a2e99ca000000b002cc8f7d4e11mr274307ljj.21.1704366411023;
        Thu, 04 Jan 2024 03:06:51 -0800 (PST)
Message-ID: <d096f14c-96ae-46a6-81fc-55ff8fcaaf39@suse.com>
Date: Thu, 4 Jan 2024 12:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/34] xen/asm-generic: introdure nospec.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <a1360d3de3da8757c69f11c3fafd99ff65654ae8.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a1360d3de3da8757c69f11c3fafd99ff65654ae8.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:12, Oleksii Kurochko wrote:
> The <asm/nospec.h> header is similar between Arm, PPC, and RISC-V,
> so it has been moved to asm-generic.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

A word may want saying though on ...

> --- a/xen/arch/arm/include/asm/nospec.h
> +++ b/xen/include/asm-generic/nospec.h
> @@ -1,8 +1,8 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/* Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved. */
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _ASM_GENERIC_NOSPEC_H
> +#define _ASM_GENERIC_NOSPEC_H

... the removal of the copyright line.

Jan

