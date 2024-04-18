Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72BA8A9D75
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 16:46:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708442.1107360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxT1X-0000Ku-1V; Thu, 18 Apr 2024 14:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708442.1107360; Thu, 18 Apr 2024 14:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxT1W-0000HP-U2; Thu, 18 Apr 2024 14:46:02 +0000
Received: by outflank-mailman (input) for mailman id 708442;
 Thu, 18 Apr 2024 14:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p/a5=LX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rxT1W-0000HJ-BO
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 14:46:02 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f671c2b-fd92-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 16:46:01 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-78f05fde6dcso55891085a.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 07:46:01 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 m2-20020ae9f202000000b0078d5d9cdc9esm705755qkg.21.2024.04.18.07.45.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 07:45:59 -0700 (PDT)
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
X-Inumbo-ID: 5f671c2b-fd92-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713451560; x=1714056360; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dzsyKm5LC3AStNlnnTEXa5fpAh4vTvXIXmJMVhtFM8c=;
        b=CIvRbpEQ63ZNPTQspoNSbpwOjNXxX6LxaZ/vN/jUdozvSbG4p0U6kYvwfJAfleCFBj
         pwGLnfLMnrpEn4qQsLWHU1hpjpmPQuCwDNvBOpXJsI1BCUScnKKd6gJgBBxdtpsayb0Y
         Vbkkp4LOFCFv5k3gScJSeZtLXo/SAGFLNvPtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713451560; x=1714056360;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzsyKm5LC3AStNlnnTEXa5fpAh4vTvXIXmJMVhtFM8c=;
        b=SXm/nJ6LEeiP2UdT4LaufTWimKlH4mEaF1nEt/Aae3a8nGnnrgX+lcK5oeDSq7iArN
         7V9Dt7BjPm8lSSu/bLOtpO4IbceoBriB2O3s+g1e9ncV79l1lcXSwjnWLKKVytH/1qI+
         ZwWZ8OM5unFHHlH4dODm8F9gfFn0Jb39RsftV9JuL7ImORz07Zk2V1JfCsJa1Fjj3LE7
         AtGsRXeLQVlwbDSj8bF20r7N4VjVFzo4E5jHU7ZTNwfK/HJHMWayfdYk7s1xhE4t/cEr
         J8LjBmwX1hq1KbkoIk/925wcDpK7yveIu8C8GyarOpBSvwHNzLR38MK7g0UzkZ36Wmu/
         o2Sg==
X-Forwarded-Encrypted: i=1; AJvYcCU2ymE5PAqgqOBtNfK4H5zG84vmTP6pN/pbSFkxU9bUjeDji50w4oZpEpYxf3IkGFD5OHftwPESYhHpjURqdKCgqlQLcejYiYwaWSSYjOg=
X-Gm-Message-State: AOJu0YwsGVs9cFn7B/P+lI1xRRHjzKMQoeCliQYzhx4QfVjp6krU5tTb
	7M32BuWOxh1caqVbVI6+GiclN+ehptGVo5QgYtnmWtBX8X24iLuT/megN29MDrw=
X-Google-Smtp-Source: AGHT+IG18EEbznezIEtuu7ZucU6PRAAgulRSXvMPwWtCe7XiSQe1jElreGwgTgebd27/Wz0P1xTDNA==
X-Received: by 2002:a05:620a:d5d:b0:78f:17e:e575 with SMTP id o29-20020a05620a0d5d00b0078f017ee575mr2760492qkl.75.1713451559738;
        Thu, 18 Apr 2024 07:45:59 -0700 (PDT)
Message-ID: <9a973f18-e0af-456c-8b07-6869f044519e@citrix.com>
Date: Thu, 18 Apr 2024 15:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 08/15] x86/vpmu: separate amd/intel vPMU code
To: Sergiy Kibrik <sergiy_kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240416063534.3469482-1-Sergiy_Kibrik@epam.com>
 <939adb2d-7816-4f99-9d57-ed444ab859b4@citrix.com>
 <25e2f901-04a6-4c05-9072-a926f6abf06c@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <25e2f901-04a6-4c05-9072-a926f6abf06c@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/04/2024 2:25 pm, Sergiy Kibrik wrote:
> 16.04.24 14:05, Andrew Cooper:
>> On 16/04/2024 7:35 am, Sergiy Kibrik wrote:
>>> diff --git a/xen/arch/x86/cpu/Makefile b/xen/arch/x86/cpu/Makefile
>>> index 35561fe51d..d3d7b8fb2e 100644
>>> --- a/xen/arch/x86/cpu/Makefile
>>> +++ b/xen/arch/x86/cpu/Makefile
>>> @@ -10,4 +10,6 @@ obj-y += intel.o
>>>   obj-y += intel_cacheinfo.o
>>>   obj-y += mwait-idle.o
>>>   obj-y += shanghai.o
>>> -obj-y += vpmu.o vpmu_amd.o vpmu_intel.o
>>> +obj-y += vpmu.o
>>> +obj-$(CONFIG_SVM) += vpmu_amd.o
>>> +obj-$(CONFIG_VMX) += vpmu_intel.o
>>
>> I'm afraid this breaks perf counters on PV guests.  These files are
>> joint guest-type implementations.
>>
>> Seeing as you leave vpmu.o alone, I guess that all you're actually
>> wanting to do is compile out vpmu_intel.o?  In which case, use
>> CONFIG_{AMD,INTEL} rather than CONFIG_{SVM,VMX} please.
>>
>
> Thanks for pointing that out.
> I think I'll just exclude this patch from the series, and make a
> separate series with CONFIG_{AMD,INTEL} option and code separation
> that unrelated to VMX/SVM & HVM/PV, only to CPUs themselves.
>
> BTW, how would you suggest CONFIG_{AMD,INTEL} shall relate to
> CONFIG_{SVM,VMX}? Should CONFIG_VMX just plainly depend on CONFIG_AMD,
> or more complex relations needed?

To a first approximation, no linkage.

Centaur have an implementation of VMX on the market, and Hygon have an
implementation of SVM.

~Andrew

