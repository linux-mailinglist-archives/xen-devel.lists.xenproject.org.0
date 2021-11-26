Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2202245EEC2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232875.404090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxR-0001lS-Ro; Fri, 26 Nov 2021 13:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232875.404090; Fri, 26 Nov 2021 13:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxR-0001XF-7X; Fri, 26 Nov 2021 13:08:05 +0000
Received: by outflank-mailman (input) for mailman id 232875;
 Fri, 26 Nov 2021 13:08:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaum-0003W9-BU
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 801a3d48-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:18 +0100 (CET)
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
X-Inumbo-ID: 801a3d48-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xjn85GMBbIR9P9hSa/8Sl+mZVJ+id4k3kzCvHV3KSWQ=;
  b=RzAu9bkg2cHhdT05XVLR8+obe2uz78zqqx5zt/JFaKxbwTwxfi9oJ05H
   05Vlbil39d+aWIxGIF8cwV7h2BgIxcrljqB5afSnxXaXCmOl7knJrM0QO
   9xAmTSHHe5zXmM0WG/N3s6iQJtcVuTY9LHwbpa4wWkqf73zx9qzcYVSsY
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QY8y04f07OZwnNF+0vjbYUv51UZ2G1BAr2Q4JGd//Xqzbjcz0R9cUFzGjXr19xkOFOe0ZyJAFg
 NH1qLab9PG00lcH1EVHQn6O36oALuGxAPp+kwIkOjOvgasew1y2/BPM7UhhnuOGn33W6FAbW0H
 LewJU/1p3Lxc6QF3AF2A4HEBwM/QLAQ1tpjReUWSW79TwKQlggZcoDQBzwAvczknPkffQ6eUVa
 toxGis/MNsKUpfz6TD9KWdhPIO+WviVBqfbDEndWFG7HW6J+hr7TztFN8OGxkEdtn8YUi4w0tM
 HWO+F+HwaU1s7XaqgqTjiX4P
X-SBRS: 5.1
X-MesageID: 59064000
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fk4yu6/Va7Flx3bS9FLADrUDTXmTJUtcMsCJ2f8bNWPcYEJGY0x3y
 DQbDWGPOffcNmumc94nOtvi800FsZaBy9cxT1drqCo8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGmeIdA970Ug6wrdj3NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPh25
 IwS5Y3tFj4LAY3QkfUSDylGFz5HaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp0fRaiCP
 5JBAdZpRArYWCVSIQoXMoAjlbj2oVzTQTx5sXvA8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru3U70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0XPYJTL0rtV606JX0/w+ICTQ0UDpeUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9PABbvzt68owGOlor+p5
 yNsdy+2tr1mMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8lexc3b5lVJWG1O
 yc/XD+9ArcIZxNGioctPuqM5zkCl/C8RbwJqNiIBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClIOMAkc5zX5m9vNoqRpwPZYkPnm5
 Ha4VhMKwVbznySfew6LdmpiePXkWpMm9SA3OiklPFCJ3Xk/YNnwsPdDJsVvJbR3pvZ+yfNUT
 uUef5nSCPp4VTmaqS8WaoPwrdI+eU3z1x6OJSesfBM2Y4VkG17S4tbhcwa2rHsOAyO7uNEQu
 bql0g+HE5MPSx47VJTdae61zkP3tn8YwbogU0zNK9hVWUPt7Ik1dHCh0q5pe5kBcEyRyCGb2
 gCaBQYjidPM+4JlosPUga2krpuyF7csFERtAGSGv629MjPX/zT/zNYYAvqIZz3USEj95L6mO
 bdO1/j5PfAKwARKvo57H+o5xK4y/YKy9bpTzwAiF3TXdVW7TLhnJyDej8VIs6RMwJ5fuBe3B
 R3TqoULZ+3RNZO3CkMVKSokcv+HhKMdlTTl5PgoJFn3uX1s972dXEQOZxSBhUSx9leu3F/JF
 Qv5hPMr1g==
