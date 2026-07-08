Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yKyvJlW7TmrKTAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E8172A691
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 23:04:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=xxVm5Qnw;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357386.1611826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZRE-0006Ji-O6; Wed, 08 Jul 2026 21:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357386.1611826; Wed, 08 Jul 2026 21:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whZRE-0006Db-Jw; Wed, 08 Jul 2026 21:04:12 +0000
Received: by outflank-mailman (input) for mailman id 1357386;
 Wed, 08 Jul 2026 21:04:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1whZRC-00069S-VB
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 21:04:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whZRC-001Bnw-C7
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 23:04:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb1f-2eae-0a2a0a5409dd-0a2a450cab22-26
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:04:10 +0200
Received: from [52.101.193.55]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 6a4ebb48-f399-0a2a450c0019-3465c1372abd-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 23:04:09 +0200
Received: from CH0P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::34)
 by MW5PR12MB5623.namprd12.prod.outlook.com (2603:10b6:303:199::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Wed, 8 Jul
 2026 21:04:01 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:116:cafe::c) by CH0P223CA0016.outlook.office365.com
 (2603:10b6:610:116::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 21:04:01 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 21:04:01 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 16:04:01 -0500
Received: from ubuntu (10.180.168.240) by satlexmb09.amd.com (10.181.42.218)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 14:03:59 -0700
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9v5N4jEv2FOg7LQ2usToFIKIt5VoS3toutJpR0vaDl4/PuGZu8ZgdbpMckvLH/7z256LFf08W5Yiy3DJB2dT/AT7cc+bG+jD0Pk3YWlqWTPpI3yRhS845ueSuvFHtQmkf5GJbX4iQ6NSgLeGWNkFnf9YNBKXIMfn1hSH8FytQwz38I4qRgNg0PPwpDaIZwBCQJ1MlZFwss80vu4pFhk7J/5qTQyko01mCQptKUWugUoT8uR7ueREWIw1Dx3F58xuwv+SfTlLo4zAqz8PmacCife5GGnr0QGziQ9MTgp3tFfPE6DTsx+LIWhUEfGFRAra+moXsPJi62gxoGCZG4L1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwT/vmxOazu6ITUa9dqv7ojlgNbcRzolsBQWcOh7e5g=;
 b=XeBAhVj2H3cMrbJNpF4y2GXHVyrxmQqlyGdzmlyKd87z5JeOxxNDdiNVWE1TUcTRag/OjFt/MSLyQbU9unGgtz0k4PeNPwy8mAeqCBsBPTTj7PpCEf0iYwQnURF3jp2tn5L8R39jrQVjR8n2LMRJCXzPf16KJPgcxShgi33UezgY98uKDsX7TamsNK+XkXwg5rfPkiMECSkAAS9go5kzdLG6YOovqqHhb3509wM1AYr1Cne3IlxLsolr6nLDnFCO9m1glEExMINbz3wV65QuRs7M0tctVo7U47zVs9VJmyKFZ6eSQfruYyP2fvzLeO2BIV1Dnu/V8Ugbq+eWzzkkCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwT/vmxOazu6ITUa9dqv7ojlgNbcRzolsBQWcOh7e5g=;
 b=xxVm5QnwSDXyYil6AIg7VyRiLxrMrCXiEQmmFcYc952Zc1YDjHZz92hC+CKdY7U9oa5ayxq/AwdjchNWivcxtIFsXfdcMuJhA85db5c/DHINUs8G7FvqiR5Uce1VKTYLyUXnGCNjGlSB9Akj6dzkuBCNjBZ263PAXm4ryF/Y0M8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Mykyta
 Poturai" <mykyta_poturai@epam.com>
Subject: [PATCH v5 8/9] vpci: allow queueing of mapping operations
Date: Wed, 8 Jul 2026 17:02:23 -0400
Message-ID: <20260708210233.922275-9-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708210233.922275-1-stewart.hildebrand@amd.com>
References: <20260708210233.922275-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|MW5PR12MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9c680c-2ae0-4018-84bd-08dedd346fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|11063799006|56012099006|18002099003|22082099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	oKaiOwnxHXgNRUEX22qcgTtdnJSYrJhgiL2LtaUYgiIOMjBfhJ949OUj46AOMuDeyoqW4RXI4a8SHqlOoeluJKaOvA+yUgvBUgv39btt2jaBcVnTpJfLyvTSra7fpwmLjFxf+O9Tjcg3OqlYmtMvVeG8wdUiLlTGzXvcQaNknaSldvIaFlw4pgwiZf+581C/2b+NudGn2kePoA04+mtNuqTvRdjPESOEeqxpAMEZ2lognMJN5ASzEVNWQ5SXo3UxDZKRQSfxnlvq+f+kstLfjFvqYd4iEPuneAF9azzDfb/5w7W0O6jEjbAhSzNNrKL7ViZSC4Hrxm4y3C9sYwzzq/p4q/OuWz5C+TwrxgF5jb05qex0eX6ZSWP1JUQf6ZizDCRBBygq1WSOOcbdV/OwXzJx4iZIx/E2mtsxJ0HGFS54YLTgXtrxSnEPnA6l67++TJjiF7fu/4QRUbhqmI+z452qEy1jmBsYEFgs56PfQKEZ4ls7xbylhGZMz8VSdqBK9Copt2JOZJk0Ertb69jMO+IN8vojASIuNAhRFnCTEFBt/Vmrd2EyQxrTx09IgkM9oVnq1qhchVQsiwqIr9sxCwFbttDhkejnGHF4+tXLx17iQpLPvpgMi1HmtlxmRAvFyTPEo/ho92E0CX+kHufvVDBK7dxKgZ1hd05J5jkn8DYC5vdRdlToPqm2p8Ad1k0khqK5RoL7C1Nmzv3VY4ABtQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2BI0o4CAF78KqUNHcFhJE41o9bZzX8E1gJQx8+b4BNve5K2TN7FwGGLFAxl3IA5U69PJ9geBnCXR1LjvxhS7V7M5fMSFwnbiswyUbvUk3RFOKSKXa3suVPJr49yJERDBbsmwOebjoTdJccjpHowKxaD50lOPxd+iVix2PWjgPCXY7gpfOcsBL5AFXVtr2NFX46meO8ZCZSejL32IOAsgxZyJ378BPJFhlX9g+cNRgC+r+B9jZE5vLjl/PITc3whBKyxNct5byFeLWzb18q3k4IwpSVMMhc7WmudZeLQOiaeEOd9CjChUMANaqLI1udSYxEJYQBxky6oMD8eCe5+GnYJRZ1okOIdHtJm/1volc4yBanLhpvagNvpYMLYZwUKkOsvZo+qwCEjCkOqdCOxMf1007u3/BpJEwzfe60szjeeQ49xrYHoNV2ek1iDBxWYB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 21:04:01.5955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9c680c-2ae0-4018-84bd-08dedd346fc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5623
X-purgate-ID: tlsNG-d25034/1783544650-0D727D51-5445B4F8/0/0
X-purgate-type: clean
X-purgate-size: 19956
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:mykyta_poturai@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4E8172A691

Introduce vPCI BAR mapping task queue. Store information needed to
map/unmap BARs in struct map_task. Allow queueing of BAR map/unmap
operations in a queue, thus making it possible to perform multiple p2m
operations associated with single PCI config space register access.

This is preparatory work for further changes that need to perform
multiple unmap/map operations before returning to guest.

While queueing multiple operations is valid, at the moment, only a
single operation will be queued.

Removed rangeset names, since RANGESETF_no_print was set anyway.

Amends: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
As a side effect of this, the ASSERT(rangeset_is_empty(mem)) in
modify_bars() is no longer bogus (see [2]).

v4->v5:
* split non-functional pre-requisites out into separate patches
* move pdev into struct map_task in anticipation of mapping different pdevs
  corresponding to different VFs
* move call to vpci_vcpu_destroy() from vcpu_destroy() to vcpu_teardown()

v3->v4:
* switch back to dynamically allocated queue elements

v2->v3:
* rebase on ("vpci: Use pervcpu ranges for BAR mapping") from [1]
* rework with fixed array of map/unmap slots

[1] https://lore.kernel.org/xen-devel/cover.1772806036.git.mykyta_poturai@epam.com/T/#t
[2] https://lore.kernel.org/xen-devel/20250814160358.95543-2-roger.pau@citrix.com/

v1->v2:
* new patch
---
 xen/common/domain.c        |   5 +
 xen/drivers/vpci/header.c  | 222 +++++++++++++++++++++++++------------
 xen/drivers/vpci/private.h |   1 +
 xen/drivers/vpci/vpci.c    |  17 ++-
 xen/include/xen/vpci.h     |  13 ++-
 5 files changed, 180 insertions(+), 78 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 53ac1d6c4034..d576c2a40fdf 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -36,6 +36,7 @@
 #include <xen/argo.h>
 #include <xen/llc-coloring.h>
 #include <xen/xvmalloc.h>
+#include <xen/vpci.h>
 #include <asm/p2m.h>
 #include <asm/processor.h>
 #include <public/sched.h>
@@ -439,6 +440,8 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
  */
 static int vcpu_teardown(struct vcpu *v)
 {
+    vpci_vcpu_destroy(v);
+
     vmtrace_free_buffer(v);
 
     return 0;
@@ -508,6 +511,8 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     if ( arch_vcpu_create(v) != 0 )
         goto fail_sched;
 
+    vpci_vcpu_init(v);
+
     d->vcpu[vcpu_id] = v;
     if ( vcpu_id != 0 )
     {
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index f7eaf9c6ddf2..99ce67053068 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -23,6 +23,7 @@
 #include <xen/lib.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
+#include <xen/xvmalloc.h>
 
 #include <xsm/xsm.h>
 
@@ -33,9 +34,21 @@
     ((x)->type == VPCI_BAR_MEM32 || (x)->type == VPCI_BAR_MEM64_LO ||   \
      (x)->type == VPCI_BAR_ROM)
 
+struct map_task {
+    /* Structure to store state while {un}mapping PCI BARs. */
+    struct list_head next; /* List element in v->vpci.task_queue */
+    const struct pci_dev *pdev;
+    struct bar_map {
+        uint64_t addr;
+        uint64_t guest_addr;
+        struct rangeset *mem;
+    } bars[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
+    bool map : 1;
+};
+
 struct map_data {
     struct domain *d;
-    const struct vpci_bar *bar;
+    const struct bar_map *bar;
     bool map;
 };
 
@@ -102,21 +115,82 @@ static int cf_check map_range(
     return rc;
 }
 
-static int process_map_task(const struct pci_dev *pdev, bool map)
+static void destroy_map_task(struct map_task *task)
+{
+    unsigned int i;
+
+    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
+        rangeset_destroy(task->bars[i].mem);
+
+    xvfree(task);
+}
+
+void vpci_clear_map_queue(struct vcpu *v, const struct pci_dev *pdev)
+{
+    struct map_task *task, *tmp;
+
+    list_for_each_entry_safe ( task, tmp, &v->vpci.task_queue, next )
+    {
+        if ( !pdev || task->pdev == pdev )
+        {
+            list_del(&task->next);
+            destroy_map_task(task);
+        }
+    }
+}
+
+static struct map_task *alloc_map_task(const struct pci_dev *pdev, bool map,
+                                       bool rom_only)
+{
+    struct map_task *task;
+    unsigned int i;
+
+    task = xvzalloc(struct map_task);
+    if ( !task )
+        return NULL;
+
+    task->pdev = pdev;
+
+    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
+    {
+        if ( !MAPPABLE_BAR(&pdev->vpci->header.bars[i]) )
+            continue;
+
+        if ( rom_only && pdev->vpci->header.bars[i].type != VPCI_BAR_ROM )
+            continue;
+
+        task->bars[i].mem = rangeset_new(pdev->domain, NULL,
+                                         RANGESETF_no_print);
+
+        if ( !task->bars[i].mem )
+        {
+            destroy_map_task(task);
+            return NULL;
+        }
+
+        task->bars[i].addr = pdev->vpci->header.bars[i].addr;
+        task->bars[i].guest_addr = pdev->vpci->header.bars[i].guest_addr;
+    }
+
+    task->map = map;
+
+    return task;
+}
+
+static int process_map_task(struct map_task *task)
 {
-    struct vpci_header *header = NULL;
+    const struct pci_dev *pdev = task->pdev;
     unsigned int i;
 
     ASSERT(rw_is_locked(&pdev->domain->pci_lock));
 
-    header = &pdev->vpci->header;
-    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
     {
-        struct vpci_bar *bar = &header->bars[i];
+        struct bar_map *bar = &task->bars[i];
         struct rangeset *mem = bar->mem;
         struct map_data data = {
             .d = pdev->domain,
-            .map = map,
+            .map = task->map,
             .bar = bar,
         };
         int rc;
@@ -146,29 +220,47 @@ static int process_map_task(const struct pci_dev *pdev, bool map)
 
 bool vpci_process_pending(struct vcpu *v)
 {
-    const struct pci_dev *pdev = v->vpci.pdev;
-    int rc;
-
-    if ( !pdev )
-        return false;
+    struct map_task *task;
+    int rc = 0;
 
     read_lock(&v->domain->pci_lock);
 
-    if ( !pdev->vpci || (v->domain != pdev->domain) )
+    while ( (task = list_first_entry_or_null(&v->vpci.task_queue,
+                                             struct map_task, next)) != NULL )
     {
-        v->vpci.pdev = NULL;
-        read_unlock(&v->domain->pci_lock);
-        return false;
-    }
+        const struct pci_dev *pdev = task->pdev;
 
-    rc = process_map_task(pdev, v->vpci.cmd & PCI_COMMAND_MEMORY);
-    if ( rc == -ERESTART )
-    {
-        read_unlock(&v->domain->pci_lock);
-        return true;
-    }
+        if ( !pdev )
+        {
+            ASSERT_UNREACHABLE();
+            vpci_clear_map_queue(v, NULL);
+            rc = -EILSEQ;
+            break;
+        }
 
-    v->vpci.pdev = NULL;
+        if ( !pdev->vpci || (v->domain != pdev->domain) )
+        {
+            list_del(&task->next);
+            destroy_map_task(task);
+            continue;
+        }
+
+        rc = process_map_task(task);
+        if ( rc == -ERESTART )
+        {
+            read_unlock(&v->domain->pci_lock);
+            return true;
+        }
+
+        list_del(&task->next);
+        destroy_map_task(task);
+
+        if ( rc )
+        {
+            vpci_clear_map_queue(v, pdev);
+            break;
+        }
+    }
 
     read_unlock(&v->domain->pci_lock);
 
@@ -178,18 +270,17 @@ bool vpci_process_pending(struct vcpu *v)
     return false;
 }
 
-static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
-                            uint16_t cmd)
+static int __init apply_map(struct map_task *task)
 {
-    struct vpci_header *header = &pdev->vpci->header;
+    struct domain *d = task->pdev->domain;
     int rc = 0;
     unsigned int i;
 
     ASSERT(rw_is_write_locked(&d->pci_lock));
 
-    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
+    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
     {
-        struct vpci_bar *bar = &header->bars[i];
+        struct bar_map *bar = &task->bars[i];
         struct rangeset *mem = bar->mem;
         struct map_data data = { .d = d, .map = true, .bar = bar };
 
@@ -213,7 +304,7 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
     return rc;
 }
 
-static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
+static void defer_map(struct map_task *task)
 {
     struct vcpu *curr = current;
 
@@ -223,9 +314,8 @@ static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
      * is mapped. This can lead to parallel mapping operations being
      * started for the same device if the domain is not well-behaved.
      */
-    curr->vpci.pdev = pdev;
-    curr->vpci.cmd = cmd;
-    curr->vpci.rom_only = rom_only;
+    list_add_tail(&task->next, &curr->vpci.task_queue);
+
     /*
      * Raise a scheduler softirq in order to prevent the guest from resuming
      * execution with pending mapping operations, to trigger the invocation
@@ -240,12 +330,17 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     struct pci_dev *tmp;
     const struct domain *d;
     const struct vpci_msix *msix = pdev->vpci->msix;
+    struct map_task *task;
     bool bar_valid[ARRAY_SIZE(header->bars)] = { false };
     unsigned int i, j;
     int rc;
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
+    task = alloc_map_task(pdev, cmd & PCI_COMMAND_MEMORY, rom_only);
+    if ( !task )
+        return -ENOMEM;
+
     /*
      * Create a rangeset per BAR that represents the current device memory
      * region and compare it against all the currently active BAR memory
@@ -261,7 +356,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
-        struct rangeset *mem = bar->mem;
+        struct rangeset *mem = task->bars[i].mem;
         unsigned long start = PFN_DOWN(bar->addr);
         unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
         unsigned long start_guest = PFN_DOWN(bar->guest_addr);
@@ -299,7 +394,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             gprintk(XENLOG_G_WARNING,
                     "%pp: can't map BAR%u - offset mismatch: %#lx vs %#lx\n",
                     &pdev->sbdf, i, bar->guest_addr, bar->addr);
-            return -EINVAL;
+            rc = -EINVAL;
+            goto fail;
         }
 
         if ( !iomem_access_permitted(pdev->domain, start, end) )
@@ -309,7 +405,8 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                    pdev->domain, start, end);
             if ( !is_hardware_domain(pdev->domain) )
                 domain_crash(pdev->domain);
-            return -EPERM;
+            rc = -EPERM;
+            goto fail;
         }
 
         rc = xsm_iomem_mapping_vpci(XSM_HOOK, pdev->domain, start, end,
@@ -321,7 +418,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                    pdev->domain, start, end, rc);
             if ( !is_hardware_domain(pdev->domain) )
                 domain_crash(pdev->domain);
-            return rc;
+            goto fail;
         }
 
         rc = rangeset_add_range(mem, start_guest, end_guest);
@@ -329,13 +426,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
                    start_guest, end_guest, rc);
-            return rc;
+            goto fail;
         }
 
         /* Check for overlap with the already setup BAR ranges. */
         for ( j = 0; j < i; j++ )
         {
-            struct rangeset *prev_mem = header->bars[j].mem;
+            struct rangeset *prev_mem = task->bars[j].mem;
 
             if ( rangeset_is_empty(prev_mem) )
                 continue;
@@ -346,7 +443,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
                         &pdev->sbdf, start_guest, end_guest, rc);
-                return rc;
+                goto fail;
             }
         }
 
@@ -356,7 +453,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             gprintk(XENLOG_WARNING,
                     "%pp: failed to sanitize BAR#%u memory: %d\n",
                     &pdev->sbdf, i, rc);
-            return rc;
+            goto fail;
         }
     }
 
@@ -367,9 +464,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
                                      vmsix_table_size(pdev->vpci, i) - 1);
 
-        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
+        for ( j = 0; j < ARRAY_SIZE(task->bars); j++ )
         {
-            struct rangeset *mem = header->bars[j].mem;
+            struct rangeset *mem = task->bars[j].mem;
 
             if ( rangeset_is_empty(mem) )
                 continue;
@@ -380,7 +477,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 gprintk(XENLOG_WARNING,
                        "%pp: failed to remove MSIX table [%lx, %lx]: %d\n",
                         &pdev->sbdf, start, end, rc);
-                return rc;
+                goto fail;
             }
         }
     }
