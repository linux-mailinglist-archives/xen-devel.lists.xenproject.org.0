Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Kb+LwLPhGk45QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:10:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D2DF5B0B
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:10:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222284.1530290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2rk-00045G-Lk; Thu, 05 Feb 2026 17:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222284.1530290; Thu, 05 Feb 2026 17:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2rk-0003x2-Fl; Thu, 05 Feb 2026 17:10:04 +0000
Received: by outflank-mailman (input) for mailman id 1222284;
 Thu, 05 Feb 2026 17:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiMP=AJ=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vo2rj-0003It-4o
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 17:10:03 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80e8bfec-02b5-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 18:10:01 +0100 (CET)
Received: from BLAPR03CA0125.namprd03.prod.outlook.com (2603:10b6:208:32e::10)
 by CH2PR12MB4325.namprd12.prod.outlook.com (2603:10b6:610:a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 17:09:55 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:208:32e:cafe::16) by BLAPR03CA0125.outlook.office365.com
 (2603:10b6:208:32e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 17:09:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Thu, 5 Feb 2026 17:09:54 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 11:09:53 -0600
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
X-Inumbo-ID: 80e8bfec-02b5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXgBWqyV+84jOfyo/IWJmSC8UNj9MDRpz6aOT/Ssecm82I+ejC/chcj/2borBmEw/+5jlRCCvUDQLoiBGun36Gu8HviLz1IQxphuvQpDJrEqQsRviXEWM4r1+uQ47OtM2iF/W9h46BTzgxdUBJQuYZcUikJ9OOwSDL1f5+MXH7N5tV8rVeFFQm3tf04B1lS6Y4B37bUAehONkXmh50TxD0tGyEs4TcuKw5j1w3OqYNUjIZ92uO6OeJI+8VO3IDL4hJAEBf03igN9EZNcKuwI7t7iifm4xYHsU1OFt8Vd2sdhYeR6FzYgOdqksCKWjaTd7cvie+28Ad5o13cKJ1thZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcmMhNrUvdJLDtdj//oBMXNGmJweY+Izab2C0gA4R0Y=;
 b=TqQmm/cpDUC4sCr8TaSHt18y13spQqWA4sdTy5s67nzcZbMmZjJ+gRS33V2Ghk3g0Km3Ei7XAs41JRmS6P7xGgqbQcyVzqQxUxXFyJ/oUupiFN9E8PcsxFvbY4tsitqFb5H5gYCRmOrbZr8JQOZ+KIFxxm5zZmbHEaSfL1bz829cLcutI9sYcENHaTEUxteNukdmCiF2qZIlJaCp/bWtGmiP70cayWuqXX3didADsVJ4kJZPQn9JgNY5zAjdQ6Vv43Jif3oGCVUtCMBa0RTf+8dX1a5SkDkJcjEK/AvUuTebA2bC5hahJ8NXHrCbb7hh5XzcV2iPl6JXvtoxgcloUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcmMhNrUvdJLDtdj//oBMXNGmJweY+Izab2C0gA4R0Y=;
 b=14eiHhnJl9pULr0BQ3Qfq5w3pO4LKCixlbNRkFIE8/yckARPwg/EwPXDb6Um0OX2Erbb5LhhBoRLZgnIdOkVhWQyHCXfOCTxUVFKW85/a8R0YUIMklVv+69ymvMMVJxM+F+ZxRgmURtwNGRTZckRoZ4tfHhCoDBExu50AzkpI0E=
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
	<jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 4/4] x86/svm: Drop emulation of Intel's SYSENTER behaviour on AMD systems