IronPort-HdrOrdr: A9a23:y0Gu9a4VCkWPJCL01wPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="59064000"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 63/65] x86/setup: Rework MSR_S_CET handling for CET-IBT
Date: Fri, 26 Nov 2021 12:34:44 +0000
Message-ID: <20211126123446.32324-64-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

CET-SS and CET-IBT can be independently controlled, so the configuration of
MSR_S_CET can't be constants any more.

Introduce xen_msr_s_cet_value(), mostly because I don't fancy
writing/maintaining that logic in assembly.  Use this in the 3 paths which
alter MSR_S_CET when both features are potentially active.

To active CET-IBT, we only need CR4.CET and MSR_S_CET.ENDBR_EN.  This is
common with the CET-SS setup, so reorder the operations to set up CR4 and
MSR_S_CET for any nonzero result from xen_msr_s_cet_value(), and set up
MSR_PL0_SSP and SSP if SHSTK_EN was also set.

Adjust the crash path to disable CET-IBT too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

It is quite possible that the S3 path is dead code.  CET-IBT only exist on
Intel systems from TigerLake onwards, and TGL kills S3 in favour of the newer
S0ix power state.

AMD Ryzen platforms (Zen3 onwards) support S3 and CET-SS, so partial testing
will occur there.
---
 xen/arch/x86/acpi/wakeup_prot.S | 37 ++++++++++++++++++++++---------------
 xen/arch/x86/boot/x86_64.S      | 29 ++++++++++++++++++-----------
 xen/arch/x86/crash.c            |  4 ++--
 xen/arch/x86/setup.c            | 17 ++++++++++++++++-
 xen/include/asm-x86/msr-index.h |  1 +
 5 files changed, 59 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index 15052c300fa1..01eb26ed0769 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -63,7 +63,24 @@ ENTRY(s3_resume)
         pushq   %rax
         lretq
 1:
-#ifdef CONFIG_XEN_SHSTK
+#if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
+        call    xen_msr_s_cet_value
+        test    %eax, %eax
+        je      .L_cet_done
+
+        /* Set up MSR_S_CET. */
+        mov     $MSR_S_CET, %ecx
+        xor     %edx, %edx
+        wrmsr
+
+        /* Enable CR4.CET. */
+        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
+        mov     %rcx, %cr4
+
+#if defined(CONFIG_XEN_SHSTK)
+        test    $CET_SHSTK_EN, %eax
+        je      .L_cet_done
+
         /*
          * Restoring SSP is a little complicated, because we are intercepting
          * an in-use shadow stack.  Write a temporary token under the stack,
@@ -71,14 +88,6 @@ ENTRY(s3_resume)
          * reset MSR_PL0_SSP to its usual value and pop the temporary token.
          */
         mov     saved_ssp(%rip), %rdi
-        cmpq    $1, %rdi
-        je      .L_shstk_done
-
-        /* Set up MSR_S_CET. */
-        mov     $MSR_S_CET, %ecx
-        xor     %edx, %edx
-        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
-        wrmsr
 
         /* Construct the temporary supervisor token under SSP. */
         sub     $8, %rdi
@@ -90,12 +99,9 @@ ENTRY(s3_resume)
         mov     %edi, %eax
         wrmsr
 
-        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
-        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
-        mov     %rbx, %cr4
-
         /* Write the temporary token onto the shadow stack, and activate it. */
         wrssq   %rdi, (%rdi)
+        /* MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
         setssbsy
 
         /* Reset MSR_PL0_SSP back to its normal value. */
@@ -106,8 +112,9 @@ ENTRY(s3_resume)
         /* Pop the temporary token off the stack. */
         mov     $2, %eax
         incsspd %eax
-.L_shstk_done:
-#endif
+#endif /* CONFIG_XEN_SHSTK */
+.L_cet_done:
+#endif /* CONFIG_XEN_SHSTK || CONFIG_XEN_IBT */
 
         call    load_system_tables
 
diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index d61048c583b3..c05c69f9fa59 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -30,18 +30,25 @@ ENTRY(__high_start)
         test    %ebx,%ebx
         jz      .L_bsp
 
