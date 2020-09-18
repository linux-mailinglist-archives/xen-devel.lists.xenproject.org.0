Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EC02705F0
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 22:04:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJMbL-0000Kf-Ir; Fri, 18 Sep 2020 20:03:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WmPg=C3=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1kJMbK-0000Ka-Mp
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 20:03:22 +0000
X-Inumbo-ID: 3b4a73ee-5442-4e80-9b7f-8b5699101f8a
Received: from USG02-BN3-obe.outbound.protection.office365.us (unknown
 [2001:489a:2202:c::60b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b4a73ee-5442-4e80-9b7f-8b5699101f8a;
 Fri, 18 Sep 2020 20:03:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=V+fRqaGPCMFhe8BcZFC1VZZJbh4pmyo0UHgshP0HtcnLAjwELOGPMJFEvssgpArSKhR7qSA3F/uQE/EBWAr5YFcuFUnjWh3u5P/Sb9U/zSOP3t0CV31JrV3DcWXOSQfmrDZBNUOK4WALp8BTH6YJuHIP81Bk39K+s6m0GF5rAQK7HySp52LDvWYxCnzGHWwYWBPWXOJaRq23PkqRc6NImCaklgTbFmdyaenzLqrYS2TGKXz5Kg38x27QJRMR2XgjiTWPwcikSgb8WnE9u29BFHjquxPqwYzKRodmNCAWAjuzy6XGn0bX7vF2MYu+Y6VWoctlk+HlwQZ7ExiMqWKYmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxsiZelw2QgMvd1+sKx1qz1A2r3ZPiqCBZyF+TiElNE=;
 b=hOr8lT/Sj1jYr4WcOwJTur3MlczCnwu321E4xME9rRp9O13ZefWbCE3aqHYGO7Y5Zpq7b36VegVRAGXSHAp5ozHKFEmnAfaf3mpo//z6sk2mcVZX2lo065R4k/Fhnhfu3vGi/OuxzDR4m7IReQK94mUmy3JXX6eprSOvfn+vDmoFlXgBwnecQtPb5u7A90+H07sFtD4KAV9zI2nqqDT8Cj43BSFHZh3n5Q6K3NpKindmbjkTriIyoUtWPCGGNT3XgYTOLV9fODMjOW1u0aGAUbXbDDT93XD3+S9qNRcvWjuifPHEQFzR9H5xqkIlcRk7opr12Yq961xBuumBs6pB3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dornerworks.com; dmarc=pass action=none
 header.from=dornerworks.com; dkim=pass header.d=dornerworks.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dornerworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxsiZelw2QgMvd1+sKx1qz1A2r3ZPiqCBZyF+TiElNE=;
 b=DO9y+Y/yg7NXzNz6RI2J1bLNihcMyKLYqZMxXwdTJcmM9ihpp5VjpiBctIwXFZy/e1ImrvIKn5ig00t0VQSj1EixlyKncDluBcW77za3A8npGqC+umCObHKrXLKEslaF9JrBNPu9wegz4CsBe5+HQkfDi5hLLgTNnFBYUJ11cVjQ83EHfJHDJpZiVVuZ5t3zu7HMCROYj4vnY+RBm7ftOgQmoM65Pu4Va5aXc8n9/S9ZUsRY2g/7dfyemsBuXVRrB+stZo/wwQfaOt1WrOI3xQwJvLzZHU2oVMPWvnTK1buYq8r0c2VQh9HVe8uzYO+gHEjtQSefzhQ9sN/x3XbZSw==
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none; citrix.com; dmarc=none action=none header.from=dornerworks.com; 
Received: from CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM (52.145.0.137) by
 CY1P110MB0086.NAMP110.PROD.OUTLOOK.COM (23.103.15.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15; Fri, 18 Sep 2020 20:03:14 +0000
Received: from CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
 ([fe80::107b:2f78:fa10:843b]) by CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
 ([fe80::107b:2f78:fa10:843b%4]) with mapi id 15.20.3391.019; Fri, 18 Sep 2020
 20:03:13 +0000
Subject: Re: [PATCH 5/5] sched/arinc653: Implement CAST-32A multicore
 scheduling
To: Dario Faggioli <dfaggioli@suse.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: xen-devel <xen-devel@dornerworks.com>,
 Josh Whitehead <Josh.Whitehead@dornerworks.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20200916181854.75563-1-jeff.kubascik@dornerworks.com>
 <20200916181854.75563-6-jeff.kubascik@dornerworks.com>
 <d2973002-86b5-17b7-cbfa-ba235af75ba3@suse.com>
 <CY1P110MB055125447405A5DA2202BF028C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <5b758105ee47638c36ef19eb3804b76ee19020a8.camel@suse.com>
 <CY1P110MB0551518BC91E77341A9A37718C3E0@CY1P110MB0551.NAMP110.PROD.OUTLOOK.COM>
 <960f5e3b5a27326cd18ecb44a96f22bcf94f2498.camel@suse.com>
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
Message-ID: <16401afe-9dfc-48d6-1fd5-bcfb519417ad@dornerworks.com>
Date: Fri, 18 Sep 2020 16:03:31 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
In-Reply-To: <960f5e3b5a27326cd18ecb44a96f22bcf94f2498.camel@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY1P110CA0043.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:400::13) To CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
 (2001:489a:200:401::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 CY1P110CA0043.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:400::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Fri, 18 Sep 2020 20:03:13 +0000
X-Originating-IP: [207.242.234.14]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d9052fd-2588-42eb-c11f-08d85c0de01c
X-MS-TrafficTypeDiagnostic: CY1P110MB0086:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY1P110MB008640E1B85567C366685759E93F0@CY1P110MB0086.NAMP110.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(31696002)(86362001)(31686004)(44832011)(2616005)(5660300002)(956004)(2906002)(6486002)(66556008)(66476007)(66946007)(16576012)(53546011)(4326008)(36756003)(186003)(54906003)(110136005)(26005)(52116002)(508600001)(8936002)(6666004)(83380400001)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: dornerworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9052fd-2588-42eb-c11f-08d85c0de01c
X-MS-Exchange-CrossTenant-AuthSource: CY1P110MB0327.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 20:03:13.8775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 097cf9aa-db69-4b12-aeab-ab5f513dbff9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1P110MB0086
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 9/17/2020 1:30 PM, Dario Faggioli wrote:
>On Thu, 2020-09-17 at 15:59 +0000, Stewart Hildebrand wrote:
>> On Thursday, September 17, 2020 11:20 AM, Dario Faggioli wrote:
>>> On Thu, 2020-09-17 at 15:10 +0000, Stewart Hildebrand wrote:
>>>>> It might be worth to consider using just the core scheduling
>>>>> framework
>>>>> in order to achive this. Using a sched_granularity with the
>>>>> number
>>>>> of
>>>>> cpus in the cpupool running ARINC653 scheduler should already
>>>>> do
>>>>> the
>>>>> trick. There should be no further midification of ARINC653
>>>>> scheduler
>>>>> required.
>>>>>
>>>>
>>>> This CAST-32A multicore patch series allows you to have a
>>>> different
>>>> number of vCPUs (UNITs, I guess) assigned to domUs.
>>>>
>>> And if you have domain A with 1 vCPU and domain B with 2 vCPUs,
>>> with
>>> sched-gran=core:
>>> - when the vCPU of domain A is scheduled on a pCPU of a core, no
>>> vCPU
>>>  from domain B can be scheduled on the same core;
>>> - when one of the vCPUs of domain B is scheduled on a pCPU of a
>>> core,
>>>  no other vCPUs, except the other vCPU of domain B can run on the
>>>  same core.
>>
>> Fascinating. Very cool, thanks for the insight. My understanding is
>> that core scheduling is not currently enabled on arm. This series
>> allows us to have multicore ARINC 653 on arm today without chasing
>> down potential issues with core scheduling on arm...
>>
>Yeah, but at the cost of quite a bit of churn, and of a lot more code
>in arinc653.c, basically duplicating the functionality.
>
>I appreciate how crude and inaccurate this is, but arinc653.c is
>currently 740 LOCs, and this patch is adding 601 and removing 204.
>
>Add to this the fact that the architecture specific part of core-
>scheduling should be limited to the handling of the context switches
>(and that it may even work already, as what we weren't able to do was
>proper testing).
>
>If I can cite an anecdote, back in the days where core-scheduling was
>being developed, I sent my own series implementing, for both credit1
>and credit2. It had its issues, of course, but I think it had some
>merits, even if compared with the current implementation we have
>upstream (e.g., more flexibility, as core-scheduling could have been
>enabled on a per-domain basis).
>
>At least for me, a very big plus of the other approach that Juergen
>suggested and then also implemented, was the fact that we would get the
>feature for all the schedulers at once. And this (i.e., the fact that
>it probably can be used for this purpose as well, without major changes
>necessary inside ARINC653) seems to me to be a further confirmation
>that it was the good way forward.
>
>And don't think only to the need of writing the code (as you kind of
>have it already), but also to testing. As in, the vast majority of the
>core-scheduling logic and code is scheduler independent, and hence has
>been stressed and tested already, even by people using schedulers
>different than ARINC.

When is core scheduling expected to be available for ARM platforms? My
understanding is that this only works for Intel.

With core scheduling, is the pinning of vCPUs to pCPUs configurable? Or can the
scheduler change it at will? One advantage of this patch is that you can
explicitly pin a vCPU to a pCPU. This is a desirable feature for systems where
you are looking for determinism.

There are a few changes in this patch that I think should be pulled out if we go
the path of core scheduling. For instance, it removes a large structure from
being placed on the stack. It also adds the concept of an epoch so that the
scheduler doesn't drift (important for ARINC653) and can recover if a frame is
somehow missed (I commonly saw this when using a debugger). I also observed the
occasional kernel panic when using xl commands which was fixed by improving the
locking scheme.

-Jeff

