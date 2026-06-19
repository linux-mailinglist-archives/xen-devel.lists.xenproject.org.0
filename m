Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m8lkGer0NGoBlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F0F6A4702
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=SdOy6zJu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341736.1602047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzj-0005FB-4x; Fri, 19 Jun 2026 07:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341736.1602047; Fri, 19 Jun 2026 07:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzi-0005Df-V3; Fri, 19 Jun 2026 07:50:30 +0000
Received: by outflank-mailman (input) for mailman id 1341736;
 Fri, 19 Jun 2026 07:50:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzh-0004pH-QI
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzh-001qMv-71
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b5-2eae-0a2a0a5409dd-0a2a450bb90e-44
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:29 +0200
Received: from [40.107.74.114]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b9-5e53-0a2a450b0019-286b4a724d13-8
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:28 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB7477.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:356::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:50:24 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:24 +0000
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
 b=hoddoynRJb9jSI2y7eY2X8YgPtVNPm2jClijp8XlLbY+wW9Y8urVPKZ88IcI257koIbx3gKBwbUI7Do4LLoFtnWAFJsKwZgUfeEhawNyTB2ois2lDS+HBAUB1tNCPb1XTqq0jk7ZrPTGNDSLB35CNWzakjEWwGyItDryueyZRNSHiICJEFGm6Nedb3RDea6GsphgqOD/5z80j4XKZZmsHjohPXWpHCW30/JBDJj0wifYzZ+LUxddb42ThDJfSjtpUKUPZ9WF61huXOeoRhOOA2BIN7D5kucJbL/NGVOZFwo8EUogxwWOYfrsULOGwEuhv0scZR58GbtnTdbSOhRluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHp6m7ACt989g4mUr+Mdtue0BtyxlOvoHV2Q/YLtGtc=;
 b=QeINBDEpD4ld4EgQHRnWRRaowWZedfG1wIHj2py4YJNd1cxvr0ysf3qZTgt4VefMhgKzAU5V37hjKx/t7iO6yohVOyN8h6fmR1IJ0ZnqJX5k5VllXDilmtDUbqj0XaR8nt6F/07nDYzuEY42xuANtlCJd3ZINCbXR4Ucvirpy3On08X4zWBrIYekQdWnir4CD6J3eydp2ZA1C35sWg4kXi2CTGk819MSn/9erW8exaNMvkih6NIkrjPvIYt/bb4q0j7ryc16ZfMQcX5C0KTHBAb6avEQMrkBwcx6MR27z8775rCu8jNZg2fc+sNd0pkPiX8ymYD86JGlWK3k/QExTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHp6m7ACt989g4mUr+Mdtue0BtyxlOvoHV2Q/YLtGtc=;
 b=SdOy6zJu1KN2vDh69sKCTd58flUSHvoVKnoMQ9EqCXhZGQxxvTol35vqTyHuNtzhhu73VK3C4dU2/n9oTLjzIXvjKFVWsFNMNoNPZHOFT4/BczOZz27QsY0KoSg4QS5TjUD3PHtY0+BWKEFdduxeSXH7moImX3oC3dCByRc2tn4=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 06/22] xen/arm: Map populated CPUs to their respective NUMA nodes
