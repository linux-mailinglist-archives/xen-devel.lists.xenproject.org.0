Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA395A81EFA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 10:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943589.1342282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2QLi-0004y0-5k; Wed, 09 Apr 2025 07:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943589.1342282; Wed, 09 Apr 2025 07:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2QLi-0004ve-2l; Wed, 09 Apr 2025 07:59:54 +0000
Received: by outflank-mailman (input) for mailman id 943589;
 Wed, 09 Apr 2025 07:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2QLh-0004vY-4K
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 07:59:53 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d26ed5b-1518-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 09:59:51 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso5664843f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 00:59:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d89402a08sm828929f8f.100.2025.04.09.00.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 00:59:49 -0700 (PDT)
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
X-Inumbo-ID: 9d26ed5b-1518-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744185590; x=1744790390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zv9/QU/d75fYM3hHGscnkbWcHBxfuQSaowy/czXNBu8=;
        b=feW78lI54K4pBrZnNh3ek0sOZVyQlOtoD+l9xakdCHr6GKM0+nk+djPfMz6lrTz03m
         x6UPRz1qwwqtLUPHIQMAzn6zckYQrpYtsHRFOFK8bbcAzihUSlVI4WKWQNCVISmKT0Ey
         pGH2Y7Zmlhch8WruZPelHGKuPsQzGZxSWcqIsoSIdiRipIiWrxGaLz+z891MSQBjWyQy
         pT8jkMYtObYpvrvXhnmnC3x/DQVAXWzRVAEt37niTvECJfDhJuNhC7AuPGiiDFwof9k8
         hL3j7ackoUSk1pRjdDhtpRC7rD1AFlSoXu+YJ7WNHbv/H6Z7tckVtVuffrJzNUP3U+p7
         YP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744185590; x=1744790390;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zv9/QU/d75fYM3hHGscnkbWcHBxfuQSaowy/czXNBu8=;
        b=eu67Jj+bIZjCTNALLJk+9hPRP8yV4K+VeW1xso5UkM/ElS5mh4XQFv6UtkvrpRbHO+
         VqHaTWCSB/ITMRH9dOeFW9lsLi9jLxn6HJCaDGVfMrNwllirkg7zOO9Y2NEBFZV8HQ38
         vSZEHMFdQyO+HhqndmB1/zu97Ck+mBGxVnczf65AMlqhkXV4CFvTpZrLo1aq/T8jy0wl
         fKV+nGVQKqGHKuPlUCDG7Y6Pap6HhMxvVv+7a4k6Lcw6sOISetMz+lDX2zorJIJFB/cj
         ZvjUJ5zZG9Ayy0VlHPr5fc/RBC+sM7LO/TOquS14s/BArYxBrsjJw15SbCPYwMqzwJHJ
         WF3g==
X-Gm-Message-State: AOJu0Yxdn7hERtoBsDZOVc9yrBAXSf8/ya+pusV4t/Ah7gl33vQB9XK4
	BzYccWr9LF8Zs7xNhh88teA62XPKIfq8EbM9bBo1ikdsBJvB0epSTQhu+lHf4sum01XcSKaiLtI
	=
X-Gm-Gg: ASbGncsuI5cyTRHRCgG/uIJMqG0IW88F08Z+c3mSyv3HXA05L6qhsAGGWoGtS2dDAUg
	VtyJhqfrU/DbZ166FmXBVhYl0Qtd76QYh/4ByhIy++xyYDveaR35VMqE9Ko7rHlqB/Demr4RuXm
	8cTe75B1+PAgxDwW6lS0YO5LH+hcuhERnUQF3UJ8Mr2lNYBlIkAVh85OSu345uTgZaWqyFINiBN
	nV6B7gMPh96/G16hfE7A+13AelJI8Ety0UaoHOOP284vH5yOUyNb8X4x4kOz84BhwvZsmd1Ix9n
	6lTpv58SW0AP3GK2MDNMjSa5V/wxiL0HswxrQ9Y/Wi0ax7WFq+FaNxtLER6lGRjbyLh11M9IyHp
	U5N6jLFDXUhnrwPbYnRQ2kcE/Mw==
X-Google-Smtp-Source: AGHT+IH3mqUOs5w/o1/b+wuFUgk36fhFXwj/h2RfGWKXnDnBj6SQat2Y9eyCYGHRo+FPLY+0b6ZjIg==
X-Received: by 2002:a05:6000:40df:b0:391:4559:876a with SMTP id ffacd0b85a97d-39d87cd02f5mr1686437f8f.46.1744185590347;
        Wed, 09 Apr 2025 00:59:50 -0700 (PDT)
Message-ID: <d9fb7408-aff9-4b43-abd1-233fe74dbd20@suse.com>
Date: Wed, 9 Apr 2025 09:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] x86: suppress ERMS for internal use when
 MISC_ENABLE.FAST_STRING is clear
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.com>
 <2e61ad8d-3b1f-49bb-bc93-61c820d6caf3@suse.com>
Content-Language: en-US
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
In-Reply-To: <2e61ad8d-3b1f-49bb-bc93-61c820d6caf3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.01.2025 11:11, Jan Beulich wrote:
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -487,6 +487,12 @@ static void __init guest_common_max_feat
>       */
>      if ( test_bit(X86_FEATURE_RTM, fs) )
>          __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
> +
> +    /*
> +     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
> +     * FAST_STRING is not set should not affect the view of migrating-in guests.
> +     */
> +    __set_bit(X86_FEATURE_ERMS, fs);
>  }
>  
>  static void __init guest_common_default_feature_adjustments(uint32_t *fs)
> @@ -591,6 +597,15 @@ static void __init guest_common_feature_
>       */
>      if ( host_cpu_policy.feat.ibrsb )
>          __set_bit(X86_FEATURE_IBPB, fs);
> +
> +    /*
> +     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
> +     * FAST_STRING is not set should not propagate to guest view.  Guests can
> +     * judge on their own whether to ignore the CPUID bit when the MSR bit is
> +     * clear.
> +     */
> +    if ( raw_cpu_policy.feat.erms )
> +        __set_bit(X86_FEATURE_ERMS, fs);
>  }
>  
>  static void __init calculate_pv_max_policy(void)

While doing unrelated work in this area I noticed that this hunk is wrong,
and wants to be

@@ -567,6 +573,16 @@ static void __init guest_common_default_
         __clear_bit(X86_FEATURE_RTM, fs);
         __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
     }
+
+    /*
+     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
+     * FAST_STRING is not set should not propagate to guest view.  Guests can
+     * judge on their own whether to ignore the CPUID bit when the MSR bit is
+     * clear.  The bit being uniformly set in the max policies, we only need
+     * to clear it here (if hardware doesn't have it).
+     */
+    if ( !raw_cpu_policy.feat.erms )
+        __clear_bit(X86_FEATURE_ERMS, fs);
 }
 
 static void __init guest_common_feature_adjustments(uint32_t *fs)

instead. Fixed locally.

Jan

