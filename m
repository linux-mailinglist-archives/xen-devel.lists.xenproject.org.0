Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDCC971F59
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 18:36:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794756.1203813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snhMQ-0006jb-SP; Mon, 09 Sep 2024 16:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794756.1203813; Mon, 09 Sep 2024 16:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snhMQ-0006hj-Pm; Mon, 09 Sep 2024 16:35:30 +0000
Received: by outflank-mailman (input) for mailman id 794756;
 Mon, 09 Sep 2024 16:35:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Mt0=QH=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1snhMP-0006hd-CM
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 16:35:29 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84b77e91-6ec9-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 18:35:27 +0200 (CEST)
Received: from SA0PR11CA0151.namprd11.prod.outlook.com (2603:10b6:806:1bb::6)
 by DS0PR12MB8574.namprd12.prod.outlook.com (2603:10b6:8:166::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Mon, 9 Sep
 2024 16:35:22 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:806:1bb:cafe::7c) by SA0PR11CA0151.outlook.office365.com
 (2603:10b6:806:1bb::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Mon, 9 Sep 2024 16:35:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 9 Sep 2024 16:35:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Sep
 2024 11:35:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Sep
 2024 11:35:21 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Sep 2024 11:35:20 -0500
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
X-Inumbo-ID: 84b77e91-6ec9-11ef-a0b5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KIjHfKwoWvGyEn/qx/MaOenu1adszbTnpPZqOcIREtkguHqos2gkE6W8Gr+qQDm9Mvc19V5XvxqbnNmaSiBJj5680LEW0nV9F3zoGw57r7YbMLpOzhLCzOSjCo+JNoTjdXRiMujGJfZxEmIo5FvTbzT+NY1yAl3X6k6K4HrSkR9NFr9CrL0sPgMWVtBwLM1KWSCCSVEO81/OeZbZ829UgkvSsRWjs+xP2QV0JyxEnQzNOsD78Ps8maliO3wG5xsO3nG8iciif7+7LCCBKkk0u7m16Nhch4vznhbXv4U5hJMvz5aG+AXM3jx8HWKNL3WgXx3XDWHJQuzBml9IyEBIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9Ap67k+eRNXzgKfExfQ9htaHC/3yNa00hd0p26xjf0=;
 b=bhA3DPXbOQqR5nNOmrk+5J5GuDA8+2HuPaPxvneNQCnVkG2IvswCyujuexV6GuEYV6JMghuR50R9YX6RrrU1YYRUFtAakjZSWjExzHfqebpIgnPMXVlZdtE4RYmCPT2KMFnX8Za4ENmhVlmiX5TmJure/QU+F1kB3ebYaoIP+Zsh0ecKO5R8q6oNKFZJlbzFrXe76kduvSrcR4YxnR0TgKDrAa8vDK2a9a0ilc3vbHFzS0UwyexT1fz/lNkeNJNKB1pdG+2JjXU+sndMz8YKcxLJkGEdmXpc8PRJJF6trjwVHIAPwPSr7SBBRaneWAsEy3iBF1Ld+akHqAxxQieYxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9Ap67k+eRNXzgKfExfQ9htaHC/3yNa00hd0p26xjf0=;
 b=wrbjNjMg7CysS6n+yOxCI0bJbTOwySoaokueAkE508Ix51RCPp03x5sAnVXchUh6EzPp2uptCPIJp5z9tyjzIr01ERJai4z5kCbx59a9035md2wBrolwHoBoxRD6llXtoHbIRUFLE+PmeL80BfAvVYpKkDhzXDn0wXFNNBj4Nx0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1] automation: fix xilinx test console settings
