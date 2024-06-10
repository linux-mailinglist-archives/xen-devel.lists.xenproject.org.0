Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2773902040
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 13:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737180.1143359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGd5y-0005ZF-RE; Mon, 10 Jun 2024 11:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737180.1143359; Mon, 10 Jun 2024 11:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGd5y-0005Ws-O4; Mon, 10 Jun 2024 11:21:50 +0000
Received: by outflank-mailman (input) for mailman id 737180;
 Mon, 10 Jun 2024 11:21:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGd5y-0005Wm-86
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 11:21:50 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a02a9f63-271b-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 13:21:47 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57c681dd692so2613298a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 04:21:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f117c09c9sm254984866b.138.2024.06.10.04.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 04:21:46 -0700 (PDT)
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
X-Inumbo-ID: a02a9f63-271b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718018507; x=1718623307; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XGldr9vcI6oDKmX5z8MXspCZpPQK+hCqKg1tnDCMmg8=;
        b=c4lstLTH++ftMsmmT3EJqEGGZ1UfmHXwKmPtAJPGHglpvtn913t/K9XqK7ZOjgDE0B
         abKqdAoLXqSLgIJroyp9QndIWzhuKwEBMbEl9ftd3axebl+CbVGbf2WNgUCswMeu2xow
         Z/E1PxFC/mDAQl15tSgA6Gmvxjydt8I0Cc6NHgqpEGyK97tP3/Jskawbqt1LLoCW2wGA
         Sz87TDFlnAqoGZ4x7MR7b9yVd4KrQdBqKp1QyWZs/KiOhBwKUklwHkkNCU5S5sNyO9gV
         FGpFa7M8ltkRUS7dmXV/zMzNnvGbM0zDmiU7d8McV4w2xLWAr/+ri+WldPISaXEGWgn3
         WrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718018507; x=1718623307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGldr9vcI6oDKmX5z8MXspCZpPQK+hCqKg1tnDCMmg8=;
        b=YswWTpRH0JpMIg6+rBEC9q/M6XLtaV5fCcLDSCcnO7D8OGQr+dTX3mHCb/8w8kMpSy
         H9w25OHA+o+SJFzCvIXIRnvbc2FmiwYaoJPs9iQ5tVNOGZkYSfjltG5r4JG1Z1ralv13
         cRT1D1vFIqpYRAUwWzC1zxn4OdV26Hh4KHJm1XtLT2UFiQBLtrco5T5z8oZYdKuKh+fc
         OzIJDD6G2EPm4BcbmagiWQEdGtElg4AWWDCmj5XE0w6D0dPdO7E0hxqP1BeUqUtrE+Qc
         bQ4AS6jdjaNZTx+BpG3iir7cKN4vzpXArAyvVRB8qRvJc1xqE5RIoKSh/3xAlBSM5Lf1
         yrZw==
X-Forwarded-Encrypted: i=1; AJvYcCXLnUomdP67GYbeKtWLVBeNIL+o/kufljTSZ1P19Jxvfzf07nVh/bfeT1mO7es4rG1iVTD2bafTfJICUL+NXRl0D1tM8yacJ353e63yOyQ=
X-Gm-Message-State: AOJu0YygVIRy59AT5syoxwjtdhp6Up6+K6yLm7kzFktmFHRy/hF5drNY
	IIEILx9NYx1OqEcjeyBy3Sk0mdWWgojSGLcVZup4CiWuBuafZsZwkW2+pt5KsA==
X-Google-Smtp-Source: AGHT+IG0WA96tnh1GEBo5R2OR82Iu0ENmjmOHoi+59W01QN+m1PO8GWfl6wK381/FjHJKz9mEF1bzg==
X-Received: by 2002:a17:906:fe07:b0:a6d:b66f:7b21 with SMTP id a640c23a62f3a-a6db66f7e7emr721229066b.54.1718018507004;
        Mon, 10 Jun 2024 04:21:47 -0700 (PDT)
