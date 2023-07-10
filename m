Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4B974D1A7
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 11:34:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561141.877503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qInHu-00075I-Tl; Mon, 10 Jul 2023 09:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561141.877503; Mon, 10 Jul 2023 09:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qInHu-00072i-Qz; Mon, 10 Jul 2023 09:34:34 +0000
Received: by outflank-mailman (input) for mailman id 561141;
 Mon, 10 Jul 2023 09:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qInHt-00072c-EQ
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 09:34:33 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9204926-1f04-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 11:34:32 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by VI1PR04MB6943.eurprd04.prod.outlook.com (2603:10a6:803:13a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 09:34:29 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 09:34:29 +0000
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
X-Inumbo-ID: f9204926-1f04-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ixT5vTUQloQ9lGa9w76abYJFGER6vu9+bDz96deebjGHZ17SpV/RgH1j/L1fvofwSj3YDN/9QQMtJFbWrB3equSv3acb5XufQQv8q7c0bavAHmGDchJ0AdF0AqFqLL7KWYO++e95fDAs0iqEsUJ7REeyspkkPpO3QDBfAb3KbmFut8k5VcsTQlbb7zG7Ysi5Rcyqil3sopeOxbhn2fUO7GyKui0sr6+KtwAb6WGS5iG2tOvbz3AXsEywZD1ceW4YRy8VqKDGtLV7uQd3MQRWsmMV3P9+3085vYRl6Pjli7svBuTeIbNqiAuVp1aaDMxzfyRu3DMmU9mKZvuT5uo20Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEpEnnv2nY6+zi0bMarC87Ru1A3Qf3tdd5iWCpdpVVk=;
 b=RCS8xA9kZL/BGdhhInDigl4EgHGO5eV111dyxNH3sjXs6Hh8tTcnj3kCmGwA9c26ffpt6TRL7OnC/Rw6IXv8Cr1+cQFTmHgUJmw6q9YyN7MgygGqhpAOexTRv1/qTdqxFKSfp3o3b6n9WQpUdXz8KjD7p70s9SRGs0ngVl++AUEaT8IL1sXKZNZl0hDe3UWLdVu16zHk2+88I7++JeBakVCIstJnP29oGjnGZJTedAVtBnPibsm1EoeJV1kQcOZeOFjwnDpPeVrKCGzVXJ5+MzHLholCDEMho8GKQjIeKLJEr9djku5tcmjormcil7LUnQqNP3uVr15Or9Vh9AdIWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEpEnnv2nY6+zi0bMarC87Ru1A3Qf3tdd5iWCpdpVVk=;
 b=X6B1oL6gRC/o3Zc7dR2SpZa9iKy50fE7I2y5Td1zP6dZlLdGIihIkSKcGHOgujEYVRDi3YkSWn+m4H6kyMKcMHFgZ74FrMoZcWiYVWD+3n09bvu6RNFAAapbrmkggrnsefwUsFIaarZ89Vfd958NOMff+EIrOO5yEKwA4j2FeTUXEmn5UqdCQUmCULP9JuvKver3W571eG1SVf2aN6bRU9IO0AGyZ6+SJdT2aiu4/EWDuOyzjr9KZR8cqFs95LzQyZCMVldy7IegsU+hdwkDQJhTLyEiVTtMQS3yvO5k1LrXXpGWqO8bxjpPChVHUZVtNQZGlz+xtHP/TKkqwJPRRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ee19f92-85d9-2905-eed7-fd806c7abc0e@suse.com>
Date: Mon, 10 Jul 2023 11:34:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/6] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
 <21d8ce65f718bc10c2213688f79cf5f978bcaf16.1687178053.git.oleksii.kurochko@gmail.com>
 <67df28ad-060e-07d5-acf2-02c3cd5f0b96@suse.com>
 <1edb0c61a8ef64bb47809049252e9ad7b19f4bbe.camel@gmail.com>
 <69699edb-78b2-336c-15f5-2b243257852e@suse.com>
 <9e6fdb4f946b804ae102069825b0f56a3997a4dc.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9e6fdb4f946b804ae102069825b0f56a3997a4dc.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::9) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|VI1PR04MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c1e9be-fad3-41ab-5dd2-08db8128dc2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oJ9xdeaXC0hYZzmW0CKhGP2CiXuZ1e875VoA2VtYfuC4JQ3MxHsp7D2iFogDA6yrXBfRsFhUr3Wf7CGVOy7QR1nmAJoMrO/j8O151jlEPvR2n6t1UmROMJCPMJvOpTuuibqQoidkvsgljY9HdJjNhqkKGJI4LcJBR35lZqSOVuEVVznoMBzMzCI7NmrTiNdhvV2W1+dQnnqhwbdV7iMskJ2M+Ic+0pyYk4upY3eb2h0B4NWG1EI8rtWKLcGLO5z2UXT14kL9vcQmmeo5AYkN7ak5PcOLuALc9jzZGDp079dO0N23BY1XZH2IJWovWzw+9t7uFb2ZnTH8qNjlx7gAUt7IXr2wExo2oEnqvTEkbJoG615GtytO0m/UiX/KjR3kE7kP8LtOKCefmcKfqV9OKKJc8PyoF3QUJf4yE2sULxVvHf0nW4GhQQ09Ml/UkwA+7ZgiUfCnwbuVqmJE/FJKCnCbMLz0h3DpkyXtxaGBFjj7X7wtxjWHhb9dUU96j1ynqfHz8CKWgqJXVHHw0ZsavsPWXDOywZRESu3oFtDbvkhrUdPJUQT2TC4LDBzBbpN2RocIUU/SAF6MEu0Yrhp3T/T8bkgIt4zKPsKP04yNPSB2DCXJR+JdPt0WIh/sB71r08hHMM61GnEGmFDJEe3V8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(39850400004)(366004)(136003)(451199021)(38100700002)(86362001)(31696002)(31686004)(36756003)(6486002)(54906003)(53546011)(26005)(186003)(6506007)(6512007)(2616005)(5660300002)(2906002)(66556008)(316002)(478600001)(66946007)(8936002)(66476007)(8676002)(83380400001)(4326008)(6916009)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVBRcHBaVCtiWWxIZGxRekQzTktWY2RIYkExdGI3dEM1aTRJWEhoVFdQanli?=
 =?utf-8?B?cHBHL2R3RXlad3VmUUhDUmVKUEs1VFpTekgwcUo2RjJRcEJTcmNpTlRXanNY?=
 =?utf-8?B?bDF3Qnphdnl3aHg0V1JFS3FpMHYvRUpkWU5KcXZjY2wrZnB3R1ZFdVJmeEdC?=
 =?utf-8?B?K0R6eUVHeEFkVnM0ZjZQbkxpd0NxTTNjT0VWZVBrVytxa3pxbS93UTRBRnVz?=
 =?utf-8?B?a3ltVy9tR1N5ZkRXcVBhNkZzL3ZUQ0RNeW14Z2xPMkpTaE1UaVFzTjNyYW1l?=
 =?utf-8?B?MFNoczhrNnFFWGFMT243dEpIS0tpRWt4eFBRSjh1VjE3Und6MFVZZUFESXJ1?=
 =?utf-8?B?Q3pmYVVyRzJYUE03dWM3Snk0cXZxSkEvQzlaaDhCV1BIVmlSbTNSR0RabzFx?=
 =?utf-8?B?VDZrL3JoS293UGQySXIzTlRBN0R6ZzFJcHNaZFl5dzlEMnNxRGY3a2dJbEhU?=
 =?utf-8?B?WmRiSTFzWXVPU3JVV0IxZE5waWdiY1F0aDlYQkNTZ1RiWkxKbEl0QXZvaFNW?=
 =?utf-8?B?OG55LzYrRVY4T2d6Szh6aHdsdHA5MGpSalVwNkwvdmk4Tnd1TFI4NVk3NFZ4?=
 =?utf-8?B?eXFTUkI1T3lIVTY4VmJvd2NZdHFJVjhpZjl5M1NCVVNLd0RWb2NmSlJMdzZl?=
 =?utf-8?B?V3BLNkdoRDkrVklyc1c1K0cvMktKL1JLZVpaUnk5UkpGV25odVR4cDc5eGhu?=
 =?utf-8?B?b2hSNXBzODlqcXpobE9XbnA0aEhDUlBoeGlSQWgrTGtndmwvRm9LYWtIdy9B?=
 =?utf-8?B?UmdrbjZnRkZnaFZzbm1MV1M2WWVpallhMjBHS2tpbmwvalRXbkFJWitKQzlT?=
 =?utf-8?B?UkQ3aTJEZEIyOWNPSGptd3FkaXR4QXhsMW5ySDFtQkV1bE9DTDhBeFpyQTQ0?=
 =?utf-8?B?K1BSaTQwUnZTQlltTi9YU2JxOFhqMGg5cTl2QkpKMjhjNVNnREE3c0pUR1o3?=
 =?utf-8?B?dVN2ZzdadGFGOCt6OStaMHpXaTBOWWlQR1J0bFIzMmEvSTQ4eFRZVUhsRU13?=
 =?utf-8?B?UklzdUp6UmlFMkoyYm8rWVJwcjJsMlY0UHVISVdUQlo5eUdaV1dEcnp3VjAv?=
 =?utf-8?B?TTZ3Yk9XY0pSc0RJYmNEYkhqUnB2Wnk2RWVRL0lxOWswWTlDTzh4SUhWTTZ3?=
 =?utf-8?B?NnZQWUFRNFhQWlpTREFXZFlpQlA0cDFJbllGc1JFaVNhWXEvSmx1akdPTHpk?=
 =?utf-8?B?bk1naE4wQlIzbkFSMGpMaDY4ZjkyL1IxTERJcmRaY3d2SllEaUFYRThqcUU3?=
 =?utf-8?B?dnlkbStnelkxZHZ1bFMyT0VnbmtsbE4yNjJKRXBYZnNxdDdJVHJjcGgycW5q?=
 =?utf-8?B?TVppVENRWk50QTluelZpVlZLVWxPQkh6cndaUFVtTUZjWktKWjFNQ3B5Wk1P?=
 =?utf-8?B?L3FQOHFVT1VBeitsbXRJWFR6Vms5bUpnTjZqVXV2Q29MdUF2QmxUS25HSXBG?=
 =?utf-8?B?dWs3R0x4WGJjTjRmbU1qTGVmVTZEZkIvNFhqSDhvVzJ1bFV4dllOQ1FabnFR?=
 =?utf-8?B?dkFUZndsZFR1ZWJIRXV5VjE1M3BSR1o2RFoya1diNlgrWVdpbWVEbTEremV2?=
 =?utf-8?B?OVBQV2tRQ1hMcnA4a1ZqcWpRZEl4U0Y2Y0MvMHJDdHQxbTZFaGFDNGlVcWxq?=
 =?utf-8?B?b2R2aFBlOTlLS2NRaDRGSkg3N1FZREdSQkptNUYrMFJsRTRmUmo1TUM2T0FU?=
 =?utf-8?B?aEFwcGRtb1piVW5pZDk5emtVS3NqMEE1eGZrSXpYTjdyQ2RNSW1Vd3ZmZHoz?=
 =?utf-8?B?c1NtZFp2YTRHZU1ZVjB5Y0hLTVpXR1cwby9RbHdQcEJaNndvY0FOVXNIeERN?=
 =?utf-8?B?K0k5ZFZqVnAxaUpXSUFuTzVjZ2w0RWl6R0hHNXVrTUl1bjBOaUFSQmNLRHh5?=
 =?utf-8?B?VWwvT0FHck5NckQ3a1ZaUjB4ZkFkWGJ5b3pHVEthaUtLaXBvWXEwWDlYN1BU?=
 =?utf-8?B?RXZta2dqdVRwTnA5cnc0ODRjZ05SQ2kzTWJvRVJxRTZOK1ZNeWlvTEoxcXNY?=
 =?utf-8?B?Mm5YVTU0ZE5sVUZDblVuNzllNWZvOGNYN09NMjg0RW5qZUg4VlZIWTl5Tmcx?=
 =?utf-8?B?RmRsbDFvUDF2Sk5CZzJ4SGFXM0Fna3Z4VmlXM3lLRjFWalk2ai9uRjhZR3Ix?=
 =?utf-8?Q?1OiJZO3GAp1s+D+o9eSigwEs2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c1e9be-fad3-41ab-5dd2-08db8128dc2f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 09:34:29.8075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFD1kWQXSVOJe7KwY2cgfkbr38USjVaKVOzDimc3MjSnekAGAuc967zQAtbdVCKYPfw+0LDBAPOfx788VITymw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6943

