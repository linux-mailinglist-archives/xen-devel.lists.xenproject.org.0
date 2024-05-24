Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3848CDF6B
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 04:18:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728983.1134079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW2-0003vR-BS; Fri, 24 May 2024 02:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728983.1134079; Fri, 24 May 2024 02:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW2-0003tq-83; Fri, 24 May 2024 02:18:42 +0000
Received: by outflank-mailman (input) for mailman id 728983;
 Fri, 24 May 2024 02:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAKW0-0003tc-Gm
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 02:18:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee6c294a-1973-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 04:18:38 +0200 (CEST)
Received: from MW4PR04CA0066.namprd04.prod.outlook.com (2603:10b6:303:6b::11)
 by CH3PR12MB7617.namprd12.prod.outlook.com (2603:10b6:610:140::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 02:18:33 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::f8) by MW4PR04CA0066.outlook.office365.com
 (2603:10b6:303:6b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Fri, 24 May 2024 02:18:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 02:18:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 21:18:29 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 21:18:28 -0500
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
X-Inumbo-ID: ee6c294a-1973-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfnTtZrjHcOZuTG1RV24o7aioszq+2i1wi9SL+VzVENbB1OeNZ0AVReOMnsIPL7G+l6OfoesjLxad6etSxq7qDsXuBPKYeL37r/s7b3WlnRAWgsUc9ZYMsNRV9ugD+vJL1YHwp8B594Lzxs58kumF2vDBpKJLOKAFaN1/w5y7kf2qTShZE7hf61jeU26aAw7xixiowl4mVovg3yoZbt2jazISTBv+Uu63VupuXgc7KdpmE5B38AcbSFIWAGRklt+H6KV1iKK9Vka4zXWgTYxdq/CzlQ9rGhx3z3lsKH7Ov1902M5cj2WhS3mbXSCY2/JsSCM4S9Vqs6n1AqnGzxbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJzU+Lo23+pblv8U5ELG1eHDNPAMdYWdjjMuN9k4W2I=;
 b=f9skBc+HMDg/vp2x+inOpaYSEwC5VF/9qu6pJBpF3dqnX9lLjmrSh761TqNmy7Plq8EuqiKnewY3lekPO/AqRnTarALX+2iwObvFLuT0pQcOBHDvlHhl2RfnIJU4FEnT8DnRKmdCOU9/341mVsPkkNNP5Vx3D9iMPCUYABOTqxgN8l6ha+UrKVqyPA5JVd0UG2EsHNN4Fhtw7ljOT4BL76P4/JNXOFE43jAh0wBSfNO2bttEHX9Bq257dJor6T8NIUwc/eaReYW9h88ZFpnA3nOrSSQze2jjOsqYNxDtqWCv5Z840kP/DLUEWIEpm4DKSkt0M1Kkz9Q+i1sYdXx7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJzU+Lo23+pblv8U5ELG1eHDNPAMdYWdjjMuN9k4W2I=;
 b=OW9r2Ob3j4jAh6VUZ6GJ4nhym9xZtlIgNbhUhys/8sFSnl7nffFfL0dfXKWHYaNkz8csVIkjuxPxHC8GSOqqEQpPjpVNvvHMEoYWhX1PaYln64q29HhZJGUi0Z8EJnK76nwmzVuKFms9Jiz0W2gqXoDF8QeXFWceKscPNAG1ghA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH v5 1/7] tools/xl: Correct the help information and exit code of the dt-overlay command
