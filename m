Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE3901BE9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 09:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736969.1143061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZUI-0005x3-NK; Mon, 10 Jun 2024 07:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736969.1143061; Mon, 10 Jun 2024 07:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZUI-0005vY-K7; Mon, 10 Jun 2024 07:30:42 +0000
Received: by outflank-mailman (input) for mailman id 736969;
 Mon, 10 Jun 2024 07:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGZUH-0005uC-Re
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 07:30:41 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56949246-26fb-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 09:30:40 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so599766366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 00:30:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1e099418sm116013466b.72.2024.06.10.00.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 00:30:39 -0700 (PDT)
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
X-Inumbo-ID: 56949246-26fb-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718004640; x=1718609440; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=azg+i8jPdC9upu0njj2bLfuldZjvuVjTdieDPOOveK0=;
        b=eB3W2YntMTMC6hr8rLFGIeiNQ5Quw5/V4X7z2S+t85bu4MMBTKWYkAZRcdP+Thigy1
         +4XmSgVUtQeElygpI3Lo1YxJY1v5ce2O+dCpqRyIF/nBHhVosxODXE56qG83GIqOlVwl
         4/ogSeY0j7d5plF5JBuKaNm3opselRU/dzSrnj5bJWMcdkdK2/rOZzoG9ukBsu+U6CMN
         8WJIg5xC07L3uUGdWtiU/0tZHJHKCjPDQQg/TKp0GQbxJDi5g4pcywDb4/tL9ewjQvbI
         YQik6JGmXvHgSpCSwmzBuJ2mTEYRKi+NNz6OoNH8UsJFKGvDFl0fsqao6Q8tiSyFzmP+
         2yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718004640; x=1718609440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azg+i8jPdC9upu0njj2bLfuldZjvuVjTdieDPOOveK0=;
        b=VKo9b/I/FOLMSucCE44t0lnSYcH1ducSlfuDx9W0IbWAZUUCsYwObtYFFcsvQOr30T
         bABcy7Nfy+4uOFsF0aUPyyaHsFKdElQpdtPlWyCLiy7XWYQJ6+TubLy0+FHb9ynaICXo
         nDTAE9bYzz0YJ4baS3aQRAeFGgezHKHcunhEUhzJa5cGqHZNXYYZJda58q1KU0JiBGEA
         IDGKeGaB8P1kK5dcl3PAgoR+cYvfbZqa+HX+a9KI6szRXfx653IQORwofAIZnhLQQUqr
         9dlKEmu20qUXV8LAlN2YwB1NHvP8GPgkhWePAYS8j2sIzP/kQ747upQeT0p/D3D1305A
         IdmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCUS2E31tLdp67PwVNT/aOaAoNgm4NSp1sn52fKLYlb/WVWuDtkAjqx1iqdBjrRdsN9aEOHrqPKQLR17iL60Pc7xEy3YpmjHrZDjIdM6s=
X-Gm-Message-State: AOJu0Yzj7ba+5/TPqVDfmGycjHXt0naheAR7gDDoZYZI0UYFu1RwCfju
	ee4utwQDegwmr6SBJ4XMHnh9GbvxZWOyIcNt4zXSKSsWDd3ekgj7pXh4O9yvBg==
X-Google-Smtp-Source: AGHT+IF43XhAidsP8/nIzdYsw8KXB0QcdwlVoDPrsdPQMs1o6uANeGnoQm44q2kXrBHXxTatKZsBow==
X-Received: by 2002:a17:906:8418:b0:a6f:1fd6:61b6 with SMTP id a640c23a62f3a-a6f1fd661femr89962066b.35.1718004639785;
        Mon, 10 Jun 2024 00:30:39 -0700 (PDT)
Message-ID: <f3cd00f2-bdcb-4604-bdc2-fd13eddb8ea0@suse.com>
Date: Mon, 10 Jun 2024 09:30:38 +0200
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
In-Reply-To: <CAKBKdXhZ4HOqThPMkwaWB5ZhQOc6gE=xsKzkoL4_h+M6y33dcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.06.2024 01:06, Petr Beneš wrote:
> On Thu, Jun 6, 2024 at 9:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>>> @@ -122,7 +131,12 @@ int p2m_init_altp2m(struct domain *d)
>>>      struct p2m_domain *hostp2m = p2m_get_hostp2m(d);
>>>
>>>      mm_lock_init(&d->arch.altp2m_list_lock);
>>> -    for ( i = 0; i < MAX_ALTP2M; i++ )
>>> +    d->arch.altp2m_p2m = xzalloc_array(struct p2m_domain *, d->nr_altp2m);
>>> +
>>> +    if ( !d->arch.altp2m_p2m )
>>> +        return -ENOMEM;
>>
>> This isn't really needed, is it? Both ...
>>
>>> +    for ( i = 0; i < d->nr_altp2m; i++ )
>>
>> ... this and ...
>>
>>>      {
>>>          d->arch.altp2m_p2m[i] = p2m = p2m_init_one(d);
>>>          if ( p2m == NULL )
>>> @@ -143,7 +157,10 @@ void p2m_teardown_altp2m(struct domain *d)
>>>      unsigned int i;
>>>      struct p2m_domain *p2m;
>>>
>>> -    for ( i = 0; i < MAX_ALTP2M; i++ )
>>> +    if ( !d->arch.altp2m_p2m )
>>> +        return;

I'm sorry, the question was meant to be on this if() instead.

>>> +    for ( i = 0; i < d->nr_altp2m; i++ )
>>>      {
>>>          if ( !d->arch.altp2m_p2m[i] )
>>>              continue;
>>> @@ -151,6 +168,8 @@ void p2m_teardown_altp2m(struct domain *d)
>>>          d->arch.altp2m_p2m[i] = NULL;
>>>          p2m_free_one(p2m);
>>>      }
>>> +
>>> +    XFREE(d->arch.altp2m_p2m);
>>>  }
>>
>> ... this ought to be fine without?
> 
> Could you, please, elaborate? I honestly don't know what you mean here
> (by "this isn't needed").

I hope the above correction is enough?

Jan

