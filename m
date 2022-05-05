Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 581C151B95C
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:42:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321612.542651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmW84-000403-H4; Thu, 05 May 2022 07:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321612.542651; Thu, 05 May 2022 07:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmW84-0003yA-ED; Thu, 05 May 2022 07:42:28 +0000
Received: by outflank-mailman (input) for mailman id 321612;
 Thu, 05 May 2022 07:42:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmW83-0003y4-Et
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 07:42:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e888d057-cc46-11ec-a406-831a346695d4;
 Thu, 05 May 2022 09:42:26 +0200 (CEST)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-D3EtbukcMmmsDdTXr4sEoQ-1; Thu, 05 May 2022 09:42:22 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4292.eurprd04.prod.outlook.com (2603:10a6:208:67::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 07:42:21 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 5 May 2022
 07:42:21 +0000
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
X-Inumbo-ID: e888d057-cc46-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651736546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H+7/WrkTa+pkAfbx4Jft+s4DtAVkSGAzAFhBNOuODXg=;
	b=Hz+Q8pwAV2LuTjCJ091h0db+SApWmLunpaQaslqFbP71OqapZiUqyAFDjUd7/puaHsUlV1
	YdZ2kt9ErlVQhEH3q8xlaJl5vV6mMweM9LykMssUE1NUabJaCHu6KUnFzEhb40xtDCz8Ax
	5uwCRLFg48OO1PJpXmj8ovCozjV2hSE=
X-MC-Unique: D3EtbukcMmmsDdTXr4sEoQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dr+TRpfk4o0VRBLn7dqyOqYSgWK5dlqBePRTd/kQHqyBZ0eVd0W+E4itRyfgcBoKNyTZ7TXgbZE2VTm1AKkvxiqBkiQp82Mef+9O+2lrYKcQGNNgpsc7H4/R9WGQPcC/KmLbv8XwdAwV1szp8NThB+TNmzaJa+6ZX0ABfyKBAlwjCg+CC0YuMQOrf7VbDRUEc2SfsIee3Ute+oUxCozmbM/dXW51MQwJFA2zcTfLzgMqUPcONH4OzslF+tFLGXpLsn27daMqEXGEE4xGlDATPoIBb11a0u/czQPivCucVG+j3bLznaBfFjIHWJFHp7DVjrv/T6nDuc6Z6XaR7PFayg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+7/WrkTa+pkAfbx4Jft+s4DtAVkSGAzAFhBNOuODXg=;
 b=Rj3rbBskq4oO8QexP0S9uWnEBkP7m3nhf785t3clb4NP1A24UX9se1GNQyRTww0Y42haM+TkzfmMocWYYNmAWsw0KalVUyZC22Y1Khn3QLXjsjRbC6b0vmgIQma534iCju3iyx+cZcNyneBztpegGXNeNiIein4Zq+JGvgSZujg8o4BP0LMeOQvcgtcNK8ot9tzprRd/3gRdU8l0gNTwS4f+a3Wu7uKlUd5EWhOUIstE1fEI172capu15RW1luoPA1+s0nHDx2wZkMgNCtUVQODG6VSUXi/PUditRmE/qMpziouoXb8nLy06Xhe7UOgV69Ps6xxmhqsV3yZHeKVorQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b304872-a407-be04-22d3-2ebb88040036@suse.com>
Date: Thu, 5 May 2022 09:42:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/6] xen: do not free reserved memory into heap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220428030127.998670-1-Penny.Zheng@arm.com>
 <5de2f283-f6fc-95e7-808c-4f3d96b25926@suse.com>
 <DU2PR08MB73257B9A5603EC772DFB124BF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DU2PR08MB73257B9A5603EC772DFB124BF7C29@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::6) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07a4be58-f0f4-49d0-19d3-08da2e6ac9dc
