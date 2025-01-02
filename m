Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D889FF715
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 09:46:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863738.1275182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGq0-00073W-T5; Thu, 02 Jan 2025 08:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863738.1275182; Thu, 02 Jan 2025 08:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTGq0-0006yI-MN; Thu, 02 Jan 2025 08:45:52 +0000
Received: by outflank-mailman (input) for mailman id 863738;
 Thu, 02 Jan 2025 08:45:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aw1p=T2=bounce.vates.tech=bounce-md_30504962.67765234.v1-90040212465a4a738ee55cacd36524b5@srs-se1.protection.inumbo.net>)
 id 1tTGpy-0004rS-Uf
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 08:45:50 +0000
Received: from mail180-50.suw31.mandrillapp.com
 (mail180-50.suw31.mandrillapp.com [198.2.180.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6180e64-c8e5-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 09:45:47 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-50.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4YP0fF0HDGzCf9PP7
 for <xen-devel@lists.xenproject.org>; Thu,  2 Jan 2025 08:45:41 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 90040212465a4a738ee55cacd36524b5; Thu, 02 Jan 2025 08:45:41 +0000
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
X-Inumbo-ID: f6180e64-c8e5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1735807541; x=1736068041;
	bh=TpWqF+7FFQ/hg2SGplPXaNKTXRGvQnA48A/EDvktoFg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wZggbVYg/0D2l7QYN02MOgR+27vLGOqgHk9ISz2Iroxf9JE31GrQS6PkvY8ZsFMNB
	 xicMvz7ofdHZR/srTQRrHMmMp4xgEJOpLbyuNlHCoT3tHBDNDaIFeei6IzcOLjaQJ2
	 hjq08RoeD0Rl1D/p3XyLhXeVXch6pquZD7nqDAhUPEpJf37fvPDlQcigSffPqAFIDV
	 GymYotau6IfIdlh2W3xg6RAF4Mc1pIDkf1FVtWmsU1acoMQQd8pAcjOs3dCLwwYbi9
	 dR2ef/aAbMt3UOstha+F5ezga3Dr+/GDNExeQeUwX8NiSi1isGwRLwSCsMkTVgj+Y5
	 EIopVjjhQsidw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1735807541; x=1736068041; i=ngoc-tu.dinh@vates.tech;
	bh=TpWqF+7FFQ/hg2SGplPXaNKTXRGvQnA48A/EDvktoFg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Hn3NVoe1PhkrToobEUFCMSDliQow30HntEDnILD8wUomW/r1LuP7eFIHor5R/Tqok
	 8pzaAqs/uICRumoYKyo7dutEciIN/RkC1xPPjhPppKiDcsDZGkHOAoYTeCPwIzuxHU
	 5BF1KDf35bywQWK7oQY4t9lFuoZOSF0tM4L8k45HIHq7MfNrmUmf+eWSCONPXi11YL
	 DRq8NXmjpcs3wpDLCX+oKuZS68XF3SzGASf6gT4eOde52Ai1CVZRv3dVsOAfmxV4UC
	 TFgUpq+w5eRn1o60yXZYZtpuvyAtqBCJtS40nl11CylMTubfDoBv/22Tihr+5oha3f
	 oc3pi+tABpkLQ==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=2006/10]=20x86:=20Enable=20XSTATE=20save/restore=20for=20arch=20LBR?=
X-Mailer: git-send-email 2.43.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1735807540083
To: xen-devel@lists.xenproject.org
Cc: "Tu Dinh" <ngoc-tu.dinh@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <20250102084413.102-7-ngoc-tu.dinh@vates.tech>
In-Reply-To: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.90040212465a4a738ee55cacd36524b5?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250102:md
Date: Thu, 02 Jan 2025 08:45:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Add a function get_xstate_component_comp() to allow fetching a specific
XSTATE component from a compressed image.

Also add LBR state declarations in xstate.h.

Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
---
 xen/arch/x86/include/asm/xstate.h | 22 ++++++++-
 xen/arch/x86/msr.c                |  3 +-
 xen/arch/x86/xstate.c             | 79 +++++++++++++++++++++++--------
 3 files changed, 79 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 07017cc4ed..cc77f599d7 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -33,13 +33,13 @@ extern uint32_t mxcsr_mask;
 #define XSTATE_FP_SSE  (X86_XCR0_X87 | X86_XCR0_SSE)
 #define XCNTXT_MASK    (X86_XCR0_X87 | X86_XCR0_SSE | X86_XCR0_YMM | \
                         X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM | \
-                        XSTATE_NONLAZY)
+                        XSTATE_NONLAZY | XSTATE_XSAVES_ONLY)
 
 #define XSTATE_ALL     (~(1ULL << 63))
 #define XSTATE_NONLAZY (X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | X86_XCR0_PKRU | \
                         X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA)
 #define XSTATE_LAZY    (XSTATE_ALL & ~XSTATE_NONLAZY)
