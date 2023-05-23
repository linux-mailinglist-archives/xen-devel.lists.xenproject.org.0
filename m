Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D156070D9CE
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 12:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538374.838257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1OqV-0000n2-4U; Tue, 23 May 2023 10:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538374.838257; Tue, 23 May 2023 10:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1OqV-0000lT-1i; Tue, 23 May 2023 10:02:23 +0000
Received: by outflank-mailman (input) for mailman id 538374;
 Tue, 23 May 2023 10:02:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1OqT-0000lN-Ez
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 10:02:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6772e08-f950-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 12:02:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9457.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 10:02:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 10:02:15 +0000
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
X-Inumbo-ID: e6772e08-f950-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5v6Qb4mRX7uYfC58GM0LleJbOcGTPIhJD5JeWQqNBJ0C7l9dXvbhYA4C8yHZVjngDCNpgrH/iL1gCFPZHsUD9FI7d/LUDFPjGibjDn3CeK6WQKIkIOOVwmP9HLtcv/ghDU2epxtkDL+pqc5nI6ElryaFRhCUbLg7C7MRU8+mQvypKWxOTo0xhy50x6HU9NmqLvPQEOna57zsT4k7IzT5tf6eT37FTjogRGpYf9YGIn1a22c9OsBbBfAF+Y9TS3r/pszQkGkfgGiMnEYdjreQtNggaYiPz9OqAkJk5BEDL5b5WnXoFMsLU98l5G70hsOxdBMsbVM8jBokUHt62K0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lw0hmpCUQr1vTjf5tGYOdFJpFJQmi1l+9VsKQDyvw8c=;
 b=YrWuyJEBzUxACj8PiP9+oMfa6weHSXkMBhycgW7ZjRLn5QoV+b7bKQU+P8BQRBNpb1R2Hq3SKMmtp+YCasPm6ShLJl1Cc33xlk7G8bQAxWKo3K4+ksuBNNJGPVdpELgIkdQquDExuesimf9ysF+S5aVm8b0sAZPi5u403fGY8t8hFx27yS7t06gY4rr1oEcAF7EE/j1+2nWsVLjBcoWeMB/X6dpoxhG8WNpUrGabFIzHr+Q2f+F3bWv/6xoT3mcUNnHobuYyywsDnZtv26K5iz2yWom8PI7bmzA6oHMhQgFkb3odOCKNWJrdsPaG+0yg7c3yAaRDWs6rdJFUML59AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lw0hmpCUQr1vTjf5tGYOdFJpFJQmi1l+9VsKQDyvw8c=;
 b=ujcs1J/9Xbn+dDOortqreVSmamp+EmWtXodx0niH12Qbheq5bkpR1MIloz+/jt13UKgduDj10037wBAlRQWM8dwUnyaKNKZ7aiaXl7KZbaJ63o9wydpOpKnP+SZeuBhhxgP1VOh7T+kkzdO9tMKK9DiV3KRBrie+tJLquaXbTJYkqKdfSEhL18hfw00uPoJikbxNSpfLL+wI2c5YVPf2JxC5PgHqu5LlRUPOIhjF5TuJMt5Uvw3DmsR72QuOEntIZQQqdO6GUb/48GEULSLzXs61rpXCp5HQB1Yn9MFsKuAL34g9LIZ8yEM4lX8YiJ4zcuaQohT/tUH0yhTCF7ezEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48722696-ea22-1af9-2a0a-aa78972d118a@suse.com>
