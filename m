Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C36E6988123
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 11:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806131.1217455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su74m-0003ty-HW; Fri, 27 Sep 2024 09:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806131.1217455; Fri, 27 Sep 2024 09:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su74m-0003rH-DP; Fri, 27 Sep 2024 09:15:48 +0000
Received: by outflank-mailman (input) for mailman id 806131;
 Fri, 27 Sep 2024 09:15:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1su74k-0003r8-Lh
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 09:15:46 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12fc5fda-7cb1-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 11:15:44 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so260442666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 02:15:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297b597sm106513766b.182.2024.09.27.02.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Sep 2024 02:15:43 -0700 (PDT)
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
X-Inumbo-ID: 12fc5fda-7cb1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727428544; x=1728033344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tP/HLZd2GPZBoFOILIhBuSAPuQLQBLA2KHNrQ1ungzQ=;
        b=Mb5G3e9sGI2QdnsDlP/LpAuxucHtNUZCqsrVT3M439e7MvNDE1aSovH6GZd/F48lpO
         ILEZWfgs/alRayWlr+4v6JBBpe3FaAung4DHKlitLZ0az8M+/QewZSxrgvX8UWznG2C/
         HoD66t8zNHF8fCTndjQzTx5yAiokmL5qowYJffMrvvzZ0jbjfWudQsh3qJsJBtDvW0Xe
         OXWFKAO7CRMnSYHpZHMzv5gwSTS+6HatKm00+O1I4w2RjSCZQI5S2SxRiTF7MxYtiMEC
         fefMx6nEtH/DL4OPzsZs975Y/Vqr84D6paF1Sx3YrN2FB3DiDYIjOXJWbXrdumK15CIc
         u0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727428544; x=1728033344;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tP/HLZd2GPZBoFOILIhBuSAPuQLQBLA2KHNrQ1ungzQ=;
        b=hYrW+By2aMr1OCqOtGz7V7UvfKOBvLgS5nU6SbjKjmLWBx1N4uy8A8CCN9pxiLMCZC
         /IarUn60YS+Mq7rShIe0QD3EarVHS4Fzb0i9I+2sAcOwm3b2x99mIZilJ45dcchd+iKj
         q09ajcwF2tbG22pm5aU3F9lTvbuBqMi+gh6hZfgxWjGasoLQkF1nxzx2sNI+3Z7MbUKF
         bj+BEa2R+cJTgQElznaI5qo2B6T+fJ40+QWk0PXMwuJHJJLdyt4JglJ0dvJYg7fysH9P
         ISbhM+PHpRUS+kV8165F+s4uMNO1y+HrScvqN8BI2/PfRcmA86fNNn7MNGWjcHtg4nco
         PLpA==
X-Forwarded-Encrypted: i=1; AJvYcCXkPRcweiGYkymxJcHfF0eKokem6kRzz1b+ZfWacKTRnYCnTBre/a7BeF/BVoi3CiYRBLlJh1BQvZw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwC5pOIPS39FK+T2p4N7+nCy3Qiwx/QZBJ4HryV+qnm2QOBaJG+
	U4NrIzJD37Ey5EcViwX6qfHRKP1ORV3NogN3gHAPqh7UQR2+4+K2xhxN789x6A==
X-Google-Smtp-Source: AGHT+IGvLePVBE/pnbKkIfPRgqo4bcZcqWacTXC1c5Mli1GjvAPbfBQ7lJmd0s3vCkzhD6GJbF2vBQ==
X-Received: by 2002:a17:907:e91:b0:a7d:c148:ec85 with SMTP id a640c23a62f3a-a93c4aa6b89mr225701466b.62.1727428543647;
        Fri, 27 Sep 2024 02:15:43 -0700 (PDT)
