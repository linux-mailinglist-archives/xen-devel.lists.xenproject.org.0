Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F669F204
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 10:42:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499315.770404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUldl-0003LN-68; Wed, 22 Feb 2023 09:42:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499315.770404; Wed, 22 Feb 2023 09:42:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUldl-0003IW-1z; Wed, 22 Feb 2023 09:42:21 +0000
Received: by outflank-mailman (input) for mailman id 499315;
 Wed, 22 Feb 2023 09:42:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUldj-0003IM-Bz
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 09:42:19 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe16::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 320a7fa0-b295-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 10:42:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9385.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 09:42:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 09:42:16 +0000
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
X-Inumbo-ID: 320a7fa0-b295-11ed-a089-e9535cc0f9c3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVPxVsPojw8Llz6IVf4BzDBbK3nwEPa8/T3eDWbblsPnxQzETnkVWhPg3WDqkEyVE8wAy3nkwGMPbDNgXT76X9kfRnBIs31+Lt3NIV2GxyPKSp514ZHmB6CXmrY2O6AbJG+NE1dFpeQTR4IoK5F3dSoQbqA/WjCZFT/ZRbCSTcP5Qsb62VDVxtH7YzZ/wtvNIztjwJWrW8HR7SZ/X6qpHnbs0t2IFN5ZJY+hyKALxQkK1wtKl8KHtt/rLeh8BiFSgtyYk0Z1PjOtdzNy/uJoPxfi3P5KLZkubx9oDe64Ge0K1U7JDzUr9C8XFlfQdlf5emo5I+ccht976H9YkRjsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79YgbylKNmpmqn5WaEIFXhdCLmBY7/F7PcJedzqjRIw=;
 b=kIW90XKLdgkpakZtN1GLilyMG+/v420VxZxPGPaN4husQMU2Tx4RKdd9tQ26bYMIhTlBy/AOtHAmBGtt3gA+MlmFZZsr0n3F2cqozW8iIYCOP9bgYPSeg7dF3cFeq/4V7NcwCADqFYq5qFfaOxGGPory2ukQglpKrycs9astsDHOdIHYJTJ9WHrsGUc8M+VV2glwP09Emh/+BrzLHhagAKDxqaCxhJChTHybrSbjIOC9GI7MCBU5op2qHIQfSZ0X57avtCMn840ucJEweUQzwiPWbZHJ9yiG7n3hJ+uoengnygswwqk+/4Ve3SYj6i3+7oTDXb6Ypz3WveyjsD5ImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79YgbylKNmpmqn5WaEIFXhdCLmBY7/F7PcJedzqjRIw=;
 b=O/fgJ5NKyeA/Uw4EcozwNdfbri5I6xnPGWfVuL+aFRlSiPJCQdAbsITEd6yS3MIqkHSOue1sNNJc7ske4hA/FBtIabj6PWetLdHK1qvtDEhanL9U6NzIETkJz5XY3xXWhXLK9HPJ/thTpbwSFEF/BwUbmot6pX+YDAeuWUppdc4IYkDW8Ng5A6Xg5SW4Y8/CvYPTMpW9zAMPXwjqk0SQrGdXQt5u9fHzyXzsh2hfQAZgUiKvopzZC8HxPRTGcJ4D35vh+71mUGabLPdXckzaQgzrEEwKuViNhTV0fQi2dHC253dzDeXB3P8BR0kQEccFhYnVupWNAOME21339Ijj1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <621319f4-0924-9b5f-9f84-be275f878cb4@suse.com>
