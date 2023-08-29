Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3FF78C2AB
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 12:54:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592114.924729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qawLt-0001iv-P6; Tue, 29 Aug 2023 10:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592114.924729; Tue, 29 Aug 2023 10:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qawLt-0001hF-M5; Tue, 29 Aug 2023 10:53:41 +0000
Received: by outflank-mailman (input) for mailman id 592114;
 Tue, 29 Aug 2023 10:53:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qawLr-0001h9-VO
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 10:53:40 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f25994e-465a-11ee-8783-cb3800f73035;
 Tue, 29 Aug 2023 12:53:38 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8564.eurprd04.prod.outlook.com (2603:10a6:20b:423::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 10:53:36 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 10:53:36 +0000
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
X-Inumbo-ID: 4f25994e-465a-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPWROXgSFMr35l3bvHJGBAs6LTKc/MSM8QYlXfFRfFBdGBTa7nPF+8H/rg6Xi9mytRnbkOEs2Hec01Qteb4rCd+UuMvbdQR0hqQucBgd+Ku4TkWa7UeLWXA3klIR3COT+IKDO+J3WT0tjtSJqnNFb9b5yJYJ1z/UnOB9axk/DZFQk8iJiSfuncaymrRnL1lMYDkngoek0E5GQ47lWpHKe2LxCkoyuMl6bin2hD7FKiYKNbCQGKNE8Ww+viJ0dZjLRlfqSjdP7tj0L5NEGdjlvd9KKzvm9WkFFANMwoIE+pPlCG/R8+RXiM//6pWqq+vDI25IBGkKecQSn5wIN813XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eB04TcZBsQTR6F7js2qwQscE5PbVHCh6Y4p7OsYQMD4=;
 b=eG7WK8QphsaLFJxYVg2V8NBMoVpir0Io0p70EqWWgbA4OcasZ7MtfcXvlCH0RQBHW55MW3VZjxdCm4+p+/BiXKd5ga4SOmfK6yHuRzxyT3zmjmB46KO5RjuvIgm4FoxEBrd9XK23ar2TAYnlsox2m8BIVvM59VOwoZzegqhaJMKqDugWBsy5brLhurwM2wl0qCmvKJw/LoJiGlTbBT7ucjrTDe28ryo4G/hYVQiBFbAM0dR2OpsaXj/lLH5zNZ0uWsMLo5utR5hRWeAQdsoP+jfkp6FQQHWonrjaNH39dR6O40Qz5OubRrE14EkEWei9qgiFIMmXfQhtMQ0zWXsrCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eB04TcZBsQTR6F7js2qwQscE5PbVHCh6Y4p7OsYQMD4=;
 b=Qs8+BuSs+LgM5Ft48dKBv163PrarYkKAuBtFk805zhyvDtnyAmb3SAHPRDBRQmHuiDuoGIrYpVNfJLaSXyLBmPclTeWIdJcUUcSQsQaESEMdwtZWZ0SsBhcGun9ldGUw6y0o2SMaQsKLhHDuipeomZyB/JdU9eDgbd8rToKyf1OsCBAsUkqBcBF3Fl8mmUqsAfgnXpmD5RZmLqO+GEb/s2OseNbZPZL0CN8AvLKMqmkB/DgbTozpvH13YNuB6Wm6ZkjkIMJF0kPN8tgeMxF/D2B2CHc6rM92CT8kzBqDLFe60EIhqOUKBL3UV6aS2rPT6JUhHvDzM76lJhagWeie3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <002261fe-99f4-5aa4-3984-1fd7d4d250ff@suse.com>
Date: Tue, 29 Aug 2023 12:53:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86emul/test: fold AVX512VL scatter/gather test blobs with
 AVX512F ones
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8564:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b94379c-b0a3-437d-5129-08dba87e3214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cUqe2/vaYL+2Yw9jbVrO4mQBeHyQR0uqHFhDN2A7c/s6nHp3wcMMYDob9H8+7ZxOX2s00xkjdsz0HH/DfoZ9FKP/4BSN1+H1Pu3sK+Bsk+3XfS2H1Wu7Wh1xywyBmEse74x1iPFZnsxWm60/NtAqpMLnqh+WI2x2ttOyTu1Wo2JMEz2mf39DAMa3DhBLHy4jOzZvTzzB0TiU8cZVbs9g5sk1vbAU1CpkmQDScEoDK7vkvu+Ui5XUliLMsWcu2X9aNQ4HGrx8c8hCXVSgOGtCimb0Q0All320X/6PeszG+rN1oxVE4+KQgVBQ55pP7EszHqAckEheBQdQ6cD63uLT3MgmSkHH+WjtlRcfgwwkJLBJ9N0LeX9bhNVNQ3dKpDXgEX/7M94Zrl8Sj3phQ4eGMD1ZvwI8AHanEG5rfARC5fJAHcbfGnScj/bWkAXBDtLEJMAAsS0q/z9BjXDkgwHOVoOGAX80g+lwEFghvTNxMFggNWLLJm3/xN1/SioPht7DwrT6f9UH5MWdQfuUE8uQ8YeYlxO5O+obFp50xSF5vOmnJMSEG60bP5P8+Ra3KFrMVWZj2BD7NVPThMJ/vZO+iPy6gSDLdmYSUlEgwBVnXf0wYVXSTKpFkKewsE3SPV0Ebm6eq4AlChRB1RdCGueGzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199024)(1800799009)(186009)(8936002)(66946007)(31686004)(478600001)(6506007)(66476007)(66556008)(54906003)(6486002)(6916009)(316002)(38100700002)(41300700001)(6512007)(26005)(36756003)(8676002)(5660300002)(31696002)(2906002)(2616005)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXlWTFQvOGVuN2FwaVhkZFl6RmdmL0xTMWx6Lzd0TTE2a2pQSjBtNG8rbkRj?=
 =?utf-8?B?WEZvSUhXQ3B0TDVSTHNWUGZLK3hpaEVsN25SN3RzN093bUhBSkVvN0t1WmRL?=
 =?utf-8?B?Qnkrd1BBbzdXU29mb1I0L1BlUGJML0cyb3Z3V0xjbWVYMGUzOWZlUlByVWJm?=
 =?utf-8?B?MVhqdDNieFBkWkd1SUM1SlVodjNQcHIxQ2NSbGY5aExsMzVtQllid20zNjdU?=
 =?utf-8?B?SkJUaFhocDZFbkRtWHpPQ1pxR2Jhb1JLSVF2eElpU3VIbVRqNXgzZkFOcWlv?=
 =?utf-8?B?K2ZVaGdCK2kwMXljT2N2WThtZU92c2J0NWlWY1FSb3dqMHJkc0Y4WFhKUzRY?=
 =?utf-8?B?UlRWaC9QbFZtbnRjWDlZZkY2MmNldUdyNnY5SjlMU1g3bExrazF6YmFEc1lx?=
 =?utf-8?B?K2RyQm5wMjlWWU1Gdk1NVysyMXNBbFRXS3d4b2FCdjRUczNmNC9lNjBUSFlm?=
 =?utf-8?B?U0ZEQnd3WFBzU0pXdDhLcGFjTXNhcWhybkhnZGxhdkd3dkdZcEQ3LzRNRjFz?=
 =?utf-8?B?bitTUkp2MW8wdzNJWU5kWnB6c0d0eWNKWDltOXl4ZmRFYkU3RXJXSnVHN3pZ?=
 =?utf-8?B?amE0b0V5WWVabjRKUjhaelgxVVZQUy9YdVNWVm8rQkJxQmFZL3NkZkY3YlZh?=
 =?utf-8?B?VkZGa0lZZVhCWkpuL1l5WTJWdGpuV3JSdmhubFhSSDhrVTJuZlNhbXFTNEpE?=
 =?utf-8?B?ZWZxZUdJMG9RQWVXY3Y4WHZKVGhoalltbG44dWdJWk1vM0E0b0VXbHQ1OEd6?=
 =?utf-8?B?ZjdhT21CVU95L3hLZTRIQUREcDBRQmx3QUJvNEFtdnluVGFBbU1kdmR5cTVY?=
 =?utf-8?B?TmdmQllHYjMzZm14alJWWUVEa0haTUdhcGhEblhzbW5lbGxCeVlwcEVUOEh1?=
 =?utf-8?B?UmhZdlNtdE40Y1NxUmxVZEJUMTZwdHNQODdYRE5uR2dYbytlWjRPdW9XZXBY?=
 =?utf-8?B?cHU5cm01OVBGTEphSFFFS1VTR01tN202UEtGUm1SZ3ViWFFxL1FoNm10Q2hl?=
 =?utf-8?B?Rk5xMVJNZDlEQ0M5T2UwdGJ3UkFlRlNKUWw3RlZDVnRVSVBNWWdrVWNFVEts?=
 =?utf-8?B?UzJzcmZRSW9TZWtpbzBXdEl3UEVzcGZVMFhWcUhsU3VzZnRDb0hvbVlOYmRy?=
 =?utf-8?B?c0s5bnRxQ05KQnlQbGlidVlXUjVJSXZFYy9DYWJrejdHeXNCYk1WNnhIcHU4?=
 =?utf-8?B?ZnBCbzQzdlpnM2RXTjVFTkgxdExQUzJURmk1ZnNLMHZFeFhIbDdvYzFjcjBP?=
 =?utf-8?B?dURtaXBTYWJTcHo1UkdNUUVhejZNWVVMc3NBQTIwcU0zcGNJbGhxL2paVmpL?=
 =?utf-8?B?cm9DaEZSVWVEeEtlS0hTVTNNc0hXT1lUeXZ5eksyMkdKdzA0Wlh3R2R1Wnc1?=
 =?utf-8?B?YmZxNGNFZEF1TDJyVmJhQUYvaGhPcjB0L0JOMmRrNkc2ZTRFQU9HNmk3UTdm?=
 =?utf-8?B?WEdYVjRzNjMyTUJ5b08vZlhVMzVpMFVDTllEcTFoWGVjamRJU1FMUWJlQTJB?=
 =?utf-8?B?UEN6T0VjNUlCRnVPWTJlUUM0TnE0SCtKZWduQU02dkN3Mk1Ub3dNTGNiK1Bu?=
 =?utf-8?B?OUxRTE5kb0VnKzFGdTdIL3liVE9lY0NjRmp2OS9ISzRkRUh0aUdDSk5LTkNY?=
 =?utf-8?B?RFpJVXBDRFdzMUI2MC9MNlRBWFo2V0s0YXdaV3NadUVCQWs3MDk3NmtzV2lr?=
 =?utf-8?B?RC96VDMrb28rcWJleFdyS3ROWXBpZXRIQ2pPaTZuTkFnUGpacEk4V0pSQTU1?=
 =?utf-8?B?dHZuNmxzQVQ3L29PMjZJbkZNT1c4TGZVdHhxVVRFNmxpc1laUDJMeERVWjlY?=
 =?utf-8?B?SUE4d1ZFaysvTzNtbGZXR1dFSUxtRFhMS05qWUlzSnRuZml6eFUya1VTQWRh?=
 =?utf-8?B?TGxkMVdkeDYxb1NXLytoajZOSXZWL1FnemU2SmFUZUF5MzE4S1A1dmZZTFpm?=
 =?utf-8?B?bnZzRzNDOWV4QkpFbU0xY3p1dG9nTTNTa1lCQThjWmI4WEIrMTdKQy9tblZi?=
 =?utf-8?B?TVRZaWdsL1pjcEZybVhsWUtBS3RXRHpTSHNaeFkrWm1MVE10T3B4TTdVd3BI?=
 =?utf-8?B?R1lPdjladUl5ZkVqNDIrMzVJejBkL3gyMDYyb3BBNVV4YXk5TFI0MEZBRkJQ?=
 =?utf-8?Q?hTd3y+mSjHzy7KJyas/IL7o6D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b94379c-b0a3-437d-5129-08dba87e3214
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 10:53:36.4111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jo6Xt5AQnuLMo38xEmoXXwbVs8zukp39nsqgiJKiGw7iaGrHcVMKgGI7kbimIapG8R8aTAfOKas3HHMd9hZ1xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8564

