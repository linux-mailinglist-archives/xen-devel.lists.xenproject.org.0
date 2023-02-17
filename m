Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A450269B280
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 19:48:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497255.768170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT5ma-0005N2-Fz; Fri, 17 Feb 2023 18:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497255.768170; Fri, 17 Feb 2023 18:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pT5ma-0005KA-D5; Fri, 17 Feb 2023 18:48:32 +0000
Received: by outflank-mailman (input) for mailman id 497255;
 Fri, 17 Feb 2023 18:48:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DzBr=6N=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pT5mZ-0005Js-E5
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 18:48:31 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab3448b7-aef3-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 19:48:29 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id co2so7296675edb.13
 for <xen-devel@lists.xenproject.org>; Fri, 17 Feb 2023 10:48:29 -0800 (PST)
Received: from uni.router.wind (adsl-65.109.242.225.tellas.gr.
 [109.242.225.65]) by smtp.googlemail.com with ESMTPSA id
 z61-20020a509e43000000b004ad03b18ae3sm2641585ede.62.2023.02.17.10.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 10:48:28 -0800 (PST)
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
X-Inumbo-ID: ab3448b7-aef3-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiK93wK0Vk/CzELNOerHhZzhGVV4JcKuWrkYZRhU+Sk=;
        b=Swhy9igNy82jEuV9AgsPcpPGLxsc6vaT419aaYKw+Y65ZnWjth5Zs32X9ng96F4RJQ
         DljEbpZB+d63LjdTxxn0Ig6I/hTTs02EnfJdLEeX5okFuR1dVhF3FFJETM473S858H/q
         nEMNWKg1lQZ7yHjH3Ueq+efUlr4vlQMR21q7iI2Kqht6c8wjNUHlVscsrP0KlT4G0L8L
         +71Loj/vK5lEHFPAA/CkIkFQmTSvQdaVQJHU58ueQVWpwnIKrIe2VVF046+RECeVWB8f
         egGgYbhpqetWV35o/L4sjn8zy+MgPsyI2uSkcHfozqYIKNMTpUG/nZkE9Pc8WaqxXIod
         KMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aiK93wK0Vk/CzELNOerHhZzhGVV4JcKuWrkYZRhU+Sk=;
        b=gtv3yIvz/g3Ec5yRBI2sigqUw7nh3Te+F0VTdd5ARyW5JkwUKbo4jUOIcA7vYOfElE
         yVWA2m3oMRnfm2O3y0fONQL5Z4utTUP+zvqEZuclJGdLB02EJ3yNzdaNLZvsXDCAf6I6
         vAqmhd5F2cw5imaeW9i97dto6+UAutKQB9xuAKi4fXzqGVPI26hWEmS3cWb8IjLE6iIx
         sGVezzk3vtDHWztcb2/nnc7N5m1ixeOnyekHk6J6dDO66oYDk2uCHOZqt3rYslI69llM
         hR4bGeykvl+1xkPE4lPc2QqboK6FBRkYJA2HUqvkQYHdTCNs9Udu6uHiSxbtwjj5LUon
         1XyQ==
X-Gm-Message-State: AO0yUKXUWb7UoRSalU+2McRpAlJLgehMnoU/dshqf+HUG2Z2ytGxOKwA
	3+4gQWSHHDvJkVNG9eJ1B4giyT4+Jak=
X-Google-Smtp-Source: AK7set9tHyLTP7F3E1Fg9wYSRvNXb7eAPB1EEWHPS/QpvjAAmGWf0G6FV4wsGUtK87SzGDvSOqQABw==
X-Received: by 2002:a05:6402:10d2:b0:4ad:316:b4d9 with SMTP id p18-20020a05640210d200b004ad0316b4d9mr1750264edu.15.1676659708615;
        Fri, 17 Feb 2023 10:48:28 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/4] x86/svm: cleanup svm.c
Date: Fri, 17 Feb 2023 20:48:11 +0200
Message-Id: <20230217184814.1243046-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230217184814.1243046-1-burzalodowa@gmail.com>
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not include the headers:
  xen/irq.h
  asm/hvm/svm/intr.h
  asm/io.h
  asm/mem_sharing.h
  asm/regs.h
because none of the declarations and macro definitions in them is used.
Sort alphabetically the rest of the headers.

