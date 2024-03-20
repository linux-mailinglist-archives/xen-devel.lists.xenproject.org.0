Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B24881792
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 19:55:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696121.1086758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn15m-00013X-DL; Wed, 20 Mar 2024 18:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696121.1086758; Wed, 20 Mar 2024 18:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn15m-00011F-AS; Wed, 20 Mar 2024 18:55:14 +0000
Received: by outflank-mailman (input) for mailman id 696121;
 Wed, 20 Mar 2024 18:55:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q6JT=K2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rn15k-000119-Hg
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 18:55:12 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60a23329-e6eb-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 19:55:11 +0100 (CET)
Received: from PH7PR10CA0015.namprd10.prod.outlook.com (2603:10b6:510:23d::17)
 by DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.28; Wed, 20 Mar 2024 18:55:06 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::a7) by PH7PR10CA0015.outlook.office365.com
 (2603:10b6:510:23d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Wed, 20 Mar 2024 18:55:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 20 Mar 2024 18:55:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 20 Mar
 2024 13:55:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 20 Mar
 2024 13:55:05 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Wed, 20 Mar 2024 13:55:04 -0500
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
X-Inumbo-ID: 60a23329-e6eb-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzZlkhresZkNicUpzVSVkIpWh7MH51YfnDvlHskjoZBj24TFdNYT2ebSFVXfY2Jc+hQhYav0FF8zeDLKN1tTzPQnPZAEJ0ql+9lSXWl+mi23FRPozqHqiulqgTulcinSZ+F27iedSqUpi/TbAZjXPhUfVdKGRt8z7lYZg3PprUx0GoJ8R4p6ukI0Y3hLr/zRp3ZLjRS4IOqzLqznpAfV22qRAKVj2l41NaArP1dchXol20m1tmkXQGXp6LanknH6qBmk4JgZIcAJ/fKVsPPr3/MakGu8OAgkHhj9dXgHfNdX5r7FdEP8PMRTySkbuCVQGOMgN/SBUROqnwMRifr7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwZsh0Edhlli/f5Lbenp8QaPj7oDs9Yd5glvYjqLHFg=;
 b=bon2ZWRPVt+vMU6QzAf+TS6W4Y31XGSnRqRH3obdEhPFKF1QYnAiBlWgNinR+wGjSs5hsH/vxynV0GsclXm/zk80hLmPZBDJYFcZnpvxYruOFZwbaQ9vpxn/HuGRjKKZpQzF1C0RI7CZLRobvVgpo4JdeIPuMktpBNA8kwOvLKnfapf/kEXLXfgzT3S7sfW7OSQQAgUfL3EsWBCZAFc4VICV4UximfNFE2UrmaxlYBzYplLia9/VzKFeEwY1UYvjMrYuqA1UZnaBMPPt/JHpfWEAS6Nw/10QuapxsMhzFnZq3OSYud+9JuqY/PlbGd7dcfL/oQwv86p+mq6aPVXJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwZsh0Edhlli/f5Lbenp8QaPj7oDs9Yd5glvYjqLHFg=;
 b=n19sB6VFDaOgLGeEUF80Jjzt2y/TUyLWky/GlN+gvJA8oDVfEKuVjifR9ZkOkgthnLOKeiZF2EuNgffG9TYkhSwCHqNCKTci5WL3mjlNqbO8D2S2Pr3c0ph3PiVX/fC81xHwNDkshCYneXoKEcZlJsr7g8j8JTKLepWsr3mBPw4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>,
	<dpsmith@apertussolutions.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [RFC PATCH v1] xen: arm: Set state to SYS_STATE_smp_boot before smp initialization
Date: Wed, 20 Mar 2024 18:54:55 +0000
Message-ID: <20240320185455.3409182-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|DM4PR12MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4402c4-7415-4b49-2474-08dc490f41ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P2DKH+tSoLyaHDCG68fyGnQaG9eYxjppBn/196r4SQ0c5Fu58j9KhvdK3MLa9qaPLkNqCPkB7vWb4Cnar5WM04KblaNDVDbTIKBDSLAtl7fXsK3wzwI4/WVZlCRgyotisbwZD/NiUZpiJ+OV5dHBFuYcHLi7jBp09e8hnrSzdRCcyfiIpXbzmALa82k1C+SsEGkvtGLwjTmxdlKxYL+e/bxBdYTxN3kC/q7+nD7Xo8tpvgCRHVXzu9C2Og2ODk6I0//rKzncCg3RD2e3w97Jyz9kLKm5bHNxkE3FSXGX1p2n43IfVgA1rlXBJmCgA/jYP1CPuUYsiz4ezdrmfuSbz2TNi/TFgtZLrPIDQEsuVa5QRmf0IcD6Omx0fWzx7yy3iOH5f0patlJ5jHb/SFAc4jKtpI8IMfgLy6/5xDR8eKBJwjIrk/GmNbSjo2p+YQ6yVU4ETxVrjWHr6JEyTpU36/S5y4Vll52jp9LAHeeFWrtC8zR52ZdfV/QMUnun6THSRe93YNbliaHXStxYU+Cn4jbfLoQZrbxDkNFackxmQXf5ufvgYmnX7nnN1LO2sQ7S1lZ9Ji99RrXfvfNhvURqaRz5ie7ntOj8dqQg8dwHE7wvVp+axW7DMZBEbs31lMMVTeEnnuRWuPIdURbMn1pMqqj/XpVgpaOED3KkGRjz1sutGMkHy9bVIwn7xgHmaGfq+67on9YgzF0NvXYhJSuW9H4HbM/Nj+Aw1IPciWr4hBJTVQ5dbaC6E3BM9WE2mUbR
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 18:55:05.9720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4402c4-7415-4b49-2474-08dc490f41ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9072

This is similar to what is being done on x86.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 424744ad5e..3d110685bc 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -787,6 +787,8 @@ void asmlinkage __init start_xen(unsigned long boot_phys_offset,
 
     processor_id();
 
+    system_state = SYS_STATE_smp_boot;
+
     smp_init_cpus();
     nr_cpu_ids = smp_get_max_cpus();
     printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", nr_cpu_ids);
-- 
2.25.1


