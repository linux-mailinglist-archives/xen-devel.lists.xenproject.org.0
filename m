Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F386B7501F3
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 10:44:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562071.878625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJVRc-0002n8-TP; Wed, 12 Jul 2023 08:43:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562071.878625; Wed, 12 Jul 2023 08:43:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJVRc-0002k7-Qe; Wed, 12 Jul 2023 08:43:32 +0000
Received: by outflank-mailman (input) for mailman id 562071;
 Wed, 12 Jul 2023 08:43:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJVRb-0002k1-2E
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 08:43:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c1b5743-2090-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 10:43:28 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DB9PR04MB8252.eurprd04.prod.outlook.com (2603:10a6:10:24d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 08:43:26 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 08:43:25 +0000
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
X-Inumbo-ID: 2c1b5743-2090-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyLQR8Y23mGC8cxZ43TIgdK3tQP3bauws+rE4oABL65GoHy13QSy/EiEwjceKsUFvQbmFswhZIMaNgDJyn2x3ZetF1hMd+V8iyL3+OHFYP/q3nIQcqx0UgQ3FhFDcvT281CY9ri768W42CDm2z9zaLIb7LN5ahUGpKhaEFog5ZTQjvlN8sc6pQ4QBuxShkS4IX+ux4L3dg1wl3aaUSgiTJy6WB/8GKOnnBx4I2eqRqQOktAK6TJDC995vQW48fYMpyqY8dUWhKXwCaOdCO6M+3/nGWi9eoSQpiO1KjIpHnhcI89hchQEmfbsRF//HiE5HeqZW2MWc6aCtTfa0nHObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEwDvcaOCnm9UrqJ8PkCJ38bVXRW5ABFzclgOM4IOzo=;
 b=m/GBOeXUjMfYUzh8jpQwtj1VKipNka2jOusGGON118RiYIyBMy0ZFihSZHzRCvmE2ATEwsBPndE+w1Zfk1gdYV2bvLd9rSdadOXC6QUAOcGJ355W40LtH7DJpEnNHAR2WVBW6rGS+Y8ViR1zV+dQeI8q1e6PMV7dfrLdiuKqJlqJ6EYfYgwI6itFkz7qPF2lVw8pA1R98bOGKaoVO0c8jUemR6poeEKOJpw8Th93GOeA9Fxy716EO2l5LOAKgmVyCfDPzhi1db4xPZ1UCrovuhXQfALVt2yNMvdo3v9wWLcp9haBoS8zCLjryjuFug7zLQgJyHGrLPCHJya0LsgmtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEwDvcaOCnm9UrqJ8PkCJ38bVXRW5ABFzclgOM4IOzo=;
 b=zCS/CHL+f88dUEjxvd+zNoPniAEbjJeYookHqKL0xSS4lmtVTAtwcv5VpSpcoIdfddejFDIsVqq+xlLmvFNb8fxMiQYWYRzX9NAR4pikTuAIHSRg7pioeGTtOyDKe6CHs/cDcCBxSZ7mtBt8SvYyynEH6EzbA36lj8eAtECrlDAubcM7jNLWxoS+kSQk7XSnZC43TP2Hk9/LPLb84ldA4hpZ7mb1izFCf09MoS0StyAp/O9fWzwuL1jcBfkrZAXsUyBWo1MZprCLWFU0OO31YCKQfd1gta8ErXBxwYeVzlLvtShi5wTjN3f04aPqSohOmhblxvLDe4tO0y3npTZCzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f768b046-4e14-30b3-479b-bdcdebb4d397@suse.com>
Date: Wed, 12 Jul 2023 10:43:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 06/15] cpufreq: Add Hardware P-State (HWP) driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230706185440.48333-1-jandryuk@gmail.com>
 <20230706185440.48333-7-jandryuk@gmail.com>
 <eeeb032f-a21b-5eb2-e3d5-63357a04a500@suse.com>
 <CAKf6xptn0OL0qz+DW9qrwU=sFSKSp-O3S7z6vFbZp9RstFanbw@mail.gmail.com>
 <bfacee48-f640-f2eb-7fd7-f440ad03e612@suse.com>
 <CAKf6xpvVd49dx=CtGyPMt+NMuOfhJ4a1fiZb-O4e-guq9BwcFw@mail.gmail.com>
 <cdbaec77-9112-7b18-e9eb-fa12a16d2ccf@suse.com>
 <CAKf6xpspsyShp2O8SLK+=VQvxd=Uaewg-JHYAFPqEPmEWvDRAg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpspsyShp2O8SLK+=VQvxd=Uaewg-JHYAFPqEPmEWvDRAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::15) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DB9PR04MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: e60f0809-2987-408d-e25e-08db82b40eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e/ZB0ujrkY38kvxVsBwewU/2aSasD2Od6C6M2E6qBcjSj2YN4o1V0pdIA1gNgWk6qqgUTL57BWk0UIqgKHiglXrw0EG9D6NkIsAPvwNGxCkcxZrX0aAnNH3zDBBZRliTslRrxE9XSAYm1gRzVUAmY72YUxVQ3Iq92nlOaWCA5SdMAa0zWVYApmeE3P9Lwo8kt4/KzMLzkzDU1d8br3LNCPXYlgK0BSxg67Ts/VvDRA/k3zrYETVFm+NVdk/hBU38m5y423Lpk2og1QrAj52Q0JG1DgnnIivsGMmzkxn4th616mlZFtfnrE0vRN6pVYzLT6vH2HwcWe5UQQJFcq9PUjvuS6HtD8TtyJIufIV7fz0ElAPO2uheZMdV+FQIkyo4B4/Ya1mGR4fw5hdnUhA2qv2J/amK22uQaJF9t7/rIsjbir1vQwboDK1Nv2Hx9yVYKC57w2IvUbE4jXdWOrryOqexqXM6xQq4IbF65IA/64ZcTDdK+u6p5vgljNMMRL2i6avSXkItT+gI52lqYaXKPYTI70+4dmbtjNsh1y45yWkEMTw5e1WLnA4uT5UfLhHsXYQ92ecnuwRg6lSioxXpd54DT2oFincPaTGgyAEFuNPvfkH2CeW1n8N1NTsEQVohFPjX4SoP4iGo639HyG8RSw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(8936002)(8676002)(2616005)(38100700002)(41300700001)(2906002)(316002)(5660300002)(31686004)(66476007)(4326008)(6916009)(66556008)(66946007)(6486002)(6512007)(83380400001)(478600001)(36756003)(54906003)(6506007)(31696002)(53546011)(186003)(26005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDFzUU8vc3M3ZFVCY09PWGtvSXpxZDV6K1l1cmJ4b3pHRW1XanpBRC9qVWg4?=
 =?utf-8?B?NXhIek1kTVVJSERWTVVldUZFekxoUTVkY0Z0Y0ljTllHSlFDenA3ZVl1eXpG?=
 =?utf-8?B?YlovNC81bWtEVmN6YlhiWThDYVdmbzhxZG95NVJkOVQvL01XeFkvNEs4cU94?=
 =?utf-8?B?YTRJVXlYeVBSN2ZPUDR1M1dRRFp5MWQyVERKenBWNlIrUmd1WlNDcE1kenFD?=
 =?utf-8?B?Sjhwdzl2dHB3WWkxMFJ0SnBFVUw1R0xBR21YZmdWaGpNZDZTMFBvNWljMEhN?=
 =?utf-8?B?bDRScmZUTldmdm83b1ZFcStvNnFXQzRWMXhvMWtCaUhuMVdBSEo5WVBTc2pr?=
 =?utf-8?B?L1JORGVrcFd1dmNCUXhVT0JocUpHOHp2VjRvVGNFZTVzZUljQ2ZuZUFySjVJ?=
 =?utf-8?B?VWMxRWl6WnlEbUJjOTllNUN5MFFBOW9XMzBZUHkxRDllT1R6SUd4M3BCREFs?=
 =?utf-8?B?UFpISDk2SGhlUisxRFRJalZja01TOWh3VzFFZGppaFMwbm04aEg1SzgwcU5R?=
 =?utf-8?B?M0pSWTlpT3BscjhVNGxDZ242YUcwd09UQWY0UWpMakNzMlJVSkF5OUtGc1ZJ?=
 =?utf-8?B?MWovRnJwQ1NXTFpvbEcxeDZpZkk2alhmV0xRVi9XWGNXQXpNaHc2ZTlnTmhQ?=
 =?utf-8?B?eWVMd0tud0hKNVFrWUN5SjcrZ3ZKQWduMDQwVVBLV1lwWFU5eHFzUU1xSHIw?=
 =?utf-8?B?MnJpVUttUHU3d1dZNjMwTjR1Q09sYTZZQTFvMFRpZzI1TTZJR1BwRHp4b2JX?=
 =?utf-8?B?T2ZFeWZSM0xuc1RUU1hDY0lyY1VncnVkQmRaaHI5ZkFZeVZ2MGZyZW02a3Uv?=
 =?utf-8?B?YWswbS96M2lwVWR2Ulk2anl2RHM0ZWZoaGpXZUUzVnNvZ1lkT014Vi9mMUt5?=
 =?utf-8?B?RVJjMTdxSk9pTTVuQ3I3cllXRGZmNEJINUtEeGY3MWFTaisyUWdzMFFKbnZR?=
 =?utf-8?B?ZStBYWlYcTNvNWFHM2U0YWtVRWF3aHNqWW1HZ3Z4OVk4K3RZTm5MeW1oaER6?=
 =?utf-8?B?SUlPTmsxQTlFdXZxeDRvZHkxVFFGUXZnR0xqUU5FQW0zOU1LWEZWTGpNSllp?=
 =?utf-8?B?aTVnTDYyVFZhUFl0MjZXUG44MnFxaWRtWmlDd3F3b0x3VjVFRjloK09nWWUv?=
 =?utf-8?B?Uk1QeWsyem9MWER1bzA5YTFKM283VXUrZ2hMaE5DTW8xQ0ljZkd5U2VMSkFN?=
 =?utf-8?B?RlBJbFFTcFBaM0cwU0hKaVg4UUVkSld6WVUvUVE3dmZ1bXViWXFEOEJWNEVR?=
 =?utf-8?B?NEJSZTVHQXEyWkI4M2lNeE9QRlhYK1dCTFk5SGV5SDNqSXdseC9SRzh1OVJL?=
 =?utf-8?B?NGx1NEVmdmhkZEF4Y1krVlpMN2s1N0FScWxWMmpHMVIvOE1KclEyT3VFcVpE?=
 =?utf-8?B?dGU2NXdxSVpONGNPNGZJSnJ2WHhMVkNINHdkU2U0UERaTjhhWERmSGtlc0l0?=
 =?utf-8?B?cXdxSnZPdDlhR3JDU0QyM2wvV2VteC94SkFQcGc3RHU1ZW9Zei9WdmtoTzRp?=
 =?utf-8?B?cGFOWHdpSEErK2VmUCszU1pDc1VVL2p1NUE1T3pTUU41bHZmdzVSdU1wUFZ2?=
 =?utf-8?B?VTRzMWI0VjhSRVcyL2xVS0ZmeGZsZCtNclVMTmJadVRFZ0xycDkzWHJ0V0g3?=
 =?utf-8?B?MGxzYThIdU1DcGtxcG9BRWNiOWR6M2crajFUNjJIM1Z5UndnS1RXckZkaVpS?=
 =?utf-8?B?SVp4KzBDYmI2cHpEMkNjUlBCeTlHZlBrZ1lxSjU4UlJPNlFZLzMveUlvaTA2?=
 =?utf-8?B?RW4xTDk1NHgxQzIrckhORFVsN1cxRm43RVAwWk5qdXo0MVIzVWIvZzhMQk9t?=
 =?utf-8?B?VGxzT2daR3FhUEt0eE1waHJ5RFJOVGRBY1lMWFNndFF1eGovVG1aRlhZQkli?=
 =?utf-8?B?VURrMDcvbkhZMWltcjUwT2w5QXJtQy9WNHFRaXVQcnJ4MkRzMFU3aUVqV0VH?=
 =?utf-8?B?a3o2THBKOUtFdlZLMlVxUHRmMDU4SUlhS0oxTGRHU201alh4bEtJT2dxTHVy?=
 =?utf-8?B?bTIrdjdMYU1wdWZiYlhhSytGQkhlYjRENHM4bkNhVm1KUTRua1BLSDZndnpS?=
 =?utf-8?B?NjVYTTN5ZW5vSFFNWnFSME5WTHhjR21YT0Erc3UzYVU0RG5rZXh1QmQwYXZw?=
 =?utf-8?Q?ZtarkWHmgaSaQZca/vZLZ3n8J?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e60f0809-2987-408d-e25e-08db82b40eb2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 08:43:25.6389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CMC4X1hMJT7niZnp/jyrw0j/BoWDBr7VpCiVs5nvXpLHPaf9bhK9U+s3bhmbUSVjiYY/4CM0o3DPoDOqV3ombA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8252

On 11.07.2023 19:49, Jason Andryuk wrote:
> On Tue, Jul 11, 2023 at 10:41 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 11.07.2023 16:16, Jason Andryuk wrote:
>>> On Tue, Jul 11, 2023 at 4:18 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 10.07.2023 17:22, Jason Andryuk wrote:
>>>>> On Mon, Jul 10, 2023 at 9:13 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 06.07.2023 20:54, Jason Andryuk wrote:
>>>>>>> @@ -510,6 +510,22 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
>>>>>>>  * `<maxfreq>` and `<minfreq>` are integers which represent max and min processor frequencies
>>>>>>>    respectively.
>>>>>>>  * `verbose` option can be included as a string or also as `verbose=<integer>`
>>>>>>> +  for `xen`.  It is a boolean for `hwp`.
>>>>>>> +* `hwp` selects Hardware-Controlled Performance States (HWP) on supported Intel
>>>>>>> +  hardware.  HWP is a Skylake+ feature which provides better CPU power
>>>>>>> +  management.  The default is disabled.  If `hwp` is selected, but hardware
>>>>>>> +  support is not available, Xen will fallback to cpufreq=xen.
>>>>>>> +* `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC enables the
>>>>>>> +  processor to autonomously force physical package components into idle state.
>>>>>>> +  The default is enabled, but the option only applies when `hwp` is enabled.
>>>>>>> +
>>>>>>> +There is also support for `;`-separated fallback options:
>>>>>>> +`cpufreq=hwp,verbose;xen`.  This first tries `hwp` and falls back to `xen`
>>>>>>> +if unavailable.
>>>>>>
>>>>>> In the given example, does "verbose" also apply to the fallback case? If so,
>>>>>> perhaps better "cpufreq=hwp;xen,verbose", to eliminate that ambiguity?
>>>>>
>>>>> Yes, "verbose" is applied to both.  I can make the change.  I
>>>>> mentioned it in the commit message, but I'll mention it here as well.
>>>>
>>>> FTAOD my earlier comment implied that the spelling form you use above
>>>> should not even be accepted when parsing. I.e. it was not just about
>>>> the doc aspect.
>>>
>>> Oh.  So what exactly do you want then?
>>>
>>> There is a single cpufreq_verbose variable today that is set by either
>>> cpufreq=hwp,verbose or cpufreq=xen,verbose.  Is that okay, or should
>>> the "xen" and "hwp" each get a separate variable?
>>>
>>> Do you only want to allow a single trailing "verbose" to apply to all
>>> of cpufreq (cpufreq=$foo,verbose)?  Or do you want "verbose" to be
>>> only valid for "xen"?  Both cpufreq_cmdline_parse() and
>>> hwp_cmdline_parse() just loop over their options and don't care about
>>> order, even though the documentation lists verbose last.  Would you
>>> want "cpufreq=hwp,verbose,hdc" to fail to parse?
>>>
>>> All parsing is done upfront before knowing whether "xen" or "hwp" will
>>> be used as the cpufreq driver, so there is a trickiness for
>>> implementing "verbose" only for one option.  Similarly,
>>> "cpufreq=hwp,invalid;xen" will try "hwp" (but not "xen")  since the
>>> live variables are updated.  Even without this patch, cpufreq will be
>>> configured up to an invalid parameter.
>>
>> Right, and I'd like to see "hwp;xen" to be treated as a "unit", with
>> ",verbose" applying to whichever succeeds initializing. I don't think
>> there is much point to have separate verbosity variables.
> 
> When you say "hwp;xen" as a unit, you don't mean to intermix all the
> options like:
> cpufreq=hwp;xen:ondemand,hdc,maxfreq=42
> do you?
> 
> Because of the suboptions, I don't treat "hwp;xen" as a unit, but as
> strings separated by ';'.
> That allows the full selection of parameters like:
> cpufreq=hwc,no-hdc;xen:ondemand,maxfreq=42,minfreq=0
> 
> This lets each respective parser handle the options it knows about.
> This does duplicate "verbose" handling.  cpufreq_cmdline_parse() and
> hwp_cmdline_parse() are also usable when only one of "hwp" or "xen" is
> specified.
> 
> These all work:
> cpufreq=xen:ondemand,verbose
> cpufreq=hwp,hdc,verbose
> cpurfre=hwp,hdc;xen:ondemand,verbose
> 
> To disallow "verbose" in "cpufreq=hwp,verbose;xen" would require extra
> code, and setup_cpufreq_option() is already rather complicated IMO.
> It's a corner case, but doesn't seem harmful to me.   Hmmm, making the
> above fail parsing may be worse since it would only try "hwp" without
> a fallback to "xen".
> 
> I just want to be clear on exactly what I need to implement.

Maybe we need to take a step back a revisit what option forms actually
make sense to express. Part of the problem may be that we permit (but
not require afaics) the use of colon as a separator after the "main"
option ("xen", "none", "dom0-kernel", and perhaps now "hwp"). Such a
colon suggests that what follows are sub-options applicable to that
specific "main" option, especially since what follows "xen:" can be
more than just the governor name (and in fact no governor name is
required - I've been using cpufreq=xen:up_threshold=40 on some of my
systems, for example). I have to admit that I don't see a clean way
of (largely) retaining existing behavior while at the same time
avoiding ambiguity with your additions (and it may well be that there
is pre-existing ambiguity as well, but the introduction of yet
another separator [semicolon] clearly makes things worse in this
regard, as it suggests strong grouping).

Maybe we want to consider an alternative form of expressing the
fallback. What about e.g. "cpufreq=hwp:hdc(xen:ondemand),verbose"
(and its possible variations)?

Jan

