Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3A76EC7C8
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 10:21:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525208.816266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrRp-0003F2-DS; Mon, 24 Apr 2023 08:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525208.816266; Mon, 24 Apr 2023 08:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrRp-0003CR-AA; Mon, 24 Apr 2023 08:21:21 +0000
Received: by outflank-mailman (input) for mailman id 525208;
 Mon, 24 Apr 2023 08:21:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8QOl=AP=amd.com=Xenia.Ragiadakou@srs-se1.protection.inumbo.net>)
 id 1pqrRn-0003By-Qf
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 08:21:19 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbd993db-e278-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 10:21:17 +0200 (CEST)
Received: from BN8PR04CA0041.namprd04.prod.outlook.com (2603:10b6:408:d4::15)
 by DM6PR12MB4927.namprd12.prod.outlook.com (2603:10b6:5:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 24 Apr
 2023 08:21:14 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::ec) by BN8PR04CA0041.outlook.office365.com
 (2603:10b6:408:d4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 08:21:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 08:21:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 03:21:13 -0500
Received: from 10.0.2.15 (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 24 Apr 2023 03:21:11 -0500
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
X-Inumbo-ID: fbd993db-e278-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZipKmYEDaWvtt/tucRuUwLiBzI025dBtpTsrwXikUSP5avmUe4hKJzs1G2LldqXap6XO9ZeqMiO1OwzonNaNXx5c/fX4JHS+Smg1qm+j+ZxQLUNDxm17WjwXZFXMlcRn7DSqgBEgF+u7tIw9uklx+7jum+8ef88lMXtFozD6UJRLr2suxM0fBhYbklllDpIdc/5koNc/CiuwpbbpDe5tu+ui8eOqvCuG2pTIJpyUpjt3xXtQ+2D+kTGM9TKSubkUPx+42vlYW9Rft7adYtvAeH7bo67asfESQaxvgcHgCYYsbxPE05TFwKSWjNlQuSAXaYNOtMuRqnupTjmNy39Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWb82N2r/vIWJiXtFNEFWs/ZcXzW3uEgMOIb6Mqkk14=;
 b=e1RCL6otz0kmLETyVCNUj3QS6YSYU1Ohk0SblkS/M1n8AQ7xBt3leEaxPil/okBC1EATWo1xAZEuc9ZlxDqYP62SBxhG/rOPPOw/ljhzVBoVHLHTOfRcUVxlqBRKUVkOpDMfNagFWPGt/S1e6Y5XjzSzwUsxzatJFZicnYWwwlHpgIcoi5h4tvWvWzJ7Qawj/SexIDQijRipYBsmc9BHm6zfk8e1U7Q2rqOF3zMMaWv/XS1zb/La+aamlTpE61Yyn4EGQTggS6M8VArB6zmtlj/VpBSb1poeA+3e09D+hh23wwiFRnH6hQ3jWCrODj7uWq1ticKgBz6d2JRmPlUXzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWb82N2r/vIWJiXtFNEFWs/ZcXzW3uEgMOIb6Mqkk14=;
 b=Wtd0XFnLQxCFgDwNmNRjH5XVBmBmyfNkTEP/oHOj912BDcOOvb8FvMrDH23w+to1qCzY5LLe00FjcGSWO+29G/1LZeckpIBGYxUU3mPeHvo3sBAoQPKhVPA0Bd0hezuKon841tdP2I607nIlEhOg20a4vGlWwHDLAYycwYG0AVQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 1/3] x86/svm: split svm_intercept_msr() into svm_{set,clear}_msr_intercept()
Date: Mon, 24 Apr 2023 11:20:36 +0300
Message-ID: <20230424082038.541122-2-xenia.ragiadakou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230424082038.541122-1-xenia.ragiadakou@amd.com>
References: <20230424082038.541122-1-xenia.ragiadakou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|DM6PR12MB4927:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d336e64-144f-4b06-daba-08db449cde7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R9mfFcbaNDyE1ILb8hPrTj0VzsfYHmpky3OVp0aSVfdJ+PQzoPcybJlOD4qCx/8iKQEgEnDSUPjQIpHezYfnzi0ibX7MvXA/yhmBLj2A8vs6zvJTtEsJ0cm+thLKv+zVAgEKtCzY/56N2m7CD2vpUk0FNTSahRkNTLCJLjmfRl+jj3uQtkH6KGJ8efBSGO6sy2XG03j8bnWHQagEjBnrNr66XWS04skNjw3WoUeNHPucUe7fsnizwe7WkgSlUoXxYBqZnJLVkBWDN0ZYzM1ckxDeHskf939PmXdADzlI1B9xzWQ8IYPoGnduTfSzAJuKm7TpA6CkmVB6DY9FwRY5H7Z12mvOEfqLCclYhCfGYruOE4L9jG0nmJNNH2qTYqLyabkAl+kiEcBH3b0epJGFSWA8HT1sTwkdtPj+Rq2xnzACSLOMjpnRfblu0jlhz9bwCTjF6fAfSU4giZ41l1g9BKt8PNsmHWmbLCm6C6/AhCxV4BQhmTYwo/FyMlWNndv7cy+zAlyze+3th4jMsXHn/PgrVeJsZCF3HqdFLimTIuDEm0QLyf2W9q/MoNk/TB6r/9iFrunT0wdwrGTxpkcwYvRM3M6hwkj6751B+bpQop2LmORyvHQL7noxWRQ/ohUCRT5g65vaVgNwJMMkB10cnPV8J5yht4v45EEizQCjsKNzABkKBjHsM54b6iX6QnX7ty30xCoUjEsZYynL8VGUW859eyn+kHMn+ixWhGNLv04=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(36756003)(8936002)(81166007)(66899021)(8676002)(40460700003)(5660300002)(44832011)(2906002)(82310400005)(86362001)(336012)(1076003)(70206006)(40480700001)(478600001)(6666004)(54906003)(16576012)(186003)(70586007)(2616005)(36860700001)(82740400003)(356005)(316002)(83380400001)(6916009)(4326008)(47076005)(41300700001)(426003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 08:21:13.9896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d336e64-144f-4b06-daba-08db449cde7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4927

This change aims to render the control interface of MSR intercepts identical
between SVM and VMX code, so that the control of the MSR intercept in common
code can be done through an hvm_funcs callback.

Create two new functions:
- svm_set_msr_intercept(), enables interception of read/write accesses to the
  corresponding MSR, by setting the corresponding read/write bits in the MSRPM
  based on the flags
- svm_clear_msr_intercept(), disables interception of read/write accesses to
  the corresponding MSR, by clearing the corresponding read/write bits in the
  MSRPM based on the flags

More specifically:
- if flag is MSR_R, the functions {set,clear} the MSRPM bit that controls read
  access to the MSR
- if flag is MSR_W, the functions {set,clear} the MSRPM bit that controls write
  access to the MSR
- if flag is MSR_RW, the functions {set,clear} both MSRPM bits

Place the definitions of the flags in asm/hvm/hvm.h because there is the
intention to be used by VMX code as well.

Remove svm_intercept_msr() and MSR_INTERCEPT_* definitions, and use the new
functions and flags instead.

The macros svm_{en,dis}able_intercept_for_msr() will be retained for now but
they will be eventually open-coded with a follow-up patch, because only one
of them is actually used, and because the meaning of "enabling/disabling"
msr intercepts is not consistent through the code(for instance the hvm_func
enable_msr_interception() sets only the write MSRPM bit, not both).
In the meantime, take the opportunity to remove excess parentheses.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
---

Changes in v2:
  - restore BUG_ON(), reported by Jan
  - coding style fixes, reported by Jan
  - remove excess parentheses from macros, suggested by Jan
  - change from int to unsigned int the type of param flags, reported by Jan
  - change from uint32_t to unsigned int the type of param msr, reported by Jan

 xen/arch/x86/cpu/vpmu_amd.c             |  9 +--
 xen/arch/x86/hvm/svm/svm.c              | 74 ++++++++++++++++---------
 xen/arch/x86/include/asm/hvm/hvm.h      |  4 ++
 xen/arch/x86/include/asm/hvm/svm/vmcb.h | 15 ++---
 4 files changed, 64 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 18266b9521..da8e906972 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -154,8 +154,9 @@ static void amd_vpmu_set_msr_bitmap(struct vcpu *v)
 
     for ( i = 0; i < num_counters; i++ )
     {
-        svm_intercept_msr(v, counters[i], MSR_INTERCEPT_NONE);
-        svm_intercept_msr(v, ctrls[i], MSR_INTERCEPT_WRITE);
+        svm_clear_msr_intercept(v, counters[i], MSR_RW);
+        svm_set_msr_intercept(v, ctrls[i], MSR_W);
+        svm_clear_msr_intercept(v, ctrls[i], MSR_R);
     }
 
     msr_bitmap_on(vpmu);
@@ -168,8 +169,8 @@ static void amd_vpmu_unset_msr_bitmap(struct vcpu *v)
 
     for ( i = 0; i < num_counters; i++ )
     {
-        svm_intercept_msr(v, counters[i], MSR_INTERCEPT_RW);
-        svm_intercept_msr(v, ctrls[i], MSR_INTERCEPT_RW);
+        svm_set_msr_intercept(v, counters[i], MSR_RW);
+        svm_set_msr_intercept(v, ctrls[i], MSR_RW);
     }
 
     msr_bitmap_off(vpmu);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 59a6e88dff..3ee0805ff3 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -277,23 +277,33 @@ svm_msrbit(unsigned long *msr_bitmap, uint32_t msr)
     return msr_bit;
 }
 
-void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
+void svm_set_msr_intercept(struct vcpu *v, unsigned int msr, unsigned int flags)
 {
-    unsigned long *msr_bit;
-    const struct domain *d = v->domain;
+    unsigned long *msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
 
-    msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
     BUG_ON(msr_bit == NULL);
+
     msr &= 0x1fff;
 
-    if ( flags & MSR_INTERCEPT_READ )
+    if ( flags & MSR_R )
          __set_bit(msr * 2, msr_bit);
-    else if ( !monitored_msr(d, msr) )
-         __clear_bit(msr * 2, msr_bit);
-
-    if ( flags & MSR_INTERCEPT_WRITE )
+    if ( flags & MSR_W )
         __set_bit(msr * 2 + 1, msr_bit);
-    else if ( !monitored_msr(d, msr) )
+}
+
+void svm_clear_msr_intercept(struct vcpu *v, unsigned int msr,
+                             unsigned int flags)
+{
+    unsigned long *msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
+
+    BUG_ON(msr_bit == NULL);
+
+    if ( monitored_msr(v->domain, msr) )
+        return;
+
+    if ( flags & MSR_R )
+        __clear_bit(msr * 2, msr_bit);
+    if ( flags & MSR_W )
         __clear_bit(msr * 2 + 1, msr_bit);
 }
 
@@ -302,7 +312,10 @@ static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
     struct vcpu *v;
 
     for_each_vcpu ( d, v )
-        svm_intercept_msr(v, msr, MSR_INTERCEPT_WRITE);
+    {
+        svm_set_msr_intercept(v, msr, MSR_W);
+        svm_clear_msr_intercept(v, msr, MSR_R);
+    }
 }
 
 static void svm_save_dr(struct vcpu *v)