X-MS-TrafficTypeDiagnostic: AM0PR04MB4292:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB42923ECE00ADBFBBE2F4E148B3C29@AM0PR04MB4292.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T8s9PoSWXXxy0LzlZ5UsFRa33hWVMZMwx07oBBhyKzyLUIfgnHqcTEdF7Y6ivuOv42MMuCUT5O4TRQNoVFDVR2ifIGZXaGn480ky2qno3qTQp3rx959WrY3lAi19lmoMptjaUiejNcQ5DfEv8HrlgO2VA1cn4ehdrFdP8rQpGZAef81lKPsZNeLomJQq+4Go540s7MaGvFxVVn1q+Vo5dMOhGAUa2v45HU5/One+OlFAkC0U6RZJ4gayb0qGUT4xq6uqu+BKG+YNlHP8b2Zg3hu+C+V51tEa32hzOMrUde65xyYP/dakXC2VnFfQsQqTzxt0ZN/B0jZfQnnuStdM1STlvbvoibcULy/FEqJ7hnrordr5X7BEmeK/hnRxnxrHm50BvLksENPthkAWln5fOErbg+aDcKw/jy4lxKdhnpi5qbl4jnNSNn6CnfgdiL9GXrZ/xPuBDBy4Iw9rd3m0WqU02eRqgoCU3ctdrZcNcJGNk+RFqGow0gSap5PHIxUc67aRDCuTjBOl1V4x4RJ0cNbXJfpSNHo6YFPY1ASTYNmwQeSnjsi+utKUrjhYwz22I5Rc6Z9NDKOHRN4dV1+SQGLBmcn7VtnRiQ0/CzyBjMVznATRpV/sRBlt5aXELTPMNvXLs9Mxt+IZiPhBi04t7asz4gG/l7ZlIfAQa4kYbg2LyXF3eOVehjDuQ9t6LkT7wBy6YAZ48kx47LlIoWBjYQ1nx/LPToLEbYg+wMAQ3/YtgoBeBdwo4EixXEd7QgJe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(36756003)(186003)(2906002)(8936002)(38100700002)(86362001)(31696002)(31686004)(5660300002)(54906003)(4326008)(83380400001)(8676002)(66476007)(66556008)(66946007)(6486002)(26005)(6512007)(53546011)(2616005)(6506007)(508600001)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L09QM003ZW1NWCtrV29HaDJUa3dKTE5XYWtzUFl6enFYb2x3OW9NQWlHS21l?=
 =?utf-8?B?VHphSUFoZzdHNStSNDZaWVBtUHBMVThiT2F4VTJoN2VHTWtUNXNuUm9qNktF?=
 =?utf-8?B?cVI4dWxjMmNORWh3QzMySytlWklKL05BMnhvYjFvSElWOWY1Z2lLVm1lRzhn?=
 =?utf-8?B?RWRORDh0cUZ1SU1FZENLUVVBa3BLQ3RDeURlUTR6OVBVRkw2bC9JQjk1MHh2?=
 =?utf-8?B?UlZFTUh0ZXlzWE5CZ3hieW5OWnp3VXdkeFlraGM3ejNLQ3dZbEh3bjNEUmRO?=
 =?utf-8?B?bkwvYUVoRnlvOVRJQmw1dmFQS01mcDZkcldUMHBWcVhmOXNwcEU0U25TS0kz?=
 =?utf-8?B?SGQ0WEJxcHB3NGRCUGxJc1JKdGZZWWNVRXRCY2tnTHNNLzBUTCtmbHRIYUg3?=
 =?utf-8?B?Vm9CMTZXQkRhWE9iSTFtTCtncmtJU2FmVXdoRHNnRVdzVytjVFpsWVJPMjhv?=
 =?utf-8?B?eUw1QzNYdXNZb1ZtenhsVVRyTnVxRlk2WG5jM2ZhY1hxRXNNWHRjczAwL2tM?=
 =?utf-8?B?aU5kNjU1dWUzTTFvNnU2MDFSU1pmWVBXWmljMGRUYlhDVVg2a3ZVZlo1dnpD?=
 =?utf-8?B?aEZSb1lGVldiL1l3QXNSZjhoQWxDWnRjWlBGQkxvUXJmc0pKQjVSNURGMGJ3?=
 =?utf-8?B?STkzSHhoTjVrZzM4eTZCdEZSV2NqeU9UV1ZQMW1PcTZqVzV6dmFQRUorVkhm?=
 =?utf-8?B?bTBTaExJV0FDcm1DM1c3TnJ3bUFOUjRqWGVXVjlvczZlVEN2a1F6TFFKZ1hR?=
 =?utf-8?B?YlJBdVZmKzFQaUF6elpIVjcyRzdNc2lCL1BRM1hIcEQ3NTZKcnJScFpqeWIv?=
 =?utf-8?B?aGR6d3dYUzIzcC9XZm5FeWplTUNIdXRXM09wZHhoVFFCUVBhM1dRQ3hFQVh3?=
 =?utf-8?B?UUtYQWZmY2NvNVBKV1dyd2dHb29KdGU5cGZ3TWwxUm1nYVZCaisxVUVDQkx3?=
 =?utf-8?B?VnBYaWNwQk9qcGZyR3pNVGU4Z0VsUG9pVHlYMFRCNzdBbWpScHJzYVBlUTN2?=
 =?utf-8?B?azg0VXR0b3pYUTUzd1AvUUlOc0tiWVBNN0lvWlErc2xYUzVKdXFxby9waTRy?=
 =?utf-8?B?N0krd1NlOWlBc1FPUEYxdGp0VGliZTNwOEJMZkl5Mmxkb1Myck5ITTJxaVZT?=
 =?utf-8?B?Yk1CMVNjV09iYVhNckRyN2ZVZjhNUUpXQUhza0dzRld3OWhOTVZvZ0FLNUFv?=
 =?utf-8?B?ejlzMlBwMUtyc3VRcEowb3JOT1NTNWxVaXdqUlVUcWROTXVyTE1FRm5aWlo1?=
 =?utf-8?B?ZUhCUFFTZzd1NFhkT1RObTJ4RUhuZGhvQlBwOVRIYzh5WXhKb25hMEVVdjhr?=
 =?utf-8?B?SWlBWVd2NGVKMFJSMGZ1K1ozSW8wcURld0FoUVdiWm1sSkJzTmc2N3hXWmsr?=
 =?utf-8?B?VXU3WHdpYmEwYTB6cHl2L3VqbjRjazVFenMxK01tVWdLWmhPUzBCY1Z3MWs1?=
 =?utf-8?B?Ritaa29sTmpTVlhBN241Tjl1Vk13cVl2dkVka1d0Vk8rYzZIS0wyL1h4bEU1?=
 =?utf-8?B?ckZpcS9xalB6Ymc4dTVYYWRTS0JiTjNXaTRTRE45dzNieHZFZC9VRUgrMzZW?=
 =?utf-8?B?NEs3SXR6TndEVTNIaHlUV3lkdkFaVVlkcnYzK0xKZEF3Zko0VkpvbDBjWi9n?=
 =?utf-8?B?ZFIxZTdhR0VnekhYTTZXcExsQWVLRHNPclVLbEErVEVYRlhCaERsWWUwR3dw?=
 =?utf-8?B?UU5aYXBsb29YanJMaGRNdmNCNDdWdk9xVzloZndNb2MzUG5mYVRmTVIwa3Rw?=
 =?utf-8?B?TXFRZjBHMzJlL2Z2b0lRZ28rSGtqa1Fhc2JYL1pPM0tOcjFMZHZJWmVxeGVW?=
 =?utf-8?B?RHBJRnovTlpjV2I5dThialNIZ0FXU3pwclFndEJLWlhaSUxKMXUwVHpsdFVz?=
 =?utf-8?B?ZFVUV21ldS9mR3hsQ3g0YXhla2ZuSDNUVHZvUU9EWWF1MldMVDk4bkRXYUpP?=
 =?utf-8?B?cFlSSG1YNUlnV0lUQ3hVZi9xMG4xUjI4clE1TjVCeUpSS2lhTlEwRE9mQjJa?=
 =?utf-8?B?d2tDUzZzd2pDQ3JneHBZZUpLSU1yQm9aNVRsZnVUN2hkci8rUCtKdHFBN3Ny?=
 =?utf-8?B?eXJ2TFJES2k1NytYeVlaQzFsSlpQbDdmSnFVaEx5dXNOaG4zWXowVDZ0U0ZP?=
 =?utf-8?B?bVlHNlRyWElidFM1bEkxSUFveXhmdzhDY0o4U1hCYjZDWWZsWkdyTytETWE0?=
 =?utf-8?B?VDBZczA0UjJGYlFwM3Q4WFhtZ2hScFJGRitkYmdQNFJLUUEyejVyRndFSmw3?=
 =?utf-8?B?RnFSMUFiZ0NXTmgzRDk3OUJveWo3dExhQjAySUwvMDVYZkZpbHNFQ2x4L3g1?=
 =?utf-8?B?MXI3NFBVRGh0ZlFEWUczdStWanFKajJza1pzM1dPQ0ExaFpCTUFVQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a4be58-f0f4-49d0-19d3-08da2e6ac9dc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 07:42:21.6119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtdych3LOnNsPSML2te129qUYlPd2vRBdFYETKfGrbnuYlaMnu5iACznyxDjGgwWOO53/aQ+MTFhtvHSwj0Szw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4292