Date: Wed, 22 Feb 2023 10:42:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Debian randconfig failure, Was Re: [XEN PATCH v2 0/7] automation:
 Update containers to allow HTTPS access to xenbits
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230221165542.7642-1-anthony.perard@citrix.com>
 <19396277-127d-1127-cdad-341368f97e92@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <19396277-127d-1127-cdad-341368f97e92@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9385:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c10d325-5adc-4185-e3db-08db14b91513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mmsUxppuEuaOrlODxzF/IvZDVHtq86HirJkqq1miahQ+1aTQMDwiC1Od2myrieInlE4PqboxQ2bFoF/mEZb3cEwK2+icSHsKgNiBrP47UTS2OsPgPP563YLGKhzD7GNAyd86TFRgzlQXSVob2epMgxltdm8kr6BSt4pu2zy2q7zjNbYKzFQ533qxEPSszDHcCLkK++4qSnihiv0uwwbXK257GOH2C1IS2m9drFqs0vZkd69cj6HHs08toquB0wePcgWQcOwwU6kFVfus+T6qJtraA+FUXycD7AfWkBy4aQHuwYCawBuArlpLU2z+j2tM1qZr5TDpXDpzjRpzEul4HlkPWk7zj+wQ0LWYLHN3PD3i/3vVN6s+gpvTOu7ZeSwTJc1QgOjMg7DviuTI8Pj7bIg9SoAy+V5JgkdxjjeCJgu/QKzEB/4XMw5Pi8GHuIiq9ypMQ7RF8/FM1bezN8YOdlM7dSb4bZHFP/jKbxSOBDVS+2oeql+SqOKSEyzyExyIwABAB2FYWs44jinx1XlzcEqZHkyUpF1p9pSKcp7RI4XOdaxZppEU59zZ1rHHikdic7etCRWImDeV2t6DYaa6FKk998J0MWWLDA7fOgfnwijjlBcUkb7yZrF/J1XNQbhQIpEMsKDdaVhhUCHCvjDN4Mv9C9A9WK92yksXb6PzaxbMoxVgR1A5Otcfnm8kalXFPhpTf78+i0FnFg1Wd2nZyY+dPLOgGkZRDQGlV8uvTuo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199018)(478600001)(31696002)(2906002)(38100700002)(86362001)(316002)(41300700001)(5660300002)(8936002)(83380400001)(66556008)(66946007)(8676002)(66476007)(6916009)(4326008)(2616005)(6486002)(966005)(31686004)(6512007)(26005)(186003)(53546011)(6506007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MCt2ZWV4VjFzNi8yOUhNMDJmNzFxbTNmNjBzb0swY3hJUkdjL0sxMkxCQVR4?=
 =?utf-8?B?eUFKaXkvRU10d3dLU3FKaVFGaUJkVkxjdzlBVGhGZTNncXhQcytFZ2hrbnlD?=
 =?utf-8?B?RFhiQjRhbGxQNHM0amgySWk5V3phZjc0TGl6VmxEOWZUdStYWWgwNURLUEZC?=
 =?utf-8?B?dXBoN2cxRUFnTmowN05DejNOS2Rybi85V0RyQ0RsTzFFTFNjVTZidUloaTBw?=
 =?utf-8?B?T05CL1M0bDJNSWVQZndLRWxaa1BGMlpNUWk3aFdCSXcyVFFlT0FlUTdhZ2tM?=
 =?utf-8?B?YnVkNVZWRlVUc1E4WXByYURmdDhyVGQ2TjZBVTREc2FKY050a3Z2MjhIN25u?=
 =?utf-8?B?UTBROXRpb08yUElDOE50NnM1SGlHMXJDTS8yRzRReVVKc2V5L0NUa25zQW5G?=
 =?utf-8?B?OEQ0ZWhib2dkTElNK2MxbEx2QjRUbXV4WUNpYmIwT0ZoZWVoaEJvR0tDZ21Z?=
 =?utf-8?B?ZHQ0dlVPclVLVjNFMVkvV1MvbURMOTYzOXZNNFVRL1hlTXAvNDVwQURBOGRT?=
 =?utf-8?B?QUVBbmtkNjNEYXVZVjY5amw5VG1ta0M2bE5Ua2xNVXNTSVBVYnIyTVdySG5B?=
 =?utf-8?B?K3VLTS9mSk1RZldnMTdCNDhkUXFodTU2c3V1M1cvdEQrLzJhbUVmcndMcERF?=
 =?utf-8?B?bTN3NDh5Nkx4MkxpNGhNa21WR0dBaWNudXlXenQ4YXlja1BCamRLd05zaWJ2?=
 =?utf-8?B?L1NyY2NseWdyRU8vajBtMVluV0xhZzloZjg3Q1l0bUVNQmMrbHFpK2ZIRFNB?=
 =?utf-8?B?MVFYS1YwTFJaVTNxdzJ6TUlUdUp2bS8zdGhRUUlVL2pDTm9SSmUzb3BkbXNM?=
 =?utf-8?B?WlVIR29GeVBPSTNMSU5hTjZDU2Z5UkxQa2dpeXIxVHRuS0RybWRNQ01xbmZo?=
 =?utf-8?B?b0M2M1I0Q1phVHZBOFV6Nk5QN0E2aXVxV2RmK3hVQVd6TnhudUNVbjFKcjRx?=
 =?utf-8?B?UkxScjVRZmNVYkxVSDdYYjZnZkNjS0NHMkxNNE5yUUhwYk9nZDQ2UjZIa29I?=
 =?utf-8?B?MGVyZGlxVnlZL25lc3MrdXZacyt6WEx0bFJYNitoMnhGd1JxWTdKek41NHRm?=
 =?utf-8?B?RWFjam5EejVFR3M1Z050aWdkbGM0TlJDZE1ISjRDQmYyb2piY0drRHpxUllj?=
 =?utf-8?B?NHEyRzczTDh5UUNQY1lpcUc5K0lGK0dLL1pZNEwvT0wvS0VyVVVQUTRDcEEr?=
 =?utf-8?B?OXlPSEpuOHc1WUNWNmZnSE53TGMreGtkbWlPMHBIdFVDbEF0WU9MYjNGVDRT?=
 =?utf-8?B?dDgrU2hLbkdjSWpsaVMrRTU1QStHRjkxM3VCMnBhN1B5TGlUWnVEdnMvV2NU?=
 =?utf-8?B?U2U5ZVJFcHZpVmYyOEV5WWV1Ujl5Q0RtZk9QTUR4aUY4eHlCdW4yMDJUMFFX?=
 =?utf-8?B?bi9OaFNZRFYvMGdydzM5ODhvSEhhUmpVeUZkc0NNRCs5d1hkRkVUbnJXYXor?=
 =?utf-8?B?V25lY0s2Y0hudWdKdzh0N0ZILzNiZi9UZDdYVitrRVlNa0FjLzNwU0trUk9M?=
 =?utf-8?B?RnBwK0hOYXMxTTlFcGFjck1QNEpGRjJpSTNvTGRsQkljczZKN2hFSTVBZDVF?=
 =?utf-8?B?dXIwVVJjQVpWYlpMYUxHNExzR0kweTc2RzRzRGZZWC9zSkNrRWN5UHR6ZlQ4?=
 =?utf-8?B?SjZsa0VjYWdLQ1k4SGlGekc2dU0yU25GL0xwOXBvVHFjNTh0NXZ2R2l3VmM0?=
 =?utf-8?B?WVdwMWNQTVpOQlA5d1p5aFZoNEdheVRxMkppZ1lDT0VjOC94SUpsTDUvU2Vw?=
 =?utf-8?B?bTFzblNGNDIrOGpIdVlVZ0JoWGN0UmVXcVhFNGxUWUE0M0FkOEV2UTVqM1FD?=
 =?utf-8?B?cllvL2d2Z0FzUWp5QWlyQkVjV2MyVy9CMEJRNG9lUEttWTBGQTJKTkRZMlc2?=
 =?utf-8?B?UmNtRktMV05NRWcyU3JyMlFYMTk4ZFByWFg0OXA4V2JCd2dLcUVab3dEZWQ1?=
 =?utf-8?B?OU8vK2J3c2VLUW9Sc0luRld2cEMxYXFNcTY2TjRaWXE1SnZKVnR4eTFuZXRy?=
 =?utf-8?B?U3JmTjFmdjZnVXA1V2ZiN05mbUJuSTN3UW5EalBHTXY3d1Nha1JiS3lQcXNw?=
 =?utf-8?B?QjJtQU5uRmU2bWhXRGZGa1NWODdadzk2V2hrMGh6R1ovN1BoZmZXR2pacUZE?=
 =?utf-8?Q?KUkplunbFUx2vGGw4B3fcZ0ez?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c10d325-5adc-4185-e3db-08db14b91513
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 09:42:15.9906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIzy3JmPiHoQJjT8sAC9L9DEOdya8P2au4RmBULaPhdG7L3i381A5EK/oAFNZgr29kiT3E/0VVUfxG+V8I5B7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9385

On 21.02.2023 19:05, Andrew Cooper wrote:
> On 21/02/2023 4:55 pm, Anthony PERARD wrote:
>> Building randconfig on debian unstable seems to be an issue.
> 
> You're talking about
> https://gitlab.com/xen-project/people/anthonyper/xen/-/jobs/3769926509 ?
> 
> + gcc --version
> gcc (Debian 12.2.0-14) 12.2.0
> 
> arch/x86/extable.c: In function 'search_pre_exception_table':
> arch/x86/extable.c:200:27: error: array subscript -1 is outside array
> bounds of 'struct exception_table_entry[1152921504606846975]'
> [-Werror=array-bounds]
>   200 |     unsigned long fixup = search_one_extable(
>       |                           ^~~~~~~~~~~~~~~~~~~
>   201 |         __start___pre_ex_table, __stop___pre_ex_table-1, addr);
>       |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from arch/x86/extable.c:8:
> ./arch/x86/include/asm/uaccess.h:414:37: note: at offset -8 into object
> '__stop___pre_ex_table' of size [0, 9223372036854775807]
>   414 | extern struct exception_table_entry __stop___pre_ex_table[];
>       |                                     ^~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[3]: *** [Rules.mk:246: arch/x86/extable.o] Error 1
> 
> Jan: do we need some more gcc-wrap sprinkled around?

I think we can get away without, but first of all I'm curious why gcc12
spots an issue there, but not in my (and perhaps also your) local builds.
Being a randconfig failure, is this tied to a specific setting in .config?
Off the top of my head I can't think of any which might affect this code.

To work around this, instead of adding gcc-wrap-ery, I'd favor simply
changing search_one_extable()'s 2nd parameter's meaning from "last" to
"end" (i.e. the range passed in from [,] to [,) in mathematical spelling).

Jan

