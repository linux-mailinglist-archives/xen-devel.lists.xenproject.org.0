Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNFlJqOAsWmjCwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:48:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1513C265AE1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2026 15:48:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1251171.1548417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KXA-0008Ln-Po; Wed, 11 Mar 2026 14:27:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1251171.1548417; Wed, 11 Mar 2026 14:27:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0KXA-0008KI-MH; Wed, 11 Mar 2026 14:27:36 +0000
Received: by outflank-mailman (input) for mailman id 1251171;
 Wed, 11 Mar 2026 14:27:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tK7a=BL=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1w0KX9-00087A-G6
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2026 14:27:35 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 716ee96f-1d56-11f1-b164-2bf370ae4941;
 Wed, 11 Mar 2026 15:27:34 +0100 (CET)
Received: from SN7PR18CA0008.namprd18.prod.outlook.com (2603:10b6:806:f3::32)
 by DS0PR12MB6437.namprd12.prod.outlook.com (2603:10b6:8:cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 14:27:28 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:f3:cafe::5c) by SN7PR18CA0008.outlook.office365.com
 (2603:10b6:806:f3::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Wed,
 11 Mar 2026 14:27:28 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 14:27:27 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Mar
 2026 09:27:25 -0500
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
X-Inumbo-ID: 716ee96f-1d56-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wO1VSRZQxNiG3dKFQJ0Y12kyqCUDIT33gpnT4vlm60Y7vYXbbhADDo+bT2eZ8bkv/gmN7JyNppbxW9atrgBtdq1n0CWyhOCc536aEj6SoEpuPisXQWHNzy1+kxg7b30ne1MYL5CVuWN2jBbaqutaY+vzIVfssdzlnfYWII9sq8Oxp3BOFBY1wDeNsHFognJhdAU4Ro9nlJpHe9lD/pbwE/qlepeHvTLAObjN4VeCHY7U4b7Kgy2LqIUOQgQFeCv81ts+ztOMDMDitGoVoIPbiznmdHehkgM/wepIJ2oIPC5W0+M4BjCvWwjDI21/K0fmPWeLl1PxPtHwmNlyf1uwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9MIEfn09tg7aPNeCKXTNnjlwWiDP/C9u8yiYjGcYfU=;
 b=R9HpJPRloPHphkMOEeZViEYeadn4WjtHSJaY/oE52TZ77QHnt8uLw2b4/P20XI5A2nZUmV31twVQu+aHiHmClxPUxj0qyeDaARXDdVnKFt4RcccR36nYAdrzd02lnlW3co1SDZcWBTM7jHOMbE4xuw0dBnU1cFHcqbwbZpzcVTE5z8S17TxSi2jB2UZaEBK0/JnRuid5ltWhWu/QtbOSdui7a0++BtwM1SAahkV6JINHINPQ/mrBPng7n8xSl4pbcZX/zNCGQM52QqaXf5ozOmEP2AAbNSiyBxKCHJPPTR6XG7O67S6b2Z/guFu0agXlBsdYhhVGRMWydW7/CocsCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9MIEfn09tg7aPNeCKXTNnjlwWiDP/C9u8yiYjGcYfU=;
 b=DjNe1fap8LsWv1BF1m+RImUlVEhtgk1j3EhdWK19h3xQiSWChWVNG8S3TV54tEpvmqhpBXIMVH+zlWUcvnu3pdI3XoJUWM052rQ1GPCRiRgNRXyoWdSKAXPWTmLFN5xBROwPtTpc/BpyPCIpVBnvxIjWTvhJZFByoRBhFiln+Kk=
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
Subject: [PATCH v4 2/4] x86/hvm: Disable cross-vendor handling in #UD handler
Date: Wed, 11 Mar 2026 15:27:05 +0100
Message-ID: <20260311142711.16754-3-alejandro.garciavallejo@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|DS0PR12MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e412c67-49c2-480c-4039-08de7f7a5287
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+BQHOIlJa7UaHE8e4PpkK5BzL/P1XGTVYKqjQq7lCGMD/Vt7qN5FYqsebOyPJaBFBGC6RVDfZYtVUtRTL1HLgwxECsunjO/c38EXmxV2PlvW/zNtCpg/mH36Es5pq9glDWkuuDve07RpefKuBqhDjl/yfuc21JwWhtm8P8pT5hTMygeyOGnDpn91AAYvxTWho9zPTgR7q9b0A18w2n3ci6lI6y8Hcem80Mw1leoHLGGhiDHgg1fW4UgEvyX2OAPePeiN6MhB0hOk7wMj2m9n7KFW7gByWzP2q0jEWP4WJiJeb8ZNYMELlvd/tHgAq3Si9+V60KCR+/dfSDLAbDxt7KMAioesq8eDcKPYHbmeS/cnkewQgIAvnO1laaEjXQvZKyGyD7gphZHirGBUBwO1CxVUC+LYHH3NnM/0NaC1FACfnSS+6qy6ZZNxCaF5siIXw6ybIdAD96jB1bj/Jiva9XFDTQQ8ycsFOBF6lWkimKiWxEeXNz68kQjprQ4HYkKTSeAFFI/qz6nHxDl7X/pFRo0qSelYe2AQnXm1jY2FtksUigKkRxVQXsfHuPwPFBKr+lf5Z0qYNES/dCAjzENB9Zq2GFjQvhvXhgcuAOkNTYQApqXrPfNbZ697lK96d+vD9BSZ7tqUd3pS4CEUsi2e1Z6Vv3nD97lTuR5RRvpeeh/tILsQT5gdRL6WPwBAHxTt2kfr6dvGxECl/aKM7+g56aA+W6kD31pEjp+5UmRvhLa8qcZ6JFQS9QW1gbKcz+dxsWduTFIuVqubWltzP7zWnw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ERXY193S6l0R1QhseYNZ0VDAwgWEBWzBS7NWBL+YKGdycS3mZnGi4iOHgz2JWdYefc3oP9wKRBbY4VLkYGuvrO6v6phnN7dHD8chRKIzIz4TpYIJ+byKKYL+jk91KFHBWEd8NZZLciV8bvtHq8isZlxZLoCOECzTfXBnX3AosSN0cP75rJc/0thBm34sApoFH9kSw37ovJqSssgmmTb3Npul0hh903KHAQPC/QgmWrTRPSoM5Ao8Jij43vGfpn3MuF78XgwtZfh1mNYmY2ruqYsZvvCCF4p7eyicjEXJ42s+bJ34tNPUc/yL4mlHylc4MBB15xjBx9o392DOjAOzAF+ev9zEFkwG0roNv3drMAlpo1vHprNBsFLqdxEmMZAlywlVQgH1djGhjy0VP+hXhRjhVDr1B7PpKg1LKSs2fq53TFC7vMtAfQnu6y4R0vFv
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 14:27:27.9893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e412c67-49c2-480c-4039-08de7f7a5287
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6437
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1513C265AE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove cross-vendor support now that VMs can no longer have a different
vendor than the host.

While at it, refactor the function to exit early and skip initialising
the emulation context when FEP is not enabled.

No functional change intended.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
v4:
  * Reverted refactor of the `walk` variable assignment
  * Added ASSERT_UNREACHABLE() to the !hvm_fep path.
  * Moved the `reinject` label to the UNIMPLEMENTED case in the emulator
    result handler.
---
 xen/arch/x86/hvm/hvm.c     | 73 +++++++++++++++-----------------------
 xen/arch/x86/hvm/svm/svm.c |  3 +-
 xen/arch/x86/hvm/vmx/vmx.c |  3 +-
 3 files changed, 30 insertions(+), 49 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57a..4280acfc074 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3832,67 +3832,50 @@ int hvm_descriptor_access_intercept(uint64_t exit_info,
     return X86EMUL_OKAY;
 }
 
-static bool cf_check is_cross_vendor(
-    const struct x86_emulate_state *state, const struct x86_emulate_ctxt *ctxt)
-{
-    switch ( ctxt->opcode )
-    {
-    case X86EMUL_OPC(0x0f, 0x05): /* syscall */
-    case X86EMUL_OPC(0x0f, 0x34): /* sysenter */
-    case X86EMUL_OPC(0x0f, 0x35): /* sysexit */
-        return true;
-    }
-
-    return false;
-}
-
 void hvm_ud_intercept(struct cpu_user_regs *regs)
 {
     struct vcpu *cur = current;
-    bool should_emulate =
-        cur->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor;
     struct hvm_emulate_ctxt ctxt;
+    const struct segment_register *cs = &ctxt.seg_reg[x86_seg_cs];
+    uint32_t walk;
+    unsigned long addr;
+    char sig[5]; /* ud2; .ascii "xen" */
 
-    hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, regs);
-
-    if ( opt_hvm_fep )
+    if ( !opt_hvm_fep )
     {
-        const struct segment_register *cs = &ctxt.seg_reg[x86_seg_cs];
-        uint32_t walk = ((ctxt.seg_reg[x86_seg_ss].dpl == 3)
-                         ? PFEC_user_mode : 0) | PFEC_insn_fetch;
-        unsigned long addr;
-        char sig[5]; /* ud2; .ascii "xen" */
-
-        if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
-                                        sizeof(sig), hvm_access_insn_fetch,
-                                        cs, &addr) &&
-             (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
-                                         walk, NULL) == HVMTRANS_okay) &&
-             (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
-        {
-            regs->rip += sizeof(sig);
-            regs->eflags &= ~X86_EFLAGS_RF;
-
-            /* Zero the upper 32 bits of %rip if not in 64bit mode. */
-            if ( !(hvm_long_mode_active(cur) && cs->l) )
-                regs->rip = (uint32_t)regs->rip;
+        ASSERT_UNREACHABLE();
+        goto reinject;
+    }
 
-            add_taint(TAINT_HVM_FEP);
+    hvm_emulate_init_once(&ctxt, NULL, regs);
 
-            should_emulate = true;
-        }
-    }
+    walk = ((ctxt.seg_reg[x86_seg_ss].dpl == 3)
+            ? PFEC_user_mode : 0) | PFEC_insn_fetch;
 
