Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C36C6AA2F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 17:30:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165160.1491958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLOar-0001Qv-T0; Tue, 18 Nov 2025 16:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165160.1491958; Tue, 18 Nov 2025 16:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLOar-0001O8-QH; Tue, 18 Nov 2025 16:30:13 +0000
Received: by outflank-mailman (input) for mailman id 1165160;
 Tue, 18 Nov 2025 16:30:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLOaq-0001O2-A9
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 16:30:12 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9d85df1-c49b-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 17:30:10 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b75c7cb722aso154577166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 08:30:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fdac667sm1362564766b.58.2025.11.18.08.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 08:30:08 -0800 (PST)
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
X-Inumbo-ID: d9d85df1-c49b-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763483410; x=1764088210; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tm2Gtb2cGhkBggneTvSl8xUQ69TE8eI/em3VTKS3h6I=;
        b=FDASizaGN/97dQXBm7IuuPBUIDNIYmYZplah2neMrvT5+GcQcntoZ2I1oIwXpqsBD/
         9N/C0nG8n0U0Wg0yAR0m+erxk+2462NcHNn3SWYUm/sB0XlEjCwvxzIilr3IcyeMuG1n
         B9HfurZqbH2kde8UcmWGV487pDVQzXx5uV2Elwz7awDiSj/qEkd+PI75zIwcL4+BT/lj
         otPqtSQQSaEHYQX8MWU77/md7FegxOCjt3ahqWq6nYx9ODUm0Rwd26P64sCeuMGS91Lo
         rnHaBAjkOscv3mlt5njsMU46fYwTD19Bjc2mW/t3Xtjg5NvjFEToO2kuzW4ZRN32D1HL
         HpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483410; x=1764088210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm2Gtb2cGhkBggneTvSl8xUQ69TE8eI/em3VTKS3h6I=;
        b=Svruv5Htpq8D2niud7H08GrFbIwEELTBkYJFcgTyMa+V3rqEOHDXVjFB23tUYdogKl
         LTDTV0bCsiQN7VOqDNsRS85uVEl+kIeJ0dq/p0wrY2t+oKFKMuuyFWJ6p0F+kM4mHj64
         oyM5MfDV0BRv2ErpTtJEr68LWWCHV9NtgF0G5Dk13icceJhgDNt9NXAcX2UeInly9U15
         D9TzGAIP0fTQjKLXse6H3+QwacMQ38V9VbBZR60O3Xei5CiNrCloAidvXyJssDif2PxN
         E2n7wi6Ona+uv9AmHCBymWOY3a2H2cUMAYGlLaUjTlVkIdkh8nRJSIBLBA7J8POdythw
         Jvjg==
X-Forwarded-Encrypted: i=1; AJvYcCXGbFlzbQuhtgShwMI7PyFXwmHB1aNwxfJxuGerezcY4QAHVx5YUsIwtNVKgXbpJQcSC5q8ufNEnrQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxczP9ZIN56QFgSyCVH13qYjflWiunjnYN/LN0IDBftfzUAo2pw
	hgqYFwGCF0ugERlCcZeo1n6nyI3dsAloqIKFG5PgS29T6C75V5/gsgPMGSzYXZec5Q==
X-Gm-Gg: ASbGncvqCAqTZQJK9cyQN6Cqqc1b5v/3QkH+prK6lbQD91X5ZTe4Vkr2XEjasIF/TuI
	Mx3SYZbv4w5PuQKN/KASG2pLmdtYnrzb6EimUerRHgxeRTsRaq36zP+K6onNJXJ6n7d2qOvFc1g
	v4FqXqKxwOPC0oUWs5iqB0B+4GLiNqaMGaQWn78PELqOnXy7pHySqbfZP78OrkRfgzdea9v8P0H
	gPccZFNbTew1LVn5J1MmLPbFXZSt1cDt8nAotFEnQSo9DBEfVtq/93nVa5E87ZM3pDLWSaWc5VB
	Hk2LpgrPkt6fpudH8M+gyPiztFJz6Y7cpTFSere7izJOmqysjCUE7xDKWZaOLAiJ9OrNYo+lNC0
	oNthVwIuLHkMzmR7+W+Slwxt7wSMzfaaca2NusN9QvvukHtN8QTlRCi1SxsP8zquRaeL46mFlyz
	gbkoSUGW0nNGBv6/QdD4/lOQ7ZfLiowHUNsfTLnmB4NUk/Ppf9VFbFwWh9wJqG5WH5ZG1zFRzbl
	Va4dnqPUGiB/A==
