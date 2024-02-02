Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE48847B97
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 22:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675222.1050533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Bq-0006iW-Sh; Fri, 02 Feb 2024 21:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675222.1050533; Fri, 02 Feb 2024 21:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rW1Bq-0006gb-PB; Fri, 02 Feb 2024 21:35:14 +0000
Received: by outflank-mailman (input) for mailman id 675222;
 Fri, 02 Feb 2024 21:35:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iq6B=JL=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rW1Bp-0003tJ-Dn
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 21:35:13 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1ae0816-c212-11ee-8a45-1f161083a0e0;
 Fri, 02 Feb 2024 22:35:12 +0100 (CET)
Received: from CY5PR15CA0217.namprd15.prod.outlook.com (2603:10b6:930:88::6)
 by PH0PR12MB7929.namprd12.prod.outlook.com (2603:10b6:510:284::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.12; Fri, 2 Feb
 2024 21:35:08 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:930:88:cafe::19) by CY5PR15CA0217.outlook.office365.com
 (2603:10b6:930:88::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31 via Frontend
 Transport; Fri, 2 Feb 2024 21:35:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.83) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 21:35:08 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 2 Feb
 2024 15:35:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 2 Feb
 2024 13:35:07 -0800
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 2 Feb 2024 15:35:06 -0600
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
X-Inumbo-ID: f1ae0816-c212-11ee-8a45-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CAXrtD/XwX3PvWAIhRp4bxDCq+MabzGDbD72l1O/6mk0GcPAxDxE43gClQ98r8QDLG4MqzUo2TSnbBRsKQF8+Db4fovSKAlnKPYtstegwEyuOYgeuO9E02V1Jia8IGGUIt7iMTxevbFWFoPjM5UzUo1Jbxh10hxvDp5H2D85DOkZssJG0kQNIymtkZxJ1JMIkIHQLNR/0VtfKVZLS/Xmg7va8BuJOg9uCAjOl6CDelH8GWnvDeHSPDKHAVi/0gRLmy6OJ9rw3LBbYdZQ/lKeTg0YuU62LLmIy1AG3T93LqNCSrNtjdqIb5honhOZO+Xe0mPHJKeu1XKEjw30xZSlZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIlYNCEQ+4nfk+sRGPCKjR3ey13meQvjdP5M2lt1W5E=;
 b=Xi5QYI/t2UdRWUt6hWYnmQPMdGqg1idlzoaBmb8jHeaJ+/bXt5Wk6tksfqhuMQ1O5xK+43AHqEaDuj605Z5/gtUanWyKTMWNZNcltighm9LYUAnKCMp2ILurnMivhX9i2DMB0YNoH38Wt/0l2i1H0LQvo9q0Xr9nzQlp6FhUMpp6lDlxQMzPqtjO/mxKPrRwc7XoX4JCvy8to8q5Mg8k1CACbFn8zv2ZlojjkbMrGLk7V/+XL2n0pRWpQSwwPAFvkB4kUOIhENdjS3ofR92e77ajJJQVlyO8QvylRuOxVdK9u3IhCOLnNcchO3NYhS59EVWuijAArPOujWg2MgC7Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIlYNCEQ+4nfk+sRGPCKjR3ey13meQvjdP5M2lt1W5E=;
 b=rKsCCfAwUSUOprM33XzmL/66B3IyxsDuVmTkXf/ExfcmnvFUU0UstsLaYPEAdWGwFqH/PbwP9nhHA/P3YhfLss8x+HmmppNmNydfsF9uhlUIcyQ2Dpfq8erNmk1834j1XOuzwfCiXm7loWEfZQjhTkqffOiJJIfO7avJCElyU3M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v13 06/14] rangeset: add RANGESETF_no_print flag
