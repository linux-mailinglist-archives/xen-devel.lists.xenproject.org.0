Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CCE9EB0A6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 13:22:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852246.1266098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKzFc-0007Pu-Kc; Tue, 10 Dec 2024 12:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852246.1266098; Tue, 10 Dec 2024 12:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKzFc-0007Nb-Gu; Tue, 10 Dec 2024 12:22:04 +0000
Received: by outflank-mailman (input) for mailman id 852246;
 Tue, 10 Dec 2024 12:22:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKzFa-0007NT-Px
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 12:22:02 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bd79948-b6f1-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 13:22:01 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3863703258fso1648820f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 04:22:01 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861ecf4087sm16087832f8f.5.2024.12.10.04.22.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 04:22:00 -0800 (PST)
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
X-Inumbo-ID: 5bd79948-b6f1-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733833321; x=1734438121; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tayK09O9V2YvhZOVOPCZMeyApOgLsEm6NDR9iprI1IQ=;
        b=QMA1n5mJO4u0+Uy9uHCV+KahHFNT12AOJg62pXhv0UwC6FiJZBb2RRs3bjCaY0xtCK
         gtdSg4SJkDM8vY7twJ7jUIumf19U+POu4uhlRoY+Y49bFGYaM5hUzWRAa/0Qh9JYO+Hf
         W0NilWC2miy8p04VkHxJ56SLD1/0i+TTo0ditpM6EyDaO+4dWTGGqv3hHZB9WJKtWq6v
         rGYQh2ub/X6ViUIjhWxy5zge7QioJKAKrnMsxFHfpcXwv7j4ztz49m85n1z3+YI1dw9J
         zhcCujtXAfQ4gSRnXiDWlCNhgOtgs21DP4WbpcN9uYD4pSyAUuMOrP5Cnfvl/Jmb0rAV
         jhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733833321; x=1734438121;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tayK09O9V2YvhZOVOPCZMeyApOgLsEm6NDR9iprI1IQ=;
        b=Qfenc/fEqyK06Q5XKGU7vVhAIZ2hCKT/ukKJ0TtdvHTtqSF2WV5GuggLeHWlf8zD8b
         Fi/qkMCWufrPv1fqCId0mc9fpqjtAsoR5zSjROAgeldcvLIkbCVxijf/mVGlhiWJlN0/
         FqEFirvLtaB5xpydHIGtHSJ8yh6XxgLK7vheVHTLNT1VS7fl3ozN0F7ZSzPxSTkB+Gpp
         u5KurwojcX6H6gkQo1Cmcng9ArrCRIholQg4i8r6w+w7Eoo2lnF4+3J8ITgUHS/s+YlR
         DNMmmj3n8GOB8XVKSPXkxyBIX8tJ0YjgyU+DWlYmsWsFXWlsB/4BI8zEp3JkzaiI/6A7
         u+Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUNz/pawwyYEwDyRW5FrnmM/nmBro9xAr1B+NcNdXcs7SgOoNS+42KnYSFL7dPHBHWWIGyyWguiVMY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLTFSKd5dxFEW5usKM2PC7DRrSWGsmGXcWNBwWW/Vg9jF1kuRe
	dEY1E78uHAulbabRiYq0eq6HK3Yyr2+KhgAI61x467Z3kc1lqHcboxw99//TRQ==
X-Gm-Gg: ASbGncvQntFlq48snibK9MfpNpIE3uLsH34mqu9dJjB0HUBRg18TrciCE6Nr/USwziW
	fOsW1kVQYOX89MpWrB36yPwxH3Lbj5AIRUs9IT3WV8jqftBM7Lij4pqdCTV8AQYPYoIVUNU3g6g
	SoB9vyMhp7WjSaQH9Ml7EUXXXh6qZAIfG4TyWmXPbQh5aShutKEpayekEtPQ3ibj2YOmXKC5UjP
	YqmFafLf71509gtUfxdb3oUqLZ5FhKKZnl9gaOgj1kq6C6s8M2jkCcxwhgnQGRX8QW8nRf7YWV0
	20Vnz9dBSADGW20YcE1KP8pxBiY+k5nNuajzYPUHbcCVZEMF9PPAxzOYB1M7plunKv7ZUshAEDV
	m3k4CrJb3Dg==
