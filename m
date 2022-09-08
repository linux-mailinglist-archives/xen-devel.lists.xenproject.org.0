Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A03A65B1571
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 09:13:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402726.644594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWBig-0007wA-NB; Thu, 08 Sep 2022 07:13:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402726.644594; Thu, 08 Sep 2022 07:13:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWBig-0007ss-JP; Thu, 08 Sep 2022 07:13:02 +0000
Received: by outflank-mailman (input) for mailman id 402726;
 Thu, 08 Sep 2022 07:13:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56Vh=ZL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWBie-0007qi-ST
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 07:13:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130071.outbound.protection.outlook.com [40.107.13.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab3854f9-2f45-11ed-af93-0125da4c0113;
 Thu, 08 Sep 2022 09:12:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB6298.eurprd04.prod.outlook.com (2603:10a6:10:cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 07:12:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 07:12:57 +0000
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
X-Inumbo-ID: ab3854f9-2f45-11ed-af93-0125da4c0113
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOJIdK+QcVI6rloXySipc5ihlCqspkVXt0RO9FSCdZjElpBsA/y9ZPFtWGgEHPqaM4vNEu2NyrKb53T5HXcrM6nEGzOLUxL4dHj6m+EBoczrXrh636+17o2vDUuSfik2OedRrH/EXqtn0DEzkr9xOpK5Tgzt9Wn0MN6MkAP0SX/M0NMHWygp0FOKmxPd3X6fAOJvycy3XWnX1JCex8ULslDFXP+uEi/h8E+DNCxFze0FR4rNyZ3k9/dR0EHIkGnfRp5KAVTxiX9JQs7DkxARX3u5rClb0Z6lKGAO62lGG3cd2dYiKn8cdOBllUrqemjyY1Ahn0ak2UzjUGBAf/Y6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCr6gW1UrogdeE6AF9LMxtQ38waCBSCVQ1ZMgKlQ9Fc=;
 b=ZZtin7h84k+C0O2mvB54qKOJDYlOCsPi8mjF8NJ8uPHGnx8PiXufDFS3X2bRvgdMSjQBl+Mhb3i7EB9XbGU/LJ75DnlADUP6dzqCzq1IDoDiR5IcHASutgmfK51RvdnnTO+OLDd/PfxcM4CXWkD164Y59pDJ4Tk+mfG+6gV1De6m+Yin1/xSaI6w1CGeK5xh+4TSBVp0DsOPDHlvFU3Gl9nUUyo8D04ESdo1SXP0Rr41z+mxR8JTtSRz5VyYNTi2amJIXA22KTmee2UuVN/HzSceakvrjWsyxe6sVFjs+2Odrc5Xb3N75YxLzKddCS8HnEj6D1C6CnYtfdHtbzEuig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCr6gW1UrogdeE6AF9LMxtQ38waCBSCVQ1ZMgKlQ9Fc=;
 b=hPRFSXaHzrEXnZ0sIARJuT2NnVEnI0L67HuWSAW0AsM3Y31/2m1oj9lDxwb+0MZiAmE2KSfLjukMdUSLDCht2Xw6rvPDG64hJgwqx6a6ewlEEnvKDtaDPiy5r1NQ+Eqib0HLPvb3mUXzLJxrd9r258WPsclj8dSYiDsm9fl3fZB1omc74TXPOPPPdVS7u/HOEvqrqNOsobWW+rO34GuHQafzigooet3kPVwNUxzVEu8SVidA0AQS9ORGzOpyPtydPgwyxxlh+6cM9XVpoRRkee/jHsaiAP8ZBeAnHAr+wPYH/6X6Hg3KDwAZg+dPSAtHfkz7F81SjDoXy6L4zky8xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <917cc8da-5b63-6878-ac95-3db464fae26e@suse.com>
Date: Thu, 8 Sep 2022 09:12:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Unaligned access on arm32
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <c71163f6-2646-6fae-cb22-600eb0486539@xen.org>
 <cffa9f33-dc9c-8b9d-a25b-586b4cf63a2b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cffa9f33-dc9c-8b9d-a25b-586b4cf63a2b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0522.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a918285-6431-4cc0-1981-08da91698e24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xJ2dv+y7OTJgWFQ+cuO3x73IStR1XyBQj87QBzy+Ps4t2jffnV1InN2cRsvqXvriHn3XJRcfvfhJw29+uTWvgd757Xi2qZYJcspQNGpvFLVm4BXamAcfov7JgxisdhaHFzd5vyKWufEj5zyBglboNOzoTpG/mNd4C/X5wK3rdY41s3nWHqeDIwqKmjbOqRCtUNMM31Es6/m40HwqmbeNZkCZX1NBfsmE7+KH8cS/Bwr2ly189COfOn9Y7fI1f/1ozqOscSLhqxstuv9anwjhqRhGm4RCQyvGLeHyqG8iAGHxJ+bi5HtnMqXgx5mo7XH4AkFLDYa/Nf0jSTsqBcmv3yC93DFhrL0GviY/LLkx8N//VcnRykfUHjWTb0rZdWIwnyC+K4XPZrzcdkyyad1R6lV87MGxAH7kNafEU3t6Y7qwm0lANyQ0JGkRhL2Jr9892+qBJX7+qyjdRrM08kYcDouj8U4scoQMz1LcwLONIbtT5jUbuvZF9btD/dMSUIrOkEhysX055CsboyzsJCGFwS7uTUjL4n59oQ8obZiK3NcYZHF6PIIEzCx9KGaFJWLOYuXVre07Mtv5wocivaAcYOA4T6TNBSamev79j2SXxOp+i6iSZ0wLYZn2IBPz7+f4S0SlL5MKEWu/OR1DgTFeleWJ9SKdLuSs/btZ+bPHK9KQdTZKWPn8rPiNj5/fDrK4Q0ugter66o5DK+AKGZR6fy5QpK1ieiMdm4aV8pTGqt5NCzNMnXx4Rgy8eY0ooUBiqqt7De56EgOucpHtSqeo4KLLK/3Mc3vYVy00v4fn3lg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(376002)(39860400002)(136003)(396003)(186003)(2616005)(5660300002)(4326008)(8676002)(2906002)(66476007)(66556008)(66946007)(8936002)(53546011)(6506007)(36756003)(26005)(86362001)(31686004)(6512007)(83380400001)(41300700001)(478600001)(6666004)(6486002)(31696002)(316002)(6916009)(54906003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXFaRzd5WXVQWXF3c1NuOVhwc1M2WHpEN0I2ZDAySEpZNlAreWNGZDZ2VzBp?=
 =?utf-8?B?aTYvWjFzbGV1cmYrMTAzL0RnNVVDbFpmTDJPQXc2TXpYTVMwenpORkNibVZx?=
 =?utf-8?B?NktpWTYxOW1yNWdmQTlzQ3lqNGlzRzRRUjNqYU1iRmlOTkJqQjluKy91enA3?=
 =?utf-8?B?OFkrWldZaHVueWNJY3FQVnMyL1BEa2FNR29GT3F1V1htSkpqS0hPNEJHWU5H?=
 =?utf-8?B?cUE4Y0Jib29ySDNUUEYyaXQ2QVdnNlk1U1BkMXFtVkpuWWNHNkhZMStSVitL?=
 =?utf-8?B?MVk0R1AwT2oxN0pFUnNqSjBYczZ1RndVSFpFYnNWMldCZlNFU3Z0MThrWmRY?=
 =?utf-8?B?U3pRVHRBYVU4QnkxVDVUczhLZEtWdkJVQmlMc3FzZldLci8zNGtaUVBjMWZn?=
 =?utf-8?B?NFdWdm5tQWx2eXowM2xYVFFuczZ2L2RhN0YzVkY4MjQzNnVidjFPcU1CalRO?=
 =?utf-8?B?T1V2WCs2Vy9uYW85LzZNT2lXSEZjaXU0WXY2emRvVlZZcFRXcHJGZDdPTk5Q?=
 =?utf-8?B?UDhGMEhPVlNvQ3g3bVN6dHdzR2l4c3E3Y0NrcVJWQWxwK090WlFFT0dOY0Ni?=
 =?utf-8?B?Nm9QKzBxN2llZ2d3TW1SNUd5bkM0Z0NoR3BGUEd4Qmw1d0ZWTHhwVWZXUFpu?=
 =?utf-8?B?d2kwVTFiK1E3UUoxZXR0b1NPZWliSVFOS3J4a3AyZ3VDM3dld1BhZDV5UjRK?=
 =?utf-8?B?cW9iRStPQUtrb0JMZlltcWxNUyt4bVBSamh2NXYxSDFZWlVvUmJGTHlxQzZ5?=
 =?utf-8?B?VWRZR1Y0RUhCbFBjdzBya3Z6Wll2RDhrSDBvOUdndFNZRE1FMlhhUWZEaFB0?=
 =?utf-8?B?OUY2b2gwYkhjZVdadWNJSlhyanNQU3k0cFNpQnNRTUpNVW1zWjhRMHpmNGsw?=
 =?utf-8?B?YkdHZlNCQ0x1USt2cUxSdnM5ZTc0a2h1OTNndHpYYWNkYUlsYkdSV09rcmNW?=
 =?utf-8?B?RmJqOGVCVzRCcG5IcE4zcmMydjM4STI1SWE0YlhrWmdZNWlPMG5WNDhQNVNW?=
 =?utf-8?B?TFRaY0tObDZkKzgwVk1UdU1ITFV0SEFDU1d5R2plRzRDb0pxay9uL3lPM0pL?=
 =?utf-8?B?Wm85VEEzUmZLbzRPQ0NwcTUzWHUydnpxMTd4eWJKSXFZOWJPY3FmekdNMmh6?=
 =?utf-8?B?aHhYcmQ2eEI1NkxtemVaMGxZUEpuU1k4N1VYUW5UYkFLMkFWYkxHaHMvOFFR?=
 =?utf-8?B?SlUvQ25mN2pJcU92MzVkS3BlKytBdU1TcXBHRGhPcm4xRTN6a2R1OTRNdlB3?=
 =?utf-8?B?Y21YVVBObU9UTWlURVZUM3pHdkxlR2xQWER3d3EyOHRBUkRBUHRHcVRrajlZ?=
 =?utf-8?B?UThvK1kwamhTRHpUSFMwYmUxL1NrUk1PUDc0R2tRMEgzcEtOYzk5emJCWnFp?=
 =?utf-8?B?Z28yVU9BNENhTnFtQUxwejYzWGM5V3hXVndqdWJpUHJzUEtqaVdGNDRacWNT?=
 =?utf-8?B?OU1GOHlxdkFPa1U4cld2MDN1OC95SlY0RzZPQS9IT2x3MXJPK1YrYys2U0lh?=
 =?utf-8?B?VytoaG1Ld3EwL0FBcFplcWxPSGtJcFN0b0lOVDhHTENSMURnbUNHTHlWMUpw?=
 =?utf-8?B?UlJsYXZZeHhhYmttUGd4NkN0OEptU0R3TFU5bDQyNkZMRWgyQmZwOHQxQkJN?=
 =?utf-8?B?UE43RHM4b0xBaHdaUWd2OW1nWEd1ckpMOGpwb042UDNiUnRYandOSVZtVlNE?=
 =?utf-8?B?ZS96QzhPUXZHcjBHU0VpdVFRSzdaSExRL2FSVnZxWXVybHFVcFNRT01Gd2l1?=
 =?utf-8?B?d2YwdGZFZE00QjFpU1dlNGIwUEZZamQwSUwxM1l1NGpMdjJOcVhzUDR4Mjls?=
 =?utf-8?B?UFZNakxMcXIxMllSUUNOVGJyZEhkdkFXTUpVcGxEbTlHU3VjLzJOdkwybnE0?=
 =?utf-8?B?RFNZWUVDR09OLzFQTFhZYzEwcjBIS3Fodnd3ZTZZS1ZHOUNDU1hSREQrZk1I?=
 =?utf-8?B?WDVFUm54ZXhXOHp6SmRxM3BEMjVFbWVQSEhKYjFMT3BJRlZGZlllemFMMlFa?=
 =?utf-8?B?andhNGJsdnc2OVVyOUdPN1AzWkhMU3E2VFNvY2NNaGJqdS9SdW9FS3RrZTBv?=
 =?utf-8?B?SHlzVWEvajdLbU5tbWl6Y2JpQllXVTJhQ0krbHEyUWRBUi9YelhvRXFEcHZP?=
 =?utf-8?Q?TJhttERRFuhauVUPIXKRrrRIC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a918285-6431-4cc0-1981-08da91698e24
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 07:12:57.0545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LBnV9MpbuU+GVZJ71BA2lgKYDzRjrsrCuCGd6WFUZjgqMWXFLK+7aCyyKPPuAAxJXfZi3o8SltKfiGjWnoe4jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6298

On 07.09.2022 19:21, Andrew Cooper wrote:
> On 07/09/2022 16:30, Julien Grall wrote:
>> Hi all,
>>
>> I think mentioned it privately a while a go, but never sent an e-mail
>> about it.
>>
>> While testing arm32 with IOREQ, I noticed Xen is crashing because an
>> alignment fault:
>>
>> (XEN) Data Abort Trap. Syndrome=0x1800061
>> (XEN) Walking Hypervisor VA 0x40027ebb on CPU0 via TTBR
>> 0x000000004012f000
>> (XEN) 1ST[0x001] = 0x00400000bbffff7f
>> (XEN) 2ND[0x000] = 0x00500000bc000f7d
>> (XEN) CPU0: Unexpected Trap: Data Abort
>> (XEN) ----[ Xen-4.17-unstable  arm32  debug=n  Tainted:   C    ]----
>> (XEN) CPU:    0
>> (XEN) PC:     002613b8 try_fwd_ioserv+0x44/0x1bc
>> (XEN) CPSR:   6000005a MODE:Hypervisor
>> (XEN)      R0: 00000000 R1: 00000001 R2: 0022a748 R3: 00000006
>> (XEN)      R4: 40027f20 R5: 40027f58 R6: 40028000 R7: 00000000
>> (XEN)      R8: 40027f20 R9: 4003a438 R10:002f0044 R11:40027edc
>> R12:00000002
>> (XEN) HYP: SP: 40027e94 LR: 00260edc
>> (XEN)
>> (XEN)   VTCR_EL2: 80003558
>> (XEN)  VTTBR_EL2: 00010000bbff8000
>> (XEN)
>> (XEN)  SCTLR_EL2: 30cd187f
>> (XEN)    HCR_EL2: 007c663f
>> (XEN)  TTBR0_EL2: 000000004012f000
>> (XEN)
>> (XEN)    ESR_EL2: 97800061
>> (XEN)  HPFAR_EL2: 0067faf0
>> (XEN)      HDFAR: 40027ebb
>> (XEN)      HIFAR: 67600000
>> (XEN)
>> (XEN) Xen stack trace from sp=40027e94:
>> (XEN)    97800061 0022a748 00000001 00000000 8000005a 00800000
>> 4003a000 00000001
>> (XEN)    4003a180 00000000 bbff47ff 00000000 67faf200 00000000
>> 4003a000 40027f20
>> (XEN)    4003a438 40027f1c 00260edc 002f0110 40027f58 40028000
>> 4003a000 0000013b
>> (XEN)    40028000 002f0280 00000090 40027f58 67faf200 93820006
>> 67faf200 00000000
>> (XEN)    00000000 40027f54 0026b6ac 93820006 0022a748 00000001
>> 00000004 67faf200
>> (XEN)    00000000 00000000 00000000 00000000 ffffffff 68000000
>> 400001d3 40027f58
>> (XEN)    00201870 60000000 67601324 67faf200 00000000 00000013
>> 00000000 00000000
>> (XEN)    ffffffff 68000000 400001d3 00000000 00000000 00000000
>> ffffffff 00000000
>> (XEN)    67601074 000001d3 93820006 00000000 00000000 00000000
>> 00000000 67601008
>> (XEN)    00000000 00000000 00000000 00000000 00000000 00000000
>> 00000000 00000000
>> (XEN)    00000000 00000000 00000000 400001d3 00000000 00000000
>> 00000000 00000000
>> (XEN)    00000000 00000000 00000001
>> (XEN) Xen call trace:
>> (XEN)    [<002613b8>] try_fwd_ioserv+0x44/0x1bc (PC)
>> (XEN)    [<00260edc>] try_handle_mmio+0x2b0/0x2f4 (LR)
>> (XEN)    [<00260edc>] try_handle_mmio+0x2b0/0x2f4
>> (XEN)    [<0026b6ac>]
>> arch/arm/traps.c#do_trap_stage2_abort_guest+0x18c/0x34c
>> (XEN)    [<00201870>] entry.o#return_from_trap+0/0x4
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) CPU0: Unexpected Trap: Data Abort
>> (XEN) ****************************************
>>
>> The disassembled code is:
>>
>> 00261374 <try_fwd_ioserv>:
>>   261374:       e16d42f0        strd    r4, [sp, #-32]! ; 0xffffffe0
>>   261378:       e1a04002        mov     r4, r2
>>   26137c:       e1a05000        mov     r5, r0
>>   261380:       e1cd60f8        strd    r6, [sp, #8]
>>   261384:       e3a00000        mov     r0, #0
>>   261388:       e1a06001        mov     r6, r1
>>   26138c:       e1cd81f0        strd    r8, [sp, #16]
>>   261390:       e3a01001        mov     r1, #1
>>   261394:       e58db018        str     fp, [sp, #24]
>>   261398:       e28db01c        add     fp, sp, #28
>>   26139c:       e58de01c        str     lr, [sp, #28]
>>   2613a0:       e24dd028        sub     sp, sp, #40     ; 0x28
>>   2613a4:       e1c220d4        ldrd    r2, [r2, #4]
>>   2613a8:       e50b0024        str     r0, [fp, #-36]  ; 0xffffffdc
>>   2613ac:       e5d67a26        ldrb    r7, [r6, #2598] ; 0xa26
>>   2613b0:       e14b24f4        strd    r2, [fp, #-68]  ; 0xffffffbc
>>   2613b4:       e5d43000        ldrb    r3, [r4]
>> * 2613b8:       e50b0021        str     r0, [fp, #-33]  ; 0xffffffdf
>>
>> The problem is GCC [1] decided to use 'str' for accessing an address
>> that is not 32-bit aligned (fp - 33 = 0x40027e73). On arm32, we are
>> forbidding aligned access, hence why it crashed.
>>
>> Looking online, it looks like GCC has an option to turned on/off the
>> use of unaligned access [2] and it is enabled by default on ARMv7 (I
>> am not sure why we didn't notice this before...).
>>
>> I have rebuilt Xen with the option turn off and dom0 is now booting fine.
> 
> Any idea which line of code that corresponds to?
> 
> It's storing zero into the stack quite early on, so I suspect it's the
> initialisation of p on the stack.

The pattern reminds me of how I've seen certain gcc versions carry out
(perhaps implicit as in the case here) memset() of 7 bytes (here
starting at p.vp_eport) on x86 - two partly overlapping 32-bit stores.

> There are plenty of implicit zeros needing setting, so has the compiler
> tried to merge adjacent stores and ended up with something that's unaligned?
> 
>> However, I am a bit puzzled because the C code didn't contain
>> unaligned access. It was all introduced by the compiler itself. This
>> is breaking our assumption that the compiler will not break down
>> correctly naturally aligned access.
> 
> This assumption has never been true, and is discussed in depth in the
> Linux memory barriers doc.  A lot of effort is going into trying to
> figure out when it is safe to merge adjacent accesses.  (But in this
> case, I would say it's a compiler bug, if the guess above is correct.)

I don't think that's a compiler bug, but I do observe that gcc12,
while not really generating good code, doesn't generate unaligned
stores (neither for a debug nor for a release build).

Jan

