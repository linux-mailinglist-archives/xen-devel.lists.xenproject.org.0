Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FDA461B9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 15:06:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896659.1305419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnI33-0004nH-02; Wed, 26 Feb 2025 14:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896659.1305419; Wed, 26 Feb 2025 14:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnI32-0004lo-Te; Wed, 26 Feb 2025 14:06:04 +0000
Received: by outflank-mailman (input) for mailman id 896659;
 Wed, 26 Feb 2025 14:06:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnI31-0004lb-Kx
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 14:06:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ced158f0-f44a-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 15:06:00 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-439a2780b44so44088675e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 06:06:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba52bbb0sm22930525e9.5.2025.02.26.06.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 06:05:59 -0800 (PST)
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
X-Inumbo-ID: ced158f0-f44a-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740578760; x=1741183560; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0AUq5osq4i0PhkeDFvp7tx38VX2Jkq9U7ayruO0zMAY=;
        b=gRhaNYwK8MmC1lWUDhnl0VT+bUnOXVTsp7lHMgqPl99qYR40Bj1YlFSlrhe6Bshkur
         u89l8sC7TZ19xyN+uXxMpu0tn1ysjBnv1+iDUSc9OmWEDVGEYXh1ZTafRhsoKo0rfhu4
         d9k7EWDeqP5wH52KIuxPZEeDkPxdiCTSaqc6qDxfmshelRmnpCisk/e0lBBetfcENvp/
         QDqAwbr3RT5bbwr1eL/WQurDTtz5fRyh7p4KRue5RkCCGuU4FQW8k41fJnfqCF72DmhH
         FPGKp8TPNZPLnaGHieIqpD2AS79YIrgKyL6dtIRn5ksDejxhbRoHe7bZ7XxtLwP2W6T0
         pW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740578760; x=1741183560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AUq5osq4i0PhkeDFvp7tx38VX2Jkq9U7ayruO0zMAY=;
        b=pQMMk2FtWF7cTKGwE2L7V4Ui2paYYhC2Qwwp4SKnb6M9EDUov3/zXVvPLV4itdOhWk
         pK0614zf4B3iPKRqnhAsE8PHqIXCJ06dl349b2N+b+WKxZ3E5cTLCj2fuiRKzDhc30HH
         3KvTY189jeqvhfeoleAa/QonK5x5wLcVkKcJRva1Pbgsigihtl9ikNWVsMkXSPYh5m79
         dOnUsc2xVIMVlku4beu/IgFQPZ0Si3BlIfIK4b5eq63fnRegOTt+JRm9aXaSNFBfjcBi
         TxXKmjpQ4rxNOrJUq8nhQv+3OO/5x9b528VzazXyQ6kFgRA3ukHGf5N1TV/k7Bs6olfq
         sfgw==
X-Forwarded-Encrypted: i=1; AJvYcCWH5woUAbbJzIC8iXaqGEdzYe7UguCoMNUmGEehH2VZldmO5LUkvYruWkRb8TJPtAUCrSBtd7u5QU0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxnqf0dAItB/hbWBS9rDfy7vjvnArFdu3is4sbMPsStJsIQg1SZ
	TqgUxbx5Z573knEUV3+3ftl3S9dl8UJVYVS6xh9n1Q0pmTIQ3E9FT1UlckB+Eg==
X-Gm-Gg: ASbGncto/hvzc2yCvoIefHA7rs9tpu0oNHRKoyvldvXXA2RFJpaExITdr+GhcKc3jJE
	SxmAiY78Qg6JRDdsHGyNo/+cVLj9kz3rAtwPV/Iu5uPXXta22XInrADjP6qI6XR5Cimjh9LI0H2
	Wceaa2smelrFIRLMVJj19a6+dqluB5hRVl2uFH8cWi3megTUv47XMYgZw2onA7qgTwYmInuXxQq
	+kV6ReH5dGc+UzctDf9x3N27H3oIgXgJRe49wSUB2CZke3nq+wnV9CLgF8gjbJbJlp/UYFdsU4e
	8RKGTlHW4Ty7eWxv/kvb6DAKuEnwTTsR2l1cLpjZodom0G6HcXocLu1OZ85zC/vpQGjPLuAyslB
	BnuSMiibFQyA=
X-Google-Smtp-Source: AGHT+IFwnbBm9xEvVq81T50a9c61dYS66NoVivEnZg0TLUDPdMRHlCOU/aPvoar0Gd/YpKa/xrdQAA==
X-Received: by 2002:a05:600c:3b13:b0:439:8b19:fa92 with SMTP id 5b1f17b1804b1-43ab8fd1d5dmr29402035e9.3.1740578760105;
        Wed, 26 Feb 2025 06:06:00 -0800 (PST)
Message-ID: <4af0077c-c933-4894-bfad-2adda7afbbf7@suse.com>
Date: Wed, 26 Feb 2025 15:05:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/page_alloc: Simplify domain_adjust_tot_pages
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250224132724.9074-1-alejandro.vallejo@cloud.com>
 <D80RCS1Y7AKH.373ULA2LO3MND@cloud.com>
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
In-Reply-To: <D80RCS1Y7AKH.373ULA2LO3MND@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.02.2025 15:49, Alejandro Vallejo wrote:
> Open question to whoever reviews this...
> 
> On Mon Feb 24, 2025 at 1:27 PM GMT, Alejandro Vallejo wrote:
>>      spin_lock(&heap_lock);
>> -    /* adjust domain outstanding pages; may not go negative */
>> -    dom_before = d->outstanding_pages;
>> -    dom_after = dom_before - pages;
>> -    BUG_ON(dom_before < 0);
>> -    dom_claimed = dom_after < 0 ? 0 : dom_after;
>> -    d->outstanding_pages = dom_claimed;
>> -    /* flag accounting bug if system outstanding_claims would go negative */
>> -    sys_before = outstanding_claims;
>> -    sys_after = sys_before - (dom_before - dom_claimed);
>> -    BUG_ON(sys_after < 0);
>> -    outstanding_claims = sys_after;
>> +    BUG_ON(outstanding_claims < d->outstanding_pages);
>> +    if ( pages > 0 && d->outstanding_pages < pages )
>> +    {
>> +        /* `pages` exceeds the domain's outstanding count. Zero it out. */
>> +        outstanding_claims -= d->outstanding_pages;
>> +        d->outstanding_pages = 0;
> 
> While this matches the previous behaviour, do we _really_ want it? It's weird,
> quirky, and it hard to extend to NUMA-aware claims (which is something in
> midway through).
> 
> Wouldn't it make sense to fail the allocation (earlier) if the claim has run
> out? Do we even expect this to ever happen this late in the allocation call
> chain?

This goes back to what a "claim" means. Even without any claim, a domain may
allocate memory. So a claim having run out doesn't imply allocation has to
fail.

NUMA-aware claims require more than an adjustment just here, I expect. Tracking
of claims (certainly the global, maybe also the per-domain value) would likely
need to become per-node, for example.

Jan