-    if ( !should_emulate )
+    if ( hvm_virtual_to_linear_addr(x86_seg_cs, cs, regs->rip,
+                                    sizeof(sig), hvm_access_insn_fetch,
+                                    cs, &addr) &&
+         (hvm_copy_from_guest_linear(sig, addr, sizeof(sig),
+                                     walk, NULL) == HVMTRANS_okay) &&
+         (memcmp(sig, "\xf\xb" "xen", sizeof(sig)) == 0) )
     {
-        hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
-        return;
+        regs->rip += sizeof(sig);
+        regs->eflags &= ~X86_EFLAGS_RF;
+
+        /* Zero the upper 32 bits of %rip if not in 64bit mode. */
+        if ( !(hvm_long_mode_active(cur) && cs->l) )
+            regs->rip = (uint32_t)regs->rip;
+
+        add_taint(TAINT_HVM_FEP);
     }
+    else
+        goto reinject;
 
     switch ( hvm_emulate_one(&ctxt, VIO_no_completion) )
     {
     case X86EMUL_UNHANDLEABLE:
     case X86EMUL_UNIMPLEMENTED:
+ reinject:
         hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
         break;
     case X86EMUL_EXCEPTION:
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 243c41fb13a..20591c4a44f 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -589,8 +589,7 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     u32 bitmap = vmcb_get_exception_intercepts(vmcb);
 
-    if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+    if ( opt_hvm_fep )
         bitmap |= (1U << X86_EXC_UD);
     else
         bitmap &= ~(1U << X86_EXC_UD);
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 82c55f49aea..eda99e268d1 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -803,8 +803,7 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
     const struct cpu_policy *cp = v->domain->arch.cpu_policy;
     int rc = 0;
 
-    if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+    if ( opt_hvm_fep )
         v->arch.hvm.vmx.exception_bitmap |= (1U << X86_EXC_UD);
     else
         v->arch.hvm.vmx.exception_bitmap &= ~(1U << X86_EXC_UD);
-- 
2.43.0


