Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F1B68DA03
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 15:00:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491164.760149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPOVL-0006FT-Mj; Tue, 07 Feb 2023 13:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491164.760149; Tue, 07 Feb 2023 13:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPOVL-0006D8-K4; Tue, 07 Feb 2023 13:59:27 +0000
Received: by outflank-mailman (input) for mailman id 491164;
 Tue, 07 Feb 2023 13:59:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1AP=6D=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pPOVK-0006D2-Rd
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 13:59:27 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a10e1cb5-a6ef-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 14:59:24 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id lu11so43379424ejb.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 05:59:24 -0800 (PST)
Received: from [192.168.1.93] ([188.73.237.113])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a1709060a4a00b00869f2ca6a87sm6880137ejf.135.2023.02.07.05.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 05:59:24 -0800 (PST)
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
X-Inumbo-ID: a10e1cb5-a6ef-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eW5/IB9F0YU5jMiK2TgayIROIXd/2nQI7kaEe7D7zEM=;
        b=aFChJlXrWtiMqjRs+K+ZDRJ+HjaLVbXc7uST7+1Tz2invoFsg1DkmkPhKs+U5CLtFS
         6c8FQP3NWjdqn8jv81nnt1/5d32i3s7a92PZ9ssAQ1PvaV2E2V3ZH4CbRBJJV4OEjfqR
         KC59MmYj7ykgSrDftn9FhQNo9XyUAQtKVE/8b+fpkyWIOS9XGPI3sB4QYGLDia5M4phD
         JbStSstHFtfJYqiNmj4eNJaTJdCJ4a5A4pVBmLm4KkXLqT2kXYQ+OeFgANrTvKo5uya4
         X6x9dJvXF/e/Wbq3b3CG+QOE9BrtHMY3MQpoAuRhQwnoKW76PUcwp0AV99UYw5VBKo1+
         +gYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eW5/IB9F0YU5jMiK2TgayIROIXd/2nQI7kaEe7D7zEM=;
        b=zYoO+t6vi8lqaUY6SWdGS7vc1CEy/4TbkUR7txJvb2H1hmkqbHIR4jPxt+9NYrFyta
         TeWnRsqsEc/p0a8JYLM+ZMlirDU/hfQreApnaOloHhrOKIe6tAS9Y4d4MRnSmkh5IQs+
         V0713q5+n3hkqhTa+VQRUEDBmVV07XuG2I3doQlZRPROCsOIQM6B4wTnEZG01K8QqYJo
         7vqhAobpPJ0eKERQNUXyjzyZsg8S0nXsLOmFpdsVji/uaQ4xqjTzXnwOAGkTzTCftpyh
         G4vsIi3t62sKX0JpOrcCosHhsnp+AzyST6ek6h92AMxrTUuGv5CTEZI864M8Rtk3D/Rg
         oeYw==
X-Gm-Message-State: AO0yUKUrCeIbb9gfCh7a/UIORGmEOwntHSrtLJ7z3p/Eadp+5aaMK+LT
	V2/LMEu4yNP8gCM05P/1gScZnV0TzEU=
X-Google-Smtp-Source: AK7set/1ooOfoEzS/KINe2zxtNf7BZmWL8TyXRDbF5bGxEE0tq5DsUcThgzg8zaoH9bBpmpqfvpEhg==
X-Received: by 2002:a17:906:fa18:b0:878:54e3:e3e1 with SMTP id lo24-20020a170906fa1800b0087854e3e3e1mr3559535ejb.73.1675778364563;
        Tue, 07 Feb 2023 05:59:24 -0800 (PST)
Message-ID: <916d173e-16c2-8cde-5815-e8c0396eda04@gmail.com>
Date: Tue, 7 Feb 2023 15:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] xen/device_tree: fix Eclair findings for MISRA C
 2012 Rule 20.7
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
 <20230203190908.211541-2-burzalodowa@gmail.com>
 <F9BF9B83-7889-4D51-B0B3-09950071AB75@arm.com>
 <63d81215-fd4a-e2f2-e145-3ee115b7df14@xen.org>
 <a8056218-34d6-71b2-8034-42dcf6f37a1b@gmail.com>
 <43562da4-53a1-df7a-dcf3-2af62a95f42d@xen.org>
 <30f5c980-0d90-a293-0542-1c967dbae41b@gmail.com>
 <7255affa-a0f5-4388-2889-cb523a0246b0@xen.org>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <7255affa-a0f5-4388-2889-cb523a0246b0@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Julien,

