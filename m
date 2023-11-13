Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A50CA7EA5FF
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 23:22:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632029.985904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fJL-0003DA-8D; Mon, 13 Nov 2023 22:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632029.985904; Mon, 13 Nov 2023 22:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fJL-0003BQ-5b; Mon, 13 Nov 2023 22:21:39 +0000
Received: by outflank-mailman (input) for mailman id 632029;
 Mon, 13 Nov 2023 22:21:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GGJv=G2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r2fJJ-0003AY-O6
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 22:21:37 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20625.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 009ee3bd-8273-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 23:21:35 +0100 (CET)
Received: from DM6PR17CA0007.namprd17.prod.outlook.com (2603:10b6:5:1b3::20)
 by LV8PR12MB9154.namprd12.prod.outlook.com (2603:10b6:408:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 22:21:30 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::81) by DM6PR17CA0007.outlook.office365.com
 (2603:10b6:5:1b3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Mon, 13 Nov 2023 22:21:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.17 via Frontend Transport; Mon, 13 Nov 2023 22:21:30 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 16:21:29 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 13 Nov 2023 16:21:27 -0600
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
X-Inumbo-ID: 009ee3bd-8273-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKJnms50pDvWyrs1tYIwl/FFxEFC4USzp6RHgJgDEqKGpXzuzGqaLqlMF04FQlb3sKHofyNpl04w0dlcDLq40++Lta1i3+k//ojD/3BSF4Ge9Ih5LhKaBmCEqotHDmqcjs5QbRZfYUzMJgplOA4KOu8AXfaAhyhQqjTKIh2rQN4oNubIfXdx5sWKkVbF8wgVIp368IiNB458bzHQer3BguVEy/H4y6CL0Id2+MPjQAKkDc3p+xp4V76+cUVo94sEyhAhLsAATfT1GYaesnAyRDj77lKb3EFXms+yVWI/GPVMokzYb5z7UwTwFsPw6NsJTZi0dnx5rX6Y66FpI1W6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYL359TfhXRT0qJ5mtolFOwXh4EgFhT2io41Svg/QG4=;
 b=IHAaNpzfEHme3PP0lZTudHN1dNJQhK2Bxt/aICHxy7N4kXbFExT1tgLyEbSyl51ztWdZhv/iIcsfhF0c4akv5ZDsOpFh1ezuZmQDn9EQi8QWgSfobdf7v+pPv5RbI9LKfzWzT8aU8LDEL44rQ7vthtNbtOoYk/VjcnloIIoD7/6RKjXq/B/ALp6GsbFSQqt6a26VoPrOatkqi8V062PkVQs58VlxKpyiWEGjpXks/X3UfhIT/4cSbgMeLg+FEmOLkO2oCyFvqBkqVHR4uVpgnb+zfN9ymvz2kRrZApE9eTU4jA+Tivjm1VSuf914x73RTpFbH5/zfCEAT5j6Zi+peQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYL359TfhXRT0qJ5mtolFOwXh4EgFhT2io41Svg/QG4=;
 b=DVcNvnxGXhEi5ZEBzdC5I5OLIq9b+pj00OzHdKvkjFxvjohJ5QEMZCfOWT6kZVD6m7lj8uhJ6LtnQf6QPR1h2EauzlqYue1BtGsj2N+nQUVAp2xbMlQ3VggFp+sJBY/38ggFup3FqCiFDtFEC/n/cWnuP5VdN85ltw1TrxcidwY=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH v6 0/5] Kconfig for PCI passthrough on ARM
