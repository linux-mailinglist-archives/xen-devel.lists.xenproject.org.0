Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8CA45681
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 08:20:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896174.1304848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnBgn-0001iW-VU; Wed, 26 Feb 2025 07:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896174.1304848; Wed, 26 Feb 2025 07:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnBgn-0001fu-SL; Wed, 26 Feb 2025 07:18:41 +0000
Received: by outflank-mailman (input) for mailman id 896174;
 Wed, 26 Feb 2025 07:18:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnBgm-0001fo-FA
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 07:18:40 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e58613a4-f411-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 08:18:37 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4399ca9d338so39508665e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 23:18:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab374da3esm30147615e9.1.2025.02.25.23.18.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 23:18:35 -0800 (PST)
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
X-Inumbo-ID: e58613a4-f411-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740554317; x=1741159117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GOdkMYB2E+stevsJVRRIaTF4D3bDE7yM7Oys8lvgU8s=;
        b=gBZfEeQyfdgEDYiciNLsaGReY7eb9YUlb4UrmFyyZ7QGgycFXQtec5UN8WhjDuZ3Vt
         PUiyjmMHvC8lNsiL4Cfnt6jm/J9981AVwAmqDBDVScd/QuZIujVff/WjQxSwcDmbIwG8
         0XIZnt1TJ+piTfM+VyLas1qRxAPnU9pifDUjwgKW+uhaSQrhbGC1xQPMLdwMwxRuHrYd
         ekU8ihJ4rsqALWZO4pDpw8DERBIK/P60+U7FPXDklyLnFd0AGMdJPrgr6E1Ie56vyBpE
         k83VqmAe+0IV+ezzsJ04bApepIt0E73NAKeqVEJU6SlVCrLW+dXvn7z9rkSyD4g3idOE
         YMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740554317; x=1741159117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOdkMYB2E+stevsJVRRIaTF4D3bDE7yM7Oys8lvgU8s=;
        b=itOiEXRaQ2O7jLUYj7H2X0a8X+nyaF8dmPA3I03lqF0zHZHPt3JGE3tDuOG94HI+NR
         nweTZVFglVzph+a7uF2/zNC25w/p6P6HNx3IyrOXVevEev3PtGtHw7YfA0O2w0HlsiGW
         jKZbeuE/m55UVaBE4pTqMZ/XROqbr+32g46hZiInnYnZRWcUyaXWLw3nN5pH0jXZDrJg
         7R3fwPatHiegpPWiJpucyBOGhqjJVxYlnaVjx/7GqL1bz/YaFlcmDuC+9rSZJEJmg84x
         VBNLlFzUfblMEw44s8Us6ssxSLdqBw9TQkoug27NMdcL+l7DN/tpwMjH6h8vLfYZKwcm
         8hPg==
X-Forwarded-Encrypted: i=1; AJvYcCXIeSn60MRhM+SN9WAv6BuInrWzLyARxa9KD9XsU9Mxt/Vw1ZMD1Rh+LjJsf50TaDxJV/iRjwf+xaI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbI2hVRkBn3VOZ284+lC/k9mzugVe2x+zcWITbThfNXUmbMVc+
	RhlYupS9smYGVGKJ4UwBMdK2cTz9c9pDs8AJPHBOVrofGAgn64xeiFZSbNLQng==
X-Gm-Gg: ASbGncsx7FEKxMlXSDMHxt7JtTeTlv5ZsWwX2L7VpSYpYFuoAd1D8kdQwc6eZ0BCTYm
	bdA3pGmny3vc1Pi4pOHJt1DvC4g7SQoynR0/13TZDvH52g8Z0rpYvWrJt+W10vDWa1Ey9K0xKmV
	qlr9Rqvnlxsa/KBdGvLcnA9v+2wAqH0yyBZ8kMMzrGeuPwgZkXhr33bVtp6hwPHc05gc4MnkKhk
	vOFiVO9cq7r61cO+I22p4OIu31cAL/LUIe8i6AUnloLtyEZt125Dj+hYeH/IG683JuSuJ2CWEKR
	DV0w+djONOMN8MqxGkGczSHX6QOP5ypkf/oTymwzOPKxFwr5ZiQUPtrw3kwg9V8gBE/SUdPc2kk
	zNewlEjIFdY8=
X-Google-Smtp-Source: AGHT+IHSytm5GAPCwuQBbb1qEjbqlnKDM7xxRVU60xxrbegzZXL4L8LiIbxC0kMU2LRKfc6KgrIbJw==
X-Received: by 2002:a05:600c:1c0d:b0:439:a5e6:73ff with SMTP id 5b1f17b1804b1-43ab0f41d79mr55672695e9.17.1740554315499;
        Tue, 25 Feb 2025 23:18:35 -0800 (PST)
Message-ID: <241ab615-40bc-43ba-b41c-50408f1a8eb8@suse.com>
Date: Wed, 26 Feb 2025 08:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/ucode: Drop the match_reg[] field from AMD's
 microcode_patch
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
 <20241024132205.987042-6-andrew.cooper3@citrix.com>
 <122ae85e-d418-42d3-9554-2ecd90996ae3@suse.com>
 <22f17108-7c71-47ee-94cc-068fc01194fd@citrix.com>
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
In-Reply-To: <22f17108-7c71-47ee-94cc-068fc01194fd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.02.2025 23:01, Andrew Cooper wrote:
> On 28/10/2024 1:18 pm, Jan Beulich wrote:
>> On 24.10.2024 15:22, Andrew Cooper wrote:
>>> This was true in the K10 days, but even back then the match registers were
>>> really payload data rather than header data.
>>>
>>> But, it's really model specific data, and these days typically part of the
>>> signature, so is random data for all intents and purposes.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> The single difference from this is:
>>>
>>>   @@ -207587,7 +207587,7 @@
>>>    ffff82d0402ad261:	4c 89 ce             	mov    %r9,%rsi
>>>    ffff82d0402ad264:	4c 39 c8             	cmp    %r9,%rax
>>>    ffff82d0402ad267:	0f 82 c2 11 f6 ff    	jb     ffff82d04020e42f <amd_ucode_parse.cold+0x55>
>>>   -ffff82d0402ad26d:	41 83 f9 3f          	cmp    $0x3f,%r9d
>>>   +ffff82d0402ad26d:	41 83 f9 1f          	cmp    $0x1f,%r9d
>>>    ffff82d0402ad271:	0f 86 b8 11 f6 ff    	jbe    ffff82d04020e42f <amd_ucode_parse.cold+0x55>
>>>    ffff82d0402ad277:	85 ed                	test   %ebp,%ebp
>>>    ffff82d0402ad279:	75 55                	jne    ffff82d0402ad2d0 <amd_ucode_parse+0x170>
>>>
>>> which is "mc->len < sizeof(struct microcode_patch)" expression in
>>> amd_ucode_parse().
>> Yet is it correct to effectively relax that check, i.e. to accept something
>> we previously would have rejected?
> 
> Yes.  This is the bounds check about whether it's safe to look at fields
> in the header.  It's not part of the other validity checks.

Hmm, okay:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

