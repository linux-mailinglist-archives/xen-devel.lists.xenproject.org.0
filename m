Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIWwMdi6HGp/RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24836182A7
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323457.1589182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox9-0005HJ-Iq; Sun, 31 May 2026 22:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323457.1589182; Sun, 31 May 2026 22:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox9-0005Dr-FA; Sun, 31 May 2026 22:48:19 +0000
Received: by outflank-mailman (input) for mailman id 1323457;
 Sun, 31 May 2026 22:48:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wTox7-0004xT-40
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTox6-00261G-H2
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:16 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba69-2eae-0a2a0a5409dd-0a2a45099642-30
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:16 +0200
Received: from [40.107.74.96]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbaaa-2497-0a2a45090019-286b4a60e9a3-6
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:16 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2972.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 22:48:11 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:11 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0JIxC0tnbT34W8QBXrZVxvDy/jnjSZMgJdRjOn9gX/WOp3LEoMauN3OZS115ykkerl0HfeGsroKNmqnjSc5p+i3zZEUUa95iBJvfaDE4CtHqIQcaS4vnEeHigiUCkWPxNC4GzMKPRqJRQjV/hcWzbY+4r48KGIWYu3VTyloRryjOwb82weF8dUGBRfxGN0kWZvuFyYgI+bsfYntRTBkKiD4p663Sae4VELvB7SJzqNLGb8vNlGqRosMSoioENW1nUfcSNXGU2CLCI3Dcrxf76CQqFicyzh1MiiIGcIf3v4om1ePwvZQcF0UBHuujRPf6iR+xwUZSKDY9RKpGM6E2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efsYPuOFBJuGq5l6y14uP1QzlvYcMA2MZ/bYJIg+6Cc=;
 b=TAkTfzAdE862CnvJ1EFy2a1OvR2EbdxK/mO9J/GQy3/u6wpnQCIA91QRoZPgztIL3wUJMEFiDKjKNU8eNAmiVTw3OfhbxhuCjkMwm29DP3R8FSSQ9rEfT/CntjcMw+04EqPeWbFK8CK6gOuT72dDXAoIS1Xe6Zjo6SafnUz9AWXiAvWsd6ceq/fLXDlEgapER9PuzcUptl46f4iOCO2odTFhShkNXnBYx1EU+faroIAvyLjU9sd6LlUhvmB+JUHjebIY0Ed0jWpEl9gQX902CRaxmMUzGVxdM7PUxUBumCNDiwSMqsiihp50mWac2qF9GklQgdpKogx72Y2grGbEdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efsYPuOFBJuGq5l6y14uP1QzlvYcMA2MZ/bYJIg+6Cc=;
 b=HRDLv86iCthKlCcpM0Vx+1Qct936BUJVDKiTaQ+FE6Gdag/bkQgFEdzkb2b9qxRUjtg6xe1p2ANCWsl9E9n3Fzxaup7ycYHVC1rRikE9Jqt7/Y47GuS+jFC1tpixI7wwHIRUKs0SuOzmEr9ESqMRe0bBDiM2MtLiLAhhKvo1i3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 06/24] xen/device-tree: Read NUMA node distance from Device Tree 'distance-map'
