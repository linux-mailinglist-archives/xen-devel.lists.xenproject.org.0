Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD539869974
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 15:58:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686224.1067991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reyu8-0000mW-IR; Tue, 27 Feb 2024 14:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686224.1067991; Tue, 27 Feb 2024 14:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reyu8-0000l0-F6; Tue, 27 Feb 2024 14:58:00 +0000
Received: by outflank-mailman (input) for mailman id 686224;
 Tue, 27 Feb 2024 14:57:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qLI9=KE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1reyu6-0000IQ-Vn
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 14:57:59 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96de4a4a-d580-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 15:57:57 +0100 (CET)
Received: from BN7PR02CA0010.namprd02.prod.outlook.com (2603:10b6:408:20::23)
 by DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 14:57:53 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:408:20:cafe::4b) by BN7PR02CA0010.outlook.office365.com
 (2603:10b6:408:20::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.50 via Frontend
 Transport; Tue, 27 Feb 2024 14:57:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 27 Feb 2024 14:57:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 27 Feb
 2024 08:57:52 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Feb 2024 08:57:51 -0600
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
X-Inumbo-ID: 96de4a4a-d580-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGFri9EeGhHjGxvxu7ykHF97PigITRmmPBRvXXJL7LIKm2Yahor9SoN8OaXgtCpDg6GeqvlLPMS0B+Ll5vWiZNsEPDRi+ddnMZQEVYGl1kjjXp2VWoyp/vySOD7lSfPO+X6ZO+cf+cr2YvAqcvCIMYfmbFBWyOvBRKG1IKWoRKWjBRHrmxlTTCPwuo5JcY/KYYeexxi8syeGssyFEp9XIgm+15R2D3A0itCz9n97za/KeMAKu7xrmWWJUI5ZN0fQumeAU9PHy8JSh7KSGYsbvirGhXNQYKnIjeYeGSq1YNpT3jaEYJqgTnermod52umtzf0kZYY9g+DwY7VFrhItrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvj0LEigc/XintbNW+DN4Ey7AN3YiDC/XrVKTpDiUTE=;
 b=ZZVk1eUn5Jtsd7tFfcd4v+q8zJVmzhzGzYfW8AmlwxhkcwKvZ/Cq21PinAH30leIyHVwIiMOv2mZtJSzJ/0FJQoAXcqmM6w73mh69IncBQvhlmFFJlDoeRigrQ6sDQwxrZFYr3CnCSOcQk+a/LMfhd7wtQuco8+yRgHwR+6WHe3fRgX7dp8vqzFN6E+yNQKAaAV5u89p5Qx3+jc/dEB1h6ZdSGho8i9eeDSWzsTOiufS7FOguFBYd1SVPABD6clR07yiZkM78oDXIzk9BSobXp32oWO9CHhaLo+kz67psGzQjiUlZEnaMS8K3Cv70a1AJCeg7aipq1v/X3DETUfnEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvj0LEigc/XintbNW+DN4Ey7AN3YiDC/XrVKTpDiUTE=;
 b=c/bIhHWlCH7vbJvGouWPwH+ZJlF9zHBfJueKm8N9H/n6z/vu2yqeAjRcXpF9uZHXESRb/TEoc8QwxVt19T2x+1EE6qb5EzW7PevRDLCncNs0p5Ky3chVfBoRjM76BggD0q3iWOpzCmBjWV8yGwHlCPPRXFGcceDmZ9NbcwYhKPk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH] tests/vpci: fix unit tests after locking change
Date: Tue, 27 Feb 2024 09:57:43 -0500
Message-ID: <20240227145745.1114780-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|DS0PR12MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 424b2944-2860-4a4d-a90e-08dc37a47950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FnjFvrK+MLx1CCp6uHI7K4H0WRURtY9Dz5xEv2iHZR+ARaAZu3pU/CijYi2Pw9ywp2OPCgU4Rn+GLR6DSZ9KwEmbUGXlxsggMivYJCl4zTvmxSAGXCgd6Q4XaTw//B8mTebMPzXzOzWOetT8xvrzxGaSDJ5YR3ftFF7htiAuR9X8PPGmAm6JIypu/vy+XV2FidyE0zbAxcU5k+Z8tSo8xT1MA5pMdId0YItMG8XNbKnIeGVlBTmhJuVelnSNGc/ORmGPrcEe0E19LzxCnAdCCApxT6mBzFqPFhs1FwnVUdUgz/7WCbfveinumMCxtFgcyvqTSho2O0bXPFd5Fut6KShqGcytBSSrp61w2zlFNkx8SxX4epO82dlSvcQjNTHy0HvqGdhueDEzxKLA/nT/Fow5aSUjk7QWxluUuiaFPtFEAyq4WCV/vk07gfCszdBrsmJ8dSqjCVzhH5mMcmyC1d98np5ICy9XiGJAFAD9qhxochyBhTBUPhkZ9eOU7nsS7oEPGtyMNrTFU14jdpzsy9BpbS9eTtQ7640FspuZmFAwMUFCRVm9DgpvzRP/5h28UEpSfbotT5TOc+GPVjlKISQbw2+czlKLgvq1KDAXTgC4lwZ8mmjs8ZtDUzqHPzHLFuDp3zzAt3XkMz4OLGrdHriP/wPsdWTH+dREapcPIHCACGwKSZG41kJPL7f/QvCVOQlToHszISKQb8aQNv3ZKbL5Z0WIxpWhMJIQgnq15T7WKUX592t4kT9j2MH/a5Gj
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 14:57:52.8792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 424b2944-2860-4a4d-a90e-08dc37a47950
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8317

The recent vPCI locking broke the vPCI unit tests. Fix it to unblock CI.

Fixes: 4f78438b45e2 ("vpci: use per-domain PCI lock to protect vpci structure")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 tools/tests/vpci/emul.h | 9 ++++++++-
 tools/tests/vpci/main.c | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/tests/vpci/emul.h b/tools/tests/vpci/emul.h
index 3c2f66a18f13..da446bba86b4 100644
--- a/tools/tests/vpci/emul.h
+++ b/tools/tests/vpci/emul.h
@@ -37,7 +37,10 @@
 
 #include "list.h"
 
+typedef bool rwlock_t;
+
 struct domain {
+    rwlock_t pci_lock;
 };
 
 struct pci_dev {
@@ -46,7 +49,7 @@ struct pci_dev {
 
 struct vcpu
 {
-    const struct domain *domain;
+    struct domain *domain;
 };
 
 extern const struct vcpu *current;
@@ -56,6 +59,10 @@ typedef bool spinlock_t;
 #define spin_lock_init(l) (*(l) = false)
 #define spin_lock(l) (*(l) = true)
 #define spin_unlock(l) (*(l) = false)
+#define read_lock(l) (*(l) = true)
+#define read_unlock(l) (*(l) = false)
+#define write_lock(l) (*(l) = true)
+#define write_unlock(l) (*(l) = false)
 
 typedef union {
     uint32_t sbdf;
diff --git a/tools/tests/vpci/main.c b/tools/tests/vpci/main.c
index 64d4552936c7..33223db3eb77 100644
--- a/tools/tests/vpci/main.c
+++ b/tools/tests/vpci/main.c
@@ -21,7 +21,7 @@
 /* Single vcpu (current), and single domain with a single PCI device. */
 static struct vpci vpci;
 
-const static struct domain d;
+static struct domain d;
 
 const struct pci_dev test_pdev = {
     .vpci = &vpci,

base-commit: 576528a2a742069af203e90c613c5c93e23c9755
-- 
2.43.2


