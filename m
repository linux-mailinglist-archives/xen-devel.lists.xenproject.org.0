Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D8840C19A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 10:22:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187310.336129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQB8-0007gT-Gs; Wed, 15 Sep 2021 08:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187310.336129; Wed, 15 Sep 2021 08:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQQB8-0007eZ-DN; Wed, 15 Sep 2021 08:22:02 +0000
Received: by outflank-mailman (input) for mailman id 187310;
 Wed, 15 Sep 2021 08:22:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZgN=OF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mQQB7-0007d8-1k
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 08:22:01 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe920a5e-15fd-11ec-b4e7-12813bfff9fa;
 Wed, 15 Sep 2021 08:21:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-XztqRFtDOe230osyglwgdQ-2; Wed, 15 Sep 2021 10:21:57 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3533.eurprd04.prod.outlook.com (2603:10a6:803:b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Wed, 15 Sep
 2021 08:21:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 08:21:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM8P251CA0025.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 08:21:53 +0000
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
X-Inumbo-ID: fe920a5e-15fd-11ec-b4e7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631694118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UobxhOwENG75OeE9t5Q7pyFYU1cTvsFYR6nUP5ypraQ=;
	b=mKGn4FI8lHWmq3cXsUMXWqjQO/2lYtmVgpS/VHXVoraUFxajISVhzh7XB9OhkuZwtLiBB8
	U0nGGcc3+MndW18pwwX9zO+1725HARd8TUz/jY06UUJQ7+ApQl6HMgWy/bUqezkEeKIgnu
	iBCJQQfzltbOunnm5v9XEJRdVRAUM/c=
X-MC-Unique: XztqRFtDOe230osyglwgdQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JtplVii/RcT+W/ApW5sjDYxxShFu3TAjpZiHxikgWQQjTGRndryFI0lqX6NM5HybbcH2B02q9SlvFbwMwRLvy5GxcnSWsjQ0gsfaJ5R3AhGKVoNggCfjUe57hGjTGPg13/ZFu4L9wby34Muu2KznqGJ74VM7IFk+yxx7QiNTpBm66cUtLGFiD3Lhmh/SDEqxPr/ejzNfa0j7AMUFWfwvGt0sYhDb09HNSwFSAI5Z6/dZywQ1R8WkFUdch7Kl82uioTZi6nCfu9Yd0c3C3HkylNX3kZGwA2tEI6RnBLEMtk1nqLkf4fWJvROFU1ZDI3jizVuaAjm4smCuNCaKje4kTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UobxhOwENG75OeE9t5Q7pyFYU1cTvsFYR6nUP5ypraQ=;
 b=oT48ao4h7wcOiqJhWzurR70L79Js49e4CPl+E+U982MsL3/yUrx/C/gx2MC1+Xpw7l2sZSwKY77V9UKnuWWoHXRDk9rjh7wfgdkgvW6ao27J7cU9X7OlMteTNyeqYRIK1Uk5T0L1aIhGYGvDgreB8+vJ780UOmKJSSTVDXUL9iH5TzpAGqZ1TlTnpaU6IScrJ3RAClE3mggUuPI39z9AFD3RZgbxtd34K6C86V4kJZAAwdWNkC+pome/9Zt3pQLPL7BfexocYG6Q2F7c7g2pTibYTjn7kH5jLRn8UJ08n4bloHsJTQHIo2dJItopesAsITujZSVAesbvefVBkpA5xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 04/12] swiotlb-xen: ensure to issue well-formed
 XENMEM_exchange requests
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com>
 <397bf325-f81e-e104-6142-e8c9c4955475@suse.com>
 <alpine.DEB.2.21.2109101613130.10523@sstabellini-ThinkPad-T480s>
 <d868bbcc-e800-ed30-3524-a30a5feb7e5a@suse.com>
 <alpine.DEB.2.21.2109131328130.10523@sstabellini-ThinkPad-T480s>
 <9819a6e9-93d5-e62a-7b4a-ffc2ecd996dc@suse.com>
 <alpine.DEB.2.21.2109141817150.21985@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2109141853510.21985@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b93284dc-782e-b455-96fb-1c890ee42560@suse.com>
