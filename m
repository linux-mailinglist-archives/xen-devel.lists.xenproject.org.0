Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AC878D778
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 18:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593152.926085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNp6-0003tp-0J; Wed, 30 Aug 2023 16:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593152.926085; Wed, 30 Aug 2023 16:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbNp5-0003rM-SU; Wed, 30 Aug 2023 16:13:39 +0000
Received: by outflank-mailman (input) for mailman id 593152;
 Wed, 30 Aug 2023 16:13:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbNp3-0003q7-EN
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 16:13:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2abcac3b-4750-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 18:13:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8566.eurprd04.prod.outlook.com (2603:10a6:10:2d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 16:13:05 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 16:13:04 +0000
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
X-Inumbo-ID: 2abcac3b-4750-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StItPYGTC0cm1qkVKW6jinzfvm8nkhyvsjAqYm9UH0fknmjUYBfbnKxa3bKaNbrBOlsLgNvuCshrCN0bnB+blg5AsfFQDQkCJzTcrhHYm4qwFRenV5+db+obmRse6PChgZa7uoJeutng8WbLfnuH703zpWQyQuluoK3wq6VylM6HVgJMGdflaav8GmDr0VSFxHEFTmziPn3M/tuoetalWMCwCPqCiSHFWRKLpxcZMCFxYbwzLHT5wmtEnbn4tM6UZ3dlRpPHqtfFVqJ9CjUc2V48lafqeaKLPcBLOR9ffZHNOpHHFFmXBm4HBAKSmGc9WSpNeBzJ3O0nlc6be8DV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TBv+P7hCywnxBQ/CXh8RKmYalil3lqyAD1ES3zozyDM=;
 b=kCrC8mapUH49KAIWFpeQ4d7XIuaGt/wCqNgp0+oRoD8yC1Ycub4fzvODMjZgCfJ79xCiinR/OogDrbqKlwlH0+wx54iNbDqKVAqxcvHWTkMANphBkZACcljBRS348ka/7qWKR4bpCzBeaXc8+wnnmGjuDDc3lmab6nPeZzON67R1D1Hv5DUisk5DhtYYApONeo/fMzkMxp9Vp6o2dB2RgpVkByoUAEY3/AM3/CxsDnZ7oBx1FG5wqeXCkdeKPdo37gHoi8OZtGLXnnBKQw9XPi60A4boIn64Ai3pAk0LKk+k3VhF3Uk/UH+jw1hDB+N2GSdIhn7wy8c8+wrXGZmA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TBv+P7hCywnxBQ/CXh8RKmYalil3lqyAD1ES3zozyDM=;
 b=brCSRT7tzGlhf+OpewkkQvIrgyMzozUWWFMAfIZQFrdgf9hPlpSO0FG+A988+zz62AigVQNIjVk5CVqPNl88tdLCJZ81qVH0pot8HCw/b3VrrEXz7ANXAQybq+S+Ha90RqoD9dxCtAgQuocYbmDIWaoxDgULSrzCGgMwxI5KGHWY9J3NMaontTBQxWXzd7HATfCBko3DPziNPehcK0Patjb1idYO1QJG2YGeMoVYnM6PEhi5nbHGKo9nI4pFWWj4t3p27GzzKVQ0wMj498dH++S1MXxkKFv/HQrTRP0Ryv5NCt0GLtBMiITCF4uD5HbAc3qegMmgTdlSF8nAvKY60A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <57079660-acda-eca7-5a39-42463cbf64e8@suse.com>
Date: Wed, 30 Aug 2023 18:13:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] x86: Reject bad %dr6/%dr7 values when loading guest
 state
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-2-andrew.cooper3@citrix.com>
 <6217ca42-d5bb-40a0-53f0-ec543c8297a6@suse.com>
 <c86b8f1c-dffb-c850-3054-f31f584861c5@citrix.com>
 <0708d6fd-2672-a0f9-e782-83e6eb66dbeb@suse.com>
 <2ced7357-b8ec-e071-9ce5-c4d23b1a6a03@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2ced7357-b8ec-e071-9ce5-c4d23b1a6a03@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8566:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb5d3cd-1e4d-4e13-f8f6-08dba973fda8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QbwbqVliTAxD6rURm53papFQfKtCdiZu5e+s+T+U5DzJE+fuhOUqaPsgy0jbo7tt5A2UuIYgdsVmQQKwAXp2S/0pr6+gCdNCK7/xKWUFO97D4BRGwBdfttfcqblpC3zCPgicIqptxgXQJ17Gg/yMSJEuob8d+or5TTY27wsA3eUwPPXSMZhCDzlhm1Fbsy0DB6zAu99krdK1ecxLMly3d61LLbhN5ZNrRcF/B1JHvuHAhEBoiepzTEmcAOt9KqqN9Lr3X36HrtllGa8X51DJGHtEs8BKi6J5eIY8jF/SY655Nq/QGxqAvVA8FegtcS148j4xHu7fHPlM8I+uk2lLCxftok/HAjhgbLkDltwKrEYKw3K/FnWpYpblmOESWTqcujNh5cr3MeSgD6ar+kNFYN0cIBwRAvxJEuJhPDnQLps40AZk04ipB4UU7FWtT7+l6G2yxjFZcDGKg/vaNtRiOq/Th7ivOhEsEGHopXwSe4ngLQVwmUgqvWMdA50NGPsfvtARgfN21JTKOxKYivyTB2fJs4W5Yk9w0za5iHywzqppT5EMuUY2prQAQWNCLSohScpzIW2+wu19MyPDSMYZNzJTGaXhz5QC/flaMFIyRhoG6pKt/mYuLWbjYngh+130Aee/0r08g9FN2eVg7O4ByQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199024)(1800799009)(186009)(41300700001)(478600001)(86362001)(31696002)(38100700002)(83380400001)(6512007)(53546011)(6506007)(6486002)(2616005)(26005)(66946007)(2906002)(54906003)(66476007)(66556008)(36756003)(6916009)(316002)(8936002)(8676002)(4326008)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUhkNWRMbHltaFJmZVl0M1VkWUVPNE9CcUE4ajA2c3FSSCtCZW9DdlBwUG42?=
 =?utf-8?B?enovcXpCWmRsejJjbjlrNlRIbkZJMVAwc0NiOUJNVUpOMXNJYkJ2UDloalVK?=
 =?utf-8?B?SEVsbzBDbXJxVm50NjV2a3dXckJuWHRNR3pjR2M0NitlMEc5ck9LczdhSlho?=
 =?utf-8?B?R0ZybXBSNjh2bEVrUmlTM3VMcm1NSXM4UzdhMWs2UWU1MnBrMldTVnJXSkNU?=
 =?utf-8?B?M0JmK3lraThzcHl6eFlUbmJnZTZxRWZaRjhFYk8yNnNIN1dGcTRGbi9wNytW?=
 =?utf-8?B?SHdCSytXUU9RSmRIbmVIandEN0k3Tkk3S0dtbkJ3a0psaFN5MHUrQ0Z0azND?=
 =?utf-8?B?dFRBQ1dIVmJieTc1RU42cERjK2svcmZyU3BETTAySFVpVExSY2FCUUFJQm4x?=
 =?utf-8?B?R0VCTU5LYndkODlKbHN5STZtUFpCNksvRkF3WEl2UVQ2dHZtQTY1ZHNUVkNC?=
 =?utf-8?B?YXdRTzl5Qjc2UVNZVjdxYnFNSkh6TVI3cWNGdEp2Wnh3SmF6S252ZHBMMkQ1?=
 =?utf-8?B?Zm8yaEYwQmV5VkFFRVZuWVlaN2E4bkZmSHBBRlg4cjEvb3BrVzh1RE9wcTdl?=
 =?utf-8?B?SXNYaXdZSE44VStwQnlIc3EzbkkrVlZHVHE5S2kzcDdOeHVoTzAyeXl6K2Js?=
 =?utf-8?B?cVlrZWFaellnRzlpaHpubThvOWI5dlVybGlFdkMvSUlqOFBmSHV0dWkzVTdX?=
 =?utf-8?B?SzdUUytMWDlCZGJJSVVoUGhWcjgyT2JwQjdxYnhuOVA1NENWVGpmZEFORGEx?=
 =?utf-8?B?YkVUM00yblNFRG1MallYQWxmZTNITlJLYWFoOExJbXhHRkptelBKZFVDL093?=
 =?utf-8?B?bzRSQ00ydW9KNXRKSUpkNE5VSEVWWWdKR1pIZGJFc2pEMG1EdlpxWHRnbGtj?=
 =?utf-8?B?NGhHYzJabjNrb3Jyb3RTN05DWXpVNGZuSEdqQ2RUZDVoMllpK2NYK2FZMUVt?=
 =?utf-8?B?bVlORGtkNDFsbU5HeC95a0NkdktpeVh5bGhPR0JnZHFtTTRsSjlhTlFaZUdT?=
 =?utf-8?B?MVh6bU5HOWpPM3lXckFtWnM3RUY3NzRWb21vUkdnOGZjNnp6Q1YxSnJyVlZi?=
 =?utf-8?B?VDZhMHVTaXJrekFOL1ZDN1E3aFNWb2tLSTVzSUNaMTRFZGQrL1BIQi9oOE5G?=
 =?utf-8?B?QUx5aE5TVEQvR2VDRWw5MlpVRmIrVFZJUUU5VVVMcnhEdVZzT0gxUVB5Q29x?=
 =?utf-8?B?RWYzbEc4OVdxSnJFc1pTaUlDRGRVSEtFU0ZmRlora3BoR0M4KzlXRFdRKzFo?=
 =?utf-8?B?cXd2MXFjYXBkeWFxNmUyaW5nTmtrVGw5U0hUMzRZQmtIbkp1WG1LTWNoWTVo?=
 =?utf-8?B?clBYay9rcDFJT0ZzWnpSM3lYSlVuRFlBdHlETUVDUXBxd3l5ZHUvS0E0UEI2?=
 =?utf-8?B?KzJZamtBeW1xYUpBaUtXY05CNjBJYkZ4RGJZclQ1Rzk2dWM5SlVkcmppc1Rl?=
 =?utf-8?B?Uy9OMWtZZnlhYUNDUUthb1pwazdmSkphM1laUU1uYW5hQUNmVytsWlFmdXZV?=
 =?utf-8?B?UkVTNmlrNDROUlZEZGV3NG1OYnJteFd0SG9WT21rYTRwakRnc3VYQk1tbXdq?=
 =?utf-8?B?Q0Y2M0lqcERpRDRhVzYrL3dHR3FWc2VvYnlpajBvTEQ0OVdOVHlpb21JSUs4?=
 =?utf-8?B?TTFjaUEzbU5zUkk5SnNJS0g0S3d1cGVVMkFwalByN0hnSG1sTFBYMFJVc2ds?=
 =?utf-8?B?VEFlcVRGMGQ4SDFYREdPR2EramM2MnBQREVsMmxOVVMxMmNEcUkxVFQrYkYy?=
 =?utf-8?B?RTkrMmhVMjI2V2JaZDdXUWV4eUVoOVRsdDNNRE9EVzVxTll0V1F1RUwyWDhL?=
 =?utf-8?B?a0diQllpWWlmcFBpa2pWamR0SCttRmdXelc5WVV0QmdVeEpnV3BqRmo0eG5G?=
 =?utf-8?B?YWJCU0dMVUhjUUs1KytwT2dXb2t2NHlGQUpDbElnVDNNUC9jUTF5dWhOeUZZ?=
 =?utf-8?B?QWZJL3dUbWhmQTFSa3dwZTZtMXBMUHltSnh1c1dVc1VtRTByS0RLTWJRc2ho?=
 =?utf-8?B?anlYRjRqcUhYUHZrK3lTNFRCSytiMzVKRDdYdGN5dUdDMXJ2WUFmSVI1RExJ?=
 =?utf-8?B?elFRKzI5bytsRk5TVmlqUEFseEdRc0NralZjK3VtWCtxYWNtOXArOFhWUTFk?=
 =?utf-8?Q?H0W67GPY6owxZb8ugA7OjBqI6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb5d3cd-1e4d-4e13-f8f6-08dba973fda8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 16:13:04.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRKHXJO7Gy1ELWwDz/lozBeUAPIod8jUOGAVX6tF3EzjGgahMJr8eacqraJGZg01Kf0S3POnzS98siXPhZ8msA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8566

