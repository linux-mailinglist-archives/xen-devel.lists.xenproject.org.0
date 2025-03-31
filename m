Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAACA7703F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 23:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933003.1335088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMv3-0005s5-VH; Mon, 31 Mar 2025 21:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933003.1335088; Mon, 31 Mar 2025 21:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMv3-0005q5-RN; Mon, 31 Mar 2025 21:43:45 +0000
Received: by outflank-mailman (input) for mailman id 933003;
 Mon, 31 Mar 2025 21:43:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLSd=WS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzMv2-0004Vr-1m
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 21:43:44 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2416::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35fccfc6-0e79-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 23:43:42 +0200 (CEST)
Received: from MW4PR04CA0197.namprd04.prod.outlook.com (2603:10b6:303:86::22)
 by DM4PR12MB6589.namprd12.prod.outlook.com (2603:10b6:8:b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 21:43:37 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::88) by MW4PR04CA0197.outlook.office365.com
 (2603:10b6:303:86::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.52 via Frontend Transport; Mon,
 31 Mar 2025 21:43:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 31 Mar 2025 21:43:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 16:43:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 16:43:35 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 31 Mar 2025 16:43:34 -0500
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
X-Inumbo-ID: 35fccfc6-0e79-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S8Bp+SbkC78F/OT2n6StEgGTYMSr1Ia5vfEZwVOtAHdiMadtJvqBnisQycjlAEMczVN/b2Dk3EjfdHOmaM5kH0NEjMFX9dQXtxQdpBPpT1Etoepvt+UmTe9zG7jUW/cNThzO/BCj3yf05i9rfrD1GsRcUzBWibKuTbmmhpOUYYBChTxNMfyruGW5+aEulRzeJT1i2V9XpeZfdFBNvOlL7BbEPGr2ibjQaqFEfThAavI8oPpX3wAbMNH/7xqCOIEglYSCdyOTbcBWTQuh/ZFLRgIWgvKr3tEqnMqA6YvyTWMfM8EJEWAKWQ7rFmCrnv85zC91g3fp79TTbCsPuMeSRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIwhjfknntHy51daW0G7gVn2WkUksiIVEhJto7dMW3I=;
 b=KV1z4hKEbfUKBf0h58ZlFmg36JAVekH17HDyqMBOV9OOy+oi57i9d6hTQpHFHBp1e9CqyCwZm5C35/P9JOPZl+CrXiqZmrO6iysu2RR7QmDYgNEzWCyGwc1D0L4ShCWVOTl19xvoXcHruIKDZ0nlOx7ejTZ59O3+iqEgued3BhrAhfxFYt16+0JQy4XROIrTRYn8jhjpllupZ/PkiblnCubU8xjCZ5yWAt8XvBH7ihD9RZDRQrplfdPpOfBhoHB2Fsk4iHeZxK+6HmTdCB0fDbsNIoriCoe2zBWgImFIINpjKOajJkro6a3Z+WdTsY8aLOwfwM/rE0Tqh2JHurj3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIwhjfknntHy51daW0G7gVn2WkUksiIVEhJto7dMW3I=;
 b=W8T+hhcyUgok8FPwkPysexnWOhqTZlmIwt4TwhmlLWr+3EwvvwQHbktFQRQYZCU/cgytuz712yZ7f/VkcNu9IHO7kq8HdEfUBm6v1MDj99QabMpr+P83ANrppCMk55J74yJTED5+kyheO/zKi9Wr0L/Suw4W5LWgjKVjO6r9VWM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v2 5/6] tools/init-dom0less: Only seed legacy xenstore grants
