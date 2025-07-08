Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77142AFD67C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037153.1409831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZD7e-0000l0-O9; Tue, 08 Jul 2025 18:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037153.1409831; Tue, 08 Jul 2025 18:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZD7e-0000hk-LE; Tue, 08 Jul 2025 18:32:54 +0000
Received: by outflank-mailman (input) for mailman id 1037153;
 Tue, 08 Jul 2025 18:32:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y4zX=ZV=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uZD7d-0000gk-9Q
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:32:53 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2415::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f360ca22-5c29-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 20:32:50 +0200 (CEST)
Received: from SA0PR13CA0008.namprd13.prod.outlook.com (2603:10b6:806:130::13)
 by SA3PR12MB7921.namprd12.prod.outlook.com (2603:10b6:806:320::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Tue, 8 Jul
 2025 18:32:44 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::7e) by SA0PR13CA0008.outlook.office365.com
 (2603:10b6:806:130::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.20 via Frontend Transport; Tue,
 8 Jul 2025 18:32:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:32:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:32:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:32:43 -0500
Received: from SATLEXMB04.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Jul 2025 13:32:42 -0500
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
X-Inumbo-ID: f360ca22-5c29-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCKmnzJtcp2pt2ncjGXC/WiEteEaDAVLJcH0vV78+mVmjTtXNn8+qM/MVac2sgo4bq0/EcZfUgORo4T6Z+nL8z+LEIrZ1qdSBzlAtsFIcWjQA29YP9tszGtvAzGwFdNUp3H8co+G0rHPg/EdVL2zDrKxIOjBr/pGxKooOJYz42e2vpftDSe5JQsdg+JprVgDuO2ZWjaGvQ8f/rJCIp2nahM12GAA7CMYvhesHWJkZ2wA2sGLGAAXm7G8gFhOJioJpzbvk/mIR2NwM3E0W2zSkeT1o9+VE1VvOl3QbUXk0zOUepoCzfvSrbhR468N/HD3Edz3CTWyMnq+Rc4HOv2sYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5q7riMQpJuR081NmlAlblhxCQ1R0T6CrGkGHy0+zI4=;
 b=YbtyrGcU1xXMpozkZPJfUYDkjzq1d6kiYj/HbFgyI+afDyb5xkng8Je9LNF1761o/FpjEeaer+M10Qjk1PvV/zUK5kmLVjtPsEYc8DhK6BlmgNO/iAYvqcXb/usRtegLXLpnAua2joRRWqWiaqJrdJIDCH9Pn2Pr5TmfbLHtt+qQ19eJtpI0Fj9Gb+BbwRIOWi7RjWcs+u2dADRe2AqgwJzOjoTLZD6ssdR6eufnjrMBQwOa5a+4pZO8pbafb/XoR2O0h8IShIQJnZtw6ocahXoY02rE1ZIEsm6z8QUqAgrw1LO0OaIKiMt45LWOriuOUDfEXV8WPKblueC6unDwLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5q7riMQpJuR081NmlAlblhxCQ1R0T6CrGkGHy0+zI4=;
 b=nFWyqSUjzpGSNefwBpGZjRuIT2PEc4favloQs6E8+sMSJjsOn6XNKjUlW9tkQ+x71VtGLfWjiaJDwzdE/RP3IdzJflnroaLTrBU/vNa4pV3mVCTU7DNyGhx0gbnzI4AxOoEi7ZIhak1CoTl6sSo4nFIAuu9tZDxqbHzA30Wc/I4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<stefano.stabellini@amd.com>, <Xenia.Ragiadakou@amd.com>,
	<alejandro.garciavallejo@amd.com>, <Jason.Andryuk@amd.com>
Subject: [PATCH v2 2/2] xen/x86: introduce MCE_NONFATAL
Date: Tue, 8 Jul 2025 11:32:38 -0700
Message-ID: <20250708183238.3104638-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2507081131060.605088@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2507081131060.605088@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|SA3PR12MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: e4909112-987f-4acc-3808-08ddbe4dd41b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N/siN3k84e3JqPS5u1gcrqoAEZw0HVhjIK+dJGCbdhb71LRJQ3vpB72J9jNA?=
 =?us-ascii?Q?1CIhwDQ4dvxrYg7JuOnQ2DCxiTGcLPnFZig1SGHbkUEoe5z2je4aDQYkuuSo?=
 =?us-ascii?Q?ux34Uz2fgj2K5A3CTHJCgpmJKQ7mXXxnDIxNvzZluDK/IMhjUXysip9PhdxF?=
 =?us-ascii?Q?2v4ASaWHNwig+5QxX7aAeRHQtZXRp/+ULD4YiZiIngmXIL9i7GuJ2c/g7C5N?=
 =?us-ascii?Q?HWFYuAFHr57RTgVY4l4zMk6DW6dhlRTlZPiBa6pjir7HKQgoPbk8BkQYFCz7?=
 =?us-ascii?Q?Ex3yMwAlBYGBjhMzSO+vhMc7MU932A+NTBVYNxkSNQVvsB13zzcGmyxO6HXB?=
 =?us-ascii?Q?TYG4jiNeVxB6eS5rTgUVp0SZhvl4YT5nfbsr2A5nlJmdVPxgGJN2YJ6Xqf6+?=
 =?us-ascii?Q?yBlMPi9XDH65L4ysUwo6RD0WOBeKVyINNzWRKwI0udTR9hkh41hynjANabj8?=
 =?us-ascii?Q?HvpRszlVKh34w+TBTPX7O/VCj08GQ4Y0pM2Radb1YDaeMjN1MvPppQJoskEt?=
 =?us-ascii?Q?FUM2TJ/h98KvzwUA+dVfwCEuUyf6z1s97lp9r5fJrjpiFnE3LOO18gugaQph?=
 =?us-ascii?Q?kpZT1F0DPJGZGE4a5ujEa/sAmvEZtKUoPIjuTn5YkrXBbwdDiTBQcf5OWEGg?=
 =?us-ascii?Q?Kw8gjJ0mOOQhDL3KVwc7A1K5s+a9b8J2UojzbfH9ocYsgU6rwFsQRJoeF174?=
 =?us-ascii?Q?aLdaBf4da8EAJnjWLuhj3y+N9zcteOBHUky1RfBe+EqYcd5QHwEhOWTEDGMf?=
 =?us-ascii?Q?Mdzd33zf12u/7Ef55JohppIr3TARiRgyDHiW25JtmTpkpU//M6cwk3qKB+fW?=
 =?us-ascii?Q?fcEEO2IRSzIf8q5Z5YTdqx1Sii7zs8PdHQPpk6Z/x2H9nBfRFjfVuj9ZVfK9?=
 =?us-ascii?Q?RNq937wTmy/7X/f01f/TyWGuRfJZ3hQQoHo9gD782oklwq1JqOaFLvYFQBC1?=
 =?us-ascii?Q?jUR5bu5F47IaEyPdkdllcR6K/9tj6ehKE5XBoQmvkXNSZNsuY3wuB8ZpOuVx?=
 =?us-ascii?Q?y+2WBuIDBlKrQaOhEmM19KJBMxDrH/6kjofCZ5CTxggwNgaoyrXqpbvI0SMw?=
 =?us-ascii?Q?EOtsIMHAbxB1o4o5n6TDFKmOdj3ZGk0FXRVJaCcDp8tTg91ske3aaysvVqie?=
 =?us-ascii?Q?ypBJgQIixwNpKycKJqPQMXLhj3auhE98VeunfdVwmcDmPed6BNBx4YZbgjuf?=
 =?us-ascii?Q?nBhRZSdJl+Oozrjz5SQP5uiCLL0AQnCldL+/g//aLIb6x4LJd9hwpeDkugCl?=
 =?us-ascii?Q?tIuoT6Rqrb4jlgjij3Fv+EeedPtWYZSJyIL3bFYtwXaaumlzuZSsxBY0749T?=
 =?us-ascii?Q?Vd01h6ncjmQ2iRl1MKp+nxad/+kiCutnuyhZLo8hm4PFwGK68PcPpDXjHBlF?=
 =?us-ascii?Q?nGJhTZGufm+WgZ+Q4cCHebjcASjVCX3yqLR2v7nPsY88GJxYisgrMmYmYCM2?=
 =?us-ascii?Q?y221z/TKhNnKKdbksH0vyInCArVEWOz3vWzc0KX1XuWiAoBkYZ0Ek4PxZrFI?=
 =?us-ascii?Q?qeMEzNG/i8UttHgCLIdPhyib6phAwpN9Y0t7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:32:43.6128
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4909112-987f-4acc-3808-08ddbe4dd41b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7921

Today, checking for non-fatal MCE errors on AMD is very invasive: it
involves a periodic timer interrupting the physical CPU execution at
regular intervals. Moreover, when the timer fires, the handler sends an
IPI to all physical CPUs.

Both these actions are disruptive in terms of latency and deterministic
execution times for real-time workloads. They might miss a deadline due
to one of these IPIs. Make it possible to disable non-fatal MCE errors
checking with a new Kconfig option (MCE_NONFATAL).

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- generalize the appraoch and remove the code when MCE_NONFATAL is not
  set
- move the new kconfig option to xen/arch/x86/Kconfig
---
 xen/arch/x86/Kconfig             | 14 ++++++++++++++
 xen/arch/x86/cpu/mcheck/Makefile |  6 +++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 752d5141bb..9ec0fb0bed 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -248,6 +248,20 @@ config X2APIC_MIXED
 
 endchoice
 
+config MCE_NONFATAL
+	bool "Check for non-fatal MCEs" if EXPERT
+	default y
+	help
+	  Check for non-fatal MCE errors.
+	
+	  When this option is on (default), Xen regularly checks for
+	  non-fatal MCEs potentially occurring on all physical CPUs. The
+	  checking is done via timers and IPI interrupts, which is
+	  acceptable in most configurations, but not for real-time.
+	
+	  Turn this option off if you plan on deploying real-time workloads
+	  on Xen.
+
 config GUEST
 	bool
 
diff --git a/xen/arch/x86/cpu/mcheck/Makefile b/xen/arch/x86/cpu/mcheck/Makefile
index e6cb4dd503..c70b441888 100644
--- a/xen/arch/x86/cpu/mcheck/Makefile
+++ b/xen/arch/x86/cpu/mcheck/Makefile
@@ -1,12 +1,12 @@
-obj-$(CONFIG_AMD) += amd_nonfatal.o
+obj-$(filter $(CONFIG_AMD),$(CONFIG_MCE_NONFATAL)) += amd_nonfatal.o
 obj-$(CONFIG_AMD) += mce_amd.o
 obj-y += mcaction.o
 obj-y += barrier.o
-obj-$(CONFIG_INTEL) += intel-nonfatal.o
+obj-$(filter $(CONFIG_INTEL),$(CONFIG_MCE_NONFATAL)) += intel-nonfatal.o
 obj-y += mctelem.o
 obj-y += mce.o
 obj-y += mce-apei.o
 obj-$(CONFIG_INTEL) += mce_intel.o
-obj-y += non-fatal.o
+obj-$(CONFIG_MCE_NONFATAL) += non-fatal.o
 obj-y += util.o
 obj-y += vmce.o
-- 
2.25.1


