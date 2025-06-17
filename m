Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC2AADC5EC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 11:15:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017999.1394907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRSPT-0000ut-SD; Tue, 17 Jun 2025 09:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017999.1394907; Tue, 17 Jun 2025 09:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRSPT-0000se-PH; Tue, 17 Jun 2025 09:15:15 +0000
Received: by outflank-mailman (input) for mailman id 1017999;
 Tue, 17 Jun 2025 09:15:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRSPS-0000sY-2c
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 09:15:14 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92b99877-4b5b-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 11:15:12 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a54700a46eso3501808f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 02:15:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365de782c8sm74888445ad.94.2025.06.17.02.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 02:15:11 -0700 (PDT)
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
X-Inumbo-ID: 92b99877-4b5b-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750151712; x=1750756512; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T/xbfcQE9fcmbG/Cayk7Rg/b8k8OXv0fYg2I6v//2HA=;
        b=TlG4+yMiDHzt2wH63s8mE5Cjf0OCPbeYClgWYTRt2oXQhQq8iKIKvi3vfjSRd/2DuX
         TmTfmrOth3t+9vy34WKvsmhdzNhqH5ms8QK49GVLHIkR5t/Kj7LoMVIKI8o+HtsUoVVb
         wsSUF84pPVoQcMZcjdt/3dxMaroFEIIFZy2+uMhfGT487Mp5gJY3ADQJPqGIGcKLmRim
         KX/su4GH6ooPRiGNgZFx0N124l5u4i37K26LjUL4XUmtIH5rmiuGEAOn+kwciQXw34L+
         Vh6YslpuQY/utvuJjoEUjdQb5el4Sb5vLhuiUz9li9pBbapLxD4sqhFbhF6QckPqZb/Q
         8plA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151712; x=1750756512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/xbfcQE9fcmbG/Cayk7Rg/b8k8OXv0fYg2I6v//2HA=;
        b=mULmU7pAo8nQl5wg3CnMoUM/gt3Lf91cDR8pKsJiJvyKxBpfb5hw7672rVwXGsseoE
         AihE7Pcl7pzMy0USLq43BZ4zWls8Sk45CAhjrke6R7IzVCJRmEC6zjUeGmLyfFr1UvLH
         C3hicB6fYe5LFpFPKQQvfVhJdz56Db2FBG0D8IrAAOuC1WSE2FLSTsBAja19KOcZvklJ
         lG8dhjHiweY6Cwe4rApcyiCyqUoZkucH3icuIROIJht39nZbHigAvSk02rJIm8M1S9vW
         0ssK8AcY/gnS3az7F0QjPRod7ab/R+gq2Sb3PkCovdrq7T1yiZmmfG1QGPcsfe2fcTE8
         MO7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqVl61LMxoosUyHCkW5JgiAcAaEa7qbsURGhpyvd8hC0G9r4keFC2qv5E317UsqtkoMUwhC6MTiJM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIlslrRVvPfeZac4s7RsIZTIQ8DaJmBcWIXsXc5+nJFbhw2i6H
	UF4iSlSyPs8dU1exzOxJEgFpBqFdEP7fwrM4uePMc1a6vQ/1JCwDBFlbaaOEtGa2tQ==
X-Gm-Gg: ASbGncvoQ6JT/yUcQ69soc9/Pea+eKDQlMIBm4bYZ940FN9njx4lXh2ffLUZhJHPhpN
	Bb9ObBokt6/ozl9KED0yw1jvagH+5B3ISDO3SLGsfBt7ydJB38UWEu0toFRA0/F9/UXWJgXLPhW
	OmYVtVZGVEt+whqqwQ6vKPdcQF09DlZTLmwP00SPokikW7aWvEUQxsZYIhnwKP6YUrAJeZPXRfK
	HDn3cr8vFK7ySHzi4Xth6FRvcSpA+fp6eYI5YdbfBZtXJ7diWHGuwl9OEI+ZcnLp9Grk2Sqg0BH
	37TII7buDe3x/4HojIR3xSKZFoncIxEsmAvP7iJIG7TCXMx5f6hRmzxG4otWVQJBaQYuUW08zOv
	HiKCsvkOmo9w1Y9GQHvnVwwIzmiUjFSxkBPf1cOdSbLMKlCQ=
X-Google-Smtp-Source: AGHT+IER8oZL0YHmFcci1GTJOHBizxCQwD8trDSSa86CuTURBEX67btE1rH3o6/64EPcxqfzoliCvg==
X-Received: by 2002:a05:6000:18ae:b0:3a4:d939:62f8 with SMTP id ffacd0b85a97d-3a5723a3f05mr8546333f8f.32.1750151711758;
        Tue, 17 Jun 2025 02:15:11 -0700 (PDT)
Message-ID: <d6170d92-fd8e-470c-9401-7826e7eb1ec3@suse.com>
Date: Tue, 17 Jun 2025 11:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen/domain: rewrite emulation_flags_ok()
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: dmkhn@proton.me, roger.pau@citrix.com, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250617011519.55386-1-dmukhin@ford.com>
 <a8471943-ebf3-4b45-80bd-51bff5498ed2@suse.com>
 <dff6968c29274374d32c01baed7ca806@bugseng.com>
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
In-Reply-To: <dff6968c29274374d32c01baed7ca806@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.06.2025 08:53, Nicola Vetrini wrote:
> On 2025-06-17 08:19, Jan Beulich wrote:
>> On 17.06.2025 03:15, dmkhn@proton.me wrote:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -743,32 +743,75 @@ int arch_sanitise_domain_config(struct 
>>> xen_domctl_createdomain *config)
>>>      return 0;
>>>  }
>>>
>>> +/*
>>> + * Verify that the domain's emulation flags resolve to a supported 
>>> configuration.
>>> + *
>>> + * This ensures we only allow a known, safe subset of emulation 
>>> combinations
>>> + * (for both functionality and security). Arbitrary mixes are likely 
>>> to cause
>>> + * errors (e.g. null pointer dereferences).
>>> + *
>>> + * NB: use the internal X86_EMU_XXX symbols, not the public 
>>> XEN_X86_EMU_XXX
>>> + * symbols, to take build-time config options (e.g. CONFIG_HVM) into 
>>> account
>>> + * for short-circuited emulations.
>>> + */
>>>  static bool emulation_flags_ok(const struct domain *d, uint32_t 
>>> emflags)
>>>  {
>>> +    enum domain_capability {
>>> +        CAP_PV          = BIT(0, U),
>>> +        CAP_HVM         = BIT(1, U),
>>> +        CAP_HWDOM       = BIT(2, U),
>>> +        CAP_DOMU        = BIT(3, U),
>>> +    };
>>> +    static const struct {
>>> +        enum domain_capability caps;
>>> +        uint32_t min;
>>> +        uint32_t opt;
>>> +    } configs[] = {
>>> +#ifdef CONFIG_PV
>>> +        /* PV dom0 and domU */
>>> +        {
>>> +            .caps   = CAP_PV | CAP_HWDOM | CAP_DOMU,
>>
>> Just to double check - are we sure Misra / Eclair will like this 
>> (ab)use
>> of an enum?
> 
> Likely not, but x86_64 is build with CONFIG_PV=n

CONFIG_HVM code further down in the patch is pretty similar.

Jan

