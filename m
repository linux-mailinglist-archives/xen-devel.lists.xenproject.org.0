Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEB53B7E4F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 09:44:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148147.273712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyUt4-00072v-87; Wed, 30 Jun 2021 07:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148147.273712; Wed, 30 Jun 2021 07:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyUt4-00070q-59; Wed, 30 Jun 2021 07:43:58 +0000
Received: by outflank-mailman (input) for mailman id 148147;
 Wed, 30 Jun 2021 07:43:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmAy=LY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lyUt1-00070g-SM
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 07:43:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20bbb1a3-422f-464d-8c28-9b299aecb694;
 Wed, 30 Jun 2021 07:43:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-5tJjxN5pOqaViFIvHDltmQ-1; Wed, 30 Jun 2021 09:43:52 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6173.eurprd04.prod.outlook.com (2603:10a6:803:ff::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 30 Jun
 2021 07:43:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Wed, 30 Jun 2021
 07:43:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0043.eurprd04.prod.outlook.com (2603:10a6:208:1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Wed, 30 Jun 2021 07:43:49 +0000
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
X-Inumbo-ID: 20bbb1a3-422f-464d-8c28-9b299aecb694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1625039033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l3FgzD2nb1eGianYjmDXgYghYrlnkqyxQmlsrx7Fo7E=;
	b=XZsqoG5+lHqbH/N/W3DmiI2ncBEw6jdOuJXZochj6TTghT3xJBAC36wk2VNXR8mToqfz/e
	vkcYcndl0bAiVQMJvVXS6OBhygh7C338v2uMjzXPzawMCHnS3W9WWo2+2091y/OJAFBv0R
	Gtv1Hogq5tLHzYyQPhJKK8xVoFh+vyU=
X-MC-Unique: 5tJjxN5pOqaViFIvHDltmQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYPfHlSFOIc0t9YKZCWNq94cBQagNCHjcd759xvdDzc9uua5nI6Of3DXvY0EUDOHzO6ELsq+C4rGWnZ931YQh0arhW42yiNhR8ApEunct01MIcP3I2uw0rGLrHLrmVg5nYkrPR6lG+5IvkJCTAD1wq1spnYM3cCgiBIyphGwTUIyj9QKyoQXG6cNxcUIkc7NrfMqWIzy6m0LsAyhirhDYrx9s1McusVC2LVYhQg1RtghlVqQqqWZfoSG6whS2NkukBWnP1Yh+zapLaWZm6/caRjPinAC/hXZOaJ8d1lS75s5R2GqnwOS/+0k/tlsVZ109pb/lAHHgJe70lUqftAGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3FgzD2nb1eGianYjmDXgYghYrlnkqyxQmlsrx7Fo7E=;
 b=lmjDcCVUG5QH6c8NMrWaOX0ncP6fgSu+07g0zSH2IzHVLbke6u3KmaGHeD23Hu4gRvhoNn8E/7tjkGkf7BBXnh2KNpolGUqJ1BpOx1+igQV4vD8lw9U541/ZAjkexkEpNCqa4Nui5ITxMnKN75clNBunEiskKeQkjxcVARGVE7OYWazVPW8M7IjgC65zIXBGTit9HH7iyK01CT9B2HJDMCZfu5HLXd8rVgXiEqOi0+rKUmtQWZxLqG407MlsN6tUZyMOS4dhPwAhPrZ9J4TM9bSTR46psOEft9av14KxlWCpD0OvMzDr5HN+7juOSAQvIKDDJlJ92040KT0WsAJItQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Ping: [PATCH v4 3/3] unzstd: make helper symbols static
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>
References: <12054cba-4386-0dbf-46fd-41ace0344f8e@suse.com>
 <759c8524-cc01-fac8-bc62-0ba6558477bd@suse.com>
 <cb8fa703-f421-ce55-811a-d4a649bc201a@xen.org>
 <1696e5f2-481a-5a7f-258d-b2a0679b041f@suse.com>
 <f6e00fd9-a207-858e-37e8-fb25427cf8de@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a083cb0-9131-adbe-9be6-bc1ee3028eb0@suse.com>
Date: Wed, 30 Jun 2021 09:43:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f6e00fd9-a207-858e-37e8-fb25427cf8de@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR04CA0043.eurprd04.prod.outlook.com
 (2603:10a6:208:1::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11019529-c348-41ab-c7d2-08d93b9acd10
X-MS-TrafficTypeDiagnostic: VI1PR04MB6173:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB61730572827E6D50D1F55289B3019@VI1PR04MB6173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	90WppSXJaK8PrDQcrDLj8yFmw5nfb4kv9Z6HOo6wax6Kj7EoFhLP87MoEKJXeVHLSWuWmhxeeZSRjOZceJh44hlMFodg4wMDfzxhovQzSTK9FrriZcsx5ccINUYoO8lvyjH3HQB28nRAVGYBQWu38UkwWC5Aw2tKT0VmNvj/cvl26KAkg0cA9YOX78MJbrxhbsJ4qk/nM/c+vqjdyE2mTk8488wCfhZ5gwB6GM7+mqzBosGNX9KCiYWA5kLWu5h36mhpDSpSlo7xjDYq+u287tfrrhGae8irNOpWleZYBdoahsqHRGwwdamd/q5/uZeYN6f++DukrrcE2mL9bcCSspoGzO8p685h319RcH2mp5VRufXwmFrAi0rTIY8OUWrf3Y7diH5OMxKVpTiysukFVUgUTfQEYV/VCIsPj49WUGHIAo0SprUArEISzK/PsGv8izbkMlYwV4pLj1kiKYuTk+z0eoDRsGWc0tSMDR7YCpUa/ttqRPEC71gyd30T3pgtXNVxa2t/SgZbEkuTNKPqI5hHjfW3Nfx4LvXUqAPwiMsAig9vdr6Mf9wbtMnltBb2ofg6fXZzI01r/SokkVilQh1GQiSBHR5uJTJQNrqMC1Nggca5x69yVplowuspm/CA6/aMic+ZN5mNwgbUlI51qUhz4u/qGRxV62bORBAkrY1NCSLLBNX5EkFbv4RL1MOG0KPPqF7IdePgdj64aSqhKU4LuVzrUB1doH7irYUD4+Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(136003)(39850400004)(346002)(186003)(38100700002)(4326008)(16576012)(316002)(31696002)(86362001)(110136005)(36756003)(2906002)(53546011)(31686004)(16526019)(6486002)(54906003)(26005)(83380400001)(66476007)(66946007)(5660300002)(956004)(478600001)(8936002)(66556008)(2616005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uy9HTU5lUXB5TGo3YitrclplYnNITUNtcHk0TFQ2eU80dVY0UWNuRXc4Yzcv?=
 =?utf-8?B?VVdwbDhLUjVhVXR0Skw2RnFhZFFKdXVVaHBqZmxuZ2ZxTitoZUtlZmdIRXpa?=
 =?utf-8?B?SXdqTjFpRmZpMjBWNHhnYmQycmpMbGx5amM5VUlyVHJKWHhTNnBqNmdWQ3BN?=
 =?utf-8?B?TW5JYUFCNUROelZJSkZLNjZQRkxrWXVHM2k5RHN6OTB1d1NxVkpIbThXOUQy?=
 =?utf-8?B?RHpIVnFmQ09WRDJyOXhlVkQzUDIrS1ZoZUpyb2M5ZXpPSXM2bEhIaGQxMnNn?=
 =?utf-8?B?cS9Bb0k3VUswRWxDc2RIRHRzSmFQMjRBMFozRGZiaktxWGRVVmYrNmZlQ21W?=
 =?utf-8?B?QmNoVXY2am03NVIrcERnTlVFV0lFZmwzVkJzeXcxR29SdUFVb0JZRlo2dXdQ?=
 =?utf-8?B?SURNaFhQWG16ZERoMzVYYllITU1rQ2RpU1VPTEo1ZUZxZi9SU2Q3WE0xK1Nq?=
 =?utf-8?B?aDhMQ3lqNnZNRHEyTURuL0NnNHREUUhldGRWcFROWTBBSjVObnRSMVRqbENv?=
 =?utf-8?B?cWZzSC9aNVVuTVpUOE95RUZ6enRkZWZ4WnpTRlJNK3EvSE1IOTNIL0pyeCtk?=
 =?utf-8?B?dTRUczczUlloVWpYSEZVcVJQU2d2ZWROTUR6WEYrS2gvSjdVSGE4TkMwRGs0?=
 =?utf-8?B?ZVdjaUcxM2xHSWJkNUNyTFlSY0t4akVIbHlMN211Z0IxQzZlUWhRTnBjcmxm?=
 =?utf-8?B?cE02V2RvQzllTnoreStIcUdXNXA5UTZSRlQ5MmRkOVRPaWg5U1l4aEJYaXd5?=
 =?utf-8?B?Sk1XdzBFOG5vNDdka29FZzlHOHZFVnE2OWFvS2N0Zzd2YUUvRlh1dmt0SjlG?=
 =?utf-8?B?VWJtMXEyV2FUOHp6K0lrTVBVNUd2T3ExWnAwZ3M2d0FlL3Q1RjVhY3lkdHlo?=
 =?utf-8?B?ZGFKcnhXVnJkL24wNmlSUXFBOFZQVzI4OU9LTjBOL1N4VlNxS000dGJUbmRM?=
 =?utf-8?B?S1JBd3VEK21VVTQydGw0VnNtcGRxRmRJN1ByalB4QllkRHFiUTBWRTZWeHJP?=
 =?utf-8?B?NFkvYk5CNjJOVityckVnZ1d2ZGRTV2ovanlkYkVuRGFsMVpXbkxpM2NiWXg4?=
 =?utf-8?B?Rjh0d0dXSFZWMkZvUWlFbkdwVlp4cDlvazhoNzZXMEdjNlFRRndJTkhCY3FP?=
 =?utf-8?B?LzlXelRuN3AxNWhORWNRUzZ0SEQwMEpEOUlHalNKOXlrRExXVEVZdzNKbUgv?=
 =?utf-8?B?MldNWnZXaXozNVp4ZHNBTko0OUY0RmQyYUhDK0d5UysrWmJ2QVZXR1ZEWlgy?=
 =?utf-8?B?WC92L0sxbGpKTUsxalF6bHUyaks1NjFyT1NwYjRSMFdRRVI3REZrSFRkNGo2?=
 =?utf-8?B?K3dwcHl5cnhOYUNXWGI3ZFNuMzE1R0lQaXMvbG9iRUNCdnJUdW5uN2orSTZO?=
 =?utf-8?B?T1ZENTBsTWt2MG41cFQ0OHNWaUhZeDJNQ2lMMFM0K2JlaG8reG4zVDZIZ3Y2?=
 =?utf-8?B?NTRqR0RVOWMzalI3L25YRzNBbWpTbGNWSzFpZ0lSRTlQdzdxSEhCdEltWitJ?=
 =?utf-8?B?Mi9NSTNBZFIvWG03SU45aGRJeTY4Q0JIb0lFcGhpazJEaGZSaHI1S0xLcVA3?=
 =?utf-8?B?UXNLRVByN2hMWjlqcmQ2YkxqN2FrUGxlQWZ4ZHZCV3Y0Z1hCSDF1dUNVVmt4?=
 =?utf-8?B?a0w0VDN6aWpDUjk0RGZranJtVkVwTnJ4Q1pObGhjWkhvby93aEpmczRjYUZF?=
 =?utf-8?B?TU9XSWVuQUl6NTZza1Q0S2hLR2FGbmxITzRPcGNUYlFpVnlOVzBOdGhjY1NT?=
 =?utf-8?Q?0o1Es8ovWMqzeUzuqg6JQy4ED3ij4uPm9xM6EQv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11019529-c348-41ab-c7d2-08d93b9acd10
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 07:43:50.2826
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmuOND+0VPOzLhH09ctalV+0gjWNtKzorOh+mKshMA5H+gH8xoXI86qqWDVd/HXwBJkBoy5jPPg0IQabnfAQ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6173

On 05.05.2021 19:35, Julien Grall wrote:
> 
> 
> On 29/04/2021 14:26, Jan Beulich wrote:
>> On 29.04.2021 13:27, Julien Grall wrote:
>>> On 21/04/2021 11:22, Jan Beulich wrote:
>>>> While for the original library's purposes these functions of course want
>>>> to be externally exposed, we don't need this, and we also don't want
>>>> this both to prevent unintended use and to keep the name space tidy.
>>>> (When functions have no callers at all, wrap them with a suitable
>>>> #ifdef.) This has the added benefit of reducing the resulting binary
>>>> size - while this is all .init code, it's still desirable to not carry
>>>> dead code.
>>>
>>> So I understand the desire to keep the code close to Linux and removing
>>> the dead code. However I am still not convinced that the approach taken
>>> is actually worth the amount of memory saved.
>>>
>>> How much memory are we talking about here?
>>
>> There are no (runtime) memory savings, as is being said by the
>> description. There are savings on the image and symbol table sizes
>> (see below - .*.0/ holding files as produced without the patch
>> applied, while .*.1/ holding output with it in place), the image
>> size reduction part of which is - as also expressed by the
>> description - a nice side effect, but not the main motivation for
>> the change.
> 
> Thanks for the providing the information. I have misunderstood your 
> original intention.
> 
> Reading them again, I have to admit this doesn't really change my view 
> here. You are trading a smaller name space or prevent unintended use 
> (not clear what would be wrong to call them) to code 
> maintenability/readability.
> 
> At the same time, this is not a code I usually work on (even if I am 
> meant to maintain it). I will leave another maintainer to make the 
> decision here.

May I ask for another REST maintainer's view here? If there's support
for Julien's position, then I'll at least know to drop the patch. Of
course I'd prefer it, or a stripped down version of it, to go in.

Thanks, Jan