Date: Tue, 23 May 2023 12:02:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 07/12] xen: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-8-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230523074326.3035745-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: deae2056-9152-46de-4ebd-08db5b74c960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l5HNmpKh/0SJ1f+8fWy7yDNwPqk9NMWk2wkZANsNsvhpyRnHC5PBEfyH4hO33DQtZ7pwBOOYBg0hq0swp51xT8Fj5eP1G4GHn4uj/tK1D2Y5AfX4oNJtk2vos9tiDbKgXrDp27XJLnhursztTyr+sOx2dJ12tWCBconfUOzce0xiwwBqS8w2YrANG6yfNOQv/tvTaYxQzZf1RzMvZjzTHEHeZTkau82DFd3zum29cYhi3NOYX37nyw5sZ93tN+UWqTD/XwQpBLITniviPUY+nU3b7YfIlAZfgjq8z/eSgNes5VjScWNQxAbFvoAcya+YSvUQMr+8rV6yTAILh7cCtBRS2YcFU26TsSb861SSg49Rjg8FM4QlvcViZXkUrQNBO214qVhA9NCNgqezMSeyeXOndz9k/gtvdrOU8gEoVCec/ifysVApy1UZWA7uiijCam7z4JX7jfd/QuhWsnoZcbTGoByLMNpZBCnyhUbWRYk8lWJqKV6IhikNqkqbaTUPn1F+Eptv6U957QYE2us7UOFoHSfRpwUBIqEjihbC8zlhRcfD+VtjXIh7XkwCK4Ec0yJpuoaGz+87Kp77uzQYlPN60GkYFg7zWuhwnO6yqaKrzwAc5w2KpJlY9XXg4YxjYF+pd+nJscjRdXV9hagtQw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199021)(8676002)(8936002)(5660300002)(7416002)(186003)(6512007)(6506007)(53546011)(31696002)(2616005)(86362001)(26005)(38100700002)(41300700001)(6486002)(66476007)(66946007)(66556008)(316002)(478600001)(6916009)(36756003)(4326008)(54906003)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVFUMjEwbXh3TklkUlBaSVROUW5OUGJBNWpkQURDL0RZN1N5dnpxbzlpK002?=
 =?utf-8?B?SFpnaUxCR2JpSStBRFlMT0FaSVlMUjMzUDU2TTROMGN6SFFjSExCTjFyZnNU?=
 =?utf-8?B?UThhSzFzejZHVUVHcElDald5VWhNdjJpZW5HRktKaFlTOXBjdVpFL2ZzS0Nw?=
 =?utf-8?B?UDUzd3k0cEVFSVBNRU4ybk9TVStGNEw4TlZ4dllpYW5sNU0rWjlaZnVPQmFm?=
 =?utf-8?B?YkhDNVFvWFBLTWZlZkMxcEFYemV1azlvN0NkVmlRYy9lL2VLSm5WZjNZSzNH?=
 =?utf-8?B?My9tS1lSVmEzS21oVURRMFVySTVaR0lkR3VpbFVBT3RVYTR5WjJST1BVOGtW?=
 =?utf-8?B?OFgyZVJxbVlTbjZNN1h1Tm5FaVlSUW9RbzA4VUd4STJJdWtxSEhFbmxpUmE4?=
 =?utf-8?B?NHBEMEZGT0hPYXdXWFFnT283RVk0eWUxR2l3Skd2VVdEc0laM000Y3hZT2d2?=
 =?utf-8?B?eXZlM2FWOVBIVTJqVlF4Wll2VVk0SEJQUk81VVJQbVh1b0dKRGFUMmVPdHJy?=
 =?utf-8?B?dzh1MC9DdGx4dXlLZk9sZUxSaFRSWVZMbFFwb2hXWGtHbWFESVVBeUl5ZFd6?=
 =?utf-8?B?RHpSZi80THBVYktmT2kvUFlQOVF0QXVneSs1cS8zR0VVVENFbS94dUZtZFJG?=
 =?utf-8?B?d0lveUh1RENWMlEyS2h3ZlJzQU8yclJYdVZvVlVLNVJ0b0tIQjIwUlFKNWVi?=
 =?utf-8?B?eVJEVzhZOXV0eldBQjlJVmtxSU9JS1NTYm42TGQ5QnBWWElPU3FCVlVMYVdx?=
 =?utf-8?B?SjYxR0swaVRSSXBlL1NUYTIzSmUyWFB5OGIwanl1Q05Ec1BJZmZyVUZkRGpo?=
 =?utf-8?B?TUVZNUVFc1pjbXhYYXJISFpOcWtYVjcrQzVteHhSZXdSVEp5cDJYN1ZlUUdk?=
 =?utf-8?B?bHV0bElGVmlGcnpoTXFRc1AyWlNiMGRweHVqc2w4b1FEdXlCb3lkbjRKMVNV?=
 =?utf-8?B?emNFbGVMRnlWbjM3U0l6dmpzemlPU3cxNHUyOFhKOFVHNGdOR09NbEQ0UjRV?=
 =?utf-8?B?QS9QclVOOCtaYjE0NzBEU1NDWDhVRU1QOFUyTmROK0hMbDAySTF5cy9Td3lR?=
 =?utf-8?B?akhGS2FlYkp1eXgvNVdpT3ZzRjUycGFHSGxuc1IrblNvYTVOdHZCa2w4d3dB?=
 =?utf-8?B?bFpRSTRyYWt0SXRza3o2MGpHdk5MM3VXeEZ4SE9LamlOaHB4RUxNeVo1Zmxw?=
 =?utf-8?B?SUlWSzV6SmRzLzB1MG5XZDRLZS9aMzZWTitKamlNbCszcjIxZ05Hb2ZKck9K?=
 =?utf-8?B?Z3UxY2JnR0pCWi9aYjZmYnpCMXpDaEFOck9lVTVOKzVMdzBXNXR3eDFiUFhj?=
 =?utf-8?B?ZVlUckNrK3dORHZmMkI5d1l3VjFvVTBwZ2F2elg1aVQxMTk4cEZpVG16RnVo?=
 =?utf-8?B?Mi8xR2tIdStUa3FTcHJDbUlIK09nSVdqV2NxOHlRcUFPL2lrYUZqc05ER2hP?=
 =?utf-8?B?V2tCd1h0OW41K2RwM2hWTFZjcElQYnBYYXNNd21FWC8rU2RVSUczR0RiWmdK?=
 =?utf-8?B?cmM1eWVVaHJYNWZzbk1SUWUyVldxcm9OQzNybmh3RWhhYlMvbkt1WWtMd2l5?=
 =?utf-8?B?UVBtK2VNRnhCMlpRb0x3QUZmMzNtTlZXc1RBZDhCT1R1TkoxQmVkK2phTEZk?=
 =?utf-8?B?TEV2YVBBSDdOZVVTVHVJYk1LeU96Q2RFc0VsQThzUk82OUYrTXIzaGhjejlO?=
 =?utf-8?B?UWpJRDNzTUVUVWlXKzlaTEw3S3Y0YlQ5dFFKbi9KNmtXM0VSUldEbVU0SFdq?=
 =?utf-8?B?MWJxOWJEejR5T1hIejBoZmUvdno2bHc1cE5yQUozMnR3aFJyQzRuUktSV0hW?=
 =?utf-8?B?NVlEb1RjcGxTVHlUK0N6L2NSSjIxUjJTbDd0UDJ3R1dkUzI1czBWdVQrdjdh?=
 =?utf-8?B?VnZpMWpZQkVpT05mem1ucDZ4VmhGUWFPMmpEbUtMM1pFM0YyWW9GSHZqVFJ4?=
 =?utf-8?B?alhyWjNVRS9rVnhmUm9YcDVyaVRUZDVnc3ZrZDVwRGttaG0xNHRvdjlQY2JQ?=
 =?utf-8?B?UExTakduQnhaNVdRN3dXRkxWdklYOElvbk03V21DTkhpZ2xUK1Nsb0dpUEFy?=
 =?utf-8?B?d1c2ZU0xb0tGMzZjaXR4WHRHcW4zSGRsSm5aTWpJVkZTMThBb0Nja0tpdDkz?=
 =?utf-8?Q?CKJUUg7/LLMkVFD/0b6mbd0K2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deae2056-9152-46de-4ebd-08db5b74c960
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 10:02:15.8254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPtFo+ugBzC1FzMaDeRUQxYiabuhA2lyupqZRXaRHS3J6s5tlDykCr5FZmikr8bZvLRYAWHyhncTc+mmW4XXLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9457

