Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIzND1RVcmkJiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:50:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB4B6A4FC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211433.1523029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixsx-0007Os-6A; Thu, 22 Jan 2026 16:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211433.1523029; Thu, 22 Jan 2026 16:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixsx-0007MX-1w; Thu, 22 Jan 2026 16:50:19 +0000
Received: by outflank-mailman (input) for mailman id 1211433;
 Thu, 22 Jan 2026 16:50:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1tn=73=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vixsw-0007Lp-0g
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:50:18 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d162c35-f7b2-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 17:50:15 +0100 (CET)
Received: from PH8PR22CA0014.namprd22.prod.outlook.com (2603:10b6:510:2d1::29)
 by SN7PR12MB8772.namprd12.prod.outlook.com (2603:10b6:806:341::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 16:50:10 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::c2) by PH8PR22CA0014.outlook.office365.com
 (2603:10b6:510:2d1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:50:06 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:50:09 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 10:50:02 -0600
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
X-Inumbo-ID: 6d162c35-f7b2-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYZrOXSVGnMPz9GBvjgU2qRtZmcKktu4B8tI1NPTU9LEfyicNElinuhb1maznonzRWuQqtuaCk1pdIaCUJVvTTFwEsH5R/P1v5etwgMKUx4lKxPOngnX1DemGvVYiqiV6Ix9V7NoTaID3AO8chJmzojGQunc+6PMFNAOADp/n++Zz192uBmq627S8NfaavQKsSLoeeRH+QOEn+ana/w5Xsbd4FYXnyYrgBJTgUhmh2I0gzUe+6omJ8QyKmqwrmdImky8oDWYmIVn1piX8hZQebdrWsxF4YVmo39wgSSFzJLrv0lk/Ynp4Rchfscd9Qpw1Z4SPbNRng7ZNS2b6Z6X3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqUBinfJMYNlCATSgG74qTOPnewkTVbi9kO9zRn7zi0=;
 b=CEwEMzXnaME8gbYNoUM+ovhbP2TIZq02Vf6D3k4b+61n01h2/qKUwEujaI0TVm5BLYO8Ml+dwMTsC+D6EcYA+ujJszNOogAR+qH6WZW9NA7RrBn9qTVenENpaDorE+Z29FLr4W7H0y2y5LSAY+/+s6PVImaDMFs2uegqKYlAwF3na6Unfi7AjT9EaMwH6ocoqH9SIgBYXbMar6BTGDlkim0BBeChuScH8LSRrZjpkG+mFZngkHfepGKz56fOohYeVQvlp3sybajiRBJHXUKQDkz1u2Jzb226nlkq6LayAcdgJxm335syDEhT6EqT6k3oF0nYhYlWwF157Q85vSSvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TqUBinfJMYNlCATSgG74qTOPnewkTVbi9kO9zRn7zi0=;
 b=QTEatZSALdktEn3I0LkTWM94RgG4yVoT/gIesuMWyja2y5jUz4ioj7oJWWTOLVM/xjeQJKEcHtUKx9lxUfU544YpuQo9XoXoEPe4y04ESJBffkpcq5TZqCEx9zV/FxEi0RuRo5RLa54sbreW9S4PiZCWclFBr8VsEKEYOPjbzZw=
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
Subject: [PATCH 4/4] x86/svm: Drop emulation of Intel's SYSENTER behaviour
Date: Thu, 22 Jan 2026 17:49:40 +0100
Message-ID: <20260122164943.20691-5-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|SN7PR12MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ba0e70-042d-4b09-f00b-08de59d64dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rqMmRNthNoJzBRvAWe3Ln9lk/GTrW8PJ7uEEUIKGWN7/bkp+EG0QPhWiMGLq?=
 =?us-ascii?Q?Q69l7H/ZkbuxwDl20Zf13393mOljzOisVtDxGNVXW9qHhdlmKnEn1tlPVhx8?=
 =?us-ascii?Q?hU1ERNxsfHxGC53vDIok2Ocz0fZLCd+GekAtuQbC5mEt9yXvNXrXxz3DNXms?=
 =?us-ascii?Q?Jf0jOi7HoTMAXeGUnH8AOWxWaMIe5Deo7LhoD/P9K3h7K90xwzvDtPWWuYub?=
 =?us-ascii?Q?/erp0tsQqZS/oa4H6HNwKzYmNNguHPCQ9Q15ipfNFZmlEZjwxfMs9fEmtEry?=
 =?us-ascii?Q?YREfdDcUWdVxuV6c8bkii3E9XR7BuEEenX2V1i5JPhOQiRE0kCnHYFrGRFpp?=
 =?us-ascii?Q?V91MN0m4MM2m/xUegEWb4poHnE9TZ4CLsnM2Htm8/+TatXpYdFjKVzOnjKfs?=
 =?us-ascii?Q?lkiTXc5zwanzIFJG8f2BVQT3Wggt9iVhOqY7HjtNGp1tTO0VFnGLVykUx5eR?=
 =?us-ascii?Q?KECXomizGPhTOpjAOdL0D5nwK8P3JrizRnOuveBi+/ppAI7BQV6X7zJsPCjm?=
 =?us-ascii?Q?5ejdqowOew8yiVmPQGvo4IQExfYxmzBqFKUpWvMqtHHPPATQiOohKYmIuPyM?=
 =?us-ascii?Q?0BfcDy457y1cyUbCf8Yy3t4xnVxXoLlnTAXdRPm6iWaT6y8tUTFEAyvoCIUf?=
 =?us-ascii?Q?hFyTJBipwQMEbHL5oJETxod1r3mEQxkWJo62aDeCyRNzf3icoq8xq3fZUPMQ?=
 =?us-ascii?Q?pN+/1UXex7hzCK0X1/F813xTxGeto7bpmgfXM79sv64xLETXg3CIvRsY5raU?=
 =?us-ascii?Q?eVAjbc8Gmc/DKHFo+0IJdUV4N6tG6BHukq5/Zs7SV6JNcderWVtFISkQcLQj?=
 =?us-ascii?Q?f0TpFb8GvsdJ264TOoAWoZ0ypQFEAPh3Ye3wbStad3tqaYVSmFUExHawfki3?=
 =?us-ascii?Q?FtNNA1FokHGOrfZoT5SRTEIhXtP4hiIlXz2TLlzOpDZiGVu9Sq/wASS/2YaW?=
 =?us-ascii?Q?Fk2GQWrvtRsSxB7vWm93klfQ7VYzeQTjnmQShyLguJFdKr82TUCfws227N8i?=
 =?us-ascii?Q?bW1cVY+mJWP7eusnNefkNaCoGDGetilj0ogOwRAUjOaJXD3EZFsSH76OrGUB?=
 =?us-ascii?Q?74UVBfLJdSojZtqFZM2wUHFowQhZkvJOGLVxhIu7pPd/1EiC2ooGcfJpWxH8?=
 =?us-ascii?Q?HP4EDYQv3WOrQX+lxDgAh653dug0q+pjzhXYcPGV0cH5l7FO3nC2eR3GJuu+?=
 =?us-ascii?Q?FhgQfZ7KvZH4pJwYwUv4LuJWOnQwHpCdsF5Bg50/j8ZYiTWOCAJzKTMIbmca?=
 =?us-ascii?Q?AVDoi36Uss3xA0dM8nlDg4QQyl7kBHtzl+guJ1AEeoNIpEw/qge/3LA8rOps?=
 =?us-ascii?Q?lAQ2zmPaYhW7sQdZlDOQsYdJTxxFAjlSLUPwfpgaUruJUBDUtAMu0LE2AmZ4?=
 =?us-ascii?Q?ssbLCI7KmJQ/hRDbvnp7ivX7m+pReJC44RH4t6GSeJx3XipC1DkpRaqp8ksG?=
 =?us-ascii?Q?++/97EP21nEw+mXh0o49vjQaVvRmr30ItrKih2Af7CEJaBBksslkWovena6Y?=
 =?us-ascii?Q?9Sc+oiB2xOpbwv7VMaOnOT3REXn3RfKdUIWdRyg34jGjRXGMN2E4XqJEmPht?=
 =?us-ascii?Q?mXwCzigbjYpVmx9Jw6fzzmqwr7LfPORZE9q8rWylD5Mm1bL2sqjeSGxCPI/4?=
 =?us-ascii?Q?U6cv01NGdkX94IXoiBAEI+uK97Tz8/gu78mhXqV/3zdI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:50:09.7449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ba0e70-042d-4b09-f00b-08de59d64dea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8772
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9CB4B6A4FC
X-Rspamd-Action: no action

With cross-vendor support gone, it's no longer needed.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/hvm/svm/svm.c               | 42 +++++++++++-------------
 xen/arch/x86/hvm/svm/vmcb.c              |  3 ++
 xen/arch/x86/include/asm/hvm/svm-types.h | 10 ------
 3 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 0658ca990f..e8f19dec04 100644
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


