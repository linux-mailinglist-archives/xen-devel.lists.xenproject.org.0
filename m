Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C2B88D033
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 22:39:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698209.1089682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpEVe-0005uX-WE; Tue, 26 Mar 2024 21:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698209.1089682; Tue, 26 Mar 2024 21:39:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpEVe-0005rB-Ok; Tue, 26 Mar 2024 21:39:06 +0000
Received: by outflank-mailman (input) for mailman id 698209;
 Tue, 26 Mar 2024 21:39:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfY0=LA=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpEVc-0005qH-QV
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 21:39:04 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 428672ba-ebb9-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 22:39:02 +0100 (CET)
Received: from CH5P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::24)
 by DS7PR12MB6142.namprd12.prod.outlook.com (2603:10b6:8:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 21:38:56 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::15) by CH5P220CA0012.outlook.office365.com
 (2603:10b6:610:1ef::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Tue, 26 Mar 2024 21:38:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024 21:38:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 16:38:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 16:38:54 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 26 Mar 2024 16:38:54 -0500
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
X-Inumbo-ID: 428672ba-ebb9-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BO7GPVLwvJ7Xvz5tfBjY0xcPZenJ6do9Iwm9imK6zOv5zm+o4H6JZzF3ZgrTou/lp/lIaigcf1wj8g9HNh1chXYjeMf/gWbZ0Sq0i6r4o2qLRozU4K0Z43Ca0WqLeYWoCpe+GnRPVCucW4iTV0eZQ4VL09dlSferX6OSL0xOnZtXPi1k6spTGnbYrA3QjKy4MWtq3clRvzaektq2JY9tItLCcJBvuAuqssGWnkYB9PxnFzU+1t3YJuXkPi8F4hfg2V8Lx9Z/2xpCbrTKICbjLJBooYY+tmNgmGRg/kLwCi/l9m37mwaTvQAFD0Q0VHeil46RVKebBLUsT3++szLmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvOehq1EJKjZfWXBSzZg1ZZ1p5IUUk1AykmRfeyalZA=;
 b=EwGunQdVd4L3KhiHRWPESV8SeC31bR4fnnb3PjIRStJV5lIoccrf7a7W8STPCA4e7qQ79gj+TL6TPy8agESTNsi5AcUkKQEXwzKDZjqj5v8kgEyACe9YM++deJBVXyH/Ccc95GOh79xnmjyBMTCE9dC6WLtw4OAHR2z0vPoOe0U9q7/hWXviuEiG3+WDzP/jHZPCSxI7XFUo1Hd7tVsGARV4bIPMv2HH053whpTnaqJ5glJ4w+TUPm1N8IDxDskVd+pJnT4oVsLda+1KN0CBSOPil/CWFXT2wpo04ExntOFP+2/g/53uHoOchciWKaoBeRO7YipenNhD3CNnMQ3xNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvOehq1EJKjZfWXBSzZg1ZZ1p5IUUk1AykmRfeyalZA=;
 b=CiI6iW//3UFG327VgSO1xLv1nHZe5zfpiXJox7lK51fzzGybI3VeGq7J13v1bOxx4rpANBQHKjGZqC+trmfLMLCHF8pZLeVfpylixsZykYP1UFUnnNLZifoYwzBGqSjPC+eKivX2v52qpZJH0v8xTzdBuBcM60nr6a1y1dTkDcg=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 1/6] Revert "xen/x86: bzImage parse kernel_alignment"
Date: Tue, 26 Mar 2024 17:38:42 -0400
Message-ID: <20240326213847.3944-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326213847.3944-1-jason.andryuk@amd.com>
References: <20240326213847.3944-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|DS7PR12MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c7f5574-5b72-4005-0e8c-08dc4ddd2374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LcQv0PL+JTEmhWb1u28GVlPqoKyjVkmrc/p9ljoBrmXOSTIrmy38qdknzMHglDsTGCCuOY/M3qlcZLkTQohkUtIhbQNuOvBi1dHszlg7PnmWVmfHAnMLOkSmnEOmnS9EfkXdnMWUGYJLCRC5camgBixx6kDMi//R30VxhRjlGTcAxLbNrtAjCpS9F94ARkjuBjHN8PfUh10b+03FT9+hYIcGykZ1ltdWZnDYCFvMLP3uVCJ3p/ldnvfTyypEFfFn/XGPOBlYnvqxqljfD6w/yVrGhsVaWlMWIL8yx6FIwCkT3+ZJyoUQL73g6/zXd4Bz2XjY9VRxTVbIXnrITw8KQ88Rqm/XcBq1qso9/VbvXNJsHr3oWHU0AzX5d1EKayDLWoKP9HndD9G7zyswykj1g/LdvMKLaQcca8En42ykcQ4cSjPp1lfe5E9vFzN2THFTOiI/EaQJ/oHQeLiEVZfG477+5Vs1eXJSGayaSrit29+0wu1D9TrRju4TtSikWwNNvxU3OfEYg1CoNFDTvVzgZ1+StRUqcGOE6HhIJyH8j6ETHd861yGkY5C66sFiArc6b3GyE7++KOwofsygEhGk64f/2Ip5d+MdyxV9n0Yj3RKy2AkPN89aBTdTurZM47KqxX6SyfR1Bj07jwkjhVbts9+9aySDOBRKizw3A9ZmzQXHVeIj6msWtIPlCFdZCtBTl5R6b6jyON0w7dbVglc0R9BbF5xOrVGGYRY7lsdXK2ujUDSgZQw4KZF0ZRrqL9R4
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 21:38:55.6906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c7f5574-5b72-4005-0e8c-08dc4ddd2374
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6142

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


