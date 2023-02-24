Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3206A1B67
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 12:31:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500924.772501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWIK-0005Oq-SH; Fri, 24 Feb 2023 11:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500924.772501; Fri, 24 Feb 2023 11:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWIK-0005Lp-Ns; Fri, 24 Feb 2023 11:31:20 +0000
Received: by outflank-mailman (input) for mailman id 500924;
 Fri, 24 Feb 2023 11:31:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVWII-0004Yi-Tf
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 11:31:19 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0a5b9b2-b436-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 12:31:17 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id z5so13859968ljc.8
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 03:31:17 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a2ea613000000b00295a815e555sm92682ljp.134.2023.02.24.03.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:31:16 -0800 (PST)
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
X-Inumbo-ID: c0a5b9b2-b436-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOshq+qKbDwQMkJNLbvBoFxXJPrCc7l4QBus5ql+hrQ=;
        b=ltuWFLkn+rkcMbJuSMNyb6XPd72AvRfFGSala1oi+RzSSOdI7Ohr0onvF9IOhOWlLZ
         PBT78GgpjF8IRzcqfm9HmNgXB+zdJjiMs2HKPLqUD7ngbqoMmDzhwENTHwr+V07HJj+S
         TBVliYoR7gwBW53VH+oN55AHL2xdT5sjP1man/UzEoWlNg0f0nqK/ghC2YSkeVU8PXSi
         /QGKe2M8FOFahEjwDhYolyn+fafZJsqzI101HBAlaOgY+U7/NqEcJ6Jf9EPTdmhjVsF1
         9Ybw7ProSQLRcjHiM3X7TsDAG9XIFytKrXuxqW+w2vAyiv8WEg9wNUV11QJ6VjXA4EVu
         hbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOshq+qKbDwQMkJNLbvBoFxXJPrCc7l4QBus5ql+hrQ=;
        b=lhl5cWcwwUkSfBJiJ7bt5KAEG1fXWYgsJ1prJn4TePO9jo8Q7hStNDAlZTOwd+VefY
         yD1zgxPSLZFL4g8uNrSu21aapZwSXxxgiqrWyq0iVVga2/WaazhV5O0PnA0MXPciyvU2
         UVDPtQMP/H3dOyR0yu52NILKse/VBXUvmA3I+pZadD71h52g9stbLeXORTUAVta2zfAN
         oXaPWiPu5rGLygzl0xbj4IX59M9DV1TYto27IXo1hBIW5eW4l2HCanJXBWiRjmdW3pyN
         wlObUSjivOn3Ip7NMc84uwlxT2OqLz2LpFm85fJwcQPYepZZbigLUWQI/kAa8g0PINoA
         lIbA==
X-Gm-Message-State: AO0yUKXMO4LYddTBR8V1UnuRJpUjwB8B7O7YRnzMjl58iCWwSXdBt8G5
	eLVw9kvyHVKcUO4iOfs8J1UZy/Qix1g=
X-Google-Smtp-Source: AK7set/RR8/tgFB4o0vxWajvTbl5KSLp0dIFfXf1evPIchk774YEk111cWWnIw900IE+GgreQPHusg==
X-Received: by 2002:a05:651c:39c:b0:294:6d1d:cbf2 with SMTP id e28-20020a05651c039c00b002946d1dcbf2mr5031499ljp.40.1677238276713;
        Fri, 24 Feb 2023 03:31:16 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/4] xen/arm: switch ARM to use generic implementation of bug.h
Date: Fri, 24 Feb 2023 13:31:06 +0200
Message-Id: <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677233393.git.oleksii.kurochko@gmail.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes were made:
* make GENERIC_BUG_FRAME mandatory for ARM
* As do_bug_frame() returns -EINVAL in case something goes wrong
  otherwise id of bug frame. Thereby 'if' cases where do_bug_frame() was
  updated to check if the returned value is less than 0
* Change macros bug_file() to bug_ptr() to align it with generic
  implementation.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 * As prototype and what do_bug_frame() returns was changed so patch 3 and 4
   was updated to use a new version of do_bug_frame
---
Changes in V2:
 * Rename bug_file() in ARM implementation to bug_ptr() as
   generic do_bug_frame() uses bug_ptr().
 * Remove generic parts from bug.h
 * Remove declaration of 'int do_bug_frame(...)'
   from <asm/traps.h> as it was introduced in <xen/bug.h>
---
 xen/arch/arm/Kconfig             |  1 +
 xen/arch/arm/arm32/traps.c       |  2 +-
 xen/arch/arm/include/asm/bug.h   | 15 +-----
 xen/arch/arm/include/asm/traps.h |  2 -
 xen/arch/arm/traps.c             | 81 +-------------------------------
 5 files changed, 4 insertions(+), 97 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..aad6644a7b 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -12,6 +12,7 @@ config ARM_64
 
 config ARM
 	def_bool y
