Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4F4B13613
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 10:08:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061081.1426590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugIt4-0007QY-Re; Mon, 28 Jul 2025 08:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061081.1426590; Mon, 28 Jul 2025 08:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugIt4-0007OU-OZ; Mon, 28 Jul 2025 08:07:10 +0000
Received: by outflank-mailman (input) for mailman id 1061081;
 Mon, 28 Jul 2025 08:07:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugIt4-0007Nq-1C
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 08:07:10 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db43b8fb-6b89-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 10:07:08 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b78b2c6ecfso185517f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 01:07:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2403c13cb0dsm10523125ad.45.2025.07.28.01.06.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 01:07:07 -0700 (PDT)
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
X-Inumbo-ID: db43b8fb-6b89-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753690028; x=1754294828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=baNqirVNp0YLiklQGLJ4e6mLY8t9ErprOSAQfM0INg8=;
        b=bdnRt9M2unAMmNBU1aOyCudj6g236ktXIx07quzAS4dC/L/ikhT78YF9WuapkdNBzb
         u0eKfT6C2nyJmbj3Mic+M1niu2XZH9F4BWJXHNU3xYtvbSPfZmF+nvAigomPUrggo5WB
         CVUETN/BTN4wbNxQnCWdJGKj5fVsgy/g2oOzRzr5gAs9UiCgf/2cnzZ+mV2WzOUrBU6B
         eCsOM7wx6Emtq0OWK01aOigGJYYSIcYhbOZ/V08aYJ6qX1wmBLV25c13+RJiIKmgYe70
         0bvTa7CkorPt/BhlMJkqG1qjHaO2Agv+6azPGHtCioY0EbisNjl2oe5HSyowD1rT8GxO
         7P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753690028; x=1754294828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baNqirVNp0YLiklQGLJ4e6mLY8t9ErprOSAQfM0INg8=;
        b=hbaOpwyATHCgl4pWdbRXCHZgwGZjq79p7Rl9Ux0+ZnSTOjfjv0Fz3bIqvZY2DEdkhb
         v6ybxPP+BFYcYT7rueRkk3UHBaxowj4s7AzfPLfpZyc6vDi13svyr/zAZOZR1VpQmzkJ
         YA82lntX1cVDDBadkL8i18Rxa1jLJqUzWZBrd5FIsfq54DsnGYqQMxzalEiKhN3kwXi9
         F3RhZb7wZO9LjnHfnnxI3SFI+J++XxLSBnx1PwlrnzLVPJ5u+OJ0KaK4fILL9cmhucyq
         umf9XSgVFVVUzP9cP3dX7fIfCRUGBLFVRcK/nexH+hLMdXFco3RimYiT5cmanPSPY+yH
         bq0A==
X-Forwarded-Encrypted: i=1; AJvYcCV2o811TxCBQbyJ9arcvNuRhxo/yRMwOxlfOCnxi8I0YRb877yPiBuN2bsLYTloEyXSsynH8WhfcyQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKv/WFrKO8N9XX5ktRRIfywFODBB95jfsEnaBa4O7K7F7eUsF3
	U54TrCWkKyu7C71HxolgR3bwlcJEddWzFnMqLGF0B12WenNo4GDysVls9bNfX/VG1Q==
X-Gm-Gg: ASbGncsbG2OIYpD1+pJWR8hHR/xkf5ng33oEK5TiEsFgRJ8RB6fNdW+deC+eFjCEdsZ
	Dk70qEMZAwq1e+v4QRu1U3Y5bZ0lQaOzncEVZrJLtOwh7Y4L4ipzKq0iacuCibkLddoSJZomZth
	NQYknFPaffGZoCpQaYg4vmmB54vrWBO/2mYBZLenqC8Ih5z7Y4sFv604EMlqK2VhK+32mAZ9GOc
	vY4g1JcJWl8+8AiiVkaSdktl1kMQvAtFPUel/haA8CJ0xJWB17Q5+923a9U+wBiXWHAm/olTWV8
	TvD+4+A4OeoIn4JQ1T6KAj2EwRsou5fw69PkvNuXz7/YPcv0J7uNNCENxUfIJu//Qzd8kM+aTrx
	7i0oxZGHBZiaG3C6DcgBMd23BW23kXEneXTMfeuUQW5OHfyDLLDDuRvKlPvSzUd/ecfrok2GF+O
	L4f9D/tjY=
