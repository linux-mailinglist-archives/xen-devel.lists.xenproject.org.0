Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC7AB5D75
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 21:55:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983525.1369804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEvic-000462-HX; Tue, 13 May 2025 19:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983525.1369804; Tue, 13 May 2025 19:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEvic-00043z-E3; Tue, 13 May 2025 19:55:14 +0000
Received: by outflank-mailman (input) for mailman id 983525;
 Tue, 13 May 2025 19:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FKf8=X5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uEvia-00043t-Qg
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 19:55:12 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20625.outbound.protection.outlook.com
 [2a01:111:f403:2416::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c5094d3-3034-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 21:55:10 +0200 (CEST)
Received: from PH8PR07CA0002.namprd07.prod.outlook.com (2603:10b6:510:2cd::9)
 by CH3PR12MB9343.namprd12.prod.outlook.com (2603:10b6:610:1c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 19:55:02 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::53) by PH8PR07CA0002.outlook.office365.com
 (2603:10b6:510:2cd::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Tue,
 13 May 2025 19:55:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 19:55:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 14:54:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 14:54:55 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 13 May 2025 14:54:53 -0500
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
X-Inumbo-ID: 2c5094d3-3034-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOPZBYjV8J7MIlZWXBIGsh4tbb0Gp+QK0TAuuFmrcbMbBWBxPvnj7Ww5pFOOGLk4wMx8+f+odEjHE6pXm9YIn/6QYXfXBSVRCn0dZfsBIRVMWbGRKNSK3VatwuiaToJTq+nlQgpnzntnTLTuDUpk2co006Kwoug51fMxT3Rc6gC3VYJI6dtQm3Ml8lU86iu7KHg9zfwrJwDlNY1qmmtPEKJNw3VY9pPiiVlT8ONYQ6JWjj9oQ8WjUGIWMqsJuBqk9vbMDxiWBwnAhkCNsLmwac/tsV+mO+us/0tS4smqCFloIeteCQpP14svKjH6fSgZ1w6V7XOHqz+VtJdqClQqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeMyN+yqsOP3JvILcxshJukZkfGcBqCk8RqK9frElbM=;
 b=XcvycRbXev/p15pX+JjeaReO5BQFPSp/PWNkpObyWF/o/dgz1PoPA0Kvb+VNaS45dnItASbWSQjsRWTkIehOcVyx1xYAijs12WwNB4hBB7cwWZcFnvUHtVMUaVOqi6jOTnvjd2KC/sueR6u8tuKsFzkxD2TXWkDZzhnbsgc2pQHfFHxKLR6L6bjwXJfXjV9HpbN1yjUKwyHqKCPPYH/Fti76j1yEaEkgc+O+e7Q4TO1XG/5CWWxKFd43QG+UsjdqRtT0IdchsJNX6Py2rF5R478QiFRM4WGDqw8GQdjKk3bUW63CLrsmrDwWtbdMhtLZQC2i9zdlQOhBtF2hX65Ueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeMyN+yqsOP3JvILcxshJukZkfGcBqCk8RqK9frElbM=;
 b=ps+IVtwdxIOKlRa0dh4/5UrMlEV62cWm+m+v4usWctxpD/Bi93hq3cAJvjlQydPZoQzLpzCtnjUlzN2OaH7ugk7mdTzU3QJgRZaINLkZifPbhe5mZUPlWYGiuGOTZhw4EwBBdIoMHu+wKcFtP8+RjGnhzu7X4jVvbKEis4mRVQE=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v3 0/2] arm: extended regions fixes
Date: Tue, 13 May 2025 15:54:48 -0400
Message-ID: <20250513195452.699600-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|CH3PR12MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af2e911-3a74-4acb-1718-08dd92580bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K24Fx9ARHiotksrdOylQUUefZAE9OgHRdyCzGgIykK6GbvEl6PX5+E1tBwWS?=
 =?us-ascii?Q?xFxtteCLuQ9JVpPXrwSTsv50SdaSNXZ0YIIFtUk5VbxJbpKQr9vdAGPWvgJp?=
 =?us-ascii?Q?u3FD33IGLWeIFxnmjH3jvjLgtSJvDpsajlxLsZjTBNgFsgJEjK0ROuN7Bu8L?=
 =?us-ascii?Q?dd16TzRwdDm4+PdbgeMTbI74RrBsxg4WeE6tdS5EzzJbyGBkLK+ZTJsXO/yL?=
 =?us-ascii?Q?KbJZupRkshw59krany5p4/vf4l31/kD4ggGpENh1+3XpsgAPB0MC6Zq2S/tY?=
 =?us-ascii?Q?bNC4SjWhMfZmdabDUYodQFew9frhaEVI0zEvZES1xq81YafNO+ME5MBtXobT?=
 =?us-ascii?Q?fO2R5RyHZ5B9gqNSRnHXRUUWE9TAjE5uRCy1vJ92om868TCTkxdHdaylSCHj?=
 =?us-ascii?Q?IyJoJu0b0JxDfaOMxbcR1PlMpQCIUgrxtzSJqlJt3san9r3KXKBOSjV8gi7a?=
 =?us-ascii?Q?BkSQYZSmYe9Y6EEfZEG/HWa4H4rRvWMs1Pyj5C6xolwFvTTZoNkuBswcpZai?=
 =?us-ascii?Q?Lhb+ANxytM5fQQlcwtlvPqEM6DLtmeW3sTmyal8XFSsIEd3qBX1FGuHX2I5+?=
 =?us-ascii?Q?SbbhqcklSkS5+vIVrfqZrNCrF/JLdMPVGHYxNSnVmdybc1+88YCmNfn2fRkG?=
 =?us-ascii?Q?f4GOQRMyBorXrWNCZvXWHB/Jo2R1SAJ2RiAUifkpoKa+3xDN5j3Ux9jFKR8z?=
 =?us-ascii?Q?lPb6kNimrwAm7TOlWzqh8Y3StlpDg29PRxNwHZOga1RuYZyOrWxy587ebiEf?=
 =?us-ascii?Q?iGTSRHunVzEhP97HlooM2/3d0r3bRKbk7xg0kXC0+a3tVTxXyrniP+VI8GZN?=
 =?us-ascii?Q?MyDJnu/OnJfzZ1pV5x0oOLvUtK321KS45dJBeTNcy3QUYpOtLtvNmAkKwkhk?=
 =?us-ascii?Q?sLp0fQBewMJhztmTMJS++JWAkm3yP2tgP3JruzJe5gZtrNGGE2IQXBGRq5E3?=
 =?us-ascii?Q?J9xrGfCgKlQrEeg8k6V7MOJtnDCD0whMsEvmGqcJp/cUXdeSnqPDDld74KcG?=
 =?us-ascii?Q?iT3Hq3OjtxX75S5rZYiEgs11XOia+dCzT9D9O2obacvAlROwPSvfLWq80vSY?=
 =?us-ascii?Q?b/5xrVgk9yBqiDBDVpexpJlhX1lO3JgAXwJEv/tdP5IlJ+yLmtbkp7zClvm1?=
 =?us-ascii?Q?rbn15a9UK8YMn3F4B4yvQb22w1hUxd+0L+OmbPIN8UWUsN9MhBggHB17ebbJ?=
 =?us-ascii?Q?fisW4yUz+c2jLOnHrWLFNIdOHXhop2YFsfvBYt52+4UmF7QchX6o1FyjdmBj?=
 =?us-ascii?Q?avFkqPx8ZwqAuzIq+FNo98tNhsykeeESeV/fSNX331CIOnyrYMoCWUrJ6yJs?=
 =?us-ascii?Q?zWBotevgMxtSjiFTiwYR9O78kC3xSEsm4QUJplD5BTrF8asBo0fVOkOkr7ZX?=
 =?us-ascii?Q?1Ugs3lyfGqwW+iSA5iz1g3v+0QXUoNpZoekkOJysN0pTLTLYuETx2QtJe2nG?=
 =?us-ascii?Q?r9YgSEKiDQ8N4+vmq/EFP+34/A/+GyQmz8MsRIAQ86E9I5f02OCJnNy4VZmP?=
 =?us-ascii?Q?AyWpbFZ9h8mDDF9CFR9PzRSht+fH2ToRgAgp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 19:55:01.1043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af2e911-3a74-4acb-1718-08dd92580bf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9343

v2->v3:
* drop committed patches
* add ("xen/arm: exclude xen,reg from direct-map domU extended regions")

v1->v2:
* rebase
* address feedback

Stewart Hildebrand (2):
  xen/arm: exclude xen,reg from direct-map domU extended regions
  tools/arm: exclude iomem from domU extended regions

 tools/libs/light/libxl_arm.c | 118 +++++++++++++++++++++++++++++------
 xen/arch/arm/domain_build.c  |  57 +++++++++++++++--
 xen/common/rangeset.c        |  14 +++++
 xen/include/xen/rangeset.h   |   2 +
 4 files changed, 167 insertions(+), 24 deletions(-)


base-commit: 5873740e41acb8593f92623ddd03caebda2718f6
-- 
2.49.0


