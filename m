Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3qGKLer0NGoIlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 646956A470D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=ESzMuOup;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341755.1602119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzx-0007oE-U8; Fri, 19 Jun 2026 07:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341755.1602119; Fri, 19 Jun 2026 07:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzx-0007l8-Mr; Fri, 19 Jun 2026 07:50:45 +0000
Received: by outflank-mailman (input) for mailman id 1341755;
 Fri, 19 Jun 2026 07:50:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzw-0007e5-P6
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzw-001qUf-5x
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:44 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4c4-2eae-0a2a0a5409dd-0a2a450cb99e-38
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:44 +0200
Received: from [52.101.125.75]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4d0-94a4-0a2a450c0019-34657d4b8662-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:42 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB4024.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:185::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 07:50:39 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:39 +0000
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
 b=DiHVHu4VAR5R+0uhqY5GOhSqebxFGeW2w7V7K5V/eBTy/MmsTV8G5zTVE8bZCySRipxyCWhhrDfUO649q15BH6a/QX2ABaftwKDLoFeaNlwXchu6vYPeeQJiPBVym8qpyGako3e8/YRk6sEDvSVf/db1claE6XXCY0QI1qMyFs6Al0Wo/iz7UFYbVpCOIh1nA77kXUWE0zjHcLWfWp6xL5g1Ge+eC8V8IOfa2vsNm+ZuQCh/6ixiUIvgwIvXxRg4tV5xcM7wetRLpPgTaRnXhEgmgz6f2O+WS4j5/q7u1ZbU/slndwILKTizuIqHkI76nZ6SyQhLkSQjd1KME8b5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0WClwWoPG9QZSwKRNXVdSlrLBLvrdbvn531SGZtWAM=;
 b=ijSUBZCxlhY83Hp7HMotDcQLx4nkfU2CKovuylwd7j5Bsp1CYEPJus06tbvydaOYtHRdX8QeSK1FOgk79LCWesIgz79yP9RBAjrIWR6dcHfOnHEseQaxy1N8SBxybTYl0tu/8V0kVCZ7VlC3ycvCYJV2hBlEe6sv6KCe8CeawGREuvz6rEBa/iJd18PLZPgTxODyTi+np+unEZmZAzG0WrV3cQpaMrsjeqfEuri01yytnbISUAmICkMs63cufcD5FtZERzrqpTJ3RW2T9f2i7OAHKUUvcDAYY+xlITahM060tDjZ51lcIHETNOxR4KWJCHBf6v56OUbi1M5mKHUv8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0WClwWoPG9QZSwKRNXVdSlrLBLvrdbvn531SGZtWAM=;
 b=ESzMuOup/OdeYbf1lOj1o9Cf+Mnd6cNaXx2toazJinhjiJMM0kaXg0yywQhvBRhydcBfB8ZUTvR2qcnukNt5sjdAD0VDwUQnZsb6ZjMw/kJ67ZCErZnu70JkSyryQIzxbewHfJb8fAulfIZmuzcGyRPlwZxji4I4dJNpuGNaBDE=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 14/22] xen/arm: Generate distance-map node for Dom0 Device Tree
