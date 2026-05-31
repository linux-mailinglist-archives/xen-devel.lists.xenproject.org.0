Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJpdGtu6HGqSRwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207696182F4
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323513.1589317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxb-0002mL-Ry; Sun, 31 May 2026 22:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323513.1589317; Sun, 31 May 2026 22:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxb-0002i3-Iu; Sun, 31 May 2026 22:48:47 +0000
Received: by outflank-mailman (input) for mailman id 1323513;
 Sun, 31 May 2026 22:48:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxY-0002Af-S9
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxY-00Fm16-8z
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba94-e002-0a2a0a5209dd-0a2a45059030-36
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:44 +0200
Received: from [40.107.74.72]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbac9-aaa8-0a2a45050019-286b4a488211-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:44 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:40 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:40 +0000
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
 b=hcCBheyRDbuiknfa6UmHFZq6kmq2Fx8Kw8rTPWl/W9nGgHpi7f8wMGyzcm91YITjSsi3YBo5kLJZuzAUr+rtBv/2q/IpLsYvSDstKHL6uynyHOOJRlegU7BGHlEOvjd1m9IPPF45ReiM1I8+UNfjY1YjTdUAB6tUawT082gSBzDi2YvnNyYZMMrgCnmz5ykMpZnPa6MBJFrYcs01wXLtVsd7PqKxDH50i02GxHdkbnF9zdiWJlvcmyYG9cOm0k/1aG3GmEVEVPNpb60z5zElUQ7yWJyDuND9L23GIKOxopaR0LxxKnitAGR8XgiruChqmR/p+oSODKnFbBCqa6bryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGUG4toyQhvtHpHBNUMbmOTNjuI/mfXhzDrcWgQ6WgQ=;
 b=dHU9ewvS7NF6P50AfgWziG0Cs/NhpjaqD6CefIIZO571elNmdTYSg7WAUQmfgtb6S2FgkbzLrCdLyi6LX8bQiPWmQcT7/eVkmkhMn2NyXiMJo2a+SMqG1amWVe6ErZPpNst6lG+Bf1H/AV0NlYdMfuloLM1BBIUpRsRuNXWpsVoDHSPTFWkvCYgBbhNNS+uYaTeLiRmkNpM6WU6U4avLcBEMzpfZmtZRByTLexSKt6q1R4avPD40oupGU6sol7l7mJJ1trzC5q/d9UIBgFcptvESPbpnNhAAlrFtS7469+xphajm1B3HIUAhfMToRbLFEzjooLrK6uNHcwjp/ncjeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGUG4toyQhvtHpHBNUMbmOTNjuI/mfXhzDrcWgQ6WgQ=;
 b=R3OnYP2nnGRMMqvJRRRlydtpPUBFKm6cm1fr/nvIShDW4XNxQ02dJoQLMOoYbMMNSNDOM1Stp3jvEYdYfv3VflYJCMN0p8guiZcWP/jLnZjUXkkODl5jfvNUdjqtT9ZUbmUZf7kKY8zT2fdPutqT3VMIFHmTQ4UXjBd3McrNVmA=
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
Subject: [PATCH v2 21/24] xen/arm: Generate distance-map node for Dom0 Device Tree
Date: Mon,  1 Jun 2026 07:47:51 +0900
Message-ID: <20260531224755.9481-22-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0093.jpnprd01.prod.outlook.com
 (2603:1096:405:3::33) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9c12e1-376d-4fd6-50f6-08debf66c2a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hRWnCCZavgLhNZs7v3jCIUJO3FriLEUc7TQO6dOthBG1EHMcm0EHL9hArfyPh2YPT8PXZ84Fx3/9vtqESZxpRN+yH65xojK0KfUBvSq7rRsLCaya/PeBXMjVd56WpHchAsxURsI4YwpwcN9HFdVOf5G6YaKkaIcFzIrbpJYDTnYBSBEUPHKlrWPRMq8L+2j5R8CwAdcCJcJlqoAirafmpdy9+KPwe3LPSbY6ey3MMIxXG1tUJ3Bq2zLfKJZ1HJ9Ud36J6VW8HioCuBkHoXFvycxrP5UVootA/w8/z+q2DXe1D4/O6bekwe4e2h7Sasn8Vf7E6EpacXWv42QL1NMXihu6yiqxPpSWk3hTWZ6QIm5fUHpnElxTU5zuH8IRsnO5Q48KzqSnohaiaZk8oVJFh6Yu6ZTTciyryZOFfJ/yYjd20w/WdL+0MFr/4MvNOpC3h0cksDNvcM5mERqnY8McQnsiEQg1uffEKEErs+3OWe+T6m0rnjZJffG+8c/9NLR+y1FSIRqK7bf5bw3Vd4Xz+ygDOi6YZlVarc+IBKCi4Mnrh3EenIH5w4Mo2Lb5EmRBXmM3bjrxZkhu8oE93PNyBz98NpZ2sYlIgzRCygmZLzQ+FwClvQpuz6o106vQwrr4KIn1/FOERFCz2gmb8XPAfiD8iAzqNRuoNaLP0yBlNRErHDDs9ysheTuTyD8qUuz2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WYBS4XF7RJ88x+S5WcEVBlU7ogqRQ6u2mwYAUExfO9XTEo/ro8jNN9pONDnF?=
 =?us-ascii?Q?omUmTq/oD5Ri88+nItpHWzrdWcMsPpZpeK7UfocYEgRfvwTU6id5MLtuO/5L?=
 =?us-ascii?Q?hFSwE+dvvAhdjzgATaLhA4sYXLGDTR7f2t8gTT4jVHNe0hYWrfQrG2NMlSI6?=
 =?us-ascii?Q?YcVADKiew0YCaD8exw613J8BAuYFOkadw5QwupLQekBCUu5hnXwW+v6ZxvWW?=
 =?us-ascii?Q?/zG6mxL7p4dC+Po5804mphqG7UwHAmDEWl/zIynvS581ly8OzN+q9zSfoFKH?=
 =?us-ascii?Q?9kcHjZbH6NiwGWrHu6sk0HZeOzO5qnuAvHqjHCVKwLlzhMK6Da6V2BVESBj2?=
 =?us-ascii?Q?Z2ycG7oXKsH8zHxzk0vb8adgxifxlOoQGmoPgP4EMiqPiCN+g5gcHv+E627J?=
 =?us-ascii?Q?HdzRuq83pxrjNuWjv/BpDmWPPPQ+ApdVfYzT5b8GMVz2UegR3hDUX65ROqgh?=
 =?us-ascii?Q?1rhuJ46SLQVHNIyKYH2aEWU+wa/dJ0UutaV1SGToiUyHipKqhzBLVh4nN8ta?=
 =?us-ascii?Q?JuNMPWEhnV90TmtuSGEYTyC6oBI6f+WONdmZ2P15Xp4nIh4SG+9JUvetYU4j?=
 =?us-ascii?Q?T30+EfJ2CcGMKLH+lvbqXqlwZwLTqI+8qX5qI0Ykd5HdcSGthdld89RBuceB?=
 =?us-ascii?Q?F3zxz2qgbm1W0PrF9/jn4BcGnFR5RDiuy5XxVlVL7+lQ+7mT2bPwiE5Y4fko?=
 =?us-ascii?Q?XVgkEBsuNT+APbGoGjBdRDo0fRJUhcwQPTDU4rNquXC3Tt71pdsyBw9CqG28?=
 =?us-ascii?Q?OVfeb+G/0d6LoJ5pU13Phh8awKja2i3/MaeUzbp7q2H+4o1Cigu730RSW4il?=
 =?us-ascii?Q?WTbEAcfn8FtnPyVcxfFDysILzItsTwGEDcmP6xlxLlcEV9kM/GWmJ4ObvLmm?=
 =?us-ascii?Q?06IyFBzLQNXcF6Wg0h/QRXoLMOVG1md2VSugBXoBnFuZATD9oRXzAlR5gLsG?=
 =?us-ascii?Q?GCf0ZU+Vi+ShenFDvM8yeg7KX+gDmz9NfSw99LUVlsTSLAOE18S0NMGUDSBi?=
 =?us-ascii?Q?W0ie9IvHBsHCoC/tH/3jCkaP1UVcol7wO+fjcsRQv76FlaeSjDjdFP8GXZlE?=
 =?us-ascii?Q?NjsBijF5wl75nz23JWD1p7zhITWCCnxye8+hzrXtEkwccEqSLkAbns+Nq3M6?=
 =?us-ascii?Q?5uGb0yr4akLwKZ2BVFaxN8ysC1QnH/0yZcqC8AgTQya5Q5jsiZYsZVar7dHy?=
 =?us-ascii?Q?1468L+xqlnPAUWrhMwiBPlc7rfm1Qcw69t/1J1aNu2eoK6OCkYDgXxgAkG3A?=
 =?us-ascii?Q?SQaNJGYTrhkCTeRDXffwCDHfmereFWoxr/fLuW0WmApW0xC+XNohVGtlHkZS?=
 =?us-ascii?Q?heK6rQkF1Cx5CxWs+XlbBvGO5UtMItMzPz3f0S02+LNrrvqnjY6PX3+umKAp?=
 =?us-ascii?Q?4ufzx7YeGJRNHrTvkjKEIRDI/2RHN/qWxIQMi8/Ajb3HNZPLFp1rSLXsKTlP?=
 =?us-ascii?Q?3z/pyHJwZYkxllW9Y1qXKSphuAws2XFqwVvlbX+X2Vh5AbUwzcR6vpc9TcfH?=
 =?us-ascii?Q?z2RvrzD+SyURKtbBxEvpMMEhUCdIdPLkgE+Yy6kEFOywNqV9DGRvY0y4LqBC?=
 =?us-ascii?Q?jVBX2TUThOzJ3eXQLU2Qw/UJLR5XIARMci1x5Dtjm82HFmQmp5KIa8a1i9Cv?=
 =?us-ascii?Q?nOA9PAj6+b3UQMNwK1MMAN12GItqNE97Ag3uSkXG1X/X9mZO4ZcHzwGwR9t4?=
 =?us-ascii?Q?58OXggnMc+KgJsT5luUGjvHyrJAXMO79GEO/kAUDc4ThNEerjRmgbhWVprJR?=
 =?us-ascii?Q?1EapDtEfACmJYxteItjOtVy0LBXvFDuM3mOFGqWTCRMobJLDhFPNXJiOIuvv?=
