Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C28279CEF0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 12:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600394.936035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg11r-0000yU-O2; Tue, 12 Sep 2023 10:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600394.936035; Tue, 12 Sep 2023 10:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg11r-0000ve-Kq; Tue, 12 Sep 2023 10:53:59 +0000
Received: by outflank-mailman (input) for mailman id 600394;
 Tue, 12 Sep 2023 10:53:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t/Nr=E4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qg11q-0000vY-Hh
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 10:53:58 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa61ceda-515a-11ee-9b0d-b553b5be7939;
 Tue, 12 Sep 2023 12:53:55 +0200 (CEST)
Received: from BL0PR01CA0010.prod.exchangelabs.com (2603:10b6:208:71::23) by
 SN7PR12MB6692.namprd12.prod.outlook.com (2603:10b6:806:270::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Tue, 12 Sep
 2023 10:53:51 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:208:71:cafe::ad) by BL0PR01CA0010.outlook.office365.com
 (2603:10b6:208:71::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37 via Frontend
 Transport; Tue, 12 Sep 2023 10:53:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Tue, 12 Sep 2023 10:53:50 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Sep
 2023 05:53:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Sep
 2023 03:53:48 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27
 via Frontend Transport; Tue, 12 Sep 2023 05:53:46 -0500
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
X-Inumbo-ID: aa61ceda-515a-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ET9MhERgFccO5sDfNnWU+br0IqItKWWYqJSmMNdt8iX3bHWI2tbVCEEHz85VV0KRqaaKdaROIuXx2AaQaY4DZXq+X1rUFJ66bSg5A54GFjbFbEnBBnuk3WEF3Ii6OGA+hA8FcWkKJgEDxGTv9hZna2Ay7YvgT66VVSYTuOVAVSyE9uoZAlaUT2GEbHt4fdu/sSgM6+HODr9LIuxKQnf90VvZ7tu4+PRcdEy95Oh6KdNX7cwavEiNtUvdvBaGT47e/vF6K6GQIlCqG5GP5G4OKvUo8hS7SwTTri6PeqKdQbsyHmELP62I3jjfG6PzQKj4hk0C+tLwNgb8Qyjh8OnNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjwFMUMLCNhNx+/NB72iRgMX4Ayb2lm/rQT3Lm14wZ4=;
 b=NaesUIE8SN0oslcIUaLzgJZtIh5I+tZJEXgAgAROfbAjyb6AyLarwalDX28bqYCtBwJ44pvtgeJiXV7uMtDLxixJC9Fd3MQ41bip9XfulS8TaVNii865CSDZ2uJdKYkAnjEOoIAZ1rbBxYA5Y/J5/sNY3mbD6Z6sxksjWqFMH1TcVPkiPYuOzhUS6gN1gN2Ln7ZJ+BXVyYICgO/fgYN3vcbwhDu56kKnWl9pkIswawXoBvHoj5XhYjd5YbeNYZClfQrioGl79A3z5wPbnWjLrvSKd/N1+JCottPCqO0ERBMOBS6PX//OBhgrixY9nmsD3ZH8XLTrrr2ZmPI/9Jx1bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjwFMUMLCNhNx+/NB72iRgMX4Ayb2lm/rQT3Lm14wZ4=;
 b=CtIKSklEMz+DSfp2F2WioEwI21MxFU5gHF44AHWuRG6JtlkbCYshlMtHYOtr9lwR1Wuz7YyhPPfjSWPO0XYLlO+zQneMnh7ei7UZeKgnRLuy/ZPb185TINxVDGUW4CwLzt2qOgw0Vdue3CHBNTw1f6v5+YNZ/tzOnGRoBtheATU=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: Skip Xen specific nodes/properties from hwdom /chosen node
Date: Tue, 12 Sep 2023 12:53:41 +0200
Message-ID: <20230912105341.16687-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|SN7PR12MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: 347bd3f2-5eb9-466c-1275-08dbb37e8c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8QAxI3wGLOptz+jReXvvN/mquIDAVsxdg3YXD83esZP+M9kJpTy79L096JzvQ5uRBCHpSVk82TPn5/vCpMZMfFrq8OPObGSDCTz1EQMxOhs9LbswwpVPOT21fk+ICVL/wzPMprWaEtpx8XRDSaJ7iNI3EjAYUnhxj2slFr8pqUbBT7q1g4sTJok30FpLn5Q6dzYfl2/lsWOIKf5ZIEUkeedqMXZH3qdZYW6WfVKoIwDbx8eit9dX0tMo37He6ny/W1GgNu1No2YVgrbV+upf8AWNevfmgtSOUsxDeusZNtDH/ng7eluVKGSyRdetRMDMB0oNFtpXNFx3r93Hb/spFJmcnqQE13EYgcKGj1FpBF84aJCrxB/E0dic9R38pJ+9I1r24LV1OjAyWQQqTDnVuZAjP9H6X6Wv/L+xr9Sj9aTU3urFEgLmdvddUoNapX1WRiDYqXZEYwuhYoY1qBuJTFeth9wtNfvHaJygaXBxsUfNMKBAs7LIpIZZYFgPfY0XV0uaOvhXKR7zVDgsdG5EKOt+idZHgIkBK58GY4TkwTn98U1ty2ZBhs1p8YdrkDlRPhDNldba3ZvlDCOSCBvBm9x1+jwj7v6DE9MepWKjUs6j5TV4CsVM5oJqGGD3sGrLjDVLj8GpQxKA2IjUVlO7LvfWT2BRbRfjlD2SpJ/7m7exuDhq+lJrjohRV2yv3tq1dwCJhzeWdxY92hxFnfC7GKXY9Q8REG5ACoQ81pOjKD41H3/f3DEB7bW92BCngnWCMyeE+jLhSjkvtrV+EZLemw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(1800799009)(451199024)(186009)(82310400011)(40470700004)(46966006)(36840700001)(70586007)(356005)(82740400003)(36756003)(86362001)(81166007)(40460700003)(40480700001)(478600001)(8936002)(2906002)(6666004)(8676002)(4326008)(5660300002)(44832011)(41300700001)(426003)(83380400001)(36860700001)(336012)(54906003)(2616005)(6916009)(26005)(70206006)(316002)(1076003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 10:53:50.8288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 347bd3f2-5eb9-466c-1275-08dbb37e8c93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6692

Skip the following Xen specific host device tree nodes/properties
from being included into hardware domain /chosen node:
 - xen,static-heap: this property informs Xen about memory regions
   reserved exclusively as static heap,
 - xen,domain-shared-memory-v1: node with this compatible informs Xen
   about static shared memory region for a domain. Xen exposes a different
   node (under /reserved-memory with compatible "xen,shared-memory-v1") to
   let domain know about the shared region,
 - xen,evtchn-v1: node with this compatible informs Xen about static
   event channel configuration for a domain. Xen does not expose
   information about static event channels to domUs and dom0 case was
   overlooked (by default nodes from host dt are copied to dom0 fdt unless
   explicitly marked to be skipped), since the author's idea was not to
   expose it (refer docs/misc/arm/device-tree/booting.txt, "Static Event
   Channel"). Even if we wanted to expose the static event channel
   information, the current node is in the wrong format (i.e. contains
   phandle to domU node not visible by dom0). Lastly, this feature is
   marked as tech-preview and there is no Linux dt binding in place.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - update commit msg with better reasoning
---
 xen/arch/arm/domain_build.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 29dcbb8a2ee6..413568c0e2fd 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1149,7 +1149,7 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
          * * remember xen,dom0-bootargs if we don't already have
          *   bootargs (from module #1, above).
          * * remove bootargs,  xen,dom0-bootargs, xen,xen-bootargs,
-         *   linux,initrd-start and linux,initrd-end.
+         *   xen,static-heap, linux,initrd-start and linux,initrd-end.
          * * remove stdout-path.
          * * remove bootargs, linux,uefi-system-table,
          *   linux,uefi-mmap-start, linux,uefi-mmap-size,
@@ -1158,7 +1158,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
          */
         if ( dt_node_path_is_equal(node, "/chosen") )
         {
-            if ( dt_property_name_is_equal(prop, "xen,xen-bootargs") ||
+            if ( dt_property_name_is_equal(prop, "xen,static-heap") ||
+                 dt_property_name_is_equal(prop, "xen,xen-bootargs") ||
                  dt_property_name_is_equal(prop, "linux,initrd-start") ||
                  dt_property_name_is_equal(prop, "linux,initrd-end") ||
                  dt_property_name_is_equal(prop, "stdout-path") ||
@@ -2300,6 +2301,8 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
     static const struct dt_device_match skip_matches[] __initconst =
     {
         DT_MATCH_COMPATIBLE("xen,domain"),
+        DT_MATCH_COMPATIBLE("xen,domain-shared-memory-v1"),
+        DT_MATCH_COMPATIBLE("xen,evtchn-v1"),
         DT_MATCH_COMPATIBLE("xen,xen"),
         DT_MATCH_COMPATIBLE("xen,multiboot-module"),
         DT_MATCH_COMPATIBLE("multiboot,module"),
-- 
2.25.1


