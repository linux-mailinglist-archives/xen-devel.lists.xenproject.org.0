Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63529B1D47A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 10:50:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072647.1435651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujwKW-0002LK-F2; Thu, 07 Aug 2025 08:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072647.1435651; Thu, 07 Aug 2025 08:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujwKW-0002Ih-CF; Thu, 07 Aug 2025 08:50:32 +0000
Received: by outflank-mailman (input) for mailman id 1072647;
 Thu, 07 Aug 2025 08:50:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujwKV-0002Ib-Bd
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 08:50:31 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90e3b37d-736b-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 10:50:27 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-615756b1e99so1135695a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 01:50:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a219ef2sm1267613366b.96.2025.08.07.01.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 01:50:26 -0700 (PDT)
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
X-Inumbo-ID: 90e3b37d-736b-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754556627; x=1755161427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lDC92W9A9lAsblfPUtOc0R4iDWmNlvOrw0F9YGmEf90=;
        b=IY/3V0GYgU8R452X8eYs2o5nr3W05ZNctxjbPYNh8H8TnREqvBrE1ZAGQIr+goT46T
         LjZ5HISCc0x0FFJ0/62E/CeNpwwQESoXEPtqr8JvjxVoUH3u85weeU6IJNL+EKE7nl48
         UUt80MHf7PIB5rCBHevAU6Dl5f+erCM+EUz9vBK4yAPyqkioiTeTN5YvjQIy2jO+3O2W
         Q2SvN4VhXvWklr5oOyWctDb+3cOmlPiw3SlX79NnDdJlE9udP2CzM9AOQo8EsYbRW5uv
         KH71MEC+GBekynk7m+r5YoTL6+Z37VmIDvBRIRuAjvN+4Y3uLwR1J4NfAc2DN+JcDXEa
         j1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754556627; x=1755161427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDC92W9A9lAsblfPUtOc0R4iDWmNlvOrw0F9YGmEf90=;
        b=gwEU4gLQ++STLdZVdLhn1N6onTzj5Dpm0X8otmjLeGmyc4FzdNlZAVkfveeruZ7NUT
         zFc90HiNKLi/bGJSjd4usAXfVieS0cpPK4Lklr1Z/zZUOylxfyJIcmZROcPbnlrBNaK9
         zKZAMK3WwqIXmkPm8yfJw2PgNCTZTDSouslKlJ5dZ9IJcEUoA8n2xNp35J9PcOA6cQqD
         1wQIkncrnGBvNO0d3dBL7catVeTNq8bB3GZqEtUNYFXskaieiABdeagOx5b1oOHUF4Bq
         OsAPHLQe/81p8DIqitPrmJltA8CkrEe73L9rKfZqTZt3t+LkKKU7C9WCTa1ZID/MGvWY
         HjuA==
X-Forwarded-Encrypted: i=1; AJvYcCUO64trqO4hcGY2nQCcGAn2NOzlc8E9y5KOeQesr4tTHTJ2Vm2MjSb0vyQkmhBPHc3OdsWq4VEAHus=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyz74Sp5dwl5G1hmKKjpYfjy/qvyY185SOord92R1V8dLgDvsJj
	Bes4SKYx855X8dt84mk2Y9PA9x9bA88J79NXbgRUxYq5Zt/BnAERDQFsCeXaP4aUyA==
X-Gm-Gg: ASbGncs6WPQS3aIFSOOgbld2regFHsaZ1FZBuAkleZ/ss0PwVOnsijhC8hFOvAeon1C
	iF9Ry5Wo2/dKbwb0YjDUQANuoemYBSz1Oya/KQm6XGouHBBsUEul8Hj2vThCYcnidhlWuxQHJYa
	qWb4YuU0KTE3WrbyxlhzsFn8nuN4q/85LqQ7DFXtBhNlierGRJeGusvX2XEnn/T6p1JbEbp54VQ
	O8So6cK8bFaC8jTYmXznr2LjpcwGzV3jf9aEZZVnRwAa5IwPeKMWu6i96x1U5Td4Tuv0LO3k1WN
	IOt5Ak4vBikl5maPt2MelEwloDqEbu8V1Z8bi4Wq4grGP+dwVkVaTt4A50tDGEwHET74JxNTijW
	AuVyS7YFqiXjAEmRgjirIa9V7ZwqOvuzKVb91rrFCPnheWqAaapqRTea1ADvnkgOGDOZTnC7xz4
	zETMUYuwA=
