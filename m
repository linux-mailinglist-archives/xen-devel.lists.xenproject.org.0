Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB42368399E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 23:52:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487904.755757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzUK-00021L-Jd; Tue, 31 Jan 2023 22:52:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487904.755757; Tue, 31 Jan 2023 22:52:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzUK-0001uY-Dv; Tue, 31 Jan 2023 22:52:28 +0000
Received: by outflank-mailman (input) for mailman id 487904;
 Tue, 31 Jan 2023 22:52:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skZt=54=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pMzUI-0008Hj-Co
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 22:52:26 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe59::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed5f3a07-a1b9-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 23:52:25 +0100 (CET)
Received: from MW4PR03CA0022.namprd03.prod.outlook.com (2603:10b6:303:8f::27)
 by PH0PR12MB5468.namprd12.prod.outlook.com (2603:10b6:510:ea::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 22:52:21 +0000
Received: from CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::cc) by MW4PR03CA0022.outlook.office365.com
 (2603:10b6:303:8f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 22:52:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT106.mail.protection.outlook.com (10.13.175.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.22 via Frontend Transport; Tue, 31 Jan 2023 22:52:19 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:19 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 14:52:18 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 31 Jan 2023 16:52:18 -0600
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
X-Inumbo-ID: ed5f3a07-a1b9-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXY2AGIYjpjCP5V5Cx+0Sq7p38NQM1z89S78V/x4yehYjVXBF77UpCm7EJPoowmBcmV4DDG4dj7Ub463DQU1VvX2BjXWv/GPvkFj9XTqL5gZrdhlGSxdYGAb84wnJmy/d315XqYZbTfZ+3/0Kcj/+x3D3LMUOjjtNyyR2Om8m8ebpPUDB7Y1D15g783RPppuz2s7yhRlF7c7Z7KHhTDBL2BcZRvQCnCaPJbtk4mlLJvVtKeFIH8YFrxjFUhjlwyY6N7M+HkUNPMUQzUhRF4CyAV/RrPDBRVCpUudcnDDrE++nIac2u4LUGhsp32SHTLhrHa3oqIEWNv5ybxOAYodLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4ErF5BL7bDWql01g8Ddsvo8tfdsJHgWhVo5VZ0Rbpo=;
 b=YJNZDExdjXVkGI7o9ZE+UJi114bodC53Fr+EV7TTuTM4dIOTsWH6n9YpGMa2SMnoMx2sIc6R9/MXjb8jUpXl/bU83K38JvquPNYNWAQFtEwp1ziagUXr/9AXTQEMFW0EClBg50SOBdLZpzQ528Xd8n1VvVl1sC3hIPOo8c4dsOhl1ZYoeh1vCCoJV8vyw2NSwL+JbFQNrMP9uGzxmREKGVrsgBeJvbXFxzpBMI1S2f7inSZqu92MdhKUFnRKXz9lD+PJCnJwfCGZm7dpxngPCA06h5c5ktbVLmA2uVRMBOZhKuSS4VjDpsA6eeajMMat39P1bzBxFNLUzNgGy/QsGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4ErF5BL7bDWql01g8Ddsvo8tfdsJHgWhVo5VZ0Rbpo=;
 b=YWhVSCLB4d07T0gyop8GGpH5x9B2fauThpMM44tfcHxGSlwOEXZqmf4gACVqY1Iuu3AjHonzrPixPwke+yvI/CGsGftvQ+KoYOOTxkyKDiq9b9qmNR8c4MKyEL2sE3Jfi0T+GRPt+QwEqssM7ntUYcxAPT8srrojr2JGk7IgYNY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>
Subject: [QEMU][PATCH v5 07/10] hw/xen/xen-hvm-common: Use g_new and error_report
Date: Tue, 31 Jan 2023 14:51:46 -0800
Message-ID: <20230131225149.14764-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230131225149.14764-1-vikram.garhwal@amd.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT106:EE_|PH0PR12MB5468:EE_
X-MS-Office365-Filtering-Correlation-Id: 32835289-f924-41c9-871a-08db03ddcf01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lKmVv4sLAJnszWivO3MTW1loDbkWoZnh4P/MHWWXo49dAMsIuIlbeRqxpqq/mao/r+S25MToHuJtE9Ad7Z6Z0jkV93BSqmMfmbkqBKdyZ8dWBuW4uFcOZosSaNjP5I29Zk8OeMR3LOQwz0sMNfO2N1EMRkkSCVDtlhBV+xsa0Z8bKVC0nIXUJn33m4JFBmvn9k+ahHYv3CoKvYGIXC2LtjITMH3Yfny5y1vlPZRzL9yDqjauBitKwQTqKD6ZYSja7r3Pzm9gE2rp0n1x76vBUxGlTAQ7Ry1/lReEnbJh2SFsx8OtxJJFBNis/YX2X27E6HgGajfaTuku1fH8PV/+gwdgRciABFPQYHohX3lLd6Jo4AbVOQJD9hCIdKqejgGY2+Mg3WzjrmRlIEVwd0zGIcib94p1FrHilkC9ay5n/CmreMk+HU4lXhGCI89YvlCjYK33VmyviRDyXulHB6c9LzgTlLnQot8lA3KtSrtuGFnNroPGeirElW4lygLqoB0WCs0FOK8kkaQolxBx3+h6UDea0zXls1zEanr68cBa/sX++GrEOA724l5uAcluOSwtxqMVoufO82EkO0X+ZaK/bCn6z7si6oqV/hRsb+4GhM3Mc68CtwrmGQx/hMZ1x4ZgVMEXkBGD03rPHhTTkMHnBGVj7W6gxM4/Iuk4WSG+Zp6eiKaeojlgRwIkWTEsOIuACXHHGjO7KymbZhKCCRzPVQuBDdJgrAlY3li71wvjK84=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199018)(40470700004)(46966006)(36840700001)(356005)(81166007)(86362001)(36860700001)(82740400003)(70586007)(316002)(36756003)(70206006)(8936002)(5660300002)(41300700001)(54906003)(4326008)(6916009)(8676002)(82310400005)(2906002)(40480700001)(44832011)(336012)(426003)(40460700003)(83380400001)(2616005)(47076005)(478600001)(186003)(26005)(1076003)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 22:52:19.7134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32835289-f924-41c9-871a-08db03ddcf01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5468

Replace g_malloc with g_new and perror with error_report.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/xen-hvm-common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 5e3c7b073f..077c8dae5b 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -34,7 +34,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
     trace_xen_ram_alloc(ram_addr, size);
 
     nr_pfn = size >> TARGET_PAGE_BITS;
-    pfn_list = g_malloc(sizeof (*pfn_list) * nr_pfn);
+    pfn_list = g_new(xen_pfn_t, nr_pfn);
 
     for (i = 0; i < nr_pfn; i++) {
         pfn_list[i] = (ram_addr >> TARGET_PAGE_BITS) + i;
@@ -731,7 +731,7 @@ void destroy_hvm_domain(bool reboot)
             return;
         }
         if (errno != ENOTTY /* old Xen */) {
-            perror("xendevicemodel_shutdown failed");
+            error_report("xendevicemodel_shutdown failed with error %d", errno);
         }
         /* well, try the old thing then */
     }
@@ -801,7 +801,7 @@ static void xen_do_ioreq_register(XenIOState *state,
     }
 
     /* Note: cpus is empty at this point in init */
-    state->cpu_by_vcpu_id = g_malloc0(max_cpus * sizeof(CPUState *));
+    state->cpu_by_vcpu_id = g_new0(CPUState *, max_cpus);
 
     rc = xen_set_ioreq_server_state(xen_domid, state->ioservid, true);
     if (rc < 0) {
@@ -810,7 +810,7 @@ static void xen_do_ioreq_register(XenIOState *state,
         goto err;
     }
 
-    state->ioreq_local_port = g_malloc0(max_cpus * sizeof (evtchn_port_t));
+    state->ioreq_local_port = g_new0(evtchn_port_t, max_cpus);
 
     /* FIXME: how about if we overflow the page here? */
     for (i = 0; i < max_cpus; i++) {
@@ -864,13 +864,13 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
 
     state->xce_handle = xenevtchn_open(NULL, 0);
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
2.17.0


