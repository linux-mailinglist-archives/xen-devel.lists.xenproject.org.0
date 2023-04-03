Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE3C6D4B40
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 16:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517499.802913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLeV-00013V-S5; Mon, 03 Apr 2023 14:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517499.802913; Mon, 03 Apr 2023 14:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjLeV-000104-P1; Mon, 03 Apr 2023 14:59:23 +0000
Received: by outflank-mailman (input) for mailman id 517499;
 Mon, 03 Apr 2023 14:59:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjLeU-0000MW-Gk
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 14:59:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d122fce-d230-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 16:59:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8760.eurprd04.prod.outlook.com (2603:10a6:10:2e3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 14:59:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 14:59:19 +0000
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
X-Inumbo-ID: 1d122fce-d230-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQINIxyPzlzRx22z2Pl0Fc86R5dbQQ50a7E9cWUggUzeZzI2ys6djhWvPjKO9M5HXPTFQBkjjarXlTuC4runqoil458lWydSAWExIkE2/saDb3mo46oZqmpVF8nW5JNdpevg5rl+NAtW9cZbGOUmqtM5tUg8tmxq7cY5eMqaALEbJDRkcWtF4WB1cYo65KOtCnStzp1pjSDmoHnZ37LpbLwoOphqaEgTVkWQMjH2WVkEWWyvlQr0Z82zBBMEaG9x56LdN0Ec38Uc5Xk2x31jQ3p1sXBUUTbqlJYcE+XzpyT2LPOa/64Eq2M+iNPys8OJX5ME+Zo79ujSpe7Mk8wfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uhli6p+2g334+AF1uQpNe0kBbZNIku4hPqzRfVDOW8Y=;
 b=K9H0uhiTy5Z4ldCq0xcM6JJRC4JM3Hi5MJbOHGrBXA6/Vr5oXY5YR74BnTPgCPszHDjznhjVCXXQSgqJJxHj7EEfer/T+C6iVgwNggr3idMc1y98UW2el+eJ6uasNPsPT5xOTlwkqfdJvfrk0iKe6MyWkGltPHnh8AA+fOscef1V1wPb5hEsLnQgDlOo5uB1WAKZwbuEBcIFuLzoicDi2C+nOiVzUW5NHhbIuidwOKQCqewIkUqCtt1cIULKmOO/QnsMBc6iBewxEisUexvKt8+BQ4gBMl5Yo22BXRgjOA2iGhWsBXp+kzVrf5RQGEntu2BCe+3DPatTsYpiMWR9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uhli6p+2g334+AF1uQpNe0kBbZNIku4hPqzRfVDOW8Y=;
 b=rc53KsEygbttSkBO0nl/1EmXf/XzElObcKKwbdmDj3utKhegypm1tLMZjp5BaEO0xSeEhPFsxXEQkF9VZiWRe/g6B//VSuKTMNy3kgjNsluTPoTcK3+n9L9BtEDCWh5tqjNuDSiL7bM2Q/ssbVLaWosGqUC98OcLYI8QHjW+vs3Mi77yP5Lr0Fpfx8ngvq/vCX0uslQEdWeE9Iu70wzi8Xjuf0duooX+n3DoTh9tLnHaZnSrBYz6q7qnuMaUrvu8JRZL+CFolZ8P7AJp4uR+xBYhtaWfv4ff7B9rmG5MpL/BkBXHe6ccuiYyl8quIzE9Nbt+fQEaTxBXEb5Qr6j50Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aedc8c13-c8c6-1752-0b1e-67a8a2e1b38f@suse.com>
Date: Mon, 3 Apr 2023 16:59:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: [PATCH v2 07/10] x86emul: handle AVX512-FP16 conversion to/from
 (packed) int16 insns
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
In-Reply-To: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 7526505b-58d4-4772-13a0-08db34540079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9UQzmsyB2eRBJFk4YiB9IRSjpgMw7qlA9D2Pvx/G8dhdT6lphZKjclhIHz3WJrHhPayAbN/FL4t52xDO8Qx+Ync2bTMwiyeRrf21MZIENDNUlvTN+T9sMUZwGsXXFx1e5xT/MpluUtkEGhqTTcfACQy5maaAmmpbVHfpScmfVFb3JV8GuEdFxasA9N/pKFZUCHQ+srGqYbtiKu1DfWP1xXS72YN8J1vlqyBrdo33+UDrdUhRozV3FHPTLjmJ0x0TRK5Z8oaMKlJ1uB2hDDvaRi7YxId8YvSSTf2clNEMy2CEDW0AGDWN8jp01XKKska1UH8plVcaKUnDhdicz/ghfcyS+cciqeewT+i35TeDI5v19dRDnMyod7Twaw8BUeuWTwYcGhcqPtNJk8qL+5WSMXFkYey2TpaEkx/2zqTDR5kG2yii1kULnLNOuWhuhmj0/XgLIImI2guV/dTph7pNWzLhUyDJCZgYYwqi5BcWZG9giVhHOjfD+SBWEQmBXeM+81rpdHu3vyDvQYGHgOWvB6ytBvD3831ndSvpH0cWDTMaU2btx84nsPkXMAcwBgQamdBpCcXGBbUId9PJ1fOwIkFtmMtkBucyZXTgePYbA/Qm2RWxawkhU+gGft0v4NdeXmIsxpxodcVQO/hZghZXCg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199021)(6916009)(8676002)(66476007)(4326008)(66556008)(66946007)(478600001)(316002)(54906003)(8936002)(41300700001)(38100700002)(5660300002)(186003)(2616005)(6486002)(26005)(6506007)(6512007)(86362001)(31696002)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkdhYkJ4b005R3gvNkNabHMwamthYytYSitMSjcxSktRa0JpYnhxc1d6OGRY?=
 =?utf-8?B?TUpWZHRnRU9uQVdUVDR5WXFhQ3RJcWhNTGliYWxzN3J0TkZwKzB5cFJjN3Fx?=
 =?utf-8?B?K29HZEdPN2FwQmV2RjlMV0pvYml3ZVgvNGtrSnJIY09CRlFuODdRYlUrREsy?=
 =?utf-8?B?VEdEZ3FHaU5xV2ZVZTUwZnM2ZHdVTlVsTlBxNmRpMHd2R2x4NHdqaEt6bVVZ?=
 =?utf-8?B?WkpOTlc2eis5UjZ6WFZ5by84NXh0RFdrQlpJSjZ6MlUzelkxbEtXZTR1WlA4?=
 =?utf-8?B?elgycGZuUjViaWZBWlVMajR6R1NZcWo3bEx1RnkrSGlRa1dTeXNoTVFuM1FQ?=
 =?utf-8?B?VkJQSDk3b21wSWdTT1pQMm1nZFZQTHJkYnNtcTJXS0ZEQ2FJclNIY05naW9j?=
 =?utf-8?B?TVFmM1hBdmpmaFh0b2pCUWlubCtXZGxFVlNISnVDM0lNRmJXY0V0VS9yNTVG?=
 =?utf-8?B?cTRMdG1ZTmVkR28xN3FXN3FrWWZVQWM1UU51NWZFU0pBcDRncElBQUFyY09D?=
 =?utf-8?B?WE53VWpmbVRrNUtlZExGd3NjLzFZTS8vMjY2VlVYNHFhQnNUSkx2bndSRTNv?=
 =?utf-8?B?L29YNW9FRkI3M2p4d01nZ2xENjh5Wi9mQkhYQTd4WjhiNURTc2txYkhDQmlT?=
 =?utf-8?B?ejZGNTY1MTRUdUE0Q08zVkpvc2IxY3JVbWJrdktWTEZpY0FXdGJGSjFvMFpX?=
 =?utf-8?B?WS9LU1BGdzVWK0xPcXhGSy9DdklkYkFGVG5nbllNRVlKTCsvYStCZHdRS2pq?=
 =?utf-8?B?QStpRmNLYUNiTmZKaXRlamdQbGpobXVOZGIyaE9xcHJrZytUcW5KU2xYUXFP?=
 =?utf-8?B?S1diRDZUalVQdTlYY0FFQVZhQW9ObEtxRGtqNTcvZkZ0Ky9BOXZodVZwVHhr?=
 =?utf-8?B?MUIwSTlwQlg3YzVMMlp1VlpWQ1d1V3NEbmx0ZElFT1BWT3NKekVhKzVkUUEz?=
 =?utf-8?B?UFZTaFdQSkx2WjBJWkpqajVndUtDMC9XZ3FERlpWZFhlTDJsTzJQSWhsMm5h?=
 =?utf-8?B?SXZiOXBSOWgzUXA4ZSt4WWFNYW92WVFoYkhOMldLcFczd0J6ZFBST1BuT3p2?=
 =?utf-8?B?SDB6TGZza0dOZjlGclhXZTFNRlEvblhlRUVJbWZTa3J1MGdUUVFJWm43WVV2?=
 =?utf-8?B?M1NUcDBwQ3NrWHVyVkJ2ZFhSdkF4czhyUG9Kb3Z1SXBYazZnbGZseWR2VHIv?=
 =?utf-8?B?WVJvdUZmMGhYbnh3WGJlMitFY3RCMTR6VFhtOGtvMEVKU3MrWUE5SVAyQUFO?=
 =?utf-8?B?clN6QjYwaUd0RmMzS1ZsQXpPT0dIM2hRZW1vb2JxZythbURLNE9iS2NxbXdo?=
 =?utf-8?B?d0kwK0RvaXJTK1NuTGdqSjhMV21KMnVpek00Q2Y1emJyWndVUjkrMElIZy93?=
 =?utf-8?B?WklZRy93VlEydlNZSDk2ais0eHJwQkJZM1JjenJYVS9sZTBvazJoa3ZEY1pu?=
 =?utf-8?B?NWVLbStNMEdUYTZudUFVUW9Ocks2RzRUMXVXejRSajFMdEZhTkoxaHRUKzYz?=
 =?utf-8?B?UnFnNkpUZmUwYmMyVmxXaE9tRmpTZ3VZOXY4aDA2OUduamx4Y05CQmd6ekl6?=
 =?utf-8?B?RC9GZ2RNdUMzUXhlRng1Z0huMWR3ZUg0bWVDSUVCa2Y4OVAzNlZPMk8zdzJR?=
 =?utf-8?B?anZnSEx1dTVzdHJsQ21UWW0vQnMzMGNuTlNSMFVNakhFZFJtMUpSVnpKcUNT?=
 =?utf-8?B?a2QrZjBDaVE1anZhcHZzV1h6ejVUc2IrM0JhdFlocmVXZmQ1d2xFWDVZWFJw?=
 =?utf-8?B?Q3VUVzlQSlpDSGM0R2hNU1Bua2FxQ3laRy9XaHdQa2xhUDVpdXBnVHgwY3lO?=
 =?utf-8?B?TVhxNHRrWnNyY1dTK1VSME1idjBEazRyd0tXbiszZVl6WFQvZVVBT2tJVE5y?=
 =?utf-8?B?WGk4WHZOZjZReVZMN29DbUNZdXBFL1FUOUNiNjZ6SmQ1YU5EZmp0TVpzU2Jn?=
 =?utf-8?B?Y3ZEelc3YVVyY0tkVmErVllHZUdwRjhsSDlyN3U1aUtnZjQ2RFA2TUZDUy9R?=
 =?utf-8?B?UkVKTmtORW5aTzVvQ2k4eDR2VGYrQzZXZVZTa3graDZseXN1Ym9YR0JwbXM1?=
 =?utf-8?B?MllKaTZXbkh3T2diSUVEQjVCSWd6VE9ZaEpheUttdWRHRFVmWG1wMkFDM1or?=
 =?utf-8?Q?L3lYaX0A7W8Zi/n234jSay9AY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7526505b-58d4-4772-13a0-08db34540079
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 14:59:19.4314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5oOs+rTIZyG1YI43TgoMMafpU/avw2nCtPZtIjLz0K2YbReb8s9CK1QU/rS7MXiSaiXrcnluClW9NzB5eJlUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8760

