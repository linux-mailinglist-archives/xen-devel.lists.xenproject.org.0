Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BC96DE77D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 00:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519972.807152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMmW-0006HM-Uf; Tue, 11 Apr 2023 22:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519972.807152; Tue, 11 Apr 2023 22:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMmW-0006Dj-Pt; Tue, 11 Apr 2023 22:48:08 +0000
Received: by outflank-mailman (input) for mailman id 519972;
 Tue, 11 Apr 2023 22:48:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmMmU-0004tk-ME
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 22:48:06 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e88::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb089360-d8ba-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 00:48:04 +0200 (CEST)
Received: from DS7P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::21) by
 SA1PR12MB7198.namprd12.prod.outlook.com (2603:10b6:806:2bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 22:48:02 +0000
Received: from DS1PEPF0000E64F.namprd02.prod.outlook.com
 (2603:10b6:8:2e:cafe::8e) by DS7P222CA0028.outlook.office365.com
 (2603:10b6:8:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 22:48:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E64F.mail.protection.outlook.com (10.167.18.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Tue, 11 Apr 2023 22:48:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:48:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 15:48:00 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 17:47:59 -0500
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
X-Inumbo-ID: eb089360-d8ba-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWFwXSh/XJsVrrBDH6oSynniQ/IglXdM8mpvw4/iGS4UwF19F99brSYRUXG1fELOy1vVYZ5mYDnRFWxCVSkUCglZA5ie/LzlLLzIvGHQ3rQbCxrOauKrasTnfoDK9MdY6ImbW0YUOC0sINYeHpQ+HnqcojhZvjNp8VztPZP0qhVkhaRrG5cF2+EWHVPKTcuci0o8+3up1yireVb6GXOZ0+T29B7RNYeD+1gm/bp2jU8GM11KYAB1QzNGgNp1RTEwPtu53S51/LbmhPLf14r9laj3E4+UgkJt6skQyZOY2pVof3N5/07YlsDrtQwHCkrBC10/KGlQgHZF9n/FllYqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujYfJM4vaNtZk1zA3MwYT/E3tRvcfbmfzK5faMVAmdY=;
 b=brMGnhH/Tl8QzxLRkf8oULCS+fcHO/YO8Qpe/DajdjjrjudKQ5fXpSIULTstO6EUiim+HJ9NmpjHcGKxF4GxjlmIVRfwOt4M3LlE0j6aRj4gpD0FM/pUC9PxCowVJ91b/Vvn6pPSjhLvb8IGsgJOpXuyVKcJ5QmzgInXYapIijvko0KVk/PIjehTqZ2hiY63VBpN86IUKdyMACdVieqxvElDPJvVhCLebeSNNiO8UYX5JI0MAGIP/5xnjtdOIvZE48ULiiSbbuZorroT9VMWy9T97eVFKQESSYq+3ejJGzN+ai60AwXCy3VUiBVmfACoup42pZUtwSaTQO74C0py0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujYfJM4vaNtZk1zA3MwYT/E3tRvcfbmfzK5faMVAmdY=;
 b=fxiyOeyBcL/x4CyCKdICWV04zsQOnnz+VCXpWT+0t6/zf5OXkJB9Vc9GzQ/Pldt0f9cW7aEffwbsbHQEKmi4pzh7LwiqQrBh6IX5adcIbYqrIc0qZ7hJQUHEXL7f0ec8NuMUxPRzpQAItV0Vz8DzitbPE6A/ZlQbPqfcxmBbTak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: [QEMU][PATCH v6 07/10] hw/xen/xen-hvm-common: Use g_new and error_report
Date: Tue, 11 Apr 2023 15:47:43 -0700
Message-ID: <20230411224746.16152-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411224746.16152-1-vikram.garhwal@amd.com>
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64F:EE_|SA1PR12MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e3f26d-b041-4293-93a8-08db3adece1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ry1nPJe5ps0zWI4ft2ZGrmnMusAWHy8AQjIAzB/D5qeuiawc4EjbBwTj/1Oj5ZtpLWmybZ0dTsf8hCfVU5qtXPMTvJXfLtsMXA4TgqDomrJkUYAfSuXQSv3iHWRojwAc7fSZ4qGKc4MdtFmLUV7DdpZgypQp8mJD7+hLOrhk1PVNUSFP1eWL7ZRC4clVm9ri6fP9vMQYIF84BHNwmdqmGA+r8vdp0+FEj90hgZVCys9A9rIkEIeb056jY/aRLuItVdu75FIcekCLr0BJud8CznnxkyZ70O+kWQQBlRB1lpGEa3E5LTnZJzgC3WKg8xb70Cl5wUTiYZrOK3iV027P18ZIjaX6Fc6US3M6PUh/fpiJOimUegt3ZA1SCfIDQFYsSmIS+jkALDsC+njyBVEVG0xmWKOavOQmtdGP0Sz0GHGmqsmZrRh7xH7oK5X1Rwklow49dcvSAMHGKSb+nmArJxbhByxYdTUKRdXtXEMS0Eni755tVIeAktZyjCpmPDAKAholE06sqC1SxIFctQRXX+Xzvv+2cS7soe9C3kRxfm5ctxi0zWq0EwyvywJ/xikZHX2OJ4um8OyK47t6KA/fiMdECqnvMndIKARmjbd9nB67pdQcxuKzWQbZ6Aj5mg5mvw73LJgRAPRGbDpqo18AlLTEX6W7ueOJJllLlfC1RYX3ZsUiSzf/kj97wuEPFkWXdy9CWcDaCGGYIa4PrhXZ+7SZdpBvpkqK/lIcsBO405k=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(86362001)(41300700001)(316002)(4326008)(478600001)(36756003)(54906003)(70586007)(70206006)(8676002)(6916009)(40480700001)(82310400005)(356005)(5660300002)(2906002)(8936002)(44832011)(36860700001)(81166007)(82740400003)(186003)(26005)(1076003)(6666004)(2616005)(336012)(426003)(47076005)(83380400001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 22:48:01.7562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e3f26d-b041-4293-93a8-08db3adece1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E64F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7198

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
2.17.0