On 10.07.2023 10:53, Oleksii wrote:
> On Fri, 2023-07-07 at 12:51 +0200, Jan Beulich wrote:
>> On 07.07.2023 12:37, Oleksii wrote:
>>> On Thu, 2023-07-06 at 13:35 +0200, Jan Beulich wrote:
>>>> On 19.06.2023 15:34, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/mm.c
>>>>> +++ b/xen/arch/riscv/mm.c
>>>>> @@ -25,6 +25,12 @@ unsigned long __ro_after_init phys_offset;
>>>>>  #define LOAD_TO_LINK(addr) ((unsigned long)(addr) -
>>>>> phys_offset)
>>>>>  #define LINK_TO_LOAD(addr) ((unsigned long)(addr) +
>>>>> phys_offset)
>>>>>  
>>>>> +/*
>>>>> + * Should be removed as soon as enough headers will be merged
>>>>> for
>>>>> inclusion of
>>>>> + * <xen/lib.h>.
>>>>> + */
>>>>> +#define ARRAY_SIZE(arr)                (sizeof(arr) /
>>>>> sizeof((arr)[0]))
>>>>> +
>>>>>  /*
>>>>>   * It is expected that Xen won't be more then 2 MB.
>>>>>   * The check in xen.lds.S guarantees that.
>>>>> @@ -35,8 +41,10 @@ unsigned long __ro_after_init phys_offset;
>>>>>   *
>>>>>   * It might be needed one more page table in case when Xen
>>>>> load
>>>>> address
>>>>>   * isn't 2 MB aligned.
>>>>> + *
>>>>> + * (CONFIG_PAGING_LEVELS - 1) page tables are needed for
>>>>> identity
>>>>> mapping.
>>>>>   */
>>>>> -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
>>>>> +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 +
>>>>> 1)
>>>>
>>>> How come the extra page (see the comment sentence in context)
>>>> isn't
>>>> needed for the identity-mapping case?
>>> It is needed to allocate no more than two 'nonroot' page tables (L0
>>> and
>>> L1 in case of Sv39 ) as page 'root' table ( L2 in case of Sv39 ) is
>>> always re-used.
>>>
>>> The same ( only 'nonroot' page tables might be needed to allocate )
>>> works for any MMU mode.
>>
>> Of course, but if you cross a 2Mb boundary you'll need 2 L0 tables.
> Yes, in the case of crossing a 2Mb boundary, it will require 2 L0
> tables.
> 
> Then, the number of required page tables is needed depending on Xen
> size and load address alignment. Because for each 2Mb, we need a new L0
> table.
> 
> Sure, this is not needed now ( as in xen.lds.S, we have a Xen size
> check ), but if someone increases Xen size binary to 4Mb, then the
> amount of page tables should be updated too.
> Should we take into account that?

Perhaps by way of a BUILD_BUG_ON(), yes. We want to avoid setting up
a (runtime) trap for someone to fall into.

Jan

