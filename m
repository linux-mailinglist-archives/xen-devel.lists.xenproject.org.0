Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD+7NdyhsmnbOQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:22:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EF9270CE8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 12:22:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252077.1548874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e71-00071k-38; Thu, 12 Mar 2026 11:21:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252077.1548874; Thu, 12 Mar 2026 11:21:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0e70-0006xA-UK; Thu, 12 Mar 2026 11:21:54 +0000
Received: by outflank-mailman (input) for mailman id 1252077;
 Thu, 12 Mar 2026 11:21:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=17Qz=BM=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0e6z-0006Qg-99
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 11:21:53 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa9b1b7b-1e05-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 12:21:52 +0100 (CET)
Received: from BL1PR13CA0313.namprd13.prod.outlook.com (2603:10b6:208:2c1::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.8; Thu, 12 Mar
 2026 11:21:46 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::11) by BL1PR13CA0313.outlook.office365.com
 (2603:10b6:208:2c1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Thu,
 12 Mar 2026 11:21:46 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 11:21:46 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Mar
 2026 06:21:44 -0500
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
X-Inumbo-ID: aa9b1b7b-1e05-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=occdNwNAxGe/QkbK3kUGeDaWy5SyuDTLAvQFupUrbQKMFzHl9cqJZ3rakyhiWspmiQUJcdkwpqpZdw8KR9b7aaus8lHyy4g0+cj+R7/cDrbdOzwNvrAUxl2FbzgBwyQZ5kSldm42tdE4QKr+8y6hAlr4G0J7KonpcQfqoYsmWSefaa+BEjBqP6qB+REu4mV8eu9aCxoafqUgxksMvRCqc7jmMDMw9rlSNTYSZCIWKz4p3F5s+21FMU1uLxdRIOKHUdYmv45A74ssttqblD83fTCRzO7JOAEYa4MFVlUYjWpH5APDUjaKTdf3oOpYW+vM9xC77ushgv5HUYW5iBVUeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Soh9rhU/Aoc+mc4XaiFXphWcynULpkzWojo6OlbgdPQ=;
 b=CdTB2ijb08ewRQulmiG7eTIYRYzXnbBFDrb/yp6HIPwr9E9gKemR4I2iEDMPMjghFRxrAWyPPpFX9Vyuuy73tPDlHA4ta22U/4dhA++FnZSICjLrv+eJADlt/tRsuC+T0ZXKPdEsY6Hrl+pTFiva7mbXxJd2E81275UdSBe3D43jKlrgYXvgUI3CIMMbe9IrdPzdoWb0C+GDlShwP94Sn1hxxFpdoPgLpuMxNZ/ZdzjoXz7QMEeTYyLMK/w5QRu+PDe3jHsdmTKtKXA7fPOtNTNUrKDyzk/IdQEcUERQpOe0YdzdIOs5Qy8tgRUxnrUFe0jP0OImspFKXSt5hygtqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Soh9rhU/Aoc+mc4XaiFXphWcynULpkzWojo6OlbgdPQ=;
 b=JEMYQ6Uu/lcHH3lYNRKgwP0cxqXl/nuQhZ3IePe7isz09MWf7tiD4CiLCoaZ4EIEccRpUUQQl84rXd3fSDVkrWyn6W13IQFoW5+zENraYZ/Hzi1jHiIxvHrK9v3I35ytQlTB/0tiLAR13Lb5QTR2HhQXNQpdVej9Ez9QA0B0hKo=
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
Subject: [PATCH v5 4/5] x86/svm: Drop emulation of Intel's SYSENTER MSR behaviour
Date: Thu, 12 Mar 2026 12:21:13 +0100
Message-ID: <20260312112116.22563-5-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
References: <20260312112116.22563-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac9a602-f8b5-4dcf-30ba-08de80298c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oPD5RXA+UVks79lWS9Aa28gog5dqjSHQhA0CUcFOCd6kiBssIxhnUn4SK+hr9/HF+9SnDhvu6mi6Dy/ifu6F8k1DUo+NFTGDDIwZnvec/vEmwwg3EegGmkZR//3NaIeToO3jXOR9gygR/luaszXVCV3graAuotRcy5oKqQ509WStc9zb7761qjUdtgmaha2I5GSc3pOOCQhmgJUcbEeX2BE77/DrLjyvHLWnEiYB+yps8WqYWuAS4pAQ02cupNIrMXwRGaeWEEcyTIB6XsTkrLHA4ROFHNuElmbCp5p1td1VP6FOxfU4mg8uXGf6RKSJasS6NHN+6TnmWve9IMi4SwVV7Kfr6yFbEDy0X3iISK/5FmiMeeX/CqLT72w7YyfkcZXY/XRBqRNunExO7XAkd+L9Kezl93MhiWnmFiYooTAO7KMX3ZddeJVghOhbvhoxYz+NnRkcG5k6VOaMDNn+Q/JdUc9KloOCPp+nYwIOorVXIZyYPsV4dzeo3q09pUNZdG9ZH6cXCP9c3CIDHGcHecZBgYc0NhVHImXoJFZU8Gf1Vlq7AZXQlg6rrVeZQ+KioXyOCXDuTsLD/ndZHeAxEegar7BRkprxPW00pyu5JmNkBogEJQGgOnBLI9tPvdfW/kusd+Ht0y4TJVhWJdbZwoGTf3KKgJnSqmL1ODPEbzzcRvjTeFVVbaeY0Xe/CLBhAnBhUGt8E2+TBusvyid/1GWIp1YBUvBBmmwRXyA2kwNLi0HudDVyb9ZKSTg9M6dH
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GrLsm6r9WTyMkmTr/2Bzs3Bz0efOeuD8OIfcwPuTSqD8t1qkxS7ei9S2aS2GGkqr4KrrEjBaOU/V7ElgcSXz+H6KJsJUFtzOJAPqaS5mY/QyMtSM3euIp81e7OF4sZBsbEvYvGEuEKiohBpJdo/DaQkJGtrlqhW9Cd7iILP1QAxU7UKTY1/WgfJ1PF72gPJydaCed1ECTdZ+U9bxNrj6biTo816h3DAmF0lk6pvSzqAxylB2Tb+KMfVcIr4gaVeHvxjDoHEfN0dBgavVdwB138CtFIKY2DuBKONaNy1PulTxjZoY7mvkh/KHNQo6Q59D6N4zz14gGCExJftkEBH+gAePK7jPrEzwj7W14y7X+c2wLpMM+49rUP+1PTRzJ6HH61Hp1ZNUFwi7Ha6WhUi6So68ODL50171rpTV06l7CcvyUjxkcfyUdQwBqZZNCzM1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 11:21:46.5488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac9a602-f8b5-4dcf-30ba-08de80298c1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,amd.com:dkim,amd.com:email,amd.com:mid,vates.tech:email];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 84EF9270CE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With cross-vendor support gone, it's no longer needed.