@@ -319,10 +332,10 @@ static void svm_save_dr(struct vcpu *v)
 
     if ( v->domain->arch.cpuid->extd.dbext )
     {
-        svm_intercept_msr(v, MSR_AMD64_DR0_ADDRESS_MASK, MSR_INTERCEPT_RW);
-        svm_intercept_msr(v, MSR_AMD64_DR1_ADDRESS_MASK, MSR_INTERCEPT_RW);
-        svm_intercept_msr(v, MSR_AMD64_DR2_ADDRESS_MASK, MSR_INTERCEPT_RW);
-        svm_intercept_msr(v, MSR_AMD64_DR3_ADDRESS_MASK, MSR_INTERCEPT_RW);
+        svm_set_msr_intercept(v, MSR_AMD64_DR0_ADDRESS_MASK, MSR_RW);
+        svm_set_msr_intercept(v, MSR_AMD64_DR1_ADDRESS_MASK, MSR_RW);
+        svm_set_msr_intercept(v, MSR_AMD64_DR2_ADDRESS_MASK, MSR_RW);
+        svm_set_msr_intercept(v, MSR_AMD64_DR3_ADDRESS_MASK, MSR_RW);
 
         rdmsrl(MSR_AMD64_DR0_ADDRESS_MASK, v->arch.msrs->dr_mask[0]);
         rdmsrl(MSR_AMD64_DR1_ADDRESS_MASK, v->arch.msrs->dr_mask[1]);
@@ -350,10 +363,10 @@ static void __restore_debug_registers(struct vmcb_struct *vmcb, struct vcpu *v)
 
     if ( v->domain->arch.cpuid->extd.dbext )
     {
-        svm_intercept_msr(v, MSR_AMD64_DR0_ADDRESS_MASK, MSR_INTERCEPT_NONE);
-        svm_intercept_msr(v, MSR_AMD64_DR1_ADDRESS_MASK, MSR_INTERCEPT_NONE);
-        svm_intercept_msr(v, MSR_AMD64_DR2_ADDRESS_MASK, MSR_INTERCEPT_NONE);
-        svm_intercept_msr(v, MSR_AMD64_DR3_ADDRESS_MASK, MSR_INTERCEPT_NONE);
+        svm_clear_msr_intercept(v, MSR_AMD64_DR0_ADDRESS_MASK, MSR_RW);
+        svm_clear_msr_intercept(v, MSR_AMD64_DR1_ADDRESS_MASK, MSR_RW);
+        svm_clear_msr_intercept(v, MSR_AMD64_DR2_ADDRESS_MASK, MSR_RW);
+        svm_clear_msr_intercept(v, MSR_AMD64_DR3_ADDRESS_MASK, MSR_RW);
 
         wrmsrl(MSR_AMD64_DR0_ADDRESS_MASK, v->arch.msrs->dr_mask[0]);
         wrmsrl(MSR_AMD64_DR1_ADDRESS_MASK, v->arch.msrs->dr_mask[1]);
@@ -584,22 +597,29 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     vmcb_set_exception_intercepts(vmcb, bitmap);
 
     /* Give access to MSR_SPEC_CTRL if the guest has been told about it. */
-    svm_intercept_msr(v, MSR_SPEC_CTRL,
-                      cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
+    if ( cp->extd.ibrs )
+        svm_clear_msr_intercept(v, MSR_SPEC_CTRL, MSR_RW);
+    else
+        svm_set_msr_intercept(v, MSR_SPEC_CTRL, MSR_RW);
 
     /*
      * Always trap write accesses to VIRT_SPEC_CTRL in order to cache the guest
      * setting and avoid having to perform a rdmsr on vmexit to get the guest
      * setting even if VIRT_SSBD is offered to Xen itself.
      */
-    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
-                      cp->extd.virt_ssbd && cpu_has_virt_ssbd &&
-                      !cpu_has_amd_ssbd ?
-                      MSR_INTERCEPT_WRITE : MSR_INTERCEPT_RW);
+    if ( cp->extd.virt_ssbd && cpu_has_virt_ssbd && !cpu_has_amd_ssbd )
+    {
+        svm_set_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_W);
+        svm_clear_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_R);
+    }
+    else
+        svm_set_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_RW);
 
     /* Give access to MSR_PRED_CMD if the guest has been told about it. */
