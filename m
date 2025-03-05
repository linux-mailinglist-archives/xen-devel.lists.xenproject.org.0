Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1018A4F7F8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 08:34:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901758.1309689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpjGn-0000pk-OO; Wed, 05 Mar 2025 07:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901758.1309689; Wed, 05 Mar 2025 07:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpjGn-0000nj-Lj; Wed, 05 Mar 2025 07:34:21 +0000
Received: by outflank-mailman (input) for mailman id 901758;
 Wed, 05 Mar 2025 07:34:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpjGm-0000nb-2s
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 07:34:20 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f884c9c-f994-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 08:34:19 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-390eb7c1024so3728998f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 23:34:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47a66adsm19892109f8f.25.2025.03.04.23.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 23:34:18 -0800 (PST)
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
X-Inumbo-ID: 3f884c9c-f994-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741160058; x=1741764858; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xJUcG24ivhpxK34bt1FHSTB8mpOz5lOV7DOn10L7pNg=;
        b=GWF1rUHGEfWLaMiWFOtzFwurdaKvK7HKRaSXj8ZHZ0g+3eOb1jRAwagkZb65BykXD1
         98YFP/P74xN+ByPPXo33tErq3hkczjuVIPmF1/KyVvmlWE6b8QnWEObdINMaRNkegWP4
         0df7wZ+NCk3XeMIrhNAfOAc1G3yiJ5C8ULORR7xnWmhCQo7+PRMfbOVBH450UIcRbj3J
         qGS8K11Xt4ig5vFtDr3OXAMjn41DW0JReuWfHkGTYj1nDrUxbdfxmlbi0ffOGQL5T3Ix
         tvvi+s1p2dyN2AB7v6OE95JfjCVlUhSBs/JNWIGt4kypeu1FFZPko2E0vF90D9AVPYDR
         AyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741160058; x=1741764858;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJUcG24ivhpxK34bt1FHSTB8mpOz5lOV7DOn10L7pNg=;
        b=M5v8p70IVBUwPGKmQyUmyLcqwisBUF7NbTyczC+col+j3RHcqlQ9r8X/5AaXjpWyvL
         T7QSFzM2bptuMEtNlQx80+HhRDT05O3Garr9DxzDnLQrwd6Q5x+xDVikK2ZGkmHd4T+W
         hQNc4Lbpc5Im+A7z4AFsv0W7F6lGLzKUI6TaBOJxNa5Y7/DlrmfAFlyG6brkZsVD8RQj
         A2uHDq9jZPX42ngUrii6XfiJnY5dF5sDwaY90qeMMAdrHW/k3NMQwXonpnKZyGLwOUSK
         oqcXOJ6fUxoeEIPB1R763XMQoJ99TP4PoDHMlNZGQyIcPZ6Vo89/2DZaiO6d1rw4SgAs
         27pg==
X-Forwarded-Encrypted: i=1; AJvYcCWTnSG/eyWMHUNaEErZNHZZ/ia+I6OyOH9OEemkU+2oTpX/xWkNpWJlnMXkUi50eFHNOoAgtrkhzWU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQPvM3qlpzgipaXYU3mw8KP9df++5ichj8yU4EShpwBIpoJOTk
	doE/leFh8flON3JrAlb7QUHDHKbOFPJqhR3gpvAZgXCxL1UHjh9XFfH7p+nQlQ==
X-Gm-Gg: ASbGncvtLydTURDDpEiEELT6/I/zMot3Vdje7LaXMA9rKVFsCWZKvsTR9oUmyIbJdyc
	hwLaX1dfNwQImi2k76YW+k3Zo27Uy5D4zW8uIJEHcyejva8sz48fJ/ckntV/eEvizZvpUMuOCtQ
	rrIAl7KBo0KzczLDsYtZlUn2jPZ+3QVyrpYisyPyyjys62RLhOzNYTGMDTAZIavsEnMKd77aw13
	u5EWQrEYBOkWNrvRO35jBcqHYOFOIyitcRHcqdG6ftcJ6ehEwYe/KqlM/DnFfJoGFUSGYEgJ3B2
	s8JXqm3sLTWFvAL32X7//OHl1kaW5qiqlpuCxIeX9BUrtt2Ym71YgmymlqhuMMHxTX84AqVVVAa
	sh66EqQJLUVQiluj3CAGvuwZIH0hjHA==
X-Google-Smtp-Source: AGHT+IEzGNt+OmwbAchHc/Z8Q1x7CwOF3r1H9EiveZ02JnZ5Mv1JdB99edC0IeRBUty8mQShh5/g2w==
X-Received: by 2002:a05:6000:178a:b0:391:13ef:1b0f with SMTP id ffacd0b85a97d-3911f7c3353mr1416251f8f.39.1741160058392;
        Tue, 04 Mar 2025 23:34:18 -0800 (PST)
Message-ID: <db2073b0-8585-4518-9467-b7da4cefbbae@suse.com>
Date: Wed, 5 Mar 2025 08:34:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
 <113b2464-c7b2-4068-a179-707cba4f3835@suse.com>
 <50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com>
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
In-Reply-To: <50cd2332-11b7-4b64-85ea-489c416098f9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.02.2025 17:24, Andrew Cooper wrote:
> On 27/02/2025 8:11 am, Jan Beulich wrote:
>> On 26.02.2025 18:20, Andrew Cooper wrote:
>>> --- a/xen/arch/riscv/include/asm/bitops.h
>>> +++ b/xen/arch/riscv/include/asm/bitops.h
>>> @@ -125,6 +125,13 @@ static inline void clear_bit(int nr, volatile void *p)
>>>  #undef NOT
>>>  #undef __AMO
>>>  
>>> +#define arch_ffs(x)     ((x) ? 1 + __builtin_ctz(x) : 0)
>>> +#define arch_ffsl(x)    ((x) ? 1 + __builtin_ctzl(x) : 0)
>>> +#define arch_fls(x)     ((x) ? 32 - __builtin_clz(x) : 0)
>> I fear you won't like me to say this, but can't we avoid baking in yet
>> another assumption on sizeof(int) == 4, by using at least sizeof(int) * 8
>> here (yet better might be sizeof(int) * BITS_PER_BYTE)?
> 
> Yes and no.
> 
> No, because 32 here is consistent with ARM and PPC when it comes to
> arch_fls().  Given the effort it took to get these consistent, I'm not
> interested in letting them diverge.
> 
> But, if someone wants to introduce BITS_PER_INT to mirror BITS_PER_LONG
> and use it consistently, then that would be ok too.

I was actually hoping to eliminate BITS_PER_LONG at some point, in favor
of using sizeof(long) * BITS_PER_BYTE. (Surely in common code we could
retain a shorthand of that name, if so desired, but I see no reason why
each arch would need to provide all three BITS_PER_{BYTE,INT,LONG}.)

Jan

