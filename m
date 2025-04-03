Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942BCA7A4E4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 16:19:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936880.1338013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0LOa-0003J3-20; Thu, 03 Apr 2025 14:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936880.1338013; Thu, 03 Apr 2025 14:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0LOZ-0003HR-VK; Thu, 03 Apr 2025 14:18:15 +0000
Received: by outflank-mailman (input) for mailman id 936880;
 Thu, 03 Apr 2025 14:18:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0LOY-0003HJ-Tm
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 14:18:14 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7802c1d4-1096-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 16:18:09 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso5563795e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 07:18:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30227e3bsm1907382f8f.100.2025.04.03.07.18.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 07:18:10 -0700 (PDT)
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
X-Inumbo-ID: 7802c1d4-1096-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743689891; x=1744294691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sHprJ3UiA4uO0ngeD7Nv+tW3Y0GhlAo0JJG5lNVt6EY=;
        b=EIOC8JgwOL5/KdsUoddAZp9COtqLqXA8rW76pLTSCGLGedrdvVREZdoNlTjAKk4pWB
         w1Cg9l+ymCOsBCfLNO2+OvxOixc7wMiqYB7q9kpnmYVsPBcxOQbKTcLiDSt209YcdnKf
         9sGCty8bLumW7T1Qs1TQynUEgJXty2I4KMnlJnglr1IUGIZjd8YeM2j41xpYOpGQyXCU
         AS5R4UaNl8U0LzfI/0xzQremkT5mueuFhK8IWULLP0Zegn3sF49hf2WmAdC7qL930NjL
         ol2kFn4BJPnNruttjubzSZxUbb4HAj1Ro8SHo3GWt2Hfr5j1Dl5khw3IeZSTUx3SUFCI
         GNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743689891; x=1744294691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHprJ3UiA4uO0ngeD7Nv+tW3Y0GhlAo0JJG5lNVt6EY=;
        b=iByCqTth+e2C3rsF54gSThd0V29OVR8dRWgf9UNwTy8QErfyqmuBZmyZ1VrDV95L3j
         OIQ1oB9/fq+MNlhHB9u+jQnwe33SkP6LhWypOQvtXsN1bF8ojDqR5d71O9wHld/j3wyC
         TIVqvREA0I1tHuYUEai5rU0OsrL/E0kRpMO2LMFdYhQzluaHrFcWiluH67NA9F7wsQEB
         zUK1Pi4MqBFb/+S1kzgXKApjCHZfp6WiL8G1LZlo/sAONNTkBrfDoNS+jX8pIkTXjya3
         V8FKroF7OwvsLIlL6O2SUPIlXoxe4vjF16cToNSL5XXHGoBLo+tU5QkFKjy/Bbp5fcgx
         u0jQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1QZo2x1zcn40HqJnq71JoLrXovrNL3n2NeYJ/68Db6+RtGrkgxFwC/sEE6ZfH0VsANdfjmWBEF6M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGf5QDPVc0MKBTViFjAbCfMTcD8u1Kw3lwDTcDgJfbvDiGPGxW
	6IKtwTLxDKjlbZ5rmLKEugCnYFK0H3IQ1Ox+fz9qBcPBLBqpXGz29xbOE3HQ0A==
X-Gm-Gg: ASbGncug5QUia/CvfJktPYpSqb4X2KhpJKrKjcaFvfRsvHI2hhSACkh9fXA2vnkgFiG
	b6DVfLa6QG4bApfaS07OE6aPLJzSLPOXv4l6RXTOvLg9XMpsAlKOqzfWq44ZgflT7Bimltq8lW+
	Pd4voB1SGZ2VCJMfDqMIIucU5fvWABdAkE6mS6h48/Xb5pu8KZa5stwmLDG+vqwM0rwdZfb2Gdg
	6ykorGCqnUN+5bokDYdEQgXZqsqDuLqltN97hp4P0qxxTteRqYfHMyMDeGSSnE5sKWowzvIOkyR
	YRO2El4yiktt/f77tmkol2xigW247kP68uIzTMDUMHBKN0HaIz3y1qR4uvFwuQJ4dpzWWu4XLK4
	F41ENA7gCqCO7n30u7lK7hhNk0QSNJg==
X-Google-Smtp-Source: AGHT+IFpTCl4p76HjWpL+KyhOlZDRwGWxO3BNgy+ST9qR8hHhPETOG7rqScbGwplBFImKLKHi7mDjw==
X-Received: by 2002:a5d:64cd:0:b0:391:412b:e23f with SMTP id ffacd0b85a97d-39c29751a59mr5803812f8f.15.1743689891208;
        Thu, 03 Apr 2025 07:18:11 -0700 (PDT)
Message-ID: <3e330a8b-1b90-4d3d-beca-a3786f3532ec@suse.com>
Date: Thu, 3 Apr 2025 16:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen: debug: gcov: add condition coverage support
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
 <20250401011744.2267367-4-volodymyr_babchuk@epam.com>
 <7281b7d8-ba7b-4658-82f1-a63d66c1baff@suse.com> <Z-6KA1Kto8PIJJkI@l14>
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
In-Reply-To: <Z-6KA1Kto8PIJJkI@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 15:15, Anthony PERARD wrote:
> On Thu, Apr 03, 2025 at 09:30:21AM +0200, Jan Beulich wrote:
>> On 01.04.2025 03:17, Volodymyr Babchuk wrote:
>>> --- a/xen/Rules.mk
>>> +++ b/xen/Rules.mk
>>> @@ -138,6 +138,9 @@ ifeq ($(CONFIG_CC_IS_CLANG),y)
>>>      COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
>>>  else
>>>      COV_FLAGS := -fprofile-arcs -ftest-coverage
>>> +ifeq ($(CONFIG_CONDITION_COVERAGE),y)
>>> +    COV_FLAGS += -fcondition-coverage
>>> +endif
>>>  endif
>>
>> Personally I find ifeq() uses like this unhelpful, and would prefer
>>
>> COV_FLAGS-$(CONFIG_CONDITION_COVERAGE) += -fcondition-coverage
>> together with an eventual
>>
>> COV_FLAGS += $(COV_FLAGS-y)
>>
>> (if we don't already have one).
> 
> Not we don't. About renaming $(COV_FLAGS) to $(cov-flags-y) instead? It
> is simpler as we stay with a single variable for coverage flags.

I'd be all for doing that.

Jan

