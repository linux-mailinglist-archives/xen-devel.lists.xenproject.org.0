Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA55FB1B169
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 11:49:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070215.1433859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEIA-0000R4-M5; Tue, 05 Aug 2025 09:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070215.1433859; Tue, 05 Aug 2025 09:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujEIA-0000Ot-JM; Tue, 05 Aug 2025 09:49:10 +0000
Received: by outflank-mailman (input) for mailman id 1070215;
 Tue, 05 Aug 2025 09:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujEI9-0000On-Mq
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 09:49:09 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d64ae1f-71e1-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 11:49:06 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-af958127df5so459559466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 02:49:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8fe7a32sm8158216a12.37.2025.08.05.02.49.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 02:49:05 -0700 (PDT)
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
X-Inumbo-ID: 6d64ae1f-71e1-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754387346; x=1754992146; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U5F+rkxZgtscWzXVRHbxzQgZ8Rxrqah7DUv0RnqC0gU=;
        b=Lv2ky2RDrw0Awk3HBuGRtwA7udaExygNjeADFVsDG5yk/N72CD0XPyHVrTv+l6nps1
         zEjGuwU4gbujxo+lTmRwRjYDD0gdJZqEGe/28JKiSzHgHjvNMiHbgDpwpSpz2kVhbL3Z
         6hXYvGJNAXmZBdT77ICqJdsKFfUbLv0QkUFTTqiUep7fL4jxFhUI2SDIH0wfO4lnRDev
         KZo7dbCsiy5+LT28Gd2+UwGKbFYxC231XW02xbixWJKGl3smyj5W4Y1nGqlJWhnHqWNY
         EP18s6sPEMqQ7ohzsnnL0zL2SeESiLEd/jWR6wmnyDC1qdVO5RYuCz9UABFTcwISFaAY
         hATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754387346; x=1754992146;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5F+rkxZgtscWzXVRHbxzQgZ8Rxrqah7DUv0RnqC0gU=;
        b=Q8xDteA5rjpW6B/3pVH2zAJVdyZcTQloUghdv6VFHzLla334dmRa9jNMI0McyDyoCo
         sx0iakTJWAm+gx/cqf0jAnCJskjk2FrFYQ6rdAJnnaR+FmvGkLCUCsHUWtCsu272ijZu
         Vq+eXDvxxg8iCmTU6Nyb1fBETBoJXSWP/IG6XPSuNQCvKwwXeKpwI7F36HQLDWhFQu0L
         pVNk1ODs82xH0tOqwZCASkCaMXZNjLXUZjM6dRgyaGkcv63GzYZuQ2Y9Bmf1VZ2jxJC2
         +gvS9UbZkfqex8L8YU3mWeTmf5sJShCzHVHWwtxT2qhb8wjBIj3OWddT++QYlUxaj4ZJ
         jfDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSzJvPrtjqeG6inZt0CiEpD+gZc4we6QzZpyyl14lIzhifeSJbQ62z6BwL3ZWPjvwq3sEVZMgXVGE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKyR6k0Kq5NLNlnV2JBJrERGgGvZ/z8nLgEHl0d7TGvBg4XC3U
	6alIgZmaBCYx7bvNZ42rAJEZhgcKBdx58J9CmgXta2rOU3gG9Mv5TQCq3a9rBBlt8g==
X-Gm-Gg: ASbGncti2ycZyMrZUFqLKHRwtk79IanaH4/1/JLKB2Pa+VkAiDNv0FWF009H9oAh6a0
	+RVXuxqZrguK8bKA/JyyTVVnaPTwPdOVXjwvA9bVRBe5GltzOOCldMf/bv5Z+y/QcJb1foLBJn9
	ThM8+hBibIKgfS3Nmy0RIwb6A82+C8vfy6MBW2MpK3+FUBUSUBu14Q7G7+oNTE1+QZ1UCyusUKl
	b6rLEmC14x0FuIczL3W7AZHorijJEdwPLr249sxnigSmksCYCzup+eeScBpfrc41aOVv34sf70n
	s/pxiDeUwaBHqAd3jRfZ6g+rVSeeKUWt4+SruGJO3iq9IFjHKv8F3ITg/hPBuv3SbC9/XAennFY
	WY7YdwcLEkBeyA6xySHTf2vpkLQfUDrtJlk567SClN6eFPJ9IP/fleA28Qyl+yBeU+MJRE8xNdB
	aTE1uXBLU=
