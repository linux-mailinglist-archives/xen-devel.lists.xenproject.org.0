Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E716689FF0
	for <lists+xen-devel@lfdr.de>; Fri,  3 Feb 2023 18:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.489263.757642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNzVk-0003NH-30; Fri, 03 Feb 2023 17:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 489263.757642; Fri, 03 Feb 2023 17:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNzVj-0003Kp-V4; Fri, 03 Feb 2023 17:06:03 +0000
Received: by outflank-mailman (input) for mailman id 489263;
 Fri, 03 Feb 2023 17:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ulaf=57=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pNzVi-00033s-MK
 for xen-devel@lists.xenproject.org; Fri, 03 Feb 2023 17:06:02 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 073095ad-a3e5-11ed-93b5-47a8fe42b414;
 Fri, 03 Feb 2023 18:05:58 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so2889349wms.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Feb 2023 09:05:58 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.104.21.nat.umts.dynamic.t-mobile.pl. [46.204.104.21])
 by smtp.gmail.com with ESMTPSA id
 f17-20020a5d50d1000000b002bfe266d710sm2452191wrt.90.2023.02.03.09.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 09:05:57 -0800 (PST)
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
X-Inumbo-ID: 073095ad-a3e5-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yl1BVOCE2L2DuqGqY3o9frkeRbpNVy3JkjL/X/RKkSs=;
        b=Piz4Bo7P+4/3Xxe/fkI3O9MSoLBXHIF3aZpuXtMbi2ocnSrfxyQxuQ6K0TRkreS5eJ
         G4C5+7U2d4zK9SAC0LlyrjDhFdMBjiXz3mDn0wwaKDrJ0YpLIQQNHI6yb/0cfYOaADZ6
         BHSR7s0rzNYdjkeMRjx/dubNEVRy+G7hEXxM42C4U4oRNwoFWBm7wIPjsai5UE0aPGae
         sTx1spuHjOmDUe1hFOlpF3p1wEXnBKtOecnNTEbslrdokyKF7N5CnX1D710B+h8QSU7O
         oeyQH1fv++UMGFgbdlOnTEOYBnENYP0oD0kzBeibCCVwSt0JC4QJVovgHstJqjE0ZlwR
         2n9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yl1BVOCE2L2DuqGqY3o9frkeRbpNVy3JkjL/X/RKkSs=;
        b=7RkhqMf8B55OqjSFB+032jWvG7Z+pjLqcPArmse7uHNIxozVhVN7kHcfedXZD/jLR6
         YiyZl7QCc6x8nfOhVaRpTztKnfzG19k4Bbf5To9uoYFlVH21Hesh7Z/YQ3K8BKjsbAyg
         5Hfks/tSGODIQP16E/tNrBB2Pk6pR23DhcQdmAkZkf2V8Ep5FIHRO9+f4DUq0R/jbLfm
         sIqP6YgM1eQCTN/KQkxYPETChw/RBW2Jagp4ec5qQnh3741VJxnt7ME7yexMC4+F1QFw
         Fz6zzZd10+ufM5T92VxW6/aoL9bUV/7UDsBK29cCd4tuc+Fm8sTGwdh8yz1lx7m28Ibw
         kxtg==
X-Gm-Message-State: AO0yUKVrMB3OfQkR5LrqZCWGc4ZCAjtEYEE1Y84WHeJMjegpJw5LPgzf
	p7ZxkXOaH+MCbRBHSYD5ozxojgv0vdQ=
X-Google-Smtp-Source: AK7set8AcggySQAjlpRHEsrJ/C/bn0asYbjDxrZ9oNavZBTc+sBrfi7pove9NVnnr9v+kK3IjWvYEw==
X-Received: by 2002:a05:600c:4687:b0:3db:eb0:6f6 with SMTP id p7-20020a05600c468700b003db0eb006f6mr10656252wmo.13.1675443957628;
        Fri, 03 Feb 2023 09:05:57 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 2/4] xen/arm: switch ARM to use generic implementation of bug.h
Date: Fri,  3 Feb 2023 19:05:48 +0200
Message-Id: <6c8b46f2f3326b833c73dbb86674ac5eb6ea45c8.1675441720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675441720.git.oleksii.kurochko@gmail.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/Kconfig             |  1 +
 xen/arch/arm/include/asm/bug.h   | 86 --------------------------------
 xen/arch/arm/include/asm/div64.h |  2 +-
 xen/arch/arm/traps.c             | 79 -----------------------------
 xen/arch/arm/vgic/vgic-v2.c      |  2 +-
 xen/arch/arm/vgic/vgic.c         |  2 +-
 6 files changed, 4 insertions(+), 168 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..ca622fc87d 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -18,6 +18,7 @@ config ARM
 	select HAS_PDX
 	select HAS_PMAP
 	select IOMMU_FORCE_PT_SHARE
