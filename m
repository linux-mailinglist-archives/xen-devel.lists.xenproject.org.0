Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8A3849D1E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 15:34:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676146.1052056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX02o-0005B1-JA; Mon, 05 Feb 2024 14:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676146.1052056; Mon, 05 Feb 2024 14:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX02o-00059C-Fd; Mon, 05 Feb 2024 14:33:58 +0000
Received: by outflank-mailman (input) for mailman id 676146;
 Mon, 05 Feb 2024 14:33:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rX02n-00058n-4k
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 14:33:57 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97221ef5-c433-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 15:33:55 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40fcb4ef7bcso24670545e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 06:33:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c19c700b0040fdf2832desm45036wmq.12.2024.02.05.06.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 06:33:54 -0800 (PST)
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
X-Inumbo-ID: 97221ef5-c433-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707143635; x=1707748435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2dX9ddEHESpBoftdrS/QI0RH29LBWiehjXMlgyAI5HM=;
        b=XZ4AT4jjjeEoxdzkIQo2RNULIN0YEvqRZgRIYRRSSGuUNXBeqiZAQsG5pUwR7WthT1
         aVpuIsLZkTrqGtLrd8wwxNak718N5ViHlqVebE5o3ys07tugDLUBEpoCJid4bXzEfN0H
         cp1uRmJ9y+FK4AyW/0DqunJDi8P5kVr+gGWqn00eGVs1L64qmzraLQW+h6o2h1itCFKe
         4kE50NM0QwFInVCL+aq6cyqa6NpMJdfiFjR8qwk2q5Oq6KVk1FzuijL8c49ysksEFPei
         XdnY4Inm2BwXmSimXCccoz3A02KNLVBiqk1S40EayRoad2R1sTNjkQnUkd40h4xWjasg
         Q3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707143635; x=1707748435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dX9ddEHESpBoftdrS/QI0RH29LBWiehjXMlgyAI5HM=;
        b=m88DcQhBBUDmc3eb6taBFDrhoEmGWESWKTsMITlqscnBkD1nkdYYRazPwloel/GuFS
         vJlM9nCq7xmpqjeynWCyuUBwejtHRmBaD7jeDcip3Ye37EWpIiqoC/ZJOND3ms0Vl3YI
         iT3BJN0i4EqA9DmC/sqQv13hOWwbuuzaakco+rAgX4tJKt6dX997kQtDqd4W+P27Xd8R
         eNO6+Yipw4BHvBGJx4vDZdWigltkokYiS/0l0gEEkn6/Wn7+07FJU4hFXR93ySTD7inu
         L6mNuqOzA4TRmD1itDiDCW9tRTySyUl3WOlXTjMq/XZtbthQ2VZBd8FnTcv3oj2fi7O1
         fRFA==
X-Gm-Message-State: AOJu0YzGOifE+rUfleZjGAR2JPTKP4zwAXZfE2wtoZcBDFN/P3wY/ioB
	PTuwISnJDx1i32MxFWiWfepRKtiZZNVXoMVVgaI4eiab3vWph1xj7PkMwtsTtA==
X-Google-Smtp-Source: AGHT+IF+ClaJg8wn5gO1z2LJirSxIydyHYsBLPMQ14HStRGq8HyvamZDMD90NX/0M4MVpRc9fEGw2A==
X-Received: by 2002:a05:600c:35c7:b0:40f:bd81:e738 with SMTP id r7-20020a05600c35c700b0040fbd81e738mr4561032wmq.29.1707143634911;
        Mon, 05 Feb 2024 06:33:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU4oPKQY8qPfoUlFJzCVqNly3VUDRbd8wKWqKUuBfeEM6lIkkDUj8lC8nZXQ30Jd1f3IaM52dxe0mIPjiYaYjmpCXRWsrJfT9ymTgXqtyF1x00HYMbW0UDF5vQ=
Message-ID: <cb716326-4a1c-44ce-8d00-ec46cb112242@suse.com>
Date: Mon, 5 Feb 2024 15:33:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu: Fix mixed tabs/spaces
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240205141441.1880188-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240205141441.1880188-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 15:14, Andrew Cooper wrote:
> Fixes: 660f8a75013c ("x86/CPU: convert vendor hook invocations to altcall")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Without the (or at least this very) Fixes: tag
Acked-by: Jan Beulich <jbeulich@suse.com>
The patch you mention didn't touch the padding at all. (It also didn't
correct the prior inconsistency, but that's mainly because I didn't
even notice.)

Jan

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -336,8 +336,8 @@ void __init early_cpu_init(bool verbose)
>  
>  	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
>  	switch (c->x86_vendor) {
> -	case X86_VENDOR_INTEL:	  actual_cpu = intel_cpu_dev;    break;
> -	case X86_VENDOR_AMD:	  actual_cpu = amd_cpu_dev;      break;
> +	case X86_VENDOR_INTEL:    actual_cpu = intel_cpu_dev;    break;
> +	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
>  	case X86_VENDOR_CENTAUR:  actual_cpu = centaur_cpu_dev;  break;
>  	case X86_VENDOR_SHANGHAI: actual_cpu = shanghai_cpu_dev; break;
>  	case X86_VENDOR_HYGON:    actual_cpu = hygon_cpu_dev;    break;
> 
> base-commit: 9eee78988ca081eeed0a69fc9773e2e4268d1ed7


