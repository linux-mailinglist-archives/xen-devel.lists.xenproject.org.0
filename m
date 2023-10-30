Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79827DC34B
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 00:54:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625428.974702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxc4r-0001bw-97; Mon, 30 Oct 2023 23:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625428.974702; Mon, 30 Oct 2023 23:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxc4r-0001Yr-68; Mon, 30 Oct 2023 23:53:49 +0000
Received: by outflank-mailman (input) for mailman id 625428;
 Mon, 30 Oct 2023 23:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j9+r=GM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qxc4p-0001Gf-D0
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 23:53:47 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 903caa6b-777f-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 00:53:46 +0100 (CET)
Received: from BL1P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::10)
 by IA1PR12MB7688.namprd12.prod.outlook.com (2603:10b6:208:420::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 23:53:41 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::ce) by BL1P223CA0005.outlook.office365.com
 (2603:10b6:208:2c4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29 via Frontend
 Transport; Mon, 30 Oct 2023 23:53:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 30 Oct 2023 23:53:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 18:53:40 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 30 Oct 2023 18:53:39 -0500
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
X-Inumbo-ID: 903caa6b-777f-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfYlW3dKpfNqMfqFT/lNoRDOa4zyyc+zZowpmbUUGeU8siHtazH9q+7v0tab2lJILihcPCnNVcpv6gRtF6gI7FBN235ZTR0rtm2O8SvGApxlpkRki8nTDTwoneMYT/6CKR2J65zKLpYE0MctKS6dAfw6AbNR0Rk9xGH6/QuMjyj1Db5mF1PsEDkgw8f4/W5dCrLzu8hyfhtV3wX4gcBAjjAQO2EODpnKiBVXpp5TrUrfZUbMtcIHde9myOrF5wfrXTrtrkJyoxSmVfeQ7OP65wquWLS5Agu0YWou+Os7ur9xR2ZiZfd76L0gd7o7HHco0f0M2nScoCMm7y1prnG5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6TYM1i0vSlru/rDee01ixHg5fuu2TI7QkbjK5Jwo0o=;
 b=glECe+uh0nFNduqzPxNwdBjm6NKrH0sZAN+b1X7GXoLdPYeZyI+EP7CkcDH89GoN4hqrMlxigt6boNy33J12oeavwmsG/CmfKBA+VUjKHuJ8/KLu3hKzM39YU6rqQBMQZ52jgNFi9OIE+N7VyU32hv/NGODWJ/WStYaQfekJ7O7gvquQylnd2nn6CJPE+qyw414uIRAOB2GK168y2dya3lI+KJQDhrGQRq/2p34OqGjtFjsGhi58yO2L4mJSu3wnhgw/U1wvIkqI/n+t3ucLVxtO/5oMPQf3An8SA8bnQV7Ig5YsxwtaNjvo6WAdOlAepKFCwsC0eWeE6z+yUAX6hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6TYM1i0vSlru/rDee01ixHg5fuu2TI7QkbjK5Jwo0o=;
 b=nJmGigQPcZNox4UaUlW3erapo6tzyxAA4vdCV+juMTnLRRxgZMgYStqOKtzc36WGdQl+bDwmddzbWNi6367F6h1qAqiZJXU3dJvkc2lhNBlPAZeT6cT1Hxskye8UVoNueRjI6odyKZt6mbRRW9Cu2EqfXdLh3UVy0ryRJFaWhAM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 3/5] xen/arm: enable vPCI for dom0
