Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B457F8C5871
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 17:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721642.1125225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6th9-0000Lt-Va; Tue, 14 May 2024 15:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721642.1125225; Tue, 14 May 2024 15:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6th9-0000Iu-Rf; Tue, 14 May 2024 15:03:59 +0000
Received: by outflank-mailman (input) for mailman id 721642;
 Tue, 14 May 2024 15:03:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6th8-0000DO-AP
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 15:03:58 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fa65987-1203-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 17:03:56 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5723edf0ae5so296823a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 08:03:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81bfsm731478666b.129.2024.05.14.08.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 08:03:55 -0700 (PDT)
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
X-Inumbo-ID: 2fa65987-1203-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715699036; x=1716303836; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qyAaFDYPFGlusW1kBXq8G9N5fsrl7gO/puN8GnKOyDE=;
        b=FGoOLM87q6JcpIJEJQQ4/AKgBA0VR8A0HbQx8rW5kV9CkDJ7v+ajhhpuOPamGxAeuH
         NKrr68z0mPUTrrGMItp9DgIgy3kHHtJwwF6SeakFPE6Sn5jN1m4QiVzZnaPR1rpTjFEO
         hrWC2wW5SQBe805rajL3SJXy5RuqcwvhGdb7pOMU8sX9Nxv06jx28VuRLyjAzCMpylvp
         6hNLWNJPRt9lXqhQjaups0gX64RkQ5N0w6oLfi+diOl0uJmyvlQDc+fCZq2aFEyNqo6k
         +W2JPelxTTqKsmrVeUKjQIUI5TfBoE6m1XuLZ0RsVhl28blh8hMVNQ0Y56Th8GfC45vD
         37xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715699036; x=1716303836;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qyAaFDYPFGlusW1kBXq8G9N5fsrl7gO/puN8GnKOyDE=;
        b=IBe6MatKIxSGxWkDoH/pWpIWjx/bjGnf27kASuKB56gb2bUyMuSeqNZO95P8KmORME
         EugJdrt9DB7/HZSEC7TreS1EoFxg5TgkrRXMLQ0Yb7+u+YS+eRhyWwrnwXyz+946Tg0Z
         3NnVvbs067fqO7lnAydrNLDDa+IoCNXZaEK+Vak5fJtcxa5D2WFQSgiJqrThc/D7KGC9
         BoRCOuo20ADqiG9XY8wCj3jydn7NBdDQBdAFX84rx1t/XOu5eEZY5yVeRfBIWDhhZL6B
         20W3Q7npQ/LM9V52Xzzh2g9OoQsQoV8MZ3Ud/onuwMgI7RIghMyb0exAk8o7iCzUqr0V
         sM1w==
X-Forwarded-Encrypted: i=1; AJvYcCXtuVZMU8jcTVG0B0JhNylIrHsZS+AYV+mtRHsZOnFm1x0A9rDiwkp40k5u0Ht5mwms+KOsCEpTVolkn1WEwmfkUdagn0lA9MnRxLWIhNQ=
X-Gm-Message-State: AOJu0YwNFhXKgKBLCiWA0ztjv62jzdxOskFmWv8k1+jyarQs3rN/BWH/
	xhzzATh+5b7IsWFklaZYgBCk2C7PFtdKlX/Ia/75u/SOiH0D5CtaYg2BEzAD9A==
X-Google-Smtp-Source: AGHT+IEgj0LbQaQwe8FjQSwHYGVTzmu53Yc20g9mQkt6iI4448KhENaJOwX4A9nTq02VUm+jBG+7xw==
X-Received: by 2002:a17:906:a404:b0:a59:a8a4:a5a0 with SMTP id a640c23a62f3a-a5a2d5cb736mr911445166b.36.1715699036095;
        Tue, 14 May 2024 08:03:56 -0700 (PDT)
Message-ID: <ffe6fbc8-fbbb-44a4-b981-b43f3fb48433@suse.com>
Date: Tue, 14 May 2024 17:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 03/19] x86/pv: Rewrite how building PV dom0
 handles domheap mappings
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-4-eliasely@amazon.com>
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
In-Reply-To: <20240513134046.82605-4-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 15:40, Elias El Yandouzi wrote:
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -382,6 +382,10 @@ int __init dom0_construct_pv(struct domain *d,
>      l3_pgentry_t *l3tab = NULL, *l3start = NULL;
>      l2_pgentry_t *l2tab = NULL, *l2start = NULL;
>      l1_pgentry_t *l1tab = NULL, *l1start = NULL;
> +    mfn_t l4start_mfn = INVALID_MFN;
> +    mfn_t l3start_mfn = INVALID_MFN;
> +    mfn_t l2start_mfn = INVALID_MFN;
> +    mfn_t l1start_mfn = INVALID_MFN;

Just to mention it here again: By limiting the scope of these I'm pretty
sure no initializer would be needed even "just in case" (really I don't
think they're needed even when the all have function scope, as producer
and consumer are always close together afaics; quite different from
l<N>start and l<N>tab).

Jan

