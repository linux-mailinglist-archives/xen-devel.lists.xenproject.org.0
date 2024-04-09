Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F7D89D1AA
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 06:54:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702118.1096933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3Ut-0003f8-LN; Tue, 09 Apr 2024 04:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702118.1096933; Tue, 09 Apr 2024 04:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3Ut-0003co-I9; Tue, 09 Apr 2024 04:54:15 +0000
Received: by outflank-mailman (input) for mailman id 702118;
 Tue, 09 Apr 2024 04:54:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5At3=LO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1ru3Uq-0003cc-PC
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 04:54:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3326fed4-f62d-11ee-843a-3f19d20e7db6;
 Tue, 09 Apr 2024 06:54:09 +0200 (CEST)
Received: from CH0PR03CA0243.namprd03.prod.outlook.com (2603:10b6:610:e5::8)
 by SJ2PR12MB7917.namprd12.prod.outlook.com (2603:10b6:a03:4c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 04:54:04 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::70) by CH0PR03CA0243.outlook.office365.com
 (2603:10b6:610:e5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Tue, 9 Apr 2024 04:54:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 04:54:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 23:54:02 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 23:53:59 -0500
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
X-Inumbo-ID: 3326fed4-f62d-11ee-843a-3f19d20e7db6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1kGbbSO3/gnGQSBhZy+Es4Im40isgOpBDJ9sm2tgX/hcL3ksGeSzurgUE4dNBvJkrDCfdoP+ZHPzFl+ZKuBPohndB5Je6gRT8nS56dY8rJibpRg9k7OulrhI4v8/nDpf1rmQwFjXFdZOseTxN2EwcgeuyqDzskxYBFGtp9DN/TiBzm9LIGV9ENksBUNZcMFA/K2NrBj46o3rg8lzD9zbg6/7Ug5pfXLHOoORXau1RUq5w+ETV9i/+YcEClexjtnERoa0DuPpWKQs1USMF9N1h88uB+V1TDaxPFHQS3iNgQ0/AxNktDOotDOvhzeLQb13XQJ4K0ORHVG99hAC1TrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvD3iuj2w/1FIqsRweCCg8YNxCx0XmkWYy+M7wmuldc=;
 b=CsmIMnXW10n8/tT/VOkrsmuoJRnCiPJmvVFQhhO7QJlHkoteLcb3u/J1htybY0iAfctNRJuCNEFilyDDx+GoCOqwn6/NfnCbAr9CT18bNKuDCNZOxPue7X6r2VDAwuiktik1m94byRceBx1JK0QVCbVC9fLazek1MCDqDtijga1rgt8HG0Jwpof+LuwjbNn7o2BF+q608cofClmswicvgGnS8zgfvFYX/KgB/k7XNsSHtAwla2WPFCVD5xala4A+PLrIlEpQbEZidmLfIlpI6BtjwyDxaoY1kEU+BsA/fNOQIFkorhhpRH3Ye55VSvc99cJ6NWiskxpw43x13a416w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvD3iuj2w/1FIqsRweCCg8YNxCx0XmkWYy+M7wmuldc=;
 b=mmRDpHv6/7t0nQCQcCDb8mjuVD+h5dXRq1RbWCZmIeJ+FO6FR/lIoOSSDYLP1RiLt03EAYt934kSk9LqKUuNQj1Vvrd4XGL3yOZER4wrvkfeCxBO7jz5isJd6Z9u9figO0B5Rn9Vss0eyj3WxEY+eH5hXnlmb1yl+DvXWCmzaHs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 0/5] DOMCTL-based guest magic region allocation for 11 domUs
