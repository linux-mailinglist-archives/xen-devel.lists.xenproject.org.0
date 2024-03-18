Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F0A87E3B2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 07:35:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694466.1083266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm6aP-0003aA-1e; Mon, 18 Mar 2024 06:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694466.1083266; Mon, 18 Mar 2024 06:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rm6aO-0003Y4-VH; Mon, 18 Mar 2024 06:35:04 +0000
Received: by outflank-mailman (input) for mailman id 694466;
 Mon, 18 Mar 2024 06:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rE6T=KY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rm6aN-0003Xy-TC
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 06:35:03 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4df4c58-e4f1-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 07:35:00 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a467d8efe78so379019666b.3
 for <xen-devel@lists.xenproject.org>; Sun, 17 Mar 2024 23:35:00 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 gc14-20020a170906c8ce00b00a46ab3adea5sm2049343ejb.113.2024.03.17.23.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Mar 2024 23:34:59 -0700 (PDT)
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
X-Inumbo-ID: a4df4c58-e4f1-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710743699; x=1711348499; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WlT4lf4QT+N7CBObrOaQfgIRmr2ZJ20Y2+aXDVEVwPc=;
        b=SXr/5gKR7ReTCRAbYPcpZQi7q9ICv7NcITnh9XLgZ3iZWprNYgudqyA9pPxzn6hqex
         bpAKlVZGPSmdOxvHoFULhgEt/cOXhJoocTp7DFbiix3oG7DC5RoFyJq2CzWKfWf1Svke
         Kd7yC1Zf4Er6qFgILaifamkH2nATv9IwFMHHyO/VNl7iBEKoXrYOfkac0FXuX5dFlPZg
         VIk7yYSZcXITjaw5XN5/wJxhoLxL8aJWDtSG1zDe849GqKWZeSCC9Xskwuw61HBBR6rR
         mGSpRT2k4cdbNg6hajc/5sYEI/dF9Y0O54lj/G28gYeBAdwB0e8sfa0Q9K+5arlKxU/3
         FWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710743699; x=1711348499;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlT4lf4QT+N7CBObrOaQfgIRmr2ZJ20Y2+aXDVEVwPc=;
        b=RJlmAnh2ULHqhf9VrFcYeJ5BNhNnjh9UGw/0X3v0BwwBf2yoABZG98ZCVTLjRZL4Qe
         5eKY21zNyd0FrrHBlAJfKpXJ18xAbfrG9CPAryflJ2l2XcvthnTpXBkZPtk0TLI+SMjz
         RmKC6HXxS1BudSTnGgayMNOdP7Pjja+iKi9l64ssyC5QsO5tVWzdmmHTRejPVVOUvzIJ
         IDLKsTUqowqXhFNtMuU6AIPwEyfDgZ0qAJxljAVjF71wmQPXdonnpauWLYYsn81MZ7g+
         s9dAicXPkm2gITrnyUxImK+zDD4RjuSaprx1PWdTzCEEuTN8q3JVVtP1XFDNnh5VQBxG
         jTFw==
X-Forwarded-Encrypted: i=1; AJvYcCUzW0V+6AfqmFdmS+VyUU30GQq0uPWOIdczQANpIqkYnI1SC0nomWGxt29WIPfFF6oiaM22Wn7UkXPhWX299N7S6Kl4QVZZhfeOaUXLE5k=
X-Gm-Message-State: AOJu0Yx7lVW+EjjfnHvYLSXH3Y60BSGZO2nL0ZSPjqYpTDijoFVPFxYD
	hmF2vpqROr1y7ZcJV7pot9F6LrJu5JWSMCvcHRixhlWNwtgoMWjO3EScQCEKfWs=
X-Google-Smtp-Source: AGHT+IEkwbfLnF7KQV7xOnq5nLI/EFewzkLUcW4Q15vzQ6NsAUhisRoX1KZkhYAfLipTOXpX6FKcOg==
X-Received: by 2002:a17:906:80c7:b0:a46:c8e0:e253 with SMTP id a7-20020a17090680c700b00a46c8e0e253mr480656ejx.52.1710743699453;
        Sun, 17 Mar 2024 23:34:59 -0700 (PDT)
Message-ID: <0b0cc755-1418-4d2b-a935-555996bf550b@suse.com>
Date: Mon, 18 Mar 2024 07:34:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Set correct per-cpu cpu_core_mask
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Henry Wang <xin.wang2@amd.com>,
 xen-devel@lists.xenproject.org, george.dunlap@cloud.com
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <20240228015822.56108-1-xin.wang2@amd.com>
 <77520838-67cb-4755-8b02-2ec8b90c7bfa@xen.org>
 <16838c64-c633-4125-9388-af02e18a89be@amd.com>
 <dc0b86eb-e494-45c9-b1f3-31a9b9f84f77@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <dc0b86eb-e494-45c9-b1f3-31a9b9f84f77@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.03.24 11:58, Julien Grall wrote:
> 
> 
> On 14/03/2024 14:22, Henry Wang wrote:
>> Hi Julien,
> 
> Hi,
> 
>>
>> On 3/14/2024 9:27 PM, Julien Grall wrote:
>>> Hi Henry,
>>>
>>> On 28/02/2024 01:58, Henry Wang wrote:
>>>> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
>>>> index a84e706d77..d9ebd55d4a 100644
>>>> --- a/xen/arch/arm/smpboot.c
>>>> +++ b/xen/arch/arm/smpboot.c
>>>> @@ -66,7 +66,6 @@ static bool cpu_is_dead;
>>>>     /* ID of the PCPU we're running on */
>>>>   DEFINE_PER_CPU(unsigned int, cpu_id);
>>>> -/* XXX these seem awfully x86ish... */
>>>
>>> :). I guess at the time we didn't realize that MT was supported on Arm. It is 
>>> at least part of the spec, but as Michal pointed out it doesn't look like a 
>>> lot of processors supports it.
>>
>> Yep. Do you think changing the content of this line to something like 
>> "Although multithread is part of the Arm spec, there are not many processors 
>> support multithread and current Xen on Arm assumes there is no multithread" 
>> makes sense to you?
>>
>>>>   /* representing HT siblings of each logical CPU */
>>>>   DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
>>>>   /* representing HT and core siblings of each logical CPU */
>>>> @@ -89,6 +88,10 @@ static int setup_cpu_sibling_map(int cpu)
>>>>       cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
>>>>       cpumask_set_cpu(cpu, per_cpu(cpu_core_mask, cpu));
>>>>   +    /* Currently we assume there is no multithread. */
>>>
>>> I am not very familiar with the scheduling in Xen. Do you know what's the 
>>> consequence of not properly supporting MT? One thing I can think of is 
>>> security (I know there were plenty of security issues with SMT).
>>
>> Unfortunately me neither, so adding George to this thread as I think he can 
>> bring us some insights on this topic from the scheduler perspective.
> 
> +Juergen as he worked on co-scheduling.

There are four aspects regarding multithreading:

- security (basically boils down to one thread possibly being able to use
   side channel attacks for accessing other thread's data via resources in
   the core shared between the threads)

- performance (trying to spread running vcpus across as many cores as
   possible will utilize more hardware resources resulting generally in better
   performance - especially credit2 is supporting that)

- power consumption (a completely idle core will consume less power - again
   credit2 is supporting that with the correct setting)

- busy loops (cpu_relax() support)

For credit2 MT specifics see the large comment block in xen/common/sched/credit2
starting at line 636.

Note that core scheduling is currently not supported on Arm, as there are
architecture specific bits missing in the context switching logic.


Juergen