Date: Mon,  1 Jun 2026 07:47:36 +0900
Message-ID: <20260531224755.9481-7-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::10) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYWP286MB2972:EE_
X-MS-Office365-Filtering-Correlation-Id: ff31399b-cac5-43ef-00f6-08debf66b13a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	zjxKymjC/PiKco62V6KdraLWGR/woB8ZfiCMM8w/wbm1Nql0fkCZlQb38UkpQeeminjUI6J+hdq5Fp6C73tgDapNb9V4KLp+55sajlrhV5C4K5yS6CwSeL9fd0tYJLQpIcti7uAXR9Ejr4dnHo+nPmH1VeZmXFC6vYHRik1qCDAE61QqExzJgh4xo3G0DkjkSdd+n5j8WYR4o5Ldze+lxOUeeubRVPkLx0CHeOlxGAaaSw0X5lPNEkEyDZCQfS2DWqHYqomROWTGuXZP3IocfbOmbPg4X3MCdSUK1A/4PpuLO1HD7S5+86O5qgPhNXjRnItDWIIMe0uxiB88tZWD3vrunCDhCSlfbWO80DaovXTCCSFFiH5arlXMzIN8h0oUD6BB0qaRneCvQGc1oQlBjFmOr3e8Eddd89TfKQEgQCPdcovqPLhWZQ8FYyT4jge98X0t5+wdD+D1aYSftXFxLbQodbIlPVVmOHunlri5vAtqXPb0fMzHkA9fbUGIYq6t0SNwu9UqSKXI3JaB8B+9hC7ZZsEIPeMuV/YJZ/shykLVnB0uUqjyRkeJ+OV14dfSvgOwa+BhkwdkVIA+1u1U5aZrZPuyVyib+vbg98t9hCP9FgPGUB1MK9ZMYvxxxQlsHzuJlPq7oAtlTTUx5BwYWojzP4A6Pd0lvi33ilInCwr2NMgS/Yiy8fYIR/mCUIjE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HrM4xAXfiL05nb9J+RU//xhkP9woLRM2QBDG0cppY5I70ZS5qibepTXahMWe?=
 =?us-ascii?Q?1ywaqAi9secucJfQygIkYuPITGY+XK8O3D7PDJCSmxWZSDgikZlSmR3Z3c3Y?=
 =?us-ascii?Q?KS35z6z3l8ZtzAt8AncLuw98K8VNDv3IEUt8gB0O1MNgsyyyzk3f7Qagf9SD?=
 =?us-ascii?Q?REixOEFZB062/aBX9ymTWodO193vtmDW92uVhc2gdhV4JNZo/5IE2FY0TmRO?=
 =?us-ascii?Q?xo/PmE0gaNcGaPSBWEe+yotE7F48tkiAftBsx7drYPQ6+1eoMbfPbSJVkVRP?=
 =?us-ascii?Q?pcnncPDYpNpqhBXY2mOgIQ4o5QB7+NX00ibpKY7Z6iNDDc8I9bP38LDLualq?=
 =?us-ascii?Q?NyQnnb1PPlXw7q6UwWxRPRC2PoWLV66uMxHnYGbMmxGB4VSSUlEBd+KKRxZk?=
 =?us-ascii?Q?nCPCRo3iw3/g/qPpP5i7jLKKsHluVInmDRJMLe8oSGzx0/ZGyqlpU/bQpwob?=
 =?us-ascii?Q?9XGlmmDdCrrgocy40tCLEPUao+jBt4dXMVcJdEhhoxQQkF0xuyJ6qM5XEvLz?=
 =?us-ascii?Q?6X7GncTDirdPyguiAsMYihs9jOydQ/2nQtV1NgNKNFZwJIigit9M6QxfXJGZ?=
 =?us-ascii?Q?LZx6IE2aA2Fa1uazwis8yel17kMMrMt0xCwc/Bndja7ZJJyphBCEJnSdLG04?=
 =?us-ascii?Q?bEkfge+x0xeqGXGIkGXh+2FT//7vKok8cWRoXA8E46FN0R1p1Qkiy0FSeTZs?=
 =?us-ascii?Q?f7RLmaVeLAKkJWhFi/OvUlqo2ticzRBl6XGJF8bud0bq905mrnienqi1IrJa?=
 =?us-ascii?Q?c65SELpmYd2IueJYiKQgycBWXUjAr5LRSwuhNToP2ps9vPGX1u+F0AZabuKo?=
 =?us-ascii?Q?CFu6iH8hMfH2HQisrNxISVCh3EM9xRp+pz32z208mOI1ey4heTin0vAvm3tj?=
 =?us-ascii?Q?DVb9N3vn2u5Nba9U8HwRfj5WUxi0Rh+kYwWyjQlLdyIT5OAZ2/r+8VdOOdXz?=
 =?us-ascii?Q?0RD3ga6hmvXfBVBG0ZkcM401p6jiYc5zVA7V/EnEWbRKICygILKoIRgbKPOC?=
 =?us-ascii?Q?jZwbCsFalr2YeHfZ3uPU+FYq1ZgmIG3OIJbeU61Lo7m+5Q2WXIQYDcuMJn6J?=
 =?us-ascii?Q?dvWMutDb8LNxd903fG9qYJF+8eAwvY97Pw2cMWeZYfVNJfxAvqQwN4WFtfeC?=
 =?us-ascii?Q?qR7Zr8eNpDcNjuBYIwnXm/kCCMmgEVrCgXVgzAVkxKWITt5nR7dfxZ8vQvq1?=
 =?us-ascii?Q?zNuGT3XgarDaXeZCq5JkP8q7NaJ6Sa1Tmq/GQiQ/JS7Y86NnmyKjwcyiBxVT?=
 =?us-ascii?Q?CPkd9rje4l+OfRuIvrvJKh5NId9L5eEXmWKV0rLwIpQDup3/ATfpzWNRunF9?=
 =?us-ascii?Q?YzoHaEGoNpO5wHdwTJq7JWN76tntHDNk4qRu+xvxtMKkqb35CeDu3/Y/oMOk?=
 =?us-ascii?Q?lOVVM0Qew9VMT2pjzeJ7XD0ORs6YYDSUUGvb2Sjk/kGcAaXAQkXIV9Sooi2m?=
 =?us-ascii?Q?fqcp6EiSG5p2qcmmLzVvCFivX4yHXMiTSt9u8YdickPaOFJl4U0l9DQRjypY?=
 =?us-ascii?Q?mUoQQ2wW3dLscfm98zjKkJ2/v95D2AUYvJHDWA24rAuOshoYrUD/4QA8le8S?=
 =?us-ascii?Q?svnPsCX0NpALmxRJFlSZkIu5n3r7XfB9f4k+iHxMSnMI35o4tyUq1JY9B4gf?=
 =?us-ascii?Q?AoacCW3rVstNm9fYNCwavxIqaUyCYekyzijpGC3wOe+pihe9L+F6OVO9AEQt?=
 =?us-ascii?Q?0wuUvY6K3dZ3HZ85kFkzUc/OGslJPIMRVyd+627EgKIb0dF9gJsUBQe4bkpF?=
 =?us-ascii?Q?zkWylNkdf4qkEMWJiN2y8vEe2MNQvKHcZMZhk+sz2SAK9Rhs0WgcW1omXMbu?=