+	select GENERIC_BUG_FRAME
 	select HAS_ALTERNATIVE
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
index a2fc1c22cb..61c61132c7 100644
--- a/xen/arch/arm/arm32/traps.c
+++ b/xen/arch/arm/arm32/traps.c
@@ -48,7 +48,7 @@ void do_trap_undefined_instruction(struct cpu_user_regs *regs)
     if ( instr != BUG_OPCODE )
         goto die;
 
-    if ( do_bug_frame(regs, pc) )
+    if ( do_bug_frame(regs, pc) < 0 )
         goto die;
 
     regs->pc += 4;
diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index cacaf014ab..e6cc37e1d6 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -21,8 +21,7 @@ struct bug_frame {
     uint32_t pad0:16;       /* Padding for 8-bytes align */
 };
 
-#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
-#define bug_file(b) ((const void *)(b) + (b)->file_disp);
+#define bug_ptr(b) ((const void *)(b) + (b)->file_disp)
 #define bug_line(b) ((b)->line)
 #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
 
@@ -70,18 +69,6 @@ struct bug_frame {
          ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \
 } while (0)
 
-#define WARN() BUG_FRAME(BUGFRAME_warn, __LINE__, __FILE__, 0, "")
-
-#define BUG() do {                                              \
-    BUG_FRAME(BUGFRAME_bug,  __LINE__, __FILE__, 0, "");        \
-    unreachable();                                              \
-} while (0)
-
-#define assert_failed(msg) do {                                 \
-    BUG_FRAME(BUGFRAME_assert, __LINE__, __FILE__, 1, msg);     \
-    unreachable();                                              \
-} while (0)
-
 #endif /* __ARM_BUG_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
index 883dae368e..c6518008ec 100644
--- a/xen/arch/arm/include/asm/traps.h
+++ b/xen/arch/arm/include/asm/traps.h
@@ -69,8 +69,6 @@ void do_cp(struct cpu_user_regs *regs, const union hsr hsr);
 void do_trap_smc(struct cpu_user_regs *regs, const union hsr hsr);
 void do_trap_hvc_smccc(struct cpu_user_regs *regs);
 
-int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc);
-
 void noreturn do_unexpected_trap(const char *msg,
                                  const struct cpu_user_regs *regs);
 void do_trap_hyp_sync(struct cpu_user_regs *regs);
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 061c92acbd..9c6eb66422 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1197,85 +1197,6 @@ void do_unexpected_trap(const char *msg, const struct cpu_user_regs *regs)
     panic("CPU%d: Unexpected Trap: %s\n", smp_processor_id(), msg);
 }
 
-int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
-{
-    const struct bug_frame *bug = NULL;
-    const char *prefix = "", *filename, *predicate;
-    unsigned long fixup;
-    int id = -1, lineno;
-    const struct virtual_region *region;
-
-    region = find_text_region(pc);
-    if ( region )
-    {
-        for ( id = 0; id < BUGFRAME_NR; id++ )
-        {
-            const struct bug_frame *b;
-            unsigned int i;
-
-            for ( i = 0, b = region->frame[id].bugs;
-                  i < region->frame[id].n_bugs; b++, i++ )
-            {
-                if ( ((vaddr_t)bug_loc(b)) == pc )
-                {
-                    bug = b;
-                    goto found;
-                }
-            }
-        }
-    }
- found:
-    if ( !bug )
-        return -ENOENT;
-
-    if ( id == BUGFRAME_run_fn )
-    {
-        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
-
-        fn(regs);
-        return 0;
-    }
-
-    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
-    filename = bug_file(bug);
-    if ( !is_kernel(filename) )
-        return -EINVAL;
-    fixup = strlen(filename);
-    if ( fixup > 50 )
-    {
-        filename += fixup - 47;
-        prefix = "...";
-    }
-    lineno = bug_line(bug);
-
-    switch ( id )
-    {
-    case BUGFRAME_warn:
-        printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
-        show_execution_state(regs);
-        return 0;
-
-    case BUGFRAME_bug:
-        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
-        show_execution_state(regs);
-        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
-
-    case BUGFRAME_assert:
-        /* ASSERT: decode the predicate string pointer. */
-        predicate = bug_msg(bug);
-        if ( !is_kernel(predicate) )
-            predicate = "<unknown>";
-
-        printk("Assertion '%s' failed at %s%s:%d\n",
-               predicate, prefix, filename, lineno);
-        show_execution_state(regs);
-        panic("Assertion '%s' failed at %s%s:%d\n",
-              predicate, prefix, filename, lineno);
-    }
-
-    return -EINVAL;
-}
-
 #ifdef CONFIG_ARM_64
 static void do_trap_brk(struct cpu_user_regs *regs, const union hsr hsr)
 {
@@ -1292,7 +1213,7 @@ static void do_trap_brk(struct cpu_user_regs *regs, const union hsr hsr)
     switch ( hsr.brk.comment )
     {
     case BRK_BUG_FRAME_IMM:
-        if ( do_bug_frame(regs, regs->pc) )
+        if ( do_bug_frame(regs, regs->pc) < 0 )
             goto die;
 
         regs->pc += 4;
-- 
2.39.0


