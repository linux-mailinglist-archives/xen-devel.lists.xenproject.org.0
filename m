Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A37D5904EC1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 11:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739012.1145907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJuB-0007hp-Ej; Wed, 12 Jun 2024 09:04:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739012.1145907; Wed, 12 Jun 2024 09:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJuB-0007gK-Br; Wed, 12 Jun 2024 09:04:31 +0000
Received: by outflank-mailman (input) for mailman id 739012;
 Wed, 12 Jun 2024 09:04:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHJuA-0007gE-ES
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 09:04:30 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c648c2e4-289a-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 11:04:29 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a6f0c3d0792so240954566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 02:04:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f266884c5sm301465166b.29.2024.06.12.02.04.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 02:04:28 -0700 (PDT)
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
X-Inumbo-ID: c648c2e4-289a-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718183068; x=1718787868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wcm5F37KeemHjaSK5yrqiqOX4fxzpUOyJ0KEJrS0kh4=;
        b=OPY3+VKaJt0Ce6r4EGlquvUmHVNPncSygNs3Y08vwtXP2Daqz6DAk2b/7+f7OF9CCa
         f7pozHSdgSq86VwPb4qVr8uGyozDXx5k6gEvcQNaW+U+BvTuqgWef0Rd5wSQjyr5rQyY
         SdALkSZzb9t6Kutg9VsT6cPhGi9EAgzLrbNzNwNnCsDFcHMSxIdLwAsn2wEY+YHB+4k5
         ic4pf2/LLGIYXJZ5cw4Hs4IRxsNGI/sOWzYzWedPDCHPEtGvwi1wXg/Sgc3fQ93lQLQn
         yH9COf3eclJLS7Ug0bhLCIwLnPyrw0AsujejPwChtt56z99+DBbKK76k2rYKngz0XV/u
         idoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718183068; x=1718787868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wcm5F37KeemHjaSK5yrqiqOX4fxzpUOyJ0KEJrS0kh4=;
        b=pcxC6zWNTF2vj8GoRSanAN+FovvGzwj5v+pFT2LGvvdDmU7vcVQBQnddM/xXbWMSyr
         BaIxT/wU59mLoBo6c6F0fsa3Fbp+7rGVXxjRFV2Qc+NaLkO5MaXgTFJrhSyTHgFuqR3g
         wqdbP6aPcKubPm1JWEdOnJ0bjjoZFdISJ9T56boVOaITcb4ofvTPajJPy+cohWewwLfe
         54sY9npPbbjdJ/9M5Uvim9VsEonxlddiqpPLvDUDdELCTq9PB+p5vAONt89PlO1TgCiw
         lfYd3KB0IUBHL5CzT63hZGnalHEItawp6ywg6sJrrR0275lmVIBoJdWxn5wYI6ncKaH4
         9eoA==
X-Forwarded-Encrypted: i=1; AJvYcCXtacVgjkgESqehzzYE6wQeZ5vsaMQxCTtjUox994ClmzuFm6l3Yh6WPt+qFKM5a80rT8h1o0Ge4cegAWjVhWWVxAc4tsyu62BIy0avp0U=
X-Gm-Message-State: AOJu0YxcgR6D8xr7LoA+jBB9OY/YnbbUW5r5Wt6Ul++Vxi+5oVj8WgEh
	CpZxVHRONUjhUJ/FosMLL+44KEIlmDTJTH/i6WaNCM5tkPd/tGXZkK9E4OVKtA==
X-Google-Smtp-Source: AGHT+IESfo6cyxU+RqY/Xv8Z0T+s9lNVJ3IE7AApxpz3Flox2Cpp4Q1n7VERJeIGvAzISbIsEL5v8Q==
X-Received: by 2002:a17:906:6899:b0:a6f:2c2:9ea2 with SMTP id a640c23a62f3a-a6f47c9b62bmr83248566b.1.1718183068247;
        Wed, 12 Jun 2024 02:04:28 -0700 (PDT)
Message-ID: <ddef2b3d-9766-4697-ac15-4105a0592090@suse.com>
Date: Wed, 12 Jun 2024 11:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] x86/irq: deal with old_cpu_mask for interrupts in
 movement in fixup_irqs()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-6-roger.pau@citrix.com>
 <66fc06cc-f1f6-4f12-83d4-a3b9788bffba@suse.com> <Zmlgp9C2ryFtT65B@macbook>
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
In-Reply-To: <Zmlgp9C2ryFtT65B@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2024 10:47, Roger Pau Monné wrote:
> On Tue, Jun 11, 2024 at 02:45:09PM +0200, Jan Beulich wrote:
>> On 10.06.2024 16:20, Roger Pau Monne wrote:
>>> Given the current logic it's possible for ->arch.old_cpu_mask to get out of
>>> sync: if a CPU set in old_cpu_mask is offlined and then onlined
>>> again without old_cpu_mask having been updated the data in the mask will no
>>> longer be accurate, as when brought back online the CPU will no longer have
>>> old_vector configured to handle the old interrupt source.
>>>
>>> If there's an interrupt movement in progress, and the to be offlined CPU (which
>>> is the call context) is in the old_cpu_mask clear it and update the mask, so it
>>> doesn't contain stale data.
>>
>> This imo is too __cpu_disable()-centric. In the code you cover the
>> smp_send_stop() case afaict, where it's all _other_ CPUs which are being
>> offlined. As we're not meaning to bring CPUs online again in that case,
>> dealing with the situation likely isn't needed. Yet the description should
>> imo at least make clear that the case was considered.
> 
> What about adding the following paragraph:

Sounds good, just maybe one small adjustment:

> Note that when the system is going down fixup_irqs() will be called by
> smp_send_stop() from CPU 0 with a mask with only CPU 0 on it,
> effectively asking to move all interrupts to the current caller (CPU
> 0) which is the only CPU online.  In that case we don't care to

"... the only CPU to remain online."

> migrate interrupts that are in the process of being moved, as it's
> likely we won't be able to move all interrupts to CPU 0 due to vector
> shortage anyway.
> 
>>
>>> @@ -2589,6 +2589,28 @@ void fixup_irqs(const cpumask_t *mask, bool verbose)
>>>                                 affinity);
>>>          }
>>>  
>>> +        if ( desc->arch.move_in_progress &&
>>> +             !cpumask_test_cpu(cpu, &cpu_online_map) &&
>>
>> This part of the condition is, afaict, what covers (excludes) the
>> smp_send_stop() case. Might be nice to have a brief comment here, thus
>> also clarifying ...
> 
> Would you be fine with:
> 
>         if ( desc->arch.move_in_progress &&
>              /*
> 	      * Only attempt to migrate if the current CPU is going
> 	      * offline, otherwise the whole system is going down and
> 	      * leaving stale interrupts is fine.
> 	      */
>              !cpumask_test_cpu(cpu, &cpu_online_map) &&
>              cpumask_test_cpu(cpu, desc->arch.old_cpu_mask) )

Sure, this is even more verbose (i.e. better) than I was after.

Jan

