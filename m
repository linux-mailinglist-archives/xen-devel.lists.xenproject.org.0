Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C67587B20B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 20:39:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692752.1080199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkURS-0007ac-63; Wed, 13 Mar 2024 19:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692752.1080199; Wed, 13 Mar 2024 19:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkURS-0007Z4-2l; Wed, 13 Mar 2024 19:39:10 +0000
Received: by outflank-mailman (input) for mailman id 692752;
 Wed, 13 Mar 2024 19:39:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOmT=KT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rkURR-0007Yd-8p
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 19:39:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a299ba1-e171-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 20:39:06 +0100 (CET)
Received: from BN9PR03CA0705.namprd03.prod.outlook.com (2603:10b6:408:ef::20)
 by PH7PR12MB9066.namprd12.prod.outlook.com (2603:10b6:510:1f6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 19:39:00 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:ef:cafe::cb) by BN9PR03CA0705.outlook.office365.com
 (2603:10b6:408:ef::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36 via Frontend
 Transport; Wed, 13 Mar 2024 19:38:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.0 via Frontend Transport; Wed, 13 Mar 2024 19:38:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 13 Mar
 2024 14:38:59 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 13 Mar 2024 14:38:58 -0500
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
X-Inumbo-ID: 5a299ba1-e171-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J09avBg0T+9cyAlKVUrKClWdQvNf2o9zXTa6YdVt79rscNa7r2nOpADIBBIvKRiTexQUh6D2VJ/ptgaaSH++NFq2VYFO32VFNIadczwm3pKoCHK1Kml4NuENk9mzHvqvgTOoz0MYCRbeo8Jrjy+GvZCoBw/r2Wp0I0N1GAvzJ5Fp3nucw+pVD3mbgraZ1O+90C6f5yHrTQtNB4AZdgRCXX7/DOPVEaLkAcqYGh2JTdMQVQPeibjJWVLIQfzdeMfec3VrziNFxBiSBTcronIlRcFV6sHIyzjkHrX4qqjuH441MAaJsyBS5QxgL1/C3gUryK6EXVd2q19GyT04IvztSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvOehq1EJKjZfWXBSzZg1ZZ1p5IUUk1AykmRfeyalZA=;
 b=T4q7oPTrmG9j3v6ldT7/69Ad0mrcEwHsLTuLzkhfv4f7z3/MOgLIcO3A6pKxatyogbSa0EkmL2qAJ7KqDnnxdyGDsUTbUHNQdOh7WZ3Q5Eg8MvdFkVI/yVhDnM65V5+M5efkhis2qCRDMllwah2WXJWn+wUxfGHMAIxiBbaWVE+j0BRC3lohazYMqj+ZG1to77VywyzzrYh6OVZq29WdqhZSF6r6Mob9b6MYMIrl9CShXdfH1AMjdLofG34z0f2Qo3B3HxvHNoAWFvGMoB780sTJ7zLUIUJCOOYWAZhkX/hX+32LrcvVDrYJ8NcVWMw4Oe85PIP1u6NXTsu9mmTNjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvOehq1EJKjZfWXBSzZg1ZZ1p5IUUk1AykmRfeyalZA=;
 b=uRgM+SmzYGpGdYzzorttE/tzliN76mT2C+FJgL9jAAxM2ZalKQWfmPxLPZXweTm+5rc+nLPNUpo1LJUlq1fkwlG7GBg6mdU93XgAwuWOfFDDFssHyHJBcDi9m5Rj/zJj2brp1ZoqMoZTuCpjeYmyCgS/lVCmQnkbK+dpzgu+oz8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 1/3] Revert "xen/x86: bzImage parse kernel_alignment"
