Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CFD5462E4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346335.572114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbND-0008Ca-G8; Fri, 10 Jun 2022 09:56:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346335.572114; Fri, 10 Jun 2022 09:56:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzbND-00089B-B6; Fri, 10 Jun 2022 09:56:11 +0000
Received: by outflank-mailman (input) for mailman id 346335;
 Fri, 10 Jun 2022 09:56:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LSau=WR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzbNB-0007bl-Lm
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:56:09 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cef401a-e8a3-11ec-bd2c-47488cf2e6aa;
 Fri, 10 Jun 2022 11:56:09 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8379.eurprd04.prod.outlook.com (2603:10a6:10:241::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Fri, 10 Jun
 2022 09:56:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Fri, 10 Jun 2022
 09:56:07 +0000
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
X-Inumbo-ID: 8cef401a-e8a3-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCzAxoHXE1WAz1Trt1jLT87lsxdwtOgsMzttwF4McT3KVCBKMQFRpsHxjIgUydfX9pl0YV7iCC66UZwOm4UWetrGu8nVKcihhVqc5MzJaShYUdbZYis9KrVSwoecz2rMtMHJPBdPfxrBYvVRF+nlL6fA0fl2Wcs4XIkesyWfLQNgIDsGOmiBoGt4nf1yf+OYzH2Hj3rV8xQgXgJJzQu3Bw+KcpWw8/GO+8SfopbKC5cqMkPdX5CEuuk8QHt2SQA7YbESiwDYZVglQQF1pIvzJlgnOM6Ts3h3TfxTCh92tnJaJTOsqBW0rdGtRHJEWpxxe9PfLopsR3MX/mWAEeGFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIYl3OLZsTob8KuTnflsjwhyQ3SXczRH81zuCj0PO9c=;
 b=iyIw2N2w9WSCMXzGlFaXhOSQZcMOXhJ32JW0TfPVwaz0cCmWEjfAZyi1+4kuTUG56A1gWOerGE+EjzDidv+V5BGkTziVjFqh5osERFqWlo90vd3o+xvOBuiOEHA6LAz9xj7HmYoM9rl8oVjLXAs9t3uynxxxnAKtcq7H3jVArMp5qStSQMBs7/l6db53SRz3sKKNcHP4W6hEdTZ0bG4dH7w7+j2vjwAXgbVIUKXFsSxRE/v3c7OJIRyqGQY9LYpOLRmyUodQIFjNGf8XCaEyacNZWtcsm463xZV3f2kCo44gb0oZSYrSFAq0scEGcSDdCZ6GAQ3yaJE4fNoRFzUlhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIYl3OLZsTob8KuTnflsjwhyQ3SXczRH81zuCj0PO9c=;
 b=cFXh6j4X20b+eYSmDhwos65I6wum2/jzC0FROSzA18p2p0BEes2rw0oVClOfsJhPogCBlIuOh1NSVNtndG2hRQVTCyfO/iWXmQYwO3f/NuySWRtXprw8fZeXpS+bkXYjj8fRp990GCVUx7Q8jWmXiI82UO+S2zrunBvtrMzBCLpdzvMsz+b1DDf0Z8U02RlbYhSVxhduN5a1wynMYtZVuyWglruwSRLiHwA7sCKbM7rJPUUyOv8G9eSBgePFHwvvkdGhVfmL1nM2nM/cqwoPe4ExGgSlrAxSglLg+P4SuXozQ6T6WBZG4J+D3fukwoOdABaWFpGgyDYGb4ck/Bg4Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99b1d19b-3704-5efa-9073-819327205a12@suse.com>
Date: Fri, 10 Jun 2022 11:56:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] xen/console: Fix incorrect format tags for struct tm
 members
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220610083358.101412-1-michal.orzel@arm.com>
 <20220610083358.101412-4-michal.orzel@arm.com>
 <b84abd29-2856-a173-55b4-4e642d8a6ee5@suse.com>
 <322b83f3-830c-f330-5656-59d21da965c6@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <322b83f3-830c-f330-5656-59d21da965c6@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0072.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::49) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a6ebfd1-cb8b-44ce-5090-08da4ac77065