-#define XSTATE_XSAVES_ONLY         0
+#define XSTATE_XSAVES_ONLY         (X86_XSS_LBR)
 #define XSTATE_COMPACTION_ENABLED  (1ULL << 63)
 
 #define XSTATE_XSS     (1U << 0)
@@ -91,6 +91,21 @@ struct xstate_bndcsr {
     uint64_t bndstatus;
 };
 
+struct xstate_lbr_entry {
+    uint64_t lbr_from_ip;
+    uint64_t lbr_to_ip;
+    uint64_t lbr_info;
+};
+
+struct xstate_lbr {
+	uint64_t lbr_ctl;
+	uint64_t lbr_depth;
+	uint64_t ler_from_ip;
+	uint64_t ler_to_ip;
+	uint64_t ler_info;
+	struct xstate_lbr_entry entries[32];
+};
+
 /* extended state operations */
 bool __must_check set_xcr0(u64 xfeatures);
 uint64_t get_xcr0(void);
@@ -114,6 +129,9 @@ int xstate_alloc_save_area(struct vcpu *v);
 void xstate_init(struct cpuinfo_x86 *c);
 unsigned int xstate_uncompressed_size(uint64_t xcr0);
 unsigned int xstate_compressed_size(uint64_t xstates);
+void *get_xstate_component_comp(struct xsave_struct *xstate,
+                                unsigned int size,
+                                uint64_t component);
 
 static inline uint64_t xgetbv(unsigned int index)
 {
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 289cf10b78..68a419ac8e 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -522,8 +522,7 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         if ( !cp->xstate.xsaves )
             goto gp_fault;
 
-        /* No XSS features currently supported for guests */
-        if ( val != 0 )
+        if ( val & ~(uint64_t)XSTATE_XSAVES_ONLY )
             goto gp_fault;
 
         msrs->xss.raw = val;
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index baae8e1a13..607bf9c8a5 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -18,13 +18,16 @@
 #include <asm/asm_defns.h>
 
 /*
- * Maximum size (in byte) of the XSAVE/XRSTOR save area required by all
+ * Maximum size (in byte) of the XSAVE(S)/XRSTOR(S) save area required by all
  * the supported and enabled features on the processor, including the
  * XSAVE.HEADER. We only enable XCNTXT_MASK that we have known.
  */
 static u32 __read_mostly xsave_cntxt_size;
 
-/* A 64-bit bitmask of the XSAVE/XRSTOR features supported by processor. */
+/*
+ * A 64-bit bitmask of the XSAVE(S)/XRSTOR(S) features supported by
+ * processor.
+ */
 u64 __read_mostly xfeature_mask;
 
 unsigned int *__read_mostly xstate_offsets;
@@ -126,7 +129,8 @@ static int setup_xstate_features(bool bsp)
             cpuid_count(XSTATE_CPUID, leaf, &eax,
                         &ebx, &ecx, &edx);
             BUG_ON(eax != xstate_sizes[leaf]);
-            BUG_ON(ebx != xstate_offsets[leaf]);
+            if ( (1ul << leaf) & X86_XCR0_STATES )
+                BUG_ON(ebx != xstate_offsets[leaf]);
             BUG_ON(!(ecx & XSTATE_ALIGN64) != !test_bit(leaf, &xstate_align));
         }
     }
@@ -210,7 +214,7 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
      * non-compacted offset.
      */
     src = xstate;
