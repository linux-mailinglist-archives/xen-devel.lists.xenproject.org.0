Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C47873FFD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 19:51:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689471.1074495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwM4-0008LQ-8p; Wed, 06 Mar 2024 18:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689471.1074495; Wed, 06 Mar 2024 18:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwM4-0008Im-5G; Wed, 06 Mar 2024 18:51:04 +0000
Received: by outflank-mailman (input) for mailman id 689471;
 Wed, 06 Mar 2024 18:51:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=toy5=KM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rhwM2-0007k1-Rl
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 18:51:02 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20630.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79f22f67-dbea-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 19:51:01 +0100 (CET)
Received: from MW4PR03CA0201.namprd03.prod.outlook.com (2603:10b6:303:b8::26)
 by CH3PR12MB8305.namprd12.prod.outlook.com (2603:10b6:610:12e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Wed, 6 Mar
 2024 18:50:55 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:303:b8:cafe::df) by MW4PR03CA0201.outlook.office365.com
 (2603:10b6:303:b8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24 via Frontend
 Transport; Wed, 6 Mar 2024 18:50:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 18:50:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 12:50:53 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 12:50:53 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Mar 2024 12:50:52 -0600
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
X-Inumbo-ID: 79f22f67-dbea-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P821ekqWkwpb1WpA9bQdt8MM3c3l5S4L03WdI2mXex3LC5tE7GgToPIn4ua7/DebJmGEC4uv3ogdM9nVRownD3aGvGvMUWNh9BuoqpAZI1H8I/1oRn/+jWJwwbSSNmKhu+EcT43xuKi9OISHFyXcC5u773+rXuPyMCUAqLr+wTz+/KMS91jetNP/OpaSmQ6/hHe2jz8i20Ht0zYFFlp6Y8AVHytLoPKOSCBwsZJJD10olZkcwf20ZATflUgJkScTpJSzfyJ3uQOFs4hRqjE9ugKVbdm7BQExlFK49kySRcma1CVZyh9zoZcX5DvEdMiVq0Y8ZvYe6b+B+w8iEA+98w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJKZwTEKdVYwdWhkLN1Jw/ThuraaXkFqSODcmfGNrWU=;
 b=nL94bnlCv/4bveM5XxdQwMJ0898M/k+9UnFkJJ0xcTxLUBS4/ViT7YFuN0IWXJXYMPHP2jimM+4uZS9sQ0DgBhKuyXz8Jled+SSq2ho84UFMemOe4l08DRmYbjNDogEPqt/aGyRHtWkO+YeTNO6CPyfuUbmcWvqNeieiKnFt8fZ0nae4BRxrdXR/Xzryir3rpm37duXj7ngxsmDLTi7PyUt/jHLMVsXyFnANdhN5BOZ6BJGeIeehVG9dEDSlGg7e+2qGyBk8DGA25HCFDOGAmC2YFycfjXkYXiKKJLxGK+HZMO3FpzZj8NIhVn1MzXRTcLlSQUI9M7zZIURU9+4yGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJKZwTEKdVYwdWhkLN1Jw/ThuraaXkFqSODcmfGNrWU=;
 b=2NWB+CWppj92dEdqirPOa6kUeHGxtu3LKUURz8JwY1BpZF6DXrQ3KeoD/X3veFKjWUYmEfP5+nOpRuYgRct4Jf0h6BJYdxFHJMgFlSBc7kYZQ+zS7KsbISGPUBxpMoJy39m7GTBa3tAHMle1yFWaEO4s4w/OCY8KTWZ+oPtJAbc=
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
Subject: [PATCH 2/3] xen/x86: bzImage parse kernel_alignment
Date: Wed, 6 Mar 2024 13:50:31 -0500
Message-ID: <20240306185032.103216-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240306185032.103216-1-jason.andryuk@amd.com>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|CH3PR12MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: ac1c0a7e-1776-4cc5-aa16-08dc3e0e5a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hG93AnmSbi858NSe54/nyBoMuLzg/sPMOCDHXAG3jJRTQJOHdISHXP+YOnbAdJNm2F//16v/qHGRhu8XJaMq0wVyjAh7pFRf0SxRRExG45t7RE2zo7UZjvPecWpWbzWvzrKHH0Hdoc7wNdnL4Hs3RAh8m6Q7oZSBQ+CPv3pR0xmgWpWjthRDIgaMeLUUuM+HGQb78Bys13JWDoD5x5Xu7x/yUYVs4LP1XTbFlnVQz3zpum19vXeNPSUVZBKWoB6E1UEpwBGxStoPjrNTPnUTt/h22l/O3vrL7nWW+WcEmifnY2W0P+AA5yGLhojiLHIS+z/W9fp1kVVbsFwxTM3jE27s9osV5Z2rtrtxQFmW+eMcv4yK86adiifx9E9sc1y1I8vAF3I4IQN+QD4+NBcLwJxsZh+z53BI79hVivXNW1+Qmr0TThQ9zAJY7MoGy9SE7sVJcX+pkWVJ2u0eJrpo3eEPv5fcP+Nur9HiiCUV+kjOrKvvydekWKv+r3uZqNCo56gHaWlxVYdiRU8N7SVS3J/OeJp/4Mgph8/H14S6reAuICNq7U+iGF3tkBUzUyw00VpLQsgEewSEOcXoGNqQ5IuV135Geo874MZI9rKloeSUc17bs+kepsgJ71IK9JqLO7cIlNyENAxmhiGtqsAO4Wo6p88H/XjaiNuy4264nS3mp/HOqlLyh0dGtwdbJWFvPu5L0LZaUDGb5fsXo+lKOGawQXV/D5DNDGRQl/mHalrZoSW1kGOO+E1fSuRzmNo/
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 18:50:54.3643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1c0a7e-1776-4cc5-aa16-08dc3e0e5a4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8305

Expand bzimage_parse() to return kernel_alignment from the setup_header.
This will be needed if loading a PVH kernel at a physical offset to
compensate for a reserved E820 region.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/bzimage.c             | 4 +++-
 xen/arch/x86/hvm/dom0_build.c      | 4 +++-
 xen/arch/x86/include/asm/bzimage.h | 3 +--
 xen/arch/x86/pv/dom0_build.c       | 2 +-
 4 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/bzimage.c b/xen/arch/x86/bzimage.c
index ac4fd428be..0f4cfc49f7 100644
--- a/xen/arch/x86/bzimage.c
+++ b/xen/arch/x86/bzimage.c
@@ -105,7 +105,7 @@ unsigned long __init bzimage_headroom(void *image_start,
 }
 
 int __init bzimage_parse(void *image_base, void **image_start,
-                         unsigned long *image_len)
+                         unsigned long *image_len, unsigned int *align)
 {
     struct setup_header *hdr = (struct setup_header *)(*image_start);
     int err = bzimage_check(hdr, *image_len);
@@ -118,6 +118,8 @@ int __init bzimage_parse(void *image_base, void **image_start,
     {
         *image_start += (hdr->setup_sects + 1) * 512 + hdr->payload_offset;
         *image_len = hdr->payload_length;
+        if ( align )
+            *align = hdr->kernel_alignment;
     }
 
     if ( elf_is_elfbinary(*image_start, *image_len) )
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 0ceda4140b..bbae8a5645 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -548,12 +548,14 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     struct elf_binary elf;
     struct elf_dom_parms parms;
     paddr_t last_addr;
+    unsigned int align = 0;
     struct hvm_start_info start_info = { 0 };
     struct hvm_modlist_entry mod = { 0 };
     struct vcpu *v = d->vcpu[0];
     int rc;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
+    rc = bzimage_parse(image_base, &image_start, &image_len, &align);
+    if ( rc != 0 )
     {
         printk("Error trying to detect bz compressed kernel\n");
         return rc;
diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index 7ed69d3910..de4e9a446f 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -4,8 +4,7 @@
 #include <xen/init.h>
 
 unsigned long bzimage_headroom(void *image_start, unsigned long image_length);
-
 int bzimage_parse(void *image_base, void **image_start,
-                  unsigned long *image_len);
+                  unsigned long *image_len, unsigned int *align);
 
 #endif /* __X86_BZIMAGE_H__ */
diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index d8043fa58a..e9fa8a9a82 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -416,7 +416,7 @@ int __init dom0_construct_pv(struct domain *d,
 
     d->max_pages = ~0U;
 
-    if ( (rc = bzimage_parse(image_base, &image_start, &image_len)) != 0 )
+    if ( (rc = bzimage_parse(image_base, &image_start, &image_len, NULL)) != 0 )
         return rc;
 
     if ( (rc = elf_init(&elf, image_start, image_len)) != 0 )
-- 
2.44.0


