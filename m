Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A97571170A
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 21:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539825.841079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2GRS-0000ZF-3Q; Thu, 25 May 2023 19:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539825.841079; Thu, 25 May 2023 19:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2GRS-0000Xa-0F; Thu, 25 May 2023 19:16:06 +0000
Received: by outflank-mailman (input) for mailman id 539825;
 Thu, 25 May 2023 19:16:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x5Sm=BO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q2GRQ-0000XU-A2
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 19:16:04 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94c3acd1-fb30-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 21:16:00 +0200 (CEST)
Received: from BN9PR03CA0794.namprd03.prod.outlook.com (2603:10b6:408:13f::19)
 by CY8PR12MB8215.namprd12.prod.outlook.com (2603:10b6:930:77::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 19:15:56 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::99) by BN9PR03CA0794.outlook.office365.com
 (2603:10b6:408:13f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16 via Frontend
 Transport; Thu, 25 May 2023 19:15:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 19:15:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:15:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 14:15:55 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 14:15:54 -0500
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
X-Inumbo-ID: 94c3acd1-fb30-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBX5RDi94lpGSMbYpz5yl+vW7XiWHNlij6lWeGcf1ceCQfLgriV1/bGGLP2Ro0oIjo/p4+b6TGEtfI55VgYrSVDX6YX8Pe2UCydsadUPMh2aJxKbv3+Grd3EHMc2S0DiyIlyTL/ktna5Awpt21pGz5MWcIe1Wu2annJ3693eK2Ev4XAvhaQmvvobQfYVgokQG+Rg+xRvqGZWdl0SkH2ElxRw2rBs4AJmHmTKnQJk5+rJa6DdpQq8vi2OXg7MUkGax2hCLEmmtX/URofuxfB3cGmoksKfqIZSrGqRmq+niHpHjoiAUBcPt/k7qPFhd3ovUlZ2Tqn8JPQNKk1jUfyBkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RInPXW+Y8kCE2dzZ7qyAFtB20UReemp02DbRSA4j2fg=;
 b=JS+V9y90C1y+2/nax73iyL3l5SMpT81gRd1w9g6La2Z44fTr0vP1pnPBxa8EZOQ7inHECZ8JB3fe+HPjgX7pNk+xyMTIGOH/FYiD7FF7+r8hviTtTgHdzVWd5x5NRx+5kp5omOlXcPtTXOhkDT8KsahO2F6XQMqZgf6bbpL77l063rCzYNFyYJL7ACgICXWf2A32TqgJrJFxCa2qc0lN35dT43LdiB6hagmkeGbc9/1dZ3N+aqa7Vh0rORmUXHwaiwBgZATmbbp8+PfG9L5fiZ7S4BfF/FP2ZZSGbsdsFCMm2CpPKr8+MkbZyVqJRbIoSoV/VQ5ThwxeFIJl0Qxwyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RInPXW+Y8kCE2dzZ7qyAFtB20UReemp02DbRSA4j2fg=;
 b=Ec66yiAf61j4FQ2U0dOCIIKG1NPyZGfNPJBblJ84Kme+EmyynJcNbEdocZcBubiFIWOL1zxQ9NUzbYDzd1jk7/eivtEMYM6+j4TCBKfTuN87VmssqlG2KkPqnLVcW6KefiyFoGCIJlzvmHzVVf+7yXrctNSFpmksANgyGcRBz28=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] xen/arm: un-break build with clang
