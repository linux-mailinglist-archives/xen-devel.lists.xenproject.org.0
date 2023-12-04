Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A1B803716
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 15:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647024.1009725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAA6k-0001wG-1Y; Mon, 04 Dec 2023 14:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647024.1009725; Mon, 04 Dec 2023 14:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAA6j-0001u4-VE; Mon, 04 Dec 2023 14:39:37 +0000
Received: by outflank-mailman (input) for mailman id 647024;
 Mon, 04 Dec 2023 14:39:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CG6/=HP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAA6i-0001ty-V2
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 14:39:36 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f177edac-92b2-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 15:39:35 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-332f90a375eso3617698f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 06:39:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b12-20020a05600010cc00b0033340aa3de2sm5083686wrx.14.2023.12.04.06.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 06:39:34 -0800 (PST)
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
X-Inumbo-ID: f177edac-92b2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701700774; x=1702305574; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcNakCq4Iq1CKBsmXKLeg2bQw+NFFQKVEBEIzK7fSvg=;
        b=YMNgJjEt+zRfxljFpAA6wdHp5a3MWj9t8g20F2h8ytejy/7eSQrduHU5Nb7wT/CDHs
         EFHn3vh2zLwBiXUjpydq5f9p2UcTXZo55iHnMeVqm0w3E/F1bfbcdHceyvTlUqoGXBdH
         FVpRUH2L4YUVCqmhCL+nF/7AGShr8h4q7cv69nEDCUMzbCnA45S60p9fn/KI2x0R0egq
         HhUtO7Mnv5AhEzvRyxrR7IlUJqYWz1qFYReA7SV6Nf7QbckuPFsSr7//Xt2xB7d85gpM
         ahpL+pGPo5oxhDZnrEVd1hfSDaf2Z99lQMv0lh9f5iojqWYd9xPDeK7twRALM1FYTnc6
         X+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701700774; x=1702305574;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YcNakCq4Iq1CKBsmXKLeg2bQw+NFFQKVEBEIzK7fSvg=;
        b=RAGKwwX29q0qTWQ4He1mGM317judPTJrAnYGwUL6ByBapehAx9C1P1brLF5ayiV8Ro
         RQaxPAPYBBF52gt77WSzO6CaCCSUbphUSn+XDRMjwnll+d3KE4Uaku7Zp/Wf6V11ngMg
         s324f08Cfl5f4f4Ql85+nHcsHkSEahzzXwhwtGyLuDYwXSkQxADyGvhG733VxsAwLGzg
         QsxnMjlF1+97alcnS8CvP5E1jYtFSV3qMWANZoWYVU2S3i9+bjz3kNxIyPSGumNuGT75
         +YyDuyauvZ5TJMXSMO7Nc1MmAkmInTEQgK1jMX9KcYq1GLj5SeddfyvqaLelk9aGfbuu
         fpOQ==
X-Gm-Message-State: AOJu0YzDMnnImNJVIxpIoCIDPzs/p3+1mvwOLhNgXWPtP4ZHQnQbROic
	LWDxhqjdvEhodwp+gqBgUQAu
X-Google-Smtp-Source: AGHT+IF0O5kVGdTmNrAsAuPUo6gSfYQyMSu1s4Y5mdzt5Y8AUTh9obdMlpR0qRK+5cHShoBksompyw==
X-Received: by 2002:a5d:44c8:0:b0:333:3eaa:f67a with SMTP id z8-20020a5d44c8000000b003333eaaf67amr2061400wrr.75.1701700774548;
        Mon, 04 Dec 2023 06:39:34 -0800 (PST)
