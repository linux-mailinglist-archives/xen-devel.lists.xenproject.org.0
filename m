Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 002BE8AFFCC
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711033.1110714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTQd-00063h-32; Wed, 24 Apr 2024 03:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711033.1110714; Wed, 24 Apr 2024 03:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTQc-0005wj-T3; Wed, 24 Apr 2024 03:36:14 +0000
Received: by outflank-mailman (input) for mailman id 711033;
 Wed, 24 Apr 2024 03:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTQa-0003iy-T2
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:36:12 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb35a9e6-01eb-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 05:36:12 +0200 (CEST)
Received: from MN2PR07CA0004.namprd07.prod.outlook.com (2603:10b6:208:1a0::14)
 by SJ2PR12MB8807.namprd12.prod.outlook.com (2603:10b6:a03:4d0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 03:36:08 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::79) by MN2PR07CA0004.outlook.office365.com
 (2603:10b6:208:1a0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Wed, 24 Apr 2024 03:36:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:36:08 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:36:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 20:35:47 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:35:45 -0500
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
X-Inumbo-ID: cb35a9e6-01eb-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKjPkG16JDzf28E8cqXwwG9S2AS1BHqoMnmCc5N+2h5q//y8QgPKPJfRhbbaSgg8Rcmh8O6Ks3PorLXhHOYk5e3a0HoXzsbjHgvvF4/JNfEyxz2FStCWjo9/twXuhb5uzNIBbevi7FTHq/1oA1TXVRPLB3jH0Oh57NaPxY78lsTLUY5/pLNt3amysvHsNaK8IipXu10cUumvw46rVB/FDr07w8TWvac010KBBWSBLg4MQ2DLxOqoymVoFj07OtDKIFK0uDxrkk9/UItq9gj6GYo0gvwi0IfbUKqqFQa1IWMIZubkuHiUn1KkrnH9BGxD+nrXADJnMnq+QsDGx7dxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6RfZgheYZN0zbH6UoyVjyXZAc0SA9g0gkM7LgGJzRro=;
 b=TOJf1ZVmePm2dQqUewh1WtxQy5iMttMiDZjLME1dT/F93wFwj2aJE2Mc6iu/PQmUpfXaOfH0dMdO6mEq7RLxJ1I2nd7jQjjY37+f52+ZbPQe4qGFWoSFp/9TVZTKp9IMvJc1HkpEn1iv33QL0Frr4RSIb6nEhO7VfXnBRwGuwGA0TsnfTgd9UCPJKDPWrVRaYEsdDMPxwKNPV1ROjrnI07VLANXrSTZY6Y5Z8eJNd1WgnLsdtxlN0TK8gmhYAIV33EBo/M3FYlhWbFdpOrttPyh6fevOquYUUSYvoa91MRfH2Et54T7LQ1N1OHOVp6WSHGZon2WzXJbu+QnK/ERWmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RfZgheYZN0zbH6UoyVjyXZAc0SA9g0gkM7LgGJzRro=;
 b=eOlaPU3LA3MDHeFN6N31GGmxaf5OeCIS5+fUz15LcznbWS+zLBk0c7dHZbm5TR2jG3SjXc49RehCa9tYOT2c0Z4u1rOoccRZ0VEPcH6L49UyhHZDZhBFOBEsg4VoY2CDnZA18csW+Inz+QJluJNYBVprvATll+0Jl0uMCeUm59Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <vikram.garhwal@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Henry Wang <xin.wang2@amd.com>
Subject: [PATCH 06/15] rangeset: Move struct range and struct rangeset to headerfile
Date: Wed, 24 Apr 2024 11:34:40 +0800
Message-ID: <20240424033449.168398-7-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|SJ2PR12MB8807:EE_
X-MS-Office365-Filtering-Correlation-Id: a87d3345-30c1-4fc3-be94-08dc640fadc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TTenfAeORr62R9ETBpCqotM4RBldnGR5wgtZctDhmqyjE4GdEyWJmfZwSN0x?=
 =?us-ascii?Q?4p4sGTGC0peXWBwvnsZpVhcBCovsdl47RxBvp9wcJ6uLhOm81fTG9OWpWdWW?=
 =?us-ascii?Q?7EcQQNUtbVgBZfnD6AyOUzSpQYIgdRLSP/m/+0dJ2O5/twuvaVFA7eyoSDGZ?=
 =?us-ascii?Q?rqJM/HvLwYvqzGUTT2c4EwDeAJvR28xZ7Z9kdmxV8MGaPI4fSkNkGVDS6Z3l?=
 =?us-ascii?Q?mjV5+Oe52FIMsiEbQ5W3g4MRYRDe6tOeus72LX/8O4MUn9FQqYYPN3WGprps?=
 =?us-ascii?Q?HxEBr9O4PZdysiXLTBS1hPOxKKa9M+AlNv6D3yTlrwhgaIJJpHcfR8MGGuBu?=
 =?us-ascii?Q?BKh9dhUiMBkAqZ3KTykGlBzYgW6GNlV9c5mHgcKLo/qUtZfDPWfnzWpzRU6i?=
 =?us-ascii?Q?ppP2ftGYx/N5lO0FtXDRLjwiJx9va/7irm0Jrf2Awqx07CWbMCbsnHwqHgDJ?=
 =?us-ascii?Q?ISsDUP0+pzh+RRzv/NGQ7KJ+4OuxCD+vU0HLb4FHSGPozNrX5ObRD/cXxMLZ?=
 =?us-ascii?Q?pIIOKhulcH3Fc64QOBa1/ZkZA86bnI0ZmacEuGpTBTWTNS2CTkK7cHCgzzL4?=
 =?us-ascii?Q?tQAfKYbS8pOR4MDqOrVV04Vwun7vzfvRRZnA9Tp9TeaxL5zS6C5ubQvSLYO1?=
 =?us-ascii?Q?bvN4DVzycjFhYB/gQtkZAxLtF3L+ihx8IJBAV/MyIoUxWHx/5WoYnodit0k4?=
 =?us-ascii?Q?bj/nlVwlVmrl9mhz6LwJOAe6rpcp+kgJBNgdzaxJB0Pwm59RGnVo/PA8bNfc?=
 =?us-ascii?Q?GvZaSONSPKhPBRq6zIV3q95coQaa8u8DC5sER9zmH4eKzHBY4zC/dwpTEBFd?=
 =?us-ascii?Q?2Q8fJ8mgoXEPjsGjeL6dVUwQCkY/EjU1JMYpR//eg2Spn5sqvmfR45qyDLDf?=
 =?us-ascii?Q?HNQqWhCKejz1wTigWXDxIo1a6swHfLFRw/yAzXQx+YbkcyHpM9kwv3RJ/7rR?=
 =?us-ascii?Q?SVvzoSonhNqoG9y1R9UopaxltjldqjFqombBBvMO0ao29wMFCE1BPzSAN1Rh?=
 =?us-ascii?Q?A3WJs1GkskHvvlDDkkxNw0zko+Eamei5WgjXsfabALMRxJW1L15qL39189HH?=
 =?us-ascii?Q?ucHuvXyME5NaXtBVdGX75JfCY5Gd1g/a3YNinQriw5P3VgwY+0OjoUHdNClU?=
 =?us-ascii?Q?yXk6Dpyf2im365JeQStU04geXQMA+CRb5qL0ALq0vHPJalJEuyMC1WUWk2ng?=
 =?us-ascii?Q?8kcglfYtOMOFeIn5JWEI+720iECUHxxHCW3gAgT6nqWl5SrNKNSnnF5C3gKX?=
 =?us-ascii?Q?Svp5yq1tjLKg/CiqwizctQgy/kz/D3XzCQUWG9J713ShQ2q66sNBEZoHj2Fy?=
 =?us-ascii?Q?fKmnH9D7duBORVA6300ZuavsbxbAp42fWnq8VudqK7ZONS+8de05MwJ8njMI?=
 =?us-ascii?Q?C3AckRQyZOzFnWNrpAauwizaUffL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:36:08.1872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a87d3345-30c1-4fc3-be94-08dc640fadc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8807

From: Vikram Garhwal <vikram.garhwal@amd.com>

Move struct range, rangeset and removed static from first_range and next_range().
IRQs and IOMEMs for nodes are stored as rangeset in the dynamic node addition
part. While removing the nodes we need to access every IRQ and IOMEM ranges to
unmap IRQ and IOMEM from the domain.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 xen/common/rangeset.c      | 31 ++-----------------------------
 xen/include/xen/rangeset.h | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index b75590f907..d3f4297e41 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -12,31 +12,6 @@
 #include <xen/rangeset.h>
 #include <xsm/xsm.h>
 
-/* An inclusive range [s,e] and pointer to next range in ascending order. */
-struct range {
-    struct list_head list;
-    unsigned long s, e;
-};
-
-struct rangeset {
-    /* Owning domain and threaded list of rangesets. */
-    struct list_head rangeset_list;
-    struct domain   *domain;
-
-    /* Ordered list of ranges contained in this set, and protecting lock. */
-    struct list_head range_list;
-
-    /* Number of ranges that can be allocated */
-    long             nr_ranges;
-    rwlock_t         lock;
-
-    /* Pretty-printing name. */
-    char             name[32];
-
-    /* RANGESETF flags. */
-    unsigned int     flags;
-};
-
 /*****************************
  * Private range functions hide the underlying linked-list implemnetation.
  */
@@ -57,8 +32,7 @@ static struct range *find_range(
     return x;
 }
 
-/* Return the lowest range in the set r, or NULL if r is empty. */
-static struct range *first_range(
+struct range *first_range(
     struct rangeset *r)
 {
     if ( list_empty(&r->range_list) )
@@ -66,8 +40,7 @@ static struct range *first_range(
     return list_entry(r->range_list.next, struct range, list);
 }
 
-/* Return range following x in ascending order, or NULL if x is the highest. */
-static struct range *next_range(
+struct range *next_range(
     struct rangeset *r, struct range *x)
 {
     if ( x->list.next == &r->range_list )
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 96c9180825..cd80fd9179 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -13,7 +13,37 @@
 #include <xen/types.h>
 
 struct domain;
-struct rangeset;
+
+struct rangeset {
+    /* Owning domain and threaded list of rangesets. */
+    struct list_head rangeset_list;
+    struct domain   *domain;
+
+    /* Ordered list of ranges contained in this set, and protecting lock. */
+    struct list_head range_list;
+
+    /* Number of ranges that can be allocated */
+    long             nr_ranges;
+    rwlock_t         lock;
+
+    /* Pretty-printing name. */
+    char             name[32];
+
+    /* RANGESETF flags. */
+    unsigned int     flags;
+};
+
+/* An inclusive range [s,e] and pointer to next range in ascending order. */
+struct range {
+    struct list_head list;
+    unsigned long s, e;
+};
+
+/* Return the lowest range in the set r, or NULL if r is empty. */
+struct range *first_range(struct rangeset *r);
+
+/* Return range following x in ascending order, or NULL if x is the highest. */
+struct range *next_range(struct rangeset *r, struct range *x);
 
 /*
  * Initialise/destroy per-domain rangeset information.
-- 
2.34.1


