Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B579754C540
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 11:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349816.575991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Po0-00022Y-DB; Wed, 15 Jun 2022 09:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349816.575991; Wed, 15 Jun 2022 09:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1Po0-0001zA-9M; Wed, 15 Jun 2022 09:59:20 +0000
Received: by outflank-mailman (input) for mailman id 349816;
 Wed, 15 Jun 2022 09:59:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1Pnx-0001TN-RP
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 09:59:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0b07690-ec91-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 11:59:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8922.eurprd04.prod.outlook.com (2603:10a6:20b:409::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 09:59:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 09:59:14 +0000
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
X-Inumbo-ID: d0b07690-ec91-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGSnWntplEyz5VbWQ8crUJaYqdsFeDyBB+LTfkwwyOvpL5xWytyALWkNNzFvR6GLkgyQ5+UvNe4FDhmZR5SkonqKjA0FRpuYVkb2018l5qfJlwDtXxSPFGmxxdovSz6+YUkLBTTAeiabGb8kHxLvilF0041FkQmIFLl0bMkwFF9J4hnyszue2ei8wLCGNVgjDIy4aFF2ZqpM/nMw8ReGJ68bN4k9wLUcWI5qBja8mgYAyifQadYAi5RLdYTiClTbLTao8zjQFfqGzsgtKuALHl5w1bjDJOuMJHiIC5nltk7hyqpuncxyDcWoLmMxYRHNtPStKXchYfe2GWHMpIvOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ToDF/3dheRx2o50QmgkQ6+WXvu2iMMOjScLXSCyS8s=;
 b=AFmu0OiwQguPP+1euH3FdZ9g/taOh46d5hSamVDA/lPhs6F9jxRhXildlmc+ipIirNeMOAiog3j0/GuwOyKwNVjPMaOshOlWi0FPE8DPaLSe73jTI2D13QMkArQ9++c3kha5SyJ2ADpiQjabb25OqLQ3t21DViEYYVmNZZPJv84+JQHbLB8XTpLlNW3NrvTfSzX5fPhz9gvpbT3rAjSOAmrciBNo37+19aKzCywxPTUpI0LdMC6fjsJguaI0urTeVzTZJzmHRqxI2QQE4D/NeE5lAFkXdLz47ER5IBP93JPgbaqSTE68IK9JTuXHYgiDwyQtz6SwXGo9vNretFHQcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ToDF/3dheRx2o50QmgkQ6+WXvu2iMMOjScLXSCyS8s=;
 b=T4uIjw7KWCkBfZ1ZIjGzs+qeH/YXnL3nyofrYoQj8sx3CQp/D24NrRMu62uV83r3K+Px8spZkzDk1KgsfB1/j5Q262/s6z0W7Ns9eItNU7mZr3+kfxfiXEdUCkkyg9uXycZDnxaq1vCuA/ai8ClQgqvEDRNX7uf/skGvLGWEuHDeyqKf9CDlTVxTkrhu6vBIN4Qqm1+Eb2XOK0wl+3teuJddk7PitFXvxNdKDGOu9sCWMU7DzRxQlWgylZl9FePqF1CByuvpH9KDmhJO/QUrr4FLKN/bsIWT7YChJZDOUjlbNR9U/TjL3yhami1QsgGP/MamGDMceRpQGBaXEfdPaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <91dbe849-ea99-4134-4cda-55f23a801055@suse.com>
Date: Wed, 15 Jun 2022 11:59:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2 2/8] x86emul: split off opcode 0fae handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
In-Reply-To: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0249.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e010640-0f4c-4e02-7738-08da4eb5b3c2
X-MS-TrafficTypeDiagnostic: AM9PR04MB8922:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8922EC901A2B5DC732026969B3AD9@AM9PR04MB8922.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2ggE465PCl9ZR8Rh7i0HXMVYhi7VyJqdaJeK+DEhVycePGLUCXWjeDjtyh/Ulu4CTY+jPFbWYGzyhCLq/3DkuOS7M4LUuU/G1roksbNvjyTlMVvTH3O3z9lHNc9dIn25vCSzycxEqPdVlq9VxjJES2Yb1mbPZxldIBIgbQWyM+HHazrJg57oNKiFzPEJ/PREr6Jz2BY4sCkrD8E6utndj2ewV5E6V7Ii0fAPIhIFM18xs0StQRO+MdkyuD3XTnI6JUzCn/ZP1mv1nm5p0G4iHNYrw/HsoPK5cH/X1khIkUV07swy28W9ZmTVqJHcOpCkHBg0tGO7sHgaFLGNaHzir16cDHWM85vMnQGrkshVXW/HyI1XKM/rftrVv3OvUh1CzRMrh4D9/fJxJZpBxzrDZruromhhjmfXAmdZkVWrvCcbAe6/S9FuC1cjlYpVPRvm+XWsHhhRoKUYJzm8EyzsFaiwGx4Dc4WiPr13yaBGI2/fiozNwhQWdaexjd6oHa7tyXZqeYYHVDQycydGyBIggwMCCRHme3OmyrhJM91q2ngSjd0WwUKlPkW2Yl45uc6P2MxJczKNHRpRc2F6mNVqmgy3rIihAW2bdJ0vrx8aHo7CzYOtkNk41KCEbzZsL2t3cDEjHQ/uYN/d6Q0QVWJTwS+oCc2MDH7fnGkdcZfdX7vQ7Qo5Bu7EJ2GrkM7HolUepSMrFbJCXc9GP2jT2bdNkqj05PiQcJtJWLQf/uC7DjsBg4N3CkTtL/QmCs7kCel4YZdayl/ZirecX5mlowHyIXUrHknunoBUFTB/8rNqwkfJgEmCAA8jdp+hSStTRYT7SXvjmjYgug9UIenBC8FppQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(83380400001)(186003)(2616005)(31686004)(36756003)(38100700002)(2906002)(6512007)(316002)(6486002)(5660300002)(86362001)(6506007)(66556008)(26005)(6916009)(508600001)(8676002)(66946007)(4326008)(8936002)(66476007)(31696002)(54906003)(30864003)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SkZJbFN2dzRUbk1uYmVMejUrbEY1aWhtNWxKWnJvS0RMOHZiMVo5TlUxWlRS?=
 =?utf-8?B?Rm5WQmRIOE9DY1RPVkZwcGlHeTFDUlI3d0hhSmlYdVJkS1NxMlJicU1RWWRi?=
 =?utf-8?B?TzR0ZEY3WGhxeDR1VGhOYmNydkhIcEV1eXJmOC9iY0ZaNWFSY0NLSGcyZ29a?=
 =?utf-8?B?eDF4cUN6MkFEYUNTTzJ4bDJXNElBeHNlRzFWVDRDZTVvL3ZmSkQvZGpKSm9D?=
 =?utf-8?B?LzRHRHZialRCNWZpaGJodmJZV1p2SFFQQXFJNDBqTE5wWi9NaFg0U2l0TEUv?=
 =?utf-8?B?ZHB2bWYraWpFR2RFMlZMbFo4ZlNSWmpLZm8xU2EwZ1BPV2YwTW5YVEphbG5l?=
 =?utf-8?B?UmJUSy9YS296QmdBRGttazV3aWRQa1RSdjVPK1poRFVYb3RGL09ER3NjSkhX?=
 =?utf-8?B?eHJNNU95UXFvUFp4akFxYlhPMy9WSndqWndYSXNQRVg4ZFdSVElwY0RqRDdR?=
 =?utf-8?B?dWNFOUc3d0Y4T0lkeEQ0WWN5bGZ1aUJXYkJubFhnZHZoL3J1WitJMXNCTlo1?=
 =?utf-8?B?c0d6NUpYN3duYWF4T3JPM2lsd2s1ZE9hU3UzMG0ybXNrOFo5YkswZUdUSm42?=
 =?utf-8?B?S1M3UHBGZjdlaHEremkxSzU3bjhLb2w0U1N0MWpBUzFLN0IwUVcvcTVuUTJL?=
 =?utf-8?B?eWNDZWNhR0p5WXZoY28vZnJDTkdJSWVKMHFwTlBLdVRWYVFYWlREK1hGT3BE?=
 =?utf-8?B?WGFBNmVvaDM0UThyK3BJaG1naDdEeUpqOGJXano3SmF6b3Erd3lid2MzNVhI?=
 =?utf-8?B?RVVYcEF5Q1IrQ3hPNVJpa2RZV0V6NVZSWFd6dlRKZ2tKQmVDNW8yOGExamFa?=
 =?utf-8?B?T0d3NDREeDg5SDBVNHUxbHArcmk3V002ZlR4eHNXSjF1UmVIejZqTE5RcjVP?=
 =?utf-8?B?WnR6a3JKeCtJbzhSamx1SnNna1hOY3YyVTJTSGJRSWNDU1dZQmk1S3lHQ2dB?=
 =?utf-8?B?MTFTVWZuemFrOGM5RWNIaE5TN1U2SXJRSGpsUVk2QUFLY2tSMTJ6SzBNQXov?=
 =?utf-8?B?RGI0WlFFTTZ1KzQxU282KzJlZEd6QndYVzhCUG5qaDNzSzZrNFBmd2xSRmVL?=
 =?utf-8?B?YnRGWkIyYk9UdE15WnRJa2dzRi9HSFlpRTFZL0ZqVGt0MGVHNmN3VVRDeGgx?=
 =?utf-8?B?cjJEU2JDdFQ1WEltWUtMUm5CRjRoWmN5NHkweFRJdmtiQ0VCQklZeUx4bytX?=
 =?utf-8?B?SS92MjJmbklQTHluMERxNXh6NXFUKy9pOEFtVFR3L2lac2k2bTVuZnBVS3RY?=
 =?utf-8?B?YVZxUVkyd0E4M3EzV1hKRHRSL1ZjTGtWaFZJS05JbUlydXJwUUlYd1RVWVMx?=
 =?utf-8?B?Ni9ONVE5dHB4NXNiU3ZXTERxUlJXRmF5YkJVOWQ2RHJnLzNlWS92UlJaa3ls?=
 =?utf-8?B?S1FKN1FINUF4aG1aRVV4RVZTYSt2dXh1UUduUTd2K0R0R1JTQkZWdHBPSjhR?=
 =?utf-8?B?N0Q0ODBJSmVITzc0YjBHY25icmFNZys1ZE1DTWJ2RWxpSWtTZkthVmRuS2Ja?=
 =?utf-8?B?T3JpT21nV29ac3RkN1V5bUU4ajBrd3B5L3dwbVlMNWgyZEpmTGxIaEwrWmtQ?=
 =?utf-8?B?Z0puTDBYS1lzMksyNm10NnQ2QndLV3BlZ0pmSUF0eVFZU3pXU3YzSWUrb1Fl?=
 =?utf-8?B?ZHEwWVR3RERqSXA2NjhUYkMzRUVVdEdEMFJKcklMNUtEMkc5TC9iVGgvL204?=
 =?utf-8?B?N212ajBiRXliRXE3ais4a2ZoL3kzdmsyaCtLUWFONVJLT1QyMXpFUTJ4RjJi?=
 =?utf-8?B?VHNyYWJqY2xBK3kxQTQzT24vTmh0VFR1WXVYKzdBSEVUV3VzcjVqUjVOVEVy?=
 =?utf-8?B?R0cxK29uaVdRWFppeUZqZ2hLbmZ5U05yQVdFK0JXYjNsTUpKeDhBem4wTnky?=
 =?utf-8?B?V0tsUjV2VTBYQ29jRndrYXRsdWVhMm5aSElaYzluYk5JaExPdzkwMEhPY1ox?=
 =?utf-8?B?SGZJbGU1Ly9nVitjZHZvbXZ2TVllZW1uRTZiWnd0dFByODlQblUrc2pvYmhh?=
 =?utf-8?B?WDk2MmxsUzFhZWVOanhSYnFFR3U2T0JNR3p0YkYraExuTys4SW94Q1ZVcGw0?=
 =?utf-8?B?anJXK1hHdXJSNEFUQUowNGc1K3NMcnVqQXNPcHJzL2VTbitmdUk4blpMNnQr?=
 =?utf-8?B?bTFyL0kwTEdZeVJNeFFoY2NVRm9WRE50dk9QZGpoVjFqckg1NmFzWW1EallW?=
 =?utf-8?B?MXpZKzJKRG50MThsVlZScDVtZFJxaE5XaWREcytzY3VnTS96UWRpZFFHanNy?=
 =?utf-8?B?eDBoUVl5cGtDZUorWjhVZFhjNS9IVGQyRUFjMVZHdDcrQ2hkUDZ1RnRGbHg4?=
 =?utf-8?B?bCtzUVFTd1QvZzlNNmc3OFFhRzEwVjRQN2llTzZIMEF4YlBkMzM2Zz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e010640-0f4c-4e02-7738-08da4eb5b3c2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 09:59:13.9822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYvNqjxtqcp1SHDEmi7zO6nNzdk9o2ZQE2hEJ7qPOVzRJWS5jFmUyfeSUd1+yc7ZY/QIQn7fcOv2YXTp7GVH+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8922

