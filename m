Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99492730BE5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 02:05:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549308.857780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9aUH-0007Cj-Ty; Thu, 15 Jun 2023 00:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549308.857780; Thu, 15 Jun 2023 00:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9aUH-00079t-PR; Thu, 15 Jun 2023 00:05:17 +0000
Received: by outflank-mailman (input) for mailman id 549308;
 Thu, 15 Jun 2023 00:05:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WANU=CD=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q9aUG-0006Ty-5F
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 00:05:16 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d7dce9b-0b10-11ee-b232-6b7b168915f2;
 Thu, 15 Jun 2023 02:05:15 +0200 (CEST)
Received: from MW4PR04CA0304.namprd04.prod.outlook.com (2603:10b6:303:82::9)
 by SA1PR12MB8721.namprd12.prod.outlook.com (2603:10b6:806:38d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Thu, 15 Jun
 2023 00:05:11 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::d5) by MW4PR04CA0304.outlook.office365.com
 (2603:10b6:303:82::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37 via Frontend
 Transport; Thu, 15 Jun 2023 00:05:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.25 via Frontend Transport; Thu, 15 Jun 2023 00:05:11 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 19:05:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 17:04:42 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 14 Jun 2023 19:04:42 -0500
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
X-Inumbo-ID: 4d7dce9b-0b10-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrIvBp3JGh6ZSlnwfU6e0PNgqqUzgE1V8Yp/PrednBbwjJCneUxlTgkTtKNIhaSYeVd5wBJIwzgfzv6+mv4rfOLQOjhpHK9DKH5CFYju9Rc2P1EiszIG+7WuxkNvd67AS3/gRRGLsAnXd43sCbPUVIW9Styq1bRUqZ+cOCRaR01uWvmJnhpbKgiHQNN1j4pckgk209CPlPop9B1q0lO7x3lPloI7gcvPQQ61QHUuSVdfOGGPQ0yNo2qc1ZG3xJ5wBbX2BM9Hj+InxG1udov75a0WXg26FxiFmVqQ2nFtyoH6n+ktsUVTWPw9+RJBiyAI/+Ofj0E4UiM+2GPrZIbXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOsqWHq5VHxUgGsBfaYThNjh0r5g1aFE14BtltHtrOE=;
 b=YKV/OBLphnLlthGUJSPvWkVFm5g/GDy/BvK/pXHcSHkFeBRCIggbbSR4IuL3ZdNoyd6zMV6Gdd2yDPOgihattlf+aPzPrX9yxrbfb+HmVOIb6ASxNdZiaZnAbl0YbKNFoFuWg5FJrgIE5KNoucbJZuqC2ggaRB2PLnlPZgLaziqkBEQPP3tq35m+Rji/uSrELEEtsj0EBKGpJFejw2olSZeiAW8Y2qDKjOYg4Rur9idVivNfg0LEeh/hGL7EYD96912+eCmzZHHT/cTzA9W6L1glm/Ixq5Pan9Z8BW6HJogujpzHDR1e1pO8NwOCGBncEkw23+yeLOCzaXFPHpsdxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOsqWHq5VHxUgGsBfaYThNjh0r5g1aFE14BtltHtrOE=;
 b=OVVRWQbU5speFy+0MY5tRyLvhm8bmi8+OqWRTV7C4WIIKGNhmFtje5DmCRF99MHMiykhxlTHUpZAurvbeEc6Gw+E5xkY01mD5NyEgxeXu+R7dqA0hZwh5KcKGwofwDiJzU59thHOG4fhRznf0ys6cGkZ7ihAD59I+P8MULMZtqI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, Anthony
 Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "open
 list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCH v8 07/11] hw/xen/xen-hvm-common: Use g_new and error_report
