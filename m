Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD686DE779
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 00:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519967.807102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMmO-0004wD-8c; Tue, 11 Apr 2023 22:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519967.807102; Tue, 11 Apr 2023 22:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMmO-0004tq-5v; Tue, 11 Apr 2023 22:48:00 +0000
Received: by outflank-mailman (input) for mailman id 519967;
 Tue, 11 Apr 2023 22:47:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmMmM-0004tk-5y
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 22:47:58 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5186b5d-d8ba-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 00:47:55 +0200 (CEST)
Received: from DS7PR03CA0166.namprd03.prod.outlook.com (2603:10b6:5:3b2::21)
 by DM4PR12MB6349.namprd12.prod.outlook.com (2603:10b6:8:a4::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.35; Tue, 11 Apr 2023 22:47:51 +0000
Received: from DS1PEPF0000E650.namprd02.prod.outlook.com
 (2603:10b6:5:3b2:cafe::7d) by DS7PR03CA0166.outlook.office365.com
 (2603:10b6:5:3b2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 22:47:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E650.mail.protection.outlook.com (10.167.18.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Tue, 11 Apr 2023 22:47:51 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:47:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 15:47:50 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 17:47:50 -0500
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
X-Inumbo-ID: e5186b5d-d8ba-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6Qst0FnUKccO1kawVj0Dr4+p8lN8Hh2C3K9lbNrYo8JaCaCOqWqCCDlzpLJJ+eABmiiVNNaxs4CUkEKVFAJdhet2zyeUcRi35CRZcueTfrIaFH619Nt5D0u5wrrmILjhwbX1jNx96LAzGLDI51X1b1FgYbyeIgA+brj9w9WkzF3v55rKaZm8ZYIv1fehyZkRaiNTpXk319FRfXRkmcOfFFTlCvjm8dBEubQrpJ2Y38EnGQQOSK9qYHvi/YZv0q3urjxvN7Z8+FkMcetYxr0HX09HLvi/zWgE7nQiLBLntcQ1tG3euNsiKEnF0GTsP6RJ4zoVdLPSm5HF6yF1rZ6FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekDE0eiudwYgbUq+PMKOx/34dRSx7wTAoRnsZ6NgBnA=;
 b=RZoZntukHShejgj3EW3bAPo1nQJYc+w8FE3wy4vepXElKJ6xyUqOCM43lr4JnAHD6tXv2E0YqfrUj+67h7H1b5nOEScbUqOQFdGQ3QNZavpkqvFWkri+88aiRMItYUBwzdUXNeBqkVg/PSW8F//OxuHLtLo+7HJQRLggoVLVIprCH4m2coAci17Iwjn4slpxL/DXXcH7JskFoWwojWmd0t7jrO5zibkFI/pGciPj2RL95sGDNEz74PgJa77Agsr+SFIpQnPfXU2WLMcNyNMzYZ+GKgQv2nCWmDEw9udTRznfB8vDyqyMvvnnx9RhZLDG+UHWaJDPfEJh7VKUFOb2gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekDE0eiudwYgbUq+PMKOx/34dRSx7wTAoRnsZ6NgBnA=;
 b=hAoInk28qiStAOXZBrt5jGkhwuULYdrRY2iAFjPDOb3di+nwYN0+4Ts58iU4N4v8RDN0PGF7tGqlOeNUhfRr/bwn5aTaeEZg3nOad+oxjoIZHvS++CtEZXUdyiMCbWT6yLBEI8IDTEuhfWGg9UJKK55bd5pnGtqNQGZ5/oPMzcw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>
Subject: [QEMU][PATCH v6 00/10] Introduce xenpvh machine for arm architecture
Date: Tue, 11 Apr 2023 15:47:36 -0700
Message-ID: <20230411224746.16152-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E650:EE_|DM4PR12MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f2d8bf-93ae-4be7-dcb6-08db3adec7e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MlzEbrGaZYdcCuRU2YlSvmSMwspQVOYTm5smEpGJnCAQNXD5/9xFne8JYmJKqGHD7SWIW1geF2plrQUd2naINYYqGA3eIihXs16TF+GiEjO67txRFAvEWaig5Vo0p3k/flVBhO0dJmY2hIoa8y313lLhaKHnyr4LmLcxMRVyhXEmbUdcAxr/0jz8Mt+JWx+K9oTDBmsLhKIZquFba+zLv4In4dv8uyLdXvFUVTP9jHamz+xMc4y8A+6g3ZprtQIBfRz/w7qrfJu5tf576GWY6P92yPO2rVdOZaNBGNQ7I+i6+M+cW2Im6mxxqnMcB4akOWdxxZZrouX/Nm8NjmRZdgvQd3iv+grtofKuexfh30RhxmBosTFhP6KH82pRE7kIC9RfH6pED6kcBAbyz+7xLCkdVJtxr/p8sAi0Vd2dORQ2LWOxyjkoDe3Gb8hk72x4A3MNqBdCT+BiPDd90xaEnOO0IEWz6cU8AO9RdDiPvwMYLIJF1S/FLFu2anVY2z61xvDBEIpPrj9nbLaUItTu767SxlHr2qY6CiZ/xDQtIDWDTYUmn2OXmfEv/kLVA5eY6t8wSXRM8saSN+dF0fcCf5EjxP1+tfxbI3XiqrNIG/XNJvKF2rVULEKk5IAxP62/HIAZLV7U+bnb+TDpHJvyka4wUjhrUKo05lL5FH8J2Qo7rToG5UTpBv5yFhDcmRHU/7Ij6huJhwVkRAQoOh3KnHglt0jyljqa3x1gsvzMhuM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(36756003)(86362001)(41300700001)(70586007)(316002)(478600001)(6916009)(4326008)(966005)(70206006)(8676002)(54906003)(40480700001)(36860700001)(5660300002)(82310400005)(44832011)(2906002)(8936002)(81166007)(47076005)(82740400003)(356005)(186003)(6666004)(26005)(1076003)(2616005)(426003)(336012)(83380400001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 22:47:51.3091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f2d8bf-93ae-4be7-dcb6-08db3adec7e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E650.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6349

Hi,
Rebased and resending the series with latest QEMU as it's been quite sometime.
There are no code changes.

Also, this series has dependency on following gitlab-ci
patch: https://lists.gnu.org/archive/html/qemu-devel/2023-04/msg01641.html.

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
    v5->v6:
    rebased series with latest branch. No code change.

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
 hw/arm/xen_arm.c                 |  181 +++++
 hw/i386/meson.build              |    1 +
 hw/i386/xen/meson.build          |    1 -
 hw/i386/xen/trace-events         |   19 -
 hw/i386/xen/xen-hvm.c            | 1075 +++---------------------------
 hw/xen/meson.build               |    7 +
 hw/xen/trace-events              |   19 +
 hw/xen/xen-hvm-common.c          |  879 ++++++++++++++++++++++++
 hw/{i386 => }/xen/xen-mapcache.c |    0
 include/hw/arm/xen_arch_hvm.h    |    9 +
 include/hw/i386/xen_arch_hvm.h   |   11 +
 include/hw/xen/arch_hvm.h        |    5 +
 include/hw/xen/xen-hvm-common.h  |   99 +++
 include/hw/xen/xen_native.h      |   13 +-
 meson.build                      |    4 +-
 18 files changed, 1350 insertions(+), 1010 deletions(-)
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