-    valid = xstate_bv & ~XSTATE_FP_SSE;
+    valid = xstate_bv & ~XSTATE_FP_SSE & ~X86_XSS_STATES;
     while ( valid )
     {
         u64 feature = valid & -valid;
@@ -276,7 +280,7 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
      * possibly compacted offset.
      */
     dest = xstate;
-    valid = xstate_bv & ~XSTATE_FP_SSE;
+    valid = xstate_bv & ~XSTATE_FP_SSE & ~X86_XSS_STATES;
     while ( valid )
     {
         u64 feature = valid & -valid;
@@ -516,7 +520,7 @@ int xstate_alloc_save_area(struct vcpu *v)
          */
         size = XSTATE_AREA_MIN_SIZE;
     }
-    else if ( !is_idle_vcpu(v) || !cpu_has_xsavec )
+    else if ( !is_idle_vcpu(v) || (!cpu_has_xsavec && !cpu_has_xsaves) )
     {
         size = xsave_cntxt_size;
         BUG_ON(size < XSTATE_AREA_MIN_SIZE);
@@ -678,12 +682,9 @@ static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
            (new & X86_XSS_STATES)); /* User or supervisor, not both. */
 
     s->states |= new;
-    if ( new & X86_XCR0_STATES )
-    {
-        if ( !set_xcr0(s->states & X86_XCR0_STATES) )
-            BUG();
-    }
-    else
+    if ( !set_xcr0(s->states & X86_XCR0_STATES) )
+        BUG();
+    if ( cpu_has_xsaves )
         set_msr_xss(s->states & X86_XSS_STATES);
 
     /*
@@ -850,8 +851,8 @@ void xstate_init(struct cpuinfo_x86 *c)
     boolean_param("xsave", use_xsave);
 
     bool bsp = c == &boot_cpu_data;
-    u32 eax, ebx, ecx, edx;
-    u64 feature_mask;
+    uint32_t eax, ebx, ecx, edx;
+    uint64_t feature_mask, supervisor_feature_mask = 0;
 
     if ( bsp )
     {
@@ -874,7 +875,8 @@ void xstate_init(struct cpuinfo_x86 *c)
     }
 
     cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
-    feature_mask = (((u64)edx << 32) | eax) & XCNTXT_MASK;
+    feature_mask = (((u64)edx << 32) | eax) &
+                   (XCNTXT_MASK & ~X86_XSS_STATES);
     BUG_ON(!valid_xcr0(feature_mask));
     BUG_ON(!(feature_mask & X86_XCR0_SSE));
 
@@ -892,25 +894,36 @@ void xstate_init(struct cpuinfo_x86 *c)
         BUG();
     if ( cpu_has_xsaves )
     {
+        cpuid_count(XSTATE_CPUID, 1, &eax, &ebx, &ecx, &edx);
+        supervisor_feature_mask = (((uint64_t)edx << 32) | ecx) & XCNTXT_MASK;
+
         this_cpu(xss) = ~0;
-        set_msr_xss(0);
+        set_msr_xss(supervisor_feature_mask);
     }
 
     if ( bsp )
     {
-        xfeature_mask = feature_mask;
+        xfeature_mask = feature_mask | supervisor_feature_mask;
         /*
          * xsave_cntxt_size is the max size required by enabled features.
          * We know FP/SSE and YMM about eax, and nothing about edx at present.
          */
         xsave_cntxt_size = cpuid_count_ebx(0xd, 0);
-        printk("xstate: size: %#x and states: %#"PRIx64"\n",
-               xsave_cntxt_size, xfeature_mask);
+        if ( cpu_has_xsaves )
+            xsave_cntxt_size = max(xsave_cntxt_size, cpuid_count_ebx(0xd, 1));
+        printk("xstate: size: %#x, states: %#"PRIx64
+               ", supervisor states: %#"PRIx64"\n",
+               xsave_cntxt_size, feature_mask, supervisor_feature_mask);
     }
     else
     {
-        BUG_ON(xfeature_mask != feature_mask);
-        BUG_ON(xsave_cntxt_size != cpuid_count_ebx(0xd, 0));
+        uint32_t ap_xsave_cntxt_size;
+
+        BUG_ON(xfeature_mask != (feature_mask | supervisor_feature_mask));
+        ap_xsave_cntxt_size = cpuid_count_ebx(0xd, 0);
+        if ( cpu_has(&current_cpu_data, X86_FEATURE_XSAVES) )
+            ap_xsave_cntxt_size = max(ap_xsave_cntxt_size, cpuid_count_ebx(0xd, 1));
+        BUG_ON(xsave_cntxt_size != ap_xsave_cntxt_size);
     }
 
     if ( setup_xstate_features(bsp) && bsp )
@@ -1072,6 +1085,30 @@ void xstate_set_init(uint64_t mask)
         BUG();
 }
 
+void *get_xstate_component_comp(struct xsave_struct *xstate,
+                                unsigned int size,
+                                uint64_t component)
+{
+    uint16_t comp_offsets[sizeof(xfeature_mask) * 8];
+    uint16_t offset;
+    unsigned int i = ilog2(component);
+
+    ASSERT(generic_hweightl(component) == 1);
+
+    if ( !(xstate->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED) ||
+         i >= xstate_features ||
+         xstate_sizes[i] == 0 ||
+         !(xstate->xsave_hdr.xcomp_bv & component) )
+        return NULL;
+
+    setup_xstate_comp(comp_offsets, xstate->xsave_hdr.xcomp_bv);
+    offset = comp_offsets[i];
+    if ( xstate_sizes[i] + offset > size )
+        return NULL;
+
+    return (void *)xstate + offset;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.43.0



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

