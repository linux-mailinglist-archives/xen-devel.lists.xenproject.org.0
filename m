Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDB5B37445
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 23:09:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095131.1450267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0uo-00071V-UA; Tue, 26 Aug 2025 21:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095131.1450267; Tue, 26 Aug 2025 21:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0uo-0006z9-Pf; Tue, 26 Aug 2025 21:09:14 +0000
Received: by outflank-mailman (input) for mailman id 1095131;
 Tue, 26 Aug 2025 21:09:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ur0um-0006HZ-R9
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 21:09:12 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2009::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9ac253b-82c0-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 23:09:12 +0200 (CEST)
Received: from BY3PR05CA0010.namprd05.prod.outlook.com (2603:10b6:a03:254::15)
 by DM4PR12MB5817.namprd12.prod.outlook.com (2603:10b6:8:60::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Tue, 26 Aug
 2025 21:09:08 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::2d) by BY3PR05CA0010.outlook.office365.com
 (2603:10b6:a03:254::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11 via Frontend Transport; Tue,
 26 Aug 2025 21:09:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 21:09:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 16:09:08 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 16:09:07 -0500
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
X-Inumbo-ID: e9ac253b-82c0-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmXnxjrb5hHVt3v1GJGOt/pBc0m86jlBPRuqMoD3I7ePzwNTwj2rwGr0SZJy2bDM5PQhpwSF5ifmhiJ7niZhNfo8uVQd5ddNmD40ZsVU3p8lAysNJPoSATFZBaHwW9Z4Ag4S1RUOmK/FpYa0/POc2QxsHvkYdkuu4WqlSZlEEBBkTvr4hIJHvi22ahUMItau7MKP4UbDmA7xYljRpTvB7xyziesa6RLTzI4KJB4MmSMjcGsV9EQjQAwkPAEwXI7a9EofPWzl8g21jXXSt+Z50+rqDyz0OMDpNq9jdkMYffM1Kv6Xms0BEd13yNQCFuc+JnlUVBWTr6d5CZ/a9KGlkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmz6tXiI9igMexXwJMlZ7JfZtLtNIFmz/j0H60IpHMU=;
 b=KXRR2LQM6N3otoCvC/1Imtn3oyq3tHsDLIO0XeU1if+9pq0X31n0QK8AVUgz7rDCcQldxXL9lhOJn+VL2bJpEFcsD6K+SOMr+SrO2broHlalls4prK624uh/SORIguv0yE9lBNjperbaUoqOg+DtLE2hDY/jGx93cSi4lqGtT6c6N359CLPfIr3N9+Pl+d09XWquS+NlU9J6+ikYXJkX297mY1I2nR9lr7wPjFOTkre1X2UIXcZXSn0TO2iw33CLYG1TBnhdWhwUrAJhLnNQV4/bzC4pjm/A4MvEliA/7K5o3cs76gOXU5Z7O/GlIwGFOELDzL0Zt2xuGjzTMVgyIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmz6tXiI9igMexXwJMlZ7JfZtLtNIFmz/j0H60IpHMU=;
 b=Beba4b0C5Bi0C8s7eY8y6UWU5yPSkeXyWb7yF4brzab8JCL1dtE6E922am+yXFuxkV6eGWCqvle7zZQRgaarny3SbeSJJMe3kTkJzj4nYXfrkoLktGQ3StEsyjVsoMzKgQRyHUKxqGcu5mB40/Q5IN8TUA9Iv7Y11W+99COIpf0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v3 6/8] tools/init-dom0less: Remove use of err()
