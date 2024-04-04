Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBC2899031
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 23:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701001.1094969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsUaS-00038m-52; Thu, 04 Apr 2024 21:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701001.1094969; Thu, 04 Apr 2024 21:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsUaR-000346-Vh; Thu, 04 Apr 2024 21:25:31 +0000
Received: by outflank-mailman (input) for mailman id 701001;
 Thu, 04 Apr 2024 21:25:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/v=LJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rsUaQ-00032K-S0
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 21:25:30 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db735173-f2c9-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 23:25:29 +0200 (CEST)
Received: from CH0PR03CA0260.namprd03.prod.outlook.com (2603:10b6:610:e5::25)
 by LV3PR12MB9235.namprd12.prod.outlook.com (2603:10b6:408:1a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 21:25:25 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::95) by CH0PR03CA0260.outlook.office365.com
 (2603:10b6:610:e5::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20 via Frontend
 Transport; Thu, 4 Apr 2024 21:25:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 21:25:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 16:25:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 16:25:24 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 16:25:23 -0500
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
X-Inumbo-ID: db735173-f2c9-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWmbkKXJoEa8Bt5yRDy1AlXr3ZJDfF5zB/n7b3gE3pPaVgeEb3aAqyhx/TiRg+rT6vvuzY66nLTRBFRg3JZ8PZNbOXYhaKZTwTVKHPQIvTCmodZqlh5oPxEN38NbdvStpWQwRkUVc2Xknmt/yRs/gSYkk7SFdI5tzYoXskDcLPPYIV0vTn6/2EFcPGwwGuSiOhFk5VsJiq3f1YcKzD268B9N/SNgZYh6oPvIhNrhEFRUkDQAumkFYD4RyjuUzUEzGzRUyy6dWcQLwtlir3tgbYgaQqB5ISqvCWK3n3x2LW7qqCtGlqZP200Rz4ZNrPKHctG2z7HB5tIumOgGQorR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/XTvVNBqr8I/opYfrvk/te/N175FWqds5zuSoBwBvA=;
 b=k6+hJ3WSKMtBdF7odts2x5AcQTLbPvIsM25FbOOBKd7TfTqLn2pniLdNhQ1yjcRhM60aDqNHBLujlhD9jo35xw3fybOSwFpeNtNQ2yBxYk0E/MkgB6BV+/WE/MXE7MlsiASkU/B81D8syx3UeDWE8QDqAR9GHk1Fc3eizxKl25jZYFxcGjxKMraZpJrAg6EmI6GsZ/fhJF0eYEQCr4X0Gqg7mY1IU2zxHxNTjglmYQb/SdqkKIJuLyz6Y1P+0pnRzFUCWMloKCm9mHvTqWiw9eVgickJrrRgAvZ3oz4mvi4a8s6G+rTVUgfGjaGZ08cX5FyKL4IKX3cc3ojnS8PT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/XTvVNBqr8I/opYfrvk/te/N175FWqds5zuSoBwBvA=;
 b=2U9C3Rl7PEI5ObCVWCo7hp3lUMT1Shf5wiCUkjZ5dDWwQP7zQtb/GE4pYlMjaufsrpPlxMVQIHVWG5LMKO0+tAXMk8DBlVp0lGOUYYRpMHywaNVAe8Xb8lbT1EXoT/XCQgsWe0ZpoPsNJswnhQILQ2qOPwEUzFeI+XAGStPau+Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v7 1/2] libelf: Store maximum PHDR p_align
