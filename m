Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEBBC18D09
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 08:59:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152558.1483110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE15Q-0000Yi-Qd; Wed, 29 Oct 2025 07:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152558.1483110; Wed, 29 Oct 2025 07:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE15Q-0000WG-NV; Wed, 29 Oct 2025 07:59:16 +0000
Received: by outflank-mailman (input) for mailman id 1152558;
 Wed, 29 Oct 2025 07:59:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vE15P-0000Vr-85
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 07:59:15 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 284a080c-b49d-11f0-980a-7dc792cee155;
 Wed, 29 Oct 2025 08:59:12 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4770e7062b5so25598625e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 00:59:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df473sm24852796f8f.42.2025.10.29.00.59.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 00:59:11 -0700 (PDT)
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
X-Inumbo-ID: 284a080c-b49d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761724752; x=1762329552; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UO0EyFkbzc+6MmDdVWAc5See0kiepwwYwMhPOK5XSnM=;
        b=SlQblx8PrK9RQrQvpxYti0WEUV5qBG5quhmsmcJxVbaZMXw90Uphk8KmLa6lTeRDgm
         XKbeM/5IB8o7nf25JrYYtdU4p0greP5RFFlauwRE4oc/rXNsXsS6s4Kp8kHuxZ2OYtze
         E+bOF1VUx9+lZlFhq+k6k3L4SHo6JmBbl/NKhskbyo4UsY6Zt3AculEhYhQ6u55hqGPP
         NHWHA8wcibiyfttNLQT6NsCYYsdH+xgVcYuIrOmlLft4zyLQ/tbb5jrVtJY585PkMw8Y
         mjBHUY98CdZQN70qNH+Omk3dIO/kGnnVQsckO+WPy3wCTiOjwcqEXLnVtYOSqak8SEfp
         XA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761724752; x=1762329552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UO0EyFkbzc+6MmDdVWAc5See0kiepwwYwMhPOK5XSnM=;
        b=bXNNBuN2eV2S8bECLxW8tZtVY7KoiacCuYUWerCyHt8XLeQR+xJ+tlP0Lxgx6ayItf
         CObUXAjnordICdO+uyod990jJD0erBaHODCbX81KizM8/ZKFFWeCUx4mNJR2Sof9cNwG
         OTo0O+A47EIVLmvzTKeqEwTBe/07cG+z8XWesHM5OwKJZ+oQiLvQV2wasEVXg0+kZ9Om
         x4X9TdAFQpTsD+IJVw8KOROLuYVFuwrbCyzVslK0CxgG7qvjSBy14M7eg/LcMA0mLU7f
         TPPxQUdD8vfFADajCrpDZY0A7DLp3diIfAV7/Ag53JG8q3aNJPAIs2Gx1wYHgoUKQyqp
         accg==
X-Gm-Message-State: AOJu0YwYSz0Q+L2kvITesY5VpE/z81SGJiaCbWb5dhbEiwFqGaCNMU1G
	9YJIq/iaptykyZTEOmLHDHkp8J+GHu5pnXd0/Vo6ZsAIJZYsFDy27eWRjG45adKOgWu2EoNfVKD
	cd24=
X-Gm-Gg: ASbGncuBvEolVC0w4ff+BRL24kw4J7rN0j+AAMVTB8/DfRbfXt8E/u7gl2tiJ75GEcc
	sGXpklqwpMV/K0gPBh4mzV1paY0MbNB0n2m9xnVP6ZR/m1d+uPSwSyZrE1k41DLmf8Fc3yqXEVj
	Ot8Le7437RKYKGWc7lY6jb0vrmTX9vHVgEK7YxbvVgDxnxVXihlDauf9m0USTHdfngBzoVbknvn
	2ivDGaNz3T18fM2A8oF2iFYVoXgoSrtUjqm3zNLoJrHvo3GTbEbpjuekO74qdsKcIP7FNzse3fA
	qhQiTnRKF32EHPIViBEt72OIrrq8d3GwTevuuQdKSGobJ7lXMucCTywXm+hiS8N2VuyxAgYChjP
	qkxf2WSH0NtcUZg/Fh9uDHudwb0aJOEHScbFFAfISN9Q4GSXCi/NWlaQvBFknpmd14lXyuqloNb
	e8CORV1ca3ACqKp/mocLtn0XKnqMciQugkjIhr6A/eUR3N8fZ22r3ivFeD200SuCdixqT5MQMx9
	0juOJ3v+g==
X-Google-Smtp-Source: AGHT+IHR0Zq953L5Z/sGxyOCtI7ZhhL7snVlvi6zh6Og/bPsfcQHAqhl79rMWsiRbCqQciB0jXdDhg==
X-Received: by 2002:a05:6000:26ca:b0:429:8d46:fc40 with SMTP id ffacd0b85a97d-429aef82a71mr1473494f8f.25.1761724752252;
        Wed, 29 Oct 2025 00:59:12 -0700 (PDT)
Message-ID: <45cb7914-5875-4bdc-a5ee-80c2093dff84@suse.com>
Date: Wed, 29 Oct 2025 08:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/ppc: Fix tooling FTBFS due to missing definitions in
 public header
To: Timothy Pearson <tpearson@raptorengineering.com>
References: <1094743618.4119.1761694133918.JavaMail.zimbra@raptorengineeringinc.com>
Content-Language: en-US
Cc: xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <1094743618.4119.1761694133918.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2025 00:28, Timothy Pearson wrote:
> int64_aligned_t and uint64_aligned_t need to be exposed when the GNU C compiler
> is in use.
> ---
>  xen/include/public/arch-ppc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, first of all this needs your own S-o-b.

Jan

> diff --git a/xen/include/public/arch-ppc.h b/xen/include/public/arch-ppc.h
> index 4ca453a284..264e20b89e 100644
> --- a/xen/include/public/arch-ppc.h
> +++ b/xen/include/public/arch-ppc.h
> @@ -11,7 +11,7 @@
>  #ifndef __XEN_PUBLIC_ARCH_PPC_H__
>  #define __XEN_PUBLIC_ARCH_PPC_H__
>  
> -#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +#if defined(__XEN__) || defined(__XEN_TOOLS__) || defined(__GNUC__)
>  #define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
>  #define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
>  #endif


