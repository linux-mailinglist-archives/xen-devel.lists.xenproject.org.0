Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DE38135AA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 17:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654675.1021847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDoCZ-0008WH-IV; Thu, 14 Dec 2023 16:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654675.1021847; Thu, 14 Dec 2023 16:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDoCZ-0008Sy-FA; Thu, 14 Dec 2023 16:04:43 +0000
Received: by outflank-mailman (input) for mailman id 654675;
 Thu, 14 Dec 2023 16:04:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDoCX-0008Sq-UR
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 16:04:41 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b408c96-9a9a-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 17:04:38 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a1915034144so1084216666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 08:04:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z9-20020a170906d00900b009c5c5c2c5a4sm9550394ejy.219.2023.12.14.08.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 08:04:37 -0800 (PST)
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
X-Inumbo-ID: 7b408c96-9a9a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702569878; x=1703174678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HcFfTIiTFIffAV2LOgSTTjZ+M5y+zCjTyK4mjfr5F+g=;
        b=MwuzBMPLRqSA3EesltLIYxVtSKMde4uZk2qrzn2eT5CDwfCAA6fM+xgqIvuVOcU3vU
         1w4Wv1Bdhyad804jQc8DKHvgXGC/wSh6R+W+afjLMgT6U0mFFsyVmTwNCeFS+Z+pHyWp
         dgDwXTXf3eYqt6w+Y48CQoGNtQN+m6PHehA/bYE09qm25/xZx9SZlGVdm/FRo738SaXK
         33nBpU1vxrmNkt6snQKI+aRGQyXVbOLNeAKHvPlqYNsHLw8t7qWdrdJaMsUP1fMX7NsK
         g/FvUCJDIofRqqQutOK1bsDQmsuD5z7yMd4DDE3dVbID27LbnleUZATImtEkKHKhLm4C
         EVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569878; x=1703174678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcFfTIiTFIffAV2LOgSTTjZ+M5y+zCjTyK4mjfr5F+g=;
        b=cbbPFSY0jqJBsGy82nX+8ls04l5g6E7zTNvvxnoaGQHnBZA34H2jXasdXdZT3sgsiH
         E4zTHSidiFQLmth6O+3es8kd5LPnB+H7wLPQ90mWR7ai/508G7kLhg4p6S27nH/4Fu7E
         gjNAAzxL0wjrghR+ZPRCt8EpVICkkDpkag5SXLRUGRHy0eh6wvh1XSQPVA32Jp671hTa
         jgy/aSi78dBFlWEyvSUHhcbCeiSnFoIJGanpVBcNPlQR/Sz8Ma8OqOtCdzopfqVMRoI/
         JQLOyZnxy/hxwxtWXKuPl+6MW8kE1uBmeONH7kuydLlITrGepWkeGshWZpweunZ9EBoh
         H4DA==
X-Gm-Message-State: AOJu0YxxmR/nPvacnZ9ttKBSJxJhfkmnKrl1KpDLiMWNn6obAIRcWLQV
	OPwKrKBHyPd/1iJCOhGlOYNv
X-Google-Smtp-Source: AGHT+IE58Y7rYWKvPcTjTnJCM6yKthFuhSoiBhFnNbg3IVm7oL3TNIsrXeGJwTLewcpjnH+jZrkO4w==
X-Received: by 2002:a17:906:b2d6:b0:a1d:4883:e066 with SMTP id cf22-20020a170906b2d600b00a1d4883e066mr4997187ejb.70.1702569877860;
        Thu, 14 Dec 2023 08:04:37 -0800 (PST)
Message-ID: <c431a7ac-ac4d-4de2-969a-ad2acf1a7aee@suse.com>
Date: Thu, 14 Dec 2023 17:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/39] xen/riscv: add minimal stuff to asm/processor.h
 to build full Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <11f177882b74c60233626075a69bdd00d3da2311.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <11f177882b74c60233626075a69bdd00d3da2311.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -12,6 +12,9 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +/* TODO: need to be implemeted */
> +#define get_processor_id() 0

Please don't re-introduce this - it was just recently dropped from the
code base.

> @@ -53,6 +56,18 @@ struct cpu_user_regs
>      unsigned long pregs;
>  };
>  
> +/* TODO: need to implement */
> +#define cpu_to_core(_cpu)   (0)
> +#define cpu_to_socket(_cpu) (0)

No need for leading underscores here.

> +static inline void cpu_relax(void)
> +{
> +	int dummy;
> +	/* In lieu of a halt instruction, induce a long-latency stall. */
> +	__asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));

Any reason for this, when Arm's is just barrier(), and apparently they got
away with this quite fine? Also isn't this causing a division by zero,
which I'd expect to cause some kind of exception? (Terminology-wise I'm of
course biased by x86, where "halt instruction" wouldn't be suitable to use
here. But if that terminology is fine on RISC-V, then obviously no
objection.)

Jan