On 23.05.2023 09:43, Luca Fancellu wrote:
> Add a command line parameter to allow Dom0 the use of SVE resources,
> the command line parameter sve=<integer>, sub argument of dom0=,
> controls the feature on this domain and sets the maximum SVE vector
> length for Dom0.
> 
> Add a new function, parse_signed_integer(), to parse an integer
> command line argument.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # !arm

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -777,9 +777,9 @@ Specify the bit width of the DMA heap.
>  
>  ### dom0
>      = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
> -                cpuid-faulting=<bool>, msr-relaxed=<bool> ]
> +                cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
>  
> -    Applicability: x86
> +    = List of [ sve=<integer> ] (Arm)

While in the text below you mention this is Arm64 only, I think the tag
here would better express this as well.

> @@ -838,6 +838,22 @@ Controls for how dom0 is constructed on x86 systems.
>  
>      If using this option is necessary to fix an issue, please report a bug.
>  
> +Enables features on dom0 on Arm systems.
> +
> +*   The `sve` integer parameter enables Arm SVE usage for Dom0 domain and sets
> +    the maximum SVE vector length, the option is applicable only to AArch64
> +    guests.

Why "guests"? Does the option affect more than Dom0?

> +    A value equal to 0 disables the feature, this is the default value.
> +    Values below 0 means the feature uses the maximum SVE vector length
> +    supported by hardware, if SVE is supported.
> +    Values above 0 explicitly set the maximum SVE vector length for Dom0,
> +    allowed values are from 128 to maximum 2048, being multiple of 128.
> +    Please note that when the user explicitly specifies the value, if that value
> +    is above the hardware supported maximum SVE vector length, the domain
> +    creation will fail and the system will stop, the same will occur if the
> +    option is provided with a non zero value, but the platform doesn't support
> +    SVE.

Assuming this also covers the -1 case, I wonder if that isn't a little too
strict. "Maximum supported" imo can very well be 0.

Jan

