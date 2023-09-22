Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 051457AB310
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 15:50:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606901.944980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjgXd-0005y6-O8; Fri, 22 Sep 2023 13:49:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606901.944980; Fri, 22 Sep 2023 13:49:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjgXd-0005w2-L8; Fri, 22 Sep 2023 13:49:57 +0000
Received: by outflank-mailman (input) for mailman id 606901;
 Fri, 22 Sep 2023 13:49:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qjgXc-0005vw-6h
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 13:49:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9230aa2-594e-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 15:49:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7048.eurprd04.prod.outlook.com (2603:10a6:20b:11a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Fri, 22 Sep
 2023 13:49:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 13:49:51 +0000
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
X-Inumbo-ID: e9230aa2-594e-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWseXgAHbxE93V6TDC0z7VfXYDZcslx4fFC3Y5duj5SNiFzf3HEiKJV3i0dYGkNsRsZqAf0qXDpc6daOgK1NvR+joMOcio270i744hYwrUfPV1jlDslYGPjFqqIS3qgc6sYcGF7BKUxjdMs26dfYjmOprzNH3D5R2A9OHWZ4lrS1rV4cYNY4AYcYasbvNQTioTOVFlzYiW+CEtE4REmMh6Y+IASaSdPB7zY/WxVeu5v5V9sxyLLrfJ9jWdG5cdJWW2j73dKrboCX0XXQD3rWrit6mb4JtRfLsl8NsMCo5g/o1lQl4zocayxMffhzyUDeRbxO6qXC+HAsBBPOf+zMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ns+rH3fRRXfd/M6YwkHbVDpDhOXYUvOlcZ6sLQnx8xs=;
 b=VWTW3wpLe0mnJuBNK/jQojzvwMhFZq/6t3KTps3z7AxhbVJw+w+zr2siCWGr/YkB/Uv0xXjVb0XX0xGOvxIuUcztpbA0EVCw+QaLADkJ4XsYWWrhkbLIkR6jswgwFTfUuOzHs+oibUR6g+WWs7cVUgkRlFowTJQjzj8K+eSEcisc/BVd6jao5QphG0wkThVDS2CoLJoXYtQr6BWquMnvuN5DqVsfdkYQ9pHk0bDJCu0+g+N2IszA+esf2hbaMqtsuJCKNkQWsm9I+Lwrmnxm33eSRX+Y027JkrsNQIRnjB+Obb2YDrXQXaZ9BioT3b+++nj3loI3StMz4ixPcpapqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ns+rH3fRRXfd/M6YwkHbVDpDhOXYUvOlcZ6sLQnx8xs=;
 b=qGlZbtR7NdqIeWs/47uAvDG24XIIefu+BJcXx/rV0PgqX9lSkKyXgkJOUjGb7fCRwnWXJYISzQe2vWeqsW5SZynIO/5pHpKbe0NQiGzbFsOYhCktNeF/unVdO0dD727HX879kVjoFywS3zjw0zOsl/QI8gO+L3WuiTzHr9629aTk1YpSzSlW0arHqgquBj5yQaOjJVw/rKss93Vgl7lcNVj6bk8w9l+5WTdS2qqrkYhvzTNpqG3kVnnQNEgVfdbtINLeY95ggfKO9Qq3lXwqtnQVSCcHCMyr5EfBw0ThWApSKERT+D3r47yag9HHsls+ZrnDGGL/rAwHShGQPKE/2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f82916a5-758a-d1e1-62d1-2fa890c5f99a@suse.com>
Date: Fri, 22 Sep 2023 15:49:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/2] credit: Limit load balancing to once per
 millisecond
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20230921122352.2307574-1-george.dunlap@cloud.com>
 <9456c563-dfbb-4592-a4cb-c11b75f1c27f@suse.com>
 <CA+zSX=aCyQg+R09_zw2EwcLCtMLOFCqQYejmP-aWXficZ-okdg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=aCyQg+R09_zw2EwcLCtMLOFCqQYejmP-aWXficZ-okdg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7048:EE_
