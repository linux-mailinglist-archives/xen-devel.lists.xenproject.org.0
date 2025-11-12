Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2926C51CC1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 11:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159778.1488091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8Xv-00035k-ON; Wed, 12 Nov 2025 10:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159778.1488091; Wed, 12 Nov 2025 10:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJ8Xv-00033U-LJ; Wed, 12 Nov 2025 10:57:51 +0000
Received: by outflank-mailman (input) for mailman id 1159778;
 Wed, 12 Nov 2025 10:57:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJ8Xt-00033O-QS
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 10:57:49 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d5b3573-bfb6-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 11:57:48 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b72cbc24637so155041666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 02:57:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf97d430sm1645829166b.37.2025.11.12.02.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 02:57:48 -0800 (PST)
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
X-Inumbo-ID: 6d5b3573-bfb6-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762945068; x=1763549868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=whUktnCUBMheayfjio0tZjgzlpQ8tugGy0/dfWLMM1w=;
        b=ck2SApYjY0azjtx4pb0j6ComLzEiGWgMYv4yI4z7WFTqUTailQluEYfmdpYHYXBR1L
         VMCvpAP0RQHzHYSZ//1UVZ4SuzWdmcg55vWN0U4spSf5A4s+O29Li9XbCDy48+JxDBNa
         j+Y/YRUeyIdmWYIkXtXtoYCJ3fISH5CvUnvIqbpA7i6DdW/qV5xCaByf/chVCIxQWgBX
         U7UBhU8LAU+kHE06yBzljjJLuWz9tdFhusZHLUaNaAP+iwdJfiad2G3YN5qfpWWWmlJ5
         ITifJeQW9WJPGl9MV1+xo5Bcx/O70UF55ZNhNAaC5jyFxXljuxW+jcsJJvgVCdenxCL7
         AOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762945068; x=1763549868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whUktnCUBMheayfjio0tZjgzlpQ8tugGy0/dfWLMM1w=;
        b=Hf2AZ5qCAypb5/J6yvd+dRMSf7PQX4v/8uooo1e3eTDKB0sKZytjRtSq1dcg6/oAhx
         v9kNeI91bs6TQ4C6TfU4mQSxUJzhiqJtyDBBuII/BKUU6f/V1pq4Q4QvY0YLZmbiNsJp
         ZFhX4y22+goFOlpa8xhoyj+Y3BVXI8ky3ywCABXnV5MRo8fJTRG2mqyxwLG+TPCaylcb
         wMSa9WDb195gc/yIoSuctV24wCe4QN9yLq2VEPfJ4IFePIh5BqxoNIzRWDSfT6BKbQxg
         jsrDWIJAtwuGb1fOtIpMrbPrC4j41znuRYKqXVQuvpcKc5kTED5Z1gwpxOJi7DEStRTb
         DYIA==
X-Forwarded-Encrypted: i=1; AJvYcCWLY9VQFjJYGYOjfucVIGNqjINjgSSYNd+El2pgreIFfaI9YbnNBPjpdzBBrlED9fZFz1yJRYiDH2k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiomIWB/MAx+hnF7Y3sB6FKWcbtg2o/+8C/4cK4+OdXudUxOJZ
	xfjJUjd8cTOjb5jUtIXXp5FbDUCVH0KGos3ci4izOhP7CxHd4mHLmpDMSd3jGQKhpQ==
X-Gm-Gg: ASbGncuAO7v19RM9tjGAxXGLqZO4XcotDbzuBxIBl3yFqZgsralV1/jJLCRmyu1KG4t
	SSH4KFcdU4B7hWeKuCo+sySOk6MntXUiSO7pp1FZHPYxOSEs6KRFmGS0PpRsYOicnRqKwlbVpoj
	wHIXmQMDGwURkqDu8KneEmMOYZr2QWtitlqXnqrAQEshoanywkF1aiG7u37WJSyo1Q91b1MPRCb
	0wNSvBJVIhyMfaL0XzXwUrooCIr8kCYMTNuxA4dywg+h4du1dEDs0Cwp9JDQRYiOTjKOPivXko5
	rHkQsSd5dvROlZdY9KqwlbN2hyFNikcksUrn4oWzIFlc5ut4jSgXZQyZX2wS6s6EzQwzsYeNPqE
	lYWCGFQNi9XsjLt5/QIA4bsurOkD4qsrrkWNTyQYJKFDaJGpbwWSyfUIxjGCJKmsOPCJY+Ok/Mu
	q7vLAF+StniSwyXbaxc/p1eTANz+E0rC5gObwTzhGEijnSUESMlf8/fciwg3VJUVYO
