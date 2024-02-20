Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDC185BBB7
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 13:18:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683466.1063003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcP4T-0000hN-Lg; Tue, 20 Feb 2024 12:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683466.1063003; Tue, 20 Feb 2024 12:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcP4T-0000eT-Ha; Tue, 20 Feb 2024 12:18:01 +0000
Received: by outflank-mailman (input) for mailman id 683466;
 Tue, 20 Feb 2024 12:18:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7zC=J5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rcP4S-0000eL-QP
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 12:18:00 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 157ce610-cfea-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 13:17:59 +0100 (CET)
Received: from DS7PR05CA0029.namprd05.prod.outlook.com (2603:10b6:5:3b9::34)
 by CYXPR12MB9320.namprd12.prod.outlook.com (2603:10b6:930:e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Tue, 20 Feb
 2024 12:17:55 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::1d) by DS7PR05CA0029.outlook.office365.com
 (2603:10b6:5:3b9::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25 via Frontend
 Transport; Tue, 20 Feb 2024 12:17:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 12:17:54 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 06:17:53 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 06:17:53 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 20 Feb 2024 06:17:52 -0600
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
X-Inumbo-ID: 157ce610-cfea-11ee-8a52-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmVkHSQIw+2w3QcGzaThV0wUB+nIV1QkonRVbaqYRIr9JW9XnGI2ovl1ZrGhyJITwEsR8phkXHxqj2rbCOlk9x13QhAeJySmajZJmM3pYlPFrD7N057Ih6u6UhQRPBDuV+8cME9mduh1outpPDrXcaJGvVhdqDgfqPKomxh5KWZbcQvVIiwTTrmKjsuWNhgNdkShhhfmkUKHCXsT1It0U8ILe72Cytk8geBamlVu63cO5x+wLJE7cmcBI/+C1s7fY0M0ZFBwS2rxtq49s3Q7bAWHEBIAJlxTBPkLP1y6r5LkwX5sQLN0IFq5BU62EzvusnIGm0Wf/su2521J7FZ3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rF9Ud1ZH+JBkCn35IfybOAiJd4oKJew/66Pz/2BAls=;
 b=KiRilViUOcl5Xs/tqsGte64v3R7sjyuHtADIG6ZoNCm4qtXrFMIXonOQNM84ZbXeUFO5cE1o9JLB8s8rP7IeVXmTjo1lAi1hCFvbEATpYpdOmTkkIL0oOpwdoTowDkfB1iCBZsSX3CxhihCvUH9dEHtxUtPNbfZhYe1XIVmOgPLRKHYjZwQ+Qi7DMT8f5KFDOhhgiCMbmdBINHJHVepEolGUCF13LjK4/RGjnRpzBb9ORhxmQy16k0gRSKCE7EYY0m9Dz96BNrZnrbF6sXiOs1POKWSqKRttPjDpB9xEu3/Hgw4fApyfkdnUb1HriWIuMDEqnvS+2f6z0Y8W7pVyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rF9Ud1ZH+JBkCn35IfybOAiJd4oKJew/66Pz/2BAls=;
 b=g+r0jQfdSGNbzA2cXV4l3TAbVTguSj6ipo8Zvzzm7IGCBn87MO3xP0nbkB5SD4xo7KHCNJRQ9fyLt9FRtDY7fJRUhWkEYIx/QaXR3bglESV5cu7pOV+rBs5XdOaIHpGisG8+LZmsbf8IK0bJdoEjFNH1EtbJ5V6KouapdIhYnAU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v5 0/3] xen/arm: Add emulation of Debug Data Transfer Registers
Date: Tue, 20 Feb 2024 12:17:40 +0000
Message-ID: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|CYXPR12MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: c78b7dbe-bdc8-4b9d-30e6-08dc320df78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wIdDu81Lxs3qrxDYBIVez2J0YS1nW4IFeJ//yP/ToGUtAY3LM2Bf5GilM11w0uLjazMZyrb11+f0VyTvhM14CKw8uGSJ58s9BVrRw/acm3vmaIPYTJq32KroQB/9XnE3/FskGwXDBe6OvQgvKeWCdUssPvrpHSLU61BCLjNy1gqqAaZCw+Lui0ktnRjG/z4dbhxW9LetnVkrc2DMRSq+fdXJmBhRJmPxDs8jJ62HRXvDZmsIEOElX35y+TGjD96GN4jT8MkPOsiuc1aDhg5QHxOPmch+N9QXqFt5yZ4Ai0QQX50smNnSQ2x9DmrNqD3IDZkDS4pQ/p51BP+phShUF0bWuC5P6cqRAWxaSZhqDMsrdf96cM4z44zaGeb9mSxn4D8TtR9cJn63Tu99BZTwAQiI4MqEU5ZThDFN0dWSyDQplSbcfshUao8DlebVjSyyt3AqzDQsLy8I9cJQbHxqICF6RqnQN5cCctIDp7pQLtbabgnomyWwjFYfpn5OhY9XMCuCZNet2neuzLRX40Ktit2kmBHJfSEx07I4EcbFhvGL27ETknb8wq3Sth5+l7qIsHAcNw6LzaUk1laUd6SQXBKIzGEeimJOn/bEgPKh0gXdmioPm3B+WjVDIsnbLmpbpPvmCe+bzvna3mDRaPUGQQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:17:54.7797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c78b7dbe-bdc8-4b9d-30e6-08dc320df78c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9320

Hi,

Refer https://lore.kernel.org/all/alpine.DEB.2.22.394.2312071341540.1265976@ubuntu-linux-20-04-desktop/T/
for the previous discussion on this issue.

Also, the linux earlycon hvc driver has been fixed.
See https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=0ec058ece2f933aed66b76bd5cb9b5e6764853c3

Changes from v1:-
1. Split the change across 3 patches as per the design consensus.

v2 :-
1. Reordered the patches.

v3 :- 
1. Change mentioned in individual patches.

v4 :-
1. Change mentioned in individual patches.

Ayan Kumar Halder (2):
  xen/arm: Introduce CONFIG_PARTIAL_EMULATION and "partial-emulation"
    cmd option
  xen/arm: arm32: Add emulation of Debug Data Transfer Registers

Michal Orzel (1):
  xen/arm: arm64: Add emulation of Debug Data Transfer Registers

 SUPPORT.md                           | 12 +++++
 docs/misc/xen-command-line.pandoc    | 11 +++++
 xen/arch/arm/Kconfig                 |  9 ++++
 xen/arch/arm/arm64/vsysreg.c         | 68 +++++++++++++++++++---------
 xen/arch/arm/include/asm/arm64/hsr.h |  3 ++
 xen/arch/arm/include/asm/cpregs.h    |  2 +
 xen/arch/arm/include/asm/traps.h     |  6 +++
 xen/arch/arm/traps.c                 |  9 ++++
 xen/arch/arm/vcpreg.c                | 63 ++++++++++++++++++--------
 9 files changed, 144 insertions(+), 39 deletions(-)

-- 
2.25.1


