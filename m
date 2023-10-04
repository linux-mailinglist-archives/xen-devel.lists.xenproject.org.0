Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8987B8332
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 17:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612675.952716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3Vh-0001FS-G8; Wed, 04 Oct 2023 15:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612675.952716; Wed, 04 Oct 2023 15:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3Vh-0001Cm-DL; Wed, 04 Oct 2023 15:10:01 +0000
Received: by outflank-mailman (input) for mailman id 612675;
 Wed, 04 Oct 2023 15:10:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSqs=FS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qo3KV-0004W4-67
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 14:58:27 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e89::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77d247dd-62c6-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 16:58:26 +0200 (CEST)
Received: from MN2PR13CA0028.namprd13.prod.outlook.com (2603:10b6:208:160::41)
 by DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.25; Wed, 4 Oct 2023 14:58:22 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:160:cafe::8e) by MN2PR13CA0028.outlook.office365.com
 (2603:10b6:208:160::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Wed, 4 Oct 2023 14:58:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 14:58:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:58:22 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 4 Oct 2023 09:58:20 -0500
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
X-Inumbo-ID: 77d247dd-62c6-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaT/wMKOtwtxdI7KQf+duEa9XivIoC/k4G4bikMbUYtSSc9WyWFewsfIDzcOvu/ZJt8R2eXzy4aUHH/NA7By/k/WLxO9e9/BOMkOt6HwnvQ3vYiS9i/zz7mTtJNO5+WOuN1/YWNH5Eg8DaiAKk0cKkB+UPNK9+7LD3qAGgNYNgoB2/ooBjUmavsJ6mrt+BU8clQ3Qn8nvMAb+eAAcyYMLNqZxTMpzk2ZmKq5tx+VEMAAOO53tqqWXYhewJl5O3KMRedKwsIojUhgDtFCvU7UQXL/LKU1EV/Xc1R8Yq4kYV6Ht0dmSPk7LpwjZO/DXs/cgaUvODcd/CyohAaugjy4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOHqnDVKZFYPLXFmyrCWlBiPX7zJbAyoB0dsFXljQS8=;
 b=c1o5cIQssS7waTHO+Z7sCiTwHCwJZOasNLCE3iCsqhfg/Jwi5aGQzxc33GZ8VM6U5AEGZhPH7NMyRX8laGDa2KSRIt6Q29LpWYMJuHh6BjcFpSXcXdV+to2DXjjnEdRtrh/74z7ng3vYA1iooY2rFztxfnDWuVIyEcnopn9HOEEYndLPhWUkr0OQ9+8SETA5KN///VVAvGhcZ85Q4VLjs/b3fiHwiYUf70LUEgqPxOy/WcbknjxNOsMcuLQj1XA5Wt2c042OOVCtU2WNCbgB9r+81NazBuoaxrcpjgxCpyuMhEw9D9MDH93+sNlJ6HKC+O/uCp5X+Tm2aIJso3Kuxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOHqnDVKZFYPLXFmyrCWlBiPX7zJbAyoB0dsFXljQS8=;
 b=rPYuNl1GzzCBBnxMJQjer+ISKUzj+qcBB2AMuj0yfumfXr7RyNP82m87iifa0hMg0EyMjzPIsuYaNKi5c7JzKP8iwk+fI0+tCfAqw6nftmuLqs5yW9pxbxcxqNGF2zkYqX3VsdCUmdQqoxk1SXZljvtddPIeWCsYqEXoKi96iho=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 8/9] Revert "xen/arm: Add cmdline boot option "pci-passthrough = <boolean>""
Date: Wed, 4 Oct 2023 10:55:52 -0400
Message-ID: <20231004145604.1085358-9-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|DM8PR12MB5431:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a0d4f7-6b9d-40a1-fece-08dbc4ea5ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rmSgqOcqlCD0vCoVmeKtZXmloHuMOptnZXG8c0yla3D5+gbwmjGG41wvNxPx/W6Vfl/6ZDIwUzd2mLqj3v3ovloACBYXVHbXtVEikKwc8qQqYVdTeHwZxKP46SzWbY1UjbywzrGk/m7BQcQSAF9XSVD1GzMekkNRQXJgSs2T1oPjDdfA7aMmP9s/Sa9v0tWi/bardjlL40Mwjgiz/q6t8+eo9NsbD+aFKhKxPMILCkYIRkjj1xVmJcmAGKxITVoeX/8+j4eRUjzheQkV0R804eSRpoxBJOCUbvp4XU36rSm9ZXPT18DWgF2Zw3r0eKShIeKhK875eHLpLyZTPcCEbbOGR61vGnl0mes14a2TrwaZyj2UNnfx6Uth2pHHGQ+74ifoqHRquxgtaXWnqMzzKn9mbMLGHfh37ho3TkDl6cIHvQ+unfoZw8ydk6C/kw7LhjoR3WrfRcW0p5n6vR++4w4ZaGCFaF9kErNLXSaQKc7HK08nm6GTXDWSW3ppFnA+ebDk8kZ/7wl1Au1DSM+GbgRLzRJ/NOqpW50ZUURXVYldM5941+SFfb8sR7VmVlX5eXrmWFEWJ8nGxCdQeofT6bkBUNSKhTBh77DITG8cALGCAzdqJKp7/YUmuMex9pMHZFEaRHlQB/5i4Z8F4NuARm/sQLbfEUi2a1iRB4pqBKh186nKXxIzIRlnoWGHhjvpSW51RZtIXNNO48r2/o1Qw0FNEsLWYIJVCXXO+isUEpX1Tuzxc3LvHlSsb+Ra+fYLqe5aP4M7zy9iCfPhC7sPmw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(41300700001)(54906003)(44832011)(4326008)(8936002)(8676002)(70206006)(6916009)(5660300002)(47076005)(2616005)(7416002)(356005)(6666004)(478600001)(426003)(70586007)(83380400001)(1076003)(26005)(336012)(82740400003)(36756003)(81166007)(36860700001)(86362001)(316002)(40460700003)(40480700001)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:58:22.6053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a0d4f7-6b9d-40a1-fece-08dbc4ea5ab8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5431

