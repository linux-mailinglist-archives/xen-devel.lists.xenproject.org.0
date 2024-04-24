Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6118AFFF5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711062.1110768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTYD-0002QP-Bm; Wed, 24 Apr 2024 03:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711062.1110768; Wed, 24 Apr 2024 03:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTYD-0002Lb-8I; Wed, 24 Apr 2024 03:44:05 +0000
Received: by outflank-mailman (input) for mailman id 711062;
 Wed, 24 Apr 2024 03:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTQh-0003iy-Bl
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:36:19 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cecdd210-01eb-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 05:36:18 +0200 (CEST)
Received: from BL0PR0102CA0024.prod.exchangelabs.com (2603:10b6:207:18::37) by
 DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.22; Wed, 24 Apr 2024 03:36:13 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:207:18:cafe::cb) by BL0PR0102CA0024.outlook.office365.com
 (2603:10b6:207:18::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Wed, 24 Apr 2024 03:36:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:36:13 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:36:12 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 20:36:12 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:36:11 -0500
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
X-Inumbo-ID: cecdd210-01eb-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDSJRmQIiiiLCz9avQGyQktVTogrll7840XOI1Gxap3xP8Ys3sZXilkNbRoV4ddzWH5Ye7fr9tDHF2sKrDrVcdax5PhW9N44JLAAuKSseRwV09/fURn4de0qwHGX20uueNYyP1HiEaYDSMoQGeu/tZBna2euOkvGCXZEFegR1camIYUhuPWev/pkRu2CfF+fckM+E2snbiL3jsVbZKBpXavCVbRKDt11+3l9//G3UF6FXeC/1NwUA6o5aGXT0SHpd8zMFiSkm1kLc3no7tLXQRO/cQWyTnFlnv3fFA6IIzLXc7Fpimdeex/SC/OKKK+oqwGAyKdlUQoyZgN9Wj0Tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4gTMnujfvEGKwn+wIQsB0+jlCBFdxbEKPbGnjsFUW0=;
 b=a5ztsyrWPlNBC/3ifDww/JtjBO6P3V67Sr+h+CgNQrMSYJksQ/Jx3FxGdgjuXohd3HI0PeipVUG+q/eJIcQ3zpp9i6JLJqhpIBwgv1nbft7dYJS6N+A6b3ka7OWlpyl3Vyb5MZ8mAd88eiqDS0KY7lLn/LDHYS4j2xJuZMYy8LrUJW2WZNvmOiA+9oYe1KOQc6U6BvS50fYGMTG+/0Q36HLdzqukSYdEvNHfz9c7YR7W/sx33TtKU9YqeCQnUX4YrZucudCp5p5ZPHG1Oi2L8noBLBpUz4zDgk8KqHwvKnhTyPU0LR3dBmWJ8MbwIfdwh/TtEowIjvkRNiLmc750+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4gTMnujfvEGKwn+wIQsB0+jlCBFdxbEKPbGnjsFUW0=;
 b=CTVk0cEiYEly3J39WHNTBaY8/pf1w88nbmJpO0mer+cPTCxHwCKG6Ld2OhcKuGANTjriMGIMj0HfYMNWAk5rW+98kCP67ZqQm/FLa94/YQQuW5EGCvjOQpdPUrULGlaHCMyzaUuJRd/UJz7PCnRFL2Vd/e4otNBryKUhJb1dlR0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Henry Wang <xin.wang2@amd.com>
Subject: [PATCH 14/15] add a domU script to fetch overlays and applying them to linux
Date: Wed, 24 Apr 2024 11:34:48 +0800
Message-ID: <20240424033449.168398-15-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|DM4PR12MB7600:EE_
X-MS-Office365-Filtering-Correlation-Id: 31330504-1bb6-42a6-e2c3-08dc640fb0c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400014|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ve/mPMYnVY/gFR6TZTIM/qRVge/0fldx8ql4xIXUmxzfZGfeABm3MCsS2ujj?=
 =?us-ascii?Q?8XU41+lT0ofl/JtQsAWiOGSb2vrTvAQYNcg3bPj9b+2zToRVSpK/pNM0Oj2p?=
 =?us-ascii?Q?xyMfKHUlJDQRwQv4j0tW83ESr0R2BbiCP4wsqFVfbwg5RF5A1IL6sNuDZbGv?=
 =?us-ascii?Q?9oKe4uJwvfJIVeQGKA7L5DTtSu2xFRk2jBmaSQAM3izBBmJlXmxy732Cd2PX?=
 =?us-ascii?Q?yaJiFxGhRB8RBgFhPyUvpkbARAuyRRCHHOeav47Dv7e03tVUE1Cr1fbLxwpO?=
 =?us-ascii?Q?bYmLsBX+bRsmFQD/gecneBZiCKP09ZbnS4OgU4eshg11Imm/Cdw7WI0pmFKY?=
 =?us-ascii?Q?sT4EZsDslaeN592CrXg5EgD96mgF0cFqo2Irn9St5zYmpiawK5i3xSz+FkGs?=
 =?us-ascii?Q?wUQRpixtU2x6n4e3mcZ5Zio5l1vE+kJc7Y1qEHLGbu8kEKl2u9crjMn/pmdP?=
 =?us-ascii?Q?oP4F/jSxfsxp+6oa7aRsmrW5GYLs8j5s+cR4y99NTetyyfpUmvt8El3pKrJ7?=
 =?us-ascii?Q?bqCOoEkPUoBbz4fAmKyz1Ph6JwQSvvaf5oq5xq776IS6n9NFl3u/oUW/y8GH?=
 =?us-ascii?Q?mr0x25TCqhBce3WGJdZzjaU64yAFWy5KlFhLYjv9YgWgV6rYz92GDZWCIsgh?=
 =?us-ascii?Q?JnspG4fsBAPkKxPXa4gdiDJeqlnnQkcmTbnQTd4M6zYmmsDV2jTwbygZS+F6?=
 =?us-ascii?Q?nMP6fV51dc6De7hY9Atm9yDyCbdxpUQQbWf025K0YCYfkSozQTSA0sdKM/TP?=
 =?us-ascii?Q?CaNelZxtaYd3qCE5J+p5odiLWBGNgR2bJ0p1bBc1Z7zHjqqffXtfY/jlohsQ?=
 =?us-ascii?Q?c7Fw6PXufotBtlHGSUDMLHzA0iviE+QWp5hu8u8QXAEVW7a5fzGoS8q3omw6?=
 =?us-ascii?Q?NRJrHjHXFbmIO8JkJFeA3oXGuxmDsljQBvBbV74EQYqtAOd8S5Lsm0CGT8l/?=
 =?us-ascii?Q?tBOt8YaOmnNuRr02YBnFx6DbiMnqyaQnZfHcoDdcemDSRriKMeit8b+u3UVu?=
 =?us-ascii?Q?qM9yoRanogVluyTSeXBHIoGLzWSGMUPgpaS+EBLkzwi52KJdECToqTsMjX4E?=
 =?us-ascii?Q?NpdoBhfKWhJf3Y27YdHkfVhUsPl4GfCpIbd8y4Xcs/C33hhROIblU8eXwqHk?=
 =?us-ascii?Q?PUAa9rjEkA6W8DkGpRswviqdkpb5SDgpJCvyiG8xT5G0gyTBhEBzOJG0m4Q8?=
 =?us-ascii?Q?yH+3ChnbzNAn/5RSPxQ07IoWD9uqyvC67T+X3LvlY48PT5ZcuGloNKOoK7re?=
 =?us-ascii?Q?YI/Ekcea1rztNigTG2bqdPtzjfrJ45zB/Om1fLXLg4cG4ZD0wqcDiqOMKYN4?=
 =?us-ascii?Q?n6AlIXVbaDqRw1Mv5mrZUC6njMPTqendrN25oAEHXosrDEQp9ryDlh8j5X9c?=
 =?us-ascii?Q?E6BerOc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:36:13.2475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31330504-1bb6-42a6-e2c3-08dc640fb0c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Introduce a shell script that runs in the background and calls
get_overlay to retrive overlays and add them (or remove them) to Linux
device tree (running as a domU).

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/helpers/Makefile       |  2 +-
 tools/helpers/get_overlay.sh | 81 ++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100755 tools/helpers/get_overlay.sh

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index dfe17ef269..2d0558aeb8 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -58,7 +58,6 @@ init-dom0less: $(INIT_DOM0LESS_OBJS)
 get_overlay: $(SHARE_OVERLAY_OBJS)
 	$(CC) $(LDFLAGS) -o $@ $< $(LDLIBS_libxenvchan) $(LDLIBS_libxenstore) $(LDLIBS_libxenctrl) $(LDLIBS_libxengnttab) $(APPEND_LDFLAGS)
 
-
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
@@ -67,6 +66,7 @@ install: all
 .PHONY: uninstall
 uninstall:
 	for i in $(TARGETS); do rm -f $(DESTDIR)$(LIBEXEC_BIN)/$$i; done
+	$(RM) $(DESTDIR)$(LIBEXEC_BIN)/get_overlay.sh
 
 .PHONY: clean
 clean:
diff --git a/tools/helpers/get_overlay.sh b/tools/helpers/get_overlay.sh
new file mode 100755
index 0000000000..2e8c6ecefd
--- /dev/null
+++ b/tools/helpers/get_overlay.sh
@@ -0,0 +1,81 @@
+#!/bin/sh
+
+modprobe xen_gntalloc
+modprobe xen_gntdev
+
+while :
+do
+    overlay_node_name=""
+    type_overlay="normal"
+    is_partial_dtb=""
+
+    output=`/usr/lib/xen/bin/get_overlay 0`
+
+    if test $? -ne 0
+    then
+        echo error
+        exit 1
+    fi
+
+    if test -z "$output"
+    then
+        echo ""
+        exit 1
+    fi
+
+    # output: add overlay-name normal partial
+    operation=`echo $output | cut -d " " -f 1`
+    overlay_node_name=`echo $output | cut -d " " -f 2`
+    type_overlay=`echo $output | cut -d " " -f 3`
+    is_partial_dtb=`echo $output | cut -d " " -f 4`
+
+    if test -z "$operation" || test -z "$overlay_node_name"
+    then
+        echo "invalid ops"
+        exit 1
+    fi
+
+    if test $operation = "add"
+    then
+        echo "Overlay received"
+
+        if test "$type_overlay" = "normal"
+        then
+            final_path="/sys/kernel/config/device-tree/overlays/$overlay_node_name"
+            mkdir -p $final_path
+            cat overlay.dtbo > $final_path/dtbo
+        else
+            # fpga overlay
+            cp overlay.dtbo lib/firmware/
+            mkdir /configfs
+            mount -t configfs configfs /configfs
+            cd /configfs/device-tree/overlays/
+
+            if test "$is_partial_dtb"
+            then
+                mkdir partial
+                echo 1 > /sys/class/fpga_manager/fpga0/flags
+                echo -n "overlay.dtbo" > /configfs/device-tree/overlays/partial
+            else
+                mkdir full
+                echo -n "overlay.dtbo" > /configfs/device-tree/overlays/full
+            fi
+        fi
+    elif test $operation = "remove"
+    then
+        if test "$type_overlay" = "normal"
+        then
+            # implement remove
+            path=/sys/kernel/config/device-tree/overlays/$overlay_node_name/dtbo
+            if ! test -f $path
+            then
+                echo "error: path doesn't exist"
+                exit 1
+            fi
+            rm $path
+        fi
+    else
+        echo "operation unsupported"
+        exit 1
+    fi
+done
-- 
2.34.1


