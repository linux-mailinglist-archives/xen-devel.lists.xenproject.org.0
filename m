Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABE05EC62A
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 16:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412685.656091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBdU-00069y-Ec; Tue, 27 Sep 2022 14:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412685.656091; Tue, 27 Sep 2022 14:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odBdU-00067f-Bg; Tue, 27 Sep 2022 14:32:36 +0000
Received: by outflank-mailman (input) for mailman id 412685;
 Tue, 27 Sep 2022 14:32:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odBdS-00058c-8l
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 14:32:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60071.outbound.protection.outlook.com [40.107.6.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38c620d7-3e71-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 16:32:32 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8219.eurprd04.prod.outlook.com (2603:10a6:10:24d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 14:32:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 14:32:28 +0000
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
X-Inumbo-ID: 38c620d7-3e71-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmsAc0ieuQllPzZnxd9c67Yj70x59m4YKkmr7khcBYjEfchZFxnaIosVBMGn3jGeDXssJZiTd77aabEEqcwkB43pTITAFTY6zb3j8L0giLGdhEtwMkdrDuXU75lvH6UUL3i4OPzc4hxeRbF6yOc+dCWlUJLaD/pHg5VSNxAwwEOdRhx3p+1X0SvkjfkALewUr18hIWjwD5QNQ2/H1rPKbAutVUAt2eATQh+fuyPe7BF9GFitnx8PWB93mzw6q8Kvo1NKiI4ImsbR7jobXG0x8e0aHzikvxQr8wqJR8ooXUK6IIhAI8jsDCWLJTtim7TXM/OCdk4PvTn6KIwMAYrbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Ku4XqXJ2nme3DFlTvWIo5FF6eJDb7Mlwl+qeR5f+Sc=;
 b=Vte/a+N972z8UO5MX0nmmLz+JXGYIsqEbSIQq0D/GTwiAiuz/TE5s40iBJtV60+cMGHtaYsVG0oJj08niu7ahy7GYU7E3UaKSXP84Y4s4WZPQUlkKvX2CWGKsBmNWwtcO7R5+iyGTvKb7gC8TUdx4T2EjiBB1eBcxkfjat6DedKPcZ+jKjkUb+Q9WownoMWRFrmff222ZqMedXLhF8NCtbBKr5fkntGk+ymiDvF62dBVQXKmSe2tkbRp1K/TboWSHp9PRkqb/91G89MtbG7JaIc5CTtEpNr4SX7+aSU9xCOyEdiIsyd6LsK+BfptY3+BBQncjMlGr3kNhyfljM1yLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Ku4XqXJ2nme3DFlTvWIo5FF6eJDb7Mlwl+qeR5f+Sc=;
 b=h9/8uvTeufl5ajjASBYDB7k4fHjeToHZvguNwRdGe8FX0YHuBlENqTHIVFDpl0Mr1ov63P/sfap4eyNeLYJjQMpJavNZffz7h+U7UM60Z3b5dg4vKzUGHJV3qaOF1w1bWGs5JjIBGCd91DkHG8X2cgkUHswUBC3aFYG4tWlWQKEe5HKmrWGsXe0xgscZ/FSxaG8HMbvk1nrHgTAbXbj6cNLkHbmYB5zP59Uk1tsEJGp1uuIinmycNDBT1xKn7hrM1Eh9yZ/J5K0TFQ7mJZ76pYVOcnv7Qsrbd05KsjCv7yA0xTvQJBBbNuRtL+WaIdIrdvKUeZoPKmV7juzWY0I5/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb89a942-3d34-b290-3977-3165f71a737c@suse.com>
Date: Tue, 27 Sep 2022 16:32:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] zap linking-only option from EMBEDDED_EXTRA_CFLAGS
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <d640d386-8b6d-5e1c-4dd5-b5d928ab8b2b@suse.com>
 <YzMFLffjWLzz4nW6@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzMFLffjWLzz4nW6@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 75f9f628-7234-4afe-258c-08daa0951adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	23uMHaaaE2e9/6r0/QjzF0JG3/R7l06G7u56yBo69CqxguxNRmmsDgdWSpF4onlJl1y6M6A0X1dfIvR3GLtzXITSZMF2+oD097sv7jBGmGm5ZcrrcD8tbwR/rxBS38yxj5hj8XG8cOlbH/3sQrFGOedoCkiSjPRfitm74czG5edoMTjlUhzhU3l3bnXgUoEO34jX1m+8Yg0XbfJaDz3G+clkt8TIS/wLYDdyiDC/zrgkt15rjBQWWqRNTnS6LjO2ipvgupKUlap7udAYtJ29p7fhznrlHivyKpht9IObHTazleJS/7DotAsRMm49iaKocZBvpei0UQyAhtXlZMpAW+6RN4UPFBo1xcrldwUcSGaEj3Eb+ey2DSuSf9yfOkf4rqxP4LIt8nOhUopANe8JZXuFS8+vsgTvo/sjkz40/e0TzLW6hPoisM0Pqwp3hsnk9HzoDSBzlcOiJIPLgsFgOLHZ96koATK5nks7GgqoXlViXO860IE2TDEIwz8nbWdJswgpotQlMQs7DLHcWgE7WOe1fKeTgOLaUMsUM7vSQ10CbEGC3ekXpzxTyHnq69tm2lMw5/rldXV4kcqzTUQw15yVj75a3whMMr6L8aNqPVHMAEQwawr5TRRl+7Wa6kQiAcqigRYK59ZtDXsClIuJ19j9TRt1bm2l3vlZIVCd0b61OVEcrkpS4NE2ElQkew2ofBnD1xJY4JNQ25DvSzv69EP4cQ/XjkjFG8W0HD+wPeA/5qBn8HD5Ews/34gAJVOCNClCqo1mEXk+gOq7slFuc+9xEbFyLY9vM390VhAzH2I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199015)(83380400001)(31686004)(186003)(6506007)(8936002)(41300700001)(38100700002)(2906002)(2616005)(316002)(6486002)(6512007)(5660300002)(478600001)(26005)(36756003)(31696002)(4326008)(8676002)(66476007)(66946007)(66556008)(53546011)(6916009)(54906003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm5pZnNjNHg1ZHhud3J1R0FQaUoxUXVDbzNVRXRobnpIM3hmS0VoN2lHbHZz?=
 =?utf-8?B?TW5QMU9FcHFSVjhNVVMxT2VDa3VBQjlzbWNRS2k1bHZmVzBPTFQ0dEp5UVJD?=
 =?utf-8?B?U2N6WTYxbE04dVpZZEp3VWh0WElLdHh4YzZRL1VtS0JVZ0NLVTBtMytVQTR6?=
 =?utf-8?B?dGFITFdNQWg4bXFtNnFEOHNWWkthWnN3UE83dkJMUTRaUmZGc25HVklqRUJt?=
 =?utf-8?B?UFJmcUZuTUE1RVpXbFpVTVoxWUpodjFwWWFOQTV2M1BncG15NWtWdUJmNDNr?=
 =?utf-8?B?VDVnTm1iaVFyUVZnb1JHRXdFYkR5Y0hzOElkMjVEalg5cGYvWmMxVkF3VW9j?=
 =?utf-8?B?QkRUdmdNQlA0bk5wbmlDUmY1VTRsK2E0bGtWN2pkZmswRzI4VkhKeUJtcXJ1?=
 =?utf-8?B?Y1ZMT2krQmltSlZ3a3Awd1BhZi9IczNZRGZkT01nZ25OWk9sQXNMYTZucWM4?=
 =?utf-8?B?Q3RGOG5sWVFab1E4Z1BPU3dlQzJTQjZUOGI5WVpOUlA1QXF4Y1Uzb2Mxc3BM?=
 =?utf-8?B?cWY5WE5Bd3BDSitWYnBYZG5JdG5ldjZHOTRFaWtHZEhqQXNzUDF4T1ZKU0tm?=
 =?utf-8?B?aklsU2dQMUhWRlpSL0lUTHBYNHM4cTN5QklualJMbzJPVTRsWlBGNG11Yitx?=
 =?utf-8?B?QXdqeWp0UFJoeEFlSlpWUWdLcGo4Mnc2ajN4bnoydms0RkZCV2lvN0d6Tjdm?=
 =?utf-8?B?dldZWWt4a2FLbWwxS1VWTk13VzlINGd2MTIxMWhPOFlhWG5JeWt6aHJiYkhX?=
 =?utf-8?B?NkkwSzNabjFkSTlmQ2xLN2oreitUVVkvMUJ3ZnlqSlU4UklINHRKVkRiRXR6?=
 =?utf-8?B?MCtJTzlYUTJWNWNEWmNvTktjWFNZbW40Q01ZMnRZT1lNTzF1dGI0SlgyZUpG?=
 =?utf-8?B?end1cTFTdHRvWWp1Y1NyNkFVREUwVkdTd2J2MThnWDJBbjNVM3EzcWJPRVlK?=
 =?utf-8?B?bVhjb3N2eEMxY2hLWEJlNnRSa2dVQjBSNEE2cGErVlNidVBNaU1mb2hZc29M?=
 =?utf-8?B?TENhNllNZm9MUWFteEhYL2lURzhycjZlM2N0ZERiTlgvV2ovU3ptcERsem1X?=
 =?utf-8?B?QXJpVUhmU25JQUJtemFFUUozRUlCcGVnOG02N3loTitXVXAxZzZyenRtM2pZ?=
 =?utf-8?B?N2xTT3ZoNTdQMmE3K0ozc0NtcUdzZGdNOTczUlMyQStXLzBZRkZ1MjVRVmls?=
 =?utf-8?B?dEFJUmpMbnBDQStRK1RzeUJZMGVpN1l5Q1JUcStreTUrVlNRVXNyWlNFRzVn?=
 =?utf-8?B?RHNnTHc3aEZlY2ZRb1o1WWZtYmZ4a1ZxTURyUnZuNDRXRWVqaWcrYjBZYVNy?=
 =?utf-8?B?OWpubjQvSHB1U0lXSkJXVWMxZ0RsRERLeFBtVENxdTFZdkFpMVE1dTA1UEd1?=
 =?utf-8?B?YmRwTExMNWc0aFlHQTUxQWVyVTZUTjh3dlRCeFZqdFR4UkdjOU1KOHVla3pR?=
 =?utf-8?B?OWRhTUxaWUZNR01LMi9nZFJ2SUdTSk9KbDMvTStUanA2ZExFelBuNUpRTWxT?=
 =?utf-8?B?aElvVjNGajZGVFR5SVhMT2krWlkwVVBSUlJNTFpzenY2MXBwVkoyQzNSTFRD?=
 =?utf-8?B?aVpKdGRvc0FXWUpNc3lyaEdXalpOdTZReTFyeU9KUFlnQ1cwY0xabUxuY1J1?=
 =?utf-8?B?Q05zTittUUU4ZzdjN2FpYklWZ3JESEtrUUxvRUw0UVVSVW5XeTBUdkVtU080?=
 =?utf-8?B?SUtuWGFub3NTOU1zV05LTWhCcXJNRmpsTURjODlBNmozQUZCbHhXTGxoUFJP?=
 =?utf-8?B?Rk5MaFlqRmE4VzZiRjA4dGk3VWdKYXpPV1dXM3BHdnhodFFncXNiMVEwSmFv?=
 =?utf-8?B?ci9OVWczZFVVbjVBRHp6Zy90bFFPMGEyZUhxUUZrbkRZb2h4TUxGdi81R3F0?=
 =?utf-8?B?K3UxSjVXOFljbGgrZysvbHlKek83Zld4MXJ2VWZiSitjZXZUVWZpWnpVYzM3?=
 =?utf-8?B?Y0p2ekhGVXR5ZlhxUjBCVXh4dHkxUEErZDZEK0toUDN6bGwwVWpYYS9HVkFa?=
 =?utf-8?B?bVI4clVQSGVjV050NmpQUWdlQW5pZEp0R3RaVi9DTEVaSmJtdVk3TmtkRnJW?=
 =?utf-8?B?a3VGU0FvcGsyQkNjQnFNSHpveWRKeUNnRFp2VkYyRm94VUZ0aElGV3RSbk1U?=
 =?utf-8?Q?+so9yCYAnGhosDCFcEf2NhRom?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f9f628-7234-4afe-258c-08daa0951adc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 14:32:28.8646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g8Du/NGcJnv8Iu9MItaUOfqewnVeUzOh8mAe8EsW+wgMlh49RCuAxcZ3AUmRPS+v70Tw//eWczuEHHKgFiXoLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8219

On 27.09.2022 16:14, Roger Pau Monné wrote:
> On Fri, Sep 09, 2022 at 09:22:52AM +0200, Jan Beulich wrote:
>> While I was suspicious of the compiler issuing a diagnostic about an
>> unused linking-only option when not doing any linking, I did check this
>> with a couple of gcc versions only, but not with Clang. (Oddly enough at
>> least older Clang versions complain about the use of '-nopie' now that
>> we actually use '-no-pie'.) Filter out the problematic option in all
>> cases where the variable is consumed for compilation only (which right
>> now is everywhere).
>>
>> Fixes: ecd6b9759919 ("Config.mk: correct PIE-related option(s) in EMBEDDED_EXTRA_CFLAGS")
>> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Arguably with all users of EMBEDDED_EXTRA_CFLAGS using these just for
>> compiling, the option could be omitted from that variable right away.
>> But if any compile-and-link-in-one-go use appeared, there would be an
>> issue.
> 
> Is it feasible to have compile-and-link-in-one-go in one use feasible
> with what we consider embedded (firmware or kernel like binaries).  I
> would expect those to always require a linker script and a separate
> linking step.

A separate linking step doesn't mean this needs doing via $(LD) - it
could also be done via $(CC). There's also no connection between using
a separate linking step and using a linker script - aiui the linker
script could also be handed to $(CC) for it to pass on the option to
the linker.

>> --- a/tools/tests/x86_emulator/testcase.mk
>> +++ b/tools/tests/x86_emulator/testcase.mk
>> @@ -2,7 +2,7 @@ XEN_ROOT = $(CURDIR)/../../..
>>  CFLAGS :=
>>  include $(XEN_ROOT)/tools/Rules.mk
>>  
>> -$(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>> +$(call cc-options-add,CFLAGS,CC,$(filter-out -no-pie,$(EMBEDDED_EXTRA_CFLAGS)))
> 
> Is the x86 emulator harness correct in using EMBEDDED_EXTRA_CFLAGS?

Yes, I think it is (here): This is the script to build the blobs we
then have the emulator process. Of course it wouldn't be right to
use for building the actual harness executable.

> TBH I'm not sure the naming and usage of the variable is very
> helpful, maybe it would better be STANDALONE_EXTRA_CFLAGS, and drop
> it's usage from the x86 emulator test harness, open code the needed
> flags for that use-case.

I agree the naming is, well, odd. I would be okay with the proposed
alternative name, but I also don't view that as all-so-much-better.

Jan

