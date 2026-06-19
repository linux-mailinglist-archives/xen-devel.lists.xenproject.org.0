Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lEp2Bu30NGoWlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B355D6A4739
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=buz+riui;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341731.1601999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTze-00044d-KX; Fri, 19 Jun 2026 07:50:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341731.1601999; Fri, 19 Jun 2026 07:50:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTze-000401-HE; Fri, 19 Jun 2026 07:50:26 +0000
Received: by outflank-mailman (input) for mailman id 1341731;
 Fri, 19 Jun 2026 07:50:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzd-0003vw-CS
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzc-001qMv-PZ
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:24 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b5-2eae-0a2a0a5409dd-0a2a450bb90e-36
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:24 +0200
Received: from [40.107.74.114]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b9-5e53-0a2a450b0019-286b4a724d13-4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:22 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB7477.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:356::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:50:17 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:17 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=an0SHIvXGtr7PgBhjOpCm8i5z5NMtz2r8h+yUEcwpCu9XhuhbjUTIxvwF26OpN1aUFZ0Z738dMLmxaOotOTRgO1X3P7m3ZVoZ/eCwpeljX8eio17bL3yIrXxoP6s4dznQUNCBJAn+Y33s0gl7CIt6HVE39RV3EHZ38739J0dftorNJcK6fH6yF/Y629GLnoujiorfUWwEVE5hnwgO0ig/HqWDjTJNuyy0jDb8Qrye/zg1zoZfMa3GZv/amNwLuBx7jccAkrYrE7KLN2M4N0V+S9lLG+WiAsHpy53DEiOkTGCe6FsJEPH2lPfNi0INZAwOUNG84Kdhe/ToX/iT9SHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gX9ub+anZt6eauwPAi4d+qchhQS98QP4fnLa+KEekc=;
 b=cmQjcyKWRQRFWjoZvkN4S0XeHX8iohSPOISRqaNPPySG0tCrZlzqLlhdqhyK9B5GUzWrmQBUcVC5EgOqfbOorh32KwST6/1gtgYbYebxtRyfnDszbjV8Vml+qG8gETXBjz9Gha3alx5Hpv5vjATtoBlEZkktfpQPyxZTBTVcWtt+Kcv1YAX3gwXeBljRYZ9mF/IxrBlEetAC6EB1CJ7dWbHb/qvz7xBwmmRlpBSk2rnF3zPUagrc+pGkwWOgB7dGpaEDJbzfgIX2BhA3FzVBJ9IzyeDqzuBnP2gtF/x+Nz3bHL6Rv6Q6Lt19R0JBntPT/8KrR8sQQgI76zEh3/Oy9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gX9ub+anZt6eauwPAi4d+qchhQS98QP4fnLa+KEekc=;
 b=buz+riui2yTrK0w0MFYoIcvWbk2r6ld6fQBm5wDeOY6EaNgI7j9scnJZ5kwWfva1Hi1aB8RF2tdljSam1eomhWlQ+K9cy8hfz7zByus4Wha/jr9Irp3GmMxvUbSgru6Xy3RKslyWkqpp91bfLrkt0srMpGe6ewToGjMljywrAGw=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 02/22] xen/common: Default function to get the distance between nodes
