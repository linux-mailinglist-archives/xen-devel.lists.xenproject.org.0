Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B28B0F841
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 18:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054530.1423307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uecTw-0001a3-4H; Wed, 23 Jul 2025 16:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054530.1423307; Wed, 23 Jul 2025 16:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uecTw-0001YH-0X; Wed, 23 Jul 2025 16:38:16 +0000
Received: by outflank-mailman (input) for mailman id 1054530;
 Wed, 23 Jul 2025 16:38:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I4v=2E=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uecTu-0001XQ-3x
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 16:38:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2009::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c16b8be-67e3-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 18:38:12 +0200 (CEST)
Received: from BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::17)
 by IA0PR12MB8227.namprd12.prod.outlook.com (2603:10b6:208:406::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 16:37:59 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::88) by BY1P220CA0013.outlook.office365.com
 (2603:10b6:a03:59d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.30 via Frontend Transport; Wed,
 23 Jul 2025 16:37:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 16:37:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 11:37:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 11:37:57 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 11:37:56 -0500
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
X-Inumbo-ID: 6c16b8be-67e3-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8Ge19Y9DKIVxDBQ+/H10JI9e8OChiaVcWotyrXGcaQGsTVmeqa6H08pU2zSlGD64a3gSaoVREKi5sCf9FnKsWqhJqFYbu4JPH62Y/uQGqnbDHOT4Orsb0A9q22soPPCDB3HJ2+tgKMLgZ2EfTy3QJCgW+noqTbx+NpLCfzNdM8EIt6vnFVObSwbLBLGJxQ6pIAHNQhw3gVS5M49lnQRJepY+me+nAWkF7IPd0f5aBd7fDyU+PBsquFexevcIdgmtSGulNvNhVy4bQwFkY5gWCX4qTBip3B2CKJcWEJEz9N0l6JT4wyktCteRnCFpk343nwI1Qkchi3VRx5Ob/QrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AggVw20rsz0Owkb32aZ9jgtd7JsgquYLK8n+wOuF96E=;
 b=JlQgY0aXnWCeQPrX9GchVB5TlSBhIcKFemwWtqBl0soAdq32YAfqRHFI313ahHxZx9HSqLCEK8mEl4htByiCldOiG1wpD2t8vzE4FtGvIdIrHSNvwBrc+A+3+5G/oSAARmB9NVqKl2oa2p1UYGoV+4C8PW7IQ6mvK61QbU968S08cMJaWau/KerchtftEpYY1kONMDM5FEjMZVtnXSoL8HaOcZubidhuWL0uKwCiMRNpUovllHXy+3g2S9MCqKVSqNkrgr/dY+5EDM3VRVoTLfN87NTxnPXccsu58bIxk+njXuXPYYNffFb+4UjHoEgLRI+ChoQpnDud6fAGtdAs2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AggVw20rsz0Owkb32aZ9jgtd7JsgquYLK8n+wOuF96E=;
 b=ZL53WztmMw74H665B8GBlfwHHShfXea/9FRuuk8gqq1l85vObZlh70Z++eNd1w5ZoWUWEy1CmFWXuntE8aEzIezBbvLH65XgutwkwtEjv8vbnWU4y5raFMmCWn/BAIf+je/W9HZaqQyFL679+tZFP5q7n1M9m5uBqnxtgNrV59I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/3] vpci: allow queueing of mapping operations