Date: Thu, 5 Feb 2026 18:09:22 +0100
Message-ID: <20260205170923.38425-5-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205170923.38425-1-alejandro.garciavallejo@amd.com>
References: <20260205170923.38425-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|CH2PR12MB4325:EE_
X-MS-Office365-Filtering-Correlation-Id: 444c8db9-69dd-4f62-60ef-08de64d96224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RhIvZhNZYjXfcfj5qm4+eMPXDhrzwS4slTdbiAAGdYKYrfOf7a5briSm3qdn?=
 =?us-ascii?Q?xcg/08FPb4OnCLHQHJwT8HLYra0uTZXliC58Z62d+WVvid24e3lw+ruCPtg+?=
 =?us-ascii?Q?VGwju1gERA8FKvCCUJPnycbJzOTbvG5aMfIO2x/Dzd5WNZ/dE2tZ8A9c4/kD?=
 =?us-ascii?Q?VQgazdYqeWH/g6+lSY7AJNO4MzWS1Zg9tV1btlZiYUi+Lz6VpV0Y0ZRBjC6P?=
 =?us-ascii?Q?1wHRMdA+n5OeIFvCcb+odJodQbUZjQbOK6K5DVe7XZ/Z3alMlKYRcpg7eELG?=
 =?us-ascii?Q?aaMqIWFRnYnKOpTd4TYXvZneJCmPBhhcs+VlBo5fpJp5mRLY6X4N4QKXFe+B?=
 =?us-ascii?Q?jb7Tqkvu7nBNJls3G8i2Q8PnySemKXsPuxvaX4qvZ2ni06LYx2IweIZY4qhV?=
 =?us-ascii?Q?Ni8owPmXHCEkZ3IHoEDhsSpcs/rFBc2OjQnb7/yl2yG7Vgy3BFdptPKys6mS?=
 =?us-ascii?Q?lSqpddR3GX1Dj2C1A8+3XFNmU9DcRRZuIFhrZ0w5IAezQrGgX6lDl6KyG1TV?=
 =?us-ascii?Q?dIVFtaSelP31A3K+jXFhyNru6sw409pIfT1TDnT0dZVnJTw2YRmm8Vmd1Qhw?=
 =?us-ascii?Q?GkHM9GGG8XO4T0SGTgnv1do0CwLtkjm0X1pd5BpTNlsxZEJ3Gt4/L/y2tBr3?=
 =?us-ascii?Q?KLPDQ+KVhSCq5sw72KcQiWqJnSO9eNdFlnVJb1AS5/EQO9LtSNT38n1KkEZs?=
 =?us-ascii?Q?e99BFSZJXIoJu1+AsSCGm/i2g8Dz/NzERXCLLdzs++pCEpx6gqT4xwQWgI72?=
 =?us-ascii?Q?iCUqTVAgseS404BrRj4ignxILHeDt3zqnWh1Tay/A64gg1Im41z4Cs5w1DqI?=
 =?us-ascii?Q?i+3bs71e06ezKmjaLcg4CArU9b19fBpfFWcqXRgmKKF24K3fq8pLSXwVS708?=
 =?us-ascii?Q?EVaU6B0K6zrEK8Zu+zFLTjpnUJcicKWd2rKUQoBIc4Tf0T7cYJjuWmS22fvo?=
 =?us-ascii?Q?SAISTQgh9F6JH4SLiuaHPM2Lr9zaaIOxml+doLqAeP1Esx1JnUW6X+/vQWIn?=
 =?us-ascii?Q?g2RqLuBcx0vS/JgSJXUWkstNBfbDYhbCGP+fcjL60LKo5VlsMFbzioC3niTQ?=
 =?us-ascii?Q?xiyyc74QsFdo/gJBQ+vbjRW8BLxuAnfEBRPyjaYzqkgG6CduRuC1CLPtKxhC?=
 =?us-ascii?Q?lPPjoKGV8hnfDvv8WdBDG9Q/6hiLN/+SLF4CI6sGkLB87EOZXRQwddZow4ul?=
 =?us-ascii?Q?awRO1lYqgmjYPTw+O/GELKXr2HklMbSZC7uV5JvpmiiDcLKZ363e8e3ZYFix?=
 =?us-ascii?Q?P3gO42ugcE+DZAfx6/1psExWGDc1P71oZfkGjXfQD37Wc+nxktzP4OC1hQ1k?=
 =?us-ascii?Q?PVkgA0lgjGegKz7pQlmRo2d95rjobgEyt6UqMb3upH/i2aRCAhApWJy3zEfB?=
 =?us-ascii?Q?N9D3FdBXJXGnoh8do/yTZXkLavzlIwYHOxrh9fNbw1THu9ElvxRLFtvZisoI?=
 =?us-ascii?Q?SZ0amg8MfgUvek0heWdqEYYHLTIeckja+sqPoz94bn6JmeGz70ZeJS0POfY6?=
 =?us-ascii?Q?CIYJHOjugTUfp6c2E6EZyiMuc0Bnu0ZJWTH9HaRi/lD8CsKW9zcXteoF727b?=
 =?us-ascii?Q?DgDNcb/5zGJGJXaaVCh4QjfBPCRna6fqNYNivpWVR8BwuBuGXMrtvVlCN7H5?=
 =?us-ascii?Q?Hg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	04LEIklg/Z/DxOBv2rLvrWw9cE7eyA7oUuhcPJcrEAo5HumaeM7rKQG58vn2fWdRa8nOpGrNmNnoL/+a0kOYpMZIkvZcUR1CS3oE7nv8tjdJfXlB6vJw25WTWNL+jjCm3BErDpeRHnztBtn7s3oI2BhKVyyNUcJbEXxTxEdSbJt2gq+ASoXR6qfL7pHbVdtwP5GibEu8Xz8p2sHRu1sEu2y4abyiX82ADbOdXxXyCmp+EgumTzZYOCcGrRi3UIrMDqZ6MNDp+LRitnPKOWoKDR7TLWP27wzXazfJ+A4UrHVkagmdUZz7MKbhDtvQNCVUgIKyAvLHY3euSmJt+XjI/ifg4nZ6eFXcEaNdam6RUR3jVX6x3ki7ePLZZZ/28r9YHqEeRIu3GTGSqecJjRxGJwC8IgnzhjR1O9Ou/ash6eKw9mqDS47bIZKKoFkCxeRz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 17:09:54.9996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 444c8db9-69dd-4f62-60ef-08de64d96224
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4325
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F2D2DF5B0B
X-Rspamd-Action: no action

