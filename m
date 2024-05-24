Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514488CEC58
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729887.1135201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDe-0007bi-Om; Fri, 24 May 2024 22:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729887.1135201; Fri, 24 May 2024 22:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDe-0007Vi-JV; Fri, 24 May 2024 22:16:58 +0000
Received: by outflank-mailman (input) for mailman id 729887;
 Fri, 24 May 2024 22:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdDc-0006xe-Gp
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:16:56 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 534f98c6-1a1b-11ef-b4bb-af5377834399;
 Sat, 25 May 2024 00:16:54 +0200 (CEST)
Received: from DM5PR08CA0041.namprd08.prod.outlook.com (2603:10b6:4:60::30) by
 SN7PR12MB7811.namprd12.prod.outlook.com (2603:10b6:806:34f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 22:16:50 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::a9) by DM5PR08CA0041.outlook.office365.com
 (2603:10b6:4:60::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Fri, 24 May 2024 22:16:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:16:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:16:48 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 17:16:47 -0500
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
X-Inumbo-ID: 534f98c6-1a1b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ns9JCnCAXGoAjQfpP9wTbqYGU7n90JKF+cuIZPfDk/R14fZpmhkxc7Lfyc1c+Zj0gU4kMbg3DVQ5uNluhrqy0QC1uIfO7sukvVSTgSWaHizcFf7YfcE+CYWevdrPUscDIeVLCSc2GR2ZlmMUnZesH1aZPi1jx59TDIn7r2saF2jpC2bU1OCJROwplSWO+nx/WLm/Cf84NWGd7LcfmYZ5OdoK8Af2w23DDIuygvc+flp+aDvQWa1/plWMuvY6kG3bIfx2KiGeHg96iedhe1gl//+3Cliw8cNuod7jGDkQ8LOqyvUo1judm1qLbl9/6wLyM3jSpbGaRJ5dYc5kNByhOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJzU+Lo23+pblv8U5ELG1eHDNPAMdYWdjjMuN9k4W2I=;
 b=bp5c6uxrCNfQZZipQ4TC9ZG/hqYGc0hO4mq7bqpZqgrL5JcW8seJhm2L2aaHGPkGeVwlsGUQfKz04vTgF9xuQ3C2h+gEkw2AArIELGI6kwrSB/vKevmRYIDM107anhmob+PWDx/ocBBcs90GxXkAGzwM11qgdKmiuv03jF+S60APTK+uOQVSp7723ytAif/rTlqdUTfkw4wEbrvQ2/pYvGnUseGpIaWYrpoviKuST1h7j0qZCEF3vbwu9GY8OCWiQM3Q+AN9bIiYUexKF+FLUn95HcoWX0qm2gtbpcalv7xkS23h7+Nwm8DcgV/3FSQsF7WD/c5WbsVcE61lTHer5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJzU+Lo23+pblv8U5ELG1eHDNPAMdYWdjjMuN9k4W2I=;
 b=GiNFzdCzMXUm73p1jFdMZbwrVPzY6M1lm2agrxUnPzjtm3vbUi6PwInsDTbhyk1SCsoGEIUfoqMS4J/xL9LV5yHhchshune1moFCe6xaWW/fn+jFhdbKyO+Fl9d4bz13cVLOkOqkinNBSB0KlduiVl3BeABiKhhmcY2GnKzxrDk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH v6 1/7] tools/xl: Correct the help information and exit code of the dt-overlay command