On 05.05.2022 07:12, Penny Zheng wrote:
> Hi jan
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Wednesday, May 4, 2022 9:27 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Wei Chen <Wei.Chen@arm.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>;
>> Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei
>> Liu <wl@xen.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v3 1/6] xen: do not free reserved memory into heap
>>
>> On 28.04.2022 05:01, Penny Zheng wrote:
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -1443,6 +1443,10 @@ static void free_heap_pages(
>>>
>>>      ASSERT(order <= MAX_ORDER);
>>>
>>> +    if ( pg->count_info & PGC_reserved )
>>> +        /* Reserved page shall not go back to the heap. */
>>> +        return free_staticmem_pages(pg, 1UL << order, need_scrub);
>>
>> With PGC_reserved being zero, the compiler should CSE this call. Hence ...
>>
> 
> I assume that you suggest that we remove the stub function and just let
> free_staticmem_pages not guarded by CONFIG_STATIC_MEMORY any more?

No, I' not suggesting to remove the existing guard. I'm only suggesting
to avoid introducing a stub when that's not really needed.

> Hmmmm, on x86, PGC_reserved will be zero as not defined, and CSE will leave
> no caller here.  but on arm, CSE could not guard this?

Why would that be? When !CONFIG_STATIC_MEMORY, I'd expect PGC_reserved
to be zero on Arm as well.

Jan


