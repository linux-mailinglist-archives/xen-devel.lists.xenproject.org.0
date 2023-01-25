Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A333A67ACFC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 09:56:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483964.750453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbZw-0001hh-FQ; Wed, 25 Jan 2023 08:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483964.750453; Wed, 25 Jan 2023 08:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbZw-0001fQ-AM; Wed, 25 Jan 2023 08:56:24 +0000
Received: by outflank-mailman (input) for mailman id 483964;
 Wed, 25 Jan 2023 08:56:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKbZu-0000CY-P9
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:56:22 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eab::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 071fa16b-9c8e-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 09:55:37 +0100 (CET)
Received: from DM6PR06CA0038.namprd06.prod.outlook.com (2603:10b6:5:54::15) by
 PH7PR12MB6490.namprd12.prod.outlook.com (2603:10b6:510:1f5::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Wed, 25 Jan 2023 08:54:48 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::c2) by DM6PR06CA0038.outlook.office365.com
 (2603:10b6:5:54::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.20 via Frontend
 Transport; Wed, 25 Jan 2023 08:54:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.21 via Frontend Transport; Wed, 25 Jan 2023 08:54:47 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:54:46 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 00:54:46 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:54:45 -0600
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
X-Inumbo-ID: 071fa16b-9c8e-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXVp6JaPtuzxwlY5i3IJ6BbSnIk1EtKOnrrHHvoMe52VdlFVddVIIniaBIkjUeBFblD21vzuRien8hi/IuV2EM2HjvtwVGPRh5Pbi6zWcyCH3XztHD2rW3LaeicskGf2eX4V5QbT/QdLCnPyTS/i8YqLrKq5PJfw7P/A/+/iUTbNyuPhIth2/1oL7eiuVFGJc2aPwMFaEyeNOmRmHJWOdyovLculRi3i2zeqboQIZPC/ur//EIn3+kz+mg3aGUnTCHlRBq2tXTsRWOEm04xeuwiIL6lwSf877MKFv2V48d4cy86lm5ZSnckVFShYeR/IXY5LaLNdyeDA8EWUyRGDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqy76BJj/3k0CZFIEfqRDFKvHIQ6y9gkszdQF5vGxqY=;
 b=LreCuP1shWsGCxizkNtaNRqUQ0YHJVq+l4udbzMvY1za0SA2b7tGY67GDYhVntS1rGWRbje7l5l1oagU5h9r+bYYGqUfmU9XWXIfx6Z9fWayM3AOTHGNrBRzk2GBKjrf0vMCPC4HXaVCST4Ht1q1gmoRgjSzBcmHjulht2cH6dHXNwSBc2VrffAcbHF3G84FrSduwMAWG12Hy/VlePThqmst4ZV/4p2aTOaZdZ/C3tD3hOAFIWvOkyoamIAaBdNa/cIvybmuSldUEg1B0imbkeSI8fmie2JoaMl8GxUg/XRPpOQoaItriaro5pMLWBxYnZrGvc+STkip2TT4RTob2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqy76BJj/3k0CZFIEfqRDFKvHIQ6y9gkszdQF5vGxqY=;
 b=g3EUzN8vS+ZJOA/ATNFCIKQ5BTMy12NwUJkebUN4eahBXO5NU0GCtN3aJiTR3lhmkUMIcslO/eX+bnCblN7Zz9zrNO/LeSi793Pw9rXE22Fj8t/8x7B9ydrKcbW5IdzNV3aBALsALSND8WIKIlpGAiHRDHkGvieoN78ayDkGi2A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>
Subject: [QEMU][PATCH v4 07/10] hw/xen/xen-hvm-common: Use g_new and error_setg_errno
Date: Wed, 25 Jan 2023 00:54:04 -0800
Message-ID: <20230125085407.7144-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125085407.7144-1-vikram.garhwal@amd.com>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT063:EE_|PH7PR12MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: a3428d60-6b23-40c5-d9c3-08dafeb1cf87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zc8C8J07RmauMRfAH9gxUSWIHSJI7GhDjuy5OaYKOqPUcuuqN6oZO+6/L870NfIGonmMjM+x8Md1Reiq/GuUcwUU5B6yoznsckcWmGkCmuOViMO1bqWwNcmc90I5K5n4r+ueun686FRjEhg6vdHK13GXs8+G3cubecHVANpoTSBDpW50VuielDKxIYdN/EMH2OyL49Hh2fJFlBE+MMy7vyNnJtWSivmnGWg2cNWChnG+2+lmyfPIuINSoNfGUCl+7HFUw3L+9sUm1tgqXT4KPfPJ9o/6Bmhre7Tbm3oWFplhCHTFqFXqElhAJo/HDCYE5DrOCuP+EyQm+muHDJNmxBwrXaGc5aRpLBpo6jcI6Mkz5eQOQaWK55IoYrZKEJuqcNEE6dgnm8EsSBvyymNxZWI3KnkED12i250ZpW4CUv1c7wONA47DyshYrgcZkrhtFwJzeeSRfZXnSj74M8671U/ajcYm5uUBrTucNYvY+zF4uNUABrI6xlsgz05wXc2/n/Xd74upFrUbwvB7QnV035FvulZankslT8c6xCG7uPH2An7EUXvv3SwIXASqkSFrgTq84kJxLf8Zku/eHeDj+/gyB7a3eo5d1I3sByKaWb/KyYVGXJU7EGnYnm6XVVPemqD/GPYUMAuOuhL+NckRQAKIDmGskYUVncxQ8vgnx8zmRwh8HYXeMhZwLJrloC/BlFn4Wvnft/5kloOyUUrHC5BuC4V3AiSy/itrsMyoPWk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(4326008)(36860700001)(70586007)(86362001)(54906003)(70206006)(6916009)(36756003)(1076003)(44832011)(8936002)(5660300002)(426003)(2906002)(82740400003)(41300700001)(82310400005)(40460700003)(47076005)(6666004)(26005)(83380400001)(40480700001)(186003)(8676002)(2616005)(316002)(336012)(81166007)(478600001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:54:47.0018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3428d60-6b23-40c5-d9c3-08dafeb1cf87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6490

Replace g_malloc with g_new and perror with error_setg_errno.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/xen/xen-hvm-common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 94dbbe97ed..01c8ec1956 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -34,7 +34,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
     trace_xen_ram_alloc(ram_addr, size);
 
     nr_pfn = size >> TARGET_PAGE_BITS;
-    pfn_list = g_malloc(sizeof (*pfn_list) * nr_pfn);
+    pfn_list = g_new(xen_pfn_t, nr_pfn);
 
     for (i = 0; i < nr_pfn; i++) {
         pfn_list[i] = (ram_addr >> TARGET_PAGE_BITS) + i;
@@ -726,7 +726,7 @@ void destroy_hvm_domain(bool reboot)
             return;
         }
         if (errno != ENOTTY /* old Xen */) {
-            perror("xendevicemodel_shutdown failed");
+            error_report("xendevicemodel_shutdown failed with error %d", errno);
         }
         /* well, try the old thing then */
     }
@@ -797,7 +797,7 @@ static void xen_do_ioreq_register(XenIOState *state,
     }
 
     /* Note: cpus is empty at this point in init */
-    state->cpu_by_vcpu_id = g_malloc0(max_cpus * sizeof(CPUState *));
+    state->cpu_by_vcpu_id = g_new0(CPUState *, max_cpus);
 
     rc = xen_set_ioreq_server_state(xen_domid, state->ioservid, true);
     if (rc < 0) {
@@ -806,7 +806,7 @@ static void xen_do_ioreq_register(XenIOState *state,
         goto err;
     }
 
-    state->ioreq_local_port = g_malloc0(max_cpus * sizeof (evtchn_port_t));
+    state->ioreq_local_port = g_new0(evtchn_port_t, max_cpus);
 
     /* FIXME: how about if we overflow the page here? */
     for (i = 0; i < max_cpus; i++) {
@@ -860,13 +860,13 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
 
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