Message-ID: <c5b22604-5fa5-4034-8596-654be962ad84@suse.com>
Date: Fri, 27 Sep 2024 11:15:42 +0200
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
 <60dd2287-351c-4fd1-bf2d-00645342fc73@suse.com>
 <dc14add3e5daa4db91955127812b84fb03209831.camel@gmail.com>
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
In-Reply-To: <dc14add3e5daa4db91955127812b84fb03209831.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.09.2024 10:49, oleksii.kurochko@gmail.com wrote:
> On Wed, 2024-09-25 at 16:58 +0200, Jan Beulich wrote:
>> On 25.09.2024 16:50, oleksii.kurochko@gmail.com wrote:
>>> On Wed, 2024-09-25 at 16:22 +0200, Jan Beulich wrote:
>>>> On 25.09.2024 12:07, oleksii.kurochko@gmail.com wrote:
>>>>> On Tue, 2024-09-24 at 15:31 +0200, Jan Beulich wrote:
>>>>>> On 24.09.2024 13:30, oleksii.kurochko@gmail.com wrote:
>>>>>>> On Tue, 2024-09-24 at 12:49 +0200, Jan Beulich wrote:
>>>>>>>> On 13.09.2024 17:57, Oleksii Kurochko wrote:
>>>>>>>>> +static int pt_next_level(bool alloc_tbl, pte_t
>>>>>>>>> **table,
>>>>>>>>> unsigned
>>>>>>>>> int offset)
>>>>>>>>> +{
>>>>>>>>> +    pte_t *entry;
>>>>>>>>> +    mfn_t mfn;
>>>>>>>>> +
>>>>>>>>> +    entry = *table + offset;
>>>>>>>>> +
>>>>>>>>> +    if ( !pte_is_valid(*entry) )
>>>>>>>>> +    {
>>>>>>>>> +        if ( !alloc_tbl )
>>>>>>>>> +            return XEN_TABLE_MAP_FAILED;
>>>>>>>>> +
>>>>>>>>> +        if ( create_table(entry) )
>>>>>>>>> +            return XEN_TABLE_MAP_FAILED;
>>>>>>>>
>>>>>>>> You're still losing the -ENOMEM here.
>>>>>>> Agree, I will save the return value of create_table and
>>>>>>> return
>>>>>>> it.
>>>>>>
>>>>>> That won't work very well, will it? 
>>>>> I think it will work, just will be needed another one check in
>>>>> pt_update_entry() where pt_next_level() is called:
>>>>>         if ( (rc == XEN_TABLE_MAP_FAILED) || (rc == -ENOMEM) )
>>>>>         ...
>>>>
>>>> Yet that's precisely why I said "won't work very well": You're
>>>> now
>>>> having
>>>> rc in two entirely distinct number spaces (XEN_TABLE_MAP_* and -
>>>> E*).
>>>> That's imo just calling for trouble down the road. Unless you
>>>> emphasized
>>>> this aspect pretty well in a comment.
>>>>
>>>>>> Imo you need a new XEN_TABLE_MAP_NOMEM.
>>>>>> (And then XEN_TABLE_MAP_FAILED may want renaming to e.g.
>>>>>> XEN_TABLE_MAP_NONE).
>>>>> I am still curious if we really need this separation. If to in
>>>>> this
>>>>> way
>>>>> then it should be updated the check in pt_update_entry():
>>>>>    --- a/xen/arch/riscv/pt.c
>>>>>    +++ b/xen/arch/riscv/pt.c
>>>>>    @@ -165,10 +165,10 @@ static int pt_next_level(bool
>>>>> alloc_tbl,
>>>>> pte_t
>>>>>    **table, unsigned int offset)
>>>>>         if ( !pte_is_valid(*entry) )
>>>>>         {
>>>>>             if ( !alloc_tbl )
>>>>>    -            return XEN_TABLE_MAP_FAILED;
>>>>>    +            return XEN_TABLE_MAP_NONE;
>>>>>     
>>>>>             if ( create_table(entry) )
>>>>>    -            return XEN_TABLE_MAP_FAILED;
>>>>>    +            return XEN_TABLE_MAP_NOMEM;
>>>>>         }
>>>>>     
>>>>>         if ( pte_is_mapping(*entry) )
>>>>>    @@ -209,7 +209,7 @@ static int pt_update_entry(mfn_t root,
>>>>> unsigned
>>>>>    long virt,
>>>>>         for ( ; level > target; level-- )
>>>>>         {
>>>>>             rc = pt_next_level(alloc_tbl, &table,
>>>>> offsets[level]);
>>>>>    -        if ( rc == XEN_TABLE_MAP_FAILED )
>>>>>    +        if ( (rc == XEN_TABLE_MAP_NONE) && (rc ==
>>>>> XEN_TABLE_MAP_NOMEM)
>>>>>    )
>>>>>             {
>>>>>                 rc = 0;
>>>>> But the handling of XEN_TABLE_MAP_NONE and XEN_TABLE_MAP_NOMEM
>>>>> seems to
>>>>> me should be left the same as this one part of the code
>>>>> actually
>>>>> catching the case when create_table() returns -ENOMEM:
>>>>>    pt_next_level()
>>>>>    {
>>>>>    ...
>>>>>                if ( flags & (PTE_VALID | PTE_POPULATE) )
>>>>>                {
>>>>>                    dprintk(XENLOG_ERR,
>>>>>                            "%s: Unable to map level %u\n",
>>>>> __func__,
>>>>>    level);
>>>>>                    rc = -ENOMEM;
>>>>>                }
>>>>
>>>> Except that you want to avoid "inventing" an error code when you
>>>> were
>>>> handed one. Just consider what happens to this code if another -
>>>> E...
>>>> could also come back from the helper.
>>> I think we can drop the usage of -ENOMEM in the helper
>>> create_table()
>>> by returning XEN_TABLE_MAP_FAILED in case of failure, with a
>>> redefinition of XEN_TABLE_MAP_FAILED = 1, XEN_TABLE_SUPER_PAGE = 2,
>>> and
>>> XEN_TABLE_NORMAL = 3, as value 0 is used to indicate that
>>> everything is
>>> okay.
>>>
>>> We can leave the pt_update() code as it is now:
>>> ...
>>>             if ( flags & (PTE_VALID | PTE_POPULATE) )
>>>             {
>>>                 dprintk(XENLOG_ERR,
>>>                       "%s: Unable to map level %u\n", __func__,
>>> level);
>>>                 rc = -ENOMEM;
>>>             }
>>> ...
>>>
>>> Because for the end user, it's better to receive the error code
>>> from
>>> xen/errno.h rather than a custom error code introduced nearby the
>>> helper.
>>>
>>> Does it make sense?
>>
>> While I think I see where you're coming from, I still don't agree.
>> And
>> I never suggested to bubble up some custom error indication. Up the
>> call
>> chain it wants to be -ENOMEM, sure. Yet keying its generation to
>> flags & (PTE_VALID | PTE_POPULATE) is both less obvious and more
>> fragile
>> (towards future code changes) than keying it to rc ==
>> XEN_TABLE_MAP_NOMEM.
> I am not sure that (rc == XEN_TABLE_MAP_NOMEM) is equal to (flags &
> (PTE_VALID | PTE_POPULATE) as XEN_TABLE_MAP_NOMEM miss the case (flags
> & PTE_VALID) == 0 ( removing a mapping case ) and for which should be
> returned 0 but not -ENOMEM.

The intention is quite clear: Return -ENOMEM if and only if an allocation
failed. Hence why I think the XEN_TABLE_MAP_NOMEM approach is preferable.

Jan

