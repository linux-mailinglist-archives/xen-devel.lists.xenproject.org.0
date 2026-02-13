Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M/eSLZ6lj2kASQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:28:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB3B139C97
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231957.1536880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1eL-0004Ja-P2; Fri, 13 Feb 2026 22:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231957.1536880; Fri, 13 Feb 2026 22:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1eL-0004HJ-MB; Fri, 13 Feb 2026 22:28:33 +0000
Received: by outflank-mailman (input) for mailman id 1231957;
 Fri, 13 Feb 2026 22:28:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S4o5=AR=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vr1eJ-0004HD-I0
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 22:28:31 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50ef00a6-092b-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 23:28:28 +0100 (CET)
Received: from SN7PR04CA0019.namprd04.prod.outlook.com (2603:10b6:806:f2::24)
 by CY5PR12MB9056.namprd12.prod.outlook.com (2603:10b6:930:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 22:28:22 +0000
Received: from SA2PEPF00003F63.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::b7) by SN7PR04CA0019.outlook.office365.com
 (2603:10b6:806:f2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.13 via Frontend Transport; Fri,
 13 Feb 2026 22:28:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F63.mail.protection.outlook.com (10.167.248.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 22:28:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 16:28:20 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 13 Feb 2026 16:28:19 -0600
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
X-Inumbo-ID: 50ef00a6-092b-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/cKnz7AK4bc2CvT9nIlKXQY2AVICHp0yV4Wl/oKWS/Asm4leGGLjCXNodG8o4hUv/OscCgb3JgRMMoxVU0u6JJhmB65MsS3MeFvPMVVY3+yDs9Oz6vSPymU4Oz54qzMIalXe0b/KYn7uj1OQeCQUdc1zqSbUECQkipUpyZd/vreB8O18PSlNA0rCY5aXh30SdHiYivqHH1xUhGMxVbqpQh1cwsOeHUIfW8zKh9MQ0gLozRPWSJKDsTFWH58HFBo0WpCxfp2giIvgLR3rPcUnruWQBNN5NRL3RvZ0SU4IA9g8l9GgJ70MoqFyIyN5hTLT9exHgZJxS4WekQiOVBplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Crw92ASiKKFoT5GPA5AkN5JISqW8WkUcEtyJkgjdRo=;
 b=V4CAMnG6I3zezmpLkkzrledoMo1zgoaHcpAB4aq97zMjNc189N/30pXVDGYk9ALL0DQ40f2Y5VzXsLrSjsJEa6SqRPYrwd+Hu39AV97qJR8L0gy0GBXIe8M79JctSO+U7/FurQh6hjRQZHURx1YtjCqEKbZ6A4SmnCrXqsUHKAgzRv3GUdPxVB1LV+SEpRa0aL6a14kfwSXv0uxjtwYotUO5s5K1QGSFMNB5m0+cD0KENOXpQ0IJrYirfxyulzYX7rmDhDR6fy/K0YfILGPfE1iCWlBPOkbiC/OoJ9p0rAnLjwv4hXMPw9+hTmfHW7tx+fm+NisVY2FW+cD+SBmiaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Crw92ASiKKFoT5GPA5AkN5JISqW8WkUcEtyJkgjdRo=;
 b=QNyb87dKRr0IaDV7TErPaPEjOjh3QmfJ5omlY1+3jCFOP3s1INz37L0isAvs5PUjUCCtuXPze4okBW2Kq8pv/mqIQQY2BkCTC7VON4ch4i/O7yJwTsQp8CbG1XqPU4bNynN7ieNt/wAfAbN4wegaXDOWBEWCMY73J33UTypQz9A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, <stefano.stabellini@amd.com>,
	<alejandro.garciavallejo@amd.com>
Subject: [PATCH v3] x86/cpufreq: Add Kconfig option for CPU frequency scaling
Date: Fri, 13 Feb 2026 14:28:18 -0800
Message-ID: <20260213222818.271685-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F63:EE_|CY5PR12MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: eeb67692-8d0d-4ef6-69a6-08de6b4f31ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xBsWMSc04vzzAzpilMoymK4gsNED1R3SunWxb9I0H341jCAMbI8sX3f9XPEb?=
 =?us-ascii?Q?e8SXdZdClbxpNypQXQUB82ZqCKQf+6w4hfUGR1RDvvnihi6QqrdPMqKYgGcf?=
 =?us-ascii?Q?/g9cJXkQUq42kW+/MTVIkjqjMY1Fd0R/dpDZ969ekniHojkOtshFmV4NqLGH?=
 =?us-ascii?Q?LwSyXuIfgkbfCRGnB7RGLTfEam5klwOrkI2hPSbw1412QlpW8qobyGPSO4AO?=
 =?us-ascii?Q?6rRBeQCz+Dp6qgDRRRSDTLNR58ThPhyfAYhQUE4/3UjtxxifBEXanEWxTgv4?=
 =?us-ascii?Q?ZuN/nFUQCPJsV5rxTxFw9TrDomBVOaWtts/pt+CQDjKgoYbxdmnjuqBoEkCh?=
 =?us-ascii?Q?dyxpGTC//5KUoH7jDzdkybabUe6G72SUc+X/NNJ/WT5gZ7yu6TQJkowIt0by?=
 =?us-ascii?Q?kBARK722dMngQjUB5lEeSAE445TYrq98iJWzdhHskV04kWEyrJEmjQ51UrGj?=
 =?us-ascii?Q?idpxmiM6xN9O2JsDjCJigFcF5ywaf+yRfZg897d2BiYaCEVnhVkJhpj9SMuE?=
 =?us-ascii?Q?IEGzTfNi0J4yJ0Wq9LV9q4pAQMwdcnQMw0Aym4woCGG3Tix8LAfZ1JnRjedX?=
 =?us-ascii?Q?3GnsO/NwOmDRcLsJKZDjW/Jg0wgyQUvSDDj3rBxPxROjzH+zHzALYNuqzBYa?=
 =?us-ascii?Q?XB7tneTf681SluMGqja0rlDyYreytwK220f8GR9aFUhhK/NO9Bhqejw0rwMU?=
 =?us-ascii?Q?TN4MGFbckyDnWBDecfI3mbYlCOWOs/WEIHHYOeOSSUIRFgnn6hILqCp1Gmvk?=
 =?us-ascii?Q?Lklo3Uix6/ZXNEuoHOc6p6GC1/UuJUobM/MAa1gbuCTvUtn+yTKxE/wpPI6R?=
 =?us-ascii?Q?owHyHbglz9mzQ9nhn+PEXt8dm/o10P8nzNu1lOIOc//LOS4cLVwLZECqfuw+?=
 =?us-ascii?Q?bXsh0Zmxkwy9RVNcpP27X5avEUMP3+/oubNaYdXBWOEbOqp5ckv55JRAKmo1?=
 =?us-ascii?Q?xwbX+xfUjv0Av4loTHqlgvhJblH+LE+7ixzFFyVZWSpZlXkiu8fZYOV1l0uG?=
 =?us-ascii?Q?V27mBbDaL3crvb/ZjWTmr0Z7Y5iZ+CTwJj9MT4Xdchhnc93qgKDLbOHRPuqK?=
 =?us-ascii?Q?RHv6KyWbZ+D6tl+fedyTqD/TqXIGoN0dyulQ8+zHF6cndL39WVK2Fnu+JHH2?=
 =?us-ascii?Q?sgIYQoNF+fv/uhO+Ct7ZSxtGFQehSxhPSfhxyglzxT9idk0vMSMnf5NdFBkj?=
 =?us-ascii?Q?QxljaiauFZwQIELZTkSBLyfSR9aW0/wyzHfHgv2OkQ6luXI+l0qC+PWioLC0?=
 =?us-ascii?Q?b30KXgD1/SO/qEbLtR1qkuINYj6zcfMZZBlxjv7SN0i+zDUGleOr1NT05kPz?=
 =?us-ascii?Q?eupzinrgNfP3qxy0wiCfmIMj9pUQqBAYdm0jZ6bleVC5EOoJlUXm6UbXQCaH?=
 =?us-ascii?Q?pPLKbnoTna3FjvVVp+p5ftBdIXtB+5L2rbvwOISf6fE6r8wkvWW6pM8gJvr9?=
 =?us-ascii?Q?SGDwFkroyYTnOCCG0T/75wEL45JnUL/nB0MKGsYE5jo2A6pFAcQqoRxRbQJD?=
 =?us-ascii?Q?BbXIn3wGaAV39B/K4glaLEREiQKQ+baaIIgf088UGPCOIPRHuuZUSsxjJpi9?=
 =?us-ascii?Q?McY2cD8qgMHsQIl8qODQKWGSnxJk46yTdOrZN8qEt0cfsSnxhs/bGxLafG9P?=
 =?us-ascii?Q?ECzJM3dRGKJO+Tx9tPjEAejvSYIV0EKz0R7KZbW+JJPUAF3Q4bcS3wuh5ElZ?=
 =?us-ascii?Q?9LtIlQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+IlBnM0x7C5naYLitvnUqRonqfaHgRG1EB2O580oFiXQEYm3dVFgqu2190lS4OR6uSZ04/PZVg3HN+DB3jGChEe7axZwAtaNBF5k63vFy1kHlxdQKqQJJAdH0zgPHpEIkxbhFCaqEP07RrXrAcQiZ8+RDnaE+c3aKfQH/EVTZl23fvn+8vGuqVpJwWPBIXevWvNneSVGfnZ8lMmE+zVkvxO///xn8G4JaTiOZL+JfqxVaTJMps9GxrWJY3bxdPnTcPXM2X70JmNXsAjP/eex65r0tb51oi5JUZSzCo94hgQv1N+tN+ny12W54alrQfqMowhVU5Ak1Lc3kj4y1nhDqrwgsVgzDGoHPsjgjid8ZUImrztfVUWnpYpwU/0ZEB4b3uMzfKgg7a/+0qjCLw9kqD1mBE1NiW9m7Mz5Ur1v7Ygw+xj6cC23bRr21W0cTuEQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 22:28:21.3441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeb67692-8d0d-4ef6-69a6-08de6b4f31ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9056
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:stefano.stabellini@amd.com,m:alejandro.garciavallejo@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: EEB3B139C97
X-Rspamd-Action: no action

Add CONFIG_CPUFREQ to allow CPU frequency scaling support to be
disabled at build time. When disabled, this removes cpufreq code
from the build.

Move the cpufreq_controller enum and is_cpufreq_controller() inside
#ifdef CONFIG_CPUFREQ so that FREQCTL_* values are not visible when
CPUFREQ is disabled. Provide a stub is_cpufreq_controller() that
returns false when CPUFREQ is not configured.

Compile out the XENPF_change_freq and XENPF_getidletime platform ops
when CONFIG_CPUFREQ is disabled, as they require cpufreq_controller.

Add stubs where necessary.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

---
Changes in v3:
- Move enum cpufreq_controller inside #ifdef CONFIG_CPUFREQ so
  FREQCTL_* values are not visible when CPUFREQ=n
- Keep enum and variable declaration combined
- Wrap XENPF_change_freq and XENPF_getidletime cases with
  #ifdef CONFIG_CPUFREQ
- Add __maybe_unused to the out: label since it's only used by
  XENPF_getidletime
- Move is_cpufreq_controller() inside #ifdef CONFIG_CPUFREQ and
  provide a stub returning false for the !CPUFREQ case
- use -EOPNOTSUPP instead of -ENOSYS
- code style fixes
---
 xen/arch/x86/acpi/Makefile                |  2 +-
 xen/arch/x86/platform_hypercall.c         |  4 +++-
 xen/drivers/Makefile                      |  2 +-
 xen/drivers/acpi/pm-op.c                  |  3 ++-
 xen/drivers/acpi/pmstat.c                 |  8 ++++++--
 xen/drivers/cpufreq/Kconfig               | 14 +++++++++++++-
 xen/include/acpi/cpufreq/cpufreq.h        | 13 ++++++++++++-
 xen/include/acpi/cpufreq/processor_perf.h |  3 ---
 xen/include/xen/acpi.h                    |  8 ++++++++
 xen/include/xen/pmstat.h                  | 15 ++++++++++++++-
 xen/include/xen/sched.h                   |  7 +++++++
 11 files changed, 67 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/acpi/Makefile b/xen/arch/x86/acpi/Makefile
index 041377e2bb..aa476f65d5 100644
--- a/xen/arch/x86/acpi/Makefile
+++ b/xen/arch/x86/acpi/Makefile
@@ -1,4 +1,4 @@
-obj-y += cpufreq/
+obj-$(CONFIG_CPUFREQ) += cpufreq/
 
 obj-y += lib.o power.o cpu_idle.o cpuidle_menu.o
 obj-bin-y += boot.init.o wakeup_prot.o
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index c6c5135806..a4669090e0 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -485,6 +485,7 @@ ret_t do_platform_op(
         ret = acpi_enter_sleep(&op->u.enter_acpi_sleep);
         break;
 
+#ifdef CONFIG_CPUFREQ
     case XENPF_change_freq:
         ret = -ENOSYS;
         if ( cpufreq_controller != FREQCTL_dom0_kernel )
@@ -544,6 +545,7 @@ ret_t do_platform_op(
             ret = -EFAULT;
         break;
     }
+#endif
 
     case XENPF_set_processor_pminfo:
         switch ( op->u.set_pminfo.type )
@@ -936,7 +938,7 @@ ret_t do_platform_op(
         break;
     }
 
- out:
+ out: __maybe_unused;
     spin_unlock(&xenpf_lock);
 
     return ret;
diff --git a/xen/drivers/Makefile b/xen/drivers/Makefile
index 2a1ae8ad13..3d81b8dde4 100644
--- a/xen/drivers/Makefile
+++ b/xen/drivers/Makefile
@@ -1,5 +1,5 @@
 obj-y += char/
-obj-$(CONFIG_HAS_CPUFREQ) += cpufreq/
+obj-$(CONFIG_CPUFREQ) += cpufreq/
 obj-$(CONFIG_HAS_PCI) += pci/
 obj-$(CONFIG_HAS_VPCI) += vpci/
 obj-$(CONFIG_HAS_PASSTHROUGH) += passthrough/
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 07bddc58d9..f5caeebb9a 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -367,7 +367,8 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
         return ret;
     }
 
-    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
+    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) ||
+         !IS_ENABLED(CPUFREQ) )
         return -EINVAL;
     pmpt = processor_pminfo[op->cpuid];
 
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 0f31736df2..a8437ad045 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -76,6 +76,9 @@ void cpufreq_statistic_update(unsigned int cpu, uint8_t from, uint8_t to)
     spinlock_t *cpufreq_statistic_lock =
                &per_cpu(cpufreq_statistic_lock, cpu);
 
