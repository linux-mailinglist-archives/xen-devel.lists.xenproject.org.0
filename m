Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8217F84B197
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 10:49:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676715.1052947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXI4j-0007AQ-06; Tue, 06 Feb 2024 09:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676715.1052947; Tue, 06 Feb 2024 09:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXI4i-00077C-TJ; Tue, 06 Feb 2024 09:49:08 +0000
Received: by outflank-mailman (input) for mailman id 676715;
 Tue, 06 Feb 2024 09:49:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXI4h-000776-V3
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 09:49:07 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7d8c98f-c4d4-11ee-8a47-1f161083a0e0;
 Tue, 06 Feb 2024 10:49:06 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33b29b5ea96so197957f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 01:49:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 2-20020a5d47a2000000b0033b3cf1ff09sm1658565wrb.29.2024.02.06.01.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 01:49:05 -0800 (PST)
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
X-Inumbo-ID: f7d8c98f-c4d4-11ee-8a47-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707212946; x=1707817746; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xxWdwj1rfmffidHvI1N7kDJOByOykfylcPogO39CiQ=;
        b=U2FzDbQ/95IhQmwQLrTFdgURnMkqPiaGESmKa1leBWNcKAU1ZCxxKpWBpM5ot+/sVi
         jsiVvFE1jgRI64ixMeXM3i2LciX+Xz0nodFCqQUPZP2kCVI9qYy2x7ZwSUPXAdK4Rf+O
         ZlX1/urGxqAoX/DUlpXq9UKLid34HwVTz3q4G21esM5WYynAomnYWX0bx6l0+7dYqk1c
         0jaqFoSrYkT8eqg9OF6R/b7qhY4sV4YcD5Qql9+Q1n/YvDDdHCYKB4wcylxYRs+w1tHO
         0aRs2f/BpYLIc2ivvYAt+cxsCioYSXYRJ5zUVjGmdzZm2MikbhqdnCSyEGyTFs0iTqBX
         EzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707212946; x=1707817746;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xxWdwj1rfmffidHvI1N7kDJOByOykfylcPogO39CiQ=;
        b=CxOLDSwk95fQRQuCyh3GCCzyHZG76+lDh079UOlZ9QjJz0uxs4gBQVaFu7Vrb5o47K
         IUrtVDEMWwKjjIgnHs3st4I9BZwpzr/pIsUA5yKzRbOJSqAYG2wMwN2kdXwYXz+ZIzTO
         /CXGetJEjJiXG87Ghfh2pSRhvqJZAhIBX8KBo9bZPg8f0an/WdKNmukflN2+Ob3ruDiG
         KZUHLka51yxJ58zmIZ3y66g6plvL9bwkJdIqxPUMbFwu7VZcSuxZMM53yg2bzoFNL5yd
         GyOked4p7H2LdC8p02+GT/Is6avHKbeFQ9MwP6x5b4Yk8HcTPirMCxCwO8sks+SbUxSe
         KM3w==
X-Gm-Message-State: AOJu0YxReoe8I34K9aVFKNz2Ia5fGiYqjW1mWAUgd7KrvkPy/VQmHtN5
	bQrJQqQwtRBrrHMBmr8LzXsLNvDNbwZbmp4H3zMWSLgI3g1PUA2fzNCPjtUk+A==
X-Google-Smtp-Source: AGHT+IHsKJ9HFaHLZ6wMweln86ZCP5UdGmnUNhdFAthi6Hu2fgU4OVOOlgkX4A4f4/5cSEULKQrROQ==
X-Received: by 2002:a5d:4ecf:0:b0:33a:f090:f758 with SMTP id s15-20020a5d4ecf000000b0033af090f758mr987689wrv.27.1707212946083;
        Tue, 06 Feb 2024 01:49:06 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUd8MHWiweO30fiKWaBQhFE3weq2XpwCbgM3zxgTOQ9uW6/uiDtpJIzVM/mh55YIhKJ5W7QjTu4Vtf+y6w0cw1t2e93BFYdPbto9pR+hw8sz/0bnh77K2UuhSKnb+jWuabU+o0JM3DZgkcbQ8LoYB8+1ilUHRd+lx6tuV9YouBPhUOCIHV8mqIBROBOZJs=
Message-ID: <0ede3663-7611-4684-b223-42305a9d0b96@suse.com>
Date: Tue, 6 Feb 2024 10:49:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitmap: Even more signed-ness fixes
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240205151413.1919983-1-andrew.cooper3@citrix.com>
 <6997ec6f-15a0-4c88-9a96-c7f4f450b2dd@xen.org>
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
In-Reply-To: <6997ec6f-15a0-4c88-9a96-c7f4f450b2dd@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 17:02, Julien Grall wrote:
> On 05/02/2024 15:14, Andrew Cooper wrote:
>> -int bitmap_find_free_region(unsigned long *bitmap, int bits, int order)
>> +int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, unsigned int order)
>>   {
>>   	unsigned long mask;
>> -	int pages = 1 << order;
>> -	int i;
>> +	unsigned int pages = 1 << order;
>> +	unsigned int i;
> 
> ... I think your other patch is fixing a latent bug you introduced here. 
> Before hand, if bits was "negative", we would return -ENOMEM. Now if we 
> pass 2GB or higher, we would go through the loop.
> 
> So I would fold the hunk from common/bitmap.c here.
> 
>>   
>>   	if(pages > BITS_PER_LONG)
>>   		return -EINVAL;
> 
> [...]
> 
>> -int bitmap_allocate_region(unsigned long *bitmap, int pos, int order)
>> +int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos,
>> +			   unsigned int order)
>>   {
>> -	int pages = 1 << order;
>> +	unsigned int pages = 1 << order;
>>   	unsigned long mask = (1ul << (pages - 1));
>> -	int index = pos/BITS_PER_LONG;
>> -	int offset = pos - (index * BITS_PER_LONG);
>> +	unsigned int index = pos/BITS_PER_LONG; 
> NIT: While you modify the line, can you add a space before after / as 
> you did above?

Instead of any of this - how about we finally purge this dead code? All
of bitmap_*_region() were dead in 3.2 (and perhaps even before), and they
are still dead.

Jan

