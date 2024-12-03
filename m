Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9B99E2EA3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 23:07:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848196.1263161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIb2d-0002wz-Q8; Tue, 03 Dec 2024 22:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848196.1263161; Tue, 03 Dec 2024 22:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIb2d-0002uU-NN; Tue, 03 Dec 2024 22:06:47 +0000
Received: by outflank-mailman (input) for mailman id 848196;
 Tue, 03 Dec 2024 22:06:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BnMR=S4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tIb2b-0002uO-Pr
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 22:06:45 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2414::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e085c2d3-b1c2-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 23:06:43 +0100 (CET)
Received: from PH7P221CA0037.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::9)
 by PH0PR12MB7472.namprd12.prod.outlook.com (2603:10b6:510:1e9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 22:06:37 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:510:33c:cafe::a1) by PH7P221CA0037.outlook.office365.com
 (2603:10b6:510:33c::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 22:06:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 22:06:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Dec
 2024 16:06:35 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 3 Dec 2024 16:06:35 -0600
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
X-Inumbo-ID: e085c2d3-b1c2-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3XRdt1ng4gpuGmOrq2GCbvd0/sH5x/aMxmkWjmKuooUNXxj3v24/4jeo0Qz4Hu5Qs6FJI4etRgMUjB6oKi7m51fcDK6DE8Z7DYIrvrpSqeUCZv0MR92LWRQYxg41zTqL6Gn7V0atha4ehEI182/HW1erBgTXzIiwrA9jwJplFpb57+QXUTP8ftMGqKQs8jQMc/xXhvO9/jyiiyQGZflDPJZYcVtflrcSeTJFT9DWxopROLdl/u1GcwpRMmK1SaGPHBZlyJ+TbERn7+lZnswg2tcjwEpZgjXi7gq3pK34Gdo3EhWRswZJ9wfhyDno8lkUP5kHkwAYmQR+6MHYpHwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q66tnZkfbJTgYgQsDYVjaaaWnZNr+Jjg9l611QxeEqY=;
 b=l8IYtNLWmL54NvqsvYvpWljXV/dARDk6Wh8yCznHlS3YQyLQaima/ftnZJE0CFsc3+VZwg4Er23baqYQSd2bgaa6nAXuMsYX5+S3B85IPnQEoINa7/JfcV8B/4WHqdGS1bFQh2Zhc8lsUHOalEx2P2bOKGS5uO4e73yFr4fzJyhQW5sTzS4HHc/r9Har69svM9UvEkhOf7HeVaX6FIYTSuLshCdOQN0lMGBhpfxsFIsAJPi9DKYy0ujfRyFcQBCWd6t+qnci0lmAPybWVSgp3C+xiOBabL6jkprGomr5pHwYfXbWFZVsOjBth1Qs9cuXe24b3TE2tu8eugDyoVH5MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q66tnZkfbJTgYgQsDYVjaaaWnZNr+Jjg9l611QxeEqY=;
 b=I/OqoekgvOJQwoZSE9NOPlDWCraXMLMD3cnbBgUX1LT3g8ooTMpc3kG64Hh244VDjUWXGMsLzvU72N26gXJRv1uOdBfylb5A9/+zOEjmga26erSgFe67HT+r5ZOnVDoCHLyAeYNnuN/xtrxirHc+xCEhdImo1pZ8OXHzDNQauHA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?zithro=20/=20Cyril=20R=C3=A9bert?= <slack@rabbit.lu>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3] tools/xl: add suspend and resume subcommands
