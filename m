Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MtHCGBri2lKUQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 18:31:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843711DF2F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 18:31:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226773.1533262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vprZc-00042e-9K; Tue, 10 Feb 2026 17:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226773.1533262; Tue, 10 Feb 2026 17:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vprZc-0003zm-6A; Tue, 10 Feb 2026 17:30:52 +0000
Received: by outflank-mailman (input) for mailman id 1226773;
 Tue, 10 Feb 2026 17:30:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBUt=AO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vprZa-0003zg-Oj
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 17:30:50 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b8fffec-06a6-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 18:30:47 +0100 (CET)
Received: from SJ0PR03CA0169.namprd03.prod.outlook.com (2603:10b6:a03:338::24)
 by PH7PR12MB7817.namprd12.prod.outlook.com (2603:10b6:510:279::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 17:30:40 +0000
Received: from BY1PEPF0001AE16.namprd04.prod.outlook.com
 (2603:10b6:a03:338:cafe::f6) by SJ0PR03CA0169.outlook.office365.com
 (2603:10b6:a03:338::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 10 Feb 2026 17:30:53 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE16.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 17:30:38 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 10 Feb
 2026 11:30:36 -0600
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
X-Inumbo-ID: 3b8fffec-06a6-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w29StFONBwonAaXArCwh+3XIHCAX6nj6ouohaQwG0EdaV7CYVscoQB/k9Da4I2Wc8fjMGMtkSkq04MJIGL/4sDctR2A7mSAiHoJDmFlHMuW9H3aep6a9spl4gnIJL2mMA2NeDW71WcGllQkOMXeMrsepfweX6zFGas5zn+XV86ugYL57Y/2SASWkyrid93xER6JXWGpEEUDPJT9G3HuSC4nkVDKJ1dnAArOq4bcU67FXMpbva5Q0PUsg0rZgivfoXd3ZEStCQZAWOVG4/LwczUw2MsqCJ19AFQFVNVoFci7cYMrbE7Ou/8gcCd8ypAIv5FowiCtkX0t0f5tg0049pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CUBMuaEddQoAP0o8NpQt7SpZhElFiF6gbPVIufVpRA=;
 b=jkC4ErvAt6jQgGWx/ovCvdTmUuNVaoyR/dfS7zopJR54E3qcLjfWxnBmx7occwq2x47pL3fTC9Rpc3aQLuFz0gQou8Ft59L9ZyIKPFIH23Ez2l3nwRyWr9vSHZpOz1ncNO4jPeo7zdadsQPhR0g2EFrjObK10N0aN2zFQG708nILSJm2s/+ZgBxAQFSTTLCiw9HOcfHYSjtIltpjTIFZ2o6P9RQ6MtpQSNx9dzQA7fquPef6kiwdXIgBgOwXVK5B+encIZlKp1FqySHyOY4jaI2W5JKpfTSk3vFRhRWh4ZK16NbIpqrpBRM+rjljNWg/uticUwi0jUvcSXsjWRHhoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CUBMuaEddQoAP0o8NpQt7SpZhElFiF6gbPVIufVpRA=;
 b=ZpR8rn7h9Yf/JMrf05FOFCsAjrZ0YS+oRcyZaYGdXwm5S9haIDfuwRnlxC2SPdTAQLPwvNCN6vwhTdgT3o5uASGEcSEtHb2CTECttXh5UPrnFsowOUSnRatjYdTCI667M/CPJpSYLlmsEI9pISTaFWnb/d/ytK+WXsCSGMcX4Ew=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/domctl: Conditionalise x86 domctl using DCE rather than ifdef
Date: Tue, 10 Feb 2026 18:30:21 +0100
Message-ID: <20260210173022.257030-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE16:EE_|PH7PR12MB7817:EE_
X-MS-Office365-Filtering-Correlation-Id: e9952b4d-8f74-4b68-3a41-08de68ca1ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3qaUirZn3Nslnan2rPNgCMTT2E6zwZoGj3H4QozxjXxjuwySQbM7hSxZybfR?=
 =?us-ascii?Q?C43RO7E600iJuXt7at9Wv2Pwg+ZCGKCyGTFytLcWEMYLrMedU+a2uzC0aPLA?=
 =?us-ascii?Q?QeJ5rNo4kMF95qxj3bR1fIBPuvIxl5HjHm2s/RyzRjR/DDaVMVpV8pHNeGlF?=
 =?us-ascii?Q?3Kanhc+D2wrdF3ZYVD0gn2AMkbjVzZmmj704UL/j7+9iZN3uJZ/sGcO/FiK3?=
 =?us-ascii?Q?Xi/JoERRBBTQ2E8j1iFA79hNIwyfNBQXvtV8j3/lpxb1gK3XxfGAHvhrSvK1?=
 =?us-ascii?Q?SBzJLs4Pys/FIttGJ/O3BJhT9+G3J7jNpzZZG7dO2j/uUNLUH6cUzwLq4CwH?=
 =?us-ascii?Q?k2jAIRmeqaThBeMV3XsOJcBx6E6BBdGsF34TVe6kgNBcVL8o2d3NbD4cPlaq?=
 =?us-ascii?Q?0fcqtNMOBkoxJTQPd+4zmqX5j0lkezpADSKaLNvkh9wg++N9KdVm73qQmkg1?=
 =?us-ascii?Q?2PcMjqA6JP7//6V7xJng3l/P7ko757B9PkralVtwTrehJwv/yIk25ECfkS6q?=
 =?us-ascii?Q?anoqR5qgrgTUOquzjoiSWXRARA+vpBINRXcSiST7yi0j5TmvghbN6NMGukMF?=
 =?us-ascii?Q?RixczyN0BHw7ziIKbgxA4eS7Lle0agGJ/65/2D3gTnwScZMDmrPUPgaJ99aP?=
 =?us-ascii?Q?q0vy3ikL6lOILhEjbqe024gtAuSkjjEhYglheleQsdQAj25yeKihowfg8WG+?=
 =?us-ascii?Q?kpX9kTpu0/6nqQjWQ2lV6E3WBug+xXiKvQLPMw1d+lKT8U//lTjS0r+WTOZr?=
 =?us-ascii?Q?ZmIpV38Edr5U2fjX6LbmvVwJqJiz+2klRLkfDlb/oHFR4xHpWug1XTxlAodj?=
 =?us-ascii?Q?VA6QTvwTnlwXgmZQEjiDugyFYuGHRLognVRd3hmvvCqZjDTgHrxVi8/pCiEu?=
 =?us-ascii?Q?9PnneFsiq3vNUFIBxWyoLXdcNavGvaEbh8CeJZxG/3Deu/CVhmahxzV1WoLE?=
 =?us-ascii?Q?gjUKPChWb0NU0O9eRdq7Y7NJRP0GF4e9keeSGH8tToVx4jDV43MLZj71+16N?=
 =?us-ascii?Q?ve3/N2McUfdxNLICoWEiOnZxgr4i+lpBfaAV3eCcrQEIc8IBwRWHWVYrwU/A?=
 =?us-ascii?Q?cQY6gFG7QqX+bB3tGdpSpOQbdedNnC+EXZngoXSLrHBzH/ta/85Dck8AuA7K?=
 =?us-ascii?Q?V7Bh6SEmWqTrLdkCO80BvqsC3wA9OL+5UwpC+eMBaqBYBeAR8U1f7o6HHrOX?=
 =?us-ascii?Q?Wpi+vi1cHXiVyyke0V4hYpUEREbEIH6zyUSCx8IsmSAjLqpr8IBnQT9jKja7?=
 =?us-ascii?Q?ir8l56n66tvwIC3MMcVDYrDedmVoz6f0pOfFD2ISTHqCPmrH07HaAmY3t5nx?=
 =?us-ascii?Q?wdPrYat4vbakyrwo+khihW0OfUCQuf0THCVMWzF6qwnFYLimectb6qiGlqNI?=
 =?us-ascii?Q?epQczr2+ynFfHUVJHHiFaDjiMpDOyClWoD3eYsiqqK5qmshiGT9p82dojVHR?=
 =?us-ascii?Q?KH/6FlLNVVED/kpNqYHAhzkD8DgE8RgSb8h0HHcPsIFw31RoaWLx/rD/5tWq?=
 =?us-ascii?Q?NM92c4orMoTy2UQETFcptEKGY+WMxlnRC1j9f4lUlcjboRNxCsfdvfOybeDV?=
 =?us-ascii?Q?ESELJepC5rNadFLygk0OWHdyMnGGGpJaXvouPHtupKNVpA3QCwD0ZIn7heLM?=
 =?us-ascii?Q?rChq2UfjeJYvaFBS9/KScmOjIdU4bdX79bCqsePJT6HezfPu92jBwfc5XC93?=
 =?us-ascii?Q?9WDL7A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3AdaGVoOFPWouJJe19fIfXV/DpQZC4Xzz3/oN85tmjKWIVOWlgDa7zb0S/l4ani0Gs8d5I+WkLpXBbif/Y1w9sHLO++brSTZ0hXksdT8RVdzyaXln7trLF24Bjn+PrUd9O+n9T3wjIbcEX04+Yq6Q5HPS32FMPjwWXdvbfGCjfZYPC6W999jgsGrcQ6jWuIrxrZRVbNMugB62fAqMflDd+lk375ySrW4zKI6xvPlVlA+f885zy6y9FZumw5UsAvi69cgq64K9yJq+DSeDVzY2d4SO4xXCFNsLaVXS9jWzllgpPF8iL9ITI0JZ9EXX+xtNDAJA534ly7VVlbjCV4h0B0DBMO/o71DlvxJhzv6c9dfTKTcryfsZlvJBdjOZcox/sxZ6+ri5gck6o90ajy5pRE4uY48xHOjrAAICYRINMyseaRA1HzxrkPwxWiW86wM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 17:30:38.8552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9952b4d-8f74-4b68-3a41-08de68ca1ba8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE16.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7817
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8843711DF2F
X-Rspamd-Action: no action

Make them uniformly return EOPNOTSUPP when their dependent features
are absent. Otherwise the compiler loses context and they might return
ENOSYS instead.

debug_op, mem_sharing_op, p2m_audit and psr_alloc change behaviour and
return EOPNOTSUPP when compiled out, rather than ENOSYS.

While at it, remove the public headers from mem_sharing.h (forward
declarations are fine) and add a missing xen/sched.h include (for
complete struct domain definition).

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v2:
  * Also cover p2m_audit
  * in mem_sharing.h, restrict the xen/sched.h inclusion to the ifdef.
  * bugfix: make psr handler correctly exit early when !IS_ENABLED(...PSR)
---
 xen/arch/x86/domctl.c                  | 33 +++++++++++++++-----------
 xen/arch/x86/include/asm/mem_sharing.h | 12 ++++++----
 xen/arch/x86/include/asm/p2m.h         | 10 ++++----
 3 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index d9521808dc..942f41c584 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -220,15 +220,15 @@ long arch_do_domctl(
     {
 
     case XEN_DOMCTL_shadow_op:
-#ifdef CONFIG_PAGING
+        ret = -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_PAGING) )
+            break;
+
         ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
         if ( ret == -ERESTART )
             return hypercall_create_continuation(
                        __HYPERVISOR_paging_domctl_cont, "h", u_domctl);
         copyback = true;
-#else
-        ret = -EOPNOTSUPP;
-#endif
         break;
 
     case XEN_DOMCTL_ioport_permission:
@@ -842,11 +842,14 @@ long arch_do_domctl(
         }
         break;
 
-#ifdef CONFIG_HVM
     case XEN_DOMCTL_debug_op:
     {
         struct vcpu *v;
 
+        ret = -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_HVM) )
+            break;
+
         ret = -EINVAL;
         if ( (domctl->u.debug_op.vcpu >= d->max_vcpus) ||
              ((v = d->vcpu[domctl->u.debug_op.vcpu]) == NULL) )
@@ -860,7 +863,6 @@ long arch_do_domctl(
         ret = hvm_debug_op(v, domctl->u.debug_op.op);
         break;
     }
-#endif
 
     case XEN_DOMCTL_gdbsx_guestmemio:
     case XEN_DOMCTL_gdbsx_pausevcpu:
@@ -1033,15 +1035,18 @@ long arch_do_domctl(
         break;
     }
 
-#ifdef CONFIG_MEM_SHARING
     case XEN_DOMCTL_mem_sharing_op:
+        ret = -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_MEM_SHARING) )
+            break;
+
         ret = mem_sharing_domctl(d, &domctl->u.mem_sharing_op);
         break;
