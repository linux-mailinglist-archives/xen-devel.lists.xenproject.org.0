Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F1463FE69
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 04:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451347.709051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wHv-0007MJ-Hy; Fri, 02 Dec 2022 03:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451347.709051; Fri, 02 Dec 2022 03:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wHv-0007K7-Et; Fri, 02 Dec 2022 03:00:31 +0000
Received: by outflank-mailman (input) for mailman id 451347;
 Fri, 02 Dec 2022 03:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP6A=4A=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p0wHu-000723-Dv
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 03:00:30 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79de7be3-71ed-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 04:00:29 +0100 (CET)
Received: from DS7PR03CA0035.namprd03.prod.outlook.com (2603:10b6:5:3b5::10)
 by MW3PR12MB4585.namprd12.prod.outlook.com (2603:10b6:303:54::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 03:00:22 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::e9) by DS7PR03CA0035.outlook.office365.com
 (2603:10b6:5:3b5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Fri, 2 Dec 2022 03:00:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.10 via Frontend Transport; Fri, 2 Dec 2022 03:00:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:21 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 21:00:20 -0600
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
X-Inumbo-ID: 79de7be3-71ed-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UonoHsApqxH704os3DVQIrqXvfQQwY+UdLhEECcFvBuH+jfWSYbr+oTjPatOV5mDqwpJ6pB22SmFD5Lo5yY3FFVFBN8SNSysdyeeS+UxQazmuKk9YZa8NsP+eIREOR2zllAtLKlxdviQuiJtP6DUoU7Gy/Hxvq+wvpE4wsvMQ4dwfvj0FKLJM9s5eJ14wgLX9ahyU+3a5q6ThNZtDjIQbelrqfKnATGB3Xd5HVIafCYYB/roCb4xrp6Ynr3oW8Unh4F6UwsLLTAXNirRG2xaZguhL3lqIxgAv6/ovuq3JO2AEdgDgOaXsB5bcjf3TQtPwT/5TBFs9Pg9E8MimahMGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7qBBSFtT16dKo24xhhVW2fFUFVUWqNupyxQmZ/Rxf8=;
 b=Hr1q6lW8AkxQoATEC1qkAWQW3+rBijsWlsUZ6ROWzN9qrMzUD4jMCaiHrBiy2nzx/etk1meylQz4KHXOo54lnQPs2tNTjdrXO5MdfJWFhSf+RBAtx5wBNV7dV5nOPxsvvGHhXduRUF45b1H2jkBFz/iMr456hH01jZAUhbk1UQR4aOb6lovQXNw1RiegqApJIMVfQtRYDnRX7/6iORBIS/HUWkqq9acs4KLCArRr7+yiw4jxvPNvyF+CsANKdAE1wI1FEIewasnYPZ2VyJ37m12KzBU6hXp9IxunI4UGSx+rqh1Q8+x4ilK7BewpkjWSk5D37zZgD9Jy5UuIui1QTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7qBBSFtT16dKo24xhhVW2fFUFVUWqNupyxQmZ/Rxf8=;
 b=uFYtXXKKvRYV7zfh3DweiAZwpk/4OqipxNWGMEQRmxAC4RX5fOO+a1TG1/zEvfnajZA2DT2W9jy5n8qeDp/d4wVzf3CVu2OjhF6690r1pIfvwEMDX0ciABrJMN1X85jPBjKHBODuuJBMOn0c+D/D24la7FFajyqvi4ga76+goKc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-dev@xilinx.com>
CC: <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>,
	<xen-devel@lists.xenproject.org>, Vikram Garhwal <vikram.garhwal@amd.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, Stefano Stabellini <sstabellini@kernel.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
Subject: [QEMU][PATCH v2 01/11] hw/i386/xen/: move xen-mapcache.c to hw/xen/
Date: Thu, 1 Dec 2022 18:59:53 -0800
Message-ID: <20221202030003.11441-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221202030003.11441-1-vikram.garhwal@amd.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT065:EE_|MW3PR12MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: 54bc65bd-967e-42cc-8dd8-08dad4115a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WMzYoLm2Lyynzxe+VcSzCOn7dj5Ke5A+GFKEUo93hd+rRyBsVbcvJZQVV+DH2XJZm1X7J65XUbB8x2yenr//rAlGX3XANu2PvuP2hwc9ckNznLcwbHZ4idgFNg+3s/Ei1t0T8Dx3H4RfKdwOciUXF70Q1PGrIZAI6HDV+cZeHxzHNFIQOIHOkDEbsYZOGW0gM+f0Mj4ErL/vzDpjD2ePrgTHLFCNGLGC+0c+k1z7c3FINp2RCCaSZrFpjT213HaVkMgdMX/EDGIRRAmmDSNBYyCR/ppl9rxyWHkFYGe6RX+C4AkZm+Nh0NIudfjVld+Zx7pVShppPVipcSr7L9wZVeYpkB+A8gN7/u7KrznYqhSWe/Acs9tSec+wgU+Iq3Pgvs3LD9KKmb6otMA/K7rr9KQYlsoEHqVMQ091ygHLWf+ZThgxdyHT+Lzb4HsD6bArxgJ57KL+4zPxLVVm7s1Y5vMmKfWMTMAazOecqC3X6ZFX30Jb+ID67Hg6WrMa4TEGJQ6FCX4o4iAR8F9dfz7S7BBPMSkeWvSD9F6unnke0JPUd2qaBhid4N03eihksOaM4x4TLkJDI/Cy3lE40A514vth5fK5KvckomTBGxduoSJ6g6YI0fvRSTb/yfRpH4g3uBM6dhGZg4tZnfHUwcQzI9uiHD1Au7qfg5EzXuzTuQgkzUf1s340QMafrvAyRMRoFaP547f5FMH3rL+yTo4LYBvlyLj4XMq+7GkolzNWN/8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(36840700001)(40470700004)(46966006)(70586007)(82740400003)(36860700001)(4326008)(70206006)(40460700003)(6666004)(82310400005)(2906002)(54906003)(41300700001)(8676002)(316002)(5660300002)(86362001)(6862004)(7416002)(81166007)(44832011)(8936002)(478600001)(40480700001)(356005)(83380400001)(2616005)(426003)(1076003)(336012)(47076005)(36756003)(186003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 03:00:21.7311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bc65bd-967e-42cc-8dd8-08dad4115a22
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4585

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


