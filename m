Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92F592A159
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 13:42:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755308.1163674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQml3-0005si-Jf; Mon, 08 Jul 2024 11:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755308.1163674; Mon, 08 Jul 2024 11:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQml3-0005p1-Fe; Mon, 08 Jul 2024 11:42:13 +0000
Received: by outflank-mailman (input) for mailman id 755308;
 Mon, 08 Jul 2024 11:42:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfao=OI=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sQml1-00042n-V6
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 11:42:11 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bb61ed9-3d1f-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 13:42:10 +0200 (CEST)
Received: from BN0PR04CA0011.namprd04.prod.outlook.com (2603:10b6:408:ee::16)
 by LV8PR12MB9407.namprd12.prod.outlook.com (2603:10b6:408:1f9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 11:42:05 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::f0) by BN0PR04CA0011.outlook.office365.com
 (2603:10b6:408:ee::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Mon, 8 Jul 2024 11:42:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 8 Jul 2024 11:42:05 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 8 Jul
 2024 06:42:01 -0500
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
X-Inumbo-ID: 1bb61ed9-3d1f-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DclRDhOpTFS7Fdf8VKHRCvLd+3s5L4NbP9FI3rypdDdxc/Dx3GNXuh6kifA/sJC8m5nZsJ4zkl7UKVuMP7j/f5hs21OyX7iIkDPjPFiaUhjmKI5dspMKTDXFS6zu20aCW1iBFIw7EwcNEGS6X8SfL2aqN/mwGad1rNo/kbVeHzpOLxlj/9BXa7PhSeMM21czC2tU+PB/Xp21ShJ1WUTc61Ke0TLqLkkEPgKK7atsfxIVr94xdsVPSDlvhRoWnr1d84PR1jaS3pohgGpo6DHJqZ73QWfn6sYSeAJWUKZNa9A9j90aQ9iKGqSskgysHTE+BxHKqwFDXnnrkkpX8x90ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yo1KApXtMVEKsU/lZ7Ft3m3DQ4K3qbtV00FVwm1Ugf8=;
 b=EzX5az+ptmd3tsFByfzROAPaMztZYIKdj3HARl/p0dqfN7abINo0PjxQLzoruLrkrpxoKUSh4GPmjAPINja7rRjiXsZuQt/d24feKKCRRvF78wzGjsAuDdqLQJte/HpZ+caQKUtnVloTi2tjW4GzoNNwFoNA7zCCRoX1zFN5I9lME09+hyubu4GOk79skXdN3YOX+37UvboaZ/ZYLGr03sgBUAS2VEr/jSokTD+6KKj1Wxn/nuVz4iTqHy2/f9/s63Xar8OBhlHe/f/FpVPIwW06IZSTTfJLFGTsvTDcQWT0gm1aKBBx7FQjaCk+xV5Q0Fv8cJycwwj3AejdvFUATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yo1KApXtMVEKsU/lZ7Ft3m3DQ4K3qbtV00FVwm1Ugf8=;
 b=gSq6+Yo7xO/kLTVb6S8jaYTQQ9cpsJ/6/HtjiLH8LUZ3gYumrtJgXoqizZvA9OaNoAPPCDfPh5kqvRoAbngn14mGVzpUNcNUu0cCGRBmfOu/NG1J6LIoWRcLUsXKADexfA957ZZSnQc55KFsb/zeJ291lcI0vE4B1ZaHyYeHwC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<gwd@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v12 6/7] tools: Add new function to get gsi from dev
