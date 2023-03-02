Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5086A7D7D
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 10:21:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504740.777106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXf7B-0008I3-7m; Thu, 02 Mar 2023 09:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504740.777106; Thu, 02 Mar 2023 09:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXf7B-0008G8-4U; Thu, 02 Mar 2023 09:20:41 +0000
Received: by outflank-mailman (input) for mailman id 504740;
 Thu, 02 Mar 2023 09:20:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXf78-0007lq-V8
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 09:20:39 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e169d6e-b8db-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 10:20:37 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id y14so16896179ljq.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 01:20:37 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 g7-20020a2eb5c7000000b002946be8475esm2018442ljn.135.2023.03.02.01.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 01:20:36 -0800 (PST)
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
X-Inumbo-ID: 7e169d6e-b8db-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677748836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Waw8pBXblK+xZc6vswBktKkR2DVB9FDOMeQq9ioH4E=;
        b=jD/sJ3fX1ZQEmzUegARf5sCcr4BHt3w57fF0l2sqRqmELn+egrLWYc57LhWBpIf+0m
         D4ix54rHtbTlwWKSJllBxLzfOY5I6HFjwdHYCkUgNHkD5ZN9Rd/7coZSML3edlfBZ8/h
         NPC3C2PRysVfj/lAs5JVXCh3xSeCI1++tzOJNyjwI8YHu9B0fpj78Sm0DjVgDJ5SQZDs
         7vl/jLrVRuxrNt52O3/X+cn6Rve0j3alJfAk/HNFZ8Xh3wgaWX9l9ST04J8hWAebZXmg
         MRSReRd1egytau2nwGzfHz/jxUTw5WYb22lX7T/GsWmqV9v2gmAyZXsa8C69BNdyskJE
         ohow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677748836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Waw8pBXblK+xZc6vswBktKkR2DVB9FDOMeQq9ioH4E=;
        b=UPaWzrVReC8CmWwgyrdlHp0zY5H0BDLw7eSwJEcdRzjPYN+KQATRTM5uLpRfY/SqZn
         UgXrCaHroljmSi7KxZN5YaluY7jiTRpVoyq7StmdPitjrN8khDHpWCKNtzgE8JBtF42P
         tug/Z4rdz9uzIcexCmSANrjJBuawlqcW0emjtBH9lzO1s6csVyg75IggF8ap/VFcecjx
         wLarccqbTMK7Ksbh1kbnyB88yk+5CZGScZM1xeJHtJDYuBi6Z8V53mjiwj/rEAZnDMa4
         maGP8QBaHEJyIsDO5NGrZzbQToMj3dePYFP3gUgfmlZhydsafhwIDRBwim1tp5FMqFeA
         DYKg==
X-Gm-Message-State: AO0yUKWfGi3XHuJRwtZngx1iOkdWeSS73WQR9y6IwMMLqaC+nlkyI9IC
	JH1lJH00Tt/z84Du1Of5mNpwjY9TKVY=
X-Google-Smtp-Source: AK7set8zoA9Df/E9ozpTWURcy/nv4HyMYrsSvPmGf6TrUsZ2mvz1m0P9tgiMRQ/QExJInckVTwa9hA==
X-Received: by 2002:a2e:9e94:0:b0:295:93eb:1c01 with SMTP id f20-20020a2e9e94000000b0029593eb1c01mr2982466ljk.25.1677748836505;
        Thu, 02 Mar 2023 01:20:36 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 2/4] xen: change <asm/bug.h> to <xen/bug.h>
Date: Thu,  2 Mar 2023 11:20:26 +0200
Message-Id: <147cddf155d738bd5ed3023bb5152ce95a73c21d.1677747527.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677747527.git.oleksii.kurochko@gmail.com>
References: <cover.1677747527.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The idea of the patch is to change all <asm/bug.h> to <xen/bug.h> and
keep Xen compilable with adding only minimal amount of changes:
1. It was added "#include <xen/types.h>" to ARM's "<asm/bug.h>" as it
  uses uint_{16,32}t in 'struct bug_frame'.
2. It was added '#define BUG_FRAME_STRUCT' which means that ARM hasn't
  been switched to generic implementation yet.
3. It was added '#define BUG_FRAME_STRUCT' which means that x86 hasn't
  been switched to generic implementation yet.
4. BUGFRAME_* and _start_bug_frame[], _stop_bug_frame_*[] were removed
  for ARM & x86 to deal with compilation errors such as:
      redundant redeclaration of ...

In the following two patches x86 and ARM archictectures will be
switched fully:
* xen/arm: switch ARM to use generic implementation of bug.h
* xen/x86: switch x86 to use generic implemetation of bug.h

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
	- defines BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH, BUG_LINE_HI_WIDTH were moved into
	  "ifndef BUG_FRAME_STRUCT" in <xen/bug.h> as they are specific for 'struct bug_frame' and so should
	  co-exist together. So the defines were back to <asm/bug.h> until BUG_FRAME_STRUCT will be defined in
	  <asm/bug.h>.
	- Update the comment message.
