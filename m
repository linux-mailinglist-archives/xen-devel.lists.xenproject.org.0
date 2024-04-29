Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305C68B518C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 08:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713843.1114716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1KcU-0005Zj-Kv; Mon, 29 Apr 2024 06:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713843.1114716; Mon, 29 Apr 2024 06:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1KcU-0005Y4-IJ; Mon, 29 Apr 2024 06:36:10 +0000
Received: by outflank-mailman (input) for mailman id 713843;
 Mon, 29 Apr 2024 06:36:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1KcS-0005Xy-V5
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 06:36:09 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1654687-05f2-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 08:36:05 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55ebso17288475e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 28 Apr 2024 23:36:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v18-20020a5d43d2000000b0034a25339e47sm27712183wrr.69.2024.04.28.23.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Apr 2024 23:36:04 -0700 (PDT)
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
X-Inumbo-ID: c1654687-05f2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714372565; x=1714977365; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XiKox6psWFP4voir+vi13occAzVsW0lTkqE+j9P3CKg=;
        b=eOufIZNCPtBWK/9WHGC2xQF+kY/YhWjl3KSfQ+mnwljsmsLtJqJDp0lE1YVi+FG0EJ
         kI65jYfLHJQ1CyHrio7FVNHxf7FB7v5bbooWz06hcEpLDLCKCowHTyqBz10RyL080qDU
         kT+bOCOxgU+tVuHpcgYT3pKCQXpAREcHqQN8mdXsCp1rgWiD4Ygo0yvf4P1cQjui+JZF
         A7YUuNKQ/pIJko7e4OEZ/m5hgrggok+bmoTXLswkjZ4D1q8akiPCr/kd/STOPmA0FsCX
         CrEemRf/sgGJvlTXlceCUeJXqqTHjV3D4ysZsD3XyqZmkl2u96Y+9mGRonzdpWNE5ala
         nNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714372565; x=1714977365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiKox6psWFP4voir+vi13occAzVsW0lTkqE+j9P3CKg=;
        b=xEbtL4eksbFfYjIm5DI/OxYGXNbklT/K9sLHTLFLu0sutDrhC219u2hQt0TNYeiIdS
         IupWWBDPsgG/2kbc180hpPM/hQlRh92BjZMUMF8q4rgVVAeLtS1BPMeVqkY4oatbmjdr
         hFf6m467r3jiy7CoaZzni/KQwPJFIQqlHB/rw9Z4jLlRQUpvwreJ4qImpTnv0rK7C+4Q
         2NOqftskVe3OT6jSVxvxhq7FbvQUzLofsNnEKpKkaE/HpcTyS1sIg6gxqQTI/hGqdLsq
         50sCkE5MNBFbJy58V+AphyurUfCoKaTQUriel+1nkN+boZYzCF0Uh25tM6jAtLzKTR7g
         Ih9w==
X-Forwarded-Encrypted: i=1; AJvYcCUd5UsUapnwgOGhWax5N8WdLBi34JQ+NMkwkRXqDQGAzCkAQuKRcYXbhq0gn8nIv9Kmx2YtHmEq/xVkiWMi0J8F0Veh4lzOLWcnDGykU0I=
X-Gm-Message-State: AOJu0YxY4onuCtzmzxfhFEbhAQ1DgCFP8AVGMuka/1azk0DVOj3T6oMQ
	F44mfEavm1cmMWRccBfPIXnaq6mf3odDA5vI9eI5+ZEpnPzR6uVkD1mb8unpmg==
X-Google-Smtp-Source: AGHT+IHbpsbXTcbMPJOblm6CXkfgIHG17fRxzwbLZ+L3c2/m3rBvifbgsEkjNifkJuH8SLab8QtyLw==
X-Received: by 2002:a05:600c:4ecb:b0:418:b9fa:43e9 with SMTP id g11-20020a05600c4ecb00b00418b9fa43e9mr8514432wmq.29.1714372565211;
        Sun, 28 Apr 2024 23:36:05 -0700 (PDT)
