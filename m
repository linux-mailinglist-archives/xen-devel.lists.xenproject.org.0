Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862806E7939
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 14:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523384.813377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6Ut-0002D5-LZ; Wed, 19 Apr 2023 12:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523384.813377; Wed, 19 Apr 2023 12:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6Ut-0002Af-Ij; Wed, 19 Apr 2023 12:01:15 +0000
Received: by outflank-mailman (input) for mailman id 523384;
 Wed, 19 Apr 2023 12:01:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp6Ur-0002AZ-Fr
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 12:01:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0d91257-dea9-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 14:01:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8120.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 12:00:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 12:00:41 +0000
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
X-Inumbo-ID: e0d91257-dea9-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrCHkhKqhUDZg1BTTBKE3JEtXkeSOKJKhiu1/KtsaeOv+2i0h4ChmwKPGZ4Af841ycpo7yujHbYv25SfrGSjMhTo4awFjtWIV+1iEEv4lr2gH/0rvDQMi/MUMaT7RbJkabOkVpvgy++ozvVCoYRKjWNuQ2F3D9BfJqowDOWmF3mwcvl8ZUGLY0/sBoSbbfn9yGA7YrYMo9QOWYA5a95YsmQfkRuMcrrJbvNsotnb3ZGPzNynPXXydbUtg3Pe8aVpFFSRsMfriN2dYLAHntCNCnPuvn8mrb39n2YjYsRjS0sm6nOEYvbngnH5kn4JNDQtZCTjES9FNbF/KWzpcgZgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3e3LB6FEQDrUg5WMMof/5oy8y9uE4aMWyrfHOGL1ik=;
 b=GtKjMyEARtVDkQaYL1Mv6Za0dXKsQE8xzJSOi/g9Bcq7vSrM5i/qYFuhpFP77ED2gyaMUzSPgan9HL2EqQb8HZbsW0THgkp+ziqYc7eRvxG5cPCY7zjS0ePimDIdFcmGRpX7o3MS6IqmdliHNMfjaPPLnskqZO82giytuxwsW1/qYwC/ZLtZbQqe4lI9ENpHmnfjYJLGwM2fPjnwi0Py1/+lbgbt5MKy4lQ4juvjxXL194ock27DQhSJSuQbZhT7+zOSHibKiZ8yKIdvRgRNYPP/2mnQjOjmB1bTiKAaod83DU1DCwuFOAefcebluvKcZWLFRhtNIMuSqI53q5tEIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3e3LB6FEQDrUg5WMMof/5oy8y9uE4aMWyrfHOGL1ik=;
 b=G+hRNP6McZOqPqqxrPIehWShelLNODS338P/VkMXRyNCxUG2Bbxh8RbByspN6ry4djL+/ydlhkNI2xzLH6VoF3Bk3lcSXMs1NOd+2WfbCKGA1FD1yMId502Zwqfqe9kCYamGQEuUFre3uTi3Hmv7Ax/iFKlBxXLfo6c59vtWGXFmEuxnk0flVQc5EamskijhcUsOP7D4fP9le7abQYAdOJsvllkARaEiAIVxy+xi/+gx2h+j/brqPzYwTIBVneXElyBAaW4RM0PCsM8pwcdfW99L/4mVH0nC1gUkx+kHDGWFvYcZUvVnSYvhE3X2/G6vvknMZLqHKNfSUTHPUElzjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <86823b76-6be1-da65-7608-af391ff48978@suse.com>