Date: Tue, 3 Dec 2024 17:06:41 -0500
Message-ID: <20241203220641.4202-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|PH0PR12MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: d32f6e1e-43d5-4df8-2f09-08dd13e6c18f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXVneWlZbTNmb2VnL2l4eFFBenhCSnNzZ2FYTmZwQTlYWmZHWWRyWGI0dWxP?=
 =?utf-8?B?SmtSTFFCZDJiVXVMdkFaWGJudElSR1phY1JoR044dnVzK2xmWGVybVBVL3Vx?=
 =?utf-8?B?WloyQ1JBZVVzTzVCZnJMQTVlWHM0VlQwMkI1S2ViM2NHOGZsZHhSY1BOcm5y?=
 =?utf-8?B?K0VySnFLMG1KT2ZUVE9XTno4bEF0bjJDSUs5RHZsdVNxOVA1c2llZWxCazRY?=
 =?utf-8?B?c3pOQkRFOGRIeHNpSnZFLzU4U3R2aWNpMVdjWEZjQi9aZmI1WVZUQ29sMVV0?=
 =?utf-8?B?RGIzOWxuTjJmdGo4YU9qOEhORW14WmRLRHY0TjVGb3A0cWQ2SmN5SGNmcHNJ?=
 =?utf-8?B?dnlUNHRzU2JwTXkrTEtESXd3SnhvVlFVSU90dElCdnBPcnZRQzltenkxeko0?=
 =?utf-8?B?Y1MzbVU0K2V5bXN6ajc3VnpFVGt1SEsvUDVtTm5PdGttdnFlaGlzTFFnNXZv?=
 =?utf-8?B?Uzh0MlFjVWNSb2RTWm5RdXZJYjY3WERuU3dTekVvdWttcVg1TkhiNyt4bEhB?=
 =?utf-8?B?L1lneEVuaXpSTFNPRXJLaFVkN3ltZHAxaCtNV1pITVNvN3lsNjdMVnN6SWpK?=
 =?utf-8?B?cFhxQ0NIUDFaWWNsMy9rNWc5WUsraXlkdWUzMzZWdFJGclFJTlZZUVpXU1RJ?=
 =?utf-8?B?SHRyM2poV3gyRDVwMFIyY25qTGRhMXV2NzdjekpaWkU5bU4yTFZKTXF2NC9h?=
 =?utf-8?B?NVVrelovcTdtRVZ5cDBWUWlreExmK3RuMzQ0cTMwWmhBNGpINzhDL2tXOVFo?=
 =?utf-8?B?c2lKMGdZUUhOZjFCSEZleWJJWC9Yd2FYdVdGQ0JrTkoxOEpUbWF0OGpIRFNP?=
 =?utf-8?B?R2RxaWtXZ0NnaGhVcm40MGRPRUQ5dDY0V2V0dXRacFk1QTJ2V3JLV0hFT0tM?=
 =?utf-8?B?RWVEcWpVVm1GTFRzV2hXL3ZiS3FTNnhDcnRTQnRaZWtEelNyaGgwaHh2SzZv?=
 =?utf-8?B?U0FhTFNlbGNPdUJXRlZqRXZJbmdlMk9wYzROcnRYTVJqUGpDNWNHc0JuUERF?=
 =?utf-8?B?OHdkQ3JkMGE3dlJyRjdqUnZSd2xtSzM5aFFhQUpIZlErUCt1bHdlM0d3OTM5?=
 =?utf-8?B?ZXduTk05YkZyT0llL216RVZXYmQ0SmlYSG9Bd0tySXFVaG03Yi9Qa0FoUUkx?=
 =?utf-8?B?dVYzVmsxQi9xa1MrWVhseWVDclcrSi9tMnlQRXVES2xrQlhkR3M2RVJoSGlF?=
 =?utf-8?B?enhIajJZb09EeEp4OStmSkQ1Uzk4czJGOVh0eGp5QjRwL0hodkR3d2h3U3hB?=
 =?utf-8?B?T0pBaGJ0dWN0MVpGd09IYmdQdzdWSTA5VXcydk1VVXdjK083dGNQSVF2dU1h?=
 =?utf-8?B?WjJuRTV4eUlMZUhRRFN0VW1mcVZkUDlWb2FBeVdMQWlxVEVMY3pTOW9yakNU?=
 =?utf-8?B?dEEyUW5SbmErR1hRVTU0Vmd6Y2J0SHI3MW4za0NNUUJDUWd5a2FkZXc3VVlx?=
 =?utf-8?B?RHhUcXgxRU80MUdjYlRrcWtNa2MzZDQwRzkvSkx4T090aHZhclZlSDA0dWcz?=
 =?utf-8?B?VXdDTDdJOTZkYzZqR3FNclB5MmMyTXFPdUlQRFF3Y0tURVUrSVpVRmVldnRV?=
 =?utf-8?B?bW9ja1ZVQjNzcHZ4M0VxM05SZjRCdTNteFd5OUxpR0o5b00va1h6YzRsaWxP?=
 =?utf-8?B?OG5lSjJleEw0MS8xVUlWTm9yQUhmYVU2dG9IeFZMdmdtbUEyQmJLQW5mcksr?=
 =?utf-8?B?N0l5YU1maVBDMmxlc0Y1QXVDanVhd3ZmengvRWFEQTFwYXEyM0pGZGtOc1hM?=
 =?utf-8?B?akN0R2MvakVOQW41eUdJVmpURXRKRUoyTWtNTEd1Rm5rUzFWT3VCTVpsS3B0?=
 =?utf-8?B?dHlpZVdycDFtZjMvejBETENaUm1JazhHLzNyMk5VZ3hibVJhVEhwTWtNRWxk?=
 =?utf-8?B?RU4wTExZUE5FMWJWYXVrMGhYRGQ4U2FUWWRqZ1ZjNGI2VXdRbGtLcWdZRitD?=
 =?utf-8?Q?5Wu2h5Hc2gcZsvn1tcnuMxjoHR9f7yOL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 22:06:36.5551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d32f6e1e-43d5-4df8-2f09-08dd13e6c18f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7472