+	select GENERIC_DO_BUG_FRAME
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index f4088d0913..841667411b 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -9,92 +9,6 @@
 # error "unknown ARM variant"
 #endif
 
-#define BUG_DISP_WIDTH    24
-#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
-#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
-
-struct bug_frame {
-    signed int loc_disp;    /* Relative address to the bug address */
-    signed int file_disp;   /* Relative address to the filename */
-    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
-    uint16_t line;          /* Line number */
-    uint32_t pad0:16;       /* Padding for 8-bytes align */
-};
-
-#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
-#define bug_file(b) ((const void *)(b) + (b)->file_disp);
-#define bug_line(b) ((b)->line)
-#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
-
-#define BUGFRAME_run_fn 0
-#define BUGFRAME_warn   1
-#define BUGFRAME_bug    2
-#define BUGFRAME_assert 3
-
-#define BUGFRAME_NR     4
-
-/* Many versions of GCC doesn't support the asm %c parameter which would
- * be preferable to this unpleasantness. We use mergeable string
- * sections to avoid multiple copies of the string appearing in the
- * Xen image. BUGFRAME_run_fn needs to be handled separately.
- */
-#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
-    BUILD_BUG_ON((line) >> 16);                                             \
-    BUILD_BUG_ON((type) >= BUGFRAME_NR);                                    \
-    asm ("1:"BUG_INSTR"\n"                                                  \
-         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
-         "2:\t.asciz " __stringify(file) "\n"                               \
-         "3:\n"                                                             \
-         ".if " #has_msg "\n"                                               \
-         "\t.asciz " #msg "\n"                                              \
-         ".endif\n"                                                         \
-         ".popsection\n"                                                    \
-         ".pushsection .bug_frames." __stringify(type) ", \"a\", %progbits\n"\
-         "4:\n"                                                             \
-         ".p2align 2\n"                                                     \
-         ".long (1b - 4b)\n"                                                \
-         ".long (2b - 4b)\n"                                                \
-         ".long (3b - 4b)\n"                                                \
-         ".hword " __stringify(line) ", 0\n"                                \
-         ".popsection");                                                    \
-} while (0)
-
-/*
- * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't set the
- * flag but instead rely on the default value from the compiler). So the
- * easiest way to implement run_in_exception_handler() is to pass the to
- * be called function in a fixed register.
- */
-#define  run_in_exception_handler(fn) do {                                  \
-    asm ("mov " __stringify(BUG_FN_REG) ", %0\n"                            \
-         "1:"BUG_INSTR"\n"                                                  \
-         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
-         "             \"a\", %%progbits\n"                                 \
-         "2:\n"                                                             \
-         ".p2align 2\n"                                                     \
-         ".long (1b - 2b)\n"                                                \
-         ".long 0, 0, 0\n"                                                  \
-         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \
-} while (0)
-
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
-extern const struct bug_frame __start_bug_frames[],
-                              __stop_bug_frames_0[],
-                              __stop_bug_frames_1[],
-                              __stop_bug_frames_2[],
-                              __stop_bug_frames_3[];
-
 #endif /* __ARM_BUG_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/div64.h b/xen/arch/arm/include/asm/div64.h
index 1cd58bc51a..fc667a80f9 100644
--- a/xen/arch/arm/include/asm/div64.h
+++ b/xen/arch/arm/include/asm/div64.h
@@ -74,7 +74,7 @@
 
 #elif __GNUC__ >= 4
 
-#include <asm/bug.h>
+#include <xen/bug.h>
 
 /*
  * If the divisor happens to be constant, we determine the appropriate
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 061c92acbd..751c3277aa 100644
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
diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
index 1a99d3a8b4..c90e88fddb 100644
--- a/xen/arch/arm/vgic/vgic-v2.c
+++ b/xen/arch/arm/vgic/vgic-v2.c
@@ -16,8 +16,8 @@
  */
 
 #include <asm/new_vgic.h>
-#include <asm/bug.h>
 #include <asm/gic.h>
+#include <xen/bug.h>
 #include <xen/sched.h>
 #include <xen/sizes.h>
 
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index f0f2ea5021..b9463a5f27 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -15,9 +15,9 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <xen/bug.h>
 #include <xen/list_sort.h>
 #include <xen/sched.h>
-#include <asm/bug.h>
 #include <asm/event.h>
 #include <asm/new_vgic.h>
 
-- 
2.39.0


