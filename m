Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8708F3E90AA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 14:24:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165985.303154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnH0-0007D2-EL; Wed, 11 Aug 2021 12:23:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165985.303154; Wed, 11 Aug 2021 12:23:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnH0-0007B3-AN; Wed, 11 Aug 2021 12:23:54 +0000
Received: by outflank-mailman (input) for mailman id 165985;
 Wed, 11 Aug 2021 12:23:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDnGy-0006zb-9G
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 12:23:52 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fb735281-fa9e-11eb-a06d-12813bfff9fa;
 Wed, 11 Aug 2021 12:23:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-JjQl8DwbPcmtETWA6azgwA-1; Wed, 11 Aug 2021 14:23:48 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 12:23:47 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 12:23:47 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM3PR03CA0073.eurprd03.prod.outlook.com (2603:10a6:207:5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 12:23:46 +0000
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
X-Inumbo-ID: fb735281-fa9e-11eb-a06d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628684629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SaQ/k4jYzi7swFYK8gZr5pavMGbFr3WAaLIuEQsIC24=;
	b=HXMcWEl93tut668JRv8PNyx0gmfg2wNEVwBb3JDPn2iYwehuWezWcPQuJFb3BoY8oeFIQQ
	FVe+VCrGW4pN/T3lqzwE66jkIUGWEi1mxIkCUk2n3rYzas1T+XHaMPx+VnMko5y/64ubh/
	GR8NoKlkXTux+oZnqfGfHVXlZVsjroA=
X-MC-Unique: JjQl8DwbPcmtETWA6azgwA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYo1X8LMAyc/bZjnX0HaRb5KmMPkfcq/8KZfeWEc0a06sYVweRKmTgMK7ZlOQ/A8ROaeeVwJAVEREvPVs1fAHwe8MnUQVJV8PCIlntvvSx9IudslMXXERvZu5Yi8TOPT0jxFfsqLihiaszI3QUjAB4uLFaInr2nmipNmFgTMnphk+aTExDetwNsSPNQ0Nio/0hQPjxzSo6OaHjpQNaKo0ljgB0aUImzUrDLHPAYnbY8e8oijeLJJA0GmSWUe3xKcOJi9XVEhDR29Fef3vB3ubY7Ik7J0X9LUB3U3c++TQ3ki9/dO7QicC78queVohzmk5fBqw1hvl0Au+7l2p1btHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaQ/k4jYzi7swFYK8gZr5pavMGbFr3WAaLIuEQsIC24=;
 b=FO9pWYv5xqruIRtLg4bQVu17t8r7H3hg9YjIJSvym6q3dbE2kMmH0kfAW4Fo2Xsgnu19gmXsliBbHRBCVIRka4nmHZcS62042XRpsPz1nr8sqoWQYrjnGbdjKNT32Cvo9jBV9t+aZFE9Pan3EAlyyBuQyLhREn0x61OMpPNAU63A3kvxeEMj0INJOfAWsBxPZ05YSuM1kxgEPbXTlaVNZz93naeq6SGSTRal0O4T0hRIQDpX4dBOZ8ttvi9b/NqifLfHoF67TxO3Foh6EPtj9lktAAtyUztAd54J7Yzqr34BMYDrNIS6QHkf504iDge+UanyALBJMIOfqJxokaLuGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 3/7] x86emul: split off opcode 0fc7 handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bdc58964-e2a8-af36-1653-41c7146bdfc9@suse.com>
