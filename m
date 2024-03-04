Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E18686FC0D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 09:42:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688211.1072134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3tc-0002ur-AV; Mon, 04 Mar 2024 08:42:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688211.1072134; Mon, 04 Mar 2024 08:42:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3tc-0002t6-6Z; Mon, 04 Mar 2024 08:42:04 +0000
Received: by outflank-mailman (input) for mailman id 688211;
 Mon, 04 Mar 2024 08:42:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh3ta-0002t0-No
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 08:42:02 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11713a14-da03-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 09:42:00 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a4532f84144so90948966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 00:42:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 lf12-20020a170906ae4c00b00a3f27031d7bsm4478192ejb.104.2024.03.04.00.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:42:00 -0800 (PST)
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
X-Inumbo-ID: 11713a14-da03-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709541720; x=1710146520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dH71Eg9TYrklzTXB5rbvvDpAAx3jxhgWpBFzwoM4zGc=;
        b=T6NgJeIeM7ANxykKTKzINTRIVZlRPTQhRD+BhT1rAilWSr11PaBEXAe3mSTJb04N7e
         pXwP6I9StBmm896MCv0MvaUTbopYR/xgwC9Xbp6DRo2AL/FsGT/E8N1wOm6QvZe7v2SE
         qx1uUZPmdRqttBs6nuJQho3cVvB0OVPyTqwMyA5fZIKTJovUZAc/Q40rd6KUhIc8vHGP
         imjvslYUqwBE/7VJu3twT1VwF12cSq3M9t74AUUED5Y9EvmXWyxUfsnQQzYhO0qJliqU
         2SaVpQOTlb73oDSiGhLZUCUDt7ULWGCwvk2mLs2HmTFwaNiSEe1+3GN9gA7xbME6fKUo
         ThKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709541720; x=1710146520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dH71Eg9TYrklzTXB5rbvvDpAAx3jxhgWpBFzwoM4zGc=;
        b=nNsC06rlQVfgl1SYg3wXgQP9LYnPs7HN63NU/MYN0mF/F9SR3rMHHSYYZLx9yAAkkh
         7o3UBsDeWoraUJErjNVHbld61FM8wAHq/SHYRqPUmrzCYJDrHRQnG0dDUxXoE+D0ciTx
         ZtX9Ng2oc6RuAJhHvvPcBRb4DkianVibThWFOLanShS2npybV6FRBanSg/2gOMLKHlwc
         //6BA3mkYS5d+vhZ89rmcn6F8TB8J90ujNuC2SYc9NtCxWWYyfT0/0+hF5oDHD+WsD90
         N0uXlQFMWrfgprA0UEZaDQfKLWlWGwLnnF5yQ4+/SmB20lBniArdAU9lX/JbeM1MxOY7
         r/NQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3YeFuC/2AeQmd39BaGujFLDEuDua+xHVCXLIcBsPO4FDjX4CWtkjtQulZ65KaYKcWn6GMF0Ub7wlnYxIaYWuldQ7M/S+jjDunfJNms8E=
X-Gm-Message-State: AOJu0Yw+BrwbQAuF+fPIK1DDLzuH25FxcZxN0AMCrAL5ral2++k+ULDY
	8CJmrGxuVJsqSfwCPhnXSaTLa3cC775B7zwsCctm+IbvMQksP1ydOq2PEcHbdg==
X-Google-Smtp-Source: AGHT+IHDajJxFhYTX+wXFxFGtArV2QmMXH/5WGT41ipjk4FCcWoihqod32doUjFn0hyZUzSl8GT/xg==
X-Received: by 2002:a17:906:fa92:b0:a3e:d5ac:9995 with SMTP id lt18-20020a170906fa9200b00a3ed5ac9995mr5715611ejb.59.1709541720390;
        Mon, 04 Mar 2024 00:42:00 -0800 (PST)
Message-ID: <0751a4ac-4e3b-47e4-8727-f3dd4610d446@suse.com>
Date: Mon, 4 Mar 2024 09:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix visibility of HTT/CMP_LEGACY in max
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240301112829.2657865-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240301112829.2657865-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.03.2024 12:28, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -464,6 +464,16 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
>               raw_cpu_policy.feat.clwb )
>              __set_bit(X86_FEATURE_CLWB, fs);
>      }
> +
> +    /*
> +     * Topology information inside the guest is entirely at the toolstack's
> +     * disgression, and bears no relationship to the host we're running on.
> +     *
> +     * HTT identifies p->basic.lppp as valid
> +     * CMP_LEGACY identifies p->extd.nc as valid
> +     */
> +    __set_bit(X86_FEATURE_HTT, fs);
> +    __set_bit(X86_FEATURE_CMP_LEGACY, fs);
>  }
>  
>  static void __init guest_common_default_feature_adjustments(uint32_t *fs)
> @@ -514,6 +524,18 @@ static void __init guest_common_default_feature_adjustments(uint32_t *fs)
>              __clear_bit(X86_FEATURE_CLWB, fs);
>      }
>  
> +    /*
> +     * Topology information is at the toolstack's discretion so these are
> +     * unconditionally set in max, but pick a default which matches the host.
> +     */
> +    __clear_bit(X86_FEATURE_HTT, fs);
> +    if ( cpu_has_htt )
> +        __set_bit(X86_FEATURE_HTT, fs);
> +
> +    __clear_bit(X86_FEATURE_CMP_LEGACY, fs);
> +    if ( cpu_has_cmp_legacy )
> +        __set_bit(X86_FEATURE_CMP_LEGACY, fs);

When running on a host with the respective bit clear, won't this break
(at least older) Linux'es logic? Iirc the unconditional setting of at
least HTT was tied to the unconditional multiplying by 2 of the vCPU ID
to derive the (fake) APIC ID.

Jan

