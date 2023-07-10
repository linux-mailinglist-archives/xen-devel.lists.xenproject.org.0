Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9951774D0AE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:56:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561116.877453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImgj-0000Lh-Rw; Mon, 10 Jul 2023 08:56:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561116.877453; Mon, 10 Jul 2023 08:56:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImgj-0000Ja-Oz; Mon, 10 Jul 2023 08:56:09 +0000
Received: by outflank-mailman (input) for mailman id 561116;
 Mon, 10 Jul 2023 08:56:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qImgi-000090-9D
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:56:08 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b9c966c-1eff-11ee-b239-6b7b168915f2;
 Mon, 10 Jul 2023 10:56:07 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8255.eurprd04.prod.outlook.com (2603:10a6:102:1ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:56:05 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 08:56:05 +0000
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
X-Inumbo-ID: 9b9c966c-1eff-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lu0A/DS2UuzAyO2gdshBxW9ulJ+lmqn+PP7QeW/O0+GICA6KebbCL4u2LhgihvjaJl3u0UDVtUeD0JOcHp6WbC3Esd54xz3Ws0xnFbn+Z8hW7NGg+fOuEIVxvrEtzcSSTteAmLxgMbEKGF6x70XLp09yRbf39XN1wuWSfuTohXG0eA82WVrv32tyyBaKIufWvZvtoL040oAiOviYGe5yHpi47zN2XA/xmc+6PY+VobHXMKtEw1fyFNYpuQ5+Y25ba3fs8644zeS7s+jtg0bUTHo+gA1pXRNGVA2zb9S97Z1O8rmC7bnBYptbETcbNUFjo/SmNTVhf6B6nQOsYkXWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7i9WRYxlNMflX/ncFgxWicqWWe8SycnajyCIM9YTRY=;
 b=BMikcid4xc6P45j3l2dXGtWiB9vl36OKquvs9ULvJx/pGgmgHukhSXgAKfkx9HHehIBMy56lczKEw7MgYzLk6C4wXk7JZMlNmtB4zh6N/I8KvocLSzdZYZx0aLfM+hzM78LTDclo6MyiT7rkdIVCkTg0VK2OLEcDR8rl1Dt088ksimwJ4rvjz2bb74vXIizgBjTz/ka3HigS2KeBzKoieTcJ3p4BOwLAgY1l7YHcZsJa4KPYfdM44annuWu2fikeuesH4CaRBr30OfgBj/F5nrTLmhrSVPSSW+mKqtnP2akcu2IMPpzWJKr/rQ/ztmhVcWPzhmBOum51gX0kRD7dog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7i9WRYxlNMflX/ncFgxWicqWWe8SycnajyCIM9YTRY=;
 b=xtYT4B+bfFN9JQrd7+S3seghRxOP/R01o1oclF//cslzEaj5aGW7hFOYWW8Q7jHGRUNhgR0rFE30IDF+Otqg080PJAcZwR7Cqh3TR3aSLWGkvJZM3jqEnCwuAAGCkdKRxuWcm86nRF7LecAfU1uVApfmW1l1xvMTwZtl+QUzZZp4wPPoWF2qyxCiE/n8BHTjt+rqrRw5b0SZltIyanNa12biotmSBGFkBrUYSRvCBaDTBqDSUmxLC5KS0U3CzYjZWr4uZo+DT0mhgF0FOtx3TSUmxaGKbwsnYmcgpsqnquJAohBLjW3hMbxVPDHOqbyOwORY8RzWOIB6YA6+BIx2xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <959bdb6d-9b6c-cde0-9459-c83cd3f58b18@suse.com>
Date: Mon, 10 Jul 2023 10:56:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 6/8] RISC-V: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
In-Reply-To: <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c50e6d3-b4d1-4f23-05b1-08db81237e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mELQuRq6AIoL0lK2AYNEJd09J7mfWNrkvpET1TlNP7J9IwUAL1L012SCb0UnHfRbIRlFQPkgWtJaMiU+U1ooSbVgZshJaiMrhqA13HT2OYdADn75P7rZ1nNNPa2jU72xm1M/g2ZH5N2/BQ0NjgHLvOUTpWIixnwQVfXTXbJTFV4F50nPh9HzHPOeLXJCYtI2uYW99cKGbHN0g6kDOCvFnuDkSDexTg6DmuWEGUEVztlYZsgx8Kgj5UuHj+2D+QzDYZnz6IeRFx271in4AfIbOTdqV1iSwx6tEN5O02m7bgxKsjRPAUxY4WSAlnaRKCtT1Oy4/+0nA9XV9v+CDw+lpoxyK8GclWjrJRA3xJOz/EmI4sgwEBhkP8pX4rMCV7R6nwx+uYGj4X7VJlz8oQOeA4s8tDfIpcW92MVatsGJ0SCzv6/tUgoV1dLirIddA4T/eqcSTUdo+Jd44wqHlAHD9yI6VdAmfCNAFLFtbdo0Veou87Mj+vMaex+o+pDyYPB/zboIfID6BxhJU7aELPDtYOLJ5mEU0D8/Cr0srrA0XuDy80FTtKxfcHSMMPr6RejwjsiXS4kg/sR9Z3yGb+aKF01ftBjtapaVpPdGnhNhoBHjNpUKVga2Ul5Pm2hN8cTIyOIngHxZJachYQCsX8hwkQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(186003)(26005)(6506007)(2616005)(6512007)(83380400001)(41300700001)(4326008)(6916009)(2906002)(66556008)(316002)(5660300002)(66476007)(8676002)(8936002)(478600001)(66946007)(6486002)(54906003)(36756003)(38100700002)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SE5VdGtWb1ViN0NVbVZkckR3RmxHUkx4M0JzTGZYRVJhNGgyZHY4QjN6K2RX?=
 =?utf-8?B?TUtBZUVpSHRyaUpCVXdQZ2lrSDNwRkoxZHBGVThJRzRDMHdoRU9hZGFvSWFV?=
 =?utf-8?B?OHNETGdlTDAyR0lIcXBZYUpUOUhHVk5PNUhaVE1aZC9xR2w1WElIeFBVMnND?=
 =?utf-8?B?WWtjTjlpWU5rd2E3QWJWNFlOUmZLUys1TDRWMFcwc3NqdEZSZmc0OXpVZDN4?=
 =?utf-8?B?ZXh0WEQ2U3gwcm56QUFNOEQzVzFRQnpLUTVkaElWWW1XYlhLVXkyeWlTV1cy?=
 =?utf-8?B?UUNnOXZxVG9kYi9uQXdvaVdQV0R2ZkJ6TFBjalcxS3pHQnJ6ck50TDVwL3JQ?=
 =?utf-8?B?blNweGFKRGtpUWZsUFlodDUxS09NWGxHaEFBNzB4dEE1UHEvdU5NVHpzK3p6?=
 =?utf-8?B?NUdBaUVkTVVhemRDRjFCU1N3WDNZUXBvVDdad0hPdVF0bGlHQ0lQb3I4QWw1?=
 =?utf-8?B?MFVVaGVwaGZacTZUc2RRYlRqVlRFb3A4SGpJU1VVWGdUbmxWQUtqUGZnUjY4?=
 =?utf-8?B?ZGtadHBxMlBGS2lEc29xNDluUDRhazEvZmJya3c1aHc2Y2xPNWhCYjdUVVBp?=
 =?utf-8?B?QUw2clFWUWhPQ01HcVBxc0llK2UzdlNSM0I3c2QrZVI5QU5RcFZkV2xqaTh4?=
 =?utf-8?B?SXE1eFNrUThUTWYvRDh4UjZoK1NJSFdJTTRpaVJ1R2E5bUozVUU5R3kvd2U4?=
 =?utf-8?B?UlNPclVPOGVxRXQzZVBpVlN0emQxUWZKNjdPN0RtLzVKSURqS09JOFpLWmwv?=
 =?utf-8?B?OUxvQzdaajFPK2drZzZERWpma09XZUR1TXFUelQ1S3Z6RFRiSzA1Y2dRcXpN?=
 =?utf-8?B?OTBqUENvOHhKYktubE5wMzgzZ2pTM2lpZFQrMzFOZEtEbjFwNlpOYTNsK28w?=
 =?utf-8?B?TVRrbW4rSnh0MlJqcXpCMUtMcHlKRE5PMHFjN2xwdXo3QzlhbnIvNUxEN1Zv?=
 =?utf-8?B?S1VMSnIvaEhoNjYrOFdYL2dRMG1WQmUrMkhpMGQyKzgyeWZ6SWxrN0VjOGRq?=
 =?utf-8?B?N3VCUVEzZVpKRzZFUGl6ZEYrOVhIQVgxL1JPTnVMNnY4NGRTeHFEL0R3SHZ2?=
 =?utf-8?B?RkhybGxZemsrVFZSUHFML3V1dXBiSW1PQUhjSE5sblpmWHNNWHd0N1pXc2ZY?=
 =?utf-8?B?T3FMdkZTMWJpL3krdUxiZ2FDQ1p4NktjVE85cERiMjZCM20xL2tzMTZBTDV2?=
 =?utf-8?B?cDNjVFZnRjVDZ2dJdG9xOXplRXRmajhLcHNidC9jaDdaR2NWeWtYYzAzTUV1?=
 =?utf-8?B?NmJwc1creDhGUmFobEZBSVlJVXFFTDNCN3BUWkJEZENJOUJQaE45NmRCcHhP?=
 =?utf-8?B?NlJVY1BZOEhtbnI5Q2tsR0toSmZoM2RhWmZabEhqNlV4TUFJRkF2dW92d0d5?=
 =?utf-8?B?d29XVWcvcTlqWWR1eHFzMjRpbFJ2RllaTS9reEkzMUhwOHJZcklCNU1laElC?=
 =?utf-8?B?TU9ENzVCK1VOa3FWdFpiRVFzWkVyWnpmYWNkUndKMmVjdGJISmpuU1AvTDlI?=
 =?utf-8?B?M09kdjZ4aTBlT0lKWkp1R1VzVUN4UDM3cjZIcUtmYUI5Z2VRc1lsaXdJS01m?=
 =?utf-8?B?a204TjI4cWpib2FMWDgybjBGK3ZoalBxY1llWEVpZW9ZYWVPMHNnbEF4ZFVK?=
 =?utf-8?B?TXBLdjA4VHFPTEh2VmdEMytKdWQva2NObmdOaFJGTXZwZTdHQ0lMa3RnRmc0?=
 =?utf-8?B?b29mV0lBaXdOSlZTVG5XL3M1RFV2V3hxaHRpZjdGbWRuWXhlU2lmN2F3NzlU?=
 =?utf-8?B?RFpkbDFXWDVaSkY2RHFrRjYvY09aTGJDMDhSUHNySWROZ3FhMUp0dGNma0c1?=
 =?utf-8?B?Q2dtN3ZUMy84bGNNSnVXWGpaZDhKZ001b0RPQ2lNbHhzQWZwdVIyRWFKWUlH?=
 =?utf-8?B?dlQyU2hvMnRQRXdXSFVWUTFZaTNWbGZQY3ZzVVdHUVMwNVlSRmNLY0t5Z0xk?=
 =?utf-8?B?Rm9xZ0xvbU52dm42RytJaEprT0swT01GZkViZVlZMWgrTGxybkdUeGlwSmxY?=
 =?utf-8?B?SDNYeHljcXJFZk1Sb0NLRVJhNmYvWDN0VjREMGROMGdHbytyY3ZMK3JhVm1u?=
 =?utf-8?B?OEcvKzQzRU9Ud2xtYkdUcVFHL0NyU2RKWEdVUHJiUk5BZjI5aWhCM3M3bmla?=
 =?utf-8?Q?fT4yQox7lDqEv8UNxxjsDBMCI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c50e6d3-b4d1-4f23-05b1-08db81237e8d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:56:05.0735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDV9hGOBbjs+pxBkgaKQ815Ahe4uZvjC2MrjQjZhN6gaw323Vn9PZ41ZpyeTz/P3XhPxMW2aZHs2OnrCZpPOEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8255

Use the generic framework in xen/linkage.h. No change in generated code
except of course the converted symbols change to be hidden ones and gain
a valid size.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Probably count_args_exp() should move to macros.h, but I first wanted to
see whether anyone can suggest any better approach for checking whether
a defined macro expands to nothing.
---
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
@@ -67,12 +67,8 @@
 
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
 


