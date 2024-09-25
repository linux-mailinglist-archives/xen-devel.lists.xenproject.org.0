Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA9C98606B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 16:22:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804030.1214901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stSuc-0002k3-O2; Wed, 25 Sep 2024 14:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804030.1214901; Wed, 25 Sep 2024 14:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stSuc-0002iE-L4; Wed, 25 Sep 2024 14:22:38 +0000
Received: by outflank-mailman (input) for mailman id 804030;
 Wed, 25 Sep 2024 14:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stSub-0002i8-4b
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 14:22:37 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9be0d166-7b49-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 16:22:35 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c4226a5af8so8742013a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 07:22:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4d8218sm1886075a12.96.2024.09.25.07.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 07:22:33 -0700 (PDT)
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
X-Inumbo-ID: 9be0d166-7b49-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727274154; x=1727878954; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0QzN9iDchuOIzJkjAvHSI0Pi9C+l1z6mW4PQ/S0XJa4=;
        b=eG/PhZ1iITP2DiAjxI/zlCfUnNl9umrXytyHHt3LhGNFkIoAlOnPXlBMoVoQ4jv4q4
         +NCVJYq3xlqFrsPxvBWMUc4ur4v/yNaesPyTZeemhi5fyDAj3EzWEKSxlUWPAOVbZ5j2
         Hj10b7q+/F24YK8HiBnwJxqhFMFkXI2+7TziRv68Ht9vU5YrmpPX+/+GdUe2YOz6FfU4
         lTF6Ga1YV6R8feK9J68yNDSL9BnT8dg0TD4Nf2pMyzFofjzigjwfiQkZ+qu85EJ4ZWvp
         cZ1S8DdXejtGMqRTDFJPW/e3N0cUtyrPIOl7UbvjwAZF32zK6uL9Pj1C9/8AS5P9HSXf
         p4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727274154; x=1727878954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QzN9iDchuOIzJkjAvHSI0Pi9C+l1z6mW4PQ/S0XJa4=;
        b=rHfGPC1Tvp9+QoDhwWmDIElc80MPuThUeWBfDO1MbcdH/+Z4WYcagCVsnUcTB+QTPF
         tykSBLX71pnopV8Q9rfmqmWIgijZM6aS90Y+amUXxLj1nNAJPUNAdEVELusUph3yXns6
         xvv9gLdVUIVZCDv+nYsHZ3VPVKR9stqhXDRHjUyFNXESNfC+y0M5ozaCKjD76icRaHJo
         GHMDpL5PbZviFcw4cRqsMfL+q2kgJzMmprSSfv+JTr9aeBfFfsHpapKWbkHORz7LrIMp
         ExHkuU43i2QziXhdDVgvcZ+d9mQybUgK0HPsSFZlzsOSYFTZzfQdad7TkKaPlFzKiCOQ
         WAyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpHYIG/JpmHk0vTVes5eCQ/SIqzWSM7/HA84vI7qwf467oAyCfWV9hfkBVyJsm61pbuSi1IVl8OFg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7xsHmoJYBfrJe1my0WRL5TopqJwEx/xt7GpR/goxEhnU2ZFkA
	5SElN8YoPXyUceMxaUELG87Tn5SddMVQnmTgSbXq96VEIssx0zaJV78/a2M/UQ==
X-Google-Smtp-Source: AGHT+IG6ismSvUXWSdzKN9SIFq4O/TnQ1QnT9w73CmB7XStHXCXqAsEs4kZYflanmHT/MmBSkCvLMw==
X-Received: by 2002:a05:6402:5188:b0:5c5:b682:64aa with SMTP id 4fb4d7f45d1cf-5c7206411c0mr2124445a12.26.1727274154362;
        Wed, 25 Sep 2024 07:22:34 -0700 (PDT)