Date: Wed, 14 Jun 2023 17:03:35 -0700
Message-ID: <20230615000340.1135-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230615000340.1135-1-vikram.garhwal@amd.com>
References: <20230615000340.1135-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT022:EE_|SA1PR12MB8721:EE_
X-MS-Office365-Filtering-Correlation-Id: b88cc8d6-dd8c-4332-2b78-08db6d34301d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZvG/6GVMwnih8VNIYEZjOZRgz7xXzBE6C5wTwQMYcy8G0gNNw15QgY6ejG+bnotPF5K6ZXcf56+pGzaKCGQ+cmi8UzqI7XqNZOQP4Fobv8hzyij6LnJRm4yC1j17UrhHiTbHM8mKvj1A8a4MUjdWToN53AZHbXBkVkR+374LEmBcQIAr9A+Bb0SPpZlgWS5197rDy+5DlOfmNxSf1FjBCp5+/NOA3CYFMc5heX+hmEy4Ztxvl5ms5LAw/P8oA0yNUPqP4jZzpTuHNiELD32VPJ0nc/eizIRaOSFdf+qlxhuAr2CiewDrb7IlpVNYlKxV1Eh1ZeEbfA+8CJJmExY6ISDU8XLIefoALGHrNrtQXYlnjFSrOzksdQs6NwdfC1Svs7/LQf01Fv0l4rhbgtTLj20kgg766FRnXFQcBSGf6EdnDG5iWdpH8VSOLzRhnNLOncGaJD2OFtF93BAliUVqtjjjLr5hw8gp9laiexR4pOFCIa54W6yo4WWroCQDhFcrn0yhsoLfZt8AF2U43R5NRuh79+igS/+JTnDT6+etmQahyUu9Z7bWg70LEhzM5x8RHUbQL0M9u0Icaj6WpiRR9FWmbTitW7H4cnSPAd6atvps8AXZap+NqdOa8mp11LXbnlAbV6wM2id62v8lsXwZJRuaS1Rp0ZTLjFMY0bij/2gn4kOulRx6jWYozPeRLZg2JDkx3XOLjsBk8CpU6zdD4OfxVmx36t4CPIRyG1EakZtJbbSh97CCmMjvLKBhywvFodF6gxqrbpxJ/Y/GwUjPLA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(40470700004)(36840700001)(46966006)(26005)(1076003)(47076005)(81166007)(40480700001)(356005)(82740400003)(41300700001)(316002)(478600001)(6916009)(4326008)(36860700001)(70206006)(70586007)(6666004)(186003)(2616005)(8936002)(2906002)(36756003)(8676002)(86362001)(5660300002)(44832011)(83380400001)(40460700003)(54906003)(336012)(426003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 00:05:11.4596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b88cc8d6-dd8c-4332-2b78-08db6d34301d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8721

Replace g_malloc with g_new and perror with error_report.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/xen/xen-hvm-common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index cb82f4b83d..42339c96bd 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -33,7 +33,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
     trace_xen_ram_alloc(ram_addr, size);
 
     nr_pfn = size >> TARGET_PAGE_BITS;
-    pfn_list = g_malloc(sizeof (*pfn_list) * nr_pfn);
+    pfn_list = g_new(xen_pfn_t, nr_pfn);
 
     for (i = 0; i < nr_pfn; i++) {
         pfn_list[i] = (ram_addr >> TARGET_PAGE_BITS) + i;
@@ -730,7 +730,7 @@ void destroy_hvm_domain(bool reboot)
             return;
         }
         if (errno != ENOTTY /* old Xen */) {
-            perror("xendevicemodel_shutdown failed");
+            error_report("xendevicemodel_shutdown failed with error %d", errno);
         }
         /* well, try the old thing then */
     }
@@ -784,7 +784,7 @@ static void xen_do_ioreq_register(XenIOState *state,
     }
 
     /* Note: cpus is empty at this point in init */
-    state->cpu_by_vcpu_id = g_malloc0(max_cpus * sizeof(CPUState *));
+    state->cpu_by_vcpu_id = g_new0(CPUState *, max_cpus);
 
     rc = xen_set_ioreq_server_state(xen_domid, state->ioservid, true);
     if (rc < 0) {
@@ -793,7 +793,7 @@ static void xen_do_ioreq_register(XenIOState *state,
         goto err;
     }
 
-    state->ioreq_local_port = g_malloc0(max_cpus * sizeof (evtchn_port_t));
+    state->ioreq_local_port = g_new0(evtchn_port_t, max_cpus);
 
     /* FIXME: how about if we overflow the page here? */
     for (i = 0; i < max_cpus; i++) {
@@ -850,13 +850,13 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
 
     state->xce_handle = qemu_xen_evtchn_open();
     if (state->xce_handle == NULL) {
-        perror("xen: event channel open");
+        error_report("xen: event channel open failed with error %d", errno);
         goto err;
     }
 
     state->xenstore = xs_daemon_open();
     if (state->xenstore == NULL) {
-        perror("xen: xenstore open");
+        error_report("xen: xenstore open failed with error %d", errno);
         goto err;
     }
 
-- 
2.17.1


