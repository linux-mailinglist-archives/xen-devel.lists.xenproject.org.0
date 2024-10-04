Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB5F9902D9
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 14:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810344.1223071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKZ-0007Dq-30; Fri, 04 Oct 2024 12:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810344.1223071; Fri, 04 Oct 2024 12:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swhKY-00079z-Ty; Fri, 04 Oct 2024 12:22:46 +0000
Received: by outflank-mailman (input) for mailman id 810344;
 Fri, 04 Oct 2024 12:22:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=djJ5=RA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1swhKW-0005ue-L0
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 12:22:44 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:200a::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5aa61c77-824b-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 14:22:44 +0200 (CEST)
Received: from BL0PR1501CA0021.namprd15.prod.outlook.com
 (2603:10b6:207:17::34) by PH7PR12MB5927.namprd12.prod.outlook.com
 (2603:10b6:510:1da::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 12:22:38 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:207:17:cafe::82) by BL0PR1501CA0021.outlook.office365.com
 (2603:10b6:207:17::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.26 via Frontend
 Transport; Fri, 4 Oct 2024 12:22:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.2 via Frontend Transport; Fri, 4 Oct 2024 12:22:38 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 07:22:37 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 4 Oct 2024 07:22:36 -0500
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
X-Inumbo-ID: 5aa61c77-824b-11ef-a0bb-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0M400ZoatVJr1uWl2ATq6naRGx07ZQylbZ+Teoj6YmSvSHop18H62FmoYemdLbGGC1XZ+XB27WVG4aVhzL02cTLMHfo2OMjClGn3o8/JnUno3wwHF1MeDtwRqYmnBnCKrRPFKDBKFhmN7XwIy6SXBNiuPt1mi4a3+msqKl5ZCYSVb8BLiAlR9QaeBvT4yd0WIjZIaVc7kWO17RD/uBQ/s/I/otjWuWOWs0Lsx6wcvKh+OFuif3DrzNp97jh/dIa946GivQHW1TwTGezeISYem2hzgcP1rtMDPAONLxG2jPvjbXUmzaz5MBvAU9EbbVyJOrN3T8M2sfyBlgIHBnl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9lwpHIT0J8zNVYydoOKN/VssSl3wTjbztKqqkAcOOE=;
 b=OjteekwCtER/kPrGk1xoBx98GpZ49KbTUj2DZRJQgK41jo+5R5tio8tJerFouT9kYIYSkH59zIHCUXrTEgjdGrpzXjH+rcFRO+kPLnol3D6o3LclBgutYC6mzLfFo8Q99E7wvqdhwlI5ZRE49eeOIv4IOBuCWCwSZkUVS9vw2PsmZt9nEsU8YDFrQdvAJYGMcUcx+FWwO+Unxvk3Pks4GJQPssI8t176gwrELxiqlrAq3yfY5EUdDtD5zrottXQTyLTnUe7SGBu5gjD0cKo37yCZswyOicAlTNQHEpPZV2xARoFCR8tT2eR3Y7KZHb056n3uRxyitZT3u7QVA6qrRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9lwpHIT0J8zNVYydoOKN/VssSl3wTjbztKqqkAcOOE=;
 b=kooUTO8lsYnNZwnAe2V5AiWsDwCm8nDaNzCziLGROWqtxCe7/JuUCBNXZ9lsNh0gmTZATrccakWnNSa8oLplRZHi9XtmciHmimVWG+XF2+VvGiKCllk8hOcoo4t1bkLuMYF7UN9n7QHd58RkD9sW3ImBh857mhpOyOw5EKzKdjw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v2 6/6] dt-overlay: Print overlay I/O memory ranges in hex
