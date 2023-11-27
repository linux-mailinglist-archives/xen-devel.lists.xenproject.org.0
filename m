Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C105C7FA335
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 15:42:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642190.1001515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7coa-0005EQ-KQ; Mon, 27 Nov 2023 14:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642190.1001515; Mon, 27 Nov 2023 14:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7coa-0005Ck-HM; Mon, 27 Nov 2023 14:42:24 +0000
Received: by outflank-mailman (input) for mailman id 642190;
 Mon, 27 Nov 2023 14:42:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpch=HI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r7coZ-0005Ce-JE
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 14:42:23 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2af9f360-8d33-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 15:42:20 +0100 (CET)
Received: from BL0PR02CA0092.namprd02.prod.outlook.com (2603:10b6:208:51::33)
 by PH7PR12MB8039.namprd12.prod.outlook.com (2603:10b6:510:26a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 14:42:17 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:51:cafe::3b) by BL0PR02CA0092.outlook.office365.com
 (2603:10b6:208:51::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Mon, 27 Nov 2023 14:42:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 14:42:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 27 Nov
 2023 08:42:15 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 27 Nov 2023 08:42:14 -0600
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
X-Inumbo-ID: 2af9f360-8d33-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCOz8QhntX6ZgEuNVIAQkDJWNanWm+gkue9dpazBrUT/SVKIt9gQwwsMCZYF7IJb80iN6ORNUmFP59Db6oF7P57j8PNCkPdpBe3/reA20LNkXnTlE4CV9f+Za5qGje3JloSlrLbvovd05eAYsAmLNy5uz11Zqbnmr70hDPhwjcgU3qMHNHSc6BeqP2mnQNhEXsvbZxc7fr9ZESYfqPopVI3yStu2TpT/hHPMG53hh8s0e8LAAUlfv6nps9DdIImq8r3kucjfZ66pgwsUjpCr1wEgkfO2IVbOu6Byq/zQmEgAmNaSnuO4Lz6hbi7vJ0s2jhLj9nR4FSaUFILH5PL9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8txgQdFFbhv199fN7KInBreuwQAnXt3XT1taWmKNQHU=;
 b=Zu6ATWllDw9+ywg0Vu6ZD2xKMVeto7sfJ1nwdOSelHkO00hVOuQsJLWu6URMUFE0yXtc1l966eKF0vxsYhoabkRgaGmJjXrsRe1V90ZANixgROScD48JJRgB/WHejJLyaQMEHJ/r/iOGvwZqFy+w44s77tMM1YkxKGpqWs+/Q4MwIakvr1j90UEvwxq6Q4f3UqZsaNMsvDobDW+NwrRnF8kv8bGH7X0VYC54u6EpJTp/9NpkpAvVlvvCX6newlrWsTp9wP9whDUhVMSEvYXISRb1tPBFAHTh6iyX4C+kCXsSv6K+ya3e1Wwd5jOmPnwkpq9c8YmXAjMCyYbaNhBKaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8txgQdFFbhv199fN7KInBreuwQAnXt3XT1taWmKNQHU=;
 b=heN2UZU394s0MWbcTTwbFON8uCgKZ4MV27ZHg1AJ4KtZCtxjSVcmZNnH8x/OeXNv6SLiCfqzIz/1AfkFO1rf7ryPhyB3bYODCEuTl5ZyL4GVOqwRD5RjzhVb58xFjwToFPiR6TdtwpylBokha9jktUUjwI7ju28I/HcQNqwuRaw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] ubsan: Introduce CONFIG_UBSAN_FATAL to panic on UBSAN failure
Date: Mon, 27 Nov 2023 15:41:55 +0100
Message-ID: <20231127144156.361656-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|PH7PR12MB8039:EE_
X-MS-Office365-Filtering-Correlation-Id: 816a8274-33e8-4fe4-9f37-08dbef570d15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TJ/xklmR7Htz32OwbYr/BlGC0pNaC/zj2crKGxGgVUCOjTF+94e5GHz8NmXktmZubEnL2GPrNBXSxkcL5qi7w6YXZZ/+7a6qCtPJU0QbZkabFZ7FLW57PQVHpjWiQjYHcei0jZfqumY1FMPwEzyLmUnCC5eRdqFplWUq/INZQwuVrD/sAUsaKIyjexg2WYQl6O8gAonkY11QuIPZCNHaovRrAf9yur4j4RSa3i26xBRiqxcrSYmtrVc9OOTvemtnQOaPZd0aDLxbiNTp8Rt+pwHqe81u7Zg6CD91L9C/Rqe0+kx9umCrCbOLXVSM7/b292JgPwFWFXoisEJdulq5UsFCBrJ7Qe7ziSt4M2xUHqP2PmYWl3KKohdI6KI6PeEBHmm2RE2EfhD+yfe4Gf4OOgry+4XGzexFXAZGHyPmjKyopJW1UqmI6JwbHKFgCuQ9T3VhruKv5bkTgfNPUs3vJ3P329kiRwskN5yO6wACpMwpvpiddsjNvc27QYTuhaGn6CseR/8fTZNYbvUsuTtY/RAhBznGpDeQPSt7rAQHnVFNHquFxyLjzsR947SA6pTwwkibDnMPhhFlNaCQlRA7IgZnjnjeIGHnkgnh3MB9706eip2oXciVV5fjdBve7vPcY2RUKYRonRv0n8IOGFNyFMAbF1selCgJun9UcxQ0gMwFlhMNho3b/1bfmwEFr0RTogmvsg8eFh06sNkZf8rNnC7fSQOxojGhcpnmh4NHmTr4XHBNl8xYDxLFgBbUV+gdW7DkQx7XqSvkkRo99FJp3w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799012)(186009)(40470700004)(36840700001)(46966006)(36860700001)(36756003)(82740400003)(356005)(81166007)(40460700003)(86362001)(41300700001)(4326008)(8936002)(8676002)(6916009)(316002)(54906003)(70206006)(70586007)(6666004)(478600001)(5660300002)(2906002)(44832011)(47076005)(426003)(336012)(40480700001)(2616005)(26005)(1076003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 14:42:16.3302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 816a8274-33e8-4fe4-9f37-08dbef570d15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8039

Introduce the CONFIG_UBSAN_FATAL option to cater to scenarios where prompt
attention to undefined behavior issues, notably during CI test runs, is
essential. When enabled, this option causes Xen to panic upon detecting
UBSAN failure (as the last step in ubsan_epilogue()).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/Kconfig.debug        | 7 +++++++
 xen/common/ubsan/ubsan.c | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index 94e818ee09b5..e19e9d48817c 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -107,6 +107,13 @@ config UBSAN
 
 	  If unsure, say N here.
 
+config UBSAN_FATAL
+	bool "Panic on UBSAN failure"
+	depends on UBSAN
+	help
+	  Enabling this option will cause Xen to panic when an undefined behavior
+	  is detected by UBSAN. If unsure, say N here.
+
 config DEBUG_TRACE
 	bool "Debug trace support"
 	---help---
diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
index a3a80fa99eec..dd5ee0013648 100644
--- a/xen/common/ubsan/ubsan.c
+++ b/xen/common/ubsan/ubsan.c
@@ -174,6 +174,10 @@ static void ubsan_epilogue(unsigned long *flags)
 		"========================================\n");
 	spin_unlock_irqrestore(&report_lock, *flags);
 	current->in_ubsan--;
+
+#ifdef CONFIG_UBSAN_FATAL
+	panic("UBSAN failure detected\n");
+#endif
 }
 
 static void handle_overflow(struct overflow_data *data, unsigned long lhs,
-- 
2.25.1


