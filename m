Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114B395A5E9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 22:32:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781478.1190989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgryh-00079x-Jn; Wed, 21 Aug 2024 20:30:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781478.1190989; Wed, 21 Aug 2024 20:30:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgryh-00077H-G8; Wed, 21 Aug 2024 20:30:47 +0000
Received: by outflank-mailman (input) for mailman id 781478;
 Wed, 21 Aug 2024 20:30:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DO9u=PU=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sgryg-00077B-9O
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 20:30:46 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20607.outbound.protection.outlook.com
 [2a01:111:f403:2405::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 274f62d6-5ffc-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 22:30:06 +0200 (CEST)
Received: from PH7P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::34)
 by CY8PR12MB7124.namprd12.prod.outlook.com (2603:10b6:930:5f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Wed, 21 Aug
 2024 20:30:02 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::ab) by PH7P222CA0013.outlook.office365.com
 (2603:10b6:510:33a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Wed, 21 Aug 2024 20:30:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024 20:30:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 15:30:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 15:30:00 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 21 Aug 2024 15:29:59 -0500
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
X-Inumbo-ID: 274f62d6-5ffc-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qY4ir6XNVTq9zr9aOeuLAEGw7c9RtYU5yDB6gG0tRGATsNv3TebRoAGb8k3anO0BJGC/6puYw8St4ZFYE5eo3f7z01ChncdOOl21oW4cCOnO49c1XEDyc4ozh4qwqZzJpXdtYaFMFjrE8B2Bp86LJ26eEhwyeXKrW1ojn8Q6UzBEEcYTa7P/uQRDiCmL03aLvGNW5o1jIq1hvO5u/BJ6wqOdjWHaL113WDIT9pXOdeffJknyBXeXIgcnKlrfTdauu0z0zhJFKkN3f+35TCN9ZiOrq/UvZ+zDRCMU8CMvi7J55tsw6rwqzdDvaem+/xifKqkrTGV7FxJcjsCw366paA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgqMeOKY8hi0ABVsL3NcbgKfinWJWfIC9XC12p43huU=;
 b=hQ0cAdGEvBwLogcZOE9D6awRIdThH7lNj2PMx4df70hG8/InoaNHfCyerTLamYbdphnXky4gqvxtRjfdkJS8zAW8IHKoSbUDWhY9445E7mr8esxGTQrC9/bIcTZF1Tzg5jpJ6fHiL3NiVyVmmQfBEdm5mWGn1N43S4Q0J+M1BLvxv+w5CjOi9ZB9eqWyX0uWmKrYYT601sOhENDz0kf4LeHoFfODQZGf/XX8QSsT4bnhtcnOYic449x0AXxiVmlhtLYKPdT+3kB70+wKyTxMzbf07mInGV7qfq6++/5YTBmKPv/3bqFYdgnYnNiBGCBM1eD/3g0L9tijh4jDi7lQ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgqMeOKY8hi0ABVsL3NcbgKfinWJWfIC9XC12p43huU=;
 b=EDYugaRrVv883vtpziNqe6PoCVHmqBhysYRUu8sJGUYfdE9qMFq3OzNLOZmT4/MbWIgPShq5TFcGdAgrYcPrdiAEg4tbM10XlplXBLJ6MfyqsCHhjVhlxBZQZdbrp07Kcf4ERap40PnqwlmQXzeDnOb2S2rypY0oMwNOkfYju0o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <anthony.perard@vates.tech>,
	<cardoe@cardoe.com>, <andrew.cooper3@citrix.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v2] automation: restore CR filtering