Date: Fri, 4 Oct 2024 14:22:20 +0200
Message-ID: <20241004122220.234817-7-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241004122220.234817-1-michal.orzel@amd.com>
References: <20241004122220.234817-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|PH7PR12MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 802d7148-312f-4dac-e7fc-08dce46f3c4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HI9gxbL5j1IxdOqTK43drAKhKzN4z2Zvj0yFE/kOQQjBGvVdA0t6PSVz49a6?=
 =?us-ascii?Q?6CQQe8e916ZF1DaFiyZHJYqeVK72EdOubXFMOnoo0tqDhzgd7r/apsHHZx/C?=
 =?us-ascii?Q?Jns9g1UZM0kFJJ5lGmFZLYkLhI47MiZc2pVyqyJjQ56cW1DVh+jSDzXkAcDD?=
 =?us-ascii?Q?5E301IjZAJIpW+YtaCiMoBniuMKXW9e4grBliYfDDrKuozlASkfhYFeJJwno?=
 =?us-ascii?Q?F3eMLLZ48DLecJHCA1Nalqfun5w0W3vnFjtIrtjBQyUHXHwZ4HnTaYDAna2g?=
 =?us-ascii?Q?9SpvIHTrkod9Z2KXbd+Z7drQiPMaWEkWU9k9BUNHq1xrXNkzvSy32VjEmoTs?=
 =?us-ascii?Q?7e4p3gZnVUcyGb33MUrM/EuoNb6Pj5iC9FulwK1HOTo26JSniUOQbVZGL2/z?=
 =?us-ascii?Q?e9nvm6+aKqEVPe+b6XgVy75xnsr9ISWUtmfw4q93JhGvLYlSSPQSMnyCrxXU?=
 =?us-ascii?Q?LHxs2lf/7EBW1CCTfZyqAAuTPWi8ggcE8sZ2z8vRcXDZJQvtWuGJTZERV08y?=
 =?us-ascii?Q?RmTHJs+iE/H9OhN04PKr9vu1J7IlGgCsDgvHBGLPaMyncetRrrktkC8hNeHa?=
 =?us-ascii?Q?Vg9dEt7pabNmKbrs1vnQTMaigDm3WxBgkrpOob+6tQSlFQje3WlM/AYEYXsQ?=
 =?us-ascii?Q?pSL8bkPkBlXZDIyJ2F0us3ONT33fXumbeNdpS44wfH171+LHzQuwyRcs8uLS?=
 =?us-ascii?Q?7d9LYLgk7LmxMiGyRAkFCqqebIwcX14ZUmhnyeVz9Bt0iBGO+S+aoobAUA53?=
 =?us-ascii?Q?hIgeJmA7I507bhER2N+kpi9Knot/+/eYAD7od7B+eyCIlga4wtSXC8OEa0Gs?=
 =?us-ascii?Q?Yymb9VJTDUgKBARArJmVkwDthEUXPBQvT10bhONuUStiYh3Sz49b3q3r6jGk?=
 =?us-ascii?Q?VBanB4MrFb2Qc7EWmzQKQWN61bifIvOp0xP/yHyzWOlz8/d3gW60Vux+RXQS?=
 =?us-ascii?Q?YCHZmqRzejCG6DjEq0mAKo4DJzKHgtEWX5NyZWDdw9S2e2qMMA8fOugYBCR7?=
 =?us-ascii?Q?US1iGHdqmQzzLaCY/lwQjf40NBiN+IlPWPfxx8QXI6VDpnSfoz53uV/Zax/G?=
 =?us-ascii?Q?WMLKEWtjzX7VCTbThggyIobwA/FH0EUBqMxOkoBgkAaylyWVc7koqklFFr1h?=
 =?us-ascii?Q?cQLdESW+h8s0pGA31tzN43qUth4/oXLgGTwXlaftuMQTlCRSB7D/yj3NoJk8?=
 =?us-ascii?Q?72wIDsRmxWzblFQiA1Vws9ab681ujz8lGVxdILEPCXsah8UcweSNhl9e/ecK?=
 =?us-ascii?Q?2R3cGtUYsVGNWThehM1rH+Fqm5NKTitt30BO5+3pr/HjchggoICkbeLUGwPL?=
 =?us-ascii?Q?WlBqoGh/4LCcRD5Lcw7yiIzLX9y014rCJN9j9c2OHgD2wIXEpdnUWDO/acna?=
 =?us-ascii?Q?TXY1cAOzYaj+MCzG4+qwGh2FAMtK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 12:22:38.3162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 802d7148-312f-4dac-e7fc-08dce46f3c4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5927

Printing I/O memory rangeset ranges in decimal is not very helpful when
debugging, so switch to hex by adding RANGESETF_prettyprint_hex flag
for iomem_ranges rangeset.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - New patch
---
 xen/common/dt-overlay.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 4d75b5b36a99..5ce00514ef14 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -869,7 +869,8 @@ static long handle_attach_overlay_nodes(struct domain *d,
         goto out;
     }
 
-    entry->iomem_ranges = rangeset_new(d, "Overlay: I/O Memory", 0);
+    entry->iomem_ranges = rangeset_new(d, "Overlay: I/O Memory",
+                                       RANGESETF_prettyprint_hex);
     if (entry->iomem_ranges == NULL)
     {
         rc = -ENOMEM;
-- 
2.25.1


