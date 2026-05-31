Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAf9LNi6HGp7RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8986182A0
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323508.1589306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxY-00020O-DB; Sun, 31 May 2026 22:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323508.1589306; Sun, 31 May 2026 22:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxY-0001uT-37; Sun, 31 May 2026 22:48:44 +0000
Received: by outflank-mailman (input) for mailman id 1323508;
 Sun, 31 May 2026 22:48:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxV-0001RC-LA
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxV-00Fm16-1c
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:41 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba94-e002-0a2a0a5209dd-0a2a45059030-30
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:41 +0200
Received: from [52.101.228.101]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbac4-aaa8-0a2a45050019-3465e465f6ed-5
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:40 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:38 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:38 +0000
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
 b=HiIbPPLYHuFi/y3k6XctHZpvOYdJYgk5tcredRJyaiNz6KAhpuEpNhlhE6dfrebrBMOlUSV0s+2ZEAOiKInm+vROe3JqRsmnijWZrGwcWXHLtIczPreYOxa+i/ECwd+wBHFDr/XoweAmBVpjmWe2UcHUp91+aeinGqhfcqe+7CzANV8oTIQOaCUGufHktGulFwqYPze+AWax5KlTNnqkGHMsttrt7CxfKWVxUsSPuHzxBEQ60pZ3y4zFH2UrAk20xk3774b/OOp7OJ7PavOv8QqMd/XOTVZqEDDtxG3UQyjT200PDsNtZ72IoNGepShAcb3RqxWIX166ihpwkcNxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9KK8YwpRHhqIreVEfhPTKBReSTnp2RvVZda1V4U6DE=;
 b=f/XiGkWHTI+66a9YFCaKJu/v0GYo8VwGk2tQIehSpa2nZ1encmmW6lz4dLLuWrL8p3Nllr/AurkXyzsnZNs/MrcdHFQB0rkYuPp5Yy/qRUx3cskBWO17u/bwXRkqrCM7+DEPdl4BO7FEEmAB+AbTGu7jXgvd/EBv2VZ2ChSZTAxQonfCoFfcDr/AUn3Y0e1PRuOE+MbUlHo6LBdm4G29SJJfZ2iM098AOlncMcKL6s4b3RmfMeP1Jn7OBzQtMx/6La39Fu0SXkCrbLzKzFitKlDbjvLAF9jMLs3nC5TGZ3VFClujcPCe2BjH+wSd03un32tlLCfFGeaE21T0qHbj5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9KK8YwpRHhqIreVEfhPTKBReSTnp2RvVZda1V4U6DE=;
 b=fPb1nJGITrF4BbLq8APlvofJwmR2rUaRPg+UrNishozwntCz1aZ11nYXyiZD+lOt1zsF1VW50Uh+ImF5TWCEyebL8LR/JP+ivYpN8zeTkOIXqg6fLyPTKEyXxgUcv2RddlNydxh5adkc+YcrwozGQa8qY/7T/NcWL+sdzdtGOWI=
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
Subject: [PATCH v2 20/24] xen/arm: Export Dom0 vCPU-to-NUMA node mapping to Device Tree
Date: Mon,  1 Jun 2026 07:47:50 +0900
Message-ID: <20260531224755.9481-21-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0088.jpnprd01.prod.outlook.com
 (2603:1096:405:3::28) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e9bb4f0-e03a-46e9-526e-08debf66c18a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	d1IJakb66M7sLDa0Jw2WE3zMYsTjQMk5FOvHU1IpecmDoWngcTvUytmm3fFCo0Prldk+Z8m5wp3E6z2iaMrrsMsayWiy8ahaKG/QgjRQeypgdManivhcF1EvZXsuGJZViFa4LeGFpTYciOvwJ1QE9JW0rRlHURNkQIG+tc2LoX+0ufnCRog0t2a1zlbYzczWyOIZNWNAVvIYzCu2kLLehie/JuNNP3fNZGESvKtxm/+OZWoIjOS+AQAb+TRDeanA0GzGv46JUI0YjtAj7ae7qYM3d5fHJuh9o7N31kIelAcPerY95XvBQHQAI01wYRdjsRm7IDTWs7YMs+nEjz/6Kf0P3YPQoon+xlQjFVCt4WgHsFGLS8hZQAYIyr6NJxvbSZb6retUPX/tQNukSCvFnLuyT1UoWR7uHzNXsGz7oF73qXgLjBJxCXHmakGbWyCbqEqk9vQPOHpdz2JcAdRMbmDxo95Pgc2cvtksWuVBT6tdPwg6GZ/yT8eih/kbtEuls8dCgUGKMjUT/DoEsGcRfb1HNlL/h934CeeiZeChrnwDiIAEwXmlBJi85iEGXbwY48NfAb2xVzXKzFZQgBERULWbaLRVEVRNcq0vOYOWxnuQuK3X+A6f0+DEooI2Rpor/Ip3jrmv4YILYafwNTtKd1nbg2JWj8QNhsNbWFWMiVYLCfyt4LEQ+Hj1Rumy25iy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pyKlzpzg7oJTCxjhgaEhBiivX6icqdXFjb3vDlFUw+JXB1i87rE+2SjTzczk?=
 =?us-ascii?Q?tYKviDzmcg6dg7mN5jhP3p8Ue11HCbryKSi9kAPEKfuT6YdXyVYgWJVrssfr?=
 =?us-ascii?Q?eH3HaWvQVm24D57op+ZjRP6R3OekLU5x/waQTj7A8cpDBrIwLZHj3dV6k6Qv?=
 =?us-ascii?Q?VbPJ+t4oCRbyTyyv4vQc27NfgGS5d8zAUW4shpxSJJrAgxogiXeEUNK7gTo0?=
 =?us-ascii?Q?3JZagHEUVgli96kFqXG4+lkL5MYLt4U85kYspnp3kCutzYI8CjmS4IpwYzJT?=
 =?us-ascii?Q?lIHAKPV+S/zxCkwf3QIWfD/jkqIPBh0iURD+qcp2KHzgJRx4wN3Pi1+YtSQM?=
 =?us-ascii?Q?7ER4h1N/e3aEUc7FT0NmqELENQ2dgm4hMd82Is20j4vQQX/ZKtcKIPrvWiaI?=
 =?us-ascii?Q?gSxj317KpWU1DI85m0V7KQoIzSLpSv/XjcSDuqFRKBDrfYAVTWogxoHDS74Q?=
 =?us-ascii?Q?baq2OKCjkzflT140QO5jpeLKh4COBIMgAOGnUNmn6Hv03bJet0iWTNbHy2vq?=
 =?us-ascii?Q?18aCHbsIcm2mW7MZ1ODZ4jA1EwG1WlhJV89dAPeXv2KZlVa9DHT7cb49RpaO?=
 =?us-ascii?Q?53PJuUQoGXc1yc2O0Nnn8nQcFZvfBb9Zca/EF0xQPz+6N9uMmhc9Jtp4s8z8?=
 =?us-ascii?Q?3kdjICFvAN2d1ZzGs4l86vFPtnaO22RDJ5v+44EnshCSui8saTXCfz3LlcFA?=
 =?us-ascii?Q?fXgEtna98lPEGrLQT7u7CZzSBJ9ZSnSOU2dt3sUz6KMmuAGDIErw/CCPM4h7?=
 =?us-ascii?Q?/JJt/YAtEBD+tCGguheMaXGAy3JtOA+Z2sFbCN1dj93WvRI+kzxNzgeXhDa6?=
 =?us-ascii?Q?sRtfcE1py6gf6micCOifxuY4gtXx+6ATvSKkx9vHMwfawVFOOHRQE4RsRsbm?=
 =?us-ascii?Q?YXM1VUwMxufPuvzlQj7ViRiliqZE7Q19hkl47+3AIG9OwLTswNLHv5OcTxpa?=
 =?us-ascii?Q?HtcnwXaYLzjGbfC/09CfjFTp10s+f24BGGMqU6f2yqHZxmfNgn7VIXBMW2Gw?=
 =?us-ascii?Q?WUZuHtuc4Gu0aKf14qONdNqyn0Eh86pKuVFpMZDRueX/ynXY02fQBwqtrOhx?=
 =?us-ascii?Q?qePmsJZiCr3yevzEDvDjIxW9FSss95d2eX24Umsrho7B8R65+Zb9CLWe3o6X?=
 =?us-ascii?Q?Zxy8L+cHZOv49zgkwlHY/FzJWZ8I2i9wqoVDDrIG8iFa7YGjsIOzUOwo1MKB?=
 =?us-ascii?Q?ivninn76QN0/SifIFrvptfXBW4ReG5YQeP/ebsLxsRlsouxSRKZ1zpG/a9o/?=
 =?us-ascii?Q?3kBLLisMXsMHS/sX5dijHlxoqOE0GeFyEc7Pn3cDsFjYG3lzwtCskQdmGMfW?=
 =?us-ascii?Q?xGNA7PoP5L9F74199BBs9cB9D0f/qaFsoBRRymPdHsuZzvSTqTa5Fu0O9UUY?=
 =?us-ascii?Q?RjAxR0pVTI7Bi8wKvVkIhNPDiHvoeN9Y5nnfOP7901MRbrIJanMRhOaCjBAg?=
 =?us-ascii?Q?DMHgrc6NbxNnQNNMIPn6igPtT82KrX2+DyMBs962fPEyL5eUpTPWFKYtyEp7?=
 =?us-ascii?Q?fWJX7lCivvTZm/Cy1maL7q9D1FHp7FS6ll89sPjqsNIvghizVUykMYj3n1yg?=
 =?us-ascii?Q?L7/LIU/a5db53TZ2bvagR6q0XOmX6EIDDOc4hbOccjV2D7pI003YNw3F3OxB?=
 =?us-ascii?Q?kB4dS4Jl365kxaoJp/cNQs5IKDwVysgAnmjgt2FXbMHUsnAWikMGFwMPy+mZ?=
 =?us-ascii?Q?L2ZUsWb8IhzIe2kW7lEbb3/sUf760VmhS1G2jLVF2jDvGo9J8Vv7aju2wbpj?=
 =?us-ascii?Q?XKhsEo71swpBQEPM8E5AudSzsH88BkyE/K6shDe8P2LgitJLHR9ib8xEMNFm?=
X-MS-Exchange-AntiSpam-MessageData-1: 9HB5AuCd/7UudA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e9bb4f0-e03a-46e9-526e-08debf66c18a
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:38.8476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bup2DnDE1QKKRJzmKcaLxzYKOeLAFx3dux2nsXPFbHBGzLybUNR+e2YytK01YHUKO2SyTTw8km/n8YyBg2MGug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-c201ff/1780267721-E338A443-01C9ABE8/0/0
X-purgate-type: clean
X-purgate-size: 884
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
X-Rspamd-Queue-Id: 9F8986182A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Export the mapping between Domain-0 vCPUs and their assigned NUMA nodes
into the Device Tree generated for Domain-0.
---
 xen/arch/arm/domain_build.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a62adafa19..750c3d53c2 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1373,6 +1373,14 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
                 return res;
         }
 
+        if ( IS_ENABLED(CONFIG_NUMA) )
+        {
+            nodeid_t target_node = dom0_vcpu_to_node(d, cpu);
+            res = fdt_property_u32(fdt, "numa-node-id", target_node);
+            if ( res )
+                return res;
+        }
+
         res = fdt_end_node(fdt);
         if ( res )
             return res;
-- 
2.43.0