Date: Thu, 25 May 2023 15:15:31 -0400
Message-ID: <20230525191531.120224-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT020:EE_|CY8PR12MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: b4096752-e555-40c5-b65e-08db5d547771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mhTFRClntWwzxAdPcn3MirRdjVMomuiElpkJWZUCrjswrDCrnIduDuKJjcVZiihyA65kA+eY4Oaep0oqwViwI47oiBiN30uGuzJ1ikUzFrK5GZFNjetOpc8ipO3XXDRsEta+KmWCnv5CuY7Gp1kY0bwXahcQ7Uy93ShbJ+kQmPTatbH8rEIad/4fy+9QjILd+qkQd647R6z3Yn+jiszSLGDQRKDBJ+RUOtg3cd7TBuYY9X/UjoWrRUJI5dKIdi5Z41jlpp3VoyVWCMXQWqi/Kwh4qFsye/YoNEAKDHkz+Wcgo6erntNCaoRPMs+J5mkOfOPRcA99lPDO+2SJZ6YEGYsRWkiz25UvC9BYh/l3wfdLv3dCH2IBOyCqP/s1Qj45CiRUXl77JkMnKG2pHIxcLHAlAshy6iphX8gqMHEkZjf3MI3YK8nfTW9y4NRzZrx6oBTMJnE/ebKm7gm+tT3dG+UaBrFZoxsjxdRWHUWLaZEfOiTETuS3nceMJHQvrtSSYxIhIqHpshL4cSUeNxTn0jp/0g41D/5Lif4lv+qEJvgSJq9871keZTMVMUk0puwqKMBUJyBrbVFfLE2WxXDzCRPW4jqhj8AjY/ovLDgkM4pLfHGUzWx/8liMyqKCwfHaqBi5T9ySPIqcXdXZxmpnP3KsopxLHs1UAU5JLKKHXBcxVwGSUDjb85x0M5+ko39YgUEfpkWDEra9BPAwe2VtuzCbN/40lt3Jc40lX1uPSw61ObaKLG2lgKEq2aHe6UTgCBTyq3RA3zQfaak+jyq6Tg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(36840700001)(46966006)(40470700004)(2906002)(2616005)(36756003)(186003)(44832011)(8936002)(8676002)(40460700003)(5660300002)(26005)(1076003)(40480700001)(82310400005)(478600001)(70206006)(70586007)(6916009)(4326008)(86362001)(82740400003)(54906003)(81166007)(356005)(83380400001)(426003)(336012)(47076005)(316002)(41300700001)(36860700001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:15:56.5165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4096752-e555-40c5-b65e-08db5d547771
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8215

clang doesn't like extern with __attribute__((__used__)):

  ./arch/arm/include/asm/setup.h:171:8: error: 'used' attribute ignored [-Werror,-Wignored-attributes]
  extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
         ^
  ./arch/arm/include/asm/lpae.h:273:29: note: expanded from macro 'DEFINE_BOOT_PAGE_TABLE'
  lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")                   \
                              ^
  ./include/xen/compiler.h:71:27: note: expanded from macro '__section'
  #define __section(s)      __used __attribute__((__section__(s)))
                            ^
  ./include/xen/compiler.h:104:39: note: expanded from macro '__used'
  #define __used         __attribute__((__used__))
                                        ^

Simplify the declarations by getting rid of the macro (and thus the
__aligned/__section/__used attributes) in the header. No functional change
intended as the macro/attributes are present in the respective definitions in
xen/arch/arm/mm.c.

Fixes: 1c78d76b67e1 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable the identity mapping")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* simplify by getting rid of the macro per Andrew's suggestion

---
I tested with clang 12 and clang 16

Here is my make command line:
make -j $(nproc) \
    clang=y \
    CC="clang --target=aarch64-none-linux-gnu -march=armv8a+nocrypto" \
    CXX="clang++ --target=aarch64-none-linux-gnu -march=armv8a+nocrypto" \
    HOSTCC=clang \
    HOSTCXX=clang++ \
    XEN_TARGET_ARCH=arm64 \
    CROSS_COMPILE=aarch64-none-linux-gnu- \
    dist-xen
---
 xen/arch/arm/include/asm/setup.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 38e2ce255fcf..1dbf3ced8079 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -168,13 +168,13 @@ u32 device_tree_get_u32(const void *fdt, int node,
 int map_range_to_domain(const struct dt_device_node *dev,
                         u64 addr, u64 len, void *data);
 
-extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
+extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];
 
 #ifdef CONFIG_ARM_64
-extern DEFINE_BOOT_PAGE_TABLE(boot_first_id);
+extern lpae_t boot_first_id[XEN_PT_LPAE_ENTRIES];
 #endif
-extern DEFINE_BOOT_PAGE_TABLE(boot_second_id);
-extern DEFINE_BOOT_PAGE_TABLE(boot_third_id);
+extern lpae_t boot_second_id[XEN_PT_LPAE_ENTRIES];
+extern lpae_t boot_third_id[XEN_PT_LPAE_ENTRIES];
 
 /* Find where Xen will be residing at runtime and return a PT entry */
 lpae_t pte_of_xenaddr(vaddr_t);
-- 
2.40.1


