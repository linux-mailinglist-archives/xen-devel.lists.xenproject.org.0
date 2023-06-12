Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8752572C84A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 16:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547170.854434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iTP-0000v9-4M; Mon, 12 Jun 2023 14:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547170.854434; Mon, 12 Jun 2023 14:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iTP-0000tD-0Y; Mon, 12 Jun 2023 14:24:47 +0000
Received: by outflank-mailman (input) for mailman id 547170;
 Mon, 12 Jun 2023 14:24:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8iTN-0000t7-9L
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 14:24:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7d00::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfe2a627-092c-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 16:24:43 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7958.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Mon, 12 Jun
 2023 14:24:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 14:24:41 +0000
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
X-Inumbo-ID: dfe2a627-092c-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grnBGaZuIcRroEZXkR5Fkhjwtg0xXdsZwYgnntT1kutI7BlN4LbH13YNQadNA47e7v/Crf4prxplwoKi0m2ydlmt+UalZ8JQjqibDdY7YsF2H/O2kQC+MQ8TxBK28eHpF96Cl349utRRbTl0F2fZv+inbS3A6bz7BcV515Iajeo8GU4hPmHSmyOGfzePlSoUp6NvShdm8CEILx3Bo/9CXPJDUqILzxGX1Nazcfm3xb05DM5az29FeZxQSMbQ+VjMLCrCOupQTn8woS835UJuX3P0Ou4cArDSdBvOYjh8wiLKVqAlmAgOD7eGUGrkRQ9JC7hEKKBSC/jCIl0gK/6NBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRdgItSLxmFEozSVykPJfbmQraTHh1XNL9zp8rKiiSQ=;
 b=L2GGg4LqLFIB5iH718Lqfxh7QLmyCD89TRjo5G/SmEyuavcqJ5j2uLi9VjdIisXgi2ns5TW2jefLJCXH3hluHpZNVWbnRR0YoVdsBT3SixvB79Ydms7EQx1hWFVMvG0Co+9wDr1PwoDrZ46UOFGg9dePyi3eeU2p+2rqg3Ge87VYT9WpUzqhCou4IkgVNqaQgVV+2ks//7+hN3rY1yLFUAaoAEKOaW/8Lk2YVNvTb9oY7c3b9h9dPDYxNj/x7xl9t7Lkh2iqGDuSbALn5UNdWOO22q38hrDFhZ3iS7EPlrW9hvi7jM8ZG/AOlNeidK+xPuLWtSqo+xNpN6cQYmUglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRdgItSLxmFEozSVykPJfbmQraTHh1XNL9zp8rKiiSQ=;
 b=BFHzm+liR37jHa+Bgp8iEc0VsRvr8xw4hAkOsUvj2sJRDdsn9jQ49As1mr4wJGyebvm5J3LpD443ir540+YWQ6mMmxkg8ySj8Cod+ysa2kIuq6ZTcQSlLvT1Gvc5AqBCFbExHH384WyGPfoEWZrPtgrehxGrbFdOm46rQWuuFxkncD1Fme5Y7R+W83tiwOzL9wE8/nQkguvBWLQRSgII68KWYmLHBJR+gC5tMJVsB/8XygFH7aaQXPdhlH5dUckmnbr5Xi4Dt5mk0Qim7R04mh0UlGo97Yi2ReVfhvfZ8P/f0K8mQVN9rZ0EzakPdTTIftynsM6M0BkfJSVlnQIi9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a5e1f7e1-a585-9c3c-00cc-69fda9c6a55c@suse.com>
Date: Mon, 12 Jun 2023 16:24:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 5/8] xen/riscv: introduce identity mapping
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
 <32aef31768cd81ffc8c848af6c29cd8510bbbf6d.1686080337.git.oleksii.kurochko@gmail.com>
 <4ac462c3-9cb6-f467-2b86-925fb068486d@suse.com>
