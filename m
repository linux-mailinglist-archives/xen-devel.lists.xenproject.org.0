Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FB6797DC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 13:24:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483528.749732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKILv-0004t2-OF; Tue, 24 Jan 2023 12:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483528.749732; Tue, 24 Jan 2023 12:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKILv-0004qS-Kq; Tue, 24 Jan 2023 12:24:39 +0000
Received: by outflank-mailman (input) for mailman id 483528;
 Tue, 24 Jan 2023 12:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KMs4=5V=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pKILu-0004Vt-AC
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 12:24:38 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062.outbound.protection.outlook.com [40.107.212.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10e786d3-9be2-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 13:24:37 +0100 (CET)
Received: from CY5PR15CA0072.namprd15.prod.outlook.com (2603:10b6:930:18::34)
 by LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 12:24:34 +0000
Received: from CY4PEPF0000C96E.namprd02.prod.outlook.com
 (2603:10b6:930:18:cafe::8a) by CY5PR15CA0072.outlook.office365.com
 (2603:10b6:930:18::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 12:24:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000C96E.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.12 via Frontend Transport; Tue, 24 Jan 2023 12:24:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 06:24:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 06:24:32 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 24 Jan 2023 06:24:31 -0600
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
X-Inumbo-ID: 10e786d3-9be2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OU6X2r2k6ruapGOXDaflot9dt5fmXaJfkmPnOAyAzIOPB/TVhb6nlBoHp3/fYc0fXkrTKyWIqmqKNKR0/ggGKmoEaUbVjUEJ8E8Iub6Ak6TjzgAE39PRuKp0Xtnj3F/Kv0j4JNkdkWaoJbfc0jxGtT1DBMlO6iVZFEQkgCpysp4ArjcLYqJq9t0zkq010EGRcrbEKV39wP9vEZI/WcR6JJ9CkJDy8++9tGmghMX0ZWHhy/nrNovm33MgaNwi4nnLbK/g6u1d7Ol6o79dvrVpo2gzrD0C/bla78JIWzDz+FKdphqw6uY5+kMe/aHNffeHJ8qB1r/gV71q6CN/7obTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwJ1LfxOnpXeWIA1K07X5XJHKcSKQkZLrmyDBfROR78=;
 b=EBvOLbbmAZQ1bbqTGm01RAJ6zZlvgdtM1gFEAL8NZAhnP2ol6fDxVz0vt9togQFRMXuVn2n48rr65rXVc28RhZjhfy22s6CGz5sF05mWZlnFj9LGmuEr2b5ZY8kc5zySplbggBwF/7XNqDRuZ/cFBsc7zhctkj7pEbDg0kWLORL8wUWKA43HwOU2XvqbbMLxKBMn9XH/XyI4/uWBvJTBCOG2bYCY+bWBJKIFovbv20Bp/oJg571VTKg869ftq8muEWE0KgSZu3m+IYk9poU9ZeYsfwNrLownVez9j9a10JKAP/txZaibsuACww2M6/nI48pRFQMEul22qt2KoYeFFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwJ1LfxOnpXeWIA1K07X5XJHKcSKQkZLrmyDBfROR78=;
 b=Un8EkCK6ClH8ZOO+otxiTkA1imf8Q2BOCnaGKysCDs19F+wd47asG5lhQMT0RjpF28iH0IYU/vMaHWp4AhEnzWXM+5P+PrOBlEIXiNXretH3D90zwMTZCIJKOd3Gx8KUidBmTpmbdoIocGKdmQG3OypT5AgmqdvxKIz6cUKOeF4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <xuwei5@hisilicon.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 2/3] xen/drivers: ns16550: Fix the use of simple_strtoul() for extracting u64
Date: Tue, 24 Jan 2023 12:23:35 +0000
Message-ID: <20230124122336.40993-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230124122336.40993-1-ayan.kumar.halder@amd.com>
References: <20230124122336.40993-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C96E:EE_|LV2PR12MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2be0ed-8941-410a-74a0-08dafe05f363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l8gzHSm+U/Rdcj9/xuWRuAlV6PxoIoGSn0JGGYCUk3zeDLdonKdY2RMlYpSeY5jKOLV0QwTmrDhfKSMaFnjTox/qoZCJe8Zd+fXy9XY/SuhiYoyrmvWjZsM0I2J2QYSjEb4UfSmLA9k/2bcWIA+hL/FHMTAfO6dy49AwfsmnsEH7VxvLk23zE/iLs3Ac91phMi8Vrfzd+sMxCncBhgNotxBQrUrAQoX5YssTK4Kij6nTUGVtKPBhV50jt7bk/kDVGbl0ElVmXalpJ8faMgbk2vglef/kDthVsT/mL1mJaTdWYh8h60lsjaQnv6dOb0dZq3h/OPN7gZichfD/Y/K8vVYB9vFFd7VeNJk+1UK+kMK6EhrP8iZmUt2u0AUC/remQAYEAI4qJvhbz2HQ+mI92DTrbnf+2wbYBpmbJHz8Rv66oErRfVuVeIykAGOK4R/n/dHyMJgZHcfnQVmrc2ZIaBNMLA0hSc8dMuXfMLT7C3RdNkBuKpfVjvfUCgA3e2womi4M2JGqU64PJseiH7EJ9UOZbajRcOU/xKSZ+oNJSaTSrzTgfsQVTyoTvF9BMETfO4pQda9qjMTRyMuNT/HghXv5Z/vqHdiyze0LWaHVGLRobMo+0PUfK321fRVfYKQ4hNaxEYymeTyoY9PuOxP6h7jRmKlkTNQpuZzaz/i1t/7EOX4ERGoH6mRfmmgyu+ZYQ14sHsUZI7pueZO+jRqQbBL9gtsIHxkEbmiVc4V3UdQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(36860700001)(70586007)(86362001)(70206006)(6916009)(4326008)(8676002)(54906003)(316002)(36756003)(40480700001)(186003)(26005)(356005)(478600001)(336012)(81166007)(2616005)(1076003)(103116003)(47076005)(8936002)(7416002)(5660300002)(40460700003)(426003)(82740400003)(82310400005)(2906002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 12:24:33.7081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2be0ed-8941-410a-74a0-08dafe05f363
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C96E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5966

One should be using simple_strtoull() ( instead of simple_strtoul() )
to assign value to 'u64' variable. The reason being u64 can be
represented by 'unsigned long long' on all the platforms (ie Arm32,
Arm64 and x86).

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Changes from -

v1, v2 - NA (New patch introduced in v3).

v3 - Added Suggested-by and Reviewed-by tags.

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


