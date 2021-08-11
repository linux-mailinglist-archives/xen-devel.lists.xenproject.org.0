Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8070E3E8EBD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165791.303025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWa-00049L-N4; Wed, 11 Aug 2021 10:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165791.303025; Wed, 11 Aug 2021 10:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWZ-00040K-VE; Wed, 11 Aug 2021 10:31:51 +0000
Received: by outflank-mailman (input) for mailman id 165791;
 Wed, 11 Aug 2021 10:31:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlRe-0002Qj-H9
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:26:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a308062-fa8e-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:26:08 +0000 (UTC)
Received: from AM6PR02CA0007.eurprd02.prod.outlook.com (2603:10a6:20b:6e::20)
 by PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:26:02 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::d2) by AM6PR02CA0007.outlook.office365.com
 (2603:10a6:20b:6e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:26:02 +0000
Received: ("Tessian outbound 8529ae990a93:v101");
 Wed, 11 Aug 2021 10:26:01 +0000
Received: from b47833e060a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 486DFEB5-3FA9-44D3-ACBC-B81E404EA8F5.1; 
 Wed, 11 Aug 2021 10:25:23 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b47833e060a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:23 +0000
Received: from DB9PR06CA0020.eurprd06.prod.outlook.com (2603:10a6:10:1db::25)
 by VI1PR08MB3901.eurprd08.prod.outlook.com (2603:10a6:803:c3::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 10:25:21 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::96) by DB9PR06CA0020.outlook.office365.com
 (2603:10a6:10:1db::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:21 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:21 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:08 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 Aug 2021 10:25:09 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:06 +0000
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
X-Inumbo-ID: 8a308062-fa8e-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGeH1SM1ROZ3KKy1kyx91+XnuUZdgjTfuLm34BheG1s=;
 b=xVtSh09tZM5DeaRSF76/ukS+CwJYT4O3RLztNDPoDsHAouDweOp7z61MfdeNIyhgKKUlq2iEryRQQfbhDW/KQuZCqxTfw90raH9fJZcSPv/Zzg7En6pcT/Vdpobw1CoRig0LD+QCRX12jv6eyLIR2uRBcbpYWwlUaOti+TtmVdw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d6e8adb5d83350f2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJLFbiz0+2S4OvTIOXalxLNggoVsK524UZamCZGpTbMYU660dtmt+BbSDyegth+r/nVGFz/oFFMedLPtpbnyzRWn27IWGYyZQLe6BG/4t91VCpMGaUmCfDFXZSBSytxdvX5s9MEXsK0RbLsUjyvCgj5h+0Ov3jMI4OCPx9ETu1wZOb7KKl01hOB714LDn8gWrEe4l1fb8LpKmiGt1KqEQW5ko4j6Gj5K12ncqsvS+v56u1r7xY8pxjSF2GQykIXLssbmTWTerf9DJhb6KEUCkOLYXUL0I4qfksfXC/pFxeFkTgmk4CLSZ0rRtR7qdA6KNoJZmwbskFpzi5R3QMVZGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGeH1SM1ROZ3KKy1kyx91+XnuUZdgjTfuLm34BheG1s=;
 b=PsZKMbNDKOESPkIsfbNnXau+QFjUOgKAxdNSp+0HCBSl710NeWVVoakOgdX0r3/i5W52BKhK/rN79XaMy3Ss/Dm8F6Pr/0vptYTYXX0SU1bLWsFryhRGBqfB8/kfg2cqh+BV4fE4TN3yvUITS6t0Df/qWvOYGfGcwYdgjQIzodu44CwbyFhEneWZWXRYfaY95sFvY3d9MGEe8L+ZgZ059+KSu6vKHOfL3G/T7Cp5+FcTP95pvlkThoSgmRPKwVbRvp26d7PNBXcKofNTrpBvaFhPAlqB/MKCX1H9InRy1GZluDc6o3ROD3ZH6+KZKWk7cCN8gtzEudRx0E+saQAT+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGeH1SM1ROZ3KKy1kyx91+XnuUZdgjTfuLm34BheG1s=;
 b=xVtSh09tZM5DeaRSF76/ukS+CwJYT4O3RLztNDPoDsHAouDweOp7z61MfdeNIyhgKKUlq2iEryRQQfbhDW/KQuZCqxTfw90raH9fJZcSPv/Zzg7En6pcT/Vdpobw1CoRig0LD+QCRX12jv6eyLIR2uRBcbpYWwlUaOti+TtmVdw=
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
Subject: [XEN RFC PATCH 15/40] xen/x86: move NUMA API from x86 header to common header
Date: Wed, 11 Aug 2021 18:23:58 +0800
Message-ID: <20210811102423.28908-16-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2f0d2cf-9192-4a18-45e6-08d95cb26b28
X-MS-TrafficTypeDiagnostic: VI1PR08MB3901:|PAXPR08MB6969:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6969F0335BE08BC809EC61989EF89@PAXPR08MB6969.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HiPW7Kbzdby7W47tWGyG4WhXOdKENTp0OMW3E9xVQlDTku94lkwiM+d5FY8a/WfXOtKYNF4ncRXjz2XlUDheiuZhQaB+gBD1U2H+2BYbuwjTOnod4Oh95rz1bs8Ui+ubdPzHd6yUKLUUZeysXveGqebHa2mRsPSdto221K1SpT17HOqzFZjbV1ybaFdjWzqzvpVu38wQxxi+2J7zh2lppiNsA2lgOHiMkP+KJvrWu4DDTCsbD7wsGF9hMVhdE6dGpXxX5IrUzT+9SvdYOymycVn4T7RObRU9xmvspH6JP1Mieub4Gy/crQ6VECpR2jGMB5pC46EVxQa194VEO7Kkk69tDo3OGQ9ZTHo11b5/jbID3cnx/z5tvNAs2qEc/VwHu53GT4oNlJ/1zll6ucZQNyM+0xWwnzHk9ffVYF9lcTSW60QUcLrDfiD3DbFu79+740J6UgCnE+XDeQvX0U0bCx9Dizix6A0a/psfhgOfb2VeXcY3fm0VYLjTMwAr++qNOQph0KWGSLUY/PPqQWn6gRiDAZ7PQDgp4MCoG5eLC7DR2MbsTPIOAMLnICOiEHMjAcm0yzaCzlU5NlS3YDJWfLeZO+XexqSwMRw6yUtoFKD6TLyxBeq9jvkuWzSMLLMIz6e80JE9T6GxUloATeUuWY21neE523Rl9NBpl7QBmZ0s3lot2gOVjGUm1j7Fu9imy4jM5SjQcfSXmnQ5cMIVHAmr1Z0x1YtFKBxle8cq+rhoRiA+cSjX2BZ7gUihmIOgpt2Q7BCClZFQ85nK1ARU9TEW2VA1HbA/8biScjw8E3g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(136003)(36840700001)(46966006)(110136005)(356005)(47076005)(44832011)(70206006)(7696005)(186003)(83380400001)(316002)(36756003)(2616005)(1076003)(70586007)(8676002)(86362001)(81166007)(82310400003)(2906002)(478600001)(4326008)(82740400003)(6666004)(26005)(8936002)(36860700001)(426003)(34070700002)(336012)(5660300002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3901
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e018031b-5ed4-4a7f-90ed-08d95cb2531e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5xBQpIJmVi2pgyjabR2+4HCUYVJRt6jYMJWhkJ6ActgRQP3RicJ7CmoR16VTCLzWaV+LMT4Mv2CNuTBNkSuEkcO6XiZhPa7stGp4la/0w1AhEw040+pA3sQy7Zzda8mC69T7NYQGzjL7Jx3HKVUJNOMHC0eJlv4hqFxsuSokV2wX/e3f6hx/ozHGBp7w0yk6NwHcLbh2QLmmijbXSVCSPDykDGHgX9utL0JTf0ALVvYNcsobwbIEDTuq6a2/EsfBgLKIE/jW7NlT7AERj/F71rUbHj2DLe3WR5GcDKShnRPI23dccbaARguX1Bew6IM4ZYajDILzK+mW3Y8V1KrYlOMplqyuSrEmoBbYT7inSUtHTbhrjt4cRxp4iheEiQYN7ZNL4bGSZmHSRukFBPlJPMOh35Hc6UQDJHqEgKT1amNWPHdPRXtYy9HlkTM0VZ8fhAqCq0tcWIChjuygqisq1EUrho40M69sTuoYC5QiSPrU/v41NBXxtkarefxV5abf0i36dnf10oGESzuGBrrE7Hw9ZRABbArCrz8K1IST9MLdma0KuWTUHGvlSAhynOPNpHXusIqdM2eQMofW/+/qsR8w1KQPVg1jOrscG7WJ/zQwRBkYPoVv2beEwkeLXKbmf0xoFNlY8VykUouP4nZdtE9bJaO7l9Zkbvkvl2QlFf4qyy6SnRcOOvqZn5/Ue9v3Cr6wvVR2D5uufKPkveTl1WTfNvGEvqE+b7n/YXiXPBg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(346002)(136003)(46966006)(36840700001)(2616005)(316002)(426003)(44832011)(1076003)(82310400003)(36860700001)(110136005)(47076005)(5660300002)(2906002)(7696005)(478600001)(186003)(86362001)(336012)(81166007)(70206006)(4326008)(8676002)(83380400001)(70586007)(82740400003)(26005)(8936002)(36756003)(6666004)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:02.0841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f0d2cf-9192-4a18-45e6-08d95cb26b28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6969

As all functions and macros that depends on these NUMA API, like
clear_node_cpumask, have been moved to common header file. In this
case, we can move NUMA API from x86 header file to common header
file, and will not trigger the symbols not found error when
functions in arch NUMA header file depends on the symbols in common
NUMA header file.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/asm-x86/numa.h | 13 -------------
 xen/include/xen/numa.h     | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index 69859b0a57..5a57a51e26 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -9,14 +9,6 @@ typedef u8 nodeid_t;
 
 extern int srat_rev;
 
-extern nodeid_t      cpu_to_node[NR_CPUS];
-extern cpumask_t     node_to_cpumask[];
-
-#define cpu_to_node(cpu)		(cpu_to_node[cpu])
-#define parent_node(node)		(node)
-#define node_to_first_cpu(node)  (__ffs(node_to_cpumask[node]))
-#define node_to_cpumask(node)    (node_to_cpumask[node])
-
 extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
@@ -28,11 +20,6 @@ extern void srat_detect_node(int cpu);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
-static inline void clear_node_cpumask(int cpu)
-{
-	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
-}
-
 void srat_parse_regions(u64 addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 3972aa6b93..cb08d2eca9 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -22,6 +22,14 @@
 /* The following content can be used when NUMA feature is enabled */
 #if defined(CONFIG_NUMA)
 
+extern nodeid_t      cpu_to_node[NR_CPUS];
+extern cpumask_t     node_to_cpumask[];
+
+#define cpu_to_node(cpu)		(cpu_to_node[cpu])
+#define parent_node(node)		(node)
+#define node_to_first_cpu(node)  (__ffs(node_to_cpumask[node]))
+#define node_to_cpumask(node)    (node_to_cpumask[node])
+
 /* Simple perfect hash to map pdx to node numbers */
 extern int memnode_shift;
 extern unsigned long memnodemapsize;
@@ -76,6 +84,11 @@ extern int numa_fake;
 
 extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
 
+static inline void clear_node_cpumask(int cpu)
+{
+	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
+}
+
 #endif /* CONFIG_NUMA */
 
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