In-Reply-To: <4ac462c3-9cb6-f467-2b86-925fb068486d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 74249731-fb17-4b33-6ef4-08db6b50c286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vcOx9xjA29cUm2BY9Fz+cM7VaUndggM8lGaZWa3jE6BZIECQBTkvdIGSl6nQIlEFrQBmM41PueyGuhveOhJOAlB+sZ41DAO4pTaW+PPMQHSl+jEUHA+jzvdfHrYYzdpKnO6Un3Mc9GW9xdUBwHuo+zDo9MLTuQ7dbKafUHODSpyKe2FiA7wBI6sWqUUzUTM5478jcdSXKWotwLwb+RAlHUAivb24XTOovNJNaZclOgg5R8n9uSCBXmE1lPHw8tIC3vmf+S5bEkyq2jJ8OMzaDs9bKS9+LXMDoAl9y4OtTtChA9N1ZSJ34EAea4FOP7oBhvAypubkP1NrgPkzPpd9vvkGQjwXP7Tgk1Z0MmBNMV7ws1npBNXPZImZtcKCQQ/EwJspbuc379hQps7y3JcirN1SaCJRPkmTyUJe9yNb3eiY+lQZP18K56k3ytitwFf4o5KQKLk+kkIQNVxKMyWW4aXFqFdTe6viK60zWb0R2iD76VfIN35DCnhfCvmNBddKk66vjw/M2IRpEgeEOkfj6y4/nVvpe9XOMJRvaD51l1THNFKwN3zlfmmD/6FnwGDz60uRWaPwQITDZ8AgAPf6PQ4T5tFfcJ8DcspmZGsm+xYALYZlM8qaXSlC1I4E5ZjKHdQ9elQTH9OJbyqJa3xg2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(39850400004)(366004)(396003)(136003)(451199021)(54906003)(5660300002)(31686004)(6916009)(4326008)(66946007)(66556008)(8936002)(8676002)(41300700001)(316002)(2906002)(186003)(478600001)(66476007)(6666004)(6486002)(6512007)(53546011)(6506007)(26005)(83380400001)(36756003)(86362001)(2616005)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VC94b0EwZE9CRmN5SzFDM3loTzFRWU8yeWluOGZlZ29KcmFVa0ZCaERxbTFr?=
 =?utf-8?B?MkVUZjNZYU1ERWxGY05La2dzRmNtb2NYMU40NVdXMHQ0c3A4QWUvd0x1cDJQ?=
 =?utf-8?B?WStJMGM4eU4vSVlnQ0RtNXRNT0hQNXFjZVRUQkpOejhMVERWSVB4Tk1SQnMv?=
 =?utf-8?B?RTJCQTM5WkxvaDMySkY0WUU2M2ZPMUc2Nk4yOG9lRDhUamJSNUtUR1hkY3No?=
 =?utf-8?B?c2dGVndZOThXNWpyVldWNnJXS25SWHI1a3plZURhNHJwVG9QNkVzVVdxZFRS?=
 =?utf-8?B?d1RRaEFML2t0ZHFPbXNFS3J6ZGIzR1JhTm9neGZaMGNKQm1RR1dXazR0ZDNz?=
 =?utf-8?B?WmMyUUs2QU9kS2hDWFQyb0NDN0wrWHNONnQ0TXFmNldpRHlvaG8wbjBIQy9p?=
 =?utf-8?B?a3k5RmRoZTdDQlhUSElzVzRpSTNMZXo3anl0K01kL2hvWUQxdmMydHk3QzZY?=
 =?utf-8?B?ZUg0VkVHRDFWbldxU1U5Zy9kY2h0UGMwZy9ZYk94TzkyaUxIT3UyQ1NxZENl?=
 =?utf-8?B?WGRYQ0R4K1hKZ1U1ZEQzOUIxWXRwcTBGRityOS90M1ZINW1rTi9Kd29ZN3pC?=
 =?utf-8?B?OXhkK1BOUGJ3aC91MW5kczFiaHFiM0pRd3cvb1Q4cnRQanJEeW01U3VVb245?=
 =?utf-8?B?b05MSEdrREJjZUgwZVFjQnJTbURGWEZrQnhsT0VKTU9IeVpwemxEVk55NXRX?=
 =?utf-8?B?WVZTaDlhZ2JQOERRdm1zcnBKTjExdURHQ0FZOW02ZDFEa2h0Uy9wYmR0RVVV?=
 =?utf-8?B?cEFDaGUwNlQ1a29PNXJ1U1R0TnJ3SDl3bjk0ZjhLZmlaU2g5ZUorRUFhYStU?=
 =?utf-8?B?K3g1em5ocDU2UU84R29LeWlOVkNkZWFWdkhPMUI1OUliclNTQmtzdUY1cTdo?=
 =?utf-8?B?SS9qZmtqTmg1a0lQbllDWWpxM3dHMnl4aURXMUhzVzBrbzU0LzAvYmk3ek9H?=
 =?utf-8?B?aURoWDRIV2ZHNEtsRVlsUDdtTjl1Uk00T1BEaFhobmUvc2o0MWlZNkw0SGxJ?=
 =?utf-8?B?YStoMlFBWXg2UFZsbmlUOUZzTjhidGlSd2VhZDdiNXpkVVJCc0Z2WEg4K0NV?=
 =?utf-8?B?RG5wd0NpcTFVcHV2MSttRGlUWElTMEYyODB2WjhrMUU3b2YyV3dtTEpWb2JO?=
 =?utf-8?B?ajZFdVB5Wms0R0dQTldQajZtcWprSXVpcXd5d1ZvVFZNeUJ4OG9UaldUdzlL?=
 =?utf-8?B?VDVIY05XTWdMcHpHZG9FWFhXZTVmRkFUYWJYMWVoRkJPalNHWFkwNVFUdGxz?=
 =?utf-8?B?MXZJQzcxMlpEWlkwQWd3ZERkdXo5dmZtWVYwdUFtc0ZwOGRoeDBaUU1ZZmxC?=
 =?utf-8?B?Y3cxU0liU203dzd3S2t5clB4TFVMUGpIQnpiOWRIV3dyV2pYN21xcVd0UHpI?=
 =?utf-8?B?ZDVQMmd4d3dnd0ZZWVdISFUzbHBsU2hKTUNtRy9KTXp2ZG1zT0g2S1lPVU05?=
 =?utf-8?B?WFFNN00rM3AzaUtaYlhnQUFzd2F4UFV3dENoenViRjhYUTdTQjBqV3BQeSti?=
 =?utf-8?B?cXEzYy9ST1h2WUtETDFnNW5vajU3TjAyOW1sWVJCUExBcHZsVWRyeVdpb29n?=
 =?utf-8?B?aGRYdDFzVnpTOTgrY2t2TXpVUWJtbFdUMnptZ0RHbCt1UHc1YTM0N1F0RjAw?=
 =?utf-8?B?NW1wTEM1YTdTYmFsY0tPK012cEVYRmtVQjZ5eGRVNklwRVpsSThoTFQyQzdJ?=
 =?utf-8?B?TU1GeEkzMzRKUnFZZ2pzeTgySmpXRWVLamFJamNmcjROSEZUR3h2cldWREE1?=
 =?utf-8?B?aTBpdDJUTmV1Ry9KK1hNMUJsWmVIeVkydzdzd2s3NFp2czkvUjQwWXhWUUNq?=
 =?utf-8?B?djVuRDZDQ1RIKzdNRHY1YzJJa25rMnhtajhmRXJJMDJyelIzS29FTzYvWVJJ?=
 =?utf-8?B?bHVzVktqczg4S1BhWFhSM2lzNVlpN0xpUmZIanhqN0FxRmt6SzFmNXJDV1JI?=
 =?utf-8?B?b01nZWZsQm5RQTRRcno3VkJ4MlgzZDFBZ0RpVmc2aXJCM3lVbmZkc2lhNi9U?=
 =?utf-8?B?bDgvT3NpMnVjMWQyMm9sZzBINnBzdGtNVWl2NDZjREFtd2dQeVNmeWVRVHhO?=
 =?utf-8?B?aXltN2Q4NVVZbFRtMVpaZ0NpbnlkQURrY2xpekt3N1V1cXErK2lacFJ5NGlF?=
 =?utf-8?Q?I1WdHMGDpBaSZI/pPY+VaDgdm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74249731-fb17-4b33-6ef4-08db6b50c286
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 14:24:40.9294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YH1VEuGvJ52RAs0UCMp3xsmDQK/R/NVH8vhP9Bg8g5I/Mc4bv1NaG1fnsJN6k0WtzA6Wm2ibYh5X2V1W5W5yyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7958