Message-ID: <fd182db0-6f8d-2591-eab7-bbeeac93157b@suse.com>
Date: Wed, 11 Aug 2021 14:23:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <bdc58964-e2a8-af36-1653-41c7146bdfc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR03CA0073.eurprd03.prod.outlook.com
 (2603:10a6:207:5::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19aaafc8-6827-4304-7b59-08d95cc2de29
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4351746FDED4CEC3BB9A7773B3F89@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K6CuchdmD+nQxWNonTqd4dMgQr0hbEeCgT4HKtcg2185R6uYe4Pj1aX0VLoMuHG4aVK1VxHWHgEUz20ErTvAat9kt4dBJ3lNqG2HSAh5eXfsnYsmroO4kZ6VcMY0eEDWm1ndRWeaAKN7inB0Ez8ajoDigM/cMul4TX0ij3OZZnJxpKntGzvjQi7oFgkRzyz0uuzVxBuZMJ87TrLl9E2XLnXL6la4LSXw3i3XpxiNfIG8GnLRksFRvgXzgRZlx3MLK2cvM238U+m5bpMoV1ClTwrEpcFbB8F0cu0oB0nNX7EDBqVWDeHmnMhd5pBbELWLdLjJuv/IE8B6MMJ35bc7DnGcIo5Ebd8nHkmhyte7OKKy7LatVnFiws5F59Mpffa3phc5rVRiUTVGu0GgnIPRTT/kdsG4LPtvbn4vNJ1yGFaV/9ijAlBBNdeStVD/yQBgcruM/IKR/3N3c2RBGLlKr0f2LoUoeZXLalNgBjQBbBcaQYpUYFM+eQWf4dY/N3D0GcJ5fNuaKVE4XH4Cdj3116SC9dfqoDpPwZfggTdIRRBbHF/R+ml91Am9GuBLYoNeCwNvoYTMQtq3cTpIstUBLvMvVafYa956GlgTiqbNrMRmd0of8MopWyr7qzl2q59tDpUCxfjYc+9kwTklsV+GdHo1RHNcEmodKV9uWc62jwQhtuC0Mbcxt9rkQTXWTeB3wloOxhedH7zOHaZt3HdE8O/XQq6xjKSVKx87iEtaHx0/Gjt88zCRc+YFCc6KLZxsSKukhaiU81vZNCDG4wJyka0SZrb7iFY4MVMT7o3UJ4l8wb981s9ChCXBwnwFjyEaPz+pgSNrcVOyq2BW2PGANg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(316002)(16576012)(2616005)(956004)(8676002)(5660300002)(6916009)(66946007)(36756003)(30864003)(31686004)(2906002)(86362001)(31696002)(186003)(26005)(66556008)(83380400001)(54906003)(508600001)(4326008)(38100700002)(66476007)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlRzQzY3dlVYcVpsdkRGc1orQXE2R21ScCs3V1BQWnkyeURYQkVUNkoxbk51?=
 =?utf-8?B?dUFiMEszczdRcFBENXZoeTBnTzV4STdDdHlUR3J6bUw2dkFNZkU4UTFjaGFM?=
 =?utf-8?B?Q3Vza2JSQkk3YWw3b1cvMGZqUWVPd29yTGF0dWk4UkZIWmwwcWRQN0lyMkNZ?=
 =?utf-8?B?bC9wN2RUbW5RdTFTeTBZV1dRSFRPeFVxR1hYeDd5QzRhSlY3ZkNtdE93L2VI?=
 =?utf-8?B?Y1NtcDRJSm0wK3BLVHJWUG1KdGNuZkVGRGJUcVVsZmp3c3dUbGRZK0JsTlRK?=
 =?utf-8?B?UEdlRVdOVThzdjdzZjI1VTVMM0ZVUzMvdmVRUnp6bmFVcVNMOWp1UTBldkVu?=
 =?utf-8?B?NE1JczJrMzNtYnNEQjVCeURxYlREYURuNkcybEovV1FPbURrZkdjdTBWWXU1?=
 =?utf-8?B?amhIamloS1B1SEd1MEtCb2lwVVoxeklLSVp4RWJhcVdjY1RiUWhBRGZnSk1r?=
 =?utf-8?B?SXNYck9DWFhocUx3c3gxbkI4aS9FZS9TM0RtVUxtcEg0U0VHQndOUTBTOFZz?=
 =?utf-8?B?b0hLcC83TTJsUnZNazZwd1FPd2JFTzlsMjVTUlZFOHlQZEZXdEM3MGF4MVd6?=
 =?utf-8?B?Q0dOOWdDOStWaDFOQ0pzYUJpNHd1Q25QNkVWSCt6NVFCWTNqNVl5NGZLYXIz?=
 =?utf-8?B?ekFCMUdTcGh0dWE2dUdpck55WDdDZEQwUlROMUpMSElhczhyMlUrWTBjdWVY?=
 =?utf-8?B?dmVTSC9lcHgrMmcySDU0akdUQWthaW5WNTMzemRxM1dhNkMzU0dtR09yRUZO?=
 =?utf-8?B?Ti95ZXR6Ni8xa0RrOUdaSTByY0FMWXByUXZTczhZSDBGL0JHQ2k3VHhJYjJv?=
 =?utf-8?B?dlVBeEVCZ0tHK2hWVmt3YThVQWxZM1hnZ05zbmtLdWJJcGE4a0diVCtkWEc3?=
 =?utf-8?B?aDdyWVMyYjNyeXpMSEd5L1pzNld3Q2Q5MGpEbFVac1NWdU8zS3d1NSsvVjNR?=
 =?utf-8?B?cjFnRnYrVVZ3b0hOYVF1VkhrT0FpUFd3czlVa0lNZHVLV3RiYlVWeHIxUk0w?=
 =?utf-8?B?V3lsakV6ZEk2a01VanVPTEtxL2NmWThuZ0JJTU9XRGJXL3UyRXFpRmJteEls?=
 =?utf-8?B?cWdDQkVUNXJiSjBaQk5uSXFsMWpmZmpMcWF1a21GazV0ZXV1ZGRuUWFuK21H?=
 =?utf-8?B?NzJyMEthTnVnYXg3c2xTRzMzYlFQSm4zTjhacVdhWWZZSUc2UlhXODRBUHNz?=
 =?utf-8?B?Q3dreFNDc0x5MTU4SFBoTTFJSUJmVTFOREVlM2NDSXdaMTJzdWZKcm1Cdm5y?=
 =?utf-8?B?SzNkaEE2ZDc2VnFuRTlNTU5LWGZ6d3oyd1RWbCtVMU9lVmZ4Qis4Wm1DeUFD?=
 =?utf-8?B?WWI5ZVFoV09KU0ZVUXNWQ0o3bGp5OXh1VG5ybS84a285d0ZKcURHLzJuS0JS?=
 =?utf-8?B?WTlxMTgxREtpYU5KTThLWHd2QU4xRW5kZ0p3V3FNZGhCM01obEZ1TVJCUkEw?=
 =?utf-8?B?YU1KQVU5MUZIaHp6empyc3d5ZXNXakhLYWNpRjh6U3ZWTTIrSWVsMXptcWEv?=
 =?utf-8?B?am1pUjMvVy9JTGpESG9jbFN5alNxQmV3SW56bHduVGgvbS9Ud21TREsrcDRr?=
 =?utf-8?B?dEI5dThUMWxiR3Q5WmVDZmlxVHgvNW85UWlvZUNlSnZtNTdHL0pQTXh0L21i?=
 =?utf-8?B?SUtTUW9jRlFIeG5UQURyOGpQcUtkVDlGaGZUWEg1elYzbEo3ZFQ0WVhsV2lq?=
 =?utf-8?B?Q2tyL1ErSTdBM0N0aUJLa0VlQmZ5SU1kR1YwUDhMd3JNdXd0cXl3NWJUTHVM?=
 =?utf-8?Q?v+krhUPE8P574trivqliYWYn8FD0ND6SymO3Tnu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19aaafc8-6827-4304-7b59-08d95cc2de29
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 12:23:47.2566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Si3MwN+hmv/pp73idfJMXX7Dxw8QaVu8XhF/ectFGXsNzMmy/rynNOblZ0ICdZnGtQaTSHSBlXIMrMd/c2L+Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4351

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
-OBJS += x86_emulate/0f01.o x86_emulate/0fae.o
+OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
 
 # x86-emulate.c will be implicit for both
 x86-emulate.o x86-emulate-cov.o: x86_emulate/x86_emulate.c $(x86_emulate.h) x86_emulate/private.h
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -251,7 +251,7 @@ xop.h avx512f.h: simd-fma.c
 endif # 32-bit override
 
 OBJS := x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
-OBJS += x86_emulate/0f01.o x86_emulate/0fae.o
+OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
 
 $(TARGET): $(OBJS)
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/0fc7.c
@@ -0,0 +1,210 @@
+/******************************************************************************
+ * 0fc7.c - helper for x86_emulate.c
+ *
+ * Generic x86 (32-bit and 64-bit) instruction decoder and emulator.
+ *
+ * Copyright (c) 2005-2007 Keir Fraser
+ * Copyright (c) 2005-2007 XenSource Inc.
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
+/* Avoid namespace pollution. */
+#undef cmpxchg
+
+int x86emul_0fc7(struct x86_emulate_state *s,
+                 struct cpu_user_regs *regs,
+                 struct operand *dst,
+                 struct x86_emulate_ctxt *ctxt,
+                 const struct x86_emulate_ops *ops,
+                 mmval_t *mmvalp)
+{
+    int rc;
+
+    if ( s->ea.type == OP_REG )
+    {
+        bool __maybe_unused carry;
+
+        switch ( s->modrm_reg & 7 )
+        {
+        default:
+            return X86EMUL_UNRECOGNIZED;
+
+        case 6: /* rdrand */
+#ifdef HAVE_AS_RDRAND
+            generate_exception_if(s->vex.pfx >= vex_f3, X86_EXC_UD);
+            host_and_vcpu_must_have(rdrand);
+            *dst = s->ea;
+            switch ( s->op_bytes )
+            {
+            case 2:
+                asm ( "rdrand %w0" ASM_FLAG_OUT(, "; setc %1")
+                      : "=r" (dst->val), ASM_FLAG_OUT("=@ccc", "=qm") (carry) );
+                break;
+            default:
+# ifdef __x86_64__
+                asm ( "rdrand %k0" ASM_FLAG_OUT(, "; setc %1")
+                      : "=r" (dst->val), ASM_FLAG_OUT("=@ccc", "=qm") (carry) );
+                break;
+            case 8:
+# endif
+                asm ( "rdrand %0" ASM_FLAG_OUT(, "; setc %1")
+                      : "=r" (dst->val), ASM_FLAG_OUT("=@ccc", "=qm") (carry) );
+                break;
+            }
+            regs->eflags &= ~EFLAGS_MASK;
+            if ( carry )
+                regs->eflags |= X86_EFLAGS_CF;
+            break;
+#else
+            return X86EMUL_UNIMPLEMENTED;
+#endif
+
+        case 7: /* rdseed / rdpid */
+            if ( s->vex.pfx == vex_f3 ) /* rdpid */
+            {
+                uint64_t msr_val;
+
+                generate_exception_if(s->ea.type != OP_REG, X86_EXC_UD);
+                vcpu_must_have(rdpid);
+                fail_if(!ops->read_msr);
+                if ( (rc = ops->read_msr(MSR_TSC_AUX, &msr_val,
+                                         ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                *dst = s->ea;
+                dst->val = msr_val;
+                dst->bytes = 4;
+                break;
+            }
+#ifdef HAVE_AS_RDSEED
+            generate_exception_if(s->vex.pfx >= vex_f3, X86_EXC_UD);
+            host_and_vcpu_must_have(rdseed);
+            *dst = s->ea;
+            switch ( s->op_bytes )
+            {
+            case 2:
+                asm ( "rdseed %w0" ASM_FLAG_OUT(, "; setc %1")
+                      : "=r" (dst->val), ASM_FLAG_OUT("=@ccc", "=qm") (carry) );
+                break;
+            default:
+# ifdef __x86_64__
+                asm ( "rdseed %k0" ASM_FLAG_OUT(, "; setc %1")
+                      : "=r" (dst->val), ASM_FLAG_OUT("=@ccc", "=qm") (carry) );
+                break;
+            case 8:
+# endif
+                asm ( "rdseed %0" ASM_FLAG_OUT(, "; setc %1")
+                      : "=r" (dst->val), ASM_FLAG_OUT("=@ccc", "=qm") (carry) );
+                break;
+            }
+            regs->eflags &= ~EFLAGS_MASK;
+            if ( carry )
+                regs->eflags |= X86_EFLAGS_CF;
+            break;
+#endif
+        }
+    }
+    else
+    {
+        union {
+            uint32_t u32[2];
+            uint64_t u64[2];
+        } *old, *aux;
+
+        /* cmpxchg8b/cmpxchg16b */
+        generate_exception_if((s->modrm_reg & 7) != 1, X86_EXC_UD);
+        fail_if(!ops->cmpxchg);
+        if ( s->rex_prefix & REX_W )
+        {
+            host_and_vcpu_must_have(cx16);
+            generate_exception_if(!is_aligned(s->ea.mem.seg, s->ea.mem.off, 16,
+                                              ctxt, ops),
+                                  X86_EXC_GP, 0);
+            s->op_bytes = 16;
+        }
+        else
+        {
+            vcpu_must_have(cx8);
+            s->op_bytes = 8;
+        }
+
+        old = container_of(&mmvalp->ymm[0], typeof(*old), u64[0]);
+        aux = container_of(&mmvalp->ymm[2], typeof(*aux), u64[0]);
+
+        /* Get actual old value. */
+        if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, old, s->op_bytes,
+                             ctxt)) != X86EMUL_OKAY )
+            goto done;
+
+        /* Get expected value. */
+        if ( s->op_bytes == 8 )
+        {
+            aux->u32[0] = regs->eax;
+            aux->u32[1] = regs->edx;
+        }
+        else
+        {
+            aux->u64[0] = regs->r(ax);
+            aux->u64[1] = regs->r(dx);
+        }
+
+        if ( memcmp(old, aux, s->op_bytes) )
+        {
+        cmpxchgNb_failed:
+            /* Expected != actual: store actual to rDX:rAX and clear ZF. */
+            regs->r(ax) = s->op_bytes == 8 ? old->u32[0] : old->u64[0];
+            regs->r(dx) = s->op_bytes == 8 ? old->u32[1] : old->u64[1];
+            regs->eflags &= ~X86_EFLAGS_ZF;
+        }
+        else
+        {
+            /*
+             * Expected == actual: Get proposed value, attempt atomic cmpxchg
+             * and set ZF if successful.
+             */
+            if ( s->op_bytes == 8 )
+            {
+                aux->u32[0] = regs->ebx;
+                aux->u32[1] = regs->ecx;
+            }
+            else
+            {
+                aux->u64[0] = regs->r(bx);
+                aux->u64[1] = regs->r(cx);
+            }
+
+            switch ( rc = ops->cmpxchg(s->ea.mem.seg, s->ea.mem.off, old, aux,
+                                       s->op_bytes, s->lock_prefix, ctxt) )
+            {
+            case X86EMUL_OKAY:
+                regs->eflags |= X86_EFLAGS_ZF;
+                break;
+
+            case X86EMUL_CMPXCHG_FAILED:
+                rc = X86EMUL_OKAY;
+                goto cmpxchgNb_failed;
+
+            default:
+                goto done;
+            }
+        }
+    }
+
+    rc = X86EMUL_OKAY;
+
+ done:
+    return rc;
+}
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -1,2 +1,3 @@
 obj-y += 0f01.o
 obj-y += 0fae.o
+obj-y += 0fc7.o
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -308,6 +308,14 @@ struct x86_emulate_state {
 #endif
 };
 
+typedef union {
+    uint64_t mmx;
+    uint64_t __attribute__ ((aligned(16))) xmm[2];
+    uint64_t __attribute__ ((aligned(32))) ymm[4];
+    uint64_t __attribute__ ((aligned(64))) zmm[8];
+    uint32_t data32[16];
+} mmval_t;
+
 struct x86_fxsr {
     uint16_t fcw;
     uint16_t fsw;
@@ -558,6 +566,12 @@ int x86emul_0fae(struct x86_emulate_stat
                  struct x86_emulate_ctxt *ctxt,
                  const struct x86_emulate_ops *ops,
                  enum x86_emulate_fpu_type *fpu_type);
+int x86emul_0fc7(struct x86_emulate_state *s,
+                 struct cpu_user_regs *regs,
+                 struct operand *dst,
+                 struct x86_emulate_ctxt *ctxt,
+                 const struct x86_emulate_ops *ops,
+                 mmval_t *mmvalp);
 
 static inline bool is_aligned(enum x86_segment seg, unsigned long offs,
                               unsigned int size, struct x86_emulate_ctxt *ctxt,
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -687,17 +687,9 @@ struct x87_env32 {
 };
 #endif
 
-typedef union {
-    uint64_t mmx;
-    uint64_t __attribute__ ((aligned(16))) xmm[2];
-    uint64_t __attribute__ ((aligned(32))) ymm[4];
-    uint64_t __attribute__ ((aligned(64))) zmm[8];
-    uint32_t data32[16];
-} mmval_t;
-
 /*
- * While proper alignment gets specified above, this doesn't get honored by
- * the compiler for automatic variables. Use this helper to instantiate a
+ * While proper alignment gets specified in mmval_t, this doesn't get honored
+ * by the compiler for automatic variables. Use this helper to instantiate a
  * suitably aligned variable, producing a pointer to access it.
  */
 #define DECLARE_ALIGNED(type, var)                                        \
@@ -7681,174 +7673,8 @@ x86_emulate(
 #endif /* X86EMUL_NO_SIMD */
 
     case X86EMUL_OPC(0x0f, 0xc7): /* Grp9 */
-    {
-        union {
-            uint32_t u32[2];
-            uint64_t u64[2];
-        } *old, *aux;
-
-        if ( ea.type == OP_REG )
-        {
-            bool __maybe_unused carry;
-
-            switch ( modrm_reg & 7 )
-            {
-            default:
-                goto unrecognized_insn;
-
-            case 6: /* rdrand */
-#ifdef HAVE_AS_RDRAND
-                generate_exception_if(rep_prefix(), EXC_UD);
-                host_and_vcpu_must_have(rdrand);
-                dst = ea;
-                switch ( op_bytes )
-                {
-                case 2:
-                    asm ( "rdrand %w0" ASM_FLAG_OUT(, "; setc %1")
-                          : "=r" (dst.val), ASM_FLAG_OUT("=@ccc", "=qm") (carry) );
-                    break;
-                default:
-# ifdef __x86_64__
-                    asm ( "rdrand %k0" ASM_FLAG_OUT(, "; setc %1")
-                          : "=r" (dst.val), ASM_FLAG_OUT("=@ccc", "=qm") (carry) );
-                    break;
-                case 8:
-# endif
-                    asm ( "rdrand %0" ASM_FLAG_OUT(, "; setc %1")
-                          : "=r" (dst.val), ASM_FLAG_OUT("=@ccc", "=qm") (carry) );
-                    break;
-                }
-                _regs.eflags &= ~EFLAGS_MASK;
-                if ( carry )
-                    _regs.eflags |= X86_EFLAGS_CF;
-                break;
-#else
-                goto unimplemented_insn;
-#endif
-
-            case 7: /* rdseed / rdpid */
-                if ( repe_prefix() ) /* rdpid */
-                {
-                    generate_exception_if(ea.type != OP_REG, EXC_UD);
-                    vcpu_must_have(rdpid);
-                    fail_if(!ops->read_msr);
-                    if ( (rc = ops->read_msr(MSR_TSC_AUX, &msr_val,
-                                             ctxt)) != X86EMUL_OKAY )
-                        goto done;
-                    dst = ea;
-                    dst.val = msr_val;
-                    dst.bytes = 4;
-                    break;
-                }
-#ifdef HAVE_AS_RDSEED
-                generate_exception_if(rep_prefix(), EXC_UD);
-                host_and_vcpu_must_have(rdseed);
-                dst = ea;
-                switch ( op_bytes )
-                {
-                case 2:
-                    asm ( "rdseed %w0" ASM_FLAG_OUT(, "; setc %1")
-                          : "=r" (dst.val), ASM_FLAG_OUT("=@ccc", "=qm") (carry) );
-                    break;
-                default:
-# ifdef __x86_64__
-                    asm ( "rdseed %k0" ASM_FLAG_OUT(, "; setc %1")
-                          : "=r" (dst.val), ASM_FLAG_OUT("=@ccc", "=qm") (carry) );
-                    break;
-                case 8:
-# endif
-                    asm ( "rdseed %0" ASM_FLAG_OUT(, "; setc %1")
-                          : "=r" (dst.val), ASM_FLAG_OUT("=@ccc", "=qm") (carry) );
-                    break;
-                }
-                _regs.eflags &= ~EFLAGS_MASK;
-                if ( carry )
-                    _regs.eflags |= X86_EFLAGS_CF;
-                break;
-#endif
-            }
-            break;
-        }
-
-        /* cmpxchg8b/cmpxchg16b */
-        generate_exception_if((modrm_reg & 7) != 1, EXC_UD);
-        fail_if(!ops->cmpxchg);
-        if ( rex_prefix & REX_W )
-        {
-            host_and_vcpu_must_have(cx16);
-            generate_exception_if(!is_aligned(ea.mem.seg, ea.mem.off, 16,
-                                              ctxt, ops),
-                                  EXC_GP, 0);
-            op_bytes = 16;
-        }
-        else
-        {
-            vcpu_must_have(cx8);
-            op_bytes = 8;
-        }
-
-        old = container_of(&mmvalp->ymm[0], typeof(*old), u64[0]);
-        aux = container_of(&mmvalp->ymm[2], typeof(*aux), u64[0]);
-
-        /* Get actual old value. */
-        if ( (rc = ops->read(ea.mem.seg, ea.mem.off, old, op_bytes,
-                             ctxt)) != X86EMUL_OKAY )
-            goto done;
-
-        /* Get expected value. */
-        if ( !(rex_prefix & REX_W) )
-        {
-            aux->u32[0] = _regs.eax;
-            aux->u32[1] = _regs.edx;
-        }
-        else
-        {
-            aux->u64[0] = _regs.r(ax);
-            aux->u64[1] = _regs.r(dx);
-        }
-
-        if ( memcmp(old, aux, op_bytes) )
-        {
-        cmpxchgNb_failed:
-            /* Expected != actual: store actual to rDX:rAX and clear ZF. */
-            _regs.r(ax) = !(rex_prefix & REX_W) ? old->u32[0] : old->u64[0];
-            _regs.r(dx) = !(rex_prefix & REX_W) ? old->u32[1] : old->u64[1];
-            _regs.eflags &= ~X86_EFLAGS_ZF;
-        }
-        else
-        {
-            /*
-             * Expected == actual: Get proposed value, attempt atomic cmpxchg
-             * and set ZF if successful.
-             */
-            if ( !(rex_prefix & REX_W) )
-            {
-                aux->u32[0] = _regs.ebx;
-                aux->u32[1] = _regs.ecx;
-            }
-            else
-            {
-                aux->u64[0] = _regs.r(bx);
-                aux->u64[1] = _regs.r(cx);
-            }
-
-            switch ( rc = ops->cmpxchg(ea.mem.seg, ea.mem.off, old, aux,
-                                       op_bytes, lock_prefix, ctxt) )
-            {
-            case X86EMUL_OKAY:
-                _regs.eflags |= X86_EFLAGS_ZF;
-                break;
-
-            case X86EMUL_CMPXCHG_FAILED:
-                rc = X86EMUL_OKAY;
-                goto cmpxchgNb_failed;
-
-            default:
-                goto done;
-            }
-        }
-        break;
-    }
+        rc =  x86emul_0fc7(state, &_regs, &dst, ctxt, ops, mmvalp);
+        goto dispatch_from_helper;
 
     case X86EMUL_OPC(0x0f, 0xc8) ... X86EMUL_OPC(0x0f, 0xcf): /* bswap */
         dst.type = OP_REG;