X-MS-Exchange-AntiSpam-MessageData-1: O9mNyeCVcLVd+w==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: ff31399b-cac5-43ef-00f6-08debf66b13a
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:11.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vtR76wd0oCjk5i31crvEXjaRXCb1+poVcRssGC5yfFkuT9HCQFJshRu0a5eNgqZuS1wuNz7XCESb6yZK1LOyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2972
X-purgate-ID: tlsNG-bad1c0/1780267696-8AB8EA53-544C80EA/0/0
X-purgate-type: clean
X-purgate-size: 4442
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D24836182A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Read the distance between NUMA nodes from the Device Tree's
'distance-map' node.
---
 xen/arch/arm/numa.c           |  2 +
 xen/common/device-tree/numa.c | 93 ++++++++++++++++++++++++++++++++++-
 xen/include/xen/dt-numa.h     |  1 +
 3 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 15cad3d267..a7769b0c7d 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -41,6 +41,8 @@ void __init numa_memory_affinity_init(void)
     dt_numa_memory_affinity_init();
 
     numa_initmem_init(0x0UL, 0x1UL << (PADDR_BITS - 12));
+
+    dt_numa_distance_table_init();
 }
 
 int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
diff --git a/xen/common/device-tree/numa.c b/xen/common/device-tree/numa.c
index 539ddfccc5..6414806937 100644
--- a/xen/common/device-tree/numa.c
+++ b/xen/common/device-tree/numa.c
@@ -1,4 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from Linux kernel 7.0's $drivers/of/of_numa.c
+ * Parse 'distance-map'
+ *
+ * Copyright (c) 2026 VA Linux Systems Japan K.K.
+ * Author: Hirokazu Takahashi <taka@valinux.co.jp>
+ */
 
 #include <xen/bootinfo.h>
 #include <xen/device_tree.h>
