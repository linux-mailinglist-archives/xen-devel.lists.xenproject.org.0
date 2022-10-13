Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FE55FDC34
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 16:15:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422220.668087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiyzO-0006uJ-SU; Thu, 13 Oct 2022 14:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422220.668087; Thu, 13 Oct 2022 14:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiyzO-0006rg-P4; Thu, 13 Oct 2022 14:15:10 +0000
Received: by outflank-mailman (input) for mailman id 422220;
 Thu, 13 Oct 2022 14:15:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0LZ=2O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiyzM-0006rZ-U5
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 14:15:09 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2056.outbound.protection.outlook.com [40.107.105.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 637b5030-4b01-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 16:14:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8222.eurprd04.prod.outlook.com (2603:10a6:102:1bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 14:15:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 14:15:05 +0000
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
X-Inumbo-ID: 637b5030-4b01-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9bcXZXc8z4KSN/7zllDAg+ngV4Q5vOsMmEuXRDBwbpreRZP26OY++ZYr+dgOzODdlHgD9arDnO0GKcf6be4nCxYZBVRxwlx4zmHY5FhrOQUMApOLcciXzOuuvbbHnJDb8/VsbaMNdY9bq7SOB3afo4zYPbsLelPjkTYH1FSEzYsf8woKLvBuRkfmaqHmZ+69GYDk2dfMYHtatGFtnEL6O894y2ZFgorJLpUJQqhmoImr9+s5KzapgxsVOhbPg6i5Cv4oW1eIJOYdiXjQjPIclOVRvOqMOwVnOjiPOkTYSx61JakbpvvExOCJ47Hf1FK/XyuzqrBleTWchd7r05w4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIRYfl0xNzvF7QruziNHX0SbfOaCQfZwI+YksurZjL4=;
 b=fUkyJyblx3jeNMDQiGg/4rnUgwTBIu/FAd5TKUc6ugukz9JdJgZXH2t6ApK6xDQJU1KGTNtD8szmA3s3vw9say5uLafsGvLOnska5qaB6pBVqzW5bdy1MgGGqmeJs/LSXbEzhmPONpD32GTo/EPbWvyU/G0ZC16ZI8SFpDIqGEBpr45tAoxZYy66Wuyy4xQ761iu37Kzs94OK/UB9sI8cly1eNn14faM8WWU+iWpk2WSqykT4TC/d066YVfbHxYUGpLnVrL0EQBbVFyCiqgly1F7fNlRJqkBDpJPhx9bCoapvOQvH44OHytTZeuqzCLwrBYLEyihZmlU2r6zgNkyow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIRYfl0xNzvF7QruziNHX0SbfOaCQfZwI+YksurZjL4=;
 b=VdxJ5Z8zB7pAOhac+OicO+SKVU4+MuXsoBzmELmBc50rBP8jVk6eIUf91AtESzOg1c40ryyt1JjEWR6uSRQ05P8seT8bcSwWskcgpOtgZbXCTMoM9LWxklflMxKcF8zu2FTbfdydtvN2ERC+EA2nptl+DX4CH15pIw/l/lSwmEk2pAra/JzrD6ZKsqne+OkWpXUWutQSutwl9529LZo2+iMya52iVfk+QgCnwce0hba/sdtOp8SQ+DNUFqmAezi8A0Aqznq6jzpdhTD/2U0kYs77dAwYtGFSdPYWH1x7O/FZancfmHsedbxu/gl3/4kbtWQ1AjRQBLjF2QCD/KJx0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd2ca7b9-f7a3-208d-f757-cf47f37de1ab@suse.com>
Date: Thu, 13 Oct 2022 16:15:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v3 4/5] x86/mwait-idle: disable IBRS during long idle
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
 <38839202-426f-eb31-2997-ef557ab1583e@suse.com>
 <Y0f+gL1PfB5lzlDj@Air-de-Roger>
 <1867142e-ee46-daa7-c05c-04045460ba52@suse.com>
 <Y0gOOcbw2bebsKAJ@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y0gOOcbw2bebsKAJ@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8222:EE_
X-MS-Office365-Filtering-Correlation-Id: b08d9191-24de-4a4f-9dd3-08daad2553b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G2G3cnOKYzgVMZlYNRvrBwYE5436CvW4S2ZsWdSRw4fIyVPfClzbuYRBwI+R9/rVTWja7AlQZF6U8oM/RQAXzAn0efqTMRH8puXcUqSpIlnWi2h9LPoy+Dcd0BmDZCVbdpY0NQENLWkRGCmvWKagR/oOd74N/uXTO729j+FkCsoysHj4/3JsdDv0oWjFHqoeLsQz7VdgiN2Y9UotLwHOjIrmC/4UHPb7Hx0ops7WBjmxH6EAMPS79kpF2Dq2oI2Cf2wAB16gYR9eaujYo+pog97QuwQvI5zIVbLaCE2Nzn0eEzedD2YNwei9mqOp1RrgRCxADaOKomj/RyH2UQ9Ca3cbZWsKbba7GrnezcMiJDlJHW7ecWHvlFmAdAPLoQIqa28qXd6IY4iQfevD63rSQlj2gEQO9c/KHmofjjhL9dWzx7nE5Cm3SR1coYkHYFKgdvZ0LZvBYu4fkMYlpN46yDUV8R+s5/8xArBf/1NjY0R0sVlp+jfMGx7dCpq5+zqligzBp/Zq8iOWMPo9ycdBqCqrGveYLyPInGu+xTt83Sc0Im0x76Blee6znQMbdocSRTe0ZavWdCFGE0NZ38CBz5qc1H3beQBPhO9SZIl3m4Hblp0RXs9FuErrSKGPjR+JUz/uNdu/NDGZZDJhw86CsZXVF/Cqe5kgCmWn26zbEuPtEjS58Hv7bKTCx17nHTMoY6cXIx7H0xlFI8OTpOnlmTbVgVZWv+siiC2MRvmdL1307Awu1J7kNTE7X59dMfHCPsZ5zRepPJ+pWeydKVSLqSUcDSxi8w7zEFGxnC6+iKM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(346002)(396003)(39850400004)(451199015)(53546011)(26005)(31686004)(316002)(38100700002)(4326008)(8676002)(66556008)(66476007)(66946007)(86362001)(31696002)(36756003)(83380400001)(8936002)(6512007)(2616005)(54906003)(478600001)(6486002)(6916009)(2906002)(186003)(41300700001)(5660300002)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlAxVXhOSUZkcThLYUp6c2djM2loaEJRSVFldjlhTEtlUDRTZmg2ZEZLWmFs?=
 =?utf-8?B?Yi9pU01VcG5EN1J1Zmt2TlBZYTVoMkM1d3IxcEwwQXhnaVhOSDlydnlUYllF?=
 =?utf-8?B?UWRybkcwbkV4Y2FSb2xMclhzS2lXa1R1SjBIcmJmYmVvR0J1cGFNRzFNQm1n?=
 =?utf-8?B?VllHeFF2U2p6VnVJMGZZRy9WTkpFNDM5dWJRN2M2VzlrRGhJNXJnUlRxdDdr?=
 =?utf-8?B?blBEMmtJZmpqemRGSndhUDFSZnBCZjJwYlM2OW1EU2hoeXZmYXhvRzlkUGtl?=
 =?utf-8?B?Q1VWTnBKanFjSTFyYWdReFY4cFNSc3Fmd3VBbzEweFhqelZRYkNLK1NDUkIr?=
 =?utf-8?B?SHBnN3JTYWtQK01MMmpERGV6MjdzcnNEZVd1eVIxcWViOXNlb1NGZk5wTzV5?=
 =?utf-8?B?cFNTeTBJaU1QbTJQTlF6NDBvNDMxQkd5bm9CcVNEcEtpbE9odmZlN0lmblUx?=
 =?utf-8?B?OVlGeFpmVmROcnBZR09tcEtJd3BXOTdMVGZzNm54QjNJRmRqYW40RUFVSHJu?=
 =?utf-8?B?YmpTdFovVXUzSCtHSS9TWDZZUGNhVG96U3p3MnRqYzgxeWIxb0w5enlnWWtG?=
 =?utf-8?B?eWRpU3NsL0paVHVwb1NuZVFZRUFyZXdsemZPOWo4a0lObWJTcHhyRGNIc1Rm?=
 =?utf-8?B?R3licytvRG5yKzQ2bHNISVRROG9EeWIwNC9nWmY1VUFPcDNuN0YyZisrOCt2?=
 =?utf-8?B?aUJUdXplYUhiWjUzTlMxNlhQMjk3TWIvSmlzREtyZmN4OVdFcml0TTJQU0tX?=
 =?utf-8?B?ZkRTajBmcmdOYlVCSHhSamdlQXVHL0l3aWdkUlcyVlk0R1B2NHVUN09mTVNa?=
 =?utf-8?B?VWZjQ1pjWW14aEgySkl1UGVJb2haVHJVS0NwS3p2QmZrb2ZjSWtRbU53Q3l6?=
 =?utf-8?B?UTNMTitwSGtTV3lFaUU5NVk2d0p6bnJzQjNDRnhaZ3JxbmQ3aXBiU2tyS1N4?=
 =?utf-8?B?RVRqSGN2Mmd0N3lsUHhxa2pJOTdvZlllNkFLWE5kZlk1SnRqa0FxL0xJdGta?=
 =?utf-8?B?WjJsT2tGQkVKVmNpb3B3dm1NTmpWeVRLNHlWY2lrTFZ2L3FkcHo3amtkNHJl?=
 =?utf-8?B?ckI2WFFvbW5lY210OUpNbXJJNnJDdVZLMW5KV2JUZThsOW4wNE1JaXdyL25Z?=
 =?utf-8?B?QStmajlTdlhaRFBiS2lUM1B3Mm1hN3p5TnBvVmF4UVdYczlWMEtJUXo3M1ZR?=
 =?utf-8?B?a3RlWEkrb0xyVE5yVUpmZ1FWNG03a0NEUWd2ZTYybmhZNWJIK3Q4SUM5emVH?=
 =?utf-8?B?cDlNcUlxQU9waUhlR1BHOXlKdlg3VWM5d3FTSHpqVVNaYzl2OG1YVHRvaHFT?=
 =?utf-8?B?NUVPeHYxa2pNWjNpSmNxTTZVMzg2dC9QM3RzOTMzOXFNQmlCb08xS3hydHdR?=
 =?utf-8?B?TXhGNjVPbGhpNlhmZGlibUozd1Z6cXBnY0kra21obEhmdmJpdXNMN24xTGxJ?=
 =?utf-8?B?WnBiZk1UY3RGdW8yZElaT2dtWUpSR3FKb2U5SCtFVUxNRkgzWTVpbENJY3hG?=
 =?utf-8?B?ZmM0SjZjYUloUnVCbjVURGN6TDBOUXNGMWtEa01JLzhtbkZ3UllJdzlkcXI0?=
 =?utf-8?B?ZWx0eWt5U1FrcGlvdHhHR2Y0cmU0RjZ0MVpjbTAxS3NoRk1mQzFuemg1L052?=
 =?utf-8?B?T3RsWER4V2xyWVVyaTVVKzIvTnFGTElqZDFjcmZUc0pQa3d5WDBGRlVhNHNi?=
 =?utf-8?B?UDdkWmpTeHdmTVpvT3pLUGdlOHExZVZ3Mit3L1JtVlYxV002VlZQY0Q5T1c3?=
 =?utf-8?B?WHZNY3BuZXpvbkEyM2x5WXJPOFhxYmZDV05MbVFWK0FZNnFIQzhRdW42M2d2?=
 =?utf-8?B?VE53Z0lFT2ZaNWZpK3NnblRTODJQOXcrUXFDK0srZXZWZlhvYjFXQlMyMDlE?=
 =?utf-8?B?M3NwSERIRHk0eXJXd1RqWkRJWGJuaE4yWjg0eklDV0RsY1hDYlV0MncyaVFJ?=
 =?utf-8?B?VDZScVF3U0QvZG1FZ2pMMUNOWlEybXAwbGFHZ0NsQk5ZTjlmTHVaaXFpcU5h?=
 =?utf-8?B?QTFKdUh3OTRtejhwL0twVkVkcnBRVkpNdWRPK0VHM0o0eGRqenJiUzdCYXdJ?=
 =?utf-8?B?RFBsLythcUxHVUlJTFRmLzNIWERlMWFURGxoZlNsQjAwcXY1SGg1eXlucUxm?=
 =?utf-8?Q?/qRsuKiAZQM5kefqKmSmGiieW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08d9191-24de-4a4f-9dd3-08daad2553b1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 14:15:05.6984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c165wlhe/2IycoNCpb4jOycFSnY9WVBUSQJPr4cMU05vQbZmbZbHRT1qcPesnG3FVbLIIMd+pvUNRag1T3hEiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8222

On 13.10.2022 15:10, Roger Pau Monné wrote:
> On Thu, Oct 13, 2022 at 02:17:54PM +0200, Jan Beulich wrote:
>> On 13.10.2022 14:03, Roger Pau Monné wrote:
>>> On Thu, Aug 18, 2022 at 03:04:51PM +0200, Jan Beulich wrote:
>>>> From: Peter Zijlstra <peterz@infradead.org>
>>>>
>>>> Having IBRS enabled while the SMT sibling is idle unnecessarily slows
>>>> down the running sibling. OTOH, disabling IBRS around idle takes two
>>>> MSR writes, which will increase the idle latency.
>>>>
>>>> Therefore, only disable IBRS around deeper idle states. Shallow idle
>>>> states are bounded by the tick in duration, since NOHZ is not allowed
>>>> for them by virtue of their short target residency.
>>>>
>>>> Only do this for mwait-driven idle, since that keeps interrupts disabled
>>>> across idle, which makes disabling IBRS vs IRQ-entry a non-issue.
>>>>
>>>> Note: C6 is a random threshold, most importantly C1 probably shouldn't
>>>> disable IBRS, benchmarking needed.
>>>>
>>>> Suggested-by: Tim Chen <tim.c.chen@linux.intel.com>
>>>> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>>>> Signed-off-by: Borislav Petkov <bp@suse.de>
>>>> Reviewed-by: Josh Poimboeuf <jpoimboe@kernel.org>
>>>> Signed-off-by: Borislav Petkov <bp@suse.de>
>>>> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bf5835bcdb96
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Thanks.
>>
>>> One unrelated comment below.
>>> [...]
>>>> @@ -932,8 +939,6 @@ static void cf_check mwait_idle(void)
>>>>  			pm_idle_save();
>>>>  		else
>>>>  		{
>>>> -			struct cpu_info *info = get_cpu_info();
>>>> -
>>>>  			spec_ctrl_enter_idle(info);
>>>>  			safe_halt();
>>>>  			spec_ctrl_exit_idle(info);
>>>
>>> Do we need to disable speculation just for the hlt if there's no
>>> C state change?
>>>
>>> It would seem to me like the MSR writes could add a lot of latency
>>> when there's no C state change.
>>
>> HLT enters (at least) C1, so is a C-state change to me as well. Plus
>> we may remain there for a while, and during that time we'd like to
>> not unduly impact the other thread.
> 
> OK, but it's not a "deeper C state" as mentioned in the commit
> message.

Correct. But it's also code not being altered by this commit.

Jan

