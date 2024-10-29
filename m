Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C129B4405
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 09:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827096.1241582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hRw-0002L3-B8; Tue, 29 Oct 2024 08:19:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827096.1241582; Tue, 29 Oct 2024 08:19:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5hRw-0002JB-7d; Tue, 29 Oct 2024 08:19:36 +0000
Received: by outflank-mailman (input) for mailman id 827096;
 Tue, 29 Oct 2024 08:19:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E68c=RZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5hRv-0002J5-4f
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 08:19:35 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 871cbd4f-95ce-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 09:19:33 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-37d5689eea8so3453292f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 01:19:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b47a41sm11766500f8f.52.2024.10.29.01.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 01:19:32 -0700 (PDT)
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
X-Inumbo-ID: 871cbd4f-95ce-11ef-a0c3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730189973; x=1730794773; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZM3on7Rk3dMGczH+t0nLhbK9JWkSZZ2A25ZLeICITSM=;
        b=bfHpk743fhvBcuXk6dpqTkMKC5tz3bY38wnPXxgTdSV3Z6qgeox/F/OCHffauy/+p+
         4WWVubIJqbZjt+9/6xUS4DLwIcndV0KEwpzNIYOq4mRS4qfdKXyuL4+7OI50i5Za0/Su
         f2krWyJnC2lqKL711JZbG116ZnR/slrPpMaZNWrg5az1q1x3ZUVs8o2kE+Bk6szBkpOv
         kzbDUIMMQMFkblKZ9VzVVU9UXkDoCBMchiTjSxYDi6koTezGHvMt2hJrxy3kMampkR8r
         cSsKBkwY6OB1TDf1Y3rzX55ztGoYVGSON04F1XCfkosRE8MrqdLWLerkKHEYX9ETnHXl
         m0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189973; x=1730794773;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZM3on7Rk3dMGczH+t0nLhbK9JWkSZZ2A25ZLeICITSM=;
        b=wj4JRAVvzwN5nNu/lqGCj8Vbxw+GIzsXQMtJ8KF0guFO0DGS+GXC6BI3dAFKaRSgQ2
         QADNgvSAV9OlRB9ueeq05obiMx5zorMlGv7YFakQfdhWV7+5bSch+kNp7wZw2JZzxImj
         nvqSf15MiTcESNEeW35H8G/ZAv7JJwAvnyE4pXCmHsUxw27mCHFsyGT+sXWDTBr273BS
         oH0+60ET1nHfKzowQD1X2xIlKu+DVLIVkqPSo4P++b7UxELkUJ5I5lCwtEbvu2TRKS+f
         ALg30uX3AAnYiAfMXPSz1dZhS7uhzmu7CRSGXpDdYgP0FRUQBMeM81lB0LKFxOCgbA29
         314Q==
X-Forwarded-Encrypted: i=1; AJvYcCX94Qrk3IuQaGp9p7JXmDOSh6/7M327U2T175dGmVS+uzeU7JOEsujHIJgpcpBGWs6qSDajQ9jgeso=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQXLinMO7+Oeos/LxVgwRp4zI4Nk1P1Eqz/IlDEPvNASAUnggZ
	DHrVa7UJh4TWQgAPXpv8mXAVB1i8yvX+2VSiKEPKGm2m5/D+Se5HT7QvatovSg==
X-Google-Smtp-Source: AGHT+IEVUfXDQEnZCGl+YXgjWbuoLjWSAxiGVG0S/C+bi2bgh70ILeyLh363lF/jz68N6GJklzj03Q==
X-Received: by 2002:adf:b30d:0:b0:378:e8cd:71fa with SMTP id ffacd0b85a97d-380612008fdmr6878777f8f.39.1730189972901;
        Tue, 29 Oct 2024 01:19:32 -0700 (PDT)
Message-ID: <52225fba-97cc-49eb-8714-fee5d2e86262@suse.com>
Date: Tue, 29 Oct 2024 09:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] x86/xstate: Create map/unmap primitives for xsave
 areas
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-3-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241028154932.6797-3-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 16:49, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/include/asm/xstate.h
> +++ b/xen/arch/x86/include/asm/xstate.h
> @@ -143,4 +143,24 @@ static inline bool xstate_all(const struct vcpu *v)
>             (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
>  }
>  
> +/*
> + * Fetch a pointer to the XSAVE area of a vCPU
> + *
> + * If ASI is enabled for the domain, this mapping is pCPU-local.

Taking the umap commentary into account, I think this needs to expand
some, to also symmetrically cover what the unmap comment says regarding
"v is [not] the currently scheduled vCPU". This may then also help
better see the further outlook, as Andrew was asking for.

> + * @param v Owner of the XSAVE area
> + */
> +#define vcpu_map_xsave_area(v) ((v)->arch.xsave_area)
> +
> +/*
> + * Drops the XSAVE area of a vCPU and nullifies its pointer on exit.

Nit: I expect it drops the mapping, not the area.

> + * If ASI is enabled and v is not the currently scheduled vCPU then the
> + * per-pCPU mapping is removed from the address space.
> + *
> + * @param v           vCPU logically owning xsave_area
> + * @param xsave_area  XSAVE blob of v
> + */
> +#define vcpu_unmap_xsave_area(v, x) ({ (x) = NULL; })
> +
>  #endif /* __ASM_XSTATE_H */


