Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707DB66986C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 14:25:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477330.739995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGK3J-0002bG-J0; Fri, 13 Jan 2023 13:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477330.739995; Fri, 13 Jan 2023 13:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGK3J-0002Ym-GH; Fri, 13 Jan 2023 13:25:01 +0000
Received: by outflank-mailman (input) for mailman id 477330;
 Fri, 13 Jan 2023 13:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=grKZ=5K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pGK3H-0002Ye-LF
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 13:24:59 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2084.outbound.protection.outlook.com [40.107.104.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id acd5eb07-9345-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 14:24:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7544.eurprd04.prod.outlook.com (2603:10a6:20b:23f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 13:24:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Fri, 13 Jan 2023
 13:24:56 +0000
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
X-Inumbo-ID: acd5eb07-9345-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQ/OsSvSeKcVk3xGq4ozr6EweZC4+H+72oiXJN/5vNigGgBj5xuXk0D6yCNG/duYe6u2fuKKX43wxEMc9DB7DvlHET4rKApaGTEjbZckXdYO5ninPpJKp+gbDwtfuvcm78nTwV+cc2qGBKGy9kQOH8uvIRJtIMR4oYhRFUj24m/6GZRkYIgwK/SOfuSn6EtYakRVEJs3TzSgnCzuD/rn68V+ZiUAER0vpNnW88UBhNzyc9MbpX8X8PgNqnH8+MWljzSSDhhYk6Utjhqgv8Su3cBvzOd9rRwLY/W1vxbW2s6xMd1IsLDQh9U362krWqMUK1ZZmFOvPU1rEPd3y8flGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFHJ1kJOlL7Dn84b4K30ZPwmVFgu+GJS4RBX8/8d4bc=;
 b=brYiRyYNt/E6EmKgIe2huISb20tpTI3E4AMkWU/5MbBNmaWjBQoQYW6mbDVUanDw+GfuADIATyKev6UrKzmpQyNB53t/CKY5o2WDw+zeKfztjlJI8592bha11Dprp9NkfnE8EFvYQVEYXoqhS7ConeF2y7djWbvYc+/eyuOin3iCgUL4c3gJu8d1HEMZjIy5HdWRUhH3F+dgAe4sZuK18UZEsasyEY5PLJyDd4LiEFiJluvbvfsKRVE//s8jGi58cjdBbBEaJ1X9tnqM4TQtstS1QDrAmzFFt16+IKOzvxBN/bmcJRJzFbpfrRU/2IWW646Yn8NEMKVs8n/ueSSHOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFHJ1kJOlL7Dn84b4K30ZPwmVFgu+GJS4RBX8/8d4bc=;
 b=mOyrVe4TqSwKNykUbBsg9aTAIvZT7HMf3tAzxUDVh7bFEGnuuR2mBpx6ybFK5J105ekOlp/hQjxm8GCfxJMYiVR/+SUNgb6CMdtBMQN1IU/BWOELoGksASuVe1wM5bKSHcZ+GwaiIsOJlzNeDQMIxXRgZNQRa9DzTGrDE4yvHF+evsctjhpHagsjglL0OvkliqKz8efCqIQ7VdJXfuaRnQlViPPRG4h2gUpprF7HrHY356MvtRmoFBlQ3hyQFXgmbIy5Yy7Lb3Ju1qtg+xWIvMgSKLZd5n8NXwIc6GRGHdAtuP7JxM6lxPHPNDY+f5wx79pl3lXtX4RdikgmyZ4uog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da973e5a-3a1b-3e99-ebf9-e462915eb338@suse.com>
Date: Fri, 13 Jan 2023 14:24:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] x86/shadow: sanitize iommu_snoop usage
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <01756703-efc8-e342-295c-a40a286ad5f1@suse.com>
 <cf0ed06f-4d49-0f73-cfd9-eb49e951048c@suse.com>
 <6596d648-6400-7907-bc21-8074dc244247@gmail.com>
 <88e3ec77-587a-ae68-a634-fed1fa917cd7@suse.com>
 <b76a7834-9868-c5c2-e058-89911a552c80@gmail.com>
 <512d8768-28f6-d9d6-c1cc-18c5fbf2a636@suse.com>
 <4f1d289a-7c3b-c4a1-34bc-1e8bd62a416a@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4f1d289a-7c3b-c4a1-34bc-1e8bd62a416a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: 757199bb-1e1a-4e63-f0dd-08daf5699021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mX6sdCXF/n+bqh3jb+QlxbRaSc5J7cjCWEPpbZcPqUIaMH70ymJo4vJQw0nLvFNZmPng0py1GeLrJV92JOBbCZxLnuliLwDqOygZfOWMwh1/COoytXHx8OnYbZB9UEUgDLGB5zCjNgmxNITbBFJlI/b2TCKsHx8KPkIWZxl3Un2gTY6OsPUaY7MbQuSB8x2l5TPRZc62Y5AV4wGUba6vwryRoKo7S2cYL1fp/LAySLgsJL28UYcFbaBoXZigqIkolY0MhuzzzXOXL/E+2ySvkBJc73/8owJ/JG8gi4v7A/dEihEpTU74nfYqsar3Pr4iGLGY/LKxlDnx2spCjplQx79333TMFufN/5YG7UgsljVA41u5Q4S8Kqyn2Z2ZnMUKWF6PKKLO0lW5u8YdKHsEIvhKkwj/uBy+1yudGtjOD02kZfcTSyix/QFU58F8fK5Q3N8nDScvCod8PsXrne5+dyK/6jKokrgQzRiq3vvZnuM/dAYfyFGGtZ8pLGRyPoYdcGv05X+cx68qnFO713U/mhSsTbWEs6kYXRb20X4M7maayVRQFxuU+/7EL/GqiIHL7/nSTIZePvd0wqhw/SCJRWHL5pghAUJAbKU+s3eL80ih2PHUjd9ZtcHvgXYH/5dFvHc1IqqoNCrgDS4Odb8vnLM4uML951a91cQ2QMWm6Zk6UGGzGaMwfgBg+foR8pUy2zOWPV9ny3i4WxuN7ec0TFxH1dZ8DbQZ22Ei5xu8ycA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199015)(38100700002)(4326008)(66946007)(8936002)(6916009)(66476007)(66556008)(8676002)(5660300002)(31686004)(86362001)(26005)(2906002)(316002)(54906003)(83380400001)(41300700001)(2616005)(478600001)(6512007)(186003)(53546011)(6486002)(36756003)(6506007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkMvNkdFUC9VQkNvc0hkQUpydWw1Q0RDcTVPL0pqbDVvU0NBZUxXbDkvTjBJ?=
 =?utf-8?B?ak95TkRpNWlSeTNhWFppRkpoWDZ4RVVta1dtbUxzL1RLVWV0ZFphcjdSN2h1?=
 =?utf-8?B?c2lTWDFGMG5vcXBvN0pYWTE4MnBuYTk0RmpQK3A4Z2taZUV4d1o0Z3EveUgr?=
 =?utf-8?B?Smo0NVoyb1JQVENUZjJpN0VDbEhNV0sySGRDVHR3UjF4V21jeHdab2t1cVZp?=
 =?utf-8?B?MFNpVUxhRzJLYWVSSndtWjkram5LdjN3STFBV0lXNjVIZmtrYTdrQkRGQnlw?=
 =?utf-8?B?dDVSZExtZXpWZzhIZDgzU3BHeVljTVpqd0sydVlNY2l5amtCMW5SZzBTVmo2?=
 =?utf-8?B?Rk1RdjNpaU04RGIzZjk1NzNLTG1qRkpCVHpyRkRjOXdzV2lrVTN0ZE1XTjVP?=
 =?utf-8?B?SW9IdzRMQVAzaXp1emZ1ckg1OVlGRFJxRDJla0hhUnRIMzNtanJEcndPbzdV?=
 =?utf-8?B?dVlsQ2JCbUpzVGE3aDZYL3JOdW1OQXdFMzZxSFRoSk45d1IxSW9LK2FPYXQr?=
 =?utf-8?B?VzZ3U0NjSkQ2QmM0TmRVeEtWZWdoNFlYS3VVekQ4bDhZMWRPTVBmNVZ6OHZh?=
 =?utf-8?B?b253VXllb0x4cm8xVXY3dG4xVTBjL0NqbTMycnBvd2pTdVVmYlBuVU03RWV0?=
 =?utf-8?B?c3FMcngvNkhURGM4L1NnMnpRWWFRdU44RnF3TWR4QkRDYk1ZMmNPZVFZYk1a?=
 =?utf-8?B?bUl6NWFCR3grZ2lPMHRhZk45STF4MFlpUHppaitHWkVwREhQeWU5cEZ0RFI4?=
 =?utf-8?B?bnJ1cmtZcis1enozQkVIT0h3Z1Q0S3U3UWJHZFQ4R1k2dmJWTFNqVjd2WS9x?=
 =?utf-8?B?bEd5d2ppZEMrZXl3NHp2WHpYNUUwQmVMWThhZjFmN1hBNU53MGhnRm5YUkRm?=
 =?utf-8?B?ZkZpMHIrRzdWcDhNMlBURk9BM0NTMzlIVDRyWTl4ZDdKMGZWSkNyUllDYUpU?=
 =?utf-8?B?MjNVY042WUczQ3FsdDA2a0dNZ3huclI5ZDZrRDYrRWdvdnFsVkFjem5ZdlZB?=
 =?utf-8?B?RU1vMzZEb05ZY2QwUE51Y0xyY2J3N2lFdHFYM1R3WlBCSW15ZFJVOWZSc0pq?=
 =?utf-8?B?Z1hIcnp1MlRMTk1mR0VmdTdFM2pVdkZxYW9XbTZuQXZVcC95bkV2MTRXdXJU?=
 =?utf-8?B?czh3TlY2RFRURVlKLzZQVXdsYldrNW9MMDh5YXI5OTBYQytkdkNVMUg1enRt?=
 =?utf-8?B?MjBqUnR4YkNEUWMwRTNDaHJydHI0MENYMWU0TFVnc08zQ2hLdmtGeWlQVENl?=
 =?utf-8?B?bzJkNWxaRkxiZ0g2UXh4QXhOd0RaUml5SG16V0VNSnBRR1hYUlRsMzkyM2hP?=
 =?utf-8?B?R0tNVExMZ3JrSTFvNlJ5a1huTDBvNE9SNko5UU9JaThSeWRVd0NpWC9tak5n?=
 =?utf-8?B?ZWpYQXRjWVp5OHU1bWhyVWdNdlFPOVZhY014aEswQ1YvZHRhd01XMTBQRitE?=
 =?utf-8?B?cUQxWDdZTWpOOVcrcElWYmJqRVo4b2RKYjdFWWt4NlMvVm1MeVhZa1F3azE1?=
 =?utf-8?B?YmJtVHFJQVN1OEdzWms4VFBpRWFRMU1OM1l3dVN3MzBQL0R1cU43dFh0MUNR?=
 =?utf-8?B?VXZvb2RjdjA3dzlzTEY2eElSQk1zVi90L3hHQ0hQcHRWY3A2dTJYWk1ZVkk2?=
 =?utf-8?B?SHFVMVhGdHFUSlBJcDFHdzlUZ3N5OXJnOWJOYTVGeTFJd3REMmtsK2xuR21N?=
 =?utf-8?B?OERMcGpZeUpIelZXT1FpUVp3dnBsbHpTSlFhclQ0MERvWDJiYUpqalAvelVz?=
 =?utf-8?B?enhIcStxL1BxUGMybnExeXR3Z0VIRGxxVDlYVDd0VFNONFZzczlTZHZtVlFr?=
 =?utf-8?B?OTZWQ0lEeTZVeHIxcnl4alQrVldvN0xseVFYRkh2Z1hUdTN0U0F6QVFvcWVE?=
 =?utf-8?B?bG5WYmhVbnplcjFmcVgzbGdmaXlvalVtQXZhQUZxaFFtbm5lRC9XUHZhRXV6?=
 =?utf-8?B?SDR2VU5HdjlteFplY000UGJLU05lWVhKcHc2VzlMc1g5SFN6Uk9QKytXUmxU?=
 =?utf-8?B?NXk2cjhjM09nbHBpaTg5SVRGTjlGOHNQNkh1MGQ2VlZqT1JOcDJsajNPYlJ0?=
 =?utf-8?B?K3NNaVNvNStGVHcrSDcxdWFNWmRodks1SWx6ZGpQMWtmRGIyMVlLUWptOEJC?=
 =?utf-8?Q?U9tfDx004xKlaSqslS+7bjlPj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757199bb-1e1a-4e63-f0dd-08daf5699021
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 13:24:56.6736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3ZcWuGZCKT2ZVsE/qfYsYC5o10C9KuoeiY2+hXhR0zGOmthj3cQrWxeZeDqUegrNXkNGUagKRTVLDS2vvuwEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7544

On 13.01.2023 14:07, Xenia Ragiadakou wrote:
> 
> On 1/13/23 14:12, Jan Beulich wrote:
>> On 13.01.2023 12:55, Xenia Ragiadakou wrote:
>>> On 1/13/23 11:53, Jan Beulich wrote:
>>>> On 13.01.2023 10:34, Xenia Ragiadakou wrote:
>>>>> On 1/13/23 10:47, Jan Beulich wrote:
>>>>>> --- a/xen/drivers/passthrough/x86/iommu.c
>>>>>> +++ b/xen/drivers/passthrough/x86/iommu.c
>>>>>> @@ -56,6 +56,13 @@ void __init acpi_iommu_init(void)
>>>>>>         if ( !acpi_disabled )
>>>>>>         {
>>>>>>             ret = acpi_dmar_init();
>>>>>> +
>>>>>> +#ifndef iommu_snoop
>>>>>> +        /* A command line override for snoop control affects VT-d only. */
>>>>>> +        if ( ret )
>>>>>> +            iommu_snoop = true;
>>>>>> +#endif
>>>>>> +
>>>>>
>>>>> Why here iommu_snoop is forced when iommu is not enabled?
>>>>> This change is confusing because later on, in iommu_setup, iommu_snoop
>>>>> will be set to false in the case of !iommu_enabled.
>>>>
>>>> Counter question: Why is it being set to false there? I see no reason at
>>>> all. On the same basis as here, I'd actually expect it to be set back to
>>>> true in such a case.Which, however, would be a benign change now that
>>>> all uses of the variable are properly qualified. Which in turn is why I
>>>> thought I'd leave that other place alone.
>>>
>>> I think I got confused... AFAIU with disabled iommu snooping cannot be
>>> enforced i.e iommu_snoop=true translates to snooping is enforced by the
>>> iommu (that's why we need to check that the iommu is enabled for the
>>> guest). So if the iommu is disabled how can iommu_snoop be true?
>>
>> For a non-existent (or disabled) IOMMU the value of this boolean simply
>> is irrelevant. Or to put it in other words, when there's no active
>> IOMMU, it doesn't matter whether it would actually snoop.
> 
> The variable iommu_snoop is initialized to true.
> Also, the above change does not prevent it from being overwritten 
> through the cmdline iommu param in iommu_setup().

Command line parsing happens earlier (and in parse_iommu_param(), not in
iommu_setup()). iommu_setup() can further overwrite it on its error path,
but as said that's benign then.

> I m afraid I still cannot understand why the change above is needed.

When using an AMD IOMMU, with how things work right now the variable ought
to always be true (hence why I've suggested that when !INTEL_IOMMU, this
simply become a #define to true). See also Andrew's comments here and/or
on your patch.

Jan

