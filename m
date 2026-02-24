Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGPNH7MTnWkGMwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 03:57:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB9B18132B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 03:57:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239398.1540808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuibL-0001jX-GJ; Tue, 24 Feb 2026 02:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239398.1540808; Tue, 24 Feb 2026 02:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuibL-0001gJ-9Z; Tue, 24 Feb 2026 02:56:43 +0000
Received: by outflank-mailman (input) for mailman id 1239398;
 Tue, 24 Feb 2026 02:56:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmFV=A4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vuibI-0001gD-Ow
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 02:56:40 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f702bf1-112c-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 03:56:38 +0100 (CET)
Received: from BY5PR13CA0010.namprd13.prod.outlook.com (2603:10b6:a03:180::23)
 by PH8PR12MB7302.namprd12.prod.outlook.com (2603:10b6:510:221::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 02:56:31 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::38) by BY5PR13CA0010.outlook.office365.com
 (2603:10b6:a03:180::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Tue,
 24 Feb 2026 02:56:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 02:56:29 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Feb
 2026 20:56:28 -0600
Received: from ubuntu (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Mon, 23
 Feb 2026 20:56:28 -0600
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
X-Inumbo-ID: 6f702bf1-112c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKVS0zoHwyohzxxOxXQ6igxFQcOVF4BcKJOlhJluK8V9vQNOt0HR2LJhIKS9QBEp+WVCpKdVbKonxxpqXYv9rjqMXZX8aNceCtyMJwMarjyuhboq65DWx+pp4XbPESl7qF0BCzPxJv5KvOhsQPQ0pVtMi0cEArBqXGz9bWconhe6DTUjJith6iQ5j0KOiH4HXm6wVC+F0wLqu6BxI845aV2f23jnnCb6jEx5XVbTkg0CSKLXl9cYXcIgoiJ6u8fgWSSGAIA9NFNzs50NmBY64kKba/4UU180TZShu7VTd8bxUFoN7TSn5e4Z/Mys2KVZrsTD+hK4u8TLfBH3SFPKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfSi3q/0TeAxgrtNMbtkA4Lz1TtEnBoTHve+xivNZf4=;
 b=mlrgnM9xXS6j6eRDUOEN3mRx5qomP57RaRt2OebgLNnkGXYJuT7hkb1Ix9oLyD62TKNiqWbT+J2SRbWePPAIK2q5kHODVlkZrXAPPYdQ7R8IglkkaTImNiL1JSkZQOfMOhtxzuh59eKdZJ8z9fAa4+mGqz5npcxJ3SbEJ6FTNQS65mLi4O4bv2wtaRugi3ui3uIoOLI0gipHRv8aqBpHs4FNKBlC18ifbu0Z3yiF7OKU1NGgnuuiOoHzny7apOuByxm+Bs0MEuproeorGAT+TFVc/GslhknMHT2DaQW/R+c4vQ0Qe0xLCWpSHUBrffxBCxlJjaTcJvqB4kUaC79hiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfSi3q/0TeAxgrtNMbtkA4Lz1TtEnBoTHve+xivNZf4=;
 b=x5qk3fYwWHRtVgbxRKdGDJi2cb2taQ/9d0YPUVZrrOEVxI2aK2vj+J0xDd9mb35UCkxcISRb0OV2i/3CcKbCUqciCUqOQV8ShCG5mdNcLm2xXOBSrGNdAglgQavm5Tms5C9j0gKbJ+Z7F+CzeV7ua4yeuVTXkuVklHGiLUOwbwg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] vpci/msix: check for BARs enabled in vpci_make_msix_hole
Date: Mon, 23 Feb 2026 21:56:24 -0500
Message-ID: <20260224025626.26909-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|PH8PR12MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dde853d-faa0-4429-0e6a-08de73504f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UEwd1J7TRcUdGmfH2tpPhbL/NtKGNwvvNtcQLmKsFtZ2fkW6ZYdJe5Ey1uO9?=
 =?us-ascii?Q?k/Mn/UXjRSyG8W8rR8kg6hl/r0GcL+bDP+P4HVaUrM8Ua5Jtid3X9t9g/L0e?=
 =?us-ascii?Q?hWekrsFZX3OWxzK9K3sXWgnajArscPRVYFOQa+gdlyLzurvarzUg1wuNkG+I?=
 =?us-ascii?Q?Aiw1zwG2z3oE10fUndlEF7mWsd5wpOqCr2p7ncN6RdQRZ6haHvNNZqCQY+s4?=
 =?us-ascii?Q?i1319VUWA+Pqpq21a5d5RtRdGK7CqVvqVB780tFqK/4r9t9/ARqojQOHt2NU?=
 =?us-ascii?Q?Af0Vb1cBakGz2FVoEdoYKzKlxGl1g99QH0mEpEx2n9hJHi/jiSiRYHGu4D8O?=
 =?us-ascii?Q?uiOpichlZ2rna/lTj6UerhfPWtgb//4MPy9Wu4DnSlGyYUbLRqDj1q5XDLgA?=
 =?us-ascii?Q?2PRgVji7iH5wk/HzCOtHF68dxHxNp7Ibbqc2nmd/C7dYgVnIqRFoUWHiaJVZ?=
 =?us-ascii?Q?OuC2XHA2sKbf+i0/WP41wa9VoWbX8R2R3Sk0KLtfQ5jq2wQ9A+RPE0845BcA?=
 =?us-ascii?Q?XvkcRjAmx/Z5I5fwmYpu7y/Vuz0VkSsxRkMTvxsVu/HfOxBHcO+NILHiNAEv?=
 =?us-ascii?Q?F+vTaq8e7LG5AFzilSs/m3HZYOICUipRnWMg2xBNJ/tOSKrk0W4zq54b2E4z?=
 =?us-ascii?Q?LU04u8SP61/mtr16RQ4bWJ6nS/r9Fa1OQ9clfg4cbEHOZuRArjDym4eYKAUx?=
 =?us-ascii?Q?8KJJgaS76b/5SNOIM/ViaQnD7bFp/A2lr2iKXXhKLLrAcnJc68hL+3jA0iWF?=
 =?us-ascii?Q?bZ0CMMRFIRZiKQjp75KZzKfx+VtTDatb7oK1fBmOYyTaDpYCG9c/B6Gi9YY8?=
 =?us-ascii?Q?0U3JkGe1h/wjSRi4YE6R9IcIAtzoomSZN+/Dm1Ctxd/PCsZPZZv0Px/+FsfT?=
 =?us-ascii?Q?/BtAx0+hPyKW924x8BdESA6RxHWroyXq22K/T8JOognkSgYQjBRgoaiYtXvR?=
 =?us-ascii?Q?OMwg2wFI3eAFDSLPkFg0UOJzqz4F2GUTvNy2qSMSZxGVcslsKq85HAVC6fEh?=
 =?us-ascii?Q?gR0LzN5Z6LtNHUtRYFYpJR/RASQEN62k6byY54C6etwONvcDOEP6ssXAwnsS?=
 =?us-ascii?Q?F1UvCcGQinVfSIMmNDWLMhPwNE2Qrj2npURRA2pQJELYVLJqzwVXuUrvgXsD?=
 =?us-ascii?Q?enbl+jcfUBGNhFZtZ5MWkZuxqPJTsAGEotp+iWdvUk9KVHhaplxgBDGOdu5Q?=
 =?us-ascii?Q?Ift+cwX4/5fuQDVJyc+XZZisiS66H1IOBIBOSiscy9XXbEoVkihS8SqC+llH?=
 =?us-ascii?Q?BRO7NucnWBPB6EHJgDxpjwQVpfPvg50DLzQtvHfk5t7lN/FooN0BjiUowDqR?=
 =?us-ascii?Q?oKYgJU0U5xPwJSe8T6/eRPDZV8OEjUqATg6SrBWi0VxsUU3vhhG4cS67Yd8c?=
 =?us-ascii?Q?lii1yaLN4WWARIifvHVCqnsFDK9jHrusWWgPjEAsSnbODV7MTKMsTILxrkOf?=
 =?us-ascii?Q?KS/lfKzomQttqjfVSMDdb4pEPtYlYJ4+3XgdruQwaAi+ehxaEwSxtsUAM0zk?=
 =?us-ascii?Q?PTjBiSdlND1lbd/Pm3e44BSCH9+tsZHBgwFNGuUn83IKPBcJdmsD5kfKx2Wi?=
 =?us-ascii?Q?aWpURbQtvw6DL+Hv0VF27oJM4/luRFFcx+ukbADx8nGbOBqztwYUSugKH8U6?=
 =?us-ascii?Q?xCoiJVoDdHAr512YaOHDEbqoRvb9dPkWlzvO2jSKBRGNFjOj+RkvigM+7v0S?=
 =?us-ascii?Q?fiMog0GAaKHHXpPg0dH/MReU9gs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RoQ28HEgNm2YvJoLexAJOqMHApwnq9fOsNirP9mYc0/WBuuyfbmIPfxbEXPeCBAFvE5/4P4SPM7YMIdO4btZQKnplQHGlJeWXp+6zvKGmcLrm7jXnwXi3UfxlZi+RE5LUx8OD7qtq1fRpOx4NMKuLE54N7EzKGZMevLvKQ1BsvBJdj6DRQ0E8ispc/yjkI4vRkf2iRMsiWscfVWWhCRILTuAL69vnaLqqL8vVdMS3wsbIQLugukjiYqRxOrTMtGeV6wOHhVqG1dP0Bmany+DbLmnb50LpzgA13V6WjH60gX5TI1H3Fvac0oq4v3oNrBwQWUmzUbnHeMEx1vCPqUEjGTF7phsQ9+4zE8U1RZNrxYFXfsm9gmlRZ9auuqL6N9QKpEUo2jIPRU5rXJHxiplraA1bhWk6+FR7lIkBzTmzXhobJYxZRtQxAiqzw4oVdYW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 02:56:29.7310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dde853d-faa0-4429-0e6a-08de73504f54
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7302
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: DCB9B18132B
X-Rspamd-Action: no action

A hotplugged PCI device may be added uninitialized. In particular,
memory decoding might be disabled and the BARs might be zeroed. In this
case, the BARs will not be mapped in p2m. However, vpci_make_msix_hole()
unconditionally attempts to punch holes in p2m, leading to init_msix()
failing:

(XEN) d0v0 0000:01:00.0: existing mapping (mfn: 1c1880 type: 0) at 0 clobbers MSIX MMIO area
(XEN) d0 0000:01:00.0: init legacy cap 17 fail rc=-17, mask it

vpci_make_msix_hole() should only attempt to punch holes if the BARs
containing the MSI-X/PBA tables are mapped in p2m. Introduce a helper
for checking if a BAR is enabled, and add a check for the situation
inside vpci_make_msix_hole().

Move the vpci_make_msix_hole() call within modify_decoding() to after
setting ->enabled.

Fixes: ee2eb6849d50 ("vpci: Refactor REGISTER_VPCI_INIT")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/2344925375

v1->v2:
* new title, was ("vpci/msix: conditionally invoke vpci_make_msix_hole")
* move BAR enabled check to inside vpci_make_msix_hole()
* introduce vmsix_table_bar_valid() helper
* move vpci_make_msix_hole() call within modify_decoding() to after
  setting ->enabled
* split typo fixup to separate patch

v1: https://lore.kernel.org/xen-devel/20250812151744.460953-1-stewart.hildebrand@amd.com/T/#t
---
 xen/drivers/vpci/header.c | 26 +++++++++++++-------------
 xen/drivers/vpci/msix.c   |  4 ++++
 xen/include/xen/vpci.h    |  6 ++++++
 3 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 739a5f610e91..6a28e07a625b 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -122,19 +122,6 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
     bool map = cmd & PCI_COMMAND_MEMORY;
     unsigned int i;
 
-    /*
-     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
-     * can be trapped (and emulated) by Xen when the memory decoding bit is
-     * enabled.
-     *
-     * FIXME: punching holes after the p2m has been set up might be racy for
-     * DomU usage, needs to be revisited.
-     */
-#ifdef CONFIG_HAS_PCI_MSI
-    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
-        return;
-#endif
-
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
@@ -164,6 +151,19 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
             bar->enabled = map;
     }
 
