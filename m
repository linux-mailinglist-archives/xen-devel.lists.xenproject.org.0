Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39D7415DE2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:07:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193865.345425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVj-000666-8N; Thu, 23 Sep 2021 12:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193865.345425; Thu, 23 Sep 2021 12:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVj-000645-4A; Thu, 23 Sep 2021 12:07:31 +0000
Received: by outflank-mailman (input) for mailman id 193865;
 Thu, 23 Sep 2021 12:07:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNUQ-0006xV-Sl
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:06:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.67]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6adcd31a-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:04:35 +0000 (UTC)
Received: from DB6PR0601CA0027.eurprd06.prod.outlook.com (2603:10a6:4:17::13)
 by DBBPR08MB4252.eurprd08.prod.outlook.com (2603:10a6:10:c2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 12:04:32 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::25) by DB6PR0601CA0027.outlook.office365.com
 (2603:10a6:4:17::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:32 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:32 +0000
Received: ("Tessian outbound c9f4ff96a6ad:v103");
 Thu, 23 Sep 2021 12:04:31 +0000
Received: from e65c92c8e861.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B81359B3-0BE5-450D-A9D8-FE51EB833D47.1; 
 Thu, 23 Sep 2021 12:04:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e65c92c8e861.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:19 +0000
Received: from AS9PR06CA0105.eurprd06.prod.outlook.com (2603:10a6:20b:465::27)
 by AM4PR0802MB2177.eurprd08.prod.outlook.com (2603:10a6:200:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:04:18 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::5a) by AS9PR06CA0105.outlook.office365.com
 (2603:10a6:20b:465::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:18 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:18 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:06 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:04 +0000
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
X-Inumbo-ID: 6adcd31a-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24TzNeXkluknvjlUOjwTTRzo7llaAUU14RNeMwlWz6E=;
 b=Rle0oijAtTyX8gF6xwDUp77hGrbcGNjm/dLMTBs3Vd9UIlItm6OAyJOaNjNsoG7iZLv/R+BcLsK4uYGCbP5H75MAfR/LTR/UYBeN71RO4+xybFX5VVSVyoJpCUw/mwZuzaaUfp0gDp4flMzjWjiTgJUsRMSkXjgfiFQeMrYqk+I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a61ea4807183f0ca
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwTcW4HxqTP+6Iz2oF+74jfTpOdpTyplmQtI0EBsyQV8Cj7eKIdNPkiQB+mMocXm95eGMcBKeLfZed+DWg+ESj0hhOVTUai92FWnHvRQtSH0HtnmzS/2Dt/ckFuyPCmT4neFD5kXhSaH9jnYp3m21i6m2SJByctudXP5wSethg8cRvXGPGZGWWnuBvpuw4Z9vI33RxhwygO5D44bKNCGJLnN/ppEUkPYWr3jDEkrGuVvD62o8bp0hvPe1SpGytczhodGQFgrR9cv2AiqvhHuj/amcqo3MRoUIjIE40+WkQdkgX37Bgw9bK078oTIPc7yWZa6eUwf/jgyGr7asdilxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=24TzNeXkluknvjlUOjwTTRzo7llaAUU14RNeMwlWz6E=;
 b=Bqi2qcBh2Su8jV2PFYwVsb4nv9e8+nBZ4JnXsJ8Bjda0SUfFS4yuWJfuuebcw2crHzp4V7+c95WfREi0kE3lnDDYjwcYdfoFAsI7nWiY+ctu1ndIjJSVOX8k/HCUzW/R46fpOtH50AcIMdBNnO7aRw6QskATQ3329SnHrI4sTntWdi1+HOOf2NfihE8fMXsMJHgnfRrHI0BQhd4ZUz61R0FHnFH7hNfz0pFckA/blPfKUGtb5DFE+qhtCCQzLlwn6H57uHt7TNqjrSXXRyRoAFv9spfpBDnFZunSTTJfXvrQouxwxzXwwp0UUWGyjRaL6FkgDDTEznhqTeDyhtNsIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24TzNeXkluknvjlUOjwTTRzo7llaAUU14RNeMwlWz6E=;
 b=Rle0oijAtTyX8gF6xwDUp77hGrbcGNjm/dLMTBs3Vd9UIlItm6OAyJOaNjNsoG7iZLv/R+BcLsK4uYGCbP5H75MAfR/LTR/UYBeN71RO4+xybFX5VVSVyoJpCUw/mwZuzaaUfp0gDp4flMzjWjiTgJUsRMSkXjgfiFQeMrYqk+I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 26/37] xen/arm: build NUMA cpu_to_node map in dt_smp_init_cpus
Date: Thu, 23 Sep 2021 20:02:25 +0800
Message-ID: <20210923120236.3692135-27-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e9b1f90-1cdc-4885-ebc2-08d97e8a4d81
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2177:|DBBPR08MB4252:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB42523378052DBB690DFF35919EA39@DBBPR08MB4252.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GStpNBt+BE9ZbmniAnLail5zd1teo6+J6nP1GQLsN76b4i7pu+rRRdWK3ePMZ1f/yY7PXJkXAjETVB+hfa/Xskg8DqW2H4CFV1YOz/a7TI3thGRzLSgZArncCBFE4jFMC/cGnh/3mMu2LomYlaUJuJaAgQ9RHuawmhkuRc2u+C2p9KbELTdRZdJ2DNohd5lxrye+uDQ7R2MFx4bqSlu/b/FkO2Dz177c8+jeCenac433BcubDr437T8MFt3XdfLrxBUSQhGeMGVrOyw6G8P4cyM7mgrxePTjWnbz3H15t+XNbaezZCbOkOU0/T8kKuodKLEH5TGmfJ/9PGc+jTFWJCyotQVSjRT4R4SOnnAlxxU9p5x4j9zytuiMRlpRCic6/yHZyWjh+HV3wAmOIPfbrmcBfugPzmy+8W1fUxQpJ7nkJKJE2+b9OFYlFToPUSMoXbS1WSQK0q7V8vephaWRARmT25+RFsnzT6LY6g1XytCvANZh0xCSyysI4lXM8h/96IeEetvnCvUnJ3U4Ita/CVz9mqQX+UqRTOmsIyzCgXuGHZSjGpLuJk3jKgMgIWcizXC8YyPf59SKQz+gDG7Kfs9nxWBHjtpatv6P3tmyjwdbTxIiuyHGyf9psHfnmEn9F22GzrD6CoC1J8LGbw0n/EtSKBs5eaSQ/Yb/EZ5ucWWKYXZ8agQ8mDDAtJRwxjwJZbLmsnq5f/H44/GhkTsEfp3y6b1MAdHYZATsbiuOzlU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(356005)(508600001)(336012)(186003)(2616005)(81166007)(1076003)(36756003)(8936002)(8676002)(86362001)(426003)(4326008)(26005)(44832011)(36860700001)(70206006)(70586007)(7696005)(83380400001)(2906002)(110136005)(6666004)(82310400003)(316002)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2177
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3f9b71d-4c33-473c-5ddb-08d97e8a4584
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ozgF1EfbjuLDjlnQtcn6oISBztjGhmoXbiGaOtQexdXodaHTyqAqqPG34VnQSluOhz367JkkhwREjTqQPVMh3kUTu0HD8HW0uygYiK3d83izjIzHNWoZKxTvh5d/U7G0xtSYTSQhSBLEfDMe6XlhkK27pdN2zZ7/0S6/sx6qRenEg2zZgVDty/a0Jn8JB6zf5MZC7kaET6UOdl8zpdg9plhr4LOVOIPZ1zCGZ7jvAlUsjFUcGQG5ZHJQpahWr09Bl0DV1Vuw2zfL6UJV5dnPlHf6CRSJ79I+aC1QjnSCdE3RzEgQAQh42OoQG5cJimQ/XsXZhy1FkVbj+twk6/K6wODXnypWqmihfOrODVcohYQCliNwjCYZI6cWO/H+13oW6r++wq/Tt0d/sAhJ146WPMa9D9mhIqkEKtvIFE/QYHL5iT0TRmJltik1a5gDgu4c3ih2vHZXwAi1rrchJSW6bMDWIBDFCVoGRQrb0/lUjhy43saWUozGtBtgtwijK/iWFTv0USPSuArWLVxKjfQj4hukIQK1HMDVs1J5/Kk47p14+Vt8zoBwLpTk3aTrIQXXEemeyoPBHczLomofFOwXuR4FhJWSlMr7y6tcaDaIYfr4NpfNyrfZGf5mucm/aJ4c2PTY0eA9BhNwKC0AejVRLSm8PuUfz5tXA3eMPGlWHs+W+XV5G48JI+epnTVdgirs4PM/k7lSuqEgXifEWvVmew==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(83380400001)(5660300002)(2906002)(6666004)(36860700001)(86362001)(44832011)(70586007)(316002)(81166007)(508600001)(8676002)(8936002)(4326008)(2616005)(110136005)(82310400003)(426003)(26005)(7696005)(186003)(70206006)(336012)(47076005)(36756003)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:32.0477
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9b1f90-1cdc-4885-ebc2-08d97e8a4d81
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4252

NUMA implementation has a cpu_to_node array to store CPU to NODE
map. Xen is using CPU logical ID in runtime components, so we
use CPU logical ID as CPU index in cpu_to_node.

In device tree case, cpu_logical_map is created in dt_smp_init_cpus.
So, when NUMA is enabled, dt_smp_init_cpus will fetch CPU NUMA id
at the same time for cpu_to_node.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/smpboot.c     | 37 ++++++++++++++++++++++++++++++++++++-
 xen/include/asm-arm/numa.h |  5 +++++
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 60c0e82fc5..6e3cc8d3cc 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -121,7 +121,12 @@ static void __init dt_smp_init_cpus(void)
     {
         [0 ... NR_CPUS - 1] = MPIDR_INVALID
     };
+    static nodeid_t node_map[NR_CPUS] __initdata =
+    {
+        [0 ... NR_CPUS - 1] = NUMA_NO_NODE
+    };
     bool bootcpu_valid = false;
+    uint32_t nid = 0;
     int rc;
 
     mpidr = system_cpuinfo.mpidr.bits & MPIDR_HWID_MASK;
@@ -172,6 +177,28 @@ static void __init dt_smp_init_cpus(void)
             continue;
         }
 
