Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE35FF0C7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 17:06:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422930.669303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojMFf-0000DL-BU; Fri, 14 Oct 2022 15:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422930.669303; Fri, 14 Oct 2022 15:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojMFf-0000Ab-8Z; Fri, 14 Oct 2022 15:05:31 +0000
Received: by outflank-mailman (input) for mailman id 422930;
 Fri, 14 Oct 2022 15:05:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1R5=2P=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1ojMFd-0000AU-Lm
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 15:05:29 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3ab1582-4bd1-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 17:05:28 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id bj12so11051473ejb.13
 for <xen-devel@lists.xenproject.org>; Fri, 14 Oct 2022 08:05:28 -0700 (PDT)
Received: from [192.168.1.93] (adsl-33.176.58.192.tellas.gr. [176.58.192.33])
 by smtp.gmail.com with ESMTPSA id
 qu16-20020a170907111000b00780982d77d1sm1614506ejb.154.2022.10.14.08.05.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 08:05:27 -0700 (PDT)
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
X-Inumbo-ID: a3ab1582-4bd1-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XM/vEqY1i+CYCuAeKwNPHkDv23eUhhqmEnHw/Wdu+4=;
        b=ZFBHc6Pc8vK64Vu9U7uObXS2R1rpQjckhizS42yiHK1KfBleFM0f/dfwzcvll1Geb8
         kmJvVwaRxhOdN2RLoLtG0jL3nWwu64Up6YFJyC9hyOAoLG9DBZ819/rZytEWDK+rOPCr
         GF6S4VhtDZrELzO8M3THX8kcWNfkZo/SMhIDZm6GIyWvEyuhMPsBedMaPpQG2IOpwqFI
         oz45Z6SEcSA29ChvmDWh+f09s8zkbrv5C4UoBDwk8smBJVdSPTRVOVinb/dVetWtNSw+
         EUsnyPh5cth08K5ykA3TUxWwNgZXB0Zig4geFDHBT2RfAphOLwg+wOrUX31nEezx7kZs
         O9EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XM/vEqY1i+CYCuAeKwNPHkDv23eUhhqmEnHw/Wdu+4=;
        b=kd4uEUDiVB4S18Pg/vHf8PhidcRiTnqp2teCvJjfPbW3wB47ulhiVrgouJO5btcq0M
         qrSe1BAZzuGjJCKX93ziZbuTAZP1/jxhv87AGzBpfciy25uibbv2E+SHe3iWmWiWW8Pe
         DK+7EeKr8S20v411ZB8LLXzzJNlzAYY7doAdI9HpGZLN/fRuKR8pqPBXcwIv4lLdOd2c
         6uqS/9R5I6ujqKX2fv/DRlCPwq2tafsyfYMo/UfC2IN7GF5gjvbY0g7B02ZIRC7xd1zq
         AblUKnYZ/MdAJh3NOtAWBCrtBQAR/zesadVJLOoFV4mHcpiD5NpNcC713LYa9Y6fWFyp
         nIWw==
X-Gm-Message-State: ACrzQf29Z+ct+4v2OOFuPGmxDvqcNlAHcQEJrLvD/2XS/g5RpmkyGMTh
	85cVDMZbeoLjZcvUzc34jPs=
X-Google-Smtp-Source: AMsMyM4MnFnJlQVOvRfGXpd0LC7tze/1eZObXZQzXNNiz4fWLJNUZIEFa4MNPsB7xB3kRdG7KxTGZw==
X-Received: by 2002:a17:906:6a8d:b0:741:6a3b:536e with SMTP id p13-20020a1709066a8d00b007416a3b536emr3966452ejr.11.1665759928064;
        Fri, 14 Oct 2022 08:05:28 -0700 (PDT)