Date: Wed, 23 Jul 2025 12:37:41 -0400
Message-ID: <20250723163744.13095-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723163744.13095-1-stewart.hildebrand@amd.com>
References: <20250723163744.13095-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|IA0PR12MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8bf843-d211-4584-6dd6-08ddca074882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B5RIAnHKPk8ScwudPCF8yiZhZPY6cABxlo5wx3IGFqn0efLPbiwld9pj1lJo?=
 =?us-ascii?Q?/LwTMZDWFR37X7f+jbwBwlwlwIm7eYEpN3g9mkn+JdQt9vXXB2ws8skmmjkx?=
 =?us-ascii?Q?1761Y2Jg8RFaPWZDMLq8uMFKSrdBEkdOW3f4xq1u7/S5FiuhTjEDSkwyheca?=
 =?us-ascii?Q?sZiGyy/eb+VO+MIdgaee01y0iiztT8QS0fhL+idza4W2tZDNl9O8nHY3Qeua?=
 =?us-ascii?Q?SQ+231Um53DzFBEE6kkAGxOJpv6MyKU7w50Y8Crwl9vF3ExtOaPEt5nY4RuY?=
 =?us-ascii?Q?xRj0Xz/6wER+ehJHgWDLXV0sGhQSIbmHozKIle9Zzr5E1ySUU8EWYZehA9LS?=
 =?us-ascii?Q?nYhfYiey08UdpFSG/qe29IAUjlhVaFyIzOPVh3sNMkvMkDUNz9hk0vrQnSE5?=
 =?us-ascii?Q?xNHT6mnA71dMMF08tp09d1mYnv92hIslxkQlR1hqrUJE4qq5G9pAmVELV2S9?=
 =?us-ascii?Q?R50edXM8Rgrgz8F4uIGF5nOrQ+Ark/4dBqva7wgNAmoHwD8WEArJ2JAzMFK0?=
 =?us-ascii?Q?C21F9SkAzJOvbkdOGDgtCeVnMA0qtV29nrYR2V0MuBiRKTyZk0dtmX4mKupq?=
 =?us-ascii?Q?G1kAnKHg+6TBaMmJSXjSVytZwyW1ixMULfF1PU8hwByfAoPHprickPptzV4P?=
 =?us-ascii?Q?N2kRB8T2aXaErkCc/oNTRg66FLaO0wqm3eohVq5B2p2TLXxQFq76FYGPNAYR?=
 =?us-ascii?Q?ef2WK0OpZKUwdgdQ8/5+RfkbKoHCOvGL0+8BL1lWFIQTkjv5uKIImqPyB1xn?=
 =?us-ascii?Q?govN+rMkSk6wd7UrHmQs4n4VoVrqVXAP1OK5kBZB3TkrdJKXkVpkpkjFkMnl?=
 =?us-ascii?Q?ZSkQWinMZ1XQOc9fve2LZmvLFM/oSDPe61Y5ocbcZfZ50OCIBLvQmzeQFVZL?=
 =?us-ascii?Q?hURyGMFfs5gVxquOjEzJKNuTad7nDTSUd7F15xGvkCaNnExzYgKNdVt9K5zP?=
 =?us-ascii?Q?JjFjjrlfhU48g++UaJpoyilFrSo4iH/In/L46TlS7kXd0gpxchxO9WgaOFpA?=
 =?us-ascii?Q?HgE5KetO1U/c5p6rldHVqxCmvTKZFh9mkt/012O78IzM5X+yRVnlcrGjqXNh?=
 =?us-ascii?Q?SeocozTY9KuOKflP32QFzAKp+sU2YWA2LuU70o1Fg+fASI/12v1izdsDTflZ?=
 =?us-ascii?Q?1eYN7/0qHw6pOKsq4iKc1PJjYTP2bJeY2ITbFqEgXVwvNG6I3lqA8G7bRUrH?=
 =?us-ascii?Q?7ikrl3q9WJ8HiijLrwrLuChXuukp61zqzm/92NPDI3nc7Ex/NBG8/29jysmd?=
 =?us-ascii?Q?18XLZmMN5BKvFmAU/KeWldnQWSxRFxz7DVmmGdLQYdOIKk/UC1dQgq/QiA7P?=
 =?us-ascii?Q?bUSaUoxfW4cTNSbTHCYPvtBy/CLXp9+jkuh+MWc4I0NpnUMlrQsxQU1oTmSa?=
 =?us-ascii?Q?pX7CrBWqsRiQNTqpOi+pxgkwRABmGmv/tGKS18DkCgZqkq3Vt2vXOgPQDuxs?=
 =?us-ascii?Q?rywXB5CCdhXBMnLOVJ0spwp2c73CUXC5jpTqZNfdMFvCSNznBcdt1dMvgkYC?=
 =?us-ascii?Q?n3ln57aULMXz5Ug+d6GSA2VV5/e65n4G8wOC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 16:37:58.4136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8bf843-d211-4584-6dd6-08ddca074882
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8227

Introduce vPCI BAR mapping task queue. Decouple map operation state from
general vPCI state: in particular, move the per-BAR rangeset out of
struct vpci and into the map task struct.

This is preparatory work for further changes that need to perform
multiple unmap/map operations before returning to guest.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* new patch

Related: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
---
 xen/common/domain.c       |   4 +
 xen/drivers/vpci/header.c | 197 +++++++++++++++++++++++---------------
 xen/drivers/vpci/vpci.c   |   3 -
 xen/include/xen/vpci.h    |  16 +++-
 4 files changed, 139 insertions(+), 81 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 303c338ef293..214795e2d2fe 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -459,6 +459,10 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
         d->vcpu[prev_id]->next_in_list = v;
     }
 
