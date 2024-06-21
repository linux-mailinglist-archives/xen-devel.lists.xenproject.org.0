Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A689E912064
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 11:22:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745156.1152313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKaTK-0004q5-6m; Fri, 21 Jun 2024 09:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745156.1152313; Fri, 21 Jun 2024 09:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKaTK-0004oa-3q; Fri, 21 Jun 2024 09:22:18 +0000
Received: by outflank-mailman (input) for mailman id 745156;
 Fri, 21 Jun 2024 09:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CZKQ=NX=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sKaTI-0004oU-HR
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 09:22:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bed154dc-2faf-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 11:22:15 +0200 (CEST)
Received: from DM6PR18CA0006.namprd18.prod.outlook.com (2603:10b6:5:15b::19)
 by LV3PR12MB9330.namprd12.prod.outlook.com (2603:10b6:408:217::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Fri, 21 Jun
 2024 09:22:10 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::d3) by DM6PR18CA0006.outlook.office365.com
 (2603:10b6:5:15b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.36 via Frontend
 Transport; Fri, 21 Jun 2024 09:22:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Fri, 21 Jun 2024 09:22:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Jun
 2024 04:22:08 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 21 Jun 2024 04:22:07 -0500
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
X-Inumbo-ID: bed154dc-2faf-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekI0HVci+7RptkZlYVNA+nv2QV3OfB5sIst+1hcYvJxJOlD+v2CF65ZeSA7/fLNb8EVlukXYJdK+M0rvRhFfSp0aA+cLJDwBltiEk8G2B1fIZFkmFX7VenMyA1Zgl5XpFQsOoWNWLWbKOMHmlaFuAIaVXHBjSQsXcDjaogXZq9NJH0cx7L+dlfAihO2Sy1i+vEDKx2f0Jf1mMxUeMSJbF1crJpbWco07onNNxHfAJnOjuzgjYTgi9CopW6lF5RPtiSD6Jf0NPkW0oeZZ5PvydPd1DBUChDewn6TGx9cdkZbGhEIvXFe12kMj8mf9Ha/LyWeUkKK8sem7kTx3b5nIkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FraBI1i4Bnal+sGdEA8zJKnwWAqHj5QXtcKpWhWQ7Yw=;
 b=MJDFT+Nj6arwkKaQqIfuYbToBjLJ0CBhFuRdehxoBe3nxFuqfPuUjaAFjixUkg9puLfy9ZNYNC0e+TxiuMg9G9WELfl+3Bg7zGUZe1puxFxFgn0ZuL4ui5ZwEU9nuZUhPP50csmhQn6mJFQcvaNSNSCsv+yaktuoFVsBP7HRsIIi+aTIul6SITNLFVMFZV0iBmt5yqhVrKQVmPt1keUJfHpDjA4B/Kr6UMafBiMv/mfNne2lQF7MHr1t6hEXB3Dbr7pipmwblF4CvXG6D6NxMDDPOVKvp9/75hNJbyq4+bv+fRWqVrjNsbGxVUyLsGqgQd54DR4iyvczSgRLIJKjmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FraBI1i4Bnal+sGdEA8zJKnwWAqHj5QXtcKpWhWQ7Yw=;
 b=il/dM67VQu7FDe6WZH93MSrDJApQqcZafMvO5W8JkJcsNoxXagmqJmw6pxe0uamFstGUUjOHX5Rii+YMCqqkVExW2moxemuAArr5LwXA713mRw1sGWuTKfWBKLHnOy/7bbCzRDYq2WgXQPeYFcQyyUcXybfS0+TBsveNjQoX5fs=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19] xen/arm: static-shmem: request host address to be specified for 1:1 domains
