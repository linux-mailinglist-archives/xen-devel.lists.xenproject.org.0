Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 373D05AEA5C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 15:46:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399893.641287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVYtw-000787-Jy; Tue, 06 Sep 2022 13:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399893.641287; Tue, 06 Sep 2022 13:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVYtw-00075E-FT; Tue, 06 Sep 2022 13:46:04 +0000
Received: by outflank-mailman (input) for mailman id 399893;
 Tue, 06 Sep 2022 13:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVYtu-00074g-FT
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 13:46:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3dc6a792-2dea-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 15:46:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB3PR0402MB3836.eurprd04.prod.outlook.com (2603:10a6:8:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 13:45:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 13:45:57 +0000
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
X-Inumbo-ID: 3dc6a792-2dea-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAK2cknF+APzDmk46xbDggNy6ljcyNYps9PQ5OyHUMGZPJrPbGfNgEWgq0H/qHyhm8p5ExMQBZAKQHsCa6knZVxp0NOqBPamhhyzcb+CfcEZFnyfwTqWaywQirKMLIB3436EujGLHVjvHRu+ct0T5CdC9DGjmBJ9EZ3KjjPy2hCH+ATlPyvOVCRPp3l6aCXx2BxP/mRWs4ChINW6swcasblC2XXKwEBUbllBbpgup9mVc1a1YhuEWDub23fcPKIoad6hKYLFISSKxmN5cqo4VgdqMYSTXCOEyRF7pGeKD0IBuhZMI0j5MGKlBwX2rYab5c719EZu+HOj7j+/Sx0YIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGXccUyWSLHz6EGoEyQUK+LDy6zqf2bKneLndoVOg50=;
 b=bxxHTDGEDKlR6dZ2rBHc31BL2L8lbwN3b4fpz/JMVrlenIGXcd50umIOL5WoW8Ug1Rpw53aYx4K5Yt5II3Zq4YCNZBkVovgtT9vI/gAOmjHEk7SEZoc1MslhsuZ1SGuPbYBt9zlSJ0lk8zQdFv60jf9kEbMeoWkAzLB2id3NuJyUkrVSG0Z1VeDYhRQyxAIOHTtd3U4huqDEVZZi7rxDRRHm5TzDxlu+P0wZ+AAJYoXXNDK7n+f7SMoYKEpLO8p2esECIn3DQojE0IarogekktbWTPFVQ33Wuoqr2tVp08dY6sd5amztM+lpbRUbsWlEsHOVOStHrd7iSRYAr/Bbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGXccUyWSLHz6EGoEyQUK+LDy6zqf2bKneLndoVOg50=;
 b=37PM90K4r106L9xn4LZjVHbd5WO8wmuwJBa4a7q/brIUWbIJM4roucSnM5NpM56IxfWQU4b9xNfRZhcWHIsJxv1jyHgkDZSRYme9LQ8AulAMTOB7kBNqYI53x16a0604V+kg3HnjMhWmYbOeTcq94gm6lgGcuNSPS4uEvm67Sd6xHD1wq1ZQUfsM+YfmTqJYpUFHwwhEBRXVbwXK+AI1t3WE6c3E4hZWZS13dURdcigjwnwpHliFwBZmYrjMNSseu+MMZMZ11wouDSFJ4gXv6cKFSvf1gefiz0WKwsu0xSbFGro1gUQ/ke9diN1QVVlS3BNUd3unN/FxMe9fV16Gdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16e6c4e9-ea98-aae1-d3cc-1f46e979d642@suse.com>
Date: Tue, 6 Sep 2022 15:45:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 1/7] xen/evtchn: Make sure all buckets below
 d->valid_evtchns are allocated
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1662462034.git.rahul.singh@arm.com>
 <80a13d3afcd46ecfb94a919fa0a8cf2bbd3be0a8.1662462034.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <80a13d3afcd46ecfb94a919fa0a8cf2bbd3be0a8.1662462034.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2c61abe-6699-471b-ea0a-08da900e2079
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3836:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RmYrqG8dvUNwGUVrWeyIshiqzonQLfa2pPiMHUFfba8QHy1lr8sgzeLJj14vEEEHGgrI2Gw8BdmcnuOIHdx44DAN6v0wDgX04/u78mK+F1MhjwR7Bl0GdegqaarwEr5pp8mS/mdomUC5drVId5x5qMyKW5V4UQI0Wacf4/jOw4DoQDSj0wJIPgA2CZWiQFkp1ifSqfiJbmocihL/unPI4tf9/HfJ1pGMHA8nIdtDIOIjO3bWExjdA70WmH5KAhSF3mFTnpxzvM4vpzlec/K7zE5rmAj8OsJ4DKq++Bhy0ElsJ1MYPTag8K6JbegUS5rvHHwRDbXwZoE+JI9nniwCWgct2Q0iccKDAvmbXLe9LqBoK0K5kSoHy/4l8wWSui98b1Ydh5/NrDonMFn0IX1YdXEnmAfzYhjbU7UzlFrFVZQmZqoRZt8lYVJIsQazF0tMmtr2APmPclgCbwHE+ZaV8IcLba99gm81/KwHcDeK92I/ENBhAkx1ETQH3k27/CyGsKWQ+YppgmYlCCZDWKVfK5RSQyuuS/qFiJuLvfSoXV7lVaEpwBwKQpXZ1Yv7vEkQneMx33GV7RxO7XIa//O46J28CiFyiqnAl/T8TVKPHV7ZwQFlGZY20HOptIgceDzy7o48Jxd1XzcQNHLqclhHbJhjbGg+88ccYWU1sCfgvFX9wxC0fkrEn872Q/SgeqQDivC/Q3xbyNt4uKG2S9Yr36TdBIUx1RA2NvT9dG/KRgw5NNii/mRqm1XD+ftyWkcR+uGiY/UfC5iDxXwVLe+rJLtWDw68QAfqIDpFXQ7cUH8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(39860400002)(136003)(376002)(346002)(366004)(31686004)(83380400001)(316002)(6916009)(26005)(6506007)(6512007)(54906003)(53546011)(36756003)(8936002)(86362001)(5660300002)(478600001)(31696002)(2906002)(66556008)(4326008)(66476007)(8676002)(66946007)(186003)(41300700001)(2616005)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFZUR1lkc2hsZCtvQS9oOVBvbnIvN3V6VTllaU54SUttU1M3ZFBmWmxXM0hU?=
 =?utf-8?B?VzM1MkZ2ZS9rREVhOEhhSzFDVTgyR1Q4RWdpTk9mMDhSQ2p4SXNNVDlNRW9W?=
 =?utf-8?B?UkxiWkFXU1d6WkhNMDlZb0M2MS9WYzl3U2V1K09SRVYxZDZPL3Z2Wk5ETEF2?=
 =?utf-8?B?ZitzUVBZQlB5U0h3d0xJWUxwWUkzREQyODJ1NDZLOUI0V084T3IwV2lHYXdS?=
 =?utf-8?B?RStaQitxVkxpUnFPSU5ZNHV6TkRIckF2ZERYbWFFeTh4VnJxMXh4VlFJeHpX?=
 =?utf-8?B?cXdjVXc3QWRRRk1yZEtDRVlwTzl1UlZCWVF5R3lOS1k5a21scnFBa1BrTnB0?=
 =?utf-8?B?aFEyL20yM2hFbEVwdUtjWWdCekFFRGV4L3hIaWo5OHR1d0tqQ3o2aUFxdDg3?=
 =?utf-8?B?WnIrMGRxMFFtKzFaV3BNMnNzOG1VSDBOeHZYcFJHaTFQL3kxNTZKRXZiT3VW?=
 =?utf-8?B?UnZMSkxTOTllYmtDS09jZUIwTVNRb3E5bldrK25lc2hzWGhteDR0aXAwRDhY?=
 =?utf-8?B?S1pDQVROaitqTXEwZkJ3cDhYZFRJSUpPaXkvWGVGeVF3VjFSaDR2UUdXR1Y0?=
 =?utf-8?B?cDJ1b0NPMjRCT2JVQmp4TlRHdlBGeHRncGF6N0JIeXFWZHJWRWRjUnlseUp6?=
 =?utf-8?B?OW54dWNMY1BZWkZNMkw1ZG13T2RHWmZXUkhISXpqV0RSMmhkWm16ZHdzcWJQ?=
 =?utf-8?B?OS9vRWR4SnByKzNZQVV1VnZ2TmhLNTdTTjlISHRGbFN2NWZ2Vi9tSTFDNGlO?=
 =?utf-8?B?SUNpM0J0cU0vTlkwM0x0S1hYeE9xNk1kalBZZ0VLTGdkWWR0dnM5Mi9idk1X?=
 =?utf-8?B?NVdSZWxhbW9rQWZBSUVhTFNLODAxNEY0dkdJdSt5cEk0L3dKZlNvbWVTSnNk?=
 =?utf-8?B?eU1FT1p1VTdWdk5lTmtlWG9nUTVTUVM0Yjg3SGFkSGh1R1drL1lKMDhDK3dq?=
 =?utf-8?B?L1VaQVNENGg2TW9ZeERCQ2ErakFsUlNlRk02L25xUnZuUG1NQVRuY0RVeG9D?=
 =?utf-8?B?bnovY3NoR1lPVE8zL2IvTG1rb25BNHFBYnpHNEp5OVQzS2NCQXhsZHkwQmd6?=
 =?utf-8?B?Vy9GdjdZbTBVZnRZWUtMZmJ4anQ1OVpDZ25RTVp1d2o1OTU4S0hPaTBpL1p3?=
 =?utf-8?B?ZXVSaDBIb3JZcXFtdTFhdXEzOTlaVFpMZkhEdWJOd2F1Y3p3SHdQbEpmVUxw?=
 =?utf-8?B?VTVrVFZrNWNZV2xVQ1pBak94emZSanhZamdBcElrVjR0Z21FK1c0NUl5cmU4?=
 =?utf-8?B?aGd0cjF4c3ltM3Joa01oVEhHVDlZcmxVK2Y2M3F2Tm1kRUdFSk13Z29uR3Yr?=
 =?utf-8?B?aVlvTEY0Y0tUK1RGZE5IMEpSM2RGTUZnTXdlU0M5UmgraWNualNxUnZkR3Fz?=
 =?utf-8?B?QTB4bG4ySFQzRFYwcUpZRVdVVXNTOUpPVWdrZkt4TWFVdjlsRzdLSnc2a2Zt?=
 =?utf-8?B?cVNUUDQ4dmlrZ1lKZVV2czl5YWh4Q3kxbU43NXdOcUhOdFN3Q2NzUWxtQngz?=
 =?utf-8?B?VjZoeWJMdWQ1MnowajYrZkIxSzBtcllRcmRhbzdsWHdmTHAwb0Q4Z0hpQUN5?=
 =?utf-8?B?YmpPcWNnNERRWU9LODB4S01WbFp3S0dmRFh5Ry9tdCtHa0NzUU9taXR6Z2Nt?=
 =?utf-8?B?cE5UbDRRUWYvRWd0RXo2c09EcG0ybm5vTHE1Mmg2bkxlSndtTVd0Sk9HOTJx?=
 =?utf-8?B?bjRwQ2FUOGdJemlqVG96V3RIOC84c2ZFcHNLTVdldk1QcEp5K3hXd0VQMVhV?=
 =?utf-8?B?SmYxb01xOUpkTlhKVWpJYjdJWmQ3a05CUTMyRzJicWkwQjhoQ0tsOVV6bXRh?=
 =?utf-8?B?SnBPN2dLKzZtaHRKUStWWmg3NDlWTE5nNUx5RVI0NkxmSDZGS2ZZWTFSWHM3?=
 =?utf-8?B?NFZSdzdJaitJRnlVVUIxUzdnZ1lKZ2NOcnhyS1dyM054d1FMbkxTMmpoQTlJ?=
 =?utf-8?B?b0dJVU1ZNFFxK1hmNjh3Y1NtWnR0VFo5T3FCaW5NVDlWbjRGYndhaDNvSWNU?=
 =?utf-8?B?YnY5NGp3amdKMVAzZ0dqYk9vRFMwMEhMQVZDSkZtY1NtZWFhZXR4WlByYVFR?=
 =?utf-8?B?L2NESnV5bTdLTVRZUU1VS2RNNFJsSFVjYjQ0a0FCcisvR1B5SVhmT3ZDUHA1?=
 =?utf-8?Q?+CHTXNecSGZCPOgpA0d2ckAOX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c61abe-6699-471b-ea0a-08da900e2079
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 13:45:57.5930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyduPU+LA4q9ZCwbUSet9FrcPHwrzOnCE7UmcmpVbCvxchpflgFnEFHi3I5nRac0FM2IxYgD2M2DA3/F2E9yyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3836

On 06.09.2022 15:40, Rahul Singh wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Since commit 01280dc19cf3 "evtchn: simplify port_is_valid()", the event
> channels code assumes that all the buckets below d->valid_evtchns are
> always allocated.
> 
> This assumption hold in most of the situation because a guest is not
> allowed to chose the port. Instead, it will be the first free from port
> 0.
> 
> When static event channel support will be added for dom0less domains
> user can request to allocate the evtchn port numbers that are scattered
> in nature.
> 
> The existing implementation of evtchn_allocate_port() is not able to
> deal with such situation and will end up to override bucket or/and leave
> some bucket unallocated. The latter will result to a droplet crash if
> the event channel belongs to an unallocated bucket.
> 
> This can be solved by making sure that all the buckets below
> d->valid_evtchns are allocated. There should be no impact for most of
> the situation but LM/LU as only one bucket would be allocated. For
> LM/LU, we may end up to allocate multiple buckets if ports in use are
> sparse.
> 
> A potential alternative is to check that the bucket is valid in
> is_port_valid(). This should still possible to do it without taking
> per-domain lock but will result a couple more of memory access.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



