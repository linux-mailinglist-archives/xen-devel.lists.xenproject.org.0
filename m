Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20EC75ABF5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 12:30:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566526.885454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMQvN-000320-HU; Thu, 20 Jul 2023 10:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566526.885454; Thu, 20 Jul 2023 10:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMQvN-0002yl-Du; Thu, 20 Jul 2023 10:30:21 +0000
Received: by outflank-mailman (input) for mailman id 566526;
 Thu, 20 Jul 2023 10:30:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMQvL-0002yf-Vj
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 10:30:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c648274-26e8-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 12:30:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8351.eurprd04.prod.outlook.com (2603:10a6:102:1c4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 10:29:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 10:29:50 +0000
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
X-Inumbo-ID: 6c648274-26e8-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AI9gsIUjaccoefN19j/znkzDDzhtPtZjaHg6GAJx+4uckz+GsPbGFppLNiEd0V9rzZkzC0pV8al+vMLr5RXdz6RNV915a7cnMXxjYqm1Urh02/8ahB6D2IsjL+u7UFEfhsB/gdUo+/axfzt+514LUg4b03ROjmYc0sz2KjRVpaJ7gU5PCDjL/1MfN4QwopqkOpFaHzNU+Jc/Yt8odYJkF/0xgit/4zzVBc1/GLxnJ5jx4lJHCdRNVTGd4bTS+LwMvFReyLXz8z4r65YfnADOcPTuLYluSPPNapXJoYHs+5gIdjiGtMvSxs647KHyfkBxl7PIKKFnM7LbXMRGWcThhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YLB0PRJaJc1eZsq8HooXBEKKa7biHH/DGQoyvUN0N3I=;
 b=NpE6S1MGcg9qOXuQy1fagdI5ChxdTf5eMaK5MFz/xF5bybDJq+2EAUnslexCZIa4Ks0ae48VQgQ4lU4TtgtPHRDdSbsQNs/D7fXSrIh1EqnGPrmuvNXvoQHvdaDQ9yZHfFNPqa2M16AYDe0f6Ys39564FBLssb44dKwcPFyYVIB2Nvt038KtAaHx2lfgUCeceJrFs2obFBqJ4rM2l85lO7qgYWvsKay4Gxqc7+OUEAyWk6XhcxD4cqnIdtIFbfvei8xJxIfZnFTbTm196MBcULoekhHOYRUT3q80v/9XrryJ+/Opa09sA0ZkC0CF9fayjlW6GYOP9qqHQz7J41okeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLB0PRJaJc1eZsq8HooXBEKKa7biHH/DGQoyvUN0N3I=;
 b=oFxs5kDhDeFCsV5JB+bhQK/nyIzfEOdDFWIhUlaKOPECaIFa4aK1Q2Oo/WIa2ZF0KOr2gnlBwrM4Wtwr8fNd9b566PfoMD2c3DO3K9nTLVxLoUdROb8zzm908ejg8owkpSpGVwgKTh04Y/a+c9V1CEAzLYy+xcGyLZjLJObV6+H/Yk+Uo1NiptrD7zUd69JZadf9BqG8yGqlKzixt8R93+4kMo4+LyAvTHsBmcw9SVKr/WLf3oZmeB7tW9Jt9k7nrUpX+3SXrK5BDGBBLjPWCZqZun1Zj8MieZLpzEwRdjz2IBgXNra2WBvG+viGljvdADvjrcuLvYfEfrYd5F1Xfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad72e892-2ec0-5188-f3bc-6d33544c775a@suse.com>
Date: Thu, 20 Jul 2023 12:29:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
 <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
 <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
 <30540953fb363fce4dfd59f8a7e709247a9872fd.camel@gmail.com>
 <c1a3d447-4b4d-cd9f-642d-e30fed088302@suse.com>
 <0cbf6a69e8ae08f6b85edcc4f8d53a84e0103d8b.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0cbf6a69e8ae08f6b85edcc4f8d53a84e0103d8b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b374650-48de-4cfe-3d2e-08db890c3f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RBqDDzOCO7ykYZPNd6hNxQdiIsw9Jrn50YEIB0VBqEJ+EzQxR3XjPTpRhcc4up/VW/8iiI8t5Wro5JxNDwDQ68DhI16BnP9Pk1a3XFlHl3vzB8U0jdKB9hIIvwPxzudv5sbFhMxaRnkw0lBbpNsSU7UkJOlFZczP+ArfgfmzbXHyZNn6CvNPyXiJUxTBM8LoTU390HCjjp250pAEARAy09sr1ETy5YlwV4qkKbcdjDdxSi1L16nuLB2pZKkBVNWwA0P4YhfVRJH9V7pDc3NnIneg/+/KhlzquHi0lsTXpk4SAJXZSWl1eb4KlBlzQjtoSqJM2Y4CbX24wqpQU5q5G68rSLCth4/hsSL4uVNdlTayvCNgGKipmrmeSj6IMRY+sou+2ETlsXfdluFJDiBKmCP5kudSXd+QjIPgcEPlHOEgkY3AxkuK9yno8/VzeJEcWGpr95S0/aLjSzPVLv6skQEIUHE13LoO+qpu42/MDQ3WSJgtJHLz7MwS5tLZVLgdIna9G3OCC7gGYwc/Qa9VlGnLkO02CY71nKeicM/DAbA48eZq3lTQYBB6HUETNpUx+HV1KrvZ0xhacYsoldZAMLwjtiA5imsb4QfAfcAOa1xIskfb6fhRkdDe8lqBXqijA28J5gAcVZ2j884IpFoB+Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(53546011)(26005)(66476007)(6506007)(38100700002)(186003)(83380400001)(2616005)(36756003)(2906002)(5660300002)(54906003)(4326008)(478600001)(31696002)(86362001)(6486002)(8676002)(8936002)(6512007)(6916009)(41300700001)(66556008)(316002)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cndsUHVSYm04TzVNZGFIZzlGaC8yS3NXa2w5NW5kQS9oLzI0L2ZqL2x4NG9l?=
 =?utf-8?B?bEIrOVg0ZFY1emV0NUcvQWxtMXhsYS83T2NFRzJHcGZGcW9QMXk0YkFFak9q?=
 =?utf-8?B?S0lKVzY3QnpTSnNDc0JxdHpCUkdPQWRUQm4rVDZDMWFJVllOTkRub1NONWZk?=
 =?utf-8?B?b0tQWnpQN3ZKaVVYU3NSanFxcThNVmI2ZHhZTHZMZFM4bnF4M2MwZXYySTBi?=
 =?utf-8?B?RTZha1h4eVZuSFhPcE9BTm1lYngzTVgyQmhFNHJPN0FVUU9CYklpVDJDYkFH?=
 =?utf-8?B?T1Q0Vjljb0lLb3pDT0RDSmFSVE9mYWtCOGxmZnpUazdKK1lMUHdvaW5ObEZX?=
 =?utf-8?B?K1FrQTBRdTJac1RrZFo1cVZaS3hsa0c4ZFJGUGRMMWc2WHhWYzdaYnhJVThC?=
 =?utf-8?B?NmtXeGpCQkhXUWRTNG5jc3JlbFdvakMxYUxCeEdhdFkzT0dzNDM1dFZSSUxK?=
 =?utf-8?B?dGZRY2dHN2ZMbVg1WkY0RmlDKzd0VnU2cWFnMkFEVVB3cElSQytQRjVINytB?=
 =?utf-8?B?dG1qLzVQRUFyTmQvUUxYRW5QOXF6T2FhM3Nqd3NOTFpiVkJwWkdJTUxvRWl2?=
 =?utf-8?B?VUUvV0dyVXBIOWRTcmJmZGxPdFFTQXBDeE82Q2ZEb2tSY290a2ZQNldocmFG?=
 =?utf-8?B?UXRnYXJQZmwrVDU1YUtQdmxDZmlCNm5PYWZFbHF0V0tYNW44SUh3b1p3aVRa?=
 =?utf-8?B?V2Q2dFh4c1ZUak5RR2JVL1pxRFdMZE1lM050aTV2M1RTaGdWZ1Z4eDRhRkVs?=
 =?utf-8?B?RS90OEovQjFySy9Xc0ZhbG94TWs0bTc0Z0YxNGk1eDgzK0dmc2RLZmg4YlQ5?=
 =?utf-8?B?dnYrY3JqcWVjc21EbU5DeGhHaDZXbHpmdDNOc0xycC9YZ0M2MC9zM0NZYmM1?=
 =?utf-8?B?UjE0WnFTSmdlTEdIcm5NTUtzL2ErZ3FLR3RmOUkvTEtGNWRhditObUZDN01F?=
 =?utf-8?B?bzkyckd5dkpodUI1c08rMlhvUjlxNVAvdEIyaHRhOHB4dDhoak5tV2UzOEZG?=
 =?utf-8?B?ak1kR1ZYMmt5Zk00Qkx4VXRWYmN1dHlSU2FNMGVVTHRQL2Rab0dWaTBpYUhI?=
 =?utf-8?B?MW9BMU1HMHRPK3M4Q0VkQ2dheHVnUGY1YnphTEtWZGM0MCtob2pYUVZ3K0tO?=
 =?utf-8?B?UGd5dGV5SlVkWWtSWVIvVmMvNUl5T1RTaUhxVWZQY3RBRzBNUSttc2Y2VHE1?=
 =?utf-8?B?aGNhODdabGh0allEdnZoOEdoZ05PL3g5akcvWlgzRFB2bmJUL0dMVS81WGRs?=
 =?utf-8?B?WWR4UVNWdjc4M2cvOWpkQWF5T0JjS016ZzVDZW4vYmZreXhZaGVzT3lUNEpv?=
 =?utf-8?B?bFA0QjVWMktGbzNsbm40czhKVittVmZURm1HYWtadzlhVzczRDlhdG5WQlFG?=
 =?utf-8?B?YnVoMzJyR2tlK0haUFRVWDAvV1VMYXlpK01VV1JiOCtQSGVtK2JjVytvMDdB?=
 =?utf-8?B?NnAvNWc3UVdoUTNnVkErY2VBdDdxRStFeko4dERRbG5qMDEzdFphb0xDZjhT?=
 =?utf-8?B?OEVaQ2VZMWlxdFRiSHNscjBNOWtiKzgvWm5HMzM4c2lPU3Y5UFpET2YvVElY?=
 =?utf-8?B?cWtMS21DT2RIem9DQUtNUFRvTnAxbzB3RzlaUXYwV3F2blNXQXhpTU9ES3Z2?=
 =?utf-8?B?dGdFcDBKbHRWT2FJamp1bnpjZkE2M1JBYTdTTXBrWGRmeENuYmdKMjRNbk1a?=
 =?utf-8?B?UWNLZUZUN0lpN1puQVRCWmgvRW1ETDlLMmdVYkUxZ2ovcjlpaElCSVNmM1RO?=
 =?utf-8?B?ZnVqeGJFSW5samV5bTVvZGV5eURtQk1CYnJHc2VxWG50VCsrNk9GSFdyNzh4?=
 =?utf-8?B?bFhsZFBvQ0tHOFlxbVlwODZqZU13QjloU1pIRGZxNUxtMEhaYVBUelhUd0tj?=
 =?utf-8?B?Ri8ySWF4bFNQMnpIb0VsbG42SXo5OU1ZaDljUW55QjRZZVRyM3d2USs3Z1Rk?=
 =?utf-8?B?eGlsOVcrZWM4L3pMenJXVEo2S0tLR3RneFQ0Y0tMNUhuYnlLVmVuQ2Vsa3Rt?=
 =?utf-8?B?UnlJN3JkM05SdHg0OFlkcWFIRC9YSDNmS2UyN1pJT1ZjbmZrV3o0SDE1RnRn?=
 =?utf-8?B?Zzc1aVc4OHJsQ0NseUZLY2tMV09TM2M5WkJYZ292cklFNmtLbGt4eUJMNGpX?=
 =?utf-8?Q?KLncSgOL37VD2SD8ldivHWyMe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b374650-48de-4cfe-3d2e-08db890c3f6a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 10:29:50.0799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mv+W1TQEV00JMrqNa4Dq3hEL4s0r44Fu7CWhbCxbg0lIkTiKn9SxK/oOE2Buz/2UK9AIKCAjGFbl0M1Ml0LYqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8351

On 20.07.2023 10:28, Oleksii wrote:
> On Thu, 2023-07-20 at 07:58 +0200, Jan Beulich wrote:
>> On 19.07.2023 18:35, Oleksii wrote:
>>> On Tue, 2023-07-18 at 17:03 +0200, Jan Beulich wrote:
>>>>> +            unsigned long load_end = LINK_TO_LOAD(_end);
>>>>> +            unsigned long pt_level_size = XEN_PT_LEVEL_SIZE(i
>>>>> -
>>>>> 1);
>>>>> +            unsigned long xen_size = ROUNDUP(load_end -
>>>>> load_start, pt_level_size);
>>>>> +            unsigned long page_entries_num = xen_size /
>>>>> pt_level_size;
>>>>> +
>>>>> +            while ( page_entries_num-- )
>>>>> +                pgtbl[index++].pte = 0;
>>>>> +
>>>>> +            break;
>>>>
>>>> Unless there's a "not crossing a 2Mb boundary" guarantee
>>>> somewhere
>>>> that I've missed, this "break" is still too early afaict.
>>> If I will add a '2 MB boundary check' for load_start and
>>> linker_start
>>> could it be an upstreamable solution?
>>>
>>> Something like:
>>>     if ( !IS_ALIGNED(load_start, MB(2) )
>>>         printk("load_start should be 2Mb algined\n");
>>> and
>>>     ASSERT( !IS_ALIGNED(XEN_VIRT_START, MB(2) )
>>> in xen.lds.S.
>>
>> Arranging for the linked address to be 2Mb-aligned is certainly
>> reasonable. Whether expecting the load address to also be depends
>> on whether that can be arranged for (which in turn depends on boot
>> loader behavior); it cannot be left to "luck".
> Maybe I didn't quite understand you here, but if Xen has an alignment
> check of load address then boot loader has to follow the alignment
> requirements of Xen. So it doesn't look as 'luck'.

That depends on (a) the alignment being properly expressed in the
final binary and (b) the boot loader honoring it. (b) is what you
double-check above, emitting a printk(), but I'm not sure about (a)
being sufficiently enforced with just the ASSERT in the linker
script. Maybe I'm wrong, though.

>>> Then we will have completely different L0 tables for identity
>>> mapping
>>> and not identity and the code above will be correct.
>>
>> As long as Xen won't grow beyond 2Mb total. Considering that at
>> some point you may want to use large page mappings for .text,
>> .data, and .rodata, that alone would grow Xen to 6 Mb (or really 8,
>> assuming .init goes separate as well). That's leaving aside the
>> realistic option of the mere sum of all sections being larger than
>> 2. That said, even Arm64 with ACPI is still quite a bit below 2Mb.
>> x86 is nearing 2.5 though in even a somewhat limited config;
>> allyesconfig may well be beyond that already.
> I am missing something about Xen size. Lets assume that Xen will be
> mapped using only 4k pagees ( like it is done now ). Then if Xen will
> be more then 2Mb then only what will be changed is a number of page
> tables so it is only question of changing of PGTBL_INITIAL_COUNT ( in
> case of RISC-V).

And the way you do the tearing down of the transient 1:1 mapping.

> Could you please explain why Xen will grow to 6/8 MB in case of larger
> page mappings? In case of larger page mapping fewer tables are needed.
> For example, if we would like to use 2Mb pages then we will stop at L1
> page table and write an physical address to L1 page table entry instead
> of creating new L0 page table.

When you use 2Mb mappings, then you will want to use separate ones
for .text, .rodata, and .data (plus perhaps .init), to express the
differing permissions correctly. Consequently you'll need more
virtual address space, but - yes - fewer page table pages. And of
course the 1:1 unmapping logic will again be slightly different.

Jan