Message-ID: <7a28d950-e3de-465d-9f0d-044598e356db@suse.com>
Date: Mon, 29 Apr 2024 08:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/spinlock: use correct pointer
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240425204547.658536-1-stewart.hildebrand@amd.com>
 <08165a0d-d8ee-4405-ba04-e1cfb51489b4@suse.com>
 <261fce46-56e9-4a7e-8f2f-b741bf5b8251@amd.com>
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
In-Reply-To: <261fce46-56e9-4a7e-8f2f-b741bf5b8251@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2024 16:33, Stewart Hildebrand wrote:
> On 4/26/24 02:31, Jan Beulich wrote:
>> On 25.04.2024 22:45, Stewart Hildebrand wrote:
>>> The ->profile member is at different offsets in struct rspinlock and
>>> struct spinlock. When initializing the profiling bits of an rspinlock,
>>> an unrelated member in struct rspinlock was being overwritten, leading
>>> to mild havoc. Use the correct pointer.
>>>
>>> Fixes: b053075d1a7b ("xen/spinlock: make struct lock_profile rspinlock_t aware")
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks!
> 
>>
>>> --- a/xen/common/spinlock.c
>>> +++ b/xen/common/spinlock.c
>>> @@ -789,7 +789,11 @@ static int __init cf_check lock_prof_init(void)
>>>      {
>>>          (*q)->next = lock_profile_glb_q.elem_q;
>>>          lock_profile_glb_q.elem_q = *q;
>>> -        (*q)->ptr.lock->profile = *q;
>>> +
>>> +        if ( (*q)->is_rlock )
>>> +            (*q)->ptr.rlock->profile = *q;
>>> +        else
>>> +            (*q)->ptr.lock->profile = *q;
>>>      }
>>>  
>>>      _lock_profile_register_struct(LOCKPROF_TYPE_GLOBAL,
>>
>> Just to mention it: Strictly speaking spinlock_profile_print_elem()'s
>>
>>     printk("%s: addr=%p, lockval=%08x, ", data->name, data->ptr.lock, lockval);
>>
>> isn't quite right either (and I would be surprised if Misra didn't have
>> to say something about it).
> 
> I'd be happy to send a patch for that instance, too. Would you like a
> Reported-by: tag?

I'm inclined to say no, not worth it, but it's really up to you. In fact
I'm not sure we need to change that; it all depends on whether ...

> That patch would look something like:
> 
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -637,22 +637,25 @@ static void cf_check spinlock_profile_print_elem(struct lock_profile *data,
>  {
>      unsigned int cpu;
>      unsigned int lockval;
> +    void *lockaddr;
>  
>      if ( data->is_rlock )
>      {
>          cpu = data->ptr.rlock->debug.cpu;
>          lockval = data->ptr.rlock->tickets.head_tail;
> +        lockaddr = data->ptr.rlock;
>      }
>      else
>      {
>          cpu = data->ptr.lock->debug.cpu;
>          lockval = data->ptr.lock->tickets.head_tail;
> +        lockaddr = data->ptr.lock;
>      }
>  
>      printk("%s ", lock_profile_ancs[type].name);
>      if ( type != LOCKPROF_TYPE_GLOBAL )
>          printk("%d ", idx);
> -    printk("%s: addr=%p, lockval=%08x, ", data->name, data->ptr.lock, lockval);
> +    printk("%s: addr=%p, lockval=%08x, ", data->name, lockaddr, lockval);
>      if ( cpu == SPINLOCK_NO_CPU )
>          printk("not locked\n");
>      else
> 
> 
> That case is benign since the pointer is not dereferenced. So the
> rationale would primarily be for consistency (and possibly satisfying
> Misra).

... Misra takes issue with the "wrong" member of a union being used,
which iirc is UB, but which I'm afraid elsewhere we do all the time.

Jan

