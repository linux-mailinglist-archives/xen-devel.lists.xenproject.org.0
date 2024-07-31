Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EF4942EC1
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 14:40:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768557.1179390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8bu-0006GZ-LC; Wed, 31 Jul 2024 12:39:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768557.1179390; Wed, 31 Jul 2024 12:39:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ8bu-0006EF-IJ; Wed, 31 Jul 2024 12:39:18 +0000
Received: by outflank-mailman (input) for mailman id 768557;
 Wed, 31 Jul 2024 12:39:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZ8bt-0006E9-A4
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 12:39:17 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5e87d93-4f39-11ef-bc01-fd08da9f4363;
 Wed, 31 Jul 2024 14:39:16 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a2ffc3447fso7793621a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 05:39:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63b59c86sm8743210a12.42.2024.07.31.05.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 05:39:15 -0700 (PDT)
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
X-Inumbo-ID: e5e87d93-4f39-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722429556; x=1723034356; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ilo0We2UUzxTihmdsjHnXM2CuRI/Mof14DEhXu9v5TM=;
        b=RFKmVwTeN+TqKqxOnxZed1THJtYf0cTcDDhDwXq2ZP5rkN+f1VZhQGUksnN6n3UtBD
         UCf9tzo70OHSlVoc3M35iBPwGpkeVsUc6mSTlTTt/SHg4TZTdvgtd6Fi4UVlEKOC6tGX
         xk/dr66KU5pZyZtKUu/xbjYq75vhO52ahsaXpAHsv1ot9X3nqJZBKY3xk85hdHY9AhX1
         xCD5+T50cP06XXZWoPudixoigmEsUunJ+nYlw5XTUvbgHKYuGEpoK0bjXaBR8zHq94/K
         8L2sK2KZErYmHYk2ftWKmVY2TN2Fqu7t2chrGCDtByHs37tl0j9LhUgrue2Dha8V5Qc/
         r5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722429556; x=1723034356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ilo0We2UUzxTihmdsjHnXM2CuRI/Mof14DEhXu9v5TM=;
        b=mg8Lrl3tmnkZ9Oa67HWIy2q1qL4TQt4jKP+HklGJZp4j+Ho8pZE6yVk/2Fbrr3bZnl
         JwoN+w1qHdUPXUJpdpS/XoAFlhezLOnBLmQGc+9l/NGvVU+OJ/kmD5ILlUIZpmABYnmq
         0jm/jxYOD464k8mQLRSMcE+/rXeG1ou1FKByzkba2qeUNprH/al0kRCsFpZCUuZBUqTo
         bNNoqjxTnm0sqTrlQ+vxO67Owg4o203k54hptvaVhC9jkJZ5NOGx2GiCM8d879E5i/a+
         jTb80uF766iccWDcyq6pFdg0+v8YQrHKWRSUti5mQSusctsIEsFfiT+1hv4RWazZ6028
         Dqtw==
X-Forwarded-Encrypted: i=1; AJvYcCXb3pPZon0lXxvP8SWCW31WMxg6TJH8VF+J77M8IOrgKbo3QJ1uI2ZTCLy8GxAfs8kJr8iY2Z3+vsE8WVzAm1Qyh1JiBBWHFjhunw1xW9Q=
X-Gm-Message-State: AOJu0YwNyTU+/1feXlcqDlKmCODSa4W+NQorsvabW/OFSXQ7QPJPlb5q
	7uDT4BhoUQXrEYuu+AsIP1yLM64yuhPgdkMGvbbnHanzDm8hc9v7zsoQkuU3yg==
X-Google-Smtp-Source: AGHT+IG4BIgRSxrc2PyQFYSGP/LXgaTUw/eLhp5qmEIuxUFjugUtVMWWEOYFZtLh5CvMYhUlG5kdEA==
X-Received: by 2002:a50:aa9e:0:b0:58b:2d93:ad83 with SMTP id 4fb4d7f45d1cf-5b020ba82cfmr9285262a12.21.1722429555637;
        Wed, 31 Jul 2024 05:39:15 -0700 (PDT)
Message-ID: <19f3a14c-33ab-4381-8b6c-707db41b48fb@suse.com>
Date: Wed, 31 Jul 2024 14:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 11/13] ioreq: do not build
 arch_vcpu_ioreq_completion() for non-VMX configurations
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1722333634.git.Sergiy_Kibrik@epam.com>
 <67f143c15bece937d7b5c0739b14cc53b0c8c13d.1722333634.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <67f143c15bece937d7b5c0739b14cc53b0c8c13d.1722333634.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.07.2024 12:37, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> VIO_realmode_completion is specific to vmx realmode and thus the function
> arch_vcpu_ioreq_completion() has actual handling work only in VMX-enabled build,
> as for the rest x86 and ARM build configurations it is basically a stub.
> 
> Here a separate configuration option ARCH_IOREQ_COMPLETION introduced that tells
> whether the platform we're building for requires any specific ioreq completion
> handling. As of now only VMX has such requirement, so the option is selected
> by INTEL_VMX, for other configurations a generic default stub is provided
> (it is ARM's version of arch_vcpu_ioreq_completion() moved to common header).
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Julien Grall <julien@xen.org>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
> changes in v5:
>  - introduce ARCH_IOREQ_COMPLETION option & put arch_vcpu_ioreq_completion() under it
>  - description changed

I'm worried by this naming inconsistency: We also have arch_ioreq_complete_mmio(),
and who know what else we'll gain. I think the Kconfig identifier wants to equally
include VCPU.

> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -95,4 +95,7 @@ config LTO
>  config ARCH_SUPPORTS_INT128
>  	bool
>  
> +config ARCH_IOREQ_COMPLETION
> +	bool

Please maintain alphabetic sorting with the other ARCH_*.

> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -111,7 +111,17 @@ void ioreq_domain_init(struct domain *d);
>  int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
>  
>  bool arch_ioreq_complete_mmio(void);
> +
> +#ifdef CONFIG_ARCH_IOREQ_COMPLETION
>  bool arch_vcpu_ioreq_completion(enum vio_completion completion);
> +#else
> +static inline bool arch_vcpu_ioreq_completion(enum vio_completion completion)
> +{
> +    ASSERT_UNREACHABLE();
> +    return true;
> +}

I understand this is how the Arm stub had it, but is "true" really appropriate
here? Looking at the sole vcpu_ioreq_handle_completion() call site in x86 code,
I'm inclined to say "false" would be better: We shouldn't resume a vCPU when
such an (internal) error has been encountered.

Jan

