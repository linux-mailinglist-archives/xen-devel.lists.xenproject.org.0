Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5570DB4A407
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 09:43:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1115866.1462325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvszh-0005yU-9A; Tue, 09 Sep 2025 07:42:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1115866.1462325; Tue, 09 Sep 2025 07:42:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvszh-0005wm-63; Tue, 09 Sep 2025 07:42:25 +0000
Received: by outflank-mailman (input) for mailman id 1115866;
 Tue, 09 Sep 2025 07:42:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KX1k=3U=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uvszg-0005wg-1d
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 07:42:24 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:200a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 846e9651-8d50-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 09:42:22 +0200 (CEST)
Received: from SJ0PR13CA0173.namprd13.prod.outlook.com (2603:10b6:a03:2c7::28)
 by DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 07:42:18 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::6a) by SJ0PR13CA0173.outlook.office365.com
 (2603:10b6:a03:2c7::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13 via Frontend Transport; Tue,
 9 Sep 2025 07:42:18 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Tue, 9 Sep 2025 07:42:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 9 Sep
 2025 00:42:16 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 9 Sep 2025 00:42:15 -0700
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
X-Inumbo-ID: 846e9651-8d50-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpCWpkkbSN4u7Yo0RRkLXjJYUXd3RSw46zE8sTgfssXaSXMvcCWDNmR0rrXKquKYruPHbSyK0wJ/pt8VLBJaJ8bEeBFntqsrFvyuTUDIPMGDdmgiHv8e/fVBGMwDzQ1Xf6KNWe48ai7uCzlRTkE+QBkf6wC+DY3qgqK5Y6w0uUlTIn6RZ08spftsM+kXkgo0P2xnp0LfF4XoaLqkokOvcliiMOY9LUJLw37JLjn60xB5Tly1jQOmaSp5SUnwlwqgyPMuK8k39OWC+kD42YueCxd0p++E8s5gbZgXNcbd8WU6S1of3ESL8qeD47B2GN03l3mOCMKJXjqokMUYW1/NoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MR7vzHeHpkiZA8Ij/yUkkenqrBbLVUu1GJxFj31LfGA=;
 b=FVLLYSAmV6BJ71PUatiZsSIStOb9UlBQkzkJhTMt1ughfbnSpqzskKLkbmIZj0Q0AvEJm3Il+dXkxt06xbTRxe6BihTG0JsBonIb6I6ltzPORBBjSdMRRk6lBTAYciWvpKLpSA7FyEhTDHqTzOX40UYn+cyuv38MBGR2gnKUtK55PUN6H6Cnf2iaSosqGwlSlJfI6KIEFDxkpiqoOMqeVPL2FfodJXQM/wcfJ/WdNg+QJt6WnKFq4ns4BFoVmLBUvo/0RTgsBiUhACvfNyQQE8/3htNq2t6BXZBREPYQ/IohuZTagm4ru6ux7RyVxBDah3YsIWt4MU8YSzH6uZUJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR7vzHeHpkiZA8Ij/yUkkenqrBbLVUu1GJxFj31LfGA=;
 b=wUTZO3hFqPVwIEy5t6BpW/ienDL6spea2oW2bM75m4vypdWG1sDq4kY0YUhefPiyBPWnFrKGs6xsKxxpvVapFtQls6HYc2ROTDxjsGuHyEbqeg55L9e4t8tIzYzjud6A7JQw309jGGzLqqhuRD7Fcezd6OycMQ7Hs+eETPy8TDU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder] Use LOAD_CMD by default if not specified in load_file()
