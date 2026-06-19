Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NWIrBOz0NGoRlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 935B46A4726
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=sTOrfKgI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341737.1602055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzk-0005VG-GM; Fri, 19 Jun 2026 07:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341737.1602055; Fri, 19 Jun 2026 07:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzk-0005SR-CH; Fri, 19 Jun 2026 07:50:32 +0000
Received: by outflank-mailman (input) for mailman id 1341737;
 Fri, 19 Jun 2026 07:50:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzi-0005Bi-Sz
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzi-001qRQ-9g
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b5-2eae-0a2a0a5409dd-0a2a450bb90e-48
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:30 +0200
Received: from [40.107.74.114]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b9-5e53-0a2a450b0019-286b4a724d13-9
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:30 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB7477.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:356::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:50:26 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:26 +0000
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
 b=H7qNTgP1KevvChwSYbz1tA8C5G76ZnqB85+tfWai3TutK+u/BkmWLHjwRbuf9IUJtI70vNMq2QU9TJTtewcYSWRG4IpXNigekxiB/g4k8ravQAhL8NoS3ZapNrjP1wDqHBZjp4a05t5XjvQR6oaSSlWU99kmq6499ZZZCpkU3jlEgm9/NQk7IHRL7vCPPvsXHs95Kf28UuycN31Zm7D7+iuRW8iY3iE9c+DM1sfWjl3VMcCpuPSD6pzF7qSsj27C1xxWDusYihIrxTRntS5DuSXJUF/2rwRu+DEqXg04NCUUayMuZR3aW9HE2LnH87PTW3MpswDz8LL+RI+zfVtX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCZMtyLGMNYzHusbpyFyHoil1cfalWfsKDDSBtV0qlk=;
 b=wS2b3bW43j5lnVTFpyl/tJQW61lm7HtwfLG2CcrRKPMg7OApOXW+9Ua+rrgSfyffGzw7zRsS4mmThrScJ7y2ntlRbeTp9oUH2nF7+2umNfzqsPpcnue9rI5D16gFWqIa5o1nLuQXSN4phtYECzvwKePk1t3WSs2lAzpdXfQn24fEqW4i3Gjlp4iyCe+fET6NKfey3hF1lIqwMdk1ESy6PmoyIjw+59jKSdNy6szwLgVFCzjUP15Sx8KbTKPomAwbT8xUiEdN2poT6ln6yEpc54za4EzU62nlOiECwlFqUVDdNjMoTaYkphB0+Bca5VYlkpTf7S2st6YEBKkrCpehMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCZMtyLGMNYzHusbpyFyHoil1cfalWfsKDDSBtV0qlk=;
 b=sTOrfKgI7LhXqRGxbj5wdis4tt2xMf6TRbQb4SIDrCRYJYCgHuWgUNL4X94AkOtT0vcDwGg5P/LNdlk5ZjLqOshSvuMdnfSqjW6E0vp2TCSF+IAtrNO1N/awVc6Hvf73LjXMRcynAp4Zy38BBBAPxiDH9VJLFfZSoBPx7syIAIo=
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
Subject: [PATCH v3 07/22] xen/device-tree: Read NUMA node distance from Device Tree 'distance-map'
Date: Fri, 19 Jun 2026 16:49:55 +0900
Message-ID: <20260619075011.377116-8-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0122.jpnprd01.prod.outlook.com
 (2603:1096:405:379::13) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY4P286MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: aac5b873-89dc-40dd-583e-08decdd76cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|23010399003|376014|1800799024|10070799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	UMXCJfxWH7mjR6PmjaCoKNxILY8yoFvU9ENayEGrKOKcAAlsxTSaiQ4T/pWtaC6/va3DB32IrBYytW3YiKy2b3aijyY0f8PTpM7L7NeN+9N63EEIsBXfbOE0YPF2efwE0oFARztJditu9CgBM36kO2LWaL4/zrqwyoh7rdCk/EhLTJduuB3RPwgpSzz5tn6eUJmmboM/TWw00vfuUzhZGyoU1u4tzl6IEAWvIN2RYpswwud29cEDdypTi2l3+Ljb46d6wIkJb3fzHb5Oo1CIZaL/phFLEkucvXXUIdB4pSBtwGD5pFdRY2YZXVTU0hNt7X+AuruB1RBLF/j+KxhHQgF3y1Ccj4toUji9Om5Gy2GJlnVQ3Sb9brrqFZV2t2J94t2f9uPv+isGPkAknjhd1HoiGSxNNFwU6b71amgJKatPW6ET9xiwloHB0sUIdt06JbOAYHyWQRzonoab01ygsV7pSUrZUZprvhK8DJ/mXtCDt9WudJB/GAY8mQmPx+QpzOiuCELIHKVaSAu2ExkjvqOoOhdo+SUWKaVnopsquDNd5+uf22msbWtFBNbHByD5z+EAP072bENnrHW4Yk+RN8Iw18xPs64anjeRzQ8PcKpURcUMsg3iuYitNQlrExrbSsu2I0pruZONYRJXvlyf6SZH/6/Pe0jYRIYQxMjNQw8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(376014)(1800799024)(10070799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MLkvSUDB4m5Rm7qrMiZahf/Vw4ZSz2jsAIm1w5/p4orj8BHIOwXT5yBxUDPO?=
 =?us-ascii?Q?MmLYqy8ZiTJztSMd0Lj3mJQSynTV2swcM51NkLwlDwv1TzpwuhKHRmqC4OxW?=
 =?us-ascii?Q?06M4Ydqs3iMzJZYhJY8Y2U1k/zGKO/ljV7PMtzxi4A2+45wL2C27StZrr1AO?=
 =?us-ascii?Q?TTZf1QJ8yaPwy72a4T2S7/yCabhfbd5UGqqLHA8rhsftjAAyxD0GDgnxt2cn?=
 =?us-ascii?Q?NC8AAYhq0FzYXrYlWUMXgi2vyqHf18+YtT89vUGZZ1E+FPNfVOnFPKTrjvQA?=
 =?us-ascii?Q?MdAB+VCGWfadCyA4K0GZG4Ssz5LQqPjiok9O4hZRBRJ7flHMbinScMMpsAJY?=
 =?us-ascii?Q?X7y0PU4xJfbKVtvUlJfLtl6t8XvrooG96KzFaBuh0rj8hjZqXjl4fatYuXE4?=
 =?us-ascii?Q?6mwZjnq2QfzEb37a0e8EQzVrmkflDH//QIxW/ckEts97YL/VR6btCRnguOxn?=
 =?us-ascii?Q?N2WK1715rBvxenRO8oQF2wGX9K81tWL+8wyPZvz3BHPM3P2V1N4HZM08nm2G?=
 =?us-ascii?Q?O+dL/X96JDwhvqwifWFv07RDZI2ipeBB5iJQpu//rYlgCEsRiUK0nbR0EKFe?=
 =?us-ascii?Q?7rbm7KQ4uHm3ma4CXEW2Ss5y5OjLPfQ6EfBjDYqHW9G37f5fAn7OGRj+Goph?=
 =?us-ascii?Q?ErsyZzwdjjROEp9zfPkD0Qc69xlqmrdovEPulFyXikoNxpmi/sc1zMQ78OI+?=
 =?us-ascii?Q?nh29GS+tU5eBTxrqtznibnRvm4M1MiTG6KOg7vcj6Atl+i4LBU+b1yLaktAS?=
 =?us-ascii?Q?jB8zHJjQvkbKqdCfxnRPWHC8EmX2d0MKkc4uwEzYbeEcgSv4f01Xh7CYaXf6?=
 =?us-ascii?Q?cBPIQvJiEUkHw7fbzxUbpqOsoAfyT9aHyyWQMQ27o/oXKB4I+3/iNQcvrCPl?=
 =?us-ascii?Q?bK2gODX5Aq1Of9964ufgY+QAISCTE7PFQo19WFVyWf5yFRdyFkTNzGXM/cA+?=
 =?us-ascii?Q?wHsX+tKynP5pJESc6+JXKmjU2/rFusTaCGAQOnHNuJMFHDlxMt22UtnVLDIG?=
 =?us-ascii?Q?ag5ZCT1Wyjs3lC6bom6W1ClSl9oUGwu+PUFklI+W5u1DqNOvLxHymmYDI1UT?=
 =?us-ascii?Q?eTl3UdAkfHYCCCP/OJTJIKB7vn44j/dhDd6Zj1h9cQ9OhFy63Wa/O0sepoEb?=
 =?us-ascii?Q?3Ffq1WrQ/jyNYn1fTB4D+S0Jxy/0w31QlaW+3wbA2g7pYkOqFUudwMwGPCxg?=
 =?us-ascii?Q?8BC4idAFUPV+AeqAOPdjS6iBUxS5guhJTsC5G2R1X7ces2HYZ0ZMqnjJ65NJ?=
 =?us-ascii?Q?xlNC2rNlxFXHBiE0WMLgklR/62d3Afy2RSI2xXrZ3BG/Vn6oZgAdYIJg+7hE?=
 =?us-ascii?Q?kGn54bNv+9grNKDBXhljG1ce0vE8LrEtSr+qzuBNDGcK5Ep4p8qRgvGeKulf?=
 =?us-ascii?Q?Lcf4rqt86quuMfrpV3hC0CNlvg2NFJC+n1/G3j4/G3iJVOy0e7GPTfLFvCW2?=
 =?us-ascii?Q?PN+rGM+PwykW+AGFUiY8+v4dKJAMB7crpCq/PVAmIXsnb6eC4r6mRBYA1WbZ?=
 =?us-ascii?Q?Y6xnPGrxECS4jX5EOC2o25up8DBinRJ9Iuk126oLr0IMl82m+AgLP4eQEAk7?=
 =?us-ascii?Q?nEqub/xZcqTPvYxYnpU5t1BXPCevsWemk/4FK490uQcV5O34AzmuxMn+nAUT?=
 =?us-ascii?Q?tFpKbQMaomK9o7nNBT64qE0huLEgNvoAAznmCG7Qyv7ILLLwywRlovJ5y/zm?=
 =?us-ascii?Q?p44pNyMZoAJ0dVAtCAZS8AShnGOs/em9dDD30cl+D0YIy5D2FkdAKQWa4ZI8?=
 =?us-ascii?Q?ARnKE4pVbbpQ7SVhJ6QDBU9wsZg/CJyMX4g2WcJ2u1SKhK7/DI+3krvkue1Y?=
X-MS-Exchange-AntiSpam-MessageData-1: vhg9kIwhLpx5jQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: aac5b873-89dc-40dd-583e-08decdd76cd0
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:26.1563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVr7mJbiKwsCooYuGylmBud7iUQ3+GRs+0CKAtuMPHStffvA5Hles2XW6nWZ+oFZa3IzhashLuoxisK9SjLUPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7477
X-purgate-ID: tlsNG-42698a/1781855430-47FE900E-C675C39E/0/0
X-purgate-type: clean
X-purgate-size: 6592
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 935B46A4726

Read the distance between NUMA nodes from the Device Tree's
'distance-map' node.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/setup.c           |  4 ++
 xen/common/device-tree/numa.c  | 76 ++++++++++++++++++++++++++++++++++
 xen/common/numa-distance-map.c | 49 ++++++++++++++++++++--
 xen/include/xen/dt-numa.h      |  1 +
 xen/include/xen/numa.h         |  5 +++
 5 files changed, 132 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index cdabf536b0..cf12c406fc 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -375,6 +375,10 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
         device_tree_flattened = NULL;
     }
 