+#ifdef CONFIG_HAS_VPCI
+    INIT_LIST_HEAD(&v->vpci.task_queue);
+#endif
+
     /* Must be called after making new vcpu visible to for_each_vcpu(). */
     vcpu_check_shutdown(v);
 
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index bb76e707992c..df065a5f5faf 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -34,7 +34,7 @@
 
 struct map_data {
     struct domain *d;
-    const struct vpci_bar *bar;
+    const struct vpci_bar_map *bar;
     bool map;
 };
 
@@ -173,31 +173,23 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
         ASSERT_UNREACHABLE();
 }
 
-bool vpci_process_pending(struct vcpu *v)
+static bool vpci_process_map_task(struct vpci_map_task *task)
 {
-    const struct pci_dev *pdev = v->vpci.pdev;
-    struct vpci_header *header = NULL;
+    const struct pci_dev *pdev = task->pdev;
     unsigned int i;
 
     if ( !pdev )
         return false;
 
-    read_lock(&v->domain->pci_lock);
-
-    if ( !pdev->vpci || (v->domain != pdev->domain) )
-    {
-        v->vpci.pdev = NULL;
-        read_unlock(&v->domain->pci_lock);
+    if ( !pdev->vpci || (task->domain != pdev->domain) )
         return false;
-    }
 
-    header = &pdev->vpci->header;
-    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
     {
-        struct vpci_bar *bar = &header->bars[i];
+        struct vpci_bar_map *bar = &task->bars[i];
         struct map_data data = {
-            .d = v->domain,
-            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
+            .d = task->domain,
+            .map = task->cmd & PCI_COMMAND_MEMORY,
             .bar = bar,
         };
         int rc;
@@ -208,57 +200,79 @@ bool vpci_process_pending(struct vcpu *v)
         rc = rangeset_consume_ranges(bar->mem, map_range, &data);
 
         if ( rc == -ERESTART )
-        {
-            read_unlock(&v->domain->pci_lock);
             return true;
-        }
 
         if ( rc )
         {
             spin_lock(&pdev->vpci->lock);
             /* Disable memory decoding unconditionally on failure. */
-            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
+            modify_decoding(pdev, task->cmd & ~PCI_COMMAND_MEMORY,
                             false);
             spin_unlock(&pdev->vpci->lock);
 
-            /* Clean all the rangesets */
-            for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
-                if ( !rangeset_is_empty(header->bars[i].mem) )
-                     rangeset_purge(header->bars[i].mem);
-
-            v->vpci.pdev = NULL;
-
-            read_unlock(&v->domain->pci_lock);
-
-            if ( !is_hardware_domain(v->domain) )
-                domain_crash(v->domain);
+            if ( !is_hardware_domain(task->domain) )
+                domain_crash(task->domain);
 
             return false;
         }
     }
-    v->vpci.pdev = NULL;
 
     spin_lock(&pdev->vpci->lock);
-    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
+    modify_decoding(pdev, task->cmd, task->rom_only);
     spin_unlock(&pdev->vpci->lock);
 
-    read_unlock(&v->domain->pci_lock);
+    return false;
+}
+
+static void destroy_map_task(struct vpci_map_task *task)
+{
+    unsigned int i;
 
+    if ( !task )
+        return;
+
+    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
+        rangeset_destroy(task->bars[i].mem);
+
+    xfree(task);
+}
+
+bool vpci_process_pending(struct vcpu *v)
+{
+    struct vpci_map_task *task;
+    read_lock(&v->domain->pci_lock);
+
+    while ( (task = list_first_entry_or_null(&v->vpci.task_queue,
+                                             struct vpci_map_task,
+                                             next)) != NULL )
+    {
+        if ( vpci_process_map_task(task) )
+        {
+            read_unlock(&v->domain->pci_lock);
+            return true;
+        }
+
+        list_del(&task->next);
+        destroy_map_task(task);
+    }
+
+    read_unlock(&v->domain->pci_lock);
     return false;
 }
 
