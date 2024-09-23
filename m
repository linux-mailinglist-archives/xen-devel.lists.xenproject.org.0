Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F55F97E929
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 11:57:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801797.1211804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfoj-0002Fg-9a; Mon, 23 Sep 2024 09:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801797.1211804; Mon, 23 Sep 2024 09:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssfoj-0002EB-5d; Mon, 23 Sep 2024 09:57:17 +0000
Received: by outflank-mailman (input) for mailman id 801797;
 Mon, 23 Sep 2024 09:57:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dbeJ=QV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ssfoh-0002E1-42
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 09:57:15 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34c1cf4a-7992-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 11:57:13 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8a789c4fc5so860065566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 02:57:13 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e5d0csm1186660066b.184.2024.09.23.02.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 02:57:11 -0700 (PDT)
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
X-Inumbo-ID: 34c1cf4a-7992-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727085432; x=1727690232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=35aKwBTBr38bt1P4O1NrmLAFxfF3MROQ4EWmtSHdPEk=;
        b=gWnZt9RR3MbNfUb/97QyA1vo56bjI6QPIaGWMjUdNWYmOgDdsYngu/vwF0GscvjbZe
         /pEMXUYeVh4Af4N/xJGXiHE/bWhI4pKpHOHjd5NV1YBc8Ik29bzovBs4vJTIz2si+XgF
         Pyx2hIS/F6jSppURbVFJSMM1QpZmc/mqqOVNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727085432; x=1727690232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35aKwBTBr38bt1P4O1NrmLAFxfF3MROQ4EWmtSHdPEk=;
        b=E+nEx+H+klJ7PXMjLiJN6nmak2blXqSI6YJClhXiSBgMTGdE+MoBx7sLsh2M5EOM3m
         EqietIktTHl9wqzZ11d4+s2Nh5y5lFtbktUrgYQgW+6A8KT2SmvMJA/7YHEkvVlj6IbJ
         zEehMYeORYTn11ZBfCxmGUY+o5B2dCZ4Uyq8dK8cNUFjtwu5VlyWLKsV562xd9gX5u4h
         YHkJIr9wCXe0D9vlLHDKXwLWSE4+woyeuELDylSvuWgk1XmW+eoUZobesD9UCiLgQl3u
         hoFIayX2H0kXdDXS0Sa37k+YCSvbaKU8nbD3Rl0MIuKCltqWXXl2aldRvMdGWqxnYlD5
         kxkQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6YAWVtaUHVcYAkAnE4FQ7tb6u9V+9i0XJltpNOrNgfXVEDWeN65dWLCj9tWh0HzE+T6SyAFukDnE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHKZ0oZe2Mq/+3KjMWvghmu0CS8zSE5+ZK3paM/e4m0ki887h6
	8Lcsb5pAdtTgagygCkzAM1OdHzkQtuSGynNAEh7GrpiCfLbp/pDybouXfLZloUo=
X-Google-Smtp-Source: AGHT+IFzY59jJTrIb7WcH6vP23v6fbv+XCOqA0aePgjc0vso7TT7vwok4mex3WtngqSasxVlxwlwwg==
X-Received: by 2002:a17:906:7311:b0:a6f:996f:23ea with SMTP id a640c23a62f3a-a90d3553586mr1278243066b.15.1727085432441;
        Mon, 23 Sep 2024 02:57:12 -0700 (PDT)
Message-ID: <bab47424-6ab5-415e-8a29-793c34685c28@citrix.com>
Date: Mon, 23 Sep 2024 10:57:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen: move per-cpu area management into common code
To: oleksii.kurochko@gmail.com, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1726746877.git.oleksii.kurochko@gmail.com>
 <15b9b94e1acb70ba713391de5bae42a622c29747.1726746877.git.oleksii.kurochko@gmail.com>
 <a5b7dbdf-886b-45d6-8402-db04c58423e8@xen.org>
 <0a6e2cf5-e9f9-4685-880b-0ad5e29c8265@citrix.com>
 <a9a85484d05f7e2099a42e5007384aa85b705ea1.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <a9a85484d05f7e2099a42e5007384aa85b705ea1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/09/2024 10:26 am, oleksii.kurochko@gmail.com wrote:
