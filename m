Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1622144A74B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 08:03:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223703.386576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9x-00022P-2k; Tue, 09 Nov 2021 07:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223703.386576; Tue, 09 Nov 2021 07:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkL9w-0001z4-Sb; Tue, 09 Nov 2021 07:03:08 +0000
Received: by outflank-mailman (input) for mailman id 223703;
 Tue, 09 Nov 2021 07:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+rF7=P4=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mkL9v-00004s-Og
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 07:03:07 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 169d6844-412b-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 08:03:07 +0100 (CET)
Received: from SN7PR04CA0011.namprd04.prod.outlook.com (2603:10b6:806:f2::16)
 by CH0PR02MB8060.namprd02.prod.outlook.com (2603:10b6:610:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 07:03:04 +0000
Received: from SN1NAM02FT0031.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f2:cafe::1) by SN7PR04CA0011.outlook.office365.com
 (2603:10b6:806:f2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 07:03:04 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0031.mail.protection.outlook.com (10.97.4.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:03:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 23:02:46 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 8 Nov 2021 23:02:46 -0800
Received: from [172.19.2.115] (port=44056 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mkL9a-000Ga6-Ni; Mon, 08 Nov 2021 23:02:46 -0800
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
X-Inumbo-ID: 169d6844-412b-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=POXcJey1kxEMAbWxtS/aapdEdNhPZcyjTr5ykNDvMVSqvRCqf0vZNcb4itgO0NJ0b9ETJRqJxPCruKAFzwQjkYCoNCZxe81+LNOxNrpQ6EsspQ+GAAkJl0Odl9Y+pTdq/szi1fIuzRsEWcjblD4gsvlCsUNmqDA1DzO2yMPrExk0PXWdtdA2s/nsnDzxRCSCTnpfrWMMvzR8N9tTOVV+reGyKBbqMQGV8PyuWFgatyKw2IHmUHgsP71MY+Nwd14AiathVPxvdm5ANYwaTQbtiJ6jSpwxa/MYnCXlFyJbzzn5XgKv9o/LGy79tU/1v56PFfJsqTORxZ6rekC1KTFYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WG0xFb3mDkPyPuUeQfLweYulR61V/m6A7KyclRYvaO0=;
 b=GDvwZfrGW0ixdzChhguqMZuzM3qfYbUtQmNKFH3q1g0yMmdiMrMR4Sx240Maap3KnzHlvIkFvgui353A3GzYb8UwDU/+tdG4om9HFROkscopknB9ZEfmBwnfD0OxPv4ZjXI4kDBAjonsHninQSw5JEJpe/QNyFhe4PiXzEO3XLZC/di9n9pRPsfDJTrGwXzxWUYP3tgqDkAUNYfMe/rQGyxYav7cOCMSUyekWg+O2jmE9z2OB5FlWuRNwVTas10DrmWJsgHXbOo8k3XZOHqR+IYKE/dcnS7fQ7iRHgcei6c11Le3/DkLY+SKF91sbWzOnmke+3yfzwKAOvXZbhiQ1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WG0xFb3mDkPyPuUeQfLweYulR61V/m6A7KyclRYvaO0=;
 b=KlJQBWNVUpzjDgZktFjw2cSUCjd7vhx39FY2gm+cW9K+NKY5V29s32Re0YfUjeMkLx8bXGORb4cepWCquIxudmRqhw+POSP4swFbe0UTD/2eZWTkDEgYVe0lTCVIQyblHDPD83C2Ta4eV8fbh9gZhB0Q0wLF9bXmAp/03xY8B50=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: [XEN][RFC PATCH v2 03/12] libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
Date: Mon, 8 Nov 2021 23:02:18 -0800
Message-ID: <1636441347-133850-4-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0beb327a-5bda-49d4-d7fd-08d9a34ef968
X-MS-TrafficTypeDiagnostic: CH0PR02MB8060:
X-Microsoft-Antispam-PRVS:
	<CH0PR02MB80600776E043C551CC0ED702BC929@CH0PR02MB8060.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9eCpB3MIylPPtaKZHwPYtoz1ceK+JyUzja2YtSrFdkEGXmvb/rmNVgSh4w3XlL1K0bHmMV3OiIxNBPODMmrRnquU/BntXltufsZicRP5nSkwJOhtLPMCxz4VJG75UPa1IJpodxt5vHj6KcHsyaQt7kgrBqFTPyDX8A8JEzs3c2/+Hw0MG1jpwsfoqG9QJ16/M0XZqpNXGrqMDyXd8h7BCGtmcv06YLob4rPHmno2SJf0Us+rMPob2J7go/jfZZXptuD0cW4bjyYwatgBtNyEsWn1doTKB06BN75vPNOhEcJZmqbcQGDXXQxKqInX/9qpUe1EvPgqz2iJn9X77GakZPvZ3bf1CsXmZnBfKJxQdajl0GqQtYFcv5YmVSD6k/Cvu1xz+UzCo8G01JPDGU7o20zopFB3/rFC9Nnu1KYlmWibcYE1ocFZjfKc1BNu3DcSj+uOIF/EtZDDu3BYqvjGKFAzMUavBpGnNf9ZT6nOre4oKe/RfA/flW7XRoBC33Oh3j8KBr7rWEyJBIM2M+Si2MuDR0hgKl499kbujoke+taxakNMwCB+qvKOpelOfeezh5Ou6MwWISVGHFH5+a3Jf1JJgh9UXCAa613KrGDjPZhuKmRtYzclqbu1jZJEvMH2ecHMIp57DgDpoixuFmLDzjiE+bbLjZBfsUjCS6iw/qVx4CAQWSgE8ONW7MFdWQx566AFyqlilzeSQvfIzebfYp5lUu2vrvahvmeXnsF02xE=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(36756003)(508600001)(54906003)(2616005)(4326008)(83380400001)(6666004)(2906002)(7696005)(6916009)(5660300002)(7636003)(107886003)(9786002)(356005)(316002)(36906005)(47076005)(8676002)(336012)(36860700001)(8936002)(426003)(4744005)(70206006)(70586007)(186003)(26005)(82310400003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:03:03.5960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0beb327a-5bda-49d4-d7fd-08d9a34ef968
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0031.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8060

This is done to access fdt library function which are required for adding device
tree overlay nodes for dynamic programming of nodes.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/libfdt/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 6bd207c..f838f5f 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -1,7 +1,10 @@
 include Makefile.libfdt
 
 SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
+
+ifneq ($(CONFIG_OVERLAY_DTB),y)
 OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
+endif
 
 obj-y += libfdt.o
 nocov-y += libfdt.o
-- 
2.7.4


