Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB335FF886
	for <lists+xen-devel@lfdr.de>; Sat, 15 Oct 2022 07:08:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423253.669896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPl-0008IX-D7; Sat, 15 Oct 2022 05:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423253.669896; Sat, 15 Oct 2022 05:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojZPk-00087W-VH; Sat, 15 Oct 2022 05:08:48 +0000
Received: by outflank-mailman (input) for mailman id 423253;
 Sat, 15 Oct 2022 05:08:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q/I2=2Q=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ojZPi-00070V-SX
 for xen-devel@lists.xenproject.org; Sat, 15 Oct 2022 05:08:46 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f4e0e41-4c47-11ed-91b4-6bf2151ebd3b;
 Sat, 15 Oct 2022 07:08:43 +0200 (CEST)
Received: from DS7PR07CA0016.namprd07.prod.outlook.com (2603:10b6:5:3af::18)
 by DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Sat, 15 Oct
 2022 05:08:38 +0000
Received: from CY4PEPF0000B8EB.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::2f) by DS7PR07CA0016.outlook.office365.com
 (2603:10b6:5:3af::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EB.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.13 via Frontend Transport; Sat, 15 Oct 2022 05:08:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:35 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:35 -0500
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
X-Inumbo-ID: 6f4e0e41-4c47-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jifEHGNqERbztNNgNTNYc7ipxn+PIuMCLCs7nKtpdKHy8LSrdY5RdnDzvh1klNPd+msnPZIzRzNZeCiRHa1wKNXMdR/4HqNGFpXzKAXDShxAgnhvqZQTC32wS4etKCM9mY3cR56Yvii27zGxjNJjSJQrBrxXeVZjYx9Y9KPr/gTZTNGJTggMbl4AFV5RHiU25juYNTDRlwKprMp9eI1uXeQ41hn2mgamhnTpXD/zxEZi++KFu2Cl1zxaRJsT6DMYCRVOpfHsXgzy2Njo3qpT8Kha+Yzvoa7YIznKgCgY5rrL9Es3DAXZk81xM//oCrUtQ4RYbkBWf11dRo1HvNhbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpNswOJaJTvoQnEp4VKG3t3Oool7KkMpjFedov6r4QE=;
 b=MmkVYj9DAk7EMD+Oh28VQq5fXg19TaMFECBybTMqSq67yhUrfGSCv77dMkKwMOrq6YMiTf0RVEW9euTLI4lsQDLDSqouextGmOHBL5ok1ipHMiRn6ATPKIKhincV89w01QSS+KkK0kuH30zsGD8qD4NA7/rrab06+IFXlVrsTbvQ7qZdxTPz0QdQo5lJL/EAI+uNFitAa9HRKPDD59xCPlyNWDw6aSWxDxk7uZuzJSPvGimLzcXNVBsBviKdxAIiPgWHomhPLfDxDdcOTF34SEncuFjtOrzBi3GltaKSfmPoqhXUFU+9HiSTo4Y9xpqMk9PQ9hBUEZGMZovEWr94yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpNswOJaJTvoQnEp4VKG3t3Oool7KkMpjFedov6r4QE=;
 b=Iz9JceDqu9u9WD1HlenDMVCtpdyHXw89fzV8Qd0eId5tK06YyRYiKRiUNpM8qvkS+1Dz/iSPRn5Dxsd5dK5kHgnglDshpaq53pQOqnBUDKZ+7uXg9FyiL2LO11oGGvfUWZdXxIBgkP27yV31rd4sWm8wEFOsS3YmxL+42AQ4O9U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <vikram.garhwal@amd.com>, <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v1 08/12] hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration failure
Date: Fri, 14 Oct 2022 22:07:46 -0700
Message-ID: <20221015050750.4185-9-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221015050750.4185-1-vikram.garhwal@amd.com>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EB:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: cfcdd5c9-d184-4163-5c1c-08daae6b5208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ayGk3wzHF76voTX3eVmgKUvFV4APK3101zaH/G7X9LqItm5zX7y2AeffY6fPJ6Ziw8ApjrpFnwfkCWJL7wwcRA8GDn4gRdR4Gx9LK5YgXhqtxQlbbcpCTSgIVNH1pQqM3tMNVJQoGJQ3maBIMo8a/7qobBGMDb+s4teoSGZsRa+Vu+oLJGEWCoqt1+5duZGsMYzPhiblUEjwDlYQ9/Dh1zRbslGR0d1cLI0YpPLBPLeRSc/zBboT3TZtXzF02huOZC+NA+jDT+SfPWStyGBHex0nI/mj+zv0/gMu0W4/tScwXQnERuC0DwJxmpjH8d0kowJRll76imkr7GRnVCJZFI5CIYgKY9EcIdk+o/pGwiD7YufBXOcdbAlF4PIQQJxXZXHZvqpyNo1XW/T6lsw9aKObdD+JbXuJ17NPfOKbVHh7RUhE1MwqhBV9tGPDRZR2LU/zcDxRfO5W/XQQfX7xjhHJAQcPgRgGVstaAu/KZ7Li9A0T9B0Ns7QlYpajz+Xoni8jzUpxVeT47BdHz0JomNOnccUj9jsjqwhgJB+y78z0YaEsf7WqcRLF1ZIA/EAki3QA/568KYz750EUFK0vEdAeL6vzS5dIRSUGh85Ho2CtUCLNMF/fa3oHsWYT4Hmgg5g/dFWepuMQM/CUKLTPAds0Bi4SbuQrQvnQCCYwW/lqtPETiJM7v+p6kYtZFcmuaLgGaincOq+yTqxLgG9NOyHLcflNYvMNkPYuXMMe7OPpG48c2FM/PdWUKvN6Nx7qga1YTP0k4fxR0+uSCIUjSfqsN3RZtuZpVGw6CMquLgupdFDv72JJ7u0c6q/afoIU
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(46966006)(40470700004)(36840700001)(186003)(40480700001)(82740400003)(2616005)(86362001)(1076003)(2906002)(5660300002)(316002)(8936002)(54906003)(70206006)(70586007)(44832011)(40460700003)(82310400005)(81166007)(4326008)(47076005)(6916009)(356005)(83380400001)(26005)(36756003)(336012)(8676002)(6666004)(478600001)(41300700001)(36860700001)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:38.5640
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfcdd5c9-d184-4163-5c1c-08daae6b5208
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504

From: Stefano Stabellini <stefano.stabellini@amd.com>

On ARM it is possible to have a functioning xenpv machine with only the
PV backends and no IOREQ server. If the IOREQ server creation fails continue
to the PV backends initialization.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 hw/xen/xen-hvm-common.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index f848f9e625..7bccf595fc 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -777,7 +777,11 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
         goto err;
     }
 
-    xen_create_ioreq_server(xen_domid, &state->ioservid);
+    rc = xen_create_ioreq_server(xen_domid, &state->ioservid);
+    if (rc) {
+        DPRINTF("xen: failed to create ioreq server\n");
+        goto no_ioreq;
+    }
 
     state->exit.notify = xen_exit_notifier;
     qemu_add_exit_notifier(&state->exit);
@@ -842,6 +846,7 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
     QLIST_INIT(&state->dev_list);
     device_listener_register(&state->device_listener);
 
+no_ioreq:
     xen_bus_init();
 
     /* Initialize backend core & drivers */
-- 
2.17.0