Message-ID: <15398b81-ad6b-4b14-a35a-e1e5d58fe935@suse.com>
Date: Mon, 4 Dec 2023 15:39:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched: correct sched_move_domain()'s cleanup path
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>, Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>
References: <2b59a3a2-d2f3-4d29-ab40-3f630fd497fe@suse.com>
 <CA+zSX=Zenkkyv2cQD-CKt=i90YUxxf=B_AuLgh82HDRUEkXJcg@mail.gmail.com>
 <88796b63-390d-4a4f-982f-ce86f21017c1@suse.com>
 <CA+zSX=aicqMNWybLQYe3Jb6rzfePVrgbg6KT=rYnLnvq-GKrcA@mail.gmail.com>
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
In-Reply-To: <CA+zSX=aicqMNWybLQYe3Jb6rzfePVrgbg6KT=rYnLnvq-GKrcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.12.2023 15:18, George Dunlap wrote:
> On Mon, Dec 4, 2023 at 2:10 PM Juergen Gross <jgross@suse.com> wrote:
>>
>> On 04.12.23 14:00, George Dunlap wrote:
>>> On Mon, Dec 4, 2023 at 10:57 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> It is only in the error case that we want to clean up the new pool's
>>>> scheduler data; in the success case it's rather the old scheduler's
>>>> data which needs cleaning up.
>>>>
>>>> Reported-by: René Winther Højgaard <renewin@proton.me>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> Reviewed-by: Juergen Gross <jgross@suse.com>
>>>>
>>>> --- a/xen/common/sched/core.c
>>>> +++ b/xen/common/sched/core.c
>>>> @@ -810,7 +810,7 @@ int sched_move_domain(struct domain *d,
>>>>       for ( unit = old_units; unit; )
>>>>       {
>>>>           if ( unit->priv )
>>>> -            sched_free_udata(c->sched, unit->priv);
>>>> +            sched_free_udata(ret ? c->sched : old_ops, unit->priv);
>>>>           old_unit = unit;
>>>>           unit = unit->next_in_list;
>>>>           xfree(old_unit);
>>>
>>> This code is unfortunately written in a "clever" way which seems to
>>> have introduced some confusion.  The one place which calls "goto
>>> out_free" goes through and replaces *most* of the "old_*" variables
>>> with the "new" equivalents.  That's why we're iterating over
>>> `old_units` even on the failure path.
>>>
>>> The result is that this change doesn't catch another bug on the
>>> following line, in the error case:
>>>
>>> sched_free_domdata(old_ops, old_domdata);
>>>
>>> At this point, old_ops is still the old ops, but old_domdata is the
>>> *new* domdata.
>>>
>>> A patch like the following (compile tested only) would fix it along
>>> the lines of the original intent:
>>> 8<-------
>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>>> index eba0cea4bb..78f21839d3 100644
>>> --- a/xen/common/sched/core.c
>>> +++ b/xen/common/sched/core.c
>>> @@ -720,6 +720,7 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>>>           {
>>>               old_units = new_units;
>>>               old_domdata = domdata;
>>> +            old_ops = c->sched;
>>>               ret = -ENOMEM;
>>>               goto out_free;
>>>           }
>>> @@ -809,10 +810,15 @@ int sched_move_domain(struct domain *d, struct cpupool *c)
>>>       domain_unpause(d);
>>>
>>>    out_free:
>>> +    /*
>>> +     * NB if we've jumped here, "old_units", "old_ops", and so on will
>>> +     * actually be pointing to the new ops, since when aborting it's
>>> +     * the new ops we want to free.
>>> +     */
>>>       for ( unit = old_units; unit; )
>>>       {
>>>           if ( unit->priv )
>>> -            sched_free_udata(c->sched, unit->priv);
>>> +            sched_free_udata(old_ops, unit->priv);
>>>           old_unit = unit;
>>>           unit = unit->next_in_list;
>>>           xfree(old_unit);
>>> ---->8
>>>
>>> But given that this kind of cleverness has already fooled two of our
>>> most senior developers, I'd suggest making the whole thing more
>>> explicit; something like the attached (again compile-tested only)?
>>
>> And I have again a third approach, making it crystal clear what is happening
>> with which data. No need to explain what is freed via which variables. See
>> attached patch (this time it should be really there).
> 
> Yes, I thought about making a function as well -- that works for me too.
> 
> Personally I prefer to keep the "goto out", rather than duplicating
> the rcu_read_unlock().  I'd yield if Jan said he preferred
> duplication, however.

I'm on the edge there actually.

Jan