With cross-vendor support gone, it's no longer needed.

AMD CPUs ignore the top 32 bits of the SYSENTER/SYSEXIT MSRs, which is
not how this emulation worked due to the need for cross-vendor support.
Any AMD VMs storing state in the top 32bits of the SEP MSRs will lose
it.

It's very unlikely to affect any production VM because having 64bit width
just isn't how real AMD CPUs behave.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
  * Reworded commit message to mention the loss of the top dword for
    any VM stupid enough to use it.
---
 xen/arch/x86/hvm/svm/svm.c               | 42 +++++++++++-------------
 xen/arch/x86/hvm/svm/vmcb.c              |  3 ++
 xen/arch/x86/include/asm/hvm/svm-types.h | 10 ------
 3 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 10d1bf350c..329c4446e9 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -401,10 +401,6 @@ static int svm_vmcb_save(struct vcpu *v, struct hvm_hw_cpu *c)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
-    c->sysenter_cs = v->arch.hvm.svm.guest_sysenter_cs;
-    c->sysenter_esp = v->arch.hvm.svm.guest_sysenter_esp;
-    c->sysenter_eip = v->arch.hvm.svm.guest_sysenter_eip;
-
     if ( vmcb->event_inj.v &&
          hvm_event_needs_reinjection(vmcb->event_inj.type,
                                      vmcb->event_inj.vector) )
@@ -468,11 +464,6 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
     svm_update_guest_cr(v, 0, 0);
     svm_update_guest_cr(v, 4, 0);
 
-    /* Load sysenter MSRs into both VMCB save area and VCPU fields. */
-    vmcb->sysenter_cs = v->arch.hvm.svm.guest_sysenter_cs = c->sysenter_cs;
-    vmcb->sysenter_esp = v->arch.hvm.svm.guest_sysenter_esp = c->sysenter_esp;
-    vmcb->sysenter_eip = v->arch.hvm.svm.guest_sysenter_eip = c->sysenter_eip;
-
     if ( paging_mode_hap(v->domain) )
     {
         vmcb_set_np(vmcb, true);
@@ -501,6 +492,9 @@ static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
+    data->sysenter_cs      = vmcb->sysenter_cs;
+    data->sysenter_esp     = vmcb->sysenter_esp;
+    data->sysenter_eip     = vmcb->sysenter_eip;
     data->shadow_gs        = vmcb->kerngsbase;
     data->msr_lstar        = vmcb->lstar;
     data->msr_star         = vmcb->star;
@@ -512,11 +506,14 @@ static void svm_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
-    vmcb->kerngsbase = data->shadow_gs;
-    vmcb->lstar      = data->msr_lstar;
-    vmcb->star       = data->msr_star;
-    vmcb->cstar      = data->msr_cstar;
-    vmcb->sfmask     = data->msr_syscall_mask;
+    vmcb->sysenter_cs  = data->sysenter_cs;
+    vmcb->sysenter_esp = data->sysenter_esp;
+    vmcb->sysenter_eip = data->sysenter_eip;
+    vmcb->kerngsbase   = data->shadow_gs;
+    vmcb->lstar        = data->msr_lstar;
+    vmcb->star         = data->msr_star;
+    vmcb->cstar        = data->msr_cstar;
+    vmcb->sfmask       = data->msr_syscall_mask;
     v->arch.hvm.guest_efer = data->msr_efer;
     svm_update_guest_efer(v);
 }