Date: Fri, 19 Jun 2026 16:49:50 +0900
Message-ID: <20260619075011.377116-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::9) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY4P286MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e98c1d1-6b01-416a-a2fd-08decdd767ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4p3170YBl8ipIJz+pMUieMBee1JlkZ51b1H3/ibWhAnKdfD4YWoZqx+s1bCGIhPJ9Gd4s7Gc6Ul+sHhKpxpVw7NSrr2f87hJOYuX8IBm01TNE0CU7uAdc2Mlxl2EF6zDA2jAPM3kqWo4raWKdLDWa2tXWs7kfFlXRSXZDJ9fqSYyG4WkkWvk0z8atimhS6IE0+OMZYR57vmUkcvL0Ad0TU0GBlvWwuIRzicNzMDZvA4epD5ViluoTNAa5sNYKDu0DQNhJZdK3Udrr1JrvuiN0GMSOusRWeevkAW/pu0MIpLlGfgqJjDyNG/aoVjsZ+KdS5gsZnNDIMhqXK+ploTteGgWdk/YFVB5ihsENjGH65Q8d7skSPZ9+fEOhHYEn5oV7DFcAwfOkWxMnzSPjRlzezKcyNeZv3NMZiZup3xT9ASCZC6kPn7Z6y7gkuL//hKB6GCmaftZYLBQOURqkfGECVbsrqiOdP62TqiGsxO2jB77hAANLxxhPM3DwjSje2rEdbPohLd0U+dxt+VYKJ8BB8IT+tAtH4MfACPiD1lR58pXH/E9y07199PdZm/En24EUZJwkDspXQJgu563sluhd5R34yW8BP1G+52Dmr/9+p3y9urjuPSl9Wgber790RywU4EjwNkayKMU38TZKdTS+OEKymolfox5n/6mUR1tR50=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0BNyIUfj2EHDy5KwVIwLOEfbCuCQJRFkxyC6AvKV+BARwYnxkp4enSVvg9E8?=
 =?us-ascii?Q?ikxCK9jX6CChzPfOfe4g5VWfwOsRUpJ66UcsgVMW68lECHTosvksGp1Fn0SP?=
 =?us-ascii?Q?9HGJrPRYhAQmMDZdhUdGR7iZchn/WT56+Qod5v2u5OibWoOSWeqT2MCvzALA?=
 =?us-ascii?Q?RYPjINdmKX5hW6P0gEyFAcRB/lM6UowRRYjFz8deXHYvxaiyhnAw3N7iW5mF?=
 =?us-ascii?Q?8ERGNNbq9q7zNGAp5x71gQIUi1ekcWnPLC6S3xf5eFnLiaSpzb1yaqgF0KbV?=
 =?us-ascii?Q?BnQ1BPpWxYsxrcNll47Dgu+f8LRwKJ/UcAW9uT4nKPF1jM/0OsYsNh/VHCgd?=
 =?us-ascii?Q?y3IeHHpwqTzHxiG5Cd9O0HqiY51m3+te9b3LtldOlOmSedpzYzF3CEy+XpXf?=
 =?us-ascii?Q?p5TVjosVeaANr40b61i0AGAVkQSLLNTf1w2TyvIJJ+fvXEXTGEXHveOhH49I?=
 =?us-ascii?Q?0QKRde2/Exbe2tUwjU1zsdQRH4htM3YNTLHWaoG03y1lYsV6HlXOLgTHcL3p?=
 =?us-ascii?Q?fA9PjGFtfaUe0fJbXjUjRF6y4oklmXKInvlyRmbI2D8hqD1+rU03fhDLNNKX?=
 =?us-ascii?Q?/kqzrMh+xUJMQR5yRCvtAwjFKQiJoT/nXX7Xj2R9mGWhJU7s03pT5w/NXBgv?=
 =?us-ascii?Q?BxJgPN8dDFglvfclEZ6q9qK/Hht4BbiQCvUm43FuDy/sKWDf3jkHO2UlB2v2?=
 =?us-ascii?Q?T6Uxi/01T3HSuJsFfHyKkMQeLOu4J/y/oYlzpDP3nXL8KIixtPMDpcbJQmNU?=
 =?us-ascii?Q?Sl0YFTgdgh31kii3UajwH9RAXICfZPBhwNzBUj5oDbG6DdOJ5Nj3dwmII0BQ?=
 =?us-ascii?Q?i4JEUmoKSkIxSA3/uOcTHAJ1pbI3ThfD/lpUUCPIQnBrBdkceWOMv+SyZYp+?=
 =?us-ascii?Q?+kU61XZEQbMcBV7yHNeH0yDAhy6BCjd5GeBJer4b1jIbe5kthJDylQsGvPwt?=
 =?us-ascii?Q?QciuoIcbqPlYr1bW2GciH2EGWMEpIRsOLpH+/u///KFPsrM5EIUuJ8f2yCnQ?=
 =?us-ascii?Q?G3zR3aDJ7d4Zto1k+x4ZC+SjD3IzfbviwkOXjVSX0kTEQAFkAkMS0ZYK5T4e?=
 =?us-ascii?Q?BPiC2s7mMZoQ2ZcchjSSeNOmkGnpZarcGUNiZI5rj9FrMPhA4jDr4fO+aAn/?=
 =?us-ascii?Q?zhs+1NC44+AhCBF8QLWDTOyQPnPOuo36TsuRy45BtwxqedpwjDNnfgZBvBXJ?=
 =?us-ascii?Q?ZT/5bmJ8cLGyev2ZfALkxhIHbeOX8c3d0+9hFXVn1j5t2HqaVAfGpYTVOd32?=
 =?us-ascii?Q?M+dHEdmHC0RNM9roIkE8DgWcg0ziR+w2V/XmEcFODrUtKK8dyvNEFvS4a3jX?=
 =?us-ascii?Q?k6lLlt7Z+CgLwiorFfdI6BTI9624igObH338U/8+zTcBRjCMRlBSMYwUSmfq?=
 =?us-ascii?Q?4q1SknE/ucl9912iUXdoZiNdDwVOv/tCEbmJu1GaXJ122Bysz8NN8cG6+B2/?=
 =?us-ascii?Q?Vt2oxDCT3eQYzbBgvEDhkIZ2YBAYwantzy+GV6A8UzI2WUdbL0I+P4IMH9ME?=
 =?us-ascii?Q?kyxeZ4nkBUsLIRo1DotRurI/ieRd5T1t9koqohNzD1R4TwSSFOR4QPWsFQtP?=
 =?us-ascii?Q?fBCJJKJyTfhPZhMNpsUl0eZsLwTG4aKgUqIo19sX7yeLTnwHiOBnr3Fy4BoE?=
 =?us-ascii?Q?Bdo9sQ5ZeMMnRSpUnckHnuU1V24xp3C61YB2PqL0hzr3yWT2i0RXt5Skkc9E?=
 =?us-ascii?Q?+H/u8POHXDthOnfbLYKoN0O+baWz78lq58QHPChXPucxJ2edO1oe181HhMXf?=
 =?us-ascii?Q?eKe5/BBLE9OtiychkNUKno0hLhWTBBtiZsCGANAhZ+2eeeNpvggmvFdCPDYo?=
