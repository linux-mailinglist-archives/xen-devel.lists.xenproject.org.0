Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB80C8CAD33
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 13:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726841.1131219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9NW5-0002kp-6B; Tue, 21 May 2024 11:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726841.1131219; Tue, 21 May 2024 11:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9NW5-0002iP-3M; Tue, 21 May 2024 11:18:49 +0000
Received: by outflank-mailman (input) for mailman id 726841;
 Tue, 21 May 2024 11:18:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLq1=MY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9NW3-0002hu-Io
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 11:18:47 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e369d7eb-1763-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 13:18:45 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a5a5c930cf6so846174466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 04:18:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5cde6f8c89sm744409266b.70.2024.05.21.04.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 04:18:45 -0700 (PDT)
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
X-Inumbo-ID: e369d7eb-1763-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716290325; x=1716895125; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rxPl5N/kM0RaLefHbtKfZV/XFQxzSJfrE1XvgFFM9S0=;
        b=C3eXzaGinmzAXenJdsj9CZsZPoqxDOb03F5pRGlee07jiOeshMUC9AqwLeSGRX0d12
         T6vy+BFp56essRl6td+94CZIjZCl2SWzeKlstqA2W2wIUCppDBaRQkjzjREOjvT3cAGO
         uSwKEiEEE7uRfmJck1oh8M2fBmRPoOX5r0i8I/FZh0jPBxUGuQ2nfGF/OpGi7EobtU1j
         kIWzK4D8V32CoZkFWGWoZuHTUOG1Ap9Hv9PbxexxNZN0feMM88f5MEchOLTSKwnWbHwW
         mTa7NnFQ4RUR3hbHyRMky+yMvw6Ok5IbCMRPpBG5HA+vOYHA+YHNa0C4Deg+9LAPZqoX
         zQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716290325; x=1716895125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rxPl5N/kM0RaLefHbtKfZV/XFQxzSJfrE1XvgFFM9S0=;
        b=Tz7U9Cu8EePBE/e2T+YYw79NqlO6/FPOT7sCXVJSK8qyj/CXWmq2Ow4ajqgUhLUAHt
         QJXixa3s9QPJaKtswna0RRIf2NW6BXxAxYneWS4PZkzS3oOiu6jKiFgIR+io3Ji+cJB8
         jw2+r6SgDFqv4geX8o0ACzFERsIe5C8HwIZk+MaG++B9dbqFhzzmvP+fi+NtigyhscXf
         9CQqmYD9O0sBoA4UMFj44gPfpT1WQXWKPHp+JyGSvrXhHmHs5GqUwSh4c9n0Y8JW7qwT
         Qyd9MStGl53ExJQoEJLWMqy8849PMHMhdyBSrSKM2t46WYXeGVA16zI945leDerXmydq
         hMSg==
X-Forwarded-Encrypted: i=1; AJvYcCVg5F6bW/AnkmUKWH3ojlNE+lIyT1ppxf5VNYdxnyyeNyHzdnm1/7XLGpeHsOqeF/shyZokxaiOsV8yWjaqJlGj/S14vglURj2IXyVPEbM=
X-Gm-Message-State: AOJu0Yw9/01VM1C0YWe6wtFpGVvbhXazyhPeayVuwGonJZWiFi6MRzmz
	cv7qWNNQeaYg2eu7QJj1rosmC1CvK0UQCBgYp2EFHuyCVw0IAeVDzIX3bv7q8Q==
X-Google-Smtp-Source: AGHT+IFKKKf5Optn3FbgOwxAjmyZL4ynzOyX221FSYXTHI93WThfv52xlvb2Q349rcz7CNrhjYWoaA==
X-Received: by 2002:a17:907:8687:b0:a59:cb29:3fb3 with SMTP id a640c23a62f3a-a5a2d666ad7mr2526071866b.53.1716290325331;
        Tue, 21 May 2024 04:18:45 -0700 (PDT)
Message-ID: <d26a4033-8cd1-4a9c-8549-49a36b7d52fb@suse.com>
Date: Tue, 21 May 2024 13:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/14] xen/bitops: implement fls{l}() in common logic
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
 <43df611d1c7b7ac16b181fb819f5d886daa31bad.1715952103.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <43df611d1c7b7ac16b181fb819f5d886daa31bad.1715952103.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.05.2024 15:54, Oleksii Kurochko wrote:
> To avoid the compilation error below, it is needed to update to places
> in common/page_alloc.c where flsl() is used as now flsl() returns unsigned int:
> 
> ./include/xen/kernel.h:18:21: error: comparison of distinct pointer types lacks a cast [-Werror]
>        18 |         (void) (&_x == &_y);            \
>           |                     ^~
>     common/page_alloc.c:1843:34: note: in expansion of macro 'min'
>      1843 |         unsigned int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
> 
> generic_fls{l} was used instead of __builtin_clz{l}(x) as if x is 0,
> the result in undefined.
> 
> The prototype of the per-architecture fls{l}() functions was changed to
> return 'unsigned int' to align with the generic implementation of these
> functions and avoid introducing signed/unsigned mismatches.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  The patch is almost independent from Andrew's patch series
>  ( https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3@citrix.com/T/#t)
>  except test_fls() function which IMO can be merged as a separate patch after Andrew's patch
>  will be fully ready.

If there wasn't this dependency (I don't think it's "almost independent"),
I'd be offering R-b with again one nit below.

> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -425,20 +425,21 @@ static always_inline unsigned int arch_ffsl(unsigned long x)
>   *
>   * This is defined the same way as ffs.
>   */
> -static inline int flsl(unsigned long x)
> +static always_inline unsigned int arch_flsl(unsigned long x)
>  {
> -    long r;
> +    unsigned long r;
>  
>      asm ( "bsr %1,%0\n\t"
>            "jnz 1f\n\t"
>            "mov $-1,%0\n"
>            "1:" : "=r" (r) : "rm" (x));
> -    return (int)r+1;
> +    return (unsigned int)r+1;

Since you now touch this, you'd better tidy it at the same time:

    return r + 1;

(i.e. style and no need for a cast).

Jan