Everywhere else the VL tests are grouped with the basic ones,
distinguished simply by the "form" specifiers.

No change to the generated test blobs, and hence no functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -18,7 +18,7 @@ CFLAGS += $(CFLAGS_xeninclude)
 
 SIMD := 3dnow sse sse2 sse4 avx avx2 xop avx512f avx512bw avx512dq avx512er avx512vbmi avx512fp16
 FMA := fma4 fma
-SG := avx2-sg avx512f-sg avx512vl-sg
+SG := avx2-sg avx512f-sg
 AES := ssse3-aes avx-aes avx2-vaes avx512bw-vaes
 CLMUL := ssse3-pclmul avx-pclmul avx2-vpclmulqdq avx512bw-vpclmulqdq avx512vbmi2-vpclmulqdq
 SHA := sse4-sha avx-sha avx512f-sha
@@ -70,14 +70,10 @@ xop-flts := $(avx-flts)
 avx512f-vecs := 64 16 32
 avx512f-ints := 4 8
 avx512f-flts := 4 8
-avx512f-sg-vecs := 64
+avx512f-sg-vecs := $(avx512f-vecs)
 avx512f-sg-idxs := 4 8
 avx512f-sg-ints := $(avx512f-ints)
 avx512f-sg-flts := $(avx512f-flts)
