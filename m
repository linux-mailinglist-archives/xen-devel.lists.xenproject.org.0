Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679B4B0BCE3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 08:43:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051029.1419344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udkFM-00055P-DR; Mon, 21 Jul 2025 06:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051029.1419344; Mon, 21 Jul 2025 06:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udkFM-00052q-9x; Mon, 21 Jul 2025 06:43:36 +0000
Received: by outflank-mailman (input) for mailman id 1051029;
 Mon, 21 Jul 2025 06:43:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=R5lD=2C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1udkFL-00052k-LF
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 06:43:35 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05ff9187-65fe-11f0-a31d-13f23c93f187;
 Mon, 21 Jul 2025 08:43:34 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4561514c7f0so40925025e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 20 Jul 2025 23:43:34 -0700 (PDT)
Received: from ?IPV6:2003:ca:b711:f280:2981:7570:f40b:efd1?
 (p200300cab711f28029817570f40befd1.dip0.t-ipconnect.de.
 [2003:ca:b711:f280:2981:7570:f40b:efd1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4563b7404f3sm92391905e9.23.2025.07.20.23.43.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Jul 2025 23:43:33 -0700 (PDT)
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
X-Inumbo-ID: 05ff9187-65fe-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753080214; x=1753685014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=plmsi2P4CfapfVIn0NxOQw0RrRJMyBZJt88z37YpT2Y=;
        b=YINI9IkwIS9kJJvsyOg8dMSxb1mOr9ZkPNr1pf/1iLdN/F9mEvkl3v1832rdxZ1uxQ
         zg5TrDuwJIBIXBWRKfn/GcrVjjxdra+cSeP6RAZ6scUhdmdj7AQ5VTYcb6oKUCkuPiyE
         nvPnTRBZDy2SBy21oeiYP0aQlyFqi9CUYE+QdPhq7RzRWHMSFuRmssFmB0x7cnq8391I
         7Xq+2Gq/DglkA9NNfv9Z8weRz/3xUwV8HluURjUbcGkX0jzhWPZR9mzMWuFbGvtkKDh2
         udBFAFYeQmZfMnq5AY1nosyONTasqtnGmLJ9vLiYvPd7fPC8mx41FbQ8VVyHoT8LiQvY
         ItMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753080214; x=1753685014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plmsi2P4CfapfVIn0NxOQw0RrRJMyBZJt88z37YpT2Y=;
        b=gdOcCL3kwzdVQ0CVusOdKvJSQsAny0ZKaSgmNudsFv8SEv1pKJ/YbbULcRh8S5CZBj
         5a+e79yW0Xrkk70//kjcu75LWODePQBTwj2Qrl13F57BKEQpWCqk9RII/KLlHh9Zgw8N
         50WNckJd97QINGH4ZVhYVhi2Ro0boK/+ROZrKu+dUBGAVZMjIBw0Oejnh8y2M/vj2XdL
         /8Fi64fPvGX3nZi7tCQfqmivf2laSXegVi6QvGzeqCGZkm6JckeR/p7KawOdpWeewrfe
         XiFEPEYm0LKgQ9/ZPljLPhh06mLt7prQ9mEFe8SZdAVRFBiCtB5ZOah0LS28Q7ZMU3g3
         33pA==
X-Forwarded-Encrypted: i=1; AJvYcCVkBcnZWebupXm8tmUYDQZBxD7b844Hvhi2/2zAZ5ISUsrpJ7dZHynIxmSUDv+TYBvjRshdBjm32iw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxM17RpFy4oNCfv8XQAPTIkfN16CkVdve0WRvg3GMo28gQud9HG
	zm20tC85ITnRgmYchcMOHloB6jOj4mAVZJxqL3IsTf/PyFoRpKTGGuchZ54PEtbgfg==
X-Gm-Gg: ASbGncviJ7/eETE7VWwWNy5ASex4yknTv6ksJlkC589iwScj2fwPZd1BPiKMAbgKM6Q
	5l5csT9EP1N9FKKXpq549ckYCFNy7SRwsChezZblWvRGnHSfrmwUdl+i7xEBqFFEcQZBSdI+CFK
	LNTN6KUzpZvBEgf8ylWZb8g3wkT5RAcQljAGVFSlOWciF3kWKNzujO7tteE9d/rF7B7h6Zzh5h9
	3mf6HWlfkZxxBMI8kfvZiBAvJlyw90SUadSRslEDwyOs6PiK08QDVjTQha/JyeTAhARVUTrC0kl
	yffSJ4DjTUILH+OKZ80iLTQmjJzQPwH6/Kbwtyi4pRwnN8BeDZfGd8jsVr0NnjibRLbTP7oOlb+
	2v0XDT1rVePoxaN3NV3YBvlvajJ4AeYR0ChwH3XYrfnHdNPQ3kmN8R0FSSluDg5T6jeqGJZ6wZm
	i6yaCshyVNDCuK9R481DnTh3DrofsUyaCz/Me/+kK4NakrqFEq1wPm0BkCmnYriVgEYcQ=
X-Google-Smtp-Source: AGHT+IHVhTVpd0CsyGv3oOZ8eXLi/nI7W8FemYJq/N31eo0bgSx4Jl/zt63YAYPgJX5Ng+IZ25J1NA==
X-Received: by 2002:a05:600c:a305:b0:453:8bc7:5e53 with SMTP id 5b1f17b1804b1-4562e853505mr154940975e9.0.1753080214124;
        Sun, 20 Jul 2025 23:43:34 -0700 (PDT)
Message-ID: <896dc56e-54cc-43f9-a8c6-0114212030ce@suse.com>
Date: Mon, 21 Jul 2025 08:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/match-cpu: Improvements to x86_match_cpu()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250718142006.2471129-1-andrew.cooper3@citrix.com>
 <20250718142006.2471129-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250718142006.2471129-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 16:20, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -1007,19 +1007,26 @@ void cpu_uninit(unsigned int cpu)
>  
>  const struct x86_cpu_id *x86_match_cpu(const struct x86_cpu_id table[])
>  {
> -	const struct x86_cpu_id *m;
> -	const struct cpuinfo_x86 *c = &boot_cpu_data;
> +    const struct x86_cpu_id *m;
> +    const struct cpuinfo_x86 *c = &boot_cpu_data;
>  
> -	for (m = table; m->vendor | m->family | m->model | m->feature; m++) {
> -		if (c->x86_vendor != m->vendor)
> -			continue;
> -		if (c->x86 != m->family)
> -			continue;
> -		if (c->x86_model != m->model)
> -			continue;
> -		if (!cpu_has(c, m->feature))
> -			continue;
> -		return m;
> -	}
> -	return NULL;
> +    /*
> +     * Although derived from Linux originally, Xen has no valid rows where
> +     * ->vendor is nonzero, so used this in place of checking all metadata.
> +     */

s/nonzero/zero/, I expect? Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> +    for ( m = table; m->vendor; m++ )
> +    {
> +        if ( c->vendor != m->vendor )
> +            continue;
> +        if ( c->family != m->family )
> +            continue;
> +        if ( c->model != m->model )
> +            continue;
> +        if ( !cpu_has(c, m->feature) )
> +            continue;
> +
> +        return m;
> +    }
> +
> +    return NULL;
>  }


