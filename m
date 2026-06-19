Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XjFtKOv0NGoPlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6846A4721
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=M2nPPclW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341746.1602101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzt-00070Z-S0; Fri, 19 Jun 2026 07:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341746.1602101; Fri, 19 Jun 2026 07:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzt-0006v0-Fg; Fri, 19 Jun 2026 07:50:41 +0000
Received: by outflank-mailman (input) for mailman id 1341746;
 Fri, 19 Jun 2026 07:50:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzr-0006cB-25
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzq-00Dy3W-Ey
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:38 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4c7-e002-0a2a0a5209dd-0a2a450bbb74-24
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:38 +0200
Received: from [40.107.74.126]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4ca-5e53-0a2a450b0019-286b4a7e0f22-4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:38 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB4024.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:185::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 07:50:35 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:35 +0000
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
 b=XTlVHBsT0VGCVtdb5sr0nqKCsEE49c7NB1e+Id7lvGQg/5QuV21aCMkWkutdn9J5AKZK5SFUzdwKqLGbF6F8w8UKUMhePjWCaDcM8BuWdBH9aOyEcFoxY8mtov6Ck6LEVJFh1Nb/w3rtfkqRAZnirh+h5XjnB9dy9c7KfgVQHcWnAq/BLCa9OJC5jEqQPwdOEcaS5sCF6AcBzSqcsJ3w4bP5lBk88VdiOZorcXcJ7RYpL9jTGP4+fcDsfTegCe4seBAVSNOUZUYC0zu0RdyLI+HGxxh1t50hW/0/UEnV3/Gx1yd7EPg5zMG3zdk51EUIn3lzYq3GMKky9kNUD9cRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moxaBUEqcN1Ar7o5vjGkq1W7snnGpWMRypv+OJNZZ08=;
 b=U6LG9lu8W/4GKlNM12NaCafZTe559sJw1m/UDROB2QPDtzIy+SSbIQ9YBPIpcQIBoLmJTI12ftI3+54nUEYu0LAOPhsJCK8Z5TcvN2PKbujnu20d9f4KuD9AHQPfqYhuKyfOAE64INil0hSBlZa4uWQQu182tpsWo1dKpBgZk0FbQoW9hzkrCYtOf1z250GKTqHr4L9TCOQJObAeucmHGR3ePYZY4C28zrq1HN/tWLCoftnUs+DbJ/f4ObJxhXptmfgfWEUtCbDXsvKlI0GrCtuakkizsBBTbqGD0AcGPohtS6oC5upTaO/a0IHDLjXiYDGAhcbjA3SFcUT5jC/h0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moxaBUEqcN1Ar7o5vjGkq1W7snnGpWMRypv+OJNZZ08=;
 b=M2nPPclWQ7tHAT0VEJUucQUBZgw2r4zmId7waWbPPNvACmqbXlGjYTLknBNiFThmrQPkwvYwg1VGA6+T0QOxmW4PHlhbqMm3XtZdd6DLoWje+d4J4eA/p3jrccFiDm79DYLQxeu/5LOfDtZED0/ELuf+Yv3B/8bF+yipTrEhyB4=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 12/22] xen/arm: Balance Dom0 vCPU assignment across NUMA nodes
