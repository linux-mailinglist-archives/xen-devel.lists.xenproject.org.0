Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B279E9BE7
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 17:37:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851709.1265737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKglA-00006a-Q0; Mon, 09 Dec 2024 16:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851709.1265737; Mon, 09 Dec 2024 16:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKglA-0008Uz-N3; Mon, 09 Dec 2024 16:37:24 +0000
Received: by outflank-mailman (input) for mailman id 851709;
 Mon, 09 Dec 2024 16:37:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKgl9-0008Ur-BH
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 16:37:23 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd31128d-b64b-11ef-a0d5-8be0dac302b0;
 Mon, 09 Dec 2024 17:37:22 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-435004228c0so4055905e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 08:37:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2efafd98703sm2127929a91.4.2024.12.09.08.37.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 08:37:21 -0800 (PST)
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
X-Inumbo-ID: dd31128d-b64b-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733762242; x=1734367042; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nV7c6+ec09Q3/6qGaFyzjOvXH3R2CrH/dWqBxMXAQuk=;
        b=gCpqujbl+yfg7NVq0DsxLsiMq6W9x368Sy6Y4ThuN0JRdn1zBIpP7kB7D85ltz3CIH
         xIgUduNGtcRbabgZp091pZUw98KplfY565wGbJPK058KlEl7jpUOqcPJaKIPcqUaZaZx
         ATZwx0Ngq2oTz8r5P3GWbNovMic50C1Xqg0XFpoM4IU3wV7MTgQ70qJrcTXlv0EA1P9q
         CQ9fcKrOaRlxh7Tv+/ZYnSZRg3aBOp8fxKEKYKoMaZ7zJOPl8oreDoDc7k8j4Hbae667
         MfahD1aXAMWHN6cAmu/koOnqr0NcI21sLdCuVML61xiIzvY2eySuapaScCpdhVCeuELt
         vOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733762242; x=1734367042;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nV7c6+ec09Q3/6qGaFyzjOvXH3R2CrH/dWqBxMXAQuk=;
        b=D18cfyi0DrRnOu1S3Wl+ZOFrloK2MANivWG9cH15m48If6fwRrgf/34GnRdF9+s8VG
         4nlXIYomT+iIHbP9wonfvx4BSKaBXCuCyCjhYci2VcduEvcYxvvlRm7ect8ZuQeWnYse
         P3sp0DwNwuBy/xTbarP6rTiQwTljerpaCD7uk8lJBov61UBomjPkoAf5G3P4r10DTUOd
         TjJ+wsElWboXQkkjiGoc0/EP/uJVNZsIC/Xg+FOt6dotYBiYLoSwx+z9N7a7SbWB6eAc
         4NMJbSaOn8CU4dDPsF1Ay14xhYQae2LdKp0Nj8/jda5u42nXhM2OZQLvFCaqLbyQneM9
         CRXg==
X-Forwarded-Encrypted: i=1; AJvYcCW71lKmr8vZGuO00iYnCVNRm33pusUiZEPHjniTtwKATCvz5WMu/s0wC4EXy0hGBz37XLaH8awjrXw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPY1hLxnbdmWN3v7LAVGTDls2fPexEFmN4YcnznvtQOGQBpLr+
	Xa8dLv6VleqllDbBiaCyVZqYLY1rEmhXCSOaIao7l+lp/EA3hI7q1jXCV8D40Q==
X-Gm-Gg: ASbGnct74tv1VmmonLTdyKT8wDUeKAgAizBNdNlsskDVBRRkd0e2SfBuJyq1G0s2Gym
	IzlvxHa542Z/u/+DHH297mvX0rIrFNCNvUdq9rYDDcMH3XgF9zMhrNSubZZrHrRWKTi82QeQzQf
	9QtfaKm8HfB2pI7Klb61OuaSoltGJjhvLNd0WcU+x8lA/OjuCSQkCIy6v2QgVjQj8t/ZAAhswlz
	FHgrYfiw8GhnuMR8hqS//QZVQdk+YJZoBN6RgeknScgNw9RQW33ZIFltiFDNEXjyeNNNMpZSfqV
	D9Roa1igiru+F8+gdpJC0ycK5X098BOhvDc=
X-Google-Smtp-Source: AGHT+IFy6cBtmhUah5MhaQd32Usj39ZECAJNl8AbGI5Ts35NY084dpff0uWOXHvaSI58Ks1OflCjNA==
X-Received: by 2002:a05:6000:481c:b0:385:e5dc:e285 with SMTP id ffacd0b85a97d-38645400f06mr1241594f8f.58.1733762241751;
        Mon, 09 Dec 2024 08:37:21 -0800 (PST)
Message-ID: <6df9e623-933e-4cef-a273-b171b8990249@suse.com>
Date: Mon, 9 Dec 2024 17:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/13] x86/fpu: Pass explicit xsave areas to
 fpu_(f)xsave()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-12-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241105143310.28301-12-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.11.2024 15:33, Alejandro Vallejo wrote:
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>   * const-ified v

Hmm, yes, you did ...

> --- a/xen/arch/x86/i387.c
> +++ b/xen/arch/x86/i387.c
> @@ -129,7 +129,7 @@ static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
>  }
>  
>  /* Save x87 extended state */
> -static inline void fpu_xsave(struct vcpu *v)
> +static inline void fpu_xsave(const struct vcpu *v, struct xsave_struct *xsave_area)

... here.

> @@ -141,15 +141,14 @@ static inline void fpu_xsave(struct vcpu *v)
>       */
>      ok = set_xcr0(v->arch.xcr0_accum | XSTATE_FP_SSE);
>      ASSERT(ok);
> -    xsave(v, mask);
> +    xsave(v, xsave_area, mask);
>      ok = set_xcr0(v->arch.xcr0 ?: XSTATE_FP_SSE);
>      ASSERT(ok);
>  }
>  
>  /* Save x87 FPU, MMX, SSE and SSE2 state */
> -static inline void fpu_fxsave(struct vcpu *v)
> +static inline void fpu_fxsave(struct vcpu *v, fpusse_t *fpu_ctxt)

But then not here.

Jan