X-MS-TrafficTypeDiagnostic: DB9PR04MB8379:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8379240D651285C330C51880B3A69@DB9PR04MB8379.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wA7KZ3KH3KYVynVjbmEUkyJAKpahDguduIIi6rK3WshNjISYjoPE1D7OaqDuiDHiol8V6z5BWGgmgDYp71TGWQkPXlCR0Re3FzCjDJD8TDmr38sQ4pPR6SN+fLvjnJKA+pnYZ8LQQ9zIHHCh1+Csu0tcn8CH7zBjl7GcrTjH9JXpY47L2mJCjtb+VYDZmIhxW3FzyZZ6xwpowANvPHQQGAjRwjq2miH8qDToVsr8HTfIQIj5Rnaua8b3PWMvV6Mo1/iC94BT7JHtuvZV+dZhie//pCtmL5Lft+5DaJlSax0ihCMaBnXCAdZA4RQu86+Vguf+nZCUiXfr08TSEXBBwhzbeb8Q7LUoNhQ3nUiDfSS8aByaYbQBKx79nCAIlthxKv6zpIWbnH/3mnvf+POrkbRz3HTOVMK0i0s6l2y/FumwVa4U6SfDXZqntdAtr3FQbqyTrg0C6ROY5zKyqNsq6lH1Vwa4s+uQj3fpe1blGPQe0xzc6kXnzfH9+bim0yIAZQKSlREgBTxhDYE0ains2C6c680husfOkQEO+SgSpGKCreHoTbdqdEBRu1u2WIhaDOcd1kzL+RAx/Z7uFhYL5NVs5BjYQWAVLvWiHotkpHxTo1WMmhKHVQuoNtblWF2jWEZfdZqZ8OtQPCuXK1maeaXDp1vSbaHv0xxcw/o7Ds0yu7bLAjyo9MSsTfoDK7pJbd5YQxGJuHX+bElJcH8crHqw/tG80GpICYJ1jt6Gma+kFUHEf4+aavFiJWPIGxuB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(2906002)(2616005)(53546011)(86362001)(8936002)(316002)(66476007)(66556008)(66946007)(6506007)(38100700002)(6916009)(31696002)(8676002)(4326008)(54906003)(4744005)(36756003)(186003)(5660300002)(508600001)(6512007)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFNUTW1rYU04bFZGdFYxakx6WmNJVEczVTI0WCtHcHFmc09aNG1QMUdZeGhz?=
 =?utf-8?B?S0xLeFBYdlJBZFl4Q09wSkpZbFdCMFZQU0F5OUtMc3BRWFNDbVhnOGlBOFND?=
 =?utf-8?B?MTE3Mmd3VmZKVGQ2QnRnMW9QMFdtNk13clVCdHA0Y3Q4V0lBZWpoc2VldnNX?=
 =?utf-8?B?eU1Cc3hNTFI1bzh2T1hhWHlHdzhXSWVkb1NFR251eDVsY2hVYmlYSHpuWWlq?=
 =?utf-8?B?V2ppVjJFeUwzZXliOWI2eFc4ajlUNEo2VVhRdlVGMlhIczhHUHBBK1gxYXF1?=
 =?utf-8?B?UUUyNVNuUXFXSTZycjRadVFCeC9XdFoyZHNLQnpVYkNIMUpzL1ZqU1ZSRjBv?=
 =?utf-8?B?cnJJa2tDYVBTUVNXYWk5T0xQTWVjYXZtT3dJbG9KOXdSQ1NwVzZVZ1FMNFFh?=
 =?utf-8?B?RkIrSU9QNkN6bTRKcFF6ZG4xcEF2WHFTT1Vrc3BrUzJ2SVlQckJ2Qkt6eUJG?=
 =?utf-8?B?YS92YTVmMlpCcFhCMG45aUpSU2tVcStCeVBvblRoMElibkNoUi9BRjU2cEN0?=
 =?utf-8?B?ckZmbHErbzUxZVlrbks0azN6Tmp3Y09pL0JTQU9XYXFIUmM3azBqcDZNcFZ4?=
 =?utf-8?B?eVI4L0VwMWcvMk40OElnSllhUkU5VXkyb2ViSzIrdUd0WnFpMDFuOGxBSFpW?=
 =?utf-8?B?Z3JhKzl4WXBDSGJlU2FNWkMzY1lqQWZiR0dDNjZmKysxS0d5TW9VVEJocG9k?=
 =?utf-8?B?Mm4xYTloTTlQSllUUFdqbWl1czRTVW15ZXJjWUlCTDVPbE44cXcrMndscGZz?=
 =?utf-8?B?RWVVSElrbWJOdUdxOTB1UVZWTVg0WGNiNml5SS9nd09rY0tNK21CKzdnZFN1?=
 =?utf-8?B?WTFJYWVYanVBTkVQZ0hnRG0xczRBSWdMbyt3d0RyM2NydVBYVHF3VWROaEFj?=
 =?utf-8?B?bW11c1FVdldqN3JLaHQvakt2aUExWU9YSTI4MjFIclY5ZHNEZTJVMTBaREFy?=
 =?utf-8?B?a3NWQUo2OERCN0ZtZzExb3o3UzF6Q0pMbExtdERNVWI1L2lxUk9MZlp3akNS?=
 =?utf-8?B?bVZhOVJDbGRwWnBOblluVVQwZ3NUK2JiMk1QWUpHaW1FOURiNE9XRFl6VWIv?=
 =?utf-8?B?eTdLcVNRWGVDS0I5bklGNU9CN1RZV1ZOZHZlUWw1TnZNM2pLYjA5OHBxbmwx?=
 =?utf-8?B?MkxwRCtsUDZqa0hsTmZSR0EvK0tnUFM0QTNzMkI3M3BteWhoQjNvdFNIRFVw?=
 =?utf-8?B?QmtQNlc3azN6RHdQU1A0ZkZBUGxra3JValFJWHBlZWU5dC9Md3BKRHFsVW1H?=
 =?utf-8?B?MklJNUtMSHBRb3A2TzNoZDZ1a1ZEc1JyODJaUEdRNDRJdmNKZjBTWFRUd0pu?=
 =?utf-8?B?bytwNjRYYXo1UzBmMDduV0hZY1B1bFFFSHB5cWNkQzVPem80TmFBcUxYR1Zq?=
 =?utf-8?B?c21YSDVNZVptMFErWHNGQXVvZ1dhaWVGSk9GQld2MzRBampzVjBzbzRsbDZw?=
 =?utf-8?B?eWIzcUMvejI1WnRpM3BaV2k5amZObEp3WGRlOFNyWFE3cEdXNmZWeENnSTV1?=
 =?utf-8?B?VjZ6OEZtRFp6cC94VnBNMTBUSFFpc3k5YlUwZXlNTmlrVjk4SWZvUmNwbUZn?=
 =?utf-8?B?ZDA5TEJpdTVlOGErZTNQZFZGeDdRMDhKSTB6VGJ2NmdFdWpXS2RnaUljUWFo?=
 =?utf-8?B?U1Y5VmtFUFVheXJMSi9EbDBmMHF4S0NUdkFNM2MzUU4wbnlEaTNmckRUOWxD?=
 =?utf-8?B?MW52NGFreDN5eVBHNmR1VTJEY1paRjVmSU1oQW1CNjNlNUR3cTdSWUFrRGVp?=
 =?utf-8?B?b1RxL2xyWlQ1eG1jQnVpSmx0K2hpbFpFY0dyVlU3N0RzQkd3WEJuUmZzREpN?=
 =?utf-8?B?R2Z2KzVCTWp6L1JHaDBsRjJocldmaHpFbmRoUU9tWmYrVG9tTWJKUUdSaWhS?=
 =?utf-8?B?emQ4QTV3N3o4OURSNkIzWVMwSmFKcytscGpISVUydFZTVXRZbHd1VFI0Uk5H?=
 =?utf-8?B?dkhNTXJjSlkrN0krR3pWazdLOWl6K05kSVlzSk5SalIrK3VHVmJUc05WVmhW?=
 =?utf-8?B?TWMyNkFHUmpKcmtibklzZEcwcENaSnNQUTNEN1pWZHNvZUIxUHZnN25JWk96?=
 =?utf-8?B?YlhWMjNxbWxmL1BlZzVmTVhpY2tXVEtnWG1tRWFBampXbU5idGF5ckpqTGZG?=
 =?utf-8?B?VVdmUWlNSDhEbkFwTHIwa0g3OVo2K3p5TkFiVnhDa29BMXZ1SlhwOGJRWWxG?=
 =?utf-8?B?Nkc5ZUNzUzdQWm9XYzZqSzhpS3NyMG9Nbml5VU10dUxBaXFjRFdURmhYOTcv?=
 =?utf-8?B?K2M5OWE1Wld3QVRKbUNkTmtYQXhyWm5zZ0JudENpdzZuSjB1WVZCdXlYOW9o?=
 =?utf-8?B?Z0pYclRXWDRUazZLWkc5T1k5NGpKd0pZQnFwd3ZlaTRjQkZMRUxzdz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6ebfd1-cb8b-44ce-5090-08da4ac77065
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 09:56:07.2075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LlWI4R04zyA4LtZs+ItQ9yaFcWQZrWF9d7tjaCLHTor5ZlMDEzTk3mDkKjHzkJGLSQksGvxXZi8KQWGo4Np8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8379

On 10.06.2022 11:50, Michal Orzel wrote:
> On 10.06.2022 11:44, Jan Beulich wrote:
>> On 10.06.2022 10:33, Michal Orzel wrote:
>>> All the members of struct tm are defined as integers but the format tags
>>> used in console driver for snprintf wrongly expect unsigned values. Fix
>>> the tags to expect integers.
>>
>> Perhaps do things the other way around - convert field types to unsigned
>> unless negative values can be stored there? This would match our general
>> aim of using unsigned types when only non-negative values can be held in
>> variables / parameters / fields.
>>
> 
> The reason why I did not do this is to be coherent with Linux kernel (include/linux/time.h).
> I believe the time.h code in Xen comes from Linux.
> 
> So if the Linux time.h defines these fields as integers and uses proper %d format specifiers (unlike Xen),
> I think my solution is better.

One can view it that way, sure. I don't. But I also won't nak this change.

Jan

