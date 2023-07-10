Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9856D74D0AA
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 10:55:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561112.877444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImg3-0008EJ-Ji; Mon, 10 Jul 2023 08:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561112.877444; Mon, 10 Jul 2023 08:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qImg3-0008Bv-GX; Mon, 10 Jul 2023 08:55:27 +0000
Received: by outflank-mailman (input) for mailman id 561112;
 Mon, 10 Jul 2023 08:55:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qImg2-000866-Js
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 08:55:26 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8215b0f2-1eff-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 10:55:24 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by DU2PR04MB9051.eurprd04.prod.outlook.com (2603:10a6:10:2e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 08:55:23 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 08:55:22 +0000
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
X-Inumbo-ID: 8215b0f2-1eff-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cddsQu99PE3DyMrHn0ulLf8nGqW6C09RoivrLbVe0a3Y1NDs/j62GYLBotRUInhy8I5ZMHEYIJfAqdElpiMOEvMV7sPZojUTshZooJavtkaDMvHulAzj43MmgDgPydfswynY56K96/bqzJ+tqFeDG7SZJE4hhRA/OQ98yWtscue4jEmyM0j70sBRiy5fVXLnyEaIXZCyx8vRKEJKR5vFh7Yd5MSIt8oJSJdsyG9BkGCHzeUpR6FxzaLdPMCYSx3icNuIiWGPCFf3uTPT3rsmjuOJpJuN8IBQEyVw+mFv36CCXMkss59bAHKE3aNhmSfonW2g2SYyJ2zAuQ/gMUR0BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bblEvpBVoD14a8jtWBS2FnTxPcXC/Rz9Fz+d/NPUWJs=;
 b=LTPsxPpR2Wh6a90cPeFLRoDTVuxYoOuT/Wym1HcURMoF7Qcj8eMNogKFbZvRELbAyi2So+5vgRTxEnjQzvttUSaXm/ErPNDcS0y6BU1gERzl8Mp0Rx8rdgrY9TDHTjZLmy378o7XFrmjOZKKJr0BvemgtdHy4bEn8evQjUISFaUA7bvEw6kVF/10k2EUx8f/JsG/0+LIJqqr2qQcqOu3AkKUFVVTf5GpGAkXQWJ7c3Zoc2/MLpHuzo2B3YWil3OW3QDf0Ml2XxobevDgP0uuWcrvG6Ur1TRIdkQnarhO/wCtc+G2G+jqL1nldC0DpLQB4fc/SUj/3VK9waCzDxhNEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bblEvpBVoD14a8jtWBS2FnTxPcXC/Rz9Fz+d/NPUWJs=;
 b=orM39li9zOSpCCIiK+vrjYXWgWtdt7bMkxewQ9LCbykRS0zauZYq2boFhhOyusSrP2vmdlWDBbfnp1HR5iatBESiDPp10EEvd0GkY9O2vQpGn/xAOw7ipDahglc7nDiX96CTBVfcPtuwVWr8JHmPZpHM9hjmZNtJzqWjEYuOHhAtxdkEczYncZu8JQQ0/RHxxf4nRF+1Y1IBH2raAmfVQiTstLGYzeVjlbrZwq6pD1Ny9RkWnpSVnUtvxFUnXlMvIzx3M8dDLg1tXWq9WT1smOZGeTJdQsjxFftQWW2iSxJ4YUG4BZa/jSVrqG5n2HXS7mSXqp5zldC61qXobvd0dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <36977cd0-37ae-d164-1a69-cf2161d08c4c@suse.com>
Date: Mon, 10 Jul 2023 10:55:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: [PATCH v3 5/8] Arm: annotate entry points with type and size
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
In-Reply-To: <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0068.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::13) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|DU2PR04MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f072aff-1c96-4237-c120-08db81236561
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rZyX7Wq8xgWGvDtI4nZ4wSMVMZVKYXPBnV3M9vcQHjHzQms+5FYeX6KmK7IJExbWUkNjtfqgkJdxleZ3rRg5ipQCbg+kXN8/H2/zboN1n5g6dFLkK4kHcOxYZWqXCFugSWgpT9vKnQOX57Q2H+wf73h2sWGQKVTfRDK6tjYqevhgQgadWcx0mg86YPLlUoufiSWQHgJYKhS7qQN67ECDJcIR2ny+tJZsQig4PxVlCNbAqKVGQH2T0zTwCMmFFM8Q2tuwFU/Y2IdD0ueQYGwTwuRDXL3ujzP+jEgatk1WrIu2+zaJX9eqDLUQaRQLQbm4Umj7YJQ1vDuvZfE9xV6mV++8yHdF1WLHqi1k/eH1fHdBIemNIctqiFuaL0QDFzU/hjBQqP9BcbFAjfbE6XKsEAoofEAwMmWgfUkg4VkWJ8XeWSl48Ng0vEPSnS9vK7wZ9KnkStlX/qh4Y1SyqFW5XmMc+0/affrsSP4CKbQh+iaVQvaesH4hKQc45C2h9RH+jnDyjbEuZRCsq5jXGw+OZplwg8t3wOM3WhIy1hWhQdLN8bQ9W9oo4gayT8DG8as2JjypdcJ9t+2Im8RMHLmciAlmTkbnsDPaFN9VoaDfm6jlitlPL/6nG82ls8RB2aLkhrSwY7+1cMD3mEgezSGU5g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(376002)(136003)(346002)(396003)(366004)(451199021)(186003)(26005)(6506007)(2616005)(6512007)(41300700001)(4326008)(6916009)(2906002)(66556008)(316002)(5660300002)(66476007)(8676002)(8936002)(478600001)(66946007)(6486002)(54906003)(36756003)(38100700002)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUQzcGNjay9wSGR1aW4reStUdFNvRThqOC8yK0l5V21PRjN6b1pOMUN2bTZm?=
 =?utf-8?B?SzZFeWlNVVVlVW1scC84UU1rcTNBZHlaYWk4VWxlNU5GWElLdGljblUwUGNl?=
 =?utf-8?B?L29kblg0L1RwOGVXWmJMc0RrY3k5Mm9rWlFQL3RhaklPQ3VBRFJSRWkrWFho?=
 =?utf-8?B?dnY4TWVKN3Q5RklRTjQ2Qi9MeXF6Ri94eDFZSlZ3RzRrYnRTWkZoS3hHaE1R?=
 =?utf-8?B?T0NiWnAyRkRoSlFJRmNuaUxXbUN4eTYzUlo4eGdIMFRWWmhQWmcyRHBiN3Yv?=
 =?utf-8?B?dUdac3FFQ0Z5aFdHQkxKRlVRYlN5RHhubFdJeDlEVFl4cDcxS0orRTBIT1Y3?=
 =?utf-8?B?cGswN1JKMjc2Kyt2RXpxN041MlJnYWhTOE9Vc1NrRXhuaEJaVUU3U2ZMWkpR?=
 =?utf-8?B?Ujk3TkIreTdwL3M0dlpTVUpiMEozbXh0TE5WRUd1MUNmL2R5ZTBCWFRJbElt?=
 =?utf-8?B?bGx0THRYK1NNZCtrQWtUbnlCemRZOFhZWDkrWlIzaVJSTEc5b0ZCZTU2bkYr?=
 =?utf-8?B?blVsOVQvcGhrMTY0ekk5cWRlblRnV0tobyt2STgzMlFmM1A5eEtiK0QrRnBY?=
 =?utf-8?B?MWNzMDlwZmRuSkpoMm01ZktiWlZHK29qZ3RCNkRmdm9DaFQ4QU5IN0ExU20y?=
 =?utf-8?B?Z0JhdkEzczNCbXRZOFVMOUZHaE5FcEVZOFovUXRxYmNMQ3QxZmIyQjVSZ25X?=
 =?utf-8?B?ODJNTnkraVJ5ODg2TGhPNHRsUnJvOXo1OUJrdXFZZFltR09YSkNxWUQvaFha?=
 =?utf-8?B?WWUwZkFlQ3VOTXdFdEVUdVg4L3FpR2pHWkJLdTFxc3ZzR1lqSXcxdktQRHI2?=
 =?utf-8?B?U3RrMDJHLzR3QmI1N0hPcjQ3cERtUkNYWXdwbUs1NGVtZnpCdjA5S3pZRE9r?=
 =?utf-8?B?ZHhtN0lLUEpnbDgrNGdpN1R4RkRxR3d0MWZKUEx6UzN6MW54WS9tUVowd25M?=
 =?utf-8?B?QjBCVEJQbmd3ZmpoczZkbGJQcmlPL1VIYUVrVkpvUXZTaGtqU2ZUVmkvK3U0?=
 =?utf-8?B?dzh1aWtQbGoveUkrbldsT1hsMUZPZFVkRzkyaHNzMm9mbjhuM0N1NWFTSkh4?=
 =?utf-8?B?dmNwNi9wUkFQZ0pMRmMyQ0wwdnQvTVNtV01ObXNUMXN2UWo5WjhWWExxQUI0?=
 =?utf-8?B?Y3J4T09EWnU1S09ITkdZUDNWZkRiTHdlV0EyaEhhUCsrbDQwbThEYmtqR0s4?=
 =?utf-8?B?YUZMckMxY0pNVzUrQjh1SUQ1QklkYXBndzdtbEZ3QUxjakV5M2hJS0NMRnh2?=
 =?utf-8?B?K1pROEhKUDJLK3pDM2RPWis0VnBLZ3dOZlBJWVdUYkxRc3RDb0dsMWlaczk0?=
 =?utf-8?B?KzRYTXc5OFFCcG5hakMyWC80ZHVHZ044VklvMTZydTYxbE10SmpFSjR0VnpS?=
 =?utf-8?B?OVNkNWJSSnhVVjJZbnhSTjUyanI1VEY0M212ZU1uMm5acmVZZ0hodjBuR2JV?=
 =?utf-8?B?Y2RXVU1BVklZN3poQVZsZmFDQWZhejA3emtmUWx6UDVuWTF5RXMvcWg1cEl2?=
 =?utf-8?B?eXdRK21lRjFmQTZYUWs4OVRNcjdEN2lMKzJKTjN5Y2RtdnNUUHZJUWhJZGlv?=
 =?utf-8?B?c3RweXo5ZmlpdCs4ckIwOTVnOURFZUdIM3ZLR0FNc1gzTG1BYmxGSWl0L1Ny?=
 =?utf-8?B?NExCZGluOGNXN0E4c0ZvcmptSkU4eXd4SldoSENkbmRmdGxFcXJqMEhtR28z?=
 =?utf-8?B?Z2tSK01rbzcrcEtYWENlZU5RNjhRTC95dFlnK3pFQWR3M1IzQmtiK3NDQ2FX?=
 =?utf-8?B?Q2FRcWJNSnpGdmlJRFkwYlNkSGt2cm83N0pRUCs0dnovZmxzOXdyUFlRKzMz?=
 =?utf-8?B?dmJ0OVNuMFJOa3lxUXNtcDU3VVQzRmg5b0phMnArOEcwWjJERERwWkYwQzIv?=
 =?utf-8?B?NkdYWUNFZXlmeGUwbGpFSGR1MnpSOUJmQnVJeGVQR0ppVkJIbkpuRlFCZVRs?=
 =?utf-8?B?K3QvWDdvQm5XQkJwQld1Rm5aUzBUYmIzS3F6RVpOVklDUjFJc1VZRFAzV2Qv?=
 =?utf-8?B?THBuMU9majBZbkxhQ2tvdlhYMFhjNWJnSUJCSkV4bVVScms0MG5HOHZvOG9X?=
 =?utf-8?B?Z2x3TkZJRVpDSzAxRnNFankzZVR5UFJGT3J4NXNVeGhGY0NMZnpNdWptbXFU?=
 =?utf-8?Q?QtTYq8ns2HT1d0Ar1R9vHFcW8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f072aff-1c96-4237-c120-08db81236561
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 08:55:22.8893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFRaJRulX5d3K8HnzyvOQEQhlUM1UBvBVIg6jZ/zlvJYGgpbevJ7leIPBiHukmAFw8oum5gNf2F/JqOG+HTQmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9051

