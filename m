Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B82A77EE6A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:40:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584993.915967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR42-0004Od-5P; Thu, 17 Aug 2023 00:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584993.915967; Thu, 17 Aug 2023 00:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWR42-0004LJ-1O; Thu, 17 Aug 2023 00:40:38 +0000
Received: by outflank-mailman (input) for mailman id 584993;
 Thu, 17 Aug 2023 00:40:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR40-000280-UW
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:36 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acffca5d-3c96-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 02:40:35 +0200 (CEST)
Received: from SN7P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::17)
 by MW4PR12MB7000.namprd12.prod.outlook.com (2603:10b6:303:20a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 00:40:31 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:806:124:cafe::42) by SN7P222CA0007.outlook.office365.com
 (2603:10b6:806:124::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.17 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Thu, 17 Aug 2023 00:40:30 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 17:40:29 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:29 -0500
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
X-Inumbo-ID: acffca5d-3c96-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R46mwtsd7g9ad2DvXmRzahH0CgVKF20SRv2NsReGcW43HlL0enmUf7s8sJWgFl6USdthOw8CbaZ7BfVW0hkIA1UiEFuG0tEvIM9q0rkBw+C6PhJxu1G2dCk0/7vh40M+voWPFDzHXbcj5B6o/zxTgItkZdKE/sgedoKNklY9eRLGsPyEiAjeY8GCe5yqUtVFQ7X0QkiS8G+U7nz3BMcgwOQb5LKSIJh0h33snVIsuvc8vpl+BLcKftJTpx00BiLz67eLLDVTSXMNWDvJLjdplsD2avk937N1a6vjEkbq9EdoC8d55RohGW2n3MwWCLUgp6NX+SODcWysCv+/lR+UUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=dPPIHmttSvXNsuHIXUyM03DukL2zOU6wGYrK9Tu1N8Vf/AEU0/x5yO49nT8Uc+1UOOFP2608Q+f76/Az79WAHe1fvkwMU+lnirbQ24DyVv+C+IeUYb1DnbPT88bzfRDsa4Rq/CIYtFW8wBzx3EkM0AGYgt6AB/50i7NeiG4ZKMnHtbWhV+4K9VFqKnhQpvYQVrp/2FUuXd3EBa9r2eK7aayhSFLFBlRHNmY0pv3HmQIhzrdm6Xd9IFQpqzhSiDHBM4SRaWvJDDJH83H52+JccIrer+lG1d5Xlj/d6jaeptymFSlyfDd0nIdShO/u/faDnTfuZLxiWcz9iy7gVhB/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=YKeBxZcym/0TplfZz7+TiM9RNF8mIcIyYvWX5AKvJOLPdcQ2CXoQSgVwGgZyHEG9+MgfLbLYMdQyB2QOiY6J5RqmcGGgFDdqmIuJ+mXw8BYfmtYeVrBHD4YZjpda5m9BNZoRG2HCAhgkcoKK2g5NM7GB5nx7vJM/7En6ChdIPZ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v8 06/19] libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
Date: Wed, 16 Aug 2023 17:39:34 -0700
Message-ID: <20230817003947.3849-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|MW4PR12MB7000:EE_
X-MS-Office365-Filtering-Correlation-Id: 70737f81-6639-47b8-c9eb-08db9eba8f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JQhCZw3myDdNiDzBWvYyoh82FHDXAR4PCAw9Yee4KVqhdQglWWCENt3n6d+zH+uXSsytL0lUv53urY6vHThwzlmr/y/VfnviSMx8PE8DqLbBDFFgix304ph1amUkrxyijFMajNYkAr8bFfccBWAq50Cizngol5zzMzJryUOiRmbE0yKkEXPXxhzARJyr3uSyOelJWUZQDg7Bk+8HBlVQFR/QCriqBQI60AohMvdS7hb+Q9r9w6+vNaEqlwkGXsNIVvskOCRThx5gvKt5uzGaRitzBkzJBL+m9s+9ZJpHS2FWOb/AujEpi0ev3vhA6B1faNRu3Btybf32GFWROiQLHYduYi18Mlf98zJXa1hqv0i1BUN3wm1Y56QAr5fKO7X4JUlNQib1TPObVcfYKbWZ5TEGGKlmwHDdZdV4Ka3APywjyhfq14Y36cOtDQQTebuPmTXnGIKIEUD0LQLuCAzmThiy2Lv2Mmqpn0CHgfK7xSFSSH/fzrewJX0S9tqtX+uCPxYkWc8ym6JE1wNvlIn0XpXWuiR+qWyH/24i6rLAmP60MItDr/MUWl31q12FqQdjWWsqOaCTFEjedw4WdeLnlvgdE6VFwUkjbv54Dp3Q9GcModqbsk33b4HdqKMhs4rkaI62cx89R0ABmwHikAVsZ8C3yzgXeM30ep6KxkxBTAX5S/OKhpdIGxcuug/u96g1TCQ2fYdpIBmYmnetteReraM1bq52aGg1w8zF9SEIB+0oRKrVELgXXcvWRniWnMbPOzg5lR/ZJiwcq156kudWoA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(4744005)(83380400001)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(6666004)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:30.6204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70737f81-6639-47b8-c9eb-08db9eba8f35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7000

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


