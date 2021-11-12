Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D37C544E260
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 08:28:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224985.388561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlQyV-0004m2-Q3; Fri, 12 Nov 2021 07:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224985.388561; Fri, 12 Nov 2021 07:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlQyV-0004k8-Mt; Fri, 12 Nov 2021 07:27:51 +0000
Received: by outflank-mailman (input) for mailman id 224985;
 Fri, 12 Nov 2021 07:27:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxiu=P7=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mlQyU-0004je-0t
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 07:27:50 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0828dfe8-438a-11ec-a9d2-d9f7a1cc8784;
 Fri, 12 Nov 2021 08:27:48 +0100 (CET)
Received: from SN7PR04CA0033.namprd04.prod.outlook.com (2603:10b6:806:120::8)
 by BY5PR02MB6788.namprd02.prod.outlook.com (2603:10b6:a03:202::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Fri, 12 Nov
 2021 07:27:44 +0000
Received: from SN1NAM02FT0039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:120:cafe::80) by SN7PR04CA0033.outlook.office365.com
 (2603:10b6:806:120::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Fri, 12 Nov 2021 07:27:44 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0039.mail.protection.outlook.com (10.97.5.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Fri, 12 Nov 2021 07:27:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 11 Nov 2021 23:27:43 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 11 Nov 2021 23:27:43 -0800
Received: from [172.19.2.115] (port=54152 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mlQyN-000G6V-LM; Thu, 11 Nov 2021 23:27:43 -0800
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
X-Inumbo-ID: 0828dfe8-438a-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZO2T8pYAW0Q56D7VU0ZEgpLKJ81gblO8s6gTHsiO2nDLJUQQSjgnb+dfDSPqM6HxGM7U5UJw5RMvhMjlCc/+acrVLa7/gAkc0ucmlKAx87F3e2SbLbuxzctLAdHJTqT7yxCBEgKkxs5xjw5G2CdlPkxptnyKExzuUochtZKXUdXVNDRydluuS8gAFRKjIqB8FZoPZj8geq/qGxzCguELp1rGD/JyNhtjqSRkgVSd/aJIqPHy77fLRVGKsx1xzlM0D65WOObB949Gk+b04Th1v6JU2FT3/P/SKWIIGqpTtwdjo8ALoeOOZvTzzWhIHnBBSrF/W5db3VrJBTld1TcGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2oAPRoBpQI9d7tWbw2zBLdpi/WRm+mKy7JeengF3D8=;
 b=hmA3kYgw1cXaf0SN05bg9EY73Ylr6ufCw4Oyf9CgPTjn7gNUpaMJU+bkngpjuWPSlcIjcLbhMZMOLWb2Elew1tEpQF61JHxmtIBa8ztjo670dhdn0/OyrqloiNqOv9aTJlh/0i/STcRy6P1CIOFaUr96R1J8lo510UsB9deBHgwQwqQ51deXZ9gqbV7ii8TdtRPDyJ4siU+jsBL3x/IIRXxjNNniHjc11QWD7SMdkz4NVj/Nj/euB8xnscVflBbmk06U7NmtZHZAPoblU7JDsLQifx/p/NAWAsr/VPLRNgcI0FNR3If/yP3xZm64D3ViGJ9V8UFaOd0sm/VEpwxBNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2oAPRoBpQI9d7tWbw2zBLdpi/WRm+mKy7JeengF3D8=;
 b=aOfW3EGP4bjL5vd4shDfQa+fsAnC+LvcBkYUaHFxoFSZIs+6Ptke+coDGQJCgf+J6WZcODcC9zj+kyJ2zNJY1uTmOXQi/ABfvIiz7P3zRdiFHDlMvdSMYg9HfaYhZ2hSWaXXV7A5oQhwx6/XTmzNtYcWbepnP0jkpofZM/QiH0g=
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
Subject: [XEN][RFC PATCH v4 0/1] Update libfdt to v1.6.1
Date: Thu, 11 Nov 2021 23:27:19 -0800
Message-ID: <1636702040-116895-1-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 224b89d6-0722-4c1b-a5bb-08d9a5adeb06
X-MS-TrafficTypeDiagnostic: BY5PR02MB6788:
X-Microsoft-Antispam-PRVS:
	<BY5PR02MB678854A86AD931276F4D232BBC959@BY5PR02MB6788.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YwFhKqWp/GN1+L2K6kRauvT26FE86MsYeeb0kQa75nCKMUK1ZSbKFOak/xdue2xucUlA9SZwxbZQbba61EcUehFgqGLIBOKA8/dTe1+FORBl1Usn0piIO/76brQZBborqio1WdHwcJoPYSkfRQNhQ0A+RqcurHGaZmivJNgECLwNbyerBAQIErqBI4sGG5P88HvQTuNx5yAF02OAOTVadTbB7hSqH1PweERMtAncjE1VJQdpPwEhBvggWN2hAVgLOyEuV9tqSoKpSMk0+JBPWLLw6pxbDwRKVcxCSktp6+fsPIagS5i79p7vvQNH29uCDo5uCstvzgRNVFpHXYcFrhxLjeh+C87iD+sR2pWyuadM+2vdt60qEaYsBXfUn12jMWY8d8rOE06sfHzCE5QUIidDY2IU8Q3wN/Z5znDfFLxmKFb/R17DhsdIRYtP0lwsRnLEtgU0D1+21i6fTPODi93ONSN5b1omIbV3kB3YUO005ZRMnfoR0k6mX1w3iVXW6TfBZ4M4hx8oFNWuF+5At712Dlw9LlQGA5WVpPE5Fu66DtGD0chc8zh9qAp902sDgGd8/MKdINU8U6QSI5lznOIJ1NA15SCBiaftDQ5franyx0S0tIikoeZRnHSDCt5eNKwf+CYRV69mjJu/gC2q4a4k8MyFU3rKN53eLRpJuG1CKEFRwesBBqH6yayz4HjdtmUzmemU1DtCFLQm+h0hDw4MlC9lsfDPDC5IYMhEpbRxzk5O8QAmNVtGDiff4eGzHITZBcxAD2/AA0dw4xcbw29SbVJ4PpVqgz5Ffe6Q1cSFhGFp6xKsxhoqmQ1QzPHT
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(8676002)(6666004)(426003)(2616005)(6916009)(316002)(36860700001)(36756003)(70206006)(70586007)(508600001)(83380400001)(8936002)(82310400003)(7696005)(186003)(5660300002)(2906002)(47076005)(336012)(4326008)(9786002)(36906005)(54906003)(107886003)(15650500001)(7636003)(26005)(356005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 07:27:43.9842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 224b89d6-0722-4c1b-a5bb-08d9a5adeb06
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6788

This update is done to support device tree overlays functionality. This is taken
from David Gibson's DTC git: github.com/dgibson/dtc.

Change log:
v3 -> v4:
    Remove unnecessary config.h and stdbool.h header includes from libfdt_env.h.

v2 -> v3:
    Include version.lds changes.

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
 xen/common/libfdt/version.lds       |  24 +-
 xen/include/xen/libfdt/fdt.h        |  51 +--
 xen/include/xen/libfdt/libfdt.h     | 858 +++++++++++++++++++++++++++++-----
 xen/include/xen/libfdt/libfdt_env.h |  98 +++-
 16 files changed, 3046 insertions(+), 786 deletions(-)
 create mode 100644 xen/common/libfdt/fdt_addresses.c
 create mode 100644 xen/common/libfdt/fdt_check.c
 create mode 100644 xen/common/libfdt/fdt_overlay.c

-- 
2.7.4


