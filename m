Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E643E90A7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 14:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165979.303143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnGf-0006cA-Ux; Wed, 11 Aug 2021 12:23:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165979.303143; Wed, 11 Aug 2021 12:23:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnGf-0006YP-Qn; Wed, 11 Aug 2021 12:23:33 +0000
Received: by outflank-mailman (input) for mailman id 165979;
 Wed, 11 Aug 2021 12:23:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDnGe-0006Sk-5X
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 12:23:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef5a70e6-fa9e-11eb-a06d-12813bfff9fa;
 Wed, 11 Aug 2021 12:23:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-4fawh-lRMiGodYJoj2iwAw-2; Wed, 11 Aug 2021 14:23:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4351.eurprd04.prod.outlook.com (2603:10a6:803:49::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 12:23:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 12:23:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 12:23:26 +0000
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
X-Inumbo-ID: ef5a70e6-fa9e-11eb-a06d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628684609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egYmm6Rdb6BBn3/2r9woL+JT7Fq3SyhFNINnv8zofDY=;
	b=YfeuTk8IMADE718jp5dweF7L/jl6PRbIjVY+6VVw/LQ7eulRvK9/vQuSxBR779/DPxXHi0
	8Qo1PsEP/69iCR6JukvQnCHnauoYGfejmdCdX1yXsaLdLdkooCCO93DdKdlqxyaxB3Ajs2
	Wwp+r5CY2h1u7bxkWxqbAJvoxXA3JLo=
X-MC-Unique: 4fawh-lRMiGodYJoj2iwAw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBE7zlGMZUnjglt8w/7ZpcMxoarQIhQlwbdaV1SEgCSFOQr8qQ70WMQdK1FA9CqJ/uoXpjui/kuf0dlI86DxWtkD9If4que/xoqcx6N9J6IstYX3duxnK/7sPAbhAc5A1b5d9g3NbaI8ZFVJ2OM7NdXrZScj/ErXcpQXj/DrkpfAS4u79zx87fovVC/Nlu2i20cM9IOz8ymlfc+BSBIL8Apa1bLBhRtyXdV9KfSC5/WmU1m6ORep+XJ1U1G9vxETiEJPnrrctSyHgf6JZQKcu3xuH1OhcZUcf4PgXduEIsZY/ofQ41D0svQM9v2W/gmhZ0aOVH/+Pp6pvLfFuMtl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egYmm6Rdb6BBn3/2r9woL+JT7Fq3SyhFNINnv8zofDY=;
 b=j9rQqVizuh9mwtm4H1BOTOkthSrVEO6oNBWdonVKkkrpktoW4owgeGiJyMXl1paddLYxAs7TOlEFNq2SnQg1nXpZjLW26DHH3N3dLM2zjcProH2ha8j5JRM/wfgLwLy4g+zfM5tDkoC1PpJ4HD1YVVm3RAPenmN9WMBjaK3XxC1mEYFAclkB0g0EUiqGmlb05IJ/j6soYyMKJOqz31GZ3DKMWr+PJNuiu6vnWWxqDwBvVepCe9//XYIFVu2qaYcuNtZDezRdfmNB3WD5Dr6Z2n6gUZjIT87WmNBoriv9XvWyZ2NYNo3FqctyyhXb3vTyxUFt7uASbdWDJRuDX0ayFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 2/7] x86emul: split off opcode 0fae handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bdc58964-e2a8-af36-1653-41c7146bdfc9@suse.com>
Message-ID: <9f73d8a9-56a1-7004-7933-48597201565a@suse.com>
Date: Wed, 11 Aug 2021 14:23:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <bdc58964-e2a8-af36-1653-41c7146bdfc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0P190CA0015.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa0363c0-6128-4339-bedb-08d95cc2d1cf
X-MS-TrafficTypeDiagnostic: VI1PR04MB4351:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4351CE807173FE1579052B55B3F89@VI1PR04MB4351.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tvVCrCe7oCWp4dNOb/ipol3QRIv4VnyX2KSiY+U2/cexuwO+9TCe2x27AYnUTBsg2YJB19lktNk6TJ85u0dAHWLHbD7ffQ9R5LJI0oXfCgDU9P8Eu/lXyDmAuExMk5Iy5ZYzp7VxtaUaMuTZBcy5o+WLjaXOLVI9GV1GsgsVHMFTZJXFhxwVH+JCIwR5R/XiFJOnt5JcMbNFR3UzOufq2ngaTUvKFNiI1FwEFuWcrj8Xyq2RZQ/DmNLvWh5SwKl2lUJ+4C8LQLJ4KMvSPupn59XqOflwG5sm0GSy2uBJftLWtlQgNiqujTSJg1FN8p4OdMM7M5lS75kgZzaZDuCh7iXoHcsR06609iW8PpWbNZQEWN3xTs/TDrkG2wu0hpYaAJ2DlRqSLCV25EppjfOP/DlcenMLAhVlqwzlfNhHKtZggdtfD01286YTGqlisGmaHJiAf/GztBZ4xd3RE2uHrUjLjKO6RNVx2mLhE83g4v67kWOxcG3qFqjvLE/w+B8BL5MJ/829Sf4Gz1qjKDtGdyZPwAxA/oNf4TzwjJ5lHhIrF0fFIqjOReQ3JpIlzc7Zegfb7C2Qs/oq8mpUB4AmRTfA46iD97WDNwvfc8LlqiOER/ZAjZNeglPNzg/xsj8q/Zw2bFeGdK7+xcBFkkoUNeEsMWr1zphFvJcNuTQCTKfo5LfhfJVIpgU93KgNlg+5UMwE9Pqz4c2lSIznV6nVscakXXhUgyadED7saL3V4BFaX0FkzHhFwnZrtZbyCQTGy9JJHW0XA2bzLw+mqUClSA9FLE5Cr7VhxlG3wZQjG8Nq/z46gNcTXfCy4e5diLn41Wzl7HEYiS6COyu5bZJhCQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(8936002)(316002)(16576012)(2616005)(956004)(8676002)(5660300002)(6916009)(66946007)(36756003)(30864003)(31686004)(2906002)(86362001)(31696002)(186003)(26005)(66556008)(83380400001)(54906003)(508600001)(4326008)(38100700002)(66476007)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHRRUGZybDB4ZVpvN0wrTU43cngrMVI5SFhvNlNNRmkxUDIrV01yWWw4NW9l?=
 =?utf-8?B?K3hlR0F5RFk0WXJ6SUJ1cGhnQW5nUnFnMkZ4NWljOWY2ZStCRVdFNm1iWnZV?=
 =?utf-8?B?ZFJLN1dHazRCRit0elFwb2twSnhRSG1tNlUwMWE5bUlHZkZhWmJ0NzJRc0J6?=
 =?utf-8?B?bzRpdGpiWlJVZUNyeHkzdlFrWWRuYzhlZG9HNndIbjJYTTd5cUJrVnJBeldN?=
 =?utf-8?B?TTNwZzdkZkxoRnhvN1JnMktXOTdkQlNsTDVJWUVMUWZIVjVOUUFSSzJJc2Vk?=
 =?utf-8?B?OHdCbW9yZy9nZ1dtQUhudVVhc0tOTC90ZERQYXdnSUd5SWRRSzFoV2MvT3pt?=
 =?utf-8?B?MHhhdGtnS2hwQ2lsVkEvNmhydTBBVVg5dklFNVBrOU1LdDVndG85NkNDRktX?=
 =?utf-8?B?NVZObEJCQktEYmxyQ3BReW1aU1B3N0R0MUoxUVpaS1pBUi9veER0ZGplUjNZ?=
 =?utf-8?B?OU5SNDNsaDlEL0tsZE4zU2ova0RReE9yOU1Gb0kxejBkK1NUNEFZYXg5Z0tE?=
 =?utf-8?B?R3F4U0ljZ1hObXVuWTdNZjlFclZpNHE3d1pFNG5PY1M2TEIxSVRLT3Y4aW9K?=
 =?utf-8?B?d1RJQ2lhSVZXWloxWkVzSFQycElIdUl0TWp0Vy9PWUhOT21zcXhlRHJFNTJD?=
 =?utf-8?B?cU4vNkdMVXlwOS9nM2ZLUHZkVXNTdWxnaE5RZEJUWTdTeWRqZ1dWdy9sb3Ji?=
 =?utf-8?B?RUx1OVBmUnRXb0FTUllBUmk5M0phNXVYTTZ2Y2ZCMUtEUzZVSEs2eTFDYTFD?=
 =?utf-8?B?anE3TG1KWmJNbUVGeVhTYkczQmNpODYrSHlLYkhIZEU3V2tLc3lReHhya0U5?=
 =?utf-8?B?dGVBTVM3eldhRTJ6RG5Na2Y0MHRVQnRXTTRQSzB1eVo5MDhrbS8wRnN2Wnpr?=
 =?utf-8?B?UEtHZDQzVHRHMzhDZ3ZSRW5ad2JGTG9mWEFXYi8vR0RuRTN6cDBxUE0yd1R6?=
 =?utf-8?B?bjkxakdBRjZYQTlYam01TytVWmV5Vk9hNTFqeTBoRlBDRzdxR0xONGNlcFRw?=
 =?utf-8?B?aTNuZDRIendzS3hvaDZDbzlQMUl4T0tKMmtQN3YvdFErM21RWlBQUjlnNG1t?=
 =?utf-8?B?VUtidGlIc2YxaW0vZWE0ayswdGlFdnFkRVp2U1hTN0JpQTUvcU9CQVJGVlkx?=
 =?utf-8?B?QnBZN25KR2JnMWFiNGRvZ2dkbnIyOEp5UG5RWVlzUjJ6OXpwa2RlOUI2NUdL?=
 =?utf-8?B?d1VKWk9LcjdJMWg5akVBY2Q4aUZlRzNWd3o3aG1MTnkyWVVJVXIvRVRqUnlJ?=
 =?utf-8?B?QmpaU25oWjA4anB6MWdreVpxTEtWNlp6NENLS0NGb05Ka2U3dG5lMVpVOEFh?=
 =?utf-8?B?UDFZZitMZnFtbVFPb25iVDVIRXkxV0taYUJueDUwdG5IMDd3bGRMdmFOTkgw?=
 =?utf-8?B?eGs2NlBCbEh3cll4Ui9KR29kemdxSUs3Q1pqZUxZSU5JejAzRDZHdkZFNmk4?=
 =?utf-8?B?UGdTc3VVOElZRXNzYWk3TFFMV1ByVmw1V0doeUVxZTZVT2M4OTdvMlkxbWtB?=
 =?utf-8?B?VHBTV3k4cXNRTElrNFV6KzF6Y0Y5K0VwVmNScHZUeEovQy9IdXJrUVdxOTJD?=
 =?utf-8?B?WGt4cEtMNjVqRWRrN3ZIWDF0ZEM0VTk1dVVkbUJsUFR6Wlc1a21sV0JhQTZJ?=
 =?utf-8?B?QVg1YWFUR3FUZlRXZnRFUkVZVG9EMnVka1ZYRGVHaUdxeFN1YlFWY0VUbXo0?=
 =?utf-8?B?TFJOQklMWVI4RE1leEwrby9ON2dJN1BEcysxZFZNYktzTEtmMndkSjVGT0lq?=
 =?utf-8?Q?gmcGi+x5FmC0eu/8AKPICZVtRgTEq12fYmelvmK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0363c0-6128-4339-bedb-08d95cc2d1cf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 12:23:26.4398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CP/VIA5UByil8OkSAx5kJMGcznv6rPWcMrxIgrh4liARRerDnIRL91oLyekSF9F4kfogyugfRA8vJhemWp7O5g==
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
@@ -7434,173 +7370,14 @@ x86_emulate(
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
@@ -10516,7 +10293,7 @@ x86_emulate(
         goto unrecognized_insn;
 
     default:
-    unimplemented_insn:
+    unimplemented_insn: __maybe_unused;
         rc = X86EMUL_UNIMPLEMENTED;
         goto done;
     unrecognized_insn:


