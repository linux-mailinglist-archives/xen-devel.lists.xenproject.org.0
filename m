Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1/MLKOz0NGoUlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5059F6A4736
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=Qe9reMSd;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341804.1602181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU0D-00032k-AA; Fri, 19 Jun 2026 07:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341804.1602181; Fri, 19 Jun 2026 07:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU0C-0002wI-SE; Fri, 19 Jun 2026 07:51:00 +0000
Received: by outflank-mailman (input) for mailman id 1341804;
 Fri, 19 Jun 2026 07:50:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waU0A-0002WB-MZ
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waU0A-00Dy7y-3E
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:58 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4d0-e002-0a2a0a5209dd-0a2a4506dc90-38
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:58 +0200
Received: from [52.101.125.91]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4de-b690-0a2a45060019-34657d5ba6ec-4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:57 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB6155.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Fri, 19 Jun
 2026 07:50:53 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:53 +0000
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
 b=wytN1ERZFUANjW8rzWsHPjSrth1IlIODeoEZrX5EFZD8sic9RtMtXxQDRAAN25mZ2LxmL/61iG9SNyIIUHM4w1McBfl7OQWRMmNvFDxOP/nknDFYbZtaNzvskbqohVQS92g1NqFb+uQcr4w//h0MGF0e1P4tPjzJd+uI7nzv05TdxieIdJPtOSy3VdLVRNh33+TrleTczKGcfa+x/znU/pPnHM/cZ/cGKI/sZ7JLRjdLGXFxZZtzmUcYhmGKGLtFnYyo//oaTXVWiAlKGj7T3BDCyNeWC+E+bEkkJYloW8I1pAhKtEtoAHUfQe58/VH51mVNAPTiohyqE7Q4vVEi/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoRTB4nAx8eUAVhSZrdglv1mHv2RGcwGx69cLffgICI=;
 b=v70XzIb6jLls6LEcXC5xMilJ5eJUcpONzdfydvA+QnlBADJB74FqP22r0CLM+hnyV/1EHmj5U2TPXi3mFIyQAVQnHAGktZY2xGdYVpI0ayJAZrOD3sh0bUhxYoGq1fDqgZ6RCOACx2u1Ryu+JCnhHlDCEp1CQLo+g+60WCPteV+37t9AE6yhtSWkmqD4sYQzpI4ZyfJJ8aoaC1QVyp7QJpg3BMFhAImXSsh0KhEcuLQvg5dzNaYUDkgt3rDRG1gzaE07FJjPi3wx7cnxQgkqUpmknxJmMdO9L5dYRMWFXAEiFoTbjpvfafp53MWFefTKhAx1atLFoXx/zzD1pTJPsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoRTB4nAx8eUAVhSZrdglv1mHv2RGcwGx69cLffgICI=;
 b=Qe9reMSd16CKin+V3xXRrn4x2lUJKS7fL1UtDF71wHwyxD6NF84G5OMc7+eIE7Ks5cqNM69QLFYpflnci2MUI2WAS8MKXNAGkHxyEMOyot8actOCUtPN3ukYYcFf7H/0wdLIUkfQVZ/1zPGdHUfEePPR/nipt52UDXUIzvje5cE=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 21/22] tools/libxl: Create 'distance-map' node in DomU Device Tree
Date: Fri, 19 Jun 2026 16:50:09 +0900
Message-ID: <20260619075011.377116-22-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::9) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYYP286MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 47bec74d-8e98-4c37-1a60-08decdd77d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	tL9ai5IZ2WiCZ+ZMbdi5aX/hWil5lJvGStUw01fmPicWHAX8AxZEe1QlBy3564iq46XrMlDCoQ6g5HLiMUzwz7mQ0lcGmKQq82X3pSh1wEziDuzHgF28W3DTIwIvWvb6Ye9iST+65Nf+0uWxuxJq2rSyr0Vw9OKBMSSy3l60EHMw3T3iu+NcE6wXlX+NzGa60KmzqQpi57al2seiC3fUCNZ9PFsnS/GPkym5pUzA9xhUoarOWsWoY3ntS1oQYFzotoynT7aTlcVZD1/giO+NG5g9nJQ9SqHnh2xlBRyYZIRfpH8913CHY0gq208RMB71rPF+9WgHW7v2v/fhLKhVKjpaSQpkrdbVyOR4nInHxuA/8O6dRKGF2SvfoVQtvS3QWb6WR8RkerMjudTsvMke6jCF6FlWlB9zmdgY89536PqXBtZJajIqC1TVExqeD08U0BS9tt1yzUhXrovgD+AwzGU3pV+3UQiaFAySKyc5go7uLiArG7wi5PQdKKMhUjIFdiKwK9jDPkb5ybrVQINtuXJSrLD4Jn0y+jTSufEl08NR+42veWbrFtD2TZptyomIeiaWvluw0Xs0e5y+6eJvYAvJSSW23aw05YXWh1ogm95eWuGqX+tkVou+K0pNIp5T4Cu9r0QFylLkmWBlgrItM+ueG97MDSq6vsCpwjTekbM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v/S+BI0Mo9dkqsZTvbo191jCB/KURz3QmybqDzYtJ28gSOh3Jp/CaXm6t1nC?=
 =?us-ascii?Q?OOKtHsc3khREL62Fj2VkmjPq+JiGAiUazgi+suqMHg6sWovF/Xn27QtceFsy?=
 =?us-ascii?Q?tHD7U8eHzQ8ULKlv9i783y/zr2cs1EdJ0TaI5Z123dp+LMp4b75UE4AdWRV7?=
 =?us-ascii?Q?dgi6Ll/fD4Riv25zQPpUUS2itlcIsmBMl3JzxNeIlmdjiUW7JrZZzCIfJ1GP?=
 =?us-ascii?Q?Ss460qPZo+nxeajSMmj5glMdF898A5texLvibYsTbrUGTaGHt38Ntqh2q7jw?=
 =?us-ascii?Q?9Hq2RklG5gXTYfJPBCGYonNiaSKdh6MU4zupFjLAiRgEdWreQKdE4V1+5aLG?=
 =?us-ascii?Q?iYLEeNZ8x3Z4MP/+A7i6f7s9H26G75bnudzAFAgdfrhz6WZ8s+yzjj4cFKTP?=
 =?us-ascii?Q?f9TEddmrU/Kr2nCIe2+m+2EZeU+1r2XvRgvAl0HGu7MvPcoTMyqPpvuWi4rS?=
 =?us-ascii?Q?gC0RUTLQk3/GJDyHbywrnxsjxvsaCG0ll10H8aSVeQml9zzwC5P30hkBgeVu?=
 =?us-ascii?Q?1vgZI1IxO6gT+nqRy5In5Vw7N1xoNlh0O/P1kVYyED1m01yagDp5IWPJKSw/?=
 =?us-ascii?Q?xasUMw3Dlua2r2EcwkebBvftlaKxMaVhRmm9L7Cq1u/CjNJ8K7ztuhgSKoq+?=
 =?us-ascii?Q?pORf2eeqcvkFy4BRAyyBdTIQH0ClizlOUdqWBY/0dOlls0HooVl1Ch3D8bFc?=
 =?us-ascii?Q?n3w+gYp/JQHxPoVtSj0goYGxToWz7gdepVo5uPT/oBhXeVvSg24yu4AbAQYh?=
 =?us-ascii?Q?+XTBs00G1DZQt8GVUS+eTMKYd8GWUDTH/JhbjHNGFCwErEst3Z7+XlutX1Rl?=
 =?us-ascii?Q?r3eiQshPujR/p4hbr470HOlGF7myuF2Hq+qy9e1Sge9QWake5aLGQx2YmY2B?=
 =?us-ascii?Q?ddruBkXVGm85G0a2bp7wshgWQVQaI8FQz2O7nj2/y4XNatHe35+5LFB/pwME?=
 =?us-ascii?Q?Po5xwqgnDj2YO/XNb24i2Y86BStU6xm6Nc+8UxcbFsj660CiKIwsA1OPtkq9?=
 =?us-ascii?Q?oNYnf8tLKK7IJjzbdVPlZvltdWHUVnUimlItKs5utD0wfMzTJBriXaoGiDKf?=
 =?us-ascii?Q?ZBaoi3fy227raQJ5VBsh5x5uUUX79WxFU0uNMajDBIoxxr+UkoxrWmI64wEg?=
 =?us-ascii?Q?4POaeRxcLSq6X+ayqz8SiaVn/jHLqhmYkIwiqvXo2aZCRojfOglIqmys+0Yi?=
 =?us-ascii?Q?/D4LmK4+BCZqnW6F+GG/OdbJvCskZAEatoctu7DjS/ELeEo0Lhuc/M1417Rw?=
 =?us-ascii?Q?ALFH3/ICJfuT3Pa3Epxd08cOABxRtAzn0qnI4fzKXr7gDzJwq8Dcqs8/9tfd?=
 =?us-ascii?Q?qtZiLR4OHF+hA8/im+J8GdAJ4vI3VKePqxKCkbLeocoYJ1bedX1iflGxo0vD?=
 =?us-ascii?Q?Eiya7drvnA2Msfh2lheKZQYfMT0DUa3yydbjfGJtCU8CvHaKk5UC+kMvUgAE?=
 =?us-ascii?Q?as6abqIKupCPkJCYud31OMuFC7RCcQXl3wWpzz+qKPNa5hApBDRYYoYVcIYj?=
 =?us-ascii?Q?ZPnmMtJ2ORZ5NENbsXp8J4ICsl3prjTqc0J1CjjOBww6DUfhBMFjrkUSNE0+?=
 =?us-ascii?Q?eBhUtnWzLry5T+jS+UeWkBomrz/ZljUzcrpy4HJhLUh91SROjzkb19rlHr7W?=
 =?us-ascii?Q?CnA/fY4zRqmnpd7WhHPllVg+pc2PlHf0OUbhID+mUzr6jPSOw3tLabPRgCry?=
 =?us-ascii?Q?vm1qWSzHuiioGFC3iqBTg6qMU1Rp+NAR01mP/Bp+mzrGIJK+mF4chky7/isv?=
 =?us-ascii?Q?iP8u7bfamUSPInJjfKnQPySA1KQJeBmEYCXkHqI7Yv6YYRnoZy/hHA7DCKvF?=
