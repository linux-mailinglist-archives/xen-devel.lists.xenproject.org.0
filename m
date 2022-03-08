Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 814FB4D21DF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:47:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287456.487461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfnq-0004Fc-6p; Tue, 08 Mar 2022 19:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287456.487461; Tue, 08 Mar 2022 19:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfnq-0004Dl-3o; Tue, 08 Mar 2022 19:47:26 +0000
Received: by outflank-mailman (input) for mailman id 287456;
 Tue, 08 Mar 2022 19:47:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfnn-0004Df-Tx
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:24 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20625.outbound.protection.outlook.com
 [2a01:111:f400:7eae::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 913bbe21-9f18-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 20:47:22 +0100 (CET)
Received: from DS7P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::7) by
 CH0PR02MB8167.namprd02.prod.outlook.com (2603:10b6:610:10c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Tue, 8 Mar
 2022 19:47:18 +0000
Received: from DM3NAM02FT042.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::b9) by DS7P222CA0001.outlook.office365.com
 (2603:10b6:8:2e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT042.mail.protection.outlook.com (10.13.4.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:14 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:09 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnZ-000Cws-7i; Tue, 08 Mar 2022 11:47:09 -0800
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
X-Inumbo-ID: 913bbe21-9f18-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UufaNjrwDWWZRE0OTTdJdFJKp8lywPftpNXOgfoQplQfZtVW7XiBGP9OSv4GMItfwpo2Yxx2s3msPdU+xornPmqz+EXXvN9sd0NMjEtqs146XnxBolX6m0vadarsEfLafYxoYecRDUJlr/D629EbuH/3HKCYrBIuYBnpi8+zWhXa1/m6jwHmnbX6GObmslubMYdGRwJS3XIc4oY2NwQdsFHMY2A2KMdzON93grzgDlnqwzdJtWHvaVHI94VaiP5PzhwMfrTfWCO91jSd8SL0ohNSKVyfDA0qWfr6O/kg3rDYe4TZRu7rm6BWMnCJoBVFzKx8EUPcAY7CXCk8oWQY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SyXrmvae9ZhJvDuYQW5hF8OcaoYJpoiDhlbnsCshAsY=;
 b=bK3lbq0H347BJP5vyUy5VRNkU9mt2GL296jRvq9+iy8TVhY/7us4Q0F/+/UHc2TURvpIRxg/4B5SdXzumoMr1Yj7SQcSapgG774QKNPCbU9dbUbsUGPfZe3M8zE6ro1RUoUwwwaE21WbfFLPkpTQXUIHxlhbXXEqFaKtHSF5jZxJ20H5uiLpOqQrsMUUZh2qslE/9g3+rflHRN/1ltKFHpQLLKtvtfWACTThSJ6Z6GYz/KBMoA5sD5QthkGjy5ojARaxWl3Ok/ror5xbDQqc2S8YJJE/NFYZswTxtoGNYrr8xfha3iiU5W4dhcNymf5ZbFdgLJXpTuBV8iraOadfiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SyXrmvae9ZhJvDuYQW5hF8OcaoYJpoiDhlbnsCshAsY=;
 b=WBdAqp2dUnClGdS46gEoHeCHSmnekwzOmLV9DwFBmu/7d1LwqXrIHhy8Co1SYUwm0K3BVbJ0aSDnkcOMJbKVvzfelsWe/mYnYd4Sji9xHQqLoiAdIoe2DwCJr9yOXqwG0tfufnPTwHkalH1o1NWYKDs7viws7/EtxVCfrjCdmxA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN][RFC PATCH v3 00/14] dynamic node programming using overlay dtbo
Date: Tue, 8 Mar 2022 11:46:50 -0800
Message-ID: <20220308194704.14061-1-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc7fdb7e-4780-4338-9110-08da013c742a
X-MS-TrafficTypeDiagnostic: CH0PR02MB8167:EE_
X-Microsoft-Antispam-PRVS:
	<CH0PR02MB81671F469A26730014ECC793BC099@CH0PR02MB8167.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0myKYlPY6R+eYGVaGF2KApF6hvKsj24gT7oc/kohVVSAnW4TT9cNT8LgmBVXCJTkfms5k1bDZFTiZBVItj1xkHCwLBtwRdjjEEXk8jEf8jLK4MZagiwIXYi2yol2mJlhqzYf/siJgCQtpE+Kf6znFkGsCg9bLbvIkj9smFTHhB6XhiT8gP32K+jZKmszyvIliz0E5HtlfJiE5WyhWhzs8cPR0DnKiWZKQHYTId6Y1aVoqtS33mbfcNV78wsS10KAnyckKUaWTrXIY18ZUhSOX7RT+4eF4CtijF7rQMFVBhT6tNIKG6cjVeBsTm7RGo1KeldnnHqwZY0PgqQU+crJInDXQ9qm4+APpDKncvFPT2RXfC7oTqy+UmjIBH4Cza0v/+2DNdaqOQ6m+20vJ4DM/uVnVeafP3QIolCMf0OB5xoWzOHeWG03ADcCxXwIOo7ZZWaGgarrWS82vWpxgfXkZb8Z+EJPRaW0K5t9z8Sfz71Z0lFbAXBh+9rYZpglgwA4XiyheXUHtDPCyL3kkzGg0iMwoU4T5mA26qpLL4lioW6qyk+XUJCOXfeNNmQlkyVXirMx6GpnqvRleotbZ+mrVfk8VLcAverehBhgMc7sUFSQyu4MnfgBz7Xcqzn+LhilBrFrQAYTiQrc47PnkT7q8oaTbpm5wvSrAcXNgrMXoauzatshhn64e5mU5wslaue1nrTmHZGCLBHWNNPepttZnw==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(336012)(6666004)(356005)(7636003)(7416002)(26005)(8676002)(40460700003)(2616005)(1076003)(7696005)(5660300002)(508600001)(2906002)(426003)(36860700001)(8936002)(9786002)(70586007)(70206006)(82310400004)(186003)(316002)(47076005)(54906003)(36756003)(4326008)(6916009)(83380400001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:18.4021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7fdb7e-4780-4338-9110-08da013c742a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT042.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8167

Hi,
This RFC patch series is for introducing dynamic programming i.e. add/remove the
devices during run time. Using "xl overlay" a device can be added/removed with dtbo.

For adding a node using dynamic programming:
    1. flatten device tree overlay node will be added to a fdt
    2. Updated fdt will be unflattened to a new dt_host_new
    3. Extract the newly added node information from dt_host_new
    4. Add the added node under correct parent in original dt_host.
    3. Map/Permit interrupt and iomem region as required.

For removing a node:
    1. Find the node with given path.
    2. Check if the node is used by any of domus. Removes the node only when
        it's not used by any domain.
    3. Removes IRQ permissions and MMIO access.
    5. Find the node in dt_host and delete the device node entry from dt_host.
    6. Free the overlay_tracker entry which means free dt_host_new also(created
in adding node step).

Change Log:
 v2 -> v3:
    Moved overlay functionalities to dt_overlay.c file.
    Renamed XEN_SYSCTL_overlay to XEN_SYSCTL_dt_overlay.
    Add dt_* prefix to overlay_add/remove_nodes.
    Added dtdevs_lock to protect iommu_add_dt_device().
    For iommu, moved spin_lock to caller.
    Address code issue from v2 review.

 v1 -> v2:
    Add support for multiple node addition/removal using dtbo.
    Replaced fpga-add and fpga-remove with one hypercall overlay_op.
    Moved common domain_build.c function to device.c
    Add OVERLAY_DTB configuration.
    Renamed overlay_get_target() to fdt_overlay_get_target().
    Split remove_device patch into two patches.
    Moved overlay_add/remove code to sysctl and changed it from domctl to sysctl.
    Added all overlay code under CONFIG_OVERLAY_DTB
    Renamed all tool domains fpga function to overlay
    Addressed code issues from v1 review.

Regards,
Vikram

Vikram Garhwal (14):
  xen/arm/device: Remove __init from function type
  xen/arm: Add CONFIG_OVERLAY_DTB
  libfdt: Keep fdt functions after init for CONFIG_OVERLAY_DTB.
  libfdt: overlay: change overlay_get_target()
  xen/device-tree: Add _dt_find_node_by_path() to find nodes in device
    tree
  xen/smmu: Add remove_device callback for smmu_iommu ops
  xen/iommu: Move spin_lock from iommu_dt_device_is_assigned to caller
  xen/iommu: protect iommu_add_dt_device() with dtdevs_lock
  xen/iommu: Introduce iommu_remove_dt_device()
  xen/arm: Implement device tree node removal functionalities
  xen/arm: Implement device tree node addition functionalities
  tools/libs/ctrl: Implement new xc interfaces for dt overlay
  tools/libs/light: Implement new libxl functions for device tree
    overlay ops
  tools/xl: Add new xl command overlay for device tree overlay support

 tools/include/libxl.h                 |   3 +
 tools/include/xenctrl.h               |   3 +
 tools/libs/ctrl/Makefile              |   1 +
 tools/libs/ctrl/xc_overlay.c          |  51 ++
 tools/libs/light/Makefile             |   1 +
 tools/libs/light/libxl_overlay.c      |  67 +++
 tools/xl/xl.h                         |   4 +
 tools/xl/xl_cmdtable.c                |   6 +
 tools/xl/xl_vmcontrol.c               |  45 ++
 xen/arch/arm/Kconfig                  |   6 +
 xen/arch/arm/device.c                 | 136 +++++
 xen/arch/arm/domain_build.c           | 142 -----
 xen/arch/arm/include/asm/setup.h      |   3 +
 xen/common/Makefile                   |   1 +
 xen/common/device_tree.c              |  30 +-
 xen/common/dt_overlay.c               | 771 ++++++++++++++++++++++++++
 xen/common/libfdt/Makefile            |   4 +
 xen/common/libfdt/fdt_overlay.c       |  29 +-
 xen/common/libfdt/version.lds         |   1 +
 xen/common/sysctl.c                   |  10 +
 xen/drivers/passthrough/arm/smmu.c    |  56 ++
 xen/drivers/passthrough/device_tree.c |  58 +-
 xen/include/public/sysctl.h           |  19 +
 xen/include/xen/device_tree.h         |  14 +
 xen/include/xen/dt_overlay.h          |  47 ++
 xen/include/xen/iommu.h               |   2 +
 xen/include/xen/libfdt/libfdt.h       |  18 +
 27 files changed, 1347 insertions(+), 181 deletions(-)
 create mode 100644 tools/libs/ctrl/xc_overlay.c
 create mode 100644 tools/libs/light/libxl_overlay.c
 create mode 100644 xen/common/dt_overlay.c
 create mode 100644 xen/include/xen/dt_overlay.h

-- 
2.17.1


