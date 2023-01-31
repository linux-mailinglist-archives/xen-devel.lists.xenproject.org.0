Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3BE6839A5
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 23:52:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487897.755681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzU3-0008LO-RQ; Tue, 31 Jan 2023 22:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487897.755681; Tue, 31 Jan 2023 22:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzU3-0008If-OS; Tue, 31 Jan 2023 22:52:11 +0000
Received: by outflank-mailman (input) for mailman id 487897;
 Tue, 31 Jan 2023 22:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skZt=54=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pMzU1-0008Hj-EW
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 22:52:09 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e22638a7-a1b9-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 23:52:07 +0100 (CET)
Received: from DM6PR21CA0011.namprd21.prod.outlook.com (2603:10b6:5:174::21)
 by DS7PR12MB5768.namprd12.prod.outlook.com (2603:10b6:8:77::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 22:52:03 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::8c) by DM6PR21CA0011.outlook.office365.com
 (2603:10b6:5:174::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.4 via Frontend
 Transport; Tue, 31 Jan 2023 22:52:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Tue, 31 Jan 2023 22:52:02 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:02 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 14:52:02 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 31 Jan 2023 16:52:01 -0600
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
X-Inumbo-ID: e22638a7-a1b9-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMG3beTMP7Ttsu8eJFbXqTsxrF1uN7kgDOxGaRBKpGcWkskfWYxUuevaa55gmS6GL/0vaXYdsa7FaOv1zRDvwY3FMfUbrwupnAAJnErfrT0nZLYJanVl4feXZe20gwlFQ+2cs5MmfqXRr9w09v6F6bQ/FK13hRdkwma5Z56pyOFZRPuMUWMjfrjv5wUx6TI4Fbo4oE83VNAjzGm2qP/3wKSlEQv75R0joJ2wkeQ2wKpdCa6nUCDVT/2sJKNEf8ji9LpM+okiBkc+fJlZWpjI8ZlmC8zsce2WJGwZWhgodh91i/Bg0qKMEusKWbgPl+KBtKCeXXhJF7aVelxipCYXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HX0/VprMtKGAirOyOoDFvnPvkn84PZOJUgA+v8ssH3c=;
 b=fo7Qc70usaGMCBEJSGlUAivzrD9Iysdj177hTNPOVV7TUz/o5gPJA6utSFkO71NB567YDnBkML5NV3h6i6GAcndSYXETQ43gJ92eL5GSM/jxVsES4mSjeyAdk0/ZGT6eH2BWSjre1EbtmbKsLb53lKIf9uSjrqmRCUzfLQeK0MsIkKD+mOty0glAIXd0LXARfGLvNGlFRO+9at4tvpEtuCu8F65YCw/kumPAyeFGMmDxAYZVSWENSFPFzWvtA3MPmjVEFxwi3aertQ4EfrkFTbL1Iqb7HxrR/brOXlgVGpbVGd1Sr8kBxdvT3uI8knPnHCjtRnAssBWeIvHHE4Q16Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HX0/VprMtKGAirOyOoDFvnPvkn84PZOJUgA+v8ssH3c=;
 b=ERv/aSuAc7EiynUP8a8gNFwokHUmc8l/3VQEWXoXiu8AY9+64VtaSoxkcLi9kYIGBZ+iFnynZzk4QdEKLGZrjqD46eJS/LAT0ELh53QfG4ZvOzYG3RqIQ4HWHRCKLEoO44v7O3mdbldD6kPzPY7X6/sQH1LTGR+lZF/9xjnMuh4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>
Subject: [QEMU][PATCH v5 00/10] Introduce xenpvh machine for arm architecture
Date: Tue, 31 Jan 2023 14:51:39 -0800
Message-ID: <20230131225149.14764-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT029:EE_|DS7PR12MB5768:EE_
X-MS-Office365-Filtering-Correlation-Id: baa3ead2-3303-42d1-c1fb-08db03ddc4f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BQgl+Hw5J4q2pTObti6zMEXD8AmHejqQfcQwmEnyWCURKctLj/4AvB+voy8ae+qK3gEYUSB7v0pbEvDmsO0KoGaQCGfkzWEQKPILnMCrmuCHr8Bm+W0lL2W9LWJMArNo/OF1GRL2dY84sCKgsUxH6dl2nu7OLMWFdRF5m8+BRI4kerC35Cz+ZCFZon17HodfGO665odtOGceNyJk8q60FAmBFrzdcBiIWiDeFYgqGvWWnc57fYNh+Ka8WuDaVqVyuVx8BqPE25WRiDxlCQU6rZeQUTCthFKqrGK9TPapPo1yg9QbUxOGUPrRnAPdyoakCDEtZ4U7czwbXZX9fpsqgQ1NM1zeRixT7bq/R1IONBySJIa4mlIwkEIUFbbypwhs/GWy0zbOvH3pihxHb+ikIzW62bEK0GMBeiCeouqxpK8fVlfwWI3Pe5Nt2xdZZLSDh3BgmHzeZoLUwHgfD2ZJm6DsKPlgzecJ4zHlhLX+MVPVmJDvwxVwQk8iHjcXp+NnKKJ1ivSmm195P8leIscjsXIXsNb84gZFVgELlkg74Nala0nQRl+FZfuANP6VGKlVzMXQxlWiTB+H1tAn5Z92OZE4BWwshAlBCgV2/PxXycHNPT9GJ+iemwC3xpyYiC/HQHnYBLtrUuwtb49bfqtgKUVCAqmCobpPDhgWpQlmFYjdsXLnLy6mhPZ/O2WMiyi1SZaVc4awdGuerX9iXE9Hcu4TX9u1GEWt1VnKv2ZbHHc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199018)(40470700004)(36840700001)(46966006)(6666004)(40460700003)(41300700001)(2616005)(336012)(1076003)(478600001)(186003)(26005)(54906003)(316002)(6916009)(8676002)(4326008)(83380400001)(70586007)(70206006)(426003)(36860700001)(8936002)(2906002)(36756003)(82740400003)(47076005)(356005)(5660300002)(86362001)(44832011)(40480700001)(81166007)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 22:52:02.9281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baa3ead2-3303-42d1-c1fb-08db03ddc4f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5768

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,
This series add xenpvh machine for aarch64. Motivation behind creating xenpvh
machine with IOREQ and TPM was to enable each guest on Xen aarch64 to have it's
own unique and emulated TPM.

