Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273463E8EA3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165695.302802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVp-0002DR-OA; Wed, 11 Aug 2021 10:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165695.302802; Wed, 11 Aug 2021 10:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVp-00029y-Gv; Wed, 11 Aug 2021 10:31:05 +0000
Received: by outflank-mailman (input) for mailman id 165695;
 Wed, 11 Aug 2021 10:31:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlRy-0002Qj-Hr
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:27:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.76]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 903b8011-fa8e-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:26:19 +0000 (UTC)
Received: from AM6P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::14)
 by DB7PR08MB2955.eurprd08.prod.outlook.com (2603:10a6:5:17::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Wed, 11 Aug
 2021 10:26:16 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::49) by AM6P195CA0001.outlook.office365.com
 (2603:10a6:209:81::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:16 +0000
Received: ("Tessian outbound 312d863716bf:v101");
 Wed, 11 Aug 2021 10:26:16 +0000
Received: from 60c3a5c7c6ac.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F8E8969-6555-4481-BCFF-AF1DAC4CE6D0.1; 
 Wed, 11 Aug 2021 10:26:10 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 60c3a5c7c6ac.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:26:10 +0000
Received: from DB6PR0202CA0030.eurprd02.prod.outlook.com (2603:10a6:4:a5::16)
 by AM5PR0802MB2387.eurprd08.prod.outlook.com (2603:10a6:203:9d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 11 Aug
 2021 10:26:09 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::b) by DB6PR0202CA0030.outlook.office365.com
 (2603:10a6:4:a5::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:09 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:09 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:26:07 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:05 +0000
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
X-Inumbo-ID: 903b8011-fa8e-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6uEbUCOtY0G4Js6EVeJsE/jBJeRxOOkeE9Bv4MxOuk=;
 b=+Pbmtl6qJfy63GrZ33q+ZmjuniiBMifrvKrrl9Pm3zk+qrNbuKnUpfEeC0mcITdENNIemQtjIlzSTHl32sgGYq9pC2bpU+WOWoKs8QsFtGp0BgBsSToc7bdvfUtE/KdIwte92uEaM6wY0CBz6ZXleBawzpRJ3JAke5LgS1xp3Nc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3017cd1959655c14
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNL7/cgqaqNTm4Dlp8gGKpcCu3aDZgyxA7XLdkY7YksdBftAD7Yz8gpCZ6ae2XsnhgceMUIbRyOvYMfa4WC1Juc+oE+bW3uP5sLj5+LYDInZ7pwDphaB+9KC2k9BLfbUcQ7pY45dGdRYlHBTDwqHQVzysVRmHLC9nRcoXys60idEDK++RXfUpGQvf9EsJ5zn68FLGkG++XeQ+VivabMVtPFEr5UQox7C5eQruU+YSKtWvFz8H/+eR0uUsAb2LcdIJbpuzv9x5U8G3uUVxR968jtKvnPTk4tBrfBkXK8rM7izdiCvjHp4abLYuLCEZaRvi98GsHmPAyOe03wCt0zMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6uEbUCOtY0G4Js6EVeJsE/jBJeRxOOkeE9Bv4MxOuk=;
 b=EnPuOUQBOeZkR5lIF/jev7oUVOcPGKCC5LUAwhUslVWJO6qeMLt502OzojEjEDsj7ugFcUxjlATagaUXsYOKqgf5K7lGLvy2CULoe13rowKMKG+JHL4ay+jL7vFXHtwSU/+uQY22//WWvLc8Lw02OD7VDwH12A5LXhHl9eUE4IbRsoQcG5GkWE/JbmEH35swkSnG+PQdaZxxUS/qqSgzAKTrTOc/8MKTxYu04wU2O+TEqu+Eqze7GV91Pek++LRS+8OWiSftxVV+ngCLnyQpW6iQn2o/K8csQ81zYm7bS4Pw9iciS/GIlKLjG0v/fW6kVh9L1nLJRppV1LslXMPcnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6uEbUCOtY0G4Js6EVeJsE/jBJeRxOOkeE9Bv4MxOuk=;
 b=+Pbmtl6qJfy63GrZ33q+ZmjuniiBMifrvKrrl9Pm3zk+qrNbuKnUpfEeC0mcITdENNIemQtjIlzSTHl32sgGYq9pC2bpU+WOWoKs8QsFtGp0BgBsSToc7bdvfUtE/KdIwte92uEaM6wY0CBz6ZXleBawzpRJ3JAke5LgS1xp3Nc=
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
Subject: [XEN RFC PATCH 39/40] xen/x86: move numa_setup to common to support NUMA switch in command line
Date: Wed, 11 Aug 2021 18:24:22 +0800
Message-ID: <20210811102423.28908-40-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ba97dedd-24f5-420e-f440-08d95cb273db
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2387:|DB7PR08MB2955:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB295557454C6F7D176F1113E29EF89@DB7PR08MB2955.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:248;OLM:248;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aJKV9aIT6VvU0VQQ2gsmp8pkFCd7/oHwlxnVF4iWA2smFq5lool1qBR09uvjjWOdBmZ0fZmJhWNk/rF0S5T8Hc40MAgUCRIkcRyb/MBo3hB4/yKkPZQrc4kt10r/4jLlwuvaRabwbSq7teNWwZtx+kXIGSbhKntSjRSl9MHwt26f5lOhnqtwzWkZQ+AHHpgJagyA2ZLVhcXz2+X2FHYVLem+FrLNYKljHkiAQ08VxMVeMPUu7SnsbzU97urh7C4ZiAuL7C6pA6RBDUIm7AnQ7VNfrkcg8NitwPth7cxItMRIrAZjp9WXwngzsdeZIH5m4lwTz7PrmwQse49CNimjEZVII9bz0qxxsZqxlAv7YWtZ0bKxMxQabkxy7aPSGDr9OYMz2asosOggTkPO9d1vJkGjGz9/p1X1EZEWftk0ziVwYDMbQ+ZnEFb6XnihAQpG7X6Af6eEdJiASll3DkGaMppRz5TFsa4nj4GRtJAw4QNYOwiuw9r714Z+E6l+yn8QI2GLB09ugHUQfNo1M4hc/VCtA9RIw9mmj5No5Cz+aCpKGCJtyJchN8vrOpOD1JSU4de2JToSEWR2h8mIFAWcFR/Uw71NjNG3DUe3+AHo3mhyuA+FeXLm/fbvZh/dMTN4ladXWBBhub/Z7fulT7KTzPe1HdbdL3hs9JD6iYtFvrrS97NWFXVWjHkulMpnJh2UwVAVZc/SipWVYhXWQfN1NIf9bPnp+xndP1ZAT7oDGvWbtpU+gsiVnGy+sD3MXX5+BBMdmuhmVcEs1XRvNEZBysw6rS0f3Hk/BxyiTgrMUds=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(5660300002)(508600001)(336012)(186003)(34070700002)(8936002)(4326008)(7696005)(26005)(86362001)(8676002)(36860700001)(47076005)(6666004)(70206006)(2616005)(82310400003)(1076003)(2906002)(316002)(36756003)(110136005)(44832011)(426003)(356005)(83380400001)(70586007)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2387
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22bdec4f-04c8-46a7-0f81-08d95cb26f55
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aoOPARhOJxwQ1yg9Rds87wupenStNO7v8FqkrbQIhmKh2Ndfun93SnSRcfck0UTi0yCUlSScMCrL/Il+cjQoQ7na08DvAGGmo/ohyZ8aiSjgZzQ8HohSB/KGU/HBIdn0WSxMIx1W80RGI4flVOwdj3X/HT9ESJXq4V8qdRvMd0N/w2+sOB+ewl9JJX5ogR6y4+aHj8nQXv2tB92CQ1iDLktVdbcZPxhNM7CJkE2x/R3igWKozExcXGZkW60YLAG/eG6+UE6WspdPTpsRGnTITkbGWSS94YRYpyA2781DjXEqFP+7VATJT2lE4GQVttU54YlLxeNcFSzyeffhnSIj721k4cStqtsPMAGY6BKMABjKIb0h1CjLiMuIWSvk4t21Y+srMoBQBYbE1d5Fgw5qfHy1J5XyMgSydznhisA/5nuUbjJ9P/qiJotWPutAs8wzg+99jCIuZgEC86ug8R9jLmqH9Mny4Sqv7E9FjNm3rASrmnPbCTalT6lw6zhs0T3cZJnlBT9RVsXOBzDBi76HB3JT5zHotcKkSrQpNSnkEIR3kFQgz5rO0SefKIWDCjQztHmuPC9iKLx8kW57OqQmpLfhWJxq2o0B9soMJ1OxP7uarJkSbD34Iy2GoQnFBisJGsCwavSuXjyio6Th11oLKlOORufvd442oF+Cpn+kPgHfezySjkFp7ngDxI5N+LcyBX7vhncU5BFgus2VMRk2OZsVYm3QEPop3YjLmYc/p7A=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(426003)(36860700001)(4326008)(36756003)(44832011)(2616005)(508600001)(336012)(86362001)(83380400001)(47076005)(8936002)(8676002)(6666004)(1076003)(81166007)(5660300002)(110136005)(70586007)(316002)(70206006)(7696005)(186003)(82310400003)(2906002)(26005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:16.6186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba97dedd-24f5-420e-f440-08d95cb273db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2955

Xen x86 has created a command line parameter "numa" as NUMA switch for
user to turn on/off NUMA. As device tree based NUMA has been enabled
for Arm, this parameter can be reused by Arm. So in this patch, we move
this parameter to common.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c    | 34 ----------------------------------
 xen/common/numa.c      | 35 ++++++++++++++++++++++++++++++++++-
 xen/include/xen/numa.h |  1 -
 3 files changed, 34 insertions(+), 36 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 8b43be4aa7..380d8ed6fd 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -11,7 +11,6 @@
 #include <xen/nodemask.h>
 #include <xen/numa.h>
 #include <xen/keyhandler.h>
-#include <xen/param.h>
 #include <xen/time.h>
 #include <xen/smp.h>
 #include <xen/pfn.h>
@@ -19,9 +18,6 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
-static int numa_setup(const char *s);
-custom_param("numa", numa_setup);
-
 #ifndef Dprintk
 #define Dprintk(x...)
 #endif
@@ -50,35 +46,6 @@ void numa_set_node(int cpu, nodeid_t node)
     cpu_to_node[cpu] = node;
 }
 
-/* [numa=off] */
-static __init int numa_setup(const char *opt)
-{
-    if ( !strncmp(opt,"off",3) )
-        numa_off = true;
-    else if ( !strncmp(opt,"on",2) )
-        numa_off = false;
-#ifdef CONFIG_NUMA_EMU
-    else if ( !strncmp(opt, "fake=", 5) )
-    {
-        numa_off = false;
-        numa_fake = simple_strtoul(opt+5,NULL,0);
-        if ( numa_fake >= MAX_NUMNODES )
-            numa_fake = MAX_NUMNODES;
-    }
-#endif
-#ifdef CONFIG_ACPI_NUMA
-    else if ( !strncmp(opt,"noacpi",6) )
-    {
-        numa_off = false;
-        acpi_numa = -1;
-    }
-#endif
-    else
-        return -EINVAL;
-
-    return 0;
-} 
-
 /*
  * Setup early cpu_to_node.
  *
@@ -287,4 +254,3 @@ static __init int register_numa_trigger(void)
     return 0;
 }
 __initcall(register_numa_trigger);
-
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 88f1594127..c98eb8d571 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -14,8 +14,12 @@
 #include <xen/smp.h>
 #include <xen/pfn.h>
 #include <xen/sched.h>
+#include <xen/param.h>
 #include <asm/acpi.h>
 
+static int numa_setup(const char *s);
+custom_param("numa", numa_setup);
+
 struct node_data node_data[MAX_NUMNODES];
 
 /* Mapping from pdx to node id */
@@ -324,7 +328,7 @@ int __init numa_scan_nodes(u64 start, u64 end)
 }
 
 #ifdef CONFIG_NUMA_EMU
-int numa_fake __initdata = 0;
+static int numa_fake __initdata = 0;
 
 /* Numa emulation */
 static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
@@ -409,3 +413,32 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     /* architecture specified fallback operations */
     arch_numa_init_failed_fallback();
 }
+
+/* [numa=off] */
+static __init int numa_setup(const char *opt)
+{
+    if ( !strncmp(opt,"off",3) )
+        numa_off = true;
+    else if ( !strncmp(opt,"on",2) )
+        numa_off = false;
+#ifdef CONFIG_NUMA_EMU
+    else if ( !strncmp(opt, "fake=", 5) )
+    {
+        numa_off = false;
+        numa_fake = simple_strtoul(opt+5,NULL,0);
+        if ( numa_fake >= MAX_NUMNODES )
+            numa_fake = MAX_NUMNODES;
+    }
+#endif
+#ifdef CONFIG_ACPI_NUMA
+    else if ( !strncmp(opt,"noacpi",6) )
+    {
+        numa_off = false;
+        acpi_numa = -1;
+    }
+#endif
+    else
+        return -EINVAL;
+
+    return 0;
+}
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index b9b5d1ad88..c647fef736 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -83,7 +83,6 @@ extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 extern void numa_set_node(int cpu, nodeid_t node);
 extern int numa_scan_nodes(u64 start, u64 end);
 extern bool numa_off;
-extern int numa_fake;
 extern s8 acpi_numa;
 
 extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
-- 
2.25.1