From: zithro / Cyril Rébert <slack@rabbit.lu>

The xl command doesn't provide suspend/resume, so add them :
  xl suspend <Domain>
  xl resume <Domain>

This patch follows a discussion on XenDevel: when you want the
virtualized equivalent of "sleep"-ing a host, it's better to
suspend/resume than to pause/unpause a domain.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Suggested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Cyril Rébert (zithro) <slack@rabbit.lu>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2
Rename command to just "suspend"
Move inside the HAVE_NO_SUSPEND_RESUME

v3
Move more functions inside HAVE_NO_SUSPEND_RESUME
---
 docs/man/xl.1.pod.in    | 12 ++++++++++++
 tools/xl/xl.h           |  2 ++
 tools/xl/xl_cmdtable.c  | 10 ++++++++++
 tools/xl/xl_vmcontrol.c | 38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/docs/man/xl.1.pod.in b/docs/man/xl.1.pod.in
index bed8393473..fe38724b2b 100644
--- a/docs/man/xl.1.pod.in
+++ b/docs/man/xl.1.pod.in
@@ -682,6 +682,10 @@ Pass the VNC password to vncviewer via stdin.
 
 =back
 
+=item B<resume> I<domain-id>
+
+Resume a domain, after having been suspended.
+
 =item B<save> [I<OPTIONS>] I<domain-id> I<checkpointfile> [I<configfile>]
 
 Saves a running domain to a state file so that it can be restored
@@ -760,6 +764,14 @@ in response to this event.
 
 =back
 
+=item B<suspend> I<domain-id>
+
+Suspend a domain.  This is a cooperative operation where the domain must
+respond to the xenstore trigger.  When in a suspended state the domain
+still consumes allocated resources (such as memory), but is not eligible
+for scheduling by the Xen hypervisor.  It is in a shutdown state, but
+not dying.
+
 =item B<sysrq> I<domain-id> I<letter>
 
 Send a <Magic System Request> to the domain, each type of request is
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 967d034cfe..45745f0dbb 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -129,6 +129,8 @@ int main_restore(int argc, char **argv);
 int main_migrate_receive(int argc, char **argv);
 int main_save(int argc, char **argv);
 int main_migrate(int argc, char **argv);
+int main_suspend(int argc, char **argv);
+int main_resume(int argc, char **argv);
 #endif
 int main_dump_core(int argc, char **argv);
 int main_pause(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 53fc22d344..06a0039718 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -193,6 +193,16 @@ const struct cmd_spec cmd_table[] = {
       "Restore a domain from a saved state",
       "- for internal use only",
     },
+    { "suspend",
+      &main_suspend, 0, 1,
+      "Suspend a domain to RAM",
+      "<Domain>",
+    },
+    { "resume",
+      &main_resume, 0, 1,
+      "Resume a domain from RAM",
+      "<Domain>",
+    },
 #endif
     { "dump-core",
       &main_dump_core, 0, 1,
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index c45d497c28..c813732838 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -32,6 +32,44 @@
 
 static int fd_lock = -1;
 
+#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
+static void suspend_domain(uint32_t domid)
+{
+    libxl_domain_suspend_only(ctx, domid, NULL);
+}
+
+static void resume_domain(uint32_t domid)
+{
+    libxl_domain_resume(ctx, domid, 1, NULL);
+}
+
+int main_suspend(int argc, char **argv)
+{
+    int opt;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "suspend", 1) {
+        /* No options */
+    }
+
+    suspend_domain(find_domain(argv[optind]));
+
+    return EXIT_SUCCESS;
+}
+
+int main_resume(int argc, char **argv)
+{
+    int opt;
+
+    SWITCH_FOREACH_OPT(opt, "", NULL, "resume", 1) {
+        /* No options */
+    }
+
+    resume_domain(find_domain(argv[optind]));
+
+    return EXIT_SUCCESS;
+}
+#endif
+
 static void pause_domain(uint32_t domid)
 {
     libxl_domain_pause(ctx, domid, NULL);
-- 
2.34.1


