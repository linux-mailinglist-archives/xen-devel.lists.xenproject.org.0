Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ5SGdm6HGqRRwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 189206182C4
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323504.1589299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxX-0001pF-LD; Sun, 31 May 2026 22:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323504.1589299; Sun, 31 May 2026 22:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxX-0001kP-9J; Sun, 31 May 2026 22:48:43 +0000
Received: by outflank-mailman (input) for mailman id 1323504;
 Sun, 31 May 2026 22:48:40 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxU-00015x-Im
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxT-00Fm16-W0
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:39 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba94-e002-0a2a0a5209dd-0a2a45059030-28
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:39 +0200
Received: from [52.101.228.101]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbac4-aaa8-0a2a45050019-3465e465f6ed-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:39 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:36 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:36 +0000
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
 b=COCk8re3RfSIKMmvtRUc/dRmE1x/Kf8g4evLN+yMXXopCC+bHZy+NXptUic2FSl7tYFDfBAqLetqGXaVUKFKJ4nSSUvtbahQh7WaCfgLuMtzQUXF7N+8ePAVKpfFUJqCpzrf1mRwbNi1x/A/7dkRjiYhNUtcK6DYAhkCp0jVmQOgspmX328JbUQI7m3UsyDfLDHGz+bWdF8xv0g3Fbu+9vHVv9U2NR3RHEvcR3pqVJ8MAQrP0drKx7jly4Z9U1q5EccbnwGBPjjKQ0EAx0YNbSgFBSQdBMt8V/9s1iId+2pBj2M93VmAOTIQdnLvkPtN+cfCuT4EdFHCJn663sBiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IISNxGg7j9E7jMdBYWz59g/s/VxE99jHkjaKf+wwH+g=;
 b=IpRy2q8LMgJQWhb8ZthAW54qsiJcMQ9/a75Vaa522GKYsooKuaWr2M9KmQkPkxXrwK/zpdIgSMP2EHJkTqjrQ9TOL4Vv9BDmvYyHVlmCUYYyy9VpuH1YbkI+l3GazaIlxcfft7/5AUkAlb980IFsdB/ak+rKWbfIrXKGlt2MyX3B7sFfs/XIMkJ7R9oew+FFaE+pzTKHlp50YMAQhnfe5FV3lacTS57D2x0wpDzZgmbsuNJc11feM5HU2oEFP5J/VbPqH/A/8agzYfdrXF8Tf+AYLVZ7K78Y/89doE6JUg+glmi92yuLDA64IHAunkuRiN4zfZVxI2kK3x87LV/SRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IISNxGg7j9E7jMdBYWz59g/s/VxE99jHkjaKf+wwH+g=;
 b=IzNEOckXna7VZxMBqejxMv5fgYtcD8yJM2zmxSGH3Ml1wTXul0P/EH7oOa5kJE2fNkADJiRH8stkoGDuLMF4vwaSs5XRkFuS8kzJ+ry555xO7Ulr2o/lFRVQqUOMsAdIexrxWMBpg3t16rchWQQNfbfdamM1Ck21K5PcLco1fJc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 19/24] xen/arm: Balance Dom0 vCPU assignment across NUMA nodes
