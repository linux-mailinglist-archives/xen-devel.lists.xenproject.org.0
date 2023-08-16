Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ABA77E488
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 17:02:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584784.915607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWI1L-0000nI-1j; Wed, 16 Aug 2023 15:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584784.915607; Wed, 16 Aug 2023 15:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWI1K-0000ki-UM; Wed, 16 Aug 2023 15:01:14 +0000
Received: by outflank-mailman (input) for mailman id 584784;
 Wed, 16 Aug 2023 15:01:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWI1J-0000kc-6y
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 15:01:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb86fb83-3c45-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 17:01:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GV1PR04MB9516.eurprd04.prod.outlook.com (2603:10a6:150:29::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 15:00:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 15:00:37 +0000
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
X-Inumbo-ID: bb86fb83-3c45-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bu/ZseUm+1s2Qdak7go5J00W038qU6qtl/AOGJkUkjVRboBnw7FF6OEuF5YzBPBFBzomTEis+i9OK1pdzHw0TGmHmMn7Rw354ohPEny7VPpNVFLtXqjpyr6Iw8RgboCZfQQu6htPHLhhbpQ7ZWcyyU6S7EnRlA6ife3rqyWMZY6xr4Whiex/TcXvA0o648+wZVd1nhbUbUFqArEhRen2ljm1/f+QwyredHWPwm2KB53ztgeNtWtalDQLeqTZvQT3QboyA1ttBh/NmOvFWfz/ZHLe90fo3NDMmZ2TmxOFTpOCoBbAYExa7Bh2MWJP7kw7ATC4hZTtGp8yomXN+15x6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpnqXi8rpyW0Hb23+J2eE8dJT2/LcPx8FBUMRcIjchE=;
 b=g2Xumkdq3TZAT2/1lMPJAy63fd+pUpnC7JgaxRDzgwiLZZgm/O3ojD7SVEI9q5+/jBQT1GZgpAL32WCFZefer4UbRbksSgmgyewyaoiV1O7mMMnPQZxfxQGJJUWCxmBpHhlgEG0lOSliOVGjd3RbQ7pOJdu+dv/n7WT11lMhS9qrZ1yNN65xRbw9IvIjLTTozCo/EaHEvZ/RTCT+AfXO3eOKeqnOI5uuIM1h+9G7vEb3DfE5VeKYixt8JR2Y10I1Pn5Cyxyj8bR1yJUw+RxMYxJIP5xDS/B8AYcUTycE5xsUPNhLRXsRcWg8zEOkqsbRsImAAFu2RAhZKHAqZKWOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpnqXi8rpyW0Hb23+J2eE8dJT2/LcPx8FBUMRcIjchE=;
 b=d1ql/Phvpbt2sXTQLq7O28e8iDRVD8zgtGWF4TIbMD7lRWYd87CJi8yLgpyUQ61Srk9ipvM0QnOIZf6RWKC4IVySTG4+o+28jYeBY3FnV2FGhpPqBHMcSxJteZWSCEk+u0EBzV0+yjcf7E5n9Di8k9hjtN/pjywrj0y04PF38Bs9IL6ptxNU0gWWWAQld9KNayi7UY1XN218tITeGFineXgS9/ccBgHzTvJHpH2jKdR1V3Oh/9nujgcSVv6tEbeSPl1KsDXC9UQRZA2s7ZKcxUTGS2S6WAddqwyBKigKUqyNDKbAwULBJvuAbqbWFz0rEgpirRgr6LeUqpMBZFoU0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f53bdb4-73be-9545-f93a-0bb6af2cdbde@suse.com>
Date: Wed, 16 Aug 2023 17:00:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 07/11] xen: address MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <7f8cbd8c8ad64cd3a0d099f31cb4d3fad48aa63b.1690985045.git.nicola.vetrini@bugseng.com>
 <e2d71138-e714-3c19-d5b9-94b322a47191@suse.com>
 <alpine.DEB.2.22.394.2308031648340.2127516@ubuntu-linux-20-04-desktop>
 <3a6ab847-fd31-60e4-2558-feed71d670dd@suse.com>
 <b0581f49ac01c923809c0e15c1a1dfed@bugseng.com>
 <6e1dbf093687e5fa66295621ce67e4dc@bugseng.com>
 <2b26baf0-6a82-0bff-99b5-ade067e0d74d@suse.com>
 <c9197dca7802b08765c0b2b6800e548c@bugseng.com>
 <e7e2eef0-5f88-e10e-81e3-57931f22f76a@suse.com>
 <25f65f8cf633d72dc2f829fa9cd74f08@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <25f65f8cf633d72dc2f829fa9cd74f08@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GV1PR04MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: 37835549-8086-4e9e-c594-08db9e698cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MumEOWCWRcCE4uDEGHkvmusHIrXGEPJa0fCkQx1fidMAV0XXxcWYaTlaL1ep8WxgRbwVzdRhS7Y94GhDIIPj8Q27CpK/ceSMlfPE/6xXCima1gWmoFZErzv/c1/CK5aEhEWfFCAgroUdr4Mspoqw2GVEojqptMlGw4zJnXuaCOrW9mjw62okyhEZf9QkxBCCCS7wNCmDAq8eGOLGnOk06eTHcyrmERkyxIAdmspY0SupMSPFurOfBmUTQrcWUNZfqFyaDJz3VVp8Tkp7uLvt0DEzXGgLLZWEYE7uxZSZR0DTM5AvfxKEjYqQTdp4A8m+QA9yWr8pwHiqi0Noe8BsObV71ngP8JslJkDOcu2GNHqtKqt8QqtQXor1VUvKlf2Gz9IsSYAGr4Ha5qo/i2sRhutFITJxIdBM8ZfjvFj/78JU5aPe/kxnRqbB4ITkrsG8tJfz4TFW06drFa3d606w0KpljHB94Ps19UQzCUxb9HfdW3o15bhTBrXyBuWZYA6IPzJSWa3B3+J7q7jrXX1plXVACAwO52AJBPIGkdpl5FVKWBF5zWuReVbO+c4r+VbZzdKBw/hmK+Cgb/CCAYL9fOSwMs2i2RS4+yzWTE0smf0drHqUuk6tUxFzfKgpSzw2NpFzpYh+qu8oZLM21IEa8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(54906003)(6916009)(66946007)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(7416002)(86362001)(31696002)(6512007)(53546011)(6506007)(36756003)(6666004)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFRDZUlKeEtCU2ZVN3F0b1E3eDBDZXVPOVkxQnMzUGtaOTB0Qk5uUDZLK3VG?=
 =?utf-8?B?S3lpeXZxYWxSZEUrRi9WN1lYcTkwRTJJZDRSZ3g5SU1pSzdWU0lXTkJYU0FG?=
 =?utf-8?B?Tmpwa09DMHR2eEdRT3JXRGQ4RkhmYldyUW9hVWVlOEZLMUFWaGxIcTd0NHp5?=
 =?utf-8?B?N01ucXBwY3BzT1l3Q3BwK2U4aWFCMzhCVVcyTlZPR1prbnlJOXowMTZXdkVm?=
 =?utf-8?B?WTBsTUIvUzBod2ZHUW54U1YwTWVxS0pKNW9ncksxdVZsWlduUUl2Mnpxc3N2?=
 =?utf-8?B?dmJBN0lIdkNjRlBjd2FWbHpyUTRRaGRvWFZ0S2ttbnlKMTc0Y2hEN1k0MmZQ?=
 =?utf-8?B?b3dOeUhCaU9ONGZDR3p5ZktpTElTRmxYQSttY2hqdExpTytKUVY3TU5pQmdu?=
 =?utf-8?B?WnVXZkpGazRleVVEVytoQm9lSUhPaTBHcVBvUzFqSC9HVWNteUgxRzd3MVFK?=
 =?utf-8?B?N2FHa20vaFhoK0lpYzlXaWtuZkhEZ3lLWkNRNGlhb3dqSC9GWVBCa3JMenIr?=
 =?utf-8?B?Y1l5YlhzWkJRZlBCUzZMVjRhVTVtVDl2aTFtK0o5M2VLZWh2SllDU05rd21N?=
 =?utf-8?B?U0w4WTJhNkh0MFpCZ3lLOEJFUW5OdFpmcTZiVUdkT2d3SFd4NnZXcG1oeEZD?=
 =?utf-8?B?S21XTFB1TEZtMFhSMmNsb0JPOWVzTFBmZFN4dUpKL1lyTWtmYk1tS3Y4elA3?=
 =?utf-8?B?cVFsVzFEMHBrRkhBeUp1ZHZkZUFubWR2cVdBajUrSjVocDUySEtQV0QvNFZS?=
 =?utf-8?B?TXhtQSs2TmVyMVlSSEFPR2lvNjBhYktBYkRMMGFoaThoSFhrSlZqQnZacm5p?=
 =?utf-8?B?TlNsQnRKd3lueCtBSTlVQlFEVFgxYzdmVzRELytHRXQxQ0ZJSWgzVjUrWmxa?=
 =?utf-8?B?OStBcTRVMkxpaHlKQTRKN0orM0FML2RENXc3b1ZXN2hOTmtONk9obnZ4eUN4?=
 =?utf-8?B?bDlTWW5TWGI5UElDL0g0bUdDZjRhbE40NWxtYmtMTVFKUkR1dUhYL0Q2Vk16?=
 =?utf-8?B?NTR0bXJCYXJUNkxweUlLS2hNb2x2Q2JEVmhnN3JRcldNSmQ5REF1eGlrOVQ3?=
 =?utf-8?B?NmVGM3VETUVXcFArS3Myems1NnB2SU9pZVlPY1ErOEFDaG9yUFpUQUNNVkpu?=
 =?utf-8?B?ODdtclNiMGxudXp5K0ZWQThUVjRQNHlDeS9PL3ROS3I1K0Q5U1locTNyZVhZ?=
 =?utf-8?B?dGZqWUZkSDJ5djJPMTUyS3BCUUpJWWk0MGs5bHh5a1pUcmJRZUxwTzNCZmQ4?=
 =?utf-8?B?RUtwN3BsdVlEMWdWeEtPSFc2cXJsMm5sV2N5NzVOYy8zUDJrQWppaTNIQjY4?=
 =?utf-8?B?OEdDVm9ucnN6WUpUbFhwVUNvYXJBZkxPTGFlbTZjSXFWZmlUVlIwd1Uwemlw?=
 =?utf-8?B?TmgvZm0xQU9ycjRMYm1GSUNhSjJneUpxS0MrZE83UEUxQm9BalB5WklsUGlL?=
 =?utf-8?B?TEZvYklmSjJPMkRaU2dYekpLbTNnVVh6QXNGS0dqRWN3V0JrVkdjRGZZdHBN?=
 =?utf-8?B?dk5zTWNkcVFOZlNOZGlSOW1raEcvWjFDd2pqak5FbVZ3bFJnNkg3SGQzWUla?=
 =?utf-8?B?bE1xdSthNllHYkE3b2hFdnlXUVVIRUVNazN5TENCTXJRN1VxZjJoQmQvS2M3?=
 =?utf-8?B?cXptT3VaZUpmQVprREgrQ05xei9aalBFRmxnSTBzc0NzMjQrOHpsbDVUUlRm?=
 =?utf-8?B?USt4U3RLT0lRV0MzY0FMZmNEUllQZUU4T21sK3dQb0FnRmhxTDZBMlJOaGFQ?=
 =?utf-8?B?SzlNZkI5c3NTK0JZUmp5M3lQV0xqWkpPeUlIM3MxdlMrZWtscHM4SkdaWSta?=
 =?utf-8?B?Q3NVRXVWQXo1cm1HSjU0V2YzcHFVK1RsRmVKRFh6WjBQcnZiSUR6aTIzamxl?=
 =?utf-8?B?ZWYzMWpKYW9vRC9kVjhrdWF4UkJURVFuMGV6MTdOaW12VW9teFU4S2J5MGZp?=
 =?utf-8?B?VEVHbWw2Ym1tY08rQUR1c3JNcktjaWNOSHZ0ZWFuR0JyWVI4TEZLOUxFME81?=
 =?utf-8?B?S3RIUXJTVXM5b3dreFdqR2UraUhOWmVkWUdTMm9SREo0a1F2cnRDOEJiSnk0?=
 =?utf-8?B?N3dTQmFvdkc4V0RmTStUK1I0d0xacXlxQTdMaHFVQnVOMStGZGczSjAwUVFH?=
 =?utf-8?Q?orp+BEdiH3CIt4TmW/UA5X99/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37835549-8086-4e9e-c594-08db9e698cb3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 15:00:37.4098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SL7uyqCcki1Mvk17QkQjYSLx0FCJnLSjZZK1B40EEz2M0gtC7aFhGaI9f40Bf5++RB66TlZ3oKtblFcc7zIrxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9516

