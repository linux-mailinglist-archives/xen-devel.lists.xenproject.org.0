Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF353E8EC2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:32:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165816.303066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWj-0006Ce-Kf; Wed, 11 Aug 2021 10:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165816.303066; Wed, 11 Aug 2021 10:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWi-0005uu-Tl; Wed, 11 Aug 2021 10:32:00 +0000
Received: by outflank-mailman (input) for mailman id 165816;
 Wed, 11 Aug 2021 10:31:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlRv-0000BQ-F1
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:27:03 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fea5d40-7657-4aec-8f5c-ffb7632b9478;
 Wed, 11 Aug 2021 10:25:52 +0000 (UTC)
Received: from AM6P192CA0102.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::43)
 by AM6PR08MB5046.eurprd08.prod.outlook.com (2603:10a6:20b:eb::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 11 Aug
 2021 10:25:50 +0000
Received: from AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::71) by AM6P192CA0102.outlook.office365.com
 (2603:10a6:209:8d::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT014.mail.protection.outlook.com (10.152.16.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:50 +0000
Received: ("Tessian outbound 312d863716bf:v101");
 Wed, 11 Aug 2021 10:25:50 +0000
Received: from 465b7ff04c5b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BAA518C6-6EBF-4698-9CF6-13D0D50D338E.1; 
 Wed, 11 Aug 2021 10:25:43 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 465b7ff04c5b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:43 +0000
Received: from DB9PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:10:1da::31)
 by PR3PR08MB5658.eurprd08.prod.outlook.com (2603:10a6:102:88::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 10:25:41 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::b3) by DB9PR05CA0026.outlook.office365.com
 (2603:10a6:10:1da::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:41 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:41 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:35 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 Aug 2021 10:25:35 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:33 +0000
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
X-Inumbo-ID: 0fea5d40-7657-4aec-8f5c-ffb7632b9478
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMHvog/ZeUKCEsfAn5HVuMBBiWdgn9MS9BQ8ztuD3iQ=;
 b=hjpsSJdYXTyYvwAda35U8lLSSOYRA5wC72SodZJ3KMuQ031Xplmm88P1pONwayRi0dYBzjzODJgmFKYswsMnmv5QxBNEMk6K3+SGbEUr0ekZ/NDmgPKlxpeonuVaz5sCNQ2KiFchNIdTshhEJuHS00VzZddK+1DIZapcmfBC4Hc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f86eb01c36ee976
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHlK1AIPyRH2hEE2cha/yLkFByH8Qe5yGzvIc9p0M3kNcFwXt7l2QDKeKgytLOaXZAdZgbMuOVZ3sBW9yrqC8c1Ad3SYoNv9ia9U7Vziu2HGtad33QsX2fj3tvLv8fe4eDpY6dm6e4k3w0vqpmqjX4WyLFhesKRn5KgxKrqg+mJxRXGSM6mhTkU7OJVI62QoUB3nD6OfNjzN/R+NZb3ay8WHk+G1AiIYTMwiOtNyGaeB9Lxzcms52oG9UQJrMB+yj7KFv6gXbFYYWjoO/xIvi+2BK2lJKSITNQjz5jkNau7Ok21GocSHrDFiFEoiHTd9PG04fPIIGDWC4RumCBPOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMHvog/ZeUKCEsfAn5HVuMBBiWdgn9MS9BQ8ztuD3iQ=;
 b=dQN82trnFkr4OiOHT/NEOdi5zdAjMPIzLXzEOgCVNLAoiatt0U+aT1YuYLBHau1wUN2w6Ui9r8IMvFhC2bEHJvAZJYdoLz7gAjmZhBuHQB8ITwVxwLrxhFx54oTggoM79SXVIDt3Nvk2aaXJX+wDwrTESL1bz8r9pYl8eLq1mDtyA+wTfkT795RIGo1IMV31d6F/mt+avocDHtwYUNuoTLqJCwdVsxf0GgVW1a90P9rV++a3WxF5r3CEJwGgNVB2s8C7nBgo/YEEJmCX0o01diw2x3KjFvMbfNz+kK7uDUmRC+KHQeURo5KgkeMUYyZx4+ZjlzNcDSMBZCHGa2YOUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMHvog/ZeUKCEsfAn5HVuMBBiWdgn9MS9BQ8ztuD3iQ=;
 b=hjpsSJdYXTyYvwAda35U8lLSSOYRA5wC72SodZJ3KMuQ031Xplmm88P1pONwayRi0dYBzjzODJgmFKYswsMnmv5QxBNEMk6K3+SGbEUr0ekZ/NDmgPKlxpeonuVaz5sCNQ2KiFchNIdTshhEJuHS00VzZddK+1DIZapcmfBC4Hc=
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
Subject: [XEN RFC PATCH 26/40] xen/arm: Add boot and secondary CPU to NUMA system
Date: Wed, 11 Aug 2021 18:24:09 +0800
Message-ID: <20210811102423.28908-27-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d6a7eab-8080-4cd5-8c4b-08d95cb263fb
X-MS-TrafficTypeDiagnostic: PR3PR08MB5658:|AM6PR08MB5046:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB5046E16EA1298E5EE6693ED09EF89@AM6PR08MB5046.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 elBIOAUClpZo3bL4M3MJ/kpiTp6ZDVLrJLu2qHUSOf2CeqivQURWOjbMb9h6GPVgNXL/1BwC2+VEP2kGTmB9b3jyhyWF/scT4FUHNepi/igAPMIkpWA29hNEz5eBxmLYliFIEebtfbgpRNqQetSQLvZ8cGDCNxG7iMNWZCFlDL89pUPFbEGAucsTmsG0EQ5Wa3UYWFSVOMICAQimmk9df9NGYtbq0tUr0SjD206c7C5HTsyNmUWMPNazOje1RJ8/VCvl2HyuwIkK8WJl6iMheSQOhRX8BzAozkbywfIm6e+MZ98Phyaz1faJLunWneiFql/pvYCeBFzJG4jnc5ZILHou2ww2Tez841lVweBYMLrOQZlLGMSMN1LErMnCKEVMvyear7aME4aKCSgQd+GNNz3de3YKIocrUDqSXX93SadNLIPcS45n4bMUd8re/egT2dATgnW2cxZULYbLwW8LeuTmKh4GNAQHX+juPbst8cev9EmowRpUnfqoWKYj5WrzHCM32M02/suL2PZe8iJKuDjic+ndNR5BiqnxHOafv9t3xy9NHP3LRY1ZdR6usubqf14P5EJkyJzGwrZPET7bNdgs2ZIx3pbrmH1j5nF5VeK0xzfx+BDOmZ1GV6x13/D7uh0jsVQwPdVc8XTCfOE10cBZR1m5lF+uS0N6KP0jyYelbPgqCR4la2YUREtDK9zr4G8QLZ1+tL+GaldvUzUcaJO6L2GKhVlsGbDDP2QC6PadIa9ukh0LX+MrUm4WLJYXO1gIoR3elWYIrhvDjvo3yiZ9HowcHkA5OL/vnAS5Jmk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39850400004)(396003)(46966006)(36840700001)(186003)(36860700001)(44832011)(316002)(478600001)(336012)(7696005)(8676002)(82740400003)(26005)(36756003)(6666004)(1076003)(34070700002)(47076005)(4326008)(110136005)(426003)(86362001)(8936002)(81166007)(356005)(2906002)(83380400001)(2616005)(82310400003)(70586007)(70206006)(5660300002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5658
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e55ccab-78ec-4386-1401-08d95cb25ea0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4heZEKkNvOguc2am60KsCOkyKghgL71Z0PGGV+r+ThxXRnSyBFZRXl5zgX1ZzKFVpYouRmVVJtc72f9zy8NW89zQT8VDuR118FzalQ0qbBNs2XGBv3yMeguA8bONwxsPhumZTm+qiNPyvgJQLf01c+wZYb3bblBdAFnMi3wo3q7TSbf4rj+GSwfC27GKL6oxP0DE0hanx2ix7AE0RsQoRpXDw+ZSOLLMBiJjnCgOGSqjj3/6DPDMf1TZ3cv+RmUv9TjUXjJuUltpt5I43glfSdRbp3n0LInlHiwatnBJGoOh3B7rFmOzA2VthbMm2RisMHmffZsSAsgziG0IirfhrRhW/e5bCEK3ARLdFH8dsca7pM2twItoFfLa/2wpVVY96GWG9w0Bkm+vCR5OL52MvwfQu5heS7MpWTRwvR1LkE7VIOv664yA2aboW3NWZowLAd/udoQQYxt7uOPHByUputR4Kme5KD5Ejg/BU/NRp2K98Mpallsb4CvHdv2RtmNBQqUtbMJ8CPqKohr+q1hkwymqgkMkEeP79RarH7Z0xI3ohg67HIM1KL7OWmkJ5QOL81p1UDDGirlSVwKZ0B2RRznzFdAFulDYfVVVmcJAm07aJWDbTHlzoy7tvNv8GHG+f99+DSV7ePD0q+tWBgjhufc59hJd/HYxgrhTJwg55hhTwrDhSn2y13IA92PxDr79tMpp8Q+HBBhmZ9VSgbBitN5GxvCGkotyuQ0iLWt2Gh4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(1076003)(6666004)(26005)(5660300002)(8676002)(81166007)(47076005)(186003)(316002)(8936002)(83380400001)(86362001)(7696005)(36756003)(110136005)(426003)(70586007)(82310400003)(36860700001)(2906002)(70206006)(336012)(508600001)(4326008)(2616005)(44832011)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:50.0420
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d6a7eab-8080-4cd5-8c4b-08d95cb263fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5046

When cpu boot up, we have add them to NUMA system. In current
stage, we have not parsed the NUMA data, but we have created
a fake NUMA node. So, in this patch, all CPU will be added
to NUMA node#0. After the NUMA data has been parsed from device
tree, the CPU will be added to correct NUMA node as the NUMA
data described.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/setup.c       | 6 ++++++
 xen/arch/arm/smpboot.c     | 6 ++++++
 xen/include/asm-arm/numa.h | 1 +
 3 files changed, 13 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 3c58d2d441..7531989f21 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -918,6 +918,12 @@ void __init start_xen(unsigned long boot_phys_offset,
 
     processor_id();
 
+    /*
+     * If Xen is running on a NUMA off system, there will
+     * be a node#0 at least.
+     */
+    numa_add_cpu(0);
+
     smp_init_cpus();
     cpus = smp_get_max_cpus();
     printk(XENLOG_INFO "SMP: Allowing %u CPUs\n", cpus);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index a1ee3146ef..aa78958c07 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -358,6 +358,12 @@ void start_secondary(void)
      */
     smp_wmb();
 
+    /*
+     * If Xen is running on a NUMA off system, there will
+     * be a node#0 at least.
+     */
+    numa_add_cpu(cpuid);
+
     /* Now report this CPU is up */
     cpumask_set_cpu(cpuid, &cpu_online_map);
 
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 7a3588ac7f..dd31324b0b 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -59,6 +59,7 @@ extern mfn_t first_valid_mfn;
 #define __node_distance(a, b) (20)
 
 #define numa_init(x) do { } while (0)
+#define numa_add_cpu(x) do { } while (0)
 #define numa_set_node(x, y) do { } while (0)
 
 #endif
-- 
2.25.1


