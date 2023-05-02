Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1649C6F4DA4
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528860.822568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYx-0006qW-FW; Tue, 02 May 2023 23:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528860.822568; Tue, 02 May 2023 23:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYx-0006o0-Ax; Tue, 02 May 2023 23:37:39 +0000
Received: by outflank-mailman (input) for mailman id 528860;
 Tue, 02 May 2023 23:37:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzYw-0005Si-AY
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:38 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5111dbf2-e942-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 01:37:36 +0200 (CEST)
Received: from BN9PR03CA0347.namprd03.prod.outlook.com (2603:10b6:408:f6::22)
 by SJ2PR12MB8651.namprd12.prod.outlook.com (2603:10b6:a03:541::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 23:37:33 +0000
Received: from BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::85) by BN9PR03CA0347.outlook.office365.com
 (2603:10b6:408:f6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 23:37:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT047.mail.protection.outlook.com (10.13.177.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:32 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:32 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 16:37:31 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:31 -0500
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
X-Inumbo-ID: 5111dbf2-e942-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOI3UsBnZi4ADCLNm0yqO8Y/wzh7xghvMpxvyh3MCnsrMZ8Ky7vfl8I+QHrtUg9oCKhturO0n71UZq2frso6yCbXO1lWnREJAYVt+K5dOFXLXE5Olsb5IMzkIZbHWa4MJRTAV1GZoRMPaHHKWNzes1ypE64DR/i3jQ7gjrJcY5nzybAv+sIyq4F4Gqzt1+Ia6DGDpCyQU+Q8oRhQCLv2jb1/xM40c4lntw2shxo6bJlhiOlUKnpXAEmzWOylVL/xqM3BeIbNvIFNoE8fhlxRNvUidpIhPLZddZ5El8GMvLYMreJAs2P8m0paW0cAu204rYjZjQuoXmbvhbnrSu3N2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=InGULvt9rlpPWnhP/U/d5fplmSZzkHYKMu7e+WH2tT9AS3c2hL4Dq3egm/4Z1H6DbsJtozSV2+sMFUDHG+33u0THnv4iIJVSczrpgY7e3MUmOsFhuQBs/MDiZvNH+3/RlhpkperW81txoUf/SMeypvyc5tJXtDjhrU2IGucn82LaDOlTpcxtjHoWTMfuYvIJ4OtfcwpEzsyzQv90HuMBoX8PoJZRs2HNYWh1rfhNP3fJv8X9NhchbS6Ctf/JC2J4JXW//d8MP4HgK8OFaxqOe1xA4O+hTnUlmYkBgD/92aHxU79MjgtMLGdwThRLqZ4mUcz1diJP9pAQpI1IcTvd3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=28l3iP1mztYxC9ocTLWhJFHIYBjUtI9s7/WBjkQRkkotPrsiTA6R7IZFB8xnjitJVFkqe3/nV5tWzqSh9baKAqazvjCRpAUdxikLGeiUVEJxydzVVZQ4Ew6+wB2PkpqX0uMkY52eQTctpOyzPUjNnkHRb5BI9Ex4esR615JLTX8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v6 06/19] libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
Date: Tue, 2 May 2023 16:36:37 -0700
Message-ID: <20230502233650.20121-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT047:EE_|SJ2PR12MB8651:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a6975c-c9e3-4350-bdb8-08db4b663375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EUY32wrrKmUTKyUR8ekT4xiIwr4sbHJVwToDFSGra4BowHtWKoGqIm5p0h6+Qgth+w3gYRYkrKSsfkbvbxKCERjp1e3zRcwEUn7dOU6eYzEBTq7eB7qBPsZwwY25G1YOvy1WuzHlJwnMppbWlmNUVgUwx5LffnAlc89+C8zf5L08ZBorO02pWjexrbqKDRb72CVPYQyariwLzAnJ77dqPILNvtjP21+ADxDE3Z4a07oVMMKyNHzEEcvxSejnQSk25BDNpeLDRhtGgUTljhCgK5xtsllZke95HvqWZdZ5MkUp0w2QrCCKZ9DWlQ07QGGTu+p4wDjVkeRqpQZjtKiliOqcVXedzSi3XwtZsovNCpCrf48k6I5qQNYoYd+PzRyxvvgDWnfAloiTEqCy8MeQcdCyvyfCaGHFAotjM+QWH/B9v0I/bm1IqAWPOMJ5rYA5hRlgDaSyWIJdlzF5GT4b9RPoA1rn43Ls86U6VvzRBhAHoxlpyKFepKIp2ujp+rl4ODmOlUkNX3NT7xD5/BSn2D6qOhiWyR5ROyK8lQ8L6qH9mo1zPnxrOYsuxtd23yqBgqBFJxXcbbt8fWt0dDCU4P5VVeTks4mE05PDqIykKjB55SBT87i2U45dDrN443QULEJ3HL/8wcCFb/02ahhUWVsgWyih0V45Q/95FC/pbPNUqxtX8kAMfV8XuXij+uJfW5ozf9i6kSqajqkauDzcL66ZN0hDofsHjnXnzafeWXI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(1076003)(26005)(82740400003)(36756003)(2616005)(41300700001)(82310400005)(4326008)(6916009)(36860700001)(336012)(426003)(316002)(478600001)(47076005)(70586007)(70206006)(86362001)(83380400001)(356005)(4744005)(186003)(40480700001)(81166007)(54906003)(44832011)(2906002)(5660300002)(8936002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:32.4690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a6975c-c9e3-4350-bdb8-08db4b663375
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT047.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8651

This is done to access fdt library function which are required for adding device
tree overlay nodes for dynamic programming of nodes.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/libfdt/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 75aaefa2e3..d50487aa6e 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -1,7 +1,11 @@
 include $(src)/Makefile.libfdt
 
 SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
+
+# For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed during runtime.
+ifneq ($(CONFIG_OVERLAY_DTB),y)
 OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
+endif
 
 obj-y += libfdt.o
 nocov-y += libfdt.o
-- 
2.17.1