-        /* APs.  Set up shadow stacks before entering C. */
-#ifdef CONFIG_XEN_SHSTK
-        testl   $cpufeat_mask(X86_FEATURE_XEN_SHSTK), \
-                CPUINFO_FEATURE_OFFSET(X86_FEATURE_XEN_SHSTK) + boot_cpu_data(%rip)
-        je      .L_ap_shstk_done
+        /* APs.  Set up CET before entering C properly. */
+#if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
+        call    xen_msr_s_cet_value
+        test    %eax, %eax
+        je      .L_ap_cet_done
 
         /* Set up MSR_S_CET. */
         mov     $MSR_S_CET, %ecx
         xor     %edx, %edx
-        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
         wrmsr
 
+        /* Enable CR4.CET. */
+        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
+        mov     %rcx, %cr4
+
+#if defined(CONFIG_XEN_SHSTK)
+        test    $CET_SHSTK_EN, %eax
+        je      .L_ap_cet_done
+
         /* Derive MSR_PL0_SSP from %rsp (token written when stack is allocated). */
         mov     $MSR_PL0_SSP, %ecx
         mov     %rsp, %rdx
@@ -51,13 +58,13 @@ ENTRY(__high_start)
         or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %eax
         wrmsr
 
-        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
-        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
-        mov     %rcx, %cr4
+        /* MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
         setssbsy
-#endif
 
-.L_ap_shstk_done:
+#endif /* CONFIG_XEN_SHSTK */
+.L_ap_cet_done:
+#endif /* CONFIG_XEN_SHSTK || CONFIG_XEN_IBT */
+
         call    start_secondary
         BUG     /* start_secondary() shouldn't return. */
 
diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index c383f718f5bd..003222c0f1ac 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -190,8 +190,8 @@ void machine_crash_shutdown(void)
     /* Reset CPUID masking and faulting to the host's default. */
     ctxt_switch_levelling(NULL);
 
-    /* Disable shadow stacks. */
-    if ( cpu_has_xen_shstk )
+    /* Disable CET. */
+    if ( cpu_has_xen_shstk || cpu_has_xen_ibt )
     {
         wrmsrl(MSR_S_CET, 0);
         write_cr4(read_cr4() & ~X86_CR4_CET);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 141957c9f6a5..daaba097d57f 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -661,6 +661,21 @@ static void noreturn init_done(void)
     startup_cpu_idle_loop();
 }
 
+#if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
+/*
+ * Used by AP and S3 asm code to calcualte the appropriate MSR_S_CET setting.
+ * Do not use on the BSP before reinit_bsp_stack(), or it may turn SHSTK on
+ * too early.
+ */
+unsigned int xen_msr_s_cet_value(void)
+{
+    return ((cpu_has_xen_shstk ? CET_SHSTK_EN | CET_WRSS_EN : 0) |
+            (cpu_has_xen_ibt   ? CET_ENDBR_EN : 0));
+}
+#else
+unsigned int xen_msr_s_cet_value(void); /* To avoid ifdefary */
+#endif
+
 /* Reinitalise all state referring to the old virtual address of the stack. */
 static void __init noreturn reinit_bsp_stack(void)
 {
@@ -684,7 +699,7 @@ static void __init noreturn reinit_bsp_stack(void)
     {
         wrmsrl(MSR_PL0_SSP,
                (unsigned long)stack + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8);
-        wrmsrl(MSR_S_CET, CET_SHSTK_EN | CET_WRSS_EN);
+        wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
         asm volatile ("setssbsy" ::: "memory");
     }
 
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index ab68ef2681a9..627508233d19 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -115,6 +115,7 @@
 #define MSR_S_CET                           0x000006a2
 #define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
 #define  CET_WRSS_EN                        (_AC(1, ULL) <<  1)
+#define  CET_ENDBR_EN                       (_AC(1, ULL) <<  2)
 
 #define MSR_PL0_SSP                         0x000006a4
 #define MSR_PL1_SSP                         0x000006a5
-- 
2.11.0


