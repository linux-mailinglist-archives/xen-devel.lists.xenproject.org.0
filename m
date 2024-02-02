Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F6B847B92
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 22:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675210.1050493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1B3-0004et-JT; Fri, 02 Feb 2024 21:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675210.1050493; Fri, 02 Feb 2024 21:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1B3-0004c4-G1; Fri, 02 Feb 2024 21:34:25 +0000
Received: by outflank-mailman (input) for mailman id 675210;
 Fri, 02 Feb 2024 21:34:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rW1B2-0003tJ-ND
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 21:34:24 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d46e9809-c212-11ee-8a45-1f161083a0e0;
 Fri, 02 Feb 2024 22:34:24 +0100 (CET)
Received: from CY5PR15CA0096.namprd15.prod.outlook.com (2603:10b6:930:7::11)
 by IA0PR12MB8304.namprd12.prod.outlook.com (2603:10b6:208:3dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Fri, 2 Feb
 2024 21:34:18 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:930:7:cafe::28) by CY5PR15CA0096.outlook.office365.com
 (2603:10b6:930:7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30 via Frontend
 Transport; Fri, 2 Feb 2024 21:34:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.79) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 21:34:17 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:34:17 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 2 Feb
 2024 13:34:17 -0800
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 2 Feb 2024 15:34:16 -0600
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
X-Inumbo-ID: d46e9809-c212-11ee-8a45-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQwFfosgWnZmhUB4LiYM9HAJhM8YvsX3Mw1YVghC3BjWiiE+ZjV0U994eZpHu8MNQ0bOjWAOEjIr2vHoHJIvRQosxAOw2EqMH/XmyWihGNFxyTClFBjg0336ODgJQcQSnVq0LlCFehh8eFP34boG7pyWph72At6gNd0wiJtTe+S6FCrvw471TZMXGl0KFeTyivpQy2JPDuvaII04YnT/FLnHVkYz9vFI3VBhiht/RhynpvhYc15zHpbMp0D9nkzZKqJz+rnxdm/bmQhmR3b9CiwnLhVBaWmqx+pMXdtN+rwh62jCZL0PCqWjF8ChpTh5mWR6Dv77f3nT8N9Z35qzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibej2hdMvib6q8x4h3ru+hAP1vQUr+0gj5LhSbls42E=;
 b=W7AJGwzqrgRZNT17JmXWlx59PI/xEd1a5BHIYD3Ad1AKx0V/0eKJeASCMPCYZfuonu9kVGrbXvjRZX8hhXbdBlhlhwBKU3m2dWYMZW2GHkxIUvVrmRM2acAYPWg2VhkwAbGqkhwYdmza6ZGWxl4+/cLDRqMRdSUhIc9hYUyXtniHeBhMchcjwnHnbUwRK60Shw/bNb+ocSqY7D0Nvkz6XjoZOxZjZTqWUkHxbVru2qZKRXzNcsS07X9hxeDjHC5yurb/8NosWd91oXcWrVOB64atbi4l9lXwreyUOteEeZ9XCgWNSja12ZJdFOi/EN6I3dVIHzGYeErfIfTvBt8C/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibej2hdMvib6q8x4h3ru+hAP1vQUr+0gj5LhSbls42E=;
 b=FT3C3ykmAW7vPaoEfBIJ0CkrBY25zzz4/W060pUvLi0IJ3gmLSv0U7yCFx32eVfipDcrf+3+qN6GobFeQa/EOzDq8X0GlLjtvXZZe15CKUHxxpEfx/djCG7slRuOGAXPxBMQ8sjR9uX0eePUYcUIF9ss0z/1h80eCRdj2i3F6ok=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Volodymyr
 Babchuk" <volodymyr_babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v13 02/14] vpci: restrict unhandled read/write operations for guests
Date: Fri, 2 Feb 2024 16:33:06 -0500
Message-ID: <20240202213321.1920347-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|IA0PR12MB8304:EE_
X-MS-Office365-Filtering-Correlation-Id: a9963615-368f-4bb0-0a57-08dc2436b5f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JR3gm5O71QtrN9EeQJHiO2C4BzhNccb4XfG+9JqNRjBuUxXH92Tzf0r46OC/hIM8X2TgNzv/7HTWNJyysF1K5fZLTt15EB1UOEtqnLciihyZebkELEb3cHCvK8F9RNxa00fd9Iv0Zs1aBhv7MiJUEWFpNrx7x4Q7EUmllF0gJTPkYtoB2bWVyWBSY0B9KUyzu9c6m9J74MwSXcCL/Lsb7Z48qUxCcvjxLJvbdMiMZ/8US38PBVd2O5Y3+O5zmOAS9zLOHGTZFe/aGgYLe3py7SOnhIjA6g1QMOrj3kxSA93gJQSz0M/vSBVjkGJFZReaQ1XrlOonvIzxwj34H/+irm7rWoetnzlaUDRgrv2qckuOYu9WiS0z9jN4eWSGR0g8lB1KxIS3jVUgnJxhiUOUo+qiMobPr/gJ8JrhmBiTNSnpnaRKdbZNC7sWiZdhPnudzed1A5rkgj/GtOy0MGMZPXzwa38/YpP1VPC1hwwtuO7KshK/sB1fADqJxFTfl/X2Fbmn0AbcDobXYqNkTScGR+deBLTiMZPvXkRlvIptuPIHTcraKS/WZNVEgXFlXX3E2HgMJXyjxVjkORzzx1fUGSQmyr7SFSvV80nXe2n8niGI4kwoRvT1KEnZzUnOVD3LeorsT/thDOGRP7buvZVb630t42otaUxzp+iZ1Gz8foIQzWbu6rpBiOUx0oJNVEzMUtc5WfGnZi9hB1pd4xp5OLbk1WkF52uLnw2zSGEEOjN6LFzsA9QSlF0KkJS46Gu7ysroVT72woTQVGpdow/fSA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(186009)(82310400011)(64100799003)(1800799012)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(83380400001)(41300700001)(86362001)(36756003)(26005)(36860700001)(426003)(356005)(81166007)(54906003)(6916009)(336012)(2616005)(1076003)(70586007)(47076005)(44832011)(2906002)(5660300002)(8676002)(4326008)(6666004)(316002)(82740400003)(70206006)(478600001)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:34:17.8661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9963615-368f-4bb0-0a57-08dc2436b5f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8304

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

A guest would be able to read and write those registers which are not
emulated and have no respective vPCI handlers, so it will be possible
for it to access the hardware directly.
In order to prevent a guest from reads and writes from/to the unhandled
registers make sure only hardware domain can access the hardware directly
and restrict guests from doing so.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Since v9:
- removed stray formatting change
- added Roger's R-b tag
Since v6:
- do not use is_hwdom parameter for vpci_{read|write}_hw and use
  current->domain internally
- update commit message
New in v6
---
 xen/drivers/vpci/vpci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 475272b173f3..d545dc633c40 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -268,6 +268,10 @@ static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
 {
     uint32_t data;
 
+    /* Guest domains are not allowed to read real hardware. */
+    if ( !is_hardware_domain(current->domain) )
+        return ~(uint32_t)0;
+
     switch ( size )
     {
     case 4:
@@ -311,6 +315,10 @@ static uint32_t vpci_read_hw(pci_sbdf_t sbdf, unsigned int reg,
 static void vpci_write_hw(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
                           uint32_t data)
 {
+    /* Guest domains are not allowed to write real hardware. */
+    if ( !is_hardware_domain(current->domain) )
+        return;
+
     switch ( size )
     {
     case 4:
-- 
2.43.0


