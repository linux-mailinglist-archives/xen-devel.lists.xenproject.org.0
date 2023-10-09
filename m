Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355837BEB28
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 22:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614476.955579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpwTJ-0007Cr-Vv; Mon, 09 Oct 2023 20:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614476.955579; Mon, 09 Oct 2023 20:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpwTJ-0007AO-Sa; Mon, 09 Oct 2023 20:03:21 +0000
Received: by outflank-mailman (input) for mailman id 614476;
 Mon, 09 Oct 2023 20:03:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjZ2=FX=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qpwPP-0003BY-Hf
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 19:59:19 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54d874eb-66de-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 21:59:18 +0200 (CEST)
Received: from BLAPR03CA0165.namprd03.prod.outlook.com (2603:10b6:208:32f::9)
 by MW6PR12MB8957.namprd12.prod.outlook.com (2603:10b6:303:23a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 19:59:15 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::82) by BLAPR03CA0165.outlook.office365.com
 (2603:10b6:208:32f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37 via Frontend
 Transport; Mon, 9 Oct 2023 19:59:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 19:59:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:59:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 14:59:12 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 9 Oct 2023 14:59:11 -0500
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
X-Inumbo-ID: 54d874eb-66de-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/anAwwkZngEKRyIF/ZqHr+NR4hGb1WJK3OIlbi47P5FNBT3ulYSRSnhM7/Uue0pFhQfvhTK53Yu5mQGcNOO/zBbjBJ+nvarCTHN0At7SgJtpz23igClfI+P5hSOuL9qr+fJdSqa2ERCiAMxrkGkC1gCKpPLcRagA/BtM967yonuGW3TWiuxVGAlSmyNhUJkQGY8Xg0OEroXjl0zBmA+dk2KkEzh8QBqshqCii67qPD6aVQ5thoxD5gR0qhH5vGVBjNrCbyY2YMjLT1+yVfCZ/dUomSazhgCiykixcpS8anMCKqJEbV9xpqvBWkHW5IxWNsLBTK0Jo9Cj/rQL9YiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Wqj1m40g3xzBzCIIdI1/Tnlmb7S3hlwdRDoDUE9rvM=;
 b=noUmLRDL6YMkUym/bT304o3W78Ibf9CGAwzkbM2nYzXRRgxPtgNGb/zX98slCCgxNzQBlBJRffioUoIJ2aSb5rVPjDgQzJlNYyZcinMJnXqYPs0ntDo5UdihqisSIMb37ajlbUAReV6MKH2gYvof0oawBljanf1Lfe5dI7SbCNnUqXrkLzAX9Se8ybLkkMbmildtn9pQ+/yTkxQ/chtI15duXlvzdPP4c6lqopLfizUhhexMimB/tA2uQoLwq1llxU5YVL8Adq5pjaLcxufJyNBJJaFucKLytBpOUgjEMGkTTdiXT/AAXJm7gFOg/ShENz3onpi296FarxvIash0bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Wqj1m40g3xzBzCIIdI1/Tnlmb7S3hlwdRDoDUE9rvM=;
 b=gOlxOMgvp7k7LEt0CYMqiJDHe99I59Y/3Xzfg+D4dKgv5F5rM0V2aLLHevvGXlg1GfPK04Lbx7P3oWNPsSWP8TEWlIusEBLBC54TDgI5IpHfMHAgOyYKYMBst3XeFwBKo6qrH3UpVeAHPLOCLSvehRGlrv+W/V6V9vNNxc176gc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 5/5] [FUTURE] xen/arm: enable vPCI for domUs
Date: Mon, 9 Oct 2023 15:57:44 -0400
Message-ID: <20231009195747.889326-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231009195747.889326-1-stewart.hildebrand@amd.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|MW6PR12MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: ba39dcb4-52ac-4e55-d66b-08dbc90235a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nhYyEbDac9PtHgA1RXkabYZapbM+IAhiYaAtu2loOexcgYu5ZXjMcNTlUK9Aenv3zVZI0BLiAwpxfY4OHa0vtwVMIOTT+Fbxag0fWEOF19rdlB1ajPFTrhmly8NV1Ky+RIRmZhxONhjhlndf0LsWQMYdSNF5EcVhwBZaeR9ewRrD7JRJLCF2TLKUUJcpcJdlhuE7dttVpvTDn+t+3bkeL7aW4gnLEFKcNlY3cNlqxhC2qALo605PYEgO0a/IXBVRiNgHuAsIRUaFLW7PZZ3SPSvjLa1X1hP2FcpgCigrYe0owuCn4tA6MLeaOmrsCmc1kptRKA+7gpPHLXGRCgJg4qdfOa9+r3epEzwkAxkPG3eUj2Xko8xw04zD5zAjcPTH8POaAk2B0Mdyj1UDHEW2VyDno2RaQU16RVYKWqV3A1721223n58XtbbP98zn0rgRbRzRaf7Nwjur8u4S3C7pcn6FF0Z7+lDEFCdUfvR6n7kV1M54LoiZ5Q4kanhBLONRlIfIm3pwBLjb7MCpTQOzXK/L6Yynd+GepYGaAKC/PjfX1+028zfIWkRoB76teSi+o28qB+yafXLIegsDV8YS4ic6REOHUbl6cY+PNt+nkeFutaeWPxobYEiYuezQ5ZLperV0QQyY4g6AQmqqkitbdRVffdusVmAloHDFzLpPht37lVCSs4akiO2K2Yd2Uxs4qq98fcJu2Ed9/TwLKGFSDCu4P/Ayn3a6dGPPHrNOfkjG1Sfmf+H7AXM7dK73OZdk
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(356005)(86362001)(36756003)(81166007)(82740400003)(40480700001)(2906002)(478600001)(966005)(41300700001)(8676002)(4326008)(5660300002)(44832011)(8936002)(6666004)(336012)(2616005)(426003)(1076003)(40460700003)(316002)(6916009)(54906003)(26005)(70206006)(70586007)(36860700001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 19:59:13.0054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba39dcb4-52ac-4e55-d66b-08dbc90235a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8957

Select HAS_VPCI_GUEST_SUPPORT in Kconfig for enabling vPCI in domUs.

Set the pci flags in xen_arch_domainconfig to enable vPCI if a pci device has
been specified in the xl domain config file.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
As the tag implies, this patch is not intended to be merged (yet).

Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
code base. It will be used by the vPCI series [1]. This patch is intended to be
merged as part of the vPCI series. I'll coordinate with Volodymyr to include
this in the vPCI series or resend afterwards. Meanwhile, I'll include it here
until the Kconfig and xen_arch_domainconfig prerequisites have been committed.

v2->v3:
* set pci flags in toolstack

v1->v2:
* new patch

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
---
 tools/libs/light/libxl_arm.c | 3 +++
 xen/arch/arm/Kconfig         | 1 +
 2 files changed, 4 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 15391917748c..931b2f8852ff 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -222,6 +222,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
     }
 
+    if (d_config->num_pcidevs)
+        config->arch.pci_flags = XEN_DOMCTL_CONFIG_PCI_VPCI;
+
     return 0;
 }
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index fcb5a0920c5c..6f33373f9035 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -196,6 +196,7 @@ config PCI_PASSTHROUGH
 	depends on ARM_64
 	select HAS_PCI
 	select HAS_VPCI
+	select HAS_VPCI_GUEST_SUPPORT
 	default n
 	help
 	  This option enables PCI device passthrough
-- 
2.42.0


