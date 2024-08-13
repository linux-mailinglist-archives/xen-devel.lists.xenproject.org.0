Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8980394FED0
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 09:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776013.1186166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdm0M-0001RP-Vk; Tue, 13 Aug 2024 07:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776013.1186166; Tue, 13 Aug 2024 07:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdm0M-0001OF-Si; Tue, 13 Aug 2024 07:31:42 +0000
Received: by outflank-mailman (input) for mailman id 776013;
 Tue, 13 Aug 2024 07:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Wdkt=PM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sdm0L-0001O6-AB
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 07:31:41 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14888071-5946-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 09:31:40 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ef248ab2aeso80458161fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2024 00:31:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3fa7093sm46118766b.63.2024.08.13.00.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 00:31:38 -0700 (PDT)
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
X-Inumbo-ID: 14888071-5946-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723534299; x=1724139099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6sGnAI8AGsF2NkuD50HKhnOzbAnW4OkzrQb2qfJ7fSc=;
        b=gZ2TpSranIcM/bStLmw+KeGVOQ5QdiDUWfeJ6dzHkxjfUg7kopO5QrvTwpIFqbEZ+P
         aI5b6xmkFe3nbo0QUr8UkNwkDjHfEuA4TEMPgxY+vMKIdh/m0+RtBK10tgF56vH1jX1j
         +pp8fMLaWmnO/gKAXLdDLE3wBUrMkUyCuprAHCvOugGie6A+aIGrUiHikYRppQK7KqGe
         m0HjhOhQHG+veCkia7N3AS2tvd750DYEE2FlPoidUbrhQ0ZmLifN5Q6hiK6jTAQ9TI5w
         BzR65tuub7/Jyssu3j77QKYWo6syravr/aXIATFS+mkg9SjMMAe/I4KAkN/jpL97dwJt
         A4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723534299; x=1724139099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sGnAI8AGsF2NkuD50HKhnOzbAnW4OkzrQb2qfJ7fSc=;
        b=fMPlYkfvP1xW6jMxYT4CkV/UjEW4RxK7ZFrjv6XHIXnfnDBEysvcN+jJppusCyUZ6h
         HAHwDUgZM1xIBDpytCX8Wfht+gQfdleYa9HbwiYcYPk2l1yX1kb7zSOyT1MS1U8gsJmn
         Sqk520AyNmMMq0iaAW95uGywLzcFK2HQSjlsos6v9i5RKCPyQZElcvj8+2Qbu+biuYSz
         pTxJsyPJM5pDM8HzsRhbS6JXXa1GJWJe4SYflz1wzCA+8x+PDHrosCcLYdk7J9BTs2l0
         2CT7kIK8djpbn+gxsqMZ+cyxyii1pgh5zdwJhKYelL8uGI+9FjRJka9MH5xwDV+ms9GB
         vtcw==
X-Forwarded-Encrypted: i=1; AJvYcCUneMHjp8ABiuo9zppBpCp/3PEKerB+unZ2Kr+vf9YGKlEKWMuXrt/BK+QerEHwbOezbf2zEj3PP9LcraJwt/oMNxcIMA1VAsSHYmHTnbY=
X-Gm-Message-State: AOJu0YymxZMG0KMu01bbfNStyMQUH0e0AT8GH2qmyDniCpVpu+2ooutU
	jNy1Cy5CeAi2KY8YDezEz53hy4UlwTWNBk1eCx1eKQPjZZpd2XnOGgeXKRPAXg==
X-Google-Smtp-Source: AGHT+IEI18awnUhq0TsLY3XBRWpvGinAFr5d11Gff+gPY1DAgM7ryR7PRl0JL/jMmvyv59G+TkajxQ==
X-Received: by 2002:a2e:3216:0:b0:2f2:9df8:e64e with SMTP id 38308e7fff4ca-2f2b714e6aamr20541241fa.11.1723534299153;
        Tue, 13 Aug 2024 00:31:39 -0700 (PDT)
Message-ID: <952701cd-83d8-4c1f-9f38-ee63ba582d66@suse.com>
Date: Tue, 13 Aug 2024 09:31:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v6 2/3] ioreq: do not build
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
References: <cover.1723110344.git.Sergiy_Kibrik@epam.com>
 <04e5397ecfcdb4d5680c7d36f71c4b471004ccd0.1723110344.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <04e5397ecfcdb4d5680c7d36f71c4b471004ccd0.1723110344.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2024 12:10, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> VIO_realmode_completion is specific to vmx realmode and thus the function
> arch_vcpu_ioreq_completion() has actual handling work only in VMX-enabled build,
> as for the rest x86 and ARM build configurations it is basically a stub.
> 
> Here a separate configuration option ARCH_IOREQ_COMPLETION introduced that tells

Nit: The rename of the option wants to be reflected here, too.

> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -95,4 +95,10 @@ config LTO
>  config ARCH_SUPPORTS_INT128
>  	bool
>  
> +#
> +# For platforms that require specific handling of ioreq completion events
> +#
> +config ARCH_VCPU_IOREQ_COMPLETION
> +	bool

If already you add a comment here, then it similarly wants to disambiguate
things by saying "per-vCPU ioreq completion events" or something along these
lines.

> --- a/xen/include/xen/ioreq.h
> +++ b/xen/include/xen/ioreq.h
> @@ -111,7 +111,17 @@ void ioreq_domain_init(struct domain *d);
>  int ioreq_server_dm_op(struct xen_dm_op *op, struct domain *d, bool *const_op);
>  
>  bool arch_ioreq_complete_mmio(void);
> +
> +#ifdef CONFIG_VCPU_ARCH_IOREQ_COMPLETION
>  bool arch_vcpu_ioreq_completion(enum vio_completion completion);
> +#else
> +static inline bool arch_vcpu_ioreq_completion(enum vio_completion completion)
> +{
> +    ASSERT_UNREACHABLE();
> +    return true;
> +}

My prior comment here remains: Despite pre-existing behavior being to return
"true" here, I question that to be in line with coding-best-practices.pandoc.
Imo the generalization of the stub is a good opportunity to adjust that. But
yes, it could also be done in a separate change. If you really don't want to
do so right here, then
Acked-by: Jan Beulich <jbeulich@suse.com>
with the two cosmetic adjustments (which likely could also be done while
committing).

Jan

