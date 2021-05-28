Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC39393D60
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 08:57:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133782.249226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmWQY-0000ho-BL; Fri, 28 May 2021 06:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133782.249226; Fri, 28 May 2021 06:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmWQY-0000fM-73; Fri, 28 May 2021 06:57:02 +0000
Received: by outflank-mailman (input) for mailman id 133782;
 Fri, 28 May 2021 06:57:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wdiM=KX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmWQW-0000fE-Pa
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 06:57:00 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7041c680-dd6b-41aa-ac9c-1065f0187103;
 Fri, 28 May 2021 06:56:59 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 762E91FD2F;
 Fri, 28 May 2021 06:56:58 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 57F0611A98;
 Fri, 28 May 2021 06:56:58 +0000 (UTC)
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
X-Inumbo-ID: 7041c680-dd6b-41aa-ac9c-1065f0187103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622185018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FVRc2ayGAxL2f+DfsGuwiPUo2MOa0/B/xTB2k4DtwXQ=;
	b=I1Pb6sLBAGJ4Lf8nCplvGEnD3NwP8YBcMrz0z57f17xwr1nkj3WcWigkRDbhl5O47q2I1l
	P12QbqprWN2xCmAiF9XP/cDeKybhyvpNYIIz1YAQ/iiKoFN3eG7Y4/mySImKxr/lx+so7f
	5x54SuSPg+etT4QD+JyZfuECgVnqMKU=
Subject: [PATCH v2 1/2] x86/AMD: expose SYSCFG, TOM, TOM2, and IORRs to Dom0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ebc58213-f68a-e060-83f5-c9c89a87f074@suse.com>
Message-ID: <c6952f53-aecb-542d-94a5-a1547dd4d6c4@suse.com>
Date: Fri, 28 May 2021 08:56:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <ebc58213-f68a-e060-83f5-c9c89a87f074@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sufficiently old Linux (3.12-ish) accesses these MSRs (with the
exception of IORRs) in an unguarded manner. Furthermore these same MSRs,
at least on Fam11 and older CPUs, are also consulted by modern Linux,
and their (bogus) built-in zapping of #GP faults from MSR accesses leads
to it effectively reading zero instead of the intended values, which are
relevant for PCI BAR placement (which ought to all live in MMIO-type
space, not in DRAM-type one).