X-Google-Smtp-Source: AGHT+IFdAyvibPTDwvZ0c6l9GkIidOK9wzoW70Zy/DEf7x625X6lnnCo+t6IMObzwa/tT4YHavICEg==
X-Received: by 2002:a05:6000:2401:b0:3b7:886b:fb76 with SMTP id ffacd0b85a97d-3b7886bfe4amr1486763f8f.12.1753690027539;
        Mon, 28 Jul 2025 01:07:07 -0700 (PDT)
Message-ID: <f5c4a7ab-5d63-4211-b8e1-73fb6a9d749c@suse.com>
Date: Mon, 28 Jul 2025 10:06:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: address MISRA C Rule 18.3 compliance
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c9fb095c43edfedfd6174284bac404ec9ae5523d.1753263957.git.dmytro_prokopchuk1@epam.com>
 <6c7341a2-fd49-40de-8ad3-e7980d4e9e42@suse.com>
 <36042f23-7795-4717-be4a-cd22e52b3145@epam.com>
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
In-Reply-To: <36042f23-7795-4717-be4a-cd22e52b3145@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.2025 23:34, Dmytro Prokopchuk1 wrote:
> On 7/23/25 16:58, Jan Beulich wrote:
>> On 23.07.2025 12:12, Dmytro Prokopchuk1 wrote:
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -360,7 +360,7 @@ static always_inline void sched_spin_lock_double(
>>>       {
>>>           *flags = _spin_lock_irqsave(lock1);
>>>       }
>>> -    else if ( lock1 < lock2 )
>>> +    else if ( (uintptr_t)lock1 < (uintptr_t)lock2 )
>>
>> Similarly, no matter what C or Misra may have to say here, imo such casts are
>> simply dangerous. Especially when open-coded.
> Well, this function 'sched_spin_lock_double' has the following description:
> "If locks are different, take the one with the lower address first."
> 
> I think it's save to compare the integer representations of 'lock1' and 
> 'lock2' addresses explicitly (casting the pointers values to an integer 
> type). We need to find the 'lower address'.
> Any risks here?

These instances of casts are of comparably little risk, yes, but almost every
cast comes with some risk. If only to set a bad precedent that someone the
more or less blindly copies.

But in the end it'll be the scheduler maintainers to judge here.

>>> --- a/xen/common/virtual_region.c
>>> +++ b/xen/common/virtual_region.c
>>> @@ -83,8 +83,8 @@ const struct virtual_region *find_text_region(unsigned long addr)
>>>       rcu_read_lock(&rcu_virtual_region_lock);
>>>       list_for_each_entry_rcu ( iter, &virtual_region_list, list )
>>>       {
>>> -        if ( (void *)addr >= iter->text_start &&
>>> -             (void *)addr <  iter->text_end )
>>> +        if ( addr >= (unsigned long)iter->text_start &&
>>> +             addr <  (unsigned long)iter->text_end )
>>
>> Considering further casts to unsigned long of the same struct fields, was it
>> considered to alter the type of the struct fields instead?
> There are present casts of struct fields 'text_start' and 'text_end' in 
> the file 'xen/common/virtual_region.c'.
> 
>          modify_xen_mappings_lite((unsigned long)region->text_start,
>                                   (unsigned long)region->text_end,
>                                   PAGE_HYPERVISOR_RWX);
> 
> Changing fields type to 'unsigned long' will give the opportunity to 
> remove casts from source code (mentioned before),
> and remove '(void*)' casts from here:
> 
>          if ( (void *)addr >= iter->text_start &&
>               (void *)addr <  iter->text_end )
> 
> Unfortunately there are places where these fields are initialized, so 
> cast to the 'unsigned long' should be there.
> Example:
>      .text_start = _sinittext,
>      .text_end = _einittext,
> and
>      .text_start = _sinittext,
>      .text_end = _einittext,
> 
> where
>      extern char _sinittext[], _einittext[];
>      extern char _stext[], _etext[];
> 
> So, my proposition is to add cast to 'unsigned long' as I proposed in 
> this patch.

My take is that the solution with, ultimately, fewer casts overall wants using.
Plus my personal view is that casts in initializers are a little less "bad".

Jan

