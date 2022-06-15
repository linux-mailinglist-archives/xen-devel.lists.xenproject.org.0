Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4DA54C60A
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 12:28:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349913.576112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QFj-0003R8-NC; Wed, 15 Jun 2022 10:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349913.576112; Wed, 15 Jun 2022 10:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1QFj-0003PG-IK; Wed, 15 Jun 2022 10:27:59 +0000
Received: by outflank-mailman (input) for mailman id 349913;
 Wed, 15 Jun 2022 10:27:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1QFi-0002mz-4d
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 10:27:58 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe09::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2523f9f-ec95-11ec-bd2c-47488cf2e6aa;
 Wed, 15 Jun 2022 12:27:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB5113.eurprd04.prod.outlook.com (2603:10a6:10:14::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 10:27:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 10:27:55 +0000
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
X-Inumbo-ID: d2523f9f-ec95-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPvaag71N3Mp7UF8BeQYhXVEohUcleGNtabJ/DBkkn9nOa3+zlTGIF1qyCCdSZiSaZWxshYlRJRA030QKx5aSWZem5dnzWG0eHo2CWt14lzC3I2XzavoYEtIpcAwxSyPRowBApi79BtquNd5LK+SclIBNW40wdm0A2C2XrMRhmrBfQYIuPev91jLZLdpBqm/cE44FSbPl5alTLPidqc5afSqLMC07dUiqxsXur1Wepnhtk/lM+k6X+cLnBb1JxcMmdni1MdU493MRBYmmMR185/zOK/ifLHMPMWqYHMBZKPXrBEdmlwu8amcAwT1jxDuKMFEpxtIWWrR2cdEnE5jpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CbWxrA9PT3dW6Hbw/pnjIBabWsyLSFj6ASuTNtk5o8o=;
 b=BRR4xEJwaNA7tIk6qkOl1ronydqJWZyqvgwYQv9gK4j3H3Iy7os8g8LlUU2bo+nVDI1w6yJg6ciiD2gZPECT17BlfHBFnMGkdzGh20srAGVclC2/Gc4QU9qo1MQZl3g9HAqMB5LxlurFFnxMbo5RnyOba1/4uGWn9f18I+liWkqC2RLnGXtggfNmEeJoPpy3xQWiNegi1tS98fHpVdoddfs4nUl0g0sDMSsLmt02cUaBHgGdlCsb8VXH6Cvj7VU8MEzdm2pV9YVp6FZVg+4FKszzAr+Jrp1gkCo4irBh3PMDpPhj6T2RiJUAkcedF3MGPR+a8FKzOeqdFktzZI5i3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CbWxrA9PT3dW6Hbw/pnjIBabWsyLSFj6ASuTNtk5o8o=;
 b=O1RA3NZLNLLT6+G8hs2X7eVy4+9jO6x06dZ1LU4fZmb0Ux5cOyirz3CQUnBLFZE9urH+dJmqqsnAKJA3DzhkSNI5otetVSemp0H1yeD9KqgJRnGd5R5Pk9npWcGq2XJOff52EAiQf5bc3qcIMFmBwtbMCLznewwsU3xJB7etVfS0ikec1IqeyAkCIeybh68LlBRsd9Hva8MVI9NchTOlQLmIFMugyxe2UHUxz+5ql675yxd5mUlCFodZIbady1odouQY27aktWaMhXpQBElxN+hZmZUiAnemurKtW9i41dk8qq15ELnlnsYwiuvs2XWvPiuj54/7GbflGcMwDc78iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b922b255-f8c6-725d-2290-2749c614fde0@suse.com>
Date: Wed, 15 Jun 2022 12:27:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH 02/11] x86emul: handle AVX512-FP16 insns encoded in 0f3a
 opcode map
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
In-Reply-To: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0039.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4e97241-d705-4c4f-9d4a-08da4eb9b5af
X-MS-TrafficTypeDiagnostic: DB7PR04MB5113:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB51134E81BBA16D4665613E70B3AD9@DB7PR04MB5113.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ikIpElavdwA0Wm1/5b8yNmWEa/cN7w0oZVIUGS6rIj588luN6L5/AUPLDweAzpiEiR6IkDPODZ/9mvBSJ4Nxqjkm5mZNksjESsZ7YAzmMjJM+9Syd5GRvt2SN2mDO5p6adr5j+1Yu9hITNTvQHyprDFk91wECmIWwi/TNAU7NjNVNaFWhn+aFhexrLzVq01bnoNe5FLkN8coy92bWtoz5FiNcPhnLq3S5fPO6OLxQ5fX51sODZdGGW4Y9IhegsJknm34Irl04slASFFzT9rgsSYmMwBM/IaNLrnk/C5WZp2iV6iUVMxrK/m4oYWjvFdgmcPZoeozYlsU8RIOB8BojsKHh9JMvOXuUTMQhIwcXVcUWDcWOEV01jOz0o/rDJqaD8F862FYWuM2/p2sKS4UJkSbfcoG3eRs7pHG08BHN7wvz+tlw2UW8YyYO0N1xnlFqR6vt7C3aMwLLXdnwa+fXbz2Osq4BgPWjPDTwlVGA9AHNedub1shWaSDePVhAMnsX0TWw2mfTv7HqwP1vPkNumujd3Y4e5fyypc0VUz9DFrJoty4zfu6ceOvwGxny/WXOm//QSgKKCimzVvAUNilIcg7Eku/kD6tM3fZRCBP6xLO06SZUD1mcPetvUDfJl3yzNzVPsCLwpHWt+VPki+YWLSxszmgS1gbZwbeQoHbfJUMQRN7hVP5cbwLAY0jIi0tGEyMxrRhLTS1a1UEI3nUV5UtRWHT3ITlrYMBOTYeHkwZqzZ8GAuuPzk0UYoPXy9U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(316002)(36756003)(508600001)(38100700002)(6512007)(30864003)(6916009)(8676002)(31686004)(4326008)(6486002)(26005)(2616005)(66946007)(66556008)(66476007)(2906002)(31696002)(5660300002)(186003)(86362001)(6506007)(54906003)(8936002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkN6QmhnSGRRNVBPT2VoMjFsck5YYWROcjBWd1Z3eWRQL0E1SlIyZFlCeHIv?=
 =?utf-8?B?dDUrOTZDQ3prREkvcmVFdjZ3N1dBTE11YUg3WUJta0k0U2Z5UytnSWc3Q3Ur?=
 =?utf-8?B?aWJDZlI5VDhSendma1dyMnVQcTJ2Q2VMRjI4UUtDT0x2ZzlIUUdkRS8zNHAv?=
 =?utf-8?B?NDRET21FSU1vMjQzRnUrdnYyeE82SkFaYkV2UmNXd0VvWDJPNG9RekFrbDY5?=
 =?utf-8?B?by82UkZ3SFBtOGdjMVlUSzU2R0FiYXdtUFRzSGt0RnIwb1NHR1JndnZtUUxt?=
 =?utf-8?B?QmpmTC9xM3JJM3dyZEVweFFCRzBmdGNobi81NHlvaGNwWktoOGVaL1RnaFZz?=
 =?utf-8?B?T0E5SGEyT3h6Q2tCcXU1KzY5VmpKbTNNSXhEUXVvZkdnNmxnY2VRMThyMW9s?=
 =?utf-8?B?dGJSRlhnbXJZS1MrY1Jjb3BaOVdndmtFSzUzd2pGYlVFcUt2d1lxTVNnTGw4?=
 =?utf-8?B?NDdKbmNTOEpHU2UyLytEVGtOSFdjWXNUYmtpSWp3MkpTbzErN0NvNU9rZWl6?=
 =?utf-8?B?SGpKWVFmL3Z0MmlNd3g4RzdadTUxQitmaTlUODFiRW1PWG1OYVJ5TkdjQ0ZY?=
 =?utf-8?B?TXF1K3JFQ0JHQ2REdS9QbmZuRjNLSmdYUlp1UytVZDQ3Y2ZYVVl1enQvMkpE?=
 =?utf-8?B?RHJZeGs5WERSM3UrZ3JGUG56ZnR3Ulh0NnV5RitCSGpweFdEandiM3V5eFgv?=
 =?utf-8?B?TjZZVStQeHIwb01PQXFscEE0c3NZT084a004SEJPS0pReXVsSGtiemwyODEv?=
 =?utf-8?B?ZmNpRzFweXpNZjl0TVV1YU5KdGFQaFpYakV1d3djVkQ5cm9ESzJNOW9Sa29R?=
 =?utf-8?B?eGwwSldWMWg3K1l3Sis5ZTJ1bGpaYi9LZG9iVWxzMXVJRUtYSzVHYjNpKy9j?=
 =?utf-8?B?aHhpc1JJN2dBQTJsOTJVN2daNXljNjFWcnpNNFNxMTBxOEkrSHVLOWt6cW1L?=
 =?utf-8?B?dTFZTEs2STU5by84UjYydzZwek5uUVpLbXBmWWU2bEU3bFo0UjRkZEtYclVy?=
 =?utf-8?B?TXdMcEZhUDF5Z2d0SDh3NXNRSHJBQTFFaWpvRHlHRTNack9QTmVldWp1U054?=
 =?utf-8?B?bnoxbTNGZk1pV0N2eUxKazNhZFRNK2hJbzJzWkZGWHc4eW8xRVJPQnVwSVRx?=
 =?utf-8?B?MHdDVUxodVhOMnYzWWtOeXRKZWxXUnBMSm1lcFJGOHBCVW5uUElQQVhyekZy?=
 =?utf-8?B?YjV4L0dvMlhQRkMrM1dpMGhCQ3RXSFdtNG54c0plTi9zVlZwRjNHd1JzNWtL?=
 =?utf-8?B?ZDNEaVByZ3RwZ3FlU05QQnNWcU5JWmRjc0YxbWJmRnZZT1FSaWRWT1BZcVJp?=
 =?utf-8?B?djVZaVlELzQ2R0NBaitsY0JaMHhhLzZCcHcrckkxVnN1a3VybVN3K1Y1bFhz?=
 =?utf-8?B?QUZmWHFsd1RqeW9IMDd4OXpkZ05HUDZCdmNCZFh1N0tPT2JCUGhHVmFvYkVm?=
 =?utf-8?B?ZWFFSjRKRjRSVlZoS1VVUHRvdVljVkZQcjlFcERNVWJRYmZNSWlFN0c3K2p6?=
 =?utf-8?B?S2hqTENCYjNMVWI2K1dRYTdPVHVnV0JKdEoxOHFBRVZGQ3NkZFl1MXVMY3c4?=
 =?utf-8?B?YmVZOHNuWUVPUDgycTgvUDJQVHdyZTdoQzY0dnJRV1FIODFoYzBIK0cxQVE1?=
 =?utf-8?B?SmcreGNjNE9RRy9Sd1NKY0tjcGNkMTRxUWwxM2lDc21wb1BJQkNxVEFBNlBB?=
 =?utf-8?B?NmhHWGtyWkFVd3NwbHhsdUpqdmVhVUI5Vi9UeldlY1V3Rjg0RGs0WS9wUHpD?=
 =?utf-8?B?RC85Q0JxNWlkWFRXV1Znai9XR1BxVFdzV1hjOHAvc3lyMzFJRHpSVUtKU2Zn?=
 =?utf-8?B?aFQ4dVhma01JWnVKK2o1Mm4rRU5weWtqWFJVcEluczVrYnBEN3dWQkpReUZm?=
 =?utf-8?B?TDY5WWVJWndWT00ySkEzT2hhSkNvZ2ovZzVzc0JSNzFlWlFXaEk0bXhTKzd3?=
 =?utf-8?B?RStLVHNjNW1NVXpuTmJxUnRXUFZaSkloL0grM2xaNHhRV0hzbWFYQll5TWNJ?=
 =?utf-8?B?RnpvekZ4V1VRNTdEb1BDOVNjSG55TmFCcVQ5cCsxVmFpdWQxNHRpaWwwL1NH?=
 =?utf-8?B?aU9ScDJRVHRqWGMrZEJlU1YxZS9DaElFb0xuRXpldjdUMjJQOGh2c3NUQ3Ev?=
 =?utf-8?B?R3Jzc0RLN2cyVDlaRytvNjUwOTRKZ1ltZGJOMzhnTURMelc3bUJOUmE3K3Vr?=
 =?utf-8?B?U2twZ3pwZzhPZDNDY0tJVDl1UHNPN1R3b3N3VWV3b1ZaSFczdnRlU0dzTTBn?=
 =?utf-8?B?bjRSNXAxOVJYTnJ3bUhTcnNmdHNkUnRxT205dU9wRnlNdFhEY2hRc2F3ZERl?=
 =?utf-8?B?clVnd2t0YlRuaXAvRUFxSkMwWlZTL3R2YnBEZmg1RzRFSFNpQU0xZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e97241-d705-4c4f-9d4a-08da4eb9b5af
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 10:27:55.1854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yQBjhzZvWC4yAmUQ2LCi67pFP2oRJZ7Q6QQdBESGrVmvYjmSJKW3F2OuMoB6eN/ZJhgJiL0IPAhAqxwl8AdGRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5113