Date: Fri, 19 Jun 2026 16:49:54 +0900
Message-ID: <20260619075011.377116-7-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:405:379::7) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY4P286MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: d58d05ba-8b91-4d97-2fc5-08decdd76bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2XME3FsXRqbpMutWzR+Ouj3IngTQo+8ZQWVruWqre9KCfWi0CY8nfdxf5MLNbvYobbRf3k1vJV/zU1xGOX1sKDjoNWQg2c0QwFqQBdLkj16Az/VYsSJeIiv1JTxAGIiCw3kp/fgRR/bq0TLgewxaTaDPNdXlPcRVET9HLQPDrJxqSPDkidV6aZBX5ZRXX7bVka0BNmC48WpMSocHpuuNGBCAEFuRkZQWJm4Q+1d+mgFgSvg7vgxfK8N2Yv+TIebyaJ/KqEybP/3iX5V3ZW7Plfqu7sm2A+tYRf4KcX8pEPnHXhrRB67XD9TpdWSYVIs/IrAyAe1ObYrBV+4Qbs9Htf4QKLI9JDEdn78PyJHbu0Reu1hOxnVJZ7rpIWdNphwB/Zw6UTzYXtHFC9jP+CvEDJe1WoTcmQmzYTY6uWoBmszOdDHPY7HxdJQpwicvMmAh89PYpYMgAgBG4NyppbWRNpnrkHL/ODLshjob5pi6ipo3206WT3t0wyUgNAi4Np8nqhQTdftLZUocaAu1BlxFEsCgKfr9WmmtjAdqvO5O/xpA9CbdfUmzFSl7aZTtKpTY9126pGG+MSd7JGSvdDu7LxKZUUumQKeloWe3BAFSbFIA2YFLRRaBOpmYMo51ZkLLkl1B/bY5rAuso4TOGOtIk1fzpxURv6SwyyI194aCV6M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QHqTcAm7mA+zA1tS6cXmfTwNKriSNuQQOsQDrB+Hps52ZNyv+4Zu92nkh0Sz?=
 =?us-ascii?Q?Lzoj5tu+HzunM6Iq495H0DoF5Rns5w27Ljv0up5YCeqBYeAhug3W9Tqf2VKQ?=
 =?us-ascii?Q?VUZYZavqeYJdY1C8wvMeTUxPg961zwchRK6S4ugu/dpZ5Chj/GUH/P3+GhY/?=
 =?us-ascii?Q?OG/34L5FyGhOnJgNK9SDZ9X3659UNcDW64O0uj3du2diP77qlnQUxmD2s53I?=
 =?us-ascii?Q?6MzMZD3FQIU298mI7Txq8wvSfepizC/PU8geTMW8tu2k3XQjKkkzdZ5aVuOA?=
 =?us-ascii?Q?09gBmgJoH8/OdNS2mPZGJmIAknYzZ3ZptpzEUu1lfzirdfttEmPocXV6UERM?=
 =?us-ascii?Q?p8tG6PtOJ/NIgnxRWJogUwaaWWO55pSeamLw0Ap25pS5HvtblSR23CSmgRh4?=
 =?us-ascii?Q?2z+UI/pqSRsidO2bDVmkHWZefeWX2IZjANSmH2fm8nmpvDaQHqW3aWHm8aHc?=
 =?us-ascii?Q?6nqXTlGMYdfChB9YSPQ9Tka5LfXbYUfEZbIyDfNleQmzdOBdlABbhiVw1bp5?=
 =?us-ascii?Q?edXUocSJLa/oeNQgbRbf595SJXQOmJ7VpYpKmdZDT7jYRiiaODy6No1MHkeR?=
 =?us-ascii?Q?xa9jWPvUz1MRB5/8Gk4mY5yCHyk5aFKs2h6fTfl5AeHc7oDm3/3JihfP8ZSm?=
 =?us-ascii?Q?/2QwQZIkuOFi3WXpU/5pxTpn4VGzXugKyowC2DMiMGBCG9uVaivySQCaLOXv?=
 =?us-ascii?Q?4xUJQUYVGVT6SF71dmLjSoXLOe6WZZWKiR+FserPINQLzVJjb7SW3HHXGl62?=
 =?us-ascii?Q?rj+D9femyreN6fJuZOOzPvu4Yn1UupNrYj9C0nY+hoDusV6xmE4z5kBuRBkf?=
 =?us-ascii?Q?mrcXmZuK6uUtlLPsTpZu/mlWAZzYMTUpoDCDdT7gZt9LSaEKo0/civtDXywK?=
 =?us-ascii?Q?7NraLRzgChbYuk4f2LOvx3Quy3unf7OMmQZA1GDYkur/yBVjG/7KUzO0WFns?=
 =?us-ascii?Q?pJgIDVvyMkv7zArUdynizlxy3KA2kmPE6Fc2ltAaeZ2PfPrvQRiJHuh+2qiu?=
 =?us-ascii?Q?jb29nHOQJYFlolv2CPuVptaFye8t7clKRyivbw4fM8BtzsEcjyPLiLxJ3WKk?=
 =?us-ascii?Q?qvipIJ9ztSHE99DAfImdMf+wRDoSFa6Ekm0yDCpdrDAOgFgqXA8/GcvV8NFs?=
 =?us-ascii?Q?lhOpRAR7Jn3uvrWabBefv+k/LkBbztdkWJgm2atVSntVnZ+pDDujGWlj7dDG?=
 =?us-ascii?Q?F8HUeVFpMF0oE9ixe1GU08WyiyF8bHQ6PYP48yZUprYHTO7UzDx51pKT0zQ4?=
 =?us-ascii?Q?DNpQjcuaRDUwgVJH/PXabbl6bAXWdWGeWVTTD7jpBSLMZ8Fa/ZMQ8a+FCKVv?=
 =?us-ascii?Q?cgU0yZu/wJo7s1zfEWs2bmEXT12iHYVlVsLPjggEkQXTe/6FakPd+KlA18sV?=
 =?us-ascii?Q?CyujBWOpe0QYym0slqthz/MbTSV91hluCjVVafofjPmEerfjr8gS5rw43McS?=
 =?us-ascii?Q?n7IpSDPv2GbNeivVg9uEWAjw7nMrjF3VWH6ULBW/blsjQybY6mc1qKHGh5Zm?=
 =?us-ascii?Q?1O0JYTgG8IyB/CBjn9Cz2L6ZzEFQ2q1oM+KoHFIHZn08R6giw+n62A0LAcHm?=
 =?us-ascii?Q?RYXmz7z4ZvCGVpsRaUGUigwVQ3/bqDIAhi/R6iMG59MhIbwwfGJZ9UGyOQ5x?=
 =?us-ascii?Q?NqFFwLCCqpIkjvE99LT9G4GTyBHltXtjSfMQAZoZJJ0tCOmZmfdIzrrmKnCY?=
 =?us-ascii?Q?nAt9LykLF8IlVdQ5JXVBGMkKlzmjtFnlXqHpQOLX3hCYP9oLkN+5UYvE3o6/?=
 =?us-ascii?Q?iZglWz1/doByrYr/+VQwkG8oO1umWuxmElnJGycL9mrzd5LSxTdomx4gDR80?=
