Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0035F5792F1
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 08:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370323.602004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgIs-0004bL-SO; Tue, 19 Jul 2022 06:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370323.602004; Tue, 19 Jul 2022 06:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDgIs-0004Yg-Pj; Tue, 19 Jul 2022 06:01:54 +0000
Received: by outflank-mailman (input) for mailman id 370323;
 Tue, 19 Jul 2022 06:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UBo5=XY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDgIr-0004Ya-Vb
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 06:01:53 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150042.outbound.protection.outlook.com [40.107.15.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 491515b8-0728-11ed-924f-1f966e50362f;
 Tue, 19 Jul 2022 08:01:52 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4181.eurprd04.prod.outlook.com (2603:10a6:209:4c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Tue, 19 Jul
 2022 06:01:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 06:01:51 +0000
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
X-Inumbo-ID: 491515b8-0728-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcmWj09X9hHaXFeTU73RgL03Dgu2Ftc/+DudZhd2pxPzeGSwMlbjxgce7+rbZxTDQOo4AnEmIAWdlm2hH/RF23jPqpIqnCPHnkUZT2X31MBxOXNLA+rXBVy2n2tKdwbSeq8X3SNeO4CqiYOSCgMquQmGsKOxXOl9CezrY/6DSeO14lFxSipCWfxMLPYemCzQ269vCeo6Nv9Ku+FnJ4X+HG7G9UOAnTGXWpJ1APVkB4+GZrJMGTLX/D1GQ6ew9d5poA+1WigRE6/ZPp/GDl0AydkJSijIoRaYyJeadlnWM9j6W3CIrp455sAjO6y5uqHDhRbeihSfih8fqAeMZZSPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWtTCuPicoezP/G+P6t0Ki2TwDIoxh3zWYKsjWIG8wY=;
 b=haPytklIX+VfQy2mOwudqT/MmVxZVbFPct/BlIQ8iqAqJX6WmF4rUKVQHvqx4sAZGtLbVPZ8h4uH+YYIm44oT4fbdOHWiUMWt9uPADb/Fl1OUu0lpiK0hqyZ7JZvZrpDf/UBPJQF/caJ7B2p1k/YHjZ38uvE6HO5ZIYH6vBJEY/p6BBZg9UmEk5BH1XfHNwnWZOzfe2+HE93EZjrtWo0jXtmYJxq7a2HRqTTnuK+gFDBsKNz9+3aiLIwCy4CVLaRX48jiFLD/FUxOQtamtYT+Csul1QtPEYb+BRCDHJ4XG7WlMr09Af3ZCqHYucoH13N1CCvnuoOQbV7h5XRtRRRNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWtTCuPicoezP/G+P6t0Ki2TwDIoxh3zWYKsjWIG8wY=;
 b=mKwA0ZPuKBk7UDTpPDYTgbt8/9Iowg/aojCChDw80Ar9RLQuI/LcvBUh3++X64k6DR4aDQi2j2ZIjT8b0UcvC/hqRA8VOVQUqq0HrwBOa0Yg+BaOuVwYnAcBxHk9oSR8ic3RLz3j+bQralSsxG9RzKU4rF3KLg9B5/dcGlRkPGUbrYtpyt/X3nI+072IHSnWsnZqVaHH5t6gZ6eNf3okunZDqbVK1eduYThlTdheaMTIMuz5gGWLAKc5Iob87gOwnXAckmF6ANBQY8cMAeH1z6Pzf1NTRdjeXVRtGuDWHfZUsG64g9zfQJ3twy9gHQYibwT1o2i4KZhV0KxNtHO1Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4904ae1b-19ef-533c-fc2f-baec570bfcca@suse.com>
Date: Tue, 19 Jul 2022 08:01:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/3] xen/heap: pass order to free_heap_pages() in heap
 init
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-4-julien@xen.org>
 <0242a659-fcf9-74cc-102c-df775123b7ac@suse.com>
 <b8b84df4-4101-a78f-1cf1-1662500ee2c0@xen.org>
 <097e8634-0c5b-35ac-6ad6-5b83d9b29f64@suse.com>
 <a06eb29a-c5b3-3a97-7f39-ca25a051163d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a06eb29a-c5b3-3a97-7f39-ca25a051163d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0141.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6877c03d-adf6-42b9-293d-08da694c2c53
X-MS-TrafficTypeDiagnostic: AM6PR04MB4181:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4QXZoTpJoSYnvyNCjHrPosxbn2QXtq5e5Fw7MwOi0yVNAyv3ezK6nNsmpzSBo/o1iqtDoa0C9ffry9KPlAA9XAyUfKXQ8mUh+ztNVlTeufC4tH0z/7rbeC/dUylye6SFIyM0fECw7J6SBb2eZLjdm9QCvdwZ8T+A4ULoV0CbAyAL0CGawW8R7srQhW5PexYO3ffO+9uA7GqN9HP6OE4baC4rYXAi8cDG266TtzLxAbstjKK0dBV2rptHhG+jbyBiHcFAcE46xvjg+dZpjQgr1DQEHa5tbUd8ueei/ARj2OyP0MAyeWBbH4W/wQv74V70CDVSFulCEhxByrs/QB367PMqttPTQGOGisutkMw/3WDXmm+YwoMkG4PqWW2Mc9uiFX1oVmINaUi94qOCWqDFi9VwvVeog1YSAr4uEL/zmvJ3M/pdXbUHOKfaz2fCan9lnWUqQ6brWm3CqxKsCVcATuR9XkbM7TzY9FB6h2mBq0QNkH/jSRcj6/Rdy1E5+LH/a0qKiCV6eY8jLQy46l74JADUt8hpi3MQytG2bc1lbq0ubr47S22ZWnyBCbkVZnJiEh1bEW1NdU7zJZmj9dfS1Qk5Tt7WaqKXydZiqxL1/KLVkEc3pa++v//+LQiJ4g6R68Zsa6gbUWongVp0tyb1NzVr4m93uO1tYxQQyKCneSG+j2mL/ph11LOF71mWrGDkxnGs6lEXGcvJ9ikrbtKTwoP+Rsr0pCOnwtBMc9RScXwpBHlJop0tz9j8886fuosUw1b+V2H8oszktMPvAFj6uiZ4qdlpBKxWAME0x3yMyfjR0VheZaQW7UXD9FM169+395P8Lztw3ZUuM3aTcR7lhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(366004)(376002)(39860400002)(5660300002)(8936002)(2616005)(8676002)(186003)(83380400001)(31686004)(2906002)(36756003)(66476007)(66556008)(66946007)(6916009)(4744005)(6506007)(41300700001)(316002)(31696002)(38100700002)(86362001)(6486002)(53546011)(26005)(478600001)(4326008)(54906003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enhnalQ2Q1NNdHcvMFdEU2I1ZXNhU3Q0cEk0cWxLYU05TEVpZDlMUElOTUg2?=
 =?utf-8?B?VDdxZHNSTWxWVEYrTWt3bTI5d2crcEdmVGU3NkdtNHZoUjFLbnFhc2pVQ3hP?=
 =?utf-8?B?YWxZQ0VUQm90WjltTFFyeS9QOVh6SVFYMmdyUXFSZ3NNa095QWR5ZE8zQVFZ?=
 =?utf-8?B?dVYwWlE4NjdGQXM5WndXTTQ2bGI3WHI1SWIzSi9LdzhVeVRmb2d2ZmdONnU5?=
 =?utf-8?B?OWR0REJweS9QK1hHWFc3MmI5RGcyUTFaeE0vdWwwMUVZczBKOHRSMXYvWEJn?=
 =?utf-8?B?b2N6bTE3eFh4N0dJVTNveEhhNmhwd2I5SjJCWU5PNDRDcVBwUHNIdFZGRVJT?=
 =?utf-8?B?NWkxU1VtWDZ1WWxmOFF2b0NORnN3aFRhRTlYSmtTRFhRdXJCeVI5a3VWby9X?=
 =?utf-8?B?QU43YVFBZjd6MUh6dVFsRkZPWHRxZVlhUEJNZmVPclYxRDE3dTBIMVlNRFdh?=
 =?utf-8?B?c2VNVnc5NVpuR3RjdjNzaWZVOG9jaHNzNUJ0M2FUVlVWamtzSkhDNnFEa08v?=
 =?utf-8?B?ZzVldHlNVUpiRmRoRnJsZkdUUkFjeFo2WU1hNVJSL2Rzb0pzMGZLTmttY1RL?=
 =?utf-8?B?d3hGeUJNYTVubUR5OVluRHU5bkNKeVI5OW1KWHpIYlRKYVozakJYSUNNaTds?=
 =?utf-8?B?V2ZEYnN0ZzN1d0dRZlEwZkwyWHZuemhBajFvTlFxWGV0U0h2YVlMeEZWY0lv?=
 =?utf-8?B?aE4yQkRRUVhON2poWHBMajh5MzBSblJPcFRtMmZSZFIwVklxWmNJWUcxZE8v?=
 =?utf-8?B?dCtERXpZemt1MEFmQXdPa211QXM4ek9qT2dwa1dQdStWVWhCa2xMUEtMQWEy?=
 =?utf-8?B?Z2x1TS9wZWJ1ODhEOUdtNUR3dy9PczRXVmpGTnFTbk5KMHRKMlhJM2J3S0ha?=
 =?utf-8?B?QzdJZGtrK0ZVUGtMTGtxOTRSOVFCcDdRTFFmOWJhb01SaDlRR2RBbDNHb3BW?=
 =?utf-8?B?bnhEbDdkcSs4dmxUS0s0UThCMjYxOTlwODRKRUFJMHhiSStya2NMSHpNRzRR?=
 =?utf-8?B?SU9RTmY4OHVHYWlIVytTVG8xbVpkVUViSlBjU0lrZkpHSkFRVFpMREw2WWlC?=
 =?utf-8?B?QXJFOGsvMTBYNkRKTzVLeWZkbC9CZWJIekFEbmF2TWU5Zlo4Q3FyV2JPd3Fi?=
 =?utf-8?B?Nmc4QWFBdjJ6dlZyK1RZQ3hlRjFTTG0wRCtyMVFsQ09CQzNjZmJCdGlNVkR1?=
 =?utf-8?B?bDdoallUNGlNdWRzM202MWxzOGt2R3pFNTVTRm1rOTV6U1F3MHZnOW13S05W?=
 =?utf-8?B?NDZSOG1PNDdHMkplcXBRekRobEZyS0pnRXRmbno2c3JSck5na21EM0xvYjNm?=
 =?utf-8?B?K1I2Wjc2Zm5OaWxzWVJPN3BmenNrcEFiMnJTUmZUYkUxNzY4UG95TnlNZm9p?=
 =?utf-8?B?WGhxZmhiQmUzblcvWHpTdjRHajAveWRzTXZ3M1ZhN3dUeUFUZUwyWVBzd1Ba?=
 =?utf-8?B?L2tPSmF1OVpEM0U0dWdDcE50WDVoYVpQVERPT2praktLWjBUaXQzdDFCQ0pr?=
 =?utf-8?B?RU9Ta2x0YllFcW5XWlVrcHpyUnRidnlyM3VjSHdSdVk0cHVxY082dG1vL2d5?=
 =?utf-8?B?TEx0MklMV2dHcWJqMlZSZ0tHcldpanRrK0h5TGhGaXRCK0lHekY2ZXRpSksy?=
 =?utf-8?B?dUY1S2hYWFRYMXd1ekFma0JNY3lVeVM3clNDcFZLZ01Pc1d2bUNGTGE4T25q?=
 =?utf-8?B?QU02R3RnWEs2R2IwOCt1M2F2blZxUi9OdDB4VlN0bmI0UGJPbTBoSWxrb25p?=
 =?utf-8?B?OHIvQUpGSGgwTTM4KzFkZHJUeFF6aFY2SFdsbmw0SlljcUdXS3ZiZC83TEtx?=
 =?utf-8?B?RVFqVHYvdTJ6NVB0MmQwWmQ4b3VpV2pQS2R5dkczYllQa1Zmc0RCUVZHUTlh?=
 =?utf-8?B?dk5iaVFpS0krS0lEL2o3ODlCaFRxLzQ3ZGpuYWFmQy9Md0p4MyszSktIZkVq?=
 =?utf-8?B?dWpxVnM5SXhzRGFUNHhabms2OTZaQS95RUpFUDE1RDJTZ1lBOU50Y2JZL3R6?=
 =?utf-8?B?VGhKZWsySWRkTVFJdW94T21IRy80YVJHK0ZHZkl6U0VmT21PWHViL0dWN3da?=
 =?utf-8?B?NEF2U2pxWTdBZStoQXZGcXRNb1B3RGV1akIrM2dLZzA3S24xVU12MzUwWkNH?=
 =?utf-8?Q?IIoP9HYIqUpEtUvYWUm/OXxoC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6877c03d-adf6-42b9-293d-08da694c2c53
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2022 06:01:50.9831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKfYZ7yWNhtjFDOeiHZcryEUrcyhpdL0Cd9vO4fcXv5X4Hw1qafKjpM6B1xYLuzx37z6ewZBe4XAKcw6Kw7/9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4181

On 18.07.2022 19:39, Julien Grall wrote:
> On 18/07/2022 12:02, Jan Beulich wrote:
>> On 18.07.2022 12:24, Julien Grall wrote:
>> 3)
>>          unsigned int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
>>
>>          if ( s )
>>              inc_order = min(inc_order, ffsl(s) - 1U);
> 
> I like this idea!
> 
>>
>> No compilation issues to expect here, afaict.
> 
> Correct, GCC is happy with this approach. Assuming there are no other 
> comments, are you happy if I make the change on commit?

Sure - iirc I gave my R-b already.

Jan

