Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BFB63FE6D
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 04:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451346.709039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wHi-00073s-Ec; Fri, 02 Dec 2022 03:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451346.709039; Fri, 02 Dec 2022 03:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wHi-000729-78; Fri, 02 Dec 2022 03:00:18 +0000
Received: by outflank-mailman (input) for mailman id 451346;
 Fri, 02 Dec 2022 03:00:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP6A=4A=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p0wHg-000723-Fc
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 03:00:16 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e83::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 714eb78f-71ed-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 04:00:14 +0100 (CET)
Received: from DM6PR02CA0150.namprd02.prod.outlook.com (2603:10b6:5:332::17)
 by CY5PR12MB6321.namprd12.prod.outlook.com (2603:10b6:930:22::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 03:00:11 +0000
Received: from DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::51) by DM6PR02CA0150.outlook.office365.com
 (2603:10b6:5:332::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Fri, 2 Dec 2022 03:00:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT017.mail.protection.outlook.com (10.13.172.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Fri, 2 Dec 2022 03:00:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:10 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:10 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 21:00:09 -0600
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
X-Inumbo-ID: 714eb78f-71ed-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TA3pNjXECRrSsubhf2YaMqYybIH4KoCO2S8C2ZVb4QNZmyXhc7sdN/YuIIIilSrQEzcxOIG/NayGQ2MHMICLwaD3T9M5XutosL1IVvV/3K3814fADjVahk8YvIc020cWWTbwkP47cO3nvuF6EP6ryxRVd2uFweU3FBpb/RWC16eHM8kAD07WiGijZkVu6qG3X+IcDV/pCUDwnxP6b1oKLlp/C0d0yk2Hqu99OveByVn/Ygz2mCNbGeFCo2QSVbhR6XX21XSI4R9EutEle70JtoqqrPCMjK1kjf/dtze07XFH4AEA21RiFOSJ8t9qYpcggpUJhhFM24D/XUkCONUPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4ovkWGbob727tiXZ8++JdUrdyWJmj6NhbENChOW250=;
 b=UpG5rWl40CX1GvzZU49OawFcWR/0OAKBtPHXsgoCNn/zcLYrPnsbjQu41OWItGINxlGJjapDY0nwKDcaCEkETvi77lkJsm7hJLCmnpfIxMYvwsPwppU7rwFjiuJ/V3KiZVyU/NJ8mAbxfvEexVw6rL3A6PWLJsJe6pYMW0pT+nOkq42MNJC/DjtxOPZGxfdFYwEKUQq38YfNwH4sPoRr5PlffYB6kFIZmL5asu5hDYDit4/95UscknYnYKYyP98DO5rTukD6cP4+scysXyRB5kZg3TyLrD8ztDA9Xunnu56bp6mRbfzDEZpWAlrcInry+qez0P05/jOAjMaflz2S0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4ovkWGbob727tiXZ8++JdUrdyWJmj6NhbENChOW250=;
 b=A+V/ouddyWtrq7zNlKXgxngHKas23yeL0k0oKfxuYgvtRVxvUIKQW30UPIvPAwu3AdJMhPQkGeD01uSAHYgl3JKZ9dZSj39TRzmGz+vV0nSQL2WtDjzBL5rSXQU1zrE1ES9Soobn3GZWFCB/u8sIadQve+Is8OuHklxwaqB35TQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-dev@xilinx.com>
CC: <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>,
	<xen-devel@lists.xenproject.org>, Vikram Garhwal <vikram.garhwal@amd.com>
Subject: [QEMU][PATCH v2 00/11] Introduce xenpv machine for arm architecture 
Date: Thu, 1 Dec 2022 18:59:52 -0800
Message-ID: <20221202030003.11441-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT017:EE_|CY5PR12MB6321:EE_
X-MS-Office365-Filtering-Correlation-Id: 667f6729-071a-4400-926a-08dad41153b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bpurvol1AC2h5uf4r2nHD0hcTBDtJFcXWwTwh+87lbC1hXg5LqQEeTWVPJK4J0LqTdTjvbzszjjuPGPaYVnl8kGjnS5SGr+kgKQqybLSpk1Aenpj8Pnwi4J2BDzu6TW9NyqqiOzSJed02AYVOtug8Vbadu2IBoVPKhXdzFZ6oS53CXHVeJCKj6BP00bouL181JHaBomoBaorIJBdSA/gmDPRoRz0FDwLOBjNrXxrqx/0CHzLL4xUIXaorESzZgg+DJG0ApUHScg74Js/rs62f1yQZAzUqsA6j3gcCQgOWViYy909z8AxKvF9/X5xxo+D2uAWgH9NCWxNH5VzlnTSy3sl87cJuXRHeO1UEbodko1yy+aWLDqchYYYpCnD1JHWnbq8Zh9gDNcq2U/YiQEbbN9IAjEtrgqrL7sqr1xnhDXPONP6BNgOtAOt+WVmkSwB/uRnqG7gstAwZ48UWppd94bnoxxzsjN15WpUHgALajVq0lgG0PtImwQ8MCmXGFNbsUG0+hQRNdBSS1dPwbDyrQq7uizsYniAlTS2P08HkVHIGurp8T6fCBtdbmGex7seQBbOL0/oHlX78VWYclWlIjPjGm0mAf7yrqBA7i5cyH/hZ07VKofVGz4u/Rz6mNgsdU8wi/Fmh2pidOXs6G+Ilq7omn7Vulb2kPEd+AMdFTn6Gum0pnG3vNLlUOhwz+GfR38y8CdTMRn2mrB/9dB5SQQ//++bn762GHJpOIpB2+k=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(426003)(47076005)(40460700003)(86362001)(81166007)(356005)(36756003)(40480700001)(82740400003)(82310400005)(1076003)(2616005)(336012)(186003)(26005)(44832011)(83380400001)(5660300002)(41300700001)(6666004)(478600001)(8676002)(70206006)(4326008)(70586007)(36860700001)(8936002)(316002)(6862004)(4743002)(2906002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 03:00:10.9244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 667f6729-071a-4400-926a-08dad41153b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6321

Hi,
This series add xenpv machine for aarch64. Motivation behind creating xenpv
machine with IOREQ and TPM was to enable each guest on Xen aarch64 to have it's
own unique and emulated TPM.

This series does following:
    1. Moved common xen functionalities from hw/i386/xen to hw/xen/ so those can
       be used for aarch64.
    2. We added a minimal xenpv arm machine which creates an IOREQ server and
       support TPM.

Also, checkpatch.pl fails for 03/12 and 06/12. These fails are due to
moving old code to new place which was not QEMU code style compatible.
No new add code was added.

Regards,
Vikram

ChangeLog:
    v1 -> v2
    Merged patch 05 and 06.
    04/12: xen-hvm-common.c:
        1. Moved xen_be_init() and xen_be_register_common() from
            xen_register_ioreq() to xen_register_backend().
        2. Changed g_malloc to g_new and perror -> error_setg_errno.
        3. Created a local subroutine function for Xen_IOREQ_register.
        4. Fixed build issues with inclusion of xenstore.h.
        5. Fixed minor errors.

Stefano Stabellini (5):
  hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
  xen-hvm: reorganize xen-hvm and move common function to xen-hvm-common
  include/hw/xen/xen_common: return error from xen_create_ioreq_server
  hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration
    failure
  meson.build: do not set have_xen_pci_passthrough for aarch64 targets

Vikram Garhwal (6):
  hw/i386/xen/: move xen-mapcache.c to hw/xen/
  hw/i386/xen: rearrange xen_hvm_init_pc
  hw/xen/xen-hvm-common: Use g_new and error_setg_errno
  accel/xen/xen-all: export xenstore_record_dm_state
  hw/arm: introduce xenpv machine
  meson.build: enable xenpv machine build for ARM

 accel/xen/xen-all.c              |    2 +-
 hw/arm/meson.build               |    2 +
 hw/arm/xen_arm.c                 |  175 +++++
 hw/i386/meson.build              |    1 +
 hw/i386/xen/meson.build          |    1 -
 hw/i386/xen/trace-events         |   19 -
 hw/i386/xen/xen-hvm.c            | 1084 +++---------------------------
 hw/xen/meson.build               |    7 +
 hw/xen/trace-events              |   19 +
 hw/xen/xen-hvm-common.c          |  888 ++++++++++++++++++++++++
 hw/{i386 => }/xen/xen-mapcache.c |    0
 include/hw/arm/xen_arch_hvm.h    |    9 +
 include/hw/i386/xen_arch_hvm.h   |   11 +
 include/hw/xen/arch_hvm.h        |    5 +
 include/hw/xen/xen-hvm-common.h  |   98 +++
 include/hw/xen/xen.h             |    2 +
 include/hw/xen/xen_common.h      |   13 +-
 meson.build                      |    4 +-
 18 files changed, 1323 insertions(+), 1017 deletions(-)
 create mode 100644 hw/arm/xen_arm.c
 create mode 100644 hw/xen/xen-hvm-common.c
 rename hw/{i386 => }/xen/xen-mapcache.c (100%)
 create mode 100644 include/hw/arm/xen_arch_hvm.h
 create mode 100644 include/hw/i386/xen_arch_hvm.h
 create mode 100644 include/hw/xen/arch_hvm.h
 create mode 100644 include/hw/xen/xen-hvm-common.h

-- 
2.17.0


