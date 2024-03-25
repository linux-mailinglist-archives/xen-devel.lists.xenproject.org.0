Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D295E88B1E4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 21:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697880.1089127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rorCH-0008JC-09; Mon, 25 Mar 2024 20:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697880.1089127; Mon, 25 Mar 2024 20:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rorCG-0008H5-SK; Mon, 25 Mar 2024 20:45:32 +0000
Received: by outflank-mailman (input) for mailman id 697880;
 Mon, 25 Mar 2024 20:45:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvT0=K7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rorCE-0007LI-V2
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 20:45:30 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cb74f27-eae8-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 21:45:27 +0100 (CET)
Received: from MW4PR03CA0341.namprd03.prod.outlook.com (2603:10b6:303:dc::16)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 20:45:23 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::19) by MW4PR03CA0341.outlook.office365.com
 (2603:10b6:303:dc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Mon, 25 Mar 2024 20:45:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 25 Mar 2024 20:45:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 15:45:21 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 15:45:20 -0500
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
X-Inumbo-ID: 9cb74f27-eae8-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h8c9LXgrQixHW3dAYWgw/rqZ7cHqAt8cAdh31W2RurJpVS+qFY/D9EhCZbBfCBXaLgGBXdzBKanf2I8KQU8VzAM5foVb3RcZzUOrBLyqVk3EQzx8TNGKCZezzfSLIDvdVwuTu0Y2XHZ5cf1zN/TaLgS/9oc/tZmY9iiRUH2Nz0xLch1iLumBVqkNBT9QoLYkNzSMJgofYYuPdP1p5sIz49dAEYqmp++s2OZhrbG12hqbsLKlnyr1w8dDc1ITx2J5G6mqaZojpGnwwR2GDM1sTckA2+XabLSB28NY3znfb4HFLfKPPVonKXvmoytoEFlTlgAbAegcwGZIkpxnus6LqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpYFdzJHkuO60SpR1aTtd436m2Cbip6KFJuG8vrlzio=;
 b=jADnyZeSgMJbTcIXMPTsMtEgjC4VggM4IvtHgeH+4aZjpOrmL9zp9rcrOQ++TioYMv3kwhRspU61W1z9Smh9ClttRw4PBUChEev6ikwJOVGdfXjmiEa070GxnP9vKrX1ZDbN5yeDuT/KW+gpVildZ1jS5+3CTJH15JUBvWtG5z6E9Hg27mMOcwf4Vq+Y1Kpdb4rzTLbUL+L+cCy9BPsJJryN2i2UsO11EuMHnhTAX9fmSdPc10WcuAlFh6tHj3qoTdUW5EqZ281f4EGNSkBiQcVo3AptMJmJt8a8zEl8i9y7aGMniFndrepEXqpJUtxy8lUzdtM82oc19tyqLrkUHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpYFdzJHkuO60SpR1aTtd436m2Cbip6KFJuG8vrlzio=;
 b=wqUjck3XdPfpxL13G3wWkzd84346G+3E9HojdQDIJjmxlNfD+NknuXUeaA6kq5wRR7qGs09vfkYtLvfXLwapSa+gmnqAFnefBiGoVi4GQeyLSwt+ivDo3xJvo/4LaV89UdZopfmq5wCkkFxv7pd0GDtarPTRHK3QmVK/jyMiCXQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 2/5] tools/init-xenstore-domain: Replace variable MB() usage
Date: Mon, 25 Mar 2024 16:45:12 -0400
Message-ID: <20240325204515.250203-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325204515.250203-1-jason.andryuk@amd.com>
References: <20240325204515.250203-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: b6343f0d-23c3-4c4b-c6c6-08dc4d0c7dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fdqdb6bVXcZsQl/xfkuIAW+XN6JEY3SlFK8Lbs7nuXVmjC2L6rGQSz4u0SV4UrrAZV0ChRx44KXn0nh+0IA+8EN3QuEHDQqON6rsk5Hu3//hIRkWHYzlD7tccIQEcYETu5ruNSx751sjTsUp74ht1X4Hp6ws2g3N2gHdIM2lLq1hNJ/6mifBuqoCS5+NA3HQshKlJnktUtpevGVJEiWgWB7Gq562I1Q85jRgpVJxgG2XhjUf0qApuqDRf+X9W6UdebJgNumZ9O4i7A1ZhhLtgsm7PhDrEEIFOWJRcTE3nudFWI1nZxd4p7CZBtvQ3y0Fq2S02xILUF410ByU+CEVT7Jzg1UgaA78e2cb9F1UKTIhCJ9bx/BJBV7PZmmisz9DzdjfA30PLdeqanrC3ybAlKIg2LmKb0ARfPYCJsYQZ7zftMqLDw9vNWE/GcH4VAKKBRK+kkjJ/DlT+FW0YPXto9HmMcnio+uVYzc8DmAJUoYzkjRJnYtVZa84EqIakM6UD/HHggUro8mu+JTD+Sea0ACm1gDvcT4LsaSfNU5Gu7M8DHHiQjaskUyUrJ4gjUaSZzaZOa/2a85rYLU+xaSHaMDM1TFTND/bfve2pYe7bapkWvvPiV6pvevSPqpT+qeSLIKHN/4xeN/vAtf+p9TLrot+koj7v9DuEUwMmpevMtaRX7YgBSscS8XUY9LMiOTrOLlsbzj+4aHoAWCyq49fVP18K4BNoF1boXc8r9mwToQpu6tZNmaz+7TgQR5pH3/b
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 20:45:22.6582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6343f0d-23c3-4c4b-c6c6-08dc4d0c7dfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201

The local MB() & GB() macros will be replaced with a common
implementation, but those only work with constant values.  Introduce a
static inline mb_to_bytes() in place of the MB() macro to convert the
variable values.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v4:
New
---
 tools/helpers/init-xenstore-domain.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 1683438c5c..5405842dfe 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -20,7 +20,6 @@
 #include "init-dom-json.h"
 
 #define LAPIC_BASE_ADDRESS  0xfee00000UL
-#define MB(x)               ((uint64_t)x << 20)
 #define GB(x)               ((uint64_t)x << 30)
 
 static uint32_t domid = ~0;
@@ -36,6 +35,11 @@ static xc_evtchn_port_or_error_t console_evtchn;
 static xentoollog_level minmsglevel = XTL_PROGRESS;
 static void *logger;
 
+static inline uint64_t mb_to_bytes(int mem)
+{
+	return (uint64_t)mem << 20;
+}
+
 static struct option options[] = {
     { "kernel", 1, NULL, 'k' },
     { "memory", 1, NULL, 'm' },
@@ -76,8 +80,8 @@ static int build(xc_interface *xch)
     int rv, xs_fd;
     struct xc_dom_image *dom = NULL;
     int limit_kb = (maxmem ? : memory) * 1024 + X86_HVM_NR_SPECIAL_PAGES * 4;
-    uint64_t mem_size = MB(memory);
-    uint64_t max_size = MB(maxmem ? : memory);
+    uint64_t mem_size = mb_to_bytes(memory);
+    uint64_t max_size = mb_to_bytes(maxmem ? : memory);
     struct e820entry e820[3];
     struct xen_domctl_createdomain config = {
         .ssidref = SECINITSID_DOMU,
-- 
2.44.0


