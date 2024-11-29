Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8E09DC287
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 12:09:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845916.1261234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGys4-0006Sx-QU; Fri, 29 Nov 2024 11:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845916.1261234; Fri, 29 Nov 2024 11:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGys4-0006R1-Nj; Fri, 29 Nov 2024 11:09:12 +0000
Received: by outflank-mailman (input) for mailman id 845916;
 Fri, 29 Nov 2024 11:09:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGys3-0006Qt-IX
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 11:09:11 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d0e7e7-ae42-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 12:09:07 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa539d2b4b2so315081466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 03:09:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c195bsm162438066b.1.2024.11.29.03.09.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 03:09:06 -0800 (PST)
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
X-Inumbo-ID: 59d0e7e7-ae42-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU5ZDBlN2U3LWFlNDItMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODc4NTQ3LjIxODg1Mywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732878546; x=1733483346; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=suS8GMsY/L1TAtrDkG03JJO6sO64anaubLikawhtW+U=;
        b=A6+fbPz+J6GDkoTXST1F7ioIIuXvveb9iA7GY/45kq5g5ImTl7ZEqYWdlzDgGUY3DA
         9Ucn/sBsBlDlsemAKWPOVE/U5eUiS5Nn1YsL71/dj0xmZYYqCrLCghJAdl5W3earA5vj
         Su5RU76vLaThjqSoJqX1dqxFVYWGeUMwazBvMd/NMq2NbGA6nRaCQdcY0ohv+H7OCDQc
         S3KJPZjaxd2qZeyP/8R7iukixwskue/+EOD3PRKrtGNqtvtnC8/N//20PxOXMH3aqUkn
         tc+lHyAZ3Iz1DCMu943fT/IxE+wWGakoANMebYfuKpquUHHKuoH2YLhuqRQd5bN3Vxo9
         OVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732878546; x=1733483346;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=suS8GMsY/L1TAtrDkG03JJO6sO64anaubLikawhtW+U=;
        b=uBsx7T8c9mYGWkm/62aQhB5FsWSLB0T2vRegRwSE4dohorMSOePmaUZrVtGp79jHki
         nYAiL5k82fT5VH5KB9sNRCcOQW2PDT3Cvw9GZB5irqYK8VQZHSpJm1cXKemFs3B8k9ov
         C0dKHosZI3U5S+ig4JoxKhf1Gj/EfC8c8sz6/+nbXOqiFGoI+dHCiWbcQWxxvqKEXZBx
         scDGlw2cLO3KexpUGQ4qgOVkYOa35JNtMyM9GMdEtfXmWtCEc+FcHUu6bjBQ1MvBzThp
         JTAsOBF68uupi/Tzt2ZQJITnEwDgUugMEILxg5TMGrCPPqDw3zOnWWEb6aKglrv2SqOo
         RHvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCdRYxN0jMgNXirlsL0+LpEbWGbfDEgQXwC2raRB813lsSK/e0DhnImdvaUCkYRRCP1Lndx1E5XmU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4cKlcipFQNbCez4Ucr7Ifs7iwBgKFFNDb8xuBB3b1aIP8QytI
	wSfAm8ERFkkY6VW3+c3z4kKdtRJE/4zPuHRAHTgOh6Ep+UIioOslqs0U0fVl6g==
X-Gm-Gg: ASbGnct602HNDIWM01bsgPWD8awjsCcrUSwvY4cCDktz1E1nM8i0NbMGz+L73V0TxEk
	07pwHQ9LNRwwbij+bcazUlp3W3aRRJx/UzPV7NVN5ogurlWF0VBADSGt8q6xfGMmKwM21pR+GbV
	2tgFFR1xKdVD+lWBLVIU0qIQ+B09GCpbpxzvA8Vw7SBydA7q7hVFs7+hjHl+ls+Jrr/RacW7iMs
	NDeC7BI5zGMt2+B3Bbyuc8urwGQdLBOmiDcPHc+pba29bOa8VxsU4IgKf/AveZrq15aILvn3ej2
	8mociORPCRGUvaE6+tKzlTuTbNt+VjprXtY=
X-Google-Smtp-Source: AGHT+IEZAKRMmX3bxTHucZbcAGsscyCDqGKYSPKa+uPpIBCDK70OcE+NKfeXD+ryjkNWqem8N/znag==
X-Received: by 2002:a17:907:7ba0:b0:a9e:b08f:867e with SMTP id a640c23a62f3a-aa5945dd02fmr657292166b.16.1732878546526;
        Fri, 29 Nov 2024 03:09:06 -0800 (PST)
