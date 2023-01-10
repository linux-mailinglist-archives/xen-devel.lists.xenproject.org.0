Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2F3663BE6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474433.735644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOi-0007IN-QE; Tue, 10 Jan 2023 08:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474433.735644; Tue, 10 Jan 2023 08:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOi-0007FL-LW; Tue, 10 Jan 2023 08:54:20 +0000
Received: by outflank-mailman (input) for mailman id 474433;
 Tue, 10 Jan 2023 08:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAOh-0005s6-EJ
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2044.outbound.protection.outlook.com [40.107.7.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e05ba28-90c4-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 09:54:18 +0100 (CET)
Received: from DB6P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::16) by
 PR3PR08MB5722.eurprd08.prod.outlook.com (2603:10a6:102:8f::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Tue, 10 Jan 2023 08:54:14 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::5b) by DB6P195CA0006.outlook.office365.com
 (2603:10a6:4:cb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:13 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132");
 Tue, 10 Jan 2023 08:54:13 +0000
Received: from e119c51c4a8a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 51145894-0177-4CE7-B3C7-5A664C129EB9.1; 
 Tue, 10 Jan 2023 08:54:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e119c51c4a8a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:07 +0000
Received: from AM6PR01CA0070.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::47) by DBAPR08MB5830.eurprd08.prod.outlook.com
 (2603:10a6:10:1a7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:00 +0000
Received: from VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::6e) by AM6PR01CA0070.outlook.office365.com
 (2603:10a6:20b:e0::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:00 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT017.mail.protection.outlook.com (100.127.145.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:53:59 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:53:58 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:55 +0000
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
X-Inumbo-ID: 5e05ba28-90c4-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmlC5wFOoSJu90l/OLm3xFQ5JzZOfdDA0L7vWkxPHDc=;
 b=Sy43EBjYcLq8aF4up6RexB9Ji6rFuvibh5nUWFOJsnY6cMDnUZD8UnFjsuXT0/DrtY26YjebUFNJh9QhblDTyKkj6lYjnAeOVZcFBIK1tFoQ8+/ZawjAc9qkDtl47S8Zxj2v2D20Cu5YlLpgAZeAmblg4Hd9qY58nARxQ/cu6Qk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 598d340d54c7d6d4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEGZGb6/zZt5fGplWpgxZUBCQ+6cLrMMtFP5+0Kuh0mqcjdk+0sE0z618V/BSDCjwqx34pqXB0WJTk7lUnsvJAvWlIqdWe/OVwU6qWt83e1WcD+oxQTeo3v6KA0SMTHo9fJzJ2NmqEEfDmhIvL0+e4ErSZU5Em+PYtPz7P7R+3Zs/s5jyOfDN1f3BtIqkKzEW/c3RxCDUZ6fJxSb2yIwFeeeriU1xrZQzcIGsEIu5gL67tS7h6vpioNoD/xEV+loIUFnc62yMQVEJTgnM1/qfTquG4luUk/RRkgPXL6BTZ1Uxaidwd+kPoJsximRbXvajTq5NA4GMJpcrF5uvxzS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmlC5wFOoSJu90l/OLm3xFQ5JzZOfdDA0L7vWkxPHDc=;
 b=ZF93L2XywmOEbBeFqAwIAZy8HIv1U1Fgqr9DS5hkQC1o4Fl/4kIYGDBznbqwFoHlfmo3tzBP1ZY7reQdTJZldEjgp0clozdoVxGdlcO2GqFSHDDOqdZAhTMfdO0F+ahyQinWuKPJr8nHwJtYDmcv2avIJJ5KyVlReoseNKBR8ydle+LieZDR2EXHjIwGKfZuoZ5VVyAehrnGutzvcrQmpsrktlbb4uqXv4Thep5eHwi5mqufS/SW7zcC+7EDA5qK40ReqBbk3IGGDtg0kwzMP+oJrJ5CUWxEHtPJgyyvx7TyXKsxo6PiHr90e0NiygL7bnqq+u7jkstMIXeMZU+Nxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OmlC5wFOoSJu90l/OLm3xFQ5JzZOfdDA0L7vWkxPHDc=;
 b=Sy43EBjYcLq8aF4up6RexB9Ji6rFuvibh5nUWFOJsnY6cMDnUZD8UnFjsuXT0/DrtY26YjebUFNJh9QhblDTyKkj6lYjnAeOVZcFBIK1tFoQ8+/ZawjAc9qkDtl47S8Zxj2v2D20Cu5YlLpgAZeAmblg4Hd9qY58nARxQ/cu6Qk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 05/17] xen/arm: build NUMA cpu_to_node map in dt_smp_init_cpus
Date: Tue, 10 Jan 2023 16:49:18 +0800
Message-ID: <20230110084930.1095203-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT017:EE_|DBAPR08MB5830:EE_|DBAEUR03FT036:EE_|PR3PR08MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4cf88b-290a-448c-d48c-08daf2e83f7a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SI51p/Vk9meZPDmXBPqoFHt6ZfyI+gLA1ABYTrtNS/85Ed1RuiafFjLa8TzMtnbg+IQ/iKGoUhM8y7MzbJqqzV+lZx9+xlI9GVOVbdG+rEwZo0mYO9jJkkPaKy9RIKo2IF82ejktwJmEgnpzHaGr7FWnOUSTeemIBZdmryOIP7K6ku4RsGZo1lRqiSsVE7K5zFmbzK3V9430c+b8iepZ1CGAPtkh7XnQ8f6m2MzjfY/EX01I97NemBiTlCrdNXC/qt6NPQYsqiMmsYVFn8YRyqtRuZVsdiqql2ArAlUC+mvKyBPnZRGHozB1j0cGxa+ul+Vtqt9BEYrz8V3Q6LBJNWLzCIuvLEUWBxxsCwpv0ENf2KfGz7OzXjkhkQ6E8j6fkWIqw5r+zVnbgA+aAfR4p5cq+owJsGTA8naXLErTiS+tqMFV6Dg9BPssAfwDW8EVt3zgYTPVjeAD5E4C+oXHgAJFJymN4pW0ds1I+CEeFx1hhf7GI+nNwY1r5GUzAS3lAFrIkcyZbJ6zuc4ktsK9gObITApriMVUcZwQnMdk6nc+5fk+2/Ay7bIBWT9fGpaRbJQnJ7UX5oQR4RsoaFl/ql/Y0WR9IbE9wIqWYYvLZ2X8V1D3TRSAk11qoBP90ZSW46kdo0Na2v2GuQ6zdpchMP3SCmlYjt8KvC83cTImtr72gdQ7+mq2w0jB3ccMsXMMKxfAm375n6+/v4vrv2YztQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(5660300002)(44832011)(8936002)(41300700001)(2906002)(36756003)(54906003)(83380400001)(8676002)(70586007)(70206006)(4326008)(316002)(6916009)(7696005)(26005)(81166007)(186003)(6666004)(86362001)(478600001)(336012)(1076003)(2616005)(40480700001)(47076005)(82740400003)(356005)(426003)(82310400005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5830
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a57a722-ad5f-4226-b963-08daf2e8370f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lVQCwmOzH206DPJaw9vKdCl72MM1bNLoqu86R3ShS2+5Gf/tKqLwZLYp10Xk3oWlocpPaEMmhS7ZWcOi8ShIXMzqgk5nUrJYys9CDQNuQ/VoGgfb0HHnk2cNALPQitqNnv2qFMdndJNjAe2byaVIWljeyY6OVh/FGljnowLupVelDdwE5TxQlcZFIEDP7wVzXaC1p+aADa7bxyLszjTu2lQAyXlOwnOV201YNe4PzBcm+YDJTOmkP2G8asAo8XL3b87jntriroiLjLqrCCpIcxip+tjyM1A7K/iIow4zgDbNrRvRvre0WeOKj4qnTMwl2ZYyDExFfKJiwo/uc1F/91OoY1YfGOBbTZwccDxhNMEVOTljCeo74j5gswZn3DkZymZPT+Imbc8EzEC2cJMkdPbQlJqGz5yo+8X3Y6Y3kCAI1WZrE611/LduHtPCSVd1DxN4uLcST/nJyLSpq9JsPMoESZ2B9tLP9OWK9X/OUEOa/CGe01mAtdEd+oRsIjxjX8SjjcSq0iXhfCNjaXxo50u+bFqn7k03fDVpq9I1vQ901AZ/1rrhOmEBH1BigVj/PEPg8elmN7i2oDZJ0J8ykHoPuyppqml/qHINr888cp3B0X3Q4sG3J0vtNm5k4PrAX31XcfzKxI7Xca5ShayBGNColbB1t4IjYxWda0QsdAf5hwQg91bGz4uzSssBBkV1Z69svS7AGaOtPzisAype9Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(44832011)(2906002)(5660300002)(70206006)(36860700001)(8676002)(41300700001)(7696005)(8936002)(36756003)(70586007)(83380400001)(4326008)(316002)(86362001)(2616005)(82310400005)(426003)(336012)(6916009)(47076005)(186003)(40460700003)(1076003)(40480700001)(478600001)(81166007)(107886003)(26005)(82740400003)(54906003)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:13.7539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4cf88b-290a-448c-d48c-08daf2e83f7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5722

NUMA implementation has a cpu_to_node array to store CPU to NODE
map. Xen is using CPU logical ID in runtime components, so we
use CPU logical ID as CPU index in cpu_to_node.

In device tree case, cpu_logical_map is created in dt_smp_init_cpus.
So, when NUMA is enabled, dt_smp_init_cpus will fetch CPU NUMA id
at the same time for cpu_to_node.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Use static inline to replace macros to perform
   function paramerters type check.
2. Add numa_disabled to gate the numa-node-id check for
   CONFIG_NUMA on but numa disabled user case.
3. Use macro instead of static inline function to stub
   numa_set_node.
---
 xen/arch/arm/include/asm/numa.h |  4 ++++
 xen/arch/arm/smpboot.c          | 36 +++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index dbdb632711..3bc28416b4 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -70,6 +70,10 @@ static inline bool arch_numa_broken(void)
     return true;
 }
 
+static inline void numa_set_node(unsigned int cpu, nodeid_t node)
+{
+}
+
 #endif
 
 #define arch_want_default_dmazone() (false)
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 412ae22869..5ee6ab11e9 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -118,7 +118,12 @@ static void __init dt_smp_init_cpus(void)
     {
         [0 ... NR_CPUS - 1] = MPIDR_INVALID
     };
+    static nodeid_t node_map[NR_CPUS] __initdata =
+    {
+        [0 ... NR_CPUS - 1] = NUMA_NO_NODE
+    };
     bool bootcpu_valid = false;
+    unsigned int nid = 0;
     int rc;
 
     mpidr = system_cpuinfo.mpidr.bits & MPIDR_HWID_MASK;
@@ -169,6 +174,28 @@ static void __init dt_smp_init_cpus(void)
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
@@ -228,9 +255,13 @@ static void __init dt_smp_init_cpus(void)
         {
             printk("cpu%d init failed (hwid %"PRIregister"): %d\n", i, hwid, rc);
             tmp_map[i] = MPIDR_INVALID;
+            node_map[i] = NUMA_NO_NODE;
         }
         else
+        {
             tmp_map[i] = hwid;
+            node_map[i] = nid;
+        }
     }
 
     if ( !bootcpu_valid )
@@ -246,6 +277,11 @@ static void __init dt_smp_init_cpus(void)
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
 
-- 
2.25.1


