Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9854878F7DF
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:12:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594324.927648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwS1-0006k8-Vp; Fri, 01 Sep 2023 05:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594324.927648; Fri, 01 Sep 2023 05:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwS1-0006hX-Qe; Fri, 01 Sep 2023 05:12:09 +0000
Received: by outflank-mailman (input) for mailman id 594324;
 Fri, 01 Sep 2023 05:12:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGo-0001Hn-E4
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:34 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 796f3ef0-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:00:31 +0200 (CEST)
Received: from DM6PR11CA0013.namprd11.prod.outlook.com (2603:10b6:5:190::26)
 by SJ2PR12MB8010.namprd12.prod.outlook.com (2603:10b6:a03:4c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Fri, 1 Sep
 2023 05:00:27 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::eb) by DM6PR11CA0013.outlook.office365.com
 (2603:10b6:5:190::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.25 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Fri, 1 Sep 2023 05:00:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:13 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:13 -0500
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
X-Inumbo-ID: 796f3ef0-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABMb5caoFTHdGE90hdcC1LS27NfKX+6tsf9efu9pI6wnqLuVE1Kv7tvadcp7dvGKxttrBSeLVDdHTE5Dv1hbmwMo0DrsTIrGwQNfqRb2NOi8tBB5eifh1UDX/HPRnaQGy4n7ZOOV73s9ULVQ45Nvvhy33JC8pH4yvZKUWEcdaCsxd9NSaJZmYfi/gWWvZ9JTrBwUdmjIJUfZoB+TyuE+tUnM3wgvOi91U1bv2FTZAiAiCS220vSkTWFeO8Yi5h+OioHeCwy/oR+kaPQQ1DxR3KMVSijmHJOpBrLKzkub2yBk/VWsVnzdQolGmnXkdBuIJWzTb8ddXCuJc25umnFB4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDhW7f5w3p+/XHERjQf4wWurMSkKNLV2sxdzRwRCMQk=;
 b=WGEDvkUmdOMpVH14woCHDpQF7a55A2xKmXLfqMGsqtLgXgoaNfryumvI7E4CA1m7vPA+aV23stgIFD/VJ8wJx83SXWnitZbnlrByjrSvhBhU9cQYCLA5hHBxs7ZZ1rUdV7GlkVsCah9W37IVIX4RM+HKEOI9sK98yQVi/MEWHoNwKV21fpRSwd8F5ILX8m8qQDsKo4aKoGNU4kprvheh2vOT3yHJKYi+G1QOu22PsyEd31nb4n9U4edXQPGKlJg9cOb2Z3nq1EcsJwBYJ8dOzg2/Lxk7J1AguufP8zTjcbRwkl2ByNaqhQ7gHvGHWAnNAjZSI32KLPMp300JVdYxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDhW7f5w3p+/XHERjQf4wWurMSkKNLV2sxdzRwRCMQk=;
 b=lmcDpSLY/D7Ar+F1Vtnkm+MbuYRjkAJzvO6MAAUbPAQeBZBkTDsaeo4WgFO/BNvykh/nQyEIVWMfiq2DI/I/+ckPtLux5LhT99QY1h8krn1AUmS8OiaD7ILzDeQMQKMFcxUfagf6eunTEWpGsaQZYGOAsKg9MzSkpPPrOG8E0Cs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v11 13/20] asm/smp.h: Fix circular dependency for device_tree.h and rwlock.h
Date: Thu, 31 Aug 2023 21:59:40 -0700
Message-ID: <20230901045947.32351-14-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|SJ2PR12MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: c4adddf8-0b03-43df-a3c5-08dbaaa85b86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PH23t3earyBwOkWZYWC9RGyr/2+0hhZ6KnZIVNcCGvmiKJhUjmWi5sOFrLu1Utue0z5NlwmAZL1MCyXwCTdnUZ6W3ODJcXUPPdQGqMD9AaXhRkUPANgJfRdJ2yP41+U5N6lNzTeQnPefVSf4lY+DB68JfRHuCh0Sv0sFPjKyKKCr8wy96jhKVeFIt+TJhAf9i+pSu0STzYl3dmCd+jRKFDsVQQPSXLt2ZENtz2zT8rzIWrI28RdlkH13vqzqr5g1MljehlOmQI08x1LqaiupkTYOhgKXI/jaYwsXkenOYgUpnUbNQnHCzz7FrWN//ZLRUkbuOC12wWPj8G5l/3bdC2rR9jDsls0hNzLFx3wU9o73qW5IFZrjWbWnUUjpnK0P1iWa+S5V/C3Npq7m6KKW9jKNnOo4hG9vc6YcbZhDQbh4k1kMbAHzyuti2+nzII37zznzdigYWoscd6PTxNgMCwuJ5UUDF+9JFJngr03St9HdySowbWMElVnVfNvDa5ihZH87Fd5X/I8Ra4DPgKlmSCpqm3/ZDQaMjRIdCqi3jRoKB8ISkSPrFbbwlX7OQ+Vb4pQDkW5ylkEJVqA+PIdidHcDbbig1+zbGPxNWhjHRiiuyemsJ43iAUFk1vs+nbh+A9D/Y0dFq2VgE7ex7MMMjpmvjdqW77468+TutfDROzMPtC4yDdehYTfkWxJADEWd+v5IbqIIA5Rs5WH+bG4I4t2sUqly7HWodLhilL2H1j6ouCSVU1hwghFNXGALc9Zgiy7Mp4B1ZGDe/M5g3a61Lw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(396003)(346002)(1800799009)(451199024)(82310400011)(186009)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(2906002)(316002)(6916009)(70586007)(70206006)(356005)(82740400003)(81166007)(478600001)(54906003)(5660300002)(8936002)(86362001)(8676002)(4326008)(83380400001)(41300700001)(44832011)(2616005)(36860700001)(47076005)(6666004)(336012)(26005)(1076003)(426003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:26.8741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4adddf8-0b03-43df-a3c5-08dbaaa85b86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8010

Dynamic programming ops will modify the dt_host and there might be other
function which are browsing the dt_host at the same time. To avoid the race
conditions, we will need to add a rwlock to protect access to the dt_host.
However, adding rwlock in device_tree.h causes following circular dependency:
    device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h

To fix this, removed the "#include <xen/device_tree.h> and forward declared
"struct dt_device_node".

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
    Changes from v7:
        Move struct dt_device_node declaration just above arch_cpu_init().
---
---
 xen/arch/arm/include/asm/smp.h | 4 +++-
 xen/arch/arm/smpboot.c         | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index a37ca55bff..4fabdf5310 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -3,7 +3,6 @@
 
 #ifndef __ASSEMBLY__
 #include <xen/cpumask.h>
-#include <xen/device_tree.h>
 #include <asm/current.h>
 #endif
 
@@ -23,6 +22,9 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 extern void noreturn stop_cpu(void);
 
 extern int arch_smp_init(void);
+
+struct dt_device_node;
+
 extern int arch_cpu_init(int cpu, struct dt_device_node *dn);
 extern int arch_cpu_up(int cpu);
 extern void arch_cpu_up_finish(void);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index e107b86b7b..eeb76cd551 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -10,6 +10,7 @@
 #include <xen/cpu.h>
 #include <xen/cpumask.h>
 #include <xen/delay.h>
+#include <xen/device_tree.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/init.h>
-- 
2.17.1


