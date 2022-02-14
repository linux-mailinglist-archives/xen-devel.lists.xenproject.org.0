Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFFE4B5102
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:05:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271650.466266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb2N-0002o7-It; Mon, 14 Feb 2022 13:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271650.466266; Mon, 14 Feb 2022 13:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb2N-0002bY-4k; Mon, 14 Feb 2022 13:05:03 +0000
Received: by outflank-mailman (input) for mailman id 271650;
 Mon, 14 Feb 2022 13:05:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2L-0008IH-7o
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:01 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6cd002b-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:04:59 +0100 (CET)
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
X-Inumbo-ID: b6cd002b-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9zLsHHpejok3Sem3a+Qat8nhch9ye50iKMyyHAXlbbs=;
  b=eJxic+s/otc3Jj5qPM8P8IACeaLptYMAkJ19jqbMKkHEfm7huJKvAwaE
   eGwzwHC+f8NsUVYYgU4KmQ/sWM/0RpDIfMovKnXqwF1OhbXAtsGA4wz3e
   TYFGJOc93mm1WfgiY4f9cj6VHAQnvO0QElF0EKmM93oFDnnw/JypFRtJR
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xcTQUaIPJGzv7edGZ7Uz35El+vDV1JsKrBHiS+3rDuhHYjmKuY8vv5VR5b1rrpeBzlLlCEqv0c
 dmfSqEI2Hig5hgrIez65nIcM5cdVKl/oRrTqarHmFJsrucJuf+BxdkapFQJpOCMtjD09Z7iPyp
 ukggPEGO9NVZwksBxgYgI4699HNWsDPhKz4cCdcUKlOBQthLYW7JjaF/rIjH6ZxxYzhVka9+Ng
 8+8KI0+s2/Ch++Bq3glKChozkLSaMdDzMvbo+fKcsSuWLxpifzTJNnoKBdi3tF7EQ9TexNyEa/
 c3UGOT9mUGx48+PptAUVkNiR
X-SBRS: 5.1
X-MesageID: 64149336
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eqHeI6Amv+P9eRVW/xXkw5YqxClBgxIJ4kV8jS/XYbTApD1zgzEAx
 mNKCj2AOffeY2b2ed1waITl908Hu8PRz4BqQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En970E47wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/qiu0o+sv6
 +lxn4GveForH7Lcpb0cTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGgG5s15sVQ54yY
 eJCdx9hNg3wYiZtO08QELUftbys3F3wJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiF+agyInBflsL8cn9zDQyIvL8zvAB3dRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1kRiG2NPdXABb3nARFodtjxc7V5l
 CJY8/VyFchXZX13qASDQf8WAJai7OufPTvXjDZHRsd9q2v9qyP+JdkLulmSwXuF1e5eJ1fUj
 LL741sNtPe/wlP2BUOIX25BI5tzlvWxfTgUfvvVcsBPcvBMmPyvp0lTibqr9zm1yiAEyPhnU
 b/CKJrEJStKWMxPkWvtL89AgOBD+8zL7T6KLXwN50/8iuT2ib/8YeptDWZimchnsP3a8F+Ir
 76y9aKikn1ibQE3WQGPmaZ7ELzABSRT6Unep5MFe+idDBBhHW19Wfbdzal4I95unrhPl/eO9
 Xa4AxcKxF36jHzBCAOLdnE8N++/Acch9So2bX42IFKl+3k/eoLzvq0RQIQ6IOs8/+t5wP8qE
 /RcI5ecAu5CQyjs8igGacWvt5RrcRmm3FrcPyesbDUlUYRnQgjFpo3tcgf1rXFcBSurr8ou5
 ban01qDE5YEQg1jCufQae6ukAzt7SRMxroqUhKRcNdJeUjq/Ix7EADLj6c6c5MWNBHO5jqGz
 ALKUx0WkvbA/t0u+97TiKHa84rwS7liHlBXFnXw5KqtMXWI5XKqxIJNXbrafT3ZU2+oqqyua
 f8MkqP5OfwD2l1Lr5B9A/Bgyqdnv4njoLpTzwJFGnTXbgv0VuM8cyfehcQf5LdQwrJ5uBetX
 hPd89ZXDryFJcf5HQNDPwEidOmCiakZlzS6AS7Z+6kmCPubJIa6bHg=