Remove the forward declaration of svm_function_table and place start_svm()
after the svm_function_table's definition.

Replace double new lines with one.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/hvm/svm/svm.c | 159 +++++++++++++++++--------------------
 1 file changed, 72 insertions(+), 87 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index fa73257203..f0bc72c313 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -16,60 +16,47 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/domain_page.h>
 #include <xen/guest_access.h>
+#include <xen/hypercall.h>
 #include <xen/init.h>
 #include <xen/lib.h>
-#include <xen/trace.h>
 #include <xen/sched.h>
-#include <xen/irq.h>
-#include <xen/softirq.h>
-#include <xen/hypercall.h>
-#include <xen/domain_page.h>
+#include <xen/trace.h>
 #include <xen/xenoprof.h>
-#include <asm/current.h>
-#include <asm/io.h>
-#include <asm/paging.h>
-#include <asm/p2m.h>
-#include <asm/mem_sharing.h>
-#include <asm/regs.h>
-#include <asm/cpufeature.h>
-#include <asm/processor.h>
 #include <asm/amd.h>
+#include <asm/apic.h>
+#include <asm/cpufeature.h>
+#include <asm/current.h>
 #include <asm/debugreg.h>
-#include <asm/msr.h>
-#include <asm/i387.h>
-#include <asm/iocap.h>
+#include <asm/gdbsx.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/hvm.h>
-#include <asm/hvm/support.h>
 #include <asm/hvm/io.h>
-#include <asm/hvm/emulate.h>
+#include <asm/hvm/monitor.h>
+#include <asm/hvm/nestedhvm.h>
+#include <asm/hvm/support.h>
 #include <asm/hvm/svm/asid.h>
-#include <asm/hvm/svm/svm.h>
-#include <asm/hvm/svm/vmcb.h>
 #include <asm/hvm/svm/emulate.h>
-#include <asm/hvm/svm/intr.h>
-#include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/nestedsvm.h>
-#include <asm/hvm/nestedhvm.h>
-#include <asm/spec_ctrl.h>
-#include <asm/x86_emulate.h>
-#include <public/sched.h>
-#include <asm/hvm/vpt.h>
+#include <asm/hvm/svm/svm.h>
+#include <asm/hvm/svm/svmdebug.h>
+#include <asm/hvm/svm/vmcb.h>
 #include <asm/hvm/trace.h>
-#include <asm/hap.h>
-#include <asm/apic.h>
-#include <asm/gdbsx.h>
-#include <asm/hvm/monitor.h>
+#include <asm/iocap.h>
+#include <asm/i387.h>
 #include <asm/monitor.h>
-#include <asm/xstate.h>
+#include <asm/msr.h>
+#include <asm/paging.h>
+#include <asm/processor.h>
+#include <asm/p2m.h>
+#include <asm/x86_emulate.h>
+#include <public/sched.h>
 
 void noreturn svm_asm_do_resume(void);
 
 u32 svm_feature_flags;
 
