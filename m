Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23987D7691
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 23:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623323.971086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvlMu-0002ev-3a; Wed, 25 Oct 2023 21:24:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623323.971086; Wed, 25 Oct 2023 21:24:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvlMu-0002cj-12; Wed, 25 Oct 2023 21:24:48 +0000
Received: by outflank-mailman (input) for mailman id 623323;
 Wed, 25 Oct 2023 21:24:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sdGm=GH=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qvlMs-0002bQ-25
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 21:24:46 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e99edb15-737c-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 23:24:44 +0200 (CEST)
Received: from DS7PR03CA0284.namprd03.prod.outlook.com (2603:10b6:5:3ad::19)
 by IA1PR12MB8539.namprd12.prod.outlook.com (2603:10b6:208:446::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Wed, 25 Oct
 2023 21:24:39 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::4c) by DS7PR03CA0284.outlook.office365.com
 (2603:10b6:5:3ad::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Wed, 25 Oct 2023 21:24:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Wed, 25 Oct 2023 21:24:39 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 16:24:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 14:24:34 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 25 Oct 2023 16:24:33 -0500
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
X-Inumbo-ID: e99edb15-737c-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LR6H8GH8Qh4HsvZO9PMqZvjcnbNnevZK8FgMsbNcnOSpkKpkSyd5IfUVacDVJmvYp8XjXV1eB53woxQP+k1kiSRmecOe5a24k7GlhkFjodLgS0sPaQRAe+OHgtEKYFugHdzk19c1zEG71MewGukfEsmAUc8uRHtPIAyQQrJgDwqdRB65NwdUG4/1A20x1w/agDjbZPa0p+ojA+LuPxQjl/EnMrs6J6nrGtXuBvx16/dhl34VzuqKYEmJJazMWpIBbiw9dve3kBScXfWUP6SGSD3x82h+kctprTYZ4F8ZxuhWiB3pEjVB+ZxDfbB9EedxtZSavxctnKgei8Gs7OnhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8RBc3mGaBZEzIDWAq6TaBKCLaPuj7qNGyoRNGoAD/4=;
 b=nENxdoUCU65ttVFbtpQEwGemXjlD7lMx6m6DISKmvScNTvHKeoa2fRjBu8hkuH1yGBpl9q1s3wxoE6Ehq/iBlZSU2rwo5u5LH00h5KCCV3I01QUsb2V5q0xZV/CiUeVQ7aF3qQ3lMM99ChJDhIDJgcqEAaeInV7hOYYJATYa7u+5OcWhfsxHbN6/lOv1tE9L91naGCC8UVeJEiY58Pgc9rVd9vUPbDBge4su5tCmvRzYkLLOsm4AP+k0mPph1w4tnoCodRwqf7yDOPWNeALNpbvpW82fEj9DfMoIl724T4eaNmDFrKh/Q/H0FUrtn4B8boqSOF/gVhWPaZJl+xJ0XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8RBc3mGaBZEzIDWAq6TaBKCLaPuj7qNGyoRNGoAD/4=;
 b=qQLwOnU+jhYD1B5eMvi8CHTbxjuU+wkYBNabiwajM3AZz/fh4e+GehwEdTWKPnNFijehWwGeCJYv8PQcVpxbpfzRltYPpPhfu5yW9s/U815O3HiFAsjCZ9AfFpsVvYiz2Jvm5GwRZS83d+um/MdBWZwtC7hI5BMNr0+n7tbSv0s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>, <jgross@suse.com>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
	<marcel.apfelbaum@gmail.com>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCHv2 1/8] xen: when unplugging emulated devices skip virtio devices
