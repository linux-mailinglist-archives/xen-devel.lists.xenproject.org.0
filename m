Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 466E4446854
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 19:20:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222584.384853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj3oK-0005vJ-AD; Fri, 05 Nov 2021 18:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222584.384853; Fri, 05 Nov 2021 18:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj3oK-0005tV-74; Fri, 05 Nov 2021 18:19:32 +0000
Received: by outflank-mailman (input) for mailman id 222584;
 Fri, 05 Nov 2021 18:19:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0iX8=PY=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mj3oI-0005tM-8Y
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 18:19:30 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e764a832-3e64-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 19:19:25 +0100 (CET)
Received: from SN4PR0601CA0010.namprd06.prod.outlook.com
 (2603:10b6:803:2f::20) by BYAPR02MB5447.namprd02.prod.outlook.com
 (2603:10b6:a03:9a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 5 Nov
 2021 18:19:21 +0000
Received: from SN1NAM02FT0004.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2f:cafe::c9) by SN4PR0601CA0010.outlook.office365.com
 (2603:10b6:803:2f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Fri, 5 Nov 2021 18:19:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0004.mail.protection.outlook.com (10.97.4.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Fri, 5 Nov 2021 18:19:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 5 Nov 2021 11:19:20 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 5 Nov 2021 11:19:20 -0700
Received: from [172.19.2.115] (port=34588 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mj3o8-0006lr-Iv; Fri, 05 Nov 2021 11:19:20 -0700
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
X-Inumbo-ID: e764a832-3e64-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9HPdes8m4h2Em+DRCBAru0vY3wCWYwI1x0wz7WwwXDUxPk5PKrq6HIkOYBRzTIRB54r6Dh8WFfh+WxoLeGB0reh0hNWQok2ILFyHeN1e9zM4IVNim+wsSUphbr2URxrXW12abidm5JRrKaVZru/RWKRkyGvqickiQXtfNbtymBDFEy0gcFWYtidUQkaRMdM92qT4aqmDFtgVWrM+bahP7oIsby7bY5maNv3pmk1Rdjz3t4ZYtWYHLSg1uzBr9q60DKFreVFl6LAp/akJsmc6+ZRkztbsHySUMDAoe3JCoVOi0bVCf3zIBxJiO2S7L6KgWhBDm93NqWs4KbdE5a4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbrm6WOqitjlB4v+roRybE3UOpXKBlAofqKO4nGIhGg=;
 b=GLSBEOraDJldbwZNKszTfNEidL1PMWUEpIeopl3f/OYtPz9L91dXD3c1eXdB6no+G84H/qlV1YCcsuvrMxN1nC01/f8qql6lOGTuG5FlMtHUxdPVAiYTh2WZ3IoahZ8RsDKWoZ1Kf78wv94fV6xOCUueUjvRfjAdBRs246JZZV+1pe7tpzFHhg5dLXbeEC7U0UBwzFcHUBwWtnbQIuPtJrkjd802opij0iYihOBWtO+6rVohDAt3NRaMc5aHTXonVXi9u7Bv3nqmHfwxvTQC1XXsJlaXgs2PRLA1/lKuUtnrDnzdILQlCegFIRdgszYytGrgQj5Cy/68jcw6/FTk8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbrm6WOqitjlB4v+roRybE3UOpXKBlAofqKO4nGIhGg=;
 b=iQs9wcdMs+tSUT874onfrlrtGtp5vaMrd+YNb/3PD7BGFq+Yol4/OrokTPsO8qj85YXJj5lnUtw1QfAnAHDxQ0otWXmRNBDs8PL97wabiv552aizkz7FXzWubOFXK7q3RvSEuJRf/SkxWJzWI2T3s1DY+XGQLsj9DdbSH+5Ss6g=
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
Subject: [XEN][PATCH 0/2] Changes for libfdt v.1.6.1
Date: Fri, 5 Nov 2021 11:19:12 -0700
Message-ID: <1636136354-68413-1-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d08be6c0-74f8-4bb1-4512-08d9a088c9ba
X-MS-TrafficTypeDiagnostic: BYAPR02MB5447:
X-Microsoft-Antispam-PRVS:
	<BYAPR02MB5447817A78F86E84BCD9F958BC8E9@BYAPR02MB5447.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nxclHhDA3V2cSvjSxqoVRlBda40UIShYU8KXu/54tAY+Hj2QThcXNz8OHZlSi8PVccL4LLr4T+W33Ocht0Sb9/TeNDzmAULeKXPTDWX5rtvqB+/SDAWVgiy0yTG19vgI107EQEzVarXcs7ppw6KayDEsffF3dmAioAVlqBN9tAeoASPWPX4ZCIZU6ju/Aymw5yPlKeG1C6eI7UhENgiPQyXsgimlnhtDftB/Trtkz35opcxVFtAA/mathg++PlqfkiHFXLSGoxii6VmTy31wlQ49214k7yZonI9uEuesfzXlY8G9P9BoabldlnR5SguYKPGp9OfJhbfZ0/4HV85psDMwtGbuT15WpPJeEvLXrYeugXYKutVMOPd202kDhN3ualHlNYdRyb6tQQXBQdzu6frPEgL1GC4RDzXV3YZZPA52E4oUE1tq305V9ofEItnQfx7mugruiDKzY5+LKJMfsrKvPXn+Rek9y6f9a8vaiNXPQ2B9nBC3NHMG/eeq52BndBtzWEaOCpCG4looo12b0w/AsvgVf3RpOD/KF/d9i+PkEBKSFX+hqNM27eVjXVdhuxWLXIc0Xsyec/ywh8DQV9C1wprKscHHCA3oBaiaFpFg/sbDbSwXEB2+JpOGO/ychVDf2go9iyNmnWBjtIwYdIILQN0OxjvXMTsCvGY1VgKz718fJmZLinRsMZwWIbHD7Me5H36BqIAxdWUQpX+BWQ1A6JpYhKUzVYXtWk8A6Sc=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(83380400001)(2616005)(70586007)(70206006)(9786002)(36906005)(426003)(2906002)(4326008)(8676002)(47076005)(82310400003)(6916009)(186003)(6666004)(7636003)(5660300002)(356005)(107886003)(36756003)(36860700001)(508600001)(7696005)(8936002)(336012)(54906003)(316002)(26005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 18:19:20.9260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d08be6c0-74f8-4bb1-4512-08d9a088c9ba
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0004.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5447

This patch series is NOT INTENDED for commit. Instead this is just a helper
patch series to highlight the changes made to ported DTC 1.6.1.

Hopefully, it will save time while reviewing "[XEN][PATCH v2 1/1] Update libfdt
to v1.6.1" series.

[Patch 1/2] is just copy of DTC v1.6.1.
[Patch 2/2] contains the changes made to make it work with Xen.

Regards,
Vikram

Vikram Garhwal (2):
  Update libfdt to v1.6.1
  xen: libfdt: Changes to make libfdt v1.6.1 compatible with Xen

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


