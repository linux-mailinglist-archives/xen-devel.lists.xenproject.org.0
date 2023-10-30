Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B9C7DC350
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 00:54:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625433.974722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxc5M-0002mI-Uz; Mon, 30 Oct 2023 23:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625433.974722; Mon, 30 Oct 2023 23:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxc5M-0002kN-Rk; Mon, 30 Oct 2023 23:54:20 +0000
Received: by outflank-mailman (input) for mailman id 625433;
 Mon, 30 Oct 2023 23:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j9+r=GM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qxc5L-0001Gf-3k
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 23:54:19 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e83::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2da9b7d-777f-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 00:54:18 +0100 (CET)
Received: from MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::7) by
 PH0PR12MB7887.namprd12.prod.outlook.com (2603:10b6:510:26d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.19; Mon, 30 Oct 2023 23:54:13 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:303:8b:cafe::3d) by MW4P221CA0002.outlook.office365.com
 (2603:10b6:303:8b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28 via Frontend
 Transport; Mon, 30 Oct 2023 23:54:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 30 Oct 2023 23:54:12 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 18:54:10 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 16:54:10 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 30 Oct 2023 18:54:09 -0500
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
X-Inumbo-ID: a2da9b7d-777f-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmPH1HjQu9DWY2+R6Iu8JyGqJ1ZOErfrlHwbgCN0omGgGrTsDlHT1JxwEPOlPX+nQQSdP5c+PY9/Ih/zPucjH99eqHeqcdpmHRpcE/iHfuSvWFVOq3fHt6QEMBCT+Rl4yL094AfoVdOigjZgI9bTk077opBwyVD3b9022EaqJRoEeCAkRzdUrreAAKX5KD0bA0qQxaoDN7zUK9Ip4Gx3OSltBmFoGlze0lN0V9uOIAC1/mQ+JUESwhq2G9URViKnZj5qxBzvQr5APA7vSt9n6fFx4FeAkBzQKfj8DMLZ0yNEmc7pzV0HU3fs9g4kmDQm1lIPWVQDFiaeKiUGvzs5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcqRDhU+U2f04Uf/nmVGrqD/iilRRWwf9OkeqXO/Q44=;
 b=dUR3FT098V9T/lBZP/xYLTfdF9AAXiKXyELoWkJsfQUHcIRGRRFItijFy4Z+M3lBYbvSz6uNTqBRm2LtSp8qJirBnB83SJUnDrHGNDkVZeoJ51YAFpz17TG4tqcu01+lkJwTH4yBK9s3T6r8EAcVK/NeObN+jmqPZlb6wPReWmv09ywt9W32ZYMmjRhWPVnXilSBsHuGStnXSseL4kpbgWMzR3wXxbRwrqHdzqMyQcDVhNhOPpXfrF+ArlTfmLQYYL/Krz/OjDuB9T5CTmKz3VKvDbT+F7a9SuE+kqkPQmwf10O+Z3BUCFdW2hGkVsyQPmDIu/Dp/Zg6SX6mJHpG7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcqRDhU+U2f04Uf/nmVGrqD/iilRRWwf9OkeqXO/Q44=;
 b=GAMseXUtWsCo6i52VOL2Y1SqoQmUalQunsVWlfX1oxL9y6QF+6SQgYX0G0fBnafaBth9MxkvN4k3f+NwsEIUEGfrcloc5vxL3fTAvAhV4f05NfLq/qBmmaPHr841nCYgY2UYyQjFh6Vvt1Q6NIwzCnlLjNF9aeg4p/NJIhJ/hn4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 5/5] [FUTURE] tools/arm: enable vPCI for domUs
Date: Mon, 30 Oct 2023 19:52:36 -0400
Message-ID: <20231030235240.106998-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030235240.106998-1-stewart.hildebrand@amd.com>
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|PH0PR12MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 465df51c-59f6-458c-953b-08dbd9a38476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+JrTeFOuuuJmq9HbpuZLojEPc0+AAIhTiNHBkMl2/LGg6MFioOBWO4mbtrnrtgiT41mvSiibqwScfBX6jmt/CviehCPeJS3I0qGjc0VybcAMGwDXXPdv97QcL8dPSrJL95JbDybvtLHZyCRPb7FVBLBoU9fPyZ1QWet+a0yRHrgGZ1E1gb/cYjH2ZX4Krwhy4m4Tc2W1zuurqp1NWjXX62LEcLfT/Js4vjgrtwA6DPX10ls6HTfxdHYiHIx62yy5Q2blj3LVRfxEEdBLNtjVXTVkh3FSdDzivVMqWvyxN310bSZeBjGb6tuni10KuCFPxcivgYK0or+R2mgUV32YQUKFpl8eZyLgUJ8RGq+W+2j5Z7mvLeVaO/6rXbz+m1lQXqsoEApQ7VtRQ9Gy00xNJgSNSUxJ47juQAFfxadVdocqs/eGrp/dSVOXbKpelgre0L+BBZStJdigP6CAzQrMF3RkIfUQrtQgM/G0BwHn6tc6Z4tVqtKuhp1bw86dPGbAJmPQpD/A+WbHr5NdPPq2EJ2GBB4TI1HHvE1sp5ZUzyraisLZinmqBGnRKL7bmlAlT8qu+92kmnj9Eu6rCaVUvdvzx+48HN6+F93ZOZGoKc2rXkm34bDFSATBnRSDwkAWUGXwtaYK6Z9OFMSECho24nZu+X8L0lxvA2rng4xEyob5M49CVKyEiOTYuPeZA5bs31Q7+5hi8yIQC3eGBEjWR6TYSdIsi5NeaFhhxQYrnbFSY9QSSS6m9k97hPGViTyr0mCZrQ8IOb04Z72+n9WQNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(40460700003)(44832011)(40480700001)(2616005)(478600001)(1076003)(6666004)(36756003)(36860700001)(426003)(336012)(86362001)(47076005)(54906003)(26005)(356005)(81166007)(70586007)(8936002)(70206006)(4326008)(8676002)(41300700001)(82740400003)(5660300002)(6916009)(2906002)(316002)(4744005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 23:54:12.6755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 465df51c-59f6-458c-953b-08dbd9a38476
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7887

Set the vPCI flag in xen_domctl_createdomain to enable vPCI if a pci
device has been specified in the xl domain config file.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Same story as the patch before this regarding the [FUTURE] tag.

v3->v4:
* split from ("xen/arm: enable vPCI for domUs")
---
 tools/libs/light/libxl_arm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 15391917748c..6daed958e598 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -222,6 +222,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
     }
 
+    if (d_config->num_pcidevs)
+        config->flags |= XEN_DOMCTL_CDF_vpci;
+
     return 0;
 }
 
-- 
2.42.0