Date: Mon, 9 Sep 2024 09:35:14 -0700
Message-ID: <a44620dab0fbdda45874c19e2c5f28eb9d181387.1725898223.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|DS0PR12MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 82622a2a-9126-4359-84f0-08dcd0ed6640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?02isGsBoyjgBfbAzeXLny0fioRKU9neyLZysXnlZBqn+3+7hewuLX4HjIw38?=
 =?us-ascii?Q?rhDRGV+pviALZcKcoPfy6tLYujGO6NpoXhQ86DDYAdgUMT9hfrlSF+2zAcm1?=
 =?us-ascii?Q?Jqj/QzVCkRFi2pvpWJGEYKvHtjRKezNF2mgmzALem/Whjuc+ca1C55ZdCCBW?=
 =?us-ascii?Q?EqxH8w4uxVkOUVhCBIkddP1IEMpzzkez5pV5JZu4HMUlyfbfv25tSq9aJyYV?=
 =?us-ascii?Q?o6do/aG6Or4BLi3q1UFm5hmNQVwzzczoTX+ZwYilWkgfwy+PmR/hOTVnxXFh?=
 =?us-ascii?Q?Dy2Si6YQ1zzEK2cvvZu5HOilrDj2JS/JNDmn+aIUwp8CC8VBYO6Uvz7NggjM?=
 =?us-ascii?Q?VVsN/khCne1QWM3I1qxeciWZ9RZf5EhoAz+dJhXpY4gIJiuhH7me4ReQORuc?=
 =?us-ascii?Q?cQKUgEWXaRJBuXP11zAosbrQ8oZ4n7pPHxZmPN78Qhx80LhgvLQHVnSxosxD?=
 =?us-ascii?Q?nlvRDRDgyxUbL9lfnzkgFOH/qkdgck2pK4u96hr4Qon5vWIlHaKPOviOzvhX?=
 =?us-ascii?Q?91hWJLTn/xekq+mOWdmiBZcgMh0GWq1noeEdSDAbtF++Wq85iVlNPlrsbLCn?=
 =?us-ascii?Q?vXJQJQgijFGO4VaAaVMEuR3hdRnBXEcw6qOmMMye67puBKiP1RGAppwFZGnm?=
 =?us-ascii?Q?+ys6a4ZIaJmQAbb4O3tv6RqR1UXMIINpI+wCDrcmzr68LcpmD7ze+WoajQfD?=
 =?us-ascii?Q?dFEkeE/rlSGwZPzIFVLU3OAyL5egJoDnQk2CiO+nKCCdqFBj/SUjbHffKvVW?=
 =?us-ascii?Q?qS4n83cu++b49faI9rmBRQJ9FX1Krcbk6sdM/vtwrLMtfAa055FSbgoxovMO?=
 =?us-ascii?Q?6BrJmJ+dC2sJs0lzzoUp1NUZXTVZIx0XExKQGs9nU3zSe9wOH7P2gWByZfbe?=
 =?us-ascii?Q?TqnBk8mnpnVhU/Rc6nJ7UycFqlTakhk4sxpDDZNKaYpT+NFvuHO4bkVa49iG?=
 =?us-ascii?Q?/82g4xwQsFbHT0mUGkq15LxyHv92MrsigP+9M71DPNrX1UZI9rQI4Zly0bwa?=
 =?us-ascii?Q?ux4DMmHUWsszBMgnXc3J8b6QogipaHiR55kpEJdUd/C49LFhgT9xjSLQ3wYa?=
 =?us-ascii?Q?KRYbIk8EDzOZF8rNkjb/cR3JXRu7nzmxHwSMYV9jO/dJzBOzDh5/e4dYQi+m?=
 =?us-ascii?Q?r7r1dwOgBwsoXdSVKzfaq7s1ZDBl6PmFjwTHTml2sEV3jOgIPMFloM/jlig3?=
 =?us-ascii?Q?br3krE4lAA1nYfiBorpPETV8NMomFfgyClG4ZqEMNccO8WNKyqe/q+3ehUp7?=
 =?us-ascii?Q?ufTgHAiqcSfgu1AIY/2FwzpoB9/64QzGaUqwr+OKlnRHwGXbjYjX7kZ24sVg?=
 =?us-ascii?Q?rbMuh12ExsAx6PQQH4i/7XgQs3MlyOYF2PvZM7qeDcMv4lbPkh0S5eP1a3EW?=
 =?us-ascii?Q?EHjBSZDbJANOklwjBwiOJthOI/KF/FOEF80vLvnjIGQAWxF26zQKAH84uVDk?=
 =?us-ascii?Q?k9nvl0WigUpHo6zGcXhLowSaXtTkoNjg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 16:35:22.0317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82622a2a-9126-4359-84f0-08dcd0ed6640
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8574

From: Victor Lira <victorm.lira@amd.com>

The test showed unreliable behavior due to unsupported console settings.
Update the baud rate and I/O port used to connect to the UART.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 automation/gitlab-ci/test.yaml                 | 2 +-
 automation/scripts/xilinx-smoke-dom0-x86_64.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index cecc18a0198c..35ce453475bc 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -102,7 +102,7 @@
   variables:
     CONTAINER: ubuntu:xenial-xilinx
     LOGFILE: xilinx-smoke-x86_64.log
-    XEN_CMD_CONSOLE: "console=com2 com2=115200,8n1,0x2F8,4"
+    XEN_CMD_CONSOLE: "console=com2 com2=57600,8n1,0x2E8,4"
     TEST_BOARD: "crater"
     TEST_TIMEOUT: 1000
   artifacts:
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index ef6e1361a95c..7027f083bafe 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -129,7 +129,7 @@ sleep 5
 sh /scratch/gitlab-runner/${TEST_BOARD}.sh 1
 sleep 5
 set +e
-stty -F ${SERIAL_DEV} 115200
+stty -F ${SERIAL_DEV} 57600

 # Capture test result and power off board before exiting.
 export PASSED="${PASS_MSG}"
--
2.25.1


