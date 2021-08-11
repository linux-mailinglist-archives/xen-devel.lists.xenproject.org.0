Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13103E8EBE
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:32:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165788.303020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWZ-00040l-Ge; Wed, 11 Aug 2021 10:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165788.303020; Wed, 11 Aug 2021 10:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWZ-0003n0-0u; Wed, 11 Aug 2021 10:31:51 +0000
Received: by outflank-mailman (input) for mailman id 165788;
 Wed, 11 Aug 2021 10:31:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlR2-0000BQ-Dm
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:26:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.75]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2fea898c-6117-4051-a62f-be0923dfb5ab;
 Wed, 11 Aug 2021 10:25:31 +0000 (UTC)
Received: from AM6P195CA0027.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::40)
 by DB7PR08MB3660.eurprd08.prod.outlook.com (2603:10a6:10:46::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:25:29 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::31) by AM6P195CA0027.outlook.office365.com
 (2603:10a6:209:81::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:29 +0000
Received: ("Tessian outbound 79bfeeb089c1:v101");
 Wed, 11 Aug 2021 10:25:28 +0000
Received: from 37402230e43f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5143B55B-DD05-48B3-A03D-F514DDF2D533.1; 
 Wed, 11 Aug 2021 10:25:22 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 37402230e43f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:22 +0000
Received: from DB9PR06CA0005.eurprd06.prod.outlook.com (2603:10a6:10:1db::10)
 by VE1PR08MB4800.eurprd08.prod.outlook.com (2603:10a6:802:a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 10:25:20 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::a0) by DB9PR06CA0005.outlook.office365.com
 (2603:10a6:10:1db::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:20 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:20 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:03 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:01 +0000
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
X-Inumbo-ID: 2fea898c-6117-4051-a62f-be0923dfb5ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPe+D+dpN9Fb/d8ivHIUPCK4Pbt5qBhS048EZq+FnSY=;
 b=IdMIZQa27Ls3NUHN9xFQ8mw8ojSegJyxHrHwinmkNTTQ563Oqad2qKMt5/0BAsYLSYMjzkL1O3KDk5NKLyU0jcmw1GtzjXbJR5X+LSDILV/2QaGxgwDo3FuuswVt/OyvMZ2YthPqp+pvz4r17o3bhaagrqMp7CqZ7DzUjcAogW8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7657802012c66ae9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVnuvMI7InkTFqXmlEVZYqi3gbZjTuuyM/9/bMvkIhz/jWU4GMxezyWhFoik7vAlUwWmeiLgsjA4HIilMyiyrtBA4C/xwroNq8PapCFApbfB5MJoCyn1mkmZ3karvY03oArqkHRhrW8OKN3Arx0qT3WVMOIemaNfpk7CfPKawHu3zLS7exxy8WGAr/XdzqPgoHGfrxZ5rFyZRCO5mURlYdO6K+4YmlBoGT6xQfY1VIFMz05bEo954a/W/Sa4/X2rNbrkKHy45HIyh4Lp6Gb5sREtZ0dToIS+anAu4d29Sjqz0x3T1bxpYAbdty+NXbtrCcFO2h4LY0Emsjg4MFkemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPe+D+dpN9Fb/d8ivHIUPCK4Pbt5qBhS048EZq+FnSY=;
 b=DTXPJbIk+kIU1FH71xak81YQlJtI7vaaYbi0MQa390i0C37ES+i/5kx1a9dC24NnO3RD0vR3/TRM4M4Cc0nVULMcE/ATJzkj8Ir2oxqrbgk4kQ9IlLvab3PWQ28gDbaQw9tywhZoeL+cOZTrYdtGG8G+0FKmLZUefezxvIjHdRTVovszcTc6ubyLE9eUWhrMaX/67So8hS1GxGlyoj6eSBGT8V22UYJY1JQTcFgscD0p2twN4IYBlHndFRgkqhOQ2On5frisaeiU5dPXACFqJrfKVs0m0wlwXDuX/HjKX6rhSek+49OpKz5dTPVQaFsEkEPQ1Yx+2dCY0K9MX8lEnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPe+D+dpN9Fb/d8ivHIUPCK4Pbt5qBhS048EZq+FnSY=;
 b=IdMIZQa27Ls3NUHN9xFQ8mw8ojSegJyxHrHwinmkNTTQ563Oqad2qKMt5/0BAsYLSYMjzkL1O3KDk5NKLyU0jcmw1GtzjXbJR5X+LSDILV/2QaGxgwDo3FuuswVt/OyvMZ2YthPqp+pvz4r17o3bhaagrqMp7CqZ7DzUjcAogW8=
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
Subject: [XEN RFC PATCH 13/40] xen/arm: introduce numa_set_node for Arm
Date: Wed, 11 Aug 2021 18:23:56 +0800
Message-ID: <20210811102423.28908-14-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e081f2a6-e6f1-406c-9330-08d95cb25783
X-MS-TrafficTypeDiagnostic: VE1PR08MB4800:|DB7PR08MB3660:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB36602D69094CE4C520C5A9129EF89@DB7PR08MB3660.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 At26H3rHHA/MB594iKXFV8dz7Zu2Jy5WttOeGyO2vH8Ctv9kvCfwqQXP3cqjvNaw1R4z7MU9FAAiCGvXumKhEPxVxVOj7jhFjIn1joEDgw5/t7/tbm4lllIrs8qsp3QlyEKcy8mGPbOc51jiR7mK+D09oYDWUVKAMpByUZemM+D0/2ODEE2qDTDMvgWDZX6yFWWgJ0NelA29U8PVlh5SSIOn1s/DnW95l0IzdZYUiQZUrmV2Md4w7njxR44BlTps2U9wnRNdy3tpbWl72ysS4vBNz8KYRCg2eTQx/hH6AqWPR4KqNIZd8V9LlCMt3s6Wm66k8dZnHJLy8XJDnjrGpJ1djcWqq1n4k0Bta9JC8iip0g5waGnQYJbT/rMH/ymYZlbfkbJs7gEuaB3jhjsWeFvMMvuNKVhfT+C49QiFzPcFTVakKfqA/uIwDklF/5LVn0POZGGMdpfR0Ej+rewbENLldy1bR9YFaZDP1mRVhfIP2g25wOBbA/KBTwCJLfcm7D6cQoyAYi/lVp+O9H+jnXGMCvSbMpV1w2UMTeD72M+kS4BbblR208OD1XwuAEcMqXPJJ/l6B2M1s/HEVPUiM3mxvKba36EVpzrtDBX42rZqsaNrv06wjtj85CIcXxeFjET8Sducp2eZU5b70yaKzHQ4GQDNuY5Dg68aRl7MK6RbHcZxHaqx6A+0ept2aFmEZ9NMugIipc8uDjyxecbKPLUCbKbcrK9fVM8kCuL4loi6taCaesHzmQcga3VVb1ti/ZUC8CG93GgGTVvxRgh+EurijdClqNbjhXs4TtecmubuVOaxR23dDOyiraYC8HJZDakojjsj/agPa7s2zjUaAZemoKYwDhe9OBvP8pArJuC7Na1iavVNlq0h6xE6dklrSVNDjlbKEB3rEo3OKuM5JQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(34070700002)(7696005)(81166007)(83380400001)(70586007)(110136005)(2906002)(36756003)(316002)(47076005)(70206006)(86362001)(36860700001)(5660300002)(8936002)(186003)(1076003)(2616005)(26005)(44832011)(508600001)(4326008)(356005)(6666004)(82310400003)(336012)(426003)(8676002)(2004002)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4800
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0fbeea89-92b7-4eb2-03d4-08d95cb25258
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0eUBLv3lfkNc/OS5fHHq7EJWprhTG5s0YAVWcBrPFGFW+cDNmWJcd08EpjXiB5DGm1u5nrn6FKd0nctLaoxonFKBszTahdW2ej3aguvp2XYiWLDgQaINwYllZmUX2HNMO/+dbhFljgM6tJPLbn/bA3XaQjxjgoxMNh2rwau5gdcwwPSCJUmaZUnO4YOANrjUJn9LXmtL7/oA6fUF+2B6alhkXXIparPhwNOXd/Kpswl3iMgtDu3B/Lg6hVRsjFrBR3Lfizgir0cE1oMsmPW/BKwaRjLeN09pSoh9Dkm3lO9sKrwNJ/qWOKPUbl4TS/5eqx0+wUyUWgxo1f5DgoBSTn7FeNiEJsrL5dooO6114hQVPoaro01dnFDHUPL9W5A1sFBEvDq4T4VCikr9DGjZfHG5VD6fmXI41NDihN39Xeg7ZFAnFbaV/zPUC19ER0GdeP/1eXgD0CE7k4/UuJI5AT+m9LJUkl4OLcLbl+Vf6TD4fxyNAvYE4FiaMBTqLuACQ188dPyXQ5mgaTBkjDbijfOSIMV9AwcNbkJApWjbUIyvTbh0lZowcX8Ysy2Ahh/Xi8MwqWyva0imW2BuAJil1B3zr5zRNRLTRUa+EESQzvXNRQhVZAmXD7QC8uIPFCGtzBVqGK+Fe7Y3kYkK5rk8r9VH1l7hq7m1NXBvIo6O/zaCRTWpVMJtCTEb5E9FIuoPalB4HTtjPee28Mf6cvQramjhs1T3heZj2Cdmq/TS+8HZUbv0SpUORDm9nFaCF/9kmZ5+Te7ENWWSHYm0sC7m3g/wLf7InJrL854P4ypAMgrsPyLDR8bPoEubWel3531etNAbofE/Tf7rJ5zvfnB9Yg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(6666004)(82310400003)(44832011)(86362001)(36860700001)(70206006)(36756003)(47076005)(7696005)(4326008)(2616005)(426003)(81166007)(70586007)(26005)(2906002)(110136005)(336012)(316002)(1076003)(83380400001)(186003)(8676002)(8936002)(508600001)(2004002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:29.0622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e081f2a6-e6f1-406c-9330-08d95cb25783
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3660

This API is used to set one CPU to a NUMA node. If the system
configure NUMA off or system initialize NUMA failed, the
online NUMA node would set to only node#0. This will be done
in following patches. When NUMA turn off or init failed,
node_online_map will be cleared and set node#0 online. So we
use node_online_map to prevent to set a CPU to an offline node.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Makefile      |  1 +
 xen/arch/arm/numa.c        | 31 +++++++++++++++++++++++++++++++
 xen/include/asm-arm/numa.h |  2 ++
 xen/include/asm-x86/numa.h |  1 -
 xen/include/xen/numa.h     |  1 +
 5 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/numa.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 3d3b97b5b4..6e3fb8033e 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
+obj-$(CONFIG_NUMA) += numa.o
 obj-y += p2m.o
 obj-y += percpu.o
 obj-y += platform.o
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
new file mode 100644
index 0000000000..1e30c5bb13
--- /dev/null
+++ b/xen/arch/arm/numa.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Arm Architecture support layer for NUMA.
+ *
+ * Copyright (C) 2021 Arm Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+#include <xen/init.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+
+void numa_set_node(int cpu, nodeid_t nid)
+{
+    if ( nid >= MAX_NUMNODES ||
+        !nodemask_test(nid, &node_online_map) )
+        nid = 0;
+
+    cpu_to_node[cpu] = nid;
+}
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index ab9c4a2448..1162c702df 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -27,6 +27,8 @@ extern mfn_t first_valid_mfn;
 #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
 #define __node_distance(a, b) (20)
 
+#define numa_set_node(x, y) do { } while (0)
+
 #endif
 
 #endif /* __ARCH_ARM_NUMA_H */
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index f8e4e15586..69859b0a57 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -22,7 +22,6 @@ extern nodeid_t pxm_to_node(unsigned int pxm);
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
 
 extern int srat_disabled(void);
-extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 258a5cb3db..3972aa6b93 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -70,6 +70,7 @@ extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
 
 extern void numa_init_array(void);
 extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
+extern void numa_set_node(int cpu, nodeid_t node);
 extern bool numa_off;
 extern int numa_fake;
 
-- 
2.25.1


