Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2880262F2E7
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 11:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445565.700821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysb-0007TI-2Q; Fri, 18 Nov 2022 10:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445565.700821; Fri, 18 Nov 2022 10:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovysa-0007Qd-UN; Fri, 18 Nov 2022 10:45:52 +0000
Received: by outflank-mailman (input) for mailman id 445565;
 Fri, 18 Nov 2022 10:45:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nf+F=3S=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ovysZ-0006R2-6s
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 10:45:51 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25bd905d-672e-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 11:45:42 +0100 (CET)
Received: from AS8PR04CA0183.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::8)
 by AS2PR08MB9545.eurprd08.prod.outlook.com (2603:10a6:20b:60e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Fri, 18 Nov
 2022 10:45:45 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::88) by AS8PR04CA0183.outlook.office365.com
 (2603:10a6:20b:2f3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:45 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Fri, 18 Nov 2022 10:45:45 +0000
Received: from 1aa20f94f073.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5FE67FEF-AEF8-4105-8EA3-FB23F0FCEF6D.1; 
 Fri, 18 Nov 2022 10:45:38 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1aa20f94f073.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Nov 2022 10:45:38 +0000
Received: from AS9PR01CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::10) by AS8PR08MB8086.eurprd08.prod.outlook.com
 (2603:10a6:20b:54b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.5; Fri, 18 Nov
 2022 10:45:37 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:542:cafe::5f) by AS9PR01CA0029.outlook.office365.com
 (2603:10a6:20b:542::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:37 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 10:45:35 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 18 Nov
 2022 10:45:34 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Fri, 18 Nov 2022 10:45:31 +0000
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
X-Inumbo-ID: 25bd905d-672e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0uINGRHJ9MGqTaLt9vxK7vqJLpO9hspJ13faxPvkX8=;
 b=KZB+rO6qL2vIA1yK4i9ScdXQT4P62w8QE94PwLgPzJswBXwHpRGz5PXDdlZvRyo6RjvPp/rF31uRTl8XR7jzKHZG78FberPVJiSmVMd75U4jp9OQb/lQE5yDBFSZ948WSBIy9sM+7Z+KQrn7xvjuhfL5hj5GsWVrw8k2zT7GJJc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 538d1a37e0c8e672
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNgfrgVlccsY/UpgCDbPW3Y24JX6qTRII3hJ/e+7uj1EPMgbSaVVxyQlhQ3fOjL/BeEJT62sciQjhG27AgI3OVHbd1jBUNHv/nbWly+wn9TxXxjwmaXP1xipZcYMPTF55xz3bwYeoh+y3z7hAwGaQsVhdubL4fEk8GlXbr+oojaMvpH4drS4u9zShnxVSAeD2TCvVmFRgbFdnthmGBQ2j7B9iPSPekDvBbGFmIN2Oe1jr1zwBjCv7s80IFcPtSUKU7ck3+fT47RQnl2USi1Ye+hYHaawo4vbcGjepaG/Ydu3L/RHn552AXH5mmp9UKnddnfbIfIljCpaWO5H2I7qaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0uINGRHJ9MGqTaLt9vxK7vqJLpO9hspJ13faxPvkX8=;
 b=jVJEkBztxYU9iJEdvoeHKWzbQy75U8YOTAXkH2vAVq9ah1210U1vi/hXd76/7CgiNPWAJOJ6Zs3S64o6B3vu0NbMxdcLfLrK5yWDSsEz1VhgoVc99MwmL3TNicDcMsQK8CD7c17FhIjy4qdFQViI4NvJC/jHX9LJQyA2N8CYG73hLoQkVghEPjW+/eoFLbgb7AdP4t/gqqsu+nPllqqEsxl5dXdgCSwxM8EDvdyQvAEp3d1Rmr1Y4SoqCDmH+CKLXMOz9uQNJbEnPFTCQVZBZmD8TC0Ov15Pbbhvnfk5agfs7xhmmE0rlwKVQzVPuKIKtQ4GB1XwAE8Ci5zrE2fsZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0uINGRHJ9MGqTaLt9vxK7vqJLpO9hspJ13faxPvkX8=;
 b=KZB+rO6qL2vIA1yK4i9ScdXQT4P62w8QE94PwLgPzJswBXwHpRGz5PXDdlZvRyo6RjvPp/rF31uRTl8XR7jzKHZG78FberPVJiSmVMd75U4jp9OQb/lQE5yDBFSZ948WSBIy9sM+7Z+KQrn7xvjuhfL5hj5GsWVrw8k2zT7GJJc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v9 6/6] xen: introduce a Kconfig option to configure NUMA nodes number