+        if ( IS_ENABLED(CONFIG_NUMA) )
+        {
+            /*
+             * When CONFIG_NUMA is set, try to fetch numa infomation
+             * from CPU dts node, otherwise the nid is always 0.
+             */
+            if ( !dt_property_read_u32(cpu, "numa-node-id", &nid) )
+            {
+                printk(XENLOG_WARNING
+                       "cpu[%d] dts path: %s: doesn't have numa information!\n",
+                       cpuidx, dt_node_full_name(cpu));
+                /*
+                 * During the early stage of NUMA initialization, when Xen
+                 * found any CPU dts node doesn't have numa-node-id info, the
+                 * NUMA will be treated as off, all CPU will be set to a FAKE
+                 * node 0. So if we get numa-node-id failed here, we should
+                 * set nid to 0.
+                 */
+                nid = 0;
+            }
+        }
+
         /*
          * 8 MSBs must be set to 0 in the DT since the reg property
          * defines the MPIDR[23:0]
@@ -231,9 +258,12 @@ static void __init dt_smp_init_cpus(void)
         {
             printk("cpu%d init failed (hwid %"PRIregister"): %d\n", i, hwid, rc);
             tmp_map[i] = MPIDR_INVALID;
+            node_map[i] = NUMA_NO_NODE;
         }
-        else
+        else {
             tmp_map[i] = hwid;
+            node_map[i] = nid;
+        }
     }
 
     if ( !bootcpu_valid )
@@ -249,6 +279,11 @@ static void __init dt_smp_init_cpus(void)
             continue;
         cpumask_set_cpu(i, &cpu_possible_map);
         cpu_logical_map(i) = tmp_map[i];
+
+        nid = node_map[i];
+        if ( nid >= MAX_NUMNODES )
+            nid = 0;
+        numa_set_node(i, nid);
     }
 }
 
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 758eafeb05..8a4ad379e0 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -46,6 +46,11 @@ extern mfn_t first_valid_mfn;
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
 
+static inline void numa_set_node(int cpu, nodeid_t node)
+{
+
+}
+
 #endif
 
 static inline unsigned int arch_have_default_dmazone(void)
-- 
2.25.1