+    if ( !IS_ENABLED(CPUFREQ) )
+        return;
+
     spin_lock(cpufreq_statistic_lock);
 
     pxpt = per_cpu(cpufreq_statistic_data, cpu);
@@ -105,7 +108,7 @@ int cpufreq_statistic_init(unsigned int cpu)
 
     spin_lock_init(cpufreq_statistic_lock);
 
-    if ( !pmpt )
+    if ( !pmpt || !IS_ENABLED(CPUFREQ) )
         return -EINVAL;
 
     /* Only need to initialize in Px mode */
@@ -225,7 +228,8 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
     int ret = 0;
     const struct processor_pminfo *pmpt;
 
-    if ( !op || (op->cpuid >= nr_cpu_ids) || !cpu_online(op->cpuid) )
+    if ( !IS_ENABLED(CPUFREQ) || !op || (op->cpuid >= nr_cpu_ids) ||
+         !cpu_online(op->cpuid) )
         return -EINVAL;
     pmpt = processor_pminfo[op->cpuid];
 
diff --git a/xen/drivers/cpufreq/Kconfig b/xen/drivers/cpufreq/Kconfig
index cce80f4aec..b9b93c1a26 100644
--- a/xen/drivers/cpufreq/Kconfig
+++ b/xen/drivers/cpufreq/Kconfig
@@ -1,3 +1,15 @@
-
 config HAS_CPUFREQ
 	bool
