Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6668D7D8ED9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 08:38:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624209.972568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwGT5-0002Hq-D4; Fri, 27 Oct 2023 06:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624209.972568; Fri, 27 Oct 2023 06:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwGT5-0002FM-AB; Fri, 27 Oct 2023 06:37:15 +0000
Received: by outflank-mailman (input) for mailman id 624209;
 Fri, 27 Oct 2023 06:37:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eU9S=GJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qwGT4-0002FG-50
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 06:37:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4298a075-7493-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 08:37:12 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7902.eurprd04.prod.outlook.com (2603:10a6:102:c0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Fri, 27 Oct
 2023 06:37:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Fri, 27 Oct 2023
 06:37:10 +0000
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
X-Inumbo-ID: 4298a075-7493-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlQ/1WVlpNAuxFeEYfUET9QK5XZD5q3GXx92M5npO5rCczEQbSsTiLcunruTRdMiiCiewuWxoDnhBfDIXPW8fx3Qte7XyCLMY8polBy0iZuRjKqeATaPo6aT9RKDf5w03Pe37pvzSjMi/lLkSDlVz7aYYDmehL/yTHqeU2QrB71Bij5P6MGMbnzckQBNBNxWM/N4MoqVXMpQvQxpsDcfJWsDqPJ+ojyqQAExtl+JKjvZXJ2pYccTLeadYeI3RXiIjp5NTU4B3YvSYOi99mmyLTVwx9rJxK21H6RhenKJlZDyHhS9VFRdaSVJU0TNK35f6vPaSm60GgnLFNjAxk/FFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MaYTPyMUdFxPi50VGauorgZR46Bvk/OlvQ27kx6IduU=;
 b=FdWSVFv5FCs57v9kCH7i9v26nX6uYZ5qCyLDYdnn2KjDhyHDA9w+bdbtZTd8p6vnzSrJcAIkc6Go0bO8+rEtnWZZbGB6znuboZ2Pp3QuOqwrw5gSQsBXbrBRtbb0n1c2pPKRlc8bbB2zc4scjQ+unxN1ynWjntYrV6mgrKSv7QXlLbXHoejAbOQaBCQWAaSdy/EsOIPFSbURtwnFBAVkdsw7Wyy/L18xa0FLX7+DPrWyddAMDZFP8h4UjnB7GCJkKEBgPzgnldOyKpW+Uzgnj9a0eYIknqj+S3lhu5YerwBRtNRbj2sdSacbNWpjSnJnmC7TMXOarHjgregPngAnlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaYTPyMUdFxPi50VGauorgZR46Bvk/OlvQ27kx6IduU=;
 b=4Ez2fg+McPPyBTcH/weI4pjyq4uwD2ga/FWF5Nv78GGFUrdZe6GZStAmV+Z4PS+/B3LlxTdvnsWPAr32rJnf0ZWSknPLnRch+T7mvZbEwOqgmJsUXUPNtWiVBju/LCASREtWTE/WmB2ZhxA8+mAVRnnbyso4PzmU5J0jRkgLiRRD/lK5JDGmUU2Lyi6Xp+va2HHFgVQWWN1EbCPwiOK7mtniQIIbpXm7qXnuKCSAHmAdocFEtOHb0sWnzjmSpc7obBJdmwrXMwLANMEiCIHHIV1BsuykGRkT05/VcY1PJbr0K62iMnUlSZJ7YrOXo7H3uggnQakLiNGJf4SpHcELjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <08ea1b7b-c85f-337a-42c4-520e40b75288@suse.com>
Date: Fri, 27 Oct 2023 08:37:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-US
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
 <809115b1-2a47-583f-2d04-72a5a21ee7da@suse.com>
 <c107d63c-25a3-4f17-a5e8-7ec3ccd94ce3@amd.com>
 <c81a8275-ecfd-7598-c119-ed83b156c0e5@suse.com>
 <b5330686-82a0-4d47-9549-2d943ca68c7e@amd.com>
 <1cc98108-3328-94d3-5f8d-ff03c965087e@suse.com>
 <92ba94d2-9e57-4241-8626-33f06f88e726@amd.com>
 <a61926bc-e3e6-e381-45de-be3a4878b6af@suse.com>
 <217d9079-3072-441a-a4ba-4db28c565bc7@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <217d9079-3072-441a-a4ba-4db28c565bc7@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 44630890-f330-443f-ac8d-08dbd6b72578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ennpZLezPpMYCbKffBxo6nMaxzAz2e/oIiEhHTFTrtBdEEgiLy/PRz2wMLtqofmy8B+1DlcLem0ucLOQWeVAb96LOOzbbUtftt/vsAGaFjSNy/kY6OCYVNgq7R4bgfLjMGcqbv00eRG5HagT0AfZkTuNjKV67QmuldWkbAqVQAEzbeREwf613klUEFVrmmksnz2v2773ZkCo4wZZWcg2k2AuKum9k2+s1ygaG04F+E9gPytwVNXIRP60+naM8N5Xvtp9aY6nLOLjiT4cwK8fWkk7eIlGp8J8cJVEqhe38am1E7nUTdulVhEn+BKGb44M8gZKms6B28TM4PpjmSYdNf8kUbow86H/3hSzGlkRdgDsdo16/izK+0HscqItbfYJtJucisLB93vJQA2zTKM4U+HWUz8m0DtgnZBpCp6PTWgf5JCDKoS5wIJNJu0F9yl9O2fETthay3s5WEAD7qWZpXOJ3wWYDwBHMe2KCw0ytGdTf7rFiBzzqruYn9xrqc4h5E0l9CGvHshrDOc8A/+TP6nrWWX/Oz53UWTVlixvOXlPaHzmHfYqhyMSV1+QXteuZCX+7AyssbiloSkaSMbZyDJZabIgt85BlNtlXOFdysbo3xAY/2TqS3ZSfCbJKUZI24JVubE+mTpUxdQS41RFOA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(31686004)(66899024)(53546011)(2616005)(6506007)(6512007)(38100700002)(31696002)(36756003)(83380400001)(41300700001)(2906002)(66946007)(6486002)(478600001)(4326008)(6666004)(26005)(8676002)(8936002)(54906003)(5660300002)(66476007)(6916009)(316002)(86362001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXBxd1BpdjJLSnFGdlV2NzJZdGhlVTdCUDgwSjhJMFVOaXBBU2NPRXBBbjVt?=
 =?utf-8?B?K0ZIWVV0bTlPb0Z0VGxrdk9DOTBSMkVOYzlnZmFpbFR6NE9mbzhVbnh6bURk?=
 =?utf-8?B?S0dZcFlWa1lLQi9vLzBEWUNJWGZlUzByTFZjZUdXZlR5VXJMaEVPaHYybjlU?=
 =?utf-8?B?NDN3dWdickMxRlRBbGlrYXBRbE5ZNXQwL1JpR3ZTS1Fmem1FUU84aHYrdXZ4?=
 =?utf-8?B?bDZORWpoNjNFWllnMXdRZWhqTDhoTUxMNjdFNjRRaFZHU0pKdHZrQmhCUmVF?=
 =?utf-8?B?cGlVUm50cVNpUmRPcnRYREZ6VU9ScWMzNGhOeTVMcnlMaGZDUlJaakEvVUli?=
 =?utf-8?B?dDNHcndOakNxVXAyOUNuWkVhU1dHR1hVTm4vZ0M0WDBHQXI4R2JmZDk5Rnl2?=
 =?utf-8?B?VHRYMVVlSWFOaGZ4dm1uc2tENlhxeTk2WW00dWJrT3ByZW9FWXU2WWxqWm5i?=
 =?utf-8?B?dnpLbTBYR2M0MmUvd1RZd05LYVFETTZkREFCVVlMU2lDSGFjNXQzZElUU25M?=
 =?utf-8?B?d3dXMzdkNFlBN3BiKzhGNUFGZnVIZDNaVU9NaDRCeEZJYlZ0dFppWE5EVEp3?=
 =?utf-8?B?V0ZKRUNDV21jM3dvTzVzNkx2WHpTR0ZKdzBhR1ZxSjkxdkZkQWJtSnpVSjI0?=
 =?utf-8?B?dDNNWXNKbjZ2RXptWldUTFdWN1Zab3Y2L0JiaHlIaTdsUDRrMkt5ZDFJSitB?=
 =?utf-8?B?c3UzOFpicS9UMDJNdTFhOE1oWElUbnMwZjVOclMrQ3BMNmhnblUrRHlDRkxZ?=
 =?utf-8?B?WjJNZEdvYUdnRUxXZG5BdTkwRm9jMSt3UTdKT0UxZkxCUzk3TGoyNk1HbjdQ?=
 =?utf-8?B?NnZCT2YvdktyZDg4ZHFSMjdFRGxDVVRaU2I0V1BSVUFwRHY3ajRVQkRjUHJY?=
 =?utf-8?B?enc2MlY4LzBvQklEQVBJNDI5Qnk3cU52ZVc1RE9XMy8rSEpnQ2ZXOE5ZZU5H?=
 =?utf-8?B?bktFcFZML05NdnN3MWpzSjBDbndVR1MxUGlRaXF4YnQ5OUpuRlpEUy8vZ2Jm?=
 =?utf-8?B?NkQ4eVBaYWt2cWJJUVlpbld4RG05SHIwSkJxWGhBNjliK0d0YUhtN2hmYzFi?=
 =?utf-8?B?NzM3QjBTUFJQSjE5dkk2VkFaRUxzWEhQaWJEUm5PaG4xc1RPVis3alVucGx6?=
 =?utf-8?B?d3hwSTlCNENpcElVdHRXeS85YjFFQm41MUlFVTJoVUtJSkE3QSt1a2ZJTjJK?=
 =?utf-8?B?SnBQVng5enJhM1FraG9iMitZOVRqWElSaEZDK0lpNHZWb2NvdjRaR1k0SHVV?=
 =?utf-8?B?QSs4VzFVclJNZ0E3VEM0emRUS3NDWlBQclpGamtMaFJCRDBIcTRXUHhKMUkv?=
 =?utf-8?B?TXJsbitWazZwa09qQU9MTmYyYk9xNFF2ZG5JWGdHbEJCcklVY0NCYlFpaW1N?=
 =?utf-8?B?QVJ6VFRWaUNPaU94S3ducnhueDVhSUJKby9qS0E2NEQzcWhRaVhqbzZKZjBz?=
 =?utf-8?B?bUh4V05STjBBcksvd3gzTlY2MjhFbjhhWnRYcFZBV0dsVnRPempjNkZxcEsx?=
 =?utf-8?B?cUdqeldjQU0wdlpSRkRxUG9BL1FHM0pBUU5ZU1k4Uk5pUjZTVHBEWlRNdkR0?=
 =?utf-8?B?OXE1TE1FZWhHR291c2J4UGFTbmR6bStyUyt3dUZaK0Z6RHJmd25sSTFITU0w?=
 =?utf-8?B?Zkx5WWYyd2xLYTNDZkZPNTJyWStOclVEMHh6R0QvOVZCMTkzdVJCRFltRzZz?=
 =?utf-8?B?UVNlWmRndDBaY0oyRStjRUFyWUZKZm52ZkFkKzRwN1FJc3FrdVB1SndrSTBR?=
 =?utf-8?B?a3lGbG84Zk8vKzFKYXVvbHlmaWgvVUprVnJtelp3K2ptdWlmUWZ6Sk1zbkg1?=
 =?utf-8?B?NjZGV2xsT2NWczRZb29sYnBidWY1YlNXdVFWNVViZ2g0eXVRQUh0em9udWsy?=
 =?utf-8?B?Q3l2MnF1eVE1QThHNUZYc3RSbm9tcUpXRmg1NVY3aTlNQWtybnA4dTZBcEU2?=
 =?utf-8?B?UnNyQVZtRzcwZUE0MTRYaXdreFducXBBbHZsbGRGaEMwa3hXMVNJMHMzRGh2?=
 =?utf-8?B?ZHZ4MjBTVDR6U3hwNThOUGhmWUVvT1NvVjF0MmE1OXVNbDRTV250SEE0NkQw?=
 =?utf-8?B?N3Q0aUhRUXFuN0NZWm9mRXRKWjNjQkpTUHBFanFOejVwVUNLeEZmV3hWZmV5?=
 =?utf-8?Q?ASISobm/1twig3O9rfv8bBUiR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44630890-f330-443f-ac8d-08dbd6b72578
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 06:37:10.0133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Z/3OMEBRvhfmDiTJH2o5AWeyDnv8L1GRZn5pTI7xHMU13sDtJYiXqC6k8ZS/Cm5Ey4vFP2au/UDUkhherSNyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7902

On 26.10.2023 18:55, Xenia Ragiadakou wrote:
> 
> 
> On 26/10/23 17:55, Jan Beulich wrote:
>> On 26.10.2023 15:58, Xenia Ragiadakou wrote:
>>>
>>> On 26/10/23 15:37, Jan Beulich wrote:
>>>> On 26.10.2023 14:35, Xenia Ragiadakou wrote:
>>>>>
>>>>>
>>>>> On 26/10/23 14:51, Jan Beulich wrote:
>>>>>> On 26.10.2023 11:46, Xenia Ragiadakou wrote:
>>>>>>> On 26/10/23 11:45, Jan Beulich wrote:
>>>>>>>> On 26.10.2023 10:34, Xenia Ragiadakou wrote:
>>>>>>>>> On 26/10/23 10:35, Jan Beulich wrote:
>>>>>>>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>>>>>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>>>>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>>>>>>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>>>>>>>>>>               if ( end <= kernel_start || start >= kernel_end )
>>>>>>>>>>>                   ; /* No overlap, nothing to do. */
>>>>>>>>>>>               /* Deal with the kernel already being loaded in the region. */
>>>>>>>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>>>>>>>> +        else if ( kernel_start + kernel_end > start + end )
>>>>>>>>>> What meaning has the sum of the start and end of either range? I can't
>>>>>>>>>> figure how comparing those two values will be generally correct / useful.
>>>>>>>>>> If the partial-overlap case needs handling in the first place, I think
>>>>>>>>>> new conditionals need adding (and the existing one needs constraining to
>>>>>>>>>> "kernel range fully contained") to use
>>>>>>>>>> - as before, the larger of the non-overlapping ranges at start and end
>>>>>>>>>>        if the kernel range is fully contained,
>>>>>>>>>> - the tail of the range when the overlap is at the start,
>>>>>>>>>> - the head of the range when the overlap is at the end.
>>>>>>>>> Yes it is not quite straight forward to understand and is based on the
>>>>>>>>> assumption that end > kernel_start and start < kernel_end, due to
>>>>>>>>> the first condition failing.
>>>>>>>>>
>>>>>>>>> Both cases:
>>>>>>>>> (start < kernel_start && end < kernel_end) and
>>>>>>>>> (kernel_start - start > end - kernel_end)
>>>>>>>>> fall into the condition ( kernel_start + kernel_end > start + end )
>>>>>>>>>
>>>>>>>>> And both the cases:
>>>>>>>>> (start > kernel_start && end > kernel_end) and
>>>>>>>>> (end - kernel_end > kernel_start - start)
>>>>>>>>> fall into the condition ( kernel_start + kernel_end < start + end )
>>>>>>>>>
>>>>>>>>> ... unless of course I miss a case
>>>>>>>> Well, mathematically (i.e. ignoring the potential for overflow) the
>>>>>>>> original expression and your replacement are identical anyway. But
>>>>>>>> overflow needs to be taken into consideration, and hence there is a
>>>>>>>> (theoretical only at this point) risk with the replacement expression
>>>>>>>> as well. As a result I still think that ...
>>>>>>>>
>>>>>>>>>> That said, in the "kernel range fully contained" case it may want
>>>>>>>>>> considering to use the tail range if it is large enough, rather than
>>>>>>>>>> the larger of the two ranges. In fact when switching to that model, we
>>>>>>>>>> ought to be able to get away with one less conditional, as then the
>>>>>>>>>> "kernel range fully contained" case doesn't need treating specially.
>>>>>>>> ... this alternative approach may want considering (provided we need
>>>>>>>> to make a change in the first place, which I continue to be
>>>>>>>> unconvinced of).
>>>>>>> Hmm, I see your point regarding the overflow.
>>>>>>> Given that start < kernel_end and end > kernel_start, this could
>>>>>>> be resolved by changing the above condition into:
>>>>>>> if ( kernel_end - start > end - kernel_start )
>>>>>>>
>>>>>>> Would that work for you?
>>>>>>
>>>>>> That would look quite a bit more natural, yes. But I don't think it covers
>>>>>> all cases: What if the E820 range is a proper sub-range of the kernel one?
>>>>>> If we consider kernel range crossing E820 region boundaries, we also need
>>>>>> to take that possibility into account, I think.
>>>>>
>>>>> You are right, this case is not handled and can lead to either of the
>>>>> issues mentioned in commit message.
>>>>> Maybe we should check whether end > start before proceeding with
>>>>> checking the size.
>>>>
>>>> It looks like it all boils down to the alternative I did sketch out.
>>>
>>> I 'm not sure I fully understood the alternative.
>>> Do you mean sth in the lines below?
>>>
>>>            if ( end <= kernel_start || start >= kernel_end )
>>>                ; /* No overlap, nothing to do. */
>>>            /* Deal with the kernel already being loaded in the region. */
>>> -        else if ( kernel_start - start > end - kernel_end )
>>> +        else if ( start < kernel_start && end > kernel_end ) {
>>> +            if ( kernel_start - start > end - kernel_end )
>>> +                end = kernel_start;
>>> +            else
>>> +                start = kernel_end;
>>> +        }
>>> +        else if ( start < kernel_start )
>>>                end = kernel_start;
>>> -        else
>>> +        else if ( end > kernel_end )
>>>                start = kernel_end;
>>> +        else
>>> +            continue;
>>>
>>>            if ( end - start >= size )
>>>                return start;
>>
>> Not exactly, no, because this still takes the size into account only
>> in this final if().
>>
>>> You wouldn't like to consider this approach?
>>
>> I'm happy to consider any other approach. Just that ...
>>
>>>            if ( end <= kernel_start || start >= kernel_end )
>>>                ; /* No overlap, nothing to do. */
>>>            /* Deal with the kernel already being loaded in the region. */
>>> -        else if ( kernel_start - start > end - kernel_end )
>>> +        else if ( kernel_end - start > end - kernel_start )
>>>                end = kernel_start;
>>>            else
>>>                start = kernel_end;
>>>
>>> -        if ( end - start >= size )
>>> +        if ( end > start && end - start >= size )
>>>                return start;
>>>        }
>>
>> ... I'm afraid this doesn't deal well with the specific case I was
>> mentioning: If the E820 region is fully contained in the kernel range,
>> it looks to me as if this approach would ignore the E820 altogether,
>> since you either move end ahead of start or start past end then. Both
>> head and tail regions may be large enough in this case, and if this
>> was the only region above 1M, there'd be no other space to fall back
>> to.
> 
> Yes, in which case it will fail. This is legitimate.

Not really, if there is space available (but just not properly used).

> Currently, the code proceeds with the dom0 kernel being corrupted.

And we agree that this wants fixing.

Jan

