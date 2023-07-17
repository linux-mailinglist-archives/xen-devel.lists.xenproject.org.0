Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD559756531
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 15:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564559.882055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOQu-0001l3-OZ; Mon, 17 Jul 2023 13:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564559.882055; Mon, 17 Jul 2023 13:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLOQu-0001ip-LY; Mon, 17 Jul 2023 13:38:36 +0000
Received: by outflank-mailman (input) for mailman id 564559;
 Mon, 17 Jul 2023 13:38:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hD51=DD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLOQt-0001if-Bc
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 13:38:35 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 394a6007-24a7-11ee-b23a-6b7b168915f2;
 Mon, 17 Jul 2023 15:38:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8334.eurprd04.prod.outlook.com (2603:10a6:102:1cc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 13:38:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 13:38:31 +0000
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
X-Inumbo-ID: 394a6007-24a7-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=inmJ/KS55mcf/coa2FEp8Fy170v+ZOaHaMhYKDUmnT6QvDfmmUMpeBGj0RHden9vj46tBUIH3yA2CpaEsoHL2YtrQUl012IP8q7SCHH6qK9fJDPx6SbN8fm9yFpHI6YTCi+3M40D9NYoi/UCcoGWAi9jtqL3BP+GGnjYvBU1prsw6GOmvvIhji+rDt/QyWeSUoG091JFF3rCXwkPIxxo+VxM88FQzzS88TulrXF1cRGmsYPlg56Di1kBhl3tvq6KbTGyWUwOBiFtHXldJSLTitLd94xTjsTuzzwu+3AcHisP4+h4YAXl/QMKN4IIqTl5fVHzzZWZzb91ciDdAz/1kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bh+DerWxjcV2fBc4UQ5cv/e7uwkaIgO/C3ikGXVp2yQ=;
 b=SrQGkFs+yiky0gkOjEixSB/vZ21B1DjGQYCnpIEy8GynhXyKAFhtHg9wm18mj+ENoKMANAY2ponYK4lGjAr6wGQ5YdIVqcJAXgNawhu0+QXdX9I3peBTI9Ulcjd3c/Zwt/5G9nNd21IbSfCWxrHnVtRcijV5srT6otS/yRVxPsIPQQb8AZlN2PSQA+pjHn9aw52Po7rc5lmMrcu8olwyrr1oP3oF5fbU6B9kHKHIcwDZQFuwruDYEWMJzhiA0U4Ei4Ploh3/7JHD3JrziJByK4l6MFZJh4XOKPqzWnhs8X/NYDi6IbinpNO0zViuMJgrl1Q9fhfjACxCWUxDi1BT7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh+DerWxjcV2fBc4UQ5cv/e7uwkaIgO/C3ikGXVp2yQ=;
 b=a0vQA3KwG65fvoW7UK5WnUq5AqILpN/5VANCEThXF+R/bDMz/Z2JNQSnQ7XJZwSWu1hS7FIGNudOJ9ei1ySmfhF7xuGr4QwbsKpDliRd2TPVS9+3YDNUgCj/YyQgI1LUewEll7mrEEysCxBlgNpsiQgfBng3jPpaT+GO9AOoEE3A2TQPXkZ/rcUph3ETr78uOz6GBJC7aovrX6HoPTg9C9qKE0DVNJacDllqv/4WNQrohu8sbJjvbQ2zWhcyTnWcKryU0AagTD9v3cDBIVYrcgVhMm+G7N6yI21pOXUYvlJG59rB2X6dpozwEVVvnI5VV1c/kGoLQ7eo/uxNYPkqlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <40039335-8df7-cda6-c69c-cc94e80cb164@suse.com>
Date: Mon, 17 Jul 2023 15:38:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] x86: short-circuit certain cpu_has_* when
 x86-64-v{2,3} are in effect
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
 <60e79cc5-ad07-81e9-e7e6-f97a73a4df62@suse.com>
 <CAKf6xpt9RTA7sef_QBM=y2gcZURcGzCpU9itUwCD5EPDTtukqA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpt9RTA7sef_QBM=y2gcZURcGzCpU9itUwCD5EPDTtukqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: e065c9e4-ff80-4703-4407-08db86cb1c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dn6IQbiCF9SqHVJwbFP4Gx7CVxEPqFHqlrX+5pz7mGG6+edX37m6U8OM1jIoJHZN3+NxI1QTYfORfTxgCkTkli/lwTZrKzTeEoMpj8cbKSZCtP3yqgH1FVjqcKgkmByU6RQgi2W7LiybTRLcznDsABpxjxSjkWIQCF5Wj5wxOMpO5H/IdSJom/TuB7MocvMg++SSYDGoZ33hexUrmWRrnitCLoulgJoQK7UsbJCA4td5OkvCGFRiWkW9EnpT0J2rEM8mWrsufsHZHkznqXy2VKFvArMPaJS3nHgyAVemrXm06tTRblRzU4cV4DGpiBHgzUAwt0KPLgk52GxVQ3mS4b9MRrUIHJAvia0K49zdt6ryVGQqrxdhyvAsAqrORn81oJgwH8rly+TJRTUkIkmgET90SacKbQsTaaT37CXfvTU9IJ2VRRwfWlS0V4rAeNVRYCfMh7i7XkJnFP6tzQ5rWmO5e27ROX+9JakqX/RQOMmNcP/56pWidJir4CxXo/9D3hmk4d7HxoNWyPzu9lp2MKf39K91WWhV8a5sChXPgmdRQW02QI8CziFNDjIsfqxSLaYHuX56IUEQ8T7YBbfWkogzjAYi9cezB2h7BM6RdqobfpTj6zFactE0Jxk/MhQ8EG1fqN6MaCYohwJcwzU4pw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199021)(478600001)(6486002)(54906003)(186003)(53546011)(6506007)(26005)(6512007)(2906002)(41300700001)(4326008)(316002)(66556008)(66946007)(5660300002)(36756003)(8936002)(8676002)(66476007)(38100700002)(6916009)(86362001)(31696002)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzdNWlVFc0VrZTR6SGd5cW5uQ1JJK3RYb1o4cnFwL3ZEaTdLWE9UUXU2OEpj?=
 =?utf-8?B?cUp1NzNidVdQMW5aVzRidkU2aEtPNU5WWDFlYlZMV2RCQWsyMzdZREhQUUpy?=
 =?utf-8?B?eFFLeWhvV2x5dDVHcnVPTU8zVTBabFdCM0lRQlRNR2ord3NjK3BscTVPRmlL?=
 =?utf-8?B?UitudnkvbUh4dTUydkNvWEJEb1o1d1RibnZMZXorMFpZblpqLzZpbkdEenlL?=
 =?utf-8?B?YzlLbVh5b3V3bFRCUTRjWk9HRUV5NW5IUi9tTGIxQjZFZXNvRmhOc0VxVGNX?=
 =?utf-8?B?RDFOVitCaTZMWlJHR2xVSklDNXJxWDdlTkplZDNkbDRjMG04b3NzMHQxVjJ5?=
 =?utf-8?B?V09uMTdodmcvdUhTcHFqV0F2dzVlSllGbDBuMkRJaDQ0eXZ5SWpoQVo1TXov?=
 =?utf-8?B?UFdlNm83cWw0bmQ4bmpNYWVZUjNRT1N6eWZPQ2pZZEdmL1FWTHBuanFRa1ZK?=
 =?utf-8?B?aTdEei9MUWovUVJVVk96MEtKNTY4bUFrMDkyVEoyTVpTV3BXbUVxMG9IS2hM?=
 =?utf-8?B?UDVFRzdaVG9JYkJmWHRHNHNySm5LMnZGZWo1Qkw2NXd6QjV6Z3pOV0ltV2Nx?=
 =?utf-8?B?aFhFNDFQMVdFNWtudEs0bHpBbVVEaXVqNytmcmwxSnpORDQyUzQ3aDZNaEFP?=
 =?utf-8?B?ZUZjMFQwZXVKODRhT0RYYXlKTmU1M1VjeWdmNVJsVktNcDBxS3RlMHVUVDdZ?=
 =?utf-8?B?eWpZVHhDem1lZUZrZVVVQ0JXd2RLSllLN3A5a0ZUQXUxdWhQQXR2c2U0WnJ6?=
 =?utf-8?B?UndkcXE5dTl0a1plUmlmdnhQWGV6eEtadmlsVGZIcGxVeTRzczlHbVJWR2pv?=
 =?utf-8?B?b3FzL0hkazdCSUpOUU9YSGpBUXNMMTgyYzQvbFAyQlI0SUFkZ0JpZFlRT1hZ?=
 =?utf-8?B?LzlIMkV4UFRCWGl5Z0haN09qZHZJdXJoQTkvZnduMUEvKy9kWHduRkdYMXNj?=
 =?utf-8?B?U2dqajI2alNvRXRBa0xGMjVmLzZmNlBoSlJzczhzSGY1VUFSN0U2VXRXcjkr?=
 =?utf-8?B?ajV4VGZLa3lSQUlPTEcyVXlkMExXZHcxU0pGUURqWkRvKzNqU2VKOFREc3po?=
 =?utf-8?B?SnJHci9VK2NoSHFGTi9pcEZNS09CeVI2aWJzb3RFQmhNZEFBU05INTZPQjZS?=
 =?utf-8?B?Q3dmL09NeXI1QTFQNStxZGU1V2RYL3h4Ri91ekVYWUo5cmxnZmNxczN1dlpG?=
 =?utf-8?B?Zkk1RmZvcjVNcnBVQVNzQ1UzRS9VY3Z1djByeU9SV2NFa09qQ2JaS25abks2?=
 =?utf-8?B?dDVESmNHSmh2cDB0LzZXTDcvWFBpeWF0TzQ5SUE2T2xuR3pzREVKSFk5U24x?=
 =?utf-8?B?MkZKNW9KWk5VS0o1dEw2aWI5YURodVZrL0NkejF2cWhxb1lkaUE0SGVSNDRB?=
 =?utf-8?B?a3htUkt0K1VmYmJmWW0wQmlwSVZlc3FYQWJneGRoWm5qSG9yTG0rd3JtK3M2?=
 =?utf-8?B?UkZwMUtEYWhkV1RuVTZaMm9lUXdHQmtvK210ejRuUHJ4R1JqdC82Z0xFcVRE?=
 =?utf-8?B?Z01Tbm9PYVVJQUt6WXpMZ3ZTb0tUK0g4andjcUNTQkZ0UHp2K0pmR3hQR1pH?=
 =?utf-8?B?UXlCdzl1enM3WUFnWks2OUdlYzZVOFczT3g3dVFwbmw5L0p1bDhDMWR3eWNx?=
 =?utf-8?B?YVMvK1dxMFIwTFh0TzNwMUliTVpOYy9QQ3FQcXIzeWQ0U3JFTFBCRExMKy9t?=
 =?utf-8?B?SFdNc1YvTWVZcWxXL3RBRlhjNFB5NDNlK0NtaGNld2VzVU9aTFMzSCtrOWlG?=
 =?utf-8?B?QnE2QlUzM2Y5eExyWmVkbFN6azl4TU1hcHl3b1JZR0VLWGoxcGxRTFhJanZP?=
 =?utf-8?B?R2dWMityTFpwYmtjWkJsRElPYjBBVitIRnhUeXhJSTV3NmN2OXV4QzRDWlVY?=
 =?utf-8?B?NnNSejhmZW92V0xHY0RWOUtFUmZueGNwOVAxeHNhZU1ld3NhNysxT1hrc3Mz?=
 =?utf-8?B?K0c1cng1SHBKN0h6ZU5hUjBaRHZtcVpFd2F6MzRreW5FVk1kOHN3aGNid0w5?=
 =?utf-8?B?OVRwZ3lnNnN3Z1JtdXlUb3RVK1czYUI1NVBOd0xXUkEzMkpyRmtIeWYrZkk4?=
 =?utf-8?B?SlZzeVpCZ0JUZ2QrTFBEYVMzdzB0Ly9kRlVaREdXL3N2ZXgzSmczbXZaZjRR?=
 =?utf-8?Q?LzMphqNFptzi3Ah2mAIhcgPNI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e065c9e4-ff80-4703-4407-08db86cb1c5e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 13:38:31.6579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p6MixsjYLWRJfdGu7+zb/dGuM7QvhCB56yur1wYMySGFCYwprooOzrw3fkZ/xoMq2Qv5VDDFZstMtmpm+cgSWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8334