Date: Fri, 19 Jun 2026 16:50:02 +0900
Message-ID: <20260619075011.377116-15-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0099.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::7) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYTP286MB4024:EE_
X-MS-Office365-Filtering-Correlation-Id: e0c05263-1cee-4145-3f0a-08decdd774a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ziKKeHFc4iMWK7yKuRK8k2WJNVYo5EXN7sbGBFgZ8t2F74mDPHVHxvY17kdzvV6q4F9Ce7tpfNTYOlBzucTFeVNiuJLQnKJQtuydyKvHOyB/ApCPyBZELJRUc7cCxvUxulSx6Q3kNG0xbMd5PMgbTC5mXyF4zhXrRyloAdgUX0C7QPQJqrSg3BaXa1zJk2rtdRRTII5J86p3rIzMny6nDskttn8MypPep0ib9A+ddOfVRDuMyJGW4Fd6K6mqLSQRFdl1BZNa2gxErs9oesaol9Jbz+vlfKMo+tcDNcwTLiUvKXcYPUF3Gct+A5iKFc30p+moR4bfrk4XlxaBN3oz1qVT6DCvn4829+X4YgT1KgE9c+hb31/flaSGie0O9bdXV+7fnsE+Q97bybIbd5U3sDoenVD2laIsy3MMQLVEWfO3oV1WVAQYwdclKeiEzvU2DuClk7vO0b+RA3uMnrQYtu8FLrtMR6D2Gf2GyeyvOobqISzgpmTPXR+lf6BvaZ0b2TOb+jAj7pVZ7aSCWoF2vdyaPOCAll+dboNOjSacr27bnbgApHH5NHNTubYY/Tk40KB0WwuZOiy1b1m9/nNhuHKd8e7ndT+ABsYokU5MPlqWdowx+sKJHWy1bPYRexZM1v3rbyVM9YkA0oDH2IeLt+8uA584kdCsLCqgPGpZhFk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T8+n1cK4hMJT8FlcK7vIL0t4zIZ18Qt75/nvzI07QZuYqd7xfoOEljCfnzPs?=
 =?us-ascii?Q?zVo3O2FXNWe/tWOw4uva7Q88BAh/VtBtKdb6vpj0smKGyZMD1mraGef8MY45?=
 =?us-ascii?Q?eD8N5KY2xqMaypUdN8WqrmdvbACItWrrRXqPyDm7wT8AHl1U279LNaEy1u5U?=
 =?us-ascii?Q?i8ouZETID71emHYZdL8JeZx/WgGlq+W+eHBXkTvfNV3eJXwCR2O0Ynw41hvB?=
 =?us-ascii?Q?8rfE1A8HZiwDIG5WvDQWN7LRCpFdbHxIu04+c48r6dP+L7jjUubrMoyZfb3Q?=
 =?us-ascii?Q?QuaNLUqkrBMMlPEm1GtBh4rtDowOoIYOwT143U0DbKaIjFXbNuROy93MC+0v?=
 =?us-ascii?Q?aUIzAumvcU7mDxITcH/oQKdK2lRut0qj7tb01CmDxYF8kpbHWZboISC33Osa?=
 =?us-ascii?Q?U1Nu1QIpmd6d/TtVmGNMLpp4z44NCYZZv8fCQjEe7iXG7nV7taTjoOfvQZZG?=
 =?us-ascii?Q?Vx8poeXHlGJSP7Gs1+btivxrffDOiAVe1ZvMTamMPjmrtzMY8HyYtYq/TGPi?=
 =?us-ascii?Q?AMvJh7HZp0VMOH8Kufa0SrHBBbhbQmtgmrKkamx1bFxrbVj1e9XFTAKnBo1W?=
 =?us-ascii?Q?d5877avvPSJaoE8MSKSyiMWdkzz/Byfy8P/eaTXRGNpabNC5FkJoB9T2S+Ja?=
 =?us-ascii?Q?cJTn4dADgFL1rhrJIAmRo5ghPjwwSL/O1gYXBB5JjLgCjjbIoh6rHMtqZrFn?=
 =?us-ascii?Q?o2HlaXCB1oW5j7LW2T3BaF0cc/fuEjAAV7/HWDsLbR+GfWwIomTo+Vb6uO7v?=
 =?us-ascii?Q?Ir6MfAtqTwoBa5KuATQLCN8MA7hHiKzCmCktCPBf+p4L2KsmLF0ZBUfLGgh9?=
 =?us-ascii?Q?kUJhlkyLS5TWeGcWorV9k7ENPW6NQceL/+gEyi0JiypIJ7Uta10nNsUS0pL4?=
 =?us-ascii?Q?/SKnleZJmXTbbvb1BaRmzwYD8Ezm2rptK/RgQCc45O6UDPFW5bJddpm/qA2G?=
 =?us-ascii?Q?vgI6WqAVDd8HerJlUGNnv6yOTRNC4L+vL45kz9yvYQ6Rq87l2YoTyCS9t9TU?=
 =?us-ascii?Q?t+5NglsGisqwDIiBkMsq7b4x85NVUgmFsRmtWU0Dw+TT4mOOqcfSwKxi6vBi?=
 =?us-ascii?Q?BW2Ip20Av0/4Se0pZJJnHCdQUWaPiyTbrrzqlujTp5vnFVOWmeB6JTCvUf4l?=
 =?us-ascii?Q?FDNPjP+sHeIowI0qzaCkkH1iLHrT6ymAnNfcy1qRZy967/k/Hwzs+dv1fzNd?=
 =?us-ascii?Q?piCrK7Hd/o+YLWjcfo40yiBFFDxtwqlQ44ldZN7bTAOg8frRviGkHMrYBEEA?=
 =?us-ascii?Q?Tc6KNjjLs0f+WMDpiNOvSfOuwKMS7nKGQVYNzqqcXPoQvG0sSrsh/ahFP1WX?=
 =?us-ascii?Q?eCSQcWNizX82fwR+BuPNPbrcT5jVHQHyQHnG3y90U9xyZsSQS8qpkM0S+xq4?=
 =?us-ascii?Q?n0gI3xtx1kyJP/5rQG9v+fm6RucobxGdp5OHxh3p0ebHhAH/8VMzhEFktg94?=
 =?us-ascii?Q?nTwoKVuvfaBhd5zk9zu+R/1VbVFxj31I46DtDZVq9C7Duda+aqOSFRyUMQy0?=
 =?us-ascii?Q?6BXjGl+uZCxR6NjlQv8Ki8b/2vT2+z/oDh7uhFlW0y2SxPpjJZFVMnM+9lwb?=
 =?us-ascii?Q?bTMSzomCBWTY3PSL7ZOsnwADdqP7q3uKReASFkF6f0WNKl7CuKKrmtjX6dT5?=
 =?us-ascii?Q?cHUcQS+ISWUtgaphn4xMHcTWLYlcj6bX/cGeUW2Y5NKKtX6xCYKVan/TKOxd?=
 =?us-ascii?Q?VXT5v1mPAliNEyraUDAHyqQlZCVBZODPTQDbMTuiwzSxLyykXJWiVvK5Vu21?=
 =?us-ascii?Q?UMmi76tPUiuyvLQ7KqJW7hFaCLfNCe4AYzC2HBLdnxMLFx/vo4dYm8GbueFG?=
