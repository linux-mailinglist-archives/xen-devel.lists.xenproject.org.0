Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1066F1DD1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 20:10:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527487.820147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSXw-00074v-S1; Fri, 28 Apr 2023 18:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527487.820147; Fri, 28 Apr 2023 18:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSXw-00072U-OP; Fri, 28 Apr 2023 18:10:16 +0000
Received: by outflank-mailman (input) for mailman id 527487;
 Fri, 28 Apr 2023 18:10:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSXv-00072O-EG
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 18:10:15 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20622.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb62dfd4-e5ef-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 20:10:13 +0200 (CEST)
Received: from MW4PR04CA0303.namprd04.prod.outlook.com (2603:10b6:303:82::8)
 by CH0PR12MB5282.namprd12.prod.outlook.com (2603:10b6:610:d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24; Fri, 28 Apr
 2023 18:10:10 +0000
Received: from CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::d1) by MW4PR04CA0303.outlook.office365.com
 (2603:10b6:303:82::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 18:10:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT085.mail.protection.outlook.com (10.13.174.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.24 via Frontend Transport; Fri, 28 Apr 2023 18:10:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 13:10:08 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 13:10:08 -0500
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
X-Inumbo-ID: eb62dfd4-e5ef-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ET0JH+k70M+bUmA91gAXKdEp6HFlvmxEQOHMMCCZcrJnmjazsu4Sm8qL2pmdUGW8nhw/7wH5GcUMyWhh1TZEKXDErsON0JipUo0km+Nzpc3tUCmflmY2vawIcJYVBQ84sFBguRZUFwk/s2gHzfd10l4GQLcMxqFBXkoh23IyA5aPH8i7mkvpVw9zbHmI6MoXpBZ47+76IxYyI7MV6u7bCi9X+pWz/j9cILWxiFTdLE89dLT8cMcQwHu4g2aseIvYyAts713nN+4y+nZggWVOE4iojt/wKEtPVArWuWMNNaRaUZbTF2zjxv1JzxbG8QhjoHDAQJCy/K0ugbs0X5/3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myh+PukQA6Z4gYCi8cMS0oYES1gEx4Q0mtnGq4k4UKY=;
 b=Cey6eQ6eCRKJdRbTdUwWohear6sl5O75BHw4jAIsj9rZyzSWcd9niWuqcWvxFjHljTuCEDK4AtoAKK2nJcrgqIySTvPB+7POAgS2Qp3Zo5L0oGtqH9kgi9vAGVG8fTo+n+tiiRyHL4THBu7TbYgvvoNJmFxvFxkdOda0qd1qFWkGA+nL4xMli78RDwe1br/sk34/2z//2Efhe6APB4S/VV37t7C2GGpnJV4BrDWDfBtLBsqNKxkbzbInmaEbHcFDdHxLXQpIt4zp54EMeKmUN3B9wi0ij4PYpwTcVWsarb4+CCdrAZH3iHtEmdMhWd5zEVz/NbfCaqbAFsdyip/p+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myh+PukQA6Z4gYCi8cMS0oYES1gEx4Q0mtnGq4k4UKY=;
 b=FnQQB28wgsrICb6IDg07DASzdOhOkCcM7bsx/n/RypEN4IeHCB1YgcXajPjH20e7YphLRq4A8fYLsyWXIos7HhUSsoD9ZJ4AsziQRQ6ILEMyGANJw5CwkZFrdkSzws9VyneZONCkIuTLMSPpHKbHUqn3LlOBGl+/jHh2qVG9OOw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <bobbyeshleman@gmail.com>, <alistair.francis@wdc.com>,
	<connojdavis@gmail.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN] xen/riscv: Updated the license header
Date: Fri, 28 Apr 2023 19:09:52 +0100
Message-ID: <20230428180952.22708-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT085:EE_|CH0PR12MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8bf205-d5bc-440f-bb13-08db4813cda1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uLCtab+tHg6IRGqgtppQDhuHevMCBSL0bsxylVvAW0i5WA9Bg5c+HBMm/v/I+LOmk20iNH9bUhGU5DY1gw5D/QKg1XxnrLU9tKu2Rd/gNjK6Up07fA4H4ViupTSBwBaXpYa51R/iQlYcEznnaX4pkrR+teVEij/zKRSJyERFAprefIYdgoWEsL0o2wfpa+6xtFIBK8ixHCG7UTrW9rjQYhO2blBx8+D3IZ2u6j206kyqb2qQycyIdJymWAi8wyp/y2R5tbBp7Ziy7jjFMqUx6O5ka505fhOFC1Rc2jklj+o4giUipMSf7bkq3BsD39uFVT2oO2PxJSzRzs82juhl0xzzBcAwiR7l1b2PJLlkIbQbN2pp5/uoOzjpBNCKho6gmnYeJxcIl3yOSQ8r6CmPbkUgwQd3+LcmgMtvAr8Zy4Ibn5cYlU0oqP9grCIqj9TLUxsyygr3OhXi1HtMqtYmxRx1/duwctgGV23Okqw4j/+8EN4L1vsvpIYDmPkEnWN/K877QVtrIX9/BudhN4fj9d3ePmcxc/ZYl47rMsR0fCF9g3apnbhIJj83WB7pVvtn1qg2CcfUhIMlUXR1cr2bkifB1TTM4CdNl6lf0GkQ1uvNQbQrmzx8Zy22VQA4OcOVt7OX6bF91sykRfkRN6F+f8VPDHa8ZLgmR3Fk29BlJoaAX19TCI9yaKSQXZZirWKNO2+f0Azp2odtO7a/0WSuVEvD3esfvk7gZS+Wd+paK1A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(36840700001)(40470700004)(46966006)(186003)(426003)(336012)(6666004)(966005)(36860700001)(54906003)(1076003)(82740400003)(6916009)(4326008)(26005)(83380400001)(2616005)(70206006)(70586007)(478600001)(356005)(316002)(47076005)(81166007)(41300700001)(2906002)(5660300002)(36756003)(15650500001)(40460700003)(86362001)(103116003)(82310400005)(8676002)(8936002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 18:10:09.2845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8bf205-d5bc-440f-bb13-08db4813cda1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5282

Updated the license header in a separate comment of its own.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

This was highlighted in the following review -
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg141930.html

 xen/arch/riscv/include/asm/csr.h            | 3 +--
 xen/arch/riscv/include/asm/riscv_encoding.h | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index 8215562343..be57dcce1c 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * SPDX-License-Identifier: GPL-2.0-only
- *
  * Copyright (C) 2015 Regents of the University of California
  */
 
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 43dd4f6981..58abe5eccc 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -1,6 +1,5 @@
+/* SPDX-License-Identifier: BSD-2-Clause */
 /*
- * SPDX-License-Identifier: BSD-2-Clause
- *
  * Copyright (c) 2019 Western Digital Corporation or its affiliates.
  *
  * Authors:
-- 
2.17.1


