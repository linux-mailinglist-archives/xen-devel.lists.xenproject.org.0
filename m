Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE3A677CD3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 14:45:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482849.748605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJx8k-0005GG-Nz; Mon, 23 Jan 2023 13:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482849.748605; Mon, 23 Jan 2023 13:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJx8k-0005DS-LA; Mon, 23 Jan 2023 13:45:38 +0000
Received: by outflank-mailman (input) for mailman id 482849;
 Mon, 23 Jan 2023 13:45:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozL9=5U=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pJx8i-0004z7-H0
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 13:45:36 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2082.outbound.protection.outlook.com [40.107.96.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 351b59a2-9b24-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 14:45:34 +0100 (CET)
Received: from BN1PR13CA0015.namprd13.prod.outlook.com (2603:10b6:408:e2::20)
 by BY5PR12MB4950.namprd12.prod.outlook.com (2603:10b6:a03:1d9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 13:45:30 +0000
Received: from BL02EPF0000C409.namprd05.prod.outlook.com
 (2603:10b6:408:e2:cafe::b7) by BN1PR13CA0015.outlook.office365.com
 (2603:10b6:408:e2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16 via Frontend
 Transport; Mon, 23 Jan 2023 13:45:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C409.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.12 via Frontend Transport; Mon, 23 Jan 2023 13:45:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 23 Jan
 2023 07:45:28 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 23 Jan 2023 07:45:27 -0600
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
X-Inumbo-ID: 351b59a2-9b24-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRDlrAhffOntDHJMDIhIPuT6F6ruXQGdXeHnPi8xsjJlg1wOtrmS2VFS4gGefzhRITCcbHDiWdTEmiL1InLF93+7cRSImHXfRifgmfoQd1xlTy4JwdAdAVdUVuo1t0IEEJmYGBUvRz0ba7eF3ZC7L2wvmrttL0EmXN1SLlXQXuXfsaxq0xRtokjAOrniv70nneyAGY7PG8dXSHxysYWv8gB3VU9MPBe84LZ9oiln4y9b1QkvUqowTgc3nhIhc2Ert+ozGI2Xi2DH0R6oWOu4rjiaiqdkf3diU08hzb89WFWaGU36YmxbF0FK1n9nj/gNPsqMO8RSTYwbVM5rV2CLIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fI/wStOnID0RkF6ajH6XFxYRunB4UiMDznXWTD+pWQ=;
 b=UXi5BJxp9CmqubORI+ztYHG6K33gKZHYy8GycNgfw1+lsDFw7jqBrpZyBQ7HgwLy8nL32CGC9GwSvZ2HfMUVsm275N3JAYdFl7lnhWlKaWQw1ZeojHxb6Ev2IQuS59YY0ilSimgB7HA5AD/vN8xpC2D8lTUhCvXXxkHHlYok1ZxaPOPgKUZ0KfMYKMMIXKiJkJBlp0ZWaosHuh2uumaH43UlXw5zDfcVCnzoemqminfPEGvwbgW+JoCKX5qeQoNgVJRP6MZSgjt8olWTeUlJLcq2HqC2fs5w5hGX+PrEgTCTGLZf/HmeNGECGC23p9Oh3C7WmH60I18gdT7PnFHTDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fI/wStOnID0RkF6ajH6XFxYRunB4UiMDznXWTD+pWQ=;
 b=vCZxt+9Kv9qamNjha5CGNaFOfEqcMDwHuowsF6cX1TTTJVQNEMR7mJH7HNciGOu1y2UJF8D1B9X+oZwRsiNb2tPJSq13ljPFw2RFQnzXEIl0RikBm28born5YQRa6FA1g2/y6zaL0wXptopc23eW4/5AeA4/Ud1+T/wU5CpgxNg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <xuwei5@hisilicon.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v3 2/3] xen/drivers: ns16550: Fix the use of simple_strtoul() for extracting u64
Date: Mon, 23 Jan 2023 13:44:50 +0000
Message-ID: <20230123134451.47185-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230123134451.47185-1-ayan.kumar.halder@amd.com>
References: <20230123134451.47185-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C409:EE_|BY5PR12MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc4c396-6b08-48a6-0378-08dafd48170f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FtqA7S0k/5S05cPZtD17e0/3ppmIs54D2Biof9wFuU2U5TMgu/7dyIQLMnqBPxNYd78ZZJbpRJT4DSOkVon4KY+23Cf4z7luuM+nXtQs/myz829MCHPJIKsDcU9+r89srHpll17LE2HV5YAdMvpas0TEmKxvaIGzbx6y9swxlnnwkhOGe+IWTwVGbDjDMGReXHsaVaYrZ+VvQaoz4yNQhhMyUdc41pOZuP5+2KVRd8kyd5F8KO8S5U5M1RGt5ejzjVEt3Wul/J3g2Jb7a67UYU4aR/gj3kcjYYPBkR0vbbHJPJ0Sd8w2IIQSXaM7skDw/B3fYdSQg41oXZRC54c9tuKVcjog+nGCNVpKCMC52GwByY8U8se55ELk41UkWV9YhLUD5EsPPLR0L/C9G5vqKtG/+SUqtgkAwDzZpMzLv9AQYCzpgw+s6Sl+zkru6fWniZNApOEjHR9ZLQHjUhE/5LJCyAygvyQfTkQwYUUOf6TVr7zDBqOBzEuUJ3EkYHue/qMAI+Seoup4KqZHS6R/ZCosbkCXjuCgpNWyo5OpLoEKQLy7GapYX/TtOdwQIeYBFOiuA6CfyMu+u36y8pU1VcISwbfWjSdbwO7wGHZ0XBnEYB7kl3kUnEpZnUrjCfPQS3WCxXE8ixSnXgYVTYiZCg+igtSUuLq//2eK+qlnPC2k6IkrynNpbwjSHtOkNJfHGLxozolVrfsn5H3gDux3fA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39850400004)(451199015)(36840700001)(46966006)(83380400001)(36860700001)(70206006)(70586007)(86362001)(6916009)(4326008)(8676002)(316002)(54906003)(36756003)(40480700001)(6666004)(26005)(186003)(478600001)(356005)(336012)(2616005)(81166007)(103116003)(1076003)(8936002)(47076005)(5660300002)(7416002)(82740400003)(82310400005)(2906002)(426003)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 13:45:29.2366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc4c396-6b08-48a6-0378-08dafd48170f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000C409.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4950

One should be using simple_strtoull() ( instead of simple_strtoul() )
to assign value to 'u64' variable. The reason being u64 can be
represented by 'unsigned long long' on all the platforms (ie Arm32,
Arm64 and x86).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -

v1,v2 - NA (This patch is introduced in v3).

 xen/drivers/char/ns16550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 58d0ccd889..43e1f971ab 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1532,7 +1532,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
         else
 #endif
         {
-            uart->io_base = simple_strtoul(conf, &conf, 0);
+            uart->io_base = simple_strtoull(conf, &conf, 0);
         }
     }
 
@@ -1603,7 +1603,7 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
                        "Can't use io_base with dev=pci or dev=amt options\n");
                 break;
             }
-            uart->io_base = simple_strtoul(param_value, NULL, 0);
+            uart->io_base = simple_strtoull(param_value, NULL, 0);
             break;
 
         case irq:
-- 
2.17.1