X-MS-Office365-Filtering-Correlation-Id: 44bcbdde-11b8-40b3-60fd-08dbbb72cb1f
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0qguIC7CqnrbvhL4FHN+e2D3bqaysR1XlJ/BN5puatCjf7HHiNEuQxgGKoFk5mwFjTxasllgjvQzzvBveKJQiiG1ITUVSL9Y8JK+H1xXXXLMo1adNK1vFmPw29oPNjrID5sYsuO+fZJP/eBeNN5SuVVwhgeyC/Ems0mNO9geK+etcTILg7oUmTJgOF6fY5dDL0ZkmI5jUk9qrzFmnD1OETncP/V9QjDEu3Kvw60NSWtQ/T5i3NkWLhgRYS+deGjFFTJf5fTfNNh5Y9Ig8L8m5hL04PUmswgnq/cmSIgz6kARpM+723DLzN+wfkmncNA7SeDvNWr8Noqr245cCHZvC+TlnhuaHFUXYNLO9UmMd1Jpk7AhM//buNm4nQY6Dj7LeojCC1JntzKjxWnV5JXswo1hZb8zNXI6olkPNiwa8kCbnHhfkMQnbd4dWSjOgcGdB2H3blQGQsEqEGYDm92BVZcsNLv5OL0QPwIXieILPj+tY4qXSgxI3ydPteR15nJ64snPEmKVsidFQRsVNi0ItgEbNY0lT3/JB37SLPQgSUPeOIIcG+gnylS3Ao25r6bWQnqA4zMc3KWw1hTfiV7ZL3KyOT1lwkyU4mDMrnvDiHS886VlcGGHyRnVUp0oso0/q7FQndztJ+Q4sjxk0bsODA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(396003)(366004)(186009)(451199024)(1800799009)(2616005)(5660300002)(107886003)(26005)(2906002)(41300700001)(31696002)(38100700002)(86362001)(4326008)(36756003)(8936002)(8676002)(83380400001)(6512007)(53546011)(6506007)(478600001)(6666004)(6486002)(6916009)(316002)(66476007)(66946007)(66556008)(31686004)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2VPaHUxRVA2MC9HcTdkZUduRVBsbGxtdWsySm51RG1uK053dHc5VEIyM0Fx?=
 =?utf-8?B?M2ZWRlRST0pnbWlHVG5DNnN2ZWtITW5kT0lMZ1pTbytuOWxHZHVpbC9KeFl3?=
 =?utf-8?B?QnpGOER0RlhNK2VSMVlmVERBMHhXSkR5KzRwVTdST2NNRzlscE5pOG1xalgw?=
 =?utf-8?B?MFBhcjlYWXVlQXRRNmVtS29KVjhHVWEwR1pkVkR3bjNqV25TQ09tbDNBcHYr?=
 =?utf-8?B?U2EwajZ0ZGVCWVZqZjZsYVV5OHBIT0FPdkhRY2FmVnJQWkxsVG1SdFV4WWpT?=
 =?utf-8?B?LzI1NnhRQW96N0dLaW50anVOTmRRalYybWp6L2VWaWd6QWpaZVJxM0g0YURO?=
 =?utf-8?B?VTB4MXpLOVJIV2JBMExpc0toZEVYTi9SeXVHWHRMWDdJLzNYUnI5NSsrYlpm?=
 =?utf-8?B?RzJmaU45bzVkc2FRaktINER3N3J3eGFkeUtYZnN6aU9TMlhZU2x4eURNd1lQ?=
 =?utf-8?B?UEJLdlFDYnZ0QTBCWCt3ZzV3a2d0M1pzK0c5OGQveTJUTXhXKzdSOTRSeEds?=
 =?utf-8?B?bU1NaitNLzJPSzNkWFEzSkVqMy9nQmVaTU9NQ0hVdGRWZ0ppbWo0NHl6RnJ5?=
 =?utf-8?B?T3F2SDhBejU1RElzdHlXWWpnSkhveDNzUTBZTU8yTXZmcEhmTk5Ld1VMcFpt?=
 =?utf-8?B?YTFQUDZ2aTcxcmp1MDZ4VDVTTk9ERlphU3pncnVjelh0UGdlczNhT0VsY3Y1?=
 =?utf-8?B?YUljTTFvaWY0UGhRWTVYQXV5TmlGTmJNWE5QaDRQdWlSbHp2RnhiQXJzRFNa?=
 =?utf-8?B?NGRPbEJYZEpPUE9uaThVME45UUhDUi9ObWdZTnI4akhkOHVHOURDMWhnd1Y4?=
 =?utf-8?B?R25jVWQ4QzY0am9NZGc5SGxPQTJCMDdrT3pESG54alNad0RYUzNIWDZZQlp1?=
 =?utf-8?B?SWU3b0s5cHdEOXFobmY4WDRXNnI2dVBLZCtZZ3Byc1FnTUpRbXJzZDVHdzhY?=
 =?utf-8?B?ekUwZ0MrdzRaM1NBMTExVlVRK1kyWXZmRDBQTHdaZndjbjNEemRoMm10NGU4?=
 =?utf-8?B?cDdDWk0ydlFQQnBYU1JHc1RBUVBUVTFVejNHRytqaUc0R01FeWhPc3U2ZEtN?=
 =?utf-8?B?eUViRnFrd0dPWEI0ekxKb2svVlhHWEcyWjNnL29NNUZoSXNOYVVpMHkyTmw2?=
 =?utf-8?B?SkJRMUNtajJRRkVwWFQ3cWVnU0QvTlFibE52ZllvaHJDK2daV3ZtMHo1bFhS?=
 =?utf-8?B?akRvZnVCaVhyUHk3bjN2bk1LRzR5YTZ3cnVHRllKelFWTVd5b29CWE1SZDlk?=
 =?utf-8?B?SE5DYklHaU1VaWN0ZFYybGlDMndLVzFuWURkVG5xZFFjR1hwSTc1WHBBaSt6?=
 =?utf-8?B?SW5JdUR5SmxIWitQUXBiRkFMY0lRVUFvVkRUMEwxOHNhWWh4M09kaTJNWmQr?=
 =?utf-8?B?OStrSzJrYW5VVXBVRjl2N2dyRGhHSGRCM2NWUTB0MXBTTW1aVDFkd3NzOVpG?=
 =?utf-8?B?MUs0dktmb0oxMlU2b2lTTjlEenFyMTB4ak1wL3JPRjBuZGVzWFdNVUJiZmlK?=
 =?utf-8?B?WkhVQ0NKTUJhTlFOVi9HdGdrbXJLdlJiMkhRU1FxMjlvUlVWNE9sdGhhZ1Vv?=
 =?utf-8?B?K1NNYXJvUStZRy8rdlpFNFg3RnV5N25Tck1XTXVwVXI2VkFYTHh1N255RDhM?=
 =?utf-8?B?SWo4Z0NtWDJ1Z1dYbVdUcmQ5VWU5ajcwOVd0QnY3bG1tZ2VucWYwNEVMd3Uw?=
 =?utf-8?B?THlmWURYaUVZOTZMbWRJRFJ4VVdBYkZhcG8zN21WNzFEUGV5c25KdWlKZEhx?=
 =?utf-8?B?MGxBQzdzTTUxcU5pSzZ4dEJ3N3UvMDAzOTZBZFpzRFc0RVVaRWVqSlhrNnRW?=
 =?utf-8?B?a1h2bzJHZVkydEczNEJ2RVF1SjEyOFM3cms2cUdubFUzY1lIVmRITW9vaVhs?=
 =?utf-8?B?VFQ1ZmNqTU05SE1BSDdsNVF5WDBIbVNhaXNHNlhIall3Z0FVS2l2U0Z2cHpY?=
 =?utf-8?B?amw5ZzhraHNSdmFGaW5iSTVwd2p2MnlqVXVFWUY2NFREY2ExMGJNZWtZbEpT?=
 =?utf-8?B?KzRKL0lwYVlDM2dsQ21xZzR5RjV0bk02WUNtRlJBZTdsb2Z0ZFQxTHVMUk1u?=
 =?utf-8?B?QlV1aFZrQnhRMXJoRVE2WUIzcFZlRWUrcTFkMGRvREpJYTNHUkd4ckNOb09C?=
 =?utf-8?Q?gm3lOABIIZPPD9F/DPElSymqM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44bcbdde-11b8-40b3-60fd-08dbbb72cb1f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 13:49:51.3631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0C5pZyLS+IgBbceehRPh3trALrTMx+1WRqposR8X/jcTlrU3/PrFaHx36DVD6n378qnDhWaJlfUxom1rvwrJxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7048

