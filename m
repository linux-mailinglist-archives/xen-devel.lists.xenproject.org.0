Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C87DE95883A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 15:47:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780455.1190070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPCT-00068y-EZ; Tue, 20 Aug 2024 13:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780455.1190070; Tue, 20 Aug 2024 13:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgPCT-00066I-Bn; Tue, 20 Aug 2024 13:47:05 +0000
Received: by outflank-mailman (input) for mailman id 780455;
 Tue, 20 Aug 2024 13:47:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgPCS-00066C-5l
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 13:47:04 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae258ce3-5efa-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 15:47:03 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a7a975fb47eso631188866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 06:47:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a838396c178sm759130266b.202.2024.08.20.06.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 06:47:02 -0700 (PDT)
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
X-Inumbo-ID: ae258ce3-5efa-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724161622; x=1724766422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qx39jQkVDuFQdAxWBhSWQM9E4QZeP7z6jVAwE7itU24=;
        b=FD2S4hcsjpd0dtvxqVaqiId4ssCOSnlpfLUFmgZX8kOfzi7ZRj7Slih/eEQ+DRssB/
         lcMq+8PqTpBxfPelm+TKusD71QzTmg4xjJCokJfO+E6URow7TavmCMZggHIyNKLzeBcJ
         Gc7/hBJI9FrEvx1fkbEp0BcVkwkFZn+bxlpDxmtswol8PlLBSPILoFLM4DX9e+aijjDW
         ch7renhT4JT6Pl80+vb0LQMUobh+rcWu0n1eFHxxqv4UZOZw5v5ZlqOtWAAOt1NcaYNv
         TlkE9pT5E1HoB3jBjVmbkZE2pSYQ8rEgAjhdyK3ceTJ7XhDnFoRYPn7Oh7nVe/Ixm3u9
         Hg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724161622; x=1724766422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qx39jQkVDuFQdAxWBhSWQM9E4QZeP7z6jVAwE7itU24=;
        b=d/PisSVGclWPOIRyOezmWi0nQqvb/efW1tiZLrIn1Pb2SLUipLi89iCgU0POlImBKb
         CQ6m/Mtuilx6iKflY7csykUUHcEdha0ZobIUfCeHqmgbHsaBD0d40Nf17GeVK/C14HXn
         /FlpQw/iaRT/PEGAldnMNQBZmbnK2PVnMdjlED3C09Rd0BEc3mgl+frd4BXsWbGwAYjR
         +j+8fsgS28oJtfTFgRXYucT4FWtaNnfTcIqDdGtzInkYRNBV55Zy+qEeGy5Is34/j1Lj
         dpQkzoSmz6ta4m/yIHBtpMWXUaaCVN8nTWIkUJAh2zROkY0priU6Ot1rvI5qNzpi1Z4X
         wv9A==
X-Forwarded-Encrypted: i=1; AJvYcCU8M83cOKz9EZkYpnT1gdiZzV2VxpBE2GsTYaM6bpi/kJk42cbO+K1ZTAGqF75Y8dcggo4lrGxWl6oiBOTffrQajKumzFP51CooS3FzsAo=
X-Gm-Message-State: AOJu0YxK6Gx4mhe0wYCAZsFRwq5fr8Ppxzu8LL/8vPRFutDvza2YcUx4
	+rf2zpG1DTWy7Tyo60gbD5Y0gZAwwhnGtKH8r454cCvzr2D5eTCezl+WJ900EA==
X-Google-Smtp-Source: AGHT+IFCaxc8u/TwGth0UEf9YVkfa4TGMmnQnPxC0iRifsk3DZbuvCz4xTY20em0sfXiyYHmOdZQTw==
X-Received: by 2002:a17:907:948a:b0:a80:f7db:3e7 with SMTP id a640c23a62f3a-a83928a995cmr966275866b.5.1724161622284;
        Tue, 20 Aug 2024 06:47:02 -0700 (PDT)
