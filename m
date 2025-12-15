Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D68CBE4BE
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 15:34:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187095.1508516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9dQ-0008Ee-72; Mon, 15 Dec 2025 14:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187095.1508516; Mon, 15 Dec 2025 14:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9dQ-0008Bu-4R; Mon, 15 Dec 2025 14:33:12 +0000
Received: by outflank-mailman (input) for mailman id 1187095;
 Mon, 15 Dec 2025 14:33:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV9dO-0008Bm-Eh
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 14:33:10 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7a484a7-d9c2-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 15:33:05 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso15629825e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 06:33:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b8a97esm35190534f8f.31.2025.12.15.06.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 06:33:04 -0800 (PST)
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
X-Inumbo-ID: f7a484a7-d9c2-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765809184; x=1766413984; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TMD7lQhrWjDvpZcq77Oqn+f4GeDE5Pb+lzzDOBJD86A=;
        b=dF96lLlc+Aqy11hz5x3j+m6PvDQpv5UW2k6MdyvwjzH7+IGM8mKMO66nGOlpGMJYTP
         tYrfp9nHyMC+scB96ux47yft0yReHYilQQB8qLBwUARLjQpPiPGfCgvvVa4MPpZPJ3Bl
         Vqs9q54HLE+UMCION65N1kvEaR3u+Dm7USAgGXDssAA21TDIjzeVT5kccwXTHRufYDaO
         x5FLOVSlIQw9AY/ppF8sLInSOz+xJ27lqETKp62Q0+ucn9J/nBiHUc28kaxGW4gVsOYm
         C6tyl3hKJvulo+W+BSZ5VzmBwXaVBCiBjbTTn1/d5y7rOiuVZ64Gpd/6bRtYRKzaXZEz
         NORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765809184; x=1766413984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMD7lQhrWjDvpZcq77Oqn+f4GeDE5Pb+lzzDOBJD86A=;
        b=lFgyFzt9n1nCLjEAK7Rg5ouzS+7SnO2kmVhtkPA9ze/Ie169lO1J2kAAQOcYfaMPwo
         adNfT0t/PLwxympyN83mwIhvaq6g8N4qpfLIO+jHHSr7LHLdzQXwYIdMLhS4C7UzTKga
         sORIBXzZYQlaequB449+2c2jSTFll6oLvgVkPyP7BAs2ZpsGMCd9SUBnGAR36MZuEqbR
         37AR9Enwee7kz8T8iGOZTP/5JkWmO9iFMyZT8x6Zm7aE4b1cSHLA/VW1VqMTcZQQ4MB3
         RkMAjQXE97h6sHGgmMlUJC4dXykC1fkG5lco3+7ihMbkwKZSIHLxwPkCpNSDtJl4J1hk
         dUlA==
X-Forwarded-Encrypted: i=1; AJvYcCWCri4u90zL9+f+QMO9WPZHwveRPm1Xm92upbQfBW0XpTXCPI43IOZJow1ho41w9Afqe7vLmCOt9JI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg7EYqxDJmfyBk9+P/aJ1WAZro9QYY+NM37u/Zf/ZFeyhKlmpW
	nl3MBM/Sy/c2b11dA8W3b2zFzAVX3ZQg+KovLNWhDUdHPeIVYHdgNz2z7X5TMPUaVw==
X-Gm-Gg: AY/fxX7mkd5gCapmXMLbZHIyejo6AyMO3KJ7kPTasuCyz+maHSU/P61EWO5DIU6H+vm
	/T6b22ydUl/rExyYXJe/YdtXkec0HFnjuS25NdamZpnmhblUjfwYfCl00jbzc7b0gKIMt9yLTYJ
	dsNdFB6NK1UJSuwxUdUwzFCf09/ZE9Fi88/ktZvMiF9WxQeQ5YYlE5x/gY2mpI6wHrqYTTr5fuq
	KPy3xU5iszLV6fRUIjc5e72H7+mVYPGSIAlUgazLCAi3gqgcuyJKzEsqpGoCPhLm2v5zd15PG/f
	/T2sPkhTW2Wimbrkan4qWqleyIKPslEQOnccgJtSKeRQRH8CkHmqvyYdaojwGP2gmUPUsXiBWFx
	/hsYB9oUtzgkzorLuPOtKoeBIorlvXk3ynAgZ5CevluSfw6Lnll3evlUEk3xeunittGTopDrQ43
	fXvvJnI76ldaGvgd209ne7cKJu7t/XmqYYOXY0wSgwVEAWlymH+2EOvCYYycrq19pKR3dcjY8cY
	zWamd9Jar8G+Q==
X-Google-Smtp-Source: AGHT+IGExVobOqU5RgOo5uxwiOsWDqR42oPc1CwwyDN+GE0nluLliI5rT4x5ZBMrXRmtqqvgEMyfzg==
X-Received: by 2002:a05:6000:178a:b0:431:35a:4aa3 with SMTP id ffacd0b85a97d-431035a4e21mr104019f8f.18.1765809184409;
        Mon, 15 Dec 2025 06:33:04 -0800 (PST)
Message-ID: <23f85e06-4d63-47c4-b232-8469ccb66126@suse.com>
Date: Mon, 15 Dec 2025 15:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 20/24] xen/x86: wrap x86-specific domctl-op with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
 <20251212040209.1970553-21-Penny.Zheng@amd.com>
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
In-Reply-To: <20251212040209.1970553-21-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 05:02, Penny Zheng wrote:
> ---
> v4 -> v5:
> - do not undo imply and add "depends on MGMT_HYPERCALLS" in option
> - use IS_ENABLED(...) to avoid too long line

Coming back to this patch when looking at patch 24, I have to add: I don't
understand this. We ...

> --- a/xen/arch/x86/include/asm/paging.h
> +++ b/xen/arch/x86/include/asm/paging.h
> @@ -57,7 +57,8 @@
>  #endif
>  #if defined(CONFIG_PAGING) && !defined(CONFIG_PV_SHIM_EXCLUSIVE)
>  /* Enable log dirty mode */
> -#define PG_log_dirty   (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
> +#define PG_log_dirty   IS_ENABLED(CONFIG_MGMT_HYPERCALLS) &&                \
> +                        (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift)
>  #else
>  #define PG_log_dirty   0
>  #endif

... already have an #if here, so mixing #if and IS_ENABLED() doesn't look
like a good idea to me. To deal with the line length issue, all you need to
do is split the line:

#if defined(CONFIG_PAGING) && defined(CONFIG_MGMT_HYPERCALLS) && \
    !defined(CONFIG_PV_SHIM_EXCLUSIVE)

. The alternative could be

#define PG_log_dirty   (IS_ENABLED(CONFIG_PAGING) &&             \
                        IS_ENABLED(CONFIG_MGMT_HYPERCALLS) &&    \
                        !IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) && \
                        (XEN_DOMCTL_SHADOW_ENABLE_LOG_DIRTY << PG_mode_shift))

, just that then PG_log_dirty likely can't be used in #if anymore (see the
related comment on patch 24 that I'm in the process of writing).

Jan

