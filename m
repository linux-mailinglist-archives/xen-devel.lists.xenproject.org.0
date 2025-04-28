Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1849A9E8B2
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 09:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970125.1358890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9ITa-0007dB-FP; Mon, 28 Apr 2025 07:00:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970125.1358890; Mon, 28 Apr 2025 07:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9ITa-0007a6-CN; Mon, 28 Apr 2025 07:00:26 +0000
Received: by outflank-mailman (input) for mailman id 970125;
 Mon, 28 Apr 2025 07:00:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9ITY-0007Zy-R5
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 07:00:24 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74275fd6-23fe-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 09:00:22 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43ed8d32a95so38412325e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 00:00:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e4698csm10248437f8f.62.2025.04.28.00.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 00:00:21 -0700 (PDT)
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
X-Inumbo-ID: 74275fd6-23fe-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745823622; x=1746428422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tl7f1khXY6RXWcosj6U0MjuBZORtZRYLyXuet1CM9hQ=;
        b=fxtAxERiiGenN0ASORW3V56DpCe6FuPWnlk9BrjNSO9Ad+pKro21zkypPHP6KAEKPR
         PHDEXGLf+CGVxMlfgtiaotGxcJL1gItUJj4jIMZf0Cbv2r0MpEHxfn35Ic3kFcLjf30Z
         /bVTi9q9KYX+yj7VBa4GhmDNxFy/eaILAIoPqMAv5zKT+6WcoruJP7b5U6f+elNlB4jN
         GCNBw73Fmetd4XgMUBuXkWInm+Sn/xskthl7QrHg8t3PDNUb8irvIsUlxXG1kIGjYjyv
         +651gCkSfgbNnVmoxRqIHuGyHJxmIzn0hB+QmpofhaULtj5f+nrk/6ZWbFGl4O83dNpf
         uR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745823622; x=1746428422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tl7f1khXY6RXWcosj6U0MjuBZORtZRYLyXuet1CM9hQ=;
        b=j6vRt4YhlHz9e6Kd53GBAdOBQrFUm3xFc1T6+uOfUY0OiF+9ht6uhsKVBpF2/OVO73
         Kt6lad3XGu+efkW0O2iXeHl8ArdPiBLDq3nVo5JJUkwGlRsZ7G5urpaziQXUTCDchHr8
         F8qpVAi7++DHGU2wZlXVjBUwIMbYxlH2wiUgiVSxZXWy+Dg+vEkrfZeV1twjvRL9kGPV
         ssQI77dBwDxK6xXuRwx7AZvv479VyQS7OzYQBIj9MOrHfACM54pxNnwSljCtSXKoQSVM
         ZuWABBOWVpdDpWT7/v0QUennPuLqNfv3ELccegRjqih1WI+nCl61w18qSb9n7haNkGlc
         zE2A==
X-Forwarded-Encrypted: i=1; AJvYcCWg7m1EVYGKSsqnPwsOBJrhXjcu56t4Gi5W1atl30I8Di6XG5QJ9YtBih+jGg8O736/rBg5nViu/iM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+D/Z9Z86Icue2z7HWDfLFtyXeNsow35BzAKiYSugpyTcPgp6n
	Rf+mkzK4Xep+bN30z57nn5jSRq3KtCwToViYyYIdSwqGQSljm9w4n5rIPy2TIA==
X-Gm-Gg: ASbGncsQWMdn6flRdut2W/alDFlNyf20UDlQeIyFZYs4/R1oMc8IotN2Qea1o/NLyVq
	exTYdXIHj1l/Q9rX6LB8vk95oYiKkTw/BC1Kw4YcPQaP0aybKrn+fGPvnOeNMSFZZAkeNuOX9OZ
	+VOA7Wb4ESQdraXmvizrKUewrFYPyedlvC96gRgAiT2aAVs1qGPtxZG6QdTr5+zh9i0NbYTVGs8
	3Sx0MgsVv92gjji4gZRuiq1foRldkCD0xfUjjos0ugzlLTkK1hGveAdX4NtlSWfkYRDxcdrtO9u
	8vTCYquBxMBeCoaQdxYhHa8V21127Gw+m52rFKoKh8AlzTd+0MeNuOtGZP/WgnYt4TZGWAJaIVd
	4t33/1QxpydlUvIwqd1R1zuF/HA==
X-Google-Smtp-Source: AGHT+IE1mmzE47C0Z2XHS0ITu1wwvi9B9C1EDcMziKCkZ4wHuPR3mg9sGjHrYwe2YM8/iYSbLsSmog==
X-Received: by 2002:a5d:59a7:0:b0:39f:efb:c2f6 with SMTP id ffacd0b85a97d-3a074e3e6a8mr9957738f8f.33.1745823622131;
        Mon, 28 Apr 2025 00:00:22 -0700 (PDT)
Message-ID: <a004a4e3-5ef1-43b3-a644-e3d3cbfcfe29@suse.com>
Date: Mon, 28 Apr 2025 09:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hyperv: use dynamically allocated page for
 hypercalls
To: Ariadne Conill <ariadne@ariadne.space>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <agarciav@amd.com>,
 "Alexander M . Merritt" <alexander@edera.dev>, xen-devel@lists.xenproject.org
References: <20250425234331.65875-1-ariadne@ariadne.space>
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
In-Reply-To: <20250425234331.65875-1-ariadne@ariadne.space>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2025 01:43, Ariadne Conill wrote:
> Previously Xen placed the hypercall page at the highest possible MFN,
> but this caused problems on systems where there is more than 36 bits
> of physical address space.
> 
> In general, it also seems unreliable to assume that the highest possible
> MFN is not already reserved for some other purpose.
> 
> Changes from v1:
> - Continue to use fixmap infrastructure
> - Use panic in Hyper-V setup() function instead of returning -ENOMEM
>   on hypercall page allocation failure

Nit: This part wants to go ...

> Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
> Cc: Alejandro Vallejo <agarciav@amd.com>
> Cc: Alexander M. Merritt <alexander@edera.dev>
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> ---

... somewhere below such a separator.

> --- a/xen/arch/x86/guest/hyperv/hyperv.c
> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
> @@ -98,7 +98,13 @@ static void __init setup_hypercall_page(void)
>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>      if ( !hypercall_msr.enable )
>      {
> -        mfn = HV_HCALL_MFN;
> +        void *hcall_page = alloc_xenheap_page();
> +        if ( !hcall_page )

Nit (style): Blank line please between declaration(s) and statement(s). (Both
can probably be taken care of upon committing if no other need for a v3 arises.)

Jan

