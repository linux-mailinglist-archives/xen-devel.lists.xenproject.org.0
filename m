Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD5C8185C1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 11:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656657.1024993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXli-0000cQ-2F; Tue, 19 Dec 2023 10:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656657.1024993; Tue, 19 Dec 2023 10:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFXlh-0000Zx-Vu; Tue, 19 Dec 2023 10:56:09 +0000
Received: by outflank-mailman (input) for mailman id 656657;
 Tue, 19 Dec 2023 10:56:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFXlg-0000Zr-S4
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 10:56:08 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35d986a7-9e5d-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 11:56:06 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40c6e2a47f6so45088265e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 02:56:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c444800b0040d2e37c06dsm115080wmn.20.2023.12.19.02.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 02:56:06 -0800 (PST)
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
X-Inumbo-ID: 35d986a7-9e5d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702983366; x=1703588166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8P0LbAGXmgn2QmUozUT+jsEZFbsokZnnQ66xwGEyQfc=;
        b=OD4L80/zD5YSIV7gLIaNT14aBu6nInfbEl4u46+Bc5x7NvdI8O9BgcKcNiXZnBzxuD
         aID+IZ5zTPwQHg5AMDqZyyncOsqm+biuVSPWPlZLlrMu7B74nZTp3SVAHUl1/sIqi91j
         r+Td7E3Z72IECKWvrZJIfSOA49jHwS8AYlx9HsnkMvZzVkbPdAUdUBG+5rVaIX47zWt5
         VyX8gyL8fEE6Jcg+yvS3buHmw5HIJVtMw+ZS+CLQQnaHAGj9JthRT0qc0CFB/e16u6UA
         p4Udq8hsa2Z44y80lwOY2dE+J+BZO230n2t1mJCHwTioq3tuFDPJ5mhKmtYcuBUJ8rI0
         rSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702983366; x=1703588166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8P0LbAGXmgn2QmUozUT+jsEZFbsokZnnQ66xwGEyQfc=;
        b=D6xAMYSfBYaXpfCn4pUXF5xLhWtOYgiwnbZtRjnwEaMUQLxttaJtaD3RdDn3ufU0Lr
         inMMLky8D9DHJ5DS9rkauByYNhlvJtwYUKwoYfg9tVK0MAfrdkEadQp2s06Shp70l1Cx
         FtkC16Us/EuE0ZffI0TOy8QwMrbFVpPEPLTcsDmH8F3W4GVcnIAYUSUsHWZOg6o83P1l
         xJXcABWfG7xhC5tHbDyBI8mwfoP7f1QA4fLcpNGMmCuZRMmMuTciZ5/vXlPc2NE/RgKQ
         SGPJBe3IY6Uxka/Hc1cRiSAPdYG8B+zA/InFpg8YA9umP+XEt5olUAv3k/LcQiwl0wm1
         l67g==
X-Gm-Message-State: AOJu0YzYYR11BVZWlEh2obJIxaLxMMmwurrOrUAFkYKFetEBRO9bBkFm
	J8v+rZWHiLVSiPtcMhxWahXS
X-Google-Smtp-Source: AGHT+IFZ+rcC27FHgh6fetvkrbne6swDSH114IRlBMbPRaFw2AAggOIAgL/5ZUF2AIjfWhSKp9ovMQ==
X-Received: by 2002:a05:600c:1c0d:b0:40d:258e:fe9f with SMTP id j13-20020a05600c1c0d00b0040d258efe9fmr208994wms.90.1702983366409;
        Tue, 19 Dec 2023 02:56:06 -0800 (PST)
Message-ID: <000ee2b2-9010-4c43-94de-1c8ea2bd8a61@suse.com>
Date: Tue, 19 Dec 2023 11:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 2/7] x86/mm: address MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1702891792.git.nicola.vetrini@bugseng.com>
 <1cd82cf19a613a122a770bf6670e681ca7fccd44.1702891792.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <1cd82cf19a613a122a770bf6670e681ca7fccd44.1702891792.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.12.2023 11:17, Nicola Vetrini wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4887,8 +4887,6 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      default:
>          return subarch_memory_op(cmd, arg);
>      }
> -
> -    return 0;
>  }

When a function is small and it's easy to see that all paths return by
other means, omitting such a final "return <value>" is imo okay. Here,
however, this isn't easy to see, and hence omitting the return is
confusing in a different way from having the return. I guess I'll make
an alternative change (as iirc I had outlined before), for other x86
maintainers to at least consider. The other alternative (causing less
code churn) would imo be to pull out the default case from the switch().

Jan

