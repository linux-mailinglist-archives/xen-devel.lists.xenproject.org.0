Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE579861B0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 16:59:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804049.1214934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTTi-00084F-If; Wed, 25 Sep 2024 14:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804049.1214934; Wed, 25 Sep 2024 14:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stTTi-00082R-FW; Wed, 25 Sep 2024 14:58:54 +0000
Received: by outflank-mailman (input) for mailman id 804049;
 Wed, 25 Sep 2024 14:58:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stTTg-00082L-V4
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 14:58:52 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac9c978d-7b4e-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 16:58:50 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d2b4a5bf1so958641766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 07:58:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930f79ddsm218100866b.158.2024.09.25.07.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 07:58:49 -0700 (PDT)
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
X-Inumbo-ID: ac9c978d-7b4e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727276330; x=1727881130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yVgzHrD/veGHQNAonOG2lnjrSoFMytH0gt8E9m+fgu4=;
        b=J2Zy8ZNIRga6wA+zcIXnSphQr0apI8U7JJJIwUVGe/rf7RiqZs4ABSHU8OXECVICu0
         5ghuDFmt31dKznjsDBZHQbjwFSLbwn4IDyndycaFuvthgPzjIBjGAbIJ0DpxedH6eBtL
         VfdL2em0Z0pdTE1n5TesC/qhRBTIFK80bPtA9NR1S4SqZV1BJFyQ/cj5CxRseZ5wupsa
         Vx7rL+wlRGj2bhfBakKPDbzgO+UFr0XvMjAxApiQqUa3YgYejCOwL3F6EhHbEpaQtKA2
         m+VEwhkbArqF9WO9sPdibEvISIX9js0hUD8VbcDt6fgEQ/KaK1MZkRFuXZ9P2tljYH+z
         Ic0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276330; x=1727881130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVgzHrD/veGHQNAonOG2lnjrSoFMytH0gt8E9m+fgu4=;
        b=NaUO+/LkYmeMpA6Q4yuKxngaq+NNgk+KqEr4zf8G9R9EeWiCL8wuUEEkHWL3kHf/y0
         2nBKparDPYXq5QfIx8yOIowQ7jFGkFNmB0M0/Ja9tcjnuNMNTNtAhUX75w90EaS8ap2k
         FcYfYqmmmi4I4vc9SLCSHICZnxlVwXnvc9SaFGcGxo3EMBAZTNaAwfe3bEclRVx/aLE/
         066X0PMQz3eWwtir0t2NR6mhpiBYUZPtUW7TfoWqhfCrVMsjKHQVJvXgWOntp5/DM6Qj
         eif6so8cWPvhUfp5skWHJPAxn+eosBqQpj8qeg7xUPVa49N5c1WvIUEOt5dUuDbMgusa
         ARqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH0wTNrCJ7IkE2GZ/NvH3eqHW5V/nQtbQfrOvSvi73u09YwAPPd6ZM66r8pr2kjebixYT4it0Saq8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPnYK1fvSSBlBL0AwGgOCBg0Nznz5mTQ38HLlB2yzNXlaqRWe4
	uac7EuHFxSombtepeDoBtWyFiBxi95RXdnklK4yGZ72UqGAdTvw4ce9wjkqnwQ==
X-Google-Smtp-Source: AGHT+IHeWanmfyiqZPkg8mMnTNlj7Ob1dHTw35FUZCwDnJ4JLafWi1nAkfack3Itez+zrfXOae5rbw==
X-Received: by 2002:a17:907:3daa:b0:a7a:be06:d8eb with SMTP id a640c23a62f3a-a93a066fdc0mr336313466b.53.1727276330049;
        Wed, 25 Sep 2024 07:58:50 -0700 (PDT)
