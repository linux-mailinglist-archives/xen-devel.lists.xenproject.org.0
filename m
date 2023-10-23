Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AAA7D385C
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 15:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621470.967939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvG1-0003lR-BQ; Mon, 23 Oct 2023 13:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621470.967939; Mon, 23 Oct 2023 13:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quvG1-0003ih-86; Mon, 23 Oct 2023 13:46:13 +0000
Received: by outflank-mailman (input) for mailman id 621470;
 Mon, 23 Oct 2023 13:46:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quvFz-0003i5-OF
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 13:46:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 855ae708-71aa-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 15:46:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9871.eurprd04.prod.outlook.com (2603:10a6:10:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Mon, 23 Oct
 2023 13:45:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 13:45:39 +0000
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
X-Inumbo-ID: 855ae708-71aa-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYkrBoSFfueOnwjh2iPunIU7N3W8wtfyebugQXKXMuWvRsDkn5D1qPuDZzcNCNRAxBYHgvN2YapO9doQMMfB0JhfN8vOG2Jc1ug6+0s368hp8KrPVW/WMuueNDCFBJQ7SLHFggtCHVBtLCJgo0X4SOo8o09v1CWuvSLxHG2m8+hsryf6hnyYUly7N0kUj+SpDD3EqlWf5UkHgfalmRQhoWZYnund6BMkKveJ0uWliBNL8oFAXgRw5/ckRW/z7MJ75rE0bsRgKkBWtQOP9JUCd+8BnTGrY3BVksD5HgVCNHtFqLe4xvivPJu+xB6Xg+yFXriroA5HhL8b9VyaFCscOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/fZ6cTki1nN1KKke/U79UvcKlK8ZkSvC2QysHg9nh0=;
 b=NsreOJFT7sWT4c7Iv3X62hqIkIlIt9qpNuW9jWE4XrIWd5P80wmK8k5akj1jnbl23Y6141190lBnpdhEP5eTlF+dgfrSWrdGLywmIdxNzHIK8MpTGAjkbtfEyhlapoRdC7YUXaWD6J9s+NUHiQ0FXQWVCWom3wOLiM6Q7Jqo0chtczmH4cAFQsaScOK0ZuiPC2K9ssDHIpeUUPvg+B8a1RQR11Axe+hcpkDzmFcjhtOeRyACnbkOwrJ2MTtu4oKLmdKg7RvgwWBRUVigNx/sqXMGUQSoxp1QwBynV52IxtJZ7oOgufz7E5aHfMO1HLk8VRnXZVD0lBUQri7z2w95pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/fZ6cTki1nN1KKke/U79UvcKlK8ZkSvC2QysHg9nh0=;
 b=kN4xVnXuOW71uofyb8670mkvJuBegfUpSkVH6Yt4B4bjRIXVvwuBF12XfpEUhDHb1unH90LjmkhhdApYYzoZmDQaBQoGrEdGkRUaGsxjTzVDRAz48YYMJcLQlDjqCEuOZOJmwDJzjyXVQF4VQ6hRTzqyTJUvpZKOWDWTWhfY94vVUJcBbKg+943Abv0TfWdsyJx+oqwi7HyPltCyG1p1LeLnKAGv0WN4AACDxM3FnhMGTDZPGRaDbHy9h4AW+7sknalCa3zAp8RsGlbJd2VdtQqYJMcO/5RXpmZPpviIs9B8bKDTjdX6Hq65TCNwMmbavyV3S4sIxuuqfR4vXsNsjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5475d9e5-ec1c-7f71-ee77-59ec2e6ee01e@suse.com>
Date: Mon, 23 Oct 2023 15:45:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen/include: add macro LOWEST_BIT
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697815135.git.nicola.vetrini@bugseng.com>
 <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com>
 <f504772a-68b4-fbfa-e7d4-8d22992c7944@suse.com>
 <f23a1f95916bd61ddcd5002428d8876c@bugseng.com>
 <6d113a237846c7a41aa083e806f172e7@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6d113a237846c7a41aa083e806f172e7@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0381.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: 114abed5-6d2c-40b9-ef5c-08dbd3ce57e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y70xbx53fCPA4NqTOVs1mrB+SexcHK6xvSbBfRL9NK91Pz78+qjU5UWUcaLS5HE2y35yLvlp1ATlF92ZKQhi0WsgUHbryFUmsMEvj+npokvUpxcQCvkehOur+DJPrgmsL1zKrzS2PX3ayYBPHdVTxoHKA1HInBZnwuri3fwExzm0E/aDr7JwPWWhSoFwYZH0S6TGicFZlehG6pYShutJUXhjZxTiov8vSmSdnR9fR+QGzU1yb5yinfYq0qtRUeedMZXa73aj+r28xGoI/hZZTrXfViUHmVVfJ1uS0PXZclGu3x6d6Spumpj1/VVJNDkHL18CjCNteZGOk7aDcNtelztEL+NtH9x134Gxq4XDQ4siUcolfo4DN4N9Vwun9sbLyIOt59AgRfSjJbiE1L9mIf2HfTSIfAO48S2tZKDfuO6IHD7saLNv7/U7kQQQIkfk8XUsnkcB7BuR0Ks77zzL5fws2BImSCDoTGCRNbYT4POhqLEMXDNr1AOo3C5ENc3An0AzkrQ3mr2YW223MR8rdH0oGwxkM9g8RdKrPrhYr8A4UHQbvnmuwB6Add0uSe2DU4uiLsS90jhrbRLlvhYdb/Rveg9HR+OeWDxEL07xdCvSmMqEu4f4SmiXyS7ut/OFfSBj40pA9yPbLhmQoaSIHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(66556008)(6916009)(66476007)(66946007)(54906003)(316002)(2906002)(31696002)(7416002)(86362001)(36756003)(478600001)(4326008)(5660300002)(8676002)(8936002)(41300700001)(53546011)(6486002)(26005)(2616005)(38100700002)(31686004)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmM0VlNtTVdCMU02VWkySEw1VEFldGtFZHVlZnB1OFRaUU9KYU0vL3YvcU5i?=
 =?utf-8?B?VmRLRDA1SzJsZEI0Y3NiL2VzdTcwcTBnQ0oxL0U2elpQKzQ0VXB6OVoyNlQ2?=
 =?utf-8?B?bjdJbHhVWW9mYTVITXF1YThhZUttaWNyZnhsL3daS3RTdkJKRzUvVzlqbFo3?=
 =?utf-8?B?MVRtUVc4ckNTWHVDbDg2dCtLSCsvcmZaQ09GUStJaitQRVRETi9nZmpMSUY5?=
 =?utf-8?B?MEFHTnlIM0dnaElhRUhLSkpzTzVsR3ZqN25xLzl3QmhzMmtMc1dGMlBnU2Y1?=
 =?utf-8?B?c0w1WmF3Y0c0QWRlaHdXelhkaDJYT1VRdXZNV2ZuUG04VEdOTWxCTzVKUEZq?=
 =?utf-8?B?RldkRk16elZsUnhHZDhXLzlSMURoMnFOMWY2d1p3UXZKM3V4em9Qd2U1T3gy?=
 =?utf-8?B?V29kWVBKUEd4dmRUemxaWnBJQzdvZTF4aDVCcnF3MUUyMUh5YSt0M0FTRXV3?=
 =?utf-8?B?VGJpS08vb1I3dUhhY3VEQk83SkwwWFFBaTl0MnlVTlRYWSthcnBib0MwS0gw?=
 =?utf-8?B?MjZqZ2lHeW5vZWd6M1dqYnQybXcwWEVSKzRhM3hRZ3VuaHZib0RYeXlvbEp1?=
 =?utf-8?B?cVFjRkFWWmtzY2FiWHlzYjJxUVgrcEVSdjEyOTZwRHMweDJFa3lPY3F4Smpn?=
 =?utf-8?B?Y2JRN3BLYVNtYkk2QmZwMThXNlBXc3dWa1k2dU9id1FxU1M2eitoSkc2a0RI?=
 =?utf-8?B?QnVkSXNDTjZobHEvc1BnUVI3SkJ6UkNpME9NK08xWDQ3aWcyVGFEaXFyNkgw?=
 =?utf-8?B?WUk5RTRKMTNOZ3pSWEdOM3A4UlhYRjBPM3pKSnFteDZsU1pmMXBmamwwTHJH?=
 =?utf-8?B?NnpJaU84UlRVVmsyNkZtRXhDcFVVV1JDUzd4Y1FMTE1PbXdwU1A2dkxYNFBk?=
 =?utf-8?B?cjV0ZjBxaFJQVWltbEZ4Zzdtb201amRWQXBaNEZNMmdPUTE2NkpwbDM2a0ls?=
 =?utf-8?B?aWEraGhmM1J4aTNJcXFPbGlHSjBsby9PRmZWY0YxZDYwY2svZHQ2d21sYUV4?=
 =?utf-8?B?Y29xNyttT1c4SmF3SlRaQkk5WG1xbTU0M1hadWVrcDFHWlAzdyt5SFhSZGdK?=
 =?utf-8?B?RUlPR090S2dlQlF2V29ra0h3Y2xmVlU0b1d0dG9RaENvd29XUjVCTUxMSzJs?=
 =?utf-8?B?WVdFRDlaRjB3Mnl3dklUcXluUXdjZHJZTVRtYVBaRnA3MlN4d0c1angwN29a?=
 =?utf-8?B?SGI5a1A3QXpyek1SMzVYNld2RWU2ZkVQNkFEQlltZzM0VGM3MldUMEZMWUpG?=
 =?utf-8?B?S3RHSFdCL1NjRHlaM1NTNlRHWmd1cEJsbXZBTDVlcDRwb3dleHhsZmdaeXEz?=
 =?utf-8?B?bkdRV0Z3a0c4TE1nRDZHa0JwdlpsVjZ3ci9BMGlWYUhJcUZESFJIOWpYSG45?=
 =?utf-8?B?enB4L2FnRm0yQXdQelNZL3NxOWZDenpZV05Xa3dYU0NrUHFnUmJWZVpxOWdU?=
 =?utf-8?B?N2VCajVyUEtVWVVSdFJoR3h0WFJ3b3ArSytLZE9YWUJQS0FhVUhpaXhNb0NW?=
 =?utf-8?B?ei91MlJqYXQ2Q1NIVStGbFNML1FUWHFwTitodzVQdi9JRDhrclA0dGMxVnVr?=
 =?utf-8?B?bkdNYi81Z05iTlN6aVU0L3lERVVndTVTUDFSS0ZmV0t2OEFQeHZHTVk1UUQ2?=
 =?utf-8?B?QTJ0dit0WUlsOEdvcW9BRThwMEpBMlZ5em1pajgzcXJadklGWEZMTDAvN25J?=
 =?utf-8?B?Z2EvUE05MWNUWnViMFBMMDlVYWVOcTc1RThaNlBBYWhBTzdubnQwS0RWdnpq?=
 =?utf-8?B?dkg3TTdib3dscnlMSnVxNVlMT05VWGVnNDcrZzBEVmlmNk1PbW8weTBwa3Zi?=
 =?utf-8?B?Vm16SmY0SWpMTEtMQkJrQm4xMUszbmFsUzU3Y0FKTDFKWHJkcFJrZUs1WXpj?=
 =?utf-8?B?b0NYanE4VEsvbm11SmJTR1M3RVl5TkdQKzh1dmZGRWMvUUZ6dnhTY2xLWnpl?=
 =?utf-8?B?MGx3R3lWcUNaSGFwV3g1WERvTFl5em1sZjNQWmlZRzRTMklYU2dXd0dVNmZv?=
 =?utf-8?B?c1AxaWZuU0JVbU12aTlrZVlGaUxtT2ZqWGJjNDZzQ3UzOW1FM25QU0xTNm10?=
 =?utf-8?B?ZXptVitCbjl5OXQ1Y2Zob05DVDhuNTNWZ1Ezd3dqV3o2TTFMMHFBNzgrUjJO?=
 =?utf-8?Q?QtFGNIlC1T8FW8e0sbqCJbL9A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114abed5-6d2c-40b9-ef5c-08dbd3ce57e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 13:45:39.5938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qjz0VFPrWgzOemIOFsPrNjaMxkIsW3PeOuPtLPV3n7qyO5hiQfyO0JhsGFFHyiDNC8J3LuTgMRGHXpRl8M1ujQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9871

On 23.10.2023 15:19, Nicola Vetrini wrote:
> On 23/10/2023 11:19, Nicola Vetrini wrote:
>> On 23/10/2023 09:48, Jan Beulich wrote:
>>> On 20.10.2023 17:28, Nicola Vetrini wrote:
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -246,6 +246,12 @@ constant expressions are required.\""
>>>>    "any()"}
>>>>  -doc_end
>>>>
>>>> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern 
>>>> to obtain the value
>>>> +2^ffs(x) for unsigned integers on two's complement architectures
>>>> +(all the architectures supported by Xen satisfy this requirement)."
>>>> +-config=MC3R1.R10.1,reports+={safe, 
>>>> "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
>>>> +-doc_end
>>>
>>> This being deviated this way (rather than by SAF-* comments) wants
>>> justifying in the description. You did reply to my respective
>>> comment on v2, but such then (imo) needs propagating into the actual
>>> patch as well.
>>>
>>
>> Sure, will do.
>>
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -192,6 +192,13 @@ Deviations related to MISRA C:2012 Rules:
>>>>         See automation/eclair_analysis/deviations.ecl for the full 
>>>> explanation.
>>>>       - Tagged as `safe` for ECLAIR.
>>>>
>>>> +   * - R10.1
>>>> +     - The well-known pattern (x & -x) applied to unsigned integer 
>>>> values on 2's
>>>> +       complement architectures (i.e., all architectures supported 
>>>> by Xen), used
>>>> +       to obtain the value 2^ffs(x), where ffs(x) is the position of 
>>>> the first
>>>> +       bit set. If no bits are set, zero is returned.
>>>> +     - Tagged as `safe` for ECLAIR.
>>>
>>> In such an explanation there shall not be any ambiguity. Here I see
>>> an issue with ffs() returning 1-based bit position numbers, which
>>> isn't in line with the use in 2^ffs(x). (Arguably use of ^ itself is
>>> also problematic, as that's XOR in C, not POW. I'd suggest 2^^ffs(x)
>>> or 2**ffs(x).)
>>>
>>
>> Makes sense, I think I'll use an plain english explanation to avoid
>> any confusion
>> about notation.
>>
>>>> --- a/xen/include/xen/macros.h
>>>> +++ b/xen/include/xen/macros.h
>>>> @@ -8,8 +8,11 @@
>>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>>
>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>>> +/* Returns the 2^ffs(x) or 0, where ffs(x) is the index of the 
>>>> lowest set bit */
>>>> +#define LOWEST_BIT(x) ((x) & -(x))
>>>
>>> I'm afraid my concern regarding this new macro's name (voiced on v2) 
>>> hasn't
>>> been addressed (neither verbally nor by finding a more suitable name).
>>>
>>> Jan
>>
>> I didn't come up with much better names, so I left it as is. Here's a 
>> few ideas:
>>
>> - LOWEST_SET
>> - MASK_LOWEST_SET
>> - MASK_LOWEST_BIT
>> - MASK_FFS_0
>> - LOWEST_ONE
>>
>> and also yours, included here for convenience, even though you felt it
>> was too long:
>>
>> - ISOLATE_LOW_BIT()
>>
>> All maintainers from THE REST are CC-ed, so we can see if anyone has
>> any suggestion.
> 
> There's also LOWEST_BIT_MASK as another possible name.

While naming-wise okay to me, it has the same "too long" issue as
ISOLATE_LOW_BIT(). Considering x86, in the BMI ISA extension, has an
insn doing exactly that (BLSI), taking inspiration from its mnemonic
may also be an option.

Jan

