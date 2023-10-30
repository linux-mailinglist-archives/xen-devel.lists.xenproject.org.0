Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB007DC34E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 00:54:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625422.974672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxc4E-0000Br-9c; Mon, 30 Oct 2023 23:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625422.974672; Mon, 30 Oct 2023 23:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxc4E-00009f-5o; Mon, 30 Oct 2023 23:53:10 +0000
Received: by outflank-mailman (input) for mailman id 625422;
 Mon, 30 Oct 2023 23:53:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j9+r=GM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qxc4C-00009Y-4S
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 23:53:08 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e89::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75f69e63-777f-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 00:53:03 +0100 (CET)
Received: from MN2PR19CA0036.namprd19.prod.outlook.com (2603:10b6:208:178::49)
 by PH0PR12MB8176.namprd12.prod.outlook.com (2603:10b6:510:290::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 23:52:56 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:178:cafe::5c) by MN2PR19CA0036.outlook.office365.com
 (2603:10b6:208:178::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28 via Frontend
 Transport; Mon, 30 Oct 2023 23:52:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Mon, 30 Oct 2023 23:52:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 18:52:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 30 Oct
 2023 18:52:55 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 30 Oct 2023 18:52:53 -0500
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
X-Inumbo-ID: 75f69e63-777f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ss/nPbeTONb8AyWh5VjAfF0AROveqfx46rSM+54d0uDiGv9n8dCZT9V6VmNiqzVBV6/Pp7iSXvteArXJYzTmXKZ1yE8k3+RPEWeQyS8qP629+UngYr8KzIT4YAbh3DEyWCTmSHqCmibbpxgvTotM9c3BpxyUOywbvHGEqusaRBlrWve5Y1MZonDNDL4fMZSFTNlXaGq1tCFlnLWd3S96/HJLvywGT5wbyBaADdn5HE7OfBtmgdozgnbIpKqPA+g2Lgs2C3RFoJzpR5WPcNOUzyXIg/xoEa5XmTQAskfMftFco7uy5g5BAlIoN20rDI8qbPPL99P+jidoqHal6cYsYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZH56hr5p1Jyv8APbSQjo/iQs8yqGwP42SrM9niQD3rc=;
 b=Zhv+VtWWjPBe4Sv2I/gQ/wutGsgPiBZ9d2Tr9krnw/9dtQ5VYWmjBezXUwrezy7AYoiufsju6t2rirr5HSlNB4Wp1Cq/4IurAQy+7uT5+kJcumq0GQCwx3XqG7//kv3/QX78bsfcd730ChIm5oBPxh5N8Gx458vUc3baGIljrWg1meP9AffX0hQvZZmpL33Tabthf+IXQLm9fPQCOwLOQ4IaOk+D2bz4ow1Yqem0EzyGpmF6dQFvUaqrVt68othTUkkkbh2/LGgaBub1znpA4rRGxtFBD1ExYN5e9hp/2ni2xqZL1f2dLvM+5udMy3gyC5HrZfehigaTkK3T7SCUMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZH56hr5p1Jyv8APbSQjo/iQs8yqGwP42SrM9niQD3rc=;
 b=369DX+YoRzFRML/xxsvPBxlaBbWF06HQLnampOPfPx0aHKOA9v7Nzc37zXdg5aOy7F4Z4RxWMlFbE9f5+xLrc6LVm3UndqvWfMhlaqRqi8FrrWNZsTqtQqa+VV4xZFwUfrO6ZY19MqAUKcNrNW1Y/rj1mWYju3MZ5JNdsmwGt2o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
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
Subject: [PATCH v4 0/5] Kconfig for PCI passthrough on ARM
Date: Mon, 30 Oct 2023 19:52:31 -0400
Message-ID: <20231030235240.106998-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|PH0PR12MB8176:EE_
X-MS-Office365-Filtering-Correlation-Id: 13cf1d96-0002-4456-5a03-08dbd9a3567c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tsrp5NDSUbH352QBvS3LzjiAfz6sBudJJEk5BsQCurZGgDh2zv01+4PGWs+sWRu3dvjbvYsTKVEiU9FgqPtf0bae5V+aitNBdREw2vcEgeLLDj6hjvVCamJLNUrO/g1gYOWcdYoXz+qQnJZRXGlecpsTt/8//VLHuPzCb9XU9LrvgjMcjRK6IgCPRNuwd3bW7X0tASDXVLlmJ8N9S5BPK0YPZbrYVAxarGQpsvbH5L9IywzuCfMqp8/fWhAQDK49x2W3eAwOXxgXv8mpcew5BsR82YelHAInG9JLQdNtBqeEUGeLZVSGM1RaEYRmKvi6wdr0l9DDay1qRfOnPIGwx3Lv94ACLKw9BCH58uUc6aiGqzl4qNT0FOskNVB6uouNE7c6hvwlyDbTm3tzRNJK7IPYVuX6u+PvCpDWgOMw6FhXCvCFkGnBbxj81HI64FyC+YKqjQ7dzDxRN6nn3poR1ehxz/+NrtZu2c0o8rjK40lKrk7zNOjmWQSAhPtKTWdTpQnbaMeHpMBLa2Lmpg5OJ8ufwuM9K1ahBusnWsyjvQjVKOzRrEldIpR8sNXOpJBJB/Dhu2SEHWMHqlYI6sPiTA4RuuSJ2PnWODBD40moSrajfHQg5p8z0JISLOG1CN8UYRrScybaDzC71Ayt/KRU0yyW2OgGDGK4zYK3KCu/MCjYwx+JD8d98K8/KmNu/EmzrCO2wW/+v1WCGRvCWX29SJpWdox06pY/0iXkjLey/SSQR2i1Hzygr5tmCf8TktTDpC4yj5T/kWHAyRrlCfPRhQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799009)(46966006)(40470700004)(36840700001)(82740400003)(36860700001)(81166007)(356005)(47076005)(966005)(6666004)(478600001)(8936002)(6916009)(8676002)(4326008)(70586007)(316002)(70206006)(54906003)(44832011)(5660300002)(7416002)(2906002)(41300700001)(83380400001)(2616005)(336012)(426003)(26005)(1076003)(40460700003)(40480700001)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 23:52:55.6475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13cf1d96-0002-4456-5a03-08dbd9a3567c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8176

There are multiple series in development/review [1], [2] that will benefit from
having a Kconfig option for PCI passthrough on ARM. Hence I have sent this
series independent from any other series.

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

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00210.html

Rahul Singh (1):
  xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option

Stewart Hildebrand (4):
  xen/vpci: move xen_domctl_createdomain vPCI flag to common
  xen/arm: enable vPCI for dom0
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
 xen/arch/arm/include/asm/domain.h  |  3 ---
 xen/arch/arm/include/asm/pci.h     |  9 +++++++++
 xen/arch/arm/pci/pci-host-common.c | 11 ++++++++---
 xen/arch/arm/vpci.c                |  8 ++++++++
 xen/arch/x86/domain.c              | 16 ++++++++++------
 xen/arch/x86/include/asm/domain.h  |  6 +-----
 xen/arch/x86/setup.c               |  5 +++--
 xen/common/domain.c                | 10 +++++++++-
 xen/drivers/passthrough/pci.c      | 10 ++++++++++
 xen/include/public/arch-x86/xen.h  |  5 +----
 xen/include/public/domctl.h        |  7 +++++--
 xen/include/xen/domain.h           |  2 ++
 20 files changed, 97 insertions(+), 31 deletions(-)


base-commit: 9659b2a6d73b14620e187f9c626a09323853c459
-- 
2.42.0


