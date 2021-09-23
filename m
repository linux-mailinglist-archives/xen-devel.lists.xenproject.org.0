Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A245415E16
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193930.345547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNex-0005Ti-5v; Thu, 23 Sep 2021 12:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193930.345547; Thu, 23 Sep 2021 12:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNex-0005QA-0q; Thu, 23 Sep 2021 12:17:03 +0000
Received: by outflank-mailman (input) for mailman id 193930;
 Thu, 23 Sep 2021 12:17:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNVp-0005KP-6E
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:07:37 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::62b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 491d468a-579d-47bb-8f4f-d7b0ca53fc34;
 Thu, 23 Sep 2021 12:04:30 +0000 (UTC)
Received: from AM7PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:20b:110::31)
 by DB8PR08MB3963.eurprd08.prod.outlook.com (2603:10a6:10:a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 12:04:28 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::a4) by AM7PR04CA0021.outlook.office365.com
 (2603:10a6:20b:110::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:27 +0000
Received: ("Tessian outbound 010023020eef:v103");
 Thu, 23 Sep 2021 12:04:26 +0000
Received: from a55985ad4ddb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EDD24E0F-1EF2-41BF-8A2E-E6A5D197A8FE.1; 
 Thu, 23 Sep 2021 12:04:17 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a55985ad4ddb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:17 +0000
Received: from AS9PR06CA0118.eurprd06.prod.outlook.com (2603:10a6:20b:465::20)
 by DB7PR08MB3756.eurprd08.prod.outlook.com (2603:10a6:10:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 12:04:16 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::b9) by AS9PR06CA0118.outlook.office365.com
 (2603:10a6:20b:465::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:16 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:15 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:58 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:03:56 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:55 +0000
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
X-Inumbo-ID: 491d468a-579d-47bb-8f4f-d7b0ca53fc34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dEtUaYVX87QwORy8SpB1QfVQ6OMtEh5+JCNvdfCby4=;
 b=EpUJJCYL5wAgOIM62xfO32tbLeMHjnUf4FVdUYhAKYwxCo8R0mFoPxT14t/AQ+0q/GyCPVH7MKEdQ+ItQEl6h3I88iJAhpIKDCS+XU7WlFqUuGSvTRTseszDCuuhGtXY5Vch+U7qrOr8FMKukV4/CkIs/cmqe4f1Sb500Hn/fAQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1f3622f63e5f6b3d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOegBsqLDJqcFf/9zDozwwhanjaRYg/F3zPM7mf8OYU/DByb/EcCK49aY2hbuVPh8UsGTDwf0PzYqrBVcnZFtajfJSiwV43JMQe48mxgS7MxGJ9lDMxonf9pP4hls5MR86kFen7/f6GqruOdO61CbnK8bPE7TD9bAKghh30edEcYJN/beeNHeWC9WF3an3o/2GdWVJPyQ6uvSRffyfavz8EnvitWbN6N0UfIMHDkj78Epxqc9WOw6KxND4Ghp9Ix9hezMqzWc9B3697dGCUOqKlTZP+RUQBfCN9Xnm+phJ3EZ8g67cmrNAT+3wseebXcCUMbmeR9hj1YMUq72vjwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6dEtUaYVX87QwORy8SpB1QfVQ6OMtEh5+JCNvdfCby4=;
 b=Sk9rN/s5Ms3xycath6IGwhSNy0e3i2rjAi8eNKihEqAZuRR1g0RPRAEy8gRbGLOuIfZhIt28x4s+OwksNvqR7DG02/DHl0d6CjrjsBFk/19nED3EH23VGnmhy08x4Rngl5kU8IvGsnYa4oJXOirS59xiHQf+fL+NujDNHOI0St8CyE/M5OcZMYH17ZMq2MhROjzLcdkuDfGa7/dpECGLrGUI8bijbHDP6hEWVDkNsdDFi01THY3CMc/Epdv4MVkzicfaBvH8pe9nhhxGY+2bgi8VLIfA8wsH814aGao92HQQp8ALnwD0FhoHQIad73wKBeeAByzcWloiaDdzt7cx6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dEtUaYVX87QwORy8SpB1QfVQ6OMtEh5+JCNvdfCby4=;
 b=EpUJJCYL5wAgOIM62xfO32tbLeMHjnUf4FVdUYhAKYwxCo8R0mFoPxT14t/AQ+0q/GyCPVH7MKEdQ+ItQEl6h3I88iJAhpIKDCS+XU7WlFqUuGSvTRTseszDCuuhGtXY5Vch+U7qrOr8FMKukV4/CkIs/cmqe4f1Sb500Hn/fAQ=
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
Subject: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default NR_NODE_MEMBLKS
Date: Thu, 23 Sep 2021 20:02:21 +0800
Message-ID: <20210923120236.3692135-23-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e2f21ac-8e00-4fe5-dd8b-08d97e8a4ad9
X-MS-TrafficTypeDiagnostic: DB7PR08MB3756:|DB8PR08MB3963:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB3963C7FBC7FA757E681B1E719EA39@DB8PR08MB3963.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dOv97TrR0v493lsXsyhbvgSbMmqbXfR+lNx3QLOXxO38q4KvfnI0aY6zl0mdBGBNJ3N55o270bA66G14aTkwMuEhbkxcsIgLQ6CyYz8oqiNqgDwpwi4jZ+DN5bzP861uTx/MSu3wpl9uIjYX8XYt076u+SE0iqXGG39rjhsKDCsY/o/UfqwINIa9hXApTwsLLhTUVjrphSOkDzfeDjuc8ICmLNsQIAAUt0F8+1L6O+A160dagclfMPsC6Vh+hSf+XAn29s01LhiKrLVLSfIcrOu8UG9j49P/f0Yg4I5haaTp7Kx6A6l3LOWH2sY3Y1T20asTAFzjEkGBljkruRuN0cNX9PVroYohSfaDdJSFoXVVD7ittg+2NaSCN/5PjP4IYxTLJ/rezrxN2vBHRiKmevLwoCovVyzKrpdqOLYDJwZidALHQUmHJ40h5a2dbTOrPST5bfbRZV+3OxWYGAYjuJy3P9L2qwNniiLc69aSlpZBZ2IMSOhcxQZPINruVD5Dh9gkoeBT/w+lDt4eMS+2PjFZXE+nht9XQ1uAHzONih/R9+Me/iAGZ+qtpKkH6knX0pCaC5WfU1enInKRgNpneC8Oj26rMyqhR3RlNJqCz/5g/OQJ0C9kjjL/EnB5EKt4aYyit1HyqpRXOPnWMDaKUvzgDvT5vTBWzAbUM/NFf3659awbFz3h6MbMkDdwp0ZSo3LbNqOo90PqsjvZ9s544jiT+cxLNTBrHxJ8fJyzHXI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(426003)(356005)(83380400001)(86362001)(508600001)(81166007)(82310400003)(316002)(336012)(36860700001)(110136005)(1076003)(2906002)(70206006)(8676002)(2616005)(8936002)(36756003)(70586007)(4326008)(6666004)(7696005)(47076005)(44832011)(26005)(186003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3756
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81e2f0ec-5f3c-46bd-e2cb-08d97e8a43d6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sccVZf+mOTc6JXx7wbfxuS927Ys6Fx81eXOigU7tsClKnV+8wrumjN6KEpQkjtJBRPq+eftg3Z3lNajHAbERCr3GGrXZRsbUL81DmTks0G9MlpJZsKWe3y2XIdXtqsXoDGY3oEQG8NJgWmR2joXCYXh5q3ZJpO5hCCB3d2W8yM4uvNFd0iC3X0eZC1CImqyoWpNmXyhTBtjSIQ3JCpDKD7Ng22GDRk9phzV1kDa4zYgNLOuidIIu8kyUkO3csDY16Y2reg9s1ymlmiJGBsldaHF+dBSj6avS+bIqDx73LImx0zQrKptflJxa2tUb54okQre+9xRVgKmcxoZebg6F4tbuejygPyixsiRr/xXaCcZsYruAwefk+jK1UoXIw9MDO9QKRlHif2BKR+HCfXEBXGEVI0KA9erOo+YljsksaBUMM3KUZCP7scHZNm57l8s1Swm8J/zRj1QiQwge+LUJ0wN+7EZ2eM57QNhSFg5WPViffhBbZmlmcn3QZhRlUGoabN4tYPMyqSCGtdngZLKkQirG4w0LnjfavVnJSUD0ovnQGuG8VyU8W0BiCJPYrQzx52Q6IuCP7Z0wAwaLndlq14y6hH6EkfWofG7kURChhUSrqofiuNyTUY2Ssg8O9RdYUKiAQwnmh8FX/NsbZEbtgmRyhv/JZF9yUdyUvVnkRG1/J836cV6fqQN79nCSPilq0wH3rphSM4KY12Ir3dMePg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(36860700001)(316002)(5660300002)(508600001)(6666004)(83380400001)(47076005)(336012)(8936002)(44832011)(426003)(2616005)(186003)(70206006)(70586007)(8676002)(36756003)(1076003)(2906002)(26005)(4326008)(110136005)(7696005)(81166007)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:27.5424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2f21ac-8e00-4fe5-dd8b-08d97e8a4ad9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3963

As a memory range described in device tree cannot be split across
multiple nodes. So we define NR_NODE_MEMBLKS as NR_MEM_BANKS in
arch header. And keep default NR_NODE_MEMBLKS in common header
for those architectures NUMA is disabled.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/asm-arm/numa.h | 8 +++++++-
 xen/include/xen/numa.h     | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 8f1c67e3eb..21569e634b 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -3,9 +3,15 @@
 
 #include <xen/mm.h>
 
+#include <asm/setup.h>
+
 typedef u8 nodeid_t;
 
-#ifndef CONFIG_NUMA
+#ifdef CONFIG_NUMA
+
+#define NR_NODE_MEMBLKS NR_MEM_BANKS
+
+#else
 
 /* Fake one node for now. See also node_online_map. */
 #define cpu_to_node(cpu) 0
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 1978e2be1b..1731e1cc6b 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -12,7 +12,9 @@
 #define MAX_NUMNODES    1
 #endif
 
+#ifndef NR_NODE_MEMBLKS
 #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
+#endif
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
-- 
2.25.1


