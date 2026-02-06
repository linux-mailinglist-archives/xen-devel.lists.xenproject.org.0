Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKkfF9wThmk1JgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECE01001F7
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 17:16:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223515.1531010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVE-0006iY-Oc; Fri, 06 Feb 2026 16:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223515.1531010; Fri, 06 Feb 2026 16:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOVE-0006dZ-FP; Fri, 06 Feb 2026 16:16:16 +0000
Received: by outflank-mailman (input) for mailman id 1223515;
 Fri, 06 Feb 2026 16:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lgBG=AK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1voOVC-0005HU-MH
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 16:16:14 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2705e35c-0377-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 17:16:12 +0100 (CET)
Received: from SA1PR04CA0007.namprd04.prod.outlook.com (2603:10b6:806:2ce::12)
 by CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 16:16:06 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::7e) by SA1PR04CA0007.outlook.office365.com
 (2603:10b6:806:2ce::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 16:16:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 16:16:05 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 10:16:04 -0600
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
X-Inumbo-ID: 2705e35c-0377-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rP6Sy0o4boTHulfLwPYK111iwBHz9WGU+D63Zkgv61G73+YYrjbpZZ9VvMSgPItbuyxF8vVeuD3WdY0SE/l1HzyxRdZi/1mHwl+3MZJzIumssY0z1kr4LJru3uNAYyniWo4aDAfjM1ZA/ue/UGiuKy8vM9wpmvY1WegECmL7I9MbTXAJc1J4Ix9Wfh3bSCy0rqkFLag4Ers6IHGvR6MEqoWejBW5N+0D9VJP3xk8t/lsgB8DO6ABcYsNwAwxqHYQN01HJIpkQhc6mjkBuiRG5RP7qCk9uNq+DhRAiqSvdplWtKuPiA/ZXkVnbzKMmjnIMXLOxzHtDPonBbjj2OJRPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NCyo7O8Na5M9YQ1OlNa4fXESdvuSX/73rKr8aiBo3mY=;
 b=y8UEc+JZJ2wTIKDkzRyoysIDqIiB8ud9y20X1FbZcZRt5UF3xjo15IPCeZqXUBLMWNpDBSZdLi8S2tOcIJCGD+GCM58zlk2q4icSNer8U12D7SK3k1e8L2FOtM1I6zYvgWwht3qbdKvNsGOlZH3XMREH7p1HNnw7NBOe4lTTsx05cs8U74vYhOCp9R62N9xAA9S2GB22Gau0G9qsqYaYrvyjBmOdcZQhvrZmzy9BKaSnjv7Rcu05W4FCwjTFyA0VlgWuI0rfrpcV3Y4AwH8BKiphEdAFCaje5nz4YJBOKgz0eiEb1DmvoSz/YXCdcP16aIOeyNe5LTVb1fhnH7QxrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NCyo7O8Na5M9YQ1OlNa4fXESdvuSX/73rKr8aiBo3mY=;
 b=c6gqESWmOtap/l8/92AtQBOy9hsRiGkCrv0NNjEJGOM6N3dOiuSRMu7leAznx4Z8EMKgyGMDyaI/SJOJYric8UAh6QI5pqm4YDC16YSbRpi5vj4nPgoUtLzfnrTWnG8aibwYgJkZTTQu0eszA7I5Nwvk4nNj3vikdk64gVQlWSE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH 06/12] x86: Migrate switch vendor checks to cpu_vendor()