Date: Fri, 2 Feb 2024 16:33:10 -0500
Message-ID: <20240202213321.1920347-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|PH0PR12MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: df09e7b0-9791-4897-ae4f-08dc2436d424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uN8K93cdDoxuD3pHr3+1GeRTsqTTvunKnDa22WBCOP45j+emRvrSLvFxc5SVUi9GgHj2q5Vhh3CpPcwQ1P26Z4pWIUgnxINdld+ALMc0Sm3slYLjQhFCgeIMvuEoU2y+5suvTZJc6kaohBv39G+6+Fwfv8HlRVBZnalaqiQienuspFCfBENetyChFDZMzWIENanUNCfO2Dqmy+8mBymzy6T7t/rk8mpkKghp5jj81vFNZZhi3hBNWUOjBO5O1smNDsUPbm22Zw36Y5ZhluFrTCQmE2mTyaXZnonfYAJMcb+33eSmFfa/ol3OamQXgjDWZbdVEgiDDNpliLN7dN/doES7QUCyXfvVopMoGcbfi71FL4nt89rONSGz8E9fBAQ7l95IiCXN3a4LliN8Fh7ZdXJPOWyVYh7QnxUyOQLQJ7RkCxpHOd84kaW+cE/ESCgMsn8q/g9VDb8qcfOjMjsq5xBuU0aHW+RugIrioBrvSjwFnPQpcxO7XLWDalHOUQpQ3WL+faFbJqME2cG8H1eO2bkzqzDa8RhV0Qi1+w7QOHhknlgwqhocws9f59RMzRUv9kDu8M1KlBFkr4Q5l8A3EDXxvw9rvq5UHY61Oobji3Du1UkRmw9pslPveFdRrVTRJny3AKycdfIpFZTLsH+Oo4JVYb/ZibGrvx9q3x+VrERnwnCrinq4riLEJoPYT4WBZMM/yhk4ELhLTQ0D6yAuny6lx5BbNaPVA82bXQnUmm4zJZsBSF6Iz4kEDpeLJ7TnOWDso789ZZD8XeosY2fJYA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(82310400011)(186009)(1800799012)(451199024)(40470700004)(46966006)(36840700001)(478600001)(41300700001)(82740400003)(83380400001)(36860700001)(40460700003)(40480700001)(81166007)(356005)(47076005)(336012)(426003)(6666004)(54906003)(5660300002)(44832011)(2906002)(4326008)(8676002)(26005)(36756003)(8936002)(316002)(6916009)(70586007)(70206006)(86362001)(2616005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 21:35:08.4837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df09e7b0-9791-4897-ae4f-08dc2436d424
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7929

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are range sets which should not be printed, so introduce a flag
which allows marking those as such. Implement relevant logic to skip
such entries while printing.

While at it also simplify the definition of the flags by directly
defining those without helpers.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Since v5:
- comment indentation (Jan)
Since v1:
- update BUG_ON with new flag
- simplify the definition of the flags
---
 xen/common/rangeset.c      | 5 ++++-
 xen/include/xen/rangeset.h | 5 +++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index 16a4c3b842e6..0ccd53caac52 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -433,7 +433,7 @@ struct rangeset *rangeset_new(
     INIT_LIST_HEAD(&r->range_list);
     r->nr_ranges = -1;
 
-    BUG_ON(flags & ~RANGESETF_prettyprint_hex);
+    BUG_ON(flags & ~(RANGESETF_prettyprint_hex | RANGESETF_no_print));
     r->flags = flags;
 
     safe_strcpy(r->name, name ?: "(no name)");
@@ -575,6 +575,9 @@ void rangeset_domain_printk(
 
     list_for_each_entry ( r, &d->rangesets, rangeset_list )
     {
+        if ( r->flags & RANGESETF_no_print )
+            continue;
+
         printk("    ");
         rangeset_printk(r);
         printk("\n");
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 8be0722787ed..87bd956962b5 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -49,8 +49,9 @@ void rangeset_limit(
 
 /* Flags for passing to rangeset_new(). */
  /* Pretty-print range limits in hexadecimal. */
-#define _RANGESETF_prettyprint_hex 0
-#define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
+#define RANGESETF_prettyprint_hex   (1U << 0)
+ /* Do not print entries marked with this flag. */
+#define RANGESETF_no_print          (1U << 1)
 
 bool __must_check rangeset_is_empty(
     const struct rangeset *r);
-- 
2.43.0