Date: Tue, 26 Aug 2025 17:08:45 -0400
Message-ID: <20250826210847.126015-7-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826210847.126015-1-jason.andryuk@amd.com>
References: <20250826210847.126015-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|DM4PR12MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c03ee5-2f4a-42e7-9d0c-08dde4e4cc3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ESVW05TuJxS+tLR1qKzNP1eMkfiPwld6YVqN067Sp9PnsgIug1qUU70FwVet?=
 =?us-ascii?Q?vF8Mg5iRbOTrNbB9YQRJf2mlo+c/9leg7SZb0/6rkYsm5gmD8rI1AZ6vHXhc?=
 =?us-ascii?Q?6/TP0na7HwtuC0sbuCVu6dQCbl6xrVGTj9BnvIAzakcJFr3PWvlh3G8vzsmi?=
 =?us-ascii?Q?BR9wZXbf8pWbNmGfhB8w4mTVOn9T2COWCjYs2soVLFDz03qX5RbP/7wvvyHB?=
 =?us-ascii?Q?x4TEPNV/LztFCdgE0piLaHpCf54xJL7mMHAkK3mH1ucPEkxRC//84YM2cmHp?=
 =?us-ascii?Q?hnq0FzVkU68IZzpPRPVzLZhM8Xc5q1Mz+jzHimfRoVEhpvxrzfsTHkkC/H28?=
 =?us-ascii?Q?XycbUJCo519IylNdjo0cxtwzcZz9uK0LRxQwOz4GNDCj/urEabIyLm5RhJTo?=
 =?us-ascii?Q?kIysxuzbWG5nD0U6mwkTIhEm5pzwPMsKwCbY3POXlKkphOR5ZH7xYMPNA9sx?=
 =?us-ascii?Q?ktYbF3HcwTfL0xa58G7t8nkQepNEde64rcEprpbn6DSullDOTtnRfQKJKb36?=
 =?us-ascii?Q?yRS+9LXy6GFD0z4E3n/+bYTOTBh77gJZ7Df0ALdrw0u/JoVa467zQJco5eXP?=
 =?us-ascii?Q?ShGHKPz39M0rodawwzwDPBTBEtlmf+aqgm9mYCvqi2Rw0Cr+QrgUeiFhUtaa?=
 =?us-ascii?Q?hpw7V4PzcjiG/E0ZFvYt6kaeI0Vvf0faOr3oOWJjCtZRzRU1EU4/JN/STAmi?=
 =?us-ascii?Q?f0kZuzC/EhELKceX3FgO/Dq/iWJCoLFvra/yGGtYJwztRkAC6G8IXh/6vshh?=
 =?us-ascii?Q?Axl1sU1o8gQb4R43goUGGW0PNzItJ8xxhRXAVvpclyKPHEuIXHnrVvoMvdNq?=
 =?us-ascii?Q?snQKOl5nf9zVPdWzwnLnmotmyoYmLntsmRcHpTxKSH/49m5oSjkwstjvNVfq?=
 =?us-ascii?Q?075pXfK+9x7Fb7uMuOw4P+85AEWdmpmC/jkicjWJKO/PBMGNEihELqz/eyz3?=
 =?us-ascii?Q?LRd6r0McyJ5NbDclhA8zfojJDFVZLdH6ODxjkC9mH6IvhO/qSvqogQccIj16?=
 =?us-ascii?Q?1rYf1c2LH9WcDoCRycMBNmSS3VBX4qC9ewpx7wArfqvzu6Vhb3BaUF9I5sQi?=
 =?us-ascii?Q?hSZXLf2SMsQuHQIygr0z02QuAv6FVBvYtSpP5ZuHYm6q0R/bH3SgkXFxCEIr?=
 =?us-ascii?Q?FwV71feUiJR9V+OD87H2OlnG4jJRqUdR4RhWFOr3oJwQv/7sMqbFZ8Fuy9OQ?=
 =?us-ascii?Q?zMTEQewQaqrY61lSvWG851yq8JY/fOFE5yXboTI8jHcWEtULmOWsFYDP57+j?=
 =?us-ascii?Q?LgaJvauYYffHbqy6uUH5ZIs46pTogoqD+uTxSWlu+zsVanZY1j0sMZwJmzjD?=
 =?us-ascii?Q?Stht/8U80NtEuSRfQYUpOn4cwrvAtjHwcctJ9ixEyEi84ua4UY+7rHz0IytD?=
 =?us-ascii?Q?X367j/HtPg1bJkFteQdj19Bo4HVRrIIvxRdGUZauCy0CC/31/nRxMzrmFO/K?=
 =?us-ascii?Q?OZFqYc7RRnsfLj4Yy4iAxv9u1bhZ9ecXns6pJWYzvTBJouecZLOpUq6QcNX9?=
 =?us-ascii?Q?3ywwgnWGtLBEBMHakeIgmwVkMisTD42aLeHh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 21:09:08.5455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c03ee5-2f4a-42e7-9d0c-08dde4e4cc3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5817

err() is fatal - print a message and exit.  We want init-dom0less to
continue on as much as possible, so replace with returning an error.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
New
---
 tools/helpers/init-dom0less.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index a4de40aeac..d08b0b1362 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -300,8 +300,10 @@ static int configure_xenstore(libxl_dominfo *info,
 
         rc = xc_dom_gnttab_seed(xch, info->domid, true,
                                 (xen_pfn_t)-1, *xenstore_pfn, 0, 0);
-        if (rc)
-               err(1, "xc_dom_gnttab_seed");
+        if (rc) {
+            printf("xc_dom_gnttab_seed");
+            return 1;
+        }
     }
 
     return 0;
@@ -329,18 +331,24 @@ static int init_domain(libxl_dominfo *info)
     xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
 
     rc = gen_stub_json_config(info->domid, &uuid);
-    if (rc)
-        err(1, "gen_stub_json_config");
+    if (rc) {
+        printf("gen_stub_json_config");
+        return 1;
+    }
 
     rc = create_xenstore(info, uuid, xenstore_pfn, xenstore_evtchn);
-    if (rc)
-        err(1, "writing to xenstore");
+    if (rc) {
+        printf("writing to xenstore");
+        return 1;
+    }
 
     if (!introduced) {
         rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn,
                                  xenstore_evtchn);
-        if (!rc)
-            err(1, "xs_introduce_domain");
+        if (!rc) {
+            printf("xs_introduce_domain");
+            return 1;
+        }
     }
 
     return 0;
-- 
2.50.1