X-MS-Exchange-AntiSpam-MessageData-1: STRszDs9M+88Kg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d58d05ba-8b91-4d97-2fc5-08decdd76bd0
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:24.4595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztf83p+HP2+yu1FrRgKHDRZAAixgPmE/2S6VwcJ3Q7I+WmHICfyPPlg54DcLKoCerc24ql8oDFFKzCvv697QHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7477
X-purgate-ID: tlsNG-42698a/1781855429-4DFF900E-FAC01265/0/0
X-purgate-type: clean
X-purgate-size: 1651
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70F0F6A4702

Map the populated CPUs to their respective NUMA nodes. The NUMA
node ID for each CPU is retrieved from the Device Tree.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/smpboot.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index d1651fe7dd..23c5a46757 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -133,6 +133,9 @@ static void __init dt_smp_init_cpus(void)
     };
     bool bootcpu_valid = false;
     int rc;
+#ifdef CONFIG_DEVICE_TREE_NUMA
+    static nodeid_t __initdata cpu_to_numa[NR_CPUS];
+#endif /* CONFIG_DEVICE_TREE_NUMA */
 
     mpidr = system_cpuinfo.mpidr.bits & MPIDR_HWID_MASK;
 
@@ -244,6 +247,17 @@ static void __init dt_smp_init_cpus(void)
         }
         else
             tmp_map[i] = hwid;
+
+#ifdef CONFIG_DEVICE_TREE_NUMA
+        if ( tmp_map[i] != MPIDR_INVALID )
+        {
+            uint32_t nid;
+            if ( numa_disabled()
+                    || !dt_property_read_u32(cpu, "numa-node-id", &nid) )
+                nid = 0U; /* default node */
+            cpu_to_numa[i] = nid >= MAX_NUMNODES ? 0U : nid;
+        }
+#endif /* CONFIG_DEVICE_TREE_NUMA */
     }
 
     if ( !bootcpu_valid )
@@ -259,6 +273,10 @@ static void __init dt_smp_init_cpus(void)
             continue;
         cpumask_set_cpu(i, &cpu_possible_map);
         cpu_logical_map(i) = tmp_map[i];
+#ifdef CONFIG_DEVICE_TREE_NUMA
+        numa_set_node(i, cpu_to_numa[i]);
+        numa_add_cpu(i);
+#endif /* CONFIG_DEVICE_TREE_NUMA */
     }
 }
 
-- 
2.43.0