Date: Thu, 4 Apr 2024 17:25:18 -0400
Message-ID: <20240404212519.16401-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404212519.16401-1-jason.andryuk@amd.com>
References: <20240404212519.16401-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|LV3PR12MB9235:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f13a03b-c939-4f15-29d4-08dc54edbe62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xbbBGR18T+FHu0PXg8Zmw+ev1P6Rj/RydIi4ijWZCfjSUn9cNoNrVHZcHA0CzOlb9RTgmOx+9ihcj0PiOAPNJRnA7WXG9xkFe6kffbcQySt1BvaJE05G6iPJwUISs00v/1V79WXYF3io3jTXxc1aj+eaqv80DhAB9jOnucWhPnGIPgNKn1bVKYwc/DOGB2Ccg2sXlsh4YBqmDzOGpWpynIqS9ZcWUbH5wHHc3NIH9rDYCP+kkQaAS7Q+2VHwCIkPkBRoYhUtLxOLYS6jESdxe/YpQtPS2ZBsRSwsXlEj4DSDr8oHLdAo8cy8LseQuEcBmkx8IqpAumanYUwe0PqPLJA0S/VB+/bC4eZacfutCultXdhyq4T9ej8fDg8W9tXEQ/LulfYW+ne8sgwcLdSsUo03wlnmBtQdWh+3dUvKsl1kVBtlKvKR1h2FijjKqQTeJAH99bLtZqAOZrhB4rTkIvrQZq/sGd4sMF4xToA2G7Wz/TSfkGkTSx+fuo1+5yR0ll+b+YjcQhHq6k5JpB2MdNrY39tSIg/xQD4yU5KLIbiUrlaNz/K4ORsFeU8EK18TRE2x0UGycrnviyB6vwV8/aMCjY3ch0/PyKaIQg5C/R3bcnxa4sjjvaj4ywQ0mIXR1J/h6r2HGHue88fUSeYonnEs/gAbJQ1FkCQai/pI41ooALTWB2dsgMxqFTwqXwj2Q/pyh/zdLIYTDHCzOBQVr5ua11O+wPHKgjH7b1PZkenp+SU0eFrucEGJ/9HetMsD
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 21:25:25.5198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f13a03b-c939-4f15-29d4-08dc54edbe62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9235

While parsing the PHDRs, store the maximum p_align value.  This may be
consulted for moving a PVH image's load address.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v6:
New

v7:
Remove printing p_align.  It may be confusing and is only useful when
a PVH kernel needs to be moved.
---
 xen/common/libelf/libelf-loader.c | 5 +++++
 xen/include/xen/libelf.h          | 1 +
 2 files changed, 6 insertions(+)

diff --git a/xen/common/libelf/libelf-loader.c b/xen/common/libelf/libelf-loader.c
index 629cc0d3e6..e571ea670e 100644
--- a/xen/common/libelf/libelf-loader.c
+++ b/xen/common/libelf/libelf-loader.c
@@ -468,6 +468,7 @@ void elf_parse_binary(struct elf_binary *elf)
 {
     ELF_HANDLE_DECL(elf_phdr) phdr;
     uint64_t low = -1, high = 0, paddr, memsz;
+    uint64_t max_align = 0, palign;
     unsigned i, count;
 
     count = elf_phdr_count(elf);
@@ -481,15 +482,19 @@ void elf_parse_binary(struct elf_binary *elf)
             continue;
         paddr = elf_uval(elf, phdr, p_paddr);
         memsz = elf_uval(elf, phdr, p_memsz);
+        palign = elf_uval(elf, phdr, p_align);
         elf_msg(elf, "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 "\n",
                 paddr, memsz);
         if ( low > paddr )
             low = paddr;
         if ( high < paddr + memsz )
             high = paddr + memsz;
+        if ( max_align < palign )
+            max_align = palign;
     }
     elf->pstart = low;
     elf->pend = high;
+    elf->palign = max_align;
     elf_msg(elf, "ELF: memory: %#" PRIx64 " -> %#" PRIx64 "\n",
             elf->pstart, elf->pend);
 }
diff --git a/xen/include/xen/libelf.h b/xen/include/xen/libelf.h
index 1c77e3df31..2d971f958e 100644
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -196,6 +196,7 @@ struct elf_binary {
     size_t dest_size;
     uint64_t pstart;
     uint64_t pend;
+    uint64_t palign;
     uint64_t reloc_offset;
 
     uint64_t bsd_symtab_pstart;
-- 
2.44.0