On 30.08.2023 17:28, Andrew Cooper wrote:
> On 30/08/2023 4:12 pm, Jan Beulich wrote:
>> On 30.08.2023 16:35, Andrew Cooper wrote:
>>> On 29/08/2023 3:08 pm, Jan Beulich wrote:
>>>> On 29.08.2023 15:43, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/domain.c
>>>>> +++ b/xen/arch/x86/domain.c
>>>>> @@ -1074,8 +1074,27 @@ int arch_set_info_guest(
>>>>>  #endif
>>>>>      flags = c(flags);
>>>>>  
>>>>> +    if ( !compat )
>>>>> +    {
>>>>> +        if ( c(debugreg[6]) != (uint32_t)c(debugreg[6]) ||
>>>>> +             c(debugreg[7]) != (uint32_t)c(debugreg[7]) )
>>>>> +            return -EINVAL;
>>>>> +    }
>>>>> +
>>>>>      if ( is_pv_domain(d) )
>>>>>      {
>>>>> +        /*
>>>>> +         * Prior to Xen 4.11, dr5 was used to hold the emulated-only
>>>>> +         * subset of dr7, and dr4 was unused.
>>>>> +         *
>>>>> +         * In Xen 4.11 and later, dr4/5 are written as zero, ignored for
>>>>> +         * backwards compatibility, and dr7 emulation is handled
>>>>> +         * internally.
>>>>> +         */
>>>>> +        for ( i = 0; i < ARRAY_SIZE(v->arch.dr); i++ )
>>>>> +            if ( !access_ok(c(debugreg[i]), sizeof(long)) )
>>>> Don't you mean __addr_ok() here, i.e. not including the
>>>> is_compat_arg_xlat_range() check? (Else I would have asked why
>>>> sizeof(long), but that question resolves itself with using the other
>>>> macro.)
>>> For now, I'm simply moving a check from set_debugreg() earlier in
>>> arch_set_info_guest().
>>>
>>> I think it would be beneficial to keep that change independent.
>> Hmm, difficult. I'd be okay if you indeed moved the other check. But
>> you duplicate it here, and duplicating questionable code is, well,
>> questionable.
> 
> It can't be removed in set_debugreg() because that's used in other paths
> too.

Sure, I understand that.

> And the error from set_debugreg() can't fail arch_set_info_guest()
> because that introduces a failure after mutation of the vCPU state.
> 
> This isn't a fastpath.  It's used approximately once per vCPU lifetime.

But fast or not isn't the point here. The point is that both the use
of access_ok() and the use of sizeof(long) are bogus in this context.
Switching to __addr_ok() will tighten the check here (and hence not
risk set_debugreg() later raising an error).

Jan