Date: Mon,  1 Jun 2026 07:47:49 +0900
Message-ID: <20260531224755.9481-20-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0092.jpnprd01.prod.outlook.com
 (2603:1096:405:3::32) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc2b39a-2596-436f-de9a-08debf66c028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1WWImC2jJ26bJa8rPJbfAJuzVL/ZEseCnAS9f6LKGaUDN3U4t+PL1O6E2RjdCEOFQX7w95N+7VM9EK7csizBPViH6X5yLpoEn1ridRo7ZWOyhnNXq0ALZL2JrLBgwcqrXnfdlae4EFNswi2iiKQvZfUK6DoSqTGiyVzvCtwgxvz2NQWBcqWl69mA4nprwAaYGo6TLvhFhlk38oyvHpxzcw0UxJYsK9eM9t0c/IAmg3Wuf4tVYgeN77U4uyte9pDKugWilOniLeHORFdRIZ+CpTT9BO6PG0x/nXPOoRGPZBpKelna4qkKvrudRoKbVJ2zlrAAYb9QoVub1ZQKpm6PKSEeCoZp7R5NiPh/qi5ZppJ9B7MRwey8sIuZdgoZsHwJgRsBNAH8LcdvnfUtj1scwGsQ25n7Vb/hUzg8dfVy8yK/1N0Mju90JbdLMKI7nR2q+7sOdkU1xYVQxjE5NA8I3pchhyHyk8uAjyqiPpXF/0g3P13m6TZ9jDmunQ22ZFMkxjvCal2FvHdhIwZJZ4CYAhGAX7ayQC4g0JJlLJ3SROVfz654OeagycPvua+taZxlUYMJBXWQ75VGiTEdYOYsWwJpIyjDCv35Cd9v2nF7vt7OZcFMOKFOYkUBlu2rD+5WnojOz2l9VbTrBptjmlHBk7EhgejGRN0EFpg33XZZVp8TUENV+NxirtHE6IPqwb9B
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O9qGmcUVeGZASHH6LuBQzktE9CRYPNZC0HqlpWK1IkxBxcHFnJjthrTaZ1Ln?=
 =?us-ascii?Q?kV6HgaeEoaA2JqTUyimpCdswUG2zX6CAgeVBGQXAMyMXm5r5WywjaK8fMRv9?=
 =?us-ascii?Q?Mc4xBrPq1S0L4vrVwjvv4wGEG3JeLVf17V0NQqWG+xI/J5UEsJ7sCblIJrmB?=
 =?us-ascii?Q?rRw8ZGdeL5FXs6AWET4QxBlXjUHL7X/e+SumhewPzpXW7Dm+dGsr9Rnbpshh?=
 =?us-ascii?Q?TdKCw1LXO5AY80vOk6omtIKC2dL6w7D5Asb8uo1tw29g86SvwNFCzbBG4BX5?=
 =?us-ascii?Q?EXcHcwbklxW5h+tEd9C1Ufo4ZV4FKq14sy+1/25KxrWThmcbiXDcNWTGru6j?=
 =?us-ascii?Q?XFn4cgv8lNwbeR9H/olPcVptRJpdO0W50bVossdOD+2nKqTQfssmBC6WyPis?=
 =?us-ascii?Q?BV4ZhSkw9NtCvFPqo9+2gJkk5EiRGmoHwwGrYFZZXO/5k3MbGQBlIb8T70zt?=
 =?us-ascii?Q?TCmyrTAevq52/gWd0ndgZuXfNGj9GJIMxfDohQ1UFFf11YJQAWBVvO3Zp81v?=
 =?us-ascii?Q?u7bIOdTiZcoYRWhQSykzh7Hfn0ct7HLhWq+QpPLVrAaHfyXYZn2wIpty5YcC?=
 =?us-ascii?Q?623ffhMFUONJGy/Wzg6fbzG0LQeyfouIjczqHbD1qoQy9vBn293HudKbdio/?=
 =?us-ascii?Q?4d7Qrw4/TrAxSOYuleOMRt2ETpizZGi31J9atoP6+rBAk0dA3I3bLy21et61?=
 =?us-ascii?Q?IIRBmIknMqBBGGUjYTfjuAIS3MESJxf1claq09nB+m32a3MCqyXyKnFNHW4l?=
 =?us-ascii?Q?hEVOiSbz7Ve33V9BgZyw6kr9cNfsDYEJCcGhgED63grYxvlseiHxu8bsCXxK?=
 =?us-ascii?Q?d0vvzdqgdr5f71iu8DJqTK26sG7U9/uQ5MDcS17+p0GVt0y1d4t6rsa5DaaN?=
 =?us-ascii?Q?lNa5U8MhdAbS/p07wfEx/m4ztw6iG79+CQsKDZS33ipbJO+eF+YQUuKpJ2RQ?=
 =?us-ascii?Q?tMisNDaulCgY2otCQatQoK8Bb9RGqdyFOjgYt8uEQTN06ps+KRA09+s69945?=
 =?us-ascii?Q?+Mo/GbRNqHfA1zMJBWDJR5hU9zjIvwXBXmbsPM9zWHugQnciOuTMuB738NJI?=
 =?us-ascii?Q?dpz6CmVDGQgS09mG5BTWyoi3lZM1AwaBX06MYI42hdramL8Tow4z0x3feJBC?=
 =?us-ascii?Q?A3pm5turwu5LIiScqleR1hoMCd/F6Ag9shPy0sbgEiz3VN5NehzL3bLlDTRX?=
 =?us-ascii?Q?3BzF9Ejyzs0Kv/sHHnQs4pfN0JPTInc2+lymRWTH7WeeauOr66fchesRmqCk?=
 =?us-ascii?Q?32YBaBHuAOZfIzFsi0hU8Cot80pfHCV39xK+wJddunc4getkP6VZxgbILC+z?=
 =?us-ascii?Q?m0IvHYXE4FBcht7QaDzmxW/FrHqlwwnB9dnkFDxHcTo0KZDyx6riJnw7phl9?=
 =?us-ascii?Q?S7PBa/baFl/li0iS55QOyAn+UJtBaeWYP/uVuLmUvq/9V9yyJ8iSWtVA7RLm?=
 =?us-ascii?Q?ijDI/iH35Oe/ClsJuVja/+sxdkZijQoqB3gg3zezSLdpd2ndW8CItHKBSCZ0?=
 =?us-ascii?Q?9jPfxhQOobSNvxkZ4qMDSMXphk5sqltdCw+ah5mZVJmTiQBEQEV8HURIdty2?=
 =?us-ascii?Q?o4hYEde6CIbeE0bxVIAcoMOZLL5sg+X4sICUwhFn56LXEUytKGrZDfTLLGnI?=
 =?us-ascii?Q?hJKmlKxkp1fVmVC3TZNluOoLDkBK5zVCYopAf6t0lWKnprUq9iwBJ97UFJRs?=
 =?us-ascii?Q?UxsugkIQBixtwVOBIR0mZ5NpOAGc0j/KNzY/vxLdsh4AIrc+KtODn32QQFTB?=
 =?us-ascii?Q?EoDfYRdRwP22jJHx5Q6aLE76M7Yjq9QQ3aDR7UdFGnEkfGWsilnL4rdvm5Jg?=