+    /*
+     * Make sure there are no mappings in the MSIX MMIO areas, so that accesses
+     * can be trapped (and emulated) by Xen when the memory decoding bit is
+     * enabled.
+     *
+     * FIXME: punching holes after the p2m has been set up might be racy for
+     * DomU usage, needs to be revisited.
+     */
+#ifdef CONFIG_HAS_PCI_MSI
+    if ( map && !rom_only && vpci_make_msix_hole(pdev) )
+        return;
+#endif
+
     if ( !rom_only )
     {
         pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 516282205a53..142cfbae59d5 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -598,6 +598,10 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
     if ( !pdev->vpci->msix )
         return 0;
 
+    if ( !vmsix_table_bar_valid(pdev->vpci, VPCI_MSIX_TABLE) &&
+         !vmsix_table_bar_valid(pdev->vpci, VPCI_MSIX_PBA) )
+        return 0;
+
     /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
     for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
     {
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index d6310104ea17..8ce730791080 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -267,6 +267,12 @@ static inline paddr_t vmsix_table_addr(const struct vpci *vpci, unsigned int nr)
            (vpci->msix->tables[nr] & ~PCI_MSIX_BIRMASK);
 }
 
+static inline bool vmsix_table_bar_valid(const struct vpci *vpci,
+                                         unsigned int nr)
+{
+    return vpci->header.bars[vpci->msix->tables[nr] & PCI_MSIX_BIRMASK].enabled;
+}
+
 /*
  * Note regarding the size calculation of the PBA: the spec mentions "The last
  * QWORD will not necessarily be fully populated", so it implies that the PBA

base-commit: 5eb84d6c992cf4e81936872c441b649057947442
-- 
2.53.0