@@ -1720,12 +1717,9 @@ static int cf_check svm_msr_read_intercept(
 
     switch ( msr )
     {
-        /*
-         * Sync not needed while the cross-vendor logic is in unilateral effect.
     case MSR_IA32_SYSENTER_CS:
     case MSR_IA32_SYSENTER_ESP:
     case MSR_IA32_SYSENTER_EIP:
-         */
     case MSR_STAR:
     case MSR_LSTAR:
     case MSR_CSTAR:
@@ -1740,13 +1734,15 @@ static int cf_check svm_msr_read_intercept(
     switch ( msr )
     {
     case MSR_IA32_SYSENTER_CS:
-        *msr_content = v->arch.hvm.svm.guest_sysenter_cs;
+        *msr_content = vmcb->sysenter_cs;
         break;
+
     case MSR_IA32_SYSENTER_ESP:
-        *msr_content = v->arch.hvm.svm.guest_sysenter_esp;
+        *msr_content = vmcb->sysenter_esp;
         break;
+
     case MSR_IA32_SYSENTER_EIP:
-        *msr_content = v->arch.hvm.svm.guest_sysenter_eip;
+        *msr_content = vmcb->sysenter_eip;
         break;
 
     case MSR_STAR:
@@ -1940,11 +1936,11 @@ static int cf_check svm_msr_write_intercept(
         switch ( msr )
         {
         case MSR_IA32_SYSENTER_ESP:
-            vmcb->sysenter_esp = v->arch.hvm.svm.guest_sysenter_esp = msr_content;
+            vmcb->sysenter_esp = msr_content;
             break;
 
         case MSR_IA32_SYSENTER_EIP:
-            vmcb->sysenter_eip = v->arch.hvm.svm.guest_sysenter_eip = msr_content;
+            vmcb->sysenter_eip = msr_content;
             break;
 
         case MSR_LSTAR:
@@ -1970,7 +1966,7 @@ static int cf_check svm_msr_write_intercept(
         break;
 
     case MSR_IA32_SYSENTER_CS:
-        vmcb->sysenter_cs = v->arch.hvm.svm.guest_sysenter_cs = msr_content;
+        vmcb->sysenter_cs = msr_content;
         break;
 
     case MSR_STAR:
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index e583ef8548..76fcaf15c2 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -97,6 +97,9 @@ static int construct_vmcb(struct vcpu *v)
     svm_disable_intercept_for_msr(v, MSR_LSTAR);
     svm_disable_intercept_for_msr(v, MSR_STAR);
     svm_disable_intercept_for_msr(v, MSR_SYSCALL_MASK);
+    svm_disable_intercept_for_msr(v, MSR_IA32_SYSENTER_CS);
+    svm_disable_intercept_for_msr(v, MSR_IA32_SYSENTER_EIP);
+    svm_disable_intercept_for_msr(v, MSR_IA32_SYSENTER_ESP);
 
     vmcb->_msrpm_base_pa = virt_to_maddr(svm->msrpm);
     vmcb->_iopm_base_pa = __pa(v->domain->arch.hvm.io_bitmap);
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 051b235d8f..aaee91b4b6 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -27,16 +27,6 @@ struct svm_vcpu {
 
     /* VMCB has a cached instruction from #PF/#NPF Decode Assist? */
     uint8_t cached_insn_len; /* Zero if no cached instruction. */
-
-    /*
-     * Upper four bytes are undefined in the VMCB, therefore we can't use the
-     * fields in the VMCB. Write a 64bit value and then read a 64bit value is
-     * fine unless there's a VMRUN/VMEXIT in between which clears the upper
-     * four bytes.
-     */
-    uint64_t guest_sysenter_cs;
-    uint64_t guest_sysenter_esp;
-    uint64_t guest_sysenter_eip;
 };
 
 struct nestedsvm {
-- 
2.43.0


