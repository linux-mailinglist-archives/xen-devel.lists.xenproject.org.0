Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4F85A74A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 16:22:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682982.1062273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc5Ta-0005Kv-49; Mon, 19 Feb 2024 15:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682982.1062273; Mon, 19 Feb 2024 15:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc5Ta-0005JM-11; Mon, 19 Feb 2024 15:22:38 +0000
Received: by outflank-mailman (input) for mailman id 682982;
 Mon, 19 Feb 2024 15:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc5TZ-0005J8-64
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 15:22:37 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5b04338-cf3a-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 16:22:35 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d22b8801b9so30802591fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 07:22:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c1d8b00b004126a0dfd11sm1403795wms.29.2024.02.19.07.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 07:22:35 -0800 (PST)
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
X-Inumbo-ID: b5b04338-cf3a-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708356155; x=1708960955; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/7B2JK78uOtI+4WAcrTSjeehT4XmVYOqJPVysWYKQlo=;
        b=RH4zOJsMczDOG4p8wo3Cud0OKaIXHrst9r90CnLriyKKsyvjjUDMsfs344tgdSez+u
         hifEzUuBZh5qTP0dzD/fjceBrg8AG4b7C2L2Syx4wjUBxEA8FOhJLqTbSdOq1domM9E9
         1Rn+T0XOrppfWKJ+9DGyuoF5syLeu35jJ65pFKmdXMUqamWExMw0WKdGsgjD7/MyWkB2
         FE/hDSC7E3903K2kNrARe3s42awf314Z7ZSipJmXZ7gk+koXJft9peUQYyTzmKN6pDdb
         m3nM/LLIZ2pOSCdofs6W44PhqJ/2y5LjFNtAN7+TQ35KmiobOSMOb3ARK5muZzUT7Yro
         K3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708356155; x=1708960955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7B2JK78uOtI+4WAcrTSjeehT4XmVYOqJPVysWYKQlo=;
        b=PI+Pn7ZzVj/B2nupG1jYgswj/pLUn8Wpa87Bs3CCz1HkuthzME3KA+S2ZK9NJUb5TQ
         eQmz1N1DbtHPVocDJwd4ZfPBPzk4wgsp9Qt7qDRz5vX4QPuQntrJhMY5vrh6tHUh8M0y
         Lpqj0/ZCjaHZnCIe+FSLGhY9G+oZu3URB4D6IuOklZbDYuC4koGHQL0xMD0F2eJqTd6x
         +Zy3Q+yqALycWVwpajFN7vd07rBO2VdKHu/Drc1yHVUrF3VPc4FfmEeE3Vbel1XhAZHS
         HV2nyYvLVXhMb9lnLnUlNd/222+T+qbKopRAhsR+MBZgzrWNbiYWpt43rHisUECd8ZyJ
         q9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXrLBhbUZcSLddj/rcfs01sGovrMFlnFQxPa5FM+mNMPvTe8Lm70J8jW9WGuWwhZzUD9Jzv9WKxxobp/OycEVEakCuLeZPb02+wBcxxVJQ=
X-Gm-Message-State: AOJu0YySyNvFOZn6tvj1qJF7rReBmUyZRzj2+Mfw0BBMny9dRuJXvUiG
	lRLq96CCo4lDupFas2puNVfvXd353Jfu45cjACeOGX987iwghytxT4Zk/F0L5g==
X-Google-Smtp-Source: AGHT+IESt0eAT5Jk8d7blPsJb0QGmq/ImUQ6hs8DzyaCF7bmiJNy50g5ZIVjh/XRX7ATqiB+pyaO9g==
X-Received: by 2002:a2e:b8c8:0:b0:2d2:bd9:f100 with SMTP id s8-20020a2eb8c8000000b002d20bd9f100mr9444976ljp.20.1708356155452;
        Mon, 19 Feb 2024 07:22:35 -0800 (PST)
Message-ID: <c5f3a78c-4a2b-499b-93bb-11f60b0afcc0@suse.com>
Date: Mon, 19 Feb 2024 16:22:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] nestedsvm: Disable TscRateMSR
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-5-george.dunlap@cloud.com>
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
In-Reply-To: <20240206012051.3564035-5-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2024 02:20, George Dunlap wrote:
> For now, just disable the functionality entirely until we can
> implement it properly:
> 
> - Don't set TSCRATEMSR in the host CPUID policy

This goes too far: This way you would (in principle) also affect guests
with nesting disabled. According to the earlier parts of the description
there's also no issue with it in that case. What you want to make sure
it that in the HVM policy the bit isn't set.

While presently resolving to cpu_has_svm_feature(), I think
cpu_has_tsc_ratio really ought to resolve to the host policy field.
Of course then requiring the host policy to reflect reality rather than
having what is "always emulated". IOW ...

> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -407,8 +407,7 @@ static void __init calculate_host_policy(void)
>                                 (1u << SVM_FEATURE_PAUSEFILTER) |
>                                 (1u << SVM_FEATURE_DECODEASSISTS));
>          /* Enable features which are always emulated. */
> -        p->extd.raw[0xa].d |= ((1u << SVM_FEATURE_VMCBCLEAN) |
> -                               (1u << SVM_FEATURE_TSCRATEMSR));
> +        p->extd.raw[0xa].d |= (1u << SVM_FEATURE_VMCBCLEAN);

... this likely wants replacing altogether by not overriding what we
found in hardware, which would apparently mean moving the two bit
masks to the earlier "clamping" expression.

But then of course Andrew may know of reasons why all of this is done
in calculate_host_policy() in the first place, rather than in HVM
policy calculation.

Jan