Date: Mon, 8 Jul 2024 19:41:23 +0800
Message-ID: <20240708114124.407797-7-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708114124.407797-1-Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|LV8PR12MB9407:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4bf36d-18ca-480a-02ad-08dc9f42fd95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yMBnDU4A0ylO69dXzDF/3RlmlfgprKt1LyDFY5MoWOuxP28uezYC0m0k5en8?=
 =?us-ascii?Q?wMyEXVTYT3PLjnixmRLp/1otf9zaAQZdEpByNr2T68uMBQN00X8XBsIrRHXj?=
 =?us-ascii?Q?WDWWOXaTPJ6WT7O8JLuKTOgVgIkmnXvYnwVfnNqANxQtAua8qRrw78o3NTsM?=
 =?us-ascii?Q?Lpm9okBOBsddJHL+tHeuFVsBWOsn6pQllTc1iMvuZqg4ObYeSVC1sAXQzlkK?=
 =?us-ascii?Q?ZnGaxyUwaiJwR6z4dbDqKOu5Bcdu/GemqCz5t/G9pOYZbzqRORQa0MBbWd4w?=
 =?us-ascii?Q?ittgECKUzLK1mOzJ8zHWI/4KsftLK9Hs+IR4kcdLKXCHsNx9c9hdSJDouPYv?=
 =?us-ascii?Q?6zsBzYKxKwNsOeIyPr1lNUITPfusjrg6J1aZrjwmsucGZCXfZBq7amPFtdWj?=
 =?us-ascii?Q?9bNuu7WXbKK9F/SthprtBy78KmayxqClr+toJ84FOigeixeUolKmfX+dI2jF?=
 =?us-ascii?Q?ZDTW4eIbx5yVF7zlMoOTrFewO1LdVodOXVHS4WObwW0p8+KtKnkMWTlioCwr?=
 =?us-ascii?Q?WNiUVP74l1VMgQjON3pbdcCLfZiKv2HNhkRNBIdu3M6BldAEVQOs/IGFlA2z?=
 =?us-ascii?Q?CCwubvcv+iTlSqY44iSUXEb8PYWSAY0KnZU84nkktdvUgkG0XUZw3ozoQoVK?=
 =?us-ascii?Q?A0mr+QfOPjynfXM6Hqecl6s4YQB9V12mehmRFtr5daQF+IY6L2qPvXoLZ5wy?=
 =?us-ascii?Q?BZqRmC6Sq8Istz2JKQVsl/W7QIgzY/Y1llEWRxXoTOEUIWJJL47FmJYo/dcZ?=
 =?us-ascii?Q?rGAhTmuP56JRNX85thLHoMiZTKT26QM5M72oV2OMLZ7+3+Xz09+r36lTHhmU?=
 =?us-ascii?Q?LUn6jynU0Ki+8p7HAuSknAPWsI8Yo+aUbdDYUzrk5AyOe839sS4jkMTYBAHa?=
 =?us-ascii?Q?iD6suVlZsifoNT8moofWv6ebMFkbIubn+ot+SzAYFFACSTKwtF3NMM2PBuVh?=
 =?us-ascii?Q?SnfuOQTCpxqOawJXUWh8iHb012dthRo8E2L08t1zcGS+hQE9PuQVXzpctN5k?=
 =?us-ascii?Q?CBmoYTyLhfe3RkjUIE1bMdq748l1AuINqZ8TtSetxgndkgtIguUPeArKBjlh?=
 =?us-ascii?Q?pMyz/lmG0uOPrF7GRa5Og6718EPLquGghZgtwUfIfkz0BF0tFz8MsgmWAASq?=
 =?us-ascii?Q?nI7twFfNa8igiTkk9KTsCkT84GvydLz5cU6JXzQqeF9x3s/fMyKlyLw7W5es?=
 =?us-ascii?Q?VnJTbj4Yvvupljtjq9IPy/6UoOQn3YQmIq5e+plb3weQwU03mVm1Q1vOs6uK?=
 =?us-ascii?Q?gpmlKKWyifzlN+umbPZgRKNkwyQRtzwuDn+qmmHI+Mfb14g+rsmN+Z0KPeQ/?=
 =?us-ascii?Q?2g/uszBjpVmuOKFgWuyO54HE/Fm19OcY5HP00j1/iDTIdvK5b2eLVUdOTxyM?=
 =?us-ascii?Q?WMPvdrFGfj3MMO26imRahY3l/Jm+A97U19z1B6qRW/EVLq3knA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 11:42:05.0201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4bf36d-18ca-480a-02ad-08dc9f42fd95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9407

When passthrough a device to domU, QEMU and xl tools use its gsi
number to do pirq mapping, see QEMU code
xen_pt_realize->xc_physdev_map_pirq, and xl code
pci_add_dm_done->xc_physdev_map_pirq, but the gsi number is got
from file /sys/bus/pci/devices/<sbdf>/irq, that is wrong, because
irq is not equal with gsi, they are in different spaces, so pirq
mapping fails.