On 17.07.2023 14:35, Jason Andryuk wrote:
> On Wed, Jul 12, 2023 at 8:36 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Certain fallback code can be made subject to DCE this way. Note that
>> CX16 has no compiler provided manifest constant, so CONFIG_* are used
>> there instead. Note also that we don't have cpu_has_movbe nor
>> cpu_has_lzcnt (aka cpu_has_abm).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Jason Andryuk <jandryuk@gmail.com>

Thanks.

>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> @@ -76,13 +76,19 @@ static inline bool boot_cpu_has(unsigned
>>  #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
>>  #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
>>  #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
>> -#define cpu_has_cx16            boot_cpu_has(X86_FEATURE_CX16)
>> +#define cpu_has_cx16            (IS_ENABLED(CONFIG_X86_64_V2) || \
>> +                                 IS_ENABLED(CONFIG_X86_64_V3) || \
>> +                                 boot_cpu_has(X86_FEATURE_CX16))
> 
> If you think there may be more ABI selections in the future, it might
> be better to express the "V$N" numerically and check >= 2.  Or you can
> add a Kconfig CONFIG_X86_64_CX16 and select that as appropriate.  But
> if there aren't going to be more of these, then this is fine.

I was thinking this same way: If more appear (which aren't SIMD-only,
like v4 is), we can use a numeric CONFIG_*, but for now it's good
enough (and slightly simpler) this way.

Jan