-static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
-                            uint16_t cmd)
+static int __init apply_map(struct vpci_map_task *task)
 {
-    struct vpci_header *header = &pdev->vpci->header;
+    struct domain *d = task->domain;
+    const struct pci_dev *pdev = task->pdev;
+    uint16_t cmd = task->cmd;
     int rc = 0;
     unsigned int i;
 
     ASSERT(rw_is_write_locked(&d->pci_lock));
 
-    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
     {
-        struct vpci_bar *bar = &header->bars[i];
+        struct vpci_bar_map *bar = &task->bars[i];
         struct map_data data = { .d = d, .map = true, .bar = bar };
 
         if ( rangeset_is_empty(bar->mem) )
@@ -283,7 +297,48 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
     return rc;
 }
 
-static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
+static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
+                                            uint16_t cmd, bool rom_only)
+{
+    struct vpci_map_task *task = xzalloc(struct vpci_map_task);
+    unsigned int i;
+
+    if ( !task )
+        return NULL;
+
+    BUILD_BUG_ON(ARRAY_SIZE(task->bars) != ARRAY_SIZE(pdev->vpci->header.bars));
+
+    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
+    {
+        if ( pdev->vpci->header.bars[i].type >= VPCI_BAR_MEM32 )
+        {
+            char str[32];
+
+            snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
+
+            task->bars[i].mem = rangeset_new(pdev->domain, str,
+                                             RANGESETF_no_print);
+
+            if ( !task->bars[i].mem )
+            {
+                destroy_map_task(task);
+                return NULL;
+            }
+
+            task->bars[i].addr = pdev->vpci->header.bars[i].addr;
+            task->bars[i].guest_addr = pdev->vpci->header.bars[i].guest_addr;
+        }
+    }
+
+    task->pdev = pdev;
+    task->domain = pdev->domain;
+    task->cmd = cmd;
+    task->rom_only = rom_only;
+
+    return task;
+}
+
+static void defer_map(struct vpci_map_task *task)
 {
     struct vcpu *curr = current;
 
@@ -293,9 +348,9 @@ static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
      * is mapped. This can lead to parallel mapping operations being
      * started for the same device if the domain is not well-behaved.
      */
-    curr->vpci.pdev = pdev;
-    curr->vpci.cmd = cmd;
-    curr->vpci.rom_only = rom_only;
+
+    list_add_tail(&task->next, &curr->vpci.task_queue);
+
     /*
      * Raise a scheduler softirq in order to prevent the guest from resuming
      * execution with pending mapping operations, to trigger the invocation
@@ -310,11 +365,15 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     struct pci_dev *tmp;
     const struct domain *d;
     const struct vpci_msix *msix = pdev->vpci->msix;
+    struct vpci_map_task *task = alloc_map_task(pdev, cmd, rom_only);
     unsigned int i, j;
     int rc;
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
+    if ( !task )
+        return -ENOMEM;
+
     /*
      * Create a rangeset per BAR that represents the current device memory
      * region and compare it against all the currently active BAR memory
@@ -330,12 +389,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
+        struct rangeset *mem = task->bars[i].mem;
         unsigned long start = PFN_DOWN(bar->addr);
         unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
         unsigned long start_guest = PFN_DOWN(bar->guest_addr);
         unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
 
-        if ( !bar->mem )
+        if ( !mem )
             continue;
 
         if ( !MAPPABLE_BAR(bar) ||
@@ -353,7 +413,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             continue;
         }
 
-        ASSERT(rangeset_is_empty(bar->mem));
+        ASSERT(rangeset_is_empty(mem));
 
         /*
          * Make sure that the guest set address has the same page offset
@@ -365,21 +425,23 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             gprintk(XENLOG_G_WARNING,
                     "%pp: can't map BAR%u - offset mismatch: %#lx vs %#lx\n",
                     &pdev->sbdf, i, bar->guest_addr, bar->addr);
+            destroy_map_task(task);
             return -EINVAL;
         }
 
-        rc = rangeset_add_range(bar->mem, start_guest, end_guest);
+        rc = rangeset_add_range(mem, start_guest, end_guest);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
                    start_guest, end_guest, rc);
+            destroy_map_task(task);
             return rc;
         }
 
         /* Check for overlap with the already setup BAR ranges. */
         for ( j = 0; j < i; j++ )
         {
-            struct vpci_bar *prev_bar = &header->bars[j];
+            struct vpci_bar_map *prev_bar = &task->bars[j];
 
             if ( rangeset_is_empty(prev_bar->mem) )
                 continue;
@@ -390,16 +452,18 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
                         &pdev->sbdf, start_guest, end_guest, rc);
+                destroy_map_task(task);
                 return rc;
             }
         }
 