Date: Fri, 19 Jun 2026 16:50:00 +0900
Message-ID: <20260619075011.377116-13-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::9) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYTP286MB4024:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e115f7-cbf6-4949-dc05-08decdd77233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	ijVp9t5beFlLa31MoPLpNTQoScUC1jFqo8AbByTCb01VYaWv0npIsZQG49AtWUisfnkw6fJ/I1ysZOZuRtCUOuYsxFlPYpukLy/pMtNTlwkvuQ3zDSLpnI1ba4k9Gy62pdwevqB/9cMlTO1d0Rf95g0tiRZM77IF6gCbsBREhaRNz5hgnGPaP6QZ60sagGo5xUQAQ88o1Gy9/HeN+lizkFNf5J3Ro6KNN5xaXq8i6OGorxJClKpcZqCkLmQZ/yZkKlcBd8PfedGI28rn2sHAaMOUZWDNYuoXOZXlLw4E+3vNvKbKnrWYrbJJr9FCAW616fiGgjQnIszxoe8jzK8I6We/OfPqbZVgliWramdx6kHQNXPcF/16iafyfq1vQ4dG9OQTaORMOXGU3J7AG5PQWusElfFTIKQUKQFUib6RigV1Bd84h5CyAOvjoWJkVSIbOcrrD3Hf/Tr4UNoETzA64FsxGeFSPOTbI2OAU0H/PYKYY0uFykv8Udq2Xq4A/WPDppzVZEGKBL0261nXBcfcWa0mj29QYDzFdceDJIuAZopXizQ6tJQ6Ag89yen5xAhHgVEXJrTynQ22o1NJ85qJXUdmpAAWcuy5ZI+gEz9YgKi6PDFG0D/5wjTC8EyN7qRD7knp1qX6Fs0kZwTYS8bObm5Tw+nneha8x1wghaSFXL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?m+33504QdE1SWg/yWJnK0RdIP73g8yFJulRxIJFAtbrb/KhLgh+zPSlAVilb?=
 =?us-ascii?Q?MJgQyxjkcDvPJJOXpZa7+SsuzjBU1wGsVOOHRp7JS9w6EBNf/dOe/YUnTVKv?=
 =?us-ascii?Q?6a37nNfKqdtkDDiBu2XuYvbHesDsHUSJ6bP13hiF5i/0GaoXdtMTBSbbnOY0?=
 =?us-ascii?Q?P7Paieo5RiiSV7KBNmmXzPpkpRv8JUThAY3OZem2dNTyhk6/MTSs7L1dTEzd?=
 =?us-ascii?Q?l4awzfT9xC4gaYDU20EDxcbYPv0dydWa0p5AeQCorurIztsOydPUUMj8vVGC?=
 =?us-ascii?Q?/K1WeTempxPlDoS7IVG5BEsGAvw/fTi30LXJDA2vfv8+XMbzT/YGYmb7fyxG?=
 =?us-ascii?Q?B3w0AXntJ/HQBuxuDNpF++ZSfTAjJKHaymFYP3fF7mkPlQARAiNlEabccFUH?=
 =?us-ascii?Q?Erre5XQfKLDJ8FC1ezjFp/M2E2IFCsK7VvCCohc56S42/pPtHl0EnRpPKUEa?=
 =?us-ascii?Q?5sGD/Q9epE3BJmuNW2uc3FY4XjltWQcQHOXCSRzYf/UgmbFpkivVgwXr9HQl?=
 =?us-ascii?Q?fZcJfIf7+Yb/jkQP6g6BCBegB6hNiJ7klhWH25g9KbpcSVsp/91BFn15UhJL?=
 =?us-ascii?Q?TRlWZVII9wyN3++/ZoT/7NqiRa6Stzl8N3x7d7VTMNBdfmCIpOE6bs+ftJO3?=
 =?us-ascii?Q?yrOAADI1Onnbvr19SP8mTisJSftkzXOALmfL/6+aDpEmStVgfctFfDF+GkDs?=
 =?us-ascii?Q?XGk5vGkraxhdoVejIWjNHrPAv467m7J5dTXzPx9UFbtEP6epYrXhiDkCdWrz?=
 =?us-ascii?Q?uBd96tnESuSNn9/mTo4OHGc5fe2c2Y7K5EUVJ2fZYp6u60pBuQMJPmdFewk4?=
 =?us-ascii?Q?RL1A60xEfd52ABcli14bIzLnrAUA5LltKqobC8yISQ4z15sv8BzRIRtMMNGI?=
 =?us-ascii?Q?c91t/D3fDI4B/lKTD9/1JZR7W/5E7Zfla67zHwpdsGRsNVMFb4KI511DUd2i?=
 =?us-ascii?Q?jOL21LaTjBaKIleTp7wD7+goOApbFC8SVq75IdOsDmd1tBfH9N4JWrpEI6l6?=
 =?us-ascii?Q?M/QmcOoyBXi4nrfBWgIckxljW0w1XJrZfZOU0YO009w48xqav0W/FMP8Whzj?=
 =?us-ascii?Q?1FEMMyh0+up1Ydp7QfMKwWh3nv8LeNpE0cKgveYg83XbEqV1I9vxXleWaPKL?=
 =?us-ascii?Q?L9CAB7cXIVbfVCZXeEFwkQiZcBN2vWaEVqRjwIlbtrFk1wBKpkV8A/pbrABE?=
 =?us-ascii?Q?ly64WFUlw+e6vmrCC2rZTeixl0lfVR0PQSxC8H73hBV/F7lLEWIm4X2nW/RE?=
 =?us-ascii?Q?aSQZupLUaDN0vMQL9BN4IlE4WLCeyIb2wZvRWvOvlbhCRc1GryO6RYl0mXcB?=
 =?us-ascii?Q?NG2AxD7K7lLk5/IcRFpnC3EpBllnGf1GUcDjgBLQd6rd5FdwFZOKc4njqDzF?=
 =?us-ascii?Q?nw3RYvfUJdSpeJsOjNYJDiCBwmbIDhWcgduEJtler/cEkEVgPZ/evsAQM0Og?=
 =?us-ascii?Q?XVvCTiJVsuY2LDB/a8bu3mR9TZFBbwC5RToh4dFQxrrfgcwc7BdNe2NyAEI3?=
 =?us-ascii?Q?LnrmvFwGYouUltTBkcUCGbCJRLeTfkT40gBiVDygp9+0VO3kVVW7dThAtzfv?=
 =?us-ascii?Q?6fspJAq0YANyWuXo1CnPQvPGWfkFJry0Y11UN9dTKPSk7RkPeudm+sCu6tEf?=
 =?us-ascii?Q?ePQLIVQg2QtJFeCuhAZwJI88H2BmLUjE9SX3JwSpXDWGlXNVIK9oI3esxE4f?=
 =?us-ascii?Q?dBB8eqKiu/KiuO4IQvaXTn2Vj5JHMSccJFT7pcS0n5wg7clT2RRkpB5I7Fmi?=
 =?us-ascii?Q?DVspDHX7wPuLNSn54nXU+0BjCUZn7JBHMofm/SiqipPUmkq8ikF2SiKROOq1?=
X-MS-Exchange-AntiSpam-MessageData-1: zPHgWvGnrLsgfQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e115f7-cbf6-4949-dc05-08decdd77233
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:35.1819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7d1VZSFEzqqhvG6zhnoZ3wqepoxcxp7EpSgQ17v5sAosajoM/7FSYtAfwKzpl9hCdyN3UeykuJ4Spyj4Q95RpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB4024
X-purgate-ID: tlsNG-42698a/1781855438-4CDF000E-FC6A253A/0/0
X-purgate-type: clean
X-purgate-size: 2071
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
X-Rspamd-Queue-Id: 4A6846A4721

Configure the assignment of Dom0 vCPUs to NUMA nodes, aiming to balance
the compute load across the available nodes.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/domain_build.c | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7ad53d85b5..f5fd065435 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1233,6 +1233,34 @@ int __init make_psci_node(void *fdt)
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
@@ -1915,6 +1943,24 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
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


