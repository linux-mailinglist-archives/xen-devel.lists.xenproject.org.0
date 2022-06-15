Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA57D54C543
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jun 2022 11:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.349825.576002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1PoK-0002gC-T9; Wed, 15 Jun 2022 09:59:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 349825.576002; Wed, 15 Jun 2022 09:59:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1PoK-0002cl-PW; Wed, 15 Jun 2022 09:59:40 +0000
Received: by outflank-mailman (input) for mailman id 349825;
 Wed, 15 Jun 2022 09:59:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56zs=WW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o1PoJ-0001TN-MF
 for xen-devel@lists.xenproject.org; Wed, 15 Jun 2022 09:59:39 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe05::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de02b9c9-ec91-11ec-ab14-113154c10af9;
 Wed, 15 Jun 2022 11:59:38 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8922.eurprd04.prod.outlook.com (2603:10a6:20b:409::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 09:59:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 09:59:36 +0000
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
X-Inumbo-ID: de02b9c9-ec91-11ec-ab14-113154c10af9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNe8LEEZWxjBrCsFS7IJuqE3+1ANxIKvq9N2H9BEDN/zzE2FAskXtodo/QMPLdKnz8MslgfBhF+m0GHSCLYNTtBeUlQK2sbwZRuS4SCcatx9KcmfJxQDzyyZfxKY4qo4dyNHlxfVcyEQsNTRrKnw/QFRvR+BMUQ3zwyGDpHPoEk22JVl1lF3q2tOFxnSEv8NhxXR60Jd66Be8pYK+t11PVAPJvlNTvFa4mmqghrAo6K92r/l7rfhTqbnHxhiclNm0Oz7vcQto2ChR7ARJLLUwhDv1MhX9oJAT/6RaaGYqg07IXyIvQnFC8owUlh36Beroo2GGA/Mi3bSXoQfNk6B/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5zbvUxTlo91kq8asGmhJhb2DvmA+qtPqitP5H4Nzl0=;
 b=Dqv1BXtsa42JL+PQH2Zg8KSZA8FDfiTtPlkd4glWANaFQOThYYpxCdiU9nSP5oH1l80YuycOns5e7zNXOF6ix+MS9Rp73jl+RTBr9KaK0XFSeA2LbLikG89+ZdxdI0UEkHSIFjjhVwf/bfRwn4PjPvPiPRfKBs8V5OW0vTrnKfoALd6SLSP9w7t/+Ex5xMk9sunqYxvyO2uCd1d/JqdrrIdOtWkTEaoNULC9GQrtq6XQG2whAfcqtSVcPhxlVkJ1P0A6HD6E0dOF4RdbYeoUWORkes413FKRyUBqE9bfjMpW0PQtNhpoYE7rVelnOkG7Bw4gU6gYlwkb5J3DL8n/9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5zbvUxTlo91kq8asGmhJhb2DvmA+qtPqitP5H4Nzl0=;
 b=2wVE9L7gnxtuACx0ibCTx9BGPUVnWFdjMjMN8bJL6OyiNM+X6O7V6xjRwDv2cm2+v43wmlnVHYVNbw+c5xqb+U4tGHYQ4JMML405qFHfDq72mwxcOpUZFQD8YB1pzuwjA0XBY6wEPy3QC4s4hJeq1uS0eG/R+cZ8ei2Q3h59BzVz0Ue0BbiFHHt9NMY8eijAqVJjwEfTSG8UGo5V2blGjz4lRh/g++8lyNegYj2I691iVWUvSTwefe3+5AD/YpaZDC/wo067M1seBjQ4s9IEeS2LyberEBCeEny/XpVzX3i+y5n6c/9eJXYc2zIlVeoNGrMQwvmt1MbMi8XN3wGl8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <602c8889-1e75-52dd-135f-be6b6013d880@suse.com>
Date: Wed, 15 Jun 2022 11:59:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [PATCH v2 3/8] x86emul: split off opcode 0fc7 handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
In-Reply-To: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0211.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff0eec73-ae33-49b2-feda-08da4eb5c172
X-MS-TrafficTypeDiagnostic: AM9PR04MB8922:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB89222CCD65B4482383E16DE2B3AD9@AM9PR04MB8922.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sK7QD4cud9NBRNXLxGIv/WSX2Ayc8wmIk4q9XsWKnTZUnXk/f80iTqnAqC2hQi+VMbbjdoHnrUCV2I6nIgp12y/wLQCzrXqec4QhSdPqGfainzWntZF6UMohD5IhZrq7iAqnwGpIgRbd9euF+gTn5610BY0BK92cygQSU935Zj9f0yBW1NQPoiE7wNM3FjoI15ex6dShizIdQpHjzE4fhPLfsmqyQypX9wPvvtimflgA3au33JsBBGyvjb3Y/ycKuYtsrrzSvG+wuE7codFXR0D/9VDEQpQoCM9xt+yffavE7pQJSAoomlsEvy/b1dVlRxOTHw7GSGOjaOhL36mr0schghNKXGBo7c5J2PgYslDRgws5o6Hpq04esiFUJrEvIPRTg8YLmxJiNlWNtYLdWIyw8QCDI9mbP7pQJ0gjHSldrZCrjrlghFAJJhNCAb89qiveYgOfS+6/qt4pcPDANp7B5hmyOD8XD/TdFqtFIrbAfGQ6rkRsLZ7JZPMC8C3tbFmcwLLlstfMWlhrxzh3hwdVG3PTFh5sC553cpLXNu1TGBVPs4s61/I1VtfAtntXocoQeUiusDRwjdmbG00nU75ThrCWigG3105iYLwnvqQU6fdAqgKPWeAIw2QEGcSQc1hax0xvu++vSPRKTJfhx/fKWMwmN6EBLzZ2PFprx6TCq0ZwwYYRbbvaEMTlOZibtC7aDeqgBatxOPI2ulkwvRczAbqe1BWr6b1oQ8WKKXAyi+/09FnB4t7H8YV5x8L4rf1LwNHBhZnrn9mI+2ctHQKtX8Lsf5Hb0GCIx3KMCVgn5UB6ndNqwu4VJhsSeMxdDFbxwg81W7sY/+Ri7Hk7ew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(83380400001)(186003)(2616005)(31686004)(36756003)(38100700002)(2906002)(6512007)(316002)(6486002)(5660300002)(86362001)(6506007)(66556008)(26005)(6916009)(508600001)(8676002)(66946007)(4326008)(8936002)(66476007)(31696002)(54906003)(30864003)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1ROWHhvZmtNbjVHd2t3Tk1sd01Sa21KZ2pXelRCTk5sMEtGdExXdXFpaXg5?=
 =?utf-8?B?dEtwaS9uTFZjSExyWkpyRk54NmhxZUt0Sk5TTWF0ZndvRHdRU1lsQlhjYUl5?=
 =?utf-8?B?KzF0TnpmZHRnWFVuWkF3LzdJbEZVOWxPdnNUVll2ZytYcXVOeTlCcTRXNldu?=
 =?utf-8?B?aHczK21oeEFTay94c041aEtlWERhUUNRK1lDY2FTLy96MTlTeXptZXkvcjlX?=
 =?utf-8?B?dm5yTCtDTVZNdzh2VVJFNEFNdytiTkpWcWUyOWgyV0doZzAzczZTS0dEdlla?=
 =?utf-8?B?UUJXMENvUXlNdTBSMThZN1ZYWlRncWl4c3EwNHdIcmwveXQ3dHJDd0lLLzRG?=
 =?utf-8?B?ZDFLbzJ6S21WcXUxL3EyTXE2Z2syLzZtS3JSbExiQ1h1c1lzL2dwMy9ISWlV?=
 =?utf-8?B?K2s3YzVLcFVtN1VyS1doRmpKbVZxTFI4WWJZMjluZ1NmSUM3cjN4Wmt3L2pz?=
 =?utf-8?B?YmZCNkJkNW1oSzBDcXBMU0YzNEduUUFMZVlNeUNsekU2dGNKK2w2a2dWWWdV?=
 =?utf-8?B?d2lxT2RaNFl4UUdiZXhtdmw1MEVTVVlDYzFFSHZYOWk5SUlSVDg0OHVsZ0Fw?=
 =?utf-8?B?K0pXd0tMa3BkOGN2dmlHOGlXZkh6ZWRqUjhwd2ZkQ09US2lYRVlKRnlEd1FI?=
 =?utf-8?B?cDVQQzZpdGRRV1hreUNvZm9GejFSKzlGVitCMytWZkUwUmVFd25XVTR2K2p3?=
 =?utf-8?B?WFl0VUJiUFo2b3RRSnNGZG1EOERlbGR2WGNJL2xJaUNaTUM5R1d3ZTA0M0gy?=
 =?utf-8?B?YTdPSUNyR2U5MWQzMEJxbFFEaDFKN2hVNjlVRlBEY3FMVlZQSVk2YkdmOHd4?=
 =?utf-8?B?YU83QW1SK21tQUI0dTBqU1BDMG5FR0wvUWU5QjRqQ29BWThZVDg0dzZ6a1V0?=
 =?utf-8?B?N2FKOGwvODhNWEJSNGV0UFNBbVZvRkNsWGRURm9DT1RHQVpSWHUvN2FUMkFG?=
 =?utf-8?B?WkJOSFA4dytNdEt6TkNZakFoa0kxbnExMGFGODh3MjdpR2RsbUJTSjJqcWQ5?=
 =?utf-8?B?elFvZHV6c2llU2o5S09Cc2xvY2FHVUFPelFyYjVFOU9DYTlnQmxuMVMzMW5F?=
 =?utf-8?B?UFQ5Y3JtQ2lkMEpzQ3hOT3JWMk8xWVBaeXVaUFFOMWpIc0M4MU1UTmRxcTZW?=
 =?utf-8?B?a2ZPZUthaUpHWXdIUEVxNXIrSFZJbGhKOGttbi9mK3hYWjhOY2JzdFpyZTVv?=
 =?utf-8?B?dHY4dllDU2F3YkE1Qm9rZUlrSVdwS25EcXYrdmlnSXJ2VEQ5aGhnZDNvS0pG?=
 =?utf-8?B?M3dSQmhxdjdXM25OeGdKcGpxeDhVRCtiQUZYdmJTa0wybXE2d2Q2MWp4bTk0?=
 =?utf-8?B?L1ViQlQrM0xlanpGeEZyc3kxMWthc1RqNE1tblFGdDl4cWNRdU5hMUYxLzc1?=
 =?utf-8?B?c2tpVEhnOXRYdkFjQXBPZktlZU5aYW1SMTVnZDF3Q2xNSkNJVTlnN0ZQU2Vt?=
 =?utf-8?B?aUpIektzVjFEYXRmYkluYjJMWGRTbVBNMCt2V3J3QmZjdVpiSjRDWkZyRDdO?=
 =?utf-8?B?NWRELzZTZ2VaSHBBSmJaN1ZlTmx6SE9VTGViK2RqUjJjOWpNWm1jRDVOYXdZ?=
 =?utf-8?B?ZHc4U25HMUxNdkRoRFV4bjZTSUhFbWJnejJsRkx4dTVGcG42TkdTVGUwTTZG?=
 =?utf-8?B?ZkFna3dBZ3p2V2pkZURjODRGYkJwaFpUOGg4ZUhoUnNqdVZnMEZqWnhIMndo?=
 =?utf-8?B?UGcwcktDQUZlKzA1V2wyQUkyYngwbmtEWExvZUJweGxXOWx1UWdlMXhxZUhS?=
 =?utf-8?B?bkJRRExiaUFndGhuYzN4enJpQWppMGxkbUFrYU5rVFN6UDhRdXY5dHlRUGVa?=
 =?utf-8?B?d3ExRVluMWJkTmJoemtZcEJsWllxNXRGSE9LUUZHSGFBbUhJMFNRaUdXV0dQ?=
 =?utf-8?B?ZGlUREt2bU5rNU1ZUGhienArck9PQmVpU0hVNlgrYktESDhBdkNYN05DT2cr?=
 =?utf-8?B?R2YzMWFVcGd1Si9jSUlQOW1aSVZ0cDJpTkh4Rld5MlpFa25NQklJUDBsRk9y?=
 =?utf-8?B?cVN5K1pWdWRzWGRhalpPN3ZaYXZNWlpiRlIzaC82d0F1R1B3ZVVQSmw3Ujhh?=
 =?utf-8?B?YVdXQkpGS0I2aDh1R0JxdFFHTHlZT21hVG5qbVBkYThBOVJKNEZPUVJYT0k2?=
 =?utf-8?B?VjRqQ1UxM05Ic2p5RDFuNlRjajI2K2pqUXpWUjJlQVBRQ2VZaFJab1A1dFBQ?=
 =?utf-8?B?cW11MmZxWWpvVWVjK2hEVlFKOTJKZFFtMWNYN2UvdWIzTjBUKzhId2Z4OXhz?=
 =?utf-8?B?TUZtK1VLNDNDNzl1dzhlMkUvcmFzRERJMnN2cGgvOTV6cmtOMTRZdnVBV0xV?=
 =?utf-8?B?VVVMdW5TVjVGbTMwSXQ2SkF0MDlMbTFGV1U2UzNrSGgzZ1UrTjBSQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0eec73-ae33-49b2-feda-08da4eb5c172
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 09:59:36.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DI/XiU+d7m4siv1VlxSb73k1Yem/3UgOOWMkhK8DWPlSCSdCHhsaapgO5DVPcNE9yPkiqQorxnq/Si2YSU8eag==
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
@@ -7680,174 +7672,8 @@ x86_emulate(
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