For SYSCFG, only certain bits get exposed. Since MtrrVarDramEn also
covers the IORRs, expose them as well. Introduce (consistently named)
constants for the bits we're interested in and use them in pre-existing
code as well. While there also drop the unused and somewhat questionable
K8_MTRR_RDMEM_WRMEM_MASK. To complete the set of memory type and DRAM vs
MMIO controlling MSRs, also expose TSEG_{BASE,MASK} (the former also
gets read by Linux, dealing with which was already the subject of
6eef0a99262c ["x86/PV: conditionally avoid raising #GP for early guest
MSR reads"]).

As a welcome side effect, verbosity on/of debug builds gets (perhaps
significantly) reduced.

Note that at least as far as those MSR accesses by Linux are concerned,
there's no similar issue for DomU-s, as the accesses sit behind PCI
device matching logic. The checked for devices would never be exposed to
DomU-s in the first place. Nevertheless I think that at least for HVM we
should return sensible values, not 0 (as svm_msr_read_intercept() does
right now). The intended values may, however, need to be determined by
hvmloader, and then get made known to Xen.

Fixes: 322ec7c89f66 ("x86/pv: disallow access to unknown MSRs")
Reported-by: Olaf Hering <olaf@aepfle.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Also permit IORRs and their TSEG counterparts to be read. Drop
    K8_MTRR_RDMEM_WRMEM_MASK.
---
TBD: For PVH, we might grant Dom0 direct read access to the MSR (maybe
     except SYSCFG).

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -468,14 +468,14 @@ static void check_syscfg_dram_mod_en(voi
 		return;
 
 	rdmsrl(MSR_K8_SYSCFG, syscfg);
-	if (!(syscfg & K8_MTRRFIXRANGE_DRAM_MODIFY))
+	if (!(syscfg & SYSCFG_MTRR_FIX_DRAM_MOD_EN))
 		return;
 
 	if (!test_and_set_bool(printed))
 		printk(KERN_ERR "MTRR: SYSCFG[MtrrFixDramModEn] not "
 			"cleared by BIOS, clearing this bit\n");
 
-	syscfg &= ~K8_MTRRFIXRANGE_DRAM_MODIFY;
+	syscfg &= ~SYSCFG_MTRR_FIX_DRAM_MOD_EN;
 	wrmsrl(MSR_K8_SYSCFG, syscfg);
 }
 
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -224,7 +224,7 @@ static void __init print_mtrr_state(cons
 		uint64_t syscfg, tom2;
 
 		rdmsrl(MSR_K8_SYSCFG, syscfg);
-		if (syscfg & (1 << 21)) {
+		if (syscfg & SYSCFG_MTRR_TOM2_EN) {
 			rdmsrl(MSR_K8_TOP_MEM2, tom2);
 			printk("%sTOM2: %012"PRIx64"%s\n", level, tom2,
 			       syscfg & (1 << 22) ? " (WB)" : "");
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -339,6 +339,25 @@ int guest_rdmsr(struct vcpu *v, uint32_t
         *val = msrs->tsc_aux;
         break;
 
+    case MSR_K8_SYSCFG:
+    case MSR_K8_TOP_MEM1:
+    case MSR_K8_TOP_MEM2:
+    case MSR_K8_IORR_BASE0:
+    case MSR_K8_IORR_MASK0:
+    case MSR_K8_IORR_BASE1:
+    case MSR_K8_IORR_MASK1:
+    case MSR_K8_TSEG_BASE:
+    case MSR_K8_TSEG_MASK:
+        if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
+            goto gp_fault;
+        if ( !is_hardware_domain(d) )
+            return X86EMUL_UNHANDLEABLE;
+        rdmsrl(msr, *val);
+        if ( msr == MSR_K8_SYSCFG )
+            *val &= (SYSCFG_TOM2_FORCE_WB | SYSCFG_MTRR_TOM2_EN |
+                     SYSCFG_MTRR_VAR_DRAM_EN | SYSCFG_MTRR_FIX_DRAM_EN);
+        break;
+
     case MSR_K8_HWCR:
         if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
             goto gp_fault;
--- a/xen/arch/x86/x86_64/mmconf-fam10h.c
+++ b/xen/arch/x86/x86_64/mmconf-fam10h.c
@@ -69,7 +69,7 @@ static void __init get_fam10h_pci_mmconf
 	rdmsrl(address, val);
 
 	/* TOP_MEM2 is not enabled? */
-	if (!(val & (1<<21))) {
+	if (!(val & SYSCFG_MTRR_TOM2_EN)) {
 		tom2 = 1ULL << 32;
 	} else {
 		/* TOP_MEM2 */
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -116,6 +116,21 @@
 #define  PASID_PASID_MASK                   0x000fffff
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
+#define MSR_K8_SYSCFG                       0xc0010010
+#define  SYSCFG_MTRR_FIX_DRAM_EN            (_AC(1, ULL) << 18)
+#define  SYSCFG_MTRR_FIX_DRAM_MOD_EN        (_AC(1, ULL) << 19)
+#define  SYSCFG_MTRR_VAR_DRAM_EN            (_AC(1, ULL) << 20)
+#define  SYSCFG_MTRR_TOM2_EN                (_AC(1, ULL) << 21)
+#define  SYSCFG_TOM2_FORCE_WB               (_AC(1, ULL) << 22)
+
+#define MSR_K8_IORR_BASE0                   0xc0010016
+#define MSR_K8_IORR_MASK0                   0xc0010017
+#define MSR_K8_IORR_BASE1                   0xc0010018
+#define MSR_K8_IORR_MASK1                   0xc0010019
+
+#define MSR_K8_TSEG_BASE                    0xc0010112 /* AMD doc: SMMAddr */
+#define MSR_K8_TSEG_MASK                    0xc0010113 /* AMD doc: SMMMask */
+
 #define MSR_K8_VM_CR                        0xc0010114
 #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)
 #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
@@ -279,11 +294,6 @@
 #define MSR_K8_TOP_MEM1			0xc001001a
 #define MSR_K7_CLK_CTL			0xc001001b
 #define MSR_K8_TOP_MEM2			0xc001001d
-#define MSR_K8_SYSCFG			0xc0010010
-
-#define K8_MTRRFIXRANGE_DRAM_ENABLE	0x00040000 /* MtrrFixDramEn bit    */
-#define K8_MTRRFIXRANGE_DRAM_MODIFY	0x00080000 /* MtrrFixDramModEn bit */
-#define K8_MTRR_RDMEM_WRMEM_MASK	0x18181818 /* Mask: RdMem|WrMem    */
 
 #define MSR_K7_HWCR			0xc0010015
 #define MSR_K8_HWCR			0xc0010015