X-MS-Exchange-AntiSpam-MessageData-1: MEMh6z8qv5+0qw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9c12e1-376d-4fd6-50f6-08debf66c2a9
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:40.7319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KYKsFKmRdvmentGKtVSvVuLARwgvCVDfSuVIQHz1E3Av6jTSmjF6l36apCdHgrBLJopWMRe4J93PuHVEeV6niA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-c201ff/1780267724-D3B60443-E7334E72/0/0
X-purgate-type: clean
X-purgate-size: 2697
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
X-Rspamd-Queue-Id: 207696182F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Generate the 'distance-map' node within the Domain-0 Device Tree.
This ensures that distances are populated only for the specific NUMA
nodes assigned to Domain-0.
---
 xen/arch/arm/domain_build.c | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 750c3d53c2..e71d6cb254 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -718,6 +718,51 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
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
@@ -1568,6 +1613,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         DT_MATCH_TYPE("memory"),
         /* The memory mapped timer is not supported by Xen. */
         DT_MATCH_COMPATIBLE("arm,armv7-timer-mem"),
+        DT_MATCH_COMPATIBLE("numa-distance-map-v1"),
         { /* sentinel */ },
     };
     static const struct dt_device_match timer_matches[] __initconst =
@@ -1733,6 +1779,10 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
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


