Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D73828F55
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 22:55:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665053.1035284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK4E-0004oa-U5; Tue, 09 Jan 2024 21:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665053.1035284; Tue, 09 Jan 2024 21:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNK4E-0004mO-Pv; Tue, 09 Jan 2024 21:55:26 +0000
Received: by outflank-mailman (input) for mailman id 665053;
 Tue, 09 Jan 2024 21:55:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ONpl=IT=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rNK4D-0003ql-7E
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 21:55:25 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9adeb7b-af39-11ee-9b0f-b553b5be7939;
 Tue, 09 Jan 2024 22:55:23 +0100 (CET)
Received: from SJ0PR03CA0195.namprd03.prod.outlook.com (2603:10b6:a03:2ef::20)
 by CH2PR12MB4326.namprd12.prod.outlook.com (2603:10b6:610:af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Tue, 9 Jan
 2024 21:55:20 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::ce) by SJ0PR03CA0195.outlook.office365.com
 (2603:10b6:a03:2ef::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.25 via Frontend
 Transport; Tue, 9 Jan 2024 21:55:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 21:55:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 9 Jan
 2024 15:55:19 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 9 Jan 2024 15:55:13 -0600
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
X-Inumbo-ID: c9adeb7b-af39-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bd5HjMCqvBekugTEjrpyaS6ANo2q8gssnhqrzxYZxmFlWRCEHJBc7FfqAoGQouZS+8YGbe+udzCB/Efj80Z5XWap3xN8eswlPxV7YQL79HOMTIdcyVSDBRKifs3Ru9sbNJlipjqqsbeP4ZfVAN3X6MW6d+1ams1yTYyxDEWmDiyvSV8hkW4e8nbYFgm3uongglvJmqInL66P8ukH1nZgn/DrO3eZzI5/vo/VqG0zRtd4MjISlnTjOIdljmzhb7ih0G/0DQ2x9pA6D75MXK9OGfvi33Bm53o0E3Rx4PjDegjdMO5FRoEKFqh4WG7xU/6QS0GxCMrCodnu9+WEJ90CbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMvnpYtMsr+XyhV7s4jn4yVI4a71Jl58SaqRvfzmz4E=;
 b=hRWeCL1gZ0UXku6fhKw/+XUNShm+4f7ma7DxypjnuBXoOCeMc1yLMu+73qcWlXRYyPWU6l0QPmUyjhki4fWnBg/DiUsGrHTjd7CojEotcuu4a0onAZS3+spp7hY/6VZPK9UBHLxtS0vcpjRr2UYcw4ktmVtN5x53qkRquOl3JS1Hgf2+e7NFM0UapX+zFv4tFKe3VwZrwSGcR6z+vHnwfqHV/tTm6PQbdeuNYf/vli5eETPi2C8HScSi9JWWq98FWkiCRUbiKMxmWJFUUO8nemOPATiBt/TBD1mZCEWQ2NbHwDzG9I0RYMjh9uNHFaI5SvPg8fpiVnkiDuLDlnO26w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMvnpYtMsr+XyhV7s4jn4yVI4a71Jl58SaqRvfzmz4E=;
 b=v5XnFYjeP+bT2ni0jm4sbqjzfwhLRYm5aIZr4KP4XhlfsLhqil6i9mneoy+QTHl8IMhMrim9qMg0ojSvHgBsagQxPJE+wgoN0O177rCxNJ2gkLWbRi/indb0PBFCIXXSVnlBxlZ2awPIbgEcOswAoehtutY7b9fOYkbGpqQZzyY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v12 15/15] arm/vpci: honor access size when returning an error
Date: Tue, 9 Jan 2024 16:51:30 -0500
Message-ID: <20240109215145.430207-16-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240109215145.430207-1-stewart.hildebrand@amd.com>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|CH2PR12MB4326:EE_
X-MS-Office365-Filtering-Correlation-Id: c3589657-cb2f-479a-79fd-08dc115daca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uTbryQmsQTZ2QgQasnldQSiBljJxmtfvG+q11RceWgGOjMTONsZZ39mm3ZL7uxXO8A319HprVvDtYB34R6Bgcg1f0YcFTBs+p+RCuVKfHuZ/hvBFOeIPv4pdKQqkvNdiv4OuSBqsoz3+DoQs+Sg91cRMOTw+K1P6XbFt5GENXbt53QEdLOyvl8SYYqnTgORiPqW9MJqbm9gq1+cs8k/z//ufVtB96icdJ2VWQRVqDJyOpE2OR9kih5NQuC4CEAOObZ2ivvncVbrH6kJ2KiAgsRWKC64Iluwr8Fo5ozPfWq0G2blQuWW8/6Ohj2d3uQlKnMRd4hievrFVmn593sdcfz0fgdkWiy8sOPdelXDujBUiVwdxans2a5iY+A+jnWiR+qf/P4GUmq8XKptYj/c599vIShHBWR05YiKWF8kj0bvq5ftYvDODJN23vC58RCiASx6fB05q5wrDZ5sA4W3xv1gJWnXopreocob4nXfXyzjKVVml2lMukWW2DpVqy+ozMZ2up3G8H100VPocofpu1Arb1X33lS1TgmnWMeZe++9gKdRuwSzvqGEUDF/eF7vO0TtvqlXvtD//8HLGICJGkF7IzNa9KrBpQ1oFNdM4VwbkQeODAVgTbsxbYN8g4t3nuBSUOxfrL+itVE8WkCVmMsaIw/oK0kFPDSJgwLxgeOwz/QhJBohbdZ0rK2GOZmfbBtgLFM3OweVo7Kk2dbu/EP2SHmFO4USPeYl1RtKY6CZWxm+4L5kBpTYcTjf9sY3NnKXizJEc7I1RQEa5cBbqVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(40470700004)(46966006)(36840700001)(36860700001)(6666004)(5660300002)(478600001)(70206006)(2616005)(86362001)(41300700001)(8676002)(8936002)(54906003)(426003)(70586007)(316002)(6916009)(47076005)(82740400003)(83380400001)(1076003)(26005)(336012)(81166007)(356005)(4326008)(36756003)(44832011)(40480700001)(2906002)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 21:55:20.4674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3589657-cb2f-479a-79fd-08dc115daca5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326

From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

Guest can try to read config space using different access sizes: 8,
16, 32, 64 bits. We need to take this into account when we are
returning an error back to MMIO handler, otherwise it is possible to
provide more data than requested: i.e. guest issues LDRB instruction
to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
register.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/arm/vpci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index b6ef440f17b0..05a479096ef7 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -42,6 +42,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
 {
     struct pci_host_bridge *bridge = p;
     pci_sbdf_t sbdf;
+    const uint8_t access_size = (1 << info->dabt.size) * 8;
+    const uint64_t access_mask = GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
@@ -49,7 +51,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
 
     if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
     {
-        *r = ~0UL;
+        *r = access_mask;
         return 1;
     }
 
@@ -60,7 +62,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
         return 1;
     }
 
-    *r = ~0UL;
+    *r = access_mask;
 
     return 0;
 }
-- 
2.43.0


