Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBC2706AFE
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 16:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535926.833983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzI3F-00055Y-C8; Wed, 17 May 2023 14:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535926.833983; Wed, 17 May 2023 14:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzI3F-00053G-8F; Wed, 17 May 2023 14:22:49 +0000
Received: by outflank-mailman (input) for mailman id 535926;
 Wed, 17 May 2023 14:22:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzI3D-000530-Ox
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 14:22:47 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a561ec3-f4be-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 16:22:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9311.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 14:22:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 14:22:43 +0000
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
X-Inumbo-ID: 4a561ec3-f4be-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNvJZKpPCZJDqSfYPUmKWVLmFcUN7r+V6oJY+StHvF5if90JGSC7yDWQYyLr5wd7x5/aTTonD8xj5vMTNRJZ/nY3kmYpCfTQJQTepBeTmzj4Wm/aokOo5R/him9Frdn/dm88WrAM6HRAvWN3tY/fG9AOG94MXJhE2LUdocWOhpTOeNzQaQIPTs+SyQYHtoa8R+SkfDRz6/CjR0ifpfS9PiqBOQ3Ftvg7SizwguR+idVdjDZ4rJosalla0jIxN6oddv198Bx+8iklzKAARxJuEzPecO7+5W8MDSEQohoCEopEcmg5X6cXLwQ7rvol65sTuc9AOqBat5OR5SCuTTHG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vA8ACpAnc4NWR00iJWkixQSnKNSh+bScY3SDFmtG6i4=;
 b=Qpco6XpU3t5/lix2+/b/lM4XF2ssEjtbPMaIfgoxzD/EGLuU7BwoW1KSKyOD/TmTmr3sdYfd5S/F3xPr1oaRf0WH9Q4E3aZBNCvjCenoROShcsBwjoKDbFp0SmE11PVHkpXiinuSP1Yk2n8njca+By8o8WY7y1T1EEX7JV0f+pDXo826dYDLdnDEEi/puIrXHlpk+KFpwjp5waceg7iO7lvuGGVqqTaL+yHaWfg0+j8/xxo1pmBQSz3/+WVIA/kv9c44xgK+gBR5K6roQOmwER9GASA4zN+o7ahcB0CcNUArVCMP4C0+A1mMPCp+twzmDUR3NYJSHro8wOM1WTym7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vA8ACpAnc4NWR00iJWkixQSnKNSh+bScY3SDFmtG6i4=;
 b=sdFmxB0Esgeokcly3YwsCqATD3NRoAoOHf33kPNynwigdxZ3RvIthLXyyQY7/8yRApN0SObyq6OAgeATlpOwHbRNSeABwvbiX7eX5Uqhvo1WHiq2qkphIeSZ2eKbBt2+N5m2ISXwkMIRyltKl5c5eH0sUO+Qhc06VNCxs08QVD5ugNZSfLCvbIRPane3RQftAzan84CEUDGHWv4X1wjb+gEbeNofDKP0ZitTxWHrh9flxPIA9Y8jGJy9bMS2J9OfTG6jYVMvTSIesR+WrqilQczn4klxaORJSixjaTk2W0vXaBZnMQ5at47+nYcVpvJRT0FqEPjwRJgyPF27CP4Ihw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f994f67d-e0de-ad28-d418-1eb5a70bc1b8@suse.com>
