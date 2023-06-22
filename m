Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625E473A1D7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 15:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553570.864194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCKMI-0003g2-B5; Thu, 22 Jun 2023 13:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553570.864194; Thu, 22 Jun 2023 13:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCKMI-0003d9-7o; Thu, 22 Jun 2023 13:28:22 +0000
Received: by outflank-mailman (input) for mailman id 553570;
 Thu, 22 Jun 2023 13:28:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLfn=CK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qCKMH-0003d3-5K
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 13:28:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a731e9ad-1100-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 15:28:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9783.eurprd04.prod.outlook.com (2603:10a6:10:4b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 13:28:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 13:28:17 +0000
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
X-Inumbo-ID: a731e9ad-1100-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+b0cvvydixY+w7TvouFoJxUoYH6tXTUhpTOUdoHwiO6V7+FYQyeite0pVy0FGVA27BsfrkRTHWQDt8i/yQO7h9oTdd9V97O40gQjvnrFZEM1If01B6oF4vkfcWMr60NR+i3mjLTlXPijwUHKC7xdTo5eBmLWeKjnjCmudGblVwP5vfnrD7JRI1eiUTT45qVaSlTVhe2jlFt0Co9h0O7PLXpxUXFYbYVBwgtXzvyNpJ9n21XUNoS7YpFhTFL5fXQN3XwNHT4VmwwL0tV6bje4A7nlK3ZY5aZB3dWpHnI4AU2NZWMqoMj8fx43csl1z9NTj8WdD/qGRwVGkAGxoMezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=692S3r+mqE6hNQI/RE0P7FIlwajyYHYijfj1K8vRx8I=;
 b=Ej9tL4nMM2KJ+TBTDKDs1EcfsxvHyDnyC92ddz9Ug9muqkVnL4P0i55D8Vn1u3Bcl1Vh2Bqvb/jqHFDccAAn7LlJXzSk738vtwobZ9iCsmlytsYCEFSkiJlrubdUMhmH/mXPzsXHyQZT9DKoCm56Ev/cMRt3i2LxGY5zxgKXm3ZSGT6RkLUq2BtupSLH2ncaQ7BHsmps7gCOdCpuprVEbM8trL/UyOAfLOzhBNKcn1ezDboYRSS2ylO4JEkT76WhXsU5QzWhGREuGeLd21q36CjzLZ56Y0TdWr9GsUt6sJF/ZsghPl7uDpckF2DkfFvfQHqoNKiZudrCNq7FNvGn8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=692S3r+mqE6hNQI/RE0P7FIlwajyYHYijfj1K8vRx8I=;
 b=xEIeMKzqPq39jv2ONbswgndyG/Lg3mGhWOYGsnALlFnqfIlqWC9VcHMClqpcnaivjif+BQGfm0r2KnvlXOqKTiPvufAymm9HKb3z4YzaBkUNFQiSGy6l1uxiBuxQiZrG2t0lj4bxoVYXNbY5iogw87yUbAqh1f46KxIKkTNOzmsZO75W7n9blqrQZsoR4frFIGCvii5HKufrLAHjZz1AGhTlq8q9G5T2nuvfgPc7pMXwICPtLfCHW5lHsHkaUZ2aIMxjjmw95IWTHQKP8j1UGn2XunkU2NeH0Wd349lhqFX6GqUxvMi0zZ5DnxgX9eFmlU0Tbt9CdIA0pwzCh2EJGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <81f00083-0170-9189-19c7-c8385f7173cd@suse.com>
Date: Thu, 22 Jun 2023 15:28:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] mm/pdx: Add comments throughout the codebase for pdx
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615162741.2008-1-alejandro.vallejo@cloud.com>
 <984e13ef-a73e-126c-0bf8-58bee9beb7b2@suse.com>
 <64930879.1c0a0220.28719.ce38@mx.google.com>
 <692b3db7-dfe8-8ed7-71e5-b29dcbba7f1c@suse.com>
 <649440e5.050a0220.708ad.038d@mx.google.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <649440e5.050a0220.708ad.038d@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9783:EE_