Date: Wed, 21 Aug 2024 13:29:58 -0700
Message-ID: <20240821202958.3942632-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|CY8PR12MB7124:EE_
X-MS-Office365-Filtering-Correlation-Id: 88af8df2-f1f8-459d-25d6-08dcc2200885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I6YBUjKO+ZlDO72IBbWfKxKrNpOi64Sp+QTjl4VUAzCrPJoJnGz3fWAbFknh?=
 =?us-ascii?Q?C5mC2of4UjYO4ylFOluIesr/SAEmh0DeCX7fE4TWAJso+WwQDXhE6RISESlI?=
 =?us-ascii?Q?Y8Ctamp0xLH4fs7VDkiPP0RyHvMpOE6MU+SAe+fDuWo5eQADfuscTm3KaDVo?=
 =?us-ascii?Q?Meuv2P+Bs0BTVNuW7Rg07dyhYqKwQ793WYUdRoTEADrzeSmFCzIvNrZ0aaMo?=
 =?us-ascii?Q?Lqs/rq9KA9iwEATMeOpwl51aLgnVFGQ0qRaX8pVWc9jdfqVpNJMqxgXYp0sw?=
 =?us-ascii?Q?w8tKwcoWQOsyhmxoAmoI7xVJF+md57UnM3hHs1IvASl7xMfBaptvhHw9rvP/?=
 =?us-ascii?Q?FwZ2Q2kKcp6ojVc9nUd+SQH/Sl45vsVgyxeAIjg/qo/MPigCnh7d++b6vP/u?=
 =?us-ascii?Q?jmctX+7sePywwVol9IfryDtRkukimPFjK7t5NqxKEMZQetIoKWC55x+I0tGg?=
 =?us-ascii?Q?aMFSK7dGmDJgI0KFEa3g8ahdf+rWWGd9uaMPKkptwujHu9t0bdG4snjaAXMp?=
 =?us-ascii?Q?B1ZAkcVUOAmVJ3lqckAAJ/OnOjetKfezd5rUqlJFSuRzth41R5kiSYEIhVKa?=
 =?us-ascii?Q?4UmQ543qAW7ZoSRWsn+gFAGLEBs20Y0EZ0fqrRlihCpz899lUMbEdIKQshFO?=
 =?us-ascii?Q?bSFTkJ9Xn9+XFDD77qeMFnKv9iR1nRleNI7SgPUdepmeTgyVk3CGLcTDtFVm?=
 =?us-ascii?Q?iKRe/SrcYkICFz2VT6FqGLETOxM00LbnTDAOB9+J30o59gq+AHAAAS80ytr+?=
 =?us-ascii?Q?T90nL1AUQ1QBdJyAPPzbYWzP0rHNefLokzcsxHdGhvZDTc+4YbGy8tA/d/c7?=
 =?us-ascii?Q?Oy0QqW+qWriWxtOGui9iBGT7TB2MIlYIDlFwDXoRiwBMBD7e9DqXjKoptQ8a?=
 =?us-ascii?Q?dsLCMc0WzUIe3ESe7ZaY3JrtcrpuIenJML0RlLiY2WaBJhqFoqxc+J8uCvQP?=
 =?us-ascii?Q?Myhov6Gf75HkBM3H7Q2uDFw8gtWIUSIf+t0/hyFNZ1iuHaTb2GAPS2Jz1Ts+?=
 =?us-ascii?Q?9S+TO7V0Uz2dNh8wsJFG25gPTvoYP5EWHsP0tJy5eUdB+uatfBkcC9ftBDyY?=
 =?us-ascii?Q?corFWqilXv2noS30+g9MHHBQUjT3Y6Fzdh3GfCPLxFpRgZy6ROSeCmahldRN?=
 =?us-ascii?Q?7/LqkGXU8fXUnqnDgcYiI40UBV1U4FyUgodG4fkOypDiG2ho9alw8ATIon7G?=
 =?us-ascii?Q?ddsgFngGRbhGtA0i2PmDBnLQn9r7juo9lz5p6cm1/4JIwiaGG4zO7VmGB6uC?=
 =?us-ascii?Q?AjeInKYEoVUxTUmAeu/m3Kji0+M/OoOG6RYQkyGHaNy1/uiA/+Ybtau7epGp?=
 =?us-ascii?Q?Jb1KDMdeBVoyDvLqvfzuCamBMhFOEWZECA/6IY3SjXJ4ug1TKzVy0Lk64vks?=
 =?us-ascii?Q?b9xco79iwmIy7V3eU49BSf9hlUBRLDtJv0V4AD8pnBEydT9WlzkDvyjL8HPQ?=
 =?us-ascii?Q?HKcvJ/UVmi9oIrATbPbi8XdCUqjslC1z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 20:30:01.6203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88af8df2-f1f8-459d-25d6-08dcc2200885
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7124

