Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 507227995EB
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 04:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598346.933087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qenYX-0003g4-O2; Sat, 09 Sep 2023 02:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598346.933087; Sat, 09 Sep 2023 02:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qenYX-0003eJ-KK; Sat, 09 Sep 2023 02:18:41 +0000
Received: by outflank-mailman (input) for mailman id 598346;
 Sat, 09 Sep 2023 02:18:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vbb/=EZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qenYW-0003dU-6I
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 02:18:40 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ed67621-4eb7-11ee-9b0d-b553b5be7939;
 Sat, 09 Sep 2023 04:18:38 +0200 (CEST)
Received: from CY5PR15CA0007.namprd15.prod.outlook.com (2603:10b6:930:14::13)
 by CH2PR12MB4890.namprd12.prod.outlook.com (2603:10b6:610:63::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Sat, 9 Sep
 2023 02:18:31 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:930:14:cafe::46) by CY5PR15CA0007.outlook.office365.com
 (2603:10b6:930:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.39 via Frontend
 Transport; Sat, 9 Sep 2023 02:18:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Sat, 9 Sep 2023 02:18:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 21:18:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 21:18:29 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 21:18:28 -0500
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
X-Inumbo-ID: 2ed67621-4eb7-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFsKkighMrLYKs3awVxLXMjlziUJ+0nLECxdgQrA8LjK10IK1mkoAs5HxX7XL99OS40oPgAhWsQZIKpJhXMOODuj1lip9KQLVx4/gDzNF/fziHvvhE6xsMkN4zHENAhqtLRBni5FxmcJOmoyrAVwg4SwArjRvZl3GbRAgB0ufob8iZ/264NF7yvXPHA90khIo610v5nBOPIFDZcc8nmdTf9vDYQBdRA9uPA/bmaKnwEb9CQf3xg+1RNr+PVSHVXB263nrRlbR863lSO7AFHziTfO4SdxxqVc2RyMg/gr5Mqh89txjcyYarISzwDF7RTKR4jWgEv45QlHzjNfQvnFuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nr7OL8yPNaL5TrLID4oNgMxCjNkIO8tK0RAkzMUQ/ac=;
 b=HdVpMWvgodgABd/IPikqFDH+sP9EEKJuaP3xmCMgfTwEEPAz4xhLGggjEzv3mmnkWC2AMhcnAjnpej/W1kP8ZZb5hb2aVzXa96I8GsJzF/1SJjcPrYYnHYX1Jhoh/Y1ejmAr8HO3+miRuQBh6eOh62+DzdX5h6v4D8LP9016LTt3pyPRiXKaSqdrxCyHrlNrHa7zIj/lzgMSqUrkpr9Nq8HB8P1lCOXEihgbiz7OUtKK4y1rFyFa9B4jqr0CKyOnw/ojl5xRToi216V2/y1iXGMR7/Z5LeMpSxp8Oq/au9cNEHT80I/wFiBcTsxsFvh5b64d8JynROKGTt+rZzsOYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr7OL8yPNaL5TrLID4oNgMxCjNkIO8tK0RAkzMUQ/ac=;
 b=bNNpnWxm+Fr2/aNSjM+g5GEyjcTa/WfI+/akQxPbDEXuzM3C8jspYc4x5IAo86FMVJWsSaxEY4M+5D8B98ZvN7LQrjcp9F8Cdm9hLMh9Tw4mLCrlByC+h2ej36z86T4D6Mn6swTwkySy3urMJUA8u+So3PcLIM5s6NNghFtpA5E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v6 2/4] x86/msi: rearrange read_pci_mem_bar slightly
