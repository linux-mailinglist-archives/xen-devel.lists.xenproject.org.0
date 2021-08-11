Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D6A3E8EB9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165768.302987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWR-0001ya-Cr; Wed, 11 Aug 2021 10:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165768.302987; Wed, 11 Aug 2021 10:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWQ-0001cV-GU; Wed, 11 Aug 2021 10:31:42 +0000
Received: by outflank-mailman (input) for mailman id 165768;
 Wed, 11 Aug 2021 10:31:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlSK-0000BQ-Fp
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:27:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88972533-0b90-4f21-b6e0-6bc2197160db;
 Wed, 11 Aug 2021 10:25:57 +0000 (UTC)
Received: from AM5PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:206:1::47)
 by AM5PR0801MB1730.eurprd08.prod.outlook.com (2603:10a6:203:38::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Wed, 11 Aug
 2021 10:25:55 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::f7) by AM5PR04CA0034.outlook.office365.com
 (2603:10a6:206:1::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:25:55 +0000
Received: ("Tessian outbound 7b804b1d9bbf:v101");
 Wed, 11 Aug 2021 10:25:55 +0000
Received: from eda043fa79b9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 55E5BB24-0A5A-4D05-8DD1-5B4E48F96E9C.1; 
 Wed, 11 Aug 2021 10:25:49 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eda043fa79b9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:49 +0000
Received: from DB9PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:10:1da::29)
 by AM6PR08MB4167.eurprd08.prod.outlook.com (2603:10a6:20b:ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 10:25:46 +0000
Received: from DB5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::df) by DB9PR05CA0024.outlook.office365.com
 (2603:10a6:10:1da::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:45 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT006.mail.protection.outlook.com (10.152.20.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:45 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:37 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:35 +0000
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
X-Inumbo-ID: 88972533-0b90-4f21-b6e0-6bc2197160db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBGY6GfvOKpF4SmINSG8yp2SYCx1tlbM/Wi58rWpnME=;
 b=jEhHCyd2obaX3ip/lUDjS5wjnlrpRbxqhE8M7OaTTlu/EHeZR5RdGCriRB1fAVs8NSy+4Vj5XrqZPlwlbLxH+ps9JbH0NlF0JSuwBedUS5bnAJMMrwSfWSNy2m/ciesGM+iLeyd1U6UeXlRkb/ePAMr0rWjZzENpjQXxQNjnjbs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 088b7758af486d10
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fWsmxw14xGEGX9bmdlN9/IiB4SeDhmH9of7ZXlCmUyTH2iC0zLysBAwzeyvFlH1usbwV1eNwmAEAfz2J90F5y+Zz9Y7uu5x8xKGPsj3BcCwJl6rT3b0zA0E1CWGzGVBPTwiSddWBn62+Fx2IO22IHksVIbWzEecnn/yT8yn/jnqmK5ENO/EYUtBJVU+Lf9O5tqo8spxrZ1kb5sFivP/8GWHvX87YlTJP4xg96szAbGfIjbjheXGW7oXSpjYVWbasax3ZkhuYdknAJ8vpGpQuNOGcVjyS57y7wYpDhcoOduul0WYruABnQj907tPhTGQXRKUOlVAqIFnZXnNXvDaONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBGY6GfvOKpF4SmINSG8yp2SYCx1tlbM/Wi58rWpnME=;
 b=TNCN6Dz4152CWug8enbj2mqdlJCPc07aURosEJOPKaSGUge3KAPtv87cNoYPfKN7dJP/FvVV+dE1zwarzRv8tbMKgmslkAlxANtUylDlWM35APevMXDZ1Er3zVS4uH2cQtmnDLQs/uYQOfDcyHYDBKCI+d0o3a0gqZx7jEs+3SO2LJFq0RosjfNdNdDhunGXUlMq6IA1AMg0fSTEBwGvp3Kn2n9LjJeY+zlBjn8d4VfpvKSH/U2Dd5MOR6VFwB9x+okpR8iFLBs3PRbcs8s4kJzZrd2rBunWmNkGltI190PgUtlFOcFV2NuI5khge7k2rHJUIhNSG6xnrRzHCtWHNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UBGY6GfvOKpF4SmINSG8yp2SYCx1tlbM/Wi58rWpnME=;
 b=jEhHCyd2obaX3ip/lUDjS5wjnlrpRbxqhE8M7OaTTlu/EHeZR5RdGCriRB1fAVs8NSy+4Vj5XrqZPlwlbLxH+ps9JbH0NlF0JSuwBedUS5bnAJMMrwSfWSNy2m/ciesGM+iLeyd1U6UeXlRkb/ePAMr0rWjZzENpjQXxQNjnjbs=
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
Subject: [XEN RFC PATCH 27/40] xen/arm: build CPU NUMA node map while creating cpu_logical_map
Date: Wed, 11 Aug 2021 18:24:10 +0800
Message-ID: <20210811102423.28908-28-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26edcac0-0236-43ad-b3c1-08d95cb26763
X-MS-TrafficTypeDiagnostic: AM6PR08MB4167:|AM5PR0801MB1730:
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB17309EEC4B259701ED769E089EF89@AM5PR0801MB1730.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bbV6pQLYMaQMoXB4LA7CsB8gbR6psS+Vh3S6NFBlQ7Q5JpYeQCIypUdcghyesgeHvGftvAyE0RQqAiLPx/xFOQiE9kR6Bbp/2ESVd+ZPn1Ye7OH3Q3B0KvUO0sQ71yrT1FyWzIk3RToAeJnh++Z7PZWFUWqarCjlSP0arCXDkmmJAB//X20Xxeb2K9PvTkykPaeH2aytOr/GiOzUVahlEM3S0G57zmArUfmuRmMjHsz+f80l5BFUSIq2t0NKhDvEvsZ14NxbJvjl+SRZGkifHSGQmPAeIHIBjykfl7j/tn1IgZ1AkgsXPGQ8XOaOiCohVBuRfV2AIKnLSNR1B8eBt1ntgT+RDcFt0/CmSu7OsK4CS3vNJlQRazZ/QeLSaMK4mfjdFPHvp5MHbKcK1jQFmOjN10ndyPiEuFzgMRYe4RyCA1XwGmp4az05JLokKcIrGm5rWJp4OS7OaDIBQ3Z8Fy1mJaKnJVHGa/ZbjphWS+hJsTbCJjvCqtUUfQw21k9CW3nCK9cteiwePEi8Z3GVoB4YmuVqPZQnB0I5Zd24jXTjHixGHV2qUP/fAdG3KJ8oYzTNQ+H5/K5/Rk1rMxUKqewz+4J99qEC2egEU0mILMVjo5gbQskEdMsgpUIXU8Xrljnl+WFhutAYyPENuyiuBhT0v02zHFH2tQDLkPaFhogfShgKWgtehmwbqlH15HvC44tFaSErMzt2RJLJTh+m8MXq2z03s1kjrJSihueiUOevErMaewTAzdw+aBa4pMg4o91TNVGxpBL8vaSzY4rhUxvU+668NP09BtYIcao41zs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(36840700001)(46966006)(36860700001)(34070700002)(110136005)(316002)(86362001)(47076005)(36756003)(8676002)(1076003)(478600001)(8936002)(44832011)(2616005)(7696005)(70586007)(26005)(6666004)(2906002)(82740400003)(83380400001)(70206006)(5660300002)(356005)(81166007)(186003)(82310400003)(426003)(336012)(4326008)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4167
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	80f41c7a-42c6-496d-a68f-08d95cb26188
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VW8i/e8pNCL7eGrVUPQJ/n50EclPGW1qrsv9T2cGxjRbxYj7XWrnxr+ln6cfJzgTFbWKWy/ivN24+PjIKJsTnzzp7ahGOos4mPuQnh/cPw2vLPsVyHBOjYNMKjeW7I/kmfVc6tGFm5gmhzH4mRz8HNjcxCdYTlsDE3Jukvb4YnhueIWOuM8QSSmBDWi+cwoJ6sgQE1nt4Sc2o8RTaTRRmFc9kZg90tIXXOr269bhcy5HzSEDnrVPy3taEkHgxE2+MnW3mK7qlo+BNi9ck30WrBB4f3pMVm4I9GGlZ8bF6Uy/cXCi8Clqw3OgIPwsQhfsiY1VqLhE6xe7vpzDqRtHmGlOj6MQtPTSbNpuB/egYgdVk+QzZ4VM6mZRqirCjBrMSTLDMB6IM5Gr6TCCazRl5iqNn0cceLXGyUCjlcx7dvH+X95PNwDsPoango45Dj+0P3i83I9Tk3WlSxaf6UgQwBSvhOm7PpO4at2JCFM4RX1VG35awuQ/qbHYaziUkU7amLGymvygPRglhDMF5YyEy/gtpae0lVZaNoR3T5FF90rvfORWBNbsT0G76/xTFhNW97SNW+Z9nHEYZTJ9uvJiclGb5tTx4HDLxs8v5nM9p8p7lN1uXi9/7iubOx0JI2WzOWJdfeBqAFBJRaxB4p45IeLIiXdP2ZFb70oChWLu4gPorguU8zNJ3cGsjA8JVcVQ23cf10YEJePkFV3HV5/gaUVCEHYT6FmUkXId59qv0Fc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(44832011)(426003)(1076003)(70206006)(70586007)(4326008)(2616005)(6666004)(47076005)(7696005)(110136005)(83380400001)(8936002)(508600001)(82310400003)(81166007)(36756003)(8676002)(316002)(26005)(2906002)(186003)(86362001)(336012)(36860700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:55.7567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26edcac0-0236-43ad-b3c1-08d95cb26763
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1730

Sometimes, CPU logical ID maybe different with physical CPU ID.
Xen is using CPU logial ID for runtime usage, so we should use
CPU logical ID to create map between NUMA node and CPU.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/smpboot.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index aa78958c07..dd5a45bffc 100644
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
 
     mpidr = boot_cpu_data.mpidr.bits & MPIDR_HWID_MASK;
@@ -172,6 +177,26 @@ static void __init dt_smp_init_cpus(void)
             continue;
         }
 
+#ifdef CONFIG_DEVICE_TREE_NUMA
+        /*
+         *  When CONFIG_DEVICE_TREE_NUMA is set, try to fetch numa infomation
+         * from CPU dts node, otherwise the nid is always 0.
+         */
+        if ( !dt_property_read_u32(cpu, "numa-node-id", &nid) )
+        {
+            printk(XENLOG_WARNING
+                "cpu[%d] dts path: %s: doesn't have numa infomation!\n",
+                cpuidx, dt_node_full_name(cpu));
+            /*
+             * The the early stage of NUMA initialization, when Xen found any
+             * CPU dts node doesn't have numa-node-id info, the NUMA will be
+             * treated as off, all CPU will be set to a FAKE node 0. So if we
+             * get numa-node-id failed here, we should set nid to 0.
+             */
+            nid = 0;
+        }
+#endif
+
         /*
          * 8 MSBs must be set to 0 in the DT since the reg property
          * defines the MPIDR[23:0]
@@ -231,9 +256,12 @@ static void __init dt_smp_init_cpus(void)
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
@@ -249,6 +277,7 @@ static void __init dt_smp_init_cpus(void)
             continue;
         cpumask_set_cpu(i, &cpu_possible_map);
         cpu_logical_map(i) = tmp_map[i];
+        numa_set_node(i, node_map[i]);
     }
 }
 
-- 
2.25.1


