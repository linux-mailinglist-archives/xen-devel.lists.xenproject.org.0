Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB7A87ECE4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694853.1084018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFOm-00013c-JH; Mon, 18 Mar 2024 15:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694853.1084018; Mon, 18 Mar 2024 15:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFOm-00010d-Fb; Mon, 18 Mar 2024 15:59:40 +0000
Received: by outflank-mailman (input) for mailman id 694853;
 Mon, 18 Mar 2024 15:59:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmFOl-00010X-1n
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 15:59:39 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8530ad81-e540-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 16:59:37 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56b84b2c8c8so829662a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 08:59:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s26-20020a170906a19a00b00a46b121050dsm2053101ejy.77.2024.03.18.08.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 08:59:36 -0700 (PDT)
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
X-Inumbo-ID: 8530ad81-e540-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710777576; x=1711382376; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A++HtnT2NUb2uEOgnpsY9lobpOMCAqc3GDVnBETfZMc=;
        b=Q3B/y4HGAyQha7qcUzPsjcByhmO5sVIjCsaokgqDbef1zONdeIsYEBaBQ37ZZCggQX
         iK0NWQJ1RINZSLQ05qiDycKVvBS4ORmy+S4kNYwtlrmYvxrXu4trfsklELKsqIUu4BWy
         W1FNrok/vRNnzv5G1ZWR/Ypi9zTMtmEMezYq+DVmp1SPs0NILdvBEv0GEitTv4ywXZtU
         x7qyrJK7fS6KUDclTrxDLjmlEFBoQFjjvyYK3SVhGJZOCf3y1oW/2GtTYhtC/TcbS9TD
         6OIKdOWwc3oy9v5IaeAfTqGBQagx8QyOT4fg20WXKAry72h8jYPHDu0DdFWtWjh3MLaO
         2o3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710777576; x=1711382376;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A++HtnT2NUb2uEOgnpsY9lobpOMCAqc3GDVnBETfZMc=;
        b=mAOPMl92ic4P8sXc5L3jAxGyCQN0z8Bh5KVtEfN9iYju/L4lg9TUGscXe1Iuw7zg5J
         pNgZUoYIwwIjLcMrQTJord877UnnQ+m5PRjC2gB06jxCNVAznZ61/jjOGWTW9NvOUSxs
         sJzkzev8Otn0SePp5bkeVCFo2vjsW8xB6Qi02/V2SKPpDHG5CJrOwRdzEbWHL0V6IWiM
         lMtoHL6LIJgnLHSbV0NwAETp+fdSu3CD5/WAk8jJ4vROTxSFAaqNgSYx2Vo2CojUNXO3
         gUUW+dob9S+EllP4FiA3+EzDabR4+E8U5QhhK42zkqneB+8os13zrndRZJVbnGrQ8MbG
         7oQA==
X-Forwarded-Encrypted: i=1; AJvYcCUQi4rZIOng89c/KGA3OxQK+p9GeMON2WwaYJbWCIsx+jSFwXO7CeKtgjKFaJKqyidR8Ks1SgnhFWnuKtr9iuuqrIJxStWZRXnVt8Wb3gI=
X-Gm-Message-State: AOJu0YzabzjCzEAjPJ09OiFGkdrrFJIqF6yorZePgkWQvb65xs4Dl68B
	LlLRZg6zH7V4yqsmB486asjK8a83JZ/C5n0EwPuNvUlFpy4iQCmlQ06Y7qaUUg==
X-Google-Smtp-Source: AGHT+IEOZ7FMs0FizW0n6nMFA7ICUb2dOufDIafp9z/K9qTD8P80D71KXeS41NeISMmFr6wuLCH3vQ==
X-Received: by 2002:a17:906:6a13:b0:a46:5dff:bf26 with SMTP id qw19-20020a1709066a1300b00a465dffbf26mr9226036ejc.8.1710777576702;
        Mon, 18 Mar 2024 08:59:36 -0700 (PDT)
Message-ID: <1ac7b3cd-2f61-4c13-8cac-f74f953ffb08@suse.com>
Date: Mon, 18 Mar 2024 16:59:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen/spinlock: add
 rspin_[un]lock_irq[save|restore]()
Content-Language: en-US
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-5-jgross@suse.com>
 <1b8417b8-93aa-4976-a27a-701cfdf183b4@suse.com>
 <39e1f192-9790-49da-8f33-1eeb6a245539@suse.com>
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
In-Reply-To: <39e1f192-9790-49da-8f33-1eeb6a245539@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2024 16:55, Jürgen Groß wrote:
> On 18.03.24 15:43, Jan Beulich wrote:
>> On 14.03.2024 08:20, Juergen Gross wrote:
>>> Instead of special casing rspin_lock_irqsave() and
>>> rspin_unlock_irqrestore() for the console lock, add those functions
>>> to spinlock handling and use them where needed.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with two remarks:
>>
>>> --- a/xen/common/spinlock.c
>>> +++ b/xen/common/spinlock.c
>>> @@ -475,15 +475,31 @@ void _rspin_lock(rspinlock_t *lock)
>>>       lock->recurse_cnt++;
>>>   }
>>>   
>>> +unsigned long _rspin_lock_irqsave(rspinlock_t *lock)
>>> +{
>>> +    unsigned long flags;
>>> +
>>> +    local_irq_save(flags);
>>> +    _rspin_lock(lock);
>>> +
>>> +    return flags;
>>> +}
>>> +
>>>   void _rspin_unlock(rspinlock_t *lock)
>>>   {
>>>       if ( likely(--lock->recurse_cnt == 0) )
>>>       {
>>>           lock->recurse_cpu = SPINLOCK_NO_CPU;
>>> -        spin_unlock(lock);
>>> +        _spin_unlock(lock);
>>
>> This looks like an unrelated change. I think I can guess the purpose, but
>> it would be nice if such along-the-way changes could be mentioned in the
>> description.
> 
> I think it would be better to move that change to patch 3.

Hmm, it would be a secondary change there, too. I was actually meaning to
commit patches 2-5, but if things want moving around I guess I better
wait with doing so?

Jan