Date: Tue, 9 Sep 2025 09:41:41 +0200
Message-ID: <20250909074141.7356-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|DS0PR12MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f742a6-98b0-4add-974f-08ddef746683
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CD9ZJMAfPxVasvv0h23QHvXwQQl8ggqDNK/PFRM/I5ggH6AlDl3j9g4iZDaS?=
 =?us-ascii?Q?Y+sgsdYEH3talqz30ksV0h7TvQgF2cJRjoecjG5aJoci639phftJqHQqzv0P?=
 =?us-ascii?Q?4xeNmxt9FUS3tsJVq7eLMxd/1c9toSam6FRtpMHyFqsjbCu6JndiEjFhZ+ef?=
 =?us-ascii?Q?/PaAmmY5reQbILk88Iw/fAaFl9pTlESybMAK/cHwqBMsHDsQER30eKDpIp6n?=
 =?us-ascii?Q?BpzrCEQ8eNayzQmYsn/hRderJkmtCjYISZFAOGl0DWfmEFCd7Hs21/amWgKY?=
 =?us-ascii?Q?6wn8QcI1StXArRG3J/dFQ3gTSbapSJOTBoK/tvqTteTeWOxf4tnFL0xliA8g?=
 =?us-ascii?Q?0566JkNC8w+W/c8HMI+8w95FT4B2fhnsm+Qjq2f2j46+ctsFH9Bqb5ID3qBP?=
 =?us-ascii?Q?ua08SF3DyXyDmEQoXIe6taGXSeTAEQAn82Jti6OuBNoWan8LwMmyhXmeRJEI?=
 =?us-ascii?Q?bR0goRS7m3hCKEA2jM4Yqtdh2nDZlhztSq8UyOBVlw5Ov3ND9yJpSXKLEJwq?=
 =?us-ascii?Q?MD1T5uYumMrSsXL8cJTgOIW02oFok8hyqEC8nDYFSF3rAkaTa/nQDQovHnJ/?=
 =?us-ascii?Q?GZb8JISe8rlZmWpMTMutPq3FVIukB822tRs/ZPGYQ+sIb1eRBhDMzj13g2t6?=
 =?us-ascii?Q?WhSDnQs+C5rI+rhPCF/f5RcAQ+h1/Po4BR1x5l9J91RvyFm1vlAT0rErD4Ev?=
 =?us-ascii?Q?GLFW5U8W1x/IfgialXtFfVUFysT9KJh//bNS+poUaS4iyte9LcMtMUIv7zCA?=
 =?us-ascii?Q?Ns8xwHltoYXi9CVi+oDGpWp8D/m8nX8s0BagLT/nDpzlxiVwh0XS74Sidp/Y?=
 =?us-ascii?Q?MI4yu5+3ei6qqpuF8ajc0Ui9ud08gVYA+5BTmpkydVjwa3n4F0c6/fww4JQW?=
 =?us-ascii?Q?1sK+h6WwTzdfJT9+MijlsYdG0Cxk4W9IRnwXdsof4TD2kgr4+4CRYoNTwBV/?=
 =?us-ascii?Q?6czgJQ2uP/ZgFW+Fwku3OmAF+09JWF0LGtAY7tR4WF+F1onchDv+a5hrS6E2?=
 =?us-ascii?Q?8HdqPAPg1S+bRZ+Ad9UhFB4iCUQo4IV+BpAhz+UIEPup8yNSv+ACPDyauSF/?=
 =?us-ascii?Q?d8zp7j7jYytFfSkGFPk253wLcm3E/yhVY+Z6bGnYF7ZAZJuf9qeEVgeU1fr2?=
 =?us-ascii?Q?8ARpB0zVd+TeCd6RXjbj7s2lemDG+x25ls5XD+duSS/lknq36BbQWHdWD3lD?=
 =?us-ascii?Q?g/82HKT/KkHxsCwJRRHOFcm4JGeIV4Wo1MGUiq2R65yDFzt68W0GovyZWcWj?=
 =?us-ascii?Q?glzQJJs7NOWSitvEU6lq2fYl0ZGn9qjTR/fx+bNeVAphVMU/bCc8BRAjj00m?=
 =?us-ascii?Q?WMOtQEB+t+rOfoEANwgya+5Mt8DAsJ2evvHBms7fMVRT2JyrofvNdM7K+3OF?=
 =?us-ascii?Q?K79SbEa/Zu+3u/8r+E2/XtPwfyv2Q8QYKNlFH5Djo8QKzHTSJ3C0MLzoPFWb?=
 =?us-ascii?Q?CMYeLf1WVjSbi+ff92xb0rBx61yCF2uS33PGIPcdGH5uVaqfV4U9PXmSsUcb?=
 =?us-ascii?Q?zAwwcdP8tBTbcVpkPDVLLhqqR2xhroaDAP23?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 07:42:17.0728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f742a6-98b0-4add-974f-08ddef746683
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7728

Commit 061d6782756f modified load_file() to take load command as
argument but did not change all the invocations (e.g. loading standalone
Linux, bitstream, etc.) which broke the output script (load command
empty). Fix it by defaulting to LOAD_CMD if not specified.

Fixes: 061d6782756f ("Add config option to use separate load commands for Xen, DOM0 and DOMU binaries")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 scripts/uboot-script-gen | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 849b8f939e81..4f9261035d73 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -736,6 +736,12 @@ function load_file()
     local base="$(realpath $PWD)"/
     local relative_path=${absolute_path#"$base"}
 
+    # Default to LOAD_CMD if not specified
+    if test -z "${load_cmd}"
+    then
+        load_cmd="${LOAD_CMD}"
+    fi
+
     if test "$FIT"
     then
         echo "imxtract \$fit_addr $fit_scr_name $memaddr" >> $UBOOT_SOURCE
-- 
2.43.0