Date: Wed, 15 Sep 2021 10:21:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2109141853510.21985@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P251CA0025.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d013969-4b6a-41af-a227-08d97821dff4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3533:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3533B29884D67E82D906994BB3DB9@VI1PR0402MB3533.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+d0tehk5Pq3p9hWLi97Y01skDmu1tNto69AjBpUgr84r3y1buV07jyM//eD/tO7VgEovxDrRBg4QODc8ct0ZSgZbWP0ROWy4G23q52ZmAMRprO37+HQd8k8Giu3ruKscOIlQJBD5uBEgIyzn+otDojRyJKitnQUXfKyO2HRjKpIuaOPJDyA44Mzs/UT33Y7neK/HRfXJmTXrdOPxaEC1gH0qkg3gjXJAQy0R1r+eqd7TGJnd1vKTpXk6cp6uDXP6r3bK6UIcfX+z1WSE6kRx37XuLrgwSLIJKmUgmU9SxabtzYVXkuYGXYxMgl0K/ll8B2GEQMENRV1IzUcK/tUndFIe+UtR+5NosaLR2laFfel677zM1H35+ZHZXzJbTARx+JwCoSpUxMmaX1nW72p0vvjlHuhTyklqSsIeC0WhFdaqzvvlmZ9viFRXTNhZwxL2Fc+9KvFG05e/xETNZQchrgB6ZYo+6o5umwtwbng2zq2reiSoW/i0fMCAUEGj/GUHWlrXM7AwEOOVn2/WqD1CGN1/MIWeeRhE71MWsDj3IaQn0z6ihkDTCwLe/WvHcqnUGt41goqlh3QGr84072ibvWSoFioc610+qrTZ9CG1NFBZEWyx9wDdXPlHG2fukgorhnDstXgUW93ZHiKjUUtCIwblNBqYd5Nf3xq9kEbncDEzqmqgUsg3kPNvNG3+bE+m52CriKc4ZAbkGvZHMHEV4Z48lFflTswrprY+wVhHZXGPMD4j/bjwzDdPBCvBtK8s
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(396003)(39860400002)(366004)(956004)(26005)(66476007)(66556008)(316002)(2906002)(4326008)(54906003)(2616005)(8936002)(66946007)(5660300002)(478600001)(83380400001)(31696002)(6916009)(8676002)(6486002)(186003)(38100700002)(36756003)(86362001)(53546011)(31686004)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emFkSVZwRDdTVzhCVGZjR3gvV3dxdzMySTZaTVRwR2U5NVZHNjZRaVN5SjRw?=
 =?utf-8?B?clZteHNJNjJBaVNLRzNGYnFGM1cwNit3VzUyaEJaVkY5NUtRcnFUMmNmWGl0?=
 =?utf-8?B?MzM0N3ZOQjFaMDM5SWx2S1BpSmE1QkRyZjRMR0dRV3d5bS83TlAvaWVzQngr?=
 =?utf-8?B?NnVka0N3UktpaExpa3JId2RnRlFCeDFjOXl0eEZPWElkZVpHVWhyUW16K0xK?=
 =?utf-8?B?ZnZhSXlYaU1IUm5uSTRrZlhJV2ppVjRHWTZKU05YcCtuaDYwN09jM1ZXZVBZ?=
 =?utf-8?B?alhhT2Zzd2N1SFBmVUREMy8yVElvcXZaSmNxZmR1elErVXFjZ29xSDVIVGZs?=
 =?utf-8?B?QU9HYzZjc25nbjRHd2x4b3JlZ3JwYXZ4NklNcVFrQzY0c0I3dk1ucElJQWQ2?=
 =?utf-8?B?bnF3SWtlYkF5U1lHUVZkYUVId1dOOVRzMFh2cUl5Vi9lWHZGcGd3RWxvck1k?=
 =?utf-8?B?UXFVYUFjV3lCdWRVeTRsaGhWc3lRdHhrb0NySWdZeVhMcHNIYVZKUXZYaEJD?=
 =?utf-8?B?NDhENk5KL29Ta201MGlGK0dEUURpdHhmcGx0U0xCenpkcWJtaG56eVBzdVZN?=
 =?utf-8?B?Y0t3clJlSU5lSS82cnpid001WGRnbEozVVB3NEp4Nkt2eDNFRE03a3E5WEpv?=
 =?utf-8?B?VkVFbHFPSko0ZzJHNUVvTFdDWXArUGM4Wmt4c1FSdDFrUVVuOFBTTVRsdERI?=
 =?utf-8?B?M3Z2elYzY2cxSDczenBvSkVOMVQ2dC9jaExHazcxcVJOemlZMGZRaXBOT1l2?=
 =?utf-8?B?ekk5QTBTZ0YveE5yN2QyY3Zqd2RGcGpVbmtzWWQ1NW5ObUwwREZWUm00cUlq?=
 =?utf-8?B?RnF4Vjg3RStlenBWRm93NGU5a080MmNnUnllSGg2eU9OTHZxUlZxY3h5Qkd4?=
 =?utf-8?B?TnZoaEhEdUFIV0tjZWpHWHp2QkZQZ3QzTENEOWFtdkJjMUZUdjFZclNVeE9q?=
 =?utf-8?B?cklLb09wNFR4YXZ4K2ZCVlR6c1ZKS1RuQW8xR1c4L0JkNHVVVDZOaW43b0Vt?=
 =?utf-8?B?dlhXZTdTQWdKN2V3MXhSMUxhajA3NmRSZ0hCcEp6M0g0aDh6MlNCcU1KY0Rv?=
 =?utf-8?B?YjhVOE9hMjBNcDV2aXJQVjcvSVEvQVgwc1pHVy9RZ0ordGgzNmpVVlJyTzVK?=
 =?utf-8?B?bmsxSHllL1UyNUtaUTh5YzFJRFR2Vzd6TE5GbzArRzRZL0ZSYnB3TldsVzJn?=
 =?utf-8?B?UGRBc1FaeG9lYWFXYjk1c2t3SC9HK3lxMjE4cjVCbE9mRi9LL3NqTkdlZUZU?=
 =?utf-8?B?K1FDSjVWcEZNa1BkbjVMRXY2UjRTblljQlNKL3M5eGpqQ0pqTHlrMWRkY3FJ?=
 =?utf-8?B?c25aSkkvYlYyL0crRE0xR01UeG8zdjVseElQbXNjN21XUGJFZWtwWUNkMVhR?=
 =?utf-8?B?R1Y0bUJrTFJML2FjTzhidUwvL25MRitoS002a3R2NE45d2FQc0Jvc0VkcTZB?=
 =?utf-8?B?d0RjL3FBTGcwV1QxVXRwR0tWckdZTEhlc3ZYSTBaV2VXR3AyaDRmZ090UmFx?=
 =?utf-8?B?OFNobGE2YjhyNSt0VENKZU10MU00N0pVRGthczF1RGVhZ1VOc0xUeVM5bjQ5?=
 =?utf-8?B?TVdqMWltdHQ0ZnVKVnVYZzR1Wmt6VEl0d3ZNQTJUeDhKN1IrVTVub1kzbHBJ?=
 =?utf-8?B?ZDNWVDNGR2xoRDRjYUdNM0oyTnphU3dGbUNoQVJrZkozK0w2VUNGMElxeEZs?=
 =?utf-8?B?c0dsMFBEdHhXQjlDMnoyeUFmeVVhYTZFNjB0WTFmRVkxOGhqMW15U0ZpVW5w?=
 =?utf-8?Q?6FnXBAypB+Lw49Y2v6F+O3n9DDMSqP5zYfrSUJ8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d013969-4b6a-41af-a227-08d97821dff4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 08:21:53.7110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SxqIiD3QfobtHq7o0hgxSQEqjvHuLX9E61LtN/o9E4Ozk1ee7+oyNYZ9UdE4fUl3G8qedJTmU+t1PReRZVN6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533