This series does following:
    1. Moved common xen functionalities from hw/i386/xen to hw/xen/ so those can
       be used for aarch64.
    2. We added a minimal xenpvh arm machine which creates an IOREQ server and
       support TPM.

Also, checkpatch.pl fails for 03/12 and 06/12. These fails are due to
moving old code to new place which was not QEMU code style compatible.
No new add code was added.

Regards,
Vikram

ChangeLog:
    v4->v5:
        Fix missing 3 lines of codes in xen_exit_notifier() due to rebase.
        Fix 07/10 patch subject.

    v3->v4:
        Removed the out of series 04/12 patch.

    v2->v3:
        1. Change machine name to xenpvh as per Jurgen's input.
        2. Add docs/system/xenpvh.rst documentation.
        3. Removed GUEST_TPM_BASE and added tpm_base_address as property.
        4. Correct CONFIG_TPM related issues.
        5. Added xen_register_backend() function call to xen_register_ioreq().
        6. Added Oleksandr's suggestion i.e. removed extra interface opening and
           used accel=xen option

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

Vikram Garhwal (5):
  hw/i386/xen/: move xen-mapcache.c to hw/xen/
  hw/i386/xen: rearrange xen_hvm_init_pc
  hw/xen/xen-hvm-common: Use g_new and error_report
  hw/arm: introduce xenpvh machine
  meson.build: enable xenpv machine build for ARM

 docs/system/arm/xenpvh.rst       |   34 +
 docs/system/target-arm.rst       |    1 +
 hw/arm/meson.build               |    2 +
 hw/arm/xen_arm.c                 |  182 +++++
 hw/i386/meson.build              |    1 +
 hw/i386/xen/meson.build          |    1 -
 hw/i386/xen/trace-events         |   19 -
 hw/i386/xen/xen-hvm.c            | 1078 +++---------------------------
 hw/xen/meson.build               |    7 +
 hw/xen/trace-events              |   19 +
 hw/xen/xen-hvm-common.c          |  893 +++++++++++++++++++++++++
 hw/{i386 => }/xen/xen-mapcache.c |    0
 include/hw/arm/xen_arch_hvm.h    |    9 +
 include/hw/i386/xen_arch_hvm.h   |   11 +
 include/hw/xen/arch_hvm.h        |    5 +
 include/hw/xen/xen-hvm-common.h  |   98 +++
 include/hw/xen/xen_common.h      |   13 +-
 meson.build                      |    4 +-
 18 files changed, 1364 insertions(+), 1013 deletions(-)
 create mode 100644 docs/system/arm/xenpvh.rst
 create mode 100644 hw/arm/xen_arm.c
 create mode 100644 hw/xen/xen-hvm-common.c
 rename hw/{i386 => }/xen/xen-mapcache.c (100%)
 create mode 100644 include/hw/arm/xen_arch_hvm.h
 create mode 100644 include/hw/i386/xen_arch_hvm.h
 create mode 100644 include/hw/xen/arch_hvm.h
 create mode 100644 include/hw/xen/xen-hvm-common.h

-- 
2.17.0


