Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A963FE980
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176913.322094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYr-0004zl-Ad; Thu, 02 Sep 2021 06:50:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176913.322094; Thu, 02 Sep 2021 06:50:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYq-0004qA-Vf; Thu, 02 Sep 2021 06:50:56 +0000
Received: by outflank-mailman (input) for mailman id 176913;
 Thu, 02 Sep 2021 06:07:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLfsP-0004aK-62
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:07:05 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7ea9::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dbdcee9-9b09-417a-9938-75d68b68fcde;
 Thu, 02 Sep 2021 06:07:04 +0000 (UTC)
Received: from SN6PR08CA0015.namprd08.prod.outlook.com (2603:10b6:805:66::28)
 by DM6PR02MB5963.namprd02.prod.outlook.com (2603:10b6:5:150::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 06:07:01 +0000
Received: from SN1NAM02FT0033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:66:cafe::27) by SN6PR08CA0015.outlook.office365.com
 (2603:10b6:805:66::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 06:07:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0033.mail.protection.outlook.com (10.97.5.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:07:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:06:53 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:06:53 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfsD-000F6q-LT; Wed, 01 Sep 2021 23:06:53 -0700
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
X-Inumbo-ID: 8dbdcee9-9b09-417a-9938-75d68b68fcde
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjYN5gRN41ONS/9py890LcpPZatY8XZoRIXzL4G1r2Fv+MDCZ6TA1BJpViPe9TMa95LQq249H/uWXqzYGBca1ndVn8vRQslgXx68qicKNWOFYiB9gclZjFvJu+2s+eOkpDIKc8cZfRjaiz3KGHNZmHag77JSio/RziVaNqnUrxpVUgCiGVdbvjBvFdT9iIyDPEhdfCzZtmWNj8otE0U/t3MEHxHLHjuyGo/lLTvAFZ6vTDAOp1+nfWbzCUUeo7jzEgqAX0C15cEec9fEUtmmJobhXxkDaJVI+U7jqv7tIgC99xpi+fW5dBEZtVZkT/jIJRSbw+HqxBuXCvxU6QbglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ZeeTflOXr2fLy1zXz1tSECVgWqlU5geTYJsntNlox3s=;
 b=OF+IgvEhO5Y5P+PZkSDmLjnOguHEuvAr7js1bLekz+GPSoYqZS4ZvstfYo+XHHrB2pSiX9z9pgRmuw3UBl8w9n5tZ9rINAG1Md+0QpyQBh64B+rdbFxcmD3j1Ata26vC9AOzbNI7XeBEGcQeliqMrX6qYB/FCgzv3luuvIbfLy4kfnC1jAUcwtw/H5w9jcnbeIllWoQDN0PPiHWt+afr/AWdfz5el+im+AEc0ZraXq9vafa6zLhGWOmysMMFRFHsZkvMl6XMZqFqJiAMFp7bfpLAJwLSZ/1+qIMJCNZnEPQEJNJVGZ/KSfkfO9g7Y1gMWyXNYu+Z6DKy74qMI0QoQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeeTflOXr2fLy1zXz1tSECVgWqlU5geTYJsntNlox3s=;
 b=eo4dZRj8Dg/W/uPTz4yYReeQwF2MlpnkcUwpSlWoSbdvtIdY2FQoM9GT3vHowOSGar5hcJNf8m1nxWchrO/Ih7Pf1LJr5rlO6WyVJEwxpox5N5MDDGe5B54r9T7YSKdrE3dHCwNwZS3CbXh0REORFjjw7Uy2jflkVIeDcko72PU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH 02/13] libfdt: Keep fdt functions after init.
Date: Wed, 1 Sep 2021 23:05:52 -0700
Message-ID: <1630562763-390068-3-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b4bb6bb-5988-4c66-fc7d-08d96dd7e0bc
X-MS-TrafficTypeDiagnostic: DM6PR02MB5963:
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB59637A67F32DDF00E76BD589BCCE9@DM6PR02MB5963.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BMAij+jdIAVuLQQq++CAx7Fjpjid4kCxlOJKB2jkx8H22EVbZIYETpXZY/UCpQf/T2eT7XXOTWRRjj8OF2mjIeVhcDSjAXf2TXVcDU2nWjOBSl4tDRrZQfm6q7mAIxfBzj4zFCy4zmpKJfisMkJPsQPL4MIAs8c04MIszjuOfyeCALzoSLlpUy5gGw88m6lLR0wgiuFFNGj42Cpfe8kB98CAheKbvbTFYNIrTE84nFqeftyoDOzR02CYdRR+ddYaf5EfOoOMRHrsgOSSBoORg2sF67apzaLYJ1tpCb/Z8xO3Bnomk3rNqcVkcqCvV78T0bKwskjGuJutelYrTPIdUohIe1FdNCeGsKrHwCeEDTM9fveL5mYqHR+eur7B0iqImCEreEFDz/uS9/x74uzGUeAZ3dgTnCNq0XPc5WiBEYXSQeIIBNFxZxuD9uy/yvp+bLCeVvjsTcZUvWRq9BO4CTj2yISC+0KAdAa5Xun7PlWMHnbRje3B2iLunyjgLwI+4CuVXa4lSAArDotueBp0wsy4sUia65pDcBvPZkeqQP1jA5ymA5daNrjsvW7Npq61RMRGUWVeDyX5hjatss6JDfroF2Kp4jXwhlI3xmMB0FJxCwulIZWvQo/dx8oEssY92/wNy1h8FraBUd7oO9qDIRGsoxCrhJ6x84O5jAlATBkOmsXWEOqwihkB1J+aJLRSAdVZISWikNhQ5mj+tO7dhxHgvVbObyCnivnsMsMeIYo=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966006)(36840700001)(4326008)(356005)(70586007)(336012)(107886003)(426003)(478600001)(82310400003)(70206006)(36860700001)(6916009)(2616005)(47076005)(186003)(7636003)(26005)(83380400001)(82740400003)(5660300002)(9786002)(54906003)(7696005)(8936002)(36756003)(2906002)(8676002)(36906005)(316002)(4744005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:07:00.4714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4bb6bb-5988-4c66-fc7d-08d96dd7e0bc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5963

Keep libfdt library functionalities after boot of hw_domain. This is done to
access fdt library function which are required for adding device tree overlay
nodes for dynamic programming of nodes.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/libfdt/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 6bd207c..8002f8c 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -1,7 +1,6 @@
 include Makefile.libfdt
 
 SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
-OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
 
 obj-y += libfdt.o
 nocov-y += libfdt.o
-- 
2.7.4


