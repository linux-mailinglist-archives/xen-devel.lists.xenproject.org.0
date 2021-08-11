Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FBC3E90BA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 14:24:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165993.303165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnHP-0007pQ-P6; Wed, 11 Aug 2021 12:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165993.303165; Wed, 11 Aug 2021 12:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnHP-0007lW-LM; Wed, 11 Aug 2021 12:24:19 +0000
Received: by outflank-mailman (input) for mailman id 165993;
 Wed, 11 Aug 2021 12:24:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDnHO-0007lG-NM
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 12:24:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a60dc70b-20ff-48e3-9e6f-73e34d250243;
 Wed, 11 Aug 2021 12:24:12 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-XK7VwbYfN7WEqhNEI6A-kg-1; Wed, 11 Aug 2021 14:24:09 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3390.eurprd04.prod.outlook.com (2603:10a6:803:9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 12:24:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 12:24:07 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3PR09CA0008.eurprd09.prod.outlook.com (2603:10a6:102:b7::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13 via Frontend Transport; Wed, 11 Aug 2021 12:24:07 +0000
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
X-Inumbo-ID: a60dc70b-20ff-48e3-9e6f-73e34d250243
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628684651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jGpfVZXELTSVn15kpuMDgT5b/YsWYsiBqFOcD7LjBHw=;
	b=EnQF0uT8MPn7c+9u9vgirhoeEmEFoz20SN29FO1W9L2cQrQXWiddhA5JMe+3x2vn/hoLps
	wj/8Ngj3BhiCMCpjB9m/x5c+DJdXLUpGzUi5El4HebmcNmkkmBmcxK5UC2Y4Hof/eSRuqP
	bZi324EtI4xdPT2JCFl2f0QpiPFncY4=
X-MC-Unique: XK7VwbYfN7WEqhNEI6A-kg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbNzVlPckRs9d79VdFsmbDfGs/g4IfA3LQ1B414trk4sjEUwZYWuOiXak0EHhrN+ZTw76hkJmhotMxzWgmvyj85nFtPnKhti640LGH+56Tys5318tKU8d6VF2yZZuEM4RIdKk9dS9hKO2M0RrrVbCmzXFhRupYt4kdEXT5kcmww/Q2svBnc34si5DNI4PfQgP81cYSLU4oLQbx5LhxgFd2ZZaZtOBb7QclQLzvIdhpets9442iN0foHmIXlJmXnd9JwyH2Lb6/Z+32zFJxmNpCi2Me33JDMmyrEcpaMFJjuzpZlMDaJqwB7umj78Mr25ZMj5hga+TA3ASXZZBjMM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGpfVZXELTSVn15kpuMDgT5b/YsWYsiBqFOcD7LjBHw=;
 b=nGDqP7y4E8fvGlChPMl52mRq43C98p4ByCqx93TeI3uVRYzlu9q851knQgcfiZQv4tigT7bgQywA/7s4iAjxbqycgUu30qh0/Ub9JV4h3va/n0u/m9S+axZd4WnKbMOCIi9JDP/pW+gnP+52mjiYDQLCzvmVM1ht7iC3rSwbNhpoZ6DNvDa/ALtBupsv9Qy7yqbp68RkP/yg+mjRYcPOLeSS2rWUI4t2fpANtNGaBJ8Hw1EWBA4grjgVo3ZyaLT8z7FYQscqdfKw9GgFrH2k9zMqaZogKaRtfLEI3f2XvNSI9YauR8uRT5kL3a2R3uPzr9sQk2VFfCRDdkBxXwciOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 4/7] x86emul: split off FPU opcode handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bdc58964-e2a8-af36-1653-41c7146bdfc9@suse.com>
Message-ID: <12b26ef4-540c-f453-c17d-d50dbdcef210@suse.com>
Date: Wed, 11 Aug 2021 14:24:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <bdc58964-e2a8-af36-1653-41c7146bdfc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0008.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f188e2ef-0ff9-4a7b-7c48-08d95cc2ea3f
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3390:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB33901DDB3E93906B1FFB2F88B3F89@VI1PR0402MB3390.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g2JMQ4RSe7/RbNY2E8hsYBe31KQo1IilzAPlwYNAwkTTKwWz6f/ts2FGziQ8xCsvh+BN5PSE/VCVWXi2CROMePZrUEvmayPy9XjSZ63D90YgQ8nAXLHa7Dd4reGyeO6UhuSVle2AE63Y9CuXmRgQ/tcTqctoOiGX1VMCSUt4klFQmcLA2iEMmqyepWvfn9zXXosZWGwGvA5EC//7Csh4+5/IHWjuCM1/bwMoH5SR1xU3fa/cE34KhBYSDSkeIRewhvMcYSI4Hp/UTkc5RHJIeM6gMwFoxz+T7NcQO5Vus47sc8NI2tN88EeBSmwPr3nrTCWZm27oVeigwvX3OFOGbb4XO6srL+ABjpLBaqPSiz2DcuduyTxBm8VmMVJk1RAbA8uYcPVt2gKYK6wu37jBinMDo5FjTRD/nX18O0JbQh+HM1TuyoOh1zjMVucSCP1/NodoFUXOoQBljvSGPsy8DoH5Uso/72Oe7bggU+jgKg9SbcgeyZju6NsC5qRF7Sx76hQ03qI2SCI8ZiAbYdHcaOf2+GLkrjZuinNsDeotUCdEZd3wPSyfd4wRK0YK1il8gOpC36WBZ8fo3wAXvg5PLBKiTeRjfMV5XM8W4DNQ2AA1aCkB1c6fOS1CqVnesJxPR2p+wJNabWhhaVJ/xdSYWVIpxDfKCwsIxsiSCAdRA2mmbg20aH3+MYB0aBA6DOKmCj5Uhpc2aDOpB8MzE/AxJXsI/I1y+tU3PnYucMNxpWSYtDiBE46GxLCqSyo6f6Orw7A2YYLuvc8pXor37GVcyTSQCkKpQ1+iepl8misxY/wxycr6Fb/2pOgAf+YPGwXj6ZNgrFFuboGYbAVt1GgE9VmD44Y5zqp0RP2BOGybCLE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(396003)(39860400002)(136003)(346002)(30864003)(31686004)(83380400001)(8936002)(2616005)(6486002)(956004)(16576012)(31696002)(36756003)(316002)(6666004)(86362001)(66946007)(478600001)(38100700002)(66556008)(4326008)(54906003)(5660300002)(26005)(2906002)(6916009)(186003)(8676002)(66476007)(2004002)(45980500001)(43740500002)(559001)(579004)(127564004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEdpcDZ6SnFtNG5yN3ZLdkNYOE1pZFdRcGFXUnhVMjhJMlI1VjlIMTB5d01F?=
 =?utf-8?B?ZTgrMXZoWSt3OUUwSkpOWTdVOGpLVXF4RTNnNlNjWjlBUTEwTHlXMDduZWpG?=
 =?utf-8?B?LzA1YkpKSXdDTGdud0FNd0llNzB3UHl3blREMlZaai9yNWJzUFBQMENVYUlJ?=
 =?utf-8?B?dGFGN3JUQXM0OEsrM2lEZnM1UGdXeHZTdW9reGdtQ244T2IrVVR5NC92b0xw?=
 =?utf-8?B?QllDMm1ISjdvaTJNRkIwSXBwVGcrd3BOK2hhMXRHb25MRHliTnA2R3pSYWN4?=
 =?utf-8?B?TjlxYStCcGxYQUVhS1daUkYyNWM5b2dIMm01VHZIbmhVbk1yWGwxQXNqaGNM?=
 =?utf-8?B?aVJxTzNKZmhISElkR28ySG5YT2pBeEZoUjNoZTVndzIrWFNmZUFBWFBoZXpR?=
 =?utf-8?B?M0F0cDhWOG9sbktsd2NaQjJlVE5xdTBmcDlVZUEwQUZrWHJQdmg1UkhzNThz?=
 =?utf-8?B?VHVoajQ0WnU3WDhJR1loRzJ3OXl6YUplK0JlN0JqMzFaS2RXTWhxdkdDSDZs?=
 =?utf-8?B?Q25VQ0xtOVcyUHhaaUtCaXZiS25YRzJPZU11M0NEVEJYb2NrY0RWZjM4elZO?=
 =?utf-8?B?Y3FKaFVwbjE1Q0I5dFpIRkM1bVE4b2l1WGxjdk9LeWpiZEFjL0xlZy9SZWpK?=
 =?utf-8?B?L3pMYit4ZUVOVzFoYmpnanJoak9Xb1QrUlZuT1pJVmtWL0RoUTUyb3lQWjZJ?=
 =?utf-8?B?RU5JYkRBTFh3cFdYSU9KQm5LajUxb2FHSGZJSFA2WDEvM0pvRk91VG9kMFRE?=
 =?utf-8?B?eFJBREl3ZEk0MjNoaHN5WW05Nk1xSms1b04rTVlEakNaVittSE56Q0QrSEZN?=
 =?utf-8?B?dDk0N1V4Q1YvQUlTMEtVMnU2d0JIN2VGWDZnOGtnVThVU0UwaFcza3JGMk16?=
 =?utf-8?B?M2FoY0g2aEFIWjJkUzlKVUxGTEIweFpNTUJVWW5nWW5Gb2ptYnhJSFJUNFNZ?=
 =?utf-8?B?dXYyS0E5NWpaVFp5MXZ2SlBsM0tXTzVmQWtUTkpJMksvWUEyOHdheTVQTThu?=
 =?utf-8?B?b3JPZ3lFUW5ZUWdOczAwSnpsbkZDcVd5U2U0SnBsL2swY3lXY29TMFpUYml0?=
 =?utf-8?B?bWxIazBYQ3ZqN2ZQQzE2VElsT1NqcFp6NFRlNXFPalB4RFJXb1RpdEVNT3lt?=
 =?utf-8?B?d0J3REJPalhaaUIxcWFoaG5wVlEwNGZJaUU1elByQnNvYmtoanYvcmFYWTJu?=
 =?utf-8?B?VVFCczV3Q2hDNHJwek1NaWxHRE5KdUpkS2VnRE1SQWcwN1RQT0N4ajRVbTFo?=
 =?utf-8?B?eWthTUVxL3ZKSW05TTdSL0JEU0M3ZDFLVDQvNUQzYTBoc2loT0dTMGRKdHFo?=
 =?utf-8?B?TTRBT2pBZm5VS05uY1ZwSldJckJzME10UGJKWUFQQWI4dTN1dzJWM1NFc0lC?=
 =?utf-8?B?cmJKZHUrRnFzQjdkc001NWFSd2w0V1F2YWtwcWltYkc3QVk3K3d5Qm5jZmhi?=
 =?utf-8?B?b253TWdpK2pHTmErVkxSdlozSElUbjZLdnRmejBiWGppVDNFQ2dRUEwrdklj?=
 =?utf-8?B?VmdHdlRLWlpXajJaaWJwZW1SYUE5UEkxZGZxbG8ybWNGOWoyQ0s5Wks1dnlP?=
 =?utf-8?B?bThBMFJNQWZpS2xKL3EwUXVlbHZwVlFuVDFFZ1RBNEVUeFA3UFRJWEQxdlMz?=
 =?utf-8?B?WTYwMStzeExOWUdidVFDZlIxSm4rZFIvYmZzb3hMODk4VVdFVjJNd2tNbkNv?=
 =?utf-8?B?VEh2L1VINHB0Sk1jZmtqVWNQZVdUTitQS2Z2N0dHVFVxTU9tQlhUbEgzclpi?=
 =?utf-8?Q?vKZ3m0hzC37P/VNT+S5g7rSsx01n499BqSnX2ZE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f188e2ef-0ff9-4a7b-7c48-08d95cc2ea3f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 12:24:07.4724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z2cJ2yXyDH6uljseKKgcoz3NcPKnzeccaTedPhhhoJzLXvF+K71E9sykIiYg3ArsKugxzifc/z3lv4N3tQYL6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3390

Some of the helper functions/macros are needed only for this, and the
code is otherwise relatively independent of other parts of the emulator.

Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
by X86_EXC_* (such that EXC_* don't need to move as well; we want these
to be phased out anyway).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -36,6 +36,7 @@ x86_emulate.h := x86-emulate.h x86_emula
 
 OBJS := fuzz-emul.o x86-emulate.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
+OBJS += x86_emulate/fpu.o
 
 # x86-emulate.c will be implicit for both
 x86-emulate.o x86-emulate-cov.o: x86_emulate/x86_emulate.c $(x86_emulate.h) x86_emulate/private.h
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -252,6 +252,7 @@ endif # 32-bit override
 
 OBJS := x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
+OBJS += x86_emulate/fpu.o
 
 $(TARGET): $(OBJS)
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -29,12 +29,6 @@
 # define __OP          "r"  /* Operand Prefix */
 #endif
 
-#define get_stub(stb) ({                         \
-    assert(!(stb).addr);                         \
-    (void *)((stb).addr = (uintptr_t)(stb).buf); \
-})
-#define put_stub(stb) ((stb).addr = 0)
-
 uint32_t mxcsr_mask = 0x0000ffbf;
 struct cpuid_policy cp;
 
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -9,7 +9,6 @@
  *    Keir Fraser <keir@xen.org>
  */
 