X-Google-Smtp-Source: AGHT+IHkc9HHRz4/NhrJa2msyLvJq8Sr+CkHjc1o+UglbAPukHCZ21K+Gi5dm3hVjqPRP3f/fsSBZQ==
X-Received: by 2002:a17:907:7f8c:b0:b30:c9d5:3adc with SMTP id a640c23a62f3a-b7331aaad1cmr233464166b.49.1762945068358;
        Wed, 12 Nov 2025 02:57:48 -0800 (PST)
Message-ID: <51a7d586-c1a0-4d35-b0de-6258aecaa668@suse.com>
Date: Wed, 12 Nov 2025 11:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 1/3] x86/hvm: move hvm_shadow_handle_cd() to vmx
 code
To: Teddy Astie <teddy.astie@vates.tech>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20251111200958.3576341-1-grygorii_strashko@epam.com>
 <20251111200958.3576341-2-grygorii_strashko@epam.com>
 <93dd7056-234d-4d3d-ae1f-d73f33a35f1a@vates.tech>
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
In-Reply-To: <93dd7056-234d-4d3d-ae1f-d73f33a35f1a@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.11.2025 11:52, Teddy Astie wrote:
> Le 11/11/2025 à 21:11, Grygorii Strashko a écrit :
>> @@ -1451,6 +1452,66 @@ static int cf_check vmx_get_guest_pat(struct vcpu *v, u64 *gpat)
>>       return 1;
>>   }
>>   
>> +/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
>> +static bool domain_exit_uc_mode(struct vcpu *v)
>> +{
>> +    struct domain *d = v->domain;
>> +    struct vcpu *vs;
>> +
>> +    for_each_vcpu(d, vs)
>> +    {
>> +        if ( (vs == v) || !vs->is_initialised )
>> +            continue;
>> +        if ( (vs->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) ||
>> +             mtrr_pat_not_equal(vs, v) )
>> +            return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>> +static void hvm_set_uc_mode(struct domain *d, bool is_in_uc_mode)
>> +{
>> +    d->arch.hvm.is_in_uc_mode = is_in_uc_mode;
>> +    shadow_blow_tables_per_domain(d);
>> +}
>> +
>> +static void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)
>> +{
>> +    struct domain *d = v->domain;
>> +
>> +    if ( value & X86_CR0_CD )
>> +    {
>> +        /* Entering no fill cache mode. */
>> +        spin_lock(&d->arch.hvm.uc_lock);
>> +        v->arch.hvm.cache_mode = NO_FILL_CACHE_MODE;
>> +
>> +        if ( !d->arch.hvm.is_in_uc_mode )
>> +        {
>> +            domain_pause_nosync(d);
>> +
>> +            /* Flush physical caches. */
>> +            flush_all(FLUSH_CACHE_EVICT);
>> +            hvm_set_uc_mode(d, true);
>> +
>> +            domain_unpause(d);
>> +        }
>> +        spin_unlock(&d->arch.hvm.uc_lock);
>> +    }
>> +    else if ( !(value & X86_CR0_CD) &&
>> +              (v->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) )
>> +    {
>> +        /* Exit from no fill cache mode. */
>> +        spin_lock(&d->arch.hvm.uc_lock);
>> +        v->arch.hvm.cache_mode = NORMAL_CACHE_MODE;
>> +
>> +        if ( domain_exit_uc_mode(v) )
>> +            hvm_set_uc_mode(d, false);
>> +
>> +        spin_unlock(&d->arch.hvm.uc_lock);
>> +    }
>> +}
>> +
> 
> Given that these functions are now static in vmx.c, I would give them 
> the vmx_* prefix instead of hvm_* (which could be confusing as it sounds 
> like something that is in general code).

There's no need for either prefix really, I would say.

Jan

