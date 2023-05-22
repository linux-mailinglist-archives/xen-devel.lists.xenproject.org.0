Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6928E70C123
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 16:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537994.837698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16Yr-0001Tp-S2; Mon, 22 May 2023 14:30:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537994.837698; Mon, 22 May 2023 14:30:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16Yr-0001S9-P0; Mon, 22 May 2023 14:30:57 +0000
Received: by outflank-mailman (input) for mailman id 537994;
 Mon, 22 May 2023 14:30:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q16Yq-0001S3-By
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 14:30:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 427464a1-f8ad-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 16:30:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7070.eurprd04.prod.outlook.com (2603:10a6:800:123::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 14:30:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 14:30:53 +0000
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
X-Inumbo-ID: 427464a1-f8ad-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMYI5PbRnocA0QiAeq3oq3yUIyc8fl3ntpWs9s6CIJ+x0uV38kX4RE/UcoqVnJFlBbljcdjJcmdccz2m3pXOcW+HIKbS1PrQkBkeF13+1JoF5Nqc0GyDU7XqSdmyQpYkglOouDjHDM2w+gZko+ISQH8XRJ+2j16uQEOvgl5VYTOhRXRV7A2fUBFUvvqX6E4Xe8SJr04cYH2odC5QtzwtIdYQ4kDkVS7lFvPzxlZlp0IjeLohHbv+Pnt2k6mRtw7wCXupgdGdTvU1ifqsbnuuIyrk97NBGBVmMABHd+P9CLuX7C/pEZiI7Wnu5AILIPM9Kmy+lVc/73+U2VlYoXSuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SW6JPend92Ls/4wOtwU4ZVJKjhNrjd9e8aWNiHmZUpU=;
 b=U9fQOB7vAxPM6xy2ZyGJSjOoF47soK8WhPvgXCwjHL7shyLkMDTiq+i3JnB59Dcc4WZf8yqKkCrsuNBNyTvF/zesVWkm/raBPtSoXBc00/28FaksaBPRwx316xX5M9XkxozxIsWtIVTZ3xq6xfQjsrm0tXblbgGxKHOdoBb511OavBNk0M1lwMfvrg3en5QQxgvLPQThZJw6Qx7DnLlQJcZc5JzFXEBucmcUW7KQOcEFk8o917ulN+xbw7udd/BlvrdiVL8LTiBFL9ri/5RW+7ESOkAG5xQRSaO430/HOqs9jfNiEvtDy3/01h1gbsupgmlvqSf+ObHqSMZ0DtO3VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SW6JPend92Ls/4wOtwU4ZVJKjhNrjd9e8aWNiHmZUpU=;
 b=LGzTswiFW4evaomkezvGiQFjGkIcFt0edOLOUjklhbzMaQecK0LkbXZq+dE0oOCzvoJiQiG4a9dqh5EKQLRSLotb/ze+kBZlTi1pMBO9/k1r9oKlE7RW6XlFcm/QyopRPpAPM2AEW93LX7+U5lp9v8qd5Pe3PTFCCzfLxnVZD+C35IH+8Mg13U7J/xDQK2Pm7QhexLDF97iBzJ61P4E8id1qtSjIUMVGvDU9mMO40RfmX2am3fSwJlQEuP4TBiCh/3OpIciMKnzW6uKh2F+GrgIO2tyi0gBZKaE9DRnExc9FUPcFLPW9HauS2ec0miG8wRkkc0XpyQ1GOrtEV0njpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f477a115-f8af-f3e8-26e3-13ea38109bf2@suse.com>
Date: Mon, 22 May 2023 16:30:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/4] x86/spec-ctrl: Remove opencoded MSR_ARCH_CAPS check
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516145334.1271347-1-andrew.cooper3@citrix.com>
 <20230516145334.1271347-5-andrew.cooper3@citrix.com>
 <1d06869b-1633-7794-c5c9-92d9c0885f19@suse.com>
 <42cd2479-1eba-11c7-26d8-441045c230ed@citrix.com>
 <fb95d033-7a71-7cc1-bb8f-ee2a74d1c5cf@suse.com>
 <a8013bb5-b0bb-6e42-85de-2e12d7b6f83c@citrix.com>
 <678e997a-0e3e-a6b3-1bba-5e66ff74de48@suse.com>
 <e0d0de09-2da0-f961-f3d5-576cd7268f32@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e0d0de09-2da0-f961-f3d5-576cd7268f32@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0163.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: 4956a2ad-ab8c-481e-92dd-08db5ad125f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gquZ72MpXw7WbqhqiXnHcNu+ecuc/Wfe2WCUneCIklo4AJd5HgPbNmEwOaUt6gBDmsETeuywI1jbVSTqDVFBKCO6kx2QRSBc6i05waj3yGeNXlpl9rpUw+FQBsyJF7ZKBAe3vpYg3DOHksqw7qqnD3lhKdfzR9qeXwC8b6/RNDsl4gOYpHDXLbUjel4SrersTW1mpv01yy3fVX8gqv0agMrE8MaR9KUEPgJirgXi5rOI+7leSn1X/vLlAhAIV73YkIK0Q0QQQR/ZxdTz+eii6uRbmwXm8K1DvbXTJGsAlVn418atwIXD4jbEBMoth42ttnRFkmefAoYErSSZ+XI20dHm5j615KEgP1BmaS9iXQg+BPjKEhSjjZsNEoH0Q7dWXK94e/WF4j19OnlVcle3EjaUvlmSmcMexZgV+M7KPEIzGO2YWQBal8kpGTiHtKmmr9XF5AWGHjjL8LNbdJrPX8IUkoiP0jyOI5cFaUUVn8x6DiK+erjX5eJTjgGHhHTOmEOYxM6tm/DhNHFHPQTUZyObZNarj5UW2BTGnlHV/WrtBc6hGDja4YKp8YQH3OJIt0EiwQeyLDJg+2sMVFmhxzS82amgbXwMAInesobqLSIP1TJAoqA9qSeNCluuqW8TuLGPLhHp8TETwr0myoggLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199021)(31686004)(86362001)(316002)(54906003)(478600001)(41300700001)(6486002)(66946007)(4326008)(66556008)(66476007)(6916009)(38100700002)(8676002)(8936002)(5660300002)(83380400001)(2616005)(36756003)(31696002)(53546011)(26005)(2906002)(186003)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TERCTjd2TllRY1M5YVZ3dUhPMVFSUkc4YVVxcjhmVWlHSGozWThtMTJIRHF3?=
 =?utf-8?B?cVZDRDkzM3k4Q0RXZnZxQ3h0ZENkS2RBaUcvYmNoNjc0KzhTb0lJMW03MXBs?=
 =?utf-8?B?TVZlc3BLSmxLRDNiTnU4ZDRmQzU2YTZkcXByUWVRZThydjZKbXFNV0NVSDdh?=
 =?utf-8?B?QkozWmFvc0p2U2lJSHJnZWtwTG9NOE55ZWdtYXNPR3pwM2QyYnpVd3V0amha?=
 =?utf-8?B?U3pOWkJFbGFUY2g1clA1eERzM2QzYnE1b1E3VFljM1dkNzhVZ2ttak52Tkty?=
 =?utf-8?B?eTQ0bGtRNVF5YzhUZU04ZnNtcndtcEx2UTEyR0dWMlJYWVgrNTU0eHBJZ1l4?=
 =?utf-8?B?RWd4QlpIeGlQVnBXWEtnTUNZd2p6YXFJREtQbDJIbGhNbTJudVZZVjJoN0pY?=
 =?utf-8?B?T0pZQ0liakFkZXJJN3VZN1gxbHRlY3hPek5wVDJuU1l2bjEzTzJrd1BCN0RM?=
 =?utf-8?B?UDNGeHZSalBFaXNTWFBCTVByYlBORWZMd1p1Wk5xdjIyVWlTL1RDaXZhQ3RS?=
 =?utf-8?B?aEwrNU1SSWxHTmVMaG9WM0JHbDFRNlRodjNVb0dSaHFmNjdvM2E4NzZsVktQ?=
 =?utf-8?B?dXNFK21ZWUNuVVlOVDZzZGJuMHZOUlE4d21yRnM0bUVFTVB3aUpwS3lOZkpR?=
 =?utf-8?B?S2dnZ0V5M1dyWWw4RStQaFFPZDdQeFZOcUZWekIySnF2Tzl0dHREUXRqUGdp?=
 =?utf-8?B?STROSmJIRGs5VjZ0Y1VtSnpjOGNVdXVMNDRpaE1CdTY5T3EvV2praXVPZks1?=
 =?utf-8?B?ZXFjUy95UFMrZitxQTdGQXZsWDhvRVN4bW5yMHpWRWNDSWlNUDg4R0RnU3VS?=
 =?utf-8?B?cHpQVGdFTUQ2NlhaTlVFcGZLQlJpb3o2QVRhbjZ6OU1pclg4ZzJPS1YyOVQr?=
 =?utf-8?B?SUdsd1IxM00wa0VvZE1lRHB4QUtvRHRBQmZBa1lEUzlEeWJubVR3NzhWTjdh?=
 =?utf-8?B?SDVKeUkwWk1JRTVJOGpGdytHRUFYS3FYckVsbnJ3cW5jb1ZUOXREK2JYMEdB?=
 =?utf-8?B?enkyNXBGWUhrdmprWmprYWNHVUg0VUo2OWE3NTRHSHhYZjNoVVFQY3NteGtk?=
 =?utf-8?B?SS9CMVNCS2dUK0N0dys4UkplQnd6NnlndGxKWU5makFXclV0QWF2dytydTM3?=
 =?utf-8?B?dVBoVExCdWJSc1lCRHh4aHlMK3JHdVBBYU81cDllOEZoUC9hOGpYVkRRVVVh?=
 =?utf-8?B?L1FQSGxzYnRRMGphd3Q4bk5yYWdPdUc1RUE2TFNnNExQYzNGQlFaV1RpU0Iw?=
 =?utf-8?B?bWN5T09ZR3hQYXFZQ004OGUwTC9rWmtXdTZvK3NHV2FmL0ZFdmRmU0RpMitZ?=
 =?utf-8?B?MmtwSmlCR2FHWklOZExJWFpnQWt5bXFrdE9IWjV6S1lrZkFXNXI2MUZUVmZS?=
 =?utf-8?B?Z0ZmSGxGUVErRUdBZG1YQ2JxT1VEWU14dmV1Ylc1YzVjanU3anZBbXhJVERW?=
 =?utf-8?B?NDByREJxM1MvMnhqYkFTemtNNzNUVlZra2tudnFDeU0rR0dMSFl5MzRiM0g3?=
 =?utf-8?B?djgrRzVFdFJPYWtYRlFlTW5zWnMzdEZqT1pXaTlsS2VQcWRQbUsyNkljUnpU?=
 =?utf-8?B?MER2bjk4VC9reGVzZVdzMy9ZcVdTUDhoQWVMeFhxczhBMXBTMlVwZDhFeU1z?=
 =?utf-8?B?R2tDTHpyS2xvZTRKQW9OcGxseG83Sk5XMGg5ckh1a1V4SVRhNGh6Um9BMlRi?=
 =?utf-8?B?VEhlM1EwVnhXci95aExMZG1RQ1lJRlkrMmVwN0NCUUthRzRkUUdNSVMzY1F3?=
 =?utf-8?B?UjRUVFdVeHgybGJpQ2lTdnNXM2UxbW5kbUozRjFuK2FqSmRZejl5ZUtwTWx6?=
 =?utf-8?B?RU04M1B5cUZmRlZvbm56eUpxSGo4SUpaOXNzTUg1WVVtY3N6dldMbVRlM2ph?=
 =?utf-8?B?NlRuUFhlN1Uxd2hRUHB0NlA0QnQ3bnJwTjdkZGdPYkE1cVIvTEZOK3VkVEha?=
 =?utf-8?B?VVczZmVNVkxvU1RCM0tJMnFlMkV4VWVnREtETzFUdG5jdTA4MjFDc2l1bVdu?=
 =?utf-8?B?dXVobmRVd2ZyTHVSeU1nS1l4cUg4OTBvSnZHQkFoSGMxN3U1akhoQk45bnhN?=
 =?utf-8?B?VStCd2phaU8vdVNXLzl2eVA1aEhnV092OGo5K0Fka3BHTktkRzdrSWZnOTM2?=
 =?utf-8?Q?RLlUebVVTFy6v2MnezjG3Ez8W?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4956a2ad-ab8c-481e-92dd-08db5ad125f8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 14:30:53.6245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8N0rL12myqdC9k6KW8X72ezKu0ODK7RXie627YMFUP0qRzAW3JT/L/X3q26rbGcDgmLBSFacsGfJqDd84jHPtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7070