On 16.08.2023 15:43, Nicola Vetrini wrote:
> On 16/08/2023 13:23, Jan Beulich wrote:
>> On 16.08.2023 12:47, Nicola Vetrini wrote:
>>> On 16/08/2023 12:31, Jan Beulich wrote:
>>>> On 16.08.2023 12:01, Nicola Vetrini wrote:
>>>>> On 08/08/2023 11:03, Nicola Vetrini wrote:
>>>>>> On 04/08/2023 08:42, Jan Beulich wrote:
>>>>>>> On 04.08.2023 01:50, Stefano Stabellini wrote:
>>>>>>>> On Thu, 3 Aug 2023, Jan Beulich wrote:
>>>>>>>>> On 02.08.2023 16:38, Nicola Vetrini wrote:
>>>>>>>>>> Rule 2.1 states: "A project shall not contain unreachable 
>>>>>>>>>> code".
>>>>>>>>>>
>>>>>>>>>> The functions
>>>>>>>>>> - machine_halt
>>>>>>>>>> - maybe_reboot
>>>>>>>>>> - machine_restart
>>>>>>>>>> are not supposed to return, hence the following break statement
>>>>>>>>>> is marked as intentionally unreachable with the
>>>>>>>>>> ASSERT_UNREACHABLE()
>>>>>>>>>> macro to justify the violation of the rule.
>>>>>>>>>
>>>>>>>>> During the discussion it was mentioned that this won't help with
>>>>>>>>> release builds, where right now ASSERT_UNREACHABLE() expands to
>>>>>>>>> effectively nothing. You want to clarify here how release builds
>>>>>>>>> are to be taken care of, as those are what eventual 
>>>>>>>>> certification
>>>>>>>>> will be run against.
>>>>>>>>
>>>>>>>> Something along these lines:
>>>>>>>>
>>>>>>>> ASSERT_UNREACHABLE(), not only is used in non-release builds to
>>>>>>>> actually
>>>>>>>> assert and detect errors, but it is also used as a marker to tag
>>>>>>>> unreachable code. In release builds ASSERT_UNREACHABLE() doesn't
>>>>>>>> resolve
>>>>>>>> into an assert, but retains its role of a code marker.
>>>>>>>>
>>>>>>>> Does it work?
>>>>>>>
>>>>>>> Well, it states what is happening, but I'm not convinced it
>>>>>>> satisfies
>>>>>>> rule 2.1. There's then still code there which isn't reachable, and
>>>>>>> which a scanner will spot and report.
>>>>>>
>>>>>> It's not clear to me whether you dislike the patch itself or the
>>>>>> commit
>>>>>> message. If it's the latter, how about:
>>>>>> "ASSERT_UNREACHABLE() is used as a marker for intentionally
>>>>>> unreachable code, which
>>>>>> constitutes a motivated deviation from Rule 2.1. Additionally, in
>>>>>> non-release
>>>>>> builds, this macro performs a failing assertion to detect errors."
>>>>>
>>>>> Any feedback on this (with one edit: s/a failing assertion/an
>>>>> assertion/)
>>>>
>>>> The patch here is kind of okay, but I'm afraid I view my earlier
>>>> question
>>>> as not addressed: How will the proposed change prevent the scanner 
>>>> from
>>>> spotting issues here in release builds? Just stating in the 
>>>> description
>>>> that there's a deviation is not going to help that.
>>>
>>> There is a deviation already in place. At the moment it just ignores
>>> anything below an unreachable ASSERT_UNREACHABLE(), no matter what 
>>> that
>>> macro will expand to.
>>
>> What do you mean by "in place"? docs/misra/ has nothing, afaics. And
>> automation/eclair_analysis/ECLAIR/deviations.ecl is merely filtering
>> things out of reports, aiui. (Plus of course there should be a single
>> central place where all deviations are recorded, imo.)
> 
> The second statement is not quite correct, as some of the configurations 
> instruct the
> checker how to behave.

Well, I was referring to the one setting relevant here, and I added "aiui"
to indicate that I may be misreading what that file specifies.

Jan