Date: Fri, 6 Feb 2026 17:15:28 +0100
Message-ID: <20260206161539.209922-7-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
References: <20260206161539.209922-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|CY5PR12MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: f402acba-e5db-45f7-3695-08de659b07e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r+PR5TQbdX4oyj/arY748CE4y3CXwJH0k8n2TzzYucwZyldRxuQWaWerRKrz?=
 =?us-ascii?Q?+4uz9aO6gt/k/fnPYCBhvq4WUZty8HTWQa5vhInDGOKkwq9Cj51rY2mbL5Yy?=
 =?us-ascii?Q?yb0LtgVRcunWf3bjolPrnoWZbD3+49OE1HFEkWXx12x3cC6b1FD191uVUxgC?=
 =?us-ascii?Q?YkkSMSNpepnpde1zO3ovujFZqvXWO8RpWpWFcPf1IeQTKIMIRiMUPOEsrBcT?=
 =?us-ascii?Q?XW1WaekcVjLhaA6GiW4qX9GL9zdRZFreT6Aw1iLdmlHGizewVvBYO+KXR6jR?=
 =?us-ascii?Q?+g+8pxtSH+BXqbtJR4+RGFEanRuIAnj2e8TNZRtXQGs/bcPDk7CKbbpwJzee?=
 =?us-ascii?Q?F0NHBw5C7AgrSX41vpX3aUXx2n9F6BF2fWKBlJVZQx4vsZrT3b0DVInuEpD1?=
 =?us-ascii?Q?NndoN2PawObBTtEgtjgl8yt7UwA90OfRUn75avgiBsrKbe1Y3hETEpEA7RfJ?=
 =?us-ascii?Q?JEhuD7lBf3VdW7gHqzBeF9DEDplRGbC8IfXIJlM/pEuT77C1sD5wlId6BoLi?=
 =?us-ascii?Q?UqN7TOUFPd89ZR4lflE61MGDTyQ0+4NCInv3IGq1LmrF6UbGI6gQ0bEu/1qa?=
 =?us-ascii?Q?H4k7lRddm8PGfkW2GHJsIE/UCHuYOLchfR/FHmReSBlP1lerWH/URh+6GjWD?=
 =?us-ascii?Q?RcSJRpKRwbnN/NCrS5K0AfV7hqi5oFmuKQumYOc8yR8Y+9w3th+ihyEqLnFt?=
 =?us-ascii?Q?X9wtR+HatGyYdCgzuOgsgvTs1/5A0lO7+RwlmMFuZEbVtfsxbXpP93Zr5J5E?=
 =?us-ascii?Q?5i5ZFljyQiSzAqlIAomoii+4A6M4de1o8wSxKMuhOdgSbFAJWlgHPJmUiUbe?=
 =?us-ascii?Q?jZj+elQc0/h1MJPl+8uR6xRl222CUzGcr89yJUdUOUh66dsD/ZQV+DjSKuZ+?=
 =?us-ascii?Q?2WSQvFzgF1WyLGixgq29XekkJdG7HKZ6BRrw3jkeuNji2/xV7gspvQtO56dk?=
 =?us-ascii?Q?MlkAzAGE+RuwydtQIQSsv6mjACQH01uxoUGiwQLodO5zpKHOWQ2vHm9Wt0Zp?=
 =?us-ascii?Q?2cmDk3D0Cxk97UwkPIZrZ/zLKydE1A17U2U/VHzhWS35xghGryvKi9Db/Skv?=
 =?us-ascii?Q?FTYWfKrF7l8BIXGfbBsxf1D6O+GB05XlMYDqNb571zrD/I/p9312dGz5ahIF?=
 =?us-ascii?Q?7HIbBoyc51P9wUd0t54LGZm8fXgHl55nKijefYHYNSZH366P+CdBCto35FQm?=
 =?us-ascii?Q?d/oi8iCZZ5KlUdsedtm2A6X8AMvPH0FAG/yi/fSsYPuWIHD7leHFXs6lDF3A?=
 =?us-ascii?Q?/JZQ+bEqkmgGFxCq6iX9VDNqgNmWbCMfsUiM2PkO+yWTffsi2ErxlAiFDDvu?=
 =?us-ascii?Q?aDYsUUlfT0ocvQSYqzTfrtBdSgwPNqxnjD9JwzI8SPgNgcUoY2uzVwXVBwzQ?=
 =?us-ascii?Q?HQ67UytqvHtXS25rsY0EL2Jk5H0I/1Q700+snYoKBHvh/tbOBiZ1jkKsi+dg?=
 =?us-ascii?Q?+KQrNeSTs6USPT4aTSPgLn5qVHKV0gIZdzeSQ33+wCPkjwnVR+D1M6w1cU7g?=
 =?us-ascii?Q?92mWsLigOELayhXb9YnNtZy035XCVkB7Xz4fdkBJ+dC1NOY2MLoHb6XRf9MB?=
 =?us-ascii?Q?K8Fcz5PjvwolL9XPfYrkcz+sT1SPDItLq+m2HVFPr+jz8sl07e7nisCT1jg8?=
 =?us-ascii?Q?3f9741v7wvTGWic3r7hpL/N7cqUFUj+s5p1/fJYImk9LxMHDWreQtJaxT0Jx?=
 =?us-ascii?Q?0kDrjw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ryNnJ5bzsI1mM7TOh5hOHAQ0JkLwDZIfFPxULwfsPKwkr8/JJxt4fk8so6/tR0kKMx9GLgOYLLrqpu5CQcjay8P2firrBt0FkZIGL8Lk7mNK2erNQ3sJVSm7rZG5y2LYLtaqdojShpTowypZfMVm39YOOX9pMos3ieynlIbRJ6ykAkliwZ7Zd9Y2yijD6ozzq5BDduGLMkjY3z3YfdjuV0C2QZSFx0HCJe/STvEoAUwi/ZrXn7W/9N2hWkvhzrlYQGvGYS20r6XzSkbZgNKQPseeIUdhWwclxkZMXZBKlSwfmjjMF8zOnpJBu3c8WlloY/CzpCksXojxEt1mrM1iE4Cl5iHVO2RfZWarAYSvGYNMZZF2C5/ex0+GLrwcRK8w1DQ1p0ddjpk+r3ClZyXYme99AULK7d67yK7Rxlpzuk6qbJKpc0gOVjDNWKiGPp2Y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 16:16:05.9530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f402acba-e5db-45f7-3695-08de659b07e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.966];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AECE01001F7
