Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C5C78B6DF
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 20:00:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591733.924215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qagXC-0000eC-Pd; Mon, 28 Aug 2023 18:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591733.924215; Mon, 28 Aug 2023 18:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qagXC-0000ak-Lh; Mon, 28 Aug 2023 18:00:18 +0000
Received: by outflank-mailman (input) for mailman id 591733;
 Mon, 28 Aug 2023 18:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+nU3=EN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qagXB-0007dz-0K
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 18:00:17 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcf25ff3-45cc-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 20:00:15 +0200 (CEST)
Received: from CY5PR15CA0241.namprd15.prod.outlook.com (2603:10b6:930:66::10)
 by MW3PR12MB4457.namprd12.prod.outlook.com (2603:10b6:303:2e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 18:00:10 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:930:66:cafe::49) by CY5PR15CA0241.outlook.office365.com
 (2603:10b6:930:66::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35 via Frontend
 Transport; Mon, 28 Aug 2023 18:00:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Mon, 28 Aug 2023 18:00:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 13:00:09 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 28 Aug 2023 13:00:08 -0500
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
X-Inumbo-ID: bcf25ff3-45cc-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dL83EREyZlZA0NnDMtxy0VKkA223uxkJeHLSLaxHwN6J3h7y8jcbvmYx0g3jaivSd9qqNdSinrc2mq5pG8IF9A/T9sW698PcWUADof6Cl80wiIvI13Kftko5IigqCsKFuwSKV6eyTM7MJNthTAYC4L1tr7OYvIQvYEdk9wfpWAzdpZ5OyJMudvc3AQgV1rDXU1j/4usz+V2Amw/MlpjP3GVm2HZK7/FqyF1f1n5G5zKrfp6/PK9q+bYRDZpiR6MdD4o4y9jtalNJBOBm9DZZvoidnKsI7mhFs3j5gMRv1Nxg8z4UsaanR4aRSxkHIlpTc/lb+Pd1fCT2ioAoJfCVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSugDH+jgmJ2t21KwpZdRqjLqY8PIhOuQoVgJ7q4wiw=;
 b=eqEL7xDbTup4CV04/svym4epFIhstRM4dJDGQ4E3qXsnHfct18PpRajKMBaVKszqHn+mnZa6+TkS+pSC0CaT/708Zs3Yr+1ZfF84ioAe5LN1TDNuaOIMD1d8eGeaQBiyAEe1T1qgJbYZydmxbn/3RHZK257B6SbXYLy0LKRbPUke37IXeBHWCC62nfg6neqjaORLSymg2XTKMOaQxEFIw10s+i8HmhSo+hmUcx3ZP6U0xdIFSmiAHprwjaxX9Blc7cgFGYMKOqud0qaUIaeUVPHt4gRQYbkC5DDapnxaNeXjnpNmqd5PmSg89FljcPjKIPPftBY1E3mgavaEa8YChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSugDH+jgmJ2t21KwpZdRqjLqY8PIhOuQoVgJ7q4wiw=;
 b=3FurlRBFbT6833ICek4NBadPmyU1HvNs8xTBNw4UKNoES3ysphnKyQqPWT2JQrM2wUtzcJH/2XQqvsHuUDzEMDUUE1XIX7NCajgRa//g2xS30NBLT1ZvEWcaBgrOrkpBaQBgFNJKPBE5YWG8TaIeU5hL7hkLRy13jeU0GfFoN34=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v4 1/6] x86/msi: remove some unused-but-set-variables
Date: Mon, 28 Aug 2023 13:56:49 -0400
Message-ID: <20230828175858.30780-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230828175858.30780-1-stewart.hildebrand@amd.com>
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|MW3PR12MB4457:EE_
X-MS-Office365-Filtering-Correlation-Id: ddca4f7b-1661-4d2d-1401-08dba7f09eae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	828WXKOQBMzXPvy9XyFmSEHxGUT1CCmc8yWfwYHIsFMkV/yRjFXK440QK6M8kpn5yZPnG/rSEe44ZgZOt9vnshKDOq9kA9VzxJDRv9H2Tu1QU8Yk1MXNkF8oFJIuaY0GdKhaZtbS2dV5AUUqpJSjx5jN/zYkvyUyFnuHuHCN5KEDUJ/qJRpHXpDRMaDkpdzUm1kN6PrdDEuRCW/ryHKj83fdglw9SydbvH/zekTOja+mPJv3zejcLnDrhZYeLyLO8L22v8KK6pAaxTLEaL1S+9XdzfDeXzlLzh3ar+IiPib/TWQjTc4XRC+kq0A3cEVFzODDdc9aTxxfj68IFShl5FLy+QJiGKo6dla3fGnMVRuTHYKs8Pn00EBdpnMu55WAtghjkJMwYZowk2PZW7s5ufpoBytQnYR/TdTc4r/QoepiJWwupK4DuBN1umrQgDFFdoOx7MeQAUEdg4A4qk08VeMbsedxGa+DlRWLn2SDaAJnGR6unlXTsNAh9863M4r8jSSXoEK+GmCDv0CRjfle5WMzRc53tii5y77WN0As599gaY2/mAyQUkPN8emyKQEy5BLb0vG3MhLsCulUbxGFxkKUrHC7wbxsIuoi0eD/vdEA1AHXcjtSDQYNa98e+v+63HfmVwyur7it1qMaYyN8EdLByZdI7R6a3rK5+pWDmWUdQNq3Pjj77VkhFrim+slsjzkZHQktMU2bD5d4pRUwdXWy97EH3ILRth21IIVx2/4AcyL4a3nE+2FeSrES+EnFU070XuR962t7MFoXGFK93g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(82740400003)(6666004)(40460700003)(36756003)(86362001)(356005)(81166007)(40480700001)(36860700001)(47076005)(2616005)(1076003)(2906002)(426003)(336012)(26005)(83380400001)(478600001)(41300700001)(70586007)(70206006)(4326008)(8676002)(8936002)(5660300002)(44832011)(54906003)(6916009)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 18:00:09.8161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddca4f7b-1661-4d2d-1401-08dba7f09eae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4457

These were left over after a previous pci_sbdf_t conversion.

Fixes: 0c38c61aad21 ("pci: switch pci_conf_write32 to use pci_sbdf_t")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* new patch: this change was split from
  ("xen/pci: convert pci_find_*cap* to pci_sbdf_t")

Found by building with EXTRA_CFLAGS_XEN_CORE="-Wunused-but-set-variable"

arch/x86/msi.c: In function ‘msi_set_mask_bit’:
arch/x86/msi.c:322:19: warning: variable ‘func’ set but not used [-Wunused-but-set-variable]
  322 |     u8 bus, slot, func;
      |                   ^~~~
arch/x86/msi.c:322:13: warning: variable ‘slot’ set but not used [-Wunused-but-set-variable]
  322 |     u8 bus, slot, func;
      |             ^~~~
arch/x86/msi.c:322:8: warning: variable ‘bus’ set but not used [-Wunused-but-set-variable]
  322 |     u8 bus, slot, func;
      |        ^~~
arch/x86/msi.c:321:9: warning: variable ‘seg’ set but not used [-Wunused-but-set-variable]
  321 |     u16 seg, control;
      |         ^~~
---
 xen/arch/x86/msi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index d0bf63df1def..41b82f3e87cb 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -318,17 +318,12 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
 {
     struct msi_desc *entry = desc->msi_desc;
     struct pci_dev *pdev;
-    u16 seg, control;
-    u8 bus, slot, func;
+    uint16_t control;
     bool flag = host || guest, maskall;
 
     ASSERT(spin_is_locked(&desc->lock));
     BUG_ON(!entry || !entry->dev);
     pdev = entry->dev;
-    seg = pdev->seg;
-    bus = pdev->bus;
-    slot = PCI_SLOT(pdev->devfn);
-    func = PCI_FUNC(pdev->devfn);
     switch ( entry->msi_attrib.type )
     {
     case PCI_CAP_ID_MSI:
-- 
2.42.0