Date: Wed, 13 Mar 2024 15:30:19 -0400
Message-ID: <20240313193021.241764-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313193021.241764-1-jason.andryuk@amd.com>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|PH7PR12MB9066:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7b6868-0736-4eaf-9305-08dc43953aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YqqWOBL36/cuyS43g264cfWuN2eTLVPbKPm8aU8SJZ8Ssb1wf3iuOVzLr6/ZmTLxFdGEJqNYYQHR/2qn4nK6GymcGRj6Dz6d0FBnJaW33lefGSP51kC8JChPjx0a6YTtGYMjSI0g7i1cOG4HMThn3Ud3BBI1bNQkPgf1Z3nuSgesSX6cKvYHg9zcGEVkjQ4mcRDJ2MecPdrHt54r/9i4hdZU4n3cGt+kLC7LxcrFZvhdjZk/sW5/eCWNzO6MrJMtVIq4q23TQZ22lM+NIiQMFfO/fQNPF3CnFy8oRJk7BcaWLiVJ3x7jwTr/XWIMi186Dq7ZXFmsnavL8D9p3897lgM7Kw7e1zzz7tMnie6QMvqK1OFlrd2bWfXFIN9VkhU8ARwNY28LtlDWj271b5xH4ItKhggvF+b3zWbBvOLaP2QsVovOBc6JFRJU3SRCcFpcqZz4tT/U8sISYhnqLinkU2NKR2NI30En79w0WW/75jFkqrH5QzBAow3abuyQNnOhX8DK+RaZNH5dYwhGx0/pO2RgDMzsnvtKFaKwnk4VqGSnvMTPLGBTKzLpD06BTHtiDOGKaP8lj/3zoTWqxcxzzWARhfcV2+YG/pRbuJKU7/F0rww3W8tZeJ3mpU5EEPOa0ph4zKQ5UKVbzHEugB4+fB66SJC5x3dALRFoud/DuWtLJRgWsg5FDYLi2gyUh+ZRPptBxJILbY1TLTi16QUz2st5hFk/bb83dJQ8Am7tFIY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 19:38:59.3949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7b6868-0736-4eaf-9305-08dc43953aba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9066

A new ELF note will specify the alignment for a relocatable PVH kernel.
ELF notes are suitable for vmlinux and other ELF files, so this
Linux-specific bzImage parsing in unnecessary.

This reverts commit c44cac229067faeec8f49247d1cf281723ac2d40.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/bzimage.c             | 4 +---
 xen/arch/x86/hvm/dom0_build.c      | 4 +---
 xen/arch/x86/include/asm/bzimage.h | 2 +-
 xen/arch/x86/pv/dom0_build.c       | 2 +-
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index 0f4cfc49f7..ac4fd428be 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -105,7 +105,7 @@ unsigned long __init bzimage_headroom(void *image_start,
 }
 
 int __init bzimage_parse(void *image_base, void **image_start,
-                         unsigned long *image_len, unsigned int *align)
+                         unsigned long *image_len)
 {
     struct setup_header *hdr = (struct setup_header *)(*image_start);
     int err = bzimage_check(hdr, *image_len);
@@ -118,8 +118,6 @@ int __init bzimage_parse(void *image_base, void **image_start,
     {
         *image_start += (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
         *image_len = hdr->payload_length;
-        if ( align )
-            *align = hdr->kernel_alignment;
     }
 
     if ( elf_is_elfbinary(*image_start, *image_len) )
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index bbae8a5645..0ceda4140b 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -548,14 +548,12 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     struct elf_binary elf;
     struct elf_dom_parms parms;
     paddr_t last_addr;
-    unsigned int align = 0;
     struct hvm_start_info start_info = { 0 };
     struct hvm_modlist_entry mod = { 0 };
     struct vcpu *v = d->vcpu[0];
     int rc;
 
-    rc = bzimage_parse(image_base, &image_start, &image_len, &align);
-    if ( rc != 0 )
+    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
     {
         printk("Error trying to detect bz compressed kernel\n");
         return rc;
diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index 2e04f5cc7b..7ed69d3910 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -6,6 +6,6 @@
 unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
 
 int bzimage_parse(void *image_base, void **image_start,
-                  unsigned long *image_len, unsigned int *align);
+                  unsigned long *image_len);
 
 #endif /* __X86_BZIMAGE_H__ */
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e9fa8a9a82..d8043fa58a 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -416,7 +416,7 @@ int __init dom0_construct_pv(struct domain *d,
 
     d->max_pages = ~0U;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, &image_len, NULL)) != 0 )
+    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
         return rc;
 
     if ( (rc = elf_init(&elf, image_start, image_len)) != 0 )
-- 
2.44.0