@@ -424,7 +521,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
                 {
                     const struct vpci_bar *bar = &header->bars[j];
-                    struct rangeset *mem = bar->mem;
+                    struct rangeset *mem = task->bars[j].mem;
 
                     if ( !rangeset_overlaps_range(mem, start, end) ||
                          /*
@@ -443,7 +540,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                         gprintk(XENLOG_WARNING,
                                 "%pp: failed to remove [%lx, %lx]: %d\n",
                                 &pdev->sbdf, start, end, rc);
-                        return rc;
+                        goto fail;
                     }
                 }
             }
@@ -472,12 +569,19 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
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
+
+ fail:
+    destroy_map_task(task);
+
+    return rc;
 }
 
 static void cf_check cmd_write(
@@ -705,18 +809,6 @@ static void cf_check rom_write(
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
 int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -826,10 +918,6 @@ int vpci_init_header(struct pci_dev *pdev)
         else
             bars[i].type = VPCI_BAR_MEM32;
 
-        rc = bar_add_rangeset(pdev, &bars[i], i);
-        if ( rc )
-            goto fail;
-
         rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i == num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
@@ -882,12 +970,6 @@ int vpci_init_header(struct pci_dev *pdev)
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
diff --git a/xen/drivers/vpci/private.h b/xen/drivers/vpci/private.h
index 2907f6b40fce..52f26394745b 100644
--- a/xen/drivers/vpci/private.h
+++ b/xen/drivers/vpci/private.h
@@ -44,6 +44,7 @@ typedef struct {
 #define REGISTER_VPCI_EXTCAP(name, finit, fclean) \
     REGISTER_VPCI_CAPABILITY(PCI_EXT_CAP_ID_##name, name, finit, fclean, true)
 
+void vpci_clear_map_queue(struct vcpu *v, const struct pci_dev *pdev);
 int __must_check vpci_init_header(struct pci_dev *pdev);
 
 int vpci_init_capabilities(struct pci_dev *pdev, bool ext_only);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 0ac9ec8b0475..226c7870dd6c 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -24,6 +24,17 @@
 
 #ifdef __XEN__
 
+void vpci_vcpu_destroy(struct vcpu *v)
+{
+    if ( v->vpci.task_queue.next )
+        vpci_clear_map_queue(v, NULL);
+}
+
+void vpci_vcpu_init(struct vcpu *v)
+{
+    INIT_LIST_HEAD(&v->vpci.task_queue);
+}
+
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
 static int assign_virtual_sbdf(struct pci_dev *pdev)
 {
@@ -89,7 +100,7 @@ struct vpci_register *vpci_get_register(const struct vpci *vpci,
 
 void vpci_deassign_device(struct pci_dev *pdev)
 {
-    unsigned int i;
+    struct vcpu *v;
 
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
@@ -116,8 +127,8 @@ void vpci_deassign_device(struct pci_dev *pdev)
     }
     spin_unlock(&pdev->vpci->lock);
 
-    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
-        rangeset_destroy(pdev->vpci->header.bars[i].mem);
+    for_each_vcpu ( pdev->domain, v )
+        vpci_clear_map_queue(v, pdev);
 
     xfree(pdev->vpci);
     pdev->vpci = NULL;
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index ab94eb60d65f..6bb09afd4eb0 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -19,6 +19,9 @@
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
+void vpci_vcpu_destroy(struct vcpu *v);
+void vpci_vcpu_init(struct vcpu *v);
+
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
 
@@ -54,7 +57,6 @@ struct vpci {
             uint64_t guest_addr;
             uint64_t size;
             uint64_t resizable_sizes;
-            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -153,10 +155,8 @@ struct vpci {
 };
 
 struct vpci_vcpu {
-    /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
-    const struct pci_dev *pdev;
-    uint16_t cmd;
-    bool rom_only : 1;
+    /* List head with struct map_task elements */
+    struct list_head task_queue;
 };
 
 #ifdef __XEN__
@@ -204,6 +204,9 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
 #else /* !CONFIG_HAS_VPCI */
 struct vpci_vcpu {};
 
+static inline void vpci_vcpu_destroy(struct vcpu *v) { }
+static inline void vpci_vcpu_init(struct vcpu *v) { }
+
 static inline int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
 {
     return 0;
-- 
2.54.0


