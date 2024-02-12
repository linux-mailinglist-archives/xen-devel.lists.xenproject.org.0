Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C16D8517CC
	for <lists+xen-devel@lfdr.de>; Mon, 12 Feb 2024 16:18:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679646.1057206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZY4k-0005RP-6a; Mon, 12 Feb 2024 15:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679646.1057206; Mon, 12 Feb 2024 15:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZY4k-0005PE-3g; Mon, 12 Feb 2024 15:18:30 +0000
Received: by outflank-mailman (input) for mailman id 679646;
 Mon, 12 Feb 2024 15:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6iVD=JV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rZY4i-0005P6-VW
 for xen-devel@lists.xenproject.org; Mon, 12 Feb 2024 15:18:28 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8fb6ba9-c9b9-11ee-8a4c-1f161083a0e0;
 Mon, 12 Feb 2024 16:18:28 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4108cbd92b9so14961555e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Feb 2024 07:18:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cc19-20020a5d5c13000000b0033b728190c1sm6495099wrb.79.2024.02.12.07.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 07:18:27 -0800 (PST)
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
X-Inumbo-ID: f8fb6ba9-c9b9-11ee-8a4c-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707751107; x=1708355907; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Ggy6Dnpfi6Dgb+gTBMGbmPZ/TYNLlwNkwiEMz341IM=;
        b=c6MJ5A5ZMvulhk8oLFL51IobS5AhERtcFcSbl5rHR/LkDqmej29CEp1GHc78mPtj7r
         tph4RAiblaGLuMcsGhczPlXwu4X7ygQHE+RoaqBBQvLRdqPejjtr0IkJvtZkcd7b3w1V
         rNweIQ7xJvHg21RIaZ1mYD8J5bvsupCrbHH4Ven2JI1/ccmEA4Yns5PGliIngg2i8ycE
         8lisViL++wd8T8FmhbyPoK1RpWO9pTEJiuFVvEiRkZ+m+EDobC/oV6uMyMq6hY+9HbRh
         qcAPjth+ih8K0Y99EF/wmTUjXR2XBOzbiWgLFsiIgKACrtx09rxhP/0Q9K+nluViVR34
         Xb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707751107; x=1708355907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ggy6Dnpfi6Dgb+gTBMGbmPZ/TYNLlwNkwiEMz341IM=;
        b=Ctf4irIXSnP8IJb+wxGSkoAlI5uzGZ18jzJx5NMHAVdYk5/UDaYY0oyz6Unor9U6Bb
         1M1U97uVjhoFa8Cs5QiE1sYTq7GSvBfFa0cOf5FnESngYTfJXmPcovUG8CHAd+FEuCtH
         JejGrbpZ2rWQ15Efk8i5k+WerZ91l8Mkirxh84Ce2Fg7Db2eS3sAbhfIKVUgswEFw19M
         tYuouGWCAIQbzAdXuIxT+vT7YOpa4dXm8xr7A64HX2EeLAIOkX0T6u8m2vlxC5NJzya+
         cKT0IrSPrFY+QM3ufq0fv+L5ID9VKbxXooOkmllbvCoL5uC2ebvNUD/hVqnj0WnU/vYg
         RM2g==
X-Gm-Message-State: AOJu0YxHRN1QAm0Ou6//cxv67/3W8d2tB+XIoVaTTj3/PyUd7eMcpVFD
	FjYRLbR2n48uOj/YO/4te/pO06kMYTNUqiQVAFr5uZvgVM22osZdBjbZQ9OTDA==
X-Google-Smtp-Source: AGHT+IHwugeM2iLrEzHqBY7Xru4PyBDGo+16Xh99k9svqexfzulWmBNOmbLkVNVh0HZ0tV8Qtzkpyg==
X-Received: by 2002:a05:600c:34d5:b0:410:cd66:e2ec with SMTP id d21-20020a05600c34d500b00410cd66e2ecmr2618394wmq.10.1707751107461;
        Mon, 12 Feb 2024 07:18:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGMWfSFxSy0gbEyiXdz0laXnAdETi0GG+Mp9rnNqzilSnAjLq/zySJGkeDxOLR/rdtOmRzf8KPe9qTONFozlbtfsWFIVxK9r+YkM275GpdcCEFmfbrUrE50lcbUstYyk4BTvs18GxC9NWpHy8XqpWAgQ+ojWu0KBuPfT2fObF6rsiSiXQU+GPGi8m3JC1hF2jmvqeHA6A6ZkcSrQKzQOkTqDn/1JYUW8lDwNzOmUTJgSERs068VjApygz7/tbezicxq0oKy0TnjnZzIDr7FuWrw0M+6JmXRopo+gmHoWPwrDROJRXkpbk=
Message-ID: <2962005e-252f-453e-a8fe-25856b16fe57@suse.com>
Date: Mon, 12 Feb 2024 16:18:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/30] xen/riscv: introduce time.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
 <f0a4566c185469fa9f5de41b5bbbc7234cfa9912.1707146506.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f0a4566c185469fa9f5de41b5bbbc7234cfa9912.1707146506.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 16:32, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Nevertheless ...

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/time.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_RISCV_TIME_H__
> +#define __ASM_RISCV_TIME_H__
> +
> +#include <xen/bug.h>
> +#include <asm/csr.h>
> +
> +struct vcpu;
> +
> +/* TODO: implement */
> +static inline void force_update_vcpu_system_time(struct vcpu *v) { BUG_ON("unimplemented"); }

... nit: Too long line. The comment also doesn't look to serve any purpose
anymore, with the BUG_ON() now taking uniform shape.

Jan

