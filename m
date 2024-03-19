Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ED488065B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 21:59:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695610.1085493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgY5-0007zx-CP; Tue, 19 Mar 2024 20:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695610.1085493; Tue, 19 Mar 2024 20:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgY5-0007yB-8E; Tue, 19 Mar 2024 20:59:05 +0000
Received: by outflank-mailman (input) for mailman id 695610;
 Tue, 19 Mar 2024 20:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7vt=KZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rmgY4-0007xt-LO
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 20:59:04 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83eae5a2-e633-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 21:59:03 +0100 (CET)
Received: from DS7PR05CA0010.namprd05.prod.outlook.com (2603:10b6:5:3b9::15)
 by PH7PR12MB6720.namprd12.prod.outlook.com (2603:10b6:510:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Tue, 19 Mar
 2024 20:59:00 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:3b9:cafe::78) by DS7PR05CA0010.outlook.office365.com
 (2603:10b6:5:3b9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Tue, 19 Mar 2024 20:59:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 20:58:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 15:58:58 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 19 Mar 2024 15:58:57 -0500
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
X-Inumbo-ID: 83eae5a2-e633-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QP4kE3KnwdB6lhcrw2PbDmWLMdjKfDzlEXaqY18R1HCVWfZvT371alStIsDrIK7/eH8QyygOT3DntguKx+1yMipEIqDPnk2x5dsH7kaq2urbezQ3vlzz48Bmeb3mRW2rfSbquaqN9HLcnfjVbe7xbBk/8Imo+dbJmThGwvCv1RL2sHKW9jJhKgLXFkTqKtwxerehKA54TIISM2P2VcLlYJul99pi/lRAg0pl2Fww0tK72cVeIwWyoBazjp6yRXr41oawEf/acb6tp/AuMLjCeCR53pqNuDSLZttY1fuKPxj/H4U5Qme3yynhr9IWO3lpyvN93Heyoy/qCcGC9moylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvOehq1EJKjZfWXBSzZg1ZZ1p5IUUk1AykmRfeyalZA=;
 b=PNCHOtDTdMxWeRKFvqUNxWU5nbQ+c+vQ9tn5TwxRenqmNtjD9wycLeGwRmzP5sDXm3wYF5Cuhu131QR2SOV0OPkml07VXm3IFCT9EzbU3YqR6Z+xaYZ2ZirtNqLrlg10sSCEUieTi0kEq0Nxj3MPMUvHyStmjZxwA+tB2Q2wN4PKreyOLg4iWTunA9kKq4wRgJJmaN8QFYhWP5h1DDPJJWSS8z4L//FbLSimY2VXU3rvk4PRXw+kIVLPJTcRoGXZ+Koa8aXviAJOgFTDgSAAGI6FUgdQrm+0Sd0QMjtdobuEoOk3nbPwGTCQfQSOYFBke/no4nxHBXOZ+cJ38x+Kgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvOehq1EJKjZfWXBSzZg1ZZ1p5IUUk1AykmRfeyalZA=;
 b=dFwlsOiV0hwdksokGnZ4VQqmaIBeTPFwnS+lpUu6pL3/JlXCNC8Jn7NHYeIsKm7Df+hMPzoJXDWsKF+FeRZ4BX/RBdxuFzGDkk407MgiUfpH46+sYjrfhNBwsghQBY29+MWRbkVmo5c2O3wx5LtQhohvzkCxCnzI0ho4wXgtLNI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v3 1/3] Revert "xen/x86: bzImage parse kernel_alignment"
Date: Tue, 19 Mar 2024 16:58:47 -0400
Message-ID: <20240319205849.115884-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319205849.115884-1-jason.andryuk@amd.com>
References: <20240319205849.115884-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|PH7PR12MB6720:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b8378e-132a-4a54-f0fd-08dc4857669a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r8OnCdXJb+tokcrlhn8iiEY+4Fun5Gr7Fg3nCYPHg5/CIaOrIJiqiuCcitCL/jifBkrffIJEvH9xt7w0GYklEghfFC3WZlEJov1UCm88RVXzkP6B+XxrizgSJfvY9CvMk9cKlfxA6+XEfpAfrhrbW9PfngFJC+mtkzHk7Iz6Bshedvtz4Rkh4XCCWRRz6IUyGDogAPV8juC2+gkXebA9cudyWYmRn6pPhMPU3GZwQZhC7qEbR8tot0Lb2zJHLoPif89xonVpk4exUpZqC9Fe3Evn15Xs7yA071uDjAeG2fFxGNRJkhYGPZcJdk0rFhnx9WSCwYTGMoNA/BSEegth7Y7uPCfc/t2Ql6qXsQAni+jPnpBKygCo7Ee+f4n+PwV7UDRzspCtEctH5s4weKDs32fGPplIVSsBv5LN6ZjM81YfExpLoF7RhNrC9iYvcviGYdrPmq0Cb4QG/rlA5lj/zmyWQSLWzmlhmGNtEVZB8bjw92kx5GPitY3RbjBndbiV7oCU2omdIwUcCkM2JZfWvDvruDqAD/7fjIHVJw6VGxN/Y5yVBAwd+i57eBU/sSPfkdfHiCctw0UNUUN96HrDd7GFIIgZnTMtoMW/O9pdn7TCSabMuH47/qgXkkktuBpn2kPZC/HJlhxBIFiJH1O9VmNTtzRGlhyHTQ/mQT/vxbPP0UswNm1tkHTYCtWPqKHIfy8cKEqNXUg00nDqdxBy+xDq1kVpfk9Qmy+vsWR3nHvRohIPNWm+62IcutNQKc4p
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 20:58:59.9771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b8378e-132a-4a54-f0fd-08dc4857669a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6720

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