X-MS-Office365-Filtering-Correlation-Id: 078c33d8-2f4d-4407-aa67-08db732489b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LprkdRi4OMXnRgax7TfBDgiIaBd1AztUDFFr0zejkOYvKD2vxmxa3q/CmB2cCvwaPhmjGrlzmihAQRx1L+CscnurY112GQOgJUfvTrSt2BlNEXlFBndxA58amwP3D8ztGj/CFItEHClSLs7WDMWJhn3NH0PrSpQDnUJ6cduknTY7VDD90mC1LZQZHEWniSrFh5dP7S7p1jZih+Q/E+Y6hrOjngLIVAwRxyr9+ISlOXHyIyNmyDpbz0LZbRO8BRUNbMUUf0KTn3s7PDrIe3/9RaWDe7C52geg50+g9fwl45WX1dXgzxogJl5af/2z2mlzYFVg05xSgyYz9/gRqjoD2c0kgIGDhy8+BWFDhBueDnxWcLSdRC/GogOgCCPqF/7gdlk9H5vL3yJfknJ6Xp9KqXPpxTPFOnCAajPASN2TrWJdQOCHkjjGGjwK2Zpmuad9CDztYzXmnTUp+XKnGrm6ayBm9ArGMmPPnxudKzzBG3L9snCBk/mq2e8g5sC0NdyAD4x8NyJ7ZM7+exGbycrjvjeaB5FcO+jjSihSlsGrSG8ODDgFuLJmtXyosw545E175N0cnd365W+7uqurMmKTGz2Dl0Iq1rBp3UVcZA5+YLwbsbaUiamCA814Cg7kYqhThPKdwI9DY3tmtEhjffw2jA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199021)(53546011)(186003)(26005)(6512007)(6506007)(31686004)(478600001)(2906002)(86362001)(31696002)(41300700001)(8936002)(8676002)(2616005)(36756003)(38100700002)(54906003)(6916009)(4326008)(316002)(6486002)(6666004)(5660300002)(66476007)(83380400001)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFZDNzc0bW5GVEd4TVNodGJldlFVL0Q2QjFQOTRmUDIydHh2MVIzUFErZHZX?=
 =?utf-8?B?d1JaVHQ0OTFmUm1MTnlPa0cvaWpzN1RUMlV2QkNqTzFCb1VzcS8vcUZ4NnRE?=
 =?utf-8?B?YnZmdXhBNlFKT3RLSGVDZ3ZSUXNnMHhtSVQ3S0xHWWtFVUVtRVFHb2V1aEVW?=
 =?utf-8?B?ODRtVlgrMzdMSmRhdzFlcStsSE40eTJ0ajltcXl3Y3kxbUIySUdXU2pHWjNO?=
 =?utf-8?B?WGU1WmxsTWlhVmhDYmVtcGF2akdsWm1OM2lrTG9DZTZoN244MXJwY00xVVdP?=
 =?utf-8?B?a0ZvMjJHY2k0c3V3Ujk3K3pqZGEwVkttbFNZR1JDS2FuL2tMUVR6Q2F2SnBP?=
 =?utf-8?B?TzBHUjZIaTY4WUxvaWZ6bGVkWE03L1VZVVlBaTUxY2g2dXFsVTJocmRkTVpw?=
 =?utf-8?B?RHRMaDZ1cEJpWXFoSnlha1A1WW1yall1ZGh5cG0rNlN3Sk8rS0t6cnhZczg3?=
 =?utf-8?B?U2pEejdORG5UZ2orZ3JlVk1YWjdLaUlRUCtRZEV5bnFNdUoybTRRUW5LQ3VX?=
 =?utf-8?B?dlVuR3VSdnJ1d2lBVVIvbjl4VzJFVGgvcUhja2ZkMG5zaWJ5UzduSi92a2hR?=
 =?utf-8?B?a093SWxLUDFJTk1XdjBnajhpaW9QODgydTQ3ZU1wQ0twa1hsM0xvMmpSNlNw?=
 =?utf-8?B?ZmVWRGxycWUzVkd2SXF4UkI1VWIwSE5pNitXNzFHQ21PU25UKzk5Ny9YVys1?=
 =?utf-8?B?aTIvTENGems4b2pRRmdxNUU3akhMS1ViaDl5Zk4yeDNJNStBazZ2TlhreDRh?=
 =?utf-8?B?YlhwbGR0aUI4UytpeWFUY3ZucGo4ZzZnSTYrOWR3QzlhZDZZOFRpb0dZamVy?=
 =?utf-8?B?Uzc0Y1FKUzVkTURyQVhxVVgwaEZMMy9xMW5QV3RUaTNPZnQvZEc3c2FsTkxV?=
 =?utf-8?B?MjR3YnFHVzk2WGlDamNxbTZnMlJDOTVwaDZRSit0bmI4NmpzM3M2T2NsV1A4?=
 =?utf-8?B?VWlEaUpnQ0FLMUZrK21IditONTdKWEQ3Y3kzZnBNeVVxcUNSZmVVRWRXMVlU?=
 =?utf-8?B?VHJyRnRlSWVueit1aW5YSnRPZVNZNFpVMDg4d3JQaUt6Z0R5S0lpeU1FZjNQ?=
 =?utf-8?B?KzNqbHZjVEQ3ZzVOb1BIN0xkMmt0M2lPek1tZlVlbGVmSGt5Ymg3b3hVYXZN?=
 =?utf-8?B?SmxMWFlaZnNCQkNqSUd1T2EwNW1mSktUbmwrYm96eGVGMzkyeDhpSXYrWUNK?=
 =?utf-8?B?UTh3VmhIZmpxVXFabzVWYjV2S2dtZ25hYWZXWGdNL0dzaDRkbWg4Q0wrRHpz?=
 =?utf-8?B?TEg5MkJCY2xwZHUzZ212eEVBK0JPRlZZZTRjUXk2UFdTanZMdGU4bWpsNlRP?=
 =?utf-8?B?cGFENDJJNDEvMjNjYkNQM0Fkb1dWOS94Nm53M0hLeGt2T0lBaXN4N2plRG5N?=
 =?utf-8?B?M0V6TGVWK0ZQOHhrMzJvQzJjTDh4akYrUVR5QnBzazRlMFVGbHNRVEtPUERO?=
 =?utf-8?B?T3lxY2VYcm02RVgvdnNGbmsxUktMSXJ6WWZSay8yM0NJazBKWUdaSThJWGw4?=
 =?utf-8?B?eHd5MnVzV204dGlhNUJmM2tUUlJwa2tnTm9DSzRJaFg2NGZwY3EwK1A2elVJ?=
 =?utf-8?B?UVdOcGd2QXc5eDJmWkIwNDJPa21rMVhsaGVwdzhBRTVMakRkU2MwYWpya0J6?=
 =?utf-8?B?VDhKRzVVY3VDZWM3S3JxbE9lYUd5QjFwOGh6aEFFNjlDL0kvWUpCTStFbm9k?=
 =?utf-8?B?akYvcmgvcXh4NXZEZ0VRVFRpQzJMbC9wVFluRFFIdHhOQUhSekhUWCsvVDdk?=
 =?utf-8?B?TmkvdEhCWUxkTkRzNWtiNlBpVGFpQ0FtcU41WXZxL1htSnZjakxBdzRlMUFt?=
 =?utf-8?B?Z2h0NVMxZWRBK01HWkMra01TTjh1YWNKQ0U2c2UyMmdZSHp0NjRsWklCZVV1?=
 =?utf-8?B?MnRNcUFDZlRNY1ozcjZSYWdHUmt2S2lvS3Bsa24xY1VVNENOSHI1OWVqUWgx?=
 =?utf-8?B?TWR6bU5DNk5ENFh1aUpoQXlJcWx0b1hlR0prK0RqNkFOYVAvbTlWSVkzdkpV?=
 =?utf-8?B?M3JBVkE0ZVlCc2RMUHRwb2VXOUc0SjVUQ25FVG1PazJkOFN4QUZEeFk2Uk5B?=
 =?utf-8?B?Qi8xT1VJZllOOFFyRFdNNW4vTGZIUllvUjNzdXN4VVNKdDF2V3FyVitVaVc2?=
 =?utf-8?Q?hdIMWbogT6B5Ia2UezdUEKLOe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078c33d8-2f4d-4407-aa67-08db732489b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 13:28:17.0677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4nbx43GFzye4Idt4YTNJMKE3m06nVB3N1iianYFBJJiDTo8Zlp8yo0Zof7xTpOPbqdn/Trx5o2OPVfF8tLKWyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9783

