Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DBE87ECF4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 17:06:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694863.1084047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFUj-0004bq-Lv; Mon, 18 Mar 2024 16:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694863.1084047; Mon, 18 Mar 2024 16:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmFUj-0004ZR-IE; Mon, 18 Mar 2024 16:05:49 +0000
Received: by outflank-mailman (input) for mailman id 694863;
 Mon, 18 Mar 2024 16:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmFUh-0004Yz-U3
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 16:05:47 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 610bd5d8-e541-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 17:05:46 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a46cd9e7fcaso100705266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 09:05:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dv22-20020a170906b81600b00a4658d3e405sm4957398ejb.196.2024.03.18.09.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 09:05:45 -0700 (PDT)
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
X-Inumbo-ID: 610bd5d8-e541-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710777945; x=1711382745; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1kaXoK3SUR4iTYqjbzRn2UcjiCElS90ElTBpcj+RZo=;
        b=MSRmooaf2x/7Nr+T6M0Za9NvsBI1TetfqTxsH8++Uyjwt+/7q0xUE5fi3wZLf0sDkA
         TqcwGpx6esxKZe5WqLxTAd2EB3NDJuKUezfiBrBqyawUC+d6Dn6wBTGNXmcxPSIClIho
         aJN/yHYWfNrL/+OA74RZmhEDUTnUkhzRAGGObjhXP5PMjKCM8LndHDMhqbsfz9GHtZ+o
         c/7AT1wADt1f/qe164LPtECRbCweqXrc71RB2oWXqoP1koQ6SO5rdZttiJ62YPQNsgT6
         kzdSKAVfK0jXI9in7u8vack5hGofNozxRJO2lnkotE2opPPMNnitxlSnymeex50vtz/X
         ML6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710777945; x=1711382745;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1kaXoK3SUR4iTYqjbzRn2UcjiCElS90ElTBpcj+RZo=;
        b=dkqxULSINoZBZlXE2ZJyEgOG5hJIiwP0H5mI/oy22c0pwXJLR7413h/6bzImwlnpR3
         AsGS21ouL5WvZUmDhEkkV2I9bSgTajGL0gGipTfD72jj9tCBIjYn6Yzfu5gmNwvKK8M8
         tQZWF9LpYOc/SA09uLgiQiZQiVR+KsA4eSK0IfYnDySVTVTxVbxfDHtBBcdGD9bqqSKM
         nJAP0MW4TXvjMCx/oVab8QO8u45F4Sz4z+pj8uSpjM8App190EvzSxGAJFtx/p85q6Y5
         IcL2E76b++j4Eo7mvy9swL8C8AAxBrq0ZPpBr4HDLblDy93GMymoP49+dPjQoSMFGvdY
         60zg==
X-Forwarded-Encrypted: i=1; AJvYcCWq1ccVRyRHFuI1/BW+EEekN0rEoa44T7SafvvvtTd8RfaaYhHjF9DWCAQyZJ8+SDVOWyeNTuLXCrs71WgxD7GDEGGTKuNNCNfJ27zxNYU=
X-Gm-Message-State: AOJu0Yy5rAJ5E2cqqDqokBxWA9SF2F+wkyBs5ZGqF27K7gImPTY1TBF8
	q1e6JYUUeUCbrkM7sWQMv3UctvbZ1d9C8pX7h86auNT9k7VeN3Sr6lI9O7TepA==
X-Google-Smtp-Source: AGHT+IEUdqe5I5inMx1UaOtuFgeHcDz3cyO9deCle21EK7vp7RHvtkYgzCbhaLGtkMLxSf4VVsDVFw==
X-Received: by 2002:a17:906:bf4a:b0:a46:7794:2c00 with SMTP id ps10-20020a170906bf4a00b00a4677942c00mr9878572ejb.40.1710777945510;
        Mon, 18 Mar 2024 09:05:45 -0700 (PDT)
Message-ID: <f7dbd4e6-af89-4ede-86d7-55a696345f00@suse.com>
Date: Mon, 18 Mar 2024 17:05:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/13] xen/rwlock: raise the number of possible cpus
Content-Language: en-US
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-13-jgross@suse.com>
 <fc1b15e7-8ffc-4bc5-90dd-9f501a0e169d@suse.com>
 <4ee88d53-4b2f-4768-951c-7080680df337@suse.com>
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
In-Reply-To: <4ee88d53-4b2f-4768-951c-7080680df337@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2024 17:00, Jürgen Groß wrote:
> On 18.03.24 16:39, Jan Beulich wrote:
>> On 14.03.2024 08:20, Juergen Gross wrote:
>>> @@ -36,14 +36,16 @@ void queue_write_lock_slowpath(rwlock_t *lock);
>>>   
>>>   static inline bool _is_write_locked_by_me(unsigned int cnts)
>>>   {
>>> -    BUILD_BUG_ON(_QW_CPUMASK < NR_CPUS);
>>> +    BUILD_BUG_ON((_QW_CPUMASK + 1) < NR_CPUS);
>>> +    BUILD_BUG_ON(NR_CPUS * _QR_BIAS > INT_MAX);
>>>       return (cnts & _QW_WMASK) == _QW_LOCKED &&
>>>              (cnts & _QW_CPUMASK) == smp_processor_id();
>>>   }
>>>   
>>>   static inline bool _can_read_lock(unsigned int cnts)
>>>   {
>>> -    return !(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts);
>>> +    return cnts <= INT_MAX &&
>>> +           (!(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts));
>>>   }
>>
>> I view this as problematic: Code knowing that a write lock is being held
>> may invoke a function using read_trylock() and expect the lock to be
>> available there.
> 
> So you expect it to be fine that someone is using read_trylock() 32768 times
> recursively while holding a lock as a writer? Sure, I can change the condition,
> but OTOH ...

Hmm, yes, the reader count (leaving aside nested read_trylock()) is zero
when the lock is held for writing. So yes, I agree the condition is fine,
but may I ask for a brief comment to this effect, for blind people like
me?

Jan

