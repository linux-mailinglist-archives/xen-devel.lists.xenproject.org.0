Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9F657F9D7
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 09:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374416.606453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFs9I-0000jg-A4; Mon, 25 Jul 2022 07:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374416.606453; Mon, 25 Jul 2022 07:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFs9I-0000h5-6r; Mon, 25 Jul 2022 07:05:04 +0000
Received: by outflank-mailman (input) for mailman id 374416;
 Mon, 25 Jul 2022 07:05:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFs9H-0000gz-2w
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 07:05:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19d30e19-0be8-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 09:05:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7099.eurprd04.prod.outlook.com (2603:10a6:10:12b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 07:04:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 07:04:59 +0000
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
X-Inumbo-ID: 19d30e19-0be8-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXUjZYiilPFNqOEUTlg815bz7Dk1M2b/wrHWvlvzizr0kr3VTDnxXnkHb5dzfrro6ZdCawUu9Rn+5mcYEuOIAjAorLMZk13hU+01NOJ583ALsBEJWog7XmjQyw1hEGDUReZLvfIn7RGd1vR7rD4nxJIakNRcw164R6YepQcrymNspKMHDxZDLkDy1/lu/96jzj56u+91osHeC+7wZs2WON/sVOXBVMioaJxVYkeA13YQkry6FWTWp3XvNQcnejCT0KQbpF3MRo5rHPGWxmd/EhMuliqrvSuRUauMoks4Hcjnmd3VWgebP7+PLa2PB6GzVyiWaUKDEuDA9rvneHbG/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1Yw5Bs9b4nFFMGItWddg+suyr26NNRUnjH9jAUQeP8=;
 b=f3LGZtm+aCaXy3Cn8tmVVyzFlxFG6PCg2di4VSUKDzjAXBtLEJ8n4+RF6utZ1/r55Z/V194QIg/S5ipyFwmYBQyl53rNKBNiRIBNkUB1YBxLBTiuvd2WyZJzfBsKSyymihOGwAvid9GA3ZXGWq1q59HaG4HIqslFde5zWqtQsnEwQQdAXORxCww9RDKfO8I31o946g3AGGB0z1GRuC7ZO2sk0ZbxXqq6TaMwaYax8dNJEb028dDE+u8qCc33x47xrznITp1oS1hh0AxEyE3b0noImDmGc5GctBcaZ1mXHd2Di50TmPmjbgnrnvjeO6h4XpFqiZ2Z8ATGm8R6WzPlOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1Yw5Bs9b4nFFMGItWddg+suyr26NNRUnjH9jAUQeP8=;
 b=x+KK6lce2suXfn72RuFLvgs/J5LjAoZ6TFkXMwZrfiGxOCtHmmXyMjuRYhA85TDMdxwwy+tbSe/cVjqKD6YNC4vV8bgJ5BAwq7xcsT5/2FImMTzHf4sW9KEdcSYlXw4gEs2+NZO6gp+zrvdNLkS5/95Utkp0BJJIRrd/1S4VUT6PfCoLAiAYCqhak7OqYT/PZCUOnoiweBWSqYD8vh2Y6qvFyrKKOgHZyIV5FcUyIXINLK/cnlvhQIFi9XAOdYhlEzR4bavML+Bs3peCVyUIle9rtWjj0ro5f0wqyQee09W9PAf5Y7IEbS+VApCrXFMrzDF9YI9dn9pvYj51KmPfiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd20158e-241f-716a-7cfd-a7ed68dfbfc3@suse.com>
Date: Mon, 25 Jul 2022 09:05:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 02/18] introduction of generalized boot info
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-3-dpsmith@apertussolutions.com>
 <39c02342-649b-1f9f-f685-27efb7293c69@suse.com>
 <73cd6f59-a9d4-8767-6732-0eaae851d8fe@apertussolutions.com>
 <b70ef714-a097-3039-b4d8-706bc9cf1c51@suse.com>
 <b33b9450-fce8-0629-1234-091fc7e6bacc@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b33b9450-fce8-0629-1234-091fc7e6bacc@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38fa7b8f-f3fa-4a88-ce64-08da6e0bfd0d