On 12.06.2023 15:48, Jan Beulich wrote:
> On 06.06.2023 21:55, Oleksii Kurochko wrote:
>> -void __init noreturn noinline enable_mmu()
>> +/*
>> + * enable_mmu() can't be __init because __init section isn't part of identity
>> + * mapping so it will cause an issue after MMU will be enabled.
>> + */
> 
> As hinted at above already - perhaps the identity mapping wants to be
> larger, up to covering the entire Xen image? Since it's temporary
> only anyway, you could even consider using a large page (and RWX
> permission). You already require no overlap of link and load addresses,
> so at least small page mappings ought to be possible for the entire
> image.

To expand on that: Assume a future change on this path results in a call
to memcpy() or memset() being introduced by the compiler (and then let's
further assume this only occurs for a specific compiler version). Right
now such a case would be noticed simply because we don't build those
library functions yet. But it'll likely be a perplexing crash once a full
hypervisor can be built, the more that exception handlers also aren't
mapped.

>> - mmu_is_enabled:
>>      /*
>> -     * Stack should be re-inited as:
>> -     * 1. Right now an address of the stack is relative to load time
>> -     *    addresses what will cause an issue in case of load start address
>> -     *    isn't equal to linker start address.
>> -     * 2. Addresses in stack are all load time relative which can be an
>> -     *    issue in case when load start address isn't equal to linker
>> -     *    start address.
>> -     *
>> -     * We can't return to the caller because the stack was reseted
>> -     * and it may have stash some variable on the stack.
>> -     * Jump to a brand new function as the stack was reseted
>> +     * id_addrs should be in sync with id mapping in
>> +     * setup_initial_pagetables()
> 
> What is "id" meant to stand for here? Also if things need keeping in
> sync, then a similar comment should exist on the other side.

I guess it's meant to stand for "identity mapping", but the common use
of "id" makes we wonder if the variable wouldn't better be ident_addrs[].

Jan

