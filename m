Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA1ECBA142
	for <lists+xen-devel@lfdr.de>; Sat, 13 Dec 2025 00:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185994.1507914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUD1H-0005Ar-Ll; Fri, 12 Dec 2025 23:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185994.1507914; Fri, 12 Dec 2025 23:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vUD1H-00057j-Id; Fri, 12 Dec 2025 23:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1185994;
 Fri, 12 Dec 2025 23:57:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tg47=6S=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1vUD1G-00057d-Ns
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 23:57:54 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58ecdafe-d7b6-11f0-9cce-f158ae23cfc8;
 Sat, 13 Dec 2025 00:57:43 +0100 (CET)
Received: from CH5PR02CA0006.namprd02.prod.outlook.com (2603:10b6:610:1ed::16)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.10; Fri, 12 Dec 2025 23:57:36 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:1ed:cafe::82) by CH5PR02CA0006.outlook.office365.com
 (2603:10b6:610:1ed::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.12 via Frontend Transport; Fri,
 12 Dec 2025 23:57:30 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 23:57:35 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 17:57:35 -0600
Received: from xsjvictlira01-ubuntu-0.mshome.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Dec 2025 15:57:34 -0800
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
X-Inumbo-ID: 58ecdafe-d7b6-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YFP9ydVNOzEA+S+lEy2I6x9a1oQxdmU/JPsP30RpxHd170EpP1aJsI+6l32+b5yvk1xVnFVv+nwPWFbv0UvZX4WbWSHbEQpNMC4pazj7Gq4lZtqYq12D01Z2Q2nI+lxw5GTMDpEVXHTfEaEwIEfIINIWCz2PEA3QxDgShxw4ZNk4ah0FtVJA5nEbZJzEita4lsIcg43lWIQffPlPPeq7hOwqVwSEPYHo0ZVlddHE7hlcW2U/p9MIGO9yQ7vwwSZtalrQwnxXO8jyEx/xI+T4BIO2PbOxPbKC2xuMnY6hI7lhhdhBb8DVM6xz9y54SITUnFxyWe0JXiYzC4g6rJtU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BmXjRzinjcL1ebSRx8JkIRIIdbtFwIRfI39UPTEn6NE=;
 b=loWW2BdjFe8gZdvfSSKtE5PKLi3Arw79wiJMbS9k/zCOrbTM4Tfy41xfqOq2VpBlZ/SwB5sq7Z5a5bK9++39d/7jZXB99m/AQ4kxawJ7ebdYNxnNuv/zkHQUnWsZYHXuGet9TJTmMakh9VEROQZ8fHFWAC/B4UOunlQ5wkDHUUn1LZJnzz7AeTLiqxofd9cFDqqZT/kB0pizt9zukY/dJJ3Oc9XnYZVmVYaelaLuXz/D5vEHpoDMK3JcqWc0jQoQ25SW0QzuP/fJYwCULlV8cLXShWB8F+7dKqSAGeGMQF5sxIuucgAWjgRECN804jkjhVrLdWf6dH9LZ72eABdtug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmXjRzinjcL1ebSRx8JkIRIIdbtFwIRfI39UPTEn6NE=;
 b=ej9khcbRtdSEGtLFL6huAhf/Zib4bhVSOVx7YPk/6IdPE52PpNvKrcHLICBsSY5v6U+9lRU85TT+zrmgEEMTPbfHHORqbPNI4V+hLNBJqEzAMznKaLv9NNnGzIr1IuXz80YJ7cAsKnfBrwbRM0H1jiB8Dp84+Pni1ZgQkuyFQIg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Victor Lira <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [XEN PATCH v1] automation: edit pipeline to fix blocked status
Date: Fri, 12 Dec 2025 23:57:27 +0000
Message-ID: <20251212235727.1377099-1-victorm.lira@amd.com>
X-Mailer: git-send-email 2.51.GIT
In-Reply-To: <20251212190850.1357779-2-victorm.lira@amd.com>
References: <20251212190850.1357779-2-victorm.lira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: b8a4a793-d18f-4d9c-36d5-08de39da3925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1jwPweIPzFdMhz9fiWjqqece2xRq5IxtDGWQPAa0KE6gibTkgjZd+Gfc9rRa?=
 =?us-ascii?Q?80RO9YvdOu7jtVJKFZUuAaZ2MfipY+x3g4aRpmY6OKtZVjfQLJEhRWsKH4pq?=
 =?us-ascii?Q?Or2sFnN3YW9wGIateIC0TyaOtSWTlrAYh+aXwgVDuSUY4nwGS13kAF4xDYod?=
 =?us-ascii?Q?fODSHK7sHmO8j6gFhuYCuXKoM5KjwIMM5GukRh7NL0nqCOkDmjqUdnOI3zyX?=
 =?us-ascii?Q?cKJ7htbD//1wKOcFFYipOyOyZr787GVIjC8Nm+IuPy/VMqcw8ufFtLOp+72v?=
 =?us-ascii?Q?HB5iNqlLjRJZaEWmE+xmfJIbevEKM65+EYi52AgQgf17ifPoaSenrs9JDEWC?=
 =?us-ascii?Q?WG95z6wUfVq2cZHOFhyHzjx/PkXr4qcCpySdY8fuEpuNSJKRgrlLbgR1bQvQ?=
 =?us-ascii?Q?Bgs+JU0xDXFzm6PwcIetp0veqQT6M805deX2FfeLnedwec9UCF4RwlR8Dxtp?=
 =?us-ascii?Q?6rcFU2EYcc0tQ4yof8v4wu5f+64t/G1t1Kmkf4dtD7AKhJFJUwaka64shTod?=
 =?us-ascii?Q?gaoHqvXuNAZy+kaOamIZ+ydHX95QQfGEbYKMSQ9o5DyQuF7WOg1iJ8plGufB?=
 =?us-ascii?Q?NTtX8p5jqwwEpA9CUMVUNapLzztw2WGy/kfvthctKEA3yaI4WSAmkdwEDIDQ?=
 =?us-ascii?Q?hZY3369dExqqcO954RHOWopwiZX4x+gJYubBUfxONSi13tzJULHXmwG94kHO?=
 =?us-ascii?Q?dqu7gA+OQq9hov3rASYlGDnUztctUJwRlhK3xdHc9c9tgMxjype2Alzu9/Ex?=
 =?us-ascii?Q?xvZTLc94a7DrWjLG1I8geuHBLSZI/b72o6IIZX1Yq1zVxG+oH2sWWh9vvUSc?=
 =?us-ascii?Q?j5oP3gWttLIX6lrvBP1M/zo9sWz/MYmk5maRr4SCP8a4ckOpQWjv06a/ZZaC?=
 =?us-ascii?Q?+pgBRHZL24GP+9cX9Krjod89IeCMEDO0q4R9xljoWSQTjb2pdKWAju3EQzZC?=
 =?us-ascii?Q?ItiiiANzxD7ABKmVgl/gycTNERMWugrH/cUCgXayiOHuqIAkzSNnRpvwDi+q?=
 =?us-ascii?Q?wksfdNalMsK95q/wgWH8xln5doxOh7rzaYcjI3APi0q5T9BkJAOYWVH0cf44?=
 =?us-ascii?Q?quoFy9zFQt/mBSnhaW0JiUjVz+xIkDEO0xay5RaKzow4PtXMVMeal3iyVTVZ?=
 =?us-ascii?Q?ld2CEqNH9S3dyMhkQaFcrMG14GV3fr2bpSXORk1malou9exqu1qvli0/nfuw?=
 =?us-ascii?Q?5m8h5r74iDs2xOuGB/2N8sHOcyUt5gDBwF/lHD3a7l2Ptx+pTQixmYp0U2b9?=
 =?us-ascii?Q?A/u46NUKohQ9MW3wIsPOgaBPlx5seVua3ZNA3YcyQX4vvWLxKgr+fC4S480G?=
 =?us-ascii?Q?2xHt7iVi9wDpWCtDmzUbFrTAmu0SB8z+fDj0auMk8KblDukbNoHpfrjmkssu?=
 =?us-ascii?Q?aenHy2MX+qXFGQgqFQbTn0e/yRfUfhsi8XOUF9Xoa3VqBEyEQWLFJZnTsr7M?=
 =?us-ascii?Q?OFMRKBD4QVNbDQmt5vcfpZXIGCRhoUmmvMgqTv82YaXWxzgN8+EVYRzRpeq/?=
 =?us-ascii?Q?03QJMClHpkgvUlTD/i7B7Wh+mKtaTyijhujLX+dSk++g7hpGzBNtcqkMTKXT?=
 =?us-ascii?Q?r6XoarsNj/C0Igqi8fs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 23:57:35.7030
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a4a793-d18f-4d9c-36d5-08de39da3925
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262

The original yocto config had a hidden default of allow_failure: true for the
manual job while the hidden default for rules is false. This causes the
stages with manual jobs to show as blocked.

Set it explicitly to true to avoid the analyze and build stages being shown as
blocked.

Fixes: 485ab1b5db0f358625fafe2df4e41e3ef008aed8
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
https://gitlab.com/xen-project/people/victormlira/xen/-/pipelines/2212386023
(stuck because of hardware jobs)

Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/gitlab-ci/build.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index e9e04e37d4..f7e032320a 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -229,6 +229,7 @@
   rules:
     - if: $CI_JOB_NAME =~ $SELECTED_JOBS_ONLY
       when: manual
+      allow_failure: true

 .yocto-test-arm64:
   extends: .yocto-test
--
2.51.GIT

