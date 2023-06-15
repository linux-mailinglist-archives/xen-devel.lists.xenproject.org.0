Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCFD730BDF
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 02:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549302.857760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9aU6-0006XU-7B; Thu, 15 Jun 2023 00:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549302.857760; Thu, 15 Jun 2023 00:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9aU6-0006VZ-3K; Thu, 15 Jun 2023 00:05:06 +0000
Received: by outflank-mailman (input) for mailman id 549302;
 Thu, 15 Jun 2023 00:05:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WANU=CD=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q9aU5-0006Ty-7E
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 00:05:05 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 469b7c6b-0b10-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 02:05:03 +0200 (CEST)
Received: from MW4PR04CA0271.namprd04.prod.outlook.com (2603:10b6:303:89::6)
 by SA1PR12MB6969.namprd12.prod.outlook.com (2603:10b6:806:24c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 00:05:00 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::fd) by MW4PR04CA0271.outlook.office365.com
 (2603:10b6:303:89::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37 via Frontend
 Transport; Thu, 15 Jun 2023 00:05:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.25 via Frontend Transport; Thu, 15 Jun 2023 00:04:30 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 19:04:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 19:03:55 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 14 Jun 2023 19:03:55 -0500
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
X-Inumbo-ID: 469b7c6b-0b10-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ER2yf5I9umHz63PNCorqZKGXapXaeDX2XJJZaLw/XDpXsWbPnpoePZ/NM6w8ZpwIaEV890ElfJm2lUK3VbTuREtZufOznHXZ4s2nkcvJz8sTf5v1HJ0u49xcAHtO1r1ljGcKmb9Q5UxWaOcn26owZopsulGYzhgOrLX+OjyBZiHOaviXWE/nHVqXKHQuULVZUUYnJSirX/LzBXbC8X4WS+iYPMkju3VZ4vjgfKyY7tQto/EpQC7AB+sFiM3mOM7pmwDMhZoTfLqpkScgS+IoLjIXglzfSXfInJ11ak3xoggpVy2HIJR2YlVEBdVJyV3jzE8iZeINWuYy6p82awnuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FR4BawIl2nyLOoaRXHWpiEutGsBER4awTYitO3dxACs=;
 b=iw5299sIwsEPhUBXMO5q5LpvXBgceQh8C/YvvSm/o6jO+BuO2rNe6spreb3DOKfQ1HQfz98yJfh46Iy5rJ1XWwIOl168sMehKGeDHoNQvnyNWFsKejBkNKuE4O/Q/hJm5Jm20j1exppnbalmefD8v3rSOtxDytK5SJB+1b6vCCe6TS14x6YfYnhiOPUB6WEBb3TTo71058rXJ5N6nmfJ5+vjPnaYWqhf4m5GKD7fsG6QLWZ1fnTssyjOxaF05V7d5Bs5fbtUpqxrJFTCLY0+eUYZdX5hIg2zXT79AixN5t8H2ElP7Iz3LSW98Wx2pQbl6HQD4CwYHWXvc/XnrMdbaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FR4BawIl2nyLOoaRXHWpiEutGsBER4awTYitO3dxACs=;
 b=G80Ir7+qKGAeT6VzGg4HMVWr7pS6LGUOYhDKBSCpFeXKbT9+e5r8FSWcybf9AWRegyGaio1+XjW0sunbtn3/8ApWaKbMhYdQ8lBg7X5zyrgMjk63Xf1EGiuh5ib5N954eTAqBLzwhXReKa825aiYkREZqeLvdGnb3c8F6yB27HE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, Stefano
 Stabellini <stefano.stabellini@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "open list:X86 Xen
 CPUs" <xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCH v8 01/11] hw/i386/xen/: move xen-mapcache.c to hw/xen/
Date: Wed, 14 Jun 2023 17:03:29 -0700
Message-ID: <20230615000340.1135-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230615000340.1135-1-vikram.garhwal@amd.com>
References: <20230615000340.1135-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT022:EE_|SA1PR12MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ff215b-b21f-46e6-d087-08db6d3428b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0FIX13yuapYmFOj6gXBvTq20lycg/oMtM4HGdh6knZwiFgojlya4EbSiC6lijn5NiBfN1SMliwPbR0rqfcTR820RQkmciQHtn/IO7I1KmVGiUchC1UTf6ZlgI2CGEcN5mlSLDeabCAlSr5V5DFKK4ibUqgB5TEE/35o09sqF77GdDuFn+FTR3+gl7P7qPsiPf7wHQ3cOehtDMQtMMjXWUAm+0gDCif3otockWPMZS4RtMXml+iAkmrVLwZxSKSQ4lW/NicwV1QeggxiwUQhoDa+RqwLNKuHtzusYX/4JXS0hu6pxMZv8+zAOof4QQhM82Offz7sg9Za73GVQIK24icXjsbcBvf6+hajfnizmPKQexbVWTS36h6y76vn2L1ipHH40QhdtLo1LbZR5Vmsk3uYlQ26vcbtOrpQsTuBysXnGne/JTiqas5yzmXCSlHgTTA1fYGoMxN57lWq+BdBTmGZJjmJEjs/3AvK6bsmzmcnob6ahNQ1rv8nACsaICFPtKqv8qUeWW9yKV2NLdIoUor4wExwhaATwORz4LGL7gdDDBB9m5s+fPDDeXHXi8vMyBuW2BEnQ7djYPJhs+CWnyNDATZoVzIafFOe/j/NGOuxXwkuoeE7Z2dSOn+vcaCTW6k1smqvZ9sIkIkSHAJ4g0WTEuORa75DN84qHemFbI/fXXHK8zhHtEk/gahLVO3Joxbh2WpO3S9PAYhC61+C643Oal+1Kb6la2l1lxtaTW1CPD2CNr0rQ2QSdphceKfRQXe5G28HQfnnQ//mQqwvQUw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(36840700001)(40470700004)(46966006)(36756003)(86362001)(47076005)(478600001)(4326008)(6666004)(316002)(6916009)(54906003)(70206006)(70586007)(356005)(7416002)(8676002)(5660300002)(82310400005)(40480700001)(8936002)(44832011)(41300700001)(2616005)(2906002)(82740400003)(426003)(186003)(26005)(81166007)(1076003)(83380400001)(36860700001)(336012)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 00:04:30.5239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ff215b-b21f-46e6-d087-08db6d3428b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6969

xen-mapcache.c contains common functions which can be used for enabling Xen on
aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
accessible for both aarch64 and x86.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Paul Durrant <paul@xen.org>
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
index 2e64a34e16..3dc4c4f106 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,6 +1,5 @@
 i386_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-hvm.c',
-  'xen-mapcache.c',
   'xen_apic.c',
   'xen_pvdevice.c',
 ))
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
index 19c6aabc7c..202752e557 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -26,3 +26,7 @@ else
 endif
 
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
+
+xen_ss = ss.source_set()
+
+xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))
diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 55c9e1df68..f977c7c8c6 100644
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
2.17.1


