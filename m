Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A6088F163
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 22:55:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698733.1090803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpbEq-0002Pw-G1; Wed, 27 Mar 2024 21:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698733.1090803; Wed, 27 Mar 2024 21:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpbEq-0002NK-D5; Wed, 27 Mar 2024 21:55:16 +0000
Received: by outflank-mailman (input) for mailman id 698733;
 Wed, 27 Mar 2024 21:55:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWcJ=LB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpbEp-0002MB-F5
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 21:55:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af94aaf8-ec84-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 22:55:13 +0100 (CET)
Received: from SJ0PR13CA0090.namprd13.prod.outlook.com (2603:10b6:a03:2c4::35)
 by DM6PR12MB4329.namprd12.prod.outlook.com (2603:10b6:5:211::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 21:55:09 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::b4) by SJ0PR13CA0090.outlook.office365.com
 (2603:10b6:a03:2c4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Wed, 27 Mar 2024 21:55:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 21:55:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 16:55:07 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 27 Mar 2024 16:55:07 -0500
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
X-Inumbo-ID: af94aaf8-ec84-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1v4y8zPqYmpoxGgMlvyFZ7LJhvsNfHUFczFIJC7R7kcuaswSl/0pBProEuvBv59pTlqlYNHSOiCOPMazX9iEeKjEHkHLNhAM3m2kFmevr4y4nW4FHAOYm8sNg6u0XNWzgMs9j6DHmWr7zTgtW5M1nd1g4NMj+Mii4Y91QGoU/m5C5ByQ0q/N3BK2POrP2zgi1psljF28roSJeIttlVPeCxItWWTYUcMrvuanwAity422vCkHQZBQOxmMy7utMyQGD8fOADiYPNwzEdxqQy17wdKhrOUb/SwquqJP56WxPjLQAR4+DedXqUC7iwvtySaynevN7Ta8rwM1QbQYYCdjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCUNHAud3RKnNZN44YqJ/JNK6UfzaIxSGxEmG+Yk0iE=;
 b=GKuitne/DQA2GsounsDhcMJyiaXCSth3u/eSivpsUgl1uWDF/BgcvkC5gs61t+vz5P8F17oYojUlo51rSFMKO/cFet4gqOOjps85266L2jzTJ09VZUPA+olC0/IwEEWTJFZSQM3BPHw+MeHJNoPsxHGd8w8nyMPGOSdRdfuRHCpFSChVGrbEg8a/E4hMwtuCqq1Xg3G1PaFKC2Ng6WWOGgnfXxUV+1NBnRwwNWsJPdhyPJWE1WHAQuQPYV03UCLw580hTe85sWVSB2efqVeO47PEEnkBvDISGv+6jxULfRKU2sSLCZ7x21LXw2c+g0Ygt+GB0neUHF+H+ViP7r+zvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCUNHAud3RKnNZN44YqJ/JNK6UfzaIxSGxEmG+Yk0iE=;
 b=P4eKQU41W01UYzvBF5z3aKMTMU63QZbvhdx2b9bnvpvt1q0jdpeUmPcyjSjRXUu5iFThMEz+amrSie508zAttnfZTW/ks+NI6c029HMaZniQA11I8oXAGMW0r+3/W7HSOmfYqDgDxKUXJ+FhaTeRzMjYtVI8taGPehvO/JEI9Fw=
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
Subject: [PATCH v6 3/4] libelf: Store maximum PHDR p_align
Date: Wed, 27 Mar 2024 17:51:01 -0400
Message-ID: <20240327215102.136001-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327215102.136001-1-jason.andryuk@amd.com>
References: <20240327215102.136001-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|DM6PR12MB4329:EE_
X-MS-Office365-Filtering-Correlation-Id: db537cd5-42e1-425e-31b8-08dc4ea891d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A53CxzDskgTzRsYz/UFZ3gpBXN3b7heHERXVv3ADATSbaQTS7SuCt0mdFPPKYdI1C7LpzOmvrquhQ7G+c05NmF4fyxkyJGkk6LHQ84/MZiTVgYDbAIaRpOJp1RD76WXw0nQoMpZ264pzKlEb36Hm3gDu+seN0AP0gEkPAKUxyuhlbp/pxGQxT+oyCiqf+NrdZ8M8TqRzM+FM0l6WIBxT/8UE6wTai71kxkh4Gn7OGhLigPiSymBt0jiphiIHVak0BSHLKXCsDo/pCM2g0rKN+APW+fvBlPi8KvcbCd/VGRcSk4PjABLFlzzsTJECaOFdcY6DYsQT3GICTX99n3kuH3r7Sl5AGEdMeYDh1WnSj43pw9hiHdI0uXuIiZE50WVUAo/vX+FoOvZRmWItHlD3glxyLdWnP1FFyUg99Uwtpx3evYCHkSUueadUdfzR0HFpfzUFE+0LUm81h+MFjBMTJnoBA0/vpOmXrxvDF9NZRC4ZdzrBXdV1maY9pAeYYqBaPKRwObEOlZ/BthIONxW5uyMd75QQWz83Qgst72a33uztntckX4C89LCiuDT9RrSllCVaMDFt9lNKc2WuMmPSanW+gTzhmtVgHMUWqW+Hw6eEPx39tKmdU4Z425zQSs5Z3CuX0IaTec10osPv5Lm1O3k5GOnF8CrL52ghkETigUhuvbWlFh9jfD6AeLO57mXqrv7e3blhtWGXjohMYXEliVHIakiB+GJrLYcKWSuIJzk11bUcYpV7/d6Uo9HFN+Y7
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 21:55:08.6380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db537cd5-42e1-425e-31b8-08dc4ea891d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4329

While parsing the PHDRs, store the maximum p_align value.  This may be
consulted for moving a PVH image's load address.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v6:
New
---
 xen/common/libelf/libelf-loader.c | 15 +++++++++++----
 xen/include/xen/libelf.h          |  1 +
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/common/libelf/libelf-loader.c b/xen/common/libelf/libelf-loader.c
index 629cc0d3e6..a5f6389f82 100644
--- a/xen/common/libelf/libelf-loader.c
+++ b/xen/common/libelf/libelf-loader.c
@@ -468,6 +468,7 @@ void elf_parse_binary(struct elf_binary *elf)
 {
     ELF_HANDLE_DECL(elf_phdr) phdr;
     uint64_t low = -1, high = 0, paddr, memsz;
+    uint64_t max_align = 0, palign;
     unsigned i, count;
 
     count = elf_phdr_count(elf);
@@ -481,17 +482,23 @@ void elf_parse_binary(struct elf_binary *elf)
             continue;
         paddr = elf_uval(elf, phdr, p_paddr);
         memsz = elf_uval(elf, phdr, p_memsz);
-        elf_msg(elf, "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 "\n",
-                paddr, memsz);
+        palign = elf_uval(elf, phdr, p_align);
+        elf_msg(elf,
+                "ELF: phdr: paddr=%#" PRIx64 " memsz=%#" PRIx64 " palign=%#" PRIx64 "\n",
+                paddr, memsz, palign);
         if ( low > paddr )
             low = paddr;
         if ( high < paddr + memsz )
             high = paddr + memsz;
+        if ( max_align < palign )
+            max_align = palign;
     }
     elf->pstart = low;
     elf->pend = high;
-    elf_msg(elf, "ELF: memory: %#" PRIx64 " -> %#" PRIx64 "\n",
-            elf->pstart, elf->pend);
+    elf->palign = max_align;
+    elf_msg(elf,
+            "ELF: memory: %#" PRIx64 " -> %#" PRIx64 " align:%#" PRIx64 "\n",
+            elf->pstart, elf->pend, elf->palign);
 }
 
 elf_errorstatus elf_load_binary(struct elf_binary *elf)
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