-    svm_intercept_msr(v, MSR_PRED_CMD,
-                      cp->extd.ibpb ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
+    if ( cp->extd.ibpb )
+        svm_clear_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_RW);
+    else
+        svm_set_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_RW);
 }
 
 void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state)
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 04cbd4ff24..5740a64281 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -250,6 +250,10 @@ extern struct hvm_function_table hvm_funcs;
 extern bool_t hvm_enabled;
 extern s8 hvm_port80_allowed;
 
+#define MSR_R       BIT(0, U)
+#define MSR_W       BIT(1, U)
+#define MSR_RW      (MSR_W | MSR_R)
+
 extern const struct hvm_function_table *start_svm(void);
 extern const struct hvm_function_table *start_vmx(void);
 
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index a1a8a7fd25..94deb0a236 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -603,13 +603,14 @@ void svm_destroy_vmcb(struct vcpu *v);
 
 void setup_vmcb_dump(void);
 
-#define MSR_INTERCEPT_NONE    0
-#define MSR_INTERCEPT_READ    1
-#define MSR_INTERCEPT_WRITE   2
-#define MSR_INTERCEPT_RW      (MSR_INTERCEPT_WRITE | MSR_INTERCEPT_READ)
-void svm_intercept_msr(struct vcpu *v, uint32_t msr, int enable);
-#define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
-#define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
+void svm_set_msr_intercept(struct vcpu *v, unsigned int msr,
+                           unsigned int flags);
+void svm_clear_msr_intercept(struct vcpu *v, unsigned int msr,
+                             unsigned int flags);
+#define svm_disable_intercept_for_msr(v, msr) \
+    svm_clear_msr_intercept(v, msr, MSR_RW)
+#define svm_enable_intercept_for_msr(v, msr) \
+    svm_set_intercept_msr(v, msr, MSR_RW)
 
 /*
  * VMCB accessor functions.
-- 
2.34.1


