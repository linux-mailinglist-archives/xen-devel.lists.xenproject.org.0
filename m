Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61A6AD3226
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 11:34:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010639.1388787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOvMS-00048g-6D; Tue, 10 Jun 2025 09:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010639.1388787; Tue, 10 Jun 2025 09:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOvMS-00046D-3T; Tue, 10 Jun 2025 09:33:40 +0000
Received: by outflank-mailman (input) for mailman id 1010639;
 Tue, 10 Jun 2025 09:33:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OYHl=YZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uOvMP-000466-Ux
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 09:33:38 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [2a01:111:f403:2417::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faaa7546-45dd-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 11:33:35 +0200 (CEST)
Received: from SA0PR13CA0001.namprd13.prod.outlook.com (2603:10b6:806:130::6)
 by IA1PR12MB9032.namprd12.prod.outlook.com (2603:10b6:208:3f3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 10 Jun
 2025 09:33:29 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:130:cafe::1e) by SA0PR13CA0001.outlook.office365.com
 (2603:10b6:806:130::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.12 via Frontend Transport; Tue,
 10 Jun 2025 09:33:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 09:33:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 04:33:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 04:33:28 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 10 Jun 2025 04:33:27 -0500
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
X-Inumbo-ID: faaa7546-45dd-11f0-a306-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEakf3QKw9GiWu0QDfnxnjWA+Tv9QnJFNDqXBnnMqMs2aynvS8auhnGwuMxVlcWKuD5uw2VLFWFrESfRF2JZFnxFv120jFveY2vhYrCRd1GT92XYkRz1L02UqGt7WJZEc0428m3XIHzYyDER32nN33RGTIn407JEetx4AC+yA1nx2hTTMsKCnf12YkruS7bOcuwVO9h03wA69qsWhMNO+ptSGybmA6YjMEJqk9tjuB6ASTHn+RDGGEH+wrDrGsM6pL+dR1speot8Hk5tY5tT/0aEVFBL5f6z9nuSj+Ca5tIHRoBxdTUm625GaBTmunURGNfd+UcTWvnbhf8dTjxa3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvFNUsnb2CLbk+fKZWtVqD96AkaMpEGpKR+v0a3kJRM=;
 b=RtvaSecFqmRGz67kUlx3GYJUMXncdGJL3X2oCduofhL1Cf9SOAeuRt8e3bgSAwg82WIUU6ei3mhUdxnBXfH9Efbjl9iSJAsl3Unk+3ZmGRWJtGAFU3ZEQon2egxTrCjyyqk5rOXnzvWbtLsD7rGJatDGl84tEDbqW27Sy4bhMV5ilc7PwUpQTnN4TEAOyhuJa9Z/IKDc2l/XpBrxDbJ1BMzHhShqZPl4VjLksREXuX/oCkwXB5q+LwB6eZ5YEI6EbgumkdCpusqKHNLyhWnWrXY1ZwMi+yPg6m2sGEc/cT4eKy0PxxfoO+ANEzgYbYfK1ElsWDjraMJxEr5XieqZTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvFNUsnb2CLbk+fKZWtVqD96AkaMpEGpKR+v0a3kJRM=;
 b=wdVC3N6zJusZ1IyoU3tF/jrzQc/2nf26ZE41sZYLvl18Q4C+EpZBWqE8ay22RtBB96/2m7e8MIHM95SRZMST1fBygwIG6ykutuZ7p5vh52M/hI0vCgvdghGNhLz3Rg0QeaY4cX7XH3wP+1xVgRwTZvA6hdNPOoT4+pHAR6H4dVs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH] helpers: init-dom0less: Drop libxenevtchn from LDLIBS
Date: Tue, 10 Jun 2025 11:33:26 +0200
Message-ID: <20250610093326.114529-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|IA1PR12MB9032:EE_
X-MS-Office365-Filtering-Correlation-Id: 1124bcfa-7bb7-4982-d297-08dda801db73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M8KOWfIPDSJYQDOvimLtxEGuwz0bUfZE+ri6FkbGZsGrqrjN/s119gbNtIDQ?=
 =?us-ascii?Q?OdR8J8/c5ZnybdfX9fXdI54wdx4Vos0lAQceM+Ye7Tybq4DaNd017FrP8tJQ?=
 =?us-ascii?Q?mAU/U0eqNW7fEkNnne/altbN4gUnFSxKotcZto3e1ak/kB8w801pdJlcan/M?=
 =?us-ascii?Q?4/gle5Y23mWuS2bBKwEAWxzr6eX152BH18sj9yW3XdGTc6+w45hv7dIJqQre?=
 =?us-ascii?Q?ilm/AnX+BdMntqIs2vPP7v5IPXaacf8+GTMQ2ssl//aeHUSFBYc0EqVtVVVT?=
 =?us-ascii?Q?n3K1DJsnavmckNlTDUT8u2G/Bug2GL1dOhbDB5Kl9WrYoF6dL1X3P0/XjPZ6?=
 =?us-ascii?Q?SKSQU24G2SjNvUrcVwaP5rCXpjG+4ZZA99hl/HtszImBgdKWDcM4ZprpKjUQ?=
 =?us-ascii?Q?wtf9Njm8D6d3TwHTbCccOJG47ktwpsHnxxr79TmhEWVUawjYwKS+8Ha4SCAV?=
 =?us-ascii?Q?HCkQgMd7pVRUU3jwqg8vLvRwkRLZWwg6qgl6V3w8yRndlVO1FxtPOTCzMl3Z?=
 =?us-ascii?Q?1x1tUY3AJT8GpERsKFhBQ3pypH9w3q/L5dKZ0ZrFAIhtnIctBet3IynWvXFI?=
 =?us-ascii?Q?YiOWrjhtx7OkDycXp0jlQEs3rLzCH7y6u49S6i3y+OMXPsKGZied8n3lyPx5?=
 =?us-ascii?Q?mBEp8OvxxwH8e/cRuXXrQ4+zyC7bXYmt7TXtB3LL22JrS2WnZjOzSKOJDX2Q?=
 =?us-ascii?Q?t0XPlLZC7rP9B7jlGgPNiV+UIPC5/pxhneIHDGbvC8yo4EeMiEmnNcXjZnW2?=
 =?us-ascii?Q?IGlqGb7B54bO+8AfktvIVzuy8tXHkUmE4a4VC4bwefRu/YM5QMgs7QLq1d8z?=
 =?us-ascii?Q?eOmhPtwX1YP7H7MhMtJkA0fFD43VzsIUbHnr91Y3SqePUUh7PLOnaIo0T1qa?=
 =?us-ascii?Q?O7WhtPYWFpMnicW4k7K/YibR/yHkrIaVhB6/8lOG1ISJ4mPIThtJVI4f+2D/?=
 =?us-ascii?Q?05iRTco3SNwNnsb+vCUScfAsMESdm4mHUfaOtSkARCZrGvOxe85bH5MdSD64?=
 =?us-ascii?Q?R6CWyDKyNJyuKoqyCKlvxig21gIRZGAL778+utrbBhsQPn3NPwCyLFP7o/y6?=
 =?us-ascii?Q?VorAOI3mj+BrvurTMkiGJXO6d7uRwTn7lFG5l1YkkoGTJu+V1ssfdeIf5rh3?=
 =?us-ascii?Q?/OrlTucLfQE7PWrL1giDhYRZgXAOdXztWK16g/N9CwAdpxmOuVIShfhQbikP?=
 =?us-ascii?Q?MwTjijgOlApYy9FxQk9ObziEQvNTj70BB4QjolsWRUhkFwCIjjZOIoWYITjD?=
 =?us-ascii?Q?cbLFkOt9Xg+OnkkbUZ9/VGsD6reitklK6yzyUwtWIZLRJ2pXk764urpCqk89?=
 =?us-ascii?Q?I9s0nBazs4TGcxHEFeUgqN/ohoXUhmAfy6d/h9taTlsJ3ch4qQuS4g3bhX7M?=
 =?us-ascii?Q?dGfQcCxtta/RJ13Y8V4pOV6oQXIEWeMgU39NxdpaCCRDE9M+NsHQ4CN2COO1?=
 =?us-ascii?Q?niFLdUSM9df7LFvlW0cGzY5Sk9CVkBI1rxMrL+MRax67MpgcitAzGx7IlNER?=
 =?us-ascii?Q?lYDTHFSPQsrmfGuwxbnI+eyD1IeSPan2OZFL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 09:33:28.5967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1124bcfa-7bb7-4982-d297-08dda801db73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9032

It hasn't been used since the introduction of the script. Also drop
relevant CFLAGS and header inclusion.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 tools/helpers/Makefile        | 3 +--
 tools/helpers/init-dom0less.c | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/tools/helpers/Makefile b/tools/helpers/Makefile
index 09590eb5b6f0..8262d9e75a2c 100644
--- a/tools/helpers/Makefile
+++ b/tools/helpers/Makefile
@@ -36,8 +36,7 @@ $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxentoollog)
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenstore)
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenlight)
 $(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenctrl)
-$(INIT_DOM0LESS_OBJS): CFLAGS += $(CFLAGS_libxenevtchn)
-init-dom0less: LDLIBS += $(call xenlibs-ldlibs,ctrl evtchn toollog store light guest foreignmemory)
+init-dom0less: LDLIBS += $(call xenlibs-ldlibs,ctrl toollog store light guest foreignmemory)
 
 .PHONY: all
 all: $(TARGETS)
diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 91edf17b6cef..a182dce56353 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -10,7 +10,6 @@
 #include <xenctrl.h>
 #include <xenguest.h>
 #include <libxl.h>
-#include <xenevtchn.h>
 #include <xenforeignmemory.h>
 #include <xen/io/xs_wire.h>
 
-- 
2.25.1