On 22.05.2023 16:14, Andrew Cooper wrote:
> On 22/05/2023 8:10 am, Jan Beulich wrote:
>> On 19.05.2023 16:38, Andrew Cooper wrote:
>>> On 19/05/2023 7:00 am, Jan Beulich wrote:
>>>> On 17.05.2023 18:35, Andrew Cooper wrote:
>>>>> On 17/05/2023 3:47 pm, Jan Beulich wrote:
>>>>>> On 16.05.2023 16:53, Andrew Cooper wrote:
>>>>>>> @@ -401,6 +400,8 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
>>>>>>>          cpuid_count(7, 2, &tmp, &tmp, &tmp, &_7d2);
>>>>>>>      if ( boot_cpu_data.extended_cpuid_level >= 0x80000008 )
>>>>>>>          cpuid(0x80000008, &tmp, &e8b, &tmp, &tmp);
>>>>>>> +    if ( cpu_has_arch_caps )
>>>>>>> +        rdmsrl(MSR_ARCH_CAPABILITIES, caps);
>>>>>> Why do you read the MSR again? I would have expected this to come out
>>>>>> of raw_cpu_policy now (and incrementally the CPUID pieces as well,
>>>>>> later on).
>>>>> Consistency with the surrounding logic.
>>>> I view this as relevant only when the code invoking CPUID directly is
>>>> intended to stay.
>>> Quite the contrary.  It stays because this patch, and changing the
>>> semantics of the print block are unrelated things and should not be
>>> mixed together.
>> Hmm. On one hand I can see your point, yet otoh we move things in a longer
>> term intended direction in other cases where we need to touch code anyway.
>> While I'm not going to refuse to ack this change just because of this, I
>> don't fell like you've answered the original question. In particular I
>> don't see how taking the value from a memory location we've already cached
>> it in is changing any semantics here. While some masking may apply even to
>> the raw policy (to zap unknown bits), this should be meaningless here. No
>> bit used here should be unmentioned in the policy.
> 
> The very next thing I'm going to need to do is start synthesizing arch
> caps bits for the hardware with known properties but without appropriate
> enumerations.  This is necessary to make migration work.

But you wouldn't alter the raw featureset, would you? As much as ...

> Because we have not taken a decision about the what printed block means,
> it needs to not change when I start using setup_force_cpu_cap().

... setup_force_cpu_cap() doesn't affect raw.

Jan