+
+config CPUFREQ
+	bool "CPU Frequency scaling"
+	default y
+	depends on HAS_CPUFREQ
+	help
+	  Enable CPU frequency scaling and power management governors.
+	  This allows Xen to dynamically adjust CPU P-states (performance
+	  states) based on system load.
+
+	  Disabling this option removes all cpufreq governors and power
+	  management interfaces. This is useful for real-time systems or
+	  minimal hypervisor builds.
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 0171ccf0ba..828d23961c 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -381,8 +381,19 @@ int write_ondemand_up_threshold(unsigned int up_threshold);
 
 int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
 
+#ifdef CONFIG_CPUFREQ
+int cpufreq_add_cpu(unsigned int cpu);
+int cpufreq_del_cpu(unsigned int cpu);
+
 void cpufreq_dbs_timer_suspend(void);
 void cpufreq_dbs_timer_resume(void);
+#else
+static inline int cpufreq_add_cpu(unsigned int cpu) { return -EOPNOTSUPP; }
+static inline int cpufreq_del_cpu(unsigned int cpu) { return -EOPNOTSUPP; }
+
+static inline void cpufreq_dbs_timer_suspend(void) {}
+static inline void cpufreq_dbs_timer_resume(void) {}
+#endif
 
 void intel_feature_detect(struct cpufreq_policy *policy);
 
