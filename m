Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2FE69D186
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 17:41:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498238.769096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9E3-0007Kq-K8; Mon, 20 Feb 2023 16:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498238.769096; Mon, 20 Feb 2023 16:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9E3-0007IT-GL; Mon, 20 Feb 2023 16:41:15 +0000
Received: by outflank-mailman (input) for mailman id 498238;
 Mon, 20 Feb 2023 16:41:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NJGl=6Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pU9E1-0006Vi-K6
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 16:41:13 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62e5efd1-b13d-11ed-933d-83870f6b2ba8;
 Mon, 20 Feb 2023 17:41:12 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id e9so1716249ljn.9
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 08:41:12 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a2e6a08000000b002934d555783sm65798ljc.6.2023.02.20.08.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 08:41:11 -0800 (PST)
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
X-Inumbo-ID: 62e5efd1-b13d-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vX3xq5gnben6ES0t2bFojgyY8cI1GFCJsQxOuCPDvE=;
        b=L3M4mVlMD3bSf6SRIPTWrEs+BMqXjJ2CSXtS9rAVuApr8G427G/XwkFRuftlgx0Cnu
         xnl4yBKbm/OcQUVcxWMhDUot7TJmQxeI2kovl8yDGUcB4Wo1h++PbdFcOVL3SAm4rvs8
         TdWg/L4ih5sZVCmcHts75X3Yh22ICYuwbCZUk8X+EkQMTF+nhMTQPbpMGpuhYpOa4d4R
         oLJ3W9Vlerc8rwNpRvMoY2BnQ5DFXGfu3AILgRapAX+m4c/jOp9ILgXvMXgDF1ysBoRY
         WKXGdRtrLOlB2NRiX/2uK2Ngpy/AaHRKTWJX06FvVVmvgrl4ERZ9ODkTGso1oUVg+zaG
         +ThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vX3xq5gnben6ES0t2bFojgyY8cI1GFCJsQxOuCPDvE=;
        b=fn7rwbVptoce5WLuYYR4qjpwirEbo0eE2FDtC77Xj2NlikoSC85SBQKMGNbF0JJI5L
         gc9fAO7PGJLxnvIL8lVgprvUw/zKpedJJcg5ByBKnTwdLBALfkQprXuZmSgg7perRRRd
         XqmpFescF+xjxp7eya05PONIpysSJltmvkfisU9pbxSLzZamzyC8Zzg9qLSoE9R56BmR
         BsH9I+ab5+W5fybQ6uZp8JcwhOUz+FSFyLHqRdQz+mRBMTVuuz1pvxD7KPHbBP1yhLKZ
         xSe6ss1L7kNAUvzFSFVD4qsfJKJYJQsarcjLTa3QkRKPGTOvdcUE0uMpr9bP0+DKbayC
         SW+A==
X-Gm-Message-State: AO0yUKV/FK3fH/1M3oK9FfLuF1TgdTqtNF1Q2cwg5rBAivqeTpl7DgW2
	h+GTK0rGN4cOY+0a4es6s9cq3QWwQlY=
X-Google-Smtp-Source: AK7set+9tUQdYT6JIbBO5d4ChaBSfxuBfihRwSW+P2DNFufmkvsKvtu3gKuL7h4Iz+JME9t0r4xi8A==
X-Received: by 2002:a2e:8708:0:b0:294:7327:4a0d with SMTP id m8-20020a2e8708000000b0029473274a0dmr652623lji.20.1676911272396;
        Mon, 20 Feb 2023 08:41:12 -0800 (PST)
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
Subject: [PATCH v2 3/4] xen/arm: switch ARM to use generic implementation of bug.h
Date: Mon, 20 Feb 2023 18:40:59 +0200
Message-Id: <fef3b0af0f74e94ab9c536f9adbfcea0b1a0cd8c.1676909088.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1676909088.git.oleksii.kurochko@gmail.com>
References: <cover.1676909088.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 * Rename bug_file() in ARM implementation to bug_ptr() as
   generic do_bug_frame() uses bug_ptr().
 * Remove generic parts from bug.h
 * Remove declaration of 'int do_bug_frame(...)'
   from <asm/traps.h> as it was introduced in <xen/bug.h>
---
 xen/arch/arm/Kconfig             |  1 +
 xen/arch/arm/include/asm/bug.h   | 32 +------------
 xen/arch/arm/include/asm/traps.h |  2 -
 xen/arch/arm/traps.c             | 79 --------------------------------
 4 files changed, 3 insertions(+), 111 deletions(-)

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
diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index f4088d0913..174cee477d 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -9,9 +9,7 @@
 # error "unknown ARM variant"
 #endif
 
-#define BUG_DISP_WIDTH    24
-#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
-#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
+#define BUG_FRAME_STRUCT
 
 struct bug_frame {
     signed int loc_disp;    /* Relative address to the bug address */
@@ -21,18 +19,10 @@ struct bug_frame {
     uint32_t pad0:16;       /* Padding for 8-bytes align */
 };
 
-#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
-#define bug_file(b) ((const void *)(b) + (b)->file_disp);
+#define bug_ptr(b) ((const void *)(b) + (b)->file_disp)
 #define bug_line(b) ((b)->line)
 #define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
 
-#define BUGFRAME_run_fn 0
-#define BUGFRAME_warn   1
-#define BUGFRAME_bug    2
-#define BUGFRAME_assert 3
-
-#define BUGFRAME_NR     4
-
 /* Many versions of GCC doesn't support the asm %c parameter which would
  * be preferable to this unpleasantness. We use mergeable string
  * sections to avoid multiple copies of the string appearing in the
@@ -77,24 +67,6 @@ struct bug_frame {
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
-extern const struct bug_frame __start_bug_frames[],
-                              __stop_bug_frames_0[],
-                              __stop_bug_frames_1[],
-                              __stop_bug_frames_2[],
-                              __stop_bug_frames_3[];
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
-- 
2.39.0