Date: Wed, 17 May 2023 16:22:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: do away with HAVE_AS_NEGATIVE_TRUE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS1PR04MB9311:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e13f16-8a88-4c4f-f986-08db56e22da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z9SB/qotM7CE4/9godTmbOiR5pbs9vmsnluFLCvGzs6kpzxxA4xbG2hpjf7ig6GGUCmSlRkghkN+iXMvPQbjMLlL2vzrkQCICPNFItwpYLsu5qMQkMM9v16bDfbSWpqFR9qggy2Saa9Vnxk4e+FGDtnheOvpRTv0EKIF/lMyukbW6MdCTtpSB4HOkfmjFYYaL2nuYZpxRylg17cmlo2e5GhWKllN3RRKhwVdjd1TG58KT+HlGlOQmoxY4RmAB6YmQT8DcmpjwivWZNXycaxDQR15KIV6IyzW5cY00OBAv6hgYCfkDNW9RoGdbN9xHx9njGB1y4ZBfgsLxa6bLBLDov3ONNlj9SRuNZKuWnHTMlCrF5M7Fosga7JyrXqfqc+HDdTs1exwrkkJcnv0mj+l+DeZRGeVdDQAbPpbczDeWCh1XfBss06je6ebxSLK+c562au4C3Ohr9j6iqEugi8XcQAj37ZVHF+H0wfRQG9GACrECsUNrPTYxTgxLyHHDamMRRAjWUb8HwjgTtOMg/5/I6qW/QNg9ZTpKP3EDAft+PXNfpq1VVLK9dY33JyRXjk03e4p2ZE/QULQWA3r5Yk5h+99vMX2ZkLnLhS6MIHPK8nQUTy5QjEx/KejzWOCmP6FIjkUAN4uvQxccaGG+Epe5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(6486002)(36756003)(2616005)(6512007)(6506007)(26005)(186003)(5660300002)(38100700002)(54906003)(31696002)(86362001)(41300700001)(31686004)(316002)(66556008)(6916009)(8676002)(8936002)(66476007)(66946007)(478600001)(4326008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnVYYTY3aUQ0L05ZWXFML1pKcTB0dVNmZXRjUnhZRTk2WmZaVVZId2VmdVRu?=
 =?utf-8?B?YWxkTnZuelkxUldRMy9sQW9zbEo3cWNLamFseDhycDhMTFpsVFNPOTA5Z0NE?=
 =?utf-8?B?RS9IcVIvWW9XNnVXZm00YXovc3d2YnZPOUVpTVd4LzFndFQrQXV5MXdoa0Jt?=
 =?utf-8?B?ZVhWN0VPSkNhVEV1MXZ0Y0lEZithTmNaaWFGWkJ2Rmt2eVBHOUxnNjQ4YVVq?=
 =?utf-8?B?VzZkRnVsWloreUdaSi9vL0E2OEs0cEI5ZFdPQ282UGpCL2hXT0hqRWtWRGlv?=
 =?utf-8?B?OC9tTG5GcU9yQjA5eG5mMEpsajJPNE9Vc0JON0syNnpRV21YalZjN3lhK25w?=
 =?utf-8?B?ZXI5S3FHOHM2T1BQeEZYU0c3cnBJU1VKSTkzbVB4azRVb2x5VFlBcE81UHBt?=
 =?utf-8?B?cmNsaWJHZkRUbVdaL0tmbjNmNUVFNzhYSTdGUWpiRkd1eWtzdkpFeFJEY0Nj?=
 =?utf-8?B?eWM1QmFvOUVRcGxSaFRXUi85SHAzZUFxWlN6TGliZnRSUXpwYm1TcnVmaEhm?=
 =?utf-8?B?eGYvSEo3bWNUZGhuc05XSldkUTYwVFpVWkxUVzE2eHBsU1RMYUhGeWU3eXVD?=
 =?utf-8?B?NFZtU01mV1kvb1FrTHgvekhrSXlQTmNMTWdCN3IzVjRkZ08yK0d5K1I5aS9O?=
 =?utf-8?B?L01uRDJ0R2ZPeHI5UmlmQThtRFAzbWxHOGRKK2xjTU1nVGc1VnpPaEUrVGxJ?=
 =?utf-8?B?eWN6eWZHdzlsMGJsNTlra3N0ZlVaN3BpYjlQUXZPUGx5VDcxbVRJc2hCWEc5?=
 =?utf-8?B?bThvRFF2SVZON0pkMGY3VlNJOWJ5b0xZUnIxOTNsc2hBYnBRNk0wTTR4M0pa?=
 =?utf-8?B?dnlBVDk2aEdxMUd4T1FZUjR0OHNjMkxEZ2Y2MjZFTlBONnAySmhZTU1rQzVh?=
 =?utf-8?B?RVUvSmNuZjEzcjEydmV6K25NU3VUa0tRYXVYZnM1YU5KSDcvWVhpQVk4U2h2?=
 =?utf-8?B?ZlhWeERuVXdyS1hXeVVLQURRaG9paVY1MmZTNmxCV0t6Z3pKUUM0R0kvWitT?=
 =?utf-8?B?M0JSTnd3dlJ2WkxjMWxOZmh5MmhYR1JyTlVHUUNMUTFGa0p4OFk5dnRWOGx6?=
 =?utf-8?B?c1JLaW5xVXJvSXJORDhBbTMrdTUwRk5NZEVtT0lBdTk1MEFiK2pJVHVkMzMy?=
 =?utf-8?B?WWZjTUIxeTMyNkpoQ2NFenRBRjVkQkdhSXpWZ0wzVFlkUVhvUDUvczRHMXdI?=
 =?utf-8?B?L2RMc0V1YlIrWGZuU2NGVGowQkhFcmFVNVE1ck8zYnZOUE1GdWo0QTBBV2Q5?=
 =?utf-8?B?cElWWlJLY0Y4WHd2Uk42YWVWaTVwZ0pSVUVXeS9qWDlwRzl0Y0YxbDdPQTRa?=
 =?utf-8?B?L0lhSE1DMGE3MmtBN2JwZDNiWjZHelY0S3JLYTJiWVBtUktpZU03dW45aFYw?=
 =?utf-8?B?WW4zZG8zVm5CSWY2TnZvcm1pem9SN3AvSWpTVFIzVFRJR2ZGbXlqOFNSNVRi?=
 =?utf-8?B?Sm9xQU5vMElYN0NoV21VMm1OUllPY1YxUDBNZ3dnMTBaaUpaR0ViRWVBbDFE?=
 =?utf-8?B?WlN6eWt0dFFRMkpmUUNjSVNTNDV2RW03UkNUeGlmM3hrNkh3U0VDS1RTVkl3?=
 =?utf-8?B?bzMvVHpxTzQrbFlvRS9vWXJuL3lwZlcwdytXVm5DWnRacUdNOENlNVY2ZnJw?=
 =?utf-8?B?b21tZW1pSDQxa3ljeVlWR1FxK1NsWWVCQXpkNTNQQjFVbGxaaThQYTRBWHg0?=
 =?utf-8?B?NlFwd3lDWW55V0ZVY0V6Tm0zV0RUYUcrankzN0RWaW9YK1BQZTNId2JsS1JP?=
 =?utf-8?B?ZmRWeHV3dGtkeEFpZzNiVm1CM0cvS2c1OExOUXhkQ0MrdlJYckZxVkx1bjF4?=
 =?utf-8?B?V3NEd21HV1UrZDJ1MjZnelpqOVNzYU1oZ1RobU1jcGIySjlvdWRrWXA2K1lL?=
 =?utf-8?B?TG5LMXR6aVViLy9BMkRTYVZyWnpUa2hMajdJUGFKU284VVo0OENjZmxyUDNZ?=
 =?utf-8?B?OXgxd1hGWnluTkYvWmdKSlVlZEg1N0FCUHYzYkx6TnVpYUdjbWR1NVFkTkVB?=
 =?utf-8?B?MDJUUmRIc01vb0tvdHNrWWZnR0szWVc3dURIUUNycTE2SWFVQW1nci8rYXcz?=
 =?utf-8?B?QlkrbHllWlR5cWY0bjlOVEMyaUZWZzF3dWhEbTZ5YlA0eE9QcXlVT2V0Ujhl?=
 =?utf-8?Q?mEReHdEt507fo65H9eEwgqjkl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e13f16-8a88-4c4f-f986-08db56e22da9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 14:22:43.3139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3iVW1V1kzA3ExHRBrJHwtbfo4MXHibjenvjFI0a27YnIhFDk5Z/UufzWmOuFqMNXu+i9TJwuDYOA8xjtV35S6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9311

There's no real need for the associated probing - we can easily convert
to a uniform value without knowing the specific behavior (note also that
the respective comments weren't fully correct and have gone stale). All
we (need to) depend upon is unary ! producing 0 or 1 (and never -1).

For all present purposes yielding a value with all bits set is more
useful.

No difference in generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Unlike in C, there's also binary ! in assembly expressions, and even
binary !!. But those don't get in the way here.

--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -26,10 +26,6 @@ $(call as-option-add,CFLAGS,CC,"invpcid
 $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVDIR)
 $(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_ENQCMD)
 
-# GAS's idea of true is -1.  Clang's idea is 1
-$(call as-option-add,CFLAGS,CC,\
-    ".if ((1 > 0) < 0); .error \"\";.endif",,-DHAVE_AS_NEGATIVE_TRUE)
-
 # Check to see whether the assmbler supports the .nop directive.
 $(call as-option-add,CFLAGS,CC,\
     ".L1: .L2: .nops (.L2 - .L1)$(comma)9",-DHAVE_AS_NOPS_DIRECTIVE)
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -35,19 +35,19 @@ extern void alternative_branches(void);
 #define alt_repl_e(num)    ".LXEN%=_repl_e"#num
 #define alt_repl_len(num)  "(" alt_repl_e(num) " - " alt_repl_s(num) ")"
 
-/* GAS's idea of true is -1, while Clang's idea is 1. */
-#ifdef HAVE_AS_NEGATIVE_TRUE
-# define AS_TRUE "-"
-#else
-# define AS_TRUE ""
-#endif
+/*
+ * GAS's idea of true is sometimes 1 and sometimes -1, while Clang's idea was
+ * consistently 1 up to 6.x (it matches GAS's now).  Transform it to uniformly
+ * -1 (aka ~0).
+ */
+#define AS_TRUE "-!!"
 
-#define as_max(a, b) "(("a") ^ ((("a") ^ ("b")) & -("AS_TRUE"(("a") < ("b")))))"
+#define as_max(a, b) "(("a") ^ ((("a") ^ ("b")) & "AS_TRUE"(("a") < ("b"))))"
 
 #define OLDINSTR(oldinstr, padding)                              \
     ".LXEN%=_orig_s:\n\t" oldinstr "\n .LXEN%=_orig_e:\n\t"      \
     ".LXEN%=_diff = " padding "\n\t"                             \
-    "mknops ("AS_TRUE"(.LXEN%=_diff > 0) * .LXEN%=_diff)\n\t"    \
+    "mknops ("AS_TRUE"(.LXEN%=_diff > 0) & .LXEN%=_diff)\n\t"    \
     ".LXEN%=_orig_p:\n\t"
 
 #define OLDINSTR_1(oldinstr, n1)                                 \
--- a/xen/arch/x86/include/asm/alternative-asm.h
+++ b/xen/arch/x86/include/asm/alternative-asm.h
@@ -29,17 +29,17 @@
 #endif
 .endm
 
-/* GAS's idea of true is -1, while Clang's idea is 1. */
-#ifdef HAVE_AS_NEGATIVE_TRUE
-# define as_true(x) (-(x))
-#else
-# define as_true(x) (x)
-#endif
+/*
+ * GAS's idea of true is sometimes 1 and sometimes -1, while Clang's idea was
+ * consistently 1 up to 6.x (it matches GAS's now).  Transform it to uniformly
+ * -1 (aka ~0).
+ */
+#define as_true(x) (-!!(x))
 
 #define decl_orig(insn, padding)                  \
  .L\@_orig_s: insn; .L\@_orig_e:                  \
  .L\@_diff = padding;                             \
- mknops (as_true(.L\@_diff > 0) * .L\@_diff);     \
+ mknops (as_true(.L\@_diff > 0) & .L\@_diff);     \
  .L\@_orig_p:
 
 #define orig_len               (.L\@_orig_e       -     .L\@_orig_s)
@@ -49,7 +49,7 @@
 #define decl_repl(insn, nr)     .L\@_repl_s\()nr: insn; .L\@_repl_e\()nr:
 #define repl_len(nr)           (.L\@_repl_e\()nr  -     .L\@_repl_s\()nr)
 
-#define as_max(a, b)           ((a) ^ (((a) ^ (b)) & -as_true((a) < (b))))
+#define as_max(a, b)           ((a) ^ (((a) ^ (b)) & as_true((a) < (b))))
 
 .macro ALTERNATIVE oldinstr, newinstr, feature
     decl_orig(\oldinstr, repl_len(1) - orig_len)