On 15.09.2021 03:54, Stefano Stabellini wrote:
> On Tue, 14 Sep 2021, Stefano Stabellini wrote:
>> On Tue, 14 Sep 2021, Jan Beulich wrote:
>>> On 13.09.2021 22:31, Stefano Stabellini wrote:
>>>> On Mon, 13 Sep 2021, Jan Beulich wrote:
>>>>> On 11.09.2021 01:14, Stefano Stabellini wrote:
>>>>>> On Tue, 7 Sep 2021, Jan Beulich wrote:
>>>>>>> While the hypervisor hasn't been enforcing this, we would still better
>>>>>>> avoid issuing requests with GFNs not aligned to the requested order.
>>>>>>>
>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>> ---
>>>>>>> I wonder how useful it is to include the alignment in the panic()
>>>>>>> message.
>>>>>>
>>>>>> Not very useful given that it is static. I don't mind either way but you
>>>>>> can go ahead and remove it if you prefer (and it would make the line
>>>>>> shorter.)
>>>>>>
>>>>>>
>>>>>>> I further wonder how useful it is to wrap "bytes" in
>>>>>>> PAGE_ALIGN(), when it is a multiple of a segment's size anyway (or at
>>>>>>> least was supposed to be, prior to "swiotlb-xen: maintain slab count
>>>>>>> properly").
>>>>>>
>>>>>> This one I would keep, to make sure to print out the same amount passed
>>>>>> to memblock_alloc.
>>>>>
>>>>> Oh - if I was to drop it from the printk(), I would have been meaning to
>>>>> also drop it there. If it's useless, then it's useless everywhere.
>>>>
>>>> That's fine too
>>>
>>> Thanks, I'll see about dropping that then.
>>>
>>> Another Arm-related question has occurred to me: Do you actually
>>> mind the higher-than-necessary alignment there? If so, a per-arch
>>> definition of the needed alignment would need introducing. Maybe
>>> that could default to PAGE_SIZE, allowing Arm and alike to get away
>>> without explicitly specifying a value ...
>>
>> Certainly a patch like that could be good. Given that it is only one
>> allocation I was assuming that the higher-than-necessary alignment
>> wouldn't be a problem worth addressing (and I cannot completely rule out
>> that one day we might have to use XENMEM_exchange on ARM too).
> 
> Also this code is currently #ifdef CONFIG_X86

Oh, good point. When writing the patch I did take this into consideration,
but I had managed to forget that aspect in the meantime. No adjustment to
this effect needed then.

Jan


