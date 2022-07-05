Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7486F5672B9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 17:33:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361439.590966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kY7-0004nD-AQ; Tue, 05 Jul 2022 15:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361439.590966; Tue, 05 Jul 2022 15:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8kY7-0004ko-5U; Tue, 05 Jul 2022 15:33:15 +0000
Received: by outflank-mailman (input) for mailman id 361439;
 Tue, 05 Jul 2022 15:33:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8kY6-0004ki-9o
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 15:33:14 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c800482e-fc77-11ec-924f-1f966e50362f;
 Tue, 05 Jul 2022 17:33:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5230.eurprd04.prod.outlook.com (2603:10a6:803:5f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 15:33:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 15:33:09 +0000
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
X-Inumbo-ID: c800482e-fc77-11ec-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksZRUE9nK6L1sVZcdJliFFURnrcs9hG4BoSwAGgFj6npe6Mm71mq+zkPzJd92achHKOEmy8Ea2Fm5V4JrvP/qBY6Accrqm4ViOWxGP6GOiQHQE3njUKrmBqW9Fvd7H4kYtx6w1nc8uWJYjfKbSxytfQa0M/mlVnQk1Ygv6WQAbOVvsxT98dPUhjskobXPHNOfnii2m5ekrAK6kWK9z9QW+gjU5zCdn9OYrkJBtHn93fXsBAkYdFAIIVQdJ+hwzOFjVYuI1dgqvrtmSlYOQIhJN0HY5WS7BUn8ILG9jW30YKYh01JgRvw02zhDMCN2v9jjLwBggEuMk5SmNg601wYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMgqu4f335Zue4vhz33R3R//xB2cBoCpftUaPzU/Ubc=;
 b=hRRKK7bDnZzXF3xXV3RiOYQ64flRgEN6CaxMPi4VdvhDHbwGmwSnv2FWPV/omKlNCnOtxmSQwDFaPW2aUSunIAS8aPwS+ZoNVphoxDmTJORAODG3UyUVQsASZQ316l3Cv4440yH6Y/vKQzhJpb/EN2sp4qQmoDgvQAc4OKsgRW33AqE3orGjoRvuhKCISMppA/OV1+U8xz5EgN6jDP7U6zB7ZgI4uIjhr2PJIIS5HqGFN0RTjQssU1Vi524qvFBqcDOH7jqvqGYb66J4UVPL+J4GpVQL4qhN6SOP9LLnclKfYGT4ZSrPuNMBKOY5lM+DvFCL56B+U7FWgFPKMvfuYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMgqu4f335Zue4vhz33R3R//xB2cBoCpftUaPzU/Ubc=;
 b=ok8qvJOT4sG5kIjmwwl809mxLbZROkiDoy1HUX2zU4u5AWk69jedxQgVjxM/Ctc1FyL8qMOnllRCKtnK7mBDMFoaG5V9TsYZ8D82+CHfui4aBhr8pH1xPLu+pqaislDO5nDuG1oi/4jDIjRo0okFzh4uPWnm8p647Pd5RnUVBO/rbbNB6YtONnQnjrrKvmxEGd2znRPLJTOcpwjXtAAIa+4Fyv3bc1YqaSO0+Az8IhY8hgDV4xN6TJaDQelJnL7aLmyAWw80mtWKX718UocOP5zTjp6i54ABUOWxZPJb5hWGe3qcaG5vC8EXp6esaIt1/VHLpnBwjQryuZD/lzQAAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <593ab626-63f9-85f7-3ba5-d40f2c9bb28a@suse.com>
Date: Tue, 5 Jul 2022 17:33:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <164283fe-9623-b2e4-3c2a-13aecae5a638@suse.com>
In-Reply-To: <164283fe-9623-b2e4-3c2a-13aecae5a638@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0101.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::42) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf118381-631f-493c-51b8-08da5e9baa50
X-MS-TrafficTypeDiagnostic: VI1PR04MB5230:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bH/GfdguUhUnEE4rt7FQ/27zHxVbUtHNyj/bQRZN/J0MDOKKqx6MExLyCggrrZqpIRC3Z6X8S2WDfmk8fYFLQRrmhijct78MiWCbb75wAc6ur4Ib9KATnSCJmzFhlk1WOLkG0evCGQh6c0hQUW410W/hyIilbl897LQlKAvp48Ne4vwBHQ8+Xs7isv5qrMbPtnQfaS6YriFSVrftRgEerOQiYKxvRcdlefwAjrkbaGTq1O1luzp15nmltRsgzOhwsEh1H84YZ+MH37LLDlKUGTMNA41wq/mJXhxHQqBv7mPi0ZbsMUGqen2SMtGQc7h1P+BntZZZVam5HRSeukItgQYU3ykMGq1xBzSfPq7coZi+xBa1jBSvGcT3HVDAiC/6xXhf/xwQajDzSRAn6pTDpi1OY+f2gdvyBLWlqgJVPjvNhsOIp9tM3tRfkWtzXwroXaUjFxxKa/0VhionJTB/qNwU1B5EVW+37E5e+agy7zntcS/NT9f8xetjljQB+yYIovKrPOoj5p0UJnC+8IrrdCB5ur1+byfA0RYYhgZKKC177reIjKev76b02y6SsZuFCZc/rVuQ21sfxhqgsvZUAfvqGCNk1bb5qhxaWvKDL15B09Rht6YJplQpX4ldB3mH0hRM8g0Q1aFS4r5vmeYMR7GceuGs+WWzdKgIJA12PsM3fBl9rPpe47ojKqIhkECf76bC7JmrcO5sRVsIJoS4NNoKTcaqcMUqTrwwdfcX8N5aLzTWf939F50NWAAiZ11J9n7ECUbAJJYtr3JjbHJlqPiDxuWZtta2r3dX1aTjdCl8qK/jkpAlH0zx7Fqz7wYx+ex9t6wREPSUeThTq/WXGt1QrsP8vdUBgJX6FHFASis=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39860400002)(66556008)(66476007)(66946007)(41300700001)(8676002)(53546011)(6506007)(38100700002)(4326008)(186003)(86362001)(8936002)(36756003)(5660300002)(2616005)(31696002)(316002)(31686004)(6512007)(2906002)(6486002)(478600001)(26005)(6916009)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0xpUjBMekQ1Y1kvZXE4am1mSG5TWVdKdVRKQ0lvSGhOREdLcXRHSHBuYWZJ?=
 =?utf-8?B?cFE5L0tFZDBEWm5GNTRFUjBORjBicHdTcmZqcVhMenlZNW03Z1lUUVVBM3E5?=
 =?utf-8?B?cGo2YUFhYzlTZXZyV0ZKNDA3c1dkTWtXb240Q2dNaWtFR2JvR25VaUFZSk52?=
 =?utf-8?B?Ry91YVNKYzBqdWdnbkFMYTFzamJaQmZIc0pLQ0dIaG1vZ0F2bXZUNzhOWWJ3?=
 =?utf-8?B?MkhlclltMnpWcmhIUW0ybkFRd3craXlIUlgwRyswQkJ6MERvRjdVa3BkdW14?=
 =?utf-8?B?d1ZTZ3c0ejI1WklmNkM5cGpOcnJxSUlZWldubVZRSmZiYWxVZktCT3BsQ1RZ?=
 =?utf-8?B?VjlpYk10VjRyblRZaDZqb1dBN3RXeWQ0WTZTbEh3SGs1U2Z3bi9KQTRsOUlT?=
 =?utf-8?B?NE4xN2hvaGpJZGNiM3FFVXZ4N29uK0x6NmxzQnVTQlZ5SURvaXBKaTRTV0VT?=
 =?utf-8?B?T2Fub3dhcDZBeENnVi9QVmkwU0x0OWdzRVRCUXFzYzJ1V29ScGRBbnpITDls?=
 =?utf-8?B?bkVnMzZ6dFJ5SDROOUorTHcyMVl4eTZwOHZ4ajh0MEgyaUkxTmR0bXNhRVUv?=
 =?utf-8?B?MTErcUFDa3k4NHlxTHdUR1BXTStiZmRnZkVYeVhDVTVRK3BnMGhYYUtZQXlJ?=
 =?utf-8?B?UVlEbE1LVGZNRll6Nkg0cndLOGt0Z0N6RmEvWjZLbVBSVjV5RHgyVUNkNEN4?=
 =?utf-8?B?NFJvTTIwTHQ5WUpFMmxLZ0lOL044VXdKQVJoLzdUa2QzYTI5ZmFhTXF6L2pV?=
 =?utf-8?B?czZDNk9pMERia0RlQWg1STI4azYrS3NnWTlUZGR6RkQvSWJ3dUw4SWJrL0E3?=
 =?utf-8?B?djZhd1NOS0srWlpwams0MTZsOGtIRkdNa0dJKzMzV3prRDdxVTE3aEtPY0ls?=
 =?utf-8?B?OWFlWkJwemJ2UXdWN2NBanY3M2kyaDhiM2dFNHMvMW5SSUNXNHdxWHNEWkpZ?=
 =?utf-8?B?Um9za3hYamF4dnVmYzU0bFo3cGEvTUI3Vm1adUZaUENIYXJGWkdHc2ppVUJk?=
 =?utf-8?B?eHh0cTdGekNZcVN3c0Qwb3p1OEMyVkNxeWZ2ZWxjRVk3TkpoN1ZGMlhFNlFw?=
 =?utf-8?B?UTBxZ1VySXZNRklCVXUvMG1KakVjRXJDcVEwQi9GdjNIWHgzYXlvemU4TXBR?=
 =?utf-8?B?ZXdER1lvdlQ2WGszWGJqOWd2bEZGbnZJODZET29Sb0xpYzZNNklZQVBKNmt0?=
 =?utf-8?B?cXFPYVpaK0MvRWNmdFM4d0p6MjYxT0ROQXFybzFlOTFhaXlPTkxLb1E2UHNG?=
 =?utf-8?B?RS9nWkpzTitQUU1RQncwL0FKNysxU0t3UkNBUms3dFQyZ2prRXVNbnhXTEZB?=
 =?utf-8?B?RFRpblZhKzkwRm5rSzVKd0s4VjN0QmVYcEVyR3NwNFI1KzRKZk9lUWNIOFBu?=
 =?utf-8?B?U1lXdm03ZzFhUHNEa25kVXVmSjY1N1RMYXZIS2JJRTR4WWI1aUEvRVB4d3g0?=
 =?utf-8?B?SWVSSTNOSFVIdFBFM1g4cHBpM2VkdXBGZlJhdU5TRGNBc2QrQmNLNjN1MjZN?=
 =?utf-8?B?UmpXN0pxMmVwY0R2M3dvZkR0ZXdHUmZGckwrOHpnaU9udTAySURaTUh4OFZG?=
 =?utf-8?B?QWtwS2xMeFc4M1BmTjM0VG1tOWFxMHVlNUJjUjVROTJST1kxQzd6S25DSFpm?=
 =?utf-8?B?L3BvK09RcllKYmpuVjFTcmJkT1p5d0FaaW4xRVR0bDA1MWpRYWtsajFsRlVh?=
 =?utf-8?B?L3VxMkhKT1FzcHJWdTREZnhESzg2VTF3MVpvNWZVdXVWUzZDUGF0TjgyODd5?=
 =?utf-8?B?RjdSekFEVnYyWkJCSlM1UzlhVitWckt2Z3VDVnhaZEozUllpTDI3aHNFQ3lP?=
 =?utf-8?B?SS9iTTZUUUN4SWg3RFR5Y1EvY2lQd3BIeHRvcDUwSE5lWWVUTTJXRFlYM3ky?=
 =?utf-8?B?Q2lETkNSNWZxcEJvbnVneGZGcWNXRCtnQVUvSFV6Q2I2MTRuRnp3Z2tvb21X?=
 =?utf-8?B?clJPNEdCMG01ekRLU3BkdkNPczl1aVM3eU5XcHZOZlZUL01RQ2RBMjd4UFVS?=
 =?utf-8?B?bHlYbTNjREplZ1k4azhpTHBScnU1NllHUTJiY2dRYmdGSElZSUhVazYzWDV1?=
 =?utf-8?B?b2swVlRMVHhmbnBZVkIxTmNNeklwWFZZMVZkVUdSK3Fac3RYcHBzeG0vdmYx?=
 =?utf-8?Q?KUmb/R8XBErtCeETZR9F2ppJB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf118381-631f-493c-51b8-08da5e9baa50
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 15:33:09.8553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZXeAe7iMzbJkRPXQ8AGbDpemQ5WxG6OzPKaAz1lU/EmSCfzMjcKtCUoDb26PtkhX19tu61c/0CUrNNQz5i2kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5230

