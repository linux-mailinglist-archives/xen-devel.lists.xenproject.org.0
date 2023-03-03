Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A686A9563
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 11:38:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505813.778781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2o7-0006Aj-Ik; Fri, 03 Mar 2023 10:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505813.778781; Fri, 03 Mar 2023 10:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY2o7-000639-Ct; Fri, 03 Mar 2023 10:38:35 +0000
Received: by outflank-mailman (input) for mailman id 505813;
 Fri, 03 Mar 2023 10:38:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y5Qx=63=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pY2o6-0005jk-5R
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 10:38:34 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b2a5923-b9af-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 11:38:32 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id r27so2954708lfe.10
 for <xen-devel@lists.xenproject.org>; Fri, 03 Mar 2023 02:38:32 -0800 (PST)
Received: from fedora.. (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 d11-20020ac25ecb000000b004cb3a55feacsm338760lfq.100.2023.03.03.02.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 02:38:31 -0800 (PST)
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
X-Inumbo-ID: 8b2a5923-b9af-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677839912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oruXISOzbtYmsjJP9608NUUX4p1qMmDHX62cBBlU67Q=;
        b=T4ZzVZJADkACXJpTwzSpuzk0Juamfu/B3GEmo4X+fYL4UDjugiv+PmRUe9SMftPY5/
         cLPNG1H+v3g4j6OTXb6vA0ne9NybG8sSedxoyn6x2Qfs364q7Ta+KLEoJP632Bs2f0O2
         hM4MeW2wItSmczmPWAix8xlkukalRficE2kDzLVRuS0gZzwdNmSPggie9ZvII0XvVvf7
         bIYG5A2AyhsaqTYtgYqunRZWUIfQvD0C496hWUO4GEiimbprM3FZu1k0rXVgIl0rnpsN
         Dk6SGAQsoiczHQLxXljR1inHq9r2qrBKvaTrGFL/xvSRivNGqaE115AZfcwqviP/Zzyk
         6+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677839912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oruXISOzbtYmsjJP9608NUUX4p1qMmDHX62cBBlU67Q=;
        b=qU1rQgCOMtuyitZ0gbmcco5j7gw/xIh0lASkbJd67luvf6qleLThGsXem2GpK9Z5GV
         reHQQPKJXx7RMSLEFGPxU/2LyXxsIqTY5s8eLQhIhchHYKEaqElUeqcA77aLWXT5GSuw
         xg4OUqCg2cphn4Ga4MXln0UueTuUHmB7KreTFTN9oYmnZqYXuHXP7JKQ4jtzDS9/BNwj
         z33XjzpIp2++Kel8EGfAWExXC7bSGpFnHd9IrgoP1qlcfsK7MmMjUI5s0LzFEApvLJmQ
         7a7lQagVQNuuWzsDJ8bNodsVPnsHiry7DQN5N0p9UPpmrPGNiD4Ib2hlLno7BuSsZZ0W
         9beg==
X-Gm-Message-State: AO0yUKXa/qyfC1qdCXDp6CulrJeKVXpqt5UsJDYEkLCw6F3Dbgls3JD7
	XRh6MmheGgIlrhjiMXbKMMkEDUdf2Kw=
X-Google-Smtp-Source: AK7set8z6ttBU7k62qkCUu7V/uYCbZELCN61J9yKFY7e74qSUh/e4Qn70pVNDvPiDGzfpGNlxomjPw==
X-Received: by 2002:ac2:598c:0:b0:4b0:1305:6ebf with SMTP id w12-20020ac2598c000000b004b013056ebfmr387484lfn.53.1677839911779;
        Fri, 03 Mar 2023 02:38:31 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 2/4] xen: change <asm/bug.h> to <xen/bug.h>
Date: Fri,  3 Mar 2023 12:38:23 +0200
Message-Id: <f108147036c9e35b156b45c0f52779cea09025c9.1677839409.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677839409.git.oleksii.kurochko@gmail.com>
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
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
Changes in V5:
 - Nothing changed
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