@@ -12,14 +19,96 @@
 #define LOCAL_DISTANCE      10
 #define REMOTE_DISTANCE     20
 
+static u8 __ro_after_init numa_distance[MAX_NUMNODES][MAX_NUMNODES] = {
+    [0 ... MAX_NUMNODES-1][0 ... MAX_NUMNODES-1] = NUMA_NO_DISTANCE
+};
+
 /*
  * Get the distance between node 'a' and node 'b'.
  */
 u8 dt_node_distance(u8 a, u8 b)
 {
-    if ( a != b )
+    nodeid_t lastnode = last_node(node_online_map);
+
+    if (a > lastnode || b > lastnode)
         return REMOTE_DISTANCE;
-    return LOCAL_DISTANCE;
+
+    return numa_distance[a][b];
+}
+
+static void __init numa_set_distance(u8 from, u8 to, u8 distance)
+{
+    nodeid_t lastnode = last_node(node_online_map);
+
+    if (from <= lastnode && to <= lastnode)
+        numa_distance[from][to] = distance;
+}
+
+/*
+ * Parse the '/distance-map' node from the flattened device tree
+ * and extract the 3-tuple triplets <from, to, distance>.
+ */
+static void __init dt_numa_parse_distance_map(void)
+{
+    const void *fdt = device_tree_flattened;
+    const struct fdt_property *prop;
+    const __be32 *matrix;
+    int entry_count;
+    int node;
+    int len;
+    int i;
+
+    node = fdt_path_offset(fdt, "/distance-map");
+    if ( node < 0 )
+        return;
+
+    if (fdt_node_check_compatible(fdt, node, "numa-distance-map-v1"))
+        return;
+
+    prop = fdt_get_property(fdt, node, "distance-matrix", &len);
+    if (!prop)
+        return;
+
+    matrix = (const __be32*)prop->data;
+    entry_count = len / sizeof(__be32);
+
+    if ( (entry_count <= 0) || (entry_count % 3) )
+        return;
+
+    for (i = 0; i + 2 < entry_count; i += 3)
+    {
+        u32 nodea, nodeb, distance;
+        nodea = dt_next_cell(1, &matrix);
+        nodeb = dt_next_cell(1, &matrix);
+        distance = dt_next_cell(1, &matrix);
+
+        if ((nodea == nodeb && distance != LOCAL_DISTANCE) ||
+            (nodea != nodeb && distance <= LOCAL_DISTANCE))
+        {
+            printk(XENLOG_WARNING "Invalid distance[node%d -> node%d] = %d\n",
+                   nodea, nodeb, distance);
+            continue;
+        }
+
+        numa_set_distance(nodea, nodeb, distance);
+
+        /* Set default distance of node B->A same as A->B */
+        if (nodeb > nodea)
+            numa_set_distance(nodeb, nodea, distance);
+    }
+}
+
+void __init dt_numa_distance_table_init(void)
+{
+    u32 lastnode = last_node(node_online_map);
+    u32 i, j;
+
+    /* fill with the default distances */
+    for (i = 0U; i <= lastnode; i++)
+        for (j = 0U; j <= lastnode; j++)
+            numa_distance[i][j] = i == j ? LOCAL_DISTANCE : REMOTE_DISTANCE;
+
+    dt_numa_parse_distance_map();
 }
 
 /*
diff --git a/xen/include/xen/dt-numa.h b/xen/include/xen/dt-numa.h
index c6939d0928..075d31cb89 100644
--- a/xen/include/xen/dt-numa.h
+++ b/xen/include/xen/dt-numa.h
@@ -15,6 +15,7 @@ static inline unsigned int numa_node_to_dt_nid(u32 n)
 
 u8 dt_node_distance(u8 a, u8 b);
 void dt_numa_memory_affinity_init(void);
+void dt_numa_distance_table_init(void);
 
 #endif /* CONFIG_DEVICE_TREE_NUMA */
 
-- 
2.43.0