Message-ID: <f99f9c39-c374-7d9b-c293-cbc683187698@gmail.com>
Date: Fri, 14 Oct 2022 18:05:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <c1020b65-491f-e1c5-3ef3-7edb99e0435c@xen.org>
 <AS8PR08MB7991F3222D1C616AEF9C771092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2c2b3e8f-34fc-1ef2-c086-233964e29e43@xen.org>
 <03419318-275a-1f9d-6e00-1a3489659f22@suse.com>
 <AS8PR08MB79917792FD8A7695C969020992259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <05c4def0-321e-c864-7d92-b4dfe110d030@suse.com>
 <AS8PR08MB7991AD5D30E4EBADD0A7582592259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <ccca7922-513d-3a9d-c994-f15c23e40812@xen.org>
 <db3a487d-8330-fc68-8659-b6974352e7bc@gmail.com>
 <b11427d2-f25f-b303-bf1c-db5be4806f4b@xen.org>
 <c1b82073-08a5-033f-86aa-3a318f596ef0@gmail.com>
In-Reply-To: <c1b82073-08a5-033f-86aa-3a318f596ef0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/14/22 13:22, Xenia Ragiadakou wrote:
> 
> On 10/14/22 13:04, Julien Grall wrote:
>> Hi Xenia,
>>
>> On 14/10/2022 10:46, Xenia Ragiadakou wrote:
>>>
>>> On 10/13/22 15:39, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 13/10/2022 13:29, Henry Wang wrote:
>>>>>> -----Original Message-----
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>>>> Assuming you have 4 (N) page table levels, isn't it 7 (1 + 2 * 
>>>>>>>> (N - 1))?
>>>>>>>> Or is the root table not taken from the p2m pool?
>>>>>>>
>>>>>>> Correct, on arm the root is not taken from the pool.
>>>>>>
>>>>>> Isn't that a (perhaps just minor) mistake?
>>>>>
>>>>> Not really, in the code review phase, the question of whether we 
>>>>> include
>>>>> the root in the p2m pool was discussed and the conclusion at that time
>>>>> was not including this page for now, as this is supposed to require 
>>>>> a lot
>>>>> of extra work/refactor. Probably there will be a series from my 
>>>>> side to
>>>>> add the root to the pool, but at least not now.
>>>>
>>>> The root page tables can be one of multiple concatenated pages (up 
>>>> to 8 pages). The P2M pool is allocating page by page and therefore 
>>>> wouldn't allow us to allocate contiguous pages.
>>>
>>> Sorry that I 'm asking this so late (I was just going through the 
>>> thread) but why 8?
>> Rather than providing an extra level of page-tables, the architecture 
>> allows you to provide multiple pages at the root level.
>>
>> The number of concatenated pages depend on the maximum physical 
>> address and the start level. You can look at the table in 
>> setup_virt_paging() for more details.
> 
> I think you are referring to this:
> [6] = { 52,      12/*12*/,  3,          3 },
> Still I cannot understand why the maximum number of concatenated level 0 
> translation tables for t0sz 12 and 4KB granule is 8 and not 16?
> 

Let me explain. Initially I got confused because according to the manual 
up to 16 translation tables can be concatenated. Then, looking at the 
code you have pointed out, I understood that you were referring to the 
maximum root order in the table below.

pa_range_info[] = {
         /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
         /*      PA size, t0sz(min), root-order, sl0(max) */
         [0] = { 32,      32/*32*/,  0,          1 },
         [1] = { 36,      28/*28*/,  0,          1 },
         [2] = { 40,      24/*24*/,  1,          1 },
         [3] = { 42,      22/*22*/,  3,          1 },
         [4] = { 44,      20/*20*/,  0,          2 },
         [5] = { 48,      16/*16*/,  0,          2 },
         [6] = { 52,      12/*12*/,  3,          3 },
         [7] = { 0 }  /* Invalid */
     };

I think that the pa range info for the 52-bit pa range is wrong.
IMO, it could be either
[6] = { 52,      12/*12*/,  0,          3 } i.e single level -1 table
or
[6] = { 52,      12/*12*/,  4,          2 } i.e 16 concatenated level 0 
tables
Hope I am not totally out of context.

>>
>> Cheers,
>>
> 

-- 
Xenia

