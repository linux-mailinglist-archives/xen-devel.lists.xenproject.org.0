Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CDA9E1586
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:22:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847324.1262491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAl-0002F1-CG; Tue, 03 Dec 2024 08:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847324.1262491; Tue, 03 Dec 2024 08:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAl-0002Cw-2z; Tue, 03 Dec 2024 08:22:19 +0000
Received: by outflank-mailman (input) for mailman id 847324;
 Tue, 03 Dec 2024 08:22:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIOAj-000271-9h
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:22:17 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2414::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b41e465d-b14f-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 09:22:16 +0100 (CET)
Received: from CH2PR04CA0026.namprd04.prod.outlook.com (2603:10b6:610:52::36)
 by IA1PR12MB8079.namprd12.prod.outlook.com (2603:10b6:208:3fb::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 08:22:10 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::e) by CH2PR04CA0026.outlook.office365.com
 (2603:10b6:610:52::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 08:22:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 08:22:09 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:18:32 -0600
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
X-Inumbo-ID: b41e465d-b14f-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZpvVohbClks+20ir+fgAFpRF1CEOAjAMP+JPJq3QuomFFphqMRrYTowrd+yOU8zPBkjuPlmTjisIT3LLliFjTipkBgS9X4yAYO0aXRDe8Ys6z4BQPHlwnLeGiuJO1rH/B6BwWU4IrclMaWR6dwa2tkVDMUSKqJWae+spamFXBDkYLVOEYleQq2BivEhwzIxBYdU8GxA6KCJJmsZPHOsWpBrFbJAqB+FffJuZDzWNCipJBp6vu4ov+N+AFbte2k5QN1T84S++sKbfFvm/675gkdtak0ZQumjXK1b91bItWRwFiRBe30tQdjLT+EAFDQr7F5qTRNL9rQZ0WFJqAul8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruSsC38qnvGR7EDsFK/ZZZZT5Bp/vYDQpQsoiYuXqPY=;
 b=pObgZN9d+Q3EhqlE17BJX1r3wFhHpGRHGZwy7KyWbwE6JsQCMBlGnLaAN6EmItDN2ikKNEHz1mkKOR4kJt4CyWTyVJA9IpNCldVUt7VxwK349Sez3PZAS9TFVV99AEYspjoaxR2O5U2T3+NoRcNYnX2/3wOlLfQC+cV+R0pELUJsTp8nweutueG5Z6vSN6yRgyPTSjRQVAjpNwlki3y333bhf+JezHLVCMfy5XMs1JxmPOdutYPUaf3sIyZ9+OHDCEo5CRtQ0IMZbbL7BtKkNl5wgwsDISsNOI/MrLdu+UraVIygUTcgK/XUnqcxYy+BLPKrdDpXLqvtjjStT9hcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruSsC38qnvGR7EDsFK/ZZZZT5Bp/vYDQpQsoiYuXqPY=;
 b=VVZzEPD9yFlEXRnkI585m42RSgNqMf0NFiKMlo+PMoPTpan3LtSPCJjDKtWGzVEMJjZOA4/VaY9txFyFPBw4XuSZLxAm560AdkZiQfhbOZyss3EEtD5bdDzoQ2eAtVQj+zj7YGLxv5YZgDghc9wquQVxcK09KxfYqEtwPF9rwJY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <Ray.Huang@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>, <penny.zheng@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Penny Zheng
	<Penny.Zheng@amd.com>
Subject: [PATCH v1 08/11] x86/cpufreq: add "cpufreq=amd-pstate,active" para
Date: Tue, 3 Dec 2024 16:11:08 +0800
Message-ID: <20241203081111.463400-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203081111.463400-1-Penny.Zheng@amd.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|IA1PR12MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 34af70fd-8b9a-4079-f29c-08dd13739512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4E+nIAjoNAy+H4HRoYS8Irc56tgy5OUSyaKi0dM5DCmc0J6yHUYfRbvOp5+H?=
 =?us-ascii?Q?tcsSkSPFML/nkHEv5r/yPxedR+/k5tDmyLrJApM5LdI2p9Fy0OFy3Rv8ALZU?=
 =?us-ascii?Q?W71dtr01WH5CBbatPXMA6DQnXXQvYcuM69lrNHtazDhhRZpcPanV5q9ZavNj?=
 =?us-ascii?Q?OxZfo9hk+ibI/Jhwy0rNtDQiT9NLoHJDGaIKPrdbqUYX0+GD+JfJ4uLEMblE?=
 =?us-ascii?Q?sbXrskTQVEJxlClFNjD5XU7liK7mPJ964vQZBmRUSxULNKpgTI9YbrBVNXBv?=
 =?us-ascii?Q?hnZuCP17Lx2e7qWv1pZbFfClov3VBJDtk4alnJo7bb/Tw+ke/S353x0MkdbV?=
 =?us-ascii?Q?dUqs5Pb2rIep57CpjqTI8i3mMv7DxRUiaHcdjlp+O5QRk8iiIRrwSUj3fLZ1?=
 =?us-ascii?Q?IKA9BldAYLFIJB5fNU7mlBEb4iWAkJJ6HwbGLeMQDRqKfXvgLKbsdhr5GMl2?=
 =?us-ascii?Q?rTM+o+Y/ROEiWSw1JwBtvYhIBS+VAvPQXqgyhUNBaf/xOifULMKfQWmXpRDh?=
 =?us-ascii?Q?3knwsCWqP0JkCF4vvJbs+QIn8MfQD0LD+M4EmQ73nyZUvj0iv+Ro5lZNBruR?=
 =?us-ascii?Q?dd4pXUqMo3Cq78miV7XpKPOAQgLb79oFQR/XrAWbOj+ujo5+7CIno5nAnc8F?=
 =?us-ascii?Q?J/XIQ9naiCczcStwBBr/4Rbn9Whr/XthQmrluevDoDUJF1YT7OwZvXRsObDz?=
 =?us-ascii?Q?M2mCDdy7hYkEnsRU73ANFMrAVkZS9Klrb9Kk77/FQfwcjC97H5p9Eoh9srKl?=
 =?us-ascii?Q?JQjOoQOES4iaEwwjiw4fhEdt3hpLqzCWlcSzYJt92tDTYw6IRrz9EmhHFf8m?=
 =?us-ascii?Q?sYKiWRy2qco0FU4V2D0h+pQLD4PS3czaXgmItc4Xp3b3EANmpKYnibC5v3YV?=
 =?us-ascii?Q?vdoDfn3ct7ILUT+wNopG2N99l6UDTTGVK9XU8k4M2D2MVR3y0uvf9adwzE8b?=
 =?us-ascii?Q?K+qUHpr3va7zqL+QMnY5ZMH2vrocZ2hNcbFiN/ZENk5RZsd5/kttHc/6nYoE?=
 =?us-ascii?Q?00nij0SYP1r8AyISqVILCCPHMZKoCJ7IxjvJ1oQowfpvEnZIbvfRlyX7OuKS?=
 =?us-ascii?Q?srN5BB4g44jC/tjt3yKSMk+JZBikZjPzRrDOkBipkMn57NUHDrt9FH9KVa7p?=
 =?us-ascii?Q?qDS7DSElTfSBcRbLM6EJGoJHk/Rf/7P2WHdJ51/UzOcqxwpO//9vJEGfIfS3?=
 =?us-ascii?Q?ZqXjMePN+x+8m4EaOlQ6lvSfQVSaTYMgJ1EN4bJi4Kj+zBpG+ztoxAlHnhai?=
 =?us-ascii?Q?9veWTwPN1wEbNv7nl7y09mE04FuN/18RXKG5W6+K2NB2m1aGR0DCr9+0W+pn?=
 =?us-ascii?Q?aVd8o3+LeJr7vsCC1jJwLYANrCnMN1REHITP/eg7D0uq/EpMWCptZj2gSePV?=
 =?us-ascii?Q?F6xWzeWouBUBxmPz2i3LzSgJO/dATBQ00/CZdrExdsevs6tog8QKw1uJEIIO?=
 =?us-ascii?Q?6dmmSoDa+mdW03aei7BUz5vAyTwpkBoW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:22:09.8910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34af70fd-8b9a-4079-f29c-08dd13739512
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8079

From: Penny Zheng <penny.zheng@amd.com>

The amd-pstate driver may support multiple working modes, passive and active.

Introduce a new variable to keep track of which mode is currently enabled.
This variable will also help to choose which cpufreq driver to be registered.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 docs/misc/xen-command-line.pandoc      |  9 ++++++++-
 xen/arch/x86/acpi/cpufreq/amd-pstate.c | 12 +++++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 30f855fa18..a9a3e0ef79 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -499,7 +499,8 @@ If set, force use of the performance counters for oprofile, rather than detectin
 available support.
 
 ### cpufreq
-> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-pstate[:[verbose]]`
+> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] }
+[,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-pstate[:[active][,verbose]]`
 
 > Default: `xen`
 
@@ -522,6 +523,12 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
   on supported AMD hardware to provide a finer grained frequency control mechanism.
   The default is disabled. If `amd-pstate` is selected, but hardware support
   is not available, Xen will fallback to cpufreq=xen.
+* `active` is a boolean to enable amd-pstate driver in active(autonomous) mode.
+  In this mode, users could provide a hint with energy performance preference
+  register to the hardware if they want to bias toward performance(0x0) or
+  energy efficiency(0xff), then CPPC power algorithm will calculate the runtime
+  workload and adjust the realtime cores frequency according to the power supply
+  and themal, core voltage and some other hardware conditions.
 
 There is also support for `;`-separated fallback options:
 `cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to `xen` if
diff --git a/xen/arch/x86/acpi/cpufreq/amd-pstate.c b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
index 5dfa35581a..43abdd8636 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-pstate.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
@@ -27,6 +27,8 @@
 #define amd_pstate_warn(fmt, args...) \
     printk(XENLOG_WARNING "AMD_PSTATE: CPU%u warning: " fmt, cpu, ## args)
 
+static bool __ro_after_init opt_cpufreq_active = false;
+
 struct amd_pstate_drv_data
 {
     struct xen_processor_cppc *cppc_data;
@@ -76,6 +78,13 @@ static bool __init amd_pstate_handle_option(const char *s, const char *end)
         return true;
     }
 
+    ret = parse_boolean("active", s, end);
+    if ( ret >= 0 )
+    {
+        opt_cpufreq_active = ret;
+        return true;
+    }
+
     return false;
 }
 
@@ -398,5 +407,6 @@ int __init amd_pstate_register_driver(void)
     if ( !cpu_has_cppc )
         return -ENODEV;
 
-    return cpufreq_register_driver(&amd_pstate_cpufreq_driver);
+    if ( !opt_cpufreq_active )
+        return cpufreq_register_driver(&amd_pstate_cpufreq_driver);
 }
-- 
2.34.1


