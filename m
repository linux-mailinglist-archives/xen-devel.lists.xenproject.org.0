Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F876C36F9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 17:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512857.793173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peetT-0004LW-Hf; Tue, 21 Mar 2023 16:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512857.793173; Tue, 21 Mar 2023 16:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peetT-0004Ie-Eq; Tue, 21 Mar 2023 16:31:27 +0000
Received: by outflank-mailman (input) for mailman id 512857;
 Tue, 21 Mar 2023 16:31:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peetS-0004IX-DF
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 16:31:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d267c80a-c805-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 17:31:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9938.eurprd04.prod.outlook.com (2603:10a6:10:4ee::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 16:31:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 16:31:22 +0000
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
X-Inumbo-ID: d267c80a-c805-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXr3F0rr3uSDiyRQBEzYCn5NwXnur0fMIaXGkruYbqJATtuDXFR3xFUlZ/E2m98AKjf83AmypHwBH10bIy2/InE5sCZXBhanrmnzJFx6WgwnK8Tkl4Ih+BXYnNi48F5Bo7ttyghFrvSqIIcSCyjyISLobmuDemyC4zCpIES5owC7XBLB7+Y7Vu3HEFLEmAO7FXwjD9Wo2FqvqLScvHHqMB//TvUc2wBt78eXfHhXms0LuTEM8UvivwiE6ux/H3ynmlEJYxEjkOstLZVr5eXbO7yKuNnVUBxN6sftY08V3oSwaojRJcoHdejr6/ScJ8VvBTk9TGxq3bGLxTb2jeouLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9q7lY/UVgGiuACc9uA82VVKQjT+iIHV20ir0gmJVEoc=;
 b=ne7/4YD9SyhFBdk95Mz4n+eugXRxQhOQPsoHNPv1ZaBV4nrPgqtyFsK6buyUeuULqFL4ub1OnPizOHQ/zAeoN41ZQv3ZOiBhgxNijQ+Yb6Hmo3Ewn43onuHCuukN1L0nqlvg6zSvd8T32t8xDcAY/FIngOSUVmCC+zlEX/OrG4+ZAyFtQ+Gtfh25JT50p15Y6+6uclR4is3o/4AqRixWKfteMSlKVKUK+XYR9kcAL4K1ItXVSMnnHvhrcrJRZ6p+G+7zGt6ddkECckcCwkf6XuIMq37z6rRiSLQuElVHQzWQqTet/jYpW9oE2MWegWozQbTMiBiTNE4o2Ws/6extKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q7lY/UVgGiuACc9uA82VVKQjT+iIHV20ir0gmJVEoc=;
 b=KAOGRwYA2YUSH6SkoQFt0ysrwxo63yyPPSorGXjkvXFfg9HIGuwuMojFdgC10auU5jRSZ4bOpgBZyKLaLBDxlRPTs/nr6PHgug2D/xnSPu2q+nv/B13ICb+a4OMDjkaqEPLObIiuxovzmB5s6qmu9gtjUJGKKvblHa3sHI5EHMIhClFMQ1NM6Xhk2wsyDC/LmiLHNxwRY9lCsJo736u4DzybtrVWyDc/VkWWHmT/8755T6yOdnExqXwrfXKyZ6cdzSOT6Ls7bzFQweUDA0gypcg9tnMd1KJHxIpBYiiQF+c0vdCJnGSveatC4zpVnV1SGgDLEPxzLuD2OzUzjcLIPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <046b16fd-5619-8fe2-979f-b9fb4d07bfbd@suse.com>
Date: Tue, 21 Mar 2023 17:31:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] x86: extend coverage of HLE "bad page" workaround
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b238f66d-37a9-3080-4f2b-90225ea17102@suse.com>
 <424d1b72-5eb6-f2bc-20fe-e59bacda8dd9@citrix.com>
 <c27d838e-0331-3cab-25bf-dd16b4645152@suse.com>
 <2c0ff1f3-ee0c-6d14-a51c-d82b65338005@citrix.com>
 <0df22405-bda8-8f4d-63b4-e9c4d57843b1@suse.com>
 <ZBRRbnBjWHXAM1ug@Air-de-Roger>
 <02cc1db2-90e6-a60e-4922-d88b4ca98b45@suse.com>
 <70e49a82-f027-6315-e11d-b2e16bdfdcab@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <70e49a82-f027-6315-e11d-b2e16bdfdcab@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9938:EE_