+#ifdef CONFIG_NUMA
+    numa_distance_table_init();
+#endif /* CONFIG_NUMA */
+
     init_IRQ();
 
     platform_init();
diff --git a/xen/common/device-tree/numa.c b/xen/common/device-tree/numa.c
index ff5a7dee9a..3dd608b599 100644
--- a/xen/common/device-tree/numa.c
+++ b/xen/common/device-tree/numa.c
@@ -1,4 +1,80 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from Linux kernel 7.0's $drivers/of/of_numa.c
+ * Parse 'distance-map'
+ */
+
+#include <xen/bootinfo.h>
+#include <xen/device_tree.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/bootfdt.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+
+#define LOCAL_DISTANCE      10
+#define REMOTE_DISTANCE     20
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
+    if ( fdt_node_check_compatible(fdt, node, "numa-distance-map-v1") )
+        return;
+
+    prop = fdt_get_property(fdt, node, "distance-matrix", &len);
+    if ( !prop )
+        return;
+
+    matrix = (const __be32*)prop->data;
+    entry_count = len / sizeof(__be32);
+
+    if ( (entry_count <= 0) || (entry_count % 3) )
+        return;
+
+    for ( i = 0; i + 2 < entry_count; i += 3 )
+    {
+        uint32_t nodea, nodeb, distance;
+
+        nodea = dt_next_cell(1, &matrix);
+        nodeb = dt_next_cell(1, &matrix);
+        distance = dt_next_cell(1, &matrix);
+
+        if ( (nodea == nodeb && distance != LOCAL_DISTANCE) ||
+             (nodea != nodeb && distance <= LOCAL_DISTANCE) )
+        {
+            printk(XENLOG_WARNING "Invalid distance[node%d -> node%d] = %d\n",
+                   nodea, nodeb, distance);
+            continue;
+        }
+
+        numa_set_distance(nodea, nodeb, distance);
+
+        /* Set default distance of node B->A same as A->B */
+        if ( nodeb > nodea )
+            numa_set_distance(nodeb, nodea, distance);
+    }
+}
+
+void __init dt_numa_distance_table_init(void)
+{
+    dt_numa_parse_distance_map();
+}
 
 /*
  * Initialize memory affinity by registering bootinfo memory banks into Xen's
diff --git a/xen/common/numa-distance-map.c b/xen/common/numa-distance-map.c
index 73344f7f33..6e68912646 100644
--- a/xen/common/numa-distance-map.c
+++ b/xen/common/numa-distance-map.c
@@ -1,19 +1,62 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from Linux kernel 7.0's $mm/numa_memblks.c
+ */
 
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
+#include <xen/acpi.h>
+
 
 #define LOCAL_DISTANCE      10
 #define REMOTE_DISTANCE     20
 
