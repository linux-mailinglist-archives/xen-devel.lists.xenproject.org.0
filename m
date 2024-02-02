Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98282847BA9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 22:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675232.1050552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Dk-0008L0-Jt; Fri, 02 Feb 2024 21:37:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675232.1050552; Fri, 02 Feb 2024 21:37:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Dk-0008Hh-Gi; Fri, 02 Feb 2024 21:37:12 +0000
Received: by outflank-mailman (input) for mailman id 675232;
 Fri, 02 Feb 2024 21:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rW1Di-0008HK-Ny
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 21:37:10 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36d2369e-c213-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 22:37:08 +0100 (CET)
Received: from DM6PR02CA0166.namprd02.prod.outlook.com (2603:10b6:5:332::33)
 by SA0PR12MB4352.namprd12.prod.outlook.com (2603:10b6:806:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.9; Fri, 2 Feb
 2024 21:37:04 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::8) by DM6PR02CA0166.outlook.office365.com
 (2603:10b6:5:332::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26 via Frontend
 Transport; Fri, 2 Feb 2024 21:37:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 21:37:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:37:03 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:37:02 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 2 Feb 2024 15:36:56 -0600
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
X-Inumbo-ID: 36d2369e-c213-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOwCokeJ+nAkYL5YQpg0yBcovVPhOFz8a3t2YyQCXNDgWZC+K+8Dr0k6eQU9WCr3yBFUlEgEJaHK9fLtMzw2de4XDyge8oc7GgqP58i6snvaHOmDZWakuAWHzVgkOzPuqQ64AeE3yJvKEDcEAtz2t5X0b9HLvyvonS/A3n0MfMiqPt9ERI2jdhtRrsBkh0vzjkHU8Ocz7DKJy0eJxkUKkSAWzGlLqxOuvLSD5l3iepdK+axqF4jLcD8LXWhwxJAyI170bi1OvbyFLwTGxkQK/1UZ8Yb5zdEHF7hcOj2LIKp2XFbeYSa7I2XeIPlC4ljktNDW4evQCOinuP/CpPLl9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GP/sADPnaw4TMrLkrvzS2aR+Na6StFaFDNxGi2x57hw=;
 b=DX6OsOgxQt9xx84rX1T8v1+ukzDYU5QSJ1OHkweUcF7y0I+SLELcJYvVnwYbsfCEMX2iZQfO+YnyJJr8fhkalCMcE4h7tLu8evOtddP6MwjGEFoCt/qIgYXm4rB/vjgALNj92KoZLFhUgDbraehnbWqANETDl2mMjMiYhWLSeJR4JCBRfdDvbR2xUHcnT9H96YEFpgYZA9yKaQ6V4of4FASD3FCNSknZVCVUO7HLgPELpBvsHNe7RZbWrXGy3c6v9UYwPqyzmjJuPlu8ikybEUGYSK+TTolkBx6Mj7hxMs3lK91gRYz8qq++qbgmyjyJBCQVKaRsGW5hqnGiIZ696A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GP/sADPnaw4TMrLkrvzS2aR+Na6StFaFDNxGi2x57hw=;
 b=VDB96vADUAr6Y/qYqTv3M41heMpZkBxJjyiMJe6yw1d4pF+GsdBS6jzBCPdpRBMj2iv73d3dMeE0CECizgPJ8uQXmCTsYx+SPdynt3NQKoYYreBOiiKM/QS67NovTfw/WkR0ddXTPYGLXHDCJqDcsBytB4URhT4JnIriW7ZqxlA=
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
Subject: [PATCH v13 14/14] arm/vpci: honor access size when returning an error
Date: Fri, 2 Feb 2024 16:33:18 -0500
Message-ID: <20240202213321.1920347-15-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|SA0PR12MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: c8852deb-b112-438c-dec6-08dc243718cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/g0GtkjSkbXxLposSJFD3xdRkY3vRTT0d+AqyCBY6ZRKFEEPkf1roKI9wPAaLM1jVIIFORc/gltpxNAzvC4PiCurY9foWBpR7FMmf58OEPxQPizzKi2tYScISHyeysPcPIvQOsfMMdgoV5LklvF84VvKlU36976RrxmnfqY0A1CNEwiy2O7OZBMCaac/hXMhdjwoPP0aA8rMrracOhiLWagWlETWLId5WSa1PjXF9y+OHc21RdLR9UBhT4n4yfRN4uI/DbHI7voAOLlEs6zQdC/ZNlbtfGQiZBDf9chIvT5JNfuAHMyNCFo0IuBFBs2WX9nrfvn968EnZGqSkVCAzY+v94XDjc7GxlEDm2I5KgFprrejhojINDWMd0wuMrKb7W/V0uwfGOVDFpdfrwi54F1ZjADSWF47KbVnvp4sTJ1mlVTczs0dMCLDSVizAKHG6C7wDu0rrmrtCIGE5vQ2ghrgwr4uqgtQKae1BsL+4900Cxzu/xMikSAyzFyk50RjEne+Qbs+/IE2v91VjExReM/OTpV3qyzx4mxzb/w/YHhbiC9/N6LBYcuhPrsREfrVvPJRyNTkSxlElDT6ur+Dr/l39OgcdRukXKz9jFUP4VXxkA5cbTV4bcCMgL61M0RJ//sXBoYKmkyf0b4BP4lm+YqawXq4q5lOpxejuRLpOo/MIvnoA+/yzPqfreVrU2SzPxkqWrm2EGWefDe18rEwr0n4CnD+dgiCREQz640Oba7mAmAELoGr0EdqGoLSf/LluUr97cfgCZHCVtORkH6YCA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(451199024)(82310400011)(186009)(64100799003)(1800799012)(36840700001)(40470700004)(46966006)(316002)(70206006)(2616005)(336012)(426003)(26005)(8936002)(41300700001)(36860700001)(6666004)(83380400001)(47076005)(1076003)(8676002)(4326008)(5660300002)(44832011)(2906002)(54906003)(478600001)(36756003)(70586007)(6916009)(86362001)(82740400003)(81166007)(356005)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:37:03.6554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8852deb-b112-438c-dec6-08dc243718cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4352

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
v9->10:
* New patch in v10.
---
 xen/arch/arm/vpci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 348ba0fbc860..aaf9d9120c3d 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -41,6 +41,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
 {
     struct pci_host_bridge *bridge = p;
     pci_sbdf_t sbdf;
+    const uint8_t access_size = (1 << info->dabt.size) * 8;
+    const uint64_t access_mask = GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
@@ -48,7 +50,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
 
     if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
     {
-        *r = ~0UL;
+        *r = access_mask;
         return 1;
     }
 
@@ -59,7 +61,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
         return 1;
     }
 
-    *r = ~0UL;
+    *r = access_mask;
 
     return 0;
 }
-- 
2.43.0


