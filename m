Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C221B6DE778
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 00:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519969.807123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMmS-0005S4-SR; Tue, 11 Apr 2023 22:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519969.807123; Tue, 11 Apr 2023 22:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMmS-0005Om-OW; Tue, 11 Apr 2023 22:48:04 +0000
Received: by outflank-mailman (input) for mailman id 519969;
 Tue, 11 Apr 2023 22:48:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmMmQ-0004tk-QV
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 22:48:02 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e857821c-d8ba-11ed-8611-37d641c3527e;
 Wed, 12 Apr 2023 00:48:00 +0200 (CEST)
Received: from DM5PR07CA0070.namprd07.prod.outlook.com (2603:10b6:4:ad::35) by
 PH8PR12MB6817.namprd12.prod.outlook.com (2603:10b6:510:1c8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.33; Tue, 11 Apr 2023 22:47:54 +0000
Received: from DS1PEPF0000E653.namprd02.prod.outlook.com
 (2603:10b6:4:ad:cafe::cc) by DM5PR07CA0070.outlook.office365.com
 (2603:10b6:4:ad::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 22:47:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E653.mail.protection.outlook.com (10.167.18.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Tue, 11 Apr 2023 22:47:54 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:47:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 15:47:53 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 17:47:52 -0500
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
X-Inumbo-ID: e857821c-d8ba-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hz5163pAoWJ2ZQ+zoM+kkRyAWo7OO6avTpHz7Bu983vvbR86QwVdAw5Z5uKjbSOhB1swJskoQt71Bbt0x2q/ehy7SuSMcJEe8d+VxbnIbKjjx62Jwb1ajqIrA8ppf8Y7XLA6P+/rsiwj9DVG00R0k9QjArTGgE6PQUW2QY6Elu6Ssl/KvaNnGRXOu9f9Q0ylMT7K3PuiSn1lGrzwJZINPC7GLJdF1NxwJDBS7SRZ3g6i/94NrOuWvI3g6etbT7I3MK2N0uAA11OMxq88WfldGX6qXJP0F1DuBClMjtQuRLh9oFVlVdgBrxZqxRfIK7hEiE3YS7RS3LsmL0+aXGVNEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDSuDO2maVMFN1l7RQU+96HCYXUpMutEwT5v2DbnewQ=;
 b=mEnJB6Ff/wZ04ogd0bSMarz5lOEj93I0ED1p0VnJZyxWXkNDmzOodZW0FqxnwupleHfYqgDTPZ/ybKOqhqbNNRheLQ6eR3TFK2oXZ3Lfabo1v9Dn2m2230ZnA3zMWO+YO2bRHa5yY1wEhPnIENhBoOWDJSTWtuAj4iHDxqY0NXtPcW3wWVBbVR6Qea/8yU23aF/Qm+11dGjFne3cjPcOPgRJDHTI50FeOhUNyoUZaK5OL+ktCo+16m6a9u/FUz1UkUScqCPLRq4irvdWtg27bapSxJ931PA9wPRcaBO8HLjFMA0tZSN4uZiETZGq/qZwLqOqQbrE9bexC9EC+legyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDSuDO2maVMFN1l7RQU+96HCYXUpMutEwT5v2DbnewQ=;
 b=biK3WJGL8H0acN6Y+3qlv00oO0m6n+AghO2mN4hHs4qSfV140GDaIwULltVJ+vsMpxA4NQW0Qkg3co9C8j2m/j+bZxYev6Hynvv1Zk+ON9MnfTsTmn+laYG7+p4itLX2wNir/f7H9549uurythBvJAjTjdZlva8aBCGIr6khxPE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, Stefano Stabellini <sstabellini@kernel.org>, "Anthony
 Perard" <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: [QEMU][PATCH v6 01/10] hw/i386/xen/: move xen-mapcache.c to hw/xen/
Date: Tue, 11 Apr 2023 15:47:37 -0700
Message-ID: <20230411224746.16152-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411224746.16152-1-vikram.garhwal@amd.com>
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E653:EE_|PH8PR12MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: ba59163f-ef3b-4fb4-f65e-08db3adec9ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b+FTQ4VVXuGv7PY1pGM3+BrSHmgZQS0IbtfZO1oPmAXmuWvTUK7RdGQ57q+uhm2rBsU59uPQvwMF3fxfAyeC/9uq06+igiXDfgcOp+J03ZhgBpbOSk11LPPa+BVgTAF5riDvLGyAVb9gyqhoOWVKbcpmX4m+7EsPls7edeh24bNANKsdx31QXDFcuQ18o37Z+wE0zoGhOB38AVOm4VMBPt3Sb/GW5GDLeBN6rFCUrGp8yJdkJdODwCfEAjmPZY7MMIK3Qvjba3fVbBqdZbh2zoRGzot1STMhBnXbzQdKIPdRnJd5aUC84v70Qv4ACMoLKig2g2l44dWeUFT36T6v0CNi51j69aBXpu+rgsI9qmE0ZE+xH373G3wABZhKChUPwR9Bu5WxMl07e2n8iKQdKcXI8K8VZmH4Y96DuITJsqc/akeKCLhCBuLt3PB/gtHFJUhaQSrX3u++DZhWe53vDMRPZ2jXYcC84ltDKBy8D2PUTdD+VN0JOn+gtZiWtlEhD5HUPb3xRF7gOHp6L9CUTgCRXmpC9+bPJw1bi0T2QkpLzTWEzHnpxiFuEIywt4mMPI9yzIm6yzrwzeGkHaPQ9/RgvAXSVht/BZ9aYfM/Ec5L6190C6hcBAM6eq/2KxSndDnU75e+OzE7z5DDwy+H6InAW92q20Ou5zy4brMvwBPWUsLvWm+OPovxsQIXb8AM1N9HOJjCtIaBBLb07Au6MwHrRn3dCQnBZY7qg5Qv7lQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199021)(40470700004)(46966006)(36840700001)(2906002)(86362001)(7416002)(336012)(426003)(82740400003)(5660300002)(40480700001)(478600001)(6916009)(2616005)(41300700001)(8936002)(36756003)(6666004)(40460700003)(4326008)(316002)(44832011)(70206006)(26005)(8676002)(70586007)(54906003)(356005)(186003)(1076003)(81166007)(82310400005)(47076005)(83380400001)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 22:47:54.3112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba59163f-ef3b-4fb4-f65e-08db3adec9ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E653.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6817

xen-mapcache.c contains common functions which can be used for enabling Xen on
aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
accessible for both aarch64 and x86.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/i386/meson.build              | 1 +
 hw/i386/xen/meson.build          | 1 -
 hw/i386/xen/trace-events         | 5 -----
 hw/xen/meson.build               | 4 ++++
 hw/xen/trace-events              | 5 +++++
 hw/{i386 => }/xen/xen-mapcache.c | 0
 6 files changed, 10 insertions(+), 6 deletions(-)
 rename hw/{i386 => }/xen/xen-mapcache.c (100%)

diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 213e2e82b3..cfdbfdcbcb 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -33,5 +33,6 @@ subdir('kvm')
 subdir('xen')
 
 i386_ss.add_all(xenpv_ss)
+i386_ss.add_all(xen_ss)
 
 hw_arch += {'i386': i386_ss}
diff --git a/hw/i386/xen/meson.build b/hw/i386/xen/meson.build
index 2e64a34e16..3dc4c4f106 100644
--- a/hw/i386/xen/meson.build
+++ b/hw/i386/xen/meson.build
@@ -1,6 +1,5 @@
 i386_ss.add(when: 'CONFIG_XEN', if_true: files(
   'xen-hvm.c',
-  'xen-mapcache.c',
   'xen_apic.c',
   'xen_pvdevice.c',
 ))
diff --git a/hw/i386/xen/trace-events b/hw/i386/xen/trace-events
index 5d6be61090..a0c89d91c4 100644
--- a/hw/i386/xen/trace-events
+++ b/hw/i386/xen/trace-events
@@ -21,8 +21,3 @@ xen_map_resource_ioreq(uint32_t id, void *addr) "id: %u addr: %p"
 cpu_ioreq_config_read(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
 cpu_ioreq_config_write(void *req, uint32_t sbdf, uint32_t reg, uint32_t size, uint32_t data) "I/O=%p sbdf=0x%x reg=%u size=%u data=0x%x"
 
-# xen-mapcache.c
-xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
-xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
-xen_map_cache_return(void* ptr) "%p"
-
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 19c6aabc7c..202752e557 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -26,3 +26,7 @@ else
 endif
 
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
+
+xen_ss = ss.source_set()
+
+xen_ss.add(when: 'CONFIG_XEN', if_true: files('xen-mapcache.c'))
diff --git a/hw/xen/trace-events b/hw/xen/trace-events
index 55c9e1df68..f977c7c8c6 100644
--- a/hw/xen/trace-events
+++ b/hw/xen/trace-events
@@ -41,3 +41,8 @@ xs_node_vprintf(char *path, char *value) "%s %s"
 xs_node_vscanf(char *path, char *value) "%s %s"
 xs_node_watch(char *path) "%s"
 xs_node_unwatch(char *path) "%s"
+
+# xen-mapcache.c
+xen_map_cache(uint64_t phys_addr) "want 0x%"PRIx64
+xen_remap_bucket(uint64_t index) "index 0x%"PRIx64
+xen_map_cache_return(void* ptr) "%p"
diff --git a/hw/i386/xen/xen-mapcache.c b/hw/xen/xen-mapcache.c
similarity index 100%
rename from hw/i386/xen/xen-mapcache.c
rename to hw/xen/xen-mapcache.c
-- 
2.17.0