Message-ID: <03b67663-1a55-4642-b997-8680961aadeb@suse.com>
Date: Wed, 25 Sep 2024 16:22:33 +0200
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
In-Reply-To: <ecab08fbbe1a1e364cf6d4bf9dafa42ced4faef4.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.09.2024 12:07, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-09-24 at 15:31 +0200, Jan Beulich wrote:
>> On 24.09.2024 13:30, oleksii.kurochko@gmail.com wrote:
>>> On Tue, 2024-09-24 at 12:49 +0200, Jan Beulich wrote:
>>>> On 13.09.2024 17:57, Oleksii Kurochko wrote:
>>>>> +static int pt_next_level(bool alloc_tbl, pte_t **table,
>>>>> unsigned
>>>>> int offset)
>>>>> +{
>>>>> +    pte_t *entry;
>>>>> +    mfn_t mfn;
>>>>> +
>>>>> +    entry = *table + offset;
>>>>> +
>>>>> +    if ( !pte_is_valid(*entry) )
>>>>> +    {
>>>>> +        if ( !alloc_tbl )
>>>>> +            return XEN_TABLE_MAP_FAILED;
>>>>> +
>>>>> +        if ( create_table(entry) )
>>>>> +            return XEN_TABLE_MAP_FAILED;
>>>>
>>>> You're still losing the -ENOMEM here.
>>> Agree, I will save the return value of create_table and return it.
>>
>> That won't work very well, will it? 
> I think it will work, just will be needed another one check in
> pt_update_entry() where pt_next_level() is called:
>         if ( (rc == XEN_TABLE_MAP_FAILED) || (rc == -ENOMEM) )
>         ...

Yet that's precisely why I said "won't work very well": You're now having
rc in two entirely distinct number spaces (XEN_TABLE_MAP_* and -E*).
That's imo just calling for trouble down the road. Unless you emphasized
this aspect pretty well in a comment.

>> Imo you need a new XEN_TABLE_MAP_NOMEM.
>> (And then XEN_TABLE_MAP_FAILED may want renaming to e.g.
>> XEN_TABLE_MAP_NONE).
> I am still curious if we really need this separation. If to in this way
> then it should be updated the check in pt_update_entry():
>    --- a/xen/arch/riscv/pt.c
>    +++ b/xen/arch/riscv/pt.c
>    @@ -165,10 +165,10 @@ static int pt_next_level(bool alloc_tbl, pte_t
>    **table, unsigned int offset)
>         if ( !pte_is_valid(*entry) )
>         {
>             if ( !alloc_tbl )
>    -            return XEN_TABLE_MAP_FAILED;
>    +            return XEN_TABLE_MAP_NONE;
>     
>             if ( create_table(entry) )
>    -            return XEN_TABLE_MAP_FAILED;
>    +            return XEN_TABLE_MAP_NOMEM;
>         }
>     
>         if ( pte_is_mapping(*entry) )
>    @@ -209,7 +209,7 @@ static int pt_update_entry(mfn_t root, unsigned
>    long virt,
>         for ( ; level > target; level-- )
>         {
>             rc = pt_next_level(alloc_tbl, &table, offsets[level]);
>    -        if ( rc == XEN_TABLE_MAP_FAILED )
>    +        if ( (rc == XEN_TABLE_MAP_NONE) && (rc == XEN_TABLE_MAP_NOMEM)
>    )
>             {
>                 rc = 0;
> But the handling of XEN_TABLE_MAP_NONE and XEN_TABLE_MAP_NOMEM seems to
> me should be left the same as this one part of the code actually
> catching the case when create_table() returns -ENOMEM:
>    pt_next_level()
>    {
>    ...
>                if ( flags & (PTE_VALID | PTE_POPULATE) )
>                {
>                    dprintk(XENLOG_ERR,
>                            "%s: Unable to map level %u\n", __func__,
>    level);
>                    rc = -ENOMEM;
>                }

Except that you want to avoid "inventing" an error code when you were
handed one. Just consider what happens to this code if another -E...
could also come back from the helper.

Jan

