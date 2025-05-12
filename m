Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 649D3AB34E8
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:30:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981188.1367580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQQb-0005M7-5h; Mon, 12 May 2025 10:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981188.1367580; Mon, 12 May 2025 10:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQQb-0005KA-28; Mon, 12 May 2025 10:30:33 +0000
Received: by outflank-mailman (input) for mailman id 981188;
 Mon, 12 May 2025 10:30:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEQQZ-0005Jz-Pj
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:30:31 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 204d40e2-2f1c-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 12:30:29 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5fbee322ddaso7989555a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:30:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad22ba81523sm478522766b.65.2025.05.12.03.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 03:30:28 -0700 (PDT)
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
X-Inumbo-ID: 204d40e2-2f1c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747045829; x=1747650629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qxBFwOrE2bnSFKACUIjLu8C6mPVqsvcsDc3vKP6l4JQ=;
        b=TKBcd/BofoRQqPKYQax8ObS3Zs7BeDZ1Rk6ggFt2Xnf+YizMEK1fnKnbGR3x8BV5xW
         gq6Eyq8H7D1eA0xhTg11hKtBE7p5evtypLxnVSj09XZNuSQi4doEcBzOel78+HmZ0tY6
         3LWVVWFPr56fZPVzRyEG1U78j8o79B8CkaJPsAJ3m/z7/VBpSAjnmlVdR4m25cDhB4IP
         UmEZ4081a+zNhiI2d4/7K6OYiqAZDZbfM6NcPBv30eftOKgA1oXXmNu9ePAockS1+abq
         CmBzPooPBAtSv8fbM6GKnHaSaaQLiNuakV/rNG9X4SU4vaQUufMqGINuGytBuL70Fvvz
         gILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747045829; x=1747650629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxBFwOrE2bnSFKACUIjLu8C6mPVqsvcsDc3vKP6l4JQ=;
        b=cr/7gs5lirXx+w9pVTg65UigObLEoxj565BYmSFtO1RX6Vr2hvbKVWptLbxxZqLHRn
         JXzm390lY5PNo6DXiG0EMrLhwRY8cuhV2mIahh5Tbdl9h230Y+4sl1tikWkioMApmb66
         WJL8s2hEPzMmWlupEYRjSOucxkGpYJFgpVf2MO28E3X/ZQ8/uXHZqzzdU8RHpGwGYjBC
         FTUfwcof9LGAxtGcq75eTSgt9e9LN/bSRUZm/R80EYs+OwgBBSXXfBK1E8+MaT6GbkoR
         YkcwHBRQtL1zUVBeU3seSHhrKH34ndDZZpTprjodPU/I7Aihs2QpXeWFtCg9aLjQHEtg
         ApdA==
X-Forwarded-Encrypted: i=1; AJvYcCX/wQ7kBwffCzzq2HDd3cALFXZ+lUH2AOHkxV4piGDIfZa5u9wK8vxB3b304QJP8pWMVt+JFK5HVZc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWFvk0HM0gyLC6xdObu1t8RRXxp1kMNWUSJCGnQiQRqp/Su4uJ
	p3y0HkG1HApzUK3FEmmHLeoLsS2IVGMuMOXz9Gi5AbJ4JxlyeYZTdPHaH2XEgw==
X-Gm-Gg: ASbGncumUiuVNgrkfAOQzowbsGLAbA5N8apg1o5Z+Xzf7IdPoHb/GZ/6tB4XGb1jud1
	o3oF76165NPkBjT4hStuFHQMUCrqBrkv8FuX3zOcZNLI63qNYVv9N8y1u3z+Vk2+U7Z5nQV5A03
	us2yDE9jjBs9h8jqLkWCQRM16CoTrZrWdrXueuRjJwU5vJ4pVGpEFL0KeyZa8otsA9c2N1LiEbo
	E45IHdsOKqebAIkcsUTgDrXShve8m9NxNjH9LnHLp8POmQYxCGsRIZhzmEfAigSZZHk/pjmSANR
	HpOE0nW9+qLChXHraKLtCrRpaOKt27QKRDp3rkyzDoc0XtI5Rxs8HTgWdPKoM5iMtLaGEq8aKcj
	FpwqjwyGqk9M/Ak5/Td7wPIHGcwNknXM6Jh+h
X-Google-Smtp-Source: AGHT+IEFhd3UjbTYJ/Bd2wL/ThC6R1aIHc3vdHsEwy75zqIimtXwY1sbYG8rBsvuVjcKe7Qkw0AXzw==
X-Received: by 2002:a17:907:94cb:b0:ad2:47e7:3f39 with SMTP id a640c23a62f3a-ad247e741c2mr541274166b.54.1747045829081;
        Mon, 12 May 2025 03:30:29 -0700 (PDT)
Message-ID: <0bb898cb-b68b-4b38-b142-a057b3f2b856@suse.com>
Date: Mon, 12 May 2025 12:30:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] xen/lib: Export additional sha256 functions
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250506135655.187014-1-frediano.ziglio@cloud.com>
 <20250506135655.187014-2-frediano.ziglio@cloud.com>
 <de48c8bc-a7b2-4b9f-b45e-cbe3f7eb03c4@citrix.com>
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
In-Reply-To: <de48c8bc-a7b2-4b9f-b45e-cbe3f7eb03c4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2025 16:05, Andrew Cooper wrote:
> On 06/05/2025 2:56 pm, Frediano Ziglio wrote:
>> diff --git a/xen/include/xen/sha2.h b/xen/include/xen/sha2.h
>> index 47d97fbf01..ea8bad67e4 100644
>> --- a/xen/include/xen/sha2.h
>> +++ b/xen/include/xen/sha2.h
>> @@ -9,6 +9,16 @@
>>  
>>  #define SHA2_256_DIGEST_SIZE 32
>>  
>> +struct sha2_256_state {
>> +    uint32_t state[SHA2_256_DIGEST_SIZE / sizeof(uint32_t)];
>> +    uint8_t buf[64];
>> +    size_t count; /* Byte count. */
>> +};
>> +
>> +void sha2_256_init(struct sha2_256_state *s);
>> +void sha2_256_update(struct sha2_256_state *s, const void *msg,
>> +                     size_t len);
>> +void sha2_256_final(struct sha2_256_state *s, void *_dst);
>>  void sha2_256_digest(uint8_t digest[SHA2_256_DIGEST_SIZE],
>>                       const void *msg, size_t len);
> 
> sha2_256_digest() is unlike the others as it holds sha2_256_state
> internally.  I'd suggest having all of the additions below this point,
> which group them more nicely.
> 
> Can fix on commit.  Otherwise LGTM.

I notice this was committed, but isn't this introducing new Misra
violations (extern functions without external callers)?

Jan

