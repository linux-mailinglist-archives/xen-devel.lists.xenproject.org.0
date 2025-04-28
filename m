Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDC5A9E866
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 08:41:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970074.1358851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9IBT-00033W-AQ; Mon, 28 Apr 2025 06:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970074.1358851; Mon, 28 Apr 2025 06:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9IBT-00030S-7X; Mon, 28 Apr 2025 06:41:43 +0000
Received: by outflank-mailman (input) for mailman id 970074;
 Mon, 28 Apr 2025 06:41:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9IBS-00030M-Cs
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 06:41:42 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d786ad29-23fb-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 08:41:41 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso20319885e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 27 Apr 2025 23:41:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2e06d8sm148460075e9.39.2025.04.27.23.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Apr 2025 23:41:40 -0700 (PDT)
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
X-Inumbo-ID: d786ad29-23fb-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745822500; x=1746427300; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sMzx2AI1AjHqyseW5Ep3Xvb3Z9jwIQZtti7TEMb+XJg=;
        b=JkyZI8pSnfdd14C1CyqHSCy/AzaRZi8pwFv/gRK+ZvF6i0SK9aRHoNASlTVDRLoZ1H
         P0oVNUqQtPUfaBAc5K2HRxnmmocYi8NHiTnyNO52tZ1bUtqR00r6MdLPZrao0KXx4MTo
         42liJaecrym/J+wkqqnNAnn52GTLR8rG+BIs70hb0WkUb70/jJNcoC9DsFfxa9zHTyPx
         cMCPYjrNM5T0IN2aKHMTJ5S9D6qN0LE9hrf+rSyB+g66hNJI3VV3fBl8Yj1uABZ2aMAm
         IK95UxsHDM1N+S9Tg8RqDXu9p6A0chf9xcoiKtOlKORTAEveTeBkT7/D5Lg6WLnJjlZS
         NLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822500; x=1746427300;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMzx2AI1AjHqyseW5Ep3Xvb3Z9jwIQZtti7TEMb+XJg=;
        b=WYD3pSoCr/6La+KlWy3IhiKiO9k17x6lP/ualrkV0USXsrpHbXTgPrr22DA0hsQRpz
         HAsPZ2KnfWi7xEzPogcYHzVNi/6+9Zghlhcy7xXXa6hC++ZmkNiHz9Ec/rSP/WibhCZ1
         xJ19jDVH0ZJbZpDTBUjBDqanmNh1d7KdTxO+FM3U0+XQK4ZlI/KaNUC5gtivlcNdSJ+/
         n8JGk8akwhsv2wfy+ID/lDbMDRWl+HWHnUvha2cJedLPUyWr6zpCy+Pss65P3+SPu9sb
         uSWx4giD2qMOzi7irkn8GX1GZbUP+rx4zZw4kuKnQX/QqcE0zY0ii2+fvY1vARdti+lI
         8drQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjge+kMBKJPKqwQBOzdV6+FwuSXPSeiRZaGu4Bh9HvaWwkLA3sft69BYV7+nFq5dfLYw6RuQifIt4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgtXHIwo1ZCwtLRjipzlOeHiqE6kzlGnzoxeJQKFzB2sjA7G3G
	BLqTDSwiVkD2+0IN8zAUCnFy19mPf74BfpJ9cQp413a4fD2LXSlcyTCq8Nsssw==
X-Gm-Gg: ASbGncv3aO+j1UYQXzTRPEuw+KpzHpFMrmIV7xag8NgEyiZxIu7st5QFxYPKf0Wm4gG
	mOPL8yxqHbEOftytzBlExhDYLryjIWZ5kWSz4v6GT2N0kX7GhuISRCsqWWigjNjDBdt3KfmGUlL
	U5yXL0ccUmCMF8wSib74FllRgt+X4THftwXDNIgB0BtEklU5sHHH10xa44MVLqSy1udhFQJv6ZC
	hfCEB0Gz84PtIEtbTMZYgEf1icPLQSX9kZA4Z9sZyJDH5HGZsgZ7bkXZv/XEDJOp85ioeBq5Da4
	PPsAz3robNN82ntkZxdPB5jxhm5wRPZgxp+hSrinyJyld43bWHNqxAmXTi+rA+rn0qIdEwG/USW
	w1OcCEOpGTXVFHwzTuBsgsEboJQ==
X-Google-Smtp-Source: AGHT+IEyW5BiKqCESdQ9aYZfZxA5BjyDvmL2TBRtlmJARX329C6LJ0bLETQ5M7ilKts/vq3E8DeW7w==
X-Received: by 2002:a05:600c:154c:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-440a66ac6c9mr76958725e9.33.1745822500308;
        Sun, 27 Apr 2025 23:41:40 -0700 (PDT)
