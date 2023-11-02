Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D427DFB25
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 21:00:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626976.977758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydrR-0008NZ-I9; Thu, 02 Nov 2023 20:00:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626976.977758; Thu, 02 Nov 2023 20:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydrR-0008LF-Ez; Thu, 02 Nov 2023 20:00:13 +0000
Received: by outflank-mailman (input) for mailman id 626976;
 Thu, 02 Nov 2023 20:00:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhp2=GP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qydrQ-0008L9-5c
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 20:00:12 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d6bd574-79ba-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 21:00:10 +0100 (CET)
Received: from SN7PR04CA0205.namprd04.prod.outlook.com (2603:10b6:806:126::30)
 by IA1PR12MB7735.namprd12.prod.outlook.com (2603:10b6:208:421::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 20:00:07 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:806:126:cafe::ff) by SN7PR04CA0205.outlook.office365.com
 (2603:10b6:806:126::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Thu, 2 Nov 2023 20:00:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 20:00:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 15:00:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 14:59:52 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 2 Nov 2023 14:59:51 -0500
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
X-Inumbo-ID: 6d6bd574-79ba-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhKAF9SYvDx7p7lrHN+qlLsX/rTRkb7LiubN9n+qm25EwunKjv3Xyq4qwBf59Fzxi25145UKScDU2MGpStRvp367nRFTEzSNmLQjifVpnUbhitFPc2ZlWWqQwVnbdLYAaSG5d2/8nb0GTMtSr21+PLLApp1qWBhcrDP+W6+EdfIqjfbRSdpXfktBKZvAgf3R1grUii70mfQNyTzJfBTVzCePoUUJowa1HchLc2BhWn1v5M6uN4kDNm1xRTMd+xlKaScF10cqw1hvZlhcul93ReXpoD8++YAGn647t+LEafrQjVPQV5wBdCGvfZLN++q6m+AKrl2S3Fl6H8BsQfCxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pbSh33RgAruEh+vBumoIsMWbvi+aD15/uYNDowXUZc=;
 b=QPUFqDJowJF/d2gkEyfiRKCUO2bLSM77SVrkL6fCfMXofsNI5gVZ9xg/rVV/ijfbp4buEm6k8d6UboEAZQj2sJ6AW6wpaMSKSvvPsaati8Y+ZInpSZ5dUW6gGGs1S7rHISet8osU2n39uLN+z7DyUhZqJFzUJzeJs7HswWCe2bW+mdDHBvHw2LcRBZErnnyXzAZHgDH+rBIQff8gH/cJB6OhiBMvQYdlqHTD6irUf6aWvZohBE5xePYIEUK+82OFLJ13iYLid0dUiM0BZBYs7BReLtADoi5JRMBa1d3hFWPClm18Z0vaXECciN/EU23zvZkLzqyO6QxpgbDyqmBTiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pbSh33RgAruEh+vBumoIsMWbvi+aD15/uYNDowXUZc=;
 b=gEEtBBGLmdUcVLTwUGrRKhR8qkFzVwBf9vZLppbLHNBR4H/7YHJUiOHndkQG7XWdAduI/FNZ6nTBrO1s8MMrsBHy920exYi59A7iy4IAW797BdD6Ym1N5VpI5seTheHCCvEeTChEJlzHEZw5LBXjv60xcqBe1p/T/+xDkUwEmqU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH v5 0/5] Kconfig for PCI passthrough on ARM