X-Google-Smtp-Source: AGHT+IEi5NTzvklWbP9Qp8Uq+weaRmRwvt7aCKBb7lvD9vRI6rhJk8Z15M5Q4C6ta9nWTM7hpA6jpw==
X-Received: by 2002:a17:906:7304:b0:b72:a899:168d with SMTP id a640c23a62f3a-b73677edba0mr1731316666b.13.1763483409690;
        Tue, 18 Nov 2025 08:30:09 -0800 (PST)
Message-ID: <5da0c18a-cca3-4821-92f2-3a1588acea5c@suse.com>
Date: Tue, 18 Nov 2025 17:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 10/18] xen/riscv: implement p2m_set_range()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <d689c48582505b0dab6896b414d01d844d834bd5.1760974017.git.oleksii.kurochko@gmail.com>
 <cfe9da20-5680-4f42-92f6-f46350811380@suse.com>
 <3fc28006-4a03-4d95-8db3-71a7b3131f82@gmail.com>
 <31c69c86-46ba-4670-b265-10baa0001f85@suse.com>
 <6ddb0571-6c19-404b-813b-55c9ad0dd062@gmail.com>
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
In-Reply-To: <6ddb0571-6c19-404b-813b-55c9ad0dd062@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.11.2025 16:28, Oleksii Kurochko wrote:
> 
> On 11/17/25 9:56 AM, Jan Beulich wrote:
>>>>> +#define P2M_MAX_ROOT_LEVEL 4
>>>>> +
>>>>> +#define P2M_DECLARE_OFFSETS(var, addr) \
>>>>> +    unsigned int var[P2M_MAX_ROOT_LEVEL] = {-1};\
>>>>> +    for ( unsigned int i = 0; i <= gstage_root_level; i++ ) \
>>>>> +        var[i] = calc_offset(i, addr);
>>>> This surely is more than just "declare", and it's dealing with all levels no
>>>> matter whether you actually will use all offsets.
>>> I will rename|P2M_DECLARE_OFFSETS| to|P2M_BUILD_LEVEL_OFFSETS()|.
>>>
>>> But how can I know which offset I will actually need to use?
>>> If we take the following loop as an example:
>>>     |for( level = P2M_ROOT_LEVEL; level > target; level-- ) { ||/* ||* 
>>> Don't try to allocate intermediate page tables if the mapping ||* is 
>>> about to be removed. ||*/ ||rc = p2m_next_level(p2m, 
>>> !removing_mapping, ||level, &table, offsets[level]); ||... ||} |It 
>>> walks from|P2M_ROOT_LEVEL| down to|target|, where|target| is determined at runtime.
>>>
>>> If you mean that, for example, when the G-stage mode is Sv39, there is no need to allocate
>>> an array with 4 entries (or 5 entries if we consider Sv57, so P2M_MAX_ROOT_LEVEL should be
>>> updated), because Sv39 only uses 3 page table levels — then yes, in theory it could be
>>> smaller. But I don't think it is a real issue if the|offsets[]| array on the stack has a
>>> few extra unused entries.
>>>
>>> If preferred, Icould allocate the array dynamically based on|gstage_root_level|.
>>> Would that be better?
>> Having a few unused entries isn't a big deal imo. What I'm not happy with here is
>> that you may_initialize_ more entries than actually needed. I have no good
>> suggestion within the conceptual framework you use for page walking (the same
>> issue iirc exists in host page table walks, just that the calculations there are
>> cheaper).
> 
> The loop inside|P2M_DECLARE_OFFSETS()| uses|gstage_root_level|, so only the entries that
> are actually going to be used are initialized.
> 
> You probably mean that it’s possible we don’t need to walk all the tables because a
> leaf page-table entry appears earlier than the L0 page table for some gfns?

Yes.

> IMO, it’s not
> really a big deal, because at worst we just spend some time calculating something that
> isn’t actually needed, but considering that it will be just extra 2 calls in the worst case
> (when mapping is 1g, for no reason we calculated offsets for L1 and L0) of calc_offset()
> it won't affect performance too much.

Well, it's your call in the end.

Jan