On 22.06.2023 14:39, Alejandro Vallejo wrote:
> On Thu, Jun 22, 2023 at 11:15:17AM +0200, Jan Beulich wrote:
>>>>> + * This is a technique to avoid wasting memory on machines known to have
>>>>> + * split their machine address space in two big discontinuous and highly
>>>>> + * disjoint chunks.
>>>>
>>>> Why two? There can be any number, and in fact on the system I originally
>>>> had data from for reference (when first writing this code) iirc there
>>>> were 8 nodes, each with a chunk of memory far away from the other chunks.
>>>> The compression scheme used merely requires that some "inner" bits are
>>>> unused (always zero) in all of those ranges.
>>> Well, our implementation only supports two and I didn't see any obvious
>>> hints about intending to increasing that number.
>>
>> Where are you taking that "supports two" from? When I first wrote this code,
>> it was tested against a system with 8 (maybe it was 4, but certainly more
>> than 2) discontiguous regions (not counting the hole below 4G).
> You can have any number, but there's a single contiguous bit slice being
> removed, as far as I can see. The adaptor functions in
> xen/include/xen/pdx.h perform a single shift.
> 
>     static inline unsigned long pfn_to_pdx(unsigned long pfn)
>     {
>         return (pfn & pfn_pdx_bottom_mask) |
>                ((pfn & pfn_top_mask) >> pfn_pdx_hole_shift);
>     }
> 
>     static inline unsigned long pdx_to_pfn(unsigned long pdx)
>     {
>         return (pdx & pfn_pdx_bottom_mask) |
>                ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
>     }
> 
> Unless I'm missing some non-obvious piece of the puzzle, I'd say that for a
> truly general compressor we'd need some kind of loop over the hole mask.

Well, further compression might be possible that way, yes, but that's
entirely orthogonal to the number of discontiguous regions we're
talking about. Consider

0x0000100000000000-0x00001000ffffffff
0x0000200000000000-0x00002000ffffffff
0x0000300000000000-0x00003000ffffffff
0x0000400000000000-0x00004000ffffffff

The reference system's arrangement was slightly more complex (first and
foremost because of the memory below 4G that node 0 had), but came close
to the above conceptually.

Jan