-#include <xen/domain_page.h>
 #include <xen/err.h>
 #include <xen/event.h>
 #include <asm/x86_emulate.h>
@@ -26,21 +25,6 @@
 #define cpu_has_amd_erratum(nr) \
         cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
 
-#define get_stub(stb) ({                                        \
-    BUILD_BUG_ON(STUB_BUF_SIZE / 2 < MAX_INST_LEN + 1);         \
-    ASSERT(!(stb).ptr);                                         \
-    (stb).addr = this_cpu(stubs.addr) + STUB_BUF_SIZE / 2;      \
-    memset(((stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn)))) +  \
-           ((stb).addr & ~PAGE_MASK), 0xcc, STUB_BUF_SIZE / 2);        \
-})
-#define put_stub(stb) ({                                   \
-    if ( (stb).ptr )                                       \
-    {                                                      \
-        unmap_domain_page((stb).ptr);                      \
-        (stb).ptr = NULL;                                  \
-    }                                                      \
-})
-
 #define FXSAVE_AREA current->arch.fpu_ctxt
 
 #include "x86_emulate/x86_emulate.c"
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -1,3 +1,4 @@
 obj-y += 0f01.o
 obj-y += 0fae.o
 obj-y += 0fc7.o
+obj-$(CONFIG_HVM) += fpu.o
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/fpu.c
@@ -0,0 +1,491 @@
+/******************************************************************************
+ * x86_emulate.c
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
+#ifdef __XEN__
+# include <asm/amd.h>
+# define cpu_has_amd_erratum(nr) \
+         cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
+#else
+# define cpu_has_amd_erratum(nr) 0
+#endif
+
+/* Floating point status word definitions. */
+#define FSW_ES    (1U << 7)
+
+static inline bool fpu_check_write(void)
+{
+    uint16_t fsw;
+
+    asm ( "fnstsw %0" : "=am" (fsw) );
+
+    return !(fsw & FSW_ES);
+}
+
+#define emulate_fpu_insn_memdst(opc, ext, arg)                          \
+do {                                                                    \
+    /* ModRM: mod=0, reg=ext, rm=0, i.e. a (%rax) operand */            \
+    *insn_bytes = 2;                                                    \
+    memcpy(get_stub(stub),                                              \
+           ((uint8_t[]){ opc, ((ext) & 7) << 3, 0xc3 }), 3);            \
+    invoke_stub("", "", "+m" (arg) : "a" (&(arg)));                     \
+    put_stub(stub);                                                     \
+} while (0)
+
+#define emulate_fpu_insn_memsrc(opc, ext, arg)                          \
+do {                                                                    \
+    /* ModRM: mod=0, reg=ext, rm=0, i.e. a (%rax) operand */            \
+    memcpy(get_stub(stub),                                              \
+           ((uint8_t[]){ opc, ((ext) & 7) << 3, 0xc3 }), 3);            \
+    invoke_stub("", "", "=m" (dummy) : "m" (arg), "a" (&(arg)));        \
+    put_stub(stub);                                                     \
+} while (0)
+
+#define emulate_fpu_insn_stub(bytes...)                                 \
+do {                                                                    \
+    unsigned int nr_ = sizeof((uint8_t[]){ bytes });                    \
+    memcpy(get_stub(stub), ((uint8_t[]){ bytes, 0xc3 }), nr_ + 1);      \
+    invoke_stub("", "", "=m" (dummy) : "i" (0));                        \
+    put_stub(stub);                                                     \
+} while (0)
+
+#define emulate_fpu_insn_stub_eflags(bytes...)                          \
+do {                                                                    \
+    unsigned int nr_ = sizeof((uint8_t[]){ bytes });                    \
+    unsigned long tmp_;                                                 \
+    memcpy(get_stub(stub), ((uint8_t[]){ bytes, 0xc3 }), nr_ + 1);      \
+    invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),             \
+                _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),            \
+                [eflags] "+g" (regs->eflags), [tmp] "=&r" (tmp_)        \
+                : [mask] "i" (X86_EFLAGS_ZF|X86_EFLAGS_PF|X86_EFLAGS_CF)); \
+    put_stub(stub);                                                     \
+} while (0)
+
+int x86emul_fpu(struct x86_emulate_state *s,
+                struct cpu_user_regs *regs,
+                struct operand *dst,
+                struct operand *src,
+                struct x86_emulate_ctxt *ctxt,
+                const struct x86_emulate_ops *ops,
+                unsigned int *insn_bytes,
+                enum x86_emulate_fpu_type *fpu_type,
+#define fpu_type (*fpu_type) /* for get_fpu() */
+                struct stub_exn *stub_exn,
+#define stub_exn (*stub_exn) /* for invoke_stub() */
+                mmval_t *mmvalp)
+{
+    uint8_t b;
+    int rc;
+    struct x86_emulate_stub stub = {};
+
+    switch ( b = ctxt->opcode )
+    {
+        unsigned long dummy;
+
+    case 0x9b:  /* wait/fwait */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_wait);
+        emulate_fpu_insn_stub(b);
+        break;
+
+    case 0xd8: /* FPU 0xd8 */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xc0 ... 0xc7: /* fadd %stN,%st */
+        case 0xc8 ... 0xcf: /* fmul %stN,%st */
+        case 0xd0 ... 0xd7: /* fcom %stN,%st */
+        case 0xd8 ... 0xdf: /* fcomp %stN,%st */
+        case 0xe0 ... 0xe7: /* fsub %stN,%st */
+        case 0xe8 ... 0xef: /* fsubr %stN,%st */
+        case 0xf0 ... 0xf7: /* fdiv %stN,%st */
+        case 0xf8 ... 0xff: /* fdivr %stN,%st */
+            emulate_fpu_insn_stub(0xd8, s->modrm);
+            break;
+        default:
+        fpu_memsrc32:
+            ASSERT(s->ea.type == OP_MEM);
+            if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, &src->val,
+                                 4, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            emulate_fpu_insn_memsrc(b, s->modrm_reg & 7, src->val);
+            break;
+        }
+        break;
+
+    case 0xd9: /* FPU 0xd9 */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xfb: /* fsincos */
+            fail_if(cpu_has_amd_erratum(573));
+            /* fall through */
+        case 0xc0 ... 0xc7: /* fld %stN */
+        case 0xc8 ... 0xcf: /* fxch %stN */
+        case 0xd0: /* fnop */
+        case 0xd8 ... 0xdf: /* fstp %stN (alternative encoding) */
+        case 0xe0: /* fchs */
+        case 0xe1: /* fabs */
+        case 0xe4: /* ftst */
+        case 0xe5: /* fxam */
+        case 0xe8: /* fld1 */
+        case 0xe9: /* fldl2t */
+        case 0xea: /* fldl2e */
+        case 0xeb: /* fldpi */
+        case 0xec: /* fldlg2 */
+        case 0xed: /* fldln2 */
+        case 0xee: /* fldz */
+        case 0xf0: /* f2xm1 */
+        case 0xf1: /* fyl2x */
+        case 0xf2: /* fptan */
+        case 0xf3: /* fpatan */
+        case 0xf4: /* fxtract */
+        case 0xf5: /* fprem1 */
+        case 0xf6: /* fdecstp */
+        case 0xf7: /* fincstp */
+        case 0xf8: /* fprem */
+        case 0xf9: /* fyl2xp1 */
+        case 0xfa: /* fsqrt */
+        case 0xfc: /* frndint */
+        case 0xfd: /* fscale */
+        case 0xfe: /* fsin */
+        case 0xff: /* fcos */
+            emulate_fpu_insn_stub(0xd9, s->modrm);
+            break;
+        default:
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            switch ( s->modrm_reg & 7 )
+            {
+            case 0: /* fld m32fp */
+                goto fpu_memsrc32;
+            case 2: /* fst m32fp */
+            case 3: /* fstp m32fp */
+            fpu_memdst32:
+                *dst = s->ea;
+                dst->bytes = 4;
+                emulate_fpu_insn_memdst(b, s->modrm_reg & 7, dst->val);
+                break;
+            case 4: /* fldenv */
+                /* Raise #MF now if there are pending unmasked exceptions. */
+                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
+                /* fall through */
+            case 6: /* fnstenv */
+                fail_if(!ops->blk);
+                s->blk = s->modrm_reg & 2 ? blk_fst : blk_fld;
+                /*
+                 * REX is meaningless for these insns by this point - (ab)use
+                 * the field to communicate real vs protected mode to ->blk().
+                 */
+                s->rex_prefix = in_protmode(ctxt, ops);
+                if ( (rc = ops->blk(s->ea.mem.seg, s->ea.mem.off, NULL,
+                                    s->op_bytes > 2 ? sizeof(struct x87_env32)
+                                                    : sizeof(struct x87_env16),
+                                    &regs->eflags,
+                                    s, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                s->fpu_ctrl = true;
+                break;
+            case 5: /* fldcw m2byte */
+                s->fpu_ctrl = true;
+            fpu_memsrc16:
+                if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, &src->val,
+                                     2, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                emulate_fpu_insn_memsrc(b, s->modrm_reg & 7, src->val);
+                break;
+            case 7: /* fnstcw m2byte */
+                s->fpu_ctrl = true;
+            fpu_memdst16:
+                *dst = s->ea;
+                dst->bytes = 2;
+                emulate_fpu_insn_memdst(b, s->modrm_reg & 7, dst->val);
+                break;
+            default:
+                generate_exception(X86_EXC_UD);
+            }
+            /*
+             * Control instructions can't raise FPU exceptions, so we need
+             * to consider suppressing writes only for non-control ones.
+             */
+            if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
+                dst->type = OP_NONE;
+        }
+        break;
+
+    case 0xda: /* FPU 0xda */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xc0 ... 0xc7: /* fcmovb %stN */
+        case 0xc8 ... 0xcf: /* fcmove %stN */
+        case 0xd0 ... 0xd7: /* fcmovbe %stN */
+        case 0xd8 ... 0xdf: /* fcmovu %stN */
+            vcpu_must_have(cmov);
+            emulate_fpu_insn_stub_eflags(0xda, s->modrm);
+            break;
+        case 0xe9:          /* fucompp */
+            emulate_fpu_insn_stub(0xda, s->modrm);
+            break;
+        default:
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            goto fpu_memsrc32;
+        }
+        break;
+
+    case 0xdb: /* FPU 0xdb */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xc0 ... 0xc7: /* fcmovnb %stN */
+        case 0xc8 ... 0xcf: /* fcmovne %stN */
+        case 0xd0 ... 0xd7: /* fcmovnbe %stN */
+        case 0xd8 ... 0xdf: /* fcmovnu %stN */
+        case 0xe8 ... 0xef: /* fucomi %stN */
+        case 0xf0 ... 0xf7: /* fcomi %stN */
+            vcpu_must_have(cmov);
+            emulate_fpu_insn_stub_eflags(0xdb, s->modrm);
+            break;
+        case 0xe0: /* fneni - 8087 only, ignored by 287 */
+        case 0xe1: /* fndisi - 8087 only, ignored by 287 */
+        case 0xe2: /* fnclex */
+        case 0xe3: /* fninit */
+        case 0xe4: /* fnsetpm - 287 only, ignored by 387 */
+        /* case 0xe5: frstpm - 287 only, #UD on 387 */
+            s->fpu_ctrl = true;
+            emulate_fpu_insn_stub(0xdb, s->modrm);
+            break;
+        default:
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            switch ( s->modrm_reg & 7 )
+            {
+            case 0: /* fild m32i */
+                goto fpu_memsrc32;
+            case 1: /* fisttp m32i */
+                host_and_vcpu_must_have(sse3);
+                /* fall through */
+            case 2: /* fist m32i */
+            case 3: /* fistp m32i */
+                goto fpu_memdst32;
+            case 5: /* fld m80fp */
+            fpu_memsrc80:
+                if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, mmvalp,
+                                     10, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                emulate_fpu_insn_memsrc(b, s->modrm_reg & 7, *mmvalp);
+                break;
+            case 7: /* fstp m80fp */
+            fpu_memdst80:
+                fail_if(!ops->write);
+                emulate_fpu_insn_memdst(b, s->modrm_reg & 7, *mmvalp);
+                if ( fpu_check_write() &&
+                     (rc = ops->write(s->ea.mem.seg, s->ea.mem.off, mmvalp,
+                                      10, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                break;
+            default:
+                generate_exception(X86_EXC_UD);
+            }
+        }
+        break;
+
+    case 0xdc: /* FPU 0xdc */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xc0 ... 0xc7: /* fadd %st,%stN */
+        case 0xc8 ... 0xcf: /* fmul %st,%stN */
+        case 0xd0 ... 0xd7: /* fcom %stN,%st (alternative encoding) */
+        case 0xd8 ... 0xdf: /* fcomp %stN,%st (alternative encoding) */
+        case 0xe0 ... 0xe7: /* fsubr %st,%stN */
+        case 0xe8 ... 0xef: /* fsub %st,%stN */
+        case 0xf0 ... 0xf7: /* fdivr %st,%stN */
+        case 0xf8 ... 0xff: /* fdiv %st,%stN */
+            emulate_fpu_insn_stub(0xdc, s->modrm);
+            break;
+        default:
+        fpu_memsrc64:
+            ASSERT(s->ea.type == OP_MEM);
+            if ( (rc = ops->read(s->ea.mem.seg, s->ea.mem.off, &src->val,
+                                 8, ctxt)) != X86EMUL_OKAY )
+                goto done;
+            emulate_fpu_insn_memsrc(b, s->modrm_reg & 7, src->val);
+            break;
+        }
+        break;
+
+    case 0xdd: /* FPU 0xdd */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xc0 ... 0xc7: /* ffree %stN */
+        case 0xc8 ... 0xcf: /* fxch %stN (alternative encoding) */
+        case 0xd0 ... 0xd7: /* fst %stN */
+        case 0xd8 ... 0xdf: /* fstp %stN */
+        case 0xe0 ... 0xe7: /* fucom %stN */
+        case 0xe8 ... 0xef: /* fucomp %stN */
+            emulate_fpu_insn_stub(0xdd, s->modrm);
+            break;
+        default:
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            switch ( s->modrm_reg & 7 )
+            {
+            case 0: /* fld m64fp */;
+                goto fpu_memsrc64;
+            case 1: /* fisttp m64i */
+                host_and_vcpu_must_have(sse3);
+                /* fall through */
+            case 2: /* fst m64fp */
+            case 3: /* fstp m64fp */
+            fpu_memdst64:
+                *dst = s->ea;
+                dst->bytes = 8;
+                emulate_fpu_insn_memdst(b, s->modrm_reg & 7, dst->val);
+                break;
+            case 4: /* frstor */
+                /* Raise #MF now if there are pending unmasked exceptions. */
+                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
+                /* fall through */
+            case 6: /* fnsave */
+                fail_if(!ops->blk);
+                s->blk = s->modrm_reg & 2 ? blk_fst : blk_fld;
+                /*
+                 * REX is meaningless for these insns by this point - (ab)use
+                 * the field to communicate real vs protected mode to ->blk().
+                 */
+                s->rex_prefix = in_protmode(ctxt, ops);
+                if ( (rc = ops->blk(s->ea.mem.seg, s->ea.mem.off, NULL,
+                                    s->op_bytes > 2 ? sizeof(struct x87_env32) + 80
+                                                    : sizeof(struct x87_env16) + 80,
+                                    &regs->eflags,
+                                    s, ctxt)) != X86EMUL_OKAY )
+                    goto done;
+                s->fpu_ctrl = true;
+                break;
+            case 7: /* fnstsw m2byte */
+                s->fpu_ctrl = true;
+                goto fpu_memdst16;
+            default:
+                generate_exception(X86_EXC_UD);
+            }
+            /*
+             * Control instructions can't raise FPU exceptions, so we need
+             * to consider suppressing writes only for non-control ones.
+             */
+            if ( dst->type == OP_MEM && !s->fpu_ctrl && !fpu_check_write() )
+                dst->type = OP_NONE;
+        }
+        break;
+
+    case 0xde: /* FPU 0xde */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xc0 ... 0xc7: /* faddp %stN */
+        case 0xc8 ... 0xcf: /* fmulp %stN */
+        case 0xd0 ... 0xd7: /* fcomp %stN (alternative encoding) */
+        case 0xd9: /* fcompp */
+        case 0xe0 ... 0xe7: /* fsubrp %stN */
+        case 0xe8 ... 0xef: /* fsubp %stN */
+        case 0xf0 ... 0xf7: /* fdivrp %stN */
+        case 0xf8 ... 0xff: /* fdivp %stN */
+            emulate_fpu_insn_stub(0xde, s->modrm);
+            break;
+        default:
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            emulate_fpu_insn_memsrc(b, s->modrm_reg & 7, src->val);
+            break;
+        }
+        break;
+
+    case 0xdf: /* FPU 0xdf */
+        host_and_vcpu_must_have(fpu);
+        get_fpu(X86EMUL_FPU_fpu);
+        switch ( s->modrm )
+        {
+        case 0xe0:
+            /* fnstsw %ax */
+            s->fpu_ctrl = true;
+            dst->bytes = 2;
+            dst->type = OP_REG;
+            dst->reg = (void *)&regs->ax;
+            emulate_fpu_insn_memdst(b, s->modrm_reg & 7, dst->val);
+            break;
+        case 0xe8 ... 0xef: /* fucomip %stN */
+        case 0xf0 ... 0xf7: /* fcomip %stN */
+            vcpu_must_have(cmov);
+            emulate_fpu_insn_stub_eflags(0xdf, s->modrm);
+            break;
+        case 0xc0 ... 0xc7: /* ffreep %stN */
+        case 0xc8 ... 0xcf: /* fxch %stN (alternative encoding) */
+        case 0xd0 ... 0xd7: /* fstp %stN (alternative encoding) */
+        case 0xd8 ... 0xdf: /* fstp %stN (alternative encoding) */
+            emulate_fpu_insn_stub(0xdf, s->modrm);
+            break;
+        default:
+            generate_exception_if(s->ea.type != OP_MEM, X86_EXC_UD);
+            switch ( s->modrm_reg & 7 )
+            {
+            case 0: /* fild m16i */
+                goto fpu_memsrc16;
+            case 1: /* fisttp m16i */
+                host_and_vcpu_must_have(sse3);
+                /* fall through */
+            case 2: /* fist m16i */
+            case 3: /* fistp m16i */
+                goto fpu_memdst16;
+            case 4: /* fbld m80dec */
+                goto fpu_memsrc80;
+            case 5: /* fild m64i */
+                dst->type = OP_NONE;
+                goto fpu_memsrc64;
+            case 6: /* fbstp packed bcd */
+                goto fpu_memdst80;
+            case 7: /* fistp m64i */
+                goto fpu_memdst64;
+            }
+        }
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        return X86EMUL_UNHANDLEABLE;
+    }
+
+    rc = X86EMUL_OKAY;
+
+ done:
+    put_stub(stub);
+    return rc;
+
+#ifdef __XEN__
+ emulation_stub_failure:
+    return X86EMUL_stub_failure;
+#endif
+}
--- a/xen/arch/x86/x86_emulate/private.h
+++ b/xen/arch/x86/x86_emulate/private.h
@@ -339,12 +339,57 @@ struct x86_fxsr {
     uint64_t avl[6];
 };
 
