Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B07367ACBF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 09:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483908.750402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbQQ-0004Go-C9; Wed, 25 Jan 2023 08:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483908.750402; Wed, 25 Jan 2023 08:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbQQ-0004CT-7J; Wed, 25 Jan 2023 08:46:34 +0000
Received: by outflank-mailman (input) for mailman id 483908;
 Wed, 25 Jan 2023 08:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKbQO-0000gj-Hd
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:46:32 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a98de2fc-9c8c-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 09:45:47 +0100 (CET)
Received: from DM5PR07CA0060.namprd07.prod.outlook.com (2603:10b6:4:ad::25) by
 DM6PR12MB4236.namprd12.prod.outlook.com (2603:10b6:5:212::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Wed, 25 Jan 2023 08:44:58 +0000
Received: from DM6NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::75) by DM5PR07CA0060.outlook.office365.com
 (2603:10b6:4:ad::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 08:44:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT086.mail.protection.outlook.com (10.13.173.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 08:44:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:44:58 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:44:57 -0600
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
X-Inumbo-ID: a98de2fc-9c8c-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MJnZEXqmcNQyqzsamWn/Tz+f9f3+M7rbDNVOmONVC0ymBvg8hFRRyLKhqn8id4CmxS/DogQDcoqNRx1Zst0yMrI1xqrTO6kQd4d8xEablEjkardOELJ1mWIS7XsD0mx9CJl8/PyJD3x41U8VxKjVDAr8QN6xfWz2C06S5JFFgmnMhf3oXGY6bMXoFtZiIwYdw+omwGy8SL2oMsV1nGASIOvNRaMnEtk2TNNbI9Kw13nZFz3G08dklfbVXpxWX4R6pgHqsqadjbOJS2CtQVp2igulO7R1gDQJAqDWd+GixvkDglTcXrqEMHgT8wx/so+s/OD++zHxIcL0AKXePGln6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqy76BJj/3k0CZFIEfqRDFKvHIQ6y9gkszdQF5vGxqY=;
 b=EnIHaXP+GOrQkDB6A0iU0C5OVGBGxPLtGaw8aZxwbgfWdZBnhm3XfSlAJUPJIlimAiCEqdWs8xMwGSm/JEDZn3IEc+ge2frJdYQlc/5OZIRp4CWFVxDf74o8apKQbvCuvEwnrnm1BKgWC92MShtevPZakpfWkFztgIKtnanU1mu2NIS8ckoDY86rOvdM9g4kAirGWgCgeEuZmNC0O+GY3Jj1yeWIZk1KVpwOpb13gWbl2Md1vYZI08ZdHJJmOSNqbUQSd97vaCD3xBEB+OfZPbRIFBI9YoxDoYBeq20/NytGg+4HB9nND0KyTXOOf8kMtSse2iFBQchCrU429HXEWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqy76BJj/3k0CZFIEfqRDFKvHIQ6y9gkszdQF5vGxqY=;
 b=3YI2BHCAmWP+aeECoe5Xnvfgdh2ySj746NHyooaoOkY7yQdpyAnsZkQkmrx5DFu0NBCUVqGzmb6yTgoa13Ms5HBEi9rh2T3hGNxJb0PahemNuxhWkGpsTo1jTYn+wZVnVtv7XW3aD1EYZSg6hBdztY5PRvmNh2DP2k2ZVztwD5c=
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
Subject: [QEMU][PATCH v3 07/10] hw/xen/xen-hvm-common: Use g_new and error_setg_errno
Date: Wed, 25 Jan 2023 00:43:53 -0800
Message-ID: <20230125084356.6684-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125084356.6684-1-vikram.garhwal@amd.com>
References: <20230125084356.6684-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT086:EE_|DM6PR12MB4236:EE_
X-MS-Office365-Filtering-Correlation-Id: 41276d37-3ce8-4d3a-3e8d-08dafeb070d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2NAWaaAs3EQ6yHLucfvolSmlAzpVexLqF7NEL8H8rb1wWOUlLIaa1prnR9BZidoAfkoW/Kms68HuFMIjoZZhh+nsjOGgBX2+SNMn+j/EhiG+AgZqiRz/JHqrXc1qQqWFmZtatF5Zy94J1I2SFF7cA/5jEC/c3YdS668/bduP0mu3/V6LOunqX6g7fN3MEHIBfX1VThcWGsSTkVmKA7nUhlXab75SiYTUQBOVBCL3kEWXJbkR6jNB9DdCEOEcYsKYXPSYiLseDl9FQwR3WQC3CiLrIhh1x7y09oi15ZX3EZV2Z60U6JC/1wXbTO2IN0hVZvJgCaJOdPP4+xpd6OU4gNMQ8OTpnIlVESNdvRPJb7k58gnX/M7gIMAlchJahcgs7nVvHp+RKvVFd4ELFldW5NJoN3VBJbSRNYu2TC9HscTwIT2gYUwT0ZHWprjOGRwQ4jl3wDTZNVpLBfnWGdZRuksHCqHYnBvJcqrOPT95I/BO8pcOhN44l9MVB6x5HLAEG/Na8Qp+IMW1Stwwns1L4gHIrV/dUuimweEK7xCWH31D/wPbEkNJKXdmXP9uRCq8QbEbL40q0IoIGvF50FHN1BvuzWZbNEFVw9/Fa6sDJ7wuqQi8xX/bkLQFlf+JG6Ju8kGAH4PTi8RUa1FEovtDGZycf3DfaWPCuKeL6SoP0Zh1jAWgPrThCOi3RBu5jmi5cWxVCpM6ukYIsxFLfqoJZ38SSdlftKghscl11Nv1CKs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(136003)(346002)(451199018)(40470700004)(36840700001)(46966006)(4326008)(316002)(86362001)(70206006)(36860700001)(6916009)(36756003)(1076003)(44832011)(5660300002)(426003)(2906002)(82740400003)(82310400005)(41300700001)(40460700003)(47076005)(8936002)(2616005)(6666004)(186003)(40480700001)(26005)(8676002)(54906003)(70586007)(478600001)(336012)(83380400001)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:44:58.6484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41276d37-3ce8-4d3a-3e8d-08dafeb070d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4236

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