On 05.07.2022 17:26, Jan Beulich wrote:
> On 22.06.2022 16:38, Rahul Singh wrote:
>> --- a/xen/include/xen/event.h
>> +++ b/xen/include/xen/event.h
>> @@ -73,12 +73,12 @@ int evtchn_allocate_port(struct domain *d, unsigned int port);
>>  
>>  /* Allocate a new event channel */
>>  int __must_check evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc,
>> -                                      evtchn_port_t port);
>> +                                      evtchn_port_t port, bool is_static);
>>  
>>  /* Bind an event channel port to interdomain */
>>  int __must_check evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind,
>>                                           struct domain *ld,
>> -                                         evtchn_port_t port);
>> +                                         evtchn_port_t port, bool is_static);
> 
> Didn't even pay attention to this the first time through: You're
> again touching functions you did alter already in earlier patches,
> and with them their pre-existing call sites. This is not only
> unnecessary code churn but also makes it harder to follow where a
> change came from when (perhaps much later) using "git blame" or
> alike. Please bring these functions into their intended shape in
> a single step (each).

One more thing: Especially "bind" now has quite a few parameters
for which without dom0less (i.e. particularly on x86) only a single
value would ever be passed. Without LTO the compiler could still
deal with this if the function remained static in all non-dom0less
cases. Please consider whether you want to do so, or whether you
want to find another solution to address this concern.

Jan