Message-ID: <60dd2287-351c-4fd1-bf2d-00645342fc73@suse.com>
Date: Wed, 25 Sep 2024 16:58:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] xen/riscv: page table handling
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
 <582c4cee40222e80faf1e465c011b07eeaf2c19f.1726242605.git.oleksii.kurochko@gmail.com>
 <6100a4e0-5bf3-4555-90ae-20624171ff79@suse.com>
 <fc23fbd82c1495e75fc0bdcfa894cdb56262b11b.camel@gmail.com>
 <9371e8fd-a1de-40df-8994-814dd6196953@suse.com>
 <ecab08fbbe1a1e364cf6d4bf9dafa42ced4faef4.camel@gmail.com>
 <03b67663-1a55-4642-b997-8680961aadeb@suse.com>
 <cf994aa4f9dbef890f53cf8567519b840da8faf4.camel@gmail.com>
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
In-Reply-To: <cf994aa4f9dbef890f53cf8567519b840da8faf4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2024 16:50, oleksii.kurochko@gmail.com wrote:
> On Wed, 2024-09-25 at 16:22 +0200, Jan Beulich wrote:
>> On 25.09.2024 12:07, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-09-24 at 15:31 +0200, Jan Beulich wrote:
>>>> On 24.09.2024 13:30, oleksii.kurochko@gmail.com wrote:
>>>>> On Tue, 2024-09-24 at 12:49 +0200, Jan Beulich wrote:
>>>>>> On 13.09.2024 17:57, Oleksii Kurochko wrote:
>>>>>>> +static int pt_next_level(bool alloc_tbl, pte_t **table,
>>>>>>> unsigned
>>>>>>> int offset)
>>>>>>> +{
>>>>>>> +    pte_t *entry;
>>>>>>> +    mfn_t mfn;
>>>>>>> +
>>>>>>> +    entry = *table + offset;
>>>>>>> +
>>>>>>> +    if ( !pte_is_valid(*entry) )
>>>>>>> +    {
>>>>>>> +        if ( !alloc_tbl )
>>>>>>> +            return XEN_TABLE_MAP_FAILED;
>>>>>>> +
>>>>>>> +        if ( create_table(entry) )
>>>>>>> +            return XEN_TABLE_MAP_FAILED;
>>>>>>
>>>>>> You're still losing the -ENOMEM here.
>>>>> Agree, I will save the return value of create_table and return
>>>>> it.
>>>>
>>>> That won't work very well, will it? 
>>> I think it will work, just will be needed another one check in
>>> pt_update_entry() where pt_next_level() is called:
>>>         if ( (rc == XEN_TABLE_MAP_FAILED) || (rc == -ENOMEM) )
>>>         ...
>>
>> Yet that's precisely why I said "won't work very well": You're now
>> having
>> rc in two entirely distinct number spaces (XEN_TABLE_MAP_* and -E*).
>> That's imo just calling for trouble down the road. Unless you
>> emphasized
>> this aspect pretty well in a comment.
>>
>>>> Imo you need a new XEN_TABLE_MAP_NOMEM.
>>>> (And then XEN_TABLE_MAP_FAILED may want renaming to e.g.
>>>> XEN_TABLE_MAP_NONE).
>>> I am still curious if we really need this separation. If to in this
>>> way
>>> then it should be updated the check in pt_update_entry():
>>>    --- a/xen/arch/riscv/pt.c
>>>    +++ b/xen/arch/riscv/pt.c
>>>    @@ -165,10 +165,10 @@ static int pt_next_level(bool alloc_tbl,
>>> pte_t
>>>    **table, unsigned int offset)
>>>         if ( !pte_is_valid(*entry) )
>>>         {
>>>             if ( !alloc_tbl )
>>>    -            return XEN_TABLE_MAP_FAILED;
>>>    +            return XEN_TABLE_MAP_NONE;
>>>     
>>>             if ( create_table(entry) )
>>>    -            return XEN_TABLE_MAP_FAILED;
>>>    +            return XEN_TABLE_MAP_NOMEM;
>>>         }
>>>     
>>>         if ( pte_is_mapping(*entry) )
>>>    @@ -209,7 +209,7 @@ static int pt_update_entry(mfn_t root,
>>> unsigned
>>>    long virt,
>>>         for ( ; level > target; level-- )
>>>         {
>>>             rc = pt_next_level(alloc_tbl, &table, offsets[level]);
>>>    -        if ( rc == XEN_TABLE_MAP_FAILED )
>>>    +        if ( (rc == XEN_TABLE_MAP_NONE) && (rc ==
>>> XEN_TABLE_MAP_NOMEM)
>>>    )
>>>             {
>>>                 rc = 0;
>>> But the handling of XEN_TABLE_MAP_NONE and XEN_TABLE_MAP_NOMEM
>>> seems to
>>> me should be left the same as this one part of the code actually
>>> catching the case when create_table() returns -ENOMEM:
>>>    pt_next_level()
>>>    {
>>>    ...
>>>                if ( flags & (PTE_VALID | PTE_POPULATE) )
>>>                {
>>>                    dprintk(XENLOG_ERR,
>>>                            "%s: Unable to map level %u\n",
>>> __func__,
>>>    level);
>>>                    rc = -ENOMEM;
>>>                }
>>
>> Except that you want to avoid "inventing" an error code when you were
>> handed one. Just consider what happens to this code if another -E...
>> could also come back from the helper.
> I think we can drop the usage of -ENOMEM in the helper create_table()
> by returning XEN_TABLE_MAP_FAILED in case of failure, with a
> redefinition of XEN_TABLE_MAP_FAILED = 1, XEN_TABLE_SUPER_PAGE = 2, and
> XEN_TABLE_NORMAL = 3, as value 0 is used to indicate that everything is
> okay.
> 
> We can leave the pt_update() code as it is now:
> ...
>             if ( flags & (PTE_VALID | PTE_POPULATE) )
>             {
>                 dprintk(XENLOG_ERR,
>                       "%s: Unable to map level %u\n", __func__, level);
>                 rc = -ENOMEM;
>             }
> ...
> 
> Because for the end user, it's better to receive the error code from
> xen/errno.h rather than a custom error code introduced nearby the
> helper.
> 
> Does it make sense?

While I think I see where you're coming from, I still don't agree. And
I never suggested to bubble up some custom error indication. Up the call
chain it wants to be -ENOMEM, sure. Yet keying its generation to
flags & (PTE_VALID | PTE_POPULATE) is both less obvious and more fragile
(towards future code changes) than keying it to rc == XEN_TABLE_MAP_NOMEM.

If I can't convince you, then so be it. Yet then I'm also not very likely
to ack this patch of yours (which of course won't mean I wouldn't further
look at other aspects of the change, hopefully at least making it easier
for someone else to ack it).

Jan

