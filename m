Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D03D415DCF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193831.345381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSb-000222-NA; Thu, 23 Sep 2021 12:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193831.345381; Thu, 23 Sep 2021 12:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSb-0001y6-HQ; Thu, 23 Sep 2021 12:04:17 +0000
Received: by outflank-mailman (input) for mailman id 193831;
 Thu, 23 Sep 2021 12:04:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNSZ-0006xV-OJ
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:04:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.46]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54ef45f6-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:03:58 +0000 (UTC)
Received: from DB6PR0501CA0015.eurprd05.prod.outlook.com (2603:10a6:4:8f::25)
 by VI1PR0801MB1744.eurprd08.prod.outlook.com (2603:10a6:800:5c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Thu, 23 Sep
 2021 12:03:53 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::ed) by DB6PR0501CA0015.outlook.office365.com
 (2603:10a6:4:8f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:53 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:53 +0000
Received: ("Tessian outbound 173d710607ad:v103");
 Thu, 23 Sep 2021 12:03:53 +0000
Received: from b65a2952c961.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C7961B90-1680-4FBB-BC9A-94D410AC05B1.1; 
 Thu, 23 Sep 2021 12:03:42 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b65a2952c961.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:42 +0000
Received: from AM6PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:20b:2e::41)
 by DBAPR08MB5846.eurprd08.prod.outlook.com (2603:10a6:10:1b0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 12:03:40 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::6e) by AM6PR05CA0028.outlook.office365.com
 (2603:10a6:20b:2e::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:40 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:40 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:37 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:03:36 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:35 +0000
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
X-Inumbo-ID: 54ef45f6-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4IUu2+SwohNK8zI3PdrUOxfoLsLYpgk2ynTlN2bdKg=;
 b=EjDf5zi/Z4tc5ADYbjfC0Ds++dmooCIotDopvA8DqDVXfFgCjNDmCuNbdF4pRSgGcG+ZLkMpUF5qKrKGJ9JcDibbjdUfS5k9Vu1V4c6w7DWg8ejK/8Y6nd9YZ3wazAx7UvpY9z0688EOQv4Y2J9d26xcZBFt30gdXXzbmIzUiTs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91fc362807295dac
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUPfU67MOThvum4MqrB4LDEr0CsJPB0GaNUHxOhO+iDY6ZoTFWLxhU30gL8OedBww41a8cjrIAdZj4/+H3hTaCl67PlWVSTtFMtD9MtTpVVgTBn8+VUjapjTERJNGvGN+nHkX/lqqwxnUiuVYfo5MfPupOI95Mm8gwyiUFQFn6Q5F+d4C2DyHSgKE22rUjavKYUqljjBgQ+9t349TqmRKr7jlAtk3EI6hqsNm7Cv9teicSfSifvNs3XgR3e/zD/LYQOJMx6m2omL7A0Y16MHYlFuzhpm32XNLmqRSoXZNuDbbuw8RHFdHN7v3UFbVYBmEfWopVTuPyAwARXHHwPDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=r4IUu2+SwohNK8zI3PdrUOxfoLsLYpgk2ynTlN2bdKg=;
 b=fy6femylwVDfk4J9U7BlSfQguQgIKrJEN0GZ42AhquyzhmS0nNXoov35Ygl+hm2yAbOxkW7qqlW+7gcMu+QGRhnNmpVvrYmeaTXrlY4C4O2G0TR+BkdoYDMn21Bk1fonB59MZvFTrsZ2pv9AoXENAm5ZdRRty0BwA6EZXaBsqRFUjKYnRNAI8c3xcxYPvZpfgdEY7i6KdoM3Yaq8WpQRFGZK7SAS3pEPxnw08saS6ButYYufZkDnBDAggbfqIwO27bBdy2epbWKk3VqsFAiNX3zzY08X36NtabalxMLqZn6N7OvgPTItvnK3LttI99J3Xb2VxEqSpdfyl42R5hbLgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4IUu2+SwohNK8zI3PdrUOxfoLsLYpgk2ynTlN2bdKg=;
 b=EjDf5zi/Z4tc5ADYbjfC0Ds++dmooCIotDopvA8DqDVXfFgCjNDmCuNbdF4pRSgGcG+ZLkMpUF5qKrKGJ9JcDibbjdUfS5k9Vu1V4c6w7DWg8ejK/8Y6nd9YZ3wazAx7UvpY9z0688EOQv4Y2J9d26xcZBFt30gdXXzbmIzUiTs=
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
Subject: [PATCH 13/37] xen/x86: decouple processor_nodes_parsed from acpi numa functions
Date: Thu, 23 Sep 2021 20:02:12 +0800
Message-ID: <20210923120236.3692135-14-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a30b010c-b72f-4bff-d840-08d97e8a3689
X-MS-TrafficTypeDiagnostic: DBAPR08MB5846:|VI1PR0801MB1744:
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB174403D036B709FD2504658E9EA39@VI1PR0801MB1744.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FO4jxbgM/yNpujNsJKRzt70AqOeRUqUE4m0Jcw4z8lMARTNioC6noYT9NE+jd4jCqiWg+y7Dru/pPOWlqVs+dXcDcTdfUL7xCQ3DTapMuD6a9J6/wVVkZP+XqtGF93fV3zbOsPKVygqOo4ClDgvg2sX816TRZN1ONSazwVqwrJniEKAj32Xu5jGGczwrJ4Fd1MUOa84zO1mQpjpZercexw8KO2Bjbmvg2zZIMeC3b/o/ix1aAlJAtZvKMjF70Ela3RS9VPZS8IaNNADrXsRuhQ9NGccKwMXpq3G1AW4hHTyxxEAHWO8i3cqnP1Aij5Xs/WJYloOOb6STwS7gIK3PoeJULJ4iEE2NGkSLxrumkyrzMDCR5ceGxr7aqyVDxULM5NLWGlhzBwuU1+CTGDP4/IJnEhhLhE9pTEqbWpYsr5VUDT3MdTspIAIic73NAgNnl8HIw5ILEWpuM16rTA4diijAKLTbwF2IAp33kzrziBbGQsA2IQC/4wwTMiXbafpmCBUSx7Pf4d/h3xZMnCnUuGRCU3FOm2mxlEmrG3K0hhWDMj3S12jGkLya2R/Fl3vn2Gr6uwhagUiq+7HXgnHfzERk44IR0I0zF/dSohKQor4y64gDOG2gSJhGhOpfR92yB2eIyDP3jLabW8an6h34QuWv0nJAfYKqEWQ8iq53ZEjIFpuG4YPofQqS9javgjrOqI7nMUDuFj+XIoGB42eEEw6FopIMc72dXkoGaBxe7hM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(356005)(86362001)(44832011)(83380400001)(508600001)(36756003)(6666004)(8676002)(70586007)(81166007)(2616005)(70206006)(2906002)(336012)(8936002)(110136005)(5660300002)(1076003)(186003)(4326008)(47076005)(316002)(7696005)(36860700001)(82310400003)(26005)(426003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5846
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	022efe4a-3379-42b8-8a70-08d97e8a2e87
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TGlGaLLtZs8qe1Yf7d4+NDZYGhQjlc/ISMVqswE8If63wFUGrLZRZpWoydJX0U0mdzRHIxJLhPVNZ2NegQO56nPMqQTzWRIf2rWUwk/n3rCJlaz287yhAL9ouCi7OncrvL99C4R3EWm2BlLr0Z+lRaEJx+1Pu1llGJ1I2kXr3B87X8Hiqo2YqQD0I6tQba1Fug4vvtAX0EY/v8iFRWyE3blE6mOkHTd9TnMsSZI0Mfa5H/ikE7D/6yyUdHwdewFKPQLBMo0Ds3qFLHPxmwHlgASTIpn3e47Ro61N1z/dTAsFUt7vwOyeKth4qrn5qZJq+raYgj2O0Ul1xkTSJkZ/bmYBkaZqt2oGlxEUXe6ds57aefzNL+hSb6K+4EZLEYOZJkt+cAP+8emIcUnYAA1qmhYvMn/eSUk3HzVgAirET/9X21OBhXgzCh1vVjKgB1dKtwfARS90U37Fer9KdddNH8B6AnWcuMhxR41xAEKhiiG0OgOt4sGUQtWU+DZKlbMot8gbUmDDIYAOYNBPMNwIXA5yh2VufEbjN9TkSy/egEiysaTSF1R/lL+WJBHB+6Ybv5fOrjZxqsLWRa/buOrqFYXHmxIkTF6RaCyyXkJjHvfHUQc5RL5UQy5Cduvqbg0FGGL7f6am9yh+bN/eN+vrvotV2Lc73qJYPjVhij9V5TT2Gz07exA7zUxqOoxGuU1wGav7JojRm9aNi8KjT+8Fhw==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(2616005)(2906002)(36756003)(81166007)(82310400003)(7696005)(336012)(6666004)(8676002)(5660300002)(83380400001)(70586007)(70206006)(4326008)(426003)(44832011)(186003)(1076003)(26005)(508600001)(47076005)(316002)(110136005)(36860700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:53.5136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a30b010c-b72f-4bff-d840-08d97e8a3689
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1744

Xen is using processor_nodes_parsed to record parsed processor nodes
from ACPI table or other firmware provided resource table. This
variable is used in ACPI numa functions directly. In follow-up
patchs, neutral NUMA code will be abstracted and move to other files.
So in this patch, we introduce numa_set_processor_nodes_parsed helper
to decouple processor_nodes_parsed from acpi numa functions.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/srat.c        | 9 +++++++--
 xen/include/asm-x86/numa.h | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index aa07a7e975..9276a52138 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -104,6 +104,11 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
+void  __init numa_set_processor_nodes_parsed(nodeid_t node)
+{
+	node_set(node, processor_nodes_parsed);
+}
+
 bool __init numa_memblks_available(void)
 {
 	if (num_node_memblks < NR_NODE_MEMBLKS)
@@ -236,7 +241,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 	}
 
 	apicid_to_node[pa->apic_id] = node;
-	node_set(node, processor_nodes_parsed);
+	numa_set_processor_nodes_parsed(node);
 	acpi_numa = 1;
 
 	if (opt_acpi_verbose)
@@ -271,7 +276,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 		return;
 	}
 	apicid_to_node[pa->apic_id] = node;
-	node_set(node, processor_nodes_parsed);
+	numa_set_processor_nodes_parsed(node);
 	acpi_numa = 1;
 
 	if (opt_acpi_verbose)
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index 78e044a390..295f875a51 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -77,6 +77,7 @@ extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
 extern bool numa_memblks_available(void);
 extern int numa_update_node_memblks(nodeid_t node,
 		paddr_t start, paddr_t size, bool hotplug);
+extern void numa_set_processor_nodes_parsed(nodeid_t node);
 
 void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
-- 
2.25.1


