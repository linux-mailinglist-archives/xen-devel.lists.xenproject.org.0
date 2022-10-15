Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BC95FF881
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 07:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423240.669820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPL-0006Cq-G9; Sat, 15 Oct 2022 05:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423240.669820; Sat, 15 Oct 2022 05:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPL-0006AA-DU; Sat, 15 Oct 2022 05:08:23 +0000
Received: by outflank-mailman (input) for mailman id 423240;
 Sat, 15 Oct 2022 05:08:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/I2=2Q=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ojZPK-00069z-1E
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 05:08:22 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61f22745-4c47-11ed-8fd0-01056ac49cbb;
 Sat, 15 Oct 2022 07:08:20 +0200 (CEST)
Received: from DM6PR03CA0026.namprd03.prod.outlook.com (2603:10b6:5:40::39) by
 CH2PR12MB4907.namprd12.prod.outlook.com (2603:10b6:610:68::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Sat, 15 Oct 2022 05:08:16 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::29) by DM6PR03CA0026.outlook.office365.com
 (2603:10b6:5:40::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Sat, 15 Oct 2022 05:08:16 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 14 Oct
 2022 22:08:15 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:14 -0500
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
X-Inumbo-ID: 61f22745-4c47-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMpGNDz5MJGBTsQNgOAbOkw1N3Q3yQ/FImJIQ7DBy+jzFSnE0aoUPDoe3f/pW2fRuwVuHmMP/o146u4qru4ovMWP0fJIJ/6Zvieeo6dk27uXeYGyiSRQDILQDamWV0QF2CWVPYoOsauHUxigrnYe44f0BUbhcGBInOaHb8J9MyNSPUAIowo3BVvX5HUTzur+dWA9eDEDFB73fFtHjbQG+1YCv/jB8boqeC+vFBaV5GearUGOyh6eiX8x2bhnn7cMtKmwGrAqFwnReqVzyM8ikQdOCJ10ZEWEY08dN4F21CU/g4bZSZHtXkqmgDjF/ceWkx88e5YP0ZE7XwBIxqWAmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7qBBSFtT16dKo24xhhVW2fFUFVUWqNupyxQmZ/Rxf8=;
 b=Ue/Sid5p2QRLbRtLRuWP5IHoMz9uxKGi3pckspLkuoRn6r9XrYQWmWoNBfd4uZ0SNuAKTOgcODLX+BvghCvRPK/u5g4aaIKpCM8H+rN/odzlnHx8e3N4Vl8N/qBMK9OZy92qyX2TXs4qhoojVpafYVMBRG53o4g3HWX+yFy4WjgiQeJ+UG85t2kEir8w0WEnNw1J6SQH+0W/DTXVpKQf65PnJmCq+eRflSuv5+r1mSeqgvwOAyjp8pgbn049mwcRL/5P8VqVYarX0IEiQenvPBoeHHOqah7wSJpNRTd1I9J9gZUaC9obE96a4kgtoHEtsWQh8ijOsdCJHzTC/RZs5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7qBBSFtT16dKo24xhhVW2fFUFVUWqNupyxQmZ/Rxf8=;
 b=qTo6dPVUM/hSVw7RpifwHoSTyL70JsSNk0QMqWEcAf1I1Lp7Uuz1zdxUdMW9bCLYqv7fD8jxh9khz++AMa+EC3YL2k9bJ6zRxJXuz6CY57YIaGDoU5o7ki2kbLWRHOGpvbqiaA+JVgTmjYMQdKq7jwfVetWoJW0Lg6zg2nj8Bxk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <vikram.garhwal@amd.com>, <stefano.stabellini@amd.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "open list:X86 Xen
 CPUs" <xen-devel@lists.xenproject.org>
Subject: [PATCH v1 02/12] hw/i386/xen/: move xen-mapcache.c to hw/xen/
Date: Fri, 14 Oct 2022 22:07:40 -0700
Message-ID: <20221015050750.4185-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221015050750.4185-1-vikram.garhwal@amd.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT060:EE_|CH2PR12MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: 47dfa116-68cc-4c3b-ef12-08daae6b44d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D1Fa0Vvl0/ewbsVHO1VAeiZhRtribXwC+6BCt3LOdnntiDIPNe+hFNgF5McuecoeuGTAXVpUMVblWislvtqCzzIS40k2WRDH9p2tHR2TJqXrw5SXiQ4f4FjrNCfBeQpSVWXZ5LrgGkrGUJI7SAoF0cZ4V/RrvJ7wbdrMAgLxsDxFImFGRei1VszIPb3l9ptkZbh73jv4Zy+T/dvRwkU7EeuovtHGHJfslXCkAz/kKgNXejwxkfuHwwPxuEeEyUBQszv0Z4eK2LirO3KQwFUIlQduZ4mGtEgXF0PGvP1+pl30jM6OhPh4hoLtY8Y5BGvSngHjUcarJmkrf6/8o+JmFHJrpoR5Hng9mhXPBJfV9C/GHzC4/tXCKFew9QJVGOFUDfkOg9MuLwXobrSNvwj+r7FHooY7Qyr2T5oDrRHMHLg3l5weWt5D8JGYnHR08GsBEdgkTD2KVm3KxHqEE63zDTsXLjnVhDwRMU+HMJphCaZcYgd350/0SY0s+w/fdLqm66TZJu4XGxow9BGMkJfJmsd8JnyfntKqbHijtOaGz9Wwj3GNVfJOBO03q0uqn3o6HJ0I9wKqWreYK9f/Q93zUqw92hBH+F+IQlAXdyUOpDs35i+7jZCOuQ0K2AWBu0qnTddEogG3oRd8eRfZfCtbSfq4g4AXE8BCb0W+J7IVL4c4ZELEUY3ybxCTnD4JVIX7kVoQsKr/4o8HW80i/2xuRVEpkzm6l0RihMaiChtzPMBFFwg45kfn+wPbyqkIeDHHzy3dz3Z11Nq9jC0alV3GeMXAu1E9mdcd45FkGCf0dImEl8nXtFwGxoH72gBBZfUA
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(478600001)(54906003)(316002)(6916009)(6666004)(4326008)(70586007)(70206006)(40480700001)(8676002)(41300700001)(26005)(7416002)(82310400005)(8936002)(36756003)(5660300002)(426003)(356005)(86362001)(186003)(81166007)(1076003)(336012)(82740400003)(83380400001)(47076005)(2906002)(44832011)(40460700003)(2616005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:16.4686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47dfa116-68cc-4c3b-ef12-08daae6b44d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4907

xen-mapcache.c contains common functions which can be used for enabling Xen on
aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
accessible for both aarch64 and x86.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 hw/i386/meson.build              | 1 +
 hw/i386/xen/meson.build          | 1 -
 hw/i386/xen/trace-events         | 5 -----
 hw/xen/meson.build               | 4 ++++
 hw/xen/trace-events              | 5 +++++
 hw/{i386 => }/xen/xen-mapcache.c | 0
 6 files changed, 10 insertions(+), 6 deletions(-)
 rename hw/{i386 => }/xen/xen-mapcache.c (100%)

diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 213e2e82b3..cfdbfdcbcb 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -33,5 +33,6 @@ subdir('kvm')
 subdir('xen')
 
 i386_ss.add_all(xenpv_ss)
+i386_ss.add_all(xen_ss)
 
 hw_arch += {'i386': i386_ss}
diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index be84130300..2fcc46e6ca 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,6 +1,5 @@
 i386_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-hvm.c',
-  'xen-mapcache.c',
   'xen_apic.c',
   'xen_platform.c',
   'xen_pvdevice.c',
diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
index 5d6be61090..a0c89d91c4 100644
--- a/hw/i386/xen/trace-events
+++ b/hw/i386/xen/trace-events
@@ -21,8 +21,3 @@ xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
 cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
 cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
 
-# xen-mapcache.c
-xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
-xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
-xen_map_cache_return(void* ptr) "%p"
-
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index ae0ace3046..19d0637c46 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -22,3 +22,7 @@ else
 endif
 
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
+
+xen_ss = ss.source_set()
+
+xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))
diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 3da3fd8348..2c8f238f42 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -41,3 +41,8 @@ xs_node_vprintf(char *path, char *value) "%s %s"
 xs_node_vscanf(char *path, char *value) "%s %s"
 xs_node_watch(char *path) "%s"
 xs_node_unwatch(char *path) "%s"
+
+# xen-mapcache.c
+xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
+xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
+xen_map_cache_return(void* ptr) "%p"
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
similarity index 100%
rename from hw/i386/xen/xen-mapcache.c
rename to hw/xen/xen-mapcache.c
-- 
2.17.0