X-Google-Smtp-Source: AGHT+IGq/VVfzxNtTIHnGf+eMkY49oPU9izbSxQQ7kKARWFJo7zeEvHQcDF+iAjk7xTEUNjuSpW2Og==
X-Received: by 2002:a17:907:2d13:b0:af2:42e8:ad92 with SMTP id a640c23a62f3a-af992c9705amr449373066b.61.1754556627193;
        Thu, 07 Aug 2025 01:50:27 -0700 (PDT)
Message-ID: <0bcf4d5b-8f6c-4a65-a7b4-cd638977fd71@suse.com>
Date: Thu, 7 Aug 2025 10:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/mm: correct PG_log_dirty definition
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c506f225-0993-4ef3-9e7e-60b8f17c872e@suse.com>
 <65e27b35-9256-4ab0-966a-c50a18900ba5@suse.com>
 <b3edf693-6f54-487d-b465-6224daf9746d@amd.com>
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
In-Reply-To: <b3edf693-6f54-487d-b465-6224daf9746d@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.08.2025 23:24, Jason Andryuk wrote:
> On 2025-08-05 03:59, Jan Beulich wrote:
>> While it is correct that in shim-exclusive mode log-dirty handling is
>> all unreachable code, the present conditional still isn't correct: In a
>> HVM=n and SHADOW_PAGING=n configuration log-dirty code also is all
>> unreachable (and hence violating Misra rule 2.1).
>>
>> As we're aiming at moving away from special casing PV_SHIM_EXCLUSIVE=y,
>> don't retain that part of the conditional.
>>
>> Because of hypercall-defs.c we need to carry out the dependency by
>> introducing a new auxiliary PAGING control.
>>
>> Since compiling out mm/paging.c altogether would entail further changes,
>> merely conditionalize the one function in there (paging_enable()) which
>> would otherwise remain unreachable (Misra rule 2.1 again) when PAGING=n.
>>
>> Fixes: 23d4e0d17b76 ("x86/shim: fix build with PV_SHIM_EXCLUSIVE and SHADOW_PAGING")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Of course PAGING is at risk of being confused with MEM_PAGING. It not
>> having a prompt, I hope that's tolerable, as I can't really think of a
>> better name.
>>
>> Other PG_log_dirty pre-processor conditionals then likely also want
>> replacing.

Isn't this remark of mine ...

>> mm/paging.c and mm/p2m-basic.c could also be compiled out
>> altogether when PAGING=n, at the expense of introducing a few more
>> stubs.
>>
>> FTAOD, the Fixes: tag being referenced does not mean this patch corrects
>> the far more recently introduced build issue with the combination of the
>> two features. That's still work that I expect Penny to carry out (with
>> there still being the option of reverting the final part of the earlier
>> series).
>>
> 
>> --- a/xen/arch/x86/mm/paging.c
>> +++ b/xen/arch/x86/mm/paging.c
>> @@ -864,6 +864,7 @@ void paging_final_teardown(struct domain
>>       p2m_final_teardown(d);
>>   }
>>   
>> +#ifdef CONFIG_PAGING
> 
> The file already has a lot of uses of #if PG_log_dirty with similar 
> meaning, if I am not mistaken, so using that would make it more 
> consistent.  But CONFIG_PAGING is directly tied to the Kconfig, so maybe 
> it is better?  Just something I noticed.

... precisely matching your observation? If we want to accept the extra churn,
we certainly can go this route in a follow-on patch.

> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks.

Jan

