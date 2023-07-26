Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680A97633E6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 12:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570292.892033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObrO-0001aD-5q; Wed, 26 Jul 2023 10:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570292.892033; Wed, 26 Jul 2023 10:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qObrO-0001Xp-2c; Wed, 26 Jul 2023 10:35:14 +0000
Received: by outflank-mailman (input) for mailman id 570292;
 Wed, 26 Jul 2023 10:35:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qObrM-0000JJ-0h
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 10:35:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18786356-2ba0-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 12:35:10 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9175.eurprd04.prod.outlook.com (2603:10a6:20b:44a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 10:35:08 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 10:35:08 +0000
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
X-Inumbo-ID: 18786356-2ba0-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uq9CgiWYX/RWkQ2UTKQ7FAI9AZQHGTcVKFqWjeXdZRUHIvce38Bs+sErV1gn0AmYFigdHjFdvZUOrZNP2bWRy8MI5OEo1Js1DfvZWeVJkQdxAThKLiRGmunH0DES/Crr2VuXOlDRf3ICibSVcl8MAL8In4R8a8EKn942IkxRPkQJmIMJBGYJFsKxeTzqoUHHquSdfqiEL6RspqfIfxXsHkFYUAagy2sy30rs4WxWG0ZFJcYdNPQDZe20h/6asPnpAbpMHoN3oINwnLRhv+dgNZXFHHP6lJ2MHYUy+t/l/l9vt0RyuWCtTplZN0TUGPyipsnLJRSRJvPnSsmGz2tvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7fll069aCOGhw/Ujfnzc7eYrLnddgaGWv3jfKQz64w=;
 b=hXIUzDngWICNoHZZyVas9DwoxToew+ySpHApwhblOjigvYovQqT1LdvSHTjVw1KiiM2eYjAj1RKTu+vh04MsCNwM0QjE+ygYjqrDjWmKRE/K2nQJfQYRuPAj/A7T6LbNdgz981tLIbzBXiOyAcpXafULKhGkQqDi2Lifr/0XYEiotEHsu25b5R9phHeSkYCATZoJafATl5jAZx/0Rl1PIe1nj9dqOTXK6J36G4CPN3Ej7ZPwrTjakm+0y0U48B45SdF7MPpYYUAXYL8sqd/OXD6AvgOG+p5dthmAWq/adnEPm3J2lAin4PCD46PtcPJrnhJ9F3awF88Ha2nU9x7V0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L7fll069aCOGhw/Ujfnzc7eYrLnddgaGWv3jfKQz64w=;
 b=a9BEUIZHRI4N248NyvYpGbKaxTnc/hWC3dABl/e63jDTeIcbAjeW9JWKQE41Tbz2KAettUOG28vSJVOZeXWYIG7BmU9Y+nU3slMj+Id7toIctVt+I4oX5jCyjAS3BK/3jaDAbiatWlrCsTG6H9pN8LhmD/FJ9MX6fwbNCIh72emXTvyzgB7/9rKVoGKtZ1q1D9atTbJyksIaVKw6z0sdJW9MP7B4m5iEvGKzvClAWwfg3evvGhGHyy7gTi3r2XmxWycWifLQaTjd9iCgQ/AKbrsPIQcUc6epoTEqYjokfSC0U+zlEl7wXzalFoMU4e0XkGfBOOj6I6RurT1Xe6u7uw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <367db8f8-3287-d694-e591-efcffaf9ee99@suse.com>
Date: Wed, 26 Jul 2023 12:35:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 5/5] x86: short-circuit certain cpu_has_* when
 x86-64-v{2,3} are in effect
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
In-Reply-To: <10ce72fb-4fb7-67de-41ec-7291dbac0038@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 7566a849-3fc9-4cae-5308-08db8dc3fb61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ifCeFUCnR6lwHLjtHZipaMwiJracc2ZrDpwhR6tR8Wg9cwCsgzPH4BOIuw7zyRT8bcVOOpdyutDgZhb/4eT6+avo0s1jLftAHSI87+gLFbH/qacaEM3LX2uasbTZ0748Y5LHAh3ldFL6q+Dg1JdHCJ6PZVCmQ/leJARFfKlkAm6xgLF+STadqcY6NIyQXMLwr7YQqGyK9veDzUc4s6vC4Cxh15M5+j1AAPR4xstdAVH45wNHSpWiJhUjRrdv+wvD0BrjGh/3KJrYXCQCD40oYANF+O9joxYvj5+K2yxhJTrmajER6eYpMbke8G9m8YrDfLOD0yKA2lbpmKD4AczAZPuxT3QvEkbGr+vbo3+fy6A7kRJuKC7R1xvMiDhSVtFocEWq0P5fc5LkxR727A0wQjXorKrQzJyh2WeBY2gs0vUnOazu1ZpqZT2Mxy478uv/PtankHmQyiz9SMq2T9y1XjatxiVPu4q7yygvBeoUAuQO6bwkYVSnaDtsG0jad5nWN1jAouL8ncmPwVJOSorYmXHB9ZU19nZ0ESFNe1ngUBalKn36A7YcnDgNzwyPYpnxaxc2BCeIGkLSK1iVo1nepejU0Zfgni4wTKRFViNUociq5wDY3xjlrBXNgcf//nsXVGHJen9yatuv9+iVNVkziw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199021)(54906003)(6512007)(6486002)(6666004)(478600001)(66476007)(2616005)(26005)(186003)(6506007)(2906002)(66556008)(6916009)(66946007)(316002)(4326008)(5660300002)(8936002)(8676002)(41300700001)(38100700002)(86362001)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3M2djdiOUo3QnJzTFZUMjhBYVFSdEdtV2VIbDd1eE9VeFZDU2xnWEdEWXR0?=
 =?utf-8?B?a2FLY01kS09yQU5zTDh0SXhtYnJMck9LaVptZkF0WXhxWTdOMlo3V3JTbExY?=
 =?utf-8?B?YzgxZEhoQ3pIUm01ZzQvMWg2b0tzZ0MwNlRXdUtaM29HZ1djaFVlNDQ2ZDZm?=
 =?utf-8?B?M0xWYWNCVXBuMDUxQTZWb0dmOUcxeWdCY1FtTGk4bld5ZXdUL1l6Mml0V09k?=
 =?utf-8?B?ZnR3V2dmQXUxclg2MzhoSWcvK1Q1SEx2RGtURStReU9oeHovNGlJcWwyd0ph?=
 =?utf-8?B?QjRXNnVzWk9VNGJJYmdid1pSZlJQeTBvR3FVYmRZSnJqb0taVjlNZ2VzbmNs?=
 =?utf-8?B?UW1NWXZtTzh3UzRhd3I2YVJrdytGMXg4eEZ0aDlsazVMeWpNVm1yMTlrL1lm?=
 =?utf-8?B?UVBvd2xyMXZTUUgvdkpFZ2NmWnowYnlPNVptTTFXTDFOcmY1dzdCQkZsWFV3?=
 =?utf-8?B?NlRrT2NTVUVpTTIwbVlpdEc4QThURFAwM2ZXVnpuKzErUHZjK0FPaUxPZWw0?=
 =?utf-8?B?QTZwR1JDMWpZZE52cmdIK1ZmS2o5a29mT3JMMFE2enBzOVpKeWlHdFhWNGdr?=
 =?utf-8?B?b3BEM1I2U05Qd0lidDVxQVVLQkFWUG80b1lTd2lhQ3FHZ1FwUDdmNTI2eEhu?=
 =?utf-8?B?Wll0VVVrVWg2c3ZFZklpbmZHd1MvYkZzUk85Y2lVOC9CQmNwU0hwTWw2N3Uy?=
 =?utf-8?B?TjBFaVJwMDI3L21tNFRXdVJSRVJUc09FUm50M3V0TVRWM3UzYkpPZnZPZ2RJ?=
 =?utf-8?B?SG0wUVlwd0JjeTJvaG1aVWZLdjlJUjR5UlVDcUhVLzQ4cmUzV0FIWmZWSHYw?=
 =?utf-8?B?TUFhbEI4ODYxUk5xbXJrY25mZm1ha3NWTUZxUC94ZjlORzVlRkNFZ0hVbGw3?=
 =?utf-8?B?RXhWTm1xaUdOeGxxTytDVXlGUDh5eldwZzc2VDV6Tkd4NTZ0UDZGN081RTJ1?=
 =?utf-8?B?eXR0c0MzODk2ZllLL2NBQS9FK0hXWkNzUzFJYTZ1RktIZklmRWRuOElTN0dX?=
 =?utf-8?B?dzRDQWRuWXk1TTN6VjJMb1c0OWxjeVZxRllCdGhVMno4UGFxaTZFOEtVVWtJ?=
 =?utf-8?B?d0xBSHJBZmsyd1ZCT1VmQkJPNFF2M0t4TnV3QXlsVlFCYUxQcE1VWGNMRmVL?=
 =?utf-8?B?b2dRSms4QkFTN2FpRzdmeUppK0VmVVZNekFPRm1rZm5xYmUzQUdEMXJUUFFJ?=
 =?utf-8?B?MERJa3ZGSGVLcEVMUTJ0WDEzRXdUemd3YkxtazMvZTBDYW1XQUdEZG9pbHR0?=
 =?utf-8?B?T1hwdEJPU1ExRGxoM2NuaFVvbEhQREVTQ211NzFXZHBHUTZCYUxxanJockdn?=
 =?utf-8?B?SVZxQ3NOWkFYVVIzWnUzQWlQaGF1QThPSEp2ZTVyN241VjBkWlk0NkFmQmFo?=
 =?utf-8?B?MkFjVGVVOWMwMDdhTUVLMjZxTURqcTZ6Y1QzdVBGS1MxdGQxdGlmZlJyWERU?=
 =?utf-8?B?b0xSdDhVQU1wWjZ5UVBSbmRxM2NzVThCckdlbHVNcXJUZW1LdXhHRE85MTFF?=
 =?utf-8?B?OFkyVjVwTFZxcWhQYVFJQXJweWNaVFdSazZtTWdIamNtU3M3Y0RZZTErRkJa?=
 =?utf-8?B?aVBxWDQ5ekF6MVcwOEJWQUkvbzQzREFDNFlqOW9CMnR2clZhOVp2YmlVSk8y?=
 =?utf-8?B?VnBYTGpsUnNENjErUjB4NnRmakZaT3FsbXhSVDlOZGtKZ0R4azQ4dmNMRDBU?=
 =?utf-8?B?ZVQ0ck56TklER1dUTkxPS0g4VXMxRG95SjRDTjJjY210OWhwNTVyTHVlbjZX?=
 =?utf-8?B?VWtNUEJvb2NaTHIvWUJUeTgvK0JJZk9qVTB4RFpyUlBBajNXSTBoQzJCYllS?=
 =?utf-8?B?Z3B5QXVBTThwdnd2SWNHMlQ2MEMwZy96T0kvdndjekRoMlFvOXR4V3B3Um15?=
 =?utf-8?B?T3BRZEl2Sm51bXVOSk9jK1dDWFc2UnNaUWtWYTMyeW5mdGhJRzAxekovNWdE?=
 =?utf-8?B?Q0RkZlg5SjVrb0d5QW1jeHE5VFFqMmtZYjdVYWVVRXQybzhZcGk4bHpUV3lh?=
 =?utf-8?B?NXhLNDVIUktMTHRodHJheElkLzY1eUJjcjlZakFXSHBXYjYwTmp2bGNEVWdO?=
 =?utf-8?B?UllLWkFGeUVjOUNNQlQ1RTcvSzhYblNOVzRyWG1BbTJWUWdNTjIxYTFvcktZ?=
 =?utf-8?Q?X+TDxK3YPCCTlKYV/nAwjjPWR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7566a849-3fc9-4cae-5308-08db8dc3fb61
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 10:35:07.9880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FS2i1ATqXtHVRibKZdJw23TtvmgxYh4uNG+nEizuc7zhEwY4dLjrzq+n0j814i1zMUfYa7d8V1L1NvRUD0aJSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9175

