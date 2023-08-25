Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66D578817E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590558.922968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmo-0001sd-J0; Fri, 25 Aug 2023 08:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590558.922968; Fri, 25 Aug 2023 08:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmn-0001VS-RT; Fri, 25 Aug 2023 08:03:17 +0000
Received: by outflank-mailman (input) for mailman id 590558;
 Fri, 25 Aug 2023 08:03:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRmj-0007GZ-EY
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:13 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d549fb41-431d-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 10:03:11 +0200 (CEST)
Received: from SJ0PR13CA0187.namprd13.prod.outlook.com (2603:10b6:a03:2c3::12)
 by PH7PR12MB6468.namprd12.prod.outlook.com (2603:10b6:510:1f4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:03:08 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::30) by SJ0PR13CA0187.outlook.office365.com
 (2603:10b6:a03:2c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Fri, 25 Aug 2023 08:03:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:05 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:03:05 -0500
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
X-Inumbo-ID: d549fb41-431d-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fs7dRZlvKEOhHv+E6cEfm2fZ0nfh5k3uB4oDbP1q0FRo4BN7Lxgrr78LDaEjI2NN8ppFTDDLHWPzXODJh4YYSl0UScB63mxe6uXeXYp4PmQXWIJi24OQ6vnUN4nTgk7MztMoJEz5wzraVY/wwt8+qqawfZLot180x3MSzccMeCi+mVP2KNaRUNArGAkadCCq8YRj/I94oEg6I/B/oQpD1n9w2xxgvK4xSsph79cLrcAAnWSEzZG1X6IgUOf62G1pkUhs7hOxtIHfh598HmkCXlOvU3rRAQA5s1a2FwlansMAbnfbqavr+QkucSq9iKnWT/Wf0XWeat1l6ebdot9w7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDhW7f5w3p+/XHERjQf4wWurMSkKNLV2sxdzRwRCMQk=;
 b=DsiBT9jjQhqD0zQRf4D+MByTVTTUTOKSG4a50D9pHVbvY7kaVl4XnyL7sYdnivAj13uEVzdUMeBnqIZ+45BqDYXHKyJaFXUXt/+3qZMwxHx1fHXmC7i1CK814NthhmRbdyfS2kcuWjnMN52EbQbssTq+KAzBo1ohb5gjcFyHxUoNbrE6R3Kgg7suG1oPBzAPBbiMBHIHoy1Zk68ve0vFNDLTpmJQrO4JWo7rAV6AkNqC+ol1j9p8i/sL0DIAquu68dhppSskgIcbuLiFZskhoDJ/lbBMB55mDZh9Awr5hWaLsfU8dW9bmW+4yzzuzXBY6xN4J1NrWBJ+Hzo5QUe2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDhW7f5w3p+/XHERjQf4wWurMSkKNLV2sxdzRwRCMQk=;
 b=HJuHfWG/PoC2FQpydKkiVaKhWDeLqd97oamHeUlGLsrRZH2bZhBlwSrWhk3WZpKTqShhi/CPqMuntAmxyw7Ht69/4+CguXJbokRkxfa3U2Q29NQtrbfs1+dvG0rXAZesc5Ft47w8L2e7z6d2D6EeUmbPj5IylZFNsdBQcvkFiEE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v10 13/20] asm/smp.h: Fix circular dependency for device_tree.h and rwlock.h
Date: Fri, 25 Aug 2023 01:02:15 -0700
Message-ID: <20230825080222.14247-14-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|PH7PR12MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: 3699c4fd-6df1-438d-976e-08dba541b7cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EJmj9JmKq4l8UAVdzucsDdS9wHrBcBZMAyC/L5+leOja8hlGM20/t+tN6Lvfny4Z5qHpynMjmxS9fDMShW6TrWI0q4U6RDuwSUgLa7MXTja3TgNpwVyo4I5x66wicO+/Q14MJLPezuQsBhIkOHx5cOHG8MTi8/lFqJ3TtvK8a/gWD5oLX7U33EuNsuneIbhGQ01ojN8uAPgOPROTByrXXjqPtXlYzxw7mQNkg/ozPRBcXERF2sE68JhiH4p2ZC+yhwsLMGlDeUeD+InpXDkp00UDPqgldo0s9/r2KD3JSo4pW8gGcgu1JCGF2JdQDLOB2QGQICD8R6yttmUns4rFCFcVgyyNGuMkkuZkJzz1OIkT/Y4v1JIoUukF5e02eczFXl1S2DPTMQBJ+pQHWUE8DRJJxjM9ZWDzWRPdhe/TpadVG+5XWyfQjssyzzatFON/Y+4naX+WmgabLTavbZO34w125alfCAOFo309fTYa/7Dxc4SbZvOhDZbvwPJZYjlthHLC0aVAgzu3VYx+Q437R3nEKNtZESY6z3g1AgByDBeDIHsgJ7n4cgX49Qp61GJYks+xQ4/chRSsinsD2Bmq/0alCcf5zpp/4/hObbhHOnGw3uKzlSFIMkQ07QAM0dCpK0XXimuX3SC8MZJF0n7WYztofoVCySZ5IJ94fFvGeHuKqTW1TEvbwUw5iLaMBwyAOEJPKWRoeRzHCdzscmoODxO2mvMJgYlxyLyQjm46Jaa/tVblnZcIEK3lVTD0FZhtZfGeT1NXEvW5hdNJhALrDQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(82310400011)(186009)(36840700001)(40470700004)(46966006)(356005)(82740400003)(86362001)(81166007)(36756003)(40460700003)(6666004)(478600001)(5660300002)(70586007)(54906003)(316002)(70206006)(6916009)(2906002)(4326008)(8676002)(44832011)(8936002)(40480700001)(426003)(336012)(83380400001)(26005)(36860700001)(47076005)(41300700001)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:07.6631
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3699c4fd-6df1-438d-976e-08dba541b7cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6468

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


