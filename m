Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB8F8C79EB
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 17:58:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723500.1128403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dUs-00053Y-G8; Thu, 16 May 2024 15:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723500.1128403; Thu, 16 May 2024 15:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dUs-00050p-CO; Thu, 16 May 2024 15:58:22 +0000
Received: by outflank-mailman (input) for mailman id 723500;
 Thu, 16 May 2024 15:58:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3ow=MT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s7dUq-00050d-VO
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 15:58:20 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d573a35-139d-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 17:58:19 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a5a1054cf61so392829466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 08:58:19 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b1773esm988903366b.199.2024.05.16.08.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 08:58:18 -0700 (PDT)
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
X-Inumbo-ID: 1d573a35-139d-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715875099; x=1716479899; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WRq67dEpvaxgg3QFeQBkNlihBhDVXflo99nfG1nxZ9s=;
        b=ZmCCs8olgBFGT70LuQaNK7IzA9VqbOTJUw/oWgGLgXoCB4re2uiSocyGfXJIYyloRK
         dI214P1a1gBDBozH5C3xB0sLSJtdgbYNo41fukT9sWUF3C3QVEXyI/VKPFfRNngfFKOs
         uunrN19QhmV1Rq/JQwMgGWyojL+FPvMFZmfgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715875099; x=1716479899;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WRq67dEpvaxgg3QFeQBkNlihBhDVXflo99nfG1nxZ9s=;
        b=ou9QoHIumOma8Pege8W08ub9cI+N2CxU7VxVT8PQNRjMIsj6p86dxU79wf76qJB29M
         seEQC1OCYRbstdsq12G1X5Ig2LPIyd1N7N+WUodR5tKV18j6MSecDGUntbRKlEWGRZZl
         uSAsV+7wSb0N7p8wjF9M12KqlAhRVBNkkWcwHD5555OW/yPhpNNIgCqlvU99Z6RX6UFZ
         RXZ0Nisanv8GhK8NjxhJCydKfwkUX5PuyC43PAzY9uHMWW9IX1cuXW9jSORTHhMAXKvQ
         Qm+ELxa9KmccVAFCfCbd9zYo3zzQt50TBOLRxvHGhmLBeUwzSGvdmfO3QlwlHbh3Erws
         +FPA==
X-Gm-Message-State: AOJu0YxgerqdleeD2BY+n1E5jLfEYTTz9BDi9Yqrl1HZUI/8f/oWweLF
	f50HveiaVC1CKqxyAbptzXM7XU0v/HtT0kciD3fB9/awPwycgGvpRT97mbl+e58=
X-Google-Smtp-Source: AGHT+IEalo+iCyDxRsMRkR66EVlLNoNI56gNz5b0vi9JhiIsk2Zfcn0NlJlO1OdtYlx/gbgygi4+rg==
X-Received: by 2002:a17:906:f6ca:b0:a59:c0a6:25cd with SMTP id a640c23a62f3a-a5a2d53ae0fmr1815506166b.5.1715875098612;
        Thu, 16 May 2024 08:58:18 -0700 (PDT)
Message-ID: <8b7e9a18-c6e7-4482-9e5a-cdf06b67ea71@cloud.com>
Date: Thu, 16 May 2024 16:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tools/xg: Clean up xend-style overrides for CPU
 policies
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: anthony@xenproject.org
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
 <20240207173957.19811-4-alejandro.vallejo@cloud.com>
 <2b4b05d1-154d-43b8-a29b-aa99332a8eeb@perard>
 <dc37751e-cf68-42af-909a-ad9a9ec3833f@cloud.com>
Content-Language: en-GB
In-Reply-To: <dc37751e-cf68-42af-909a-ad9a9ec3833f@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2024 16:37, Alejandro Vallejo wrote:
> On 30/04/2024 15:42, Anthony PERARD wrote:
>> On Wed, Feb 07, 2024 at 05:39:57PM +0000, Alejandro Vallejo wrote:
>>> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
>>> index 5699a26b946e..cee0be80ba5b 100644
>>> --- a/tools/libs/guest/xg_cpuid_x86.c
>>> +++ b/tools/libs/guest/xg_cpuid_x86.c
>>> @@ -772,49 +616,45 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>>               * apic_id_size values greater than 7.  Limit the value to
>>>               * 7 for now.
>>>               */
>>> -            if ( p->policy.extd.nc < 0x7f )
>>> +            if ( cur->policy.extd.nc < 0x7f )
>>>              {
>>> -                if ( p->policy.extd.apic_id_size != 0 && p->policy.extd.apic_id_size < 0x7 )
>>> -                    p->policy.extd.apic_id_size++;
>>> +                if ( cur->policy.extd.apic_id_size != 0 && cur->policy.extd.apic_id_size < 0x7 )
>>> +                    cur->policy.extd.apic_id_size++;
>>>  
>>> -                p->policy.extd.nc = (p->policy.extd.nc << 1) | 1;
>>> +                cur->policy.extd.nc = (cur->policy.extd.nc << 1) | 1;
>>>              }
>>>              break;
>>>          }
>>>      }
>>>  
>>> -    nr_leaves = ARRAY_SIZE(p->leaves);
>>> -    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
>>> -    if ( rc )
>>> +    if ( xend || msr )
>>>      {
>>> -        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
>>> -        goto out;
>>> +        // The overrides are over the serialised form of the policy
>>
>> Comments should use /* */
> 
> Ugh, yes.
> 
>>
>>> +        if ( (rc = xc_cpu_policy_serialise(xch, cur)) )
>>> +            goto out;
>>> +
>>> +        if ( (rc = xc_cpuid_xend_policy(xch, domid, xend, host, def, cur)) )
>>> +            goto out;
>>> +        if ( (rc = xc_msr_policy(xch, domid, msr, host, def, cur)) )
>>> +            goto out;
>>
>> What if `xend` is set, but `msr` isn't? Looks like there's going to be a
>> segv in xc_msr_policy() because it doesn't check that `msr` is actually
>> set.
>>
>>
>> Thanks,
>>
> 
> OOPS! Yes, msrs was meant to have the same check I added for
> xc_cpuid_xend_policy. Will do.
> 
> Cheers,
> Alejandro

Ugh answered to the old email. pinging to the xenproject one now.

Cheers,
Alejandro