---
Changes in V3:
 * Update patch 2 not to break compilation: move some parts from patches 3 and 4
   to patch 2:
   * move some generic parts from <asm/bug.h> to <xen/bug.h>
   * add define BUG_FRAME_STRUCT in ARM's <asm/bug.h>
---
Changes in V2:
 * Put [PATCH v1 4/4] xen: change <asm/bug.h> to <xen/bug.h> as second patch,
   update the patch to change all <asm/bug.h> to <xen/bug.h> among the whole project
   to not break build.
 * Update the commit message.
---
 xen/arch/arm/include/asm/bug.h       | 17 ++++-------------
 xen/arch/arm/include/asm/div64.h     |  2 +-
 xen/arch/arm/vgic/vgic-v2.c          |  2 +-
 xen/arch/arm/vgic/vgic.c             |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |  2 +-
 xen/arch/x86/include/asm/asm_defns.h |  2 +-
 xen/arch/x86/include/asm/bug.h       | 15 ++-------------
 xen/drivers/cpufreq/cpufreq.c        |  2 +-
 xen/include/xen/lib.h                |  2 +-
 9 files changed, 13 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index f4088d0913..9315662c6e 100644
--- a/xen/arch/arm/include/asm/bug.h
+++ b/xen/arch/arm/include/asm/bug.h
@@ -1,6 +1,8 @@
 #ifndef __ARM_BUG_H__
 #define __ARM_BUG_H__
 
+#include <xen/types.h>
+
 #if defined(CONFIG_ARM_32)
 # include <asm/arm32/bug.h>
 #elif defined(CONFIG_ARM_64)
@@ -13,6 +15,8 @@
 #define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
 #define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
 
+#define BUG_FRAME_STRUCT
+
 struct bug_frame {
     signed int loc_disp;    /* Relative address to the bug address */
     signed int file_disp;   /* Relative address to the filename */
@@ -26,13 +30,6 @@ struct bug_frame {
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
@@ -89,12 +86,6 @@ struct bug_frame {
     unreachable();                                              \
 } while (0)
 
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
 
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index c27cbb2304..18ff2a443b 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -27,6 +27,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
+#include <xen/bug.h>
 #include <xen/types.h>
 #include <xen/errno.h>
 #include <xen/delay.h>
@@ -35,7 +36,6 @@
 #include <xen/sched.h>
 #include <xen/timer.h>
 #include <xen/xmalloc.h>
-#include <asm/bug.h>
 #include <asm/msr.h>
 #include <asm/io.h>
 #include <asm/processor.h>
diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index d9431180cf..a8526cf36c 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -6,7 +6,7 @@
 /* NB. Auto-generated from arch/.../asm-offsets.c */
 #include <asm/asm-offsets.h>
 #endif
-#include <asm/bug.h>
+#include <xen/bug.h>
 #include <asm/x86-defns.h>
 #include <xen/stringify.h>
 #include <asm/cpufeature.h>
diff --git a/xen/arch/x86/include/asm/bug.h b/xen/arch/x86/include/asm/bug.h
index b7265bdfbe..79133e53e7 100644
--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -5,15 +5,10 @@
 #define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
 #define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
 
-#define BUGFRAME_run_fn 0
-#define BUGFRAME_warn   1
-#define BUGFRAME_bug    2
-#define BUGFRAME_assert 3
-
-#define BUGFRAME_NR     4
-
 #ifndef __ASSEMBLY__
 
+#define BUG_FRAME_STRUCT
+
 struct bug_frame {
     signed int loc_disp:BUG_DISP_WIDTH;
     unsigned int line_hi:BUG_LINE_HI_WIDTH;
@@ -80,12 +75,6 @@ struct bug_frame {
     unreachable();                                              \
 } while (0)
 
-extern const struct bug_frame __start_bug_frames[],
-                              __stop_bug_frames_0[],
-                              __stop_bug_frames_1[],
-                              __stop_bug_frames_2[],
-                              __stop_bug_frames_3[];
-
 #else  /* !__ASSEMBLY__ */
 
 /*
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index a94520ee57..354f78580b 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -26,6 +26,7 @@
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  */
 
+#include <xen/bug.h>
 #include <xen/types.h>
 #include <xen/errno.h>
 #include <xen/delay.h>
@@ -39,7 +40,6 @@
 #include <xen/guest_access.h>
 #include <xen/domain.h>
 #include <xen/cpu.h>
-#include <asm/bug.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 05ee1e18af..e914ccade0 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -24,12 +24,12 @@
 
 #ifndef __ASSEMBLY__
 
+#include <xen/bug.h>
 #include <xen/inttypes.h>
 #include <xen/stdarg.h>
 #include <xen/types.h>
 #include <xen/xmalloc.h>
 #include <xen/string.h>
-#include <asm/bug.h>
 
 #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
 #define WARN_ON(p)  ({                  \
-- 
2.39.0


