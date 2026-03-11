Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL8zKOGAsWmjCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:49:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDE7265B3C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:49:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251174.1548441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KXG-0000Yf-Sw; Wed, 11 Mar 2026 14:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251174.1548441; Wed, 11 Mar 2026 14:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KXG-0000SV-MG; Wed, 11 Mar 2026 14:27:42 +0000
Received: by outflank-mailman (input) for mailman id 1251174;
 Wed, 11 Mar 2026 14:27:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tK7a=BL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0KXF-00087A-IK
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 14:27:41 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74fe7e07-1d56-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 15:27:40 +0100 (CET)
Received: from SN6PR01CA0019.prod.exchangelabs.com (2603:10b6:805:b6::32) by
 DS5PPF7671D5CC0.namprd12.prod.outlook.com (2603:10b6:f:fc00::653) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 14:27:31 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:805:b6:cafe::9d) by SN6PR01CA0019.outlook.office365.com
 (2603:10b6:805:b6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Wed,
 11 Mar 2026 14:27:32 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 14:27:29 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 09:27:28 -0500
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
X-Inumbo-ID: 74fe7e07-1d56-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiALSE0opl9WwFMCqLVbZ60EUexnCAn5tuj40GE5X8HRXr6GZZGrAeUsC2ZxO7SzMpBSKlifnIEfRJyStqPK+Rp4o/yEzO2VCkbt2tGTQ7x/EdLRYZCS6HDXw79pzrAm2sQyRSD7C6802CgUkSULutmKqKJ8Y0ScK2Odl6gSGGBRy8QWzQ8dYFYf+SUbZp55MVmaZM4qBQCSZwgdDJfWK606prD8xEaeZceYWJ3DomupoF/qQX29+gI/VR8oBPYYoAhrAcWrSZ2zBXHQjDvYw13XYp/wnytwp5BqCgzKHcWjV5GuNoVOS/jNP5AZuZydWmPtzcvgbXPUBLXgBFD3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8W73DiBPopGYeUkDwKpXuXzVBpLkZfDD8f6yj9F+Ki0=;
 b=YNzBCB+xO7pgSKRjk1z503yrLrsL4FtoMK32v0opB2M9xLGMgDf/CVG3Mbl5eQgntlTu0EOS1FCwzSre5d6D6yyJNuijWKagUUuDvfvAtgSZRCiHlZtNvlqgrquK7RRHVY0NhPF4E5iEvyHT75Vb5Ti8VFJFnh/PdLI3i3vNSMmeQOpfl04aCq6DP433Hevx8+49OdZbsYLov038nC02iadfyJ5g+gfYFfmUe7CnZycErk+4l2zJyISdqZGX3APGCKtmmNM9lIW/fI/ZuM9CaV9PzMKfj4BDRfrLX9kj9P3LS+hZg6TFuE5M818vNryMmjigXpjHZtqnSNAg6xNJyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8W73DiBPopGYeUkDwKpXuXzVBpLkZfDD8f6yj9F+Ki0=;
 b=V0tLMG77XvG4cLMqcCqwOyTasCm+BiBK8JxbkXAXAeHan8sKywOCdDblmIx2fRSw6Pdmu/gHJVcqiZ8oOxGkKoQE0ZeZTM4TF1tvBDSUh8edGY5R5AzHROAqOBJliOwMO9Xw0jSmXnHpLKD1BZtoHaqKKN6hO1PWUAnyxYaILio=
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
Subject: [PATCH v4 4/4] x86/svm: Drop emulation of Intel's SYSENTER behaviour on AMD systems
Date: Wed, 11 Mar 2026 15:27:07 +0100
Message-ID: <20260311142711.16754-5-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
References: <20260311142711.16754-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|DS5PPF7671D5CC0:EE_
X-MS-Office365-Filtering-Correlation-Id: 705db63f-e539-4104-2cfb-08de7f7a53a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1DhZdn/myvZJVnlG1+LCDn0arq1AGYBDMwlnilVEqnuWhfzGwmZA7DheTQ+HkEPAJb1FDCcRUHWMv42qAhDcY8K4PvScGv7qA+CV/ONP3Y7BOu8zC0dJMGRSxZb0O8uO+TSHyKypiPr/aw+SL+jVQybGCefF1nKyuj2vmThBhSv3tjizt2yXXSwYA0BUcd7Yx1va0huNumqOkxdvEqbeCh5rAfC57W7NBXYgcimbtuiiGJka2eRD+lHCkZ43ddgmgCZtWKpuo5KcBuOV4BY9qGn+7JWuD2BoQBbIJCiSwOpKwuZ0L/c+T42AF7CGPwsWaWXvDHcdPCBoaWLj0AzfNQyIUezRMa0YrQSjkl0WbugKMlMieDvGxRhtNdrK73dqKSHDl/ljJIBg3uOzc6Q+MmsQLx4QfY3TyA3b/BhAqG4CfFbyBFOTVSbQ4ob+4PrYnIZIHufu0YdAxbRXZ5mWiCoTcnnR8LdCY2NgT48w2Y/M35JAGGkegoi7NWkzgSJ+Bfb3GoKdIxY/VaQiwxkjLrSI9uHWgJBJ1EtJG4IYfxMLUgqXR0iondjKRkCuVHYaCxEWO2Ay8ghjy0NV4NXTJvBW2BgZGgPuiJ71a9MakQ9ZC8DYgeZ9hsO4H6FeXX57xYm8aOO2UvzEhYLyZNck/tMaepRtaqYYs+ppuYTdJRJXR1VYWAiJylrv5f7kiJybDOsUXSB7TsfD/pXVRu1Fkm7O8xae4jNBJ5XspuYxJT6DxmW7E2JiJK0KDSqLpRDf
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jZ9XR+zdEwk3k3pcXYcCJOV17NbUvV6CKbq0McyhOSza8g673J4kbhtnTlBB/MVxtRQFWRgFqYvh6mRWMiSnl7N7f93xCpNRbldX1EftDIzGgmYf6fOJzBuP4CUJ/4fFZdiaOYViOjoTTIzPH4A/pL6MWIawABcBdUE41h4h6/OJDZQnSkYF5i9esBwxt4vm2vhpJ3a1m5xmbknRN4RwbvsFuaobDsVoTNCQkOx85XQTOxqwK/6lI3wa3o9+YSRrX8YLJZNDQ+8bBEZ0akXXKVPtivYYRR9SbaMjDx1FRdmLkNY2j6YMROFhfYbRnQVlD6H9445PBBDMVbK1IsLSTy7hiUcnHvJ7qXUCxeWvRggeceUS2GfyWWy8y19lN/eFjxyjBqb2xg0FoXGJQREUJdxMVwpDsRSb8Yf1BKQT3G2kveebhNQWZVXS/de8n7Zz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:27:29.8343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 705db63f-e539-4104-2cfb-08de7f7a53a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF7671D5CC0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email,amd.com:dkim,amd.com:email,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2DDE7265B3C
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
v4:
  * Sorted assignments to the vmcb struct by dst address.
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


