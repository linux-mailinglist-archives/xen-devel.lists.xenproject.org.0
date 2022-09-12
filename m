Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC35B59C1
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 13:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405734.648154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXi6A-0002dR-SK; Mon, 12 Sep 2022 11:59:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405734.648154; Mon, 12 Sep 2022 11:59:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXi6A-0002b1-Oj; Mon, 12 Sep 2022 11:59:34 +0000
Received: by outflank-mailman (input) for mailman id 405734;
 Mon, 12 Sep 2022 11:59:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Y9l=ZP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oXi69-0002ar-MN
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 11:59:33 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55845897-3292-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 13:59:21 +0200 (CEST)
Received: from MW4PR03CA0063.namprd03.prod.outlook.com (2603:10b6:303:b6::8)
 by CY8PR12MB7561.namprd12.prod.outlook.com (2603:10b6:930:94::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Mon, 12 Sep
 2022 11:59:27 +0000
Received: from CO1NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::7c) by MW4PR03CA0063.outlook.office365.com
 (2603:10b6:303:b6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19 via Frontend
 Transport; Mon, 12 Sep 2022 11:59:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT069.mail.protection.outlook.com (10.13.174.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Mon, 12 Sep 2022 11:59:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 12 Sep
 2022 06:59:25 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 12 Sep 2022 06:59:24 -0500
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
X-Inumbo-ID: 55845897-3292-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LH8fyNlXtdWQloh+/Q2fQr4GzzT6f7e+W76uvbDNG8kWhLrX3q14O3BPupCLrWwyxpkqgcYhQ6vTMLNvjnx3wmZzt+kGI4SeVhAecWQ4uVZkBTR690u52aIi3LKRsbVCseFaUKIHHQyrJklZ1xryfb0ijKHM7xiRRPEYmQHOYcu6eU5n6rfXC7LY/KdqhVZifsyeO3PI5JSXbU+OXgwRCDzLBQZFtM5/XHNOqqQUvmCi1FNSD/DhXHC6Bk2halZxOj1+BrCOJD9UDK0nV57MSUZBEG9DJT/W6RZS7s5bCdVzKYdvklNhpJUwDGg8nerQXjXnCQGIyaXgH46BZTD4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niQY12MejCdIqYR3XmRD1PiRy2OZQos16SZwajgZ1GE=;
 b=HNJeZQN4NkLYVsbEHH41PzrfE+MmMRHH81vSzkGqn4ptzL8I86ST+aqbHq8iKZhB4new/+Tj4dTAhmXWgljncbP7nHepNd/gyfqEtfPhKBi88gycRWRVrDN9QxOslt0xh+BbWeodibVdP2Q1eSejBMWz8Yd/uDi5I5YoBJE4Zjk4O+Wp2/NJLr0Zp68IfW5XzrmBw6FrvyylWnPQ/Usd9X6paiaaflVK1FXfKQbMYfClC8PiloAKJC2HktHPHyHwX7pvl+CXDc4t1d7o0/KvZKBecC5O3Y6fCcE/J3NUbM1cZr399HeDhqj6W6XIkCasY0wLSmuenS9K0xN0Se6DgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niQY12MejCdIqYR3XmRD1PiRy2OZQos16SZwajgZ1GE=;
 b=grqZw+pmo8nEld8j+NKrmaCxuWNqgp4nfQMTmlmj749QGTVkWs+ZAJymm+RtykFOLnu+0dtdblfLiOegbj11KdVF3CcT6SgWb+Av48RoDQEsenSVqfXADhZvACzVxHtkrMapSwgbFCa8ZwkabeWYxhgeC0ozE1iZ21xLbK1gOUU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder] Update README.md
Date: Mon, 12 Sep 2022 13:59:18 +0200
Message-ID: <20220912115918.19496-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT069:EE_|CY8PR12MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: bad0abd5-8687-417e-b511-08da94b63de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YQlwub6X6naJ7nwSwRB3c9UbaeWsxJe9GemawNXafeDuLmmzEwScbC3e3NFgQNCbI2F/Yx5E9uiK3FKLRuK3OnNUckJQq7t6hB62g3qyt5YrlNQTYTxDVrr9a8r/dNvShpA3ibeT4Lvx6aIYy3yHZtDxLJLxMblW1KiD/7pkabeV45WHaO+geSUHogeMELXSuy5BMmsIKrePy33nrck2j9yhuA7gq5W0hBA/1urgOi4WJJbvUIdJ5KDcr/fZQ1mjPQHkpsXigdQU665155j06WBWmk8ho0Cb+lCH/J+fzInYEB1d/AQAGlPd7W5l6TGdp6NEdKsTeHWglqXDSpN1kJF5OcBDkKnwirEth9DZ69nsZeAuxhseGZuMfVb24ZV7Jtd2FE/xkzR6dv3Ua6gYkUxqJ5dL0kKujou3/pTOeeFdbDk/EapkDUtXFutmBLtuK4Oiq5jXtOFFjbLGlAtmQrOXAJalH1FNyaoGU0vxkiQjmUS+eFrkBTJx+MCNIOvxtUig0S89J18jntu9qQaunPBMN7+qntsKnncE5BnSQM8I4H3WRGSvIC7hWz2uChb79t01NOC+DLEHCLwLMmtq3vXpClTJJkjD4NvXFDLqWx5BFEV8QUy9o/uKxmcD6sEXJnxsZi6N4g2MhC/V5HMrqY4LE5BgDkcgdHBQMs02gmIR9ua3xFqTeFsnEUTa+VXfaXxjqBccdNcMVZO5VCKK9rmxwW/hdogn02Nl5NfWr0hi5yWhnTWhlvPtF+yro8jji8K0/cVYg7I7kjkU3s/PHfyfNhvFX0q8bMa2MXMPoOCCv2fzeR8gBHHeejupEq7i
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(136003)(39860400002)(376002)(36840700001)(40470700004)(46966006)(47076005)(36860700001)(82740400003)(86362001)(356005)(81166007)(5660300002)(15650500001)(1076003)(83380400001)(6666004)(336012)(426003)(186003)(2616005)(82310400005)(41300700001)(26005)(478600001)(54906003)(70586007)(6916009)(8936002)(40480700001)(40460700003)(8676002)(4326008)(36756003)(70206006)(316002)(2906002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 11:59:26.8091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bad0abd5-8687-417e-b511-08da94b63de8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7561

Get rid of references to XEN_PASSTHROUGH_PATHS, as there is no such option
and it should be replaced with DOMU_PASSTHROUGH_PATHS[number].

Update PASSTHROUGH_DTS_REPO example. The directory storing partial device
trees is now device-trees-2021.2/zcu102 instead of device-trees-2021.2.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 README.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index 041818349954..da9ba788a3bf 100644
--- a/README.md
+++ b/README.md
@@ -34,7 +34,7 @@ BOOT_CMD="booti"
 DEVICE_TREE="mpsoc.dtb"
 XEN="xen"
 XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=1 bootscrub=0 vwfi=native sched=null"
-PASSTHROUGH_DTS_REPO="git@github.com:Xilinx/xen-passthrough-device-trees.git device-trees-2021.2"
+PASSTHROUGH_DTS_REPO="git@github.com:Xilinx/xen-passthrough-device-trees.git device-trees-2021.2/zcu102"
 DOM0_KERNEL="Image-dom0"
 DOM0_CMD="console=hvc0 earlycon=xen earlyprintk=xen clk_ignore_unused"
 DOM0_RAMDISK="dom0-ramdisk.cpio"
@@ -99,9 +99,9 @@ Where:
 
 - PASSTHROUGH_DTS_REPO specifies the git repository and/or the directory
   which contains the partial device trees. This is optional. However, if
-  this is specified, then XEN_PASSTHROUGH_PATHS need to be specified.
+  this is specified, then DOMU_PASSTHROUGH_PATHS[number] need to be specified.
   uboot-script-gen will compile the partial device trees which have
-  been specified in XEN_PASSTHROUGH_PATHS.
+  been specified in DOMU_PASSTHROUGH_PATHS[number].
 
 - DOM0_KERNEL specifies the Dom0 kernel file to load.
   For dom0less configurations, the parameter is optional.
-- 
2.25.1