Date: Mon, 13 Nov 2023 17:21:09 -0500
Message-ID: <20231113222118.825758-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|LV8PR12MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a8e147-39f0-4562-061d-08dbe496e2ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RuENATDlZqN9veKX8ai06rVNqPl8rZRJIkUNGh2FAj09qroGB/pF6eALkYAd/IQ8dyHaq9ZafGq/hn6BrbyWSPj1UuFolvn018CwobhLqceAJPVCisNbB7wsmsmgc1jX25YOPp7jgvXCPfc0Ab2tVNuG+eRUWZhcpInCO1fLsGQMJH+KMmslhAIQjalHTza2axDRwL2d8rl3TkKxT83LDJF9ISVYwvCyz2T26hpe79xnEEyumW+eoWvmLWQCwY++fsA9578S9sRQBEYZG7p5VdM7eyozwbGHmb3gLGuiF3mtfhLAqRr/QoEXQEy+fYohsHOhau4qeJM4DuH6ezmiiwZYtcBqQInbx1+sARTOGnw2TRqvXFvAW/n0yC3Abdtg384zyV4jdOfTeBnaApDqOBIFQzUzLMobXgZJKsRZuKLFA0uFj7bt/iLOUbZZOMosxxHwWOjMK3H4BI6mt+NBZ0GA6WBYvR+SzU4kT4dR8vEA/0CEg8kiw/BmLaxp/W28MzOY9ecYzNe6LDMsjLl5Rd/gCI9YNC2kQIqTb2jKAyZ6iC2pZuNq2GxkIVxXMVwcYHClbYbWuJbYRiHkhjxoxG7dUorZ8onetBjyaagcHZ/yGGRwrZOOzSo59W+5MOYbWaIGEIqo5v0gbfSuSExvudPVwjyRlEDC9mZQJZcuTSL54OID7zHHH65ZMWnchw6+srjgobmnX59hB6BfXnAnd9+YsLkVldS2WGWMuwjuNw6iP9esZy/C3gieMuCInxFTBkmkWOt4GSAeOlHMqZ5yrw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(36860700001)(2906002)(1076003)(44832011)(40460700003)(7416002)(2616005)(5660300002)(86362001)(41300700001)(47076005)(426003)(26005)(336012)(82740400003)(54906003)(70586007)(316002)(6916009)(70206006)(83380400001)(966005)(36756003)(81166007)(478600001)(6666004)(356005)(8676002)(4326008)(40480700001)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 22:21:30.1493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a8e147-39f0-4562-061d-08dbe496e2ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9154

There are multiple series in development/review [1], [2] that will benefit from
having a Kconfig option for PCI passthrough on ARM. Hence I have sent this
series independent from any other series.

v5->v6:
* address feedback in individual patches

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
 tools/libs/light/libxl_x86.c       |  2 +-
 tools/ocaml/libs/xc/xenctrl.ml     |  2 +-
 tools/ocaml/libs/xc/xenctrl.mli    |  2 +-
 tools/python/xen/lowlevel/xc/xc.c  |  2 +-
 xen/arch/arm/Kconfig               | 10 ++++++++++
 xen/arch/arm/domain.c              |  3 ++-
 xen/arch/arm/domain_build.c        |  6 ++++++
 xen/arch/arm/include/asm/domain.h  |  5 ++---
 xen/arch/arm/include/asm/pci.h     |  9 +++++++++
 xen/arch/arm/pci/pci-host-common.c | 11 ++++++++---
 xen/arch/arm/vpci.c                |  8 ++++++++
 xen/arch/x86/domain.c              | 20 +++++++++++++++-----
 xen/arch/x86/include/asm/domain.h  |  8 +++-----
 xen/arch/x86/setup.c               |  4 ++--
 xen/common/domain.c                | 15 ++++++++++++++-
 xen/drivers/passthrough/pci.c      | 20 ++++++++++++++++++++
 xen/include/public/arch-x86/xen.h  |  9 +++++----
 xen/include/public/domctl.h        |  6 ++++--
 xen/include/xen/domain.h           |  2 ++
 20 files changed, 117 insertions(+), 30 deletions(-)


base-commit: fb41228ececea948c7953c8c16fe28fd65c6536b
-- 
2.42.0