Date: Thu, 2 Nov 2023 15:59:28 -0400
Message-ID: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|IA1PR12MB7735:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1b4133-2c12-4d61-f1cd-08dbdbde4f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k3Mgme+V0JahNg2S+K39WpIOWgezQoI9zOd8/GIS2l/wZTZ5BZKssAbzSooIscqrsvhMsB/L4W416jI4fTqqeHdf/vFAxegU9TNG/VQ1HyRWed/Y7Dgu05Wf4TrXx/xKTHNopOa96KAuznalVkr+H3ZPCz6uBJKGs+oaxXVljhQwDdrnKdJcbaiWCIhVtKJmvqWGq48xenTO27nAnp9E5l+22udRTjFh2eP6NEgCmoIykqHQrJ5OkSAfXkNuFEWvN9M83UDDNwrI5i5PLxPYJQjZEGsQK8akNB0RConLFQ+oyYxlW4D26JmU1lvzgXNBrKdE/xmZjLzFzG3CeUpXWUDVH69yplPA5plmO3v/4ZrCdmY/H7ZH/Szhszudt4x8cFlkyfRZqKkk4u4i63V5U8CyJ1Go8oBxCYmuC+qbEbUTqILNkwPAwCX4x7aIzLm44lP2iyJH+36ByKyKLYZyfqMzffsD3wQpgwBX4GD9PTwhIpx9Kkg0hBFFs8DYp32mDfZVxJMoZ3Bkcua7XXhBA5F+HyaFwzzy0kNi2/fn9ZJ09Ix1tVGVpR4PBKnQ5gcNeQNcF6k8yslpVBRv+prevV+aI6f/3bYj1AyRrK5EKtE6f0cVmP4pMOtSQ4j/u8KH8EeeqQLzgCC2d9k5gqf9z6SZwrDpGyr3BcwsNVAU+TxEfVgDSg10GuMEaBSCnYHMTigqj2rX+cTQ6+xQlwa6iplQyrXNfwSPN9wspLFtSpAX4aumlZwGOdtk1Fyu+rMHraebjtGfHEdjm23uRc6OyQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(46966006)(36840700001)(40470700004)(2906002)(7416002)(26005)(1076003)(40460700003)(40480700001)(86362001)(82740400003)(36756003)(81166007)(356005)(426003)(36860700001)(2616005)(83380400001)(44832011)(478600001)(316002)(47076005)(8936002)(6666004)(6916009)(4326008)(8676002)(54906003)(966005)(336012)(41300700001)(5660300002)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 20:00:06.5621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1b4133-2c12-4d61-f1cd-08dbdbde4f9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7735

There are multiple series in development/review [1], [2] that will benefit from
having a Kconfig option for PCI passthrough on ARM. Hence I have sent this
series independent from any other series.

v4->v5:
* add [FUTURE] tag to ("xen/arm: enable vPCI for dom0")
* address feedback in individual patches

v3->v4:
* rename ("xen/arm: pci: plumb xen_arch_domainconfig with pci info")
  to ("xen/vpci: move xen_domctl_createdomain vPCI flag to common")
* fold ("xen/arm: make has_vpci() depend on d->arch.has_vpci")
  into ("xen/vpci: move xen_domctl_createdomain vPCI flag to common")
* split ("xen/arm: enable vPCI for domUs") into separate hypervisor and
  tools patches

v2->v3:
* add ("xen/arm: pci: plumb xen_arch_domainconfig with pci info")
* rename ("xen/arm: make has_vpci depend on CONFIG_HAS_VPCI")
      to ("xen/arm: make has_vpci() depend on d->arch.has_vpci")
* add ("xen/arm: enable vPCI for dom0")

v1->v2:
* add ("[FUTURE] xen/arm: enable vPCI for domUs")

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00210.html

Rahul Singh (1):
  xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option

Stewart Hildebrand (4):
  xen/vpci: move xen_domctl_createdomain vPCI flag to common
  [FUTURE] xen/arm: enable vPCI for dom0
  [FUTURE] xen/arm: enable vPCI for domUs
  [FUTURE] tools/arm: enable vPCI for domUs

 tools/libs/light/libxl_arm.c       |  3 +++
 tools/libs/light/libxl_x86.c       |  5 ++++-
 tools/ocaml/libs/xc/xenctrl.ml     |  2 +-
 tools/ocaml/libs/xc/xenctrl.mli    |  2 +-
 tools/python/xen/lowlevel/xc/xc.c  |  5 ++++-
 xen/arch/arm/Kconfig               | 10 ++++++++++
 xen/arch/arm/domain.c              |  3 ++-
 xen/arch/arm/domain_build.c        |  6 ++++++
 xen/arch/arm/include/asm/domain.h  |  5 ++---
 xen/arch/arm/include/asm/pci.h     |  9 +++++++++
 xen/arch/arm/pci/pci-host-common.c | 11 ++++++++---
 xen/arch/arm/vpci.c                |  8 ++++++++
 xen/arch/x86/domain.c              | 13 ++++++++-----
 xen/arch/x86/include/asm/domain.h  | 15 ++++++++++-----
 xen/arch/x86/setup.c               |  4 ++--
 xen/common/domain.c                | 16 +++++++++++++++-
 xen/drivers/passthrough/pci.c      | 20 ++++++++++++++++++++
 xen/include/public/arch-x86/xen.h  |  5 +----
 xen/include/public/domctl.h        |  7 +++++--
 xen/include/xen/domain.h           | 12 ++++++++++++
 20 files changed, 131 insertions(+), 30 deletions(-)


base-commit: 649c190a1feafdb54440bebbcac58abc90fa335b
-- 
2.42.0