X-MS-TrafficTypeDiagnostic: DB8PR04MB7099:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FdYzjnjIdWPSMjjDmpox61mqVXQWAkBUpgMEnWe258S06qndfEDiVdXwMOfSLdagMn/yqG1bfiz1+Op/qMfJS/tjilh8QGipfFp6h1BnBcZ8WaLdIKCznEHmCIEtG4YqIjf2xD8rw5GflErZ8bhaC+VRNwnyei3NaKgNPiPb5mCVoFatJQehDn7t+PcvfWkYd6eqqg3eOWoG+xJec9LAP+Z9mWeQ3llAYNdtXcbHX/tQYgrQcIEqIwwLXPJwUmUINpGTBkTHZ60ZO5uR+p7sD0WIV+9/qlgelAnQes2VEN46n10j7GqG8Bpk6D171+pz5Eg3su2EyhFYSMOg+G7Sjwr57hznfbdJPOEXbZWcak57jZDp2sgKCpxDM74NMpqnyuzIIClvnXNpLB7qN6MXFhOG/4jVNruu3kCoNx7bcUBqC3xqVPr8797vwbqy9BLER0KNrgA7F5wHSjTiDNlihjQCtm/MQ63zn1HhzKcNXDO1uO7rCTKW4SL7YS4dX5R+79juaQ75Taf5gwWHSTRKyDe5a9PRxTBNq/QbTdbSeoZ0pLYwbtM1Mrj3awBdt0tIOkx4uXvHzJz1TcWh/bv8tghIcv1owlqHND9aJfxP/rRuVxjT2Zv+4xummymWaIS2ZCZ+Gttx79IogRNWTGhXCpLubgUs1xfXSr1ibsvujJLEHOrpm4rP6r6/X0typgKkwyjtShN0ZmM4xyEt07x3idZaAe5IeZwHmu5sEETO+soqH3gVCWPVMs2TVowjoylEK6S2RKR3bYNGtv5nx/hnlfpX83lCu8Yvw0Z2CvWUW0u/nmxeOdLQJW/V+mckfse6vypxirXyajN2Yv8q51OIbg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39850400004)(136003)(346002)(366004)(396003)(5660300002)(41300700001)(7416002)(8676002)(478600001)(2616005)(83380400001)(53546011)(316002)(6666004)(31686004)(4326008)(66476007)(2906002)(6506007)(38100700002)(66946007)(8936002)(86362001)(26005)(36756003)(66556008)(54906003)(6486002)(6512007)(186003)(31696002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bk1xM3ByNGVwdTlvNmxXMnZEQXNWT2h4TUQxRSswZUxlM0hWcU1JQ1VITDJ3?=
 =?utf-8?B?cHFIbjl2Qm94L1dOdHVSOVVCMnh0b3JqSVVoUm01M05yck1JOUVXbmVGbDZX?=
 =?utf-8?B?SU1LWkhuQ0Z4c3F1Z3BQM0luR1FvM09PZjZtWFI2bTFIcUk1RXBoRHJaSkpS?=
 =?utf-8?B?V095N2JEdGxKNk9XeHpXcGpBZVZUZHFUK2sxdnlubFhjK3psclNldjVoMURR?=
 =?utf-8?B?TUg4bGxrYnpteUE1R2VmeWljRUxaOUhRbzJHcEJMYTFhWUVSZnNkVlcxVlVD?=
 =?utf-8?B?YUZCWjNWNERuMkxTM29lTExRTW02V3A3Y2g4YTlzSHpaemZuM2F2ekFyZWVH?=
 =?utf-8?B?QkVkWk5XOSs1VzJHVHlLM1ZVZkdEQVJvYmcvdEpVdHUvdlh0QmJ4d2xkTXRm?=
 =?utf-8?B?NFhuR0JOTGxSQnQ1eDRKellLVkZycUpDRUNyZ2ZaUXZEL0hGSjhBSzVxbDho?=
 =?utf-8?B?TTFSZGRyTU1BYTl1UGpYckZiWCtCaTZIalFmRkFJZzFUbGJOQ1hlZ1llSkV6?=
 =?utf-8?B?TVlKQkgxNldhMnRsWWVRTG1uMVFjanFaWm1kSTJDdlN5K3NiOHkvV3ZPOXFy?=
 =?utf-8?B?d09HSVhKWUZXMWdtTnpzNmRrQ1NaRjdpMEF1cElkM0czWnFtVy9xS0ZyVTRt?=
 =?utf-8?B?Q3FPZEZLQlN2OXN5Vk94MTMrck9KclNubm1OL2g1ZHVFUlJ4cTBlUGpsd2lt?=
 =?utf-8?B?M2xFUDExWkVTc3BBLzhTRDZYSGl4aVM0VDJLay9VSmhlME80dnAwMTBUem43?=
 =?utf-8?B?MVRWeGZQNjA5eHNHWUJhOWpHT29oLzJ5aWZuKzRJbHB1VVBzZGQweTg4U3h0?=
 =?utf-8?B?QnRXeVdiemlmMUNhR2Y3dllSUGtqRmZ1cDB0MmhUckpmYTZXdFhCWmdSSU9K?=
 =?utf-8?B?cmJCd1pvSFU3Wmswck1wZ09jUEJxWmw2U1R3QlRrQmhkYzNOTkthaUNwY29u?=
 =?utf-8?B?dFZmNzhUa1hnT3pBYXhrSmgzVEhxY3c4L3BzV0tVV1FhYklENUpBeTliWW95?=
 =?utf-8?B?aVJvM1k2cFpoUXdQZ3NRaExxMzV6cFYwblF4dzByQ1FjY29sSVpHa2gwZGVn?=
 =?utf-8?B?U21haC9vZ2FESGdYV1lmL2JMbnRyU0tNSUFOd2hrL216eU5mY0RYdU9BWUhk?=
 =?utf-8?B?Z2lNQlg3bTE0dUlUTjNhU2hLUlhTZ3g0ajhML2FYS1ZyK1BpSGsvdHFOT2lt?=
 =?utf-8?B?UE1nVTNSb1FvMzJPQUFwMzZnRGFuVGhLK01RM09aY2h6M2RpU1lIQnhOV1ZQ?=
 =?utf-8?B?QTh4OENPTnZWLzlxQnlPbXZKRU1FelVtaXRrckJCY1gvRzdmS0JISGZwTFl6?=
 =?utf-8?B?ZXp6K2RRdUU2QVpmTjBRYVFDM3ZrZEc1UmVDRU9CVnQ3VnYzNjlPTWlHb2tr?=
 =?utf-8?B?RWZYeG5kYk1uR1U3MXNocDU5TnJiVGtLWHVtenE5ZUJYMTJXbzhkYXpyZjJv?=
 =?utf-8?B?RElPNUM4Vzc3d1dvU0pWZGg1YTAxT1hjSDB6emhIU1JtRkU3QnR1bjVnd3ov?=
 =?utf-8?B?amZCRFAvWWw0dDdRL3k0djBLL3RnWWtYbjVBUlpveHR4SWp4bHpsZHVNckcv?=
 =?utf-8?B?dVNGUk9rOVhkUFBsM1A3MEl4Qkw5MzhKZjdibDZ5Y054a0JZcGowMEpVakNo?=
 =?utf-8?B?elhta0d1blNNUG0wZFBMUnk1Zm92Q3p4OW51TmU4QWtaMU1WOVpSVnphcFBO?=
 =?utf-8?B?WUVjakFKTVQwWlJHN1lKM2hxaUM1S2ZRTk5Lb3E1TVhINWZGTnA4Y3ZpeTJI?=
 =?utf-8?B?RDBGZ1lpM2JLVThqRnR4dGFFNFQ0enU3RHFnZkZOc1JzZTRLMk1SYm9KUXc1?=
 =?utf-8?B?T0lHQllScGE0QWx0SjNETXdrMVk2WEV4MXhRYzY2VVRUeUt6dkhYYmd2czg4?=
 =?utf-8?B?b2xtU1VKWDhxd0RFOUljNzNONFhoaFF4NkdIbm9FeENFS0ZDbTB6V0pBMWZ2?=
 =?utf-8?B?S3FUK3BnUURUVDQzSkh1dWdhZm9ZL2V1L1kraHFNOUExZ3YvWXVJV2FIbmw4?=
 =?utf-8?B?T1hPTkNRRytIN0Z3aGR4emVGSHRLbjNQNWYxcWo0cUszbVZXYk9mUGFNSjlz?=
 =?utf-8?B?SStxNUMvdlBFMWZuTFJueHRsS1AwbzFzSmVCUGswMmJYeHJPa1dVc1RsblNX?=
 =?utf-8?Q?Ou0POMeyqvY9RJHuEFaBPgOCJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fa7b8f-f3fa-4a88-ce64-08da6e0bfd0d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 07:04:59.6676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7UQxAAq05BdXHtGOBJyPGZOwRjDNuRolEyGst5rEsoawJi1FAAilWyAmmJZOhfAed9/4QYvGsV1+9sJpQWDIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7099

On 22.07.2022 18:01, Daniel P. Smith wrote:
> On 7/21/22 12:00, Jan Beulich wrote:
>> On 21.07.2022 16:28, Daniel P. Smith wrote:
>>> On 7/19/22 09:11, Jan Beulich wrote:
>>>> On 06.07.2022 23:04, Daniel P. Smith wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/x86/include/asm/bootinfo.h
>>>>> @@ -0,0 +1,48 @@
>>>>> +#ifndef __ARCH_X86_BOOTINFO_H__
>>>>> +#define __ARCH_X86_BOOTINFO_H__
>>>>> +
>>>>> +/* unused for x86 */
>>>>> +struct arch_bootstring { };
>>>>> +
>>>>> +struct __packed arch_bootmodule {
>>>>> +#define BOOTMOD_FLAG_X86_RELOCATED      1U << 0
>>>>
>>>> Such macro expansions need parenthesizing.
>>>
>>> Ack.
>>>
>>>>> +    uint32_t flags;
>>>>> +    uint32_t headroom;
>>>>> +};
>>>>
>>>> Since you're not following any external spec, on top of what Julien
>>>> said about the __packed attribute I'd also like to point out that
>>>> in many cases here there's no need to use fixed-width types.
>>>
>>> Oh, I forgot to mention that in the reply to Julien. Yes, the __packed
>>> is needed to correctly cross the 32bit to 64bit bridge from the x86
>>> bootstrap in patch 4.
>>
>> I'm afraid I don't follow you here. I did briefly look at patch 4 (but
>> that really also falls in the "wants to be split" category), but I
>> can't see why a purely internally used struct may need packing. I'd
>> appreciate if you could expand on that.
> 
> Originally, patch 3 and patch 4 were a single patch, and obviously was
> way too large. To split them, I realized I could introduce a temporary
> conversion function that would allow the patch to be split into a post
> start_xen() patch (patch 3) and a pre start_xen() patch, (patch 4). For
> x86, pre start_xen() consists of 3 different entry points. These being
> the classic/traditional/old multiboot1/2 entry, EFI entry, and PVH entry
> (aka Xen Guest). The latter two are all internal, 64bit, but the former
> is located in arch/x86/boot and is compiled as 32bit. I tried different
> approaches to support using a single header between these two
> environments. Ultimately, IMHO, the cleanest approach is what is
> introduced in patch 4 as it enabled the use of Xen types in the
> structures and maintain a single structure that need to be passed
> around. To do this, a 32bit specific version of the structures were
> defined in arch/x86/boot/boot_info32.h that is populated under 32bit
> mode, then they can be fixed up after getting into start_xen() and in
> 64bit code. To ensure no unexpected insertion of padding, I focused on
> ensuring everything was 32bit aligned and packed. As Julien pointed out,
> I messed up with the use of enum as its size is not guaranteed as the
> enum list grows and I forgot to consider keeping pointers 64bit aligned.
> 
> Does that help?

It helps as background info, yes, but I continue to be unhappy with the
new uses of the __packed attribute.

>>>>> +struct __packed arch_boot_info {
>>>>> +    uint32_t flags;
>>>>> +#define BOOTINFO_FLAG_X86_MEMLIMITS  	1U << 0
>>>>> +#define BOOTINFO_FLAG_X86_BOOTDEV    	1U << 1
>>>>> +#define BOOTINFO_FLAG_X86_CMDLINE    	1U << 2
>>>>> +#define BOOTINFO_FLAG_X86_MODULES    	1U << 3
>>>>> +#define BOOTINFO_FLAG_X86_AOUT_SYMS  	1U << 4
>>>>> +#define BOOTINFO_FLAG_X86_ELF_SYMS   	1U << 5
>>>>> +#define BOOTINFO_FLAG_X86_MEMMAP     	1U << 6
>>>>> +#define BOOTINFO_FLAG_X86_DRIVES     	1U << 7
>>>>> +#define BOOTINFO_FLAG_X86_BIOSCONFIG 	1U << 8
>>>>> +#define BOOTINFO_FLAG_X86_LOADERNAME 	1U << 9
>>>>> +#define BOOTINFO_FLAG_X86_APM        	1U << 10
>>>>> +
>>>>> +    bool xen_guest;
>>>>
>>>> As the example of this, with just the header files being introduced
>>>> here it is not really possible to figure what these fields are to
>>>> be used for and hence whether they're legitimately represented here.
>>>
>>> I can add a comment to clarify these are a mirror of the multiboot
>>> flags. These were mirrored to allow the multiboot flags to be direct
>>> copied and eased the replacement locations where an mb flag is checked.
>>
>> Multiboot flags? The context here is the "xen_guest" field.
> 
> Apologies, I thought you were referring to all the fields and I forgot
> to explain xen_guest. So to clarify, flags is to carry the MB flags
> passed up from the MB entry point and xen_guest is meant to carry the
> xen_guest bool passed up from the PVH/Xen Guest entry point.

That was my guess, but then my request stands: The fields should be
added to the struct at the time they're being made use of.

Jan