X-MS-Exchange-AntiSpam-MessageData-1: 5jqKkky7jdn0Mg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e0c05263-1cee-4145-3f0a-08decdd774a6
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:39.2807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMp/7cNvEGDRiBdgCiXjyuoN0djxcmFmsfmVTXy9/Zx82NZgnMIyQUQhPhmPe5xJYBd3ZhjdXHpifszY93OLvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB4024
X-purgate-ID: tlsNG-d25034/1781855443-51FF5ABF-287CB1F1/0/0
X-purgate-type: clean
X-purgate-size: 2755
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
X-Rspamd-Queue-Id: 646956A470D

Generate the 'distance-map' node within the Domain-0 Device Tree.
This ensures that distances are populated only for the specific NUMA
nodes assigned to Domain-0.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/domain_build.c | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b4783fcfc9..c036721f45 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -726,6 +726,51 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
     return res;
 }
 
+#ifdef CONFIG_NUMA
+static int __init make_distance_map_node(const struct domain *d, void *fdt)
+{
+    nodeid_t from, to;
+    unsigned int count = 0;
+    int res;
+
+    static uint32_t __initdata matrix[MAX_NUMNODES * MAX_NUMNODES * 3];
+
+    if ( nodes_weight(d->node_affinity) <= 1 )
+        return 0;
+
+    for_each_node_mask(from, d->node_affinity)
+    {
+        for_each_node_mask(to, d->node_affinity)
+        {
+            matrix[count * 3 + 0] = cpu_to_fdt32(from);
+            matrix[count * 3 + 1] = cpu_to_fdt32(to);
+            matrix[count * 3 + 2] = cpu_to_fdt32(__node_distance(from, to));
+            count++;
+        }
+    }
+
+    res = fdt_begin_node(fdt, "distance-map");
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", "numa-distance-map-v1");
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "distance-matrix", matrix, count * 3 * sizeof(uint32_t));
+    if ( res )
+        return res;
+
+    res = fdt_end_node(fdt);
+    if ( res )
+        return res;
+
+    return 0;
+}
+#else /* CONFIG_NUMA */
+#define make_distance_map_node(d, fdt) (0)
+#endif /* CONFIG_NUMA */
+
 int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
                            void *data)
 {
@@ -1576,6 +1621,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         DT_MATCH_TYPE("memory"),
         /* The memory mapped timer is not supported by Xen. */
         DT_MATCH_COMPATIBLE("arm,armv7-timer-mem"),
+        DT_MATCH_COMPATIBLE("numa-distance-map-v1"),
         { /* sentinel */ },
     };
     static const struct dt_device_match timer_matches[] __initconst =
@@ -1741,6 +1787,10 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         if ( res )
             return res;
 
+        res = make_distance_map_node(d, kinfo->fdt);
+        if ( res )
+            return res;
+
         res = sci_dt_finalize(d, kinfo->fdt);
         if ( res )
             return res;
-- 
2.43.0