X-MS-Office365-Filtering-Correlation-Id: 834d73d3-caa4-4504-2de5-08db2a29b4b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	luPxAXhbGT5vK/s9eHVCOwmVQVysDf3vQgY7/VjHG3KgZANDX51HnvP/OSrh3Sn2VstK1WYWAxYh4A8CSbaPdl5meIIOgw8sJUp/jNs2bywQJEGshMl9WajMei0p0nyoyAQINBEHTQjNE/0THmqUMss5682V5jD1bLXyLmAmTTgogAzCyJj3CSvV4JrMIfEctZ4JxwdF7oLfCMSeRvVd/21LGTG5kwwQjf0FmoH/FoMGOIZ72QV8bHfA/XxKLnpaeWb95jyQo0zYlMgqrLRoJdDVcTyOTUZkti1b6pF+zRmKCDrbEqTcHOHtlBILgGSHvjOutkReK9kwYuS91HzEo9bWlgJf7tmKOe+4UcJ0ZgzH8bjFU66ALEy0C8o3BNzg7st/7jnS0oaXLqL0ceiGlM770lmPNqFizWog1/jgXZrebZ7GDy9CtFy7icAVCs+Ht40AsTR/gJhdCik5F79DSPD7dhox/GdvdzmoK/Sl4EWuk5I+Ty3Cf2/tsGgRKrpu9UFRSoUAHKjRr3BXMBFsu7aedy7fD/GTeIiJ2QhQR6mI5pX8C9DknObuNVzDvF6rYgwP6MhCrO4IgbT6/FRwA8ouO4YVtfsQiT5xIgz5xyH5OXwYuK63QgyLR4Ur6ho+6emdRgC8DxRtkbxmxkN5cMEVR4o9M5XqFrh8F7RdoHo3YP6RjVhAJ3XziJVgVmH1m9BoCZOTEXFxn/g/JJVSbZF+ZJm9oGcp1vpMogeHbfM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199018)(2616005)(6512007)(478600001)(6506007)(83380400001)(6486002)(54906003)(316002)(66946007)(8676002)(66556008)(66476007)(186003)(26005)(66899018)(53546011)(31686004)(4326008)(5660300002)(41300700001)(8936002)(6916009)(38100700002)(2906002)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2VTcU9TVk1XNVB5SXFjenBYNW96M0g5M1lwV2NybkxvUStRWHVMektkRFNR?=
 =?utf-8?B?cjFJOExjS3hLbGY3aC9VbXRJR0VDRGltNTdHS2xQa3EvMEFVZWNPcVBUSWl6?=
 =?utf-8?B?VTFFNHpFdWZiYVRzRzNWSVFra2Qzd3ZXSUYyS0JqY09JTkNOdHJYMWZ6WWRI?=
 =?utf-8?B?V2oyRHJBRmdnaHhvbDcvOVFORldjR1pLcW5IU0tjN1laWjUvckgzSE91UVhT?=
 =?utf-8?B?MjBPS3Q5Q0pES1hlSTk3dlkvOHNRTEFrd3RJblRkZzZYYzVCbEpoQkZVWkFy?=
 =?utf-8?B?Sm4xUHpJc3YxdWtEaUxBUVAvUkhzV2RNWW5wRVh4Z2dqNnBLRXdwbStUd0cr?=
 =?utf-8?B?UjRLT0NYK1EvcTY2bzlKWXBtLzJGUkRNRWkvL0hSQ0hsZjBYb3dTREpJK1Vp?=
 =?utf-8?B?WDZ1NHBzbnlWSk9VTUc5OUFSajhTdjFJU2N2ZkF3dlFQZ0NDcnJYNEkvajNE?=
 =?utf-8?B?OHZlcjUyeDJpNy9wQWZoQnRrc3R0aUJaTHQ3YzlIUElrVjRxQzAzY21QZzFG?=
 =?utf-8?B?YUpvSlp3MFE5T0IzR0M0Z1dyU3N5TnFRbkY4SVBTbTNmVmFrUjJ5SUVOQVlk?=
 =?utf-8?B?T1NYcXY4VW9xRHpRRldiZVB1S2tzT0JZVVdEZFIzenRsakM5MklUMjhQbU12?=
 =?utf-8?B?V3pObjhIYmNheXBUV2c3ZzIxdlNVeXAxRndBWVhnZS9Pci9uL1pYNHFpNzFL?=
 =?utf-8?B?aDY2SVBnM0dZbTNCQXRub3g5NjVySFFKVTVXc2RrNW05bWZyUWo2MXVvM2xl?=
 =?utf-8?B?RmphNWlueit1TG9Pbjk1cXNRdyswWnRhNlhac2RxeUVicndNclJOYUhmWWFu?=
 =?utf-8?B?Vk5JNWU2SzVvb1VHa1BxT25JQXBHYmhhb1owS01ZM3l3OWNDcGsyZFBEWnhL?=
 =?utf-8?B?YkNsYWtxd0s5alYrUlpxbnJTRitlaGlPU2Nhd1pIaXZuakk3dFAzS3d0dGE3?=
 =?utf-8?B?MWJ6c3NxUHpuU1V2SHpTOVN1MEFHelQ4cnFEeDB0SU9oRXZFRUExRHJKaWxR?=
 =?utf-8?B?L2xVNVBQengzbkNDUXNPT3JDODZnbzVwUFlUNWRMOE44eTlpbGV0QVFiOG5C?=
 =?utf-8?B?RDNwWWJjU05MRWtqUUhScU4rbkFreU5GaWZWQU9qTmR5NDNnVEN0TWVVTUhW?=
 =?utf-8?B?cGRvdzhjVGtoRUxvOU1TZGplUTJFWW41enJNc1Q3L2xETXhnMWZZaEtuWjI0?=
 =?utf-8?B?cGcvL2xkUURBL2JwSm1iSzQ2cUF1STB3OHp4VmFjalVBbkUxd3h5K2lwKy9w?=
 =?utf-8?B?ckcvRHVZMHFYbURGbTI0RDc2Q1drNk5rUlNsMTJDZmJxelIwQnEzQ2NCY21N?=
 =?utf-8?B?QVZNZXl3N2hkUWlHazdOb0c5WnQ1QWI5L0g4TEo0dTgvcWZCcmlnWHZsRE1q?=
 =?utf-8?B?OW1aTUZoUmdDS1FXQi8zd1k5bGozZ3FRT0Vic3JHTzdxZzBiMGxIcTg5L09P?=
 =?utf-8?B?dTNNanZDZUw1Wm05WndjdVowVDl3T3FwdUJSS1p1citPZ3UvM1NZT0VPZkJu?=
 =?utf-8?B?Z3RmTWFlajcrbmw2Kyt5V0RHU3lKdWpIT2pFdHFNL1lCQlRLMDJIYnRkbTNx?=
 =?utf-8?B?QW82M0FWNUlraTBrbjRFd2pvS2JxVzUzbXB3OEZ3YlBxUlY0ejhMRWhkVnIx?=
 =?utf-8?B?aGdxSS92WTZENkNvZ0dpVkR4QmFKTFgybEhjWjlldys1K3M0NXg1MDZyMVBP?=
 =?utf-8?B?a1Fscmx3N0ZDdWtVb2V5Q0VUMGRPOEd5VG1tbzcxZFo4K2VxYWJQWmRQais1?=
 =?utf-8?B?K01mTElsQ3B6UFZsa09HSFErSTY4VG5Ga3J2WHJlZklzM3BndlJUZWdYNmcv?=
 =?utf-8?B?Z2dEK2NwMWN2S2tJSFExY2tScy8xUlYrNzFXbFlkcWc0Y0Y2S1BYQ3Zabk9X?=
 =?utf-8?B?VW4yeWs3VmJYbG1qS2IvZVAwUVduTkJ0UUxiWmJSMEcxc1NPYzZJVGUwcU1t?=
 =?utf-8?B?M1pIb3MzVUZKaGdqNXo4Y3RMeThScUJ0RHNwUXlFR0dQQ0dPWG41a3dRVWlG?=
 =?utf-8?B?NFM0OHduck8rd2FDZ0VBV3RIRWUyOEx3WGFnanMwOFVsbnc2alhsRDZ4ODAz?=
 =?utf-8?B?T2x3a2RHSjNBa21iZjkrWWZrRmlBNWxuUUEyTkZvYkt1TmJub0paenlMQWdy?=
 =?utf-8?Q?x41dv54pfLxSmNunnWmIlyMji?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 834d73d3-caa4-4504-2de5-08db2a29b4b9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 16:31:21.9930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u0dkeAZg2KZlqIkUDpzrlArlIvffEpEJ2B/f+DGlWlYTFSTAI7Uv1uvpoVOY/W5oTdm342XYevr67rf55gW8sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9938