Date: Mon, 30 Oct 2023 19:52:34 -0400
Message-ID: <20231030235240.106998-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030235240.106998-1-stewart.hildebrand@amd.com>
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|IA1PR12MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: 290db4b6-73e7-4705-16b7-08dbd9a37184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kZOZCypkYDeNxBSIX6C4ZGLkt0oYJBpFqGjiLOKx8AJEKTVUQPGk4CdRWNSh2zDfpYyu1uV0SFjg4yxz1qx3WEnwBvgAgf4f0AXb+Dw03sBvgSYbXd+EI0QUFNYTGhy/ubD5QSrfKQjL8dWW3U+YRTMTcr/S/XtfhnJyOmwyB0dp2++NCerzm3bokeJLsz6NPwC9rxLVlhBHdZ3aKKkbHlYNX9ot/WsC8icOv8s9ZvD7xZnhGeLYsM7LYsaTvORMfnG68irrhC1co4a3i4vh31GrZymFnNxFfpHJj6ex3YzIvHpqyUYtHqfDr5Xs37cCqVRSpg9Bzj2M8IAyXW3aDsRl91OPQReyhPmdod1ilD//KpIkLcEM2JtQXrRXxFa+Dkm3i5XaeyCrRvH46tA2DEKYL6VWPeYqtit0IOBDFwYd114rFejDyK8CVcOZaOab8kK9O5yBVkzmflLao54Au0j89dX/d31MRviNZwQS+uy8diBeN/mNJMD72mYqjmBx1tJYuRWcAM/Dd3kXzKImfG2IbxGfZ5jwoR3H5bVwvTnEap/7742tE/qGMRFfxbBomaEHjkoYl0FMNe4USKpcowEF/NlpP1Jgf03D6siKggaEZiQZ0Ae92Rf4CckoY1M4VztOGxqCTg6LIYxaMCFXJwCUAVRE6et3eOc9RUoN91g1k1M/l1xgploT+mZIEk2jxmqvQzhTXIb3HW8O/iDj72VupxpBKwdF90pVBhLI4EdOntH7e2hHbkdRvBeP0DwAoWKerWDK/SKEVRyJEi4YnQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(5660300002)(6666004)(336012)(426003)(26005)(2616005)(47076005)(83380400001)(1076003)(8936002)(8676002)(44832011)(81166007)(356005)(86362001)(478600001)(40480700001)(40460700003)(36860700001)(54906003)(2906002)(70206006)(70586007)(316002)(6916009)(82740400003)(41300700001)(36756003)(966005)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 23:53:41.0123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 290db4b6-73e7-4705-16b7-08dbd9a37184
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7688

Set the vPCI flag in xen_domctl_createdomain to enable vPCI for dom0 if
iommu and PCI passthrough are enabled and there exists a PCI host bridge
in the system.

Adjust pci_host_iterate_bridges_and_count() to count the number of host
bridges if no callback is provided.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* depend on iommu_enabled, pci_passthrough_enabled, and whether there
  is a pci host bridge

v2->v3:
* new patch

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00475.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00210.html
---
 xen/arch/arm/domain_build.c        |  6 ++++++
 xen/arch/arm/include/asm/pci.h     |  9 +++++++++
 xen/arch/arm/pci/pci-host-common.c | 11 ++++++++---
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 49792dd590ee..4750f5c6ad31 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3915,6 +3915,12 @@ void __init create_dom0(void)
             panic("SVE vector length error\n");
     }
 
+    if ( IS_ENABLED(CONFIG_HAS_VPCI) &&
+         iommu_enabled &&
+         is_pci_passthrough_enabled() &&
+         (pci_host_iterate_bridges_and_count(NULL, NULL) > 0) )
+        dom0_cfg.flags |= XEN_DOMCTL_CDF_vpci;
+
     dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
     if ( IS_ERR(dom0) )
         panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 8cb46f6b7185..4ae4d8cff8bf 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -154,5 +154,14 @@ static inline int pci_get_new_domain_nr(void)
     return -1;
 }
 
+struct pci_host_bridge;
+
+static inline int pci_host_iterate_bridges_and_count(
+    struct domain *d,
+    int (*cb)(struct domain *d, struct pci_host_bridge *bridge))
+{
+    return 0;
+}
+
 #endif  /*!CONFIG_HAS_PCI*/
 #endif /* __ARM_PCI_H__ */
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index c0faf0f43675..e6a03ae668f8 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -319,9 +319,14 @@ int pci_host_iterate_bridges_and_count(struct domain *d,
     {
         int ret;
 
-        ret = cb(d, bridge);
-        if ( ret < 0 )
-            return ret;
+        if ( cb )
+        {
+            ret = cb(d, bridge);
+            if ( ret < 0 )
+                return ret;
+        }
+        else
+            ret = 1;
         count += ret;
     }
     return count;
-- 
2.42.0