From: Rahul Singh <rahul.singh@arm.com>

This enables us to use IOMMU + PCI in dom0 without having to specify
"pci-passthrough=yes".

This reverts commit 15517ed61f55be6039aedcc99720ee07c772ed44.
---
v4->v5:
* new patch
---
 docs/misc/xen-command-line.pandoc |  7 -------
 xen/arch/arm/include/asm/pci.h    | 12 ------------
 xen/arch/arm/pci/pci.c            | 12 ------------
 xen/arch/x86/include/asm/pci.h    |  6 ------
 xen/drivers/pci/physdev.c         |  6 ------
 5 files changed, 43 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 604650aaeeef..bd2f1070c445 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1955,13 +1955,6 @@ All numbers specified must be hexadecimal ones.
 
 This option can be specified more than once (up to 8 times at present).
 
-### pci-passthrough (arm)
-> `= <boolean>`
-
-> Default: `false`
-
-Flag to enable or disable support for PCI passthrough
-
 ### pcid (x86)
 > `= <boolean> | xpti=<bool>`
 
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 8cb46f6b7185..e14013901469 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -21,8 +21,6 @@
 
 #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
 
-extern bool pci_passthrough_enabled;
-
 /* Arch pci dev struct */
 struct arch_pci_dev {
     struct device dev;
@@ -111,11 +109,6 @@ pci_find_host_bridge_node(const struct pci_dev *pdev);
 int pci_get_host_bridge_segment(const struct dt_device_node *node,
                                 uint16_t *segment);
 
-static always_inline bool is_pci_passthrough_enabled(void)
-{
-    return pci_passthrough_enabled;
-}
-
 void arch_pci_init_pdev(struct pci_dev *pdev);
 
 int pci_get_new_domain_nr(void);
@@ -132,11 +125,6 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
 
 struct arch_pci_dev { };
 
-static always_inline bool is_pci_passthrough_enabled(void)
-{
-    return false;
-}
-
 struct pci_dev;
 
 static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 78b97beaef12..e0a63242ab21 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -16,7 +16,6 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
-#include <xen/param.h>
 #include <xen/pci.h>
 
 /*
@@ -75,19 +74,8 @@ static int __init acpi_pci_init(void)
 }
 #endif
 
-/* By default pci passthrough is disabled. */
-bool __read_mostly pci_passthrough_enabled;
-boolean_param("pci-passthrough", pci_passthrough_enabled);
-
 static int __init pci_init(void)
 {
-    /*
-     * Enable PCI passthrough when has been enabled explicitly
-     * (pci-passthrough=on).
-     */
-    if ( !pci_passthrough_enabled )
-        return 0;
-
     pci_segments_init();
 
     if ( acpi_disabled )
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index f4a58c8acf13..3eb6fb8edf30 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -49,12 +49,6 @@ bool_t pci_ro_mmcfg_decode(unsigned long mfn, unsigned int *seg,
 extern int pci_mmcfg_config_num;
 extern struct acpi_mcfg_allocation *pci_mmcfg_config;
 
-/* Unlike ARM, PCI passthrough is always enabled for x86. */
-static always_inline bool is_pci_passthrough_enabled(void)
-{
-    return true;
-}
-
 void arch_pci_init_pdev(struct pci_dev *pdev);
 
 static inline bool pci_check_bar(const struct pci_dev *pdev,
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 42db3e6d133c..4f3e1a96c0fd 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -18,9 +18,6 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct pci_dev_info pdev_info;
         nodeid_t node = NUMA_NO_NODE;
 
-        if ( !is_pci_passthrough_enabled() )
-            return -EOPNOTSUPP;
-
         ret = -EFAULT;
         if ( copy_from_guest(&add, arg, 1) != 0 )
             break;
@@ -56,9 +53,6 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_device_remove: {
         struct physdev_pci_device dev;
 
-        if ( !is_pci_passthrough_enabled() )
-            return -EOPNOTSUPP;
-
         ret = -EFAULT;
         if ( copy_from_guest(&dev, arg, 1) != 0 )
             break;
-- 
2.42.0