Certain fallback code can be made subject to DCE this way. Note that
CX16 has no compiler provided manifest constant, so CONFIG_* are used
there instead. Note also that we don't have cpu_has_movbe nor
cpu_has_lzcnt (aka cpu_has_abm).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course we could use IS_ENABLED(CONFIG_X86_64_V<n>) everywhere, but as
CX16 shows this isn't necessarily better than the #if/#else approach
based on compiler-provided manifest symbols. While not really intended
to be used that way, it looks as if we could also use
IS_ENABLED(__POPCNT__) and alike if we thought this would end up neater
(because of avoiding the #ifdef).

We could go further and also short-circuit SSE*, AVX and alike, which we
don't use outside of the emulator. This then would of course call for
also having a way to select x86-64-v4.
---
v2: Also cover XSAVE.

--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -76,15 +76,25 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
 #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
 #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
-#define cpu_has_cx16            boot_cpu_has(X86_FEATURE_CX16)
+#define cpu_has_cx16            (IS_ENABLED(CONFIG_X86_64_V2) || \
+                                 IS_ENABLED(CONFIG_X86_64_V3) || \
+                                 boot_cpu_has(X86_FEATURE_CX16))
 #define cpu_has_pdcm            boot_cpu_has(X86_FEATURE_PDCM)
 #define cpu_has_pcid            boot_cpu_has(X86_FEATURE_PCID)
 #define cpu_has_sse4_1          boot_cpu_has(X86_FEATURE_SSE4_1)
 #define cpu_has_sse4_2          boot_cpu_has(X86_FEATURE_SSE4_2)
 #define cpu_has_x2apic          boot_cpu_has(X86_FEATURE_X2APIC)