-#endif
 
-#if P2M_AUDIT
     case XEN_DOMCTL_audit_p2m:
-        if ( d == currd )
+        if ( !P2M_AUDIT )
+            ret = -EOPNOTSUPP;
+        else if ( d == currd )
             ret = -EPERM;
         else
         {
@@ -1052,7 +1057,6 @@ long arch_do_domctl(
             copyback = true;
         }
         break;
-#endif /* P2M_AUDIT */
 
     case XEN_DOMCTL_set_broken_page_p2m:
     {
@@ -1240,9 +1244,12 @@ long arch_do_domctl(
         break;
 
     case XEN_DOMCTL_psr_alloc:
+        ret = -EOPNOTSUPP;
+        if ( !IS_ENABLED(CONFIG_X86_PSR) )
+            break;
+
         switch ( domctl->u.psr_alloc.cmd )
         {
-#ifdef CONFIG_X86_PSR
         case XEN_DOMCTL_PSR_SET_L3_CBM:
             ret = psr_set_val(d, domctl->u.psr_alloc.target,
                               domctl->u.psr_alloc.data,
@@ -1305,8 +1312,6 @@ long arch_do_domctl(
 
 #undef domctl_psr_get_val
 
-#endif /* CONFIG_X86_PSR */
-
         default:
             ret = -EOPNOTSUPP;
             break;
diff --git a/xen/arch/x86/include/asm/mem_sharing.h b/xen/arch/x86/include/asm/mem_sharing.h
index 040962f690..c66cc912db 100644
--- a/xen/arch/x86/include/asm/mem_sharing.h
+++ b/xen/arch/x86/include/asm/mem_sharing.h
@@ -9,10 +9,12 @@
 #ifndef __MEM_SHARING_H__
 #define __MEM_SHARING_H__
 
-#include <public/domctl.h>
-#include <public/memory.h>
+struct xen_domctl_mem_sharing_op;
 
 #ifdef CONFIG_MEM_SHARING
+#include <xen/sched.h>
+
+struct xen_mem_sharing_op;
 
 #define mem_sharing_enabled(d) ((d)->arch.hvm.mem_sharing.enabled)
 
@@ -92,8 +94,6 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
 int mem_sharing_notify_enomem(struct domain *d, unsigned long gfn,
                               bool allow_sleep);
 int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg);
-int mem_sharing_domctl(struct domain *d,
-                       struct xen_domctl_mem_sharing_op *mec);
 
 /*
  * Scans the p2m and relinquishes any shared pages, destroying
@@ -103,6 +103,7 @@ int mem_sharing_domctl(struct domain *d,
 int relinquish_shared_pages(struct domain *d);
 
 #else
+struct domctl;
 
 #define mem_sharing_enabled(d) false
 
@@ -147,4 +148,7 @@ static inline int mem_sharing_fork_reset(struct domain *d, bool reset_state,
 
 #endif
 
+int mem_sharing_domctl(struct domain *d,
+                       struct xen_domctl_mem_sharing_op *mec);
+
 #endif /* __MEM_SHARING_H__ */
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 9016e88411..b2721f8c11 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -806,12 +806,10 @@ static inline void p2m_pt_init(struct p2m_domain *p2m) {}
 void *map_domain_gfn(struct p2m_domain *p2m, gfn_t gfn, mfn_t *mfn,
                      p2m_query_t q, uint32_t *pfec);
 
-#if P2M_AUDIT
-extern void audit_p2m(struct domain *d,
-                      uint64_t *orphans,
-                      uint64_t *m2p_bad,
-                      uint64_t *p2m_bad);
-#endif /* P2M_AUDIT */
+void audit_p2m(struct domain *d,
+               uint64_t *orphans,
+               uint64_t *m2p_bad,
+               uint64_t *p2m_bad);
 
 /* Printouts */
 #define P2M_PRINTK(f, a...)                                \

base-commit: 2fa468919c39aac189623b6c580ce4ff8592d799
-- 
2.43.0


