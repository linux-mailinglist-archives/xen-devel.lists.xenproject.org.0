Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A8E86C972
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 13:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687037.1069768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffpK-0003V8-1R; Thu, 29 Feb 2024 12:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687037.1069768; Thu, 29 Feb 2024 12:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rffpJ-0003St-Up; Thu, 29 Feb 2024 12:47:53 +0000
Received: by outflank-mailman (input) for mailman id 687037;
 Thu, 29 Feb 2024 12:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rffpI-0003Sn-Qd
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 12:47:52 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf60a643-d700-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 13:47:50 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a44628725e3so22434466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 04:47:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h4-20020a1709063b4400b00a433f470cf1sm648666ejf.138.2024.02.29.04.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 04:47:49 -0800 (PST)
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
X-Inumbo-ID: bf60a643-d700-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709210870; x=1709815670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Ze8Gl+c5m0bhaEc2tOK4/IUPw2m7dVfUmIkxjX/BKw=;
        b=XYfguade4+qeZFAfM0OMGR1/X3R7QiD4I7DjlQ8r3Njip3lwpmK17+J5Dy6fx2AUN8
         4vCqdqzIffNCvZmygelP8ODow2N2Ab374I7MIVNVlaQRSW5GKVg6MFAhLZUd2++JXyRf
         XR5Lpl14ivNZbJxxRFbm7GZaeqfbI7ZGkfmuvvJodzougmmf44LYzB4lM6wXQslhyCj+
         1aI85vKnYcPkvnO1leklw7dGexWTVmcPXrKNQmexqfmmjWzqu4DsilAMlvZerEyDmS8h
         XYz45zq/ej2FeEfwdoItbTcLIPG3cQlRISQTC/NfI63lCJgGDYc8nmUpZilR0ru59g1e
         KkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709210870; x=1709815670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Ze8Gl+c5m0bhaEc2tOK4/IUPw2m7dVfUmIkxjX/BKw=;
        b=lXMpfJ9CYevgJD2KIQ2Yjl7aJ8hWBEDG2uEIhEqxHaIMsyFlEbDkm7Vxu1MlJn7krD
         KMHZzu4ryODg5lyp4PIDsiAwJCnW90y1gGuRWTmsgzQNa0PK4lSrCSu6mLRtoGmKHm0w
         tFcJdttvWuMkvbOuaNCsR6fdI2cMPekhuFFkTXEPpsHQ+u+vydYPdc1aEYe0sty0GTD8
         PB81++ZzYwkPYb9x7zhs6eKTpG+rTogXxl1Xg9pCvO3wld8LO9pqOCBeJaAmc4SaB/ZS
         kNm+37LnNyBVIBNFJAzAI6MbVOC6J+4iCqkpEjmYM3aHDdi0l6bJjurU8NcARdsZ5WVR
         5Flg==
X-Forwarded-Encrypted: i=1; AJvYcCXFtfOSoYvyreiEb9LwFpQuK3rurQZw3VxJHdebIWM7K0pNJVuuBtgylhBi7p6WlXJ/9Jp7OIRUhlSI5og3gVJeVghfZz5dFxZKGZeo5b4=
X-Gm-Message-State: AOJu0Yxt2C+3jAAlbyeyR4MVAE7fkz+ZUZs/3yFUNtHeNx0BvzvESlWq
	rJOMtwkZXmHmz/ldv+lSeddGdEnX3FgnpzeiXs3Cx62FopLlIzXI67OeOiiM5v2r6aKpR4B4pE4
	=
X-Google-Smtp-Source: AGHT+IFHn201zo35Usxx1CqEBgm4c8z9VNJgcf4hmP7t39TBbHGV2rQCACoTcW5zSsbZYppIjwZ6Eg==
X-Received: by 2002:a17:906:aeca:b0:a43:4e75:21ac with SMTP id me10-20020a170906aeca00b00a434e7521acmr1299893ejb.52.1709210870132;
        Thu, 29 Feb 2024 04:47:50 -0800 (PST)
Message-ID: <707ff486-b448-4bc0-be7e-1c692b360734@suse.com>
Date: Thu, 29 Feb 2024 13:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix x2APIC visibility for PV guests
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240229104304.2478614-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240229104304.2478614-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.02.2024 11:43, Andrew Cooper wrote:
> Right now, the host x2APIC setting filters into the PV max and default
> policies, yet PV guests cannot set MSR_APIC_BASE.EXTD or access any of the
> x2APIC MSR range.  Therefore they absolutely shouldn't see the x2APIC bit.
> 
> Linux has workarounds for the collateral damage caused by this leakage; it
> unconditionally filters out the x2APIC CPUID bit, and EXTD when reading
> MSR_APIC_BASE.
> 
> Hide the x2APIC bit in the PV default policy, but for compatibility, tolerate
> incoming VMs which already saw the bit.  This is logic from before the
> default/max split in Xen 4.14 which wasn't correctly adjusted at the time.

What about guest_cpuid()'s handling of leaf 0xb then? The %edx value
will change once a guest is rebooted, aiui. The comment in
recalculate_cpuid_policy() that you update refers to that.

> Update the annotation from !A to !S which slightly better describes that it
> doesn't really exist in PV guests.  HVM guests, for which x2APIC can be
> emulated completely, already has it unconditionally set in the max policy.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> This wants backporting as far as people can tollerate, but it's really not
> obvious which commit in 4.14 should be referenced in a Fixes: tag.

Why 4.14? In 4.7.0 I see ...

> @@ -830,11 +846,10 @@ void recalculate_cpuid_policy(struct domain *d)
>      }
>  
>      /*
> -     * Allow the toolstack to set HTT, X2APIC and CMP_LEGACY.  These bits
> +     * Allow the toolstack to set HTT and CMP_LEGACY.  These bits
>       * affect how to interpret topology information in other cpuid leaves.
>       */
>      __set_bit(X86_FEATURE_HTT, max_fs);
> -    __set_bit(X86_FEATURE_X2APIC, max_fs);
>      __set_bit(X86_FEATURE_CMP_LEGACY, max_fs);
>  
>      /*

... these adjustments, just still in calculate_pv_featureset(). I
haven't gone further backwards to check if/when this exposure has
really appeared. I wouldn't be surprised if it's been like that
for all the time since we gained x2APIC support in the hypervisor.

Jan