X-Rspamd-Action: no action

In the single-vendor case (with no unknown vendor) all switches turn
to a branchless straight line through the single compiled-in case.

In the multivendor case where some vendors are disabled the VRP pass
ensures those branches are eliminated.

It's hard to tell the VRP pass zero is also unreachable when
CONFIG_UNKNOWN_CPU_VENDORS is disabled, so default cases tend to remain.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
The removals of ifdefs are proof of VRP doing the work of DCE.
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 12 +++---------
 xen/arch/x86/alternative.c          |  2 +-
 xen/arch/x86/cpu-policy.c           |  6 +++---
 xen/arch/x86/cpu/mcheck/mce.c       |  6 +-----
 xen/arch/x86/cpu/mcheck/mce.h       |  2 +-
 xen/arch/x86/cpu/mcheck/non-fatal.c |  6 +-----
 xen/arch/x86/cpu/mcheck/vmce.c      | 12 ++----------
 xen/arch/x86/cpu/vpmu.c             |  6 +-----
 xen/arch/x86/domain.c               |  4 ++--
 xen/arch/x86/guest/xen/xen.c        |  2 +-
 xen/arch/x86/nmi.c                  |  4 ++--
 xen/arch/x86/traps-setup.c          |  2 +-
 12 files changed, 19 insertions(+), 45 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 5740c0d438..4ee03ecc65 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -133,7 +133,7 @@ static int __init cf_check cpufreq_driver_init(void)
 
         ret = -ENOENT;
 