Date: Fri, 18 Nov 2022 18:45:08 +0800
Message-ID: <20221118104508.768274-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118104508.768274-1-wei.chen@arm.com>
References: <20221118104508.768274-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT027:EE_|AS8PR08MB8086:EE_|AM7EUR03FT004:EE_|AS2PR08MB9545:EE_
X-MS-Office365-Filtering-Correlation-Id: db18db0f-67eb-4c59-61a5-08dac9520c3d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eoNakGpJXW9D4YYAXEMwJW4+Afx624h/WS6ylokZrAnx0wQZea1PUiQkNJC5VA+bnnQbJywLxV59DQO74TaC3PWyACrmYxBF3164EFpuUomaRkQ5HEIX97zm71j0Og46U8u9ei9d3c68lnKgN3G4LDn9zBcsqAEsbUg1k6aNzk8vG3xs3REjKtOu3Zwa6iXCYENVjElHc6y5uangSyNk/uiqLVaZ1+RRhBpnqpk4DkmQSSSwLNy66oMmNhFlphIV0pVacuogUS1AVc0j3GP5pesngPUnJ7TFnu5ZUet/bQxeifOduiz/61wpLyUB7Sfw0FqNLBTFUfVbPsgkDNtWmayJ6f5q6qaG9v1vEowNdHngfiuKtYieGXFM7tRIpzAbRFCu4cWN5FHiGZsa8u+OMJMjZcbdmU7bYONK64FmbGKST6k+Zod8TkEGcBd9uPA9Qg1t5Jxw42L1F82n28Vof7twl3FxiwAxmJZr7DY5xjuuUw70kXYRpXeyzWGT0vliMXSwjiCVPU0oOsz+Iz4sCBKJ1LkUVXNo17R/pc05zcxSbKypKe/wTqCxdR4GudgjCYP7RBdEEkDe6MOVmnelzcxmd251GKHMciPfCdR74eOf9RDB8bwED3wwaxPgPZOxUCtlnX4weFLXqaKq+igNHcdUdJVZ/0OTmYE84zL5Lxfx5WuxmyIff/grDHBGbgHSEPsWyAS2+YWBcCfznxcpNF5HpVgJBfw1hHKVK2VCLtw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(54906003)(8936002)(5660300002)(6916009)(86362001)(316002)(2906002)(81166007)(82740400003)(83380400001)(41300700001)(426003)(82310400005)(6666004)(7696005)(26005)(356005)(44832011)(70586007)(47076005)(4326008)(1076003)(478600001)(186003)(40480700001)(336012)(2616005)(70206006)(36756003)(40460700003)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8086
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f9fa8ad5-0fc8-48b8-e817-08dac9520672
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0w5jLCUy/XwmD2ILznR4gjFvUh9w6RdS7cHwpg4vq7IA1m1IqBaZ4QMECePn2pdj1OhJtGunJNgpGac+z6w9e7iEOnbh03nhe6fh+DMy952gQSeyV8Uzp20bXSAICcu5UZFD/ISKmAq90opNjY3haGSlYR8LDktabLytGdTgHaBKMPBz1RYg35SAhacu+MkkJcUYVYG6QHR96lXyyyj1AHlemZiF+YUJW205i3DS+or36LuVRMG+ozYjnjezSSHk7QKaZNiMR50zhdbyqye6ksv9OdnWIpdKL1IqdwcSVCOKs+/6348QH5MkPYjE6f/jggm2jWAlOTQPPZ2FP6hK+zAj08T98s2FQkbSntHh2uC/AdqlRkK8mrEEFPzfXRMDEohuh1PBdz0zgsCMFtn8gPcIQslqwCsr065Qct7Ae38xfnTFCl7fDsvGHeQa3ahSL/VWHORWjItIKVB0bB2j1BbVTCtUaxYzChaV2y5mRP47C2FK1cqIwtca0VknuW+ReP8AhUWkUioJoFv1xoXZW6puUVqTh+u1fW7o5a2Esk0xb/9rvJcH9GAvZpn7bL19vOCbUw0SU7H8IAsRte3SdDi6CgHLkG7eiTqZ9h9iRQWgzaDXhe4wlxO7qkoT5QjoWpVo4xtQUpbUnof8XjJxwd29rYq0n+fjdVVPLVfnMYDzvLwpX3pzV7aJZ30UBLrLY6oj54t3257W5x5YsZem/A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(8936002)(5660300002)(8676002)(44832011)(4326008)(70206006)(70586007)(41300700001)(40480700001)(6916009)(54906003)(36860700001)(6666004)(7696005)(107886003)(26005)(478600001)(86362001)(47076005)(81166007)(316002)(1076003)(336012)(2616005)(83380400001)(82310400005)(82740400003)(426003)(186003)(36756003)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 10:45:45.5728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db18db0f-67eb-4c59-61a5-08dac9520c3d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9545

