Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8926B7CA606
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 12:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617443.960008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLAE-0003Ny-L5; Mon, 16 Oct 2023 10:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617443.960008; Mon, 16 Oct 2023 10:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLAE-0003Lr-HV; Mon, 16 Oct 2023 10:49:34 +0000
Received: by outflank-mailman (input) for mailman id 617443;
 Mon, 16 Oct 2023 10:49:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsLAD-0003Ll-O9
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 10:49:33 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af80cc8b-6c11-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 12:49:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6777.eurprd04.prod.outlook.com (2603:10a6:10:11f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 10:49:29 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 10:49:28 +0000
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
X-Inumbo-ID: af80cc8b-6c11-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/EFzjuZpx4qfVEgdJmOZx97aDuXHYLIYYFLdEZnN+o/r+gOUXnl6tRuz7hooelozoJhXDBXVo+5nUvfsyTjtpctRq6UKsCvqIM3Dgodge6A0Z1bBF6FE9AyWb8or4cLj/0vbvmO17ssVZ9cAeMbtJx/1Lousewpi5CYjDjoYbyddVgkEC+/pgoQM77tr03fZHknbXOF1Btohb2eFis0qJ7DuqYIFowAMRpkPAVML+HYZXDjcXawYbDMZROUCD6omJ5qV9hEAMNll3tD03BKwea1S8WV6GzDvB1tqXILY9V4VYy8zX+2WVKkCwhdWhVafzdDuXPjKkykTR/5SoujZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KieaivFCrsQZt8Mzc9qnnNvQ9GIXF/5GduHkXKvmgYk=;
 b=Lp0cNOLEzgq5EvyITVGPb8eHxDO3W4q1y5lrymFksYS53Rp/3yvtKnna8qQCXJgFVEWVcGbItYMNbFtCJDjhCRqJUtJmbzaywFipd56Fr0g1/jg/mB6uL0LjNEZ7MGB/EzjAkzns4nuUl+vb76/MqlXrSR6XMRv+EQDlSMT4H8qHTEh6gLtG3H2QASYwiMqWBhg98aQvZbaxwWg8AhhE/htZTlfDh1t2TtXq6XNNXGne7z/Mx0pRL5ppelC2ma20CCGEuVvxIcF1EWFXKABcXbhAYa6/IXShSw02en5xTyQJAQMJ5TfWZH5uuf0lSsRLow8UdJ8EEwxp+sF9WdtUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KieaivFCrsQZt8Mzc9qnnNvQ9GIXF/5GduHkXKvmgYk=;
 b=od70wAWfwreyoy8AyG0uZtS0/QMjB29gaoiavazYg12zmJjuldu4DA2UHdZTOgqWvCJY2vvmkod+MAOaAxFve/qRUoZaVSI0DafJ5B/t2crurf5+3jOmk/bOvhO4PC1norNl6gZEhVNMtc2YlOnj/roRAhnAQR+cEuZlaSegJNOAUCTXiA+w+0WaDKQtnUxJ7aXs9WoTDumrJ7uG0A5dKO63eGKIIIoHoVHmEG8MRA4e/gQ+dg6jcm2/p4kTo5/HG5w3SNPc9plOBRWkDzCNXxhj+/GTmA+VMori63eX+OKVQgMfReX+JqfBdZF7b/Kbh/u0pvAhoTgKDaaEQaxB2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71abd99d-7ef9-09db-9c1e-6b1c55188a6b@suse.com>
Date: Mon, 16 Oct 2023 12:49:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: SAF-x-safe rename
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, "julien@xen.org"
 <julien@xen.org>, "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.22.394.2310041633080.2348112@ubuntu-linux-20-04-desktop>
 <9CF5DF50-B857-4B1D-A210-E6355492CC3B@arm.com>
 <75d160be-4a8c-48c7-a972-201d78f0bdf0@citrix.com>
 <50198a73-2f0c-4cf1-9173-86a8158b425b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <50198a73-2f0c-4cf1-9173-86a8158b425b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b4d3e6-f151-4554-4e1e-08dbce359257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e4EA0IQkgN2xyFJdPGKSBaeWnRoHf1eik1y6nvcGYMIXHm1swKYvVz8DDA1bb+hQJHFfNgPGWdL6mOHdAt0CLu8BB4Ma7U0Tj6k9MMkm571JPJxWuiZ5RY9rpH6AqNM8U6ywO7ljw8Jh397SZniQbyIH3XcbgbHWMqEHzbsY0y2IbvES6rsBAjzhqr8k19KG6l3hIifkbvUsaang/AaY/eBzh1AJQb1dKkldwobMpHZ4z1r6xwV65rVhXRjpPfAbi9uT4WXvpo0VQlOmHASiUT1LDdky+o8Lpg/1t8UpgcAcTN3Zaw4HaPpZujZwlbWuwc188hK1ZGATHtkx0tliVRV5gfH56JIkeFPQ3jaBwksSMKRkX4AgsQBZjmIhxWe983PVRxAiYM3spNWEcbKx28jkO9Bcq6f9hrLMq9LlAaiBDU1+qMLdXRwWfuYdWFHhYCCj24ZKCkP+/+ShuWvHeg+PxouloSqjiXmCBa6ZwLZxUZFT5tbcBszlRoN/TUkf+W7x9sPAj26nLp3Xhqpn9tPq1X/6ESgs8TCxJmAaKDgLtEehGKkKmbVldV+JclqVDpAO8FRvSc4HvVhW1PuXEDMvFbStoC8eIiD6/z7x35KeMnNpQd4XRR1xMbSd9o4fFjriNWOiUPteYB3pzcQFZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(39860400002)(136003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(26005)(2616005)(8676002)(8936002)(4326008)(66899024)(5660300002)(38100700002)(31686004)(83380400001)(41300700001)(478600001)(31696002)(86362001)(6486002)(966005)(110136005)(2906002)(316002)(6512007)(6506007)(53546011)(66946007)(36756003)(66556008)(66476007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE1kT3dLelhwM2twVjNyc1VSWVRVd1RnRTBJdVc4RXBLNzFCOGpSWi8yTE9X?=
 =?utf-8?B?c2ZkOEhLSG13U2ZvaCtWTllybzBzWVNqQUlIRWRFZXlvYjdQUm5STmtwY01s?=
 =?utf-8?B?MDFPbWVQTFV5ejIram1jQW1TZExWOHllTmhsTmk4U3Y3bmpKRWMrRm9XQUZy?=
 =?utf-8?B?b3FhZkgzdTEvY0FOSkFudmI2b0U1VVQ4SmlleFg0QkplZHhYdmd2Qk9VeHZr?=
 =?utf-8?B?blJNMU5Dci9xZVZFTm9id2QxVThEenBiamZTcTNlZDE2TFRvSEJpS3p6aVg4?=
 =?utf-8?B?Q3JqaUJxVXZZc0MyUDJyS3BGU0FmRnY0QWRxcEt3azAzWGZZUHdUdkZiRUN0?=
 =?utf-8?B?WUF5ZHBmNXZSYTZ2YWt4SjB4VU1qNGVSMFhCRDFYMjB4ZGNGc2pvV04xMU0w?=
 =?utf-8?B?R1QrUHQxNkVHbzVvcysrczlVd1VrLzFCM3NUeHhISC9qN2NzY0dCeE0xRWhB?=
 =?utf-8?B?SkRqcjNQYTBqOHE4OXk0QVhTc0VReWw2TGN5dlZUd09lam1kZ3hmKzNoM3N2?=
 =?utf-8?B?U1BLVjNEMzJldVNRdzNiM3Iva1JmbXJuMGNvZHpBcnBSdXBlWmNNd2hwTVl2?=
 =?utf-8?B?MjlZbUNlaTYzVnBQV2x5d0hvZEd1WHNtYzNYZUZ2VlNuY0ZvK0QwRnF2R1lz?=
 =?utf-8?B?aVVyRjlNdmJtSDkzQVQxZkU1T21CZDM0ZVF6ek5KVGN2U2RBQmFoc3l0TGJy?=
 =?utf-8?B?Q2FiMlJwWmNHVUFIY2JNK3BQZForTitpSGFXYXo0T0o1Q3lYWUU0YlM5OU02?=
 =?utf-8?B?TWRtYm1IazZ2RVdYQml0c0lkbjBVcGsvZks0S05WQkFjMlJVbHR0VjlpK2pj?=
 =?utf-8?B?aVFoaUZ1bmNUREFtV1lmb1FQOTdhQlVQWTJzWjIxOGFkb25Yd2JndWZFUlk2?=
 =?utf-8?B?L3JwbVo0RUdja3BYMDRRZUtYdG5XK092bHVTL0ZKVmxLWjRGcXFFdytxS1FC?=
 =?utf-8?B?RzhEOStMT1o0VGdVd0xsZ0MzdVBSMDJHbVorL2hhRHdFS3djZFVOZ1JNaWZv?=
 =?utf-8?B?TDZOT2NjbGtUS0Y1RUF5ZktPcHp4VE9aSEozSlQrS0ZWTlhVL2cxSE1iQnVN?=
 =?utf-8?B?eFU0Z1FJWG9QdzVhZ3VTam00Wmg3WkdCeWphSGRoUm85OHV0R0t2Vkx5NHZ5?=
 =?utf-8?B?elBzUEdwcXZPNldmcWxSUUpnR2h1NUlKK21kZWhQQ3Fha1VuemFsSXY5Q2dY?=
 =?utf-8?B?VWFVQkVydEY5cGpOMVlGdmdKTkUrZ3FyK2Z6WTl1MVZ3ZjJ1TTZScEJKSmFS?=
 =?utf-8?B?ckYzMGtNdDZZbUIxdzZTaUtpamtzWVNwQmlLdlFSUUYxREpHakFOYWd5K05h?=
 =?utf-8?B?SHc1NUlVVzZyQ2pHRjVXdVYyMXdsVEZDVUdPb1k0U0t1a3ZNTFJZM25sd2tw?=
 =?utf-8?B?YmJTNkVRUk44cGhaMlJFWmNicU5HRkI3cENqNW1JNW82ckJCdFdFY2pYMHF2?=
 =?utf-8?B?ZjkrbGt6djZzY2dqRkxXT0EyNktxVThHenBSVjN2bk81eVhTUHd3bVBNZkxz?=
 =?utf-8?B?NHdNTGNIbzloYThtZlFFUXZka1V1bjYzbWJ2ZkZHYUw5eE56Z3NkZUYyVEVl?=
 =?utf-8?B?eCtzNzZ4cGpnYXRkWER6MDJ1MkkxOC9wZitBVGxKOGtQUExFY0RRU1RZSFVI?=
 =?utf-8?B?WVFIZ1NyTGllV0FMeVJSVnd3WGdmTnlFMXU1RjdwVTU3cmxjay80M0hGdWFT?=
 =?utf-8?B?TXNsL3U3RmwxVU5BUHdBZE9tazkrMHZoR000ZEd3YlpNUUh4d1M5QVJLR3FD?=
 =?utf-8?B?UU4xeWFEUzVXRHVYMTBXVnNzYmZPNlZTUE9rOTBGNTg3OHEzQko1Y1M2QnM2?=
 =?utf-8?B?ZHI1S2RLMEpuWFRSamlGL1VxY1ErWjUyMVl3ZnBjRDNza2ZUT3R5Mm9FWDdo?=
 =?utf-8?B?Z3VKSzNwTzdxSDQ1c2U2TFIvckUzYmY1RzU4dk5nMFR1TDVRY1ZGcUZyNUJy?=
 =?utf-8?B?U3RzWmdwamRFWFVMZ3RFNk5QRE1lWDV1dVduVlQwSUZuNjN2VktsWEphQXl0?=
 =?utf-8?B?bW9jcEhSU1JSdEEvZC9QS2Fid1FKa3BKNFMycjZNbm1HTkJvU1lZWExIeUtE?=
 =?utf-8?B?QlRJay9mZSs0dWRHL3hVWVZLTHdMNDUvMDFXaWVrTzBrRnVLV1RQRW4xTElB?=
 =?utf-8?Q?zxe4iHVYMLjUYefbN7XZnGwJB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b4d3e6-f151-4554-4e1e-08dbce359257
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 10:49:28.7745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+ZzgTqrgOWCPqI6Ps+B/S/ArcmnK3iYQPO/tDaP836Xj0HbPtzHlV3WUCjiIwwfpeoWTxxQMrEu10I6VJzbvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6777

On 06.10.2023 00:01, Andrew Cooper wrote:
> On 05/10/2023 10:38 pm, andrew.cooper3@citrix.com wrote:
>> On 05/10/2023 8:43 am, Luca Fancellu wrote:
>>>> On 5 Oct 2023, at 00:46, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>
>>>> Hi MISRA C working group (Jan, Roger, Andrew, Julien, Bertrand, George)
>>>>
>>>> in a recent thread Andrew pointed out that the SAF-2-safe tag is
>>>> confusing and requested a rename:
>>>> https://marc.info/?l=xen-devel&m=169634970821202
>>>>
>>>> As documented by docs/misra/documenting-violations.rst:
>>>>
>>>> - SAF-X-safe: This tag means that the next line of code contains a finding, but
>>>>   the non compliance to the checker is analysed and demonstrated to be safe.
>>>> - SAF-X-false-positive-<tool>: This tag means that the next line of code
>>>>   contains a finding, but the finding is a bug of the tool.
>>>>
>>>>
>>>> Today we have already 28 instances of SAF tags in the Xen codebase.
>>>>
>>>>
>>>> Andrew suggested "ANALYSIS" instead of SAF so I would imagine:
>>>> - ANALYSIS-X-safe
>>>> - ANALYSIS-X-false-positive-<tool>
>>>>
>>>> If we really want a rename I suggest to rename SAF to SAFE:
>>>> - SAFE-X-safe
>>>> - SAFE-X-false-positive-<tool>
>>>>
>>>> Or maybe MISRA:
>>>> - MISRA-X-safe
>>>> - MISRA-X-false-positive-<tool>
>>>>
>>>> But I actually prefer to keep the tag as it is today.
>>> We chose a generic name instead of MISRA because the tag can potentially suppress findings
>>> of any checker, including MISRA checker.
>>>
>>> If SAF-* is confusing, what about FUSA-* ?
>>>
>>> Anyway I’m thinking that every name we could come up will be confusing at first, improving the
>>> documentation would mitigate it (by improving I mean to improve the fruition of it, for example a
>>> Read the docs documentation has the search bar, a quick copy paste of SAF- would make the
>>> documenting-violations page visible.)
>>
>> No - this is a problem *because* changing the documentation doesn't
>> help.   (To be clear, updating the documentation is fine, but irrelevant
>> here.)
>>
>>
>> These are annotations in code.  They need to be:
>>
>> 1) Short (obviously)
>> 2) Clear to someone who isn't you (the collective us of this group)
>> reading the code.
>> 3) Non-intrusive, so as not to get in the way of the code.
>>
>> and they must be all three.  This was even a principle given at the
>> start of the MISRA work that we would not be deteriorating the quality
>> of the code just to comply.
>>
>> Point 3 is other thread about end-of-line, or block regions.  Lets leave
>> that there because it's really a metadata transformation problem
>> constrained by where the comments can acceptably go.
>>
>>
>> Point 2 is the issue here, and "SAF-$N-safe" scores very highly on the
>> WTF-o-meter *even* for people who know that it's something related to MISRA.
>>
>> Seriously it looks like someone couldn't spell, and everyone else went
>> with it (reflects poorly on everyone else).
>>
>> And yes, I know it's an initialisation for something, but it's not even
>> an industry standard term - it's a contraction of an intentionally
>> generic phrase, with substantial irony on an early MISRA call where
>> there was uncertainly between people as to what it even stood for.
>>
>> These are the thoughts running through the minds of people reading the
>> code when they don't understand what they're looking at.
>>
>>
>> Annotations for other static analysers intentionally use their own name
>> so they're googleable.
>>
>> Guess what SAF googles for?  Sustainable Aviation Fuel, or Specialist
>> Automotive Finance.
>>
>> Fine, lets be more specific.  How about "Xen SAF" ?  Nope...
>>
>> "Did you mean to search for:
>> Xen SAVE Xen SAN Xen VIF Xenstaff"
>>
>>
>> Despite many of the search results referencing patches, or rendered
>> documents out of docs/, not a single one of them gets
>> documenting-violations.rst in any form, where the single definition of
>> this term is hiding in a paragraph which spends 90% of it's volume
>> describing a monotonically increasing number.
>>
>> Seriously, ChatGPT would struggle to make shit this good up.
>>
>>
>> The thing we tag with *must* be trivially recognisable as an analysis
>> tag in order for others to be able to read the code.  Therefore, it
>> needs to be an actual full world (hence the ANALYSIS suggestion), or an
>> industry standard term (where MISRA does qualify).

ANALYSIS imo gets in conflict with 1) above, considering that permitting
line length violations was already brought up with the shorter SAF-*.

>> I don't exactly what it is - something else might turn out to be even
>> better, but it is very important to be not this, for everyone else to
>> have an easy time reading the code.
>>
>>
>> And reasoning along that line...  What's wrong with just /* octal-ok */
>> or /* womble-permitted */ so it's also apparent in context what the
>> contentious issue might be and why it might be mitigated?

When the numbering scheme was discussed, I was asking why a shorthand
for the issue to deal with (kind of a tag) can't be used. I don't
recall any arguments, but here we are. One issue with something like
just /* octal-ok */ is that it's not sufficiently reliably machine-
parseable; that's aiui where the desire of the SAF (or whatever else)
prefix came from.

>> The mechanics behind the scenes is just a trivial text replacement, and
>> the tagging scheme does not have to uniform obfuscated identifier for
>> that to work.
> 
> Or, as has been pointed out to me in private, even
> 
> /* RULE-$N-safe */
> 
> would be an improvement because it's clearly related to some set of
> guidelines.

Both MISRA and RULE are Misra-specific; RULE, if you mean it to be
followed by the rule number, would even be Misra version specific.

Jan

