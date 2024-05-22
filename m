Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1258CBDDF
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 11:33:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727366.1131856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9iLe-0004Hq-N4; Wed, 22 May 2024 09:33:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727366.1131856; Wed, 22 May 2024 09:33:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9iLe-0004Fl-KR; Wed, 22 May 2024 09:33:26 +0000
Received: by outflank-mailman (input) for mailman id 727366;
 Wed, 22 May 2024 09:33:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJ0E=MZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s9iLd-0004Ff-7B
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 09:33:25 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 552f732d-181e-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 11:33:23 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a621cb07d8fso99550766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 02:33:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cdb5sm1744216066b.29.2024.05.22.02.33.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 02:33:22 -0700 (PDT)
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
X-Inumbo-ID: 552f732d-181e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716370402; x=1716975202; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8AYXYZ50OpjNgv0sGHRw4nmKedbD2eMhNqcKvs7HDDg=;
        b=egUcPrjoY23e6OznqPNkkq1i3GPdnPzYwxJbaxFTsjDrpQfJwzhdUYcJKJveMvSIcH
         AV4mF9syslYNLZnuWx8/+XH8ON27vzNxz5YqvZ+sxo83MJFwkUArOm6R0B/1+HDvP/xa
         bfjVwPns2QaqexPb7lOKiqwn5j8uWm13KwJxzhk9ISta8AGFOU11ETbcD3TO56FDwEcG
         cNjx7MZGSKOF+Bq1QA2rEqKktPoipPQbRsthhyyBernXuy6DKrHEUkBpO2D+MAMw5asC
         f0xKiLGNfJidNRjenTb5mxje+UbQ/x2O6ewrUugjqBlzPGk5zg6ZXCFJuNoI4vC/FJbf
         AERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716370402; x=1716975202;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8AYXYZ50OpjNgv0sGHRw4nmKedbD2eMhNqcKvs7HDDg=;
        b=Yelmq1Mgcy31HLJw8PTueh0LKanVwoxTJL5tofkITLhQ5z/L19iC1wWPto18iFdAHq
         rqccfCBH4lfS7O8aeiN2NLVUiVShQEGO9hzVP2s/hbQewQXQ7HKIS4+l/HrQC5/sp9LO
         s9GjO4jV28v39AXY7yFekdY5U2uS16ncvAQobxO6J2vHqVtbWbSdqwucW8af7FsSNd4v
         efvDR17BSvxkRpX4qNx0VbaVDnD3uJ7kSS/34i0LQGds8QKXXjv+TjIjGxhfdJjih9ar
         zhWyTgUWFf8Y2A5A0r8XylDrqCBpLlz+pAZoaTKSpiakBX59tSUSErXyXXgidDmRWx31
         oQ+w==
X-Forwarded-Encrypted: i=1; AJvYcCXR6cSHgdYBu+LoVR4VPtIP1B5h/EIDg64YaklAScbS0lm0Al0woj9l2ipSN6Pm0BbKmicqLANvaFUmoad6BRJY+qAfhll1mHvGguuebQs=
X-Gm-Message-State: AOJu0YwIT94XM95vVcieGKJTr2WJaBY7Q5+UJxpCrnvA8b+gNKsZLg4G
	IH9ypGT/Hc62gk25Z3K3Ce78bANbDnHFhdfYajbxNxv7CASxHaGirb4JlBbW4A==
X-Google-Smtp-Source: AGHT+IFNtCiKQv/ifn+lJiyDvHuCAERl6wrIquH5hTkisUcsOxkKe7P58e75n1lTulvkz9dHfDPhNQ==
X-Received: by 2002:a17:906:9c41:b0:a5a:84c8:7710 with SMTP id a640c23a62f3a-a62281253a4mr82541066b.55.1716370402468;
        Wed, 22 May 2024 02:33:22 -0700 (PDT)
Message-ID: <6a21a57f-e0fa-43af-a7ea-d813e4b2976d@suse.com>
Date: Wed, 22 May 2024 11:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] xen/x86: Simplify header dependencies in x86/hvm
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <00ce7005d1d6db5c1ffc2d5023d34d4bd34ff841.1715102098.git.alejandro.vallejo@cloud.com>
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
In-Reply-To: <00ce7005d1d6db5c1ffc2d5023d34d4bd34ff841.1715102098.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.05.2024 14:39, Alejandro Vallejo wrote:
> Otherwise it's not possible to call functions described in hvm/vlapic.h from the
> inline functions of hvm/hvm.h.
> 
> This is because a static inline in vlapic.h depends on hvm.h, and pulls it
> transitively through vpt.h. The ultimate cause is having hvm.h included in any
> of the "v*.h" headers, so break the cycle moving the guilty inline into hvm.h.
> 
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

In principle:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
But see below for one possible adjustment.

> ---
> v2:
>   * New patch. Prereq to moving vlapic_cpu_policy_changed() onto hvm.h

That hook invocation living outside of hvm/hvm.h was an outlier anyway,
so even without the planned further work this is probably a good move.

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -798,6 +798,12 @@ static inline void hvm_update_vlapic_mode(struct vcpu *v)
>          alternative_vcall(hvm_funcs.update_vlapic_mode, v);
>  }
>  
> +static inline void hvm_vlapic_sync_pir_to_irr(struct vcpu *v)
> +{
> +    if ( hvm_funcs.sync_pir_to_irr )
> +        alternative_vcall(hvm_funcs.sync_pir_to_irr, v);
> +}

The hook doesn't have "vlapic" in its name. Therefore instead or prepending
hvm_ to the original name or the wrapper, how about replacing the vlapic_
that was there. That would then also fit better with the naming scheme used
for other hooks and their wrappers. Happy to adjust while committing, so
long as you don't disagree.

Jan

