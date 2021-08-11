Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CB13E90CB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 14:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166003.303187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnIF-0000TN-MD; Wed, 11 Aug 2021 12:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166003.303187; Wed, 11 Aug 2021 12:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDnIF-0000RP-If; Wed, 11 Aug 2021 12:25:11 +0000
Received: by outflank-mailman (input) for mailman id 166003;
 Wed, 11 Aug 2021 12:25:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjOV=NC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mDnID-0000QW-Hn
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 12:25:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2921fac4-fa9f-11eb-a06e-12813bfff9fa;
 Wed, 11 Aug 2021 12:25:07 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-zpVizQREPeWltKaVkRMfXA-1; Wed, 11 Aug 2021 14:25:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2335.eurprd04.prod.outlook.com (2603:10a6:800:2e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 12:25:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 12:25:02 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.6 via Frontend Transport; Wed, 11 Aug 2021 12:25:02 +0000
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
X-Inumbo-ID: 2921fac4-fa9f-11eb-a06e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1628684706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xDuVUu/uls/nwQdBKf78ux7Pqg+0gXhI7uyUIB57IBM=;
	b=baHp8KtcoL5criQGzmZ/BFFBPjEq47d1X9jSKaZYAzHMrfEggCMTJQo6n802a9qmmC+irL
	1CafCTXbVl1aSt7b1sQs+1e+dvS7LKjExcsfhf22iXAi0Fwm4FLs+KTt4slP7lvSRbcv1R
	fgV1V4ikg06+bmrcACL04uHBpLRqFgg=
X-MC-Unique: zpVizQREPeWltKaVkRMfXA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDisUcvY6+co7ZQkKCv2oJmGoFo0SAVg7Nra4wBW7+n8KAaBH5GiEpxWY+TFznVKTJX/p+5bw7FrYrMKO9OQqd4yv+x9r803kl+gG9w6PoHv7EeM+kLik6bUe6zJPCSvTygbGAG2sUGDsJGSqhmCHQsGrb7hePEQMhLLQKZ7aEQOqxmeZqw7bxA5H0Uoir9sOuHg7OLVWq7EXjSJlE05+vzBzVyi7MhxKmBpQNsvITcE/wN7e2xQwnM9FyP+KpnXlDVtsw46TGeDOFXJ0BGGId9fVDFuJGa3YylW7yJYvCqm/EKhzGoAuedDvkFgHAEuQ/54DWpDMfIGBaORGOIHxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDuVUu/uls/nwQdBKf78ux7Pqg+0gXhI7uyUIB57IBM=;
 b=cA1gYBXob8J0jN9/u4qS4C+Gdvo6jF3v9feSp6J9oWpibEL6n97EmXaUdqai4FSe/xsokyIzMjRqVedt3IfBzYcr5bSA5ZGarjAhRtwMHJ4sAx4VRNvb1YCsjULcDkRCo2qF1UV36hJPZbebYPbccEQU4tj4U9cOK2adDYFIVNfnruJNOWHBQO8gdxh5k/imWfgx0NHsg4cCMj0QYcsSha6oWu5eQCJhEDAo1GMlRl9dT/cbD+JzV5J9stHZG6UDQBKnOLgNVPDDW4xajJM1rZ7JDgNBcS4L1gB72jIM40FQ21/lh/fBhvz0Y1RvPOlxqx2RX7ihGQeK5nWi2AFM4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: [PATCH 6/7] x86emul: move x86_emul_blk() to separate source file
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bdc58964-e2a8-af36-1653-41c7146bdfc9@suse.com>
Message-ID: <03a230d9-d4f5-d3fe-738a-2208a8d56f05@suse.com>
Date: Wed, 11 Aug 2021 14:25:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <bdc58964-e2a8-af36-1653-41c7146bdfc9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e06b252-5fec-4704-4d62-08d95cc30b3a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2335:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB233582985F71E00BE2153B1DB3F89@VI1PR0401MB2335.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cGSChJVp1DMizIep/ej/xdHg0FdBdVsP1Y9lGAvOxFRjsCr+kp0uMk5V58QZIhprXBY5nBU81N3tWKQ0fALa+oV/PNuq79/NW3MBhBPQWwSCFD+pm1si5GILkJEyc4VYZOo4gV+8hCfYVC3l+TeAfVuQyCm/t8/z97uM6m28f8N7sOmeauhfD58R2aYwSceuWplNGnUDl21my4pVwR8xbR8++7zbTnLqeZ5VmTdbBr2ru73FSIGwk9s3dD1UVJFYepd8r8AzmGSTJeNT0I6X12O2ZCjalIsH8ddRA9HbnvUC/CE/PuF610+1OHST4/3/a0uV2vwcT10uB9M1GlwrAKHZefHxkcpMR3LF76goKivCP8G+sRpHveciWgUS6/OvGsh32EQB+mpAspQXWnyqsqZLGcDJhsmHb5IsssJJwnBjgWtAzY/2xlwP2DuTZgV+wMnytm4+IIZSXcvqPKGlQF+Nacjq6zbYWmPa5EDtzm3r/ECm7eKL7Q5V+jq6vcjC+q98Q1H8XYwL9SySV8N6bYDKTuhQsbdBmYgxDF9ebizPnLho8m/cAmPNHfKBG35AhoNeF9eTcalxEqdthr3Ii9mbtYORRaR6vBJOgPymrcxJ77L2ZxjeoAou546hjHnHJpw0zXBYBkF83o+mcNTuHjHUz99OLfXV8gA4j8mfpmU+cRzQipnKcftkSUO0uIiSXP/bGeeej82fVQi6WYTrHhxIm8W8KHJiaI7f/cpTRZDkG0Pes36163vClgCg3KxD1RIJQ/rE4xPJS2TD5TmgF3aW9yHR1vxtQomeC4mESoxMQ0Q3Axp4ar/l6zjvwWr/z4mxExBAmV30NmuON3JAKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(6916009)(31696002)(316002)(956004)(6486002)(2906002)(36756003)(478600001)(30864003)(86362001)(16576012)(8676002)(31686004)(8936002)(38100700002)(2616005)(66556008)(83380400001)(186003)(66476007)(66946007)(5660300002)(26005)(54906003)(4326008)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0xRQmFRZGRQaEdNQVhUWmdYUFNyS0RoZlMxZk5ZSFBEN3QvLzJ1djZ6bEVP?=
 =?utf-8?B?SEdoTEVncGJab0hpVXo1SnlMV0RDMWFiN2pncFlHeVoxMjJlTmw2Q1RsYkVM?=
 =?utf-8?B?TmFqd1c4R28yUnMrVWFSUEd1VmlwbDE0ZXh6MTM0U3g5ak95aXV4Zk9iZ3lJ?=
 =?utf-8?B?ZEsvWDNBajRRK0wvemNuc0NmcmkrVkhTWlFzTHRJYXBBTzdFLzUyMlBRVS9m?=
 =?utf-8?B?TFh0dnJnQUt2SHRIaXV1aFY5amRUSWtHdFFmZFpFRHZKMXlHbHR4WmUzWk80?=
 =?utf-8?B?WTNBTUZRQUJRYTBGbXJacTdSTkxjamU3dDJIQVlieHViczJIV3phZUZYU3dk?=
 =?utf-8?B?eS9saUVXcEZhS2lmdjB5MTNqQUxrRTQrYTJHcDVDRWlua0xOajhIb3ZhQnNZ?=
 =?utf-8?B?Nkc0amkrd2xBL3RxL0VENFIwV2hweTFSVExIUk5FU3FmRmplZkRwazd2UEJv?=
 =?utf-8?B?VlVvVThtUkFra1hGM0RPcDZMQmZOZmNFMDQ1RE45M0JEeW1JMEFkaTdPVTNw?=
 =?utf-8?B?NFpuQjlRd2tXdG5FR1hLZm5EeUlIL01GNDlWZmtxVHNXR29zejRLZ1BXTnA3?=
 =?utf-8?B?ZEw1ZWFxbXBPM2V1d01LeU5YckY0anJ0Mk9iTDBLaGd0dWk3ZGhCcjFCZTdP?=
 =?utf-8?B?Y3VnbHZYNlFHaE5EZmp2NiszcklyNzB1ZUI2bEdJK0dFQzNpa0tCNi9kUVha?=
 =?utf-8?B?ZE5SRWdCMnBpV0lwS2lqaEJCRysrUWhZc3FJZm02UmF0NmpDTWhzeVpGTjVC?=
 =?utf-8?B?TkhuaU5pYnl4c3RPQnU1WHdWa2piZXZObFU1SEtxM0w3dG5qbjYreXB4MHVH?=
 =?utf-8?B?U244QW1LYyttN3ZvNmtwWG4wY2lZNUR5ajQ4NXZaQzFKZmczVTdtMURBNHlI?=
 =?utf-8?B?UHpaekJnVUt6TlBQSnYvS1crODV1aXlTbnBwVHlNS0lBQkFuWlNmU0J5bFZm?=
 =?utf-8?B?UjVmZ0REYXA1d2djYkFXaE9TUXVsdEtldUtwZytnSjAxUjd4Qi95NnBGd21n?=
 =?utf-8?B?WVJJWWJwWFF5V0pEajFaa3Q5cXJ3Y21jZ01OdGJjL3JoR2o3Z0w3RVJBS0RB?=
 =?utf-8?B?YWFjZUROb1BCUDIrR1lDTFA3U3Nvb0lBaCsyS3ViM2FleGdiTW5XeVhtRDNM?=
 =?utf-8?B?bzBLRFoycHVNbThPdnNOcHZTUklGTUI0Y0ZlZXU5WXRhRXRrcEtIYkVoZlBP?=
 =?utf-8?B?c2FWamczYXhnL3MzSFZBTDUxR1JsNTFWWUxvNXY5ZGQreUIraGIxVWZ3YmdV?=
 =?utf-8?B?M21RTm81SVd3b2tCb2crK1lVSnhKZytWTFg2bHZvSUp0SU5mNENjeGZFQWRy?=
 =?utf-8?B?MVJCK3lOcmNsckxZdDFkd3dEMHFzRVB5aEpRN2p4aTJpSFN2SFQ3enlZTkdZ?=
 =?utf-8?B?QU92VTdDbUs3cEszSjhHK2lJTHZScmdQbmRoeE1sNDh2ZEZRYy9DSkZqOUN3?=
 =?utf-8?B?YVBuZWk5UVY3bGJ1aHdSdHRldVV3cW12N1FDSHNTVU5idjhKTURPNnB3S29N?=
 =?utf-8?B?RXNLdFY5aFMzVHh1NXZwWnVKclZOMmhzam42T1lyb3NCYjdXeDNHczcrOWhK?=
 =?utf-8?B?ZkZrUUJiYlJGTW5MOXlBWDZVU2MrUlEvc0JBeHVoUzdDdGRvUG1peCsyYmhO?=
 =?utf-8?B?M3dSYnlBQXhDRE9sUnVrbXpkNHZQeGY4dEgvL2NFOEZOcTltb1NNaGJYMEVR?=
 =?utf-8?B?ZE5YWGduaWl3d2lNYVRxbDlwN2RYOU5XZmRtVzRUWVRrYmdGRFd5VE1icnJI?=
 =?utf-8?Q?KQWXlDvMUDy/AqKRgiSDeQ+REJydOUwoZ+yDEDb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e06b252-5fec-4704-4d62-08d95cc30b3a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 12:25:02.7553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IruX2bTsLOHGc8BUadRGOcrLU2CR15E5J/kzrhhg+qqhuXqQZNui5LRsTxgX2aa2DedmgwGPenEmUS6cKcYwDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2335

The function is already non-trivial and is expected to further grow.

Code moved gets slightly adjusted in a few places, e.g. replacing EXC_*
by X86_EXC_* (such that EXC_* don't need to move as well; we want these
to be phased out anyway).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -252,7 +252,7 @@ endif # 32-bit override
 
 OBJS := x86-emulate.o cpuid.o test_x86_emulator.o evex-disp8.o predicates.o wrappers.o
 OBJS += x86_emulate/0f01.o x86_emulate/0fae.o x86_emulate/0fc7.o
-OBJS += x86_emulate/decode.o x86_emulate/fpu.o
+OBJS += x86_emulate/blk.o x86_emulate/decode.o x86_emulate/fpu.o
 
 $(TARGET): $(OBJS)
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $^
--- a/tools/tests/x86_emulator/x86-emulate.c
+++ b/tools/tests/x86_emulator/x86-emulate.c
@@ -35,7 +35,10 @@ static bool use_xsave;
  * (When debugging the emulator, care needs to be taken when inserting
  * printf() or alike function calls into regions using this.)
  */
-#define FXSAVE_AREA ((struct x86_fxsr *)fpu_save_area)
+struct x86_fxsr *get_fpu_save_area(void)
+{
+    return (void *)fpu_save_area;
+}
 
 void emul_save_fpu_state(void)
 {
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -83,6 +83,8 @@ bool emul_test_init(void);
 void emul_save_fpu_state(void);
 void emul_restore_fpu_state(void);
 
+struct x86_fxsr *get_fpu_save_area(void);
+
 /*
  * In order to reasonably use the above, wrap library calls we use and which we
  * think might access any of the FPU state into wrappers saving/restoring state
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -24,8 +24,6 @@
 #define cpu_has_amd_erratum(nr) \
         cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
 
-#define FXSAVE_AREA current->arch.fpu_ctxt
-
 #include "x86_emulate/x86_emulate.c"
 
 int x86emul_read_xcr(unsigned int reg, uint64_t *val,
--- a/xen/arch/x86/x86_emulate/Makefile
+++ b/xen/arch/x86/x86_emulate/Makefile
@@ -1,5 +1,6 @@
 obj-y += 0f01.o
 obj-y += 0fae.o
 obj-y += 0fc7.o
+obj-y += blk.o
 obj-y += decode.o
 obj-$(CONFIG_HVM) += fpu.o
--- /dev/null
+++ b/xen/arch/x86/x86_emulate/blk.c
@@ -0,0 +1,396 @@
+/******************************************************************************
+ * blk.c - helper for x86_emulate.c
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
+#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
+    !defined(X86EMUL_NO_SIMD)
+# ifdef __XEN__
+#  include <asm/xstate.h>
+#  define FXSAVE_AREA current->arch.fpu_ctxt
+# else
+#  define FXSAVE_AREA get_fpu_save_area()
+# endif
+#endif
+
+int x86_emul_blk(
+    void *ptr,
+    void *data,
+    unsigned int bytes,
+    uint32_t *eflags,
+    struct x86_emulate_state *s,
+    struct x86_emulate_ctxt *ctxt)
+{
+    int rc = X86EMUL_OKAY;
+
+    switch ( s->blk )
+    {
+        bool zf;
+#ifndef X86EMUL_NO_FPU
+        struct {
+            struct x87_env32 env;
+            struct {
+               uint8_t bytes[10];
+            } freg[8];
+        } fpstate;
+#endif
+
+        /*
+         * Throughout this switch(), memory clobbers are used to compensate
+         * that other operands may not properly express the (full) memory
+         * ranges covered.
+         */
+    case blk_enqcmd:
+        ASSERT(bytes == 64);
+        if ( ((unsigned long)ptr & 0x3f) )
+        {
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+        *eflags &= ~EFLAGS_MASK;
+#ifdef HAVE_AS_ENQCMD
+        asm ( "enqcmds (%[src]), %[dst]" ASM_FLAG_OUT(, "; setz %[zf]")
+              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
+              : [src] "r" (data), [dst] "r" (ptr) : "memory" );
+#else
+        /* enqcmds (%rsi), %rdi */
+        asm ( ".byte 0xf3, 0x0f, 0x38, 0xf8, 0x3e"
+              ASM_FLAG_OUT(, "; setz %[zf]")
+              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
+              : "S" (data), "D" (ptr) : "memory" );
+#endif
+        if ( zf )
+            *eflags |= X86_EFLAGS_ZF;
+        break;
+
+#ifndef X86EMUL_NO_FPU
+
+    case blk_fld:
+        ASSERT(!data);
+
+        /* s->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
+        switch ( bytes )
+        {
+        case sizeof(fpstate.env): /* 32-bit FLDENV */
+        case sizeof(fpstate):     /* 32-bit FRSTOR */
+            memcpy(&fpstate.env, ptr, sizeof(fpstate.env));
+            if ( !s->rex_prefix )
+            {
+                /* Convert 32-bit real/vm86 to 32-bit prot format. */
+                unsigned int fip = fpstate.env.mode.real.fip_lo +
+                                   (fpstate.env.mode.real.fip_hi << 16);
+                unsigned int fdp = fpstate.env.mode.real.fdp_lo +
+                                   (fpstate.env.mode.real.fdp_hi << 16);
+                unsigned int fop = fpstate.env.mode.real.fop;
+
+                fpstate.env.mode.prot.fip = fip & 0xf;
+                fpstate.env.mode.prot.fcs = fip >> 4;
+                fpstate.env.mode.prot.fop = fop;
+                fpstate.env.mode.prot.fdp = fdp & 0xf;
+                fpstate.env.mode.prot.fds = fdp >> 4;
+            }
+
+            if ( bytes == sizeof(fpstate.env) )
+                ptr = NULL;
+            else
+                ptr += sizeof(fpstate.env);
+            break;
+
+        case sizeof(struct x87_env16):                        /* 16-bit FLDENV */
+        case sizeof(struct x87_env16) + sizeof(fpstate.freg): /* 16-bit FRSTOR */
+        {
+            const struct x87_env16 *env = ptr;
+
+            fpstate.env.fcw = env->fcw;
+            fpstate.env.fsw = env->fsw;
+            fpstate.env.ftw = env->ftw;
+
+            if ( s->rex_prefix )
+            {
+                /* Convert 16-bit prot to 32-bit prot format. */
+                fpstate.env.mode.prot.fip = env->mode.prot.fip;
+                fpstate.env.mode.prot.fcs = env->mode.prot.fcs;
+                fpstate.env.mode.prot.fdp = env->mode.prot.fdp;
+                fpstate.env.mode.prot.fds = env->mode.prot.fds;
+                fpstate.env.mode.prot.fop = 0; /* unknown */
+            }
+            else
+            {
+                /* Convert 16-bit real/vm86 to 32-bit prot format. */
+                unsigned int fip = env->mode.real.fip_lo +
+                                   (env->mode.real.fip_hi << 16);
+                unsigned int fdp = env->mode.real.fdp_lo +
+                                   (env->mode.real.fdp_hi << 16);
+                unsigned int fop = env->mode.real.fop;
+
+                fpstate.env.mode.prot.fip = fip & 0xf;
+                fpstate.env.mode.prot.fcs = fip >> 4;
+                fpstate.env.mode.prot.fop = fop;
+                fpstate.env.mode.prot.fdp = fdp & 0xf;
+                fpstate.env.mode.prot.fds = fdp >> 4;
+            }
+
+            if ( bytes == sizeof(*env) )
+                ptr = NULL;
+            else
+                ptr += sizeof(*env);
+            break;
+        }
+
+        default:
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+
+        if ( ptr )
+        {
+            memcpy(fpstate.freg, ptr, sizeof(fpstate.freg));
+            asm volatile ( "frstor %0" :: "m" (fpstate) );
+        }
+        else
+            asm volatile ( "fldenv %0" :: "m" (fpstate.env) );
+        break;
+
+    case blk_fst:
+        ASSERT(!data);
+
+        /* Don't chance consuming uninitialized data. */
+        memset(&fpstate, 0, sizeof(fpstate));
+        if ( bytes > sizeof(fpstate.env) )
+            asm ( "fnsave %0" : "+m" (fpstate) );
+        else
+            asm ( "fnstenv %0" : "+m" (fpstate.env) );
+
+        /* s->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
+        switch ( bytes )
+        {
+        case sizeof(fpstate.env): /* 32-bit FNSTENV */
+        case sizeof(fpstate):     /* 32-bit FNSAVE */
+            if ( !s->rex_prefix )
+            {
+                /* Convert 32-bit prot to 32-bit real/vm86 format. */
+                unsigned int fip = fpstate.env.mode.prot.fip +
+                                   (fpstate.env.mode.prot.fcs << 4);
+                unsigned int fdp = fpstate.env.mode.prot.fdp +
+                                   (fpstate.env.mode.prot.fds << 4);
+                unsigned int fop = fpstate.env.mode.prot.fop;
+
+                memset(&fpstate.env.mode, 0, sizeof(fpstate.env.mode));
+                fpstate.env.mode.real.fip_lo = fip;
+                fpstate.env.mode.real.fip_hi = fip >> 16;
+                fpstate.env.mode.real.fop = fop;
+                fpstate.env.mode.real.fdp_lo = fdp;
+                fpstate.env.mode.real.fdp_hi = fdp >> 16;
+            }
+            memcpy(ptr, &fpstate.env, sizeof(fpstate.env));
+            if ( bytes == sizeof(fpstate.env) )
+                ptr = NULL;
+            else
+                ptr += sizeof(fpstate.env);
+            break;
+
+        case sizeof(struct x87_env16):                        /* 16-bit FNSTENV */
+        case sizeof(struct x87_env16) + sizeof(fpstate.freg): /* 16-bit FNSAVE */
+            if ( s->rex_prefix )
+            {
+                /* Convert 32-bit prot to 16-bit prot format. */
+                struct x87_env16 *env = ptr;
+
+                env->fcw = fpstate.env.fcw;
+                env->fsw = fpstate.env.fsw;
+                env->ftw = fpstate.env.ftw;
+                env->mode.prot.fip = fpstate.env.mode.prot.fip;
+                env->mode.prot.fcs = fpstate.env.mode.prot.fcs;
+                env->mode.prot.fdp = fpstate.env.mode.prot.fdp;
+                env->mode.prot.fds = fpstate.env.mode.prot.fds;
+            }
+            else
+            {
+                /* Convert 32-bit prot to 16-bit real/vm86 format. */
+                unsigned int fip = fpstate.env.mode.prot.fip +
+                                   (fpstate.env.mode.prot.fcs << 4);
+                unsigned int fdp = fpstate.env.mode.prot.fdp +
+                                   (fpstate.env.mode.prot.fds << 4);
+                struct x87_env16 env = {
+                    .fcw = fpstate.env.fcw,
+                    .fsw = fpstate.env.fsw,
+                    .ftw = fpstate.env.ftw,
+                    .mode.real.fip_lo = fip,
+                    .mode.real.fip_hi = fip >> 16,
+                    .mode.real.fop = fpstate.env.mode.prot.fop,
+                    .mode.real.fdp_lo = fdp,
+                    .mode.real.fdp_hi = fdp >> 16
+                };
+
+                memcpy(ptr, &env, sizeof(env));
+            }
+            if ( bytes == sizeof(struct x87_env16) )
+                ptr = NULL;
+            else
+                ptr += sizeof(struct x87_env16);
+            break;
+
+        default:
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+
+        if ( ptr )
+            memcpy(ptr, fpstate.freg, sizeof(fpstate.freg));
+        break;
+
+#endif /* X86EMUL_NO_FPU */
+
+#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
+    !defined(X86EMUL_NO_SIMD)
+
+    case blk_fxrstor:
+    {
+        struct x86_fxsr *fxsr = FXSAVE_AREA;
+
+        ASSERT(!data);
+        ASSERT(bytes == sizeof(*fxsr));
+        ASSERT(s->op_bytes <= bytes);
+
+        if ( s->op_bytes < sizeof(*fxsr) )
+        {
+            if ( s->rex_prefix & REX_W )
+            {
+                /*
+                 * The only way to force fxsaveq on a wide range of gas
+                 * versions. On older versions the rex64 prefix works only if
+                 * we force an addressing mode that doesn't require extended
+                 * registers.
+                 */
+                asm volatile ( ".byte 0x48; fxsave (%1)"
+                               : "=m" (*fxsr) : "R" (fxsr) );
+            }
+            else
+                asm volatile ( "fxsave %0" : "=m" (*fxsr) );
+        }
+
+        /*
+         * Don't chance the reserved or available ranges to contain any
+         * data FXRSTOR may actually consume in some way: Copy only the
+         * defined portion, and zero the rest.
+         */
+        memcpy(fxsr, ptr, min(s->op_bytes,
+                              (unsigned int)offsetof(struct x86_fxsr, rsvd)));
+        memset(fxsr->rsvd, 0, sizeof(*fxsr) - offsetof(struct x86_fxsr, rsvd));
+
+        generate_exception_if(fxsr->mxcsr & ~mxcsr_mask, X86_EXC_GP, 0);
+
+        if ( s->rex_prefix & REX_W )
+        {
+            /* See above for why operand/constraints are this way. */
+            asm volatile ( ".byte 0x48; fxrstor (%1)"
+                           :: "m" (*fxsr), "R" (fxsr) );
+        }
+        else
+            asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
+        break;
+    }
+
+    case blk_fxsave:
+    {
+        struct x86_fxsr *fxsr = FXSAVE_AREA;
+
+        ASSERT(!data);
+        ASSERT(bytes == sizeof(*fxsr));
+        ASSERT(s->op_bytes <= bytes);
+
+        if ( s->op_bytes < sizeof(*fxsr) )
+            /* Don't chance consuming uninitialized data. */
+            memset(fxsr, 0, s->op_bytes);
+        else
+            fxsr = ptr;
+
+        if ( s->rex_prefix & REX_W )
+        {
+            /* See above for why operand/constraints are this way. */
+            asm volatile ( ".byte 0x48; fxsave (%1)"
+                           : "=m" (*fxsr) : "R" (fxsr) );
+        }
+        else
+            asm volatile ( "fxsave %0" : "=m" (*fxsr) );
+
+        if ( fxsr != ptr ) /* i.e. s->op_bytes < sizeof(*fxsr) */
+            memcpy(ptr, fxsr, s->op_bytes);
+        break;
+    }
+
+#endif /* X86EMUL_NO_{FPU,MMX,SIMD} */
+
+    case blk_movdir:
+        switch ( bytes )
+        {
+#ifdef __x86_64__
+        case sizeof(uint32_t):
+# ifdef HAVE_AS_MOVDIR
+            asm ( "movdiri %0, (%1)"
+                  :: "r" (*(uint32_t *)data), "r" (ptr) : "memory" );
+# else
+            /* movdiri %esi, (%rdi) */
+            asm ( ".byte 0x0f, 0x38, 0xf9, 0x37"
+                  :: "S" (*(uint32_t *)data), "D" (ptr) : "memory" );
+# endif
+            break;
+#endif
+
+        case sizeof(unsigned long):
+#ifdef HAVE_AS_MOVDIR
+            asm ( "movdiri %0, (%1)"
+                  :: "r" (*(unsigned long *)data), "r" (ptr) : "memory" );
+#else
+            /* movdiri %rsi, (%rdi) */
+            asm ( ".byte 0x48, 0x0f, 0x38, 0xf9, 0x37"
+                  :: "S" (*(unsigned long *)data), "D" (ptr) : "memory" );
+#endif
+            break;
+
+        case 64:
+            if ( ((unsigned long)ptr & 0x3f) )
+            {
+                ASSERT_UNREACHABLE();
+                return X86EMUL_UNHANDLEABLE;
+            }
+#ifdef HAVE_AS_MOVDIR
+            asm ( "movdir64b (%0), %1" :: "r" (data), "r" (ptr) : "memory" );
+#else
+            /* movdir64b (%rsi), %rdi */
+            asm ( ".byte 0x66, 0x0f, 0x38, 0xf8, 0x3e"
+                  :: "S" (data), "D" (ptr) : "memory" );
+#endif
+            break;
+
+        default:
+            ASSERT_UNREACHABLE();
+            return X86EMUL_UNHANDLEABLE;
+        }
+        break;
+
+    default:
+        ASSERT_UNREACHABLE();
+        return X86EMUL_UNHANDLEABLE;
+    }
+
+ done: __maybe_unused;
+    return rc;
+
+}
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -8342,371 +8342,6 @@ int x86_emul_rmw(
     return X86EMUL_OKAY;
 }
 
-int x86_emul_blk(
-    void *ptr,
-    void *data,
-    unsigned int bytes,
-    uint32_t *eflags,
-    struct x86_emulate_state *state,
-    struct x86_emulate_ctxt *ctxt)
-{
-    int rc = X86EMUL_OKAY;
-
-    switch ( state->blk )
-    {
-        bool zf;
-#ifndef X86EMUL_NO_FPU
-        struct {
-            struct x87_env32 env;
-            struct {
-               uint8_t bytes[10];
-            } freg[8];
-        } fpstate;
-#endif
-
-        /*
-         * Throughout this switch(), memory clobbers are used to compensate
-         * that other operands may not properly express the (full) memory
-         * ranges covered.
-         */
-    case blk_enqcmd:
-        ASSERT(bytes == 64);
-        if ( ((unsigned long)ptr & 0x3f) )
-        {
-            ASSERT_UNREACHABLE();
-            return X86EMUL_UNHANDLEABLE;
-        }
-        *eflags &= ~EFLAGS_MASK;
-#ifdef HAVE_AS_ENQCMD
-        asm ( "enqcmds (%[src]), %[dst]" ASM_FLAG_OUT(, "; setz %[zf]")
-              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
-              : [src] "r" (data), [dst] "r" (ptr) : "memory" );
-#else
-        /* enqcmds (%rsi), %rdi */
-        asm ( ".byte 0xf3, 0x0f, 0x38, 0xf8, 0x3e"
-              ASM_FLAG_OUT(, "; setz %[zf]")
-              : [zf] ASM_FLAG_OUT("=@ccz", "=qm") (zf)
-              : "S" (data), "D" (ptr) : "memory" );
-#endif
-        if ( zf )
-            *eflags |= X86_EFLAGS_ZF;
-        break;
-
-#ifndef X86EMUL_NO_FPU
-
-    case blk_fld:
-        ASSERT(!data);
-
-        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
-        switch ( bytes )
-        {
-        case sizeof(fpstate.env): /* 32-bit FLDENV */
-        case sizeof(fpstate):     /* 32-bit FRSTOR */
-            memcpy(&fpstate.env, ptr, sizeof(fpstate.env));
-            if ( !state->rex_prefix )
-            {
-                /* Convert 32-bit real/vm86 to 32-bit prot format. */
-                unsigned int fip = fpstate.env.mode.real.fip_lo +
-                                   (fpstate.env.mode.real.fip_hi << 16);
-                unsigned int fdp = fpstate.env.mode.real.fdp_lo +
-                                   (fpstate.env.mode.real.fdp_hi << 16);
-                unsigned int fop = fpstate.env.mode.real.fop;
-
-                fpstate.env.mode.prot.fip = fip & 0xf;
-                fpstate.env.mode.prot.fcs = fip >> 4;
-                fpstate.env.mode.prot.fop = fop;
-                fpstate.env.mode.prot.fdp = fdp & 0xf;
-                fpstate.env.mode.prot.fds = fdp >> 4;
-            }
-
-            if ( bytes == sizeof(fpstate.env) )
-                ptr = NULL;
-            else
-                ptr += sizeof(fpstate.env);
-            break;
-
-        case sizeof(struct x87_env16):                        /* 16-bit FLDENV */
-        case sizeof(struct x87_env16) + sizeof(fpstate.freg): /* 16-bit FRSTOR */
-        {
-            const struct x87_env16 *env = ptr;
-
-            fpstate.env.fcw = env->fcw;
-            fpstate.env.fsw = env->fsw;
-            fpstate.env.ftw = env->ftw;
-
-            if ( state->rex_prefix )
-            {
-                /* Convert 16-bit prot to 32-bit prot format. */
-                fpstate.env.mode.prot.fip = env->mode.prot.fip;
-                fpstate.env.mode.prot.fcs = env->mode.prot.fcs;
-                fpstate.env.mode.prot.fdp = env->mode.prot.fdp;
-                fpstate.env.mode.prot.fds = env->mode.prot.fds;
-                fpstate.env.mode.prot.fop = 0; /* unknown */
-            }
-            else
-            {
-                /* Convert 16-bit real/vm86 to 32-bit prot format. */
-                unsigned int fip = env->mode.real.fip_lo +
-                                   (env->mode.real.fip_hi << 16);
-                unsigned int fdp = env->mode.real.fdp_lo +
-                                   (env->mode.real.fdp_hi << 16);
-                unsigned int fop = env->mode.real.fop;
-
-                fpstate.env.mode.prot.fip = fip & 0xf;
-                fpstate.env.mode.prot.fcs = fip >> 4;
-                fpstate.env.mode.prot.fop = fop;
-                fpstate.env.mode.prot.fdp = fdp & 0xf;
-                fpstate.env.mode.prot.fds = fdp >> 4;
-            }
-
-            if ( bytes == sizeof(*env) )
-                ptr = NULL;
-            else
-                ptr += sizeof(*env);
-            break;
-        }
-
-        default:
-            ASSERT_UNREACHABLE();
-            return X86EMUL_UNHANDLEABLE;
-        }
-
-        if ( ptr )
-        {
-            memcpy(fpstate.freg, ptr, sizeof(fpstate.freg));
-            asm volatile ( "frstor %0" :: "m" (fpstate) );
-        }
-        else
-            asm volatile ( "fldenv %0" :: "m" (fpstate.env) );
-        break;
-
-    case blk_fst:
-        ASSERT(!data);
-
-        /* Don't chance consuming uninitialized data. */
-        memset(&fpstate, 0, sizeof(fpstate));
-        if ( bytes > sizeof(fpstate.env) )
-            asm ( "fnsave %0" : "+m" (fpstate) );
-        else
-            asm ( "fnstenv %0" : "+m" (fpstate.env) );
-
-        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
-        switch ( bytes )
-        {
-        case sizeof(fpstate.env): /* 32-bit FNSTENV */
-        case sizeof(fpstate):     /* 32-bit FNSAVE */
-            if ( !state->rex_prefix )
-            {
-                /* Convert 32-bit prot to 32-bit real/vm86 format. */
-                unsigned int fip = fpstate.env.mode.prot.fip +
-                                   (fpstate.env.mode.prot.fcs << 4);
-                unsigned int fdp = fpstate.env.mode.prot.fdp +
-                                   (fpstate.env.mode.prot.fds << 4);
-                unsigned int fop = fpstate.env.mode.prot.fop;
-
-                memset(&fpstate.env.mode, 0, sizeof(fpstate.env.mode));
-                fpstate.env.mode.real.fip_lo = fip;
-                fpstate.env.mode.real.fip_hi = fip >> 16;
-                fpstate.env.mode.real.fop = fop;
-                fpstate.env.mode.real.fdp_lo = fdp;
-                fpstate.env.mode.real.fdp_hi = fdp >> 16;
-            }
-            memcpy(ptr, &fpstate.env, sizeof(fpstate.env));
-            if ( bytes == sizeof(fpstate.env) )
-                ptr = NULL;
-            else
-                ptr += sizeof(fpstate.env);
-            break;
-
-        case sizeof(struct x87_env16):                        /* 16-bit FNSTENV */
-        case sizeof(struct x87_env16) + sizeof(fpstate.freg): /* 16-bit FNSAVE */
-            if ( state->rex_prefix )
-            {
-                /* Convert 32-bit prot to 16-bit prot format. */
-                struct x87_env16 *env = ptr;
-
-                env->fcw = fpstate.env.fcw;
-                env->fsw = fpstate.env.fsw;
-                env->ftw = fpstate.env.ftw;
-                env->mode.prot.fip = fpstate.env.mode.prot.fip;
-                env->mode.prot.fcs = fpstate.env.mode.prot.fcs;
-                env->mode.prot.fdp = fpstate.env.mode.prot.fdp;
-                env->mode.prot.fds = fpstate.env.mode.prot.fds;
-            }
-            else
-            {
-                /* Convert 32-bit prot to 16-bit real/vm86 format. */
-                unsigned int fip = fpstate.env.mode.prot.fip +
-                                   (fpstate.env.mode.prot.fcs << 4);
-                unsigned int fdp = fpstate.env.mode.prot.fdp +
-                                   (fpstate.env.mode.prot.fds << 4);
-                struct x87_env16 env = {
-                    .fcw = fpstate.env.fcw,
-                    .fsw = fpstate.env.fsw,
-                    .ftw = fpstate.env.ftw,
-                    .mode.real.fip_lo = fip,
-                    .mode.real.fip_hi = fip >> 16,
-                    .mode.real.fop = fpstate.env.mode.prot.fop,
-                    .mode.real.fdp_lo = fdp,
-                    .mode.real.fdp_hi = fdp >> 16
-                };
-
-                memcpy(ptr, &env, sizeof(env));
-            }
-            if ( bytes == sizeof(struct x87_env16) )
-                ptr = NULL;
-            else
-                ptr += sizeof(struct x87_env16);
-            break;
-
-        default:
-            ASSERT_UNREACHABLE();
-            return X86EMUL_UNHANDLEABLE;
-        }
-
-        if ( ptr )
-            memcpy(ptr, fpstate.freg, sizeof(fpstate.freg));
-        break;
-
-#endif /* X86EMUL_NO_FPU */
-
-#if !defined(X86EMUL_NO_FPU) || !defined(X86EMUL_NO_MMX) || \
-    !defined(X86EMUL_NO_SIMD)
-
-    case blk_fxrstor:
-    {
-        struct x86_fxsr *fxsr = FXSAVE_AREA;
-
-        ASSERT(!data);
-        ASSERT(bytes == sizeof(*fxsr));
-        ASSERT(state->op_bytes <= bytes);
-
-        if ( state->op_bytes < sizeof(*fxsr) )
-        {
-            if ( state->rex_prefix & REX_W )
-            {
-                /*
-                 * The only way to force fxsaveq on a wide range of gas
-                 * versions. On older versions the rex64 prefix works only if
-                 * we force an addressing mode that doesn't require extended
-                 * registers.
-                 */
-                asm volatile ( ".byte 0x48; fxsave (%1)"
-                               : "=m" (*fxsr) : "R" (fxsr) );
-            }
-            else
-                asm volatile ( "fxsave %0" : "=m" (*fxsr) );
-        }
-
-        /*
-         * Don't chance the reserved or available ranges to contain any
-         * data FXRSTOR may actually consume in some way: Copy only the
-         * defined portion, and zero the rest.
-         */
-        memcpy(fxsr, ptr, min(state->op_bytes,
-                              (unsigned int)offsetof(struct x86_fxsr, rsvd)));
-        memset(fxsr->rsvd, 0, sizeof(*fxsr) - offsetof(struct x86_fxsr, rsvd));
-
-        generate_exception_if(fxsr->mxcsr & ~mxcsr_mask, EXC_GP, 0);
-
-        if ( state->rex_prefix & REX_W )
-        {
-            /* See above for why operand/constraints are this way. */
-            asm volatile ( ".byte 0x48; fxrstor (%1)"
-                           :: "m" (*fxsr), "R" (fxsr) );
-        }
-        else
-            asm volatile ( "fxrstor %0" :: "m" (*fxsr) );
-        break;
-    }
-
-    case blk_fxsave:
-    {
-        struct x86_fxsr *fxsr = FXSAVE_AREA;
-
-        ASSERT(!data);
-        ASSERT(bytes == sizeof(*fxsr));
-        ASSERT(state->op_bytes <= bytes);
-
-        if ( state->op_bytes < sizeof(*fxsr) )
-            /* Don't chance consuming uninitialized data. */
-            memset(fxsr, 0, state->op_bytes);
-        else
-            fxsr = ptr;
-
-        if ( state->rex_prefix & REX_W )
-        {
-            /* See above for why operand/constraints are this way. */
-            asm volatile ( ".byte 0x48; fxsave (%1)"
-                           : "=m" (*fxsr) : "R" (fxsr) );
-        }
-        else
-            asm volatile ( "fxsave %0" : "=m" (*fxsr) );
-
-        if ( fxsr != ptr ) /* i.e. state->op_bytes < sizeof(*fxsr) */
-            memcpy(ptr, fxsr, state->op_bytes);
-        break;
-    }
-
-#endif /* X86EMUL_NO_{FPU,MMX,SIMD} */
-
-    case blk_movdir:
-        switch ( bytes )
-        {
-#ifdef __x86_64__
-        case sizeof(uint32_t):
-# ifdef HAVE_AS_MOVDIR
-            asm ( "movdiri %0, (%1)"
-                  :: "r" (*(uint32_t *)data), "r" (ptr) : "memory" );
-# else
-            /* movdiri %esi, (%rdi) */
-            asm ( ".byte 0x0f, 0x38, 0xf9, 0x37"
-                  :: "S" (*(uint32_t *)data), "D" (ptr) : "memory" );
-# endif
-            break;
-#endif
-
-        case sizeof(unsigned long):
-#ifdef HAVE_AS_MOVDIR
-            asm ( "movdiri %0, (%1)"
-                  :: "r" (*(unsigned long *)data), "r" (ptr) : "memory" );
-#else
-            /* movdiri %rsi, (%rdi) */
-            asm ( ".byte 0x48, 0x0f, 0x38, 0xf9, 0x37"
-                  :: "S" (*(unsigned long *)data), "D" (ptr) : "memory" );
-#endif
-            break;
-
-        case 64:
-            if ( ((unsigned long)ptr & 0x3f) )
-            {
-                ASSERT_UNREACHABLE();
-                return X86EMUL_UNHANDLEABLE;
-            }
-#ifdef HAVE_AS_MOVDIR
-            asm ( "movdir64b (%0), %1" :: "r" (data), "r" (ptr) : "memory" );
-#else
-            /* movdir64b (%rsi), %rdi */
-            asm ( ".byte 0x66, 0x0f, 0x38, 0xf8, 0x3e"
-                  :: "S" (data), "D" (ptr) : "memory" );
-#endif
-            break;
-
-        default:
-            ASSERT_UNREACHABLE();
-            return X86EMUL_UNHANDLEABLE;
-        }
-        break;
-
-    default:
-        ASSERT_UNREACHABLE();
-        return X86EMUL_UNHANDLEABLE;
-    }
-
- done:
-    return rc;
-}
-
 static void __init __maybe_unused build_assertions(void)
 {
     /* Check the values against SReg3 encoding in opcode/ModRM bytes. */


