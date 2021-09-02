Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4A73FE978
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176908.322071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYq-0004f6-6N; Thu, 02 Sep 2021 06:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176908.322071; Thu, 02 Sep 2021 06:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYq-0004dI-11; Thu, 02 Sep 2021 06:50:56 +0000
Received: by outflank-mailman (input) for mailman id 176908;
 Thu, 02 Sep 2021 06:06:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLfro-0004YX-UW
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:06:29 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (unknown
 [40.107.95.82]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30620bd6-43c4-461f-960f-858df19fd544;
 Thu, 02 Sep 2021 06:06:27 +0000 (UTC)
Received: from SN1PR12CA0061.namprd12.prod.outlook.com (2603:10b6:802:20::32)
 by MWHPR02MB2302.namprd02.prod.outlook.com (2603:10b6:300:5b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 2 Sep
 2021 06:06:25 +0000
Received: from SN1NAM02FT0022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:20:cafe::27) by SN1PR12CA0061.outlook.office365.com
 (2603:10b6:802:20::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 06:06:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0022.mail.protection.outlook.com (10.97.5.0) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:06:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:06:24 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:06:24 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfrk-000F6q-6e; Wed, 01 Sep 2021 23:06:24 -0700
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
X-Inumbo-ID: 30620bd6-43c4-461f-960f-858df19fd544
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdCUJjGX/U02no8M7aGRhNE8QGABZTwSibiGs5cryOzgLs/kXrwATPn3lxBnVgWbHy4YnkhNmJ9vi/Gw3iu1IsoRYZsyeYb88ks0uKzBAt1lo4InLlE3PJeyS2EoVae1ANmls8Zw0c8vlLwW21sCyoAjk5QpKoPbJ7NpssUqWSeT+BNHCIYOnkutkulJmrGnlcLle5auY29SvpQryqRjEYhbwOgARKEKhcE8xG9NVZ/sjY+TvlgqaOLmPjK305sXho5T3N9JJ1SCKGn+biqwgrlph9Gad4tiTM+0yi7X8whS1V2tRbZXfBEod8YrgMbjlzP1QN3WXH1wHDXh5RrymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ubn0KOlNn2bGNNG4KibjKy56O3QZHfvA/XdfMZxo38c=;
 b=eHfV1Jun6/Y9BR7EOwH5D65neWPrYr2/plZLf6dfkn8VqY9EqaoI7UpYieURbUNWeKPnBfKWYuOwZY4t+wwKPEvWXy6lhh/xI8Wl17RjSoe4fEBR5FM56EhY7EvBfuufa9FfbqzYFlSbtZNMxir3XTXNjC4nkynMFnbfhgK2hIGB9LwFIVB5Bzo+Ufwukdy4vZIZaTrWvtd4DdaLkUJXFEbfVzwr8dHbaqS2w+aNJaxglqldaTOy6LsFEZYFhv4w+Hoh8Hg3v56hsn+gDX8Gtpp/zO30yh4uYPV0RwrK8K5Un5P4eO6etcL/8PT9tIwGdWyhgvMgb7pwqeJ2e2KOOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ubn0KOlNn2bGNNG4KibjKy56O3QZHfvA/XdfMZxo38c=;
 b=cGnM3y0zqxRiK5jg0p2ffdAPvgKnhADdF8GbGtARgl8WKKjA5b1Nvccpg3yY0Ty8kTzwMcKLzL54YEKWMFGUg0jstqk18gDp+9VhG4s9Bd3qDSC3+XfB08KqT5yXIbY/R16nXbSi73MjN8sZpcIFaVYWtW9Rqsh2yqwU+5X7A1I=
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
	<fnu.vikram@xilinx.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN][RFC PATCH 00/13] Add Support for dynamic Programming
Date: Wed, 1 Sep 2021 23:05:50 -0700
Message-ID: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9207777-2281-4bf2-ad36-08d96dd7cba0
X-MS-TrafficTypeDiagnostic: MWHPR02MB2302:
X-Microsoft-Antispam-PRVS:
	<MWHPR02MB23023F8AF9FFCE0FECC07EF9BCCE9@MWHPR02MB2302.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w5KHpqXz4mYyBcpsuTSzM1/Vs0D8q4a4ugCmQ4Zt5HjOK7r74D79y6at2F9MD4tBfQgGX5ah0FsXMIfbtFaQf2g75IyayA3OF4DQNNikPdermzCZqejLTtU1UOrQzGksKF7yxZNfw4d1+xH0YgZ77lVwm7CxgJ8hpL8qQDVHQye58WByKUYwueqlUUBKcWieni8oGElTYoqFD5vxl3F/5FX4vhHm4DtrJ/WQc0rgp5HSCmTxWBqLE4qGH0gU4OZxqIIi8RIxSRHOeuL7mtJtVFD+d7mV4RkmFpCvIS99PIu5z8I2Es/kbkbBz59vf/ie8JP1KH+C2XYsSJinyPcUjQR/JiHqPunqWQatusp9ytnuhwXEixL4VmrUndUsZE60LQRZ5PgBv0rihWIEyc1bzZ3ZXcR+yA69aGJ2kuzOIdkJgN/pSZv5PhpshX9HL9TNDEJYq++8iTkHijXnbKlsXMSZ7cUtyXsr6H8T+5Bg4VQSNdc4yW2wnBLyT2rSDrx1GvHEVKKg81b4g3NGSGYergvwLsWJAPkk1w813t8xFRuqIenU7CEJfI0f0zMs4sxgP6GAuy2OY3YRIkvUMVFHc3APFX4qVdO/wTCOUSn7yDMPBpeGETqRIT1kcGAv5qyF5Ygigf7nci+HRCbg9+2dE8I/fHmgmw6oZjBHHSlvoxBWHNXiTqNJTSsoTlWlmqA6Vkn7PyCrR7ZF25zXvQCgdcPnZ+4RJ+MRtbKO+ankrak=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(46966006)(36840700001)(82310400003)(4326008)(2616005)(426003)(2906002)(356005)(186003)(82740400003)(8676002)(36860700001)(6666004)(36756003)(70586007)(70206006)(83380400001)(7636003)(478600001)(336012)(5660300002)(7696005)(47076005)(36906005)(54906003)(7416002)(316002)(9786002)(26005)(8936002)(6916009)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:06:25.0547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9207777-2281-4bf2-ad36-08d96dd7cba0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2302

Hi,
This RFC patch series is for introducing dynamic programming i.e. add/remove the
devices during run time. Using "xl fpga-add" a device can be added with dtbo.

fdt_overlay.c file is taken from Linux and other existing fdt files are modified
to accommodate the fdt_overlay. The changes w.r.t. existing fdt are kept minimal
i.e. only the required library file/functions from Linux fdt are pulled in.

For adding a node using dynamic programming:
    1. flatten device tree overlay node will be added to a fdt
    2. Updated fdt will be unflattened to a new dt_host_new
    3. Extract the newly added node information from dt_host_new
    4. Add the added node under correct parent in original dt_host.
    3. Map interrupt and iomem region as required.

For removing a node:
    1. Find the node with given path.
    2. Check if the node is used by any of dom0 or domus. Removes the node
only when it's not used by any domain.
    3. Removes IRQ permissions and MMIO access.
    5. Find the node in dt_host and delete the device node entry from dt_host.
    6. Free the overlay_tracker entry which means free dt_host_new also(created
in adding node step).

fpga-add and fpga-del are probably not the best names for these commands. This
was done initially for xilinx FPGA programmable logic block dynamic programming.
I am okay with replacing fpga-add and fpga-del with better names if there are
any suggestions.

Regards,
Vikram

Vikram Garhwal (13):
  device tree: Remove __init from function type
  libfdt: Keep fdt functions after init.
  libfdt: import fdt_overlay from Linux
  libfdt: Copy required libfdt functions from Linux
  libfdt: Change overlay_get_target() type
  device tree: Add dt_print_node_names()
  device tree: Add _dt_find_node_by_path() to find nodes in device tree
  xen/iommu: Introduce iommu_remove_dt_devices function
  xen/arm: Implement device tree node removal functionalities
  xen/arm: Implement device tree node addition functionalities
  tools/libs/ctrl: Implement new xc interfaces for fpga-add and fpga-del
  tools/libs/light: Implement new libxl functions for fpga-add and
    fpga-del
  tools/xl: Add new xl commands fpga-add and fpga-del

 tools/include/libxl.h                 |   5 +
 tools/include/xenctrl.h               |   4 +
 tools/libs/ctrl/Makefile              |   1 +
 tools/libs/ctrl/xc_fpga.c             |  82 ++++
 tools/libs/light/Makefile             |   1 +
 tools/libs/light/libxl_fpga.c         |  73 +++
 tools/xl/xl.h                         |   2 +
 tools/xl/xl_cmdtable.c                |  12 +
 tools/xl/xl_vmcontrol.c               |  51 ++
 xen/arch/arm/Makefile                 |   2 +-
 xen/arch/arm/domain_build.c           |  15 +-
 xen/arch/arm/domctl.c                 | 445 +++++++++++++++++
 xen/common/device_tree.c              | 143 +++++-
 xen/common/libfdt/Makefile            |   1 -
 xen/common/libfdt/Makefile.libfdt     |   2 +-
 xen/common/libfdt/fdt.c               |  35 ++
 xen/common/libfdt/fdt_overlay.c       | 884 ++++++++++++++++++++++++++++++++++
 xen/common/libfdt/fdt_ro.c            |  52 +-
 xen/common/libfdt/fdt_rw.c            |  81 +++-
 xen/common/libfdt/fdt_wip.c           |  20 +
 xen/common/libfdt/libfdt_internal.h   | 130 +++++
 xen/drivers/passthrough/arm/smmu.c    |  53 ++
 xen/drivers/passthrough/device_tree.c |  30 ++
 xen/include/asm-arm/domain_build.h    |  10 +
 xen/include/public/domctl.h           |  16 +
 xen/include/xen/device_tree.h         |  21 +
 xen/include/xen/iommu.h               |   2 +
 xen/include/xen/libfdt/libfdt.h       | 232 ++++++++-
 28 files changed, 2363 insertions(+), 42 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_fpga.c
 create mode 100644 tools/libs/light/libxl_fpga.c
 create mode 100644 xen/common/libfdt/fdt_overlay.c

-- 
2.7.4