Use the generic framework in xen/linkage.h. No change in generated code
except for the changed padding value (noticable when config.gz isn't a
multiple of 4 in size). Plus of course the converted symbols change to
be hidden ones.

Note that ASM_INT() is switched to DATA(), not DATA_LOCAL(), as the only
use site wants the symbol global anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Only one each of the assembly files is being converted for now. More
could be done right here or as follow-on in separate patches.

The ASM_INT() redundancy of .global will be eliminated by a subsequent
patch.
---
v3: New.

--- a/xen/arch/arm/arm32/lib/div64.S
+++ b/xen/arch/arm/arm32/lib/div64.S
@@ -42,7 +42,7 @@
  * Clobbered regs: xl, ip
  */
 
-ENTRY(__do_div64)
+FUNC(__do_div64)
 UNWIND(.fnstart)
 
 	@ Test for easy paths first.
@@ -206,4 +206,4 @@ Ldiv0_64:
 	ldr	pc, [sp], #8
 
 UNWIND(.fnend)
-ENDPROC(__do_div64)
+END(__do_div64)
--- a/xen/arch/arm/arm64/lib/clear_page.S
+++ b/xen/arch/arm/arm64/lib/clear_page.S
@@ -22,7 +22,7 @@
  * Parameters:
  *	x0 - dest
  */
