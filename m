Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E71E6A1B69
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 12:31:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500923.772491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWIJ-000573-CV; Fri, 24 Feb 2023 11:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500923.772491; Fri, 24 Feb 2023 11:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWIJ-00054K-7Z; Fri, 24 Feb 2023 11:31:19 +0000
Received: by outflank-mailman (input) for mailman id 500923;
 Fri, 24 Feb 2023 11:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVWIG-0004Z5-S3
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 11:31:16 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfdc4502-b436-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 12:31:15 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id j17so14012390ljq.11
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 03:31:15 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a2ea613000000b00295a815e555sm92682ljp.134.2023.02.24.03.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:31:15 -0800 (PST)
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
X-Inumbo-ID: bfdc4502-b436-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHOe3gWUHwieeNaUAZbwaaYvn/OKztq6D7rxSzkp37U=;
        b=nXD0eeC04kAsS+A9n1ec0duP6Z7xCP0jiZLGU+57mD38kYw4rCpdJF2NAKbEHt42Qb
         3zFp9xusxhT7PvWfJdDL022rDqS86UjH9fDwcyZ8rZWSau9y8fJDejuzzVWFhtcq0ZLT
         kzI//i4ZvmWw8ufi43iQfGYI/KxpyVSgkEa9ZH4Z6fv9qZdkVCE0/O0zYz4SbAlvNjfc
         gS1d4ymufnvzquYKIOX+kaY78Rcm1v2sPPRVGjI+N7//kQ7zw5VVNqAg96kElnHYC3b+
         ydujYcdlT9N8EG/NUMvk0whCagM8jQWVAKoklxkdjyESqiQFYlDJ/NTwKjpCraobqQ1L
         fybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHOe3gWUHwieeNaUAZbwaaYvn/OKztq6D7rxSzkp37U=;
        b=CUmwMPKIcvICgiwi0sMZepmizHWgU0LDlGv7r8V5tR9yDjmIKKYwwJhI0jIaFGyg+P
         YPc+TcRDrVRsptLuPz34i8I8NlnAHSChBclhD2JKlt+y8GOhKsTbzual37HZivaJ6lfd
         ugDJ5MX1tG3CIJRTn77/WjZ5BlQzEORz7iPbcMjKOp23KkPhnC5CvXAqkNNRRPMT6DYE
         iDnGoP7FxIWqspA43RoeBZwUDKSScftfcR7MuPmWSQ8Sum52HiQ/LWw50EnTpym2tJWQ
         I5NBiVPjfauL45nELcmgAB73hkUqItJuQ0QHynVtcjNkTQeofBSjCEodWlj/qIEzkKWQ
         hkwQ==
X-Gm-Message-State: AO0yUKXpnC0uaXu+GAhzust7RhW6ir1z8+/8BPV24gR52SkcS4BH5olJ
	4/HsDp4rLoER+hF06AyTogbNiT45+OA=
X-Google-Smtp-Source: AK7set+Xij/4ZC2hO7U4EhhN2RDupsNnQZm8MtDj4vPEbhS3DrR1uAbQI3sKaR+ET+UKMLFn0h4gVA==
X-Received: by 2002:a2e:be08:0:b0:282:d00d:4be6 with SMTP id z8-20020a2ebe08000000b00282d00d4be6mr7174601ljq.40.1677238275282;
        Fri, 24 Feb 2023 03:31:15 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 2/4] xen: change <asm/bug.h> to <xen/bug.h>
Date: Fri, 24 Feb 2023 13:31:05 +0200
Message-Id: <19404db4a577e17dffef85a101449a507965be19.1677233393.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677233393.git.oleksii.kurochko@gmail.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the generic version of bug.h stuff was introduced use <xen/bug.h>
instead of unnecessary <asm/bug.h>

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/arm/include/asm/bug.h       | 19 +++----------------
 xen/arch/arm/include/asm/div64.h     |  2 +-
 xen/arch/arm/vgic/vgic-v2.c          |  2 +-
 xen/arch/arm/vgic/vgic.c             |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |  2 +-
 xen/arch/x86/include/asm/asm_defns.h |  2 +-
 xen/arch/x86/include/asm/bug.h       | 19 ++-----------------
 xen/drivers/cpufreq/cpufreq.c        |  2 +-
 xen/include/xen/lib.h                |  2 +-
 9 files changed, 12 insertions(+), 40 deletions(-)

diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index f4088d0913..cacaf014ab 100644
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
@@ -9,9 +11,7 @@
 # error "unknown ARM variant"
 #endif
 
-#define BUG_DISP_WIDTH    24
-#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
-#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
+#define BUG_FRAME_STRUCT
 
 struct bug_frame {
     signed int loc_disp;    /* Relative address to the bug address */
@@ -26,13 +26,6 @@ struct bug_frame {
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
@@ -89,12 +82,6 @@ struct bug_frame {
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
index b7265bdfbe..4b3e7b019d 100644
--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -1,19 +1,10 @@
 #ifndef __X86_BUG_H__
 #define __X86_BUG_H__
 
-#define BUG_DISP_WIDTH    24
-#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
-#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
-
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
@@ -80,12 +71,6 @@ struct bug_frame {
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