Date: Thu, 23 May 2024 19:18:08 -0700
Message-ID: <20240524021814.2666257-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|CH3PR12MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: bc86422b-143b-4581-7f6c-08dc7b97ceed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uaq+5J7VJsp1R+HKQxmoUH+RO6C2TKR545pzmUQ5G22Xks5xPqG5QpmK7hDp?=
 =?us-ascii?Q?DnE+47ejbwree+MPqGh2q7aFJpuyI6CAdwYxZiNqgZk6aw3CRW/IZKRa+Wy5?=
 =?us-ascii?Q?zgTdwnvd07jTcV/CQJuNjnbtQScsfrk6L89m15vxJ3YO2NAMFOvoBeHrcBWF?=
 =?us-ascii?Q?BmXmSqYEI4EIDx7PDQfpJ3bySZbhyd0nWpgiyD+ZXvRx3ucyLyzJDy7H11gd?=
 =?us-ascii?Q?VUyLiLb5zmwwcnQyo4dSUH7nJ3OnU1b8iblErzSLg70bJbneMyJmLOFF0HCx?=
 =?us-ascii?Q?LudUVN6P+z3w2cTYSBK3MzKoqdivGohF+UhhDeM3qL0LBUODHQ8ruWT68nz1?=
 =?us-ascii?Q?n0klytLuHcM7NvWzbTklciVyQpA6XVAotPCzgMFLHOrCgIQU+kewjz11t/8W?=
 =?us-ascii?Q?FpcgNKzElpvXGaUv9iQ9wWXHkMsQoJHuuGQKG/cG+03H48KNfdWRsE7h2kNN?=
 =?us-ascii?Q?BtGV9noCK9DV8T64UplMKb3/skKxl9tWBB0amY9Nne+/kFnkhb2wJY2Bn4XD?=
 =?us-ascii?Q?joiyHDt8CElj59v0/61Ri83FTzVD6bVO0/rYTbDMGH2LaroFfji6SRv0TRpY?=
 =?us-ascii?Q?/ShNzPnQPO6iIAyDCA4EccW3USmyePLTPPPGz4t7tLzIZZBExMXHysG8uL/3?=
 =?us-ascii?Q?qgPgqb/tdSkJBrO06k6ZWJQfpBi/UjiZ+RgWbk2j6L5+daPWsx208ZpEX9lb?=
 =?us-ascii?Q?MH7grKIDq9rQ0q/ag2ZYLVSFSlGCaInHfePx5GzSvfltWKCmCJfCmO1dcNLt?=
 =?us-ascii?Q?CgAkryECoTpGYzszNNNJup4bqBKbIMABLHqvZPSKJIIO8cWKiUjDj1jIhCg+?=
 =?us-ascii?Q?Y3c1swBDADy1xU5SAUKPn57nSIfT/YEaxHH2NlrhndEI3hrLEeqosJFGMTEX?=
 =?us-ascii?Q?VP3maKkX+kYuff0Lpe/mWj2hECW//sVQ7DRwaqvxAc1CO97VhD1z93uKO+lZ?=
 =?us-ascii?Q?nSDzHgdkePhPGmPnMkpNYnPToLtydCp+jWY4HkHT8RuoJAq2IKnet8+yKC7F?=
 =?us-ascii?Q?G7cDYuXrpZ6nEVU3J26Z02jyRZ9ZCNP9Z5RxtX29RMMyOb1cx3BDKW3/mCG9?=
 =?us-ascii?Q?+JRINt/HJr87Apmu7wKiUkVxxxSezDyJ6XwoXbbVBVfXn4CCSbzZXy24oZ+U?=
 =?us-ascii?Q?4rjuQfJ+UrJN9XkH5EHNa+phNgl/1lAUygTQZjOA/czT0tAz6t6ewHmr6TQ2?=
 =?us-ascii?Q?n4einKpOsSvh9bvQyshJFSUbzx8Yh4iP/2o78DEFEicQsHosuTlHzAplgaMT?=
 =?us-ascii?Q?7diX0j+KlDrA1VApnOPru+JxR2oINSGrEsx02GtM9GkXhUsxF9CieQQJDFNe?=
 =?us-ascii?Q?f9gvaXXqPXjKnRcKdalYijsLNQ43bDnPdEdLccK4BOk6L/br1yybMs6OOuwO?=
 =?us-ascii?Q?EPIF7l0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 02:18:32.0310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc86422b-143b-4581-7f6c-08dc7b97ceed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7617

From: Henry Wang <xin.wang2@amd.com>

Fix the name mismatch in the xl dt-overlay command, the
command name should be "dt-overlay" instead of "dt_overlay".
Add the missing "," in the cmdtable.

Fix the exit code of the dt-overlay command, use EXIT_FAILURE
instead of ERROR_FAIL.

Fixes: 61765a07e3d8 ("tools/xl: Add new xl command overlay for device tree overlay support")
Suggested-by: Anthony PERARD <anthony@xenproject.org>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 tools/xl/xl_cmdtable.c  | 2 +-
 tools/xl/xl_vmcontrol.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 62bdb2aeaa..1f3c6b5897 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -635,7 +635,7 @@ const struct cmd_spec cmd_table[] = {
     { "dt-overlay",
       &main_dt_overlay, 0, 1,
       "Add/Remove a device tree overlay",
-      "add/remove <.dtbo>"
+      "add/remove <.dtbo>",
       "-h print this help\n"
     },
 #endif
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 98f6bd2e76..02575d5d36 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1278,7 +1278,7 @@ int main_dt_overlay(int argc, char **argv)
     const int overlay_remove_op = 2;
 
     if (argc < 2) {
-        help("dt_overlay");
+        help("dt-overlay");
         return EXIT_FAILURE;
     }
 
@@ -1302,11 +1302,11 @@ int main_dt_overlay(int argc, char **argv)
             fprintf(stderr, "failed to read the overlay device tree file %s\n",
                     overlay_config_file);
             free(overlay_dtb);
-            return ERROR_FAIL;
+            return EXIT_FAILURE;
         }
     } else {
         fprintf(stderr, "overlay dtbo file not provided\n");
-        return ERROR_FAIL;
+        return EXIT_FAILURE;
     }
 
     rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
-- 
2.25.1


