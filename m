Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12534ADA8EF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 09:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016750.1393684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3vN-0001oO-Kx; Mon, 16 Jun 2025 07:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016750.1393684; Mon, 16 Jun 2025 07:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR3vN-0001mh-Hq; Mon, 16 Jun 2025 07:06:33 +0000
Received: by outflank-mailman (input) for mailman id 1016750;
 Mon, 16 Jun 2025 07:06:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jh7D=Y7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uR3vM-0001mb-9n
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 07:06:32 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d6cb53b-4a80-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 09:06:30 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ade5a0442dfso782513266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jun 2025 00:06:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8158d8esm600862666b.5.2025.06.16.00.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 00:06:29 -0700 (PDT)
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
X-Inumbo-ID: 6d6cb53b-4a80-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750057590; x=1750662390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zefKGPnzL8rTRF0GxQFp+q3vEpr37GbVeWltEABQmLQ=;
        b=HZuibUktJId0BffufN4EeUUs+3STwxk2iK5e3HzfKxREriwpmZPdj2z/6jDPPhBXT1
         FXh07Au/InCC9DWSied82G7DLYBHXRqP87u432yF8gEuajXiNIDuEvM2deT3ItjkbmKO
         KiAtv2MpjGvzyt6tftDHaeVik4zNjifYfTgG1N5ei68fiqFBemcqdvl2KhusDDkbU5SB
         M2LovpwNIHJM/OQWhKSYq+pbJRvSVegrFOEVY+UAUZ3DdhtFAl9CAc/jNEnzU9isRSS3
         GK4aJXGAL5IuOxk18pEvNL2UBkegRlnQeVDr03WfctM9yHGVVKoN30STHXctd+oFr00T
         h5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750057590; x=1750662390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zefKGPnzL8rTRF0GxQFp+q3vEpr37GbVeWltEABQmLQ=;
        b=tBBxtpaSbvPuvGZB6Qk4jcGptwku56/ZMonou9Z5dIxF0DqMz6CsXFbTiTYaPVzXEB
         x4RHkDQXjW0AC/r3FzJ5jKL0jFHcJbcIp/bhQpyXGrCMyP5vsqkGDg2gUBTwH+co7ncB
         LoU9AqeStsOQs2Fd79kGH5+x6LnEScDy2s00Y+7EVY4hP3AtvNvfXHtFJ9+FJXhtyViI
         8kc9T+mJEM9Sud1p4JLp09a41q67nO7oq+5QyNLIdxQxTaBLyaw+h834uNKIRuL1sFCa
         22w/auHCXBB57sKmutkb77L/PtyryRtb+6zoMJYN6sEIkqnNRGuK1h5dichmwucwU9LA
         1BIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEr8OsS4CnVgEQG+17mftngZ+mUgWobwFPwnnPnzIyrJHRD0e6tc2pWZj6V9JAdEgsefQxvTTO2CU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyD3i43d52SnLzhQ1FEchM+Q0yoHn1xrmidoJgBV9cIN9ouZjGS
	6KXJTev5At3gLDUdfj9KXAKk4zTGhtDn+g1Hyb008uW0xloa6quiNAhUOCgK36FeZw==
X-Gm-Gg: ASbGnctjMigpS606mUxdWan+7qSCVshOV5eApdySYvtv8mNF/Lr9P2zW1flCEyjFID3
	tttYTi1Hocs3TsBf0qOdSHRpuzsJRHierEGpsPCFajYDhd92VBwBGek+/PEftQF9GE2k4e2KLW7
	uxVYc5FIVyfj+BmdaafMmhTQj+qyk12SR/cgdzeCGvK+IbJbHnd/cMnmB/LPgC8zWPP8PFLO5TS
	pmnYiuJYy/c3srbirtu2FCVwFkBpK6D0QqHnzjmz3emlylpKiFgOn2ZULubU17eZRctnooLywWP
	QomzK55dpuo6OesSRBEl47sDhaJMzFddDz7sgLM05JUIt5QByKIOTeZDhUjJTdiPuRtbWE5qBS0
	q+iOCs5Lm6baD0ws72zT+g7tS0UdK67UI1nyvRRa+3cl1tjc=
X-Google-Smtp-Source: AGHT+IGULn5tYmf25n4NDNY/oBM6WTjdmB21Omzn7g7B9GwreVjKO5N8hckVlY07JBMfWzwVHgkHWA==
X-Received: by 2002:a17:906:f583:b0:ad8:9c97:c2f7 with SMTP id a640c23a62f3a-adfad363e5amr807330166b.2.1750057589559;
        Mon, 16 Jun 2025 00:06:29 -0700 (PDT)
Message-ID: <a703e065-29cd-4db4-a9c9-3f0f209acbb0@suse.com>
Date: Mon, 16 Jun 2025 09:06:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen/domain: introduce generic weak function for
 domain struct allocation
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1749829230.git.oleksii.kurochko@gmail.com>
 <c08595dd7940b44a1392e16d4a2035b95b5c580b.1749829230.git.oleksii.kurochko@gmail.com>
 <7ef86c5b-80ad-4bcf-8028-ef98616a8924@citrix.com>
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
In-Reply-To: <7ef86c5b-80ad-4bcf-8028-ef98616a8924@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.06.2025 20:53, Andrew Cooper wrote:
> On 13/06/2025 4:56 pm, Oleksii Kurochko wrote:
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index e566a18747..c134868e95 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -785,6 +785,20 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>>      return arch_sanitise_domain_config(config);
>>  }
>>  
>> +struct domain *__weak alloc_domain_struct(void)
>> +{
>> +    struct domain *d = alloc_xenheap_pages(0, 0);
> 
> I know you're just moving what ARM has, but this is spelt
> alloc_xenheap_page();
> 
>> +
>> +    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
>> +
>> +    if ( !d )
>> +        return NULL;
>> +
>> +    clear_page(d);
>> +
>> +    return d;
>> +}
>> +
> 
> This looks fine, but you must do the same with free_domain_struct() at
> the same time to keep the pair symmetric.  That in turn gets you an even
> bigger negative diffstat, and x86 doesn't even need to override the
> common version.
> 
> vCPU really wants doing at the same time, although you're going to run
> into problems on ARM there with the BUILD_BUG_ON().
> 
> However, I suspect we want to be building with -ffunction-sections
> generally active, or IIRC we'll still have the weak copy present in the
> final image.

Instead of introducing a weak function in common code, why don't we move
the function there altogether, adding merely an arch hook to control the
flags to be passed into alloc_xenheap_pages()?

Jan