Message-ID: <f179661d-5487-421d-b033-41d5d51591c1@suse.com>
Date: Mon, 28 Apr 2025 08:41:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 33/38] x86/boot: refactor bzimage parser to be re-enterant
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: stefano.stabellini@amd.com, agarciav@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
 <20250419220820.4234-34-dpsmith@apertussolutions.com>
 <bba25fca-171a-47dd-881b-4746d76bd16a@amd.com>
 <e7894126-d639-4a9c-b600-2287efe6666d@apertussolutions.com>
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
In-Reply-To: <e7894126-d639-4a9c-b600-2287efe6666d@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.04.2025 03:53, Daniel P. Smith wrote:
> On 4/23/25 15:27, Jason Andryuk wrote:
>> On 2025-04-19 18:08, Daniel P. Smith wrote:
>>> The bzimage logic uses the unit global orig_image_len to hold the 
>>> original
>>> module length for the kernel when the headroom is calculated. It then 
>>> uses
>>> orig_image_len to locate the start of the bzimage when the expansion 
>>> is done.
>>> This is an issue when more than one bzimage is processed by the headroom
>>> calculation logic, as it will leave orig_image_len set to the length 
>>> of the
>>> last bzimage it processed.
>>>
>>> The boot module work introduced storing the headroom size on a per module
>>> basis. By passing in the headroom from the boot module, orig_image_len 
>>> is no
>>> longer needed to locate the beginning of the bzimage after the allocated
>>> headroom. The bzimage functions are reworked as such, allowing the 
>>> removal of
>>> orig_image_len and enabling them to be reused by multiple kernel boot 
>>> modules.
>>>
>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>>> ---
>>>   xen/arch/x86/bzimage.c             | 38 ++++++++++++++++++------------
>>>   xen/arch/x86/hvm/dom_build.c       |  3 ++-
>>>   xen/arch/x86/include/asm/bzimage.h |  5 ++--
>>>   xen/arch/x86/pv/dom0_build.c       |  3 ++-
>>>   4 files changed, 30 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
>>> index 66f648f311e4..32f0360d25b4 100644
>>
>>> @@ -103,13 +100,20 @@ unsigned long __init bzimage_headroom(void 
>>> *image_start,
>>>       return headroom;
>>>   }
>>> -int __init bzimage_parse(void *image_base, void **image_start,
>>> -                         unsigned long *image_len)
>>> +int __init bzimage_parse(
>>> +    void *image_base, void **image_start, unsigned long headroom,
>>> +    unsigned long *image_len)
>>>   {
>>>       struct setup_header *hdr = (struct setup_header *)(*image_start);
>>>       int err = bzimage_check(hdr, *image_len);
>>> -    unsigned long output_len;
>>> -
>>> +    unsigned long module_len = *image_len;
>>> +
>>> +    /*
>>> +     * Variable err will have one of three values:
>>> +     *   -  < 0: a error occurred trying to inspect the contents
>>> +     *   -  > 0: the image is a bzImage
>>> +     *   - == 0: not a bzImage, could be raw elf or elf.gz (vmlinuz.gz)
>>> +     */
>>
>> This comment seems a little independent of this change, so maybe it 
>> should be submitted separately.  Also, I think a better placement would 
>> be next to bzimage_check().
>>
>>>       if ( err < 0 )
>>>           return err;
>>> @@ -118,21 +122,25 @@ int __init bzimage_parse(void *image_base, void 
>>> **image_start,
>>>           *image_start += (hdr->setup_sects + 1) * 512 + hdr- 
>>>> payload_offset;
>>>           *image_len = hdr->payload_length;
>>
>> @here
>>
>>>       }
>>> -
>>> -    if ( elf_is_elfbinary(*image_start, *image_len) )
>>> -        return 0;
>>> +    else
>>> +    {
>>> +        if ( elf_is_elfbinary(*image_start, *image_len) )
>>> +            return 0;
>>> +        else
>>> +            *image_len = *image_len - headroom;
>>> +    }
>>
>> I don't like this extra indention which includes the return.  If you 
>> retain orig_image_len as a local variable, and set it above at "@here", 
>> you can have a smaller diff and leave cleaner logic.
> 
> Right, but I find it sillier to be checking every kernel for elf when we 
> know it's a bzImage. While the elf check is fairly simplistic, it is 
> still multiple value checks.

Even without any extra local vars the above can be

    else if ( elf_is_elfbinary(*image_start, *image_len) )
        return 0;
    else
        *image_len = *image_len - headroom;

which would already address the "extra indentation" aspect.

Jan