There's a fair amount of sub-cases (with some yet to be implemented), so
a separate function seems warranted.

Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
by X86_EXC_* (such that EXC_* don't need to move as well; we want these
to be phased out anyway).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -35,7 +35,7 @@ x86.h := $(addprefix $(XEN_ROOT)/tools/i
 x86_emulate.h := x86-emulate.h x86_emulate/x86_emulate.h $(x86.h)
 
 OBJS := fuzz-emul.o x86-emulate.o
-OBJS += x86_emulate/0f01.o
+OBJS += x86_emulate/0f01.o x86_emulate/0fae.o
 
 # x86-emulate.c will be implicit for both
 x86-emulate.o x86-emulate-cov.o: x86_emulate/x86_emulate.c $(x86_emulate.h) x86_emulate/private.h
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -251,7 +251,7 @@ xop.h avx512f.h: simd-fma.c
 endif # 32-bit override
 
 OBJS := x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
-OBJS += x86_emulate/0f01.o
+OBJS += x86_emulate/0f01.o x86_emulate/0fae.o
 
 $(TARGET): $(OBJS)
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/0fae.c
@@ -0,0 +1,222 @@
+/******************************************************************************
+ * 0fae.c - helper for x86_emulate.c
+ *
+ * Generic x86 (32-bit and 64-bit) instruction decoder and emulator.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "private.h"
+
+#if defined(__XEN__) && \
+    (!defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
+     !defined(X86EMUL_NO_SIMD))
+# include <asm/xstate.h>
+#endif
+
+int x86emul_0fae(struct x86_emulate_state *s,
+                 struct cpu_user_regs *regs,
+                 struct operand *dst,
+                 const struct operand *src,
+                 struct x86_emulate_ctxt *ctxt,
+                 const struct x86_emulate_ops *ops,
+                 enum x86_emulate_fpu_type *fpu_type)
+#define fpu_type (*fpu_type) /* for get_fpu() */
+{
+    unsigned long cr4;
+    int rc;
+
+    if ( !s->vex.opcx && (!s->vex.pfx || s->vex.pfx == vex_66) )
+    {
+        switch ( s->modrm_reg & 7 )
+        {
+#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
+    !defined(X86EMUL_NO_SIMD)
+        case 0: /* fxsave */
+        case 1: /* fxrstor */
+            generate_exception_if(s->vex.pfx, X86_EXC_UD);
+            vcpu_must_have(fxsr);
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            generate_exception_if(!is_aligned(s->ea.mem.seg, s->ea.mem.off, 16,
+                                              ctxt, ops),
+                                  X86_EXC_GP, 0);
+            fail_if(!ops->blk);
+            s->op_bytes =
+#ifdef __x86_64__
+                !mode_64bit() ? offsetof(struct x86_fxsr, xmm[8]) :
+#endif
+                sizeof(struct x86_fxsr);
+            if ( amd_like(ctxt) )
+            {
+                uint64_t msr_val;
+
+                /* Assume "normal" operation in case of missing hooks. */
+                if ( !ops->read_cr ||
+                     ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
+                    cr4 = X86_CR4_OSFXSR;
+                if ( !ops->read_msr ||
+                     ops->read_msr(MSR_EFER, &msr_val, ctxt) != X86EMUL_OKAY )
+                    msr_val = 0;
+                if ( !(cr4 & X86_CR4_OSFXSR) ||
+                     (mode_64bit() && mode_ring0() && (msr_val & EFER_FFXSE)) )
+                    s->op_bytes = offsetof(struct x86_fxsr, xmm[0]);
+            }
+            /*
+             * This could also be X86EMUL_FPU_mmx, but it shouldn't be
+             * X86EMUL_FPU_xmm, as we don't want CR4.OSFXSR checked.
+             */
+            get_fpu(X86EMUL_FPU_fpu);
+            s->fpu_ctrl = true;
+            s->blk = s->modrm_reg & 1 ? blk_fxrstor : blk_fxsave;
+            if ( (rc = ops->blk(s->ea.mem.seg, s->ea.mem.off, NULL,
+                                sizeof(struct x86_fxsr), &regs->eflags,
+                                s, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            break;
+#endif /* X86EMUL_NO_{FPU,MMX,SIMD} */
+
+#ifndef X86EMUL_NO_SIMD
+        case 2: /* ldmxcsr */
+            generate_exception_if(s->vex.pfx, X86_EXC_UD);
+            vcpu_must_have(sse);
+        ldmxcsr:
+            generate_exception_if(src->type != OP_MEM, X86_EXC_UD);
+            get_fpu(s->vex.opcx ? X86EMUL_FPU_ymm : X86EMUL_FPU_xmm);
+            generate_exception_if(src->val & ~mxcsr_mask, X86_EXC_GP, 0);
+            asm volatile ( "ldmxcsr %0" :: "m" (src->val) );
+            break;
+
+        case 3: /* stmxcsr */
+            generate_exception_if(s->vex.pfx, X86_EXC_UD);
+            vcpu_must_have(sse);
+        stmxcsr:
+            generate_exception_if(dst->type != OP_MEM, X86_EXC_UD);
+            get_fpu(s->vex.opcx ? X86EMUL_FPU_ymm : X86EMUL_FPU_xmm);
+            asm volatile ( "stmxcsr %0" : "=m" (dst->val) );
+            break;
+#endif /* X86EMUL_NO_SIMD */
+
+        case 5: /* lfence */
+            fail_if(s->modrm_mod != 3);
+            generate_exception_if(s->vex.pfx, X86_EXC_UD);
+            vcpu_must_have(sse2);
+            asm volatile ( "lfence" ::: "memory" );
+            break;
+        case 6:
+            if ( s->modrm_mod == 3 ) /* mfence */
+            {
+                generate_exception_if(s->vex.pfx, X86_EXC_UD);
+                vcpu_must_have(sse2);
+                asm volatile ( "mfence" ::: "memory" );
+                break;
+            }
+            /* else clwb */
+            fail_if(!s->vex.pfx);
+            vcpu_must_have(clwb);
+            fail_if(!ops->cache_op);
+            if ( (rc = ops->cache_op(x86emul_clwb, s->ea.mem.seg, s->ea.mem.off,
+                                     ctxt)) != X86EMUL_OKAY )
+                goto done;
+            break;
+        case 7:
+            if ( s->modrm_mod == 3 ) /* sfence */
+            {
+                generate_exception_if(s->vex.pfx, X86_EXC_UD);
+                vcpu_must_have(mmxext);
+                asm volatile ( "sfence" ::: "memory" );
+                break;
+            }
+            /* else clflush{,opt} */
+            if ( !s->vex.pfx )
+                vcpu_must_have(clflush);
+            else
+                vcpu_must_have(clflushopt);
+            fail_if(!ops->cache_op);
+            if ( (rc = ops->cache_op(s->vex.pfx ? x86emul_clflushopt
+                                                : x86emul_clflush,
+                                     s->ea.mem.seg, s->ea.mem.off,
+                                     ctxt)) != X86EMUL_OKAY )
+                goto done;
+            break;
+        default:
+            return X86EMUL_UNIMPLEMENTED;
+        }
+    }
+#ifndef X86EMUL_NO_SIMD
+    else if ( s->vex.opcx && !s->vex.pfx )
+    {
+        switch ( s->modrm_reg & 7 )
+        {
+        case 2: /* vldmxcsr */
+            generate_exception_if(s->vex.l || s->vex.reg != 0xf, X86_EXC_UD);
+            vcpu_must_have(avx);
+            goto ldmxcsr;
+        case 3: /* vstmxcsr */
+            generate_exception_if(s->vex.l || s->vex.reg != 0xf, X86_EXC_UD);
+            vcpu_must_have(avx);
+            goto stmxcsr;
+        }
+        return X86EMUL_UNRECOGNIZED;
+    }
+#endif /* !X86EMUL_NO_SIMD */
+    else if ( !s->vex.opcx && s->vex.pfx == vex_f3 )
+    {
+        enum x86_segment seg;
+        struct segment_register sreg;
+
+        fail_if(s->modrm_mod != 3);
+        generate_exception_if((s->modrm_reg & 4) || !mode_64bit(), X86_EXC_UD);
+        fail_if(!ops->read_cr);
+        if ( (rc = ops->read_cr(4, &cr4, ctxt)) != X86EMUL_OKAY )
+            goto done;
+        generate_exception_if(!(cr4 & X86_CR4_FSGSBASE), X86_EXC_UD);
+        seg = s->modrm_reg & 1 ? x86_seg_gs : x86_seg_fs;
+        fail_if(!ops->read_segment);
+        if ( (rc = ops->read_segment(seg, &sreg, ctxt)) != X86EMUL_OKAY )
+            goto done;
+        dst->reg = decode_gpr(regs, s->modrm_rm);
+        if ( !(s->modrm_reg & 2) )
+        {
+            /* rd{f,g}sbase */
+            dst->type = OP_REG;
+            dst->bytes = (s->op_bytes == 8) ? 8 : 4;
+            dst->val = sreg.base;
+        }
+        else
+        {
+            /* wr{f,g}sbase */
+            if ( s->op_bytes == 8 )
+            {
+                sreg.base = *dst->reg;
+                generate_exception_if(!is_canonical_address(sreg.base),
+                                      X86_EXC_GP, 0);
+            }
+            else
+                sreg.base = (uint32_t)*dst->reg;
+            fail_if(!ops->write_segment);
+            if ( (rc = ops->write_segment(seg, &sreg, ctxt)) != X86EMUL_OKAY )
+                goto done;
+        }
+    }
+    else
+    {
+        ASSERT_UNREACHABLE();
+        return X86EMUL_UNRECOGNIZED;
+    }
+
+    rc = X86EMUL_OKAY;
+
+ done:
+    return rc;
+}
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -1 +1,2 @@
 obj-y += 0f01.o
+obj-y += 0fae.o
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -308,6 +308,29 @@ struct x86_emulate_state {
 #endif
 };
 
+struct x86_fxsr {
+    uint16_t fcw;
+    uint16_t fsw;
+    uint8_t ftw, :8;
+    uint16_t fop;
+    union {
+        struct {
+            uint32_t offs;
+            uint16_t sel, :16;
+        };
+        uint64_t addr;
+    } fip, fdp;
+    uint32_t mxcsr;
+    uint32_t mxcsr_mask;
+    struct {
+        uint8_t data[10];
+        uint16_t :16, :16, :16;
+    } fpreg[8];
+    uint64_t __attribute__ ((aligned(16))) xmm[16][2];
+    uint64_t rsvd[6];
+    uint64_t avl[6];
+};
+
 /*
  * Externally visible return codes from x86_emulate() are non-negative.
  * Use negative values for internal state change indicators from helpers
@@ -397,6 +420,18 @@ in_protmode(
     (_cpl == 0);                                \
 })
 
+static inline bool
+_amd_like(const struct cpuid_policy *cp)
+{
+    return cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON);
+}
+
+static inline bool
+amd_like(const struct x86_emulate_ctxt *ctxt)
+{
+    return _amd_like(ctxt->cpuid);
+}
+
 #define vcpu_has_fpu()         (ctxt->cpuid->basic.fpu)
 #define vcpu_has_sep()         (ctxt->cpuid->basic.sep)
 #define vcpu_has_cx8()         (ctxt->cpuid->basic.cx8)
@@ -501,11 +536,52 @@ in_protmode(
 int x86emul_get_cpl(struct x86_emulate_ctxt *ctxt,
                     const struct x86_emulate_ops *ops);
 
+int x86emul_get_fpu(enum x86_emulate_fpu_type type,
+                    struct x86_emulate_ctxt *ctxt,
+                    const struct x86_emulate_ops *ops);
+
+#define get_fpu(type)                                           \
+do {                                                            \
+    rc = x86emul_get_fpu(fpu_type = (type), ctxt, ops);         \
+    if ( rc ) goto done;                                        \
+} while (0)
+
 int x86emul_0f01(struct x86_emulate_state *s,
                  struct cpu_user_regs *regs,
                  struct operand *dst,
                  struct x86_emulate_ctxt *ctxt,
                  const struct x86_emulate_ops *ops);
+int x86emul_0fae(struct x86_emulate_state *s,
+                 struct cpu_user_regs *regs,
+                 struct operand *dst,
+                 const struct operand *src,
+                 struct x86_emulate_ctxt *ctxt,
+                 const struct x86_emulate_ops *ops,
+                 enum x86_emulate_fpu_type *fpu_type);
+
+static inline bool is_aligned(enum x86_segment seg, unsigned long offs,
+                              unsigned int size, struct x86_emulate_ctxt *ctxt,
+                              const struct x86_emulate_ops *ops)
+{
+    struct segment_register reg;
+
+    /* Expecting powers of two only. */
+    ASSERT(!(size & (size - 1)));
+
+    if ( mode_64bit() && seg < x86_seg_fs )
+        memset(&reg, 0, sizeof(reg));
+    else
+    {
+        /* No alignment checking when we have no way to read segment data. */
+        if ( !ops->read_segment )
+            return true;
+
+        if ( ops->read_segment(seg, &reg, ctxt) != X86EMUL_OKAY )
+            return false;
+    }
+
+    return !((reg.base + offs) & (size - 1));
+}
 
 static inline bool umip_active(struct x86_emulate_ctxt *ctxt,
                                const struct x86_emulate_ops *ops)
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -695,29 +695,6 @@ typedef union {
     uint32_t data32[16];
 } mmval_t;
 
-struct x86_fxsr {
-    uint16_t fcw;
-    uint16_t fsw;
-    uint8_t ftw, :8;
-    uint16_t fop;
-    union {
-        struct {
-            uint32_t offs;
-            uint16_t sel, :16;
-        };
-        uint64_t addr;
-    } fip, fdp;
-    uint32_t mxcsr;
-    uint32_t mxcsr_mask;
-    struct {
-        uint8_t data[10];
-        uint16_t :16, :16, :16;
-    } fpreg[8];
-    uint64_t __attribute__ ((aligned(16))) xmm[16][2];
-    uint64_t rsvd[6];
-    uint64_t avl[6];
-};
-
 /*
  * While proper alignment gets specified above, this doesn't get honored by
  * the compiler for automatic variables. Use this helper to instantiate a
@@ -1063,7 +1040,7 @@ do {
     ops->write_segment(x86_seg_cs, cs, ctxt);                           \
 })
 
-static int _get_fpu(
+int x86emul_get_fpu(
     enum x86_emulate_fpu_type type,
     struct x86_emulate_ctxt *ctxt,
     const struct x86_emulate_ops *ops)
@@ -1102,7 +1079,7 @@ static int _get_fpu(
         break;
     }
 
-    rc = ops->get_fpu(type, ctxt);
+    rc = (ops->get_fpu)(type, ctxt);
 
     if ( rc == X86EMUL_OKAY )
     {
@@ -1146,12 +1123,6 @@ static int _get_fpu(
     return rc;
 }
 
-#define get_fpu(type)                                           \
-do {                                                            \
-    rc = _get_fpu(fpu_type = (type), ctxt, ops);                \
-    if ( rc ) goto done;                                        \
-} while (0)
-
 static void put_fpu(
     enum x86_emulate_fpu_type type,
     bool failed_late,
@@ -1556,18 +1527,6 @@ static int ioport_access_check(
     return rc;
 }
 
-static bool
-_amd_like(const struct cpuid_policy *cp)
-{
-    return cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON);
-}
-
-static bool
-amd_like(const struct x86_emulate_ctxt *ctxt)
-{
-    return _amd_like(ctxt->cpuid);
-}
-
 /* Initialise output state in x86_emulate_ctxt */
 static void init_context(struct x86_emulate_ctxt *ctxt)
 {
@@ -1980,30 +1939,6 @@ static unsigned int decode_disp8scale(en
     } \
 } while ( false )
 
-static bool is_aligned(enum x86_segment seg, unsigned long offs,
-                       unsigned int size, struct x86_emulate_ctxt *ctxt,
-                       const struct x86_emulate_ops *ops)
-{
-    struct segment_register reg;
-
-    /* Expecting powers of two only. */
-    ASSERT(!(size & (size - 1)));
-
-    if ( mode_64bit() && seg < x86_seg_fs )
-        memset(&reg, 0, sizeof(reg));
-    else
-    {
-        /* No alignment checking when we have no way to read segment data. */
-        if ( !ops->read_segment )
-            return true;
-
-        if ( ops->read_segment(seg, &reg, ctxt) != X86EMUL_OKAY )
-            return false;
-    }
-
-    return !((reg.base + offs) & (size - 1));
-}
-
 static bool is_branch_step(struct x86_emulate_ctxt *ctxt,
                            const struct x86_emulate_ops *ops)
 {
@@ -3346,7 +3281,8 @@ x86_emulate(
 #ifndef X86EMUL_NO_SIMD
     /* With a memory operand, fetch the mask register in use (if any). */
     if ( ea.type == OP_MEM && evex.opmsk &&
-         _get_fpu(fpu_type = X86EMUL_FPU_opmask, ctxt, ops) == X86EMUL_OKAY )
+         x86emul_get_fpu(fpu_type = X86EMUL_FPU_opmask,
+                         ctxt, ops) == X86EMUL_OKAY )
     {
         uint8_t *stb = get_stub(stub);
 
@@ -3369,7 +3305,7 @@ x86_emulate(
 
     if ( fpu_type == X86EMUL_FPU_opmask )
     {
-        /* Squash (side) effects of the _get_fpu() above. */
+        /* Squash (side) effects of the x86emul_get_fpu() above. */
         x86_emul_reset_event(ctxt);
         put_fpu(X86EMUL_FPU_opmask, false, state, ctxt, ops);
         fpu_type = X86EMUL_FPU_none;
@@ -7433,173 +7369,14 @@ x86_emulate(
             emulate_2op_SrcV_nobyte("bts", src, dst, _regs.eflags);
         break;
 
-    case X86EMUL_OPC(0x0f, 0xae): case X86EMUL_OPC_66(0x0f, 0xae): /* Grp15 */
-        switch ( modrm_reg & 7 )
-        {
-#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
-    !defined(X86EMUL_NO_SIMD)
-        case 0: /* fxsave */
-        case 1: /* fxrstor */
-            generate_exception_if(vex.pfx, EXC_UD);
-            vcpu_must_have(fxsr);
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            generate_exception_if(!is_aligned(ea.mem.seg, ea.mem.off, 16,
-                                              ctxt, ops),
-                                  EXC_GP, 0);
-            fail_if(!ops->blk);
-            op_bytes =
-#ifdef __x86_64__
-                !mode_64bit() ? offsetof(struct x86_fxsr, xmm[8]) :
-#endif
-                sizeof(struct x86_fxsr);
-            if ( amd_like(ctxt) )
-            {
-                /* Assume "normal" operation in case of missing hooks. */
-                if ( !ops->read_cr ||
-                     ops->read_cr(4, &cr4, ctxt) != X86EMUL_OKAY )
-                    cr4 = X86_CR4_OSFXSR;
-                if ( !ops->read_msr ||
-                     ops->read_msr(MSR_EFER, &msr_val, ctxt) != X86EMUL_OKAY )
-                    msr_val = 0;
-                if ( !(cr4 & X86_CR4_OSFXSR) ||
-                     (mode_64bit() && mode_ring0() && (msr_val & EFER_FFXSE)) )
-                    op_bytes = offsetof(struct x86_fxsr, xmm[0]);
-            }
-            /*
-             * This could also be X86EMUL_FPU_mmx, but it shouldn't be
-             * X86EMUL_FPU_xmm, as we don't want CR4.OSFXSR checked.
-             */
-            get_fpu(X86EMUL_FPU_fpu);
-            state->fpu_ctrl = true;
-            state->blk = modrm_reg & 1 ? blk_fxrstor : blk_fxsave;
-            if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
-                                sizeof(struct x86_fxsr), &_regs.eflags,
-                                state, ctxt)) != X86EMUL_OKAY )
-                goto done;
-            break;
-#endif /* X86EMUL_NO_{FPU,MMX,SIMD} */
-
-#ifndef X86EMUL_NO_SIMD
-        case 2: /* ldmxcsr */
-            generate_exception_if(vex.pfx, EXC_UD);
-            vcpu_must_have(sse);
-        ldmxcsr:
-            generate_exception_if(src.type != OP_MEM, EXC_UD);
-            get_fpu(vex.opcx ? X86EMUL_FPU_ymm : X86EMUL_FPU_xmm);
-            generate_exception_if(src.val & ~mxcsr_mask, EXC_GP, 0);
-            asm volatile ( "ldmxcsr %0" :: "m" (src.val) );
-            break;
-
-        case 3: /* stmxcsr */
-            generate_exception_if(vex.pfx, EXC_UD);
-            vcpu_must_have(sse);
-        stmxcsr:
-            generate_exception_if(dst.type != OP_MEM, EXC_UD);
-            get_fpu(vex.opcx ? X86EMUL_FPU_ymm : X86EMUL_FPU_xmm);
-            asm volatile ( "stmxcsr %0" : "=m" (dst.val) );
-            break;
-#endif /* X86EMUL_NO_SIMD */
-
-        case 5: /* lfence */
-            fail_if(modrm_mod != 3);
-            generate_exception_if(vex.pfx, EXC_UD);
-            vcpu_must_have(sse2);
-            asm volatile ( "lfence" ::: "memory" );
-            break;
-        case 6:
-            if ( modrm_mod == 3 ) /* mfence */
-            {
-                generate_exception_if(vex.pfx, EXC_UD);
-                vcpu_must_have(sse2);
-                asm volatile ( "mfence" ::: "memory" );
-                break;
-            }
-            /* else clwb */
-            fail_if(!vex.pfx);
-            vcpu_must_have(clwb);
-            fail_if(!ops->cache_op);
-            if ( (rc = ops->cache_op(x86emul_clwb, ea.mem.seg, ea.mem.off,
-                                     ctxt)) != X86EMUL_OKAY )
-                goto done;
-            break;
-        case 7:
-            if ( modrm_mod == 3 ) /* sfence */
-            {
-                generate_exception_if(vex.pfx, EXC_UD);
-                vcpu_must_have(mmxext);
-                asm volatile ( "sfence" ::: "memory" );
-                break;
-            }
-            /* else clflush{,opt} */
-            if ( !vex.pfx )
-                vcpu_must_have(clflush);
-            else
-                vcpu_must_have(clflushopt);
-            fail_if(!ops->cache_op);
-            if ( (rc = ops->cache_op(vex.pfx ? x86emul_clflushopt
-                                             : x86emul_clflush,
-                                     ea.mem.seg, ea.mem.off,
-                                     ctxt)) != X86EMUL_OKAY )
-                goto done;
-            break;
-        default:
-            goto unimplemented_insn;
-        }
-        break;
-
+    case X86EMUL_OPC(0x0f, 0xae): /* Grp15 */
+    case X86EMUL_OPC_66(0x0f, 0xae):
+    case X86EMUL_OPC_F3(0x0f, 0xae):
 #ifndef X86EMUL_NO_SIMD
-
-    case X86EMUL_OPC_VEX(0x0f, 0xae): /* Grp15 */
-        switch ( modrm_reg & 7 )
-        {
-        case 2: /* vldmxcsr */
-            generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
-            vcpu_must_have(avx);
-            goto ldmxcsr;
-        case 3: /* vstmxcsr */
-            generate_exception_if(vex.l || vex.reg != 0xf, EXC_UD);
-            vcpu_must_have(avx);
-            goto stmxcsr;
-        }
-        goto unrecognized_insn;
-
-#endif /* !X86EMUL_NO_SIMD */
-
-    case X86EMUL_OPC_F3(0x0f, 0xae): /* Grp15 */
-        fail_if(modrm_mod != 3);
-        generate_exception_if((modrm_reg & 4) || !mode_64bit(), EXC_UD);
-        fail_if(!ops->read_cr);
-        if ( (rc = ops->read_cr(4, &cr4, ctxt)) != X86EMUL_OKAY )
-            goto done;
-        generate_exception_if(!(cr4 & X86_CR4_FSGSBASE), EXC_UD);
-        seg = modrm_reg & 1 ? x86_seg_gs : x86_seg_fs;
-        fail_if(!ops->read_segment);
-        if ( (rc = ops->read_segment(seg, &sreg, ctxt)) != X86EMUL_OKAY )
-            goto done;
-        dst.reg = decode_gpr(&_regs, modrm_rm);
-        if ( !(modrm_reg & 2) )
-        {
-            /* rd{f,g}sbase */
-            dst.type = OP_REG;
-            dst.bytes = (op_bytes == 8) ? 8 : 4;
-            dst.val = sreg.base;
-        }
-        else
-        {
-            /* wr{f,g}sbase */
-            if ( op_bytes == 8 )
-            {
-                sreg.base = *dst.reg;
-                generate_exception_if(!is_canonical_address(sreg.base),
-                                      EXC_GP, 0);
-            }
-            else
-                sreg.base = (uint32_t)*dst.reg;
-            fail_if(!ops->write_segment);
-            if ( (rc = ops->write_segment(seg, &sreg, ctxt)) != X86EMUL_OKAY )
-                goto done;
-        }
-        break;
+    case X86EMUL_OPC_VEX(0x0f, 0xae):
+#endif
+        rc = x86emul_0fae(state, &_regs, &dst, &src, ctxt, ops, &fpu_type);
+        goto dispatch_from_helper;
 
     case X86EMUL_OPC(0x0f, 0xaf): /* imul */
         emulate_2op_SrcV_srcmem("imul", src, dst, _regs.eflags);
@@ -10539,7 +10316,7 @@ x86_emulate(
         goto unrecognized_insn;
 
     default:
-    unimplemented_insn:
+    unimplemented_insn: __maybe_unused;
         rc = X86EMUL_UNIMPLEMENTED;
         goto done;
     unrecognized_insn:


