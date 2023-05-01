Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F64F6F3900
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 22:04:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528267.821210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZkd-0006jb-Jl; Mon, 01 May 2023 20:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528267.821210; Mon, 01 May 2023 20:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZkd-0006hf-FA; Mon, 01 May 2023 20:03:59 +0000
Received: by outflank-mailman (input) for mailman id 528267;
 Mon, 01 May 2023 20:03:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ptZkb-000525-TZ
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 20:03:57 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4da851d7-e85b-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 22:03:57 +0200 (CEST)
Received: from MW4PR03CA0347.namprd03.prod.outlook.com (2603:10b6:303:dc::22)
 by PH7PR12MB6762.namprd12.prod.outlook.com (2603:10b6:510:1ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 20:03:54 +0000
Received: from CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::6f) by MW4PR03CA0347.outlook.office365.com
 (2603:10b6:303:dc::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30 via Frontend
 Transport; Mon, 1 May 2023 20:03:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT009.mail.protection.outlook.com (10.13.175.61) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.20 via Frontend Transport; Mon, 1 May 2023 20:03:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 15:03:52 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 1 May 2023 15:03:51 -0500
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
X-Inumbo-ID: 4da851d7-e85b-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kROiZiIA4cLY5yWmMHra6ZecDER05QnXBno6CzGvKXzhwDgCyKrGVlEPPgn/rNBwAgR1jrCnRxA2hQQOWonC+FtQCrJGCHlGXs6pznkhTTM5jiY6TtIwXK7w8uC8PgowZKMEchEkURt7km7cZs/lDfuZh3PMUiq1VO6/XkxD5HiirYAqh1GN3NDD72RnW7WkhZ4uEnAVKu2FYBl1TavXZNNGLskiOks0LbTYnevVJzklDh6np18XRLv0qm4Xj2Xzavk8pFWVgd4/h5s0et2N6Umxn2gML0nGqzxKxdk/9SkOMwPViUZNlj962I4soEyAcO0DquBlHo5IxPvUcuVz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eCX9DqGe9db1MXdGpEVHFk+gaS1vUShIki9NWo1vZU8=;
 b=XO7Yk9gqBVOU/nHgCjzj2TFvEhNxvXbSdpfvjGNIgyuCp0TF/Z7ULuNkGAZqor4CUMI9bAt0QR0C4EAL30I5vDnD6adLd+P2NZCW1X0mQaD5NW/7xzab9Lsscv3JcRVEk22CgbmM6rzrPvTOo3juMicDJKU4slGdTMcsQSE/3KtQ+BxLCpEF+MW7MFJUg1KxXhivuwbezGodE/UIpM07M10SuQ4xKE3f1FvCpP6XHyKJNor3AVrfQ+qk5B2LbmK0bO2NrD9IUtSkX4yyigj9EKxyyOQp+DvYSzajyrj+UuRkdk7G5Eweg+f6N5WKfvetMzbo2O7gSWn08PtDelfsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCX9DqGe9db1MXdGpEVHFk+gaS1vUShIki9NWo1vZU8=;
 b=u6LVLwI4G8an8UAnAZJc5KrGq37sRtf2keRD7tgB68K13JORbuPahCiJNZ6Ad9RhA0Feglb28tXME2tbuPOJy3ypGAdzflHQx8fWEilft0to8nrEo+78umjhBK8W7CKthmZeAFjagIGilBKXkpZEwnIacYug4vOBoxGGKgpJLnE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: [PATCH v1 4/6] pci/arm: Use iommu_add_dt_pci_device() instead of arch hook
Date: Mon, 1 May 2023 16:03:03 -0400
Message-ID: <20230501200305.168058-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501200305.168058-1-stewart.hildebrand@amd.com>
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT009:EE_|PH7PR12MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca6b476-853d-4ff2-67e4-08db4a7f304c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7g/OblPUtzx8aUQCo+wrnlELHWK8d/3yT/7x8z4fxDDsK6vZilApLcJcT1ONO5Xd36v6KASu6wpfvxrxTHAxnKr8jr99rlNe0xqiOOIexd1PYYUU80stkiJL+eevWuQCTTRCt/2qeVIB0VA+DpSvdxfNiCXkxx64MpjaJ/JwO3tNXNOQmk07zDkS0wdNpv/T2u45o3YnX/2BelJFF/DmVQzCYk43H4ygqUGshEmtRax/1fA5DPXXQ+4MShljL6k8ze+OZDwYb25jJH5n/wEfXZC3Tje2q5/LfKahoH31IXJkg7EnAj907GcBe8gTgpDP7bYSZhmn++zi1ksBozYDaGfyfPHDxpc3MPdzj/7DdbnuHVcfBQ9ZFY+GWbxA6A8a8Vcgjla27SC4iLaMDJflgEsV9jowhF9eC3wcWLBJ9cu+77OojR2MsCE6mtEfF9cqXDuDVDS+dEnueYdLUyjvzyt+VWaMxZIR/omB9qIrvAhO2b/Rvvnlc+yxFSHCprelCo2BCIE033BQkrsECbMPew88JsshxhThwu5yb0FMUmfIO8sH8TgxXQ5jrC8OdXsMAtmazRH+8Ho2M+zY25Gkew2slxPNyVXPQfRwC4a7zVPqeCIp9rY/TWV8yOZfJ+riT0ehFfgbmywyk2YSdQo1VsvRiNAHMuXKSrPx202NDqU+5eRRNUwI3zYKwsIrhMMpX5oRCZKWSF1WL25N8LAnlZq+4WvGtnE80/xeXHi92Zk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(86362001)(36756003)(81166007)(82740400003)(356005)(8676002)(5660300002)(8936002)(41300700001)(4326008)(70206006)(316002)(6916009)(44832011)(2906002)(40480700001)(70586007)(82310400005)(336012)(2616005)(47076005)(426003)(40460700003)(36860700001)(6666004)(966005)(54906003)(478600001)(186003)(83380400001)(1076003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 20:03:53.3266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca6b476-853d-4ff2-67e4-08db4a7f304c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6762

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

On Arm we need to parse DT PCI-IOMMU specifier and provide it to
the driver (for describing the relationship between PCI devices
and IOMMUs) before adding a device to it.

Also clarify the check of the return value as iommu_add_pci_device
can return >0 if a device doesn't need to be protected by the IOMMU
and print a warning if iommu_add_pci_device failed.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
downstream->v1:
* rebase
* add __maybe_unused attribute to const struct domain_iommu *hd;
* Rename: s/iommu_add_pci_device/iommu_add_dt_pci_device/
* guard iommu_add_dt_pci_device call with CONFIG_HAS_DEVICE_TREE instead of
  CONFIG_ARM

(cherry picked from commit 2b9d26badab8b24b5a80d028c4499a5022817213 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/pci.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index b42acb8d7c09..ed5a6ede7847 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1305,7 +1305,7 @@ __initcall(setup_dump_pcidevs);
 
 static int iommu_add_device(struct pci_dev *pdev)
 {
-    const struct domain_iommu *hd;
+    const struct domain_iommu *hd __maybe_unused;
     int rc;
     unsigned int devfn = pdev->devfn;
 
@@ -1318,17 +1318,30 @@ static int iommu_add_device(struct pci_dev *pdev)
     if ( !is_iommu_enabled(pdev->domain) )
         return 0;
 
+#ifdef CONFIG_HAS_DEVICE_TREE
+    rc = iommu_add_dt_pci_device(devfn, pdev);
+#else
     rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
-    if ( rc || !pdev->phantom_stride )
+#endif
+    if ( rc < 0 || !pdev->phantom_stride )
+    {
+        if ( rc < 0 )
+            printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
+                   &pdev->sbdf, rc);
         return rc;
+    }
 
     for ( ; ; )
     {
         devfn += pdev->phantom_stride;
         if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
             return 0;
+#ifdef CONFIG_HAS_DEVICE_TREE
+        rc = iommu_add_dt_pci_device(devfn, pdev);
+#else
         rc = iommu_call(hd->platform_ops, add_device, devfn, pci_to_dev(pdev));
-        if ( rc )
+#endif
+        if ( rc < 0 )
             printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
                    &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
     }
-- 
2.40.1