X-MS-Exchange-AntiSpam-MessageData-1: ltMrkk7yWSIGaQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc2b39a-2596-436f-de9a-08debf66c028
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:36.5265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wRLAjlebmi30tNOmSDwP1XbByKv89S4B6Oe4VWhmQihdg3t1pCN9nPrTle6VTMFGT9XdWpdF5VJ8V9yPZ8867w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-c201ff/1780267719-E2F94443-F76F4A0F/0/0
X-purgate-type: clean
X-purgate-size: 2013
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 189206182C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Configure the assignment of Dom0 vCPUs to NUMA nodes, aiming to balance
the compute load across the available nodes.
---
 xen/arch/arm/domain_build.c | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1deb4c1139..a62adafa19 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1225,6 +1225,34 @@ int __init make_psci_node(void *fdt)
     return res;
 }
 
+/*
+ * Map a Dom0 vCPU ID to a target NUMA node ID.
+ */
+static nodeid_t __init dom0_vcpu_to_node(const struct domain *d, unsigned int vcpu_id)
+{
+    nodeid_t nodes[MAX_NUMNODES];
+    unsigned int nr_nodes = 0;
+    unsigned int vcpus_per_node;
+    unsigned int node_idx;
+    nodeid_t n;
+
+    if ( nodes_empty(d->node_affinity) )
+        return 0;
+
+    for_each_node_mask(n, d->node_affinity)
+        nodes[nr_nodes++] = n;
+
+    if ( nr_nodes == 0 )
+        return 0;
+
+    vcpus_per_node = (d->max_vcpus + nr_nodes - 1) / nr_nodes;
+    node_idx = vcpu_id / vcpus_per_node;
+
+    ASSERT(node_idx < nr_nodes);
+
+    return nodes[node_idx];
+}
+
 int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
 {
     int res;
@@ -1907,6 +1935,24 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
             vcpu_switch_to_aarch64_mode(d->vcpu[i]);
     }
 
+    /*
+     * If Dom0 has specific NUMA node affinity configured, bind each vCPU
+     * to its designated physical node.
+     */
+    for ( i = 0; i < d->max_vcpus; i++ )
+    {
+        struct vcpu *v = d->vcpu[i];
+        nodeid_t pnode;
+        const cpumask_t *nodemask;
+
+        if ( !v ) continue;
+
+        pnode = dom0_vcpu_to_node(d, i);
+        nodemask = &node_to_cpumask(pnode);
+
+        vcpu_set_hard_affinity(v, nodemask);
+    }
+
     domain_update_node_affinity(d);
 
     v->is_initialised = 1;
-- 
2.43.0