-        switch ( boot_cpu_data.x86_vendor )
+        switch( cpu_vendor() )
         {
         case X86_VENDOR_INTEL:
             for ( i = 0; i < cpufreq_xen_cnt; i++ )
@@ -141,12 +141,10 @@ static int __init cf_check cpufreq_driver_init(void)
                 switch ( cpufreq_xen_opts[i] )
                 {
                 case CPUFREQ_xen:
-                    ret = IS_ENABLED(CONFIG_INTEL) ?
-                          acpi_cpufreq_register() : -ENODEV;
+                    ret = acpi_cpufreq_register();
                     break;
                 case CPUFREQ_hwp:
-                    ret = IS_ENABLED(CONFIG_INTEL) ?
-                          hwp_register_driver() : -ENODEV;
+                    ret = hwp_register_driver();
                     break;
                 case CPUFREQ_none:
                     ret = 0;
@@ -165,7 +163,6 @@ static int __init cf_check cpufreq_driver_init(void)
 
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
-#ifdef CONFIG_AMD
             for ( i = 0; i < cpufreq_xen_cnt; i++ )
             {
                 switch ( cpufreq_xen_opts[i] )
@@ -191,9 +188,6 @@ static int __init cf_check cpufreq_driver_init(void)
                 if ( !ret || ret == -EBUSY )
                     break;
             }
-#else
-            ret = -ENODEV;
-#endif /* CONFIG_AMD */
             break;
 
         default:
diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 9f844241bc..c723417807 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -89,7 +89,7 @@ static bool init_or_livepatch_read_mostly toolchain_nops_are_ideal;
 
 static void __init arch_init_ideal_nops(void)
 {
-    switch ( boot_cpu_data.x86_vendor )
+    switch ( cpu_vendor() )
     {
     case X86_VENDOR_INTEL:
         /*
diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 5273fe0ae4..62aff61d8c 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -279,7 +279,7 @@ static void recalculate_misc(struct cpu_policy *p)
 
     p->extd.raw[0x8].d = 0;
 
-    switch ( p->x86_vendor )
+    switch ( cpu_vendor() )
     {
     case X86_VENDOR_INTEL:
         p->basic.l2_nr_queries = 1; /* Fixed to 1 query. */
@@ -420,7 +420,7 @@ static void __init guest_common_default_leaves(struct cpu_policy *p)
 
 static void __init guest_common_max_feature_adjustments(uint32_t *fs)
 {
-    switch ( boot_cpu_data.vendor )
+    switch ( cpu_vendor() )
     {
     case X86_VENDOR_INTEL:
         /*
@@ -514,7 +514,7 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
 {
-    switch ( boot_cpu_data.vendor )
+    switch ( cpu_vendor() )
     {
     case X86_VENDOR_INTEL:
         /*
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 9277781bff..4b295aeeb5 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -766,16 +766,13 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
     else if ( cpu_bank_alloc(cpu) )
         panic("Insufficient memory for MCE bank allocations\n");
 
-    switch ( c->x86_vendor )
+    switch ( cpu_vendor() )
     {
-#ifdef CONFIG_AMD
     case X86_VENDOR_AMD:
     case X86_VENDOR_HYGON:
         inited = amd_mcheck_init(c, bsp);
         break;
-#endif
 
-#ifdef CONFIG_INTEL
     case X86_VENDOR_INTEL:
         switch ( c->x86 )
         {
@@ -785,7 +782,6 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
             break;
         }
         break;
-#endif
 
     default:
         break;
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index 920b075355..4828c74d47 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -137,7 +137,7 @@ void x86_mcinfo_dump(struct mc_info *mi);
 
 static inline int mce_vendor_bank_msr(const struct vcpu *v, uint32_t msr)
 {
-    switch (boot_cpu_data.x86_vendor) {
+    switch (cpu_vendor()) {
     case X86_VENDOR_INTEL:
         if (msr >= MSR_IA32_MC0_CTL2 &&
             msr < MSR_IA32_MCx_CTL2(v->arch.vmce.mcg_cap & MCG_CAP_COUNT) )
diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mcheck/non-fatal.c
index a9ee9bb94f..3a0399c121 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -23,20 +23,16 @@ static int __init cf_check init_nonfatal_mce_checker(void)
 	/*
 	 * Check for non-fatal errors every MCE_RATE s
 	 */
-	switch (c->x86_vendor) {
-#ifdef CONFIG_AMD
+	switch (cpu_vendor()) {
 	case X86_VENDOR_AMD:
 	case X86_VENDOR_HYGON:
 		/* Assume we are on K8 or newer AMD or Hygon CPU here */
 		amd_nonfatal_mcheck_init(c);
 		break;
-#endif
 
-#ifdef CONFIG_INTEL
 	case X86_VENDOR_INTEL:
 		intel_nonfatal_mcheck_init(c);
 		break;
-#endif
 
 	default:
 		/* unhandled vendor isn't really an error */
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index 1a7e92506a..0c1bfb691b 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -136,22 +136,18 @@ static int bank_mce_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     default:
-        switch ( boot_cpu_data.x86_vendor )
+        switch ( cpu_vendor() )
         {
-#ifdef CONFIG_INTEL
         case X86_VENDOR_CENTAUR:
         case X86_VENDOR_SHANGHAI:
         case X86_VENDOR_INTEL:
             ret = vmce_intel_rdmsr(v, msr, val);
             break;
-#endif
 
-#ifdef CONFIG_AMD
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
             ret = vmce_amd_rdmsr(v, msr, val);
             break;
-#endif
 
         default:
             ret = 0;
@@ -273,20 +269,16 @@ static int bank_mce_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         break;
 
     default:
-        switch ( boot_cpu_data.x86_vendor )
+        switch ( cpu_vendor() )
         {
-#ifdef CONFIG_INTEL
         case X86_VENDOR_INTEL:
             ret = vmce_intel_wrmsr(v, msr, val);
             break;
-#endif
 
-#ifdef CONFIG_AMD
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
             ret = vmce_amd_wrmsr(v, msr, val);
             break;
-#endif
 
         default:
             ret = 0;
diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
index c28192ea26..b1ad4ebcf6 100644
--- a/xen/arch/x86/cpu/vpmu.c
+++ b/xen/arch/x86/cpu/vpmu.c
@@ -815,7 +815,7 @@ static struct notifier_block cpu_nfb = {
 
 static int __init cf_check vpmu_init(void)
 {
-    int vendor = current_cpu_data.x86_vendor;
+    int vendor = cpu_vendor();
     const struct arch_vpmu_ops *ops = NULL;
 
     if ( !opt_vpmu_enabled )
@@ -832,7 +832,6 @@ static int __init cf_check vpmu_init(void)
 
     switch ( vendor )
     {
-#ifdef CONFIG_AMD
     case X86_VENDOR_AMD:
         ops = amd_vpmu_init();
         break;
@@ -840,13 +839,10 @@ static int __init cf_check vpmu_init(void)
     case X86_VENDOR_HYGON:
         ops = hygon_vpmu_init();
         break;
-#endif
 
-#ifdef CONFIG_INTEL
     case X86_VENDOR_INTEL:
         ops = core2_vpmu_init();
         break;
-#endif
 
     default:
         printk(XENLOG_WARNING "VPMU: Unknown CPU vendor: %d. "
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8b2f33f1a0..10a558e515 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -319,7 +319,7 @@ void domain_cpu_policy_changed(struct domain *d)
             if ( cpu_has_htt )
                 edx |= cpufeat_mask(X86_FEATURE_HTT);
 
-            switch ( boot_cpu_data.x86_vendor )
+            switch( cpu_vendor() )
             {
             case X86_VENDOR_INTEL:
                 /*
@@ -427,7 +427,7 @@ void domain_cpu_policy_changed(struct domain *d)
             if ( !(p->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
                 edx &= ~CPUID_COMMON_1D_FEATURES;
 
-            switch ( boot_cpu_data.x86_vendor )
+            switch( cpu_vendor() )
             {
             case X86_VENDOR_INTEL:
                 mask &= ((uint64_t)edx << 32) | ecx;
diff --git a/xen/arch/x86/guest/xen/xen.c b/xen/arch/x86/guest/xen/xen.c
index ec558bcbdb..590a4bad82 100644
--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -63,7 +63,7 @@ void asmlinkage __init early_hypercall_setup(void)
                   x86_cpuid_vendor_to_str(boot_cpu_data.x86_vendor));
     }
 
-    switch ( boot_cpu_data.x86_vendor )
+    switch ( cpu_vendor() )
     {
     case X86_VENDOR_INTEL:
     case X86_VENDOR_CENTAUR:
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index a0c9194ff0..a3ba59ce0b 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -216,7 +216,7 @@ void disable_lapic_nmi_watchdog(void)
 {
     if (nmi_active <= 0)
         return;
-    switch (boot_cpu_data.x86_vendor) {
+    switch(cpu_vendor()) {
     case X86_VENDOR_AMD:
         wrmsrns(MSR_K7_EVNTSEL0, 0);
         break;
@@ -387,7 +387,7 @@ void setup_apic_nmi_watchdog(void)
     if ( nmi_watchdog == NMI_NONE )
         return;
 
-    switch ( boot_cpu_data.x86_vendor )
+    switch( cpu_vendor() )
     {
     case X86_VENDOR_AMD:
         setup_k7_watchdog();
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index d77be8f839..7d7554a7ba 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -243,7 +243,7 @@ static void __init init_ler(void)
      * Intel Pentium 4 is the only known CPU to not use the architectural MSR
      * indicies.
      */
-    switch ( boot_cpu_data.x86_vendor )
+    switch( cpu_vendor() )
     {
     case X86_VENDOR_INTEL:
         if ( boot_cpu_data.x86 == 0xf )
-- 
2.43.0


