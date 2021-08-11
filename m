Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1623E8EAD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165705.302868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVw-0003t9-IZ; Wed, 11 Aug 2021 10:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165705.302868; Wed, 11 Aug 2021 10:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVv-0003gT-RM; Wed, 11 Aug 2021 10:31:11 +0000
Received: by outflank-mailman (input) for mailman id 165705;
 Wed, 11 Aug 2021 10:31:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlUB-0000BQ-KY
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:29:23 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::62c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34c2faa1-4647-4866-88c0-c4133a7f4e77;
 Wed, 11 Aug 2021 10:26:17 +0000 (UTC)
Received: from PR0P264CA0161.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::29)
 by DB7PR08MB4219.eurprd08.prod.outlook.com (2603:10a6:10:34::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 10:26:15 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1b:cafe::dc) by PR0P264CA0161.outlook.office365.com
 (2603:10a6:100:1b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:26:14 +0000
Received: ("Tessian outbound 79bfeeb089c1:v101");
 Wed, 11 Aug 2021 10:26:14 +0000
Received: from 9b3a9cd1f269.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 850E7038-7250-46FE-AB9E-3C4600A0B4FF.1; 
 Wed, 11 Aug 2021 10:26:08 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b3a9cd1f269.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:26:08 +0000
Received: from DU2PR04CA0313.eurprd04.prod.outlook.com (2603:10a6:10:2b5::18)
 by DB7PR08MB3243.eurprd08.prod.outlook.com (2603:10a6:5:21::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:26:06 +0000
Received: from DB5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::2f) by DU2PR04CA0313.outlook.office365.com
 (2603:10a6:10:2b5::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:06 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT056.mail.protection.outlook.com (10.152.21.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:06 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:26:04 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:02 +0000
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
X-Inumbo-ID: 34c2faa1-4647-4866-88c0-c4133a7f4e77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNXvFk8FEKwXourDz8d4PehitVjbuxBLUXjR0NlY49U=;
 b=ZV5NHLbWaJEMHi0fdueDdJeJFl0AVE9jeBO5qH3SH2MnD7OsVK6dZ9jkKZbpyilbhCnBhVBt+YjRIyzozJ+d+mDq9BKzhkxTGchmGHlxtEuK36vkyjXOTLAY3nF/jRB4cu4rIAPp5fAgxdLfkp4hLei/XgoreHlmMpG4U0nhDWI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d577b5644bae3d81
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHKu1MWg8iH7pqERv3UUNR5qfc3iZVblsYMD3jfsrINPly3eN+LwNfcVDKA2X+z2qIAEHKguCvZvmb7rJcp0XnsvcbHpKTt9SZK7OPQaWUEnRVCxtetByn8xzHMXoBYW5xQv4zG3sVEVAuEglIj7EX85pnKhGZXepSUfWbH1JnrkhScUM9j9C/hdG7SaQcWrpp+TPeFif3ogPqdLcAgrS4tauinQPm2OHlWP8HPob7Go5LK6XqdefR9R4/MjQNDjaKTYMecbNvpL49MlM/jEwUDYdxkCiQlIZgouLnL8ZhHqR0TVFm2YNU3emF+990UsnsoM9mmJOwyZNPYR208t1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNXvFk8FEKwXourDz8d4PehitVjbuxBLUXjR0NlY49U=;
 b=MnRBQOlEmxeHRmPnQxHTdNRSPk6XV7FoL/iLgG6E3LwUaz5IvjzLnxsCdvg16SsN7oQla32RQ35ld5GDq0oqUj60ZwfUhh/ku13tLIwHE+3NwWbLwNmnFrd0AiEPZKoZrme93xlMygulRnN695ffatg1rQbz0KQmC3uBqwj3nh80eIuzCiEPX09E9E1EqVBN8rL7Eu31J/bK9fSfqqjRKh5kXJTWxBlHyPVia9THnrV2yZHHcAqUPJaqAEVoGmsbKmTJ4PIIRbv0Jy69Bposk8IzPub3w/t6CxbUnqRJKPMh5cg68HV77cvueUIYD5MkCaqFTWFA16wgQNwozDQFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNXvFk8FEKwXourDz8d4PehitVjbuxBLUXjR0NlY49U=;
 b=ZV5NHLbWaJEMHi0fdueDdJeJFl0AVE9jeBO5qH3SH2MnD7OsVK6dZ9jkKZbpyilbhCnBhVBt+YjRIyzozJ+d+mDq9BKzhkxTGchmGHlxtEuK36vkyjXOTLAY3nF/jRB4cu4rIAPp5fAgxdLfkp4hLei/XgoreHlmMpG4U0nhDWI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 38/40] xen/arm: enable device tree based NUMA in system init
Date: Wed, 11 Aug 2021 18:24:21 +0800
Message-ID: <20210811102423.28908-39-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7746d908-0939-44ed-e3e1-08d95cb272bf
X-MS-TrafficTypeDiagnostic: DB7PR08MB3243:|DB7PR08MB4219:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB421918DE7A0F8CC53B54F53C9EF89@DB7PR08MB4219.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RI5aG7thv3m+0xdQB0znsJr8jaFyQYXt5P7obeLMvhjgKhAQexGChgvl9aVTZuJbluQKMkCz8mBlex9ffbQnWjuwB/7o5SrI8XEQiqRYBOwXjAIvRqUDZbWI8x0Yn87ZW3gOCQrDRSPwVnaEqJS2Xfsk+Lxo3DtuBB+LStvwoKkm3uhkTEoMAXo9jS+I1+qVUqvJh6bigIPB0TO1tPhl0F2JDGmbUvyOE5OTUvH8dotsIeZu9/sWgubYAcRQJu8IvnBdDhbFh+ZCFr9A//jWjNS6FOQ3KCyTILCKd+NjSw1WvME4ASuG0UuQv3OYIuzaSQ+LLESJC9hKduxMWNWxUU3mKR0qKoxghlA8kHmvh4SA1WjiltICWvhBpacj1S6MJXqcXEOkHXb/MSrb0m5teLOMUuMbYxoLBbnX7g8xNlkCPqt2RWt6ZkzlpRC1IRvPGO+vS+SsClYVgGHFh+wISo0SP1iR7SRgRkMGEv/steDsl+J2Dh327bHGCXRIrD1k+r2i65jW2niMK22Tmgk4BpPQ6N0MGXozmjUgYXwYAiCR9Z/dXGtdyxY19ZVVpztWjCpsYDspehqLqxo9iDDFfGIjpN4Cea4D/6G6C7SSRPMQzCw2ovb7nD61WmAqZFhlXmWJgR36ugHsvd2welvwUmg80wR5RtioaT2YZKdTITZ80jgy85pzQrX1h0g9wlrbn5NGWTQLrNYBxMryrlAMZFNfLhqBcbRm5gsfw5AEWy0i7m3WvWdpd1hO2ilfGYvKhmuIBh6y4breCyg1vljft6cKxtjPQsI+t2ffEOxs0QI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(396003)(136003)(46966006)(36840700001)(34070700002)(478600001)(44832011)(186003)(82310400003)(110136005)(26005)(82740400003)(1076003)(4326008)(336012)(2616005)(36756003)(47076005)(5660300002)(70586007)(426003)(70206006)(8676002)(316002)(86362001)(356005)(83380400001)(36860700001)(2906002)(6666004)(7696005)(8936002)(81166007)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3243
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8e3550b5-a747-4645-88ed-08d95cb26df4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nP6+GRLoirLDwiIDtYb0GYYuPk5KWvR2Q4fYnFQFcqD2iEDKamCBgs1WfgkRTi99PbzVUT9x7ZHWzZ2V4HjaQK5UCdpZgomeC054ZKv0fdnPGQi7J9uL+A3cIxqgMKZfxqMx+c9PyWSJbtrtrxIRsInEHubxYAq5p0cUY+NhR5zbp1sZo6KALbYdoZxe9EmF2HczTzC832TKtjjnTiujEBZn7rmSwSjTgP3mtWT9htO8H3ZIeBGNlmQNrHT/4IQvhA2YTOYj7gxOnmx/UhqkO4m/vUlN1RK7GBsdI0QdF0jY5mLONU9xOATxoAV2woPj5A+kJnKaTZo2S+o56nOQ7360uHdqLa1IRO2RrC8A7CVGrPJ13yg7Xa6A9+B9fXMcJnqetqBgzDD8pMxVgn8wWsx4c8TK9q/jvVEtPucMDG/tuW8uDUeMsQakF/lSkMgtxCB6/z7M/AuXFB3p+RSXmlogdhHGV379OGQT5qAM6tJ/0FoJbfRBFkB1HD4PyeK3fqRrzM9iSvfc9mShSmKUgwap5UhKIF6NlIRK1vTb8u1azyI8j8qCcfIQIsQNmhcmqcJwUbAUIofaldF7XlhJSYfE+bHbWCKwUK7YpyNiDBjzn1OSK/HUzAzCRF8n7EcKQyb6gDAPmJQNURny5QJNNPNqYfj1T5wLOBuxgmT9xbQLTcJ+PXSfl/b8bPVRVjOg804ij8rBlHIq2zKWMjH2k9UXoJseEG3wHiSinpvEgr0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966006)(36840700001)(5660300002)(110136005)(82740400003)(81166007)(7696005)(6666004)(83380400001)(8936002)(36860700001)(4326008)(316002)(47076005)(26005)(70586007)(36756003)(2906002)(70206006)(8676002)(336012)(426003)(186003)(1076003)(86362001)(2616005)(44832011)(478600001)(82310400003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:14.7628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7746d908-0939-44ed-e3e1-08d95cb272bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4219

Everything is ready, we can remove the fake NUMA node and
depends on device tree to create NUMA system.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa.c        | 45 ++++++++++++++++++++++----------------
 xen/include/asm-arm/numa.h |  7 ------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 2a18c97470..3b04220e60 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -18,6 +18,7 @@
  *
  */
 #include <xen/init.h>
+#include <xen/device_tree.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
 #include <xen/pfn.h>
@@ -83,28 +84,34 @@ void __init numa_init(bool acpi_off)
     paddr_t ram_size = 0;
     paddr_t ram_end = 0;
 
-    printk(XENLOG_WARNING
-        "NUMA has not been supported yet, NUMA off!\n");
-    /* Arm NUMA has not been implemented until this patch */
-    numa_off = true;
+    /* NUMA has been turned off through Xen parameters */
+    if ( numa_off )
+        goto mem_init;
 
-    /*
-     * Set all cpu_to_node mapping to 0, this will make cpu_to_node
-     * function return 0 as previous fake cpu_to_node API.
-     */
-    for ( idx = 0; idx < NR_CPUS; idx++ )
-        cpu_to_node[idx] = 0;
-
-    /*
-     * Make node_to_cpumask, node_spanned_pages and node_start_pfn
-     * return as previous fake APIs.
-     */
-    for ( idx = 0; idx < MAX_NUMNODES; idx++ ) {
-        node_to_cpumask[idx] = cpu_online_map;
-        node_spanned_pages(idx) = (max_page - mfn_x(first_valid_mfn));
-        node_start_pfn(idx) = (mfn_x(first_valid_mfn));
+    /* Initialize NUMA from device tree when system is not ACPI booted */
+    if ( acpi_off )
+    {
+#ifdef CONFIG_DEVICE_TREE_NUMA
+        int ret = numa_device_tree_init(device_tree_flattened);
+        if ( !ret )
+            goto mem_init;
+        printk(XENLOG_WARNING
+               "Init NUMA from device tree failed, ret=%d\n", ret);
+#else
+        printk(XENLOG_WARNING
+               "CONFIG_DEVICE_TREE_NUMA is not set, NUMA off!\n");
+#endif
+        numa_off = true;
+    }
+    else
+    {
+        /* We don't support NUMA for ACPI boot currently */
+        printk(XENLOG_WARNING
+               "ACPI NUMA has not been supported yet, NUMA off!\n");
+        numa_off = true;
     }
 
+mem_init:
     /*
      * Find the minimal and maximum address of RAM, NUMA will
      * build a memory to node mapping table for the whole range.
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index a3982a94b6..425eb9aede 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -30,13 +30,6 @@ extern int numa_device_tree_init(const void *fdt);
 extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
 extern void arch_numa_init_failed_fallback(void);
 
-/*
- * Temporary for fake NUMA node, when CPU, memory and distance
- * matrix will be read from DTB or ACPI SRAT. The following
- * symbols will be removed.
- */
-extern mfn_t first_valid_mfn;
-
 #else
 
 /* Fake one node for now. See also node_online_map. */
-- 
2.25.1