Date: Fri, 24 May 2024 15:16:41 -0700
Message-ID: <20240524221647.2860711-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SN7PR12MB7811:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1469f8-0f67-42e1-a46d-08dc7c3f34b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?We6+HSNrH5PCtFIOkHpGgt47i80SS+XBiQvm/anNS7mrXE0NZIsDs+wIJdcw?=
 =?us-ascii?Q?5+ZLaSs55myOP+JkzbHmu4KL7rCMkWewFqo2Fyk6rAX12ecPnGpHjZ/26Yfg?=
 =?us-ascii?Q?C8Ote7p//1M8iWpYtW4jYlety5h20Ru+oP0S1MsKOMHH4dfI1XM0EStbdbfF?=
 =?us-ascii?Q?Tlv4/Kmfs1jr9eW53iOVjW8MJAVifHma0rVtl4FI9RHlavMaiDhXTL8nCd8e?=
 =?us-ascii?Q?mYOqnQxRKPTTitxMvSU8yTUfgdAR5Z6zFr2ZfZg94CEnZxkaHR79Vq+1UmS3?=
 =?us-ascii?Q?E5BCXVuri1RnWJT5hyRCI/2SsZY1GWQy3DJgAbUrx0suLVNnFCC4HhEV+jUi?=
 =?us-ascii?Q?zHNsC/pVU+5DYGMA6FV8UVzpBIOF1Vsfu5ul1YX8lz55ZbjHhoWJra+5ybG0?=
 =?us-ascii?Q?mEwtGdZgdLGPkjvO6U9KQEUEEkrIW4KPqqqEVepjpfDobc6nVAtH3+bxw5T5?=
 =?us-ascii?Q?Evx/1K3WZ1cb44GBS1ZDJcq5KZ9DsgvCEscSbzoAkuhlEIhjjIO2Ufvj1mJe?=
 =?us-ascii?Q?gnqKwBunPzRMYJ9mr0Qx2ZYOLOcYEDau061FdvbJWEG41Bggq/bCmqQtl2It?=
 =?us-ascii?Q?BWiD2K5a2SarXocGPtG8wUx/eiTL1vEwBRts84MPG1kKyhJR6KibCLVaSHpU?=
 =?us-ascii?Q?u/nO1dZu8LDwNDM00k/RGTve8SKJF/CcvRaYF1Nt+FwfFT23jx6h6vpQtNRn?=
 =?us-ascii?Q?ZRkQD4/VTalHvLRBpOmiKYW9uKEiP9qea4KdR4ylkBFa2MVbPzuf0Yt9oQSN?=
 =?us-ascii?Q?GNSecdAAEXFM7bljdq5IxyP6piPIvKnUkA7UZWfA/x9qym+lD0f0DuZA+oxn?=
 =?us-ascii?Q?twDW7w6KNka/W3X3Ig7z4A3hdYvOkwDTHR+G6pLLXc1H/44okZl2sE07jJ7k?=
 =?us-ascii?Q?6ObFOYJ+Ytdy5JDnEkLeG8gmS59h+bTE6wcMcyV2DTLc+Fl1jRZfe4gLoa3o?=
 =?us-ascii?Q?1PzAdTuyq89J/fjWWPwvJ+8swkunyrp/Q5SwGcXK+uHg+g65uybFXdMlc0xy?=
 =?us-ascii?Q?mj60imeCLGUAefkehRGk9M/njRhBmu/sDZDsKbFI6sSK4k9W7iDI/lVoz65h?=
 =?us-ascii?Q?0x0B1PDRhyBr3+q/VcHMomXjoMDFKUtY4UFAsv7VPuOKzgrnlTjDkY7KUtGQ?=
 =?us-ascii?Q?5l2J+vKSDZ6QbK/gqiwwtcj00sTSaMdCRantg1xOaI5ZGDgvP1h6jbOXk4i5?=
 =?us-ascii?Q?+/WjC/opFE1G6nVyzcMrziUIpXFUfRp+wfU1dgK8KchFQFVzchwIwVPAkf45?=
 =?us-ascii?Q?2zdyH9tBOoeMqxz5TZJEyVczFvIZvFNuVG+/Mw2IljLEdEKxbxbzQAIA310X?=
 =?us-ascii?Q?VZH3bu3AJUbYs59v3Qugofqlo5nmq20g3nofn0XUIL3pBZifQsZ7hosrb1Wy?=
 =?us-ascii?Q?Z7rcljk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:16:48.8195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1469f8-0f67-42e1-a46d-08dc7c3f34b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7811

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


