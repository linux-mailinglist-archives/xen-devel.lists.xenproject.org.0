Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB5078160A
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586692.917956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9q7-0002IV-TP; Sat, 19 Aug 2023 00:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586692.917956; Sat, 19 Aug 2023 00:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9q7-0002FJ-Pg; Sat, 19 Aug 2023 00:29:15 +0000
Received: by outflank-mailman (input) for mailman id 586692;
 Sat, 19 Aug 2023 00:29:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9q5-0001Sg-KH
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [2a01:111:f400:fe59::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bc1467d-3e27-11ee-877e-cb3800f73035;
 Sat, 19 Aug 2023 02:29:12 +0200 (CEST)
Received: from MW4PR02CA0007.namprd02.prod.outlook.com (2603:10b6:303:16d::33)
 by SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.32; Sat, 19 Aug
 2023 00:29:09 +0000
Received: from CO1PEPF000042A9.namprd03.prod.outlook.com
 (2603:10b6:303:16d:cafe::dc) by MW4PR02CA0007.outlook.office365.com
 (2603:10b6:303:16d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A9.mail.protection.outlook.com (10.167.243.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:08 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 17:29:07 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:06 -0500
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
X-Inumbo-ID: 6bc1467d-3e27-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnjeytWEKyFd+PwiRGnRe6EGCdDdQOIBb1zBP29dTVdp+SralL2Q4JMQFEn2WTjhCQtn643b6NiNbpoGa+yPz2DNkoioCpg6zPuEptmsG5867Wy9kUufs4lfTQkKIw0hn4UhRkVbbq5dNB0LmOpAhuknuaxlv1Rnrad8OD39bDHRZ5S/J1ljpdRaowlCHEEX7oZ6xb42Z2b8Qr5+FGWbff05R7etocsVjRXN6rnecSWYqwWqdi4KSStuovM5OihN9eoRDcWesbvLcHFo7IrcoAmrk9wXkq9Dj88Srr2mVcdnt55vKUrqHsKjUCO+KiaIOtjRuXO7pGQ4p+Hmio1wwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGVNShdnG/aIBZ1qd0+shXMehlt+J631oNOuesBuA1Q=;
 b=IwjXKyi/p3ag7jr5wZtlZ+EvNLXBwZ6NpqtrOl0HlzuGD8nNHVRafGa2alTYiwslpCdsYZLzsQaMlZcoHMclq+ACwJG5BLzWhUtiIjNwLz9C4svWGwGDfzXKAf5wPw1IJWxA4mjFfd1ZrgKUiAuGiGzG+w9iiBW3vE8RX6tTcdxeVMSUivUHf9TH+UFX2VKRMtnesi5n5LcdJP6DmtxvoIf7sePOVjCrMH3oMQuVb2woxRUHlrj2bocgVF8Y6dJ/z3O/4QoidIqkKTIEY3/+9FXJP+3ZJfkel3LTIdjX6zRAAooeqQ/PnTq0xEsE5m6jAifrbBba9TDtHE50Kik2bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGVNShdnG/aIBZ1qd0+shXMehlt+J631oNOuesBuA1Q=;
 b=UattoSG+/s7577osdE4o1mqWCfBNGwa4X0ATAvRYt+s2eBf/TnceoY3D4RbFB0kp4g652bQ+ek1ehpFEm9/5PlWiPAJpurqT5OtovChWmv7cV3ImjOP4bmYpzPWeRYcJL4SukyeHRnpy/eAng74RjdXvReJz1mASSX7uwvwiBd8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Henry Wang
	<Henry.Wang@arm.com>, Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v9 05/19] xen/arm: Add CONFIG_OVERLAY_DTB
Date: Fri, 18 Aug 2023 17:28:36 -0700
Message-ID: <20230819002850.32349-6-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A9:EE_|SN7PR12MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: d29bd4cd-122b-49a9-ffce-08dba04b4d6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AhbbfRwO6DDmxp0sSfGgGtcD7T13dqnsFrqGdos40/OmFB5mru4ccTl8lFizqlpdvffacl1DB2QvvCu/d8LHBYxKhx0SK5Vbv5qU3ngL3yp+1md97eXWj4UdcYRaMmUxdEuX0j3yDdRvHv6dWBTa5okILkAsE/3ggiwtnh3Y6EGXV4aqGsbBjLZQocfiGS5zNLJtcVvVSc5tbg9d+dTwLWRfuDk/IlqsN0mVNb8v9Rr3aH0oyR2w9EVccIWK0+Kk5EiXo3nOMtgl5pGO1hw1cFQQsF3oHImfm7oUZNEwSm2rMNWD0/aKDPnoytMMruKZmH+DeCJYCr2EhZEiA+rGPyDt9H7h3xQw8vBKp7S88iX74IClf5n+JAEsqhE+JDOS2Tb9sKRYsqaCNlvvIbDdmAXjg7IYRnvMtf7GU6nRv/bCFR7fNKvbTFDeLgtiMMAOHZWuuzxtRqcrCuMyFOutT72AxqvCB0a0qBRxumCrMSnEtCn6tI6oXVRoW0TjWS6i6+pkutJsrZKvTR1JhvkyH/3I8Ask1EsejwkqNP7TTyhsrP7gZ4M6ocvnmL/1euy7yBYdv1yG2xr+T6wTiLsK2cmgZDmsojZEs36o6eAC8DjfcKpAbDsLsyWWhDLDlA2TP5tAkiH6pokmUTiH/13xYAoXPedIU2tBMy2QDOtAHtFucgzGuDiEEvL41uW0X8tv98ychHN9+AryQuSNNrVgq0of1nwQufrKcB7DirQKoDXySStp7lKT0lIfRs2MXvKxc743taVC31dtQMKZNk2m3Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(186009)(82310400011)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(36756003)(86362001)(83380400001)(40460700003)(40480700001)(4001150100001)(1076003)(8676002)(26005)(5660300002)(4326008)(44832011)(8936002)(36860700001)(41300700001)(6666004)(2616005)(336012)(2906002)(47076005)(426003)(81166007)(316002)(7416002)(356005)(82740400003)(478600001)(54906003)(6916009)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:08.3696
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d29bd4cd-122b-49a9-ffce-08dba04b4d6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958

Introduce a config option where the user can enable support for adding/removing
device tree nodes using a device tree binary overlay.

Update SUPPORT.md and CHANGELOG.md to state the Device Tree Overlays support for
Arm.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

---
Changes from v7:
    Add this feature as "experimental support" in CHANGELOG.md
---
---
 CHANGELOG.md         | 3 ++-
 SUPPORT.md           | 6 ++++++
 xen/arch/arm/Kconfig | 5 +++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7d7e0590f8..47098dbfca 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -24,7 +24,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - xl/libxl can customize SMBIOS strings for HVM guests.
  - Add support for AVX512-FP16 on x86.
  - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
-
+ - On Arm, experimental support for dynamic addition/removal of Xen device tree
+   nodes using a device tree overlay binary(.dtbo).
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
diff --git a/SUPPORT.md b/SUPPORT.md
index 35a6249e03..8eb006565c 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -844,6 +844,12 @@ No support for QEMU backends in a 16K or 64K domain.
 
     Status: Supported
 
+### Device Tree Overlays
+
+Add/Remove device tree nodes using a device tree overlay binary(.dtbo).
+
+    Status, ARM: Experimental
+
 ### ARM: Guest ACPI support
 
     Status: Supported
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index fd57a82dd2..02c4796438 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -92,6 +92,11 @@ config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
         depends on GICV3 && !NEW_VGIC && !ARM_32
 
+config OVERLAY_DTB
+	bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
+	help
+	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
+
 config HVM
         def_bool y
 
-- 
2.17.1


