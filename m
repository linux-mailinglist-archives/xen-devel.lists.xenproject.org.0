Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8F7A05FF2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:23:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867595.1279177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXu7-0002me-5c; Wed, 08 Jan 2025 15:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867595.1279177; Wed, 08 Jan 2025 15:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXu7-0002kg-2X; Wed, 08 Jan 2025 15:23:31 +0000
Received: by outflank-mailman (input) for mailman id 867595;
 Wed, 08 Jan 2025 15:23:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XghG=UA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tVXu5-0002ka-Ky
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:23:29 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2412::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8237fda1-cdd4-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 16:23:27 +0100 (CET)
Received: from DS7PR03CA0218.namprd03.prod.outlook.com (2603:10b6:5:3ba::13)
 by PH8PR12MB6940.namprd12.prod.outlook.com (2603:10b6:510:1bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Wed, 8 Jan
 2025 15:23:21 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:3ba:cafe::dc) by DS7PR03CA0218.outlook.office365.com
 (2603:10b6:5:3ba::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Wed,
 8 Jan 2025 15:23:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 15:23:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 09:23:20 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 8 Jan 2025 09:23:18 -0600
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
X-Inumbo-ID: 8237fda1-cdd4-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9KOpFLfoVHI2ly8VkpMXiONC7NOjXWlfgmlPRJ74X2yyACsh41KCZjWEKRfU+oNCQMhY9GlspoE3RdVxoi34a6HIq4DbYHQMHOoPsszi+sAp0TSj5H2a770Mr1KGFKiKPHBaePTtELUNW2YiwPUQ7eHhevsGch8rh3b7UqY2TG20J19bDSHIiPnJjO4tT17i7bzKeFmjpCFmlr/wruWHs08i/G6CuXe0XChSs4f/INmHNf5aseRhZkZy/n+Ayh2EGbBBYupRut7iIA3hxhG4HXiRfI5Zr03pSMLIdVP6bI8Cc7+8n049hnC1YExddPYGnVv1/S6fMyLicspBW3M1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbCi9TE/1plTXrMEFllOGd7+VRgSmGpJFrC/Msrw+Ug=;
 b=Ut71Ag4fxH0cijYR/jqT5wlRwdugO6BAk6chL9KPw59m2KTauQgob0EisVUJFGNbKLjm9LRbqsSWkq7G2z7EdaF5NmPsgScvKdPlypLJ5piMxtLz8NfADaHi4AH32T9ahG+hPPrRWt4Qj3e5OWUw2zXcFaweiK2Jc3tPBBfKuJYdthNPJKikYQ3Nc1CItqh/yFQDl2BPH09D8rwBtgFYZwAaO95Un4qtTCYjMxwgCA5On6tDHUqpuX2cwZheS3VTIbQZCA1apTaqeG67aq5nAqHLFFEH66U+XBpLeel/fLImPrkN9KgSnbJjhxzckTslzi+LVAX6mfZCT+l8pdJyOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbCi9TE/1plTXrMEFllOGd7+VRgSmGpJFrC/Msrw+Ug=;
 b=oxS0EBr98Pnjw5AlBquuhM744jJhV8UO4JlyK/owTDUaZLxzlbYG6K3oSqNFI57ckdkptCflthJDe7hCw7viIAYbV0NHbUSoNvXGpnjWYHdSgeJgQHNi61FbeTGEI0QrDVJJBkg5iGLVzv9Oo4mJP+SWFiPVxNAld/fioxHyCzc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: [PATCH] xen/arm: ffa: fix build with clang
Date: Wed, 8 Jan 2025 10:23:16 -0500
Message-ID: <20250108152317.335441-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|PH8PR12MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: afed0dbd-41e5-41a5-c0e1-08dd2ff86296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yyjX7hQYKDVM7fZ08MsehC8wrbYiqSSXkTO0pW9zJ1B4/EGu1gQMh+MUD+NE?=
 =?us-ascii?Q?GiZRXPd940zaKaSAa4nSUKS5DrUjrm6ge8ujNpTHiR7P9LTcffyfQievyGSZ?=
 =?us-ascii?Q?iwKQANY+MHYZGY6MKsZTlC2ZYH24TCVKwTKuIGRWfUeyPrZBEE8sFfMc/Da7?=
 =?us-ascii?Q?VrAW/AXnpmQFRzeVC6VGvqBDVLRvrx8OdHEwCNwmc69iHSwpu3/abKeQdD0q?=
 =?us-ascii?Q?W//nkKlTRTDrRxJbFTeNnhWIKXWhnDePljvdAPdkkX//UGMuEMovQZnOcBRr?=
 =?us-ascii?Q?kK1T0WAmtB0sskhHFjPs2Xy7hmQqya0rKEh+YacgDA9AvT4HVohUnvBRAN2c?=
 =?us-ascii?Q?IrPRK7ALyGoDlwYJwJdr3cFBLCaZztfkTR2/NMNlgFHQQuaXz0/Fuk0G5Qk1?=
 =?us-ascii?Q?arzkqQB+ggggyvx7WtwD/HJpIcinn/qApbV2koVNf3tK4pBQ3pfX+i7stVII?=
 =?us-ascii?Q?FFJZDPbWZIq1ys6P2vf9juvJemLhuTqL4/m5HTqKi/t+QuNn9QHkPD3XZ1zn?=
 =?us-ascii?Q?krza6G0lfvDazt97C98QnNbRUYn3UCis49viuNpVbiFwWCgcsNpMOPu8eg3g?=
 =?us-ascii?Q?Hg+l//tVboZHauveK+U/00vVSZ0EpHHh7E9Xtl51Du+GZCVKt8TmPjfj1w0t?=
 =?us-ascii?Q?r3Kpq3birA5aXeb+fQZmc1+mPh+vqjgPrxAhDMhTlnmYW02tcBUrU2vb2shT?=
 =?us-ascii?Q?ldWwmd/euSsxrjbnWDPjT4XwG75tXa4nq1iZDg66G3UBRFQF53Idu3+HT9iY?=
 =?us-ascii?Q?2luEfVJJMJeJrdtuk7yjvKSYjqEb8Fd683WQsdT+KTEeXXugJimNEGWm4IUl?=
 =?us-ascii?Q?Ho0dFymGQrVJ+jW2+lZbSBCjW9RQxNfICFHyHL8PXmkkbB0zhZsNJbSJUigq?=
 =?us-ascii?Q?l9o4+2akGNctK31auP/uAceW5jBeV3Ysl1SicJ6HDhrNbP5ttuEePK8XlFdL?=
 =?us-ascii?Q?Z1RgKredAzzKwSHkv78tG3rcRSX9tFAA7uRO5+K99wmL0krjxrP2AbPnFOad?=
 =?us-ascii?Q?Ns4owemlWszuSsblGW20cSJOgCCa4eDXl5SMgo5qWbPbuQY2VuV4D5LZY6S4?=
 =?us-ascii?Q?ta9OBa0jyKnGfllobzULP1lL0Uh6thYC53TPHHaw2nA9FpzFy6orlmh9RvRE?=
 =?us-ascii?Q?RfZkjwykvVbXycTFTGA3nzJt7TIY2sKe2YNAAm/Sr+9cMOYZa/wy7KjR5Mp1?=
 =?us-ascii?Q?kBQRmFfKiIEV918OHtdxXSlFtu0TRDl0dhJ4kBUprITmEGT5jNa80p/d823/?=
 =?us-ascii?Q?gANKLPCMAbAXNRWDR0tdtfcUGJPELB6XkmCrPoPFIciZcnL/yvaiaBaK4nYO?=
 =?us-ascii?Q?bhi8qu78bbP47Lt4RN4PSewz1DdCQdtjJSd+4Y94cxs/AmrxrxCJ7D2p03vT?=
 =?us-ascii?Q?6YjErzkFzOl6OpluIRWqbtPHgNxS3V7fFPz+lTnXr9ipqiJV4LV3nGMUTKJi?=
 =?us-ascii?Q?KFWl9ZV6GIa64D1OZiWzLjT3DduF/2K3kLeSJbW55UW7DO96vcFLI3nhs6v1?=
 =?us-ascii?Q?/fWbOcamJJUGb7U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 15:23:20.7826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afed0dbd-41e5-41a5-c0e1-08dd2ff86296
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6940

Clang 16 reports:

In file included from arch/arm/tee/ffa.c:72:
arch/arm/tee/ffa_private.h:329:17: error: 'used' attribute ignored on a non-definition declaration [-Werror,-Wignored-attributes]
extern uint32_t __ro_after_init ffa_fw_version;
                ^

Remove the attribute from the header to resolve this. The attribute in
ffa.c is the one the matters anyway.

Fixes: 2f9f240a5e87 ("xen/arm: ffa: Fine granular call support")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
It appears the variable ffa_fw_version is only used in ffa.c. Was there
any rationale for exporting the symbol in 2f9f240a5e87 ("xen/arm: ffa:
Fine granular call support")? If not, perhaps we ought to make it static
again and remove the declaration in the header.
---
 xen/arch/arm/tee/ffa_private.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index d441c0ca5598..05368d5a88d3 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -326,7 +326,7 @@ extern void *ffa_rx;
 extern void *ffa_tx;
 extern spinlock_t ffa_rx_buffer_lock;
 extern spinlock_t ffa_tx_buffer_lock;
-extern uint32_t __ro_after_init ffa_fw_version;
+extern uint32_t ffa_fw_version;
 extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
 
 bool ffa_shm_domain_destroy(struct domain *d);

base-commit: 70f5a875becc9444a959830b10a361982c31a366
-- 
2.47.1


