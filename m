Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 027E376FA1C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 08:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576878.903522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoKC-0004YO-9p; Fri, 04 Aug 2023 06:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576878.903522; Fri, 04 Aug 2023 06:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRoKC-0004Vx-6k; Fri, 04 Aug 2023 06:30:12 +0000
Received: by outflank-mailman (input) for mailman id 576878;
 Fri, 04 Aug 2023 06:30:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VoTD=DV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRoKB-0004V1-An
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 06:30:11 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5beb0a1e-3290-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 08:30:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7549.eurprd04.prod.outlook.com (2603:10a6:102:e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Fri, 4 Aug
 2023 06:29:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 06:29:40 +0000
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
X-Inumbo-ID: 5beb0a1e-3290-11ee-b26a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzcTy7tsLGD4M3lihdyD+9F1mHuoPohJar9VPN5V/2LM8NbbJpyEcu/uCegT3N5fLhs86jh32V0AmT7haB4QzjlQRGAH/FGGdVqs3pajuPHC28/4uW7nOKsP19TyPy8Noh2gY/qvzowL/uSDyzGEOpJx9ZdWUpKodfBmZV5SZKMY0PUqPBO6qec8OGcMRBHZ7rMipYNnuDWAvqlwLU4bnkYeObPkPIcayOGivbbDJmKnMnkZw2mkta4O8VB9qJkspnGJkoXtCk8VV7VYu1hFK6E+XKq9l86VLfLpumYcjse4L4Rq4A10ufaZev5sq0h9zGE3ZiZmOIkCInrtWOoBtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qika2Hq3tzyX7MA+htBUWEOe4yA4IGhKPbZp6tX/5Qo=;
 b=oL5ZjMAkjJouQSAwpTKfuoSgf8uU7/JVTVqRBYs2eZJy0kv8cP4vFJOXubXbPARGScxL8KnJCBvVNt46gfeh77tYXqA2eORZU4eLwi16jhVa72GG+nl6Avrqx70WOoS0Er48jd18F1MxXRTwzelT9JgkshhcSXfeeom4/4sALZhKlaFyqRcFqmVEWKkpqTBcQdVn5Wcb+2gGluo1/RDShphVHRSMypymGakWz9NqlJChqq5qpR9MBQVg9Ychik3VE1gMG39bAnFX5f4u/nAGgy3l+2QjiuICqcRaP85n25OI3Wll+55g5U+2yTnRP0/4QhLPUrG/0LdmxZBY+d6sPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qika2Hq3tzyX7MA+htBUWEOe4yA4IGhKPbZp6tX/5Qo=;
 b=nh/OP7khS+yhDOGdULDaL7vlZ3PmoKCMyOyipKF6UC6Z2/ox8Zsfyit9gLnOiVU016yDSvJ3gcr5JWTj4Rt7uxhoztnhIxoQRTHdj3ozhBmVEd/Ff0hP/mR2Kg5n4UMRTjShUBo51vISPh8aYrMxbG97KYYyW276Oi39qyeK1+WHsZZ+sUj4EA+I3qGD6zOT1w4xhIx+jyP3wh7zu0z/HPsL2oISTsiKp95e69/SQcdOQwErNxAqRjUjEjutU5dzN3gepCW6IKS8nkr2OVeAyPVW7CFBbToeDhiydGAaCeIweR8sRrGJSoiaZoDNM2hfwOv60mj6eK8PXmfUTp9tMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5caf1f7c-c4ba-9913-dd77-21562af18efe@suse.com>
Date: Fri, 4 Aug 2023 08:29:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: [PATCH v4 5/8] RISC-V: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
In-Reply-To: <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 560464bb-e74c-449d-22a9-08db94b42ee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BlSoTblrw6r7jiz/lHqs5X9CN5YvIDUiMHaka4C4sN1UxsDU2rl+TEeG8tArxA+HDzvFALcx2GrbbdcUKE42phlu2RScVOYlWdDX44tjU21xPOF4P5DL+lh02zKb1bgif8oWAMnxaSik5iWb+mytfrS9ts/Iiz4CGr9i9h8q1m3VIVtDQxTVxLx9UeVGEUP4Hz1ND6rkdICFpieWxqPMc6R8kJE2VnJXFYDILJyRiIjKRZ3sdMktJffmiB9aDUm07EuQ3TO2I5wlilIw+AMhRYFPxn+01+TmAwmo3NDbI3buABP0MHo3Q91rsOewB8dtU2wdm1GcDpqTewtAnB1t12eLiNFNHGRiXJJnLR5MXWQnwzFebt7p6VsCvgmN9PZH3sXRkjHqirvE2q449nO+KQQhLstjNSlQzR2EQMpguBD1kXcSMMnI0OOcs5at+2ZsF7bkWqBKG1yj9BrMcQu1DWD4V75gLOQLmiTMWewxKKTyfaWhHwpqSPP4RxjJyTQoOg5LRkatAcXMa8qdvwT6sHsZJ9sBwYY2MYXLtwBIwW27pCfvUne1+r7fcXmFtJm3gLCOqzqIOLjFU3pvNSicZu301MjDurK6zCQougGBY8Tq28L/yE05WvBndwDJck3p8R2cM/zNta5h23GMyB95lg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(366004)(39860400002)(376002)(346002)(451199021)(1800799003)(186006)(4326008)(6916009)(316002)(2616005)(66946007)(66476007)(66556008)(5660300002)(26005)(41300700001)(6506007)(8676002)(8936002)(31696002)(54906003)(6512007)(6486002)(478600001)(31686004)(38100700002)(2906002)(86362001)(36756003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm0way85TWNBN3J3YTlUN3Y4NkRhWVVMN3k5bzBvNGVkUUtXaklIWUdlWjY3?=
 =?utf-8?B?UVdQNmtkUWo1a05Wemw3K3VHeVVzL08xQXkrVlVLaUJVbEdZTEtJWVhCSEd0?=
 =?utf-8?B?dGI4eWZDSm5tTjBFcGpYQ1ZUNTdHRG4rYWh4RWpoL2Q2RDFJRXlCc1FqTHZY?=
 =?utf-8?B?bUI0VjZvVWkyWTZQVzBuK0xuL2NyWU5NVTVXZHhhRVpPdllUZy9vakhjZ2E0?=
 =?utf-8?B?ZDdpK0RjOVNNcmtRQ0ZDYi9mNnl3eG40ZGh6WW5vTnQvZVJVZ2xQR3JSc1BM?=
 =?utf-8?B?dWlJTUpPZmJTNlhvMDIzczg2YUJCSldKTTV6VzZrMFNzaXVKT2pPWUZoUWxj?=
 =?utf-8?B?eU9BYjZLNHNKTzFKZEg2Q2tjK1ZvbWFzRmxyWHZkSHJzVzgvM0ZlSFY3aENU?=
 =?utf-8?B?YUhZV1ZwaXZGUWYyTE1pSE4yMHppY3I5WUhnc1cxVk5iSEZJellZOEM1ZERK?=
 =?utf-8?B?ZjlwVVhHajRCMjdybWFuc3ZQQWFBREVEb3dvL1plb2VJd1g2cVBoTUZQTjNk?=
 =?utf-8?B?UnJPNExtVmR6Z3JDVGNoTGxUV3hqT081ZmtUSWlzWUorV3dKVHlOYnJhN0pF?=
 =?utf-8?B?Q2MrZmNyaUllYUdJeHRvVExuYnJORkZ3TWRtdGFpTXM4OXd6VW9MbGJDaEVF?=
 =?utf-8?B?Q3BOd3pRZy9NbG1JVDk3YVhzMHJPUHNQZFRBTFRKcWFzRU8rekhyTzVGRmdh?=
 =?utf-8?B?RExocVBSTlZpUzRFM0VNazFXYlVYUXovTlczRGlielpkOGdzRjlYNGdBS3BG?=
 =?utf-8?B?Uzl2RUZMcGJRUnYzRVFaT3lsZXliZm9kNDRjMWdZZjlpZFZFWjh0NENnWm9j?=
 =?utf-8?B?anJaSlRLWTMrb3k2VnVOUkZUYnNaMWR6amdKQ0hMbEJyYkk3dzc3UkdIeXAv?=
 =?utf-8?B?Rkp4SDV0cmg5NkxjbVBhU2JQVkR2WGkrSjFnaWJHQ3FBRHQ0cWg4dnVFMUox?=
 =?utf-8?B?Q2tqS05QOUFsMXp5TnFGTXh2bDlUK0NVY2NZdUF3REFrcDNKd2wvbHp5akNL?=
 =?utf-8?B?OUZhbTRwc1BSQlNhUVRDREljRzdlcDFtMkFzSUhuaU1ud2ZyK0VMM1N4ejM3?=
 =?utf-8?B?RzZjbjNqamRmemswUzArOTZONkhNNGl4Tk9lVFNhRm9oSVdoeEJUeStFM3dC?=
 =?utf-8?B?UURLeExYMllQT1pyQVBHMUU3dnJsWlI5ejh1NFQrWGNQcXVTNVgwSzVpcmF0?=
 =?utf-8?B?dWRqYnFFd25LS1UrQVJhN2x3Qm15ZWlZdjRGZ2hycUZtL1labTRCZ0QrbG5v?=
 =?utf-8?B?MXdFZTExeUVzWUxGckMwclNqR1A5OFJ1R01Sc1BiZGtQQUJyTUZzaFp3YW1a?=
 =?utf-8?B?bDNXa2xDQ2h4WkxrNGxmTkFtekw3ZHVReUJNdVZDNUZTSGRoKzZxeE83ODhx?=
 =?utf-8?B?N21wVWpyY1hneXUzME9NemEvbnp6bHA1T2hzT24rbm5zOWlwMzg0ZWFSRngv?=
 =?utf-8?B?QlNjL1dtTlk3MkVZVUlZemNiUklzUDdScDBob1d0MWhCNmI5aXdCU1RmWThE?=
 =?utf-8?B?ZENKR1lGMkprMkJId1ZPSHl4ZUxWR2VkaVJEVjZuRjNvenQyM0g0d3lXa3Bq?=
 =?utf-8?B?ZmJxU2FuckkyTWF4Z0dIaEhUMkRsRUN0VGUvbERpRFhVdWhRenJkOWRsSEtj?=
 =?utf-8?B?NnNoa3B1MzQxNkhGS2JhWnNWTzhPZkQ4aVRMNllxclAwYmErc0RkNWhzQ0R1?=
 =?utf-8?B?VGh4Y3VMVm8wZC9LUFZxQ2dLbXpRNHMvRFh5TkFDeEpzN01KdjNPM1FEV2ZM?=
 =?utf-8?B?QXd5NEJOSVQ4VjhwMEkydHZXQWs1MW5Mdk5vVkVDbFNhZVZvTE02amVjMUJC?=
 =?utf-8?B?dmM0MUYvV0JXdWgwN1NiVmhuRHpKaFRBdHVLTks0Y085WmpRbmtoTGpCKzJw?=
 =?utf-8?B?T1hkaStJMDVNQkl0ZmJBYUdXR1JzdFZTMit0SW1YdFZHSWlrbHdVSTFicnhX?=
 =?utf-8?B?TWNiaXdHVHA1Y2RwYnNWdUphakIwYVNZaEZmdFFJQWxZQnJjb1NhRDJSMzVH?=
 =?utf-8?B?TU1nMk5jK2N1Y2xZY29FSEdWSDIxT0QzaXBGQU52UWp2OGpNN1c0L3RmRGw2?=
 =?utf-8?B?MnliNng2Nk1VekhqMlV0OFlweG9zNDArenZmWUNRcDRBVmVHQUNyOXVkSGdW?=
 =?utf-8?Q?DNjAFxFdFJWnppqFnaE4yFC2P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560464bb-e74c-449d-22a9-08db94b42ee2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 06:29:40.5791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Uczd0JvQQxsZLgVGAJ7veb/9LjLBAtiAqHYaKhecsMGQo0X7lPlnW0r250y4GKDNaDT48svG6bjSrvC1/8p8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7549

Use the generic framework in xen/linkage.h. No change in generated code
except of course the converted symbols change to be hidden ones and gain
a valid size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Probably count_args_exp() should move to macros.h, but I first wanted to
see whether anyone can suggest any better approach for checking whether
a defined macro expands to nothing.
---
v4: Also drop #undef-s from linker script.
v3: New.

--- a/xen/arch/riscv/entry.S
+++ b/xen/arch/riscv/entry.S
@@ -5,7 +5,7 @@
 #include <asm/traps.h>
 
 /* WIP: only works while interrupting Xen context */
-ENTRY(handle_trap)
+FUNC(handle_trap)
 
     /* Exceptions from xen */
 save_to_stack:
@@ -92,3 +92,4 @@ restore_registers:
         REG_L   sp, CPU_USER_REGS_SP(sp)
 
         sret
+END(handle_trap)
--- a/xen/arch/riscv/include/asm/asm.h
+++ b/xen/arch/riscv/include/asm/asm.h
@@ -7,6 +7,7 @@
 #define _ASM_RISCV_ASM_H
 
 #ifdef __ASSEMBLY__
+#include <xen/linkage.h>
 #define __ASM_STR(x)	x
 #else
 #define __ASM_STR(x)	#x
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -69,12 +69,8 @@
 
 /* Linkage for RISCV */
 #ifdef __ASSEMBLY__
-#define ALIGN .align 4
-
-#define ENTRY(name)                                \
-  .globl name;                                     \
-  ALIGN;                                           \
-  name:
+#define CODE_ALIGN 16
+#define CODE_FILL /* empty */
 #endif
 
 #ifdef CONFIG_RISCV_64
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -8,7 +8,7 @@
          *   a0 -> hart_id ( bootcpu_id )
          *   a1 -> dtb_base 
          */
-ENTRY(start)
+FUNC(start)
         /* Mask all interrupts */
         csrw    CSR_SIE, zero
 
@@ -30,13 +30,14 @@ ENTRY(start)
         jal     reset_stack
 
         tail    start_xen
+END(start)
 
         .section .text, "ax", %progbits
 
-ENTRY(reset_stack)
+FUNC(reset_stack)
         la      sp, cpu0_boot_stack
         li      t0, STACK_SIZE
         add     sp, sp, t0
 
         ret
-
+END(reset_stack)
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -1,9 +1,6 @@
 #include <xen/lib.h>
 #include <xen/xen.lds.h>
 
-#undef ENTRY
-#undef ALIGN
-
 OUTPUT_ARCH(riscv)
 ENTRY(start)
 
--- a/xen/include/xen/linkage.h
+++ b/xen/include/xen/linkage.h
@@ -37,17 +37,28 @@
 
 #define END(name) .size name, . - name
 
+/*
+ * CODE_FILL in particular may need to expand to nothing (e.g. for RISC-V), in
+ * which case we also need to get rid of the comma in the .balign directive.
+ */
+#define count_args_exp(args...) count_args(args)
+#if count_args_exp(CODE_FILL)
+# define DO_CODE_ALIGN(algn...) LASTARG(CODE_ALIGN, ## algn), CODE_FILL
+#else
+# define DO_CODE_ALIGN(algn...) LASTARG(CODE_ALIGN, ## algn)
+#endif
+
 #define FUNC(name, algn...) \
-        SYM(name, FUNC, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
+        SYM(name, FUNC, GLOBAL, DO_CODE_ALIGN(algn))
 #define LABEL(name, algn...) \
-        SYM(name, NONE, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
+        SYM(name, NONE, GLOBAL, DO_CODE_ALIGN(algn))
 #define DATA(name, algn...) \
         SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## algn), DATA_FILL)
 
 #define FUNC_LOCAL(name, algn...) \
-        SYM(name, FUNC, LOCAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
+        SYM(name, FUNC, LOCAL, DO_CODE_ALIGN(algn))
 #define LABEL_LOCAL(name, algn...) \
-        SYM(name, NONE, LOCAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
+        SYM(name, NONE, LOCAL, DO_CODE_ALIGN(algn))
 #define DATA_LOCAL(name, algn...) \
         SYM(name, DATA, LOCAL, LASTARG(DATA_ALIGN, ## algn), DATA_FILL)
 


