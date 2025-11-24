Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981CAC81B85
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 17:55:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171501.1496506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNZpA-0000ZW-Cq; Mon, 24 Nov 2025 16:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171501.1496506; Mon, 24 Nov 2025 16:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNZpA-0000WY-9X; Mon, 24 Nov 2025 16:54:00 +0000
Received: by outflank-mailman (input) for mailman id 1171501;
 Mon, 24 Nov 2025 16:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNZp8-0000WQ-T8
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 16:53:59 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29a80347-c956-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 17:53:55 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47789cd2083so26908605e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 08:53:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e574sm29280569f8f.3.2025.11.24.08.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 08:53:54 -0800 (PST)
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
X-Inumbo-ID: 29a80347-c956-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764003235; x=1764608035; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=255gjY9HRiak5TATxmxLhe7oTxxBeICpR032HxIw32M=;
        b=ACy/eH5t08UWdU0LcyYeDnx1f7aFVofXsC9jsZCJFZ0GqsGaLHImjP9OAAb30w91eN
         qnjKIYuCLQU5Rw37+WjwcwcCP8QQGPEJ1vXzP/v1XSdJN10gGb/LdsAOW7NDs+oSPY0B
         urRCJT7yzPtridg8/zUUcbcBWGKHrutTWoGa5A/gHVf//71h0yUNz8gjRuiHHdAEC9P5
         LVmedCAdX17xzLpRv1CLv/Yr0fQ5YQWasLvjnVlZQGql5K+U33r8I96nj1omYTXDgtBW
         5hGjNM3RpOwFPYCYmMx3g/BcqR4OLvAaCOzzhhbz88dlNwifh9KyV0xthvt/2ICKgvHr
         evjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764003235; x=1764608035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=255gjY9HRiak5TATxmxLhe7oTxxBeICpR032HxIw32M=;
        b=en5VmNld80J3ONB41BN7XpDKctWEh/tN+mhQM6eVClX/hPkAzDxfG4zHoGJr9krp0B
         je0za+D4oWxPR8ksFrkOl+mRoeFYyh9F7LD+g2ihagNqaot8Kyms/Xu198efOTMPN5sb
         75hkTvV8IkXnzU2qhIFW7yBE/pRHmolvXVLbh+lohumMkfM53BUijzOrE0u4TxGl9Vhg
         YrT2Jhxx+xngABUq9FioI8pC0h7d7HKzSZ9cEiAt881HlaXF2PbdFvBs2BcL737tUt+b
         Es1Z6EJwqJ3KoVqc7Ma801z5Sz2FfCZjVFlQOGLmkSTW+MpphyG6WZZr+Eb1ZzfnJkUG
         ACzg==
X-Forwarded-Encrypted: i=1; AJvYcCVv+6FGsX3MTQANvbtX01sZnwjL8SAJ50YAivLoKWr7VXo5Q1AfODOcSncWFDGmlnSG+308985/ZrU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzj+8RVH6aRXZVvCq8QMgYFWUhTWi/0sWs0bqJrKGCwl/HJhW1Q
	jeedNmnVOvet7LZz7hyog+gTeAdU9yoBz3x2ItEQvWhSsz8MWqGFUl/inRQNk24t4g==
X-Gm-Gg: ASbGncvZyi9N/F2nTjbhnfzYq7i/gxl7iEV9X6Hm5QbM1pomc/YYc7KIAleneqLsiXb
	9Op9/s0Gu5VQHPL2s9LPhmNzP8MsEy1oHYK2ckluz2hD8HUHdrk3/X1hWqrDwa9Z4cTulh6130B
	vnnaCHRFnk188UrVr5X6hSkPRtfeBaf5QpMwjsHtb+t9mdCoDjAEfc6GSwMLJLlWvNqEayQXD5K
	caizE5s9mg/lp6bK6DDPnEmLS4vW8nRhvAUs7Ijby+1SuBljpwdY94UeQ8VaF+YDWUcV3ffAwig
	XnuB2cS7btDHP5oOUACUAK39mQC3+exh6ANlgfRUD+srb5EvKQwKUoknrtFFJDdPiYQk5NsGqGQ
	Kdj7+f6DS9CsxKemGJtJ3WWIMsUBhDdHt59vgDqIuTtUc6j6xM2guggcTQijOQ0s6n30VUyK+eg
	PJxNVnJZD9gamDqgozlWgsbHGr30GR1KM+n1EGsBAbHuYdY4Y0ctNRrxRUnwxd+Wf8RdGKeGrUG
	JyFASKFZRWpbQ==
X-Google-Smtp-Source: AGHT+IEGFbU3a+h0zxgrcinDqwSSn+YTwh9UqQG1KEiG/pW5Lk4cNhCEyBW2DPHXw1O7ZWA13lovJw==
X-Received: by 2002:a05:600c:3589:b0:477:97c7:9be7 with SMTP id 5b1f17b1804b1-477c110262fmr127873365e9.1.1764003234641;
        Mon, 24 Nov 2025 08:53:54 -0800 (PST)
Message-ID: <f4741251-0772-4a7a-86ec-951d08b22517@suse.com>
Date: Mon, 24 Nov 2025 17:53:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Remove x86 prefixed names from cpuinfo for intel.c
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20251124111942.1325635-1-kevin.lampis@citrix.com>
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
In-Reply-To: <20251124111942.1325635-1-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 12:19, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
> 
> No functional change.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a few nits (can likely be taken care of while committing):

> @@ -458,7 +458,7 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
>  {
>  	uint64_t val;
>  
> -	if ((c->x86 == 15) && (c->x86_model == 1) && (c->x86_mask == 1)) {
> +	if ( c->vfm == INTEL_P4_WILLAMETTE && c->stepping == 1 ) {

If already you do adjustments towards Xen style, the figure brace also wants
moving.

> @@ -657,9 +659,11 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
>  	/* Work around errata */
>  	Intel_errata_workarounds(c);
>  
> -	if ((c->x86 == 0xf && c->x86_model >= 0x03) ||
> -		(c->x86 == 0x6 && c->x86_model >= 0x0e))
> +	if ((c->family == 0xf && c->model >= 0x03) ||
> +		(c->family == 0x6 && c->model >= 0x0e))

Bogus indentation would also want adjusting while touching the line, and ...

> +	{
>  		__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
> +	}

... I don't see why figure braces would need adding here.

> --- a/xen/arch/x86/include/asm/intel-family.h
> +++ b/xen/arch/x86/include/asm/intel-family.h
> @@ -179,6 +179,10 @@
>  #define INTEL_XEON_PHI_KNL		IFM(6, 0x57) /* Knights Landing */
>  #define INTEL_XEON_PHI_KNM		IFM(6, 0x85) /* Knights Mill */
>  
> +/* Family 15 - NetBurst */
> +#define INTEL_P4_WILLAMETTE		IFM(15, 0x01) /* Also Xeon Foster */
> +#define INTEL_P4_PRESCOTT		IFM(15, 0x03)

For this likely Andrew's wider patch may want to go in first, so this part
could then be dropped.

Jan