+#ifndef X86EMUL_NO_FPU
+struct x87_env16 {
+    uint16_t fcw;
+    uint16_t fsw;
+    uint16_t ftw;
+    union {
+        struct {
+            uint16_t fip_lo;
+            uint16_t fop:11, :1, fip_hi:4;
+            uint16_t fdp_lo;
+            uint16_t :12, fdp_hi:4;
+        } real;
+        struct {
+            uint16_t fip;
+            uint16_t fcs;
+            uint16_t fdp;
+            uint16_t fds;
+        } prot;
+    } mode;
+};
+
+struct x87_env32 {
+    uint32_t fcw:16, :16;
+    uint32_t fsw:16, :16;
+    uint32_t ftw:16, :16;
+    union {
+        struct {
+            /* some CPUs/FPUs also store the full FIP here */
+            uint32_t fip_lo:16, :16;
+            uint32_t fop:11, :1, fip_hi:16, :4;
+            /* some CPUs/FPUs also store the full FDP here */
+            uint32_t fdp_lo:16, :16;
+            uint32_t :12, fdp_hi:16, :4;
+        } real;
+        struct {
+            uint32_t fip;
+            uint32_t fcs:16, fop:11, :5;
+            uint32_t fdp;
+            uint32_t fds:16, :16;
+        } prot;
+    } mode;
+};
+#endif
+
 /*
  * Externally visible return codes from x86_emulate() are non-negative.
  * Use negative values for internal state change indicators from helpers
  * to the main function.
  */
 #define X86EMUL_rdtsc        (-1)
