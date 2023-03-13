Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9036B7625
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 12:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509239.784629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbgW9-0003dU-BX; Mon, 13 Mar 2023 11:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509239.784629; Mon, 13 Mar 2023 11:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbgW9-0003bO-7B; Mon, 13 Mar 2023 11:39:05 +0000
Received: by outflank-mailman (input) for mailman id 509239;
 Mon, 13 Mar 2023 11:39:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbgW8-0003bI-4d
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 11:39:04 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1df1c044-c192-11ed-b43a-930f4c7d94ae;
 Mon, 13 Mar 2023 12:28:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7212.eurprd04.prod.outlook.com (2603:10a6:102:8c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Mon, 13 Mar
 2023 11:38:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 11:38:57 +0000
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
X-Inumbo-ID: 1df1c044-c192-11ed-b43a-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fn5T/IJEElAG6DOLX+0+W0j7Xl6rzs7nHcz9qWFFhehizUipiij4od7gvAYr6fMwKBkL0JkUZnZagWYwgI2vEEPqTc+DH0ZP0iD67MVtu6MSOCMLlZa0/LP+Q0cINDD0D6CYFTSrUz2m64u1K0s5mkSCyE/Uh3qOYMJ6X2c6kWiG6LTxDptvDXl0Gmu/L9MxwLpUQKr/QTSJ5ZbK5c61psyx2BftiVVMPW6cUT85i+l7PnHT0OOt9yv863hXz/6NpX3Wfc7T367XZdl5dshoEUU5on3H0U/g/RnYgyi3M1PGZpECEm2Rs8gBpkzRF5nAu29bOX6QDcAqUpks/R7BMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=di2gzvbSBReX9UVKYsx0Xdku77bc9j1xXErYlUinvTM=;
 b=eEa1ugIJwqnCNwK8i214Bgl2zFCM6FVlM8ogTSTCrTyYGM+/W/s/JFfn8nFVTn7WIxqqbhDWx5r1jAtAs7q31gC/E2V7KvoT+6VuSHq61c+VMD0dGkLRoLWXh9AJt0lMuffPi3VbfFuh7/EdwJhoP7whSQxb/St35I2nHeW+/LS97R9dzEFeojO+WRkmLRR0i1hGMDEWtoGnPUj9Ik182I9uSwpD9frDwQBBcnA6t0+C2OOoBUBrKaaHUZMenEYqGNiJFv6VeX7raHwCKJrO2ziP5dbc7peT2gzqNIO3d4ApaoGsthBJCKy4UUhHwtteLToCJAePajnq0qSvrmF4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=di2gzvbSBReX9UVKYsx0Xdku77bc9j1xXErYlUinvTM=;
 b=OlnLMPTHlMQ2KpYxslDKT7lt5KGjxQfGgmrmTx0wZe3SSTGqWeUamkkxTw5zM140nLkciE2VEho9X8xJEZTCmd63TDpdsWLsE0WBW2LGCVlEil1crgIaW7ZW8MN66kq0AmqcuLbLVSeWfvBDBxBrKL+y96+3xt6MbUyPsYLucvh025hMf86IfOtcfELv2XzmvuyK+4hj52QkMgeVpjOJpJMjuVwGpPUFqMnQsz72SdlPhnVgazoDO/BWXM6AIivFUZcR4WIixbFICwA5xyIEEjJjAOXX0BHcKZvZelGOUJ4xZuXJoZ0Qc29QkSe3hh08SqSW+An0N/q1SRo6b9Ksdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8469b5e6-081c-6af8-3611-85cd857bc974@suse.com>
Date: Mon, 13 Mar 2023 12:38:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] tests/vpci: install test
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: andrew.cooper3@citrix.com, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230309165812.33918-1-roger.pau@citrix.com>
 <f2c7a5db-80d3-a89b-dff5-250eb18bec14@suse.com>
 <ZAsyxw6VvQHYrksG@Air-de-Roger>
 <29c3e26e-e6b2-1b2f-b442-d468d8abb505@suse.com>
 <ZA77aJM7/6dhu5F1@Air-de-Roger>
 <9833177f-9dbc-4f19-a892-14b63629a91c@suse.com>
 <ZA8FuNP8A3lPxSMr@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZA8FuNP8A3lPxSMr@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PR3PR04MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: ed26ddf8-39b2-433d-5aed-08db23b7884d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kkkV66hJpFkGf6cy6HjF62Qooq7A5J9UWIEIIqC39rvouWhf4iSCLvdb96/WdWfq+xYXQtmhAEDQuMo3lWYAlNpg8n1i89rK/t/p6MDLBISiW6e2RFEA5lyzzpZ8GQ/1Dl2J3TH3Jy80wnMtEI0ruQsCJSGHMaEdDKRxRlwC6AAXTCQgKd8TNdyDjEluTMrDmMWlzbI4TlcCBTvuXe5ur2qEX14hN/fiOT7Bzb9zpJfO2udMQisz93gd9wEQGbJmFd4ge6jtTWMoGq/BWIAONS2a5tnmjRR7ozM9vjnbdIiGBvi72PEPlDER/8GEaF027LmuQyfn7JRfxLUB7Bic8b9GX03ZGCT3fgMWu7T/9vhHl6hlPhL2drhUHpYdgHC1FQs6QLcCgcwfwZASs3PDR/qH2fsferoXo//0s9t04DafQCYBGNQV+TrcSBDYrkxecRU8q4yWQOG8oTbyX+Q5NG7tjo0s27Qgrjk1wUMdNdhiVB3WNr4ajYMnXLPaZV4Jy9I/OtNSgaHqXL2flbpWmdXPtInep2az65GBRErQQhTobVfAFfKR4gpSmRC1yNNm8TckUWZRVr4F93/2Mo6aiOpkwdfgCvgrfQzTtpZ+FnGtmxP0mG2MVZi8gGwMjN3D9A9pjZoHt36V+dJMfZAlknZ+vqRdpw9qbu0IiArRfEZk5yIwP0MFTGMLwjz2ifI5f7VJn3W6KB3hnH9WiGqocWQVK3BllTeVMcresM4VTo8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199018)(36756003)(83380400001)(186003)(53546011)(41300700001)(478600001)(6486002)(2906002)(6512007)(26005)(2616005)(86362001)(6916009)(66556008)(66946007)(4326008)(5660300002)(8936002)(31696002)(8676002)(66476007)(6506007)(38100700002)(54906003)(316002)(66899018)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFgwTk0yUWtlSE5Ock44dWRnTVVHTHhFL0wvVnpkNlZRUXNUUC9aWDFHMWh4?=
 =?utf-8?B?WGlwTitLWm9Hc0FnQUVvSDJYNkR1OXhJTkhVOE1oKzlTU3M3ZVRPeTBXUHQw?=
 =?utf-8?B?N2p0TTZCdHlWRXhJRnNmZllJTXRNR3ZKbE5KMmlTS1I1aVRnSStvMkhIbXVJ?=
 =?utf-8?B?dHEyT2dlRVFnb1RmT2tJblRGUXBFNEp1R1A1b1Y0a0RMV2wxRkY2T01HZCtn?=
 =?utf-8?B?MEVxQXRyZkFlejJ6T2RRZmtJQlJ2VkVvWnRIL1ZyT3pEMjBVV1FHSHpGTUNj?=
 =?utf-8?B?ZXJnN1MwMStHbGFpaTIzMENhNjlKM255MnFxYWFab2VQRlUrTmc4Nkp6bzhL?=
 =?utf-8?B?Ti9DRWFxNVh3Ti9VOXFYU0ZRcEJ0bUdSNXBhekRsdUhIK3BRUjV4RWdBZGV2?=
 =?utf-8?B?ZHg5c3R5eHRDYzVDbHJvUTBucmdoY3NXOWZIeHNnazdVV0QzdTNHdld4bmxp?=
 =?utf-8?B?dXpWdTJabDRxQzEzMEJ3ZGhubHFFcDJlcjlQaStsck9hYnAvUUFGbGcyY01F?=
 =?utf-8?B?ZDhEYW9RYUVaQithK0M5Y21ZL2NhTFRLMUNLNndGMWRoNUVCVmtaYTFqTFpX?=
 =?utf-8?B?SGpqeHNYbFRQZkdHV0p0djAwTFdRSitvK2MwMXFTWlJUYVZIWnp1QWJDcVVm?=
 =?utf-8?B?SjByUkwxMUluLzNSTWhzeXBRSnlLRDV5Z1dIaGV3cXJFUmZ0MEl6SVVMTWJ4?=
 =?utf-8?B?SlcwTzFIVzE5a3NiY1Rod3doRFJVQ09vSkFmandnUW5KSDVIMDNXRGRXVTFa?=
 =?utf-8?B?dVdEM3NMM2thRENKN0pjK2VXeWE5c21EY2RWYjZjZjVaUVF4WmtGSm5ubURB?=
 =?utf-8?B?NXpKMDdkTEJFL2p2b0RzTEpyb3ZOSHhDdlRvOVJkdTJEc0s5RnplZnBSaE9K?=
 =?utf-8?B?VEtSVG9pWHpmTmJUQnRyaTJ6MklHK0hUSGw3bE1kZkNCbGlzOEtJdTQ4bmtv?=
 =?utf-8?B?Mmd2TEhnVnFDSkkySmJjRTlpRTVqcDJEeGZzL2N5U3VWWi9FM3VSUTR5Rmdn?=
 =?utf-8?B?aXlrQVZEYUVUa3hmNmp2VndvT1U2aWNyMENXb25rbzYwdHN0UXM1cEZjTUVI?=
 =?utf-8?B?SXIrNEh4UTFGYlMwbEZ0eVJlUGYvVFgrYTRQZ0QwLzJYcGRYTE5wS2dxSjhF?=
 =?utf-8?B?elhWRVJFS0ExQy96U3o1eHg4OEdmcWlmdnJiZUV5RXRMajlZOUxBbDFYaEt0?=
 =?utf-8?B?RmpuMlpRZXprbEhqWGkxSjRvYyt6eGNmRGRiQnlzMElTODZyeHdjT1hmZlRw?=
 =?utf-8?B?ZVhteVRMZkpuYk5URXZvR0I0VVFvRktxZTNkNm04UHZPTXZ2MkVXZkFDU3Vk?=
 =?utf-8?B?SC83ejNWZWpzMHRjTW4vaklxS2c2bmtQMG51dHk4M1k4aityN21oZ2YvNHJD?=
 =?utf-8?B?QzBraHJXUWNEWmpSYkxnNDJYSVRxeldzK2xuVXBweU5lai95WHBmd3JjbExo?=
 =?utf-8?B?VkMwZitmVnlET09DT0I2U3pXMHpKejBVdHpLWi9ReUpVQmYzRDliSEREbjlR?=
 =?utf-8?B?N21FR2svRTNUVU5Wc1h2ZkNEOXFORUhvM2VYWmQ0Z0s5LzBncnllbTJhU1BP?=
 =?utf-8?B?Z1ZPNk1PRTlFOXF6RkZaVE1DTzVGWGhGMWhUazZkYVh1cmVsYnVrOVFKYkNz?=
 =?utf-8?B?MlpSSEtxMVd1UmJBajYrQkpxYzVUV05JUkRSd3BST1ZsNDBkMTBzR0p1dGw3?=
 =?utf-8?B?TkxIZHFqM1pJVWJvZUMxODZ4NjFzUGlBNG5hLzk3YXhZMnVYc1B1SmJiOFlY?=
 =?utf-8?B?bmlUNTV1VGkydlZaVU1VVXFDWHY4K2dIMWVNbitrejJmMFdlWHBwNlI3VklI?=
 =?utf-8?B?bW9UWHdvbHIvVFRPYmNJOVZnMkd1b3RMdVpBS0NIMFhqKzZYSXI4Si9LTzZV?=
 =?utf-8?B?cjU1b0pIV1VGSm5lN01FN2ttaFdjRVBJU0UzYTVpQmg0RWRlNnRQYlpTWnlL?=
 =?utf-8?B?cGVKcXNPdjgrVDBLek1MeGJrZzB6UVR3TS9QbkxuTTZtZ3BFWGx2QTR4djh6?=
 =?utf-8?B?cUw0cHV0RHNIOHFJdGZVV3Z2Uk1zV1JhSHhUSDZBSDhDdFBEWmE2bG1aUWhj?=
 =?utf-8?B?c296WForNGk3Nms3OFpCWE9DWEF4enZuZDRkSjkxd1hqM3k3bW42Y2RIZDRJ?=
 =?utf-8?Q?yJ0dDKKKrFlXG56ehlfQJwSO8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed26ddf8-39b2-433d-5aed-08db23b7884d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 11:38:57.7377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cX4hmleR8NPCDU5/7wFzHhykKMPRmn3K4gElnangLr1yu61SbuX+2zXyHRjeA2+b0xWd5z4N0Hz447gtm2oRyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7212

