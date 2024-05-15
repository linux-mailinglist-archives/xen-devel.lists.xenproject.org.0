Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5E78C6979
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:13:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722479.1126471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GK2-0000Of-JA; Wed, 15 May 2024 15:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722479.1126471; Wed, 15 May 2024 15:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GK2-0000MM-FW; Wed, 15 May 2024 15:13:38 +0000
Received: by outflank-mailman (input) for mailman id 722479;
 Wed, 15 May 2024 15:13:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7GK1-0000MG-1G
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:13:37 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b360b3bf-12cd-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 17:13:35 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2e0a34b2899so105228021fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 08:13:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01631sm871191666b.153.2024.05.15.08.13.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 08:13:35 -0700 (PDT)
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
X-Inumbo-ID: b360b3bf-12cd-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715786015; x=1716390815; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVV2/hLcQw3aZJvTlD+Rpate6U19tAQsl4o8Ekmm/AM=;
        b=E/3JL3r8khZi8Y9wmIDPylOYY7rd8ofcbvXhKnyapFXLvVhYrmEkuxVsDdebpiPJWs
         YvHKaRgUVMiHctjgeynmB8BMn2f1UhYHY0+/QQzue8nUl56078NOEOtBclFbyCHzRCb/
         KX4mQ1qczbQUqifnc58dnR5xgWgPaLCFvoglu3GwC2xh9r7eah/LZfWMRY0ujkuRQ1wo
         dXswWnMbGLVd4f2Lb3XyEHgI7eTheCMSXsxnA8nD4i0QSjF8paWMIHdGzcSQnTdfLCrJ
         KrENmKKpT9C7wdLxBdrQ+GRIEFoRDzQPhVNRuKtMq9KUoxt+W2WV+KnTTrKa5KlYY7F2
         L3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715786015; x=1716390815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVV2/hLcQw3aZJvTlD+Rpate6U19tAQsl4o8Ekmm/AM=;
        b=Ho3tdnGZ6RygaLcHFZsLH/WYJlOBwvtAy12QEjBGQLplZmTzqqN4UPaOGNXfgCbjg6
         e0xvrQMH46lwYryiWtWtau0MMVQIzKp/JYGszqrHli0A6HJ9LoXvTJfdcIJcgDTqjyPJ
         eVco9L1MOztLQ6oXW7NrWp6buSQyggudlSfxVdVtKvHwu+m8SXJTqWSZySxt3OERtwPz
         ZH0XK5IX6gZ2PAeKPi7lKHm0VCU83FJRh4jYC7opIriKutbggxLDsFZL9koRSMb3+tkW
         WqUvElyY9x5q0SSRkXft8yEy7is/abr8dS0RFmTWNiqq62tB1+rxtCyAoiG6vUo6SaI/
         +XkA==
X-Forwarded-Encrypted: i=1; AJvYcCXQiE/jr0PJ5P3QTDdTgyKoTYN3FBy9maxYr+IrCMNn/3NvaQ5lU9smNOktFQKsAvkYpdlNxbD61S9ZKiALAcqG88T0krDBUr/aZ4B0sTw=
X-Gm-Message-State: AOJu0YztI6cBaRw9VUS4mOG/qYy5TE6yTu2pkmCOP5Xg/eTxQl4TSbkX
	IWnMCF5cCMZP4qhaT7r/DGswoktJ/b14tzRKsevPqghxNEKVjrvZ+r3z6F/deA==
X-Google-Smtp-Source: AGHT+IG5Q+a+LL1E4Ytt9dDWDhz0WZk2ZmmTqV1Yfi8mTlThy/GSd/zlhU1M3sLvr+ZwiZfylYa/kQ==
X-Received: by 2002:ac2:4284:0:b0:51f:567b:c399 with SMTP id 2adb3069b0e04-52210277b79mr13825215e87.62.1715786015352;
        Wed, 15 May 2024 08:13:35 -0700 (PDT)
Message-ID: <f64f50f5-fc0d-465e-9904-db6352dad35d@suse.com>
Date: Wed, 15 May 2024 17:13:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 10/19] xen/page_alloc: Add a path for xenheap
 when there is no direct map
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-11-eliasely@amazon.com>
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
In-Reply-To: <20240513134046.82605-11-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 15:40, Elias El Yandouzi wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> When there is not an always-mapped direct map, xenheap allocations need
> to be mapped and unmapped on-demand.
> 
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
> 
>     I have left the call to map_pages_to_xen() and destroy_xen_mappings()
>     in the split heap for now. I am not entirely convinced this is necessary
>     because in that setup only the xenheap would be always mapped and
>     this doesn't contain any guest memory (aside the grant-table).
>     So map/unmapping for every allocation seems unnecessary.

Kind of depends on whether you expect guest data to potentially be copied
into memory that cam from the Xen heap, even if just transiently.

> @@ -2317,6 +2350,12 @@ void free_xenheap_pages(void *v, unsigned int order)
>      for ( i = 0; i < (1u << order); i++ )
>          pg[i].count_info &= ~PGC_xen_heap;
>  
> +    if ( !has_directmap() &&
> +         destroy_xen_mappings(va, va + (1UL << (order + PAGE_SHIFT))) )

PAGE_SIZE << order ?

Also, on x86 at least, to limit the impact of this, I think there wants to
be a prereq change to modify_xen_mappings() limiting the final flush_area()
there to just the one page altered, when it is just a single page that is
being fiddled with.

Jan