In order to re-use (also in subsequent patches) existing code and tables
as much as possible, simply introduce a new boolean field in emulator
state indicating whether an insn is one with a half-precision source.
Everything else then follows "naturally".

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
SDE: -spr or -future

--- a/tools/tests/x86_emulator/evex-disp8.c
+++ b/tools/tests/x86_emulator/evex-disp8.c
@@ -76,6 +76,7 @@ enum esz {
     ESZ_b,
     ESZ_w,
     ESZ_bw,
+    ESZ_fp16,
 };
 
 #ifndef __i386__
@@ -601,6 +602,19 @@ static const struct test avx512_vpopcntd
     INSN(popcnt, 66, 0f38, 55, vl, dq, vl)
 };
 
+static const struct test avx512_fp16_all[] = {
+    INSN(cmpph,           , 0f3a, c2,    vl, fp16, vl),
+    INSN(cmpsh,         f3, 0f3a, c2,    el, fp16, el),
+    INSN(fpclassph,       , 0f3a, 66,    vl, fp16, vl),
+    INSN(fpclasssh,       , 0f3a, 67,    el, fp16, el),
+    INSN(getmantph,       , 0f3a, 26,    vl, fp16, vl),
+    INSN(getmantsh,       , 0f3a, 27,    el, fp16, el),
+    INSN(reduceph,        , 0f3a, 56,    vl, fp16, vl),
+    INSN(reducesh,        , 0f3a, 57,    el, fp16, el),
+    INSN(rndscaleph,      , 0f3a, 08,    vl, fp16, vl),
+    INSN(rndscalesh,      , 0f3a, 0a,    el, fp16, el),
+};
+
 static const struct test gfni_all[] = {
     INSN(gf2p8affineinvqb, 66, 0f3a, cf, vl, q, vl),
     INSN(gf2p8affineqb,    66, 0f3a, ce, vl, q, vl),
@@ -728,8 +742,10 @@ static void test_one(const struct test *
         break;
 
     case ESZ_w:
-        esz = 2;
         evex.w = 1;
+        /* fall through */
+    case ESZ_fp16:
+        esz = 2;
         break;
 
 #ifdef __i386__
@@ -845,7 +861,7 @@ static void test_one(const struct test *
     case ESZ_b: case ESZ_w: case ESZ_bw:
         return;
 
-    case ESZ_d: case ESZ_q:
+    case ESZ_d: case ESZ_q: case ESZ_fp16:
         break;
 
     default:
@@ -1002,6 +1018,7 @@ void evex_disp8_test(void *instr, struct
     RUN(avx512_vnni, all);
     RUN(avx512_vp2intersect, all);
     RUN(avx512_vpopcntdq, all);
+    RUN(avx512_fp16, all);
 
     if ( cpu_has_avx512f )
     {
--- a/tools/tests/x86_emulator/predicates.c
+++ b/tools/tests/x86_emulator/predicates.c
@@ -1972,8 +1972,10 @@ static const struct evex {
     { { 0x03 }, 3, T, R, pfx_66, Wn, Ln }, /* valign{d,q} */
     { { 0x04 }, 3, T, R, pfx_66, W0, Ln }, /* vpermilps */
     { { 0x05 }, 3, T, R, pfx_66, W1, Ln }, /* vpermilpd */
+    { { 0x08 }, 3, T, R, pfx_no, W0, Ln }, /* vrndscaleph */
     { { 0x08 }, 3, T, R, pfx_66, W0, Ln }, /* vrndscaleps */
     { { 0x09 }, 3, T, R, pfx_66, W1, Ln }, /* vrndscalepd */
+    { { 0x0a }, 3, T, R, pfx_no, W0, LIG }, /* vrndscalesh */
     { { 0x0a }, 3, T, R, pfx_66, W0, LIG }, /* vrndscaless */
     { { 0x0b }, 3, T, R, pfx_66, W1, LIG }, /* vrndscalesd */
     { { 0x0f }, 3, T, R, pfx_66, WIG, Ln }, /* vpalignr */
@@ -1993,7 +1995,9 @@ static const struct evex {
     { { 0x22 }, 3, T, R, pfx_66, Wn, L0 }, /* vpinsr{d,q} */
     { { 0x23 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vshuff{32x4,64x2} */
     { { 0x25 }, 3, T, R, pfx_66, Wn, Ln }, /* vpternlog{d,q} */
+    { { 0x26 }, 3, T, R, pfx_no, W0, Ln }, /* vgetmantph */
     { { 0x26 }, 3, T, R, pfx_66, Wn, Ln }, /* vgetmantp{s,d} */
+    { { 0x27 }, 3, T, R, pfx_no, W0, LIG }, /* vgetmantsh */
     { { 0x27 }, 3, T, R, pfx_66, Wn, LIG }, /* vgetmants{s,d} */
     { { 0x38 }, 3, T, R, pfx_66, Wn, L1|L2 }, /* vinserti{32x4,64x2} */
     { { 0x39 }, 3, T, W, pfx_66, Wn, L1|L2 }, /* vextracti{32x4,64x2} */
@@ -2008,14 +2012,20 @@ static const struct evex {
     { { 0x51 }, 3, T, R, pfx_66, Wn, LIG }, /* vranges{s,d} */
     { { 0x54 }, 3, T, R, pfx_66, Wn, Ln }, /* vfixupimmp{s,d} */
     { { 0x55 }, 3, T, R, pfx_66, Wn, LIG }, /* vfixumpimms{s,d} */
+    { { 0x56 }, 3, T, R, pfx_no, W0, Ln }, /* vreduceph */
     { { 0x56 }, 3, T, R, pfx_66, Wn, Ln }, /* vreducep{s,d} */
+    { { 0x57 }, 3, T, R, pfx_no, W0, LIG }, /* vreducesh */
     { { 0x57 }, 3, T, R, pfx_66, Wn, LIG }, /* vreduces{s,d} */
+    { { 0x66 }, 3, T, R, pfx_no, W0, Ln }, /* vfpclassph */
     { { 0x66 }, 3, T, R, pfx_66, Wn, Ln }, /* vfpclassp{s,d} */
+    { { 0x67 }, 3, T, R, pfx_no, W0, LIG }, /* vfpclasssh */
     { { 0x67 }, 3, T, R, pfx_66, Wn, LIG }, /* vfpclasss{s,d} */
     { { 0x70 }, 3, T, R, pfx_66, W1, Ln }, /* vshldw */
     { { 0x71 }, 3, T, R, pfx_66, Wn, Ln }, /* vshld{d,q} */
     { { 0x72 }, 3, T, R, pfx_66, W1, Ln }, /* vshrdw */
     { { 0x73 }, 3, T, R, pfx_66, Wn, Ln }, /* vshrd{d,q} */
+    { { 0xc2 }, 3, T, R, pfx_no, W0, Ln }, /* vcmpph */
+    { { 0xc2 }, 3, T, R, pfx_f3, W0, LIG }, /* vcmpsh */
     { { 0xce }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineqb */
     { { 0xcf }, 3, T, R, pfx_66, W1, Ln }, /* vgf2p8affineinvqb */
 };
--- a/tools/tests/x86_emulator/test_x86_emulator.c
+++ b/tools/tests/x86_emulator/test_x86_emulator.c
@@ -4674,6 +4674,44 @@ int main(int argc, char **argv)
     else
         printf("skipped\n");
 
+    printf("%-40s", "Testing vfpclassphz $0x46,128(%ecx),%k3...");
+    if ( stack_exec && cpu_has_avx512_fp16 )
+    {
+        decl_insn(vfpclassph);
+
+        asm volatile ( put_insn(vfpclassph,
+                                /* 0x46: check for +/- 0 and neg. */
+                                /* vfpclassphz $0x46, 128(%0), %%k3 */
+                                ".byte 0x62, 0xf3, 0x7c, 0x48\n\t"
+                                ".byte 0x66, 0x59, 0x02, 0x46")
+                       :: "c" (NULL) );
+
+        set_insn(vfpclassph);
+        for ( i = 0; i < 3; ++i )
+        {
+            res[16 + i * 5 + 0] = 0x7fff0000; /* +0 / +NaN */
+            res[16 + i * 5 + 1] = 0xffff8000; /* -0 / -NaN */
+            res[16 + i * 5 + 2] = 0x80010001; /* +DEN / -DEN */
+            res[16 + i * 5 + 3] = 0xfc00f800; /* -FIN / -INF */
+            res[16 + i * 5 + 4] = 0x7c007800; /* +FIN / +INF */
+        }
+        res[31] = 0;
+        regs.ecx = (unsigned long)res - 64;
+        rc = x86_emulate(&ctxt, &emulops);
+        if ( rc != X86EMUL_OKAY || !check_eip(vfpclassph) )
+            goto fail;
+        asm volatile ( "kmovd %%k3, %0" : "=g" (rc) );
+        /*
+         * 0b11(0001100101)*3
+         * 0b1100_0110_0101_0001_1001_0100_0110_0101
+         */
+        if ( rc != 0xc6519465 )
+            goto fail;
+        printf("okay\n");
+    }
+    else
+        printf("skipped\n");
+
     /*
      * The following compress/expand tests are not only making sure the
      * accessed data is correct, but they also verify (by placing operands
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -182,6 +182,7 @@ void wrpkru(unsigned int val);
 #define cpu_has_avx512_4fmaps (cp.feat.avx512_4fmaps && xcr0_mask(0xe6))
 #define cpu_has_avx512_vp2intersect (cp.feat.avx512_vp2intersect && xcr0_mask(0xe6))
 #define cpu_has_serialize  cp.feat.serialize
+#define cpu_has_avx512_fp16 (cp.feat.avx512_fp16 && xcr0_mask(0xe6))
 #define cpu_has_avx_vnni   (cp.feat.avx_vnni && xcr0_mask(6))
 #define cpu_has_avx512_bf16 (cp.feat.avx512_bf16 && xcr0_mask(0xe6))
 
--- a/xen/arch/x86/x86_emulate/decode.c
+++ b/xen/arch/x86/x86_emulate/decode.c
@@ -518,6 +518,7 @@ static const struct ext0f3a_table {
     [0x7a ... 0x7b] = { .simd_size = simd_scalar_opc, .four_op = 1 },
     [0x7c ... 0x7d] = { .simd_size = simd_packed_fp, .four_op = 1 },
     [0x7e ... 0x7f] = { .simd_size = simd_scalar_opc, .four_op = 1 },
+    [0xc2] = { .simd_size = simd_any_fp, .d8s = d8s_vl },
     [0xcc] = { .simd_size = simd_other },
     [0xce ... 0xcf] = { .simd_size = simd_packed_int, .d8s = d8s_vl },
     [0xdf] = { .simd_size = simd_packed_int, .two_op = 1 },
@@ -579,7 +580,7 @@ static unsigned int decode_disp8scale(en
         if ( s->evex.brs )
         {
     case d8s_dq:
-            return 2 + s->evex.w;
+            return 1 + !s->fp16 + s->evex.w;
         }
         break;
 
@@ -596,7 +597,7 @@ static unsigned int decode_disp8scale(en
         /* fall through */
     case simd_scalar_opc:
     case simd_scalar_vexw:
-        return 2 + s->evex.w;
+        return 1 + !s->fp16 + s->evex.w;
 
     case simd_128:
         /* These should have an explicit size specified. */
@@ -1417,7 +1418,29 @@ int x86emul_decode(struct x86_emulate_st
              */
             s->simd_size = ext0f3a_table[b].simd_size;
             if ( evex_encoded() )
+            {
+                switch ( b )
+                {
+                case 0x08: /* vrndscaleph */
+                case 0x0a: /* vrndscalesh */
+                case 0x26: /* vfpclassph */
+                case 0x27: /* vfpclasssh */
+                case 0x56: /* vgetmantph */
+                case 0x57: /* vgetmantsh */
+                case 0x66: /* vreduceph */
+                case 0x67: /* vreducesh */
+                    if ( !s->evex.pfx )
+                        s->fp16 = true;
+                    break;
+
+                case 0xc2: /* vpcmp{p,s}h */
+                    if ( !(s->evex.pfx & VEX_PREFIX_DOUBLE_MASK) )
+                        s->fp16 = true;
+                    break;
+                }
+
                 disp8scale = decode_disp8scale(ext0f3a_table[b].d8s, s);
+            }
             break;
 
         case ext_8f09:
@@ -1712,7 +1735,7 @@ int x86emul_decode(struct x86_emulate_st
             break;
         case vex_f3:
             generate_exception_if(evex_encoded() && s->evex.w, X86_EXC_UD);
-            s->op_bytes = 4;
+            s->op_bytes = 4 >> s->fp16;
             break;
         case vex_f2:
             generate_exception_if(evex_encoded() && !s->evex.w, X86_EXC_UD);
@@ -1722,11 +1745,11 @@ int x86emul_decode(struct x86_emulate_st
         break;
 
     case simd_scalar_opc:
-        s->op_bytes = 4 << (ctxt->opcode & 1);
+        s->op_bytes = 2 << (!s->fp16 + (ctxt->opcode & 1));
         break;
 
     case simd_scalar_vexw:
-        s->op_bytes = 4 << s->vex.w;
+        s->op_bytes = 2 << (!s->fp16 + s->vex.w);
         break;
 
     case simd_128:
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -304,6 +304,7 @@ struct x86_emulate_state {
     bool lock_prefix;
     bool not_64bit; /* Instruction not available in 64bit. */
     bool fpu_ctrl;  /* Instruction is an FPU control one. */
+    bool fp16;      /* Instruction has half-precision FP source operand. */
     opcode_desc_t desc;
     union vex vex;
     union evex evex;
@@ -590,6 +591,7 @@ amd_like(const struct x86_emulate_ctxt *
 #define vcpu_has_avx512_vp2intersect() (ctxt->cpuid->feat.avx512_vp2intersect)
 #define vcpu_has_serialize()   (ctxt->cpuid->feat.serialize)
 #define vcpu_has_tsxldtrk()    (ctxt->cpuid->feat.tsxldtrk)
+#define vcpu_has_avx512_fp16() (ctxt->cpuid->feat.avx512_fp16)
 #define vcpu_has_avx_vnni()    (ctxt->cpuid->feat.avx_vnni)
 #define vcpu_has_avx512_bf16() (ctxt->cpuid->feat.avx512_bf16)
 
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1306,7 +1306,7 @@ x86_emulate(
     b = ctxt->opcode;
     d = state.desc;
 #define state (&state)
-    elem_bytes = 4 << evex.w;
+    elem_bytes = 2 << (!state->fp16 + evex.w);
 
     generate_exception_if(state->not_64bit && mode_64bit(), EXC_UD);
 
@@ -7147,6 +7147,15 @@ x86_emulate(
         avx512_vlen_check(b & 2);
         goto simd_imm8_zmm;
 
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x0a): /* vrndscalesh $imm8,xmm/mem,xmm,xmm{k} */
+        generate_exception_if(ea.type != OP_REG && evex.brs, EXC_UD);
+        /* fall through */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x08): /* vrndscaleph $imm8,[xyz]mm/mem,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        avx512_vlen_check(b & 2);
+        goto simd_imm8_zmm;
+
 #endif /* X86EMUL_NO_SIMD */
 
     CASE_SIMD_PACKED_INT(0x0f3a, 0x0f): /* palignr $imm8,{,x}mm/mem,{,x}mm */
@@ -7457,6 +7466,14 @@ x86_emulate(
             avx512_vlen_check(false);
         goto simd_imm8_zmm;
 
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x26): /* vgetmantph $imm8,[xyz]mm/mem,[xyz]mm{k} */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x56): /* vreduceph $imm8,[xyz]mm/mem,[xyz]mm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(false);
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x51): /* vranges{s,d} $imm8,xmm/mem,xmm,xmm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x57): /* vreduces{s,d} $imm8,xmm/mem,xmm,xmm{k} */
         host_and_vcpu_must_have(avx512dq);
@@ -7469,6 +7486,16 @@ x86_emulate(
             avx512_vlen_check(true);
         goto simd_imm8_zmm;
 
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x27): /* vgetmantsh $imm8,xmm/mem,xmm,xmm{k} */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x57): /* vreducesh $imm8,xmm/mem,xmm,xmm{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w, EXC_UD);
+        if ( !evex.brs )
+            avx512_vlen_check(true);
+        else
+            generate_exception_if(ea.type != OP_REG, EXC_UD);
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x30): /* kshiftr{b,w} $imm8,k,k */
     case X86EMUL_OPC_VEX_66(0x0f3a, 0x32): /* kshiftl{b,w} $imm8,k,k */
         if ( !vex.w )
@@ -7632,6 +7659,16 @@ x86_emulate(
         avx512_vlen_check(true);
         goto simd_imm8_zmm;
 
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x66): /* vfpclassph $imm8,[xyz]mm/mem,k{k} */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0x67): /* vfpclasssh $imm8,xmm/mem,k{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, EXC_UD);
+        if ( !(b & 1) )
+            goto avx512f_imm8_no_sae;
+        generate_exception_if(evex.brs, EXC_UD);
+        avx512_vlen_check(true);
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x70): /* vpshldw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
     case X86EMUL_OPC_EVEX_66(0x0f3a, 0x72): /* vpshrdw $imm8,[xyz]mm/mem,[xyz]mm,[xyz]mm{k} */
         generate_exception_if(!evex.w, EXC_UD);
@@ -7642,6 +7679,16 @@ x86_emulate(
         host_and_vcpu_must_have(avx512_vbmi2);
         goto avx512f_imm8_no_sae;
 
+    case X86EMUL_OPC_EVEX_F3(0x0f3a, 0xc2): /* vcmpsh $imm8,xmm/mem,xmm,k{k} */
+        generate_exception_if(ea.type != OP_REG && evex.brs, EXC_UD);
+        /* fall through */
+    case X86EMUL_OPC_EVEX(0x0f3a, 0xc2): /* vcmpph $imm8,[xyz]mm/mem,[xyz]mm,k{k} */
+        host_and_vcpu_must_have(avx512_fp16);
+        generate_exception_if(evex.w || !evex.r || !evex.R || evex.z, EXC_UD);
+        if ( ea.type != OP_REG || !evex.brs )
+            avx512_vlen_check(evex.pfx & VEX_PREFIX_SCALAR_MASK);
+        goto simd_imm8_zmm;
+
     case X86EMUL_OPC(0x0f3a, 0xcc):     /* sha1rnds4 $imm8,xmm/m128,xmm */
         host_and_vcpu_must_have(sha);
         op_bytes = 16;