On 22.09.2023 14:20, George Dunlap wrote:
> On Thu, Sep 21, 2023 at 2:12 PM Juergen Gross <jgross@suse.com> wrote:
>>
>> On 21.09.23 14:23, George Dunlap wrote:
>>> The credit scheduler tries as hard as it can to ensure that it always
>>> runs scheduling units with positive credit (PRI_TS_UNDER) before
>>> running those with negative credit (PRI_TS_OVER).  If the next
>>> runnable scheduling unit is of priority OVER, it will always run the
>>> load balancer, which will scour the system looking for another
>>> scheduling unit of the UNDER priority.
>>>
>>> Unfortunately, as the number of cores on a system has grown, the cost
>>> of the work-stealing algorithm has dramatically increased; a recent
>>> trace on a system with 128 cores showed this taking over 50
>>> microseconds.
>>>
>>> Add a parameter, load_balance_ratelimit, to limit the frequency of
>>> load balance operations on a given pcpu.  Default this to 1
>>> millisecond.
>>>
>>> Invert the load balancing conditional to make it more clear, and line
>>> up more closely with the comment above it.
>>>
>>> Overall it might be cleaner to have the last_load_balance checking
>>> happen inside csched_load_balance(), but that would require either
>>> passing both now and spc into the function, or looking them up again;
>>> both of which seemed to be worse than simply checking and setting the
>>> values before calling it.
>>>
>>> On a system with a vcpu:pcpu ratio of 2:1, running Windows guests
>>> (which will end up calling YIELD during spinlock contention), this
>>> patch increased performance significantly.
>>>
>>> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>>> ---
>>> Changes since v1:
>>> - Fix editing mistake in commit message
>>> - Improve documentation
>>> - global var is __ro_after_init
>>> - Remove sysctl, as it's not used.  Define max value in credit.c.
>>> - Fix some style issues
>>> - Move comment tweak to the right patch
>>> - In the event that the commandline-parameter value is too high, clip
>>>    to the maximum value rather than setting to the default.
>>>
>>> CC: Dario Faggioli <dfaggioli@suse.com>
>>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>>> CC: George Dunlap <george.dunlap@citrix.com>
>>> CC: Jan Beulich <jbeulich@suse.com>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Wei Liu <wl@xen.org>
>>> ---
>>>   docs/misc/xen-command-line.pandoc |  8 ++++++
>>>   xen/common/sched/credit.c         | 47 +++++++++++++++++++++++++------
>>>   2 files changed, 46 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>>> index f88e6a70ae..9c3c72a7f9 100644
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -1884,6 +1884,14 @@ By default, Xen will use the INVPCID instruction for TLB management if
>>>   it is available.  This option can be used to cause Xen to fall back to
>>>   older mechanisms, which are generally slower.
>>>
>>> +### load-balance-ratelimit
>>> +> `= <integer>`
>>> +
>>> +The minimum interval between load balancing events on a given pcpu, in
>>> +microseconds.  A value of '0' will disable rate limiting.  Maximum
>>> +value 1 second. At the moment only credit honors this parameter.
>>> +Default 1ms.
>>> +
>>>   ### noirqbalance (x86)
>>>   > `= <boolean>`
>>>
>>> diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
>>> index f2cd3d9da3..5c06f596d2 100644
>>> --- a/xen/common/sched/credit.c
>>> +++ b/xen/common/sched/credit.c
>>> @@ -50,6 +50,10 @@
>>>   #define CSCHED_TICKS_PER_TSLICE     3
>>>   /* Default timeslice: 30ms */
>>>   #define CSCHED_DEFAULT_TSLICE_MS    30
>>> +/* Default load balancing ratelimit: 1ms */
>>> +#define CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US 1000
>>> +/* Max load balancing ratelimit: 1s */
>>> +#define CSCHED_MAX_LOAD_BALANCE_RATELIMIT_US     1000000
>>>   #define CSCHED_CREDITS_PER_MSEC     10
>>>   /* Never set a timer shorter than this value. */
>>>   #define CSCHED_MIN_TIMER            XEN_SYSCTL_SCHED_RATELIMIT_MIN
>>> @@ -153,6 +157,7 @@ struct csched_pcpu {
>>>
>>>       unsigned int idle_bias;
>>>       unsigned int nr_runnable;
>>> +    s_time_t last_load_balance;
>>>
>>>       unsigned int tick;
>>>       struct timer ticker;
>>> @@ -218,7 +223,7 @@ struct csched_private {
>>>
>>>       /* Period of master and tick in milliseconds */
>>>       unsigned int tick_period_us, ticks_per_tslice;
>>> -    s_time_t ratelimit, tslice, unit_migr_delay;
>>> +    s_time_t ratelimit, tslice, unit_migr_delay, load_balance_ratelimit;
>>>
>>>       struct list_head active_sdom;
>>>       uint32_t weight;
>>> @@ -612,6 +617,8 @@ init_pdata(struct csched_private *prv, struct csched_pcpu *spc, int cpu)
>>>       BUG_ON(!is_idle_unit(curr_on_cpu(cpu)));
>>>       cpumask_set_cpu(cpu, prv->idlers);
>>>       spc->nr_runnable = 0;
>>> +
>>> +    spc->last_load_balance = NOW();
>>>   }
>>>
>>>   static void cf_check
>>> @@ -1676,9 +1683,17 @@ csched_runq_steal(int peer_cpu, int cpu, int pri, int balance_step)
>>>       return NULL;
>>>   }
>>>
>>> +/*
>>> + * Minimum delay, in microseconds, between load balance operations.
>>> + * This prevents spending too much time doing load balancing, particularly
>>> + * when the system has a high number of YIELDs due to spinlock priority inversion.
>>> + */
>>> +static unsigned int __ro_after_init load_balance_ratelimit_us = CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US;
>>> +integer_param("load-balance-ratelimit", load_balance_ratelimit_us);
>>> +
>>>   static struct csched_unit *
>>>   csched_load_balance(struct csched_private *prv, int cpu,
>>> -    struct csched_unit *snext, bool *stolen)
>>> +                    struct csched_unit *snext, bool *stolen)
>>>   {
>>>       const struct cpupool *c = get_sched_res(cpu)->cpupool;
>>>       struct csched_unit *speer;
>>> @@ -1958,15 +1973,19 @@ static void cf_check csched_schedule(
>>>           /*
>>>            * SMP Load balance:
>>>            *
>>> -         * If the next highest priority local runnable UNIT has already eaten
>>> -         * through its credits, look on other PCPUs to see if we have more
>>> -         * urgent work... If not, csched_load_balance() will return snext, but
>>> -         * already removed from the runq.
>>> +         * If the next highest priority local runnable UNIT has
>>> +         * already eaten through its credits (and we're below the
>>> +         * balancing ratelimit), look on other PCPUs to see if we have
>>> +         * more urgent work... If we don't, csched_load_balance() will
>>> +         * return snext, but already removed from the runq.
>>>            */
>>> -        if ( snext->pri > CSCHED_PRI_TS_OVER )
>>> -            __runq_remove(snext);
>>> -        else
>>> +        if ( snext->pri <= CSCHED_PRI_TS_OVER
>>> +             && now - spc->last_load_balance > prv->load_balance_ratelimit) {
>>
>> ^ Just found a style issue (after Andrew pointing out the ones in patch 2).
> 
> Just checking, you mean the space before the closing `)`?

And the placement of the opening {.

Jan