These are easiest in that they have same-size source and destination
vectors, yet they're different from other conversion insns in that they
use opcodes which have different meaning in the 0F encoding space
({,V}H{ADD,SUB}P{S,D}), hence requiring a little bit of overriding.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -612,6 +612,12 @@ static const struct test avx512_fp16_all
     INSN(cmpph,           , 0f3a, c2,    vl, fp16, vl),
     INSN(cmpsh,         f3, 0f3a, c2,    el, fp16, el),
     INSN(comish,          , map5, 2f,    el, fp16, el),
+    INSN(cvtph2uw,        , map5, 7d,    vl, fp16, vl),
+    INSN(cvtph2w,       66, map5, 7d,    vl, fp16, vl),
+    INSN(cvttph2uw,       , map5, 7c,    vl, fp16, vl),
+    INSN(cvttph2w,      66, map5, 7c,    vl, fp16, vl),
+    INSN(cvtuw2ph,      f2, map5, 7d,    vl, fp16, vl),
+    INSN(cvtw2ph,       f3, map5, 7d,    vl, fp16, vl),
     INSN(divph,           , map5, 5e,    vl, fp16, vl),
     INSN(divsh,         f3, map5, 5e,    el, fp16, el),
     INSNX(fcmaddcph,    f2, map6, 56, 1, vl,    d, vl),
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -2048,6 +2048,12 @@ static const struct evex {
     { { 0x5f }, 2, T, R, pfx_no, W0, Ln }, /* vmaxph */
     { { 0x5f }, 2, T, R, pfx_f3, W0, LIG }, /* vmaxsh */
     { { 0x6e }, 2, T, R, pfx_66, WIG, L0 }, /* vmovw */
+    { { 0x7c }, 2, T, R, pfx_no, W0, Ln }, /* vcvttph2uw */
+    { { 0x7c }, 2, T, R, pfx_66, W0, Ln }, /* vcvttph2w */
+    { { 0x7d }, 2, T, R, pfx_no, W0, Ln }, /* vcvtph2uw */
+    { { 0x7d }, 2, T, R, pfx_66, W0, Ln }, /* vcvtph2w */
+    { { 0x7d }, 2, T, R, pfx_f3, W0, Ln }, /* vcvtw2ph */
+    { { 0x7d }, 2, T, R, pfx_f2, W0, Ln }, /* vcvtuwph */
     { { 0x7e }, 2, T, W, pfx_66, WIG, L0 }, /* vmovw */
 }, evex_map6[] = {
     { { 0x2c }, 2, T, R, pfx_66, W0, Ln }, /* vscalefph */
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -259,7 +259,7 @@ static const struct twobyte_table {
     [0x78 ... 0x79] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, d8s_vl },
     [0x7a] = { DstImplicit|SrcMem|ModRM|Mov, simd_packed_fp, d8s_vl },
     [0x7b] = { DstImplicit|SrcMem|ModRM|Mov, simd_other, d8s_dq64 },
-    [0x7c ... 0x7d] = { DstImplicit|SrcMem|ModRM, simd_other },
+    [0x7c ... 0x7d] = { DstImplicit|SrcMem|ModRM, simd_other, d8s_vl },
     [0x7e] = { DstMem|SrcImplicit|ModRM|Mov, simd_none, d8s_dq64 },
     [0x7f] = { DstMem|SrcImplicit|ModRM|Mov, simd_packed_int, d8s_vl },
     [0x80 ... 0x8f] = { DstImplicit|SrcImm },
@@ -1496,6 +1496,12 @@ int x86emul_decode(struct x86_emulate_st
                     s->fp16 = true;
                 s->simd_size = simd_none;
                 break;
+
+            case 0x7c: /* vcvttph2{,u}w */
+            case 0x7d: /* vcvtph2{,u}w / vcvt{,u}w2ph */
+                d = DstReg | SrcMem | TwoOp;
+                s->fp16 = true;
+                break;
             }
 
             /* Like above re-use twobyte_table[] here. */
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -7778,6 +7778,14 @@ x86_emulate(
         generate_exception_if(evex.w, EXC_UD);
         goto avx512f_all_fp;
 
+    case X86EMUL_OPC_EVEX   (5, 0x7c): /* vcvttph2uw [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x7c): /* vcvttph2w [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX   (5, 0x7d): /* vcvtph2uw [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_66(5, 0x7d): /* vcvtph2w [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F3(5, 0x7d): /* vcvtw2ph [xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX_F2(5, 0x7d): /* vcvtuw2ph [xyz]mm/mem,[xyz]mm{k} */
+        op_bytes = 16 << evex.lr;
+        /* fall through */
     case X86EMUL_OPC_EVEX_66(6, 0x2c): /* vscalefph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x42): /* vgetexpph [xyz]mm/mem,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(6, 0x96): /* vfmaddsub132ph [xyz]mm/mem,[xyz]mm,[xyz]mm{k} */


