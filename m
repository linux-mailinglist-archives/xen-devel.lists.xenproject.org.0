Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A94A78F7D9
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:11:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594265.927589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwRB-0002IP-L7; Fri, 01 Sep 2023 05:11:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594265.927589; Fri, 01 Sep 2023 05:11:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwRB-0002Fn-FK; Fri, 01 Sep 2023 05:11:17 +0000
Received: by outflank-mailman (input) for mailman id 594265;
 Fri, 01 Sep 2023 05:11:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGZ-0001Hn-Nl
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:19 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 711858fd-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:00:18 +0200 (CEST)
Received: from CYZPR12CA0021.namprd12.prod.outlook.com (2603:10b6:930:8b::28)
 by SA1PR12MB8095.namprd12.prod.outlook.com (2603:10b6:806:33f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Fri, 1 Sep
 2023 05:00:14 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:930:8b:cafe::c5) by CYZPR12CA0021.outlook.office365.com
 (2603:10b6:930:8b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.25 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.16 via Frontend Transport; Fri, 1 Sep 2023 05:00:13 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 31 Aug
 2023 22:00:07 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:07 -0500
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
X-Inumbo-ID: 711858fd-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dccIBgjs7bq4UBoNXojMJajOOXWXcHlEyTdhA3hVTib0XBKFCIVs4pxWDfeSi8+QjFNvftDnvueKA2qiY/yi6MxhGsWEzfaOssQVev0CnZ1YMyxAU8J8aNUZbc/RQqVpRKATE8Q6TVxiPOXxZWelaHhVNCDZ1g06sRnG9ke9qpLNp2zyo/ZVfO51NGz0PWYO5x3Lfh1dvB7hgIGE9xBdKh6waeUNVEAg1yDjoHbIk4UCks2kYfH1qBjBU0UccmRcUfwpmzm/eVzJ+O6UBcmUWUgoRq+ct2tLetoN6ETHr3Iub1P5QbK1sYWnWUG58psjqMYNNelksEsEzl+sMcHeCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=CsdQVgIk8lVXC89MYuh1VnOveoGXyF73E8F+D6Hyd5QFEZzR4ZVXyVl+Hqtm8pLirV24+Xm2mS714GLY8rI7obimhTGjUaHQul8GjarEXcyTW/2ZfTPftCSeOMZRSjoUS9/SCqk9TamXAvjRg8xZrIA37jgEKaAuDJvsNCwptZIzZqcbZyn2qqcacS6zpvNWa/QtJSw8fRHvmjoPhCiBTzj95NjSxPQrfvogSuqL/lErU9/tt56kTs5lyzhNUBT5499uN7Xck5wi2ZreZ2oXkyyDgyUmkfCnqAzdhY41oc+YIK0NY07xaQFJK3oQHQFFPZryxaNnZ/J5gEZuUM0D0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aOH8wbfxJ3CDB9n8z4otIPVVDXaY3ZnHxlpPeTlbO8=;
 b=W2atpgT1FseznPwSfTMWMqm7HLlAHsEsuWu3PrHxODHX8pzoU5i7j/zfmE4vYipMHtG1lHq38++uI7bxS6YfxA80PYLa0tHv4plCgJePRCmGx7mTO3CY7OysGH4vbM3dHwFlSN42jXEVzdTsWtzDGFiDvjXrEZhyMNVpRt4egv8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v11 06/20] libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
Date: Thu, 31 Aug 2023 21:59:33 -0700
Message-ID: <20230901045947.32351-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|SA1PR12MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e215ad4-03cb-439f-5fd8-08dbaaa853ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SjM3TMUhecCY3pwIcpuRuDVYJmZ8YlmU12LwyewhTk7vAUYAO4tZLlb5HCSgxjMwAjCWweDV1Z3q08QmvwuR1Ykj835122qwEIbki9wzmiMQ3zlbQgw/cZsZvj+fpZ7Su5keY2Cgr66c2VhDwfbDI7pmRexvpezyQdd4iSr703OjChpUeOFgt6DInctulVHztG2NO1Ek8Sj8wtROn7lzu3mzkl/xYoa6Kiw35ecqankbznAQwbjQKjtiqPxzuT1QnVWbfwi5ytTNlAVb7lS/Kq+laoetKKUq5XahTx+KwHZZQP6mJlFqnqi+TeqqMdRXjxRkFl2+uYHRjvll42vMFVRHW0mGB0bmkrRJKGNCqAtHVthk9oiYA4wdLea2plrF4M7BMIyYnEHVe1DQbaGL8npvXeqtgaDqaKSEgCc9PHqm3/CNM3MIN938DMrzls/CA+ZObJb3SijSw+MZksEhYlVTGO6ocUTOUHWN0Ebk/ZMnNdyyO7HX7gxi1FgmdAY/80QPYn+qlOnKza9XWpdidT7dVxegpbuEDF0YRCfHCDm4nDERelY5tt+PASqFHmsYnuW8vAV9DB7P0njFoVEv5Frgpuj6maeWQzGF0qL5AYEN2cDmx6QR9rcTyCnYvwhialFI1DTA5PFu5sPtHZCggUJrC3btZOw8lN0T/gWU/t1/8ikVDs1M9EFEHchQXQAkVrurmXZt/6AbGCavWYW87kECSyP5W6Z4mPVHlyMIS3oNqWbAILiU4B75eCoSiHXv+nAD3XlqIeeirSu8uiMsPg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(1800799009)(186009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(356005)(81166007)(82740400003)(8936002)(6666004)(70206006)(70586007)(54906003)(478600001)(316002)(41300700001)(426003)(40460700003)(44832011)(86362001)(8676002)(1076003)(36756003)(26005)(2616005)(83380400001)(47076005)(6916009)(4744005)(40480700001)(36860700001)(2906002)(336012)(5660300002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:13.6996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e215ad4-03cb-439f-5fd8-08dbaaa853ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8095

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