-        rc = pci_sanitize_bar_memory(bar->mem);
+        rc = pci_sanitize_bar_memory(mem);
         if ( rc )
         {
             gprintk(XENLOG_WARNING,
                     "%pp: failed to sanitize BAR#%u memory: %d\n",
                     &pdev->sbdf, i, rc);
+            destroy_map_task(task);
             return rc;
         }
     }
@@ -413,7 +477,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
 
         for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
         {
-            const struct vpci_bar *bar = &header->bars[j];
+            const struct vpci_bar_map *bar = &task->bars[j];
 
             if ( rangeset_is_empty(bar->mem) )
                 continue;
@@ -424,6 +488,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove MSIX table [%lx, %lx]: %d\n",
                         &pdev->sbdf, start, end, rc);
+                destroy_map_task(task);
                 return rc;
             }
         }
@@ -468,8 +533,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
                 {
                     const struct vpci_bar *bar = &header->bars[j];
+                    struct rangeset *mem = task->bars[j].mem;
 
-                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||
+                    if ( !rangeset_overlaps_range(mem, start, end) ||
                          /*
                           * If only the ROM enable bit is toggled check against
                           * other BARs in the same device for overlaps, but not
@@ -480,12 +546,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                           bar->type == VPCI_BAR_ROM) )
                         continue;
 
-                    rc = rangeset_remove_range(bar->mem, start, end);
+                    rc = rangeset_remove_range(mem, start, end);
                     if ( rc )
                     {
                         gprintk(XENLOG_WARNING,
                                 "%pp: failed to remove [%lx, %lx]: %d\n",
                                 &pdev->sbdf, start, end, rc);
+                        destroy_map_task(task);
                         return rc;
                     }
                 }
@@ -509,10 +576,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
          * will always be to establish mappings and process all the BARs.
          */
         ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
-        return apply_map(pdev->domain, pdev, cmd);
+        rc = apply_map(task);
+        destroy_map_task(task);
+        return rc;
     }
 
-    defer_map(pdev, cmd, rom_only);
+    defer_map(task);
 
     return 0;
 }
@@ -731,18 +800,6 @@ static void cf_check rom_write(
     }
 }
 
-static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
-                            unsigned int i)
-{
-    char str[32];
-
-    snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
-
-    bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
-
-    return !bar->mem ? -ENOMEM : 0;
-}
-
 static int vpci_init_capability_list(struct pci_dev *pdev)
 {
     int rc;
@@ -947,10 +1004,6 @@ static int cf_check init_header(struct pci_dev *pdev)
         else
             bars[i].type = VPCI_BAR_MEM32;
 
-        rc = bar_add_rangeset(pdev, &bars[i], i);
-        if ( rc )
-            goto fail;
-
         rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i == num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
@@ -1003,12 +1056,6 @@ static int cf_check init_header(struct pci_dev *pdev)
                                4, rom);
         if ( rc )
             rom->type = VPCI_BAR_EMPTY;
-        else
-        {
-            rc = bar_add_rangeset(pdev, rom, num_bars);
-            if ( rc )
-                goto fail;
-        }
     }
     else if ( !is_hwdom )
     {
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 09988f04c27c..7177cfce355d 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -117,9 +117,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
                 iounmap(pdev->vpci->msix->table[i]);
     }
 
-    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
-        rangeset_destroy(pdev->vpci->header.bars[i].mem);
-
     xfree(pdev->vpci->msix);
     xfree(pdev->vpci->msi);
     xfree(pdev->vpci);
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 6a481a4e89d3..c2e75076691f 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -103,7 +103,6 @@ struct vpci {
             uint64_t guest_addr;
             uint64_t size;
             uint64_t resizable_sizes;
-            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -194,14 +193,25 @@ struct vpci {
 #endif
 };
 
-struct vpci_vcpu {
+#ifdef __XEN__
+struct vpci_map_task {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
+    struct list_head next;
     const struct pci_dev *pdev;
+    struct domain *domain;
+    struct vpci_bar_map {
+        uint64_t addr;
+        uint64_t guest_addr;
+        struct rangeset *mem;
+    } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
     uint16_t cmd;
     bool rom_only : 1;
 };
 
-#ifdef __XEN__
+struct vpci_vcpu {
+    struct list_head task_queue;
+};
+
 void vpci_dump_msi(void);
 
 /* Make sure there's a hole in the p2m for the MSIX mmio areas. */
-- 
2.50.1


