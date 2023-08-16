Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E414477E037
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 13:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584730.915527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWEcj-0007i6-8p; Wed, 16 Aug 2023 11:23:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584730.915527; Wed, 16 Aug 2023 11:23:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWEcj-0007fS-5u; Wed, 16 Aug 2023 11:23:37 +0000
Received: by outflank-mailman (input) for mailman id 584730;
 Wed, 16 Aug 2023 11:23:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWEch-0007fK-39
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 11:23:35 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 559e41c8-3c27-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 13:23:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9329.eurprd04.prod.outlook.com (2603:10a6:10:36f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 11:23:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 11:23:29 +0000
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
X-Inumbo-ID: 559e41c8-3c27-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2OC2OzIOC2WNZd1QBTt3ntAZYS1wEvjFOT57/xjoOZyykojjONfLKvQMrkKGYXf6MMBPjBwtPbZxKIWnB6/WWeNJaHFwwaH7PkMP3JL9WpNWIUeTo2YT5ZFm6W/3EEJfixRQ70Of4EEF3GdD616mOVcCp8PjjASDigtwzrkVl3FA02J0bcObm3J//bST4q2yrgVRHvjfpfsvEYgciZWcPPEIudCQYIJxqVlvLmHs4G5snHeKEcXusK6lqO2tSWDXyxAvoHFXDy6tSWNqET/cERL6rSEXVLPLWY0nnA/SZr3+xZUU6wKqRHU7/RrunuOv+d2cLXHAz147JgWOEyr8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kPPCcdUEu9hgV88CEkxLunUQiAmnwr3RBjoILOmP7Y=;
 b=Uv8QlWvLi9PmTGIkktDgB22dlLHL4LHyMXxk7hi67mPWkUT528PgDYg3KIhT/28pTPKbXTQADyTF5IrPId4zebl+yxuWY4ncVEuF1ASMLRc6YWfBcwOXcN5DxK6xAMOyhjNNGniEvOOTMQgeF5hbRL4k7wczC8deIwwruGdS2DGQerpq1ikf1uVnv9ub6Dmu3qSXPuJjSLYpEpKc47z7aRK68Yh8HYwY4/td/no+xL3+RxGnOHyBMlR5Qm+rlh5dgO5zrbFbnsteXgSPdYWQ/pjmyupTFhPuSvLaNHhH7Niqsp9fdWBWc/2Q1WhAOG/J0YTTyy3YukLMjL/btecR3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kPPCcdUEu9hgV88CEkxLunUQiAmnwr3RBjoILOmP7Y=;
 b=jqGHto0jGGZ8oqtyy0MZx2K0HSuazsdZNXl6q+Jv9KnVMXKUJwe/k4cKDHZ0qZX6LW3TkFUYt26ZbGGzrLBl84uytxkIS/yLaS6yqmD1rdAMIoRk3OHZJOSmmBHeir+alZtJY1uxp3vNHyn8H/GEOkNtHIH/Bst97AmfumV2TyH5enaHhNE7Nq+Ys5SBug19F9tj4wjGmTbHPF9mL/x1wVBSUBHLzlVDkaYhSgIfee2VKburXhRKc7yXH4XEJ5ZznTp49i7cojOBnyrHCElBcdUxMQU3Meuw2mpa4kbFBoYY+U4Fw4b2QSloJy1gTV/J4CVfS5XdV0sYEss5zYOiyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e7e2eef0-5f88-e10e-81e3-57931f22f76a@suse.com>
Date: Wed, 16 Aug 2023 13:23:26 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c9197dca7802b08765c0b2b6800e548c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9329:EE_
X-MS-Office365-Filtering-Correlation-Id: 672493af-0673-45ec-5f6e-08db9e4b374c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hcw5JIWaT3fpFqSOGRNA2N4LJsTWhbwpsXNG1pmZC+oGShXFkRtmlqvj/NV0/vtUaqPKsXpt30hcHNb8qr/ee2FZRqPcUFnoDpw/qcHO1L23iVvsQUGpsu7OISieliZ8xfX+M4iroOVVoEQunN3+VgSXaatfT789ecP1t4JTc3B0qb5Ja98XAfJQtwod1uK1eItmiQmUIA3N6bcAXixKjXXlpRbrGpCVAvhdcySUvXY93WCn4nyFIIj8GcSqpsyAAxeMn67Ze/g16ndl8GneEnnhU2741lDdnikRdrIgbHQyv8k0LMvjEi1+byCxgkfnXeTRuabwJlDZzl4av7Sb7R8JSWlCzl6wy7I3wRoBsgvtC78oS+1LziJ0zFvUXt9k8hee/7BlRXiIsziIdGFioxQnq7MOZI+FFa8VV4ayz74wvG4AP1ZDLIebg2wra2n7zMf2+0JPEf1w1Ua/LrUFV9y3oYIsA+YOSRG36qixy/awjpsh6DbNjPDM1D1IJtSOSUKpMRMLGI8QcsDlAmDyDYWYqMUXlZ8byynS6u2m8ec0Ep8uqnErUWNZ7b2OuNfxQG/RUTkksEItHvmoZy5MMmPjvY968UV9jOGbhCNNk6WoXB6AuZmyZtzSzby8Xy4v8D1nzefbA5zjnuSx2WkhVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(1800799009)(451199024)(186009)(316002)(54906003)(6916009)(66946007)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(7416002)(86362001)(6512007)(53546011)(31696002)(6506007)(36756003)(6666004)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlR0dURKTXlXK2RHRTVESlRvclZ5UExEeVNQalgrOExuS2ZuKzNpRzBvRjVO?=
 =?utf-8?B?OHVIVEMyL3l3NmNHUG5WeEU5ejliVHZLWE9qYStjKzJhVUUyYVh0SG5lNnJP?=
 =?utf-8?B?T3hIOUtwdUx0bHRSN0I5Z1p0dDNYWDJHb1VwYUhDa2dNRFVGeGdIK3NydW96?=
 =?utf-8?B?Ti82MSsrWFRlQXprWGtDQjVJbEVueVpoMlAyMmtiV094aWlyQVhFdXZBeVZw?=
 =?utf-8?B?My9qZmJ6eW9UNkZnN0o5ck92a3M3QTQ3TDd4MDM3T2FwQ1YzQ0ZmMU0xV09u?=
 =?utf-8?B?UCt0eGtqMXR5eDh0NW0zMGlvckJaUjhsa2Y3VmFKYjI5anN3b0VTR1R4eDhl?=
 =?utf-8?B?SW4zaVp3L0Ixc2lYT0ZsL0FhREp2clM0Q2xRYlJSKzVXNnRBN3NDeEdmUmRP?=
 =?utf-8?B?M2h0YkZnS2lYVFZ5MEhVc2NzQWdqUjAyQ2RPYW9CV3p5Q1pqdzY1czN3cHRV?=
 =?utf-8?B?clJrRjBoaWNNUXNEMU5BYWQ3cUdpVWd2TTZNTWJaWmU1Y1M1bEVBS2V4bHpO?=
 =?utf-8?B?NnpJbHI0elZWcTBObUxPbXo2QXdIMTY2VkswcHRJanBqWWZzancxbjZERGFj?=
 =?utf-8?B?NFdxbU04MFV3LzVKTXlmcmNIUktrTzVIdElrdVkxeW1wcXFWU0JOMWZGVDlo?=
 =?utf-8?B?TFVIR3ZkU09tQ0kwRm16TWdXb2Z6NG5KNndtWnRzUUlKQUY4dmxwOVZlelY4?=
 =?utf-8?B?OHBCYXY0dTNkWUFqbjlwS2ZMTThncWRkaVR4cjA2VmhoMnQ2T1krejBOV0Vj?=
 =?utf-8?B?SndMVXZkTEgwNXNQN1pKS2ZaZE1LYWltRXIrQTZ1VG01TzhNZTB0b2lyMllj?=
 =?utf-8?B?UmFPQWU2T0hmbzNTZUlvZ3IwU2t0dTEyQTBaSTVpOFZIbVJpcnJiNFdNS2Zi?=
 =?utf-8?B?UlkzaU5tUUlHVExPRmVIeE5sT2RtRUh1UWlxSXRrWnlCUkNwdU9jS0pDS1Nh?=
 =?utf-8?B?VEY1aWZnYktXeVB6Y3BQK3ZSbCtWNXM1cGNIdVJETGtHTi9kM2EwMFU4aU55?=
 =?utf-8?B?Ym1sYmkzUlJKUmhvb0pNWFdSMHRiRXFiQ3RLczFVT2F6cXlObWUxK09xYmpV?=
 =?utf-8?B?M3Rra3dtQVhhSXlxd2UrZUxrdlJZOHlsMW5qMjdTclJucVlZMjhQak9sM0RP?=
 =?utf-8?B?eTJQUmM2Q0RUNlhuOElER1luaUk0OGl3SCtjaTBFWmp5YUd4RHMyZURlRGk5?=
 =?utf-8?B?bTU0U2djUG5jelNmV3dvTWZsVGppa2dJZHZmM0R3bFZLZ3dzdUVtQVRrUWNW?=
 =?utf-8?B?UWs4MjY2ZERDOHoxR1RRRzlKaWt3a3ZRbUIwOVhPbG12aHZMeS9Oc1pTU0tR?=
 =?utf-8?B?NDdKekdZaERDVjVrV0d5djZhdS9HUmhHVlRieUNNRHV5M2RQcmNhTWIvanFO?=
 =?utf-8?B?OEZ1dEV3eVlTWTdYd3FVQ05LK1Y4Zm1yTWZNSjZLdXd2VnB4YjJ3c3ZUT1Az?=
 =?utf-8?B?bnZzMzlxYVFzSVZueXYxeGM3UnN1M2g0WjFYdkF1ak1lM3QwYWpnd2lqZy85?=
 =?utf-8?B?VERNLy9xM01UQ3pNY2xISXppUWZrZUdTdVA3RmozeHFTZk5iZWE3TWFXL2NV?=
 =?utf-8?B?Q2RQN2xMSHlrMkdwMVM2bnNrYUN0TThXWUlvaXVLd21sc0o3ZjhJVGlYbWt3?=
 =?utf-8?B?TnhieXdnR3grNE5GbjJQbUhxM3kyNzNNZnk4eGh4NnhnUDRibzlIekxSYUJT?=
 =?utf-8?B?bk5odjgvVWo0V0M3YnZmMkZnaUtCbjcrWkhGZTgvMFRZS2d0QjM3MmN1V1RP?=
 =?utf-8?B?M3hvYWpENW9yckpNRUg0anR2OFY1U2wxZkZpRVRibVdCMkQ0V3NQNmNiYjJz?=
 =?utf-8?B?dE93V2NNejdiazFzN2lndzJnVHJ1T1ZoMk1uZVBIaUlLd2FjWlhtNk9rZ2ht?=
 =?utf-8?B?TStHRGpJRW5hRldQNmllWlBlV2FzMElNK3h4WTQ1THVSOFVOcFN2QzVRbm9Z?=
 =?utf-8?B?WXlSUE5ZdW04dWlTWTVWeWlkeGFyaWxoeXNXNFBESEgrcnQyR2p6RkVWYldM?=
 =?utf-8?B?NlRQRWxGc0hVd0pDcGtJZHVJNDNPWHBKb05LSmtRTG1kWEtkOGpFSXdCb1FF?=
 =?utf-8?B?TDVaUklIaVFsVUtLUmdPblpSTDExRXdtSXZZeE5BMVRYcm5oVS9DakVLY21r?=
 =?utf-8?Q?D9PL1gLH4EDkfq36/kTxC8jV8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 672493af-0673-45ec-5f6e-08db9e4b374c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 11:23:29.2421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTYAMv/oLz10BDmgSTu9VLCeMeXEFFTf5Dr1FoOh9O0t8AA5yOcY31vHFK9jcFxsqHTsfH/WN+bdzmDJRJ/jpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9329

On 16.08.2023 12:47, Nicola Vetrini wrote:
> On 16/08/2023 12:31, Jan Beulich wrote:
>> On 16.08.2023 12:01, Nicola Vetrini wrote:
>>> On 08/08/2023 11:03, Nicola Vetrini wrote:
>>>> On 04/08/2023 08:42, Jan Beulich wrote:
>>>>> On 04.08.2023 01:50, Stefano Stabellini wrote:
>>>>>> On Thu, 3 Aug 2023, Jan Beulich wrote:
>>>>>>> On 02.08.2023 16:38, Nicola Vetrini wrote:
>>>>>>>> Rule 2.1 states: "A project shall not contain unreachable code".
>>>>>>>>
>>>>>>>> The functions
>>>>>>>> - machine_halt
>>>>>>>> - maybe_reboot
>>>>>>>> - machine_restart
>>>>>>>> are not supposed to return, hence the following break statement
>>>>>>>> is marked as intentionally unreachable with the
>>>>>>>> ASSERT_UNREACHABLE()
>>>>>>>> macro to justify the violation of the rule.
>>>>>>>
>>>>>>> During the discussion it was mentioned that this won't help with
>>>>>>> release builds, where right now ASSERT_UNREACHABLE() expands to
>>>>>>> effectively nothing. You want to clarify here how release builds
>>>>>>> are to be taken care of, as those are what eventual certification
>>>>>>> will be run against.
>>>>>>
>>>>>> Something along these lines:
>>>>>>
>>>>>> ASSERT_UNREACHABLE(), not only is used in non-release builds to
>>>>>> actually
>>>>>> assert and detect errors, but it is also used as a marker to tag
>>>>>> unreachable code. In release builds ASSERT_UNREACHABLE() doesn't
>>>>>> resolve
>>>>>> into an assert, but retains its role of a code marker.
>>>>>>
>>>>>> Does it work?
>>>>>
>>>>> Well, it states what is happening, but I'm not convinced it 
>>>>> satisfies
>>>>> rule 2.1. There's then still code there which isn't reachable, and
>>>>> which a scanner will spot and report.
>>>>
>>>> It's not clear to me whether you dislike the patch itself or the 
>>>> commit
>>>> message. If it's the latter, how about:
>>>> "ASSERT_UNREACHABLE() is used as a marker for intentionally
>>>> unreachable code, which
>>>> constitutes a motivated deviation from Rule 2.1. Additionally, in
>>>> non-release
>>>> builds, this macro performs a failing assertion to detect errors."
>>>
>>> Any feedback on this (with one edit: s/a failing assertion/an
>>> assertion/)
>>
>> The patch here is kind of okay, but I'm afraid I view my earlier 
>> question
>> as not addressed: How will the proposed change prevent the scanner from
>> spotting issues here in release builds? Just stating in the description
>> that there's a deviation is not going to help that.
> 
> There is a deviation already in place. At the moment it just ignores 
> anything below an unreachable ASSERT_UNREACHABLE(), no matter what that 
> macro will expand to.

What do you mean by "in place"? docs/misra/ has nothing, afaics. And
automation/eclair_analysis/ECLAIR/deviations.ecl is merely filtering
things out of reports, aiui. (Plus of course there should be a single
central place where all deviations are recorded, imo.)

Jan