IronPort-HdrOrdr: A9a23:gzxQqKxkV11NCBrsECGWKrPwLr1zdoMgy1knxilNoRw8SKKlfq
 GV7Y0mPHDP6Ar5NEtNpTnEAtjkfZq+z+8S3WByB8bAYOCOggLBR+sO0WKh+UyFJ8SXzJ876U
 4KSclD4bPLYmSS9fyKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149336"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 68/70] x86/setup: Rework MSR_S_CET handling for CET-IBT
Date: Mon, 14 Feb 2022 12:51:25 +0000
Message-ID: <20220214125127.17985-69-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

CET-SS and CET-IBT can be independently controlled, so the configuration of
MSR_S_CET can't be constant any more.

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

v2:
 * Asm adjustments.  Add comments regarding safety.
---
 xen/arch/x86/acpi/wakeup_prot.S      | 38 ++++++++++++++++++++++--------------
 xen/arch/x86/boot/x86_64.S           | 30 +++++++++++++++++-----------
 xen/arch/x86/crash.c                 |  4 ++--
 xen/arch/x86/include/asm/msr-index.h |  1 +
 xen/arch/x86/setup.c                 | 17 +++++++++++++++-
 5 files changed, 61 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index 15052c300fa1..3855ff1ddb94 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -63,7 +63,26 @@ ENTRY(s3_resume)
         pushq   %rax
         lretq
 1:
-#ifdef CONFIG_XEN_SHSTK
+#if defined(CONFIG_XEN_SHSTK) || defined(CONFIG_XEN_IBT)
+        call    xen_msr_s_cet_value
+        test    %eax, %eax
+        jz      .L_cet_done
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
+        /* WARNING! call/ret now fatal (iff SHSTK) until SETSSBSY loads SSP */
+
+#if defined(CONFIG_XEN_SHSTK)
+        test    $CET_SHSTK_EN, %al
+        jz      .L_cet_done
+
         /*
          * Restoring SSP is a little complicated, because we are intercepting
          * an in-use shadow stack.  Write a temporary token under the stack,
@@ -71,14 +90,6 @@ ENTRY(s3_resume)
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
@@ -90,10 +101,6 @@ ENTRY(s3_resume)
         mov     %edi, %eax
         wrmsr
 
-        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
-        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
-        mov     %rbx, %cr4
-
         /* Write the temporary token onto the shadow stack, and activate it. */
         wrssq   %rdi, (%rdi)
         setssbsy
@@ -106,8 +113,9 @@ ENTRY(s3_resume)
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
index 27f52e7a7708..fa41990dde0f 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -30,18 +30,27 @@ ENTRY(__high_start)
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
+        jz      .L_ap_cet_done
 
         /* Set up MSR_S_CET. */
         mov     $MSR_S_CET, %ecx
         xor     %edx, %edx
-        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
         wrmsr
 
+        /* Enable CR4.CET. */
+        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
+        mov     %rcx, %cr4
+
+        /* WARNING! call/ret now fatal (iff SHSTK) until SETSSBSY loads SSP */
+
+#if defined(CONFIG_XEN_SHSTK)
+        test    $CET_SHSTK_EN, %al
+        jz      .L_ap_cet_done
+
         /* Derive MSR_PL0_SSP from %rsp (token written when stack is allocated). */
         mov     $MSR_PL0_SSP, %ecx
         mov     %rsp, %rdx
@@ -51,13 +60,12 @@ ENTRY(__high_start)
         or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %eax
         wrmsr
 
-        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
-        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
-        mov     %rcx, %cr4
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
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 9df1959fe5a1..3e038db618ff 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -117,6 +117,7 @@
 #define MSR_S_CET                           0x000006a2
 #define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
 #define  CET_WRSS_EN                        (_AC(1, ULL) <<  1)
+#define  CET_ENDBR_EN                       (_AC(1, ULL) <<  2)
 
 #define MSR_PL0_SSP                         0x000006a4
 #define MSR_PL1_SSP                         0x000006a5
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2b1192d85b77..f6a59d5f0412 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -670,6 +670,21 @@ static void noreturn init_done(void)
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
@@ -693,7 +708,7 @@ static void __init noreturn reinit_bsp_stack(void)
     {
         wrmsrl(MSR_PL0_SSP,
                (unsigned long)stack + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8);
-        wrmsrl(MSR_S_CET, CET_SHSTK_EN | CET_WRSS_EN);
+        wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
         asm volatile ("setssbsy" ::: "memory");
     }
 
-- 
2.11.0