X-Google-Smtp-Source: AGHT+IEe2zjCuz4CyMAETj6XgZMToXJ8M9vDj1sw7rZqZI/NoJShYseXxsXQOHPaKQxnn0piF82Bfg==
X-Received: by 2002:a17:906:f205:b0:af9:467d:abc0 with SMTP id a640c23a62f3a-af9467dae3cmr1124764966b.50.1754387346122;
        Tue, 05 Aug 2025 02:49:06 -0700 (PDT)
Message-ID: <f35586f8-c80f-4023-a9c0-5107e53c4063@suse.com>
Date: Tue, 5 Aug 2025 11:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: rework error handling in vcpu_create
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20250801202418.38977-1-stewart.hildebrand@amd.com>
 <52ea4f10-26b4-447b-8753-0e4287a03408@suse.com>
 <e7344494-8ac1-42a6-94a8-52a46f7f691a@amd.com>
 <795cf4c1-07be-47a5-b807-074b165650c4@suse.com>
 <07c5f672-034a-46f0-a563-081a0d4ad0d5@amd.com>
 <cefc96a0-b095-4bc8-baa6-4d929ffaa1a6@suse.com>
 <a3e9afa2-d60e-4779-8eee-54268d7d833f@amd.com>
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
In-Reply-To: <a3e9afa2-d60e-4779-8eee-54268d7d833f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.08.2025 11:33, Stewart Hildebrand wrote:
> On 8/5/25 05:17, Jan Beulich wrote:
>> On 05.08.2025 11:06, Stewart Hildebrand wrote:
>>> On 8/5/25 03:44, Jan Beulich wrote:
>>>> On 04.08.2025 18:57, Stewart Hildebrand wrote:
>>>>> On 8/4/25 03:57, Jan Beulich wrote:
>>>>>> On 01.08.2025 22:24, Stewart Hildebrand wrote:
>>>>>>> @@ -839,6 +839,9 @@ void sched_destroy_vcpu(struct vcpu *v)
>>>>>>>  {
>>>>>>>      struct sched_unit *unit = v->sched_unit;
>>>>>>>  
>>>>>>> +    if ( !unit )
>>>>>>> +        return;
>>>>>>> +
>>>>>>>      kill_timer(&v->periodic_timer);
>>>>>>>      kill_timer(&v->singleshot_timer);
>>>>>>>      kill_timer(&v->poll_timer);
>>>>>>
>>>>>> What if it's the 2nd error path in sched_init_vcpu() that is taken?
>>>
>>> ^^ This ^^ is what I'm confused about
>>
>> If sched_init_vcpu() took the indicated path,
> 
> What path? In the one I'm looking at, sched_free_unit() gets called,

Oh, I see - that wasn't quite obvious, though. Yet of course ...

> setting v->sched_unit = NULL, and in that case ...
> 
>> the if() you add here won't
>> help, and ...
> 
> ... the condition is true, and ...
> 
>>>>>> Then we
>>>>>> might take this path (just out of context here)
>>>>>>
>>>>>>     if ( unit->vcpu_list == v )
>>>>>>     {
>>>>>>         rcu_read_lock(&sched_res_rculock);
>>>>>>
>>>>>>         sched_remove_unit(vcpu_scheduler(v), unit);
>>>>>>         sched_free_udata(vcpu_scheduler(v), unit->priv);
>>>>>>
>>>>>> and at least Credit1's hook doesn't look to be safe against being passed NULL.
>>>>>> (Not to speak of the risk of unit->priv being used elsewhere while cleaning
>>>>>> up.)

... this latter part of my remark still applies. IOW I continue to think
that discussing the correctness of this change needs to be extended.
Unless of course a scheduler maintainer wants to ack it as is.

Jan