Message-ID: <4a7f44ce-e5ba-4a36-9b0b-7cd7c14cc846@suse.com>
Date: Tue, 20 Aug 2024 15:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] xen/riscv: page table handling
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
 <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
 <1551cd4dd3b5fcf6aea59a972b60fa6b3b06bed6.camel@gmail.com>
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
In-Reply-To: <1551cd4dd3b5fcf6aea59a972b60fa6b3b06bed6.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.08.2024 15:18, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-13 at 12:31 +0200, Jan Beulich wrote:
>>> + * Sanity check of the entry
>>> + * mfn is not valid and we are not populating page table. This
>>> means
>>
>> How does this fit with ...
>>
>>> + * we either modify entry or remove an entry.
>>> + */
>>> +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int
>>> flags)
>>> +{
>>> +    /* Sanity check when modifying an entry. */
>>> +    if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) )
>>
>> ... the MFN check here? And why is (valid,INVALID_MFN) an indication
>> of a modification?
> Because as mentioned here:
> ```
> /*
>  * If `mfn` equals `INVALID_MFN`, it indicates that the following page
> table
>  * update operation might be related to either populating the table,
>  * destroying a mapping, or modifying an existing mapping.
>  */
> static int pt_update(unsigned long virt,
> ```

That's in the description of another function. How would one know that
the rules on (mfn,flags) tuples there would apply here as well, without
you saying so explicitly? It may not be necessary to repeat the other
comment, but at least you want to reference it.

> And so if requested flags are PTE_VALID ( present ) and mfn=INVALID it
> will mean that we are going to modify an entry.
> 
> 
>> But then ...
>>
>>> +    {
>>> +        /* We don't allow modifying an invalid entry. */
>>> +        if ( !pte_is_valid(entry) )
>>> +        {
>>> +            printk("Modifying invalid entry is not allowed.\n");
>>> +            return false;
>>> +        }
>>
>> ... I also don't understand what this is about. IOW I'm afraid I'm
>> still confused about the purpose of this function as well as the
>> transitions you want to permit / reject. 
> In the case if the caller call modify_xen_mappings() on a region that
> doesn't exist.

Perhaps. What I think is missing is a clear statement somewhere to describe
what the various combinations of (mfn,flags) mean, in terms of the operation
to be carried out. This may then also help with ...

>> I wonder whether the
>> flags & PTE_VALID and pte_is_valid(entry) aren't in need of swapping.
> I am not sure that I understand what you mean.

... this: It's hard to see what cannot be understood about my earlier
comment. In the code commented on you have a flags & PTE_VALID check and a
pte_is_valid(entry) one. I'm wondering whether the two simply are the wrong
way round.

>>> +/* Update an entry at the level @target. */
>>> +static int pt_update_entry(mfn_t root, unsigned long virt,
>>> +                           mfn_t mfn, unsigned int target,
>>> +                           unsigned int flags)
>>> +{
>>> +    int rc;
>>> +    unsigned int level = HYP_PT_ROOT_LEVEL;
>>> +    pte_t *table;
>>> +    /*
>>> +     * The intermediate page tables are read-only when the MFN is
>>> not valid
>>> +     * and we are not populating page table.
>>
>> The way flags are handled in PTEs, how can page tables be read-only?
> This is not needed for everyone case. In case of entry removing an
> intermediate page table should be created in case when the user is
> trying to remove a mapping that doesn't exist.

I don't follow: For one, how is this related to "read-only"-ness? And
then, why would any kind of removal, whether of a present or non-
present mapping, ever result in page tables being created?

>>> +     * This means we either modify permissions or remove an entry.
>>
>> From all I can determine we also get here when making brand new
>> entries.
>> What am I overlooking?
> Yes, but in this case an intermediate page tables should be read_only,
> so alloc_only will be true and it will be allowed to create new
> intermediate page table.

Hmm, so instead of "read-only" do you maybe mean page tables are not
supposed to be modified? There's a difference here: When they're
read-only, you can't write to them (or a fault will result). Whereas
when in principle they can be modified, there still may be a rule
saying "in this case they shouldn't be altered".

Jan

