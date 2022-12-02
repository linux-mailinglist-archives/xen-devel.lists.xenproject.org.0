Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CD663FE6B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 04:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451355.709133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wI4-0000zn-V1; Fri, 02 Dec 2022 03:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451355.709133; Fri, 02 Dec 2022 03:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wI4-0000rS-HH; Fri, 02 Dec 2022 03:00:40 +0000
Received: by outflank-mailman (input) for mailman id 451355;
 Fri, 02 Dec 2022 03:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP6A=4A=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p0wI2-000723-Ip
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 03:00:38 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e50126e-71ed-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 04:00:37 +0100 (CET)
Received: from DS7PR03CA0263.namprd03.prod.outlook.com (2603:10b6:5:3b3::28)
 by DM4PR12MB5327.namprd12.prod.outlook.com (2603:10b6:5:39e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 03:00:32 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::8e) by DS7PR03CA0263.outlook.office365.com
 (2603:10b6:5:3b3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Fri, 2 Dec 2022 03:00:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Fri, 2 Dec 2022 03:00:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:31 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 21:00:30 -0600
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
X-Inumbo-ID: 7e50126e-71ed-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0zz6MY3Q1Cw4W+FCd/VUs/ZCbvP+7gHi4wdd22YbbDkdbYRgRGWjWb6YovdTIFlYxT9YI0ZW46mqY1VvAjDmC421MmHsoc2Vw9fm0LnQHDG+nRcdkA5xyTPE4qNmDt8Jn/zMhvV/nOaG7cPd3jWL/xcKv9o4LVBeZPAOOaF83CIGJt/xxYJTKGtYBoCwmPMS9ArWyIV1XW7z1YxrY4W8dFbTTDP4imwSLGJ4jtgeTKyXCn2hlDYnq+1WPzemOaNK2MXfSxEd5P64VpQppXqCwYc6PKZQbgi3p1V5RM56zLk4MQ+MlurP7T8R+/r4KX8U8UADDrTkSS5da59DUf8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ir4hpyABHTTAHqZnYN0/rdlHtCJ7Zkk8QILmyHGJSSk=;
 b=JaHXg//MgviEX1YT2QLSxKrORPwAGShcO1DTWWtnq/j0DPMFUKeUYZqajt9MLS8aGEUwkKbGyWsgf57MNmgYZumPMhIDYzX3Dl0wZV4PSuGm1LoJHrDxrNr3rcq1ODydKMWHV1mnFhJ6pSBc83NRLyr0DVUXprE6BsSPSYVGSlaEgJlDv0BIdn5mUpp5OZnkoNsdo58YSSFx47S1ylmfgnUqUflnEPxSOCo3O6SN18nxQHYhSfdCxtNRmnph6Md7Ynv/rStS0GBMWyBkyB9OOU7P5iSM4Bf3oFJCSKr2DKdR2C8J4/RMUG7Ydyb6vHLTgD9iVDHEU1Em6dcrpEwTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ir4hpyABHTTAHqZnYN0/rdlHtCJ7Zkk8QILmyHGJSSk=;
 b=x47a8mVikxa/gWx4WbPFxsNoZPlMQ6d2MMxWL/jT/wP7A1ui6U5zb4xOS7EfmAjHHfv89cHVZf/WIVB9IKnVtMvFgI33xU/iYh91HmkjeF+GMNMosD/mFcGMwxHBtT8p2p0CzwkUbf8Q6btZHeXwx19HanuZX+9Vi+gP5NnomSs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-dev@xilinx.com>
CC: <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>,
	<xen-devel@lists.xenproject.org>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Thomas Huth
	<thuth@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
	<philmd@linaro.org>, "open list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [QEMU][PATCH v2 09/11] meson.build: do not set have_xen_pci_passthrough for aarch64 targets
Date: Thu, 1 Dec 2022 19:00:01 -0800
Message-ID: <20221202030003.11441-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221202030003.11441-1-vikram.garhwal@amd.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT064:EE_|DM4PR12MB5327:EE_
X-MS-Office365-Filtering-Correlation-Id: 2077c209-378e-4ebe-b33d-08dad411600f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hcntb+hQYDcJ60WCfKmSQHdKXS537gFJyjdmDDrYOMUVW9b8THn/4fQ62A3prRpWT0N1N3UB2Z0d39/pQU24zwIfDmNLo+D318CZTkPXmT7q/mjXcFAzDNIv2rcJO1Gr5IV6Zu6Y6PtwOU45jXbssz+IMU+1G+tvWrYIuUJkz140VpJeqgNjIwBbK8fI+1AKhe5ahBqyh//MluchU/sRex4QDtqzG0x5LuPllMYCfvmCNdfgfbeuGAwzYMrP0OfmUwHQrFp+1ghKxlbd9XLTVZwhEguRBC9nXtQgrADM9nw8qSoNUmOtGWY1MrCbF6DSqpf24IAWmyFsz5ykEn+MQfLRvyOzGsDuuaZksdXl2p63lwcVTsYH1WsXJO4dHqNOLUg9Joy8fmmioCW3B6qYShzqm8aJlfRdq10YtBf3X3DskefLCGXYaFBseaduwnD4ZFq9x2uEpiHm+8kNog8FcPwlQvJeHRmZSDto8HFiUvb8p2tEo4/D9HocXzXglFpBsLfmJbnZYXdYrI09gES5qRU6f6EViWzOJB0K/bxzOWtwD5A9wR5DJG/8ReSENmApos6D6cgPD2vk5KSf7TP4QwdgU0pN5o37JXQ9bhXGYanxQQ+NNAHHgyrxYuc+qceLVlDF+lZna+gg9KGQO6GKkKnzYa4epgBu6OxW5cCPcAdlakw2YlXwPngqWP4nXqyfluhlC38aewxYBG/qLjHkmyWYGl8AobLGZImQbINt+YE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(46966006)(40470700004)(36840700001)(44832011)(4326008)(8676002)(4744005)(41300700001)(5660300002)(70586007)(70206006)(316002)(2906002)(6862004)(8936002)(54906003)(478600001)(36756003)(26005)(2616005)(6666004)(426003)(336012)(1076003)(186003)(83380400001)(82310400005)(40460700003)(36860700001)(47076005)(40480700001)(81166007)(356005)(86362001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 03:00:31.6739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2077c209-378e-4ebe-b33d-08dad411600f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5327

From: Stefano Stabellini <stefano.stabellini@amd.com>

have_xen_pci_passthrough is only used for Xen x86 VMs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 5c6b5a1c75..81d36420f0 100644
--- a/meson.build
+++ b/meson.build
@@ -1469,6 +1469,8 @@ have_xen_pci_passthrough = get_option('xen_pci_passthrough') \
            error_message: 'Xen PCI passthrough requested but Xen not enabled') \
   .require(targetos == 'linux',
            error_message: 'Xen PCI passthrough not available on this platform') \
+  .require(cpu == 'x86'  or cpu == 'x86_64',
+           error_message: 'Xen PCI passthrough not available on this platform') \
   .allowed()
 
 
-- 
2.17.0


