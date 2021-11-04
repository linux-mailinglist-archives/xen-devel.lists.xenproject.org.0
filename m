Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A63444EBE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 07:20:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221259.382883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miW6m-0006iq-RH; Thu, 04 Nov 2021 06:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221259.382883; Thu, 04 Nov 2021 06:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miW6m-0006gm-Nx; Thu, 04 Nov 2021 06:20:20 +0000
Received: by outflank-mailman (input) for mailman id 221259;
 Thu, 04 Nov 2021 06:20:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTzK=PX=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1miW6l-0006gg-W1
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 06:20:19 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4786cfb8-3d37-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 07:20:18 +0100 (CET)
Received: from SA0PR11CA0116.namprd11.prod.outlook.com (2603:10b6:806:d1::31)
 by SN6PR02MB3968.namprd02.prod.outlook.com (2603:10b6:805:2b::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Thu, 4 Nov
 2021 06:20:14 +0000
Received: from SN1NAM02FT0041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d1:cafe::d1) by SA0PR11CA0116.outlook.office365.com
 (2603:10b6:806:d1::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Thu, 4 Nov 2021 06:20:14 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0041.mail.protection.outlook.com (10.97.5.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Thu, 4 Nov 2021 06:20:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 3 Nov 2021 23:20:03 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 3 Nov 2021 23:20:03 -0700
Received: from [172.19.2.115] (port=60724 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1miW6U-0006GW-58; Wed, 03 Nov 2021 23:20:03 -0700
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
X-Inumbo-ID: 4786cfb8-3d37-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NpT27fEcj0ZcpE67lz3x4pS+CuLZA81mqd2UG49Thpg42ApHhp3E4Vh3iSX/pcL9C7SJtL8kGfF0KAzhzEkwsgtOQeMAP8RbKIhhbB/cWtSKzdkRcnQOrUhn0oQr1jhjoDBsbeGn1BFP0K4LC43dddq93Vo1+wuOvpgMnRL/NrU9NB6vepjVM3SehhAx8R0oQhqgIUrUw+Sunfbg5kpnZ9nfuald4xRa9gQQ+o9BW4in3obyNHqv18UiX0Z/oKWs3rObnRr1SW5EghnFr90iP3sx1Fb9Ox05+7gvF7PGDsglQbn/RRM9eOvvOZ0uSRCLozgdDAeT7X00owXjWZMMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2U4jXB6apTf85EYjY++ZUwGS6bfjwI92tFO5pG6fENU=;
 b=ZoAHmx+h7rs96g4bfcZAdjc0XJlQkZUJEGcaLAz9g7hWyKmclXTy4WeabIOrRUEJ/KPjrlNF9Yj3LK74l+Ywm3kPn/dHcFDiCwcIJvI2UJl5p9ln1sntM9CYwyzcPam+iAtfQ157KtAiqh66Kr0yK3qlcmcZGaAC93CJcYybcS084fW+HTlE1BSN5HVAjglc5RFzfJw1sAKx4W2lQlNq1y3hc9MjZRpuopjLzUTAuFbCMKTZPQFD3ipnlmsvD+u8/heE/1kyeYPOH3zpk58FahARMO9kWhdTQ+omc7gHqI33kqakF+0dy8lJGz0Mi6YUbaAPccDOx/gtp/B2uStgyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2U4jXB6apTf85EYjY++ZUwGS6bfjwI92tFO5pG6fENU=;
 b=PQzlyD2JOIGN3ZkHbtN2znmv0G7MOAJfgMJiHmqQgnhc9hUaCUA3fDZHDU92EjnHciY7L9m8eePhFsEfJZinVSkBW0M7oup2Ozf3vbaTYtTC8ceMo6RPGWebfNASPTvk+8zhRMdCYiMTSw2PFSoD8PJkrMLIEixXp8lEMe5fomA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>
Subject: [XEN][PATCH v2 0/1] Update libfdt to v1.6.1
Date: Wed, 3 Nov 2021 23:19:55 -0700
Message-ID: <1636006796-360115-1-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d198d29e-5542-4435-d0f7-08d99f5b29e2
X-MS-TrafficTypeDiagnostic: SN6PR02MB3968:
X-Microsoft-Antispam-PRVS:
	<SN6PR02MB3968AC5397808A388BE6DDACBC8D9@SN6PR02MB3968.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2QLxpvFOx8+OK9XLxD14KxQApW5I6QTOpahYKUmIky3GzSUhXMJvg0Yd41RzfhKio8dBjfgldfaKlS/fahJngJ/z7xRY7gSCxMUrpjl25ddsZGMqRk39Meyqvz9W3iaskCNZIbbCmZvZSI5N/efPqun5rx2wjpa8BhLftxIC/+EkqVDeGdeB4Mgq3l6QhMdJStBa/QhkjFcjp28UW7GLJRLbpvwvz4C3l6mZ46HtxejewSR9nQ2+H+vzfk9lKOYWQwz67aWrrMkDrSSH9mFQllbqx7ED2ZNYoRneugCO/78HGNYdzQHTVyWMNRXL7X4i4+j0Gy/ak+VGbth9Rz1kKaiv4FkuuN/fJZWkBu3oPjeCDQYDcrUqqbTMPBTroHs3K0mXXBpQo4n/aasj3YW0xvFCWMqnCih8M9PGdmgLeiCnxcMWU5VJ2t3Xfy0TTgKz+8i8yfWdqsFhXkvqVIWbqHHRObJrP/6hAx9UqWWwZLNowkK6bFamjWRJscXAQBrsfr4wS0lYm/4IViJoN9I8fY4M3v2xe80gtKWRShp70wyhUs0z0rNcHTmMd1Vk9RTI7nCrYMCa62rEPlKD68lrfTL2mUYDWbESGaIxLy4pzWqAwyftsjtQiWrLdxBqzxEPhRlHc2MdfJhJHcUEXS59msfrW0XVRmAJtKBcTT7dH+m5Yeb4B+xFPwGOtaiGCDVgcnce96N6CSk+rAU6Uy+Q+qYZqemvEmL6NFkl6wSpsX9hu8mEc/ObRiM6Nhe9e5xuadOeRcpQnJPrUQ7ErWAb/GFgLvcrB96Z+FxJTbIc/6u1K/lubl7xp7F496vnEC1W
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(36860700001)(70586007)(36756003)(336012)(186003)(5660300002)(26005)(82310400003)(7696005)(107886003)(2906002)(15650500001)(4326008)(70206006)(2616005)(8936002)(316002)(7636003)(54906003)(36906005)(6916009)(8676002)(356005)(426003)(508600001)(6666004)(83380400001)(9786002)(47076005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 06:20:14.2377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d198d29e-5542-4435-d0f7-08d99f5b29e2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB3968

This update is done to support device tree overlays functionality. This is taken
from David Gibson's DTC git: github.com/dgibson/dtc

Change log:
v1 -> v2:
    Correct the compilation issue due to incorrect lib.h path.

Regards,
Vikram


Vikram Garhwal (1):
  Update libfdt to v1.6.1

 xen/common/libfdt/Makefile.libfdt   |  10 +-
 xen/common/libfdt/fdt.c             | 226 ++++++---
 xen/common/libfdt/fdt_addresses.c   | 101 ++++
 xen/common/libfdt/fdt_check.c       |  93 ++++
 xen/common/libfdt/fdt_empty_tree.c  |  46 +-
 xen/common/libfdt/fdt_overlay.c     | 884 ++++++++++++++++++++++++++++++++++++
 xen/common/libfdt/fdt_ro.c          | 514 ++++++++++++++++-----
 xen/common/libfdt/fdt_rw.c          | 249 +++++-----
 xen/common/libfdt/fdt_strerror.c    |  55 +--
 xen/common/libfdt/fdt_sw.c          | 312 +++++++++----
 xen/common/libfdt/fdt_wip.c         |  88 ++--
 xen/common/libfdt/libfdt_internal.h | 223 ++++++---
 xen/include/xen/libfdt/fdt.h        |  51 +--
 xen/include/xen/libfdt/libfdt.h     | 858 +++++++++++++++++++++++++++++-----
 xen/include/xen/libfdt/libfdt_env.h | 100 +++-
 15 files changed, 3025 insertions(+), 785 deletions(-)
 create mode 100644 xen/common/libfdt/fdt_addresses.c
 create mode 100644 xen/common/libfdt/fdt_check.c
 create mode 100644 xen/common/libfdt/fdt_overlay.c

-- 
2.7.4