+#define X86EMUL_stub_failure (-2)
 
 /*
  * These EFLAGS bits are restored from saved value during emulation, and
@@ -541,6 +586,113 @@ amd_like(const struct x86_emulate_ctxt *
 # define host_and_vcpu_must_have(feat) vcpu_must_have(feat)
 #endif
 
+/*
+ * Instruction emulation:
+ * Most instructions are emulated directly via a fragment of inline assembly
+ * code. This allows us to save/restore EFLAGS and thus very easily pick up
+ * any modified flags.
+ */
+
+#if defined(__x86_64__)
+#define _LO32 "k"          /* force 32-bit operand */
+#define _STK  "%%rsp"      /* stack pointer */
+#define _BYTES_PER_LONG "8"
+#elif defined(__i386__)
+#define _LO32 ""           /* force 32-bit operand */
+#define _STK  "%%esp"      /* stack pointer */
+#define _BYTES_PER_LONG "4"
+#endif
+
+/* Before executing instruction: restore necessary bits in EFLAGS. */
+#define _PRE_EFLAGS(_sav, _msk, _tmp)                           \
+/* EFLAGS = (_sav & _msk) | (EFLAGS & ~_msk); _sav &= ~_msk; */ \
+"movl %"_LO32 _sav",%"_LO32 _tmp"; "                            \
+"push %"_tmp"; "                                                \
+"push %"_tmp"; "                                                \
+"movl %"_msk",%"_LO32 _tmp"; "                                  \
+"andl %"_LO32 _tmp",("_STK"); "                                 \
+"pushf; "                                                       \
+"notl %"_LO32 _tmp"; "                                          \
+"andl %"_LO32 _tmp",("_STK"); "                                 \
+"andl %"_LO32 _tmp",2*"_BYTES_PER_LONG"("_STK"); "              \
+"pop  %"_tmp"; "                                                \
+"orl  %"_LO32 _tmp",("_STK"); "                                 \
+"popf; "                                                        \
+"pop  %"_tmp"; "                                                \
+"movl %"_LO32 _tmp",%"_LO32 _sav"; "
+
+/* After executing instruction: write-back necessary bits in EFLAGS. */
+#define _POST_EFLAGS(_sav, _msk, _tmp)          \
+/* _sav |= EFLAGS & _msk; */                    \
+"pushf; "                                       \
+"pop  %"_tmp"; "                                \
+"andl %"_msk",%"_LO32 _tmp"; "                  \
+"orl  %"_LO32 _tmp",%"_LO32 _sav"; "
+
+#ifdef __XEN__
+
+# include <xen/domain_page.h>
+# include <asm/uaccess.h>
+
+# define get_stub(stb) ({                                             \
+    BUILD_BUG_ON(STUB_BUF_SIZE / 2 < MAX_INST_LEN + 1);               \
+    ASSERT(!(stb).ptr);                                               \
+    (stb).addr = this_cpu(stubs.addr) + STUB_BUF_SIZE / 2;            \
+    memset(((stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn)))) + \
+           ((stb).addr & ~PAGE_MASK), 0xcc, STUB_BUF_SIZE / 2);       \
+})
+
+# define put_stub(stb) ({                                  \
+    if ( (stb).ptr )                                       \
+    {                                                      \
+        unmap_domain_page((stb).ptr);                      \
+        (stb).ptr = NULL;                                  \
+    }                                                      \
+})
+
+struct stub_exn {
+    union stub_exception_token info;
+    unsigned int line;
+};
+
+# define invoke_stub(pre, post, constraints...) do {                    \
+    stub_exn.info = (union stub_exception_token) { .raw = ~0 };         \
+    stub_exn.line = __LINE__; /* Utility outweighs livepatching cost */ \
+    block_speculation(); /* SCSB */                                     \
+    asm volatile ( pre "\n\tINDIRECT_CALL %[stub]\n\t" post "\n"        \
+                   ".Lret%=:\n\t"                                       \
+                   ".pushsection .fixup,\"ax\"\n"                       \
+                   ".Lfix%=:\n\t"                                       \
+                   "pop %[exn]\n\t"                                     \
+                   "jmp .Lret%=\n\t"                                    \
+                   ".popsection\n\t"                                    \
+                   _ASM_EXTABLE(.Lret%=, .Lfix%=)                       \
+                   : [exn] "+g" (stub_exn.info) ASM_CALL_CONSTRAINT,    \
+                     constraints,                                       \
+                     [stub] "r" (stub.func),                            \
+                     "m" (*(uint8_t(*)[MAX_INST_LEN + 1])stub.ptr) );   \
+    if ( unlikely(~stub_exn.info.raw) )                                 \
+        goto emulation_stub_failure;                                    \
+} while (0)
+
+#else /* !__XEN__ */
+
+# define get_stub(stb) ({                        \
+    assert(!(stb).addr);                         \
+    (void *)((stb).addr = (uintptr_t)(stb).buf); \
+})
+
+# define put_stub(stb) ((stb).addr = 0)
+
+struct stub_exn {};
+
+# define invoke_stub(pre, post, constraints...)                         \
+    asm volatile ( pre "\n\tcall *%[stub]\n\t" post                     \
+                   : constraints, [stub] "rm" (stub.func),              \
+                     "m" (*(typeof(stub.buf) *)stub.addr) )
+
+#endif /* __XEN__ */
+
 int x86emul_get_cpl(struct x86_emulate_ctxt *ctxt,
                     const struct x86_emulate_ops *ops);
 
