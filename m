Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2B082D913
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 13:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667373.1038572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPMP2-0000Th-PP; Mon, 15 Jan 2024 12:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667373.1038572; Mon, 15 Jan 2024 12:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPMP2-0000Rw-MJ; Mon, 15 Jan 2024 12:49:20 +0000
Received: by outflank-mailman (input) for mailman id 667373;
 Mon, 15 Jan 2024 12:49:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0euc=IZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rPMP1-0000Bs-3V
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 12:49:19 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e814789-b3a4-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 13:49:17 +0100 (CET)
Received: from BYAPR21CA0011.namprd21.prod.outlook.com (2603:10b6:a03:114::21)
 by DS7PR12MB6069.namprd12.prod.outlook.com (2603:10b6:8:9f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 15 Jan
 2024 12:49:10 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::c6) by BYAPR21CA0011.outlook.office365.com
 (2603:10b6:a03:114::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.14 via Frontend
 Transport; Mon, 15 Jan 2024 12:49:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 12:49:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 15 Jan
 2024 06:49:04 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 15 Jan
 2024 06:49:04 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 15 Jan 2024 06:49:02 -0600
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
X-Inumbo-ID: 7e814789-b3a4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zpwkkj1NQUZoJnxocJZKhMqh8s0CMgaWGbjzQ8k2gtl8+v93avdTK/OsFZ+FNwD1HWAqNmBPKjCa8XVIN+tMJKGDNvGqkk3llbKJrYZ7pddTdF7at9motN8osGD7KDEv7kkCNvYU5YFFUgBXWGTky+0pMbzYfcgH2Zn1OO4OjaVJKBSJbfegjj4saiMJqNatZ110ifOpQpwEXHIJw1IhMXGd+0Fe2wlGYoow2bTBTPbiQbgfND/WGksusb17XPzmm9T3RJGVuPxhBhP4C54CIfbN5oPp/pYY48C3nGZ6bGU4zJEm/GKhWbiQSOO9zvqP5Kjq+Bj+xK7ZNYQ7xG0B/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+D30wa8+YjJ014W2UqmvDQpgxpi0GE90DyQ04+s4KXM=;
 b=RMwBmGWvtHpBnpRF3gewdhZNurJmS4dgaa5aia61iA3YzlximrI/bOl8bKsATABSkBQTu2dlx7wy9ELkBxvxlk2QsK9U0e9/tGTkwaFMYwQKtoX/AUNM+NWunbnwbxQ1hr/Rd/agGwl4KF2eybQL8s58Uig5EtRLay4Kf3OkRPg+TmAyEBURwVo3cci0ZAMefi0sOHWzwk9h+iVrcJeE1Yx4yCb6BlZjxXWmctrBjpDAocxs9oAU8cJ5XRrYHW9+QyFiyh/NLY5Uxp4J/0ZHkA/reTfFBCi4jr9YG38LDRoGiDP2e4q6STuSEY952K3Rdu7F/DtF4Rc36j7JlZnycw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+D30wa8+YjJ014W2UqmvDQpgxpi0GE90DyQ04+s4KXM=;
 b=G0d/1hp9SS+U8Ny1Xjjt3+VQp852nJIIeDF/S7g066NpGZ3gQZOLkAT1Dl44dzjdCqZRxVXe+FRAy+Xvp+arSwnidwafMyXQpyMloATxeodUi09rbFZrMefRyeZKmRDHO9GfXrraekSySNwgIzMYES5LGX233eGCpvAZ+r4hOqs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] xen/arm: head: early printk on 1:1 mapping
Date: Mon, 15 Jan 2024 13:48:57 +0100
Message-ID: <20240115124859.89218-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|DS7PR12MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6575b5-2b6b-46b7-59f9-08dc15c85b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yrPsZQKkM3XR7JzDNh6adm73TN2n89hcVYOgJMCslOGQXhgn5NA0JnhJrrj4Z8DNpeD0kXnyrSdfALBddCxfWBKmws/ELZzE5mFpKE3X6wsMcvf9mbuvZKxSA7TPavr0RTeeW7wdJE+lPwats+vHAy4IG8FPw8D3rQML0LrVS7vJonl/g3KGWYsPcYsqSsT/0bCKk95czeaNTQR25i+aK7PKUgtdcWcYOdZJayC/N5S7f9Nx9D4541252fMxfy/mBvi2wfY+cusY+2xz9ghbdy6FOKzrmpBmYOjzVgIZg2cVvUNf03u1TJoLKyP8mfP+vND/UMRBOItl43g4FQGO3NeePELH2VDqJYZ7dO3oVnGPqE21z25m0/IkA8y34eaCjvrxrUA38lSE8DK4CLm2PMhj8WsUc1HQU/S3nsoMN5DVexKJn7r+vu/1Y8iDlS5SH+F0DHT2Ahv6xS43mRTXTvo7NamIIpzE7n4c9IUGfkVqUNaVWQHPqPhWBD2WAytU3DzpZkmTX09htl7GGdHaNDtIdYSW7Kd3zvCoAcT9hK4eCY8j+r9GCF/2pGaPFW7a0j1vOFIlnxe+i/S3BkDWtO5hdGdJ9oaN5BFsvkIH6jdQ5SKoBduom7QDaxhwgjvDYjp98Ekr/HBCC4fvT1fTH4efCX2ZHj+8aXwx1dbxQ1Dn355HC9BKNcKFuzTJt5fGrzPH4oOvmS+643AAAsAUQdcsxrxU413FPWSnlt+gTgif1MVz1WQgQZSemwAyvgvQ7HZrnsrLrtEvaJ21TM4FIA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(396003)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(82310400011)(64100799003)(46966006)(36840700001)(40470700004)(5660300002)(2906002)(4744005)(41300700001)(40480700001)(40460700003)(83380400001)(356005)(26005)(1076003)(336012)(426003)(6666004)(36860700001)(86362001)(47076005)(81166007)(478600001)(2616005)(8936002)(4326008)(8676002)(70206006)(44832011)(36756003)(82740400003)(70586007)(6916009)(316002)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 12:49:04.8979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6575b5-2b6b-46b7-59f9-08dc15c85b5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6069

This series is a follow up to 1ec3fe1f664f ("xen/arm32: head: Improve logging
in head.S").

Michal Orzel (2):
  xen/arm32: head: Move earlyprintk 'hex' to .rodata.idmap
  xen/arm64: head: Allow to use early printk while on 1:1 mapping

 xen/arch/arm/arm32/head.S               |  2 +-
 xen/arch/arm/arm64/head.S               | 13 ++-----------
 xen/arch/arm/arm64/mmu/head.S           |  8 ++++++++
 xen/arch/arm/include/asm/arm64/macros.h | 25 ++++++++++++++++++-------
 xen/arch/arm/include/asm/asm_defns.h    |  2 --
 5 files changed, 29 insertions(+), 21 deletions(-)

-- 
2.25.1


