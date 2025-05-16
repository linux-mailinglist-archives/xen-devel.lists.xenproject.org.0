Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52226ABA67E
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:22:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987717.1372956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4NJ-0006ao-3m; Fri, 16 May 2025 23:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987717.1372956; Fri, 16 May 2025 23:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4NI-0006YG-Uc; Fri, 16 May 2025 23:21:56 +0000
Received: by outflank-mailman (input) for mailman id 987717;
 Fri, 16 May 2025 23:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQOe=YA=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uG4NI-0005aL-0D
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:21:56 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20619.outbound.protection.outlook.com
 [2a01:111:f403:2408::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dc1552c-32ac-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 01:21:54 +0200 (CEST)
Received: from SJ0PR03CA0075.namprd03.prod.outlook.com (2603:10b6:a03:331::20)
 by DS0PR12MB6654.namprd12.prod.outlook.com (2603:10b6:8:d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 23:21:48 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::b) by SJ0PR03CA0075.outlook.office365.com
 (2603:10b6:a03:331::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Fri,
 16 May 2025 23:21:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 23:21:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 18:21:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 18:21:46 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 May 2025 18:21:45 -0500
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
X-Inumbo-ID: 8dc1552c-32ac-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wq4wcSE0OxPwoI2lFKQrNTDQYDpqmWZTagP/dr3IOUNvjU3j32Iacp37b4NSxsYWCiToRXFOdg8HtL7W7keiooDkgZjfu0Q0GOVnynUi5yI4ygUAwphFemadloFfZDcsxkIaM8ScEmeUSxUVt/OF2TOLgeIdDO/j/lbKvdbDXamZDoswjRPYlwcncs7YHKD8dexgCp4BYt9oARMT9vrJ7WKycP+AkFaCY/QNH/TD3H4uRk2k/exNY3Mk+4xKzzDzzE+ZajiNPAoi7JjHSx/E+mAlX+euTDEmLXDmquYQ27MziX/k8yT5lKFTd06bytvGr1CwIhSXsRs0uxopjxBQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buer/yquglfA9IXFa3Y4Vl4yg61qaCIVyNVRWFZFS5E=;
 b=Ixk79s/37rKQo9wiVbAVF5KtE2ABszJ/E++5p7aY9wcJd813ooSAL+KXolHfZK7YWRB+FNoGIw6I/f8wsDOM/GrjuoEwPIMIyCMv9J8U7SZQYNycDKF43W5jP1s4R1MIKib5QEK/w2Yr5rgQ5V3QqE9jXd8y3wib+NFQ0WuaGNYb0A/RO4Z3pbGEZMEBNsE8ugn8zKLLUR0HhJjDWNmhCBXeXOwzv2DnMPzmOFJn82OzYj95zEzyiJIphLxfZA7zZmF+yEVZYXEQm4a/Pi77BLdKKni/ocM+0NuKmeMD/6/Qzk1XEgpzPl5OOUWPQVYABf9ffNe+YpPJdoX0HmX1vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buer/yquglfA9IXFa3Y4Vl4yg61qaCIVyNVRWFZFS5E=;
 b=sYBcgXrucDa43WOpz8FWPEot2bOd00i7FCBvq/EQNskGuBEg57xtGpACTtHzey35ydkUK0I1jee5ora8Har2GjwD9cmMNqKLjjdiK9DDtRz7zd9BiKdlqeuoLIjpFGKzdEvrOl3OYiaEpT6b9RaDFvx5wWRB6h+8grEGaeB07EA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <michal.orzel@amd.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH 3/6] xen: add inclusion guards
Date: Fri, 16 May 2025 16:21:27 -0700
Message-ID: <20250516232130.835779-3-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|DS0PR12MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ed49a2-ccad-4abd-5811-08dd94d06dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XlEgjc6uz3VWMkmskh5kysM/uMntRkrrJGOifqG5D0Wr8Fdh4Dbe+Pa9Zsw8?=
 =?us-ascii?Q?36m+yRld9oiUc9D40OfiUNmaAqYY62ZslrNezNXMVU4nRlyHRsilzvR2PCYb?=
 =?us-ascii?Q?bc5560hF6m/Uq//9O9x1eLP1L7+VdXp7KpIcJ7GCT78G23gLsPcqzjpYNGhp?=
 =?us-ascii?Q?Hi1NAidHwV11F+Ncq3bl8LQtm2HLvU2+xJjbbiJn7VdUFGaqez/EpWtvLU4N?=
 =?us-ascii?Q?IzY/Xfr9veUd9LdrirjULj8FgCFSbR740+6rTvabY2jJyjbCzcbiSjySy/th?=
 =?us-ascii?Q?rsQ4dH2cmT7Bx0Daq08SBuPG2fGMiXking21qPkBc/g+EeP75KwtVgIRZKH8?=
 =?us-ascii?Q?Pd3vp+DgE51ahIA3Ckix4kV12Gxj7ZgyW7rZHHgzIQHp21N1QK/wE+dbDRqx?=
 =?us-ascii?Q?OmBj4Y3iyqGwmvB+/rQY/dVY1zTvl5oOFwL/050GfrRnnScrzSYLoeTSo+8d?=
 =?us-ascii?Q?ftqtnWnqRee1krBpZ81ph6FezKa/husyO879fyLIiIf8O9hRglGYxPxLVS1j?=
 =?us-ascii?Q?Wj5odFkw6sltAft8LkXylcx2DePAh0Qj5pytTxSJ7/CQ2a6KkuyJ7VybCJ80?=
 =?us-ascii?Q?ScBVqXDhV0uAEx0cO5KH0Nz8qv5ESE7dtfWJYLF6bDG16YBgkMdzFXdeeyxD?=
 =?us-ascii?Q?nmXUZCui+eVgqdphLRwR9H4NVZeuP5tfspKR5fdDAgmYOAKjAhZP0qxSTBG+?=
 =?us-ascii?Q?zvuQInTc0eSDzW3Qzgv+xipR77L1MupwpvE/dQ6nau03L77aC/IOOuoLXVip?=
 =?us-ascii?Q?o7J1w6A671sXYgxVlAWYHZp8CONefB/d8mgTbYnvo2mUOunLann1p4vJaYmi?=
 =?us-ascii?Q?L9vcRU5Ai+DyiLjCBAUccBatJrpS2po7e0mJasY/wWGDgMD4BD/rYq/gFVYk?=
 =?us-ascii?Q?WXe6hBcM/FnX4SKrnIiprJ4mmFrs5rsinBFAV3uODmc8ryD8sIZhLTe8RdH7?=
 =?us-ascii?Q?rG1nU/SlfOjSLjcpjI0NpEfVPiH3xhHhJ3UQcPIx8rlmUbjFBNsBARx8Kx3Z?=
 =?us-ascii?Q?ztnTe7DP6iXZ8/OT/D25gZQNUfKQ1L3t86ncbDqnLt4+rWs2jAOTxubzYjKN?=
 =?us-ascii?Q?TCdB/8HpbRT3BmYe3qSmrG7VwUpSMFpnblb6tn5shmEkEE5PIo8cnXwE6fsa?=
 =?us-ascii?Q?S1hcvjSxjpmTT6Kve21LS6ew87wP4JhraaC5pYzqu/UrebXhoiV2JlQelEG2?=
 =?us-ascii?Q?l3oFsQf+k5cZ7px01fcBX6UeAFvKFGY6kHFj9MsKj9yHzrwZhu8EWQJ6Q631?=
 =?us-ascii?Q?RhEqTJeOuD+c9KuS7XrlreM19o2vw5Njtz5RLphlbFJgZGzOzS6edWU1I4je?=
 =?us-ascii?Q?aQG1YPB4uLvgmDCeFulX9fUNrwEkPMZbU6It3uH5pmdTJrRza3I9qBLppnww?=
 =?us-ascii?Q?CaauvErRafnShpfjn74lANAiWQqBm+p6e+qy6rHdqu2KknzahDtEZSi/4cHp?=
 =?us-ascii?Q?Vcf2IHmKU81vGzHzGgqW4WaS2mixZlQQgr4Mn2Bdjgajf90fgU+ZbN+g0L/j?=
 =?us-ascii?Q?c6rUAbiUm4lpqHsA6ENKCvBbAMQDYU627W8c?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 23:21:47.4762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ed49a2-ccad-4abd-5811-08dd94d06dff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6654

From: Federico Serafini <federico.serafini@bugseng.com>

MISRA C Directive 4.10 states that:
"Precautions shall be taken in order to prevent the contents of a
header file being included more than once".

Add inclusion guards where missing to address violations of the
guideline.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/common/decompress.h    | 5 +++++
 xen/common/efi/efi.h       | 5 +++++
 xen/common/event_channel.h | 5 +++++
 xen/include/xen/pci_ids.h  | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/xen/common/decompress.h b/xen/common/decompress.h
index 4683eb6c7e..034c833665 100644
--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -1,3 +1,6 @@
+#ifndef DECOMPRESS_H
+#define DECOMPRESS_H
+
 #ifdef __XEN__
 
 #include <xen/decompress.h>
@@ -22,3 +25,5 @@
 #define large_free free
 
 #endif
+
+#endif /* DECOMPRESS_H */
diff --git a/xen/common/efi/efi.h b/xen/common/efi/efi.h
index c02fbb7b69..b02aa2775d 100644
--- a/xen/common/efi/efi.h
+++ b/xen/common/efi/efi.h
@@ -1,3 +1,6 @@
+#ifndef EFI_EFI_H
+#define EFI_EFI_H
+
 #include <asm/efibind.h>
 #include <efi/efidef.h>
 #include <efi/efierr.h>
@@ -51,3 +54,5 @@ void free_ebmalloc_unused_mem(void);
 
 const void *pe_find_section(const void *image, const UINTN image_size,
                             const CHAR16 *section_name, UINTN *size_out);
+
+#endif /* EFI_EFI_H */
diff --git a/xen/common/event_channel.h b/xen/common/event_channel.h
index a778ae775b..dc94a43cc2 100644
--- a/xen/common/event_channel.h
+++ b/xen/common/event_channel.h
@@ -1,5 +1,8 @@
 /* Event channel handling private header. */
 
+#ifndef EVENT_CHANNEL_H
+#define EVENT_CHANNEL_H
+
 #include <xen/event.h>
 
 static inline unsigned int max_evtchns(const struct domain *d)
@@ -67,6 +70,8 @@ static inline void evtchn_fifo_destroy(struct domain *d)
 }
 #endif /* CONFIG_EVTCHN_FIFO */
 
+#endif /* EVENT_CHANNEL_H */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
index e798477a7e..5884a20b8f 100644
--- a/xen/include/xen/pci_ids.h
+++ b/xen/include/xen/pci_ids.h
@@ -1,3 +1,6 @@
+#ifndef XEN_PCI_IDS_H
+#define XEN_PCI_IDS_H
+
 #define PCI_VENDOR_ID_AMD                0x1022
 
 #define PCI_VENDOR_ID_NVIDIA             0x10de
@@ -11,3 +14,5 @@
 #define PCI_VENDOR_ID_BROADCOM           0x14e4
 
 #define PCI_VENDOR_ID_INTEL              0x8086
+
+#endif /* XEN_PCI_IDS_H */
-- 
2.25.1