On 2/7/23 15:01, Julien Grall wrote:
> Hi,
> 
> On 07/02/2023 12:46, Xenia Ragiadakou wrote:
>> On 2/7/23 14:25, Julien Grall wrote:
>>>
>>>
>>> On 07/02/2023 10:46, Xenia Ragiadakou wrote:
>>>>
>>>> On 2/7/23 12:39, Julien Grall wrote:
>>>>> Hi,
>>>>>
>>>>> On 07/02/2023 10:23, Luca Fancellu wrote:
>>>>>>
>>>>>>
>>>>>>> On 3 Feb 2023, at 19:09, Xenia Ragiadakou <burzalodowa@gmail.com> 
>>>>>>> wrote:
>>>>>>>
>>>>>>
>>>>>> I’m not really a supporter of empty commit message, but it’s up to 
>>>>>> the maintainer :)
>>>>>
>>>>> +1. In this case a brief summary of the rule would be handy for 
>>>>> those that are not well-versed with MISRA.
>>>>>
>>>>> This can be dealt on commit if you propose a new commit message.
>>>>
>>>> I 'm refrained from stating the rule as is because it is strict and 
>>>> it is not applied as is.
>>>
>>> I am a bit confused with this statement. From misra/..., we are 
>>> supporting rule 20.7. So why aren't applying it strictly?
>>>
>>> And if it is not applied as-is, shouldn't we document the violation 
>>> (if any)?
>>
>> I applied it strictly on v2, but there was no review.
> 
> Ah! In general it is best to ping if there are no answers.

Me too I ve forgotten about it. A ticket in gitlab reminded me that it 
was pending.

> 
>> Then Eclair was adjusted to have a less strict approach. Still there 
>> is a finding asking to add parentheses around dt in 
>> dt_for_each_device_node(dt, dn), i.e dn = (dt);, to which AFAIK you 
>> object.
> 
> Are you referring to the discussion in [1]? If so, I wasn't totally 
> opposed to the suggestion so long we are consistent.

I am not able to find [1]. I 'm referring to the discussion in 
20221220085100.22848-6-luca.fancellu@arm.com and 
20220728134943.1185621-1-burzalodowa@gmail.com

> 
>>
>>>
>>>>
>>>> "Add parentheses around macro parameters when the precedence and 
>>>> associativity of the performed operators can lead to unintended 
>>>> order of evaluation."
>>>>
>>>> Is this ok?
>>>
>>> I am OK with this. Is there any ID from Eclair that could be used to 
>>> track each error (and so we can confirm they have disappeared)?
>>
>> I am not aware of any.
> Hmmm ok. It might be a nice feature to suggest in Eclair because anyone 
> can check whether an issue was resolved.

Currently, the violations in Eclair are reported per macro call (I guess 
because it is acceptable to have parentheses around the macro args) so 
it is difficult to track all of them.

> 
> Here, I don't exactly know what to check in Eclair. So I have to rely on 
> you. Anyway, nothing that can be fixed for this commit.
> 
>>
>> The patch can be decoupled from misra and Eclair (I mean have a 
>> generic commit title) and just mention in the commit message that it 
>> fixes some Eclair findings for MISRA C rule 20.7.
> 
> I have a slight preference for a more generic title. But the current one 
> also work for me.

It can be changed into "xen/device_tree: add parentheses around macro 
parameters"

> 
> I will commit later on.

Do you want me to send a v4?

> 
> Cheers,
> 
> [1] b2f2d1e7-0c18-206f-5e9d-d0115e398840@xen.org
>>
>>>
>>> Cheers,
>>>
>>
> 

-- 
Xenia

