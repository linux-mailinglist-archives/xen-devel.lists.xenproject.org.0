Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF22663BE4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474431.735634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOc-0006mu-Cb; Tue, 10 Jan 2023 08:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474431.735634; Tue, 10 Jan 2023 08:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOc-0006jt-6f; Tue, 10 Jan 2023 08:54:14 +0000
Received: by outflank-mailman (input) for mailman id 474431;
 Tue, 10 Jan 2023 08:54:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAOa-0005oC-41
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2073.outbound.protection.outlook.com [40.107.8.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58b01ba2-90c4-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:54:09 +0100 (CET)
Received: from ZR2P278CA0066.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:52::20)
 by GVXPR08MB8234.eurprd08.prod.outlook.com (2603:10a6:150:17::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:53:56 +0000
Received: from VI1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:52:cafe::96) by ZR2P278CA0066.outlook.office365.com
 (2603:10a6:910:52::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT043.mail.protection.outlook.com (100.127.145.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:53:55 +0000
Received: ("Tessian outbound 3ad958cd7492:v132");
 Tue, 10 Jan 2023 08:53:55 +0000
Received: from 61d7f55ca79f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E6FA4810-2017-46FE-9DD2-24C2ADEF3DDC.1; 
 Tue, 10 Jan 2023 08:53:49 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 61d7f55ca79f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:53:49 +0000
Received: from FR2P281CA0121.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:9d::12)
 by PAWPR08MB9892.eurprd08.prod.outlook.com (2603:10a6:102:342::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:53:47 +0000
Received: from VI1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:9d:cafe::45) by FR2P281CA0121.outlook.office365.com
 (2603:10a6:d10:9d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:47 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT013.mail.protection.outlook.com (100.127.145.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:53:46 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:53:45 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:53:44 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:41 +0000
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
X-Inumbo-ID: 58b01ba2-90c4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ghbs3NMlTW31HC7fLfGV4BVVb2uAXdN3Yk6On4z3OE=;
 b=UYdjnt2KxskTOhh7CnrBqDiDOI8770guG9plfdw15gHHXoftHCwkLhzPmeougr81rLEhrQU0Ht3a5lEcK/wtM5x8HWdFrjShiv4Ej0Fz86uH6eVgm2sJBsiOu0BCHbmpA+xqDkFhcrbda7wQ/ahkESkrr206RgCaIBNHd1gX2n0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 57ba30604fec6c7a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Edm4yXDsKlHYiMNb9jWW0nNxhTpCGzJ4YgvTRozhkCAt0VQc3J5Kaii9ijiH0O0L6GldnHuiXWSBtnSCpXGhQJ9/sGPvoXxPCKd9y1bZCBFhHB/i1uWzkBvHX9ypx4lT0NnkDUqcmL54BPPnjwH2PYRnv57cJChPS2YZSVMHcAhzt6nb2pp4/UkBaeyD+PU0Kp5SLQojzh3ADIPtPnhI4D8smHR8iiL5Fcgr6TIHuCMQiJxoglvVxfsPcXwpNc1oG8G2hZUXLani2lt9K9H+sL+KhIzj5KBV0yf2pTAgl1JM2aXzVeuk64XrLgBDwrmrjWFwBhc3Zn/zIWIcc28H4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ghbs3NMlTW31HC7fLfGV4BVVb2uAXdN3Yk6On4z3OE=;
 b=CqpK6TLUP71Bphk0tmVXmS0cf3PWLb7rARR4AD0VdJodz6gTy9X9YX/lOJFDz+4VdqXv81KB/+FeBm+33O4KPzyxOWduQo3VGHURLiCPg6ihxrxR02uiE+fYiWnXiA7yJUXeXKAUCBwU/x1wEvDsI1sE6vxY30jEC+VUCbBl7EuENT/6kutf83QbZ0KxY72xsySAw0QiaySo9xGErzAfE2MwFCV66GW9wy2kwyIt1Ae0mR3al+ajvrdHbrRDPETle2wOQgibSYcOUUeFJOiHrp6lyJuemlPWNa2E7C+2DtgWyCKZEregffJdhC04gtGeUjZFG0wXGlsSVE6RucGHjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ghbs3NMlTW31HC7fLfGV4BVVb2uAXdN3Yk6On4z3OE=;
 b=UYdjnt2KxskTOhh7CnrBqDiDOI8770guG9plfdw15gHHXoftHCwkLhzPmeougr81rLEhrQU0Ht3a5lEcK/wtM5x8HWdFrjShiv4Ej0Fz86uH6eVgm2sJBsiOu0BCHbmpA+xqDkFhcrbda7wQ/ahkESkrr206RgCaIBNHd1gX2n0=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 01/17] xen/arm: use NR_MEM_BANKS to override default NR_NODE_MEMBLKS
Date: Tue, 10 Jan 2023 16:49:14 +0800
Message-ID: <20230110084930.1095203-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT013:EE_|PAWPR08MB9892:EE_|VI1EUR03FT043:EE_|GVXPR08MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: e59497f9-d102-4d6d-c5a6-08daf2e834da
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WmhDGC8koXn0vc2EKsYtnqaU3vxpgT8bGu8QEnhxMUGAvItMSU8IeAoeuiW0L35D6Kmfy79qepNiMM/g9j+WFdi8pNKFTZ7aWKAPLOPR+Kfo6hkFyL9Hc7pei4RzxWXwf3C3BKo+FXhl9I9+Rs5XK+rNaBGxQDZYm6yQA1Eln+9wvNUU/bVkVqTXQY/Ps4D3nYDNx2lrXeWjTB8oapjt8DMDtB1KmBKZhVO4JIYbpYwuQYYKrERYvuZn0h9cZ5+MqQ+yOsHhOElwl4PMm8AH4AxFbLxXyV/1envd2QaMOrVLfj0SFXTTj5nBB3E7ir94ohHxUL9NHwhDa88s7OdXb7frPXf0imzqYQAt80sQqh7QlJSP5M6pQ/bWK9IoMZUsEwbS0NK5IuEnwg2JGu2L1i4T509j6aA3w0AzOYEPQDG6ibaf9EksB7R1p8qQEJTglK8H7EdfXnXmgEWff4g/CbEOBj82/QknNaELMz11PNfkMeQf7tR4cJtLPu4McMyrUHJ7gnclDi1zMpflH7rDYC9cbsSmhGaML0Vo1+tueY25QFPHmR3oz3buSpKQsg16FAaptOFGM2A+cSsoJfAF0y/6s6Bzml2zdbOEZSobjnRq1htY+Bpt+RVNrHIUIHKCqitsvsCryyFsumfQhfja8GXegcn5JDMvivb9rDJIyHyamdBFNVVm9VPW8ee2BwTk6b73+GLzw5IYNBgV/auJe/KiSKOHpoToCn/1vWcdCzg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(36840700001)(46966006)(36756003)(356005)(41300700001)(2906002)(81166007)(8936002)(82740400003)(82310400005)(5660300002)(44832011)(47076005)(426003)(36860700001)(83380400001)(86362001)(966005)(54906003)(6916009)(7696005)(40480700001)(6666004)(26005)(186003)(8676002)(478600001)(70586007)(70206006)(4326008)(316002)(2616005)(336012)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9892
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3ed03b6-9734-450f-b86c-08daf2e82f2e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I+MnnlNnQvnqdKm6zsWgIJW3MNVJVlkk7+0GI33nv61Qa1ttsYj3sTMuo8vJ5nbTxKpMP/t7HzHZSTA0OSU8sJANMbdqvLwoQhInbzjJHkqR9A9itdF/8tfGxUyfsrSLRy8+V5cKG94O+DUyapBJT6HXcly1q3ICEZAkMQV4TVdUOlJDAFMWa9HSPhBJGKjRxhpgKSi/oRKRBgG2y/pZHaNlGUMZxzJKX5G+aL5GK4I3nVzeMqIPnALYrt+kseAeKy8qV/0wK/TGLr1BURQUS/sB6yGr6EsnF9YqEJVHlBso/o5iZC0vs+Gn/Db32w+EfNESq8mejmhDIDsk8jyX7XYKKlEjAHbiF+16kmJC5Ypk1nGG3/Zhsi89kUI/x5m04frEpVD6DsmDjR8u7Btzc+wo6WF1yu0JY4iTTJdNZpvfYyXvOOW5Td5REMZSpk+hO3j6jl0nOdmP4x0T0Tjb3WoNKXq2VzgtBHcgbEj13DgFL1GbCUnM/ppKDGMt1x2afUCHH0pK/4l17BGFoNEtWR9fY0TuEMAvFnpzIkrXjqarRCaGCv94HIyc9AnXR5qdQg3tJ9GMiiCOxLNhQkDOyCkxMTsPbPV5Ca+sPgCYP3M7zICxegNj/NHrVFwLO/PqiIuEKcRblaaEm010mFN3ICeq7AbmkD8i3xp9CDBeHpLFwDNCAUirfGjaenKMOVPypyy0OyfT+VMapGJ9trwuIblmHpzc330s4fXgaK3uzSs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(81166007)(36860700001)(54906003)(8676002)(4326008)(40460700003)(86362001)(6916009)(41300700001)(70586007)(70206006)(316002)(8936002)(40480700001)(44832011)(5660300002)(2906002)(1076003)(2616005)(336012)(83380400001)(426003)(47076005)(82310400005)(966005)(7696005)(186003)(478600001)(6666004)(26005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:53:55.8339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e59497f9-d102-4d6d-c5a6-08daf2e834da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB8234

As a memory range described in device tree cannot be split across
multiple nodes. And it is very likely than if you have more than
64 nodes, you may need a lot more than 2 regions per node. So the
default NR_NODE_MEMBLKS value (MAX_NUMNODES * 2) makes no sense
on Arm.

So, for Arm, we would just define NR_NODE_MEMBLKS as an alias to
NR_MEM_BANKS. And in the future NR_MEM_BANKS will be user-configurable
via kconfig, but for now leave NR_MEM_BANKS as 128 on Arm. This
avoid to have different way to define the value based NUMA vs non-NUMA.

Further discussions can be found here[1].

[1] https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg02322.html

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Add code comments to explain using NR_MEM_BANKS for Arm
2. Refine commit messages.
---
 xen/arch/arm/include/asm/numa.h | 19 ++++++++++++++++++-
 xen/include/xen/numa.h          |  9 +++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index e2bee2bd82..7d6ae36a19 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -3,9 +3,26 @@
 
 #include <xen/mm.h>
 
+#include <asm/setup.h>
+
 typedef u8 nodeid_t;
 
-#ifndef CONFIG_NUMA
+#ifdef CONFIG_NUMA
+
+/*
+ * It is very likely that if you have more than 64 nodes, you may
+ * need a lot more than 2 regions per node. So, for Arm, we would
+ * just define NR_NODE_MEMBLKS as an alias to NR_MEM_BANKS.
+ * And in the future NR_MEM_BANKS will be bumped for new platforms,
+ * but for now leave NR_MEM_BANKS as it is on Arm. This avoid to
+ * have different way to define the value based NUMA vs non-NUMA.
+ *
+ * Further discussions can be found here:
+ * https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg02322.html
+ */
+#define NR_NODE_MEMBLKS NR_MEM_BANKS
+
+#else
 
 /* Fake one node for now. See also node_online_map. */
 #define cpu_to_node(cpu) 0
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 29b8c2df89..b86d0851fc 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -13,7 +13,16 @@
 #define MAX_NUMNODES 1
 #endif
 
+/*
+ * Some architectures may have different considerations for
+ * number of node memory blocks. They can define their
+ * NR_NODE_MEMBLKS in asm/numa.h to reflect their architectural
+ * implementation. If the arch does not have specific implementation,
+ * the following default NR_NODE_MEMBLKS will be used.
+ */
+#ifndef NR_NODE_MEMBLKS
 #define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
+#endif
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
-- 
2.25.1