After commit c36efb7fcea6 ("automation: use expect to run QEMU") we lost
the \r filtering introduced by b576497e3b7d ("automation: remove CR
characters from serial output"). This patch reintroduced it.

Fixes: c36efb7fcea6 ("automation: use expect to run QEMU")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- fix the sed expression to account for multiple \r
- ensure Xen logs are visible too
---
 automation/scripts/qemu-alpine-x86_64.sh        | 2 +-
 automation/scripts/qemu-smoke-dom0-arm32.sh     | 2 +-
 automation/scripts/qemu-smoke-dom0-arm64.sh     | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm32.sh | 2 +-
 automation/scripts/qemu-smoke-dom0less-arm64.sh | 2 +-
 automation/scripts/qemu-smoke-ppc64le.sh        | 2 +-
 automation/scripts/qemu-smoke-riscv64.sh        | 2 +-
 automation/scripts/qemu-smoke-x86-64.sh         | 2 +-
 automation/scripts/qemu-xtf-dom0less-arm64.sh   | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
index 5359e0820b..42a89e86b0 100755
--- a/automation/scripts/qemu-alpine-x86_64.sh
+++ b/automation/scripts/qemu-alpine-x86_64.sh
@@ -89,4 +89,4 @@ export QEMU_LOG="smoke.serial"
 export LOG_MSG="Domain-0"
 export PASSED="BusyBox"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0-arm32.sh b/automation/scripts/qemu-smoke-dom0-arm32.sh
index bbdcb39f1a..fd64b19358 100755
--- a/automation/scripts/qemu-smoke-dom0-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm32.sh
@@ -96,4 +96,4 @@ export QEMU_LOG="${serial_log}"
 export LOG_MSG="Domain-0"
 export PASSED="/ #"
 
-../automation/scripts/qemu-key.exp
+../automation/scripts/qemu-key.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
index 0094bfc8e1..e0cea742b0 100755
--- a/automation/scripts/qemu-smoke-dom0-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
@@ -109,4 +109,4 @@ export QEMU_LOG="smoke.serial"
 export LOG_MSG="Domain-0"
 export PASSED="BusyBox"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
index 68ffbabdb8..e824cb7c2a 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm32.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -149,4 +149,4 @@ export QEMU_LOG="${serial_log}"
 export LOG_MSG="${dom0_prompt}"
 export PASSED="${passed}"
 
-../automation/scripts/qemu-key.exp
+../automation/scripts/qemu-key.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index eb25c4af4b..f42ba5d196 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -220,4 +220,4 @@ export QEMU_LOG="smoke.serial"
 export LOG_MSG="Welcome to Alpine Linux"
 export PASSED="${passed}"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
index ccb4a576f4..594f92c19c 100755
--- a/automation/scripts/qemu-smoke-ppc64le.sh
+++ b/automation/scripts/qemu-smoke-ppc64le.sh
@@ -25,4 +25,4 @@ export QEMU_CMD="qemu-system-ppc64 \
 export QEMU_LOG="${serial_log}"
 export PASSED="Hello, ppc64le!"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index 0355c075b7..c2595f657f 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -16,4 +16,4 @@ export QEMU_CMD="qemu-system-riscv64 \
 export QEMU_LOG="smoke.serial"
 export PASSED="All set up"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
index 37ac10e068..3440b1761d 100755
--- a/automation/scripts/qemu-smoke-x86-64.sh
+++ b/automation/scripts/qemu-smoke-x86-64.sh
@@ -24,4 +24,4 @@ export QEMU_CMD="qemu-system-x86_64 -nographic -kernel binaries/xen \
 export QEMU_LOG="smoke.serial"
 export PASSED="Test result: SUCCESS"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
index 0666f6363e..4042fe5060 100755
--- a/automation/scripts/qemu-xtf-dom0less-arm64.sh
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -65,4 +65,4 @@ export UBOOT_CMD="virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x4000000
 export QEMU_LOG="smoke.serial"
 export PASSED="${passed}"
 
-./automation/scripts/qemu-key.exp
+./automation/scripts/qemu-key.exp | sed 's/\r\+$//'
-- 
2.25.1