@@ -398,7 +409,7 @@ void intel_feature_detect(struct cpufreq_policy *policy);
 
 int hwp_cmdline_parse(const char *s, const char *e);
 int hwp_register_driver(void);
-#ifdef CONFIG_INTEL
+#if defined(CONFIG_INTEL) && defined(CONFIG_CPUFREQ)
 bool hwp_active(void);
 #else
 static inline bool hwp_active(void) { return false; }
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 0a87bc0384..bad9d94865 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -36,9 +36,6 @@ static inline void cpufreq_statistic_exit(unsigned int cpu) {}
 
 int  cpufreq_limit_change(unsigned int cpu);
 
-int  cpufreq_add_cpu(unsigned int cpu);
-int  cpufreq_del_cpu(unsigned int cpu);
-
 struct processor_performance {
     uint32_t state;
     uint32_t platform_limit;
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 90635ba0f3..ae6dba481c 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -186,7 +186,15 @@ static inline void acpi_set_csubstate_limit(unsigned int new_limit) { return; }
 #endif
 
 #ifdef XEN_GUEST_HANDLE
+#ifdef CONFIG_CPUFREQ
 int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32));
+#else
+static inline int acpi_set_pdc_bits(unsigned int acpi_id,
+                                    XEN_GUEST_HANDLE(uint32) pdc)
+{
+    return -EOPNOTSUPP;
+}
+#endif
 #endif
 int arch_acpi_set_pdc_bits(u32 acpi_id, u32 *, u32 mask);
 
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 6096560d3c..51d3ee404f 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -5,10 +5,23 @@
 #include <public/platform.h> /* for struct xen_processor_power */
 #include <public/sysctl.h>   /* for struct pm_cx_stat */
 