Currently the maximum number of NUMA nodes is a hardcoded value.
This provides little flexibility unless changing the code.

Introduce a new Kconfig option to change the maximum number of
NUMA nodes conveniently. Also considering that not all
architectures support NUMA, this Kconfig option is only visible
on NUMA enabled architectures. Architectures not supporting NUMA
still use 1 for MAX_NUMNODES.

As NODES_SHIFT is currently unused, we're taking this
opportunity to remove it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v8 -> v9:
1. No change.
v7 -> v8:
1. No change.
v6 -> v7:
1. No change.
v5 -> v6:
1. No change.
v4 -> v5:
1. No change.
v3 -> v4:
1. Update the commit log to follow Jan's suggestion.
2. Add Ack-by.
v2 -> v3:
1. Fix indent.
2. Use 2-64 for node range.
v1 -> v2:
1. Add NODES_SHIFT remove message in commit log
2. Change NR_NUMA_NODES upper bound from 4095 to 255.
---
 xen/arch/Kconfig                | 11 +++++++++++
 xen/arch/x86/include/asm/numa.h |  2 --
 xen/include/xen/numa.h          | 11 ++++++-----
 3 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index f16eb0df43..7028f7b74f 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -17,3 +17,14 @@ config NR_CPUS
 	  For CPU cores which support Simultaneous Multi-Threading or similar
 	  technologies, this the number of logical threads which Xen will
 	  support.
+
+config NR_NUMA_NODES
+	int "Maximum number of NUMA nodes supported"
+	range 2 64
+	default "64"
+	depends on NUMA
+	help
+	  Controls the build-time size of various arrays and bitmaps
+	  associated with multiple-nodes management. It is the upper bound of
+	  the number of NUMA nodes that the scheduler, memory allocation and
+	  other NUMA-aware components can handle.
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 2ca3475271..7866afa408 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -3,8 +3,6 @@
 
 #include <xen/cpumask.h>
 
-#define NODES_SHIFT 6
-
 typedef u8 nodeid_t;
 
 extern int srat_rev;
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 04ecaf7769..71a5f837b3 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -3,14 +3,15 @@
 
 #include <asm/numa.h>
 
-#ifndef NODES_SHIFT
-#define NODES_SHIFT     0
-#endif
-
 #define NUMA_NO_NODE     0xFF
 #define NUMA_NO_DISTANCE 0xFF
 
-#define MAX_NUMNODES    (1 << NODES_SHIFT)
+#ifdef CONFIG_NR_NUMA_NODES
+#define MAX_NUMNODES CONFIG_NR_NUMA_NODES
+#else
+#define MAX_NUMNODES 1
+#endif
+
 #define NR_NODE_MEMBLKS (MAX_NUMNODES * 2)
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
-- 
2.25.1