-static struct hvm_function_table svm_function_table;
-
 /*
  * Physical addresses of the Host State Area (for hardware) and vmcb (for Xen)
  * which contains Xen's fs/gs/tr/ldtr and GSBASE/STAR/SYSENTER state when in
@@ -505,7 +492,6 @@ static int svm_vmcb_restore(struct vcpu *v, struct hvm_hw_cpu *c)
     return 0;
 }
 
-
 static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
@@ -517,7 +503,6 @@ static void svm_save_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
     data->msr_syscall_mask = vmcb->sfmask;
 }
 
-
 static void svm_load_cpu_state(struct vcpu *v, struct hvm_hw_cpu *data)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
@@ -1649,57 +1634,6 @@ static int cf_check svm_cpu_up(void)
     return _svm_cpu_up(false);
 }
 
-const struct hvm_function_table * __init start_svm(void)
-{
-    bool_t printed = 0;
-
-    svm_host_osvw_reset();
-
-    if ( _svm_cpu_up(true) )
-    {
-        printk("SVM: failed to initialise.\n");
-        return NULL;
-    }
-
-    setup_vmcb_dump();
-
-    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000a )
-        svm_feature_flags = cpuid_edx(0x8000000a);
-
-    printk("SVM: Supported advanced features:\n");
-
-    /* DecodeAssists fast paths assume nextrip is valid for fast rIP update. */
-    if ( !cpu_has_svm_nrips )
-        __clear_bit(SVM_FEATURE_DECODEASSISTS, &svm_feature_flags);
-
-    if ( cpu_has_tsc_ratio )
-        svm_function_table.tsc_scaling.ratio_frac_bits = 32;
-
-#define P(p,s) if ( p ) { printk(" - %s\n", s); printed = 1; }
-    P(cpu_has_svm_npt, "Nested Page Tables (NPT)");
-    P(cpu_has_svm_lbrv, "Last Branch Record (LBR) Virtualisation");
-    P(cpu_has_svm_nrips, "Next-RIP Saved on #VMEXIT");
-    P(cpu_has_svm_cleanbits, "VMCB Clean Bits");
-    P(cpu_has_svm_decode, "DecodeAssists");
-    P(cpu_has_svm_vloadsave, "Virtual VMLOAD/VMSAVE");
-    P(cpu_has_svm_vgif, "Virtual GIF");
-    P(cpu_has_pause_filter, "Pause-Intercept Filter");
-    P(cpu_has_pause_thresh, "Pause-Intercept Filter Threshold");
-    P(cpu_has_tsc_ratio, "TSC Rate MSR");
-    P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
-    P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
-#undef P
-
-    if ( !printed )
-        printk(" - none\n");
-
-    svm_function_table.hap_supported = !!cpu_has_svm_npt;
-    svm_function_table.hap_capabilities = HVM_HAP_SUPERPAGE_2MB |
-        (cpu_has_page1gb ? HVM_HAP_SUPERPAGE_1GB : 0);
-
-    return &svm_function_table;
-}
-
 static void svm_do_nested_pgfault(struct vcpu *v,
     struct cpu_user_regs *regs, uint64_t pfec, paddr_t gpa)
 {
@@ -2598,6 +2532,57 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     },
 };
 
+const struct hvm_function_table * __init start_svm(void)
+{
+    bool_t printed = 0;
+
+    svm_host_osvw_reset();
+
+    if ( _svm_cpu_up(true) )
+    {
+        printk("SVM: failed to initialise.\n");
+        return NULL;
+    }
+
+    setup_vmcb_dump();
+
+    if ( boot_cpu_data.extended_cpuid_level >= 0x8000000a )
+        svm_feature_flags = cpuid_edx(0x8000000a);
+
+    printk("SVM: Supported advanced features:\n");
+
+    /* DecodeAssists fast paths assume nextrip is valid for fast rIP update. */
+    if ( !cpu_has_svm_nrips )
+        __clear_bit(SVM_FEATURE_DECODEASSISTS, &svm_feature_flags);
+
+    if ( cpu_has_tsc_ratio )
+        svm_function_table.tsc_scaling.ratio_frac_bits = 32;
+
+#define P(p,s) if ( p ) { printk(" - %s\n", s); printed = 1; }
+    P(cpu_has_svm_npt, "Nested Page Tables (NPT)");
+    P(cpu_has_svm_lbrv, "Last Branch Record (LBR) Virtualisation");
+    P(cpu_has_svm_nrips, "Next-RIP Saved on #VMEXIT");
+    P(cpu_has_svm_cleanbits, "VMCB Clean Bits");
+    P(cpu_has_svm_decode, "DecodeAssists");
+    P(cpu_has_svm_vloadsave, "Virtual VMLOAD/VMSAVE");
+    P(cpu_has_svm_vgif, "Virtual GIF");
+    P(cpu_has_pause_filter, "Pause-Intercept Filter");
+    P(cpu_has_pause_thresh, "Pause-Intercept Filter Threshold");
+    P(cpu_has_tsc_ratio, "TSC Rate MSR");
+    P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
+    P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
+#undef P
+
+    if ( !printed )
+        printk(" - none\n");
+
+    svm_function_table.hap_supported = !!cpu_has_svm_npt;
+    svm_function_table.hap_capabilities = HVM_HAP_SUPERPAGE_2MB |
+        (cpu_has_page1gb ? HVM_HAP_SUPERPAGE_1GB : 0);
+
+    return &svm_function_table;
+}
+
 void svm_vmexit_handler(struct cpu_user_regs *regs)
 {
     uint64_t exit_reason;
-- 
2.37.2


