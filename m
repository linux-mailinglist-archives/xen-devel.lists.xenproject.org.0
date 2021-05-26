Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF7139183D
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 14:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132487.247108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llt7t-0002fq-9N; Wed, 26 May 2021 12:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132487.247108; Wed, 26 May 2021 12:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llt7t-0002dC-6C; Wed, 26 May 2021 12:59:09 +0000
Received: by outflank-mailman (input) for mailman id 132487;
 Wed, 26 May 2021 12:59:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1llt7r-0002d6-Od
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 12:59:07 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d95842c-955c-406e-9398-81d2508af71c;
 Wed, 26 May 2021 12:59:06 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by smtp-out2.suse.de (Postfix) with ESMTP id 378841FD29;
 Wed, 26 May 2021 12:59:05 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 1445111A98;
 Wed, 26 May 2021 12:59:05 +0000 (UTC)
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
X-Inumbo-ID: 8d95842c-955c-406e-9398-81d2508af71c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622033945; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jwQbCnoo88KOyKF0JjLRzmmEZgGZkhuakgk/vH3ZXoI=;
	b=bLiabYByA7DFE4/6NIgc86DpE4LdM41qd06Gqj7y8gU5nI6y5lUB87gdnwj4RMgfGwrroV
	cI7YkZ5Cd9QA85lWMVl0GRNldD4SOJ/rSbTFS08jEiLwOaSn1OxrL/Wei8r5YNxAXAKTD0
	0vT7oc7pF92JdoPsN+smz8+mB7PWS+c=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Olaf Hering <olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/AMD: expose SYSCFG, TOM, and TOM2 to Dom0
Message-ID: <c5764274-1257-809e-a2a7-d87b9d0fe675@suse.com>
Date: Wed, 26 May 2021 14:59:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Sufficiently old Linux (3.12-ish) accesses these MSRs in an unguarded
manner. Furthermore these MSRs, at least on Fam11 and older CPUs, are
also consulted by modern Linux, and their (bogus) built-in zapping of
#GP faults from MSR accesses leads to it effectively reading zero
instead of the intended values, which are relevant for PCI BAR placement
(which ought to all live in MMIO-type space, not in DRAM-type one).

For SYSCFG, only certain bits get exposed. In fact, whether to expose
MtrrVarDramEn is debatable: It controls use of not just TOM, but also
the IORRs. Introduce (consistently named) constants for the bits we're
interested in and use them in pre-existing code as well.

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
@@ -339,6 +339,19 @@ int guest_rdmsr(struct vcpu *v, uint32_t
         *val = msrs->tsc_aux;
         break;
 
+    case MSR_K8_SYSCFG:
+    case MSR_K8_TOP_MEM1:
+    case MSR_K8_TOP_MEM2:
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
@@ -116,6 +116,13 @@
 #define  PASID_PASID_MASK                   0x000fffff
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
+#define MSR_K8_SYSCFG                       0xc0010010
+#define  SYSCFG_MTRR_FIX_DRAM_EN            (_AC(1, ULL) << 18)
+#define  SYSCFG_MTRR_FIX_DRAM_MOD_EN        (_AC(1, ULL) << 19)
+#define  SYSCFG_MTRR_VAR_DRAM_EN            (_AC(1, ULL) << 20)
+#define  SYSCFG_MTRR_TOM2_EN                (_AC(1, ULL) << 21)
+#define  SYSCFG_TOM2_FORCE_WB               (_AC(1, ULL) << 22)
+
 #define MSR_K8_VM_CR                        0xc0010114
 #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)
 #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
@@ -279,10 +286,7 @@
 #define MSR_K8_TOP_MEM1			0xc001001a
 #define MSR_K7_CLK_CTL			0xc001001b
 #define MSR_K8_TOP_MEM2			0xc001001d
-#define MSR_K8_SYSCFG			0xc0010010
 
-#define K8_MTRRFIXRANGE_DRAM_ENABLE	0x00040000 /* MtrrFixDramEn bit    */
-#define K8_MTRRFIXRANGE_DRAM_MODIFY	0x00080000 /* MtrrFixDramModEn bit */
 #define K8_MTRR_RDMEM_WRMEM_MASK	0x18181818 /* Mask: RdMem|WrMem    */
 
 #define MSR_K7_HWCR			0xc0010015