On 21.03.2023 15:51, Andrew Cooper wrote:
> On 20/03/2023 9:24 am, Jan Beulich wrote:
>> On 17.03.2023 12:39, Roger Pau Monné wrote:
>>> On Tue, May 26, 2020 at 06:40:16PM +0200, Jan Beulich wrote:
>>>> On 26.05.2020 17:01, Andrew Cooper wrote:
>>>>> On 26/05/2020 14:35, Jan Beulich wrote:
>>>>>> On 26.05.2020 13:17, Andrew Cooper wrote:
>>>>>>> On 26/05/2020 07:49, Jan Beulich wrote:
>>>>>>>> Respective Core Gen10 processor lines are affected, too.
>>>>>>>>
>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>>
>>>>>>>> --- a/xen/arch/x86/mm.c
>>>>>>>> +++ b/xen/arch/x86/mm.c
>>>>>>>> @@ -6045,6 +6045,8 @@ const struct platform_bad_page *__init g
>>>>>>>>      case 0x000506e0: /* errata SKL167 / SKW159 */
>>>>>>>>      case 0x000806e0: /* erratum KBL??? */
>>>>>>>>      case 0x000906e0: /* errata KBL??? / KBW114 / CFW103 */
>>>>>>>> +    case 0x000a0650: /* erratum Core Gen10 U/H/S 101 */
>>>>>>>> +    case 0x000a0660: /* erratum Core Gen10 U/H/S 101 */
>>>>>>> This is marred in complexity.
>>>>>>>
>>>>>>> The enumeration of MSR_TSX_CTRL (from the TAA fix, but architectural
>>>>>>> moving forwards on any TSX-enabled CPU) includes a confirmation that HLE
>>>>>>> no longer exists/works.  This applies to IceLake systems, but possibly
>>>>>>> not their initial release configuration (hence, via a later microcode
>>>>>>> update).
>>>>>>>
>>>>>>> HLE is also disabled in microcode on all older parts for errata reasons,
>>>>>>> so in practice it doesn't exist anywhere now.
>>>>>>>
>>>>>>> I think it is safe to drop this workaround, and this does seem a more
>>>>>>> simple option than encoding which microcode turned HLE off (which sadly
>>>>>>> isn't covered by the spec updates, as even when turned off, HLE is still
>>>>>>> functioning according to its spec of "may speed things up, may do
>>>>>>> nothing"), or the interactions with the CPUID hiding capabilities of
>>>>>>> MSR_TSX_CTRL.
>>>>>> I'm afraid I don't fully follow: For one, does what you say imply HLE is
>>>>>> no longer enumerated in CPUID?
>>>>> No - sadly not.  For reasons of "not repeating the Haswell/Broadwell
>>>>> microcode fiasco", the HLE bit will continue to exist and be set. 
>>>>> (Although on CascadeLake and later, you can turn it off with MSR_TSX_CTRL.)
>>>>>
>>>>> It was always a weird CPUID bit.  You were supposed to put
>>>>> XACQUIRE/XRELEASE prefixes on your legacy locking, and it would be a nop
>>>>> on old hardware and go faster on newer hardware.
>>>>>
>>>>> There is nothing runtime code needs to look at the HLE bit for, except
>>>>> perhaps for UI reporting purposes.
>>>> Do you know of some public Intel doc I could reference for all of this,
>>>> which I would kind of need in the description of a patch ...
>>>>
>>>>>> But then this
>>>>>> erratum does not have the usual text effectively meaning that an ucode
>>>>>> update is or will be available to address the issue; instead it says
>>>>>> that BIOS or VMM can reserve the respective address range.
>>>>> This is not surprising at all.  Turning off HLE was an unrelated
>>>>> activity, and I bet the link went unnoticed.
>>>>>
>>>>>> This - assuming the alternative you describe is indeed viable - then is surely
>>>>>> a much more intrusive workaround than needed. Which I wouldn't assume
>>>>>> they would suggest in such a case.
>>>>> My suggestion was to drop the workaround, not to complicated it with a
>>>>> microcode revision matrix.
>>>> ... doing this? I don't think I've seen any of this in writing so far,
>>>> except by you. (I don't understand how this reply of yours relates to
>>>> what I was saying about the spec update. I understand what you are
>>>> suggesting. I merely tried to express that I'd have expected Intel to
>>>> point out the much easier workaround, rather than just a pretty involved
>>>> one.) Otherwise, may I suggest you make such a patch, to make sure it
>>>> has an adequate description?
>>> Seeing as there seems to be some data missing to justify the commit -
>>> was has Linux done with those erratas?
>> While they deal with the SNB erratum in a similar way, I'm afraid I'm
>> unaware of Linux having or having had a workaround for the errata here.
>> Which, granted, is a little surprising when we did actually even issue
>> an XSA for this.
>>
>> In fact I find Andrew's request even more surprising with that fact (us
>> having issued XSA-282 for it) in mind, which originally I don't think I
>> had paid attention to (nor recalled).
> 
> No - I'm aware of it.  It probably was the right move at the time.
> 
> But, Intel have subsequently killed HLE in microcode updates update in
> all CPUs it ever existed in (to fix a memory ordering erratum), and
> removed it from the architecture moving forwards (the enumeration of
> TSX_CTRL means HLE architecturally doesn't exist even if it is enumerated).
> 
> These errata no longer exist when you've got up to date microcode, and
> if you've not got up to date microcode on these CPUs, you've got far
> worse security problems.

Are you sure such ucode was issued for _all_ affected CPUs? I think I
agree for the models being added by the patch here, so I guess I can
accept the argument for this change to not really be needed. But for
removing the workaround I'd expect that suitable microcode exists for
the respective models. Yet at the very least 06-55-05 - consisting of
just a single blob - has a date of 2018-Nov-16, i.e. older than March
2019. That's Xeon D-2100 and perhaps at least one other product (I
didn't go hunt further to see where SKZ is used as the acronym).

Jan

