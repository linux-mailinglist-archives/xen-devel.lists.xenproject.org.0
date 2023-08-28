Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F169C78B6F0
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 20:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591747.924234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qagYi-0001xL-HF; Mon, 28 Aug 2023 18:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591747.924234; Mon, 28 Aug 2023 18:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qagYi-0001uz-Dz; Mon, 28 Aug 2023 18:01:52 +0000
Received: by outflank-mailman (input) for mailman id 591747;
 Mon, 28 Aug 2023 18:01:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+nU3=EN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qagYg-0001uT-Ve
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 18:01:50 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e88::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5729655-45cc-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 20:01:50 +0200 (CEST)
Received: from SJ0PR03CA0335.namprd03.prod.outlook.com (2603:10b6:a03:39c::10)
 by DM6PR12MB4155.namprd12.prod.outlook.com (2603:10b6:5:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 18:01:46 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:a03:39c:cafe::6a) by SJ0PR03CA0335.outlook.office365.com
 (2603:10b6:a03:39c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35 via Frontend
 Transport; Mon, 28 Aug 2023 18:01:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Mon, 28 Aug 2023 18:01:44 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 13:01:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 11:01:06 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 28 Aug 2023 13:01:05 -0500
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
X-Inumbo-ID: f5729655-45cc-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cswSmCj94ODoAymZNCjeIu82UvSsOCUYdseO+IEQWsOVKlwnWT1aAQ9mCCzoPUCyWQdVwbHPswqHZUc1r0eHt6ANAsU5JMwA7+RJKdjQoSkaMoGxd9LeoG5DGK422DIzVbcZx4nlC0nr2q+42LBqpoa12JeiSj24fWmX1ukddhZNzl3zLieHsLH/ZWkoiuAYUtYAH+HeNnSnXmbqNLnAvQ2Kh6rNu7pI3A0mwQu7r69Gy6KzfNa/dMyJ7jr4gA89K+tCbO9nchig9qGy9XxewQ5q5FL8Sihgc2kAERPiCD056sDoOKCZDVvvus+zLvC8g762LCtLq1CoLx38WXc/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mS9rwZFaRU6LsAH3hSbs0rvFafQqmACIWYiLR7cPWEs=;
 b=fGB7XwSulEdwpU9PD0EXcag2Wyh7kDPlmb8wGZU3yg2lLVNJhx8HbrH8QzMJrg3az1LmlwcvRcSmEdz5BocKuQdb6TFEa6gDOavI1GPLA9sEQN1bce/e/2N/9SgL2L2KixTXplE53SmnTc9gQhwYIeQVWeTtvK0ePL6IpkqbEntDNWu93tq0MZpih6ZjvIdQYu9g00Ngq0J4318ThWe74hn9Y4akGzueSXmSiyNloMjnNvv0JLBh3fDrwb37l5w4GaWBFD7SZKT8S+LOwPYsaL9PQixWliEHHGYFAMjdpnuaUQLRW/cPwzCwANsoR6MRKnLmgztirvMfgxMX8VkCrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mS9rwZFaRU6LsAH3hSbs0rvFafQqmACIWYiLR7cPWEs=;
 b=SR0yJoPsVpQ2D1djm7+QaADbSgGxMQQQaSIFLKCbheTsxPXiYp3fhOjwv09cWAWbrHLQD8yUt3Ju6ohcCYwItN0P4KqqLsVnimzx/OjrVhx67NINtBx6lNl9G9Nhi57g0x/K3yCuKQPL194kiWEb9JpF57yLFV7Elqvuv/wHEoI=
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
Subject: [PATCH v4 3/6] x86/msi: rearrange read_pci_mem_bar slightly
Date: Mon, 28 Aug 2023 13:56:51 -0400
Message-ID: <20230828175858.30780-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230828175858.30780-1-stewart.hildebrand@amd.com>
References: <20230828175858.30780-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|DM6PR12MB4155:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a8ffa4-c099-48f2-7415-08dba7f0d76a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UXr7OgOp1pWq7aK9O7b4pmHuiGTftoINwb1NCkCFZv2alVpCcpQFTqsy0iLOimKGCQz6IDouEYB2KVeNo4YtIlgocurVo/E75Jujemy0g6GMKNmEyz+WdYdS4Nsa3WXbE733fv4qP6NGEzxkTGse4CSSHnIhUKr2J3Dum+g7B7Ru23/REzFBKoRJ/LS3Bx197MWgeRM5YhrSBmiVpV4ha463tOD+s+v6jWS5Qxo9KZhHf2hyMiuY60TFgN71V7YvbGyBqCMoLH1ap7FMRmiv9aVEFpu5/93aWPpcFVSdj31L8dlSQPJibg8cYs7Z2WEBbDmqVurpeTR87keFZNVV42+b8cUrJtBGy9iTMFLMxMqLhVENNZ67UtDUg7+QzmF8oHCn3dT4KJMdpnrW0MophsEP/eSgt8wB7Gqz5AipkdVxMi8SiiUoH4fcKSRhpqJUmY7e8F6Z0XaTjI8CYUb3NcejUrPwtz6xlAHn+rGadJO6uck4TtEjyEnbrwsibFjucKiSQF6WaKGyik3woOw7YMaDK4WtZWH/m2pYieehZYzpE26S33ol1pgaZf5SYObKyIeSwFD2kOnu/BOae7Jx8eDeJ5LyYabYELo86FVqDlheD9Y0BVVao4zykvhPu3yVfBSHopzIWIhspCQ3K9Ic5SHdc6c9k3cXCeQewWWnZUCOnal1AEQI5JNuM5EbcV+acPDqxQ2DRAv3qmW7Isb6pFNxfBZrlYo+1TjV1EWVS318akRK2ljOQaD20+ueGM5FSZxhvEWqlRtcNDTD9nOp4w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(82740400003)(6666004)(40460700003)(36756003)(86362001)(356005)(81166007)(40480700001)(36860700001)(47076005)(2616005)(1076003)(2906002)(426003)(336012)(26005)(83380400001)(966005)(478600001)(41300700001)(70586007)(70206006)(4326008)(8676002)(8936002)(5660300002)(44832011)(54906003)(6916009)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 18:01:44.9562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a8ffa4-c099-48f2-7415-08dba7f0d76a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4155

Use pdev->sbdf instead of the PCI_SBDF macro in calls to pci_* functions
where appropriate. Move NULL check earlier.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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