+#ifdef CONFIG_CPUFREQ
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
-long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
 int set_cppc_pminfo(unsigned int acpi_id,
                     const struct xen_processor_cppc *cppc_data);
+#else
+static inline int set_px_pminfo(uint32_t acpi_id,
+                                struct xen_processor_performance *perf)
+{
+    return -EOPNOTSUPP;
+}
+static inline int set_cppc_pminfo(unsigned int acpi_id,
+                                  const struct xen_processor_cppc *cppc_data)
+{
+    return -EOPNOTSUPP;
+}
+#endif
+long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
 
 #ifdef CONFIG_COMPAT
 struct compat_processor_performance;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1268632344..d3358ce693 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1255,6 +1255,7 @@ static always_inline bool is_iommu_enabled(const struct domain *d)
 extern bool sched_smt_power_savings;
 extern bool sched_disable_smt_switching;
 
+#ifdef CONFIG_CPUFREQ
 extern enum cpufreq_controller {
     FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
 } cpufreq_controller;
@@ -1274,6 +1275,12 @@ static always_inline bool is_cpufreq_controller(const struct domain *d)
     return (is_pv_domain(d) && is_hardware_domain(d) &&
             cpufreq_controller == FREQCTL_dom0_kernel);
 }
+#else
+static always_inline bool is_cpufreq_controller(const struct domain *d)
+{
+    return false;
+}
+#endif
 
 int cpupool_move_domain(struct domain *d, struct cpupool *c);
 int cpupool_do_sysctl(struct xen_sysctl_cpupool_op *op);
-- 
2.25.1


