Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D09788320
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 11:11:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590764.923149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZSpv-0000Zk-B2; Fri, 25 Aug 2023 09:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590764.923149; Fri, 25 Aug 2023 09:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZSpv-0000Xn-7x; Fri, 25 Aug 2023 09:10:35 +0000
Received: by outflank-mailman (input) for mailman id 590764;
 Fri, 25 Aug 2023 09:10:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qZSpt-0000Xh-Qw
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 09:10:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cf4557a-4327-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 11:10:30 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7918.eurprd04.prod.outlook.com (2603:10a6:102:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 09:10:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.027; Fri, 25 Aug 2023
 09:10:28 +0000
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
X-Inumbo-ID: 3cf4557a-4327-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0PSC0V/sUEjYGl7smDGkQ3p7CJfqYSUiQWFv2DAPzNPTwk99rPnd+Im2j7j0fVclvnGnIiDjPOSXcXwQhQ/VvXLOs93Qbe/t0X8S9eKrx4xG9viR5FYxhHmPpjNFxOJ4pw1TKLNIx+P2AhOwM124nzyhh2qwyplDkk4cFQWKR90Sqsgzkp4BR6hTqC8+bUcmh1OWISbjvZc4bjVFtHjLXmeVZGLsMut0zHCBLyuRCBFo3CTtjjrQyB6GD+3rGILsLL7C+92PkmNwOoNzrQT1ttewEOAvWNtqecy7T+c8XbrGYttgcM3blLekZ7xqu7rFKJQGXM7OzoPpdqOQwgadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f52SpgfShauYLc1h5LIrrIicG4ALc3T2Kzm0G8kuEFg=;
 b=e8dXLBZFP+negDG6F1tozWqRKUbno6sdQ6BdgUhfFaKcR3BHB4OlHPW68fS1Y7SakXoFd8ep1tIQ26SRQaT9al2u7Eq1FLP5bew6pnG7wtcDf2Qoe8GbflM5gNjMpWVHc8cT39qfOAZ/w5dOMfQxsERlbgd+pKhjXIu7qIZ/mLQG1bG/p1qzQWduMa+nu1EtFT3LSMsuUl2qb64S9ho4dKcElhJxroCJUGIB9D0raHUCb4FhDf7ecS6nHPKTHdic/5b/xok/C9xR+2NAze6I4UkiSvq358oF9BuTpDIPramEjO880qaX6+3MtkjNDsWH5GzSzbbNAic+2kepYe6txw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f52SpgfShauYLc1h5LIrrIicG4ALc3T2Kzm0G8kuEFg=;
 b=tgcyDMR4KkvsAKguLZGWEc+9jTPXj0Uo4i2RHcY3/Om+5xtpdFF5eCmnfFBlB1LKfvz1yLG+NOt/BGiLXSd2KgKHm6p8w//jzSxG2ZvSJUb2cbqSokXPx1ZzWMySfxdSD11aHWaAkBC4JduYl7ytT4A3hvtSPRFbZ6WSjdoU8/zFpT7O1wXU6HHxUO0TEai3m1yfaqRLY6grBIsZb+X/HNGNhYH98+lLPhHbYgtfRLg0cx4JdAzyh1G1UBrUfX9Sfy7G85WqPB15inTyBNGccn6Pg7eXa0M4HSDCnLKImLFC4MEhP0xVGcq4BEW+Ux6NDvmtSSEu9gVO1+CcLZiVvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f725b3a2-6de8-7612-9c51-cea42244ca89@suse.com>
Date: Fri, 25 Aug 2023 11:10:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 8/9] xen/ppc: Add stub function and symbol definitions
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <2702cfa486aa92e82fccd6393519073f10f4c40c.1691016993.git.sanastasio@raptorengineering.com>
 <1866073f-9611-f5bb-9b5b-05ad463650e6@suse.com>
 <b24f0eb8-5dd3-8fba-fd05-e98bcf45c60a@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b24f0eb8-5dd3-8fba-fd05-e98bcf45c60a@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c6343d-e218-40e7-47ed-08dba54b2014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eqibl7d9N6HoqKt26sNSNGcXOlY9qO4kT1s7RF0CN7kDjHw9o8awW2v+cAzv37MWUS+a2z6/L80G5YEOlWc+/Onsh+Rpt31cG1lXq2Ufp9rTtf2P6FMRXfvznZj9Mewp4g8m1WP/aKuxCh12xy073f3wnMt00nbAb0cGMUBcOlWVs/zZLurcIvgPnRX+zmW9D+Q/RvwWlkBUjMC1IGKpXEL+bWHUsppO0p/enObwyjmMSqLINyNPrNb2RDU0SUGhdmd1u7AhEAKPHstf2Nb4SrrWKYlZHi5/qBqBWzRoDjfB4G+7pIhscRhF2qZ7zkHRnok8vicj12rm/rgH/lPBpWkZVms6FEpMOrpWn2ajwxZMXBUKq6aPBus8ILykw58aIbWysHnmmBhAUM0hhwJNF6uReEM9AGolLsM5BXdzjebdekcIkg/DFLJFRq61Lr3/qXQ/G1IX5bdmOn13+8LsQwVDnjHNONSwgBcnYr6ai+ggbYx3jkPrpEHWCy3SqRrVz2GZ4O4ijhlW6E2gQkUwfTBj3TArjZWeh5lkw2kWe4qhkA3A3ovGMLybfTtEw7s73liFWFvPFDSXKvl78LqpPitbIwehaZDaTYg2ZAq37EYgwrtRV2K8MPVPM8RwdQDFAG/e5xuUvOgDfkAOVhS5Pg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(451199024)(186009)(6512007)(26005)(478600001)(2616005)(5660300002)(31686004)(2906002)(8676002)(8936002)(4326008)(38100700002)(6916009)(66476007)(66556008)(66946007)(86362001)(41300700001)(31696002)(54906003)(6506007)(53546011)(6486002)(36756003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFEvSjZHU21MWjgzRkhDZmw4UGN4WnZjRkh4ZGhVUUVJQS9ZSVg5U0UwSkVQ?=
 =?utf-8?B?T3hreVFpdTQ3UmJCa3ZyMXFyemt2bXZYTEdsKzkzejdvUEF5YzVoQUo2ekg3?=
 =?utf-8?B?MytwWm90dGtqMFFoWnVKazV1ZG9YZXozVzRQNVJKbnNzS2YrZjRsVmF2Wnlj?=
 =?utf-8?B?ZlRlWGo3Y1VxYzUwTWJaZkhKUzRwSUFZVWVGL1Y3b0xQZFd2SXA5U1MwejNE?=
 =?utf-8?B?dHhNc28wUkhvbjQ5anU0NWJSWGRyMDVjKzNrVjZ2SGp6K09iVkM1SVIyUXd5?=
 =?utf-8?B?dUhBVlVLUThDcFpvMjRHN1Vvc1ZjNmJlcmlCajE1ODcyUEpwemdnZnJ1MW5j?=
 =?utf-8?B?MmhZTWszUktEbGVHbThNVE1LMWMxcGcxM09WNDh5Z0V3WjJkcjlkeG5yNHVq?=
 =?utf-8?B?S1gyZ3ZQOVpIc3YyVG1iWGJ5OFcwUGd0MTA4ZzZaNGdiSm9zK1YzWThTY2Rx?=
 =?utf-8?B?TmVTcll2V1ZuK1ZSUXFpV2tTMVMxUE1NMFNZSEtaV0E4NkRhcElzRUNvVjg5?=
 =?utf-8?B?TTErWGhLdE9JMDF2TWVCZGVOKzFaQmw3UDdWd2NmUWxUTGliTUduTHZNd21i?=
 =?utf-8?B?M2N5VG94RXRHV0hMZkVuZ2t5NTZuM0czOFNWNXNWRkp3N3Vnais2TG90d0Nl?=
 =?utf-8?B?RnFnUHFuek55ZzgwU2VRLzRrdDlaZk1iT1FOLzI1T1BCRDVqS291dFRKMDdV?=
 =?utf-8?B?TldQUDJTZnZuSFV2NXd5L0oyQ055QXAvd2VUVFlSaDlUMllPbkhwWVU4bW51?=
 =?utf-8?B?VkZYZEc0WTZqTjBxdnRpakM5VWhtMmdkNUxhL082eDIwTmtha09vWDlCNHVi?=
 =?utf-8?B?Nk1Ed0FpcU1oL29Ea0kvamRPTTFTQ2NyTkZJVVJYcWJLNzl2bVRqUVpqL3Zl?=
 =?utf-8?B?Y1FKV3BDL0FRMEp4NG5CYUZYR3dteGhIYWJ1TEUzMURobkF5S3llVDNZcmtC?=
 =?utf-8?B?eXNpdThiMHFnN1hnZE9zellDZjlBaGI3MUZvZ1BkR0F4SGhOWTB6eWF3TTd0?=
 =?utf-8?B?amRMM3JvSGlkYXk5UllpM1FMYWp0ZHlPaVd2dzVCTUhnTzhEOWtoSWJvcDN3?=
 =?utf-8?B?cGhDTVoxVFl5ek1odGZoZndQQzg3TitIK0QvRDZvYkxzb1NINnhoa3dIeDk5?=
 =?utf-8?B?YlNUYkNVdU5Ga3gzL2RBTW9pTjdtUmhnVmFKWGljMFdsdTM2M0dQMm50OFcy?=
 =?utf-8?B?L3JWTXVFdGk0T2VmWlYvT1NDQTBFbUdGZGlNWlZJR084bXh3Zk1EV20zRnBk?=
 =?utf-8?B?RVgvNkRRTHFNTEN4Q1VvWU1wRTJ6ZzdCUWV2TGlWOWdzMjVoZzdLRWhqRHJw?=
 =?utf-8?B?RVV5RHZFdTdMaUlLM2N6NEFIRkNtK3JsMGZFNU52WjJHQUlrR2diVzhTbHI0?=
 =?utf-8?B?UVpzcTNkb2VhalFIVWg0aEl4N2h4Q1hSMlNrUlJWNTVaWHBEMXozZ2c2ajlt?=
 =?utf-8?B?bUFjZ09TTm41dzVZbnRWZmZnWXRFV3JWRTJ2a015ZkRRcDIrRXJxNkVRNzB2?=
 =?utf-8?B?angwcVN1ejNxczVZSzI4aFlpeTd6VzQxdm9LMWduU2lHWTl1UW40OWIwdWRt?=
 =?utf-8?B?ZUd2SHJ5MnBBNEswdWN5QVJTVjdsY0RLVkpqeXhwbmU1YzF1WS9nQzlQdDl1?=
 =?utf-8?B?b2E2Q0hweDIwaks0bStUMjJ1MHB4MEhpbnh2QjZqVzFCaDVzNEVIUG5uWGsv?=
 =?utf-8?B?VVFGVERSN2FTbmxDUUVGUTNNSjN5c1VkVWNudTJSZ09vaWpMOStmL295NFdu?=
 =?utf-8?B?MXBRUWFNTS9jZ1lGTVhWUXV1RkRIdFY2UGFRUEJhcWp0K1EwTTNaVFVPYjhY?=
 =?utf-8?B?OENqSlVVZlNveXJpa0xic0RPdnNlaUthRExlNlM5VlJ5ZTk0TmRmS3FUanEv?=
 =?utf-8?B?N3g2S0tVd3gxQllMSUFjZ2orUnJ3NmFqTUlPVlpld25FQW51SE5IVFNjdis5?=
 =?utf-8?B?cjQ5dkNnZUVKUHNaWE1CaklPZGZEMTdLQ2RBRzN2OGFMcmVpNVJCcHZQY0l6?=
 =?utf-8?B?bVR2cUZncmp1ZzQvVXVqZzJzRmtOTXAvNXZPd0RxdGxYRUVUU2FueDFCZlV5?=
 =?utf-8?B?ZVF5MjNWR1FJZHFXVDdEUlJRMVJGVGVpVG9aL2RDaWxpRjRwVEpSbzFRZ2Ry?=
 =?utf-8?Q?SX+rnxkY483jynCnNVQKp9TrM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c6343d-e218-40e7-47ed-08dba54b2014
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 09:10:28.4931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7A+NImC2fX60JKJhcgh2FkZhHLjxxRMxleEES8vBRLl7zRnLQlmVtvy4JGqwFa37knG5ZPt5wd6kFVmehHy1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7918

On 23.08.2023 20:39, Shawn Anastasio wrote:
> On 8/8/23 5:27 AM, Jan Beulich wrote:
>> On 03.08.2023 01:03, Shawn Anastasio wrote:
>>> +int map_pages_to_xen(unsigned long virt,
>>> +                     mfn_t mfn,
>>> +                     unsigned long nr_mfns,
>>> +                     unsigned int flags)
>>
>> There's a patch in flight regarding the naming of this last parameter.
>> I guess PPC would best be in sync right away.
>>
> 
> I can't seem to find the patch in question and it doesn't seem like it
> has been merged in the meantime. Could you provide a link?

Looks like I was misremembering, and it was modify_xen_mappings() instead.
I'm sorry for the noise.

>>> --- /dev/null
>>> +++ b/xen/arch/ppc/stubs.c
>>> @@ -0,0 +1,351 @@
>>> [...]
>>> +static void ack_none(struct irq_desc *irq)
>>> +{
>>> +    BUG();
>>> +}
>>> +
>>> +static void end_none(struct irq_desc *irq)
>>> +{
>>> +    BUG();
>>> +}
>>> +
>>> +hw_irq_controller no_irq_type = {
>>> +    .typename = "none",
>>> +    .startup = irq_startup_none,
>>> +    .shutdown = irq_shutdown_none,
>>> +    .enable = irq_enable_none,
>>> +    .disable = irq_disable_none,
>>> +    .ack = ack_none,
>>> +    .end = end_none
>>> +};
>>
>> I would recommend to avoid filling pointers (and hence having private
>> hook functions) where it's not clear whether they'll be required. "end",
>> for example, is an optional hook on x86. Iirc common code doesn't use
>> any of the hooks.
> 
> Alright, I'll drop the `end_none` stub and leave the .end pointer as
> NULL.

Yet my comment was about all the (presently dead) hook functions.

Jan

