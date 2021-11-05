Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C73446A97
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 22:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222643.384944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj6ln-0001nK-Ay; Fri, 05 Nov 2021 21:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222643.384944; Fri, 05 Nov 2021 21:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj6ln-0001kP-7Y; Fri, 05 Nov 2021 21:29:07 +0000
Received: by outflank-mailman (input) for mailman id 222643;
 Fri, 05 Nov 2021 21:29:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0iX8=PY=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mj6ll-0001kJ-Jw
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 21:29:05 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64f75253-3e7f-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 22:29:03 +0100 (CET)
Received: from DM5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:3:13f::34)
 by DM6PR02MB4986.namprd02.prod.outlook.com (2603:10b6:5:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Fri, 5 Nov
 2021 21:29:00 +0000
Received: from DM3NAM02FT047.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::ca) by DM5PR17CA0072.outlook.office365.com
 (2603:10b6:3:13f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Fri, 5 Nov 2021 21:29:00 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT047.mail.protection.outlook.com (10.13.4.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Fri, 5 Nov 2021 21:28:59 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 5 Nov 2021 14:28:58 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 5 Nov 2021 14:28:58 -0700
Received: from [172.19.2.115] (port=34664 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mj6le-0002Oi-PS; Fri, 05 Nov 2021 14:28:58 -0700
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
X-Inumbo-ID: 64f75253-3e7f-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CffpEYB2HwcKwPU5gxjC0ovRmniESjZAlCAZjOVga5PJG1IJHpLVsgqNVwBPeUfxzTjcxOTTm6ew/cTPYvHPq6amgn/KIsfYaeoY62P15Q+n4uiHvfmwOs/LIEJyCzjNmeEDpPOfz81ajXjEA7MQxIH0IRqigy55RiYiNGqzLI6Xk7jGz1ltzmhG4tDEdOcc9Y5/PEE4RwpcoxxTUA0meRA27RY/IU+K2VJUjfe5Yz4ob9fGUlkfvjFAfn9oNgIowTMgjVp6YFKCpfZRYYCe2RXtHrEl3zgu44FsqJcwkFnqq9lLOjGkKHmkXz6xFKhRbIfWdEO4w2c5q8STxDPudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wmv+ZUqIQF1tS8mQC6KO4qH5l36Q+7PnjhOjjJJ/AJs=;
 b=YXcVSC1pT9YnQJx+lh72xEwNJf2jxSZFcz2nJFgWmAGgTSe0JS2NH/ai5vE25sEsDPl8a/fiopIsFYHRBVOPE3lokyL8SOgwwQ1EHbWPB+dtl9xDkgLPJr9PEVotpZVMSHnencjTwV9o2qOf1Mb4NcwlC2C1Nf1lOb+4lnkSzHdpCl5GejgQz/Eu4vXRVYLSbV467wMGLXCR/vqXEZTbkPIiUdWd431SATUWHJXV7PcnCOClRXmwtJ8d6nIRF6RaH+GSpFCDnkWp9Bs4R7EXwKksAMcwjwIP5z76S8JIHpzZUIaWZfKhW7AqVvnoxK6UP6g35B1Do+9DBbj+dKRBdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmv+ZUqIQF1tS8mQC6KO4qH5l36Q+7PnjhOjjJJ/AJs=;
 b=K/gN0aqAC4ZdYnLavi09P62I0O8TL7tQlnIeyj2iA741NTvduDG0ooYCY+klpXyUeqqD8WrObaUMwLhr20u1KlDHAWbsXpmMuZfcb2Uh6G+UNqw8XzEr8BIGdXsJl6leJhhvmaGkvGHRcZWQusg/vC7tRVvbwwT4indpGkntDlk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: [XEN][PATCH v3 0/1] Update libfdt to v1.6.1
Date: Fri, 5 Nov 2021 14:28:38 -0700
Message-ID: <1636147719-80482-1-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5477e51-9042-4f5f-d159-08d9a0a347e7
X-MS-TrafficTypeDiagnostic: DM6PR02MB4986:
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB498643512C13E490F0E7A3B2BC8E9@DM6PR02MB4986.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CHLOOliTOyktOwdmMU7/i17bXequvM/hEH/rWuIVM4Tk8gUbFioibiTQZPIHAQpDp2b1UMsXWq6XAN+jEBV65YiBtYUOGIxbLgeIFg9Oixpz2TNtQGRQRT6aF0zbuS08UTY4HvKOCAQ2EcNDA0mWX8OgCi89eooii5qvI5sNZcA/3dCihc+xWEhybtmqb+crzI6Y+EKburqOzrbEMnadbRMisgUZCPwj/81A7DCDMF1/1H8iGOBJxos+Zrk3oZGkt2hOwPafS+eA9zA2WyKxag/i+qCMFcpBeX7yg9fGA1UncHTPIuIMn1w/IJ7pLYJ0g0aW/HWiBbGzsOFXaHSuGdgNkeWxtjyuFqHLXYApiK+9TU/W7zu7i+XNVQPWUTM4oAiyxHRg7y/hovt2SSodwAC8sfy1qqe9SIXDnOBkRJFUZKY97Kemrm6DPEXZI68uR/EEFll8bLUkh8Vl11J6puwntK21fRait5M6/0mXdGwImubYqkfV+x98D4QTw6cGy9H3Fo0VRhEcTfeI1vLMV8XVB7Ve9K8mCyKJW97Czxzq/BSpz30jIXzX8aY/jqXu2Sc6dKiz0MMQfl6nzAxKZoWGl2L2FKUJvuKfVVksD0+M/NTAIdfqTx3sKUven+FjSeLskqw/yOSMXsMYvrU34gQzWBoRbKzkFHai3zooUVx+Iib0TIBtDPNh3bE9aKJf8y79qG32NsXM4E74XTSlusBCcCWxN+lblYFQndj9O88uZ/lDJnEbQMzs3LLm/zOUCRZZrvw5RyjWSZMstAQiQUEaJnD0Mlb5/R6Z+QWqCpHDqlkdo6WZXVevkdYyQt/B
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(508600001)(2906002)(316002)(9786002)(36906005)(54906003)(336012)(15650500001)(6666004)(186003)(36756003)(426003)(2616005)(5660300002)(70206006)(70586007)(107886003)(26005)(36860700001)(6916009)(4326008)(82310400003)(7696005)(8936002)(356005)(8676002)(47076005)(83380400001)(7636003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 21:28:59.4874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5477e51-9042-4f5f-d159-08d9a0a347e7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT047.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4986

This update is done to support device tree overlays functionality. This is taken
from David Gibson's DTC git: github.com/dgibson/dtc.

Change log:
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
 xen/include/xen/libfdt/libfdt_env.h | 100 +++-
 16 files changed, 3048 insertions(+), 786 deletions(-)
 create mode 100644 xen/common/libfdt/fdt_addresses.c
 create mode 100644 xen/common/libfdt/fdt_check.c
 create mode 100644 xen/common/libfdt/fdt_overlay.c

-- 
2.7.4