Date: Mon, 31 Mar 2025 17:43:20 -0400
Message-ID: <20250331214321.205331-6-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331214321.205331-1-jason.andryuk@amd.com>
References: <20250331214321.205331-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|DM4PR12MB6589:EE_
X-MS-Office365-Filtering-Correlation-Id: 7977a475-1e84-496b-0656-08dd709d179f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7nX9vEClksZZGT1Bx8VFl9gahrgM7f1odpCEVgZY2C0UXGPduDtP05g89WeV?=
 =?us-ascii?Q?0nOALs1dvHzH8JQxp2ChCRzZXaRsJJgGflytcy7HOJI1DO9gFqXuzYNKbZci?=
 =?us-ascii?Q?JyAZQBveetN30UfQleNIthzsF1zpouAak6uou2m9zxtwcv3i62mzLTWQPNwx?=
 =?us-ascii?Q?mFhuHP1ZC3w0blc5l8b3xHmlbZ37dPnvWLDHXi83haWJaL/PIbOWRJTfnKdf?=
 =?us-ascii?Q?kKgdz8TA+B/QJHI87Thwlr3MhWVzpQEw3e4rowV5vTSkrCIPIsBI6Dm/IXP5?=
 =?us-ascii?Q?uA+jDybv9kBsuR9/TMYNKtyHXQSYxpjH0skSGSdGkL9Bc5uG2QB1BWu5KE8s?=
 =?us-ascii?Q?NljW4jC+EJ2+RtdViavqmAD7mkeoXN408H+w9CZqWY743/hSp6sp2ryaVVWn?=
 =?us-ascii?Q?bpN5vUOHNteyuHUqut0MSu7939QJJk8yhZ47KHf3SAWKEvi6nyHsmrkr7iqx?=
 =?us-ascii?Q?6BIhB+6xdnaScBcjZW9dV2lDKT6RELopM530CWSOVD9M+VEnuBt/073JT/D8?=
 =?us-ascii?Q?ZJkQdZwKuUnIJ7DpX9dYxjPVlmDZKL9Gju2ByBse2iPjIlPUT8VcrF1Amf/U?=
 =?us-ascii?Q?rkRtG0SEgmTU4Hz088sA0YSpoRSYifeqyUJxo9eQBP+cK2z6GKzJGgXaAEHo?=
 =?us-ascii?Q?M30Mxc+2HX9SCKjjknuUg8STQ6VDZlZwAGgpNmQNMHl4q9vXrBU3rEp6dnTZ?=
 =?us-ascii?Q?fSL8qnTnfeteXoJmBB22RTze8t+plhJVAkRDk0kUCos0JkPZS1iPDwyMmWEA?=
 =?us-ascii?Q?nEHtT0qSJISVr8XAbhODSL9JqTV1EEmQm2ePpWPf0Rl6jeT0I3cLk6boeHso?=
 =?us-ascii?Q?4mqCAbtckabvWo7hCdlvLBdnVgNAYplwsHByavG6W+h2Kgt2V9ors9GKYcBQ?=
 =?us-ascii?Q?jCU/Cx8cdEd8HiKMNVludqlmJgvDZk3tdVzGkxPbZj3UyiiNkS8R7AmgUCCi?=
 =?us-ascii?Q?l8e5gvclmsT2OF6IHZUdvxmRS7p+WOE/EHLiX5TLUiOu4ly0/hBaQ2WWkisR?=
 =?us-ascii?Q?b35IchwPgXShvdch0KcCcOvJPuWKG80pFSCpb9gUP7hplT5EpvwsYz0D1OCv?=
 =?us-ascii?Q?VCQ9L9HUiK1GmfPpBYlx9KAil/kDFfuhlv4qiPRt0D3eJjlEZhIr82op7MPa?=
 =?us-ascii?Q?9ZERskrDhlWOoY3H9SuIqb04tyYibfBVdgCKLA38q143z3FYWsI0BbdQsrSA?=
 =?us-ascii?Q?Actx9bOrjqayHtRQMvGmXnv7fZPhMnPYIOpybld8rnoLrVRKnkrMzxF4hiJV?=
 =?us-ascii?Q?xFEjwYr+t5JoxPEKiHgaNAVoaQMjm9CEdutCLeMAo3Ab3RVZNZfbxnYShzPp?=
 =?us-ascii?Q?YYy8FhmJYX+1oCaCNRQuDlJISMqrR1f6TU1BjMz1Q08NqMq4zE/7sfxwhg7I?=
 =?us-ascii?Q?m5PrYnjnXkTJyC2MK5LjDIreszQWAw1Ol3Ws8bAFBVUHd5XS2z3wZZDaOygD?=
 =?us-ascii?Q?1OKcJxZFzROSCCqRZmJWceZeL/qYgs6XdizZT3mP6vvWylqto41nVkHu7elM?=
 =?us-ascii?Q?vi3YZLMOriYd9JY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:43:36.3546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7977a475-1e84-496b-0656-08dd709d179f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6589

The hardware domain is unable to seed a control domain, but we want the
control domain to use xenstore.  Rely on the hypervisor to seed dom0less
grant table entries for Xenstore, so this seeding is unnecessary.

However, that only works for the new xenstore late init.  The legacy
protocol which uses init-dom0less to populate the page still needs to
seed the grant.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/helpers/init-dom0less.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 17579fe2e8..91edf17b6c 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -286,12 +286,12 @@ static int init_domain(struct xs_handle *xsh,
                 xenstore_pfn);
         if (rc < 0)
             return rc;
-    }
 
-    rc = xc_dom_gnttab_seed(xch, info->domid, true,
-                            (xen_pfn_t)-1, xenstore_pfn, 0, 0);
-    if (rc)
-        err(1, "xc_dom_gnttab_seed");
+        rc = xc_dom_gnttab_seed(xch, info->domid, true,
+                                (xen_pfn_t)-1, xenstore_pfn, 0, 0);
+        if (rc)
+               err(1, "xc_dom_gnttab_seed");
+    }
 
     libxl_uuid_generate(&uuid);
     xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
-- 
2.49.0