AMD CPUs ignore the top 32 bits of the SYSENTER/SYSEXIT MSRs, which is
not how this emulation worked due to the need for cross-vendor support.
Any AMD VMs storing state in the top 32bits of the SEP MSRs will lose
it.

It's very unlikely to affect any production VM because having 64bit width
just isn't how real AMD CPUs behave.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v5:
  * New title
---
 xen/arch/x86/hvm/svm/svm.c               | 42 +++++++++++-------------
 xen/arch/x86/hvm/svm/vmcb.c              |  3 ++
 xen/arch/x86/include/asm/hvm/svm-types.h | 10 ------
 3 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 20591c4a44f..076d57e4847 100644
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
+    vmcb->lstar        = data->msr_lstar;
+    vmcb->star         = data->msr_star;
+    vmcb->cstar        = data->msr_cstar;
+    vmcb->sfmask       = data->msr_syscall_mask;
+    vmcb->kerngsbase   = data->shadow_gs;
+    vmcb->sysenter_cs  = data->sysenter_cs;
+    vmcb->sysenter_esp = data->sysenter_esp;
+    vmcb->sysenter_eip = data->sysenter_eip;
     v->arch.hvm.guest_efer = data->msr_efer;
     svm_update_guest_efer(v);
 }
@@ -1734,12 +1731,9 @@ static int cf_check svm_msr_read_intercept(
 
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
@@ -1754,13 +1748,15 @@ static int cf_check svm_msr_read_intercept(
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
@@ -1954,11 +1950,11 @@ static int cf_check svm_msr_write_intercept(
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
@@ -1984,7 +1980,7 @@ static int cf_check svm_msr_write_intercept(
         break;
 
     case MSR_IA32_SYSENTER_CS:
-        vmcb->sysenter_cs = v->arch.hvm.svm.guest_sysenter_cs = msr_content;
+        vmcb->sysenter_cs = msr_content;
         break;
 
     case MSR_STAR:
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index e583ef8548c..76fcaf15c2b 100644
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
index 051b235d8f6..aaee91b4b61 100644
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