Message-ID: <ce9c6a08-f1d5-4755-8dc4-737f147b2b22@suse.com>
Date: Fri, 29 Nov 2024 12:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/12] xen/page_alloc: introduce preserved page flags
 macro
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-9-carlo.nonato@minervasys.tech>
 <29e69d97-41ef-4ebc-a68e-0253e230f6f4@suse.com>
 <CAG+AhRWWK6e3KJ66v5wvowTzOvyJRaECpkXYpSzMa9+83ea0eA@mail.gmail.com>
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
In-Reply-To: <CAG+AhRWWK6e3KJ66v5wvowTzOvyJRaECpkXYpSzMa9+83ea0eA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.11.2024 10:32, Carlo Nonato wrote:
> Hi Jan,
> 
> On Thu, Nov 28, 2024 at 12:05 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.11.2024 15:13, Carlo Nonato wrote:
>>> PGC_static, PGC_extra and PGC_broken need to be preserved when assigning a
>>> page. Define a new macro that groups those flags and use it instead of or'ing
>>> every time.
>>>
>>> To make preserved flags even more meaningful, they are kept also when
>>> switching state in mark_page_free().
>>> Enforce the removal of PGC_extra before freeing domain pages as this is
>>> considered an error and can cause ASSERT violations.
>>>
>>> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
>>> ---
>>> v10:
>>> - fixed commit message
>>> v9:
>>> - add PGC_broken to PGC_preserved
>>> - clear PGC_extra in alloc_domheap_pages() only if MEMF_no_refcount is set
>>> v8:
>>> - fixed PGC_extra ASSERT fail in alloc_domheap_pages() by removing PGC_extra
>>>   before freeing
>>> v7:
>>> - PGC_preserved used also in mark_page_free()
>>> v6:
>>> - preserved_flags renamed to PGC_preserved
>>> - PGC_preserved is used only in assign_pages()
>>> v5:
>>> - new patch
>>> ---
>>>  xen/common/page_alloc.c | 19 ++++++++++++++-----
>>>  1 file changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>>> index 7b911b5ed9..34cd473150 100644
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -160,6 +160,7 @@
>>>  #endif
>>>
>>>  #define PGC_no_buddy_merge PGC_static
>>> +#define PGC_preserved (PGC_extra | PGC_static | PGC_broken)
>>>
>>>  #ifndef PGT_TYPE_INFO_INITIALIZER
>>>  #define PGT_TYPE_INFO_INITIALIZER 0
>>> @@ -1427,12 +1428,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>>>      {
>>>      case PGC_state_inuse:
>>>          BUG_ON(pg->count_info & PGC_broken);
>>> -        pg->count_info = PGC_state_free;
>>> +        pg->count_info = PGC_state_free | (pg->count_info & PGC_preserved);
>>>          break;
>>
>> PGC_extra doesn't want preserving here. Since it's mark_page_free(), and
>> since PGC_extra is removed before freeing, the state change is apparently
>> fine. But an assertion may want adding, for documentation purposes if
>> nothing else.
>>
>> Alternatively it may make sense to indeed exclude PGC_extra here. In fact
>> PGC_static doesn't need using here either, as unprepare_staticmem_pages()
>> will explicitly set it again anyway.
>>
>> Hence I wonder whether the change here really is necessary (one will then
>> be needed in the next patch aiui, when PGC_colored is introduced). Which
>> would then eliminate the need for the final two hunks of the patch, I
>> think.
>>
>>>      case PGC_state_offlining:
>>> -        pg->count_info = (pg->count_info & PGC_broken) |
>>> -                         PGC_state_offlined;
>>> +        pg->count_info = (pg->count_info & PGC_preserved) | PGC_state_offlined;
>>>          pg_offlined = true;
>>>          break;
>>
>> I'm similarly unconvinced that anything other than PGC_broken (and
>> subsequently perhaps PGC_colored) would need preserving here.
> 
> Yes, we (re)checked the code and also believe that the introduction of
> PGC_preserved is generating more confusion (and code) then the actual logical
> help it provides.
> 
> We'll remove this patch and integrate PGC_colored explicitly in the flags to
> be preserved. This avoid the clumsy logic of preserving something (extra)
> when it's not needed and then handling the special case to remove it
> explicitly.
> Basically my goal is to go back to v4 where this patch didn't exist.

Hmm, no, I don't think I said anything in the direction of removing PGC_preserved
again. I merely think you went too far in where it actually wants using.

Jan

