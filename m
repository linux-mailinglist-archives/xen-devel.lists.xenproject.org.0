Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818264D21DD
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287457.487473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfns-0004ai-HW; Tue, 08 Mar 2022 19:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287457.487473; Tue, 08 Mar 2022 19:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfns-0004Xf-CY; Tue, 08 Mar 2022 19:47:28 +0000
Received: by outflank-mailman (input) for mailman id 287457;
 Tue, 08 Mar 2022 19:47:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfnr-0004Om-2N
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:27 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 931f53e8-9f18-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 20:47:25 +0100 (CET)
Received: from SN1PR12CA0077.namprd12.prod.outlook.com (2603:10b6:802:20::48)
 by SA2PR02MB7532.namprd02.prod.outlook.com (2603:10b6:806:142::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 19:47:21 +0000
Received: from SN1NAM02FT0043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:20:cafe::8a) by SN1PR12CA0077.outlook.office365.com
 (2603:10b6:802:20::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:21 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0043.mail.protection.outlook.com (10.97.5.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:17 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:17 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnh-000Cws-Sd; Tue, 08 Mar 2022 11:47:17 -0800
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
X-Inumbo-ID: 931f53e8-9f18-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+tSBFRZX0M2Ka1jVzjwPBfEsexw/LMPuSyrjcHh844AtifyZ1nNzfjYqnr6xSZzsqxH5HO2m4V3D4uy7MK5groI/UIRdczo+OQWEZ/73BmbPJg1Z5qJnNwcyO88wdkyeR17r5Hm6eaMufGifUdyRV8vTx0lrxAXL1H7cWltqC1kLpH18oPymfItJNPl/WhVsR7inMyledKJgo1+ai2GF1JRqYFbOCaHQCpIPuWSjcmBNNeXNSvkJFQfY6lYwNHIbpkAisYzHnDVyiUpDx0huQZwykCBcG8yaYTPC0ApsnKZ1rOualxGIGxe0h6Mi3J20Hkzu4Spr/ia2z1kcHIanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2me5A34S/CA57rO9JX2LJVZGCsANGo9EZ0shS6bP8E=;
 b=XQA3OqMDMBFxxfkfPdYJthY1/d6wFcin+7qc1B+OJVhKSmFY5IOV4zxZobGrH8HMiQBErB2UII+WYT73alYcMcElwQXiMANHatxe5CD6c0zJmwtIRoBdwehcF0bxJshnGtt9UJ2W5kFQQQQcjaToOT8PfoHu/JZNrfqH4ZJFjHiZaOkEievd+GQpADVyGdOGie9pR0TaPuxbfmuE99sPDWE5hTuTGHd6C2LgPOW2tr92EJtJkhLRn3tx7Hrrq1mZh7EQ6NJ1zGSEqpR1+vvYR/G1Mrj66UuP1j0+Mf6bDFATDKpe4wr4+RBjwpAtp/FTpycYhA4SF80cizvul5GSBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2me5A34S/CA57rO9JX2LJVZGCsANGo9EZ0shS6bP8E=;
 b=FJ6EUcmwNeZZIIZ9c/GZrH1RK5N3T8Q30fLs4xcQuAo3fanqNVvcPm+5oi70bMhZO5KjbBGWLnQvjSUVyWCMigTp2FHDNpGNhcfktUnsJqxMs85TPRPyR8KpX1PwEGBILJ2tURst2Ge4F99fiYsHU7NIPZUCx+CSvROTLlrMDx8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH v3 03/14] libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
Date: Tue, 8 Mar 2022 11:46:53 -0800
Message-ID: <20220308194704.14061-4-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fefc3967-106b-45a4-ba6a-08da013c75a8
X-MS-TrafficTypeDiagnostic: SA2PR02MB7532:EE_
X-Microsoft-Antispam-PRVS:
	<SA2PR02MB7532E79671F1FBF43596AECBBC099@SA2PR02MB7532.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dW/r58LtlZwBmki+QFLi+J8+utBW6kRLsPiveHuLHGVjr2940NpPcvTQtiraROc1jjMiDEW4FfBq5qUbZEKOmxL9yrBJTq/R0KBPsbbvCCJC/8LFbTYU39vbFrh10dZNEHYMcs8zdppIpNqxKWXNjZ29+Bsvk3aZZ67HObTArW/N7uk/+8DuqUksi/xRbjW+a3w0VWNTTSm8kJaQ8FC1Jw3OlvfAoOSHsgk4sRHzvQZUwjBO2FBGUKNBIcmhsV+PRoqOZYwkOTgOiEpTGtg+UnbOHVraAoLJ0IU86BkrEROCIJbh4X5Pb/ZNnkd1FOAvHMLRjN89II4kY929QyXep9BWe96gKD8EBhFVxvPJkPkisVYwgKiPyIdV/cKKmLXHCVhzI8C97Bd6WXXuWaowgIzQaiKn70l6mBJijwXrISXYFvaKRyGE5sVXTlhqktGt/uADQsa8pdtvnMHZxIyyI7te8evA34Ip4nT0tRAoUqdRt0cr4KXt4KBgQ9Wfb6of1NyqIdDxerkwM+ronmisPgql/Ifvrdbh5CZq0KawvBEQBKr7n1rtJNeE/qMq50lW3Oc43To19I7WwhgBppzMAlaUzW54KD5ci7HTDPvEh+w/s0FxZ6QDqJujG1GHr9ws1awk+IMg4Se1nc/AjlnAL713SbpDnUsVnOcwQEkvN3LbI9pLaF6YrPEeaACDK/7dDVodieR0E313sYctc9eueA==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(4744005)(4326008)(8676002)(336012)(426003)(26005)(47076005)(316002)(7636003)(186003)(6916009)(82310400004)(5660300002)(54906003)(8936002)(70206006)(70586007)(1076003)(7696005)(36756003)(2616005)(356005)(107886003)(36860700001)(508600001)(40460700003)(83380400001)(2906002)(6666004)(9786002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:20.9066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fefc3967-106b-45a4-ba6a-08da013c75a8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7532

This is done to access fdt library function which are required for adding device
tree overlay nodes for dynamic programming of nodes.

Acked-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/libfdt/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 6708af12e5..86faa90f79 100644
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