X-MS-Exchange-AntiSpam-MessageData-1: DLx1eW1fFzHeiA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bec74d-8e98-4c37-1a60-08decdd77d29
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:53.5491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWdZHYeWvKgjW0/IuQ0DGa1onXcSRHod4gvnyQbvpGlXg70B0opHctUZC56HrhrqKsbo7ETaxSaiIqUND2BE2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB6155
X-purgate-ID: tlsNG-16d1c6/1781855458-3BBE1853-7B28EEDF/0/0
X-purgate-type: clean
X-purgate-size: 2120
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5059F6A4736

Create the 'distance-map' node in the Device Tree passed to DomU.
This information is retrieved from the virtual NUMA configuration
in the xl domain configuration file.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 tools/libs/light/libxl_arm.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 4b0ed99229..466bee95ad 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -738,6 +738,39 @@ static int make_memory_nodes(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+static int make_numa_distance_map(libxl__gc *gc, void *fdt,
+                                  const libxl_domain_build_info *b_info)
+{
+    int i, j;
+    uint32_t *matrix;
+    int nr_nodes = b_info->num_vnuma_nodes;
+    int idx = 0;
+    int res;
+
+    if (nr_nodes == 0) return 0;
+
+    res = fdt_begin_node(fdt, "distance-map");
+    if (res) return res;
+
+    res = fdt_property_string(fdt, "compatible", "numa-distance-map-v1");
+    if (res) return res;
+
+    matrix = libxl__malloc(gc, sizeof(uint32_t) * nr_nodes * nr_nodes * 3);
+
+    for (i = 0; i < nr_nodes; i++) {
+        for (j = 0; j < nr_nodes; j++) {
+            matrix[idx++] = cpu_to_fdt32(i);
+            matrix[idx++] = cpu_to_fdt32(j);
+            matrix[idx++] = cpu_to_fdt32(b_info->vnuma_nodes[i].distances[j]);
+        }
+    }
+
+    res = fdt_property(fdt, "distance-matrix", matrix, sizeof(uint32_t) * idx);
+    if (res) return res;
+
+    return fdt_end_node(fdt);
+}
+
 static int make_gicv2_node(libxl__gc *gc, void *fdt,
                            uint64_t gicd_base, uint64_t gicd_size,
                            uint64_t gicc_base, uint64_t gicc_size)
@@ -1407,6 +1440,8 @@ next_resize:
 
         FDT( make_memory_nodes(gc, fdt, info, dom) );
 
+        FDT( make_numa_distance_map(gc, fdt, info) );
+
         switch (info->arch_arm.gic_version) {
         case LIBXL_GIC_VERSION_V2:
             FDT( make_gicv2_node(gc, fdt,
-- 
2.43.0