-avx512vl-sg-vecs := 16 32
-avx512vl-sg-idxs := $(avx512f-sg-idxs)
-avx512vl-sg-ints := $(avx512f-ints)
-avx512vl-sg-flts := $(avx512f-flts)
 avx512bw-vecs := $(avx512f-vecs)
 avx512bw-ints := 1 2
 avx512bw-flts :=
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -34,7 +34,6 @@ asm ( ".pushsection .test, \"ax\", @prog
 #include "avx512f.h"
 #include "avx512f-sg.h"
 #include "avx512f-sha.h"
-#include "avx512vl-sg.h"
 #include "avx512bw.h"
 #include "avx512bw-vaes.h"
 #include "avx512bw-vpclmulqdq.h"
@@ -462,22 +461,22 @@ static const struct {
     AVX512VL(VL u64x2,        avx512f,      16u8),
     AVX512VL(VL s64x4,        avx512f,      32i8),
     AVX512VL(VL u64x4,        avx512f,      32u8),
-    SIMD(AVX512VL S/G f32[4x32], avx512vl_sg, 16x4f4),
-    SIMD(AVX512VL S/G f64[2x32], avx512vl_sg, 16x4f8),
-    SIMD(AVX512VL S/G f32[2x64], avx512vl_sg, 16x8f4),
-    SIMD(AVX512VL S/G f64[2x64], avx512vl_sg, 16x8f8),
-    SIMD(AVX512VL S/G f32[8x32], avx512vl_sg, 32x4f4),
-    SIMD(AVX512VL S/G f64[4x32], avx512vl_sg, 32x4f8),
-    SIMD(AVX512VL S/G f32[4x64], avx512vl_sg, 32x8f4),
-    SIMD(AVX512VL S/G f64[4x64], avx512vl_sg, 32x8f8),
-    SIMD(AVX512VL S/G i32[4x32], avx512vl_sg, 16x4i4),
-    SIMD(AVX512VL S/G i64[2x32], avx512vl_sg, 16x4i8),
-    SIMD(AVX512VL S/G i32[2x64], avx512vl_sg, 16x8i4),
-    SIMD(AVX512VL S/G i64[2x64], avx512vl_sg, 16x8i8),
-    SIMD(AVX512VL S/G i32[8x32], avx512vl_sg, 32x4i4),
-    SIMD(AVX512VL S/G i64[4x32], avx512vl_sg, 32x4i8),
-    SIMD(AVX512VL S/G i32[4x64], avx512vl_sg, 32x8i4),
-    SIMD(AVX512VL S/G i64[4x64], avx512vl_sg, 32x8i8),
+    SIMD(AVX512VL S/G f32[4x32], avx512f_sg, 16x4f4),
+    SIMD(AVX512VL S/G f64[2x32], avx512f_sg, 16x4f8),
+    SIMD(AVX512VL S/G f32[2x64], avx512f_sg, 16x8f4),
+    SIMD(AVX512VL S/G f64[2x64], avx512f_sg, 16x8f8),
+    SIMD(AVX512VL S/G f32[8x32], avx512f_sg, 32x4f4),
+    SIMD(AVX512VL S/G f64[4x32], avx512f_sg, 32x4f8),
+    SIMD(AVX512VL S/G f32[4x64], avx512f_sg, 32x8f4),
+    SIMD(AVX512VL S/G f64[4x64], avx512f_sg, 32x8f8),
+    SIMD(AVX512VL S/G i32[4x32], avx512f_sg, 16x4i4),
+    SIMD(AVX512VL S/G i64[2x32], avx512f_sg, 16x4i8),
+    SIMD(AVX512VL S/G i32[2x64], avx512f_sg, 16x8i4),
+    SIMD(AVX512VL S/G i64[2x64], avx512f_sg, 16x8i8),
+    SIMD(AVX512VL S/G i32[8x32], avx512f_sg, 32x4i4),
+    SIMD(AVX512VL S/G i64[4x32], avx512f_sg, 32x4i8),
+    SIMD(AVX512VL S/G i32[4x64], avx512f_sg, 32x8i4),
+    SIMD(AVX512VL S/G i64[4x64], avx512f_sg, 32x8i8),
     SIMD(AVX512BW s8x64,     avx512bw,      64i1),
     SIMD(AVX512BW u8x64,     avx512bw,      64u1),
     SIMD(AVX512BW s16x32,    avx512bw,      64i2),