@@ -554,6 +706,16 @@ do {
     if ( rc ) goto done;                                        \
 } while (0)
 
+int x86emul_fpu(struct x86_emulate_state *s,
+                struct cpu_user_regs *regs,
+                struct operand *dst,
+                struct operand *src,
+                struct x86_emulate_ctxt *ctxt,
+                const struct x86_emulate_ops *ops,
+                unsigned int *insn_bytes,
+                enum x86_emulate_fpu_type *fpu_type,
+                struct stub_exn *stub_exn,
+                mmval_t *mmvalp);
 int x86emul_0f01(struct x86_emulate_state *s,
                  struct cpu_user_regs *regs,
                  struct operand *dst,
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -643,50 +643,6 @@ static const uint8_t sse_prefix[] = { 0x
 #define PTR_POISON NULL /* 32-bit builds are for user-space, so NULL is OK. */
 #endif
 
-#ifndef X86EMUL_NO_FPU
-struct x87_env16 {
-    uint16_t fcw;
-    uint16_t fsw;
-    uint16_t ftw;
-    union {
-        struct {
-            uint16_t fip_lo;
-            uint16_t fop:11, :1, fip_hi:4;
-            uint16_t fdp_lo;
-            uint16_t :12, fdp_hi:4;
-        } real;
-        struct {
-            uint16_t fip;
-            uint16_t fcs;
-            uint16_t fdp;
-            uint16_t fds;
-        } prot;
-    } mode;
-};
-
-struct x87_env32 {
-    uint32_t fcw:16, :16;
-    uint32_t fsw:16, :16;
-    uint32_t ftw:16, :16;
-    union {
-        struct {
-            /* some CPUs/FPUs also store the full FIP here */
-            uint32_t fip_lo:16, :16;
-            uint32_t fop:11, :1, fip_hi:16, :4;
-            /* some CPUs/FPUs also store the full FDP here */
-            uint32_t fdp_lo:16, :16;
-            uint32_t :12, fdp_hi:16, :4;
-        } real;
-        struct {
-            uint32_t fip;
-            uint32_t fcs:16, fop:11, :5;
-            uint32_t fdp;
-            uint32_t fds:16, :16;
-        } prot;
-    } mode;
-};
-#endif
-
 /*
  * While proper alignment gets specified in mmval_t, this doesn't get honored
  * by the compiler for automatic variables. Use this helper to instantiate a
@@ -704,9 +660,6 @@ struct x87_env32 {
 # define ASM_FLAG_OUT(yes, no) no
 #endif
 
-/* Floating point status word definitions. */
-#define FSW_ES    (1U << 7)
-
 /* MXCSR bit definitions. */
 #define MXCSR_MM  (1U << 17)
 
@@ -737,49 +690,6 @@ struct x87_env32 {
 #define ECODE_IDT (1 << 1)
 #define ECODE_TI  (1 << 2)
 
-/*
- * Instruction emulation:
- * Most instructions are emulated directly via a fragment of inline assembly
- * code. This allows us to save/restore EFLAGS and thus very easily pick up
- * any modified flags.
- */
-
-#if defined(__x86_64__)
-#define _LO32 "k"          /* force 32-bit operand */
-#define _STK  "%%rsp"      /* stack pointer */
-#define _BYTES_PER_LONG "8"
-#elif defined(__i386__)
-#define _LO32 ""           /* force 32-bit operand */
-#define _STK  "%%esp"      /* stack pointer */
-#define _BYTES_PER_LONG "4"
-#endif
-
-/* Before executing instruction: restore necessary bits in EFLAGS. */
-#define _PRE_EFLAGS(_sav, _msk, _tmp)                           \
-/* EFLAGS = (_sav & _msk) | (EFLAGS & ~_msk); _sav &= ~_msk; */ \
-"movl %"_LO32 _sav",%"_LO32 _tmp"; "                            \
-"push %"_tmp"; "                                                \
-"push %"_tmp"; "                                                \
-"movl %"_msk",%"_LO32 _tmp"; "                                  \
-"andl %"_LO32 _tmp",("_STK"); "                                 \
-"pushf; "                                                       \
-"notl %"_LO32 _tmp"; "                                          \
-"andl %"_LO32 _tmp",("_STK"); "                                 \
-"andl %"_LO32 _tmp",2*"_BYTES_PER_LONG"("_STK"); "              \
-"pop  %"_tmp"; "                                                \
-"orl  %"_LO32 _tmp",("_STK"); "                                 \
-"popf; "                                                        \
-"pop  %"_tmp"; "                                                \
-"movl %"_LO32 _tmp",%"_LO32 _sav"; "
-
-/* After executing instruction: write-back necessary bits in EFLAGS. */
-#define _POST_EFLAGS(_sav, _msk, _tmp)          \
-/* _sav |= EFLAGS & _msk; */                    \
-"pushf; "                                       \
-"pop  %"_tmp"; "                                \
-"andl %"_msk",%"_LO32 _tmp"; "                  \
-"orl  %"_LO32 _tmp",%"_LO32 _sav"; "
-
 /* Raw emulation: instruction has two explicit operands. */
 #define __emulate_2op_nobyte(_op, src, dst, sz, eflags, wsx,wsy,wdx,wdy,   \
                              lsx,lsy,ldx,ldy, qsx,qsy,qdx,qdy, extra...)   \
@@ -913,33 +823,6 @@ do{ asm volatile (
 #define __emulate_1op_8byte(op, dst, eflags, extra...)
 #endif /* __i386__ */
 
-#ifdef __XEN__
-# define invoke_stub(pre, post, constraints...) do {                    \
-    stub_exn.info = (union stub_exception_token) { .raw = ~0 };         \
-    stub_exn.line = __LINE__; /* Utility outweighs livepatching cost */ \
-    block_speculation(); /* SCSB */                                     \
-    asm volatile ( pre "\n\tINDIRECT_CALL %[stub]\n\t" post "\n"        \
-                   ".Lret%=:\n\t"                                       \
-                   ".pushsection .fixup,\"ax\"\n"                       \
-                   ".Lfix%=:\n\t"                                       \
-                   "pop %[exn]\n\t"                                     \
-                   "jmp .Lret%=\n\t"                                    \
-                   ".popsection\n\t"                                    \
-                   _ASM_EXTABLE(.Lret%=, .Lfix%=)                       \
-                   : [exn] "+g" (stub_exn.info) ASM_CALL_CONSTRAINT,    \
-                     constraints,                                       \
-                     [stub] "r" (stub.func),                            \
-                     "m" (*(uint8_t(*)[MAX_INST_LEN + 1])stub.ptr) );   \
-    if ( unlikely(~stub_exn.info.raw) )                                 \
-        goto emulation_stub_failure;                                    \
-} while (0)
-#else
-# define invoke_stub(pre, post, constraints...)                         \
-    asm volatile ( pre "\n\tcall *%[stub]\n\t" post                     \
-                   : constraints, [stub] "rm" (stub.func),              \
-                     "m" (*(typeof(stub.buf) *)stub.addr) )
-#endif
-
 #define emulate_stub(dst, src...) do {                                  \
     unsigned long tmp;                                                  \
     invoke_stub(_PRE_EFLAGS("[efl]", "[msk]", "[tmp]"),                 \
@@ -1162,54 +1045,6 @@ static void put_fpu(
         ops->put_fpu(ctxt, X86EMUL_FPU_none, NULL);
 }
 
-static inline bool fpu_check_write(void)
-{
-    uint16_t fsw;
-
-    asm ( "fnstsw %0" : "=am" (fsw) );
-
-    return !(fsw & FSW_ES);
-}
-
-#define emulate_fpu_insn_memdst(opc, ext, arg)                          \
-do {                                                                    \
-    /* ModRM: mod=0, reg=ext, rm=0, i.e. a (%rax) operand */            \
-    insn_bytes = 2;                                                     \
-    memcpy(get_stub(stub),                                              \
-           ((uint8_t[]){ opc, ((ext) & 7) << 3, 0xc3 }), 3);            \
-    invoke_stub("", "", "+m" (arg) : "a" (&(arg)));                     \
-    put_stub(stub);                                                     \
-} while (0)
-
-#define emulate_fpu_insn_memsrc(opc, ext, arg)                          \
-do {                                                                    \
-    /* ModRM: mod=0, reg=ext, rm=0, i.e. a (%rax) operand */            \
-    memcpy(get_stub(stub),                                              \
-           ((uint8_t[]){ opc, ((ext) & 7) << 3, 0xc3 }), 3);            \
-    invoke_stub("", "", "=m" (dummy) : "m" (arg), "a" (&(arg)));        \
-    put_stub(stub);                                                     \
-} while (0)
-
-#define emulate_fpu_insn_stub(bytes...)                                 \
-do {                                                                    \
-    unsigned int nr_ = sizeof((uint8_t[]){ bytes });                    \
-    memcpy(get_stub(stub), ((uint8_t[]){ bytes, 0xc3 }), nr_ + 1);      \
-    invoke_stub("", "", "=m" (dummy) : "i" (0));                        \
-    put_stub(stub);                                                     \
-} while (0)
-
-#define emulate_fpu_insn_stub_eflags(bytes...)                          \
-do {                                                                    \
-    unsigned int nr_ = sizeof((uint8_t[]){ bytes });                    \
-    unsigned long tmp_;                                                 \
-    memcpy(get_stub(stub), ((uint8_t[]){ bytes, 0xc3 }), nr_ + 1);      \
-    invoke_stub(_PRE_EFLAGS("[eflags]", "[mask]", "[tmp]"),             \
-                _POST_EFLAGS("[eflags]", "[mask]", "[tmp]"),            \
-                [eflags] "+g" (_regs.eflags), [tmp] "=&r" (tmp_)        \
-                : [mask] "i" (X86_EFLAGS_ZF|X86_EFLAGS_PF|X86_EFLAGS_CF)); \
-    put_stub(stub);                                                     \
-} while (0)
-
 static inline unsigned long get_loop_count(
     const struct cpu_user_regs *regs,
     int ad_bytes)
@@ -3154,12 +2989,7 @@ x86_emulate(
     enum x86_emulate_fpu_type fpu_type = X86EMUL_FPU_none;
     struct x86_emulate_stub stub = {};
     DECLARE_ALIGNED(mmval_t, mmval);
-#ifdef __XEN__
-    struct {
-        union stub_exception_token info;
-        unsigned int line;
-    } stub_exn;
-#endif
+    struct stub_exn stub_exn = {};
 
     ASSERT(ops->read);
 
@@ -3950,10 +3780,10 @@ x86_emulate(
 
 #ifndef X86EMUL_NO_FPU
     case 0x9b:  /* wait/fwait */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_wait);
-        emulate_fpu_insn_stub(b);
-        break;
+    case 0xd8 ... 0xdf: /* FPU */
+        rc = x86emul_fpu(state, &_regs, &dst, &src, ctxt, ops,
+                         &insn_bytes, &fpu_type, &stub_exn, mmvalp);
+        goto dispatch_from_helper;
 #endif
 
     case 0x9c: /* pushf */
@@ -4364,373 +4194,6 @@ x86_emulate(
         break;
     }
 
-#ifndef X86EMUL_NO_FPU
-    case 0xd8: /* FPU 0xd8 */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xc0 ... 0xc7: /* fadd %stN,%st */
-        case 0xc8 ... 0xcf: /* fmul %stN,%st */
-        case 0xd0 ... 0xd7: /* fcom %stN,%st */
-        case 0xd8 ... 0xdf: /* fcomp %stN,%st */
-        case 0xe0 ... 0xe7: /* fsub %stN,%st */
-        case 0xe8 ... 0xef: /* fsubr %stN,%st */
-        case 0xf0 ... 0xf7: /* fdiv %stN,%st */
-        case 0xf8 ... 0xff: /* fdivr %stN,%st */
-            emulate_fpu_insn_stub(0xd8, modrm);
-            break;
-        default:
-        fpu_memsrc32:
-            ASSERT(ea.type == OP_MEM);
-            if ( (rc = ops->read(ea.mem.seg, ea.mem.off, &src.val,
-                                 4, ctxt)) != X86EMUL_OKAY )
-                goto done;
-            emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
-            break;
-        }
-        break;
-
-    case 0xd9: /* FPU 0xd9 */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xfb: /* fsincos */
-            fail_if(cpu_has_amd_erratum(573));
-            /* fall through */
-        case 0xc0 ... 0xc7: /* fld %stN */
-        case 0xc8 ... 0xcf: /* fxch %stN */
-        case 0xd0: /* fnop */
-        case 0xd8 ... 0xdf: /* fstp %stN (alternative encoding) */
-        case 0xe0: /* fchs */
-        case 0xe1: /* fabs */
-        case 0xe4: /* ftst */
-        case 0xe5: /* fxam */
-        case 0xe8: /* fld1 */
-        case 0xe9: /* fldl2t */
-        case 0xea: /* fldl2e */
-        case 0xeb: /* fldpi */
-        case 0xec: /* fldlg2 */
-        case 0xed: /* fldln2 */
-        case 0xee: /* fldz */
-        case 0xf0: /* f2xm1 */
-        case 0xf1: /* fyl2x */
-        case 0xf2: /* fptan */
-        case 0xf3: /* fpatan */
-        case 0xf4: /* fxtract */
-        case 0xf5: /* fprem1 */
-        case 0xf6: /* fdecstp */
-        case 0xf7: /* fincstp */
-        case 0xf8: /* fprem */
-        case 0xf9: /* fyl2xp1 */
-        case 0xfa: /* fsqrt */
-        case 0xfc: /* frndint */
-        case 0xfd: /* fscale */
-        case 0xfe: /* fsin */
-        case 0xff: /* fcos */
-            emulate_fpu_insn_stub(0xd9, modrm);
-            break;
-        default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            switch ( modrm_reg & 7 )
-            {
-            case 0: /* fld m32fp */
-                goto fpu_memsrc32;
-            case 2: /* fst m32fp */
-            case 3: /* fstp m32fp */
-            fpu_memdst32:
-                dst = ea;
-                dst.bytes = 4;
-                emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
-                break;
-            case 4: /* fldenv */
-                /* Raise #MF now if there are pending unmasked exceptions. */
-                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
-                /* fall through */
-            case 6: /* fnstenv */
-                fail_if(!ops->blk);
-                state->blk = modrm_reg & 2 ? blk_fst : blk_fld;
-                /*
-                 * REX is meaningless for these insns by this point - (ab)use
-                 * the field to communicate real vs protected mode to ->blk().
-                 */
-                /*state->*/rex_prefix = in_protmode(ctxt, ops);
-                if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
-                                    op_bytes > 2 ? sizeof(struct x87_env32)
-                                                 : sizeof(struct x87_env16),
-                                    &_regs.eflags,
-                                    state, ctxt)) != X86EMUL_OKAY )
-                    goto done;
-                state->fpu_ctrl = true;
-                break;
-            case 5: /* fldcw m2byte */
-                state->fpu_ctrl = true;
-            fpu_memsrc16:
-                if ( (rc = ops->read(ea.mem.seg, ea.mem.off, &src.val,
-                                     2, ctxt)) != X86EMUL_OKAY )
-                    goto done;
-                emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
-                break;
-            case 7: /* fnstcw m2byte */
-                state->fpu_ctrl = true;
-            fpu_memdst16:
-                dst = ea;
-                dst.bytes = 2;
-                emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
-                break;
-            default:
-                generate_exception(EXC_UD);
-            }
-            /*
-             * Control instructions can't raise FPU exceptions, so we need
-             * to consider suppressing writes only for non-control ones.
-             */
-            if ( dst.type == OP_MEM && !state->fpu_ctrl && !fpu_check_write() )
-                dst.type = OP_NONE;
-        }
-        break;
-
-    case 0xda: /* FPU 0xda */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xc0 ... 0xc7: /* fcmovb %stN */
-        case 0xc8 ... 0xcf: /* fcmove %stN */
-        case 0xd0 ... 0xd7: /* fcmovbe %stN */
-        case 0xd8 ... 0xdf: /* fcmovu %stN */
-            vcpu_must_have(cmov);
-            emulate_fpu_insn_stub_eflags(0xda, modrm);
-            break;
-        case 0xe9:          /* fucompp */
-            emulate_fpu_insn_stub(0xda, modrm);
-            break;
-        default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            goto fpu_memsrc32;
-        }
-        break;
-
-    case 0xdb: /* FPU 0xdb */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xc0 ... 0xc7: /* fcmovnb %stN */
-        case 0xc8 ... 0xcf: /* fcmovne %stN */
-        case 0xd0 ... 0xd7: /* fcmovnbe %stN */
-        case 0xd8 ... 0xdf: /* fcmovnu %stN */
-        case 0xe8 ... 0xef: /* fucomi %stN */
-        case 0xf0 ... 0xf7: /* fcomi %stN */
-            vcpu_must_have(cmov);
-            emulate_fpu_insn_stub_eflags(0xdb, modrm);
-            break;
-        case 0xe0: /* fneni - 8087 only, ignored by 287 */
-        case 0xe1: /* fndisi - 8087 only, ignored by 287 */
-        case 0xe2: /* fnclex */
-        case 0xe3: /* fninit */
-        case 0xe4: /* fnsetpm - 287 only, ignored by 387 */
-        /* case 0xe5: frstpm - 287 only, #UD on 387 */
-            state->fpu_ctrl = true;
-            emulate_fpu_insn_stub(0xdb, modrm);
-            break;
-        default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            switch ( modrm_reg & 7 )
-            {
-            case 0: /* fild m32i */
-                goto fpu_memsrc32;
-            case 1: /* fisttp m32i */
-                host_and_vcpu_must_have(sse3);
-                /* fall through */
-            case 2: /* fist m32i */
-            case 3: /* fistp m32i */
-                goto fpu_memdst32;
-            case 5: /* fld m80fp */
-            fpu_memsrc80:
-                if ( (rc = ops->read(ea.mem.seg, ea.mem.off, mmvalp,
-                                     10, ctxt)) != X86EMUL_OKAY )
-                    goto done;
-                emulate_fpu_insn_memsrc(b, modrm_reg & 7, *mmvalp);
-                break;
-            case 7: /* fstp m80fp */
-            fpu_memdst80:
-                fail_if(!ops->write);
-                emulate_fpu_insn_memdst(b, modrm_reg & 7, *mmvalp);
-                if ( fpu_check_write() &&
-                     (rc = ops->write(ea.mem.seg, ea.mem.off, mmvalp,
-                                      10, ctxt)) != X86EMUL_OKAY )
-                    goto done;
-                break;
-            default:
-                generate_exception(EXC_UD);
-            }
-        }
-        break;
-
-    case 0xdc: /* FPU 0xdc */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xc0 ... 0xc7: /* fadd %st,%stN */
-        case 0xc8 ... 0xcf: /* fmul %st,%stN */
-        case 0xd0 ... 0xd7: /* fcom %stN,%st (alternative encoding) */
-        case 0xd8 ... 0xdf: /* fcomp %stN,%st (alternative encoding) */
-        case 0xe0 ... 0xe7: /* fsubr %st,%stN */
-        case 0xe8 ... 0xef: /* fsub %st,%stN */
-        case 0xf0 ... 0xf7: /* fdivr %st,%stN */
-        case 0xf8 ... 0xff: /* fdiv %st,%stN */
-            emulate_fpu_insn_stub(0xdc, modrm);
-            break;
-        default:
-        fpu_memsrc64:
-            ASSERT(ea.type == OP_MEM);
-            if ( (rc = ops->read(ea.mem.seg, ea.mem.off, &src.val,
-                                 8, ctxt)) != X86EMUL_OKAY )
-                goto done;
-            emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
-            break;
-        }
-        break;
-
-    case 0xdd: /* FPU 0xdd */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xc0 ... 0xc7: /* ffree %stN */
-        case 0xc8 ... 0xcf: /* fxch %stN (alternative encoding) */
-        case 0xd0 ... 0xd7: /* fst %stN */
-        case 0xd8 ... 0xdf: /* fstp %stN */
-        case 0xe0 ... 0xe7: /* fucom %stN */
-        case 0xe8 ... 0xef: /* fucomp %stN */
-            emulate_fpu_insn_stub(0xdd, modrm);
-            break;
-        default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            switch ( modrm_reg & 7 )
-            {
-            case 0: /* fld m64fp */;
-                goto fpu_memsrc64;
-            case 1: /* fisttp m64i */
-                host_and_vcpu_must_have(sse3);
-                /* fall through */
-            case 2: /* fst m64fp */
-            case 3: /* fstp m64fp */
-            fpu_memdst64:
-                dst = ea;
-                dst.bytes = 8;
-                emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
-                break;
-            case 4: /* frstor */
-                /* Raise #MF now if there are pending unmasked exceptions. */
-                emulate_fpu_insn_stub(0xd9, 0xd0 /* fnop */);
-                /* fall through */
-            case 6: /* fnsave */
-                fail_if(!ops->blk);
-                state->blk = modrm_reg & 2 ? blk_fst : blk_fld;
-                /*
-                 * REX is meaningless for these insns by this point - (ab)use
-                 * the field to communicate real vs protected mode to ->blk().
-                 */
-                /*state->*/rex_prefix = in_protmode(ctxt, ops);
-                if ( (rc = ops->blk(ea.mem.seg, ea.mem.off, NULL,
-                                    op_bytes > 2 ? sizeof(struct x87_env32) + 80
-                                                 : sizeof(struct x87_env16) + 80,
-                                    &_regs.eflags,
-                                    state, ctxt)) != X86EMUL_OKAY )
-                    goto done;
-                state->fpu_ctrl = true;
-                break;
-            case 7: /* fnstsw m2byte */
-                state->fpu_ctrl = true;
-                goto fpu_memdst16;
-            default:
-                generate_exception(EXC_UD);
-            }
-            /*
-             * Control instructions can't raise FPU exceptions, so we need
-             * to consider suppressing writes only for non-control ones.
-             */
-            if ( dst.type == OP_MEM && !state->fpu_ctrl && !fpu_check_write() )
-                dst.type = OP_NONE;
-        }
-        break;
-
-    case 0xde: /* FPU 0xde */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xc0 ... 0xc7: /* faddp %stN */
-        case 0xc8 ... 0xcf: /* fmulp %stN */
-        case 0xd0 ... 0xd7: /* fcomp %stN (alternative encoding) */
-        case 0xd9: /* fcompp */
-        case 0xe0 ... 0xe7: /* fsubrp %stN */
-        case 0xe8 ... 0xef: /* fsubp %stN */
-        case 0xf0 ... 0xf7: /* fdivrp %stN */
-        case 0xf8 ... 0xff: /* fdivp %stN */
-            emulate_fpu_insn_stub(0xde, modrm);
-            break;
-        default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            emulate_fpu_insn_memsrc(b, modrm_reg & 7, src.val);
-            break;
-        }
-        break;
-
-    case 0xdf: /* FPU 0xdf */
-        host_and_vcpu_must_have(fpu);
-        get_fpu(X86EMUL_FPU_fpu);
-        switch ( modrm )
-        {
-        case 0xe0:
-            /* fnstsw %ax */
-            state->fpu_ctrl = true;
-            dst.bytes = 2;
-            dst.type = OP_REG;
-            dst.reg = (void *)&_regs.ax;
-            emulate_fpu_insn_memdst(b, modrm_reg & 7, dst.val);
-            break;
-        case 0xe8 ... 0xef: /* fucomip %stN */
-        case 0xf0 ... 0xf7: /* fcomip %stN */
-            vcpu_must_have(cmov);
-            emulate_fpu_insn_stub_eflags(0xdf, modrm);
-            break;
-        case 0xc0 ... 0xc7: /* ffreep %stN */
-        case 0xc8 ... 0xcf: /* fxch %stN (alternative encoding) */
-        case 0xd0 ... 0xd7: /* fstp %stN (alternative encoding) */
-        case 0xd8 ... 0xdf: /* fstp %stN (alternative encoding) */
-            emulate_fpu_insn_stub(0xdf, modrm);
-            break;
-        default:
-            generate_exception_if(ea.type != OP_MEM, EXC_UD);
-            switch ( modrm_reg & 7 )
-            {
-            case 0: /* fild m16i */
-                goto fpu_memsrc16;
-            case 1: /* fisttp m16i */
-                host_and_vcpu_must_have(sse3);
-                /* fall through */
-            case 2: /* fist m16i */
-            case 3: /* fistp m16i */
-                goto fpu_memdst16;
-            case 4: /* fbld m80dec */
-                goto fpu_memsrc80;
-            case 5: /* fild m64i */
-                dst.type = OP_NONE;
-                goto fpu_memsrc64;
-            case 6: /* fbstp packed bcd */
-                goto fpu_memdst80;
-            case 7: /* fistp m64i */
-                goto fpu_memdst64;
-            }
-        }
-        break;
-#endif /* !X86EMUL_NO_FPU */
-
     case 0xe0 ... 0xe2: /* loop{,z,nz} */ {
         unsigned long count = get_loop_count(&_regs, ad_bytes);
         int do_jmp = !(_regs.eflags & X86_EFLAGS_ZF); /* loopnz */
@@ -10134,6 +9597,11 @@ x86_emulate(
         {
         case X86EMUL_rdtsc:
             goto rdtsc;
+
+#ifdef __XEN__
+        case X86EMUL_stub_failure:
+            goto emulation_stub_failure;
+#endif
         }
 
         /* Internally used state change indicators may not make it here. */


