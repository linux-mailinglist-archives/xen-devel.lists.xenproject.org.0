Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFE66FB011
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 14:33:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531496.827218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw02u-0003nZ-Sn; Mon, 08 May 2023 12:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531496.827218; Mon, 08 May 2023 12:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pw02u-0003kf-Ov; Mon, 08 May 2023 12:32:52 +0000
Received: by outflank-mailman (input) for mailman id 531496;
 Mon, 08 May 2023 12:32:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pw02t-0003kR-BP
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 12:32:51 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71ce1d66-ed9c-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 14:32:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9318.eurprd04.prod.outlook.com (2603:10a6:102:2a5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.31; Mon, 8 May
 2023 12:32:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 12:32:19 +0000
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
X-Inumbo-ID: 71ce1d66-ed9c-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEZMnXKndzpA6XdwcjBjIfNx4MtGsrAvH0l8/f+fJicKwj0I32vZPWGqLYj/RKFUmUSAVBuocPPUAscGxVxEgBw/Chl1qHuaBJA6EXFo6mGXrA1UodZ7aQVAv57S/CwOvzItznAVdFdW1eiTlYddCd9e23z69mj/UQ4uVBWv5/fh8vyVUq4UgSlqh6VVP4+BbXfEu/IVNB6Q7SJSncOaaMq9WQYty8w4u7MHMo2mEHIGWMjRAaUxCLWtjYEP1XjxS24A1XOqlOOZ+mop/9NNvvvVtOCQEykIhMUH+NKDdWgkFjTjdm1zS1SGC4fwgk94LEVyXZgek0PT80g3roH7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5Qg+ImWbYH/+Yy12xrDGChaMfeAnfUy605gAGbDUlA=;
 b=KqOShkVIKSGzntf6Yk05TEy3TJ1h9cKDMK1i6FZ8LnlhFz4J2MGsDe0ruHMFBqJBeR/L8gL/U0rZQDgAblo2YCv+Q8elmxbPed7n7ZDFwMCCRTrGoHPgLOd8xjjDd5P33Uhby0nh4Tm3ZxpZlvuDkbCUibL3dM2QBcQ5yUnF+nAUv25z9TNjcp8zqhDn4AtEcuG3llArjL4UC+/Xl4bQhZlR1ND2IEhuGxz/z0lK62SCx1A4nxypRpwCz6l1kDqrQqqhAXY4eb68kq5H1UwmXX7uWKvOTf0d8fhOJ7066I2QBPdiA7K/kus8+VH18CkTjpg0YwZSEZseZCxV1nlnWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5Qg+ImWbYH/+Yy12xrDGChaMfeAnfUy605gAGbDUlA=;
 b=vzjTYd75GRABI0iKJy2LBxUD9KbP9jPkUiLdL0vTSq/6rk7d4aqou2wuPpP/jcGYspevO4u/pdywmP/dSL6BV6cUg9/NNvY0MNEkAbFTLX1b5QJDZ8Nj+tWAcMwrzuty1FNAcHlvjfUWr7hay3CQy/JiSqn7PtiMChenQetjkicMFmxvwNSib4FpR5vHGQhea3ILog8SmUTjGG/xwzhLt6TNnGQpkdXwHBE8cL1z/iUMGMjCPEC/uc0iToOxp6i79dBNeGKKx9xHHlA2G3ld2g/UZq5Dd6ro8PW5f7eARJSk2L+Yu6zgfQJNenTW0I9KiRY73BSR3Gte/cl8OCoiDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33865bc0-2c90-0501-0ef5-65818973f417@suse.com>
Date: Mon, 8 May 2023 14:32:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 2/4] x86emul: support CMPccXADD
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0b2a4e8c-ab43-4e6e-2c51-027dcdf1425d@suse.com>
In-Reply-To: <0b2a4e8c-ab43-4e6e-2c51-027dcdf1425d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0101.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9318:EE_
X-MS-Office365-Filtering-Correlation-Id: 9874a92e-9590-4418-c82b-08db4fc043fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xtrCO/0lSJTrZeYluK7qH4Lm7FkziCgFFCtBkwDZEbStLXRp/JhxgVqOaytRLX5yWz03G31ByERGPT5C3K1SXvQV+JikAv2Cmj2B3F9lm3az7HvZU6p4OQBS+1EOK3v/STHj5CEh5XcrFFsS/V0l66pljNadi0+pZhc3IjcjMIpv6YAckHiMgDGCURwpqSomrWecCJJbWJ0+NknJFM2n8tNT5AufPckBbVkXJVPzIMi8tgImOOq8Dz8eME+zLWVb853w+z89ebMJCmw8Yh/BfpWy9Bw+5vnUxrEm8UnKcdMi8clxaTM1N7ppjQe/9BzNWmEizY353jDGlvld9ocBjdsXvOmFMaRmwaoNwnV7Eps5qPBQQLmCFf4OikVSaFCbfhJ4l8qmMTWa4qYMXznUq8POP29kF0XE+geV28q18NWAz+v8heTnMz02FzvtW6kW8vmIr/Om/jbLGSLHwDFPUuPOrKTG9Pf33Qa/artioaXxfPRWk1U4UKIMUXOG6jxsXob8u0mh411RjWk50xsV2tPZkAK/v/01u730c9wDd+JdHEKi173xlUwnSxeKvtBht8ecnyDJBAf2rgxXk0TV2qsdJy2SMPi2ZTOoQwf6nq0UcnKAmnmOkbYsN7BPzR/i48kgxwov0Cy0PI0SpPWJrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199021)(31686004)(36756003)(38100700002)(2906002)(30864003)(8676002)(5660300002)(316002)(86362001)(31696002)(8936002)(6916009)(66556008)(66946007)(41300700001)(66476007)(4326008)(83380400001)(66574015)(186003)(6512007)(6506007)(26005)(6486002)(478600001)(2616005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUlmYllmTWQwbUtEOEEvYkFTVVdXL3pwamdmMHkwZzF4clpONHJFVDNwdTVs?=
 =?utf-8?B?YmI1QzRHamUzMDIzM0lJTmJwQUZla2lDTXRxaENqb21MZzl4TUdiK3hGRVhz?=
 =?utf-8?B?WGNXQVdPdjdiNWtOZnRJSnZDS2JzVWJjVFZCVitsRnBBSnE5WXFjQ3A5UC9n?=
 =?utf-8?B?ZTBBRjBhdjk5VU1qSERTRHpQS2pSRFBXMHN5TWZoUTVQamlsNGVqODdlRUpH?=
 =?utf-8?B?OG1JQ2hKWW8wcXpjQjJxc1p1TEM0a1ZSaDdXQkhaUVpjYTJITzYyYzJzMnRn?=
 =?utf-8?B?dHFuYjEycis1bWdkeFVwUWxsWkFyQko1MHNoL0tMa0hlakQrV0NqOWNZb2dS?=
 =?utf-8?B?ODZjWk9IaTNNbEI2VUFBOThVWXY1VmtjcWZVOEk2Y251Z2lDM3VuQVRnWHpw?=
 =?utf-8?B?NnJDZ0RRMVlEMmh3bnhzQ3pPVVZTT1FrOGUza3VnaFQ4Tk1RTnE3dTY5dnQy?=
 =?utf-8?B?M05oOUJvbVVIdi8yd1ZiMjBOVHdPNzZPa3JqVXc5SzRkVWZnTWg1S2tmSmlD?=
 =?utf-8?B?MmRidzFiTzlEZnhRelVRZnI2WmxPLy9lb0k1c0V1NGxhMitxdG9KSzJJZWF2?=
 =?utf-8?B?ZU56Q2ltMExaTHoyZmRtcjJva20xMUp3UjJRa0VKc2pWc1ErcnozaWd2UWxm?=
 =?utf-8?B?OTY1L0crbEVNa3RiSUVIenlCdVNGNlJKQnRyZk0rVnMySGlrWFBQVXBTQ3R2?=
 =?utf-8?B?d21iNGowOThoZTd1WGdtWXR4WXhzYWxBTDZqZVE0eG9Gc3Uwb0lkclYxbU0r?=
 =?utf-8?B?Vmc5V0hGQnhjWmhSdTNLSkJlVWNYMXFRUUNaNGZDMk4wS1pKMCsxNXgwTldC?=
 =?utf-8?B?WVM3bGpVbXBOOHZad2RZYTNBbTU4Nm01US9pWm5DejlnbUVLa1VxWE5ONHBX?=
 =?utf-8?B?Um5rYjB3dGRFKzJkTWJUcVVMQXVvaTJCRnl4Vi9Za2xndkZwLytDSGtyRUdy?=
 =?utf-8?B?U2tHbjg1OGI1cHVTUC9IVG9lN2FTeW81aFZhSnJ3T2pyL2hoMkNCTkswNWFo?=
 =?utf-8?B?enRGanRkUWMwWFZHQW9NbzU3b0pUeUVsQWtaS21KRHdxNUhkNkdJSWZuZ0gy?=
 =?utf-8?B?bWVEMEFBVXVmR2tKblIxOS9KT09nOFBENHZoRkhNRisyNWJTSVpXL3lwY3F4?=
 =?utf-8?B?bTVyQ0Q5NU5tNElpNEZrUkNUTTd1QVlRc2pKakhJSGNsMkhYUXg1eXFoa3Rz?=
 =?utf-8?B?ankxeWxDWGFjQWlseXRDOWhwc0cyWURUWElNZ2NTWnp0M2t3U2RmRXVUZytz?=
 =?utf-8?B?REtiU0lBcDFIZmVjaVVSc3FaRHAvZzdQMEJ4MTJkMzZ0UGRZdHhEbmQwOGxP?=
 =?utf-8?B?akNlZzQ1RkNFWmNWV0N0cmRPdUdJaEN3UW1SWUVYQkxsUkRGa0pyckhpd0Mz?=
 =?utf-8?B?K3RQWlgzVHlKRWFrZ3VhL2J1TVVySElLaG05dGUyU0lIc1VsU0FYa0ZsTWJy?=
 =?utf-8?B?L24zd0xqUXNacFFCYUZhQWJiNEpkWk14U0l1NENoR3B0cTJZQW1TcUtvSmc0?=
 =?utf-8?B?SWhUeXYxUTN2bDFJVkFFbUs1NGFPVjZjVjFhbWFWTDZSY016dDRsaW9HMnB3?=
 =?utf-8?B?K1RPT2ZzOFRZTkxBNG1pUDhmVHBXa1c3a3dpYTc1N0o4dStSTk5kSXdNemtN?=
 =?utf-8?B?ZUNnZnJUaW95TXI2bzc3bkRycTNGTWJzZkVES2FGdUpING9JMTVpZTdIaDEw?=
 =?utf-8?B?bFV4S29nZHpUaDZSYU9DNkhFcWExRXlHa1ZJc29lVlNBSDRQNHZkNEFJUGg3?=
 =?utf-8?B?ZGJsbklUMFFEcndqMlAvcnlzQ2RDalN4bVVvaWc4S3cvWGdUNStMb0VKUlBU?=
 =?utf-8?B?c1RnUEFYc0NESjVxZWpxbDNOc0llN1htZ3VvdUxEN3NheEhSdnRONU4rYW9T?=
 =?utf-8?B?U0JER3RCRk1TOXkxaVNVWCsrQWxYRWNDM3ZIcE4rL2JhTDF2ZXM0UE8wdUpO?=
 =?utf-8?B?MzZnSFlHU2xFNUl3Ty9JWFZDdzNRbFlPZll6WGxjc1ZudkFqZFZHM05NTlpG?=
 =?utf-8?B?U0xaemxrckw3cWFMUmhrbURCdzkrMVQ0ZGlJSVRKNHE1cWVDalh0NGs1a0hy?=
 =?utf-8?B?dHh6SE1SUVM0UmYzQjFZQVJDbHVDTHNXVkQ1RVg1OXNMdjc3K3h2RVVkZmhq?=
 =?utf-8?Q?ObURvX23XcXao5nR0hPbGL0C+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9874a92e-9590-4418-c82b-08db4fc043fd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 12:32:19.7984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoU+21pGfpQlgWgEL/BK0UcrR7pGm2gbchRraPljI3p2lgtfmQbBLXl9jPR3/tairSfRAiR+Gt56URYR6S95XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318

Unconditionally wire this through the ->rmw() hook. Since x86_emul_rmw()
now wants to construct and invoke a stub, make stub_exn available to it
via a new field in the emulator state structure.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use X86_EXC_*. Move past introduction of stub_exn in struct
    x86_emulate_state. Keep feature at just "a" for now.
---
SDE: -grr or -srf

--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -232,6 +232,7 @@ int libxl_cpuid_parse_config(libxl_cpuid
 
         {"avx-vnni",     0x00000007,  1, CPUID_REG_EAX,  4,  1},
         {"avx512-bf16",  0x00000007,  1, CPUID_REG_EAX,  5,  1},
+        {"cmpccxadd",    0x00000007,  1, CPUID_REG_EAX,  7,  1},
         {"fzrm",         0x00000007,  1, CPUID_REG_EAX, 10,  1},
         {"fsrs",         0x00000007,  1, CPUID_REG_EAX, 11,  1},
         {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -186,6 +186,7 @@ static const char *const str_7d0[32] =
 static const char *const str_7a1[32] =
 {
     [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
+    /* 6 */                 [ 7] = "cmpccxadd",
 
     [10] = "fzrm",          [11] = "fsrs",
     [12] = "fsrcs",
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1403,6 +1403,22 @@ static const struct vex {
     { { 0xdd }, 2, T, R, pfx_66, WIG, Ln }, /* vaesenclast */
     { { 0xde }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdec */
     { { 0xdf }, 2, T, R, pfx_66, WIG, Ln }, /* vaesdeclast */
+    { { 0xe0 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpoxadd */
+    { { 0xe1 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnoxadd */
+    { { 0xe2 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpbxadd */
+    { { 0xe3 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnbxadd */
+    { { 0xe4 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpexadd */
+    { { 0xe5 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnexadd */
+    { { 0xe6 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpbexadd */
+    { { 0xe7 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpaxadd */
+    { { 0xe8 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpsxadd */
+    { { 0xe9 }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnsxadd */
+    { { 0xea }, 2, F, W, pfx_66, Wn, L0 }, /* cmppxadd */
+    { { 0xeb }, 2, F, W, pfx_66, Wn, L0 }, /* cmpnpxadd */
+    { { 0xec }, 2, F, W, pfx_66, Wn, L0 }, /* cmplxadd */
+    { { 0xed }, 2, F, W, pfx_66, Wn, L0 }, /* cmpgexadd */
+    { { 0xee }, 2, F, W, pfx_66, Wn, L0 }, /* cmplexadd */
+    { { 0xef }, 2, F, W, pfx_66, Wn, L0 }, /* cmpgxadd */
     { { 0xf2 }, 2, T, R, pfx_no, Wn, L0 }, /* andn */
     { { 0xf3, 0x08 }, 2, T, R, pfx_no, Wn, L0 }, /* blsr */
     { { 0xf3, 0x10 }, 2, T, R, pfx_no, Wn, L0 }, /* blsmsk */
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -1398,6 +1398,78 @@ int main(int argc, char **argv)
     }
     printf("okay\n");
 
+    printf("%-40s", "Testing cmpbxadd %rbx,%r9,(%rdx)...");
+    if ( stack_exec && cpu_has_cmpccxadd )
+    {
+        instr[0] = 0xc4; instr[1] = 0x62; instr[2] = 0xe1; instr[3] = 0xe2; instr[4] = 0x0a;
+        regs.rip = (unsigned long)&instr[0];
+        regs.eflags = EFLAGS_ALWAYS_SET;
+        res[0] = 0x11223344;
+        res[1] = 0x01020304;
+        regs.rdx = (unsigned long)res;
+        regs.r9  = 0x0001020300112233UL;
+        regs.rbx = 0x0101010101010101UL;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[5]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x0101010101010101UL) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (X86_EFLAGS_PF | EFLAGS_ALWAYS_SET)) ||
+             (res[0] != 0x11223344) ||
+             (res[1] != 0x01020304) )
+            goto fail;
+
+        regs.rip = (unsigned long)&instr[0];
+        regs.r9 <<= 8;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[5]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x0101010101010101UL) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (X86_EFLAGS_CF | X86_EFLAGS_PF | X86_EFLAGS_SF |
+               EFLAGS_ALWAYS_SET)) ||
+             (res[0] != 0x12233445) ||
+             (res[1] != 0x02030405) )
+            goto fail;
+        printf("okay\n");
+
+        printf("%-40s", "Testing cmpsxadd %r9d,%ebx,4(%r10)...");
+        instr[1] = 0xc2; instr[2] = 0x31; instr[3] = 0xe8; instr[4] = 0x5a; instr[5] = 0x04;
+        regs.rip = (unsigned long)&instr[0];
+        res[2] = res[0] = ~0;
+        regs.r10 = (unsigned long)res;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[6]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x02030405) ||
+             ((regs.eflags & EFLAGS_MASK) != EFLAGS_ALWAYS_SET) ||
+             (res[0] + 1) ||
+             (res[1] != 0x02030405) ||
+             (res[2] + 1) )
+            goto fail;
+
+        regs.rip = (unsigned long)&instr[0];
+        regs.rbx <<= 8;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( (rc != X86EMUL_OKAY) ||
+             (regs.eip != (unsigned long)&instr[6]) ||
+             (regs.r9 != 0x0102030411223344UL) ||
+             (regs.rbx != 0x02030405) ||
+             ((regs.eflags & EFLAGS_MASK) !=
+              (X86_EFLAGS_CF | X86_EFLAGS_PF | X86_EFLAGS_SF |
+               EFLAGS_ALWAYS_SET)) ||
+             (res[0] + 1) ||
+             (res[1] != 0x13253749) ||
+             (res[2] + 1) )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     emulops.write_segment = write_segment;
     emulops.write_msr     = write_msr;
 
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -185,6 +185,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_serialize  cp.feat.serialize
 #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
+#define cpu_has_cmpccxadd  cp.feat.cmpccxadd
 #define cpu_has_avx_ifma   (cp.feat.avx_ifma && xcr0_mask(6))
 #define cpu_has_avx_vnni_int8 (cp.feat.avx_vnni_int8 && xcr0_mask(6))
 #define cpu_has_avx_ne_convert (cp.feat.avx_ne_convert && xcr0_mask(6))
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -170,6 +170,7 @@ extern struct cpuinfo_x86 boot_cpu_data;
 /* CPUID level 0x00000007:1.eax */
 #define cpu_has_avx_vnni        boot_cpu_has(X86_FEATURE_AVX_VNNI)
 #define cpu_has_avx512_bf16     boot_cpu_has(X86_FEATURE_AVX512_BF16)
+#define cpu_has_cmpccxadd       boot_cpu_has(X86_FEATURE_CMPCCXADD)
 #define cpu_has_avx_ifma        boot_cpu_has(X86_FEATURE_AVX_IFMA)
 
 /* CPUID level 0x00000007:1.edx */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -433,6 +433,7 @@ static const struct ext0f38_table {
     [0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xdb] = { .simd_size = simd_packed_int, .two_op = 1 },
     [0xdc ... 0xdf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
+    [0xe0 ... 0xef] = { .to_mem = 1 },
     [0xf0] = { .two_op = 1 },
     [0xf1] = { .to_mem = 1, .two_op = 1 },
     [0xf2 ... 0xf3] = {},
@@ -924,6 +925,8 @@ decode_0f38(struct x86_emulate_state *s,
             ctxt->opcode |= MASK_INSR(s->vex.pfx, X86EMUL_OPC_PFX_MASK);
         break;
 
+    case X86EMUL_OPC_VEX_66(0, 0xe0) ...
+         X86EMUL_OPC_VEX_66(0, 0xef): /* cmp<cc>xadd */
     case X86EMUL_OPC_VEX(0, 0xf2):    /* andn */
     case X86EMUL_OPC_VEX(0, 0xf3):    /* Grp 17 */
     case X86EMUL_OPC_VEX(0, 0xf5):    /* bzhi */
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -253,6 +253,7 @@ struct x86_emulate_state {
         rmw_btc,
         rmw_btr,
         rmw_bts,
+        rmw_cmpccxadd,
         rmw_dec,
         rmw_inc,
         rmw_neg,
@@ -583,6 +584,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
+#define vcpu_has_cmpccxadd()   (ctxt->cpuid->feat.cmpccxadd)
 #define vcpu_has_lkgs()        (ctxt->cpuid->feat.lkgs)
 #define vcpu_has_wrmsrns()     (ctxt->cpuid->feat.wrmsrns)
 #define vcpu_has_avx_ifma()    (ctxt->cpuid->feat.avx_ifma)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -6888,6 +6888,15 @@ x86_emulate(
 
 #endif /* !X86EMUL_NO_SIMD */
 
+    case X86EMUL_OPC_VEX_66(0x0f38, 0xe0) ...
+         X86EMUL_OPC_VEX_66(0x0f38, 0xef): /* cmp<cc>xadd r,r,m */
+        generate_exception_if(!mode_64bit() || dst.type != OP_MEM || vex.l,
+                              X86_EXC_UD);
+        host_and_vcpu_must_have(cmpccxadd);
+        fail_if(!ops->rmw);
+        state->rmw = rmw_cmpccxadd;
+        break;
+
     case X86EMUL_OPC(0x0f38, 0xf0): /* movbe m,r */
     case X86EMUL_OPC(0x0f38, 0xf1): /* movbe r,m */
         vcpu_must_have(movbe);
@@ -7949,14 +7958,20 @@ x86_emulate(
     {
         ea.val = src.val;
         op_bytes = dst.bytes;
+        state->stub_exn = &stub_exn;
         rc = ops->rmw(dst.mem.seg, dst.mem.off, dst.bytes, &_regs.eflags,
                       state, ctxt);
+#ifdef __XEN__
+        if ( rc == X86EMUL_stub_failure )
+            goto emulation_stub_failure;
+#endif
         if ( rc != X86EMUL_OKAY )
             goto done;
 
         /* Some operations require a register to be written. */
         switch ( state->rmw )
         {
+        case rmw_cmpccxadd:
         case rmw_xchg:
         case rmw_xadd:
             switch ( dst.bytes )
@@ -8233,6 +8248,7 @@ int x86_emul_rmw(
     uint32_t *eflags,
     struct x86_emulate_state *state,
     struct x86_emulate_ctxt *ctxt)
+#define stub_exn (*state->stub_exn) /* for invoke_stub() */
 {
     unsigned long *dst = ptr;
 
@@ -8298,6 +8314,37 @@ int x86_emul_rmw(
 #undef BINOP
 #undef SHIFT
 
+#ifdef __x86_64__
+    case rmw_cmpccxadd:
+    {
+        struct x86_emulate_stub stub = {};
+        uint8_t *buf = get_stub(stub);
+        typeof(state->vex) *pvex = container_of(buf + 1, typeof(state->vex),
+                                                raw[0]);
+        unsigned long dummy;
+
+        buf[0] = 0xc4;
+        *pvex = state->vex;
+        pvex->b = 1;
+        pvex->r = 1;
+        pvex->reg = 0xf; /* rAX */
+        buf[3] = ctxt->opcode;
+        buf[4] = 0x11; /* reg=rDX r/m=(%RCX) */
+        buf[5] = 0xc3;
+
+        *eflags &= ~EFLAGS_MASK;
+        invoke_stub("",
+                    _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),
+                    "+m" (*dst), "+d" (state->ea.val),
+                    [tmp] "=&r" (dummy), [eflags] "+g" (*eflags)
+                    : "a" (*decode_vex_gpr(state->vex.reg, ctxt->regs, ctxt)),
+                      "c" (dst), [mask] "i" (EFLAGS_MASK));
+
+        put_stub(stub);
+        break;
+    }
+#endif
+
     case rmw_not:
         switch ( state->op_bytes )
         {
@@ -8393,7 +8440,13 @@ int x86_emul_rmw(
 #undef JCXZ
 
     return X86EMUL_OKAY;
+
+#if defined(__XEN__) && defined(__x86_64__)
+ emulation_stub_failure:
+    return X86EMUL_stub_failure;
+#endif
 }
+#undef stub_exn
 
 static void __init __maybe_unused build_assertions(void)
 {
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -278,6 +278,7 @@ XEN_CPUFEATURE(SSBD,          9*32+31) /
 /* Intel-defined CPU features, CPUID level 0x00000007:1.eax, word 10 */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
+XEN_CPUFEATURE(CMPCCXADD,    10*32+ 7) /*a  CMPccXADD Instructions */
 XEN_CPUFEATURE(FZRM,         10*32+10) /*A  Fast Zero-length REP MOVSB */
 XEN_CPUFEATURE(FSRS,         10*32+11) /*A  Fast Short REP STOSB */
 XEN_CPUFEATURE(FSRCS,        10*32+12) /*A  Fast Short REP CMPSB/SCASB */