Date: Fri, 21 Jun 2024 11:22:05 +0200
Message-ID: <20240621092205.30602-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|LV3PR12MB9330:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bde3ba6-5869-4b26-8169-08dc91d3a08c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|36860700010|376011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sw22mpammKbOO9Kl9Pjopt3v5xbFhrSX0hmHweGI99FbiE8JTYI7ZAceJDQ5?=
 =?us-ascii?Q?jS2LXSBJqwDowDHGMFk4uoLzqPou40Zk6sDbvgSzUMrkD64YQksLfGMq7zMW?=
 =?us-ascii?Q?R1lit1pAkiEt8kaOJFUpasCbbO0oKzFHViiNphla8LX5/BFzVQTitOIWTzOj?=
 =?us-ascii?Q?/scY+3ucsSHICQztYaEyiK2bSaPpPYWd8b7ML+um295D7gmRPrWA0p4VC4QP?=
 =?us-ascii?Q?+JzfpbatQr1svz2udZqk6+Kd9POZ4/20n7YOtzYicR28xyShOG0tBgiqAFw0?=
 =?us-ascii?Q?NzYXrkxDsjIFAyyTYbBIh2h/LvSqjMXp9eOJ2aRvr2r8hJQYUJSXA/NhqeWf?=
 =?us-ascii?Q?5koVKHNUyb3pdyFzDMOzQyRCgHpL5ianY+PL+7OniAqXI2Oe1XTh7PUPSUlX?=
 =?us-ascii?Q?ecN5BUieT4IP/AzzxoeydEyfTNbzHDoC916X1moe1votfcFynOkqxSOLF5HL?=
 =?us-ascii?Q?bWyvCIjq2sFHShHe5byUnIkTekVE16sYWhzW0UDdusp+/ysXi0qD19JkGQQd?=
 =?us-ascii?Q?ELyjkq4624lV/AmVxuC9bBx3uKvzC350bhP7RzyTKXDkeAON3AYVUcfoTPYJ?=
 =?us-ascii?Q?e+W650i+aDnB+8rQ2pi7Szr0+K3dsftsysBfyIMLc8FgucbR6Mo/OANGdFrL?=
 =?us-ascii?Q?ZoiLHwsIH7QA8ugf2J5bXClyV0TyB2eb1Dmce8aJ7Xlc2ojzE2+Izlb76oSa?=
 =?us-ascii?Q?OjIOyj8nYYIDP3F7WSnHWftyCOHDt27qMh1TNoQSiwGyBX+A0pT72Cm+3+p0?=
 =?us-ascii?Q?rka3HPlIyYNs8YbM/QXVk9WkHvVY4nMAIcH8eOYHoM/cEWc1mj0cfRyH2fZa?=
 =?us-ascii?Q?dVU6CqBQMP1tlNNRFw2J+lGo/lrBjAbfkKhrrWbbIfep7qKz03tj3Q3jn3km?=
 =?us-ascii?Q?iBONJ90rOBL6MAvJ+/ThSRYwj3+7naEEHtc4dNBEsq9290H00jJhVbqGv2uR?=
 =?us-ascii?Q?SHlWkd06oU72S98pYXvsBzRdWY/sNuxgFv+hpubbf5hPamHstwcPbvJ4E0ca?=
 =?us-ascii?Q?teeyA22xhZX7ZheTWXFP0kPB60Js2pOqti9jx3SH0bsed7ypc3BubhNUvz6H?=
 =?us-ascii?Q?POVWHB6hYDcXIrxnZJi81IMGMulu4xvUdE9N212lWCqnuGDb77VkwoNAbXlQ?=
 =?us-ascii?Q?cneTM6Vq7JnQRtzl8gGNmzTbwxs2M7nNKMdFK989ixvHR/NefJDIHRNUPMy6?=
 =?us-ascii?Q?UZvW2KYEGn+jmr0rahSTs8Uw3y9viAZ8FuDCH04lc1YEGGJ8ovu6jvYCNqvj?=
 =?us-ascii?Q?fFXqAavoRU8oKYjL1e8cUNBNSH7IPU0B/0pZ+SCxXCfiHDHrMKFl88b86NLh?=
 =?us-ascii?Q?qyZBp9496ZZeZk5LXLfScn0/jjlxtMEbqA7txm/Q3Jn/egKVdpnd69C5k7jq?=
 =?us-ascii?Q?WtyzGh4RyFfM7nh+VlntKaomLsEWe0stJG6fKSgXK9CPB7sr0Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(376011)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 09:22:09.6207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bde3ba6-5869-4b26-8169-08dc91d3a08c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9330

As a follow up to commit cb1ddafdc573 ("xen/arm/static-shmem: Static-shmem
should be direct-mapped for direct-mapped domains") add a check to
request that both host and guest physical address must be supplied for
direct mapped domains. Otherwise return an error to prevent unwanted
behavior.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Reasoning for 4.19:
this is hardening the code to prevent a feature misuse and unwanted behavior.
---
 xen/arch/arm/static-shmem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index cd48d2896b7e..aa80756c3ca5 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -378,6 +378,13 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
             const struct membank *alloc_bank =
                 find_shm_bank_by_id(get_shmem_heap_banks(), shm_id);
 
+            if ( is_domain_direct_mapped(d) )
+            {
+                printk("%pd: host and guest physical address must be supplied for direct-mapped domains\n",
+                       d);
+                return -EINVAL;
+            }
+
             /* guest phys address is right at the beginning */
             gbase = dt_read_paddr(cells, addr_cells);
 
-- 
2.25.1


