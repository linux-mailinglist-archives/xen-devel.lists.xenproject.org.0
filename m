Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF497E3AB0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 12:02:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628761.980556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Jqv-0000UP-AM; Tue, 07 Nov 2023 11:02:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628761.980556; Tue, 07 Nov 2023 11:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Jqv-0000Rm-79; Tue, 07 Nov 2023 11:02:37 +0000
Received: by outflank-mailman (input) for mailman id 628761;
 Tue, 07 Nov 2023 11:02:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q5W1=GU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1r0Jqt-0000Rd-M1
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 11:02:35 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26a41f7e-7d5d-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 12:02:34 +0100 (CET)
Received: from SA1P222CA0184.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::29)
 by PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Tue, 7 Nov
 2023 11:02:30 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::b0) by SA1P222CA0184.outlook.office365.com
 (2603:10b6:806:3c4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 11:02:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 11:02:29 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 7 Nov
 2023 05:02:28 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 7 Nov
 2023 03:02:27 -0800
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via
 Frontend Transport; Tue, 7 Nov 2023 05:02:26 -0600
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
X-Inumbo-ID: 26a41f7e-7d5d-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTAmkjuPgo8CfOPfHVA+cNmfQVbjBhHMhk956MX4pTfIpgt9+nllt2B+KA1RLuuNMNJJVi50s6FLxERIclAsFde5Zkpte9tSmQiZM2WP9gAx8MOTbKIM0TP/kUsGavU/D9aL9MrcM+cqivIgWlW3OuDr1vKbDoeE61G8yYOOVzEeQl+LDTBubPGicl+cqK6ai57CWrC5wWNWdwWfDFNfaEH30mKHPoFlCy8JiIpmvyEgnCkUGTns6mqlowSBiNWhd7+rLjxeDwb7FT5OeJNBMzKxKTUrcTBLA8cpA4ZrwgOkvnFgNd9abLW6rtq4CdMeRzXvf27V9jJesfKUrsq1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQ3nDnZzIOlBJ/9NcxXfJ1436Pka6wUXHNTU65y2wps=;
 b=i4HgHBN3PzIbqMJ0nibTQy45uiFX1T/ooQEUvbmAo52MtnR0FMH9dMLuQ9+NNUVgTGdfOZThe8/CBgvx7z5fox+I8AY+Kh4q9aubrd3nJvnkSK2bnjNFgkH+f2USmGZWJqJ+GXXUgulwa251HCw4WpzUjcONOkC0j8FzwhqfqQ6oMGxCvna2uHex2aBTuq8EQjSpy4ifPyTGfZ9gMTIDiIyTAjXRIVM6/Rllw6Z3J66k0tQMLCcKNyoNw6bSBuvt3PLtT9p3ky0LZOb2OHXvN93VkZuhY3Oi64uZTDyvpJEslUBTz+TWtbrqlSznG9E6JMjQXdJI/w1nTVN+PZ/SOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ3nDnZzIOlBJ/9NcxXfJ1436Pka6wUXHNTU65y2wps=;
 b=rbuW4TNyjL1see6dWiQ/ztQddg0pxI4Dgf37xAAInJiRqXXfGwjw9f2MWzOrsrhZMQ2pgJrLs+vtprdLYY0hfZB8OGoPLEl4luLJ2g+2oFNnKATkP5dAnlmMg1hGAHPDOoaV2zhots0N7mb4YQvaGfOEKXsmx50TdUdNScx7lsI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@arm.com>, <henry.wang@arm.com>, <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v3 0/2] xen/arm: Split MMU code as the prepration of MPU work form Arm32
Date: Tue, 7 Nov 2023 11:02:15 +0000
Message-ID: <20231107110217.1827379-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 830e1ed1-3fc1-481d-8de4-08dbdf810919
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JIwUSDJD2duLdL5UpbjiY605g8pUxKyzgZ55k4PTtwliFmO4dXyZlIpYdNm29oR2z9OhODoMcyLoOZX3PkcI7C8LUohkdFSRkjjCdHWb0qpOrQlpWsZBHcapopkOJliJFpV1xL9NAm7jKuKpARu1kIeYhFxbE59v9WhqhQX7pRDGCX0tsHIKgrZvceUpZuAAPVupgVXxCsjC5gY8U4jwvVciVJXoQT1bTLlvuOFpWoOy/8Wet+o6eGwC9j8nIrhwnkOqKh63G3fg/270Vh4dZ04FQuynExhknCizKBhqVhi5O3K99krCiIwoxVqY3fH+slXdOH9AgOc6/zlVB7rPYe7ZjUlZ0cVKE6giN4AdpchmHIZepFGdt1giF24POZ6ptfKi59YlfBZSHkYKw3emmUl0iCiKfNyIBRW7RRiviydCjYOqbiaXK8u5+9GMRd2mODD8OsLywAr5I+suSxDqnj17XCIpYJPToQ3CsaRgitts5Z/Tgr7bGJewYBVOymsqxgWnHcGM/fcvP8OHe258sBcXpaoFN7bIR7h+g/AaYxr6d2fu6iNSYukTP9/uzWoFhjqa+bWoSna8eBBaXm1AmaT2z5yW9xtzOne8LjEzi/9F6l7q58DesRu2soiC9x25oi7X8or9dbWbd3jl5fekBmjbRHSSvVPSzgMFyrBnOgnxL/1507bq/wTjffysl31zsZ0CDEePyoqQtYkWvi28PHw8hcbLxh5/Dpg3RFD5jknYZbZ2nqGqqI6fdBBGbEwo
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(82310400011)(40470700004)(46966006)(36840700001)(8936002)(40460700003)(47076005)(40480700001)(1076003)(2616005)(426003)(336012)(81166007)(26005)(36756003)(103116003)(356005)(316002)(8676002)(2906002)(54906003)(966005)(70586007)(41300700001)(478600001)(6666004)(70206006)(6916009)(5660300002)(4326008)(86362001)(83380400001)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 11:02:29.8720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 830e1ed1-3fc1-481d-8de4-08dbdf810919
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031

Hi,

These are the set of patches based on top of
"[PATCH v8 0/8] xen/arm: Split MMU code as the prepration of MPU work".
This is the preparation work to add MPU support on Arm32.

There are two more dependencies for this series :-

1. "[XEN v1 1/4] xen/arm: arm32: Move pt_enforce_wxn() so that it can be bundled with other MMU functionality"
is merged into "[PATCH v8 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S"
as per the discussion on [1].

2. "[XEN v4] xen/arm32: head: Replace load_paddr with adr_l when they are equivalent"


[1] - https://lore.kernel.org/all/f098a07d-fa19-4b40-bfac-7b121524382a@xen.org/#t

Changes from :-

v1 - Dropped "[XEN v1 1/4] xen/arm: arm32: Move pt_enforce_wxn() so that it can be bundled with other MMU functionality"
and "[XEN v1 4/4] xen/arm: traps.c: Enclose VMSA specific registers within CONFIG_MMU".

v2 - Changes mentioned in individual patches.

Ayan Kumar Halder (2):
  xen/arm32: head: Introduce enable_{boot,secondary}_cpu_mm()
  xen/arm32: head Split and move MMU-specific head.S to mmu/head.S

 xen/arch/arm/arm32/head.S               | 578 +-----------------------
 xen/arch/arm/arm32/mmu/Makefile         |   1 +
 xen/arch/arm/arm32/mmu/head.S           | 573 +++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/macros.h |  58 ++-
 4 files changed, 641 insertions(+), 569 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mmu/head.S

-- 
2.25.1


