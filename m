Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817788B1E2
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 21:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697877.1089094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rorCE-0007Tb-1j; Mon, 25 Mar 2024 20:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697877.1089094; Mon, 25 Mar 2024 20:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rorCD-0007Nz-U3; Mon, 25 Mar 2024 20:45:29 +0000
Received: by outflank-mailman (input) for mailman id 697877;
 Mon, 25 Mar 2024 20:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvT0=K7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rorCC-0007L7-Lw
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 20:45:28 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99b24552-eae8-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 21:45:26 +0100 (CET)
Received: from BL1PR13CA0185.namprd13.prod.outlook.com (2603:10b6:208:2be::10)
 by SA1PR12MB6702.namprd12.prod.outlook.com (2603:10b6:806:252::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Mon, 25 Mar
 2024 20:45:20 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::41) by BL1PR13CA0185.outlook.office365.com
 (2603:10b6:208:2be::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Mon, 25 Mar 2024 20:45:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 25 Mar 2024 20:45:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 15:45:19 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 15:45:19 -0500
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
X-Inumbo-ID: 99b24552-eae8-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPQNL2DC5zxCju1KPPFw8cxGFVWlYUeb5aTIvhP2fWxK+t0bXwMvoOpsTNGvR+DrXcL7XRRDUT7qSMsV4JQta4yMLnuqrHJtgj+ob1JdZz4/bwyc0Myy6H+EntYA2YVYxXf+1FwL2U6shZlvHcQkvLoskKSK6DyEuCDdYhjlluGJL2kqqEXnwD/41isPfOT3ZTDCIUenHSkblaZEAjoFlxx2yhCagQ01ji2meI4XF2YVO8jG0R2wHJ2n1xewxn8Nfz9CoJoaiTHS7TH5x+Gq5wBslWBfN7VI0KIysRdhVlQfbpupF7vQT/QFOA4b8psJiSgY4CnbSilZCt1G0xJ97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvOehq1EJKjZfWXBSzZg1ZZ1p5IUUk1AykmRfeyalZA=;
 b=hzdirreQkDkZYY+CWHIa3D0nvuZLqA00CviNj+SkLTqXcqI0kQEwoF72686F6ENpwNafW7VkCNqliwZg5nAz2iC6VX45pTy6O3mqI4HEDEc7Z9EFYx12C1qkbux3z5iwAIpgZZ+qhHwRBCTxticLwP8BsooUQWvzxnrS41OVsrIs3BjOxZQGt1U9oG+Q3pZ/V2xbQL7jR/R5uIZBDD3qGHwOQ1QJQu6qVeVQsni1SZcGEPXEvnKwyIPbjCXzSeydhMKMeYsJt/mPyktHWtw34LNO3pmnFy7OfzdX/a/aAQlyzt+vs8NR0oA2BbWPNWBthjofBnfLANtqvJrmzQPowQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvOehq1EJKjZfWXBSzZg1ZZ1p5IUUk1AykmRfeyalZA=;
 b=HectG3N0H33WZo8H4mwBJ2m7nABhWdL53zg7oCVmN0pe/wh+0ayK4goy1sPl6uuF5XhGjoQrijINi2vmfBAEJkc2snlrT68sET19kcLwCDMlIhKt9pkIC6To0FaNo+7hWtGhWx6KRtRtKGalng+HVsNtmB8Az3teoH1pPDGVixM=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/5] Revert "xen/x86: bzImage parse kernel_alignment"
Date: Mon, 25 Mar 2024 16:45:11 -0400
Message-ID: <20240325204515.250203-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325204515.250203-1-jason.andryuk@amd.com>
References: <20240325204515.250203-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|SA1PR12MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: ec3560fb-a2b7-4468-bfc7-08dc4d0c7c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tiir/iKRdDYx8IkrWcWOmvWqx9tJgv4x5IVTdIwcIQfEesk0fMeULuCisMpWf6/1qbbTzn/XttJbmOh04L+gnVtKjolvpQvzc3XW0c69A5maED2soxCrIgXjTgJtkIeeijMyEZ0xg69LoV1SGFUDsAQ3D/V4kqMr098sp3jzS/XEEkvHfZxFEocwRO3lyEaKy9Mi11w9/BJfJ3wwBFYiqXNa3b3ygbjsODuVC2CWNTLU7A3Spmb+SpyiPrV9xhtQUn8etVS4sNqXTlhlfrUvSkKN6B7V20OJpBP8pDPSb4OGTY7Hj58gjefLlRfB4v5tI/ik+cEp//WVjobzXGnqoVQ2INN+RiJk2u8BGdQb759xB6gMGJvHSlhfoBffF+kwEBSYSa04sR/U5TgbBZf6DPLO4Y7kOXL7YDRMdizW3Jo/IlWSWcsmQRnzrs76wEG9C41vLrLN639nc1Cvtus1SWz52ntqIOYYpDYqO0CkcczvUu/Y64g7Su+3SASUfwvlKDTQALSc8qEefav/dH2ZbEygakbD/iBZca2iJaN5LMbeH8vg0rstqXf1tILN+GIh52KCTu13IGKKWH7vIgdZjAeHUwZSiPF4qNV/klwfJeE03LvMfEw6fDzI3t7OJ4vr6NxKYRisC5Sb+rEAIn2jl33AHI7rKxnHLWawMIovCC2PMeFbjITQ/s4hn9uFxWIAEbZZsJtgSQ0S1DZ/HVvGBRs0yDLZK+Dt+GwIA1eYcbl1m6mXUhQeRyMXdqcPvZGN
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 20:45:20.2533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3560fb-a2b7-4468-bfc7-08dc4d0c7c78
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6702

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


