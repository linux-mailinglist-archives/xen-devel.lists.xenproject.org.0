Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BA27D82CB
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 14:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623794.971982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzcR-0004eA-AN; Thu, 26 Oct 2023 12:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623794.971982; Thu, 26 Oct 2023 12:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzcR-0004bc-71; Thu, 26 Oct 2023 12:37:47 +0000
Received: by outflank-mailman (input) for mailman id 623794;
 Thu, 26 Oct 2023 12:37:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvzcP-0004bQ-UN
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 12:37:46 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2073.outbound.protection.outlook.com [40.107.13.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 759dbc6d-73fc-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 14:37:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9935.eurprd04.prod.outlook.com (2603:10a6:102:387::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.22; Thu, 26 Oct
 2023 12:37:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 12:37:11 +0000
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
X-Inumbo-ID: 759dbc6d-73fc-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oD4us4lWXEemcaWVAZetQsAKHPmbGTZDDt9mvyShngopjfZFS/pcj2UfPRNvY0JNUtu5dHaVKjnU3oP8tO1fjLaMsynUOziPLJJpsSXkdgKEF04bY7IdDsmPXYWOiV53d7S7wsBiPJz0DuU5J2xnSjyIDBr2oaS8reNYrVbsyMnXQoWVpSkxr+PAGkDUhBzlaHg+1YTLLzf3HQ2IxX8jdOsaXKl5JJk4FPrEirK46j09zDaWp1Ai/bZRzfxB8PGnUaGZRBXE2L/Hsnh0I4fOaKKJkz3cxuUdZzbJiQPCaOcZ1g1acbgTP+GpZzq4sgkBhhvcTgiR0lZToJSjdRz8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BsNwxmn3Vf+ElTPZZquO3BrSJg0FRfqwFU1woJ87Dg=;
 b=C1YzcjcG3DQAX0VBU0NAXOd+mgn50W0HKapqNYPUk3yiT9aVNNW0uETQGjm1P6b+8p6P1KVpr+dwTh0u3exqdNksocmywIDWIoKRYq1C0KTpuaAhcMjqrUoSQQf/7LTUJGqOrd7/LeaGLCwWo8BpArtrJ0ZYMrVGCF2fwqqEtgbBusCHEY7yDwEgVJjNGxCW1k+0B5SNacX90U0hrlCWDpaGFUwRwM0vEHUmqit08QBTLo/v4rL7WUuCTyiIBo5NfUyuNQYeAzIMrq1F85Ryd99F3J7pcmspeAT3A9kN7o8MtP6UwvdynNkcTFWiPPQLLA+PO55C9GDh9n2k71oU8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BsNwxmn3Vf+ElTPZZquO3BrSJg0FRfqwFU1woJ87Dg=;
 b=Kx2+1VYSm9ZIGwKrIWdYvtpVp7ANU1ssue94Lh84ZzPSbDsgYg2otCVatImiZyBd68wg0Y02tqu+k8mVVLkHwDofh4skwA9GQucEHydsr84l73Lq0E7dY+O/8h/eg9QlZSE2Sh8yatrwmO/TfbvduizTshvRfo1GD93PMQAR+95rdUQaB0vlZesBMaVWR34G3ZpUnzzxy6tckm+D+yexVBfGJDsika3jcLF2YpzttnIYqoChQNyxhq9vZkGD/5XPC2yulFTN6OCEk7+KWSx7ggdpraoTv5fEDm7TC2+4cw/rO4nUP0eaxQssTLqLruBoDpOuO9A8A6oCSQ21VJ5duw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1cc98108-3328-94d3-5f8d-ff03c965087e@suse.com>
Date: Thu, 26 Oct 2023 14:37:09 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b5330686-82a0-4d47-9549-2d943ca68c7e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9935:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b74fd9-4754-403a-7941-08dbd620467e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YA7Fo+RzolH8FiwbF7S0oPJ+77RBxYDXekNJpt4B8LbhSPvaIHql5pyj5ZtAJrtji9fYAuaee7PEHykFLfUDpWbEfUqozUaImaSU4FdRhLzHXYPI2/aVwkZhATWT6/ZNznI13gw0cKJ7406ul0KvCIhyhxJozpdGr+xtBfayjAzwKRSfSt6EskFrnN4cA6Z6+vL0a57PxXuw/Dohm0vjgIxLrqOb6gNqV8O4A3CK+Q5JHV7Qy+ZCODOdl/enFpMV9qllotQfgxaaxGNUTulYJVOWA8yeOguWaEyWkM9r8nZ3eRMCz59G8TSTI85s1czhxLX5U3j42Z25mNSDic3FAy1FItlJrlgnBX0ziGntRoM4pC15DHJkiSbAsxmiZVGSoSTyXT6SPT/wnsH8LfJslCFfjTiOM0DQ3ry6J7dYh1SgwFtK+imx9IECZi2qHl9zdW3TjkOFEcOWdyRTvpRGgyMwLxKjMSaRCAUkXjJW/jYUc8o/fd+LzANJRCnaI1tsLkORknwbEMGxnh2VTruSGH+5+HHLTSwXfBsY33L4QZeCUR9zXdqjpNkly1WdGEqmJJc+VaYdFIVvZCTmFRu0sjdraIVgbABzxGzdOlbuDl78fKvCsJvB2Z2qFxF9aMGFXmvKoax3PaAO/vj3foRVuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(346002)(396003)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(478600001)(53546011)(66899024)(26005)(4326008)(38100700002)(31696002)(8936002)(86362001)(2616005)(8676002)(66476007)(5660300002)(83380400001)(6506007)(41300700001)(2906002)(6512007)(54906003)(66556008)(36756003)(31686004)(6916009)(66946007)(6486002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aExhSjhHVXUxM2hMVXBUcWRidnZ3WVRMOC9CR0w2MnhLdmdTTUpLcUl6RHJK?=
 =?utf-8?B?QktuZkhCaWcydWlmdGRrNWorUEJIVnRBeU5FWG95RGd4VlMwdW1XeDN0eUp3?=
 =?utf-8?B?KzBlUXZDYTlZbllNOUVqTlVBc3FiNUVzS1EyWERXRmphUWxhbWU3UlhBdyty?=
 =?utf-8?B?OE43S1hwSXJWRGtLYjN0aHpCUjNCeFA0V284a0ZzbldpMDRGTitwNzJiUTBo?=
 =?utf-8?B?RnFVbG9BblZxck1ZdXpqSmRmK2tIVTBMMmlReUY5TmlwTUdsL2lDSFd4UkNv?=
 =?utf-8?B?NnhyY3h3cXIvOHN1Y0xRRVRqc3NsRmZJNUZTZXBDLzFRd1BoN3d6Mk13V1pN?=
 =?utf-8?B?a1o2bkpCeVhiYnFQRXhxSTc0NVFNRkpCdWxaYTFPZzVvbDJRTG5ySmphd0Z1?=
 =?utf-8?B?K240dzdsNjVSc0o2ZDd3bW5EMWo3UEhncnZRZk1ITkd6NGQvajM5Z3oya0lX?=
 =?utf-8?B?VXk0Vnd0NkZJVTl1UDNFcmpIbURQOWE3elR2NTBJUy9wbVJxYmVoZ0tWbGM0?=
 =?utf-8?B?QVhmbnVINGhUbTVqQkdZOVJ3cGVNQnRWSmRpVU9aTXI4ZHlaMzlnNHVkblcy?=
 =?utf-8?B?QmVCZnFUOVBvZ011ZnZ6c3VLOS9EQ08rNGFjSGhRM2tDWVFhTXpDdFdTVXZB?=
 =?utf-8?B?UXd0MkY2NDBZS0RnaGg5cWRDelFtUTBZM1A3T0xzN2FxcklFdFg2OVR3SHV4?=
 =?utf-8?B?MjBpWnFadS9yZVJibDlmOWt2T3BDait6WU5EdW5OMjRITG5vTVBTVVpYYTJz?=
 =?utf-8?B?UjQ5NUMrcW9qY0h6NENMcmtRdllKVmhOMWg2cHdTbXNrU2Npb3FqWStVanZU?=
 =?utf-8?B?U3Q3V0ZyaVlMeDhzcHZycStLcmhUbHkxZHR5K1lLa290TnZBbnRGcGF2M3Aw?=
 =?utf-8?B?M09QOHpleC9tUzJkbkI1RDMyVS9ZeFVhd3diTzFCblZaSVZWajh2WkZNVFNY?=
 =?utf-8?B?ZkFWNXFUQmVCWGFlQ0xJTVRYeEVua01QZjhzTTJJSDJ2cXBXQTBYRWp6UjBJ?=
 =?utf-8?B?K1VqOU1wYlY0V1Z0QUVQNi9XTU1sdFdhd3VKVnlLYXlvODJFNGN6bEdpeXFx?=
 =?utf-8?B?SVR0dlVlamZzZkdBcVBFeEFvcUZDTzF1VVdKWjRYVGE2Z3FKeTNYajJqcXJ2?=
 =?utf-8?B?dUJhOU9pRm9kQS9HRlVSTUJBRURmVnVNaTE1WnhhcGRHaml1elp2UXlGWFR4?=
 =?utf-8?B?WExFVDFvTkRXb2c5R0lqbmtRSCs2Q0lVZE9YWjgrMW1vYVQvenhKeHozUk1p?=
 =?utf-8?B?TTNycVgva1BET3RkaUZPWjEzTDBTenJLc0JralBMOHNtOTlYbnVSTFNVYXBl?=
 =?utf-8?B?UEhlZ1Foc3d2SUlFb3dscWtWQ2VJZzFVejVMdXBRdFNUZmZ5ZmRPNmpiUUZl?=
 =?utf-8?B?TUhuL0loV1NqQkNKaVhycTRENFN2cTB5QTd1TGFnaUVFdXUxQkZpQW1MSlJp?=
 =?utf-8?B?Y3hHWlNLRXBkSCtodFA4aGtUSUVYSjhjR1k1MTJyYVpKNXlRVFBNS0NYYVlY?=
 =?utf-8?B?c3U0NXJiTGhnTTZqZ3VDbFcyeFR1dVd3SngwR2ZlNjFmdERIK0xCOW5ybnJU?=
 =?utf-8?B?MENDbFAzY2xud2lrMnIrY1FlMTVYamRjZlNxKzJLR3NhbFRSTng5WjlEVms3?=
 =?utf-8?B?UU8zdDNRenRyS0RTZHFSZGd6Ymw4cW9za1Q4YUYxVUJ1YUhiK3ZQZm9ObzJM?=
 =?utf-8?B?Si9naFUxM0tTcElVUjlLSFQydkZWT1RUc3ViVEtscTRMM29JMVE2VXg5TDZh?=
 =?utf-8?B?UG5NZXAycXlSMXhtNVdGVEIzQjNJRHFUTnFXeVpRRWJoTjJnUlQwU3Z6MDBG?=
 =?utf-8?B?S0tZdnU2bzcvR1lhK3NBQTNtQ3YwMG5GdnhkNklYYjlRZjNMWURvaU83MFB2?=
 =?utf-8?B?bmo0Z2dBSVdRWlpNQTZmdFJFb3BNT1hoenZzZnE2SkJrb3EyK1YxMTZuWTJF?=
 =?utf-8?B?OFZ3MTZnb0lrdExTV1hkbVBibHNWKy9wSXl3WmJWSVE4SnZxVHByaklLVU9J?=
 =?utf-8?B?TTU3aEVQUFQ0ODZ6aWtvWGlNUnVwaVpPdDdZUmJtNjFaSDhjdVNjRzRRN0lP?=
 =?utf-8?B?a0dKZjFmSHVVMTFIakNNSURtSHFtTkRPZ01HcG90OFNEdUhHS3ZpYVR5YXZa?=
 =?utf-8?Q?/rcottdSv0pdnkgwVXIiPLveL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b74fd9-4754-403a-7941-08dbd620467e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 12:37:11.4027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xy8mOBBE+4C+w5Yy0l+lx3F0RYWZ9Ha1wtlGiBAmhLxDIW7g0RLs6Wq/4XofV6s/7pp60P0RUxySBuuZhRV93w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9935

On 26.10.2023 14:35, Xenia Ragiadakou wrote:
> 
> 
> On 26/10/23 14:51, Jan Beulich wrote:
>> On 26.10.2023 11:46, Xenia Ragiadakou wrote:
>>> On 26/10/23 11:45, Jan Beulich wrote:
>>>> On 26.10.2023 10:34, Xenia Ragiadakou wrote:
>>>>> On 26/10/23 10:35, Jan Beulich wrote:
>>>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>>>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>>>>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>>>>>>> @@ -518,7 +518,7 @@ static paddr_t __init find_memory(
>>>>>>>             if ( end <= kernel_start || start >= kernel_end )
>>>>>>>                 ; /* No overlap, nothing to do. */
>>>>>>>             /* Deal with the kernel already being loaded in the region. */
>>>>>>> -        else if ( kernel_start - start > end - kernel_end )
>>>>>>> +        else if ( kernel_start + kernel_end > start + end )
>>>>>> What meaning has the sum of the start and end of either range? I can't
>>>>>> figure how comparing those two values will be generally correct / useful.
>>>>>> If the partial-overlap case needs handling in the first place, I think
>>>>>> new conditionals need adding (and the existing one needs constraining to
>>>>>> "kernel range fully contained") to use
>>>>>> - as before, the larger of the non-overlapping ranges at start and end
>>>>>>      if the kernel range is fully contained,
>>>>>> - the tail of the range when the overlap is at the start,
>>>>>> - the head of the range when the overlap is at the end.
>>>>> Yes it is not quite straight forward to understand and is based on the
>>>>> assumption that end > kernel_start and start < kernel_end, due to
>>>>> the first condition failing.
>>>>>
>>>>> Both cases:
>>>>> (start < kernel_start && end < kernel_end) and
>>>>> (kernel_start - start > end - kernel_end)
>>>>> fall into the condition ( kernel_start + kernel_end > start + end )
>>>>>
>>>>> And both the cases:
>>>>> (start > kernel_start && end > kernel_end) and
>>>>> (end - kernel_end > kernel_start - start)
>>>>> fall into the condition ( kernel_start + kernel_end < start + end )
>>>>>
>>>>> ... unless of course I miss a case
>>>> Well, mathematically (i.e. ignoring the potential for overflow) the
>>>> original expression and your replacement are identical anyway. But
>>>> overflow needs to be taken into consideration, and hence there is a
>>>> (theoretical only at this point) risk with the replacement expression
>>>> as well. As a result I still think that ...
>>>>
>>>>>> That said, in the "kernel range fully contained" case it may want
>>>>>> considering to use the tail range if it is large enough, rather than
>>>>>> the larger of the two ranges. In fact when switching to that model, we
>>>>>> ought to be able to get away with one less conditional, as then the
>>>>>> "kernel range fully contained" case doesn't need treating specially.
>>>> ... this alternative approach may want considering (provided we need
>>>> to make a change in the first place, which I continue to be
>>>> unconvinced of).
>>> Hmm, I see your point regarding the overflow.
>>> Given that start < kernel_end and end > kernel_start, this could
>>> be resolved by changing the above condition into:
>>> if ( kernel_end - start > end - kernel_start )
>>>
>>> Would that work for you?
>>
>> That would look quite a bit more natural, yes. But I don't think it covers
>> all cases: What if the E820 range is a proper sub-range of the kernel one?
>> If we consider kernel range crossing E820 region boundaries, we also need
>> to take that possibility into account, I think.
> 
> You are right, this case is not handled and can lead to either of the 
> issues mentioned in commit message.
> Maybe we should check whether end > start before proceeding with 
> checking the size.

It looks like it all boils down to the alternative I did sketch out.

Jan

