Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8BD70DCBA
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 14:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538468.838408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1RGM-0007EO-CR; Tue, 23 May 2023 12:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538468.838408; Tue, 23 May 2023 12:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1RGM-0007BZ-9i; Tue, 23 May 2023 12:37:14 +0000
Received: by outflank-mailman (input) for mailman id 538468;
 Tue, 23 May 2023 12:37:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1RGK-0007BT-Nu
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 12:37:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89786595-f966-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 14:37:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB8000.eurprd04.prod.outlook.com (2603:10a6:102:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 12:37:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 12:37:08 +0000
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
X-Inumbo-ID: 89786595-f966-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJvAkbbSmAQNiE0stZ1Wr7tYThM/VebErE184Ndipy3Nrjq6n6YxEQfRvXXqBtTFSOo53SjlGnyQBqWagB05LGXPDp+jzRWFbpnrkGxDbSLU+xBidvHuYcyZqjT0E4v1AYZGKIXflAiRaiUET28Y2sAiAISLMyEuzsKZQtodpXRax/9uaooNT1Z55U2Bq5a4NQ9xV/9zBnYFQzEYyFUmXvzQEo95oMwqwsBciIDrZvuaJNPfG1gYwyMrFTLutSajkykmyCXhjpisg4QCR1zlgKCWroC8w/+M9qOZ6vpN2X1AI2r09GG9cY3utJ4oB1i8EUitpud03GaVko5AqsPVdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBlSeCkggQ/q/Seh1YdjZGAzuf4J5h3CY4GRei16rpE=;
 b=leCE8DNR+VSWqjyyKgUqaE2qjvRFRmYTi+CDXcIcQKrnfBPQQm8cxBDpoqZ/vmoMzshUSV2PyRbR9gHJO30WBINi1osODq8YuXHqPhEgz8alGRRWTwahlCkMuvqrckUtyd6K/nrNdICTGaFkvvHwdDGYF8mu/IiEIiTU/kej99KE/doPyw4KXxljlcHEk00fx/+18YftJMI1yaeS4KHBE8FhpsekkaVssVFegyU8HvdbgWPe3kogL8V6O6/9BV4DPEdI5I9S2cogL327ceOMt8Awm1yDdljj6R+2OjXbp5p0ojkBpGYzZalYl/YkfTqP8u6B3bWO/Ksf0D9Raxxy3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBlSeCkggQ/q/Seh1YdjZGAzuf4J5h3CY4GRei16rpE=;
 b=aLt71JHoLny5N0GGhMpTjFXuAecH/LcdVt2H7b7Pc95XW1QHwVYCnWCtLh/MImmkPqTX5mr1M4nZlJB53wmoYMg6KD5hgLuALvLjiBdLY2A1z8/J/GbApmKwddbqDP/YyARuHtUJaZeNqIuZrbgFGulGG/i+UiE3VD/R4m2/TkrGaj6Vk+V56SrogKfwUggDY0gazjEY0Kzhx7WfB4lf8U0kFQRzK59Y/qKMik7U+McoBMa9j0kF0FThoXSB/Aj8gwgdKgtc81ZP3hzLYtmPnxkRDa14Qo85+r7+LNkUbG4SSoY+OQOrVJrKOJlZ65cu/zOO/6NAr741n6l/+86RqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f4234ce-9427-b78c-f7d5-4d9822d4d1c9@suse.com>
Date: Tue, 23 May 2023 14:37:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: do away with HAVE_AS_NEGATIVE_TRUE
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: ce575273-8c6f-4fb2-2172-08db5b8a6bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EZyDxjdlNKOgjnAnBb+R89ls1Ldw/yusoZ1mkwPcVkVMBlGf7lAPUOOGVud6m0BFwZbL/8/XqvpC4ofcTf1+PnLUpMq3YEtVArr5uz3BXtPJNpy/uleXemVD+t+QBYoyrkwHo8STDGweeEmFCnoMPJfC8Qta/5JbmhC4RebFCQ1z5/wFP9A1dX7pdZ5WB6sz1LTniSEILr5P/YcDjg/OLSsZX44M1E9+1qhh7R9dm9lB1Mp2SZz11kKKhOsP6NVmFF+MN6b/+eiuKm5nViGy55B3A4ppd9UILaCpsHLEm3GjsM2qogqKhc8VUqa1UVZoX7jTp9ob2Q8jZ2uFcA3BqbY49BBmD/5X8Vuosn+d2NZ3AwdMdZ0YaJK5pdPbIcRD9mqHzkn6fRV/gYU/F6UNKHi90M78LLj6UiPAQg4HtjzR+2VOmXBW3Qz3gngegwJRs9HfXKjr69gcZ9ASoqWtzYmEitpdO2i9E6mRBnBvB7sUQ/NGE9qRh70eL83SD2oJtKQZ6Di9wXCMBnN4rmaUnLftWV+NrpDgvBZWeZl9augoqlozswl1zCh4C63bEfrILuSNNZ+NvRk61FEWpeTvcUqu7wYT6UEajucMjLnXBS9D+PY98VXDXktubvRzDwkk6TT10LUnqlKtjjxyb/4i6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199021)(8676002)(8936002)(5660300002)(186003)(26005)(6512007)(6506007)(41300700001)(31686004)(38100700002)(54906003)(66946007)(478600001)(86362001)(31696002)(66556008)(66476007)(316002)(4326008)(6916009)(2616005)(36756003)(2906002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K01RVkRZVHJNMzRwcDdhcUU1V0U5UHNDN2JOUGZaakd0eUtPVlpsbmU4cGVS?=
 =?utf-8?B?ekpOVnpKWXpjb2tsbSsxditPcThQMmxzVlJjbWNqd0hIdUpnWGs2eUQrQzYr?=
 =?utf-8?B?YVNaVzFZdzZjY29pUHZBVW1RY2lOSkNKUXdGdzZseCtqTFNKWEc1WEFQNVgz?=
 =?utf-8?B?MUcvMHlLWHk5b0N6TXBla1pIRWZKOTFnTDNNZC84bTlqd2o0OGw0QUNGc3Mv?=
 =?utf-8?B?RTNBSUJBdE94MEV0RzA1ZXdCTm9RbEpXWDQzUU8rTnJGTk56aHBwVlIwb3Ex?=
 =?utf-8?B?R0prVCtTRU9iK2ZDaWNXNG12bDdXZ1RRdlZxMGNIYlhaR3pYTUdaaUYzRE9D?=
 =?utf-8?B?c2NKVzN2QWxwZjU0NmlIOGZKdVYxcGNIM3Fhbk5COXF2a3VxVm4yQ3h5OEh1?=
 =?utf-8?B?eXpFalJnZkthOVBGSFJKN1lUOW5HMEtRdUorSlRSc05rbHMwck14Z2NPREx3?=
 =?utf-8?B?L2VuL09NcWdXVlpmeTdOYkk2dTlDK1RHRytZY1lZckozY1VvVGN5ZDArcmZM?=
 =?utf-8?B?MW5RblUzZTRvMyt1K3V2VnBONkRwOFk5Yi9YVnhhOHNQSHlIZDluQzIvL2hr?=
 =?utf-8?B?cVdvY0YxN3V5U2pjazlmSHlYMHJPbTZkeGVMNmorbXk5KzllNjlwK1l2djFJ?=
 =?utf-8?B?ODlaNHFWeXYrV3I5UVU2SHMxSTIwNFhVNmVFQk9wb1dqZ0RLWFJYWlYvUVdC?=
 =?utf-8?B?WU9VbnJMWWJqMkZXS3VhSDE4YStieG0veVl3K05COXVKSVIzTWsweFFiSFcx?=
 =?utf-8?B?L1VpaytHRGRncG13Z1gxWXJvcUx6TFZCdXNVTVZwWnJ0SVlZY3VsSHpUSU5M?=
 =?utf-8?B?UVg4UnNBdkRkUWg3UkpFQkY4TWFPSUs4WDZMRm9ZKzFqY0dnTmZYbmJQUG9t?=
 =?utf-8?B?YUdxMXIyUG11SkdHWis3elFHMHYweEhDdFRmbE5RL2NmTkJDWGsxYjRzOGEw?=
 =?utf-8?B?R1NYVE9SSWs1eHBKTUxnYkY4U1pJeWJ0ckhrUVFrbktZU0JYeFc3VGVhQzVz?=
 =?utf-8?B?VmZXS2FoTndqSFE1V2lRWXFxMmV1TVdMdFZFYS9uSEZIZ1gydDdLMFRoVFMx?=
 =?utf-8?B?Q1VNbitISUU5Zm0wK1hHZXdBUXE3MVFOUitKTE5ZVFBrNjN0WXpXbE54UjRF?=
 =?utf-8?B?RHlVWkFtRWJjYSthSTRvRFhNYnV1eTcweW5OQWpZOGg3c1lnQTJaN0JOR1Ns?=
 =?utf-8?B?dS9CN3BaeU5pMmJPTjBIS255dWVUcVNENFpOUW55QU1yQmE2TU5BV05saDhl?=
 =?utf-8?B?aGJPR1NZZnVNUEUwVSsyT3A5QkhwNVV6SERnT3Rxd29ucFRqYnZIZk1BM0dI?=
 =?utf-8?B?UjUvREJZNmoyVGpyb2N3YlFuU2FaVFloVWNwUXY1KytmM2lTSVF5V0hXdkFX?=
 =?utf-8?B?K1JmQVZHMlZZb0pNL2pIamw3eGQvbGk1UHZITGt6TFRrNnkwaHdCcEpBdEZh?=
 =?utf-8?B?NkFiN0pCQkRIWWxlZXpINDNsZVNTbnJFSUlWb1kyS29PUi9GZXVIMFEzYlpj?=
 =?utf-8?B?UGpJRTg2MW9PUGNIS1l4TVNIN25pQTVrclJiSjhJVFl1eXdPZ3dzWEhEcDhz?=
 =?utf-8?B?VjhqTmlLbURQUitGbkZtTjlFRldXTDBaNjFnbHFSeCtGTFdYTm5BL1c3R2tu?=
 =?utf-8?B?dnNjYVpZTGlXeVZjcmlGT0t5V3Rmd0NwYXF6WEEyR1Vna1B4ZVNZMWc0aFU4?=
 =?utf-8?B?UEZJeXd3ajY5dURCckdFL3JjOTljSGljQTRPc1lMQWtGQnd4TmtJRGQ4TzRU?=
 =?utf-8?B?cEFLV1o1aThlMTR3THpuM0NyMnowTnlKdUVWcDQwcHZCMkt6Y01EME9vSVdM?=
 =?utf-8?B?UFVtYjk4M1lpdVJSbkVnaTFtcTBHeUpUSmNmN3V2WUREanhRcEtxUlRhTkR3?=
 =?utf-8?B?dVM0TDB5ODJVNW9YaUxNbmVLbmdRQ3VOMGhGbTB4M1pYRjVvekszMmRNWlMy?=
 =?utf-8?B?aXJtZ2pWWUtEMHJ1L1oxS1haTi8zbHRRWnJpVHozeHh5QkludWJtUjNoMHk4?=
 =?utf-8?B?anJIUGJzQkovZFZuVW1aZHRlb0xGQll6b1kzWm1ReFpjNDdINFAwZzVQcUtw?=
 =?utf-8?B?cXVzOWVSRzBTVjBuTlVXcDdnTVBuYzFvUFltTWlrREZNaVNpdHZZK3kzQ1lC?=
 =?utf-8?Q?+NX5KxZOSfaQI3GAgjCvkL1qo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce575273-8c6f-4fb2-2172-08db5b8a6bf3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 12:37:07.9427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nI8u7lAEDicmCKvJkXSxuu+rRhroRkLpcl7EDlJ/gBWZXmyl+bKXtpUf1s0PcdFaVj9FHCYiidCvMAOi19XXKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8000

There's no real need for the associated probing - we can easily convert
to a uniform value without knowing the specific behavior (note also that
the respective comments weren't fully correct and have gone stale).

No difference in generated code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Use "& 1".

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
+ * GAS's idea of true is sometimes 1 and sometimes -1, while Clang's idea
+ * was consistently 1 up to 6.x (it matches GAS's now).  Transform it to
+ * uniformly 1.
+ */
+#define AS_TRUE(x) "((" x ") & 1)"
 
-#define as_max(a, b) "(("a") ^ ((("a") ^ ("b")) & -("AS_TRUE"(("a") < ("b")))))"
+#define as_max(a, b) "(("a") ^ ((("a") ^ ("b")) & -("AS_TRUE("("a") < ("b")")")))"
 
 #define OLDINSTR(oldinstr, padding)                              \
     ".LXEN%=_orig_s:\n\t" oldinstr "\n .LXEN%=_orig_e:\n\t"      \
     ".LXEN%=_diff = " padding "\n\t"                             \
-    "mknops ("AS_TRUE"(.LXEN%=_diff > 0) * .LXEN%=_diff)\n\t"    \
+    "mknops ("AS_TRUE(".LXEN%=_diff > 0")" * .LXEN%=_diff)\n\t"  \
     ".LXEN%=_orig_p:\n\t"
 
 #define OLDINSTR_1(oldinstr, n1)                                 \
--- a/xen/arch/x86/include/asm/alternative-asm.h
+++ b/xen/arch/x86/include/asm/alternative-asm.h
@@ -29,12 +29,12 @@
 #endif
 .endm
 
-/* GAS's idea of true is -1, while Clang's idea is 1. */
-#ifdef HAVE_AS_NEGATIVE_TRUE
-# define as_true(x) (-(x))
-#else
-# define as_true(x) (x)
-#endif
+/*
+ * GAS's idea of true is sometimes 1 and sometimes -1, while Clang's idea
+ * was consistently 1 up to 6.x (it matches GAS's now).  Transform it to
+ * uniformly 1.
+ */
+#define as_true(x) ((x) & 1)
 
 #define decl_orig(insn, padding)                  \
  .L\@_orig_s: insn; .L\@_orig_e:                  \