X-MS-Exchange-AntiSpam-MessageData-1: HoDwtzvc7adK6Q==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e98c1d1-6b01-416a-a2fd-08decdd767ac
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:17.5042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQH+XJUIruYCupwb7EkjkPU7lp2RlGlCrO1/20+uRIXqK80NUsMQmUiFhj+qvgzdPFBJpKbV8Mco5v5hZbVkmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7477
X-purgate-ID: tlsNG-42698a/1781855424-4D9FE00E-1F3B76C1/0/0
X-purgate-type: clean
X-purgate-size: 1974
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B355D6A4739

Provide a fallback function to get the distance between NUMA nodes.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/common/Makefile            |  1 +
 xen/common/numa-distance-map.c | 19 +++++++++++++++++++
 xen/include/xen/numa.h         |  2 ++
 3 files changed, 22 insertions(+)
 create mode 100644 xen/common/numa-distance-map.c

diff --git a/xen/common/Makefile b/xen/common/Makefile
index 6018e25614..062f9ab72b 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += multicall.o
 obj-y += notifier.o
 obj-$(CONFIG_NUMA) += numa.o
+obj-$(CONFIG_NUMA_DISTANCE_MAP) += numa-distance-map.o
 obj-y += page_alloc.o
 obj-y += pdx.o
 obj-y += percpu.o
diff --git a/xen/common/numa-distance-map.c b/xen/common/numa-distance-map.c
new file mode 100644
index 0000000000..73344f7f33
--- /dev/null
+++ b/xen/common/numa-distance-map.c
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+
+#define LOCAL_DISTANCE      10
+#define REMOTE_DISTANCE     20
+
+/*
+ * Get the distance between node 'from' and node 'to'.
+ */
+uint8_t numa_node_distance(unsigned int from, unsigned int to)
+{
+    if ( from != to )
+        return REMOTE_DISTANCE;
+    return LOCAL_DISTANCE;
+}
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index f6c1f27ca1..18c22d3d30 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -128,6 +128,8 @@ extern bool numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
                                      paddr_t start, paddr_t size, bool hotplug);
 extern void numa_set_processor_nodes_parsed(nodeid_t node);
 
+extern uint8_t numa_node_distance(unsigned int from, unsigned int to);
+
 #else
 
 /* Fake one node for now. See also node_online_map. */
-- 
2.43.0