Date: Fri, 8 Sep 2023 22:16:26 -0400
Message-ID: <20230909021647.558115-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230909021647.558115-1-stewart.hildebrand@amd.com>
References: <20230909021647.558115-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|CH2PR12MB4890:EE_
X-MS-Office365-Filtering-Correlation-Id: c00409e2-2501-4d1f-87e8-08dbb0db0f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hz30fb/QY26eYjOKPYE6QKUy641/gvXPkBKJ4W0YttMxCuB4xNkE00Ss3iTzvsTUuTFWfh/4L8v8wuZi+GdAUwBRE2f4Ny9VAoa5QrRVs0FwTE/WueIymmdAHc1TbdTqjnF1LdowEb6Ar2LljUiPUtGWEELmj6+pdh9ZbW3Fq5rsAZ9tbkIB0ud3fLUwIuwzI7x/RfccyGFovzMt3t8wVL7gtg83K/C8HDEJQlwOkkq+gLqAhgb3V6DknDHMOixGSqBrxC/bkKD7JTyxofmwnQl1DCxkpmX1rJsS2yVOCKASewixR+aRmDMtBS9RK4mGtwr5E4xbSMfTX3QAGLaHAgYowziBGNKzagFLAfrXQHpkMi48yQVtE1sVHQk4UQfeI5WwCAB2Z1+0M9BlsgT7LTjOu78UR38lI+9vSIRhFvZWOSQ22skEuqXZBH/oQyOC9jzHXl6xQo5vVOg8YSTINVkgxmcV/myye5uC1VSp0OdCXQxFZRJfliO7VDerm+HwzZQVsoc356qOa3tR3SaTGlsapBQz0gjNoWFY+cfs3uu6e+ln5HeCLMoyC/k07g+wjacncVa7K7/bXJDstqp4cV4Tut7lBXfmxNUQCPu4FFqHpAo6dG1SXNtNzxPSz/vC5NJ+SXFJXL8fWXrA9IMQH2RDXUx3z2lxabVpNwoKaJKPnDqYgCt98k1IdWxNMKvWwBOQzSLi7sn9nGre5efhiGh1KLKaIRntTBaZEg5pVab8nTere4ecbzy2eBkUj4fbiIq+gyB/Sm4s6bh4KYZVuw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(1800799009)(186009)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(70206006)(44832011)(5660300002)(8936002)(8676002)(4326008)(41300700001)(316002)(70586007)(6916009)(54906003)(478600001)(2906002)(966005)(26005)(2616005)(426003)(336012)(1076003)(47076005)(36860700001)(83380400001)(81166007)(356005)(82740400003)(40460700003)(86362001)(36756003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 02:18:30.6240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c00409e2-2501-4d1f-87e8-08dbb0db0f7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4890

Use pdev->sbdf instead of the PCI_SBDF macro in calls to pci_* functions
where appropriate. Move NULL check earlier.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v5->v6:
* no change

v4->v5:
* add Jan's R-b

v3->v4:
* new patch

Suggested-by tag added based on conversation at [1]

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg01886.html
---
 xen/arch/x86/msi.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 8d4fd43b10a6..a78367d7cf5d 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -674,19 +674,19 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
     {
         struct pci_dev *pdev = pci_get_pdev(NULL,
                                             PCI_SBDF(seg, bus, slot, func));
-        unsigned int pos = pci_find_ext_capability(PCI_SBDF(seg, bus, slot,
-                                                            func),
-                                                   PCI_EXT_CAP_ID_SRIOV);
-        uint16_t ctrl = pci_conf_read16(PCI_SBDF(seg, bus, slot, func),
-                                        pos + PCI_SRIOV_CTRL);
-        uint16_t num_vf = pci_conf_read16(PCI_SBDF(seg, bus, slot, func),
-                                          pos + PCI_SRIOV_NUM_VF);
-        uint16_t offset = pci_conf_read16(PCI_SBDF(seg, bus, slot, func),
-                                          pos + PCI_SRIOV_VF_OFFSET);
-        uint16_t stride = pci_conf_read16(PCI_SBDF(seg, bus, slot, func),
-                                          pos + PCI_SRIOV_VF_STRIDE);
-
-        if ( !pdev || !pos ||
+        unsigned int pos;
+        uint16_t ctrl, num_vf, offset, stride;
+
+        if ( !pdev )
+            return 0;
+
+        pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_SRIOV);
+        ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
+        num_vf = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_NUM_VF);
+        offset = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_OFFSET);
+        stride = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_VF_STRIDE);
+
+        if ( !pos ||
              !(ctrl & PCI_SRIOV_CTRL_VFE) ||
              !(ctrl & PCI_SRIOV_CTRL_MSE) ||
              !num_vf || !offset || (num_vf > 1 && !stride) ||
-- 
2.42.0