+#ifdef __POPCNT__
+#define cpu_has_popcnt          true
+#else
 #define cpu_has_popcnt          boot_cpu_has(X86_FEATURE_POPCNT)
+#endif
 #define cpu_has_aesni           boot_cpu_has(X86_FEATURE_AESNI)
+#ifdef __XSAVE__
+#define cpu_has_xsave           true
+#else
 #define cpu_has_xsave           boot_cpu_has(X86_FEATURE_XSAVE)
+#endif
 #define cpu_has_avx             boot_cpu_has(X86_FEATURE_AVX)
 #define cpu_has_f16c            boot_cpu_has(X86_FEATURE_F16C)
 #define cpu_has_rdrand          boot_cpu_has(X86_FEATURE_RDRAND)
@@ -114,11 +124,19 @@ static inline bool boot_cpu_has(unsigned
 #define cpu_has_xsaves          boot_cpu_has(X86_FEATURE_XSAVES)
 
 /* CPUID level 0x00000007:0.ebx */
+#ifdef __BMI__
+#define cpu_has_bmi1            true
+#else
 #define cpu_has_bmi1            boot_cpu_has(X86_FEATURE_BMI1)
+#endif
 #define cpu_has_hle             boot_cpu_has(X86_FEATURE_HLE)
 #define cpu_has_avx2            boot_cpu_has(X86_FEATURE_AVX2)
 #define cpu_has_smep            boot_cpu_has(X86_FEATURE_SMEP)
+#ifdef __BMI2__
+#define cpu_has_bmi2            true
+#else
 #define cpu_has_bmi2            boot_cpu_has(X86_FEATURE_BMI2)
+#endif
 #define cpu_has_invpcid         boot_cpu_has(X86_FEATURE_INVPCID)
 #define cpu_has_rtm             boot_cpu_has(X86_FEATURE_RTM)
 #define cpu_has_pqe             boot_cpu_has(X86_FEATURE_PQE)