Message-ID: <093a45d0-da0b-44d1-902e-730eede80112@suse.com>
Date: Mon, 10 Jun 2024 13:21:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19? v5 07/10] xen: Make the maximum number of altp2m
 views configurable for x86
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1717356829.git.w1benny@gmail.com>
 <84794f97bc738add96a66790425a3aa5f5084a25.1717356829.git.w1benny@gmail.com>
 <22eabe14-10c3-4095-91d3-b63911908cb2@suse.com>
 <CAKBKdXhZ4HOqThPMkwaWB5ZhQOc6gE=xsKzkoL4_h+M6y33dcQ@mail.gmail.com>
 <f3cd00f2-bdcb-4604-bdc2-fd13eddb8ea0@suse.com>
 <CAKBKdXje+_dd7kh3+aDJACw84+-1ozXt6N==KbA6Tgm7GeZEnQ@mail.gmail.com>
 <8961cf72-4eeb-4c47-9723-35da3e47d4d2@suse.com>
 <CAKBKdXiQhFeihx9HeuOv5cFe8K7H2O+GFUXy4ThF1X6ZGjCrig@mail.gmail.com>
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
In-Reply-To: <CAKBKdXiQhFeihx9HeuOv5cFe8K7H2O+GFUXy4ThF1X6ZGjCrig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2024 12:34, Petr Beneš wrote:
> On Mon, Jun 10, 2024 at 12:16 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 10.06.2024 11:10, Petr Beneš wrote:
>>> On Mon, Jun 10, 2024 at 9:30 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 09.06.2024 01:06, Petr Beneš wrote:
>>>>> On Thu, Jun 6, 2024 at 9:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> @@ -122,7 +131,12 @@ int p2m_init_altp2m(struct domain *d)
>>>>>>>      struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
>>>>>>>
>>>>>>>      mm_lock_init(&d->arch.altp2m_list_lock);
>>>>>>> -    for ( i = 0; i < MAX_ALTP2M; i++ )
>>>>>>> +    d->arch.altp2m_p2m = xzalloc_array(struct p2m_domain *, d->nr_altp2m);
>>>>>>> +
>>>>>>> +    if ( !d->arch.altp2m_p2m )
>>>>>>> +        return -ENOMEM;
>>>>>>
>>>>>> This isn't really needed, is it? Both ...
>>>>>>
>>>>>>> +    for ( i = 0; i < d->nr_altp2m; i++ )
>>>>>>
>>>>>> ... this and ...
>>>>>>
>>>>>>>      {
>>>>>>>          d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
>>>>>>>          if ( p2m == NULL )
>>>>>>> @@ -143,7 +157,10 @@ void p2m_teardown_altp2m(struct domain *d)
>>>>>>>      unsigned int i;
>>>>>>>      struct p2m_domain *p2m;
>>>>>>>
>>>>>>> -    for ( i = 0; i < MAX_ALTP2M; i++ )
>>>>>>> +    if ( !d->arch.altp2m_p2m )
>>>>>>> +        return;
>>>>
>>>> I'm sorry, the question was meant to be on this if() instead.
>>>>
>>>>>>> +    for ( i = 0; i < d->nr_altp2m; i++ )
>>>>>>>      {
>>>>>>>          if ( !d->arch.altp2m_p2m[i] )
>>>>>>>              continue;
>>>>>>> @@ -151,6 +168,8 @@ void p2m_teardown_altp2m(struct domain *d)
>>>>>>>          d->arch.altp2m_p2m[i] = NULL;
>>>>>>>          p2m_free_one(p2m);
>>>>>>>      }
>>>>>>> +
>>>>>>> +    XFREE(d->arch.altp2m_p2m);
>>>>>>>  }
>>>>>>
>>>>>> ... this ought to be fine without?
>>>>>
>>>>> Could you, please, elaborate? I honestly don't know what you mean here
>>>>> (by "this isn't needed").
>>>>
>>>> I hope the above correction is enough?
>>>
>>> I'm sorry, but not really? I feel like I'm blind but I can't see
>>> anything I could remove without causing (or risking) crash.
>>
>> The loop is going to do nothing when d->nr_altp2m == 0, and the XFREE() is
>> going to do nothing when d->arch.altp2m_p2m == NULL. Hence what does the
>> if() guard against? IOW what possible crashes are you seeing that I don't
>> see?
> 
> I see now. I was seeing ghosts - my thinking was that if
> p2m_init_altp2m fails to allocate altp2m_p2m, it will call
> p2m_teardown_altp2m - which, without the if(), would start to iterate
> through an array that is not allocated. It doesn't happen, it just
> returns -ENOMEM.
> 
> So to reiterate:
> 
>     if ( !d->arch.altp2m_p2m )
>         return;
> 
> ... are we talking that this condition inside p2m_teardown_altp2m
> isn't needed?

I'm not sure about "isn't" vs "shouldn't". The call from p2m_final_teardown()
also needs to remain safe to make. Which may require that upon allocation
failure you zap d->nr_altp2m. Or which alternatively may mean that the if()
actually needs to stay.

> Or is there anything else?

There was also the question of whether to guard the allocation, to avoid a
de-generate xmalloc_array() of zero size. Yet in the interest of avoiding
not strictly necessary conditionals, that may well want to remain as is.

Jan

