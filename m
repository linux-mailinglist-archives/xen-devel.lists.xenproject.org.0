Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDE768D719
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 13:47:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491094.760055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNN6-0002lJ-B4; Tue, 07 Feb 2023 12:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491094.760055; Tue, 07 Feb 2023 12:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNN6-0002iQ-8M; Tue, 07 Feb 2023 12:46:52 +0000
Received: by outflank-mailman (input) for mailman id 491094;
 Tue, 07 Feb 2023 12:46:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1AP=6D=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pPNN4-0002iK-TH
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 12:46:50 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a2f9646-a6e5-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 13:46:44 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id gr7so42821288ejb.5
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 04:46:44 -0800 (PST)
Received: from [192.168.1.93] (adsl-89.109.242.139.tellas.gr. [109.242.139.89])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a17090611cd00b007b4bc423b41sm6760202eja.190.2023.02.07.04.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 04:46:43 -0800 (PST)
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
X-Inumbo-ID: 7a2f9646-a6e5-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A4k+rnXQ6TJREKovfpvAXDa5QBS1bqrIcrrDJ7G1YV8=;
        b=JqSHkXFCft5o6Q+5EwpCDSEnhnLfsAztRh8okX88L0XMY3Jvvaps8sbN+QhPXr+qia
         KbOR8TQTmQLRR4HRpEsbsgO8qBaHFujZ8neOROWvb1aScstfY8MzJ/dqlC5M4r1a1P3m
         LhqvlA84lYVSpOKyJz9ygiCsiepnL/K+eXcZ7qEee3Go9ANwZnJJow5Mbnvc++ulx6wa
         hK6g9T2JOK84cxUF8CcHg1RXK5qjozmpmi9UDxZc4zhGbl8HZK0bUW4bPKodr2HHO7eq
         eY6otoAhSD5NGG98t5U+O4ZEHZZIX3yrHneSkAAihKENYaRMh64vJuVvNS5xybzWY7jn
         Z/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4k+rnXQ6TJREKovfpvAXDa5QBS1bqrIcrrDJ7G1YV8=;
        b=1DPfcgKdzXOYfqcpapkd9F5CF8leoJqRX3Zd7fTuRwqGb5WO8BecP7bEgE0UrK9URs
         2UTPRpVoQ4mB6AKQYiH6ChlsxnQLFG4z5Em6KoNBtJEPKLR/MjOtkOaAQJJU4s+eUVp5
         mFpVc8EIXN7oYUxJTt9MW/wBe0h8paYNRhm4JK4x+ErcS9OuEfPiWuacTmz8Gk7d8FBk
         QBvQJMhpCeZU0U4WFEwmoXehx3/cfvgxkVYFiYVsCl7Gkhi96Ax9jDba1NBfYLJleJ5Y
         1Od58qrw50NmHseP7YeJvahqoxj5htnQ18IZie/5fFzaEda1PWwq8VlCvNBwk4hRnld7
         XDWg==
X-Gm-Message-State: AO0yUKVIIL40V+73bSX13/oM8QHNizCGE8uOgKMPv0PsDah5wGy037Vl
	5owbgd4P7Ygf9gv9dOM2FZAAWKNQwfQ=
X-Google-Smtp-Source: AK7set8G5Ij8qlCGsH4766eGYLaI975xzSHW+vtGVsnFvgT2USX7UY7D0CdCd2rdvqRUc3CfNygVvw==
X-Received: by 2002:a17:907:8e8b:b0:8aa:1f89:122e with SMTP id tx11-20020a1709078e8b00b008aa1f89122emr1828009ejc.39.1675774004270;
        Tue, 07 Feb 2023 04:46:44 -0800 (PST)
Message-ID: <30f5c980-0d90-a293-0542-1c967dbae41b@gmail.com>
Date: Tue, 7 Feb 2023 14:46:42 +0200
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
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <43562da4-53a1-df7a-dcf3-2af62a95f42d@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2/7/23 14:25, Julien Grall wrote:
> 
> 
> On 07/02/2023 10:46, Xenia Ragiadakou wrote:
>>
>> On 2/7/23 12:39, Julien Grall wrote:
>>> Hi,
>>>
>>> On 07/02/2023 10:23, Luca Fancellu wrote:
>>>>
>>>>
>>>>> On 3 Feb 2023, at 19:09, Xenia Ragiadakou <burzalodowa@gmail.com> 
>>>>> wrote:
>>>>>
>>>>
>>>> I’m not really a supporter of empty commit message, but it’s up to 
>>>> the maintainer :)
>>>
>>> +1. In this case a brief summary of the rule would be handy for those 
>>> that are not well-versed with MISRA.
>>>
>>> This can be dealt on commit if you propose a new commit message.
>>
>> I 'm refrained from stating the rule as is because it is strict and it 
>> is not applied as is.
> 
> I am a bit confused with this statement. From misra/..., we are 
> supporting rule 20.7. So why aren't applying it strictly?
> 
> And if it is not applied as-is, shouldn't we document the violation (if 
> any)?

I applied it strictly on v2, but there was no review.
Then Eclair was adjusted to have a less strict approach. Still there is 
a finding asking to add parentheses around dt in 
dt_for_each_device_node(dt, dn), i.e dn = (dt);, to which AFAIK you object.

> 
>>
>> "Add parentheses around macro parameters when the precedence and 
>> associativity of the performed operators can lead to unintended order 
>> of evaluation."
>>
>> Is this ok?
> 
> I am OK with this. Is there any ID from Eclair that could be used to 
> track each error (and so we can confirm they have disappeared)?

I am not aware of any.

The patch can be decoupled from misra and Eclair (I mean have a generic 
commit title) and just mention in the commit message that it fixes some 
Eclair findings for MISRA C rule 20.7.

> 
> Cheers,
> 

-- 
Xenia