+uint8_t * __ro_after_init numa_distance;
+
 /*
  * Get the distance between node 'from' and node 'to'.
  */
 uint8_t numa_node_distance(unsigned int from, unsigned int to)
 {
-    if ( from != to )
-        return REMOTE_DISTANCE;
-    return LOCAL_DISTANCE;
+    const unsigned int nr_nodes = last_node(node_online_map) + 1U;
+
+    if ( from >= nr_nodes || to >= nr_nodes )
+        return from == to ? LOCAL_DISTANCE : REMOTE_DISTANCE;
+
+    return numa_distance[from * nr_nodes + to];
+}
+
+void __init numa_set_distance(unsigned int from, unsigned int to,
+                                     unsigned int distance)
+{
+    const unsigned int nr_nodes = last_node(node_online_map) + 1U;
+
+    if ( (uint8_t)distance != distance || from >= nr_nodes || to >= nr_nodes )
+        printk(XENLOG_WARNING "Invalid distance[node%d -> node%d] = %d\n",
+               from, to, distance);
+    else
+        numa_distance[from * nr_nodes + to] = distance;
+}
+
+void __init numa_distance_table_init(void)
+{
+    const unsigned int nr_nodes = last_node(node_online_map) + 1U;
+    unsigned int i, j;
+
+    numa_distance = xzalloc_array(uint8_t, nr_nodes * nr_nodes);
+    if ( !numa_distance )
+        panic("Failed to allocate memory for numa distance-map array\n");
+
+    /* fill with the default distances */
+    for ( i = 0U; i < nr_nodes; i++ )
+        for ( j = 0U; j < nr_nodes; j++ )
+            numa_distance[i * nr_nodes + j] = i == j ?
+                LOCAL_DISTANCE : REMOTE_DISTANCE;
+
+    if ( acpi_disabled )
+        dt_numa_distance_table_init();
+    else
+        ; /* Initialize the distance-map array with ACPI SLIT */
 }
diff --git a/xen/include/xen/dt-numa.h b/xen/include/xen/dt-numa.h
index 943bc0e453..352853dd81 100644
--- a/xen/include/xen/dt-numa.h
+++ b/xen/include/xen/dt-numa.h
@@ -14,6 +14,7 @@ static inline unsigned int numa_node_to_dt_nid(unsigned int n)
 #ifdef CONFIG_DEVICE_TREE_NUMA
 
 void dt_numa_memory_affinity_init(void);
+void dt_numa_distance_table_init(void);
 
 #endif /* CONFIG_DEVICE_TREE_NUMA */
 
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 18c22d3d30..e7201539d1 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -129,6 +129,11 @@ extern bool numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
 extern void numa_set_processor_nodes_parsed(nodeid_t node);
 
 extern uint8_t numa_node_distance(unsigned int from, unsigned int to);
+extern void numa_set_distance(unsigned int from, unsigned int to,
+                              unsigned int distance);
+extern void numa_distance_table_init(void);
+
+extern uint8_t *numa_distance;
 
 #else
 
-- 
2.43.0