X-Google-Smtp-Source: AGHT+IHBff18TpQrZ7l55qRtfAJPv8Riv8OkT9BgpM5nJv1K477QQe9EvbhsZgOyVTrAuZUfS2uJgQ==
X-Received: by 2002:a05:6000:154c:b0:386:3213:5b80 with SMTP id ffacd0b85a97d-386469e9a9fmr2247470f8f.24.1733833321227;
        Tue, 10 Dec 2024 04:22:01 -0800 (PST)
Message-ID: <d7302a37-0e1a-4c32-917c-8a04cc62fc5c@suse.com>
Date: Tue, 10 Dec 2024 13:21:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/6] xen/riscv: add destroy_xen_mappings() to remove
 mappings in Xen page tables
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1732709650.git.oleksii.kurochko@gmail.com>
 <eed2acbf660cadbfb267e7854e9f67eb382cc966.1732709650.git.oleksii.kurochko@gmail.com>
 <0640888f-3b9d-4f5c-9797-856374f16155@suse.com>
 <e887040e-5402-4314-926f-5cd8947bbedc@gmail.com>
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
In-Reply-To: <e887040e-5402-4314-926f-5cd8947bbedc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2024 12:14, Oleksii Kurochko wrote:
> 
> On 12/9/24 3:23 PM, Jan Beulich wrote:
>> On 27.11.2024 13:50, Oleksii Kurochko wrote:
>>> Introduce the destroy_xen_mappings() function, which removes page
>>> mappings in Xen's page tables between a start address s and an end
>>> address e.
>>> The function ensures that both s and e are page-aligned
>>> and verifies that the start address is less than or equal to the end
>>> address before calling pt_update() to invalidate the mappings.
>>> The pt_update() function is called with INVALID_MFN and PTE_VALID=0
>>> in the flags, which tell pt_update() to remove mapping. No additional
>>> ASSERT() is required to check these arguments, as they are hardcoded in
>>> the call to pt_update() within destroy_xen_mappings().
>>>
>>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> Acked-by: Jan Beulich<jbeulich@suse.com>
>>
>> However, ...
>>
>>> --- a/xen/arch/riscv/pt.c
>>> +++ b/xen/arch/riscv/pt.c
>>> @@ -421,6 +421,14 @@ int map_pages_to_xen(unsigned long virt,
>>>       return pt_update(virt, mfn, nr_mfns, flags);
>>>   }
>>>   +int destroy_xen_mappings(unsigned long s, unsigned long e)
>>> +{
>>> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
>>> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>>> +    ASSERT(s <= e);
>>> +    return pt_update(s, INVALID_MFN, PFN_DOWN(e - s), 0);
>>> +}
>> ... I'm unconvinced the constraints need to be this strict. You could,
>> for example, very well just avoiding to call pt_update() when s > e
>> (or really when s >= e). Thoughts?
> 
> On one hand, we could simply avoid calling |pt_update()|, but on the other hand, this approach might cause us to miss a bug without any notification.
> 
> Given that this is an|ASSERT()| that only triggers in debug builds and is unlikely to occur,
> I believe it is not critical to include the|ASSERT()| here.

Right, and that is one of the points. In release builds a potential
bad call here wouldn't be prevented if there's just an assertion.
Unlike if there was an if() instead (perhaps with ASSERT_UNREACHABLE()
on its "else" path).

> Additionally, avoiding an extra
> |if| condition helps prevent any potential performance impact. However, the|if| condition
> would likely evaluate to true most of the time, allowing hardware optimizations to handle
> it efficiently.

I don't think we need to be afraid of performance issues here.

Jan