On 13.03.2023 12:15, Roger Pau Monné wrote:
> On Mon, Mar 13, 2023 at 11:43:43AM +0100, Jan Beulich wrote:
>> On 13.03.2023 11:31, Roger Pau Monné wrote:
>>> On Fri, Mar 10, 2023 at 03:32:41PM +0100, Jan Beulich wrote:
>>>> On 10.03.2023 14:38, Roger Pau Monné wrote:
>>>>> On Fri, Mar 10, 2023 at 12:06:29PM +0100, Jan Beulich wrote:
>>>>>> On 09.03.2023 17:58, Roger Pau Monne wrote:
>>>>>>> Introduce an install target, like it's used by other tests.  This
>>>>>>> allows running the test on the installed systems, which is easier than
>>>>>>> running it during the build phase when dealing with automated testing.
>>>>>>> Strictly speaking the vpci test doesn't require to be run on a Xen
>>>>>>> host currently, but that allows easier integration with logic that
>>>>>>> runs the rest of the tests.
>>>>>>
>>>>>> I accept that as a possible way of looking at things, but personally I
>>>>>> remain unconvinced of this model. To me what is installed should be of
>>>>>> value to users. If there was a properly separated directory where all
>>>>>> (and only) tests were put, I might agree with installing. (Nevertheless
>>>>>> this isn't an objection, merely a remark.)
>>>>>>
>>>>>>> While there also adjust the makefile to use $(RM), and rename the
>>>>>>> resulting binary to use a dash instead of an underscore (again to
>>>>>>> match the rest of the tests).
>>>>>>>
>>>>>>> Since the resulting test binary is now part of the distribution CC
>>>>>>> must be used instead of HOSTCC.
>>>>>>
>>>>>> This breaks the run: goal, doesn't it? If the new mode is wanted, I
>>>>>> think the two kinds of binaries (and rules) need separating (maybe a
>>>>>> way can be found to avoid duplicating the rules, which would seem
>>>>>> desirable).
>>>>>
>>>>> The run rule is not hooked up in any of the upper level makefile logic,
>>>>
>>>> What about the run-tests-% goal in the top level Makefile?
>>>
>>> Urg, I wasn't aware of that target.  I assume just removing the `run`
>>> target from the vpci makefile would be an acceptable solution then.
>>
>> I'm afraid I wouldn't view this as acceptable. I would very much like
>> to retain these run: goals, as I view it as important that such tests
>> be possible to run easily and right from the build area. What might be
>> acceptable to me is if ...
>>
>>> It's still the user that needs to explicitly call run-tests-vpci, so
>>> it would better know that HOSTCC == CC before attempting that.
>>
>> ... the run: rune would be enclosed in "ifeq ($(CC),$(HOSTCC))". Yet
>> even that is fragile. For tests like this I view it as secondary to
>> be runnable on the destination architecture, and hence I continue to
>> think that if installing such tests is really wanted, binaries for
>> host and target should be properly separated.
> 
> vpci test is special in this regard when compared to the rest of the
> tests that do make use of the hypercall interface to a degree, and
> hence are not expected to be run from the build host as they require
> to be run from a Xen domain.

Right, which is why I said "for tests like this" (which includes in
particular also the x86 emulator harness).

> I think the benefit of having the test run part of XenRT is greater
> than the downfall of installing a test as part of the distribution.
> 
> I've added a guard to the `run` target in order to check that HOSTCC
> == CC, hope that is enough.

With that at least I won't further object to the change.

Jan

