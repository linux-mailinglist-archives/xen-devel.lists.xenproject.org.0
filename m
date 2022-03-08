Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983724D21E0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:47:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287466.487533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoB-0006on-6J; Tue, 08 Mar 2022 19:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287466.487533; Tue, 08 Mar 2022 19:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfoA-0006lx-SA; Tue, 08 Mar 2022 19:47:46 +0000
Received: by outflank-mailman (input) for mailman id 287466;
 Tue, 08 Mar 2022 19:47:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfo9-0004Om-9D
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:45 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e3e1468-9f18-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 20:47:44 +0100 (CET)
Received: from DS7PR06CA0029.namprd06.prod.outlook.com (2603:10b6:8:54::29) by
 SN6PR02MB4222.namprd02.prod.outlook.com (2603:10b6:805:35::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.25; Tue, 8 Mar 2022 19:47:40 +0000
Received: from DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::82) by DS7PR06CA0029.outlook.office365.com
 (2603:10b6:8:54::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:40 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT023.mail.protection.outlook.com (10.13.5.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:40 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:23 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:23 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnn-000Cws-52; Tue, 08 Mar 2022 11:47:23 -0800
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
X-Inumbo-ID: 9e3e1468-9f18-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldUdEaGswBbDtujp2DwHiW9MsZxSMSw9dv8eJW3h+o/vdVRpOUVzRHcljLXEpXVYo6cNag64sS/DaraIMRk1eFBVq1wbau1vzT737ELklqoJITzXiXsmgYf17ZVTL5HcqLAzq+btsPz2+WgaQPpiUPUgHTfK5qqgBSjMrn2ddYixa3rj3ied+P2fbzP0jvaQJ6jQsnGMSG2L/qOMldYFRdx4OhqiE3NejHCm48T/ed9da1kHMEFb/TCzoFcamm1w2GbaNztxRwEGnXZBN4CW7vr9eNbGTsJppqPwX+eNoFdSviII7T3rK5YOZH+V1NVa2GcKf2/eEW+k4p+8qF1ZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hiYAAnRJSQ97HoN+W3p3cdTXxnyKZvARJ1IXwEqMPM=;
 b=bQd8aM+ebjaAE8OXf+SMczAKEo0tzaLLPAeSu7J5PoEMaHnKc9eecJphouJiBkZ8fWsUVwdZj7RDzg+cS0UkLGinoaUZctx+GNR6LoxiY58OKJzqSI7vl2uYxC1cVEs2NAW9xC0e8EfcQR4DGzMWFt2PdTULhEnDLSP/en6L6pHyG/x6liFD7rntuJAz3sRjYBtwBcuMT2haHHFGNdhCLY4HOGEfAKVHeKK15+/5xhZORT6ILvi1E/PzsZDcwPH04uMXhcWJlsMhkxYv6eZgkzs8W6wwJq1RxpRjvLNe7FU1MakzvJI+Q2trYNctu2/0b40HEaIP3saVpmxDLdQG5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hiYAAnRJSQ97HoN+W3p3cdTXxnyKZvARJ1IXwEqMPM=;
 b=cw/3WSoAJl73LKZPmd/Gmv/mB0ewwY6/7iZ1Pm8qlV8getsWibNYVVA3v5+K23WO3t5u9Q13uAoDqafHJiWs1muqn+bIerrJEaykrrWyDmfMuJy+wOKsmMVVvE6q334cKWJULvhY8HmEMA/k/kt7qjbytFoTav/mnr+36v+5s0w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: [XEN][RFC PATCH v3 09/14] xen/iommu: Introduce iommu_remove_dt_device()
Date: Tue, 8 Mar 2022 11:46:59 -0800
Message-ID: <20220308194704.14061-10-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9124e229-8348-42cf-476b-08da013c811d
X-MS-TrafficTypeDiagnostic: SN6PR02MB4222:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR02MB42226E06C7DB016BD7704092BC099@SN6PR02MB4222.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RZGXsKx1kLKXkbheqRNcSMIzKDdeROoEuLZgNUfmfaFHaX4WiuX+Q1MfQumsS9bA9Iv8mkpPUauhStOCQ34SSNo7J12L87lMMpaj7ci7o7HsxKw+X9x/H0wsxAodDK/rxelxEi4wZorOLoMoGOfK/RVNgWhTU4aXZTU0wlLGqbNUOczz8WxG1gDxk2CMfGXa4Bw9iLlGb8eLhvKuIehRlhLeVc6rhEJY/xPe9YD2JIrE4WoYdQ0uco5zdeDT5dX/odevPvOLGledHdE2ft2GcWWuixX9LK8PSxxmS1UhpCnkJw7f/tslEtWM+jHPE1V3QW141uq2Db8bR2T1/Endz/HPJ6EPbn3di+uhPnoYA7N7bSSSgGYHyPd9QqSddiGQDKlkWbsNEhX1HjgbZLeqdIXcuaWwEZXSMTe84C055iV+1LiSW/F0qsrWDHopcWNVPSdgxq1nBrVP1eJoMxkqo559xTeB3d6hHNlNCBoaGGs6CnvQ8LBY9kqLw6d6Dz0RZqLZIevxTqQgOqVSoFIlFR9RJaqo6uMXX5EQpnbcsFWLB6O2gpFcPfeuAFWEKJWS1ha3O7bounaOijIWr6quyuf6EaaN57ogeQzAc9ypMufjMzEB89f6k1QdFz1xKIs4ssiTK0pdIkKT+dw7LQaJBf1K+lson8TQTx9doO4EYOty3WR2rBk0x8jcAuBORGziUOZwZBWYBfV2/vbMlUc0wg==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(508600001)(9786002)(5660300002)(54906003)(316002)(426003)(336012)(7636003)(83380400001)(8936002)(7696005)(6666004)(82310400004)(8676002)(70586007)(70206006)(4326008)(356005)(2616005)(6916009)(1076003)(40460700003)(26005)(47076005)(36756003)(2906002)(186003)(36860700001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:40.1410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9124e229-8348-42cf-476b-08da013c811d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4222

Remove master device from the IOMMU.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/drivers/passthrough/device_tree.c | 38 +++++++++++++++++++++++++++
 xen/include/xen/iommu.h               |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 776809a8f2..5cd0b20c77 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -125,6 +125,44 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+int iommu_remove_dt_device(struct dt_device_node *np)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct device *dev = dt_to_dev(np);
+    int rc;
+
+    if ( !ops )
+        return -EOPNOTSUPP;
+
+    spin_lock(&dtdevs_lock);
+
+    if ( iommu_dt_device_is_assigned_lock(np) ) {
+        rc = -EBUSY;
+        goto fail;
+    }
+
+    /*
+     * The driver which supports generic IOMMU DT bindings must have
+     * these callback implemented.
+     */
+    if ( !ops->remove_device ) {
+        rc = -EOPNOTSUPP;
+        goto fail;
+    }
+
+    /*
+     * Remove master device from the IOMMU if latter is present and available.
+     */
+    rc = ops->remove_device(0, dev);
+
+    if ( rc == 0 )
+        iommu_fwspec_free(dev);
+
+fail:
+    spin_unlock(&dtdevs_lock);
+    return rc;
+}
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index b18e7760a2..64871e5cb8 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -215,6 +215,8 @@ int iommu_release_dt_devices(struct domain *d);
  */
 int iommu_add_dt_device(struct dt_device_node *np);
 
+int iommu_remove_dt_device(struct dt_device_node *np);
+
 int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
 
-- 
2.17.1