-ENTRY(clear_page)
+FUNC(clear_page)
 	mrs	x1, dczid_el0
 	and	w1, w1, #0xf
 	mov	x2, #4
@@ -33,4 +33,4 @@ ENTRY(clear_page)
 	tst	x0, #(PAGE_SIZE - 1)
 	b.ne	1b
 	ret
-ENDPROC(clear_page)
+END(clear_page)
--- a/xen/arch/arm/include/asm/asm_defns.h
+++ b/xen/arch/arm/include/asm/asm_defns.h
@@ -5,6 +5,7 @@
 /* NB. Auto-generated from arch/.../asm-offsets.c */
 #include <asm/asm-offsets.h>
 #endif
+#include <xen/linkage.h>
 #include <asm/processor.h>
 
 /* Macros for generic assembly code */
@@ -28,10 +29,7 @@ label:  .asciz msg;
 .popsection
 
 #define ASM_INT(label, val)                 \
-    .p2align 2;                             \
-label: .long (val);                         \
-    .size label, . - label;                 \
-    .type label, %object
+    DATA(label, 4) .long (val); END(label)
 
 #endif /* __ARM_ASM_DEFNS_H__ */
 /*
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -53,7 +53,8 @@
 
 /* Linkage for ARM */
 #ifdef __ASSEMBLY__
-#define ALIGN .align 2
+#define CODE_ALIGN 4
+#define ALIGN .balign CODE_ALIGN
 #define ENTRY(name)                             \
   .globl name;                                  \
   ALIGN;                                        \
@@ -61,8 +62,6 @@
 #define GLOBAL(name)                            \
   .globl name;                                  \
   name:
-#define END(name) \
-  .size name, .-name
 #define ENDPROC(name) \
   .type name, %function; \
   END(name)