> On Sun, 2024-09-22 at 10:43 +0200, Andrew Cooper wrote:
>> On 22/09/2024 10:23 am, Julien Grall wrote:
>>> On 19/09/2024 17:59, Oleksii Kurochko wrote:
>>>> diff --git a/xen/arch/x86/percpu.c b/xen/arch/x86/percpu.c
>>>> index 3205eacea6..33bded8cac 100644
>>>> --- a/xen/arch/x86/percpu.c
>>>> +++ b/xen/arch/x86/percpu.c
>>>> @@ -1,79 +1,19 @@
>>>> -#include <xen/percpu.h>
>>>>   #include <xen/cpu.h>
>>>> -#include <xen/init.h>
>>>> -#include <xen/mm.h>
>>>> -#include <xen/rcupdate.h>
>>>> -
>>>> -unsigned long __per_cpu_offset[NR_CPUS];
>>>> -
>>>> -/*
>>>> - * Force uses of per_cpu() with an invalid area to attempt to
>>>> access
>>>> the
>>>> - * middle of the non-canonical address space resulting in a #GP,
>>>> rather than a
>>>> - * possible #PF at (NULL + a little) which has security
>>>> implications
>>>> in the
>>>> - * context of PV guests.
>>>> - */
>>>> -#define INVALID_PERCPU_AREA (0x8000000000000000UL - (unsigned
>>>> long)__per_cpu_start)
>>>> -#define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end -
>>>> __per_cpu_start)
>>>> -
>>>> -void __init percpu_init_areas(void)
>>>> -{
>>>> -    unsigned int cpu;
>>>> -
>>>> -    for ( cpu = 1; cpu < NR_CPUS; cpu++ )
>>>> -        __per_cpu_offset[cpu] = INVALID_PERCPU_AREA;
>>>> -}
>>>> +#include <xen/percpu.h>
>>>> +#include <xen/smp.h>
>>>>   -static int init_percpu_area(unsigned int cpu)
>>>> +int arch_percpu_area_init_status(void)
>>> I understand that Arm and x86 are returning a different value
>>> today.
>>> But now that we are provising a common implementation, I think we
>>> need
>>> to explain the difference. This is probably a question for the x86
>>> folks.
>> The declarations for CPU Parking (variable, or compile time false)
>> wants
>> to be in the new common header, at which point
>> arch_percpu_area_init_status() doesn't need to exist.
>>
>> That also makes it very clear that there's a difference in return
>> value
>> based on CPU Parking (and the comment beside the variable explains
>> this
>> is about not quite offlining CPUs), which is far clearer than some
>> arch
>> function.
> Thanks for suggestion. It would be better, I had also concerns about
> arch_percpu_area_init_status but couldn't come up with better thing.
>
> Just to make sure I understand correctly—are you saying that I can use
> park_offline_cpus instead of arch_percpu_area_init_status()?
>    diff --git a/xen/common/percpu.c b/xen/common/percpu.c
>    index 3837ef5714..f997418586 100644
>    --- a/xen/common/percpu.c
>    +++ b/xen/common/percpu.c
>    @@ -51,7 +51,7 @@ static int init_percpu_area(unsigned int cpu)
>         char *p;
>     
>         if ( __per_cpu_offset[cpu] != INVALID_PERCPU_AREA )
>    -        return arch_percpu_area_init_status();
>    +        return park_offline_cpus ? 0 : -EBUSY;
>     
>         if ( (p = alloc_xenheap_pages(PERCPU_ORDER, 0)) == NULL )
>             return -ENOMEM;

Yes, that's exactly what I had in mind.

~Andrew