Date: Wed, 25 Oct 2023 14:24:14 -0700
Message-ID: <20231025212422.30371-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231025212422.30371-1-vikram.garhwal@amd.com>
References: <20231025212422.30371-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|IA1PR12MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: a7cb8ff2-c99a-48d8-f8d9-08dbd5a0cbe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BmPxWzqta2PVUfu2JYM3Ka1NYG0qKeB+L1G04k2pLKcVRlFcfApsZwwco/LIEaYLAQJ6qb8p+h5ILXz/Xh+FWj1C8Jygrl5FM5TuCFhsjLiDl2fHLXG8F2nUicZl5/XgNpzjUU9OrAcMaRflxozacWZzgXxGbfX+jtY8/gnGx3IjYgSBcij5DqxJEfnYP3JwdwUtePJ+gsaVrmv/kLdXxT3/wCg9KKEoplxqPKldut7hLm132ZWSnSdt0U2EIw/vXNtluwghZiWYh+EsT4Cgerr26TjJks/1gQcenMhl1VEU76xJ3RlDQD3Mq4X7+0nUWZa3hpS+42AT3EOnr91wgz9eBf32/kqXHo1362YCyG7iJij8amHQo8zciIGR6P7WqnulA/Oxl7jBbTjBkD0CDYq74yWBV2oMwQSeZYBIJQlWpZq+umZo+V8hD9PaO/dhZ7Alt3urt/OhhNauE+NahmMDu8fYT5flQpGFlondL7gIBh1xWZCINU7lRSUM8RH9SafeKFSjVJkA10vhPOxnWttLr9uuDXsxc+q8XE9Y930M2gWS8lwPr41ATLXdAN72+ZNRBL0vvLUiK+aaYa1RWAZlHjoUP+V2nVvOLExkrzFvyMq7F8Shg00WBVOd+9UPl+KegYS2JL9FWYV/w53NP5djJgplGIcxdse04Rtj1nY3FysMm3DcApa2JtE+FrurJOc9V5TqlKP7petFit4pyvf4UumD4VZDxi/hFy30FZWO2XJVMIb6iicwYJcV7/yBPBB0E+YuvTrolmIkgH4aPw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(376002)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(36860700001)(2906002)(356005)(316002)(70206006)(54906003)(6916009)(70586007)(478600001)(81166007)(2616005)(6666004)(41300700001)(47076005)(336012)(426003)(82740400003)(83380400001)(40480700001)(86362001)(1076003)(44832011)(36756003)(7416002)(40460700003)(5660300002)(8676002)(4326008)(8936002)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 21:24:39.3249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7cb8ff2-c99a-48d8-f8d9-08dbd5a0cbe1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8539

From: Juergen Gross <jgross@suse.com>

Virtio devices should never be unplugged at boot time, as they are
similar to pci passthrough devices.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 docs/system/i386/xen.rst   |  3 ---
 hw/i386/xen/xen_platform.c | 10 ++++++++--
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/docs/system/i386/xen.rst b/docs/system/i386/xen.rst
index f06765e88c..b86d57af6e 100644
--- a/docs/system/i386/xen.rst
+++ b/docs/system/i386/xen.rst
@@ -52,9 +52,6 @@ It is necessary to use the pc machine type, as the q35 machine uses AHCI instead
 of legacy IDE, and AHCI disks are not unplugged through the Xen PV unplug
 mechanism.
 
-VirtIO devices can also be used; Linux guests may need to be dissuaded from
-umplugging them by adding 'xen_emul_unplug=never' on their command line.
-
 Properties
 ----------
 
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 17457ff3de..0187b73eeb 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -28,6 +28,7 @@
 #include "hw/ide/pci.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
+#include "hw/virtio/virtio-bus.h"
 #include "net/net.h"
 #include "trace.h"
 #include "sysemu/xen.h"
@@ -129,10 +130,11 @@ static bool pci_device_is_passthrough(PCIDevice *d)
 
 static void unplug_nic(PCIBus *b, PCIDevice *d, void *o)
 {
-    /* We have to ignore passthrough devices */
+    /* We have to ignore passthrough devices  and virtio devices. */
     if (pci_get_word(d->config + PCI_CLASS_DEVICE) ==
             PCI_CLASS_NETWORK_ETHERNET
-            && !pci_device_is_passthrough(d)) {
+            && !pci_device_is_passthrough(d)
+            && !qdev_get_child_bus(&d->qdev, TYPE_VIRTIO_BUS)) {
         object_unparent(OBJECT(d));
     }
 }
@@ -208,6 +210,10 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
     /* We have to ignore passthrough devices */
     if (pci_device_is_passthrough(d))
         return;
+    /* Ignore virtio devices */
+    if (qdev_get_child_bus(&d->qdev, TYPE_VIRTIO_BUS)) {
+        return;
+    }
 
     switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
     case PCI_CLASS_STORAGE_IDE:
-- 
2.17.1