Date: Tue, 9 Apr 2024 12:53:52 +0800
Message-ID: <20240409045357.236802-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|SJ2PR12MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f293f71-6d1e-4d5f-b1cc-08dc585113ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BF6MRQoHdD8wamkLXZatKpI7kyOhPa+T96Lpk5p/mD96GNviW7a6v0Z2EFWh93F1CGJCAxLHK/mLeeyFPDY7OW+lWxGT9Gj/uboRu0guIKBCaqsKCN7mDZ25zJM2XJffnMGCJX3RI9pvDD5QNNFL041JJygszAjILJhnjSSKOBgR7fxZpwj8/KA4sfGwmaPFPHKkih2G0n7vYNx6UlZYu+AD2ggbc/p70b0TqCXhI43gAtjweOi4kwmCvP1VFQ8sGIqrVWoJfmUWSFXdtw9Bhvacjqu91YqyEWGViPaNYTg+oiQYEwBf19497gPYAB6VQfHEzqpd2Vffk0uyT/9YBIDAULJyWQR3yopleJRtWZkSux41MhtK/Oib7n4jd7caGDBRof9pwciL/PsfwUAQ+R9G7uuKOmNZUmzB/b0MklHxOGNRTOLlT6kJfQ5XB00SddeauKcUpHxwSgIPI2rgmJUzFoVH/12p2WyLIfDqEixCEFG2wMUClCxdpZua1F3Xha03bqXU8C++jca9rMsN3Fw+N9ROiDKH2zdEvjBB/YYQSVopTYG4fHz8orcNlIsFvImRPClTmqBDhDLOR+j/q5BEnkmfzR/NckhYMQONoYwqiNHWEEfK2q+0OSzPHidzYiL6O+ahJDH8e3WWdVm+tp+JiNF+P1sFncxxZlcWs+PmQnRH76LiHywtatlDLC2+1sVZztEEmvJqRGou+qo9bYSGU5A6GjLQcrQSY89c4Jo5qkqvp9WzHw8FcJfikjrm
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 04:54:02.9238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f293f71-6d1e-4d5f-b1cc-08dc585113ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7917

An error message can seen from the init-dom0less application on
direct-mapped 1:1 domains:
```
Allocating magic pages
memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
Error on alloc magic pages
```

This is because populate_physmap() automatically assumes gfn == mfn
for direct mapped domains. This cannot be true for the magic pages
that are allocated later for 1:1 Dom0less DomUs from the init-dom0less
helper application executed in Dom0. For domain using statically
allocated memory but not 1:1 direct-mapped, similar error "failed to
retrieve a reserved page" can be seen as the reserved memory list
is empty at that time.

This series tries to fix this issue using a DOMCTL-based approach,
because for 1:1 direct-mapped domUs, we need to avoid the RAM regions
and inform the toolstack about the region found by hypervisor for
mapping the magic pages. Patch 1 introduced a new DOMCTL to get the
guest memory map, currently only used for the magic page regions.
Patch 2 generalized the extended region finding logic so that it can
be reused for other use cases such as finding 1:1 domU magic regions.
Patch 3 uses the same approach as finding the extended regions to find
the guest magic page regions for direct-mapped DomUs. Patch 4 avoids
hardcoding all base addresses of guest magic region in the init-dom0less
application by consuming the newly introduced DOMCTL. Patch 5 is a
simple patch to do some code duplication clean-up in xc.

Gitlab pipeline for this series:
https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1245192195

Henry Wang (5):
  xen/domctl, tools: Introduce a new domctl to get guest memory map
  xen/arm: Generalize the extended region finding logic
  xen/arm: Find unallocated spaces for magic pages of direct-mapped domU
  xen/memory, tools: Avoid hardcoding GUEST_MAGIC_BASE in init-dom0less
  tools/libs/ctrl: Simplify xc helpers related to populate_physmap()

 tools/helpers/init-dom0less.c            |  35 ++--
 tools/include/xenctrl.h                  |  11 ++
 tools/libs/ctrl/xc_domain.c              | 204 +++++++++++++----------
 xen/arch/arm/dom0less-build.c            |  11 ++
 xen/arch/arm/domain.c                    |  14 ++
 xen/arch/arm/domain_build.c              | 131 ++++++++++-----
 xen/arch/arm/domctl.c                    |  28 +++-
 xen/arch/arm/include/asm/domain.h        |   8 +
 xen/arch/arm/include/asm/domain_build.h  |   4 +
 xen/arch/arm/include/asm/setup.h         |   5 +
 xen/arch/arm/include/asm/static-memory.h |   7 +
 xen/arch/arm/static-memory.c             |  39 +++++
 xen/common/memory.c                      |  30 +++-
 xen/include/public/arch-arm.h            |   7 +
 xen/include/public/domctl.h              |  29 ++++
 xen/include/public/memory.h              |   3 +-
 16 files changed, 415 insertions(+), 151 deletions(-)

-- 
2.34.1