Date: Wed, 19 Apr 2023 14:00:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230418092458.15253-1-roger.pau@citrix.com>
 <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
 <ZD6V0wzw/VS/MMw/@Air-de-Roger>
 <d301e110-f840-a032-c406-2f7404752783@suse.com>
 <ZD+ljXSEPCmPMAtN@Air-de-Roger>
 <5c476b65-0340-2a0e-e436-46368d3236b7@suse.com>
 <ZD/UMyeckvCq0ivf@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD/UMyeckvCq0ivf@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: be2e5d68-acde-404b-1c90-08db40cdb22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b4/DAQDm6eneeQbYxu/o2H2m5vaQ9UjoueJantJkY6Xv2ID7NUQ2f3HN/spIeGO4u79azR7n482rMWHefP+FLe6LULz9IgEhPNnxqUWB55hicQ+r6kDf0MNF8zylDCYvuTwlIW84e3wFN6kYI0c28vlrEUjS/JQRfP67YfQXcP37qyBKPEDClpHypLqennv1cs8KlOYzy1MZ5G6w+YPyFv8jvlly653/zyYz8yg9AiePe3riAdH6DAw5hmFGOj/jOAKfae9J97sm0sDZD33R3tzWtc1t6imfWAZtuC2Sz6s6v576V0l0TA8pAsJrKj57nyf79bol0QNlYxqI1b40gfMIiNImVwMqUuLzqJSOi3+0RNqh5X4HTHJrzGtGVJyMNboOZsaAsU8lb+wNIREsE9q7/UnnfbWmcsv1yqrDDfg9rQPTk+Hk/OztF3T+fOJ/gLoYaWb9OgLs9ZtS5q30BIFvq5y9KNWxTCRUXGwky+NkJoP9urn2qBWhs0HiyCZmFYUsWuhxB54kLJPftksqCzcHqSD4Zph2x/mdNdC/umhvtdG1MclRH1ih9cZ7ba4pIjPE0plOIa64x3llwSAc3gQayAK3+JrTytHCDVQAHBw7cApSieEPJrXnz0AX9ydC4ohlcH/PS0GdKCdsx+Me1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(966005)(478600001)(31696002)(86362001)(36756003)(2616005)(83380400001)(6512007)(186003)(6506007)(53546011)(26005)(38100700002)(316002)(66946007)(66476007)(66556008)(2906002)(6916009)(8676002)(5660300002)(8936002)(31686004)(41300700001)(4326008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGlNMFY4M0FqeDZ5VFFVbWpiME8vOWRSdUx0RHVSeURPajRqSGk0cGt3Z2Js?=
 =?utf-8?B?c2VBcUV6blZlTHMyN2VLZ05Wc1VIMnJxSkxvdXFXTnVZalNnL2pKUS9WT3dx?=
 =?utf-8?B?L0FhZ253K3JGdzA1RHlZSlFYSFl3YWpqWGdaWE9UREhFRVFQSmJsdWluM1dp?=
 =?utf-8?B?U0hTemZ2VzdYZDUxRmlvajYrb0c3Z2k4dXBXOENVa0NBM2gra1dBN0NkclJH?=
 =?utf-8?B?WUIyRUt1VTFVQTVINmpZVGpHOW5lWjRweEpPbUxGZjhlaGpLZGU3TU9jaUdp?=
 =?utf-8?B?NEcrRUV0Z09IUzJqOWErYURrQ0U1Zkh5dXJkazY1aHl4S3RSdXVteGxJeDVx?=
 =?utf-8?B?ZnNTem1qNXl5MnVlZ0FZcjFuZkNNWkFneUd5ZkFVWmxXbnV4Njk4SThRc2dw?=
 =?utf-8?B?b1RrMWtidVF4T2hwQWJVQzNGb29LV3BaaklSVjBGTUZBRVBRaFRPZmtYREgx?=
 =?utf-8?B?aElJVS9oNWIrd2NMTXMwMndFVXcwYWxlSnQvOUw1TkJiQWhVOUh1My9NaFVu?=
 =?utf-8?B?K3kvV3FHTWpDL3pOYW1FeFZIUGZUWndVRGRaYXlEMm54R1d4b3JvVURBS1l2?=
 =?utf-8?B?RzVkL2xNbHBSRzRVUUtWQ2JybFY3YTJIa0lVRUFKcXNZd0FldE5NUG5STmpj?=
 =?utf-8?B?b1Y0YVhuQllsak4vY20yWXRRNGhId0dxNnVjOUlHM2c2N3V5WUlyWHRuMUV1?=
 =?utf-8?B?YlRGK09Sa3BOSXZud0Q5MklNQisyNTVxbXQ3ZGE0cHgyV0xzek45VDlpZEZL?=
 =?utf-8?B?WU9QSjcxeWk2TC9jNDEzaGQ2ZUdOay9wR01JSVB1R1RvYlIvRHAwb29CWG5z?=
 =?utf-8?B?TU5vQjU3TjhZWWY5UUhGdUdIaTRBL3M5Wkc3b1p1YThlVlY2YmtQQzlPKzdI?=
 =?utf-8?B?bzIyb3B1MFg3eEdSWUw0UGdxTm9ETnFQSndCdHFtN2REbEd4YThkbkZoU05o?=
 =?utf-8?B?WW9TdEI4M1lyamJmS0Z0MGo4b2wyelRTOE5ESmFrRGxOUDZuMURxc09zVHJQ?=
 =?utf-8?B?NU94WUNGSWhRMEtmRVg1emkxM2ZyNld0MC9HZW01N29TTnhiV3liZFp4RSsr?=
 =?utf-8?B?d2g4ZlV5S3lHUjRkTVc0ck1RN3gwbG4waXFvdE9HRG9zOVRSdUR4L3BnYWFi?=
 =?utf-8?B?OEV4S01PRTN0NEM4MUlRVkZjaDhjaXgyUHJma3g5Z1FaSEJ0cS92cUswbGsr?=
 =?utf-8?B?Z2hucmg3Q05GRWR4N3BqUTRmdllHRnAzbStyYmNISktCT2RQNWVDY1ZlYnBU?=
 =?utf-8?B?bHJKOERKaDhGMmdGY0xZWElQdkhoK1laakN2UmRFcVFMOXBxdFlPNnBpYjVX?=
 =?utf-8?B?VmlRampENFlHdUdEb21xYy9tVDRaRCtBdlhvc3BIdVdRSjVGK1FtcThuN0Zo?=
 =?utf-8?B?akU5MW5mVytKMmUweVhQN0s1dDh2a0hmbmRBRzJuTVZ3bnpIU2tyWXNsdUlv?=
 =?utf-8?B?Tlg4Q2xUZkNNN0grVmxTT0VMb0FxZkc2Y0FJaHBjVnIyQU12RmFWdERWN3lX?=
 =?utf-8?B?V1ZPT21USUhqUmVSZlhtVVNnY1N3b2F6TkRlMS81NCtrYmZNdXkvVHgwV0th?=
 =?utf-8?B?RHJyVHFKZG1OWEdMNStqb002encvT081amdOd0ZYSkxkSzJoR1pJNU5qZWVt?=
 =?utf-8?B?Sm9JSVhWTmJOMTZyNlk5Skc5VFRWbHJnTzRiMXRFN3lJMkxSZmR4U2J3LzVT?=
 =?utf-8?B?YTVNS0J0TTV0WHF3eFh0NGJrOHVoYU9LQlM5dWc1dSt5cjFrNGRxZVJHMTFk?=
 =?utf-8?B?aWpEdHJUVkdwVDJhcEZsWUNhcmdCdTFzRWpjemlVQU94bU1yRW8xOXRwZXhq?=
 =?utf-8?B?bWFXTjN5OU1KYnAzb1o0ZitTQncwcEJRVDZmRHNZK1VGTW9Kb0Q4Vi9Oekc0?=
 =?utf-8?B?L1JkNHJzN2VPTWRRK0pRN1VqVFg4a3pVOE05UkJ2cFVyWkJPRkJCR09pVXR1?=
 =?utf-8?B?QUFSV2tYQTZ5aHQ5LzdwdFRlbExnSHpYbWNub2lwM1gycEwxdW95ZHJUZ0p4?=
 =?utf-8?B?WE1rdzVpbFphUVhZODgxdHpCa1FhRjlaOWRVR01UYzdzSk1pZ3puM1F5UUFF?=
 =?utf-8?B?SHVZdHRZbks3VGNiWFBHYnZMWXJPcmVaOEszVVo3M3gzSHBUQ3F6dVBvS0Fz?=
 =?utf-8?Q?7s/ie77zNk+l9kojFwLzElozb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be2e5d68-acde-404b-1c90-08db40cdb22d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 12:00:40.6668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFvZ7EtEmBA9YJJB0S2chhj+DPOaeGttipWumUxaclO+STKMYoQwQzG8ZUXHoLS8+4z+kGDzCSYDdnEf7E5KCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8120

On 19.04.2023 13:44, Roger Pau Monné wrote:
> On Wed, Apr 19, 2023 at 10:43:22AM +0200, Jan Beulich wrote:
>> On 19.04.2023 10:25, Roger Pau Monné wrote:
>>> On Wed, Apr 19, 2023 at 08:17:45AM +0200, Jan Beulich wrote:
>>>> On 18.04.2023 15:06, Roger Pau Monné wrote:
>>>>> On Tue, Apr 18, 2023 at 01:00:53PM +0200, Jan Beulich wrote:
>>>>>> On 18.04.2023 11:24, Roger Pau Monne wrote:
>>>>>>> --- a/xen/arch/x86/include/asm/config.h
>>>>>>> +++ b/xen/arch/x86/include/asm/config.h
>>>>>>> @@ -44,6 +44,20 @@
>>>>>>>  /* Linkage for x86 */
>>>>>>>  #ifdef __ASSEMBLY__
>>>>>>>  #define ALIGN .align 16,0x90
>>>>>>> +#ifdef CONFIG_LIVEPATCH
>>>>>>> +#define START_LP(name)                          \
>>>>>>> +  jmp name;                                     \
>>>>>>> +  .pushsection .text.name, "ax", @progbits;     \
>>>>>>> +  name:
>>>>>>> +#define END_LP(name)                            \
>>>>>>> +  .size name, . - name;                         \
>>>>>>> +  .type name, @function;                        \
>>>>>>> +  .popsection
>>>>>>> +#else
>>>>>>> +#define START_LP(name)                          \
>>>>>>> +  name:
>>>>>>> +#define END_LP(name)
>>>>>>> +#endif
>>>>>>>  #define ENTRY(name)                             \
>>>>>>>    .globl name;                                  \
>>>>>>>    ALIGN;                                        \
>>>>>>
>>>>>> Couldn't END_LP() set type and size unconditionally? (But see also
>>>>>> below.)
>>>>>
>>>>> I see, so that we could also use it for debug purposes.  I guess at
>>>>> that point it might be better to use {START,END}_FUNC() to note that
>>>>> the macros also have an effect beyond that of livepatching.
>>>>>
>>>>> Maybe also introduce a START_ENTRY() that replaces ENTRY()?  Albeit I
>>>>> find START_ENTRY a weird name.
>>>>
>>>> So do I. {START,END}_FUNC() or whatever else are in principle fine, but
>>>> I take it that you're aware that we meanwhile have two or even three
>>>> concurring proposals on a general scheme of such annotations, and we
>>>> don't seem to be able to agree on one. (I guess I'll make a design
>>>> session proposal on this topic for Prague.)
>>>
>>> Oh, I wasn't aware we had other proposals, I've been away on an off
>>> quite a lot recently, and haven't been able to keep up with all
>>> xen-devel email.  Do you have any references at hand?
>>
>> Andrew said he had posted something long ago, but I didn't recall and
>> hence have no reference. My posting from about a year ago is
>> https://lists.xen.org/archives/html/xen-devel/2022-04/msg00876.html
>> Subsequently Jane went kind of the Linux route:
>> https://lists.xen.org/archives/html/xen-devel/2022-08/msg00236.html
>>
>>>> One thing needs to be clear though: Macros doing things solely needed
>>>> for LP need to not have extra effects with it disabled, and such
>>>> macros also better wouldn't e.g. insert stray JMP when not really
>>>> needed. Hence I expect we still want (some) LP-specific macros besides
>>>> whatever we settle on as the generic ones.
>>>
>>> The stray jmp can be inserted only in the livepatch case, if we end up
>>> having to add it.
>>>
>>> Maybe we should just go with Linux names, so initially I would like to
>>> use:
>>>
>>> SYM_FUNC_START{_NOALIGN}(name)
>>> SYM_FUNC_START_LOCAL{_NOALIGN}(name)
>>> SYM_FUNC_END(name)
>>
>> As said in replies on the earlier threads, I think these are overly
>> verbose and come in overly many variations.
> 
> Right, I would only introduce the ones above and as lonog as I have at
> least one user for them. I don't think there's much value in importing
> the file wholesale if we have no use case for a lot of the imported
> macros.
> 
> The main issue with ENTRY() and ENDPROC() / ENDDATA() is that we still
> need a tag for local function-like entry point labels, would you then
> use PROC() for those? ENTRY_LOCAL()?
> 
> I have to admit I prefer the FUNC_START{_LOCAL} for that purpose as I
> think it's clearer.  I would agree on dropping the SYM_ prefix from
> the Linux ones if there's consensus.

Okay, I'm glad we can agree on no SYM_. But what value does START have?
And why would the type be (re)specified via ..._END()? FUNC(), DATA(),
and END() ought to be all we need. The type would be set by the entry
point macros, and the size by END(). To cover local vs global I could
live with _LOCAL suffixes, but personally would prefer e.g. LFUNC()
and GFUNC(). We could also limit ourselves to FUNC() plus DATA(), and
have (non-)global expressed by END() and e.g. LEND() or END_LOCAL().
One less macro, but maybe slightly odd to have the .global directives
then at the end rather than at the beginning.

Note that this is different from my proposed patch, where I aimed at
the change being unintrusive. This includes that this was matching
what Arm has (and hence required no change there at all). I think it
would certainly be nice if these constructs were as similar as
possible between arch-es; some may even be possible to share.

Jan

