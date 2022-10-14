Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB665FEC7B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 12:23:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422679.668873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHq4-0002aG-3s; Fri, 14 Oct 2022 10:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422679.668873; Fri, 14 Oct 2022 10:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHq4-0002XT-15; Fri, 14 Oct 2022 10:22:48 +0000
Received: by outflank-mailman (input) for mailman id 422679;
 Fri, 14 Oct 2022 10:22:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1R5=2P=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1ojHq1-0002XN-NB
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 10:22:45 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 245642e5-4baa-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 12:22:44 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id m16so6230232edc.4
 for <xen-devel@lists.xenproject.org>; Fri, 14 Oct 2022 03:22:44 -0700 (PDT)
Received: from [192.168.1.93] (adsl-33.176.58.192.tellas.gr. [176.58.192.33])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056402195300b00459cd13fd34sm1547838edz.85.2022.10.14.03.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Oct 2022 03:22:43 -0700 (PDT)
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
X-Inumbo-ID: 245642e5-4baa-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBZUM/Jv1MdF2Bh+mA9y2+o4wBcaHGU1MnQFABLd7uo=;
        b=AUMrIHLVHO5ZM+MGHsDetmM2D/2TkyEAJ4niDE4WITdsMpBIDNLC1nC4+zau+jVURn
         Bh2JNDfyTAYB2q02Dob79WvG1ucRDQJBVbLY8OC6TxPTZPUFIyMi+lpYNXkFydIUc87E
         4blFBf/1nRUgO63Ao6wyDBowEEqraOo6ptlKZG5beAmjo4v5R1XbbLzjJrZhcOQV4eMs
         vCADou5CdHTz4RtcMB+jmVe81fPsnP7mimsPa9sgPhtHVPQyQiTo/HEqCON3sU8opZBh
         tMPK/T/nEm81UZRqEMzHfrM/hiQ6az9DUfIK2qisPZh9f7OcJXmY22MY8snnp1h9Vs2n
         3l2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBZUM/Jv1MdF2Bh+mA9y2+o4wBcaHGU1MnQFABLd7uo=;
        b=IED4x1ENpWuaTh+NHS8OEU3aixO2nOUor7WsQTMEEfvW+JtAKqF1a6DGxjbYoDX8sB
         SYx3qDUOYVDMtL/pTmF/GMNAKFYcbDnP2zxzHk8odLPx+iKeSylDtlFTKxIatgbpEPg6
         /KAgIV7JlZnUMdurCtdmmYWeH5uj1MeW2tZcx9nLrCp+8AnSUFozni2NqKgTtHXzL7ma
         8FrWeDN8rft+QCydWwrUV/LZ+yPU66A9PqpBaZUgeS2M5zuM4tfGS5l8LTlwJz5J+Ewr
         ZsFZkhH0taHU5Etqbjon3qlSmeqKwVcN1ZTmikj4h993qTsfW+B5uVA8ZnnGVR1p77sm
         w99w==
X-Gm-Message-State: ACrzQf2M814RJkqAUNg0OARk+RBb9ywnt1fLPutFm0wuAm4sQWLaizW1
	qqVj4G0+cetqMK9LQO08TTU=
X-Google-Smtp-Source: AMsMyM4tZ8IbyjhLoMg3v03Aujjc8Dj1AV7xbi7058g8FXBZ9l94GmA1GjkvLjwq/YEOuZvkxLfLEA==
X-Received: by 2002:a05:6402:28a1:b0:458:81c0:a379 with SMTP id eg33-20020a05640228a100b0045881c0a379mr3634359edb.388.1665742964062;
        Fri, 14 Oct 2022 03:22:44 -0700 (PDT)
Message-ID: <c1b82073-08a5-033f-86aa-3a318f596ef0@gmail.com>
Date: Fri, 14 Oct 2022 13:22:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
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
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <b11427d2-f25f-b303-bf1c-db5be4806f4b@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/14/22 13:04, Julien Grall wrote:
> Hi Xenia,
> 
> On 14/10/2022 10:46, Xenia Ragiadakou wrote:
>>
>> On 10/13/22 15:39, Julien Grall wrote:
>>> Hi,
>>>
>>> On 13/10/2022 13:29, Henry Wang wrote:
>>>>> -----Original Message-----
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>>> Assuming you have 4 (N) page table levels, isn't it 7 (1 + 2 * (N 
>>>>>>> - 1))?
>>>>>>> Or is the root table not taken from the p2m pool?
>>>>>>
>>>>>> Correct, on arm the root is not taken from the pool.
>>>>>
>>>>> Isn't that a (perhaps just minor) mistake?
>>>>
>>>> Not really, in the code review phase, the question of whether we 
>>>> include
>>>> the root in the p2m pool was discussed and the conclusion at that time
>>>> was not including this page for now, as this is supposed to require 
>>>> a lot
>>>> of extra work/refactor. Probably there will be a series from my side to
>>>> add the root to the pool, but at least not now.
>>>
>>> The root page tables can be one of multiple concatenated pages (up to 
>>> 8 pages). The P2M pool is allocating page by page and therefore 
>>> wouldn't allow us to allocate contiguous pages.
>>
>> Sorry that I 'm asking this so late (I was just going through the 
>> thread) but why 8?
> Rather than providing an extra level of page-tables, the architecture 
> allows you to provide multiple pages at the root level.
> 
> The number of concatenated pages depend on the maximum physical address 
> and the start level. You can look at the table in setup_virt_paging() 
> for more details.

I think you are referring to this:
[6] = { 52,      12/*12*/,  3,          3 },
Still I cannot understand why the maximum number of concatenated level 0 
translation tables for t0sz 12 and 4KB granule is 8 and not 16?

> 
> Cheers,
> 

-- 
Xenia