And in current codes, there is no method to get gsi for userspace.
For above purpose, add new function to get gsi, and the
corresponding ioctl is implemented on linux kernel side.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
---
RFC: it needs to wait for the corresponding third patch on linux kernel side to be merged.
https://lore.kernel.org/xen-devel/20240607075109.126277-4-Jiqian.Chen@amd.com/
This patch must be merged after the patch on linux kernel side

CC: Anthony PERARD <anthony@xenproject.org>
Remaining comment @Anthony PERARD:
Do I need to make " opening of /dev/xen/privcmd " as a single function, then use it in this
patch and other libraries?
---
 tools/include/xen-sys/Linux/privcmd.h |  7 ++++++
 tools/include/xenctrl.h               |  2 ++
 tools/libs/ctrl/xc_physdev.c          | 35 +++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/tools/include/xen-sys/Linux/privcmd.h b/tools/include/xen-sys/Linux/privcmd.h
index bc60e8fd55eb..4cf719102116 100644
--- a/tools/include/xen-sys/Linux/privcmd.h
+++ b/tools/include/xen-sys/Linux/privcmd.h
@@ -95,6 +95,11 @@ typedef struct privcmd_mmap_resource {
 	__u64 addr;
 } privcmd_mmap_resource_t;
 
+typedef struct privcmd_gsi_from_pcidev {
+	__u32 sbdf;
+	__u32 gsi;
+} privcmd_gsi_from_pcidev_t;
+
 /*
  * @cmd: IOCTL_PRIVCMD_HYPERCALL
  * @arg: &privcmd_hypercall_t
@@ -114,6 +119,8 @@ typedef struct privcmd_mmap_resource {
 	_IOC(_IOC_NONE, 'P', 6, sizeof(domid_t))
 #define IOCTL_PRIVCMD_MMAP_RESOURCE				\
 	_IOC(_IOC_NONE, 'P', 7, sizeof(privcmd_mmap_resource_t))
+#define IOCTL_PRIVCMD_GSI_FROM_PCIDEV				\
+	_IOC(_IOC_NONE, 'P', 10, sizeof(privcmd_gsi_from_pcidev_t))
 #define IOCTL_PRIVCMD_UNIMPLEMENTED				\
 	_IOC(_IOC_NONE, 'P', 0xFF, 0)
 
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 9ceca0cffc2f..3720e22b399a 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1641,6 +1641,8 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
                           uint32_t domid,
                           int pirq);
 
+int xc_physdev_gsi_from_pcidev(xc_interface *xch, uint32_t sbdf);
+
 /*
  *  LOGGING AND ERROR REPORTING
  */
diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index e9fcd755fa62..54edb0f3c0dc 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -111,3 +111,38 @@ int xc_physdev_unmap_pirq(xc_interface *xch,
     return rc;
 }
 
+int xc_physdev_gsi_from_pcidev(xc_interface *xch, uint32_t sbdf)
+{
+    int rc = -1;
+
+#if defined(__linux__)
+    int fd;
+    privcmd_gsi_from_pcidev_t dev_gsi = {
+        .sbdf = sbdf,
+        .gsi = 0,
+    };
+
+    fd = open("/dev/xen/privcmd", O_RDWR);
+
+    if (fd < 0 && (errno == ENOENT || errno == ENXIO || errno == ENODEV)) {
+        /* Fallback to /proc/xen/privcmd */
+        fd = open("/proc/xen/privcmd", O_RDWR);
+    }
+
+    if (fd < 0) {
+        PERROR("Could not obtain handle on privileged command interface");
+        return rc;
+    }
+
+    rc = ioctl(fd, IOCTL_PRIVCMD_GSI_FROM_PCIDEV, &dev_gsi);
+    close(fd);
+
+    if (rc) {
+        PERROR("Failed to get gsi from dev");
+    } else {
+        rc = dev_gsi.gsi;
+    }
+#endif
+
+    return rc;
+}
-- 
2.34.1


