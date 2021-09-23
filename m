Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CA8415E27
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:18:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193989.345666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfj-0002OZ-Ga; Thu, 23 Sep 2021 12:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193989.345666; Thu, 23 Sep 2021 12:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfj-0002KF-7A; Thu, 23 Sep 2021 12:17:51 +0000
Received: by outflank-mailman (input) for mailman id 193989;
 Thu, 23 Sep 2021 12:17:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNW4-0005KP-6Z
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:07:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::626])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49e9fde8-c21e-4a45-8924-0bf8b2f455a7;
 Thu, 23 Sep 2021 12:04:35 +0000 (UTC)
Received: from AS9PR06CA0029.eurprd06.prod.outlook.com (2603:10a6:20b:462::18)
 by PAXPR08MB7280.eurprd08.prod.outlook.com (2603:10a6:102:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:04:33 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::35) by AS9PR06CA0029.outlook.office365.com
 (2603:10a6:20b:462::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:33 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:32 +0000
Received: ("Tessian outbound 173d710607ad:v103");
 Thu, 23 Sep 2021 12:04:30 +0000
Received: from f901f435cad7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8933737B-2358-405F-9221-EC3CA3AD749C.1; 
 Thu, 23 Sep 2021 12:04:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f901f435cad7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:18 +0000
Received: from AS9PR06CA0092.eurprd06.prod.outlook.com (2603:10a6:20b:465::10)
 by AM6PR08MB4818.eurprd08.prod.outlook.com (2603:10a6:20b:cb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 23 Sep
 2021 12:04:16 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::25) by AS9PR06CA0092.outlook.office365.com
 (2603:10a6:20b:465::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:16 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:16 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:00 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:03:58 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:58 +0000
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
X-Inumbo-ID: 49e9fde8-c21e-4a45-8924-0bf8b2f455a7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3okijkGOEYgqB5JRr1n7+WErub1PozJvnVaCT3ZajM=;
 b=6bx6FARY9uEpKHTemojAM1hFDf4kcp4drbAEFa4bfZkLxzV2QjwVM3uBUguk2KOrEpnvLkiRuk8RqIgIBKiPqgJtXTxcVWEFHcnbe4nBnDTFn4A4CCocRCLY4ZssjKZLw1L0wfKzxN6rhjbtnPB9eKMSrco6Pa0sTpr4AxtQTmY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 04c7ee98cf8e44cd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kgpeq63N531U9H6zSg1o+6kAs0DLCAfVNiJlB7ByzsIqzWZdX2q8xjj3au+2mdkvw+XLCcKAxyPsjznb7wMiV4P3ofyqXQFrsYJ9yhdJAiqoV2MyAKh0CaEIk9G9zwKwLVaPDIaefMU2uwyoQ9JwAhyztpiiKuqu9ramQy3/H30bPpezcLEB1c8gI/0FXHoZMT2kF1qRBCLpnjU7AAppWenJmwNn4lNbGxkQ0hB2ueRJ2TnLBtpQ2ytQxpOzBwZg3ePvC3EDrQieb2P5BOZuq7IMKYYXBvtZmgVbXDK4Zk3G8W8SIFOUp/M5ZFUF9azVpWX503XcmysXJjtIghytIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=e3okijkGOEYgqB5JRr1n7+WErub1PozJvnVaCT3ZajM=;
 b=aBYHeIa3BrjiEvJ3rKSZFb3p3xkMgjSReZgAOW/2gtKVbj2us6/MkKR/opYEpioCxWGJxJhg+C2ecyjblZ34Wgr1gvah/CGlQ4BRppQQSQIFHFUsk8ANB2y/AvTCnHUcNPoUm5Uc8PWqKDb+m943o6IXBseduw3hF24Q/5dAVMEuxTMuXUDzqNbdntDa003uaLDK5w9ROlB7qB0EXGU/UGsaxTSyGjub9njzdIkcm5rKp7Vuib898FgsjOage5dxk1wliCUxVSiMU5jueAvvWqC035HACn1t+YPszOHcvj5ZCQm4hsAUBUkZ+SF5eqxXm1tVwCMZc7nM6nbUsgrvMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3okijkGOEYgqB5JRr1n7+WErub1PozJvnVaCT3ZajM=;
 b=6bx6FARY9uEpKHTemojAM1hFDf4kcp4drbAEFa4bfZkLxzV2QjwVM3uBUguk2KOrEpnvLkiRuk8RqIgIBKiPqgJtXTxcVWEFHcnbe4nBnDTFn4A4CCocRCLY4ZssjKZLw1L0wfKzxN6rhjbtnPB9eKMSrco6Pa0sTpr4AxtQTmY=
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
Subject: [PATCH 23/37] xen/arm: implement node distance helpers for Arm
Date: Thu, 23 Sep 2021 20:02:22 +0800
Message-ID: <20210923120236.3692135-24-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55e307fb-016a-436a-615c-08d97e8a4e13
X-MS-TrafficTypeDiagnostic: AM6PR08MB4818:|PAXPR08MB7280:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7280E9BDC38441379B6597D39EA39@PAXPR08MB7280.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MWHGhCXTPamOABmtcqxV7u5Ta0Si8iM3bgdnTb3dccK9jaC7mCO8dzrU6l95FKfEKHsnEflJ0UnUTyxQNV0z53krBjTZje3qUEhC0Hlr71shrzIfUgayXp0igRZYS4Kn3gM3SGG+qOZolOvzFXtRbQ/I15KR1Thg4t05E1NT5BXrjkR7U3W8yjBGVyXPDZRdkcp8JI1avrGsdSnJm48pd9Tfqy66GisEwh/CtyxlBOpSKzOSsC1jZSJmkfJ3jtXbUUIiseHs00VUhuo6Z9imn//rl4Lp78WeaWTqz3CGu1if8vEwb73RHFQXGse4XqPrdTrpIIvvTYxctDLUdr/mmmHS/kYzEWbVG+e0dR4SJDSzAeVj5HaQVNopIYXXQ+Ny5418EkbuvUyjvozzJ2M7QLPzYoX/f0vnYzmJDlBbebEmYSO8wyT+Nz2LZo2HEa9KO3NJxfwbitKZ2c57U7GFBrAcvW/0+vciE+Q+XhcYecaRsNv4BK6JP0XPF3/suSW/iSB3IvsqKxH7XcOvSqVBpFtoWGY4NH6NO0H9mklaN+YAr2wxJyjGXtW/3La9dVFUIpKApbSU17YbQBTfXVchu8VTVy4951kkKk0Re2pQYXT/BJV6ytu7ikxNSZkIGIK3FmXkKo8Usry5co5dUvidueHt73p2E9numolg5wW1wfKxdOBX2qc4vrK9DlGoTFnd9/oE9+ofozg9BCA0aI5V5+ljgx9fCK4emZRh5s0xOsX2Dh39VeSjkwIKSUfuHYkJnpOayz83baU78igf4M30+kzgwAhCW8dc996cb73/IHwp0jaGldBXjvSwsPjKQ3qlkNzn7r9CL3SxjS0XyhAy6w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(356005)(7696005)(36756003)(6666004)(8676002)(2906002)(82310400003)(36860700001)(70586007)(26005)(186003)(81166007)(83380400001)(86362001)(316002)(70206006)(1076003)(426003)(336012)(4326008)(44832011)(110136005)(2616005)(47076005)(5660300002)(8936002)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4818
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3c6325e-33a2-4920-c6c2-08d97e8a445e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tiwAfeZEJqwXlPkXv4xpTvpIhIhHXCQXyULjmMwLpy1EhlkpXRbguaEU/4eZZY2a+efLTigrj5Hlb5YIRAnjF41+1W2q/jH/X1JUKyZHhJWYhTACHHUO3aOrwjsLeSrzHRiuQVBeha++DcsUuZ0oOiAqJAj8mt+X1D/76fFDaHlOH83vVUgiu94XV056TRta2mibR8ISKqKvZbCEX5BZjOGezKpB+WCsMiETkdbAH0OFvx8uOG9geTGt264FnEcAUc2/qdCLOTbrnhaacuunMmtTsnG+dYoTAxGldagqXZz3GvDHqPWgK5rHu/pk6pULLGX80P5rjYe9v6jVAjmgT8q0V6LOxgvID312EqxJEuq4CZyY8tQDBUfTzeoorMYXJUPFV0KkkGfgWPDTnx+bF67nI2LAdo9yWWUL7kcpJ2Fu5Nb459iYZI5VZCZH5lYqYSBmQr7AYy8v41AjMcv0lWG15iXUsHlnyowmZXHepVoA/I7i/Ihs35yaJPslQ/ZSijLdl2XMFIuLBvoifKu8sqvpIvBNPtIZkUwvcH8wSZTvfHaRq5QXlC0bxLFpUVJFO8Ea99FHqzZT18sm1CspEhlMcw2VUQzG4d+krYdwUSt5eFE6IaaZuZXHlV/tn198465RCssUOPyCEy8UsnyP1wIAyg/rIQTwSIDfbvbaAcQ90cngdAb4OAzqh4/bKcs1eIwZIWB4LQ3U/nwh08A4O+PO/wWpzyhziJzGpDWssjM2iELEPoiTKidCuQbr2D5FppeeiaIrkN1dPzh7/r/SFBVlbZBoJ7ZqMovl3NC1/P1pHYaksry9W9UntyJ/Wj/7
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(7696005)(186003)(86362001)(426003)(1076003)(508600001)(36756003)(36860700001)(336012)(2616005)(47076005)(4326008)(82310400003)(83380400001)(70206006)(110136005)(70586007)(6666004)(2906002)(8936002)(81166007)(316002)(8676002)(5660300002)(44832011)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:32.9535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e307fb-016a-436a-615c-08d97e8a4e13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7280

We will parse NUMA nodes distances from device tree or ACPI
table. So we need a matrix to record the distances between
any two nodes we parsed. Accordingly, we provide this
node_set_distance API for device tree or ACPI table parsers
to set the distance for any two nodes in this patch.
When NUMA initialization failed, __node_distance will return
NUMA_REMOTE_DISTANCE, this will help us avoid doing rollback
for distance maxtrix when NUMA initialization failed.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Makefile      |  1 +
 xen/arch/arm/numa.c        | 69 ++++++++++++++++++++++++++++++++++++++
 xen/include/asm-arm/numa.h | 13 +++++++
 3 files changed, 83 insertions(+)
 create mode 100644 xen/arch/arm/numa.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index ae4efbf76e..41ca311b6b 100644
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
index 0000000000..3f08870d69
--- /dev/null
+++ b/xen/arch/arm/numa.c
@@ -0,0 +1,69 @@
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
+#include <xen/numa.h>
+
+static uint8_t __read_mostly
+node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
+    { 0 }
+};
+
+void __init numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance)
+{
+    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
+    {
+        printk(KERN_WARNING
+               "NUMA: invalid nodes: from=%"PRIu8" to=%"PRIu8" MAX=%"PRIu8"\n",
+               from, to, MAX_NUMNODES);
+        return;
+    }
+
+    /* NUMA defines 0xff as an unreachable node and 0-9 are undefined */
+    if ( distance >= NUMA_NO_DISTANCE ||
+        (distance >= NUMA_DISTANCE_UDF_MIN &&
+         distance <= NUMA_DISTANCE_UDF_MAX) ||
+        (from == to && distance != NUMA_LOCAL_DISTANCE) )
+    {
+        printk(KERN_WARNING
+               "NUMA: invalid distance: from=%"PRIu8" to=%"PRIu8" distance=%"PRIu32"\n",
+               from, to, distance);
+        return;
+    }
+
+    node_distance_map[from][to] = distance;
+}
+
+uint8_t __node_distance(nodeid_t from, nodeid_t to)
+{
+    /* When NUMA is off, any distance will be treated as remote. */
+    if ( srat_disabled() )
+        return NUMA_REMOTE_DISTANCE;
+
+    /*
+     * Check whether the nodes are in the matrix range.
+     * When any node is out of range, except from and to nodes are the
+     * same, we treat them as unreachable (return 0xFF)
+     */
+    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
+        return from == to ? NUMA_LOCAL_DISTANCE : NUMA_NO_DISTANCE;
+
+    return node_distance_map[from][to];
+}
+EXPORT_SYMBOL(__node_distance);
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 21569e634b..758eafeb05 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -9,8 +9,21 @@ typedef u8 nodeid_t;
 
 #ifdef CONFIG_NUMA
 
+/*
+ * In ACPI spec, 0-9 are the reserved values for node distance,
+ * 10 indicates local node distance, 20 indicates remote node
+ * distance. Set node distance map in device tree will follow
+ * the ACPI's definition.
+ */
+#define NUMA_DISTANCE_UDF_MIN   0
+#define NUMA_DISTANCE_UDF_MAX   9
+#define NUMA_LOCAL_DISTANCE     10
+#define NUMA_REMOTE_DISTANCE    20
+
 #define NR_NODE_MEMBLKS NR_MEM_BANKS
 
+extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
+
 #else
 
 /* Fake one node for now. See also node_online_map. */
-- 
2.25.1


