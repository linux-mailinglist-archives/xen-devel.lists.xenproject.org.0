Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC406BBABB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 18:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510154.787381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcUp5-0005fc-Q1; Wed, 15 Mar 2023 17:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510154.787381; Wed, 15 Mar 2023 17:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcUp5-0005d1-Mc; Wed, 15 Mar 2023 17:21:59 +0000
Received: by outflank-mailman (input) for mailman id 510154;
 Wed, 15 Mar 2023 17:21:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ux93=7H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcUp3-0004sk-TI
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 17:21:58 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e32ba83b-c355-11ed-87f5-c1b5be75604c;
 Wed, 15 Mar 2023 18:21:57 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id fd5so44520765edb.7
 for <xen-devel@lists.xenproject.org>; Wed, 15 Mar 2023 10:21:57 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 d20-20020a50cd54000000b004fd1ee3f723sm2736315edj.67.2023.03.15.10.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 10:21:55 -0700 (PDT)
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
X-Inumbo-ID: e32ba83b-c355-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678900916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+PmMlnEPdzmGx7OHR5mV8XdW/MmTlCLg2ne1c+/IvU=;
        b=k7roXrRcX6Bpk78RNjcXB3b2Bfcqfu5Di4UxnmoDdElh4VwNxPAn/JyGRR8Ix05U+I
         w8c4oCx+ktpySDo05EA7kqmfzEYlCgOUGveBITAKZktaPU+YfviiKBMQGCPI6hDNUKya
         NANaBEWdDMc6EJWi/eg7JlvoPF9cJO4wxSLBqVrnf+Q1rqxNGVOZhZRY4x5YWY3Q22XS
         hVZoZMemQbYdxhpu2UFFMZQyaPONW8Gv/ZqZNiagLuVmZ+LgGwpAsJ0FFTmfx+OYdTaQ
         rYmQTYX2FF7RV0hBeTUt91VZzjlXNUcF0Q3NE9y0pwUWLFFj4pnOV/R6Y6SQDBzWsm8A
         sS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678900916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+PmMlnEPdzmGx7OHR5mV8XdW/MmTlCLg2ne1c+/IvU=;
        b=kEi+zKzQQlky76kwLjGbwYpwVm2oNVwijNQuu11KOp39rGIGFEtkWiQPZML9sMb0VH
         KWuRNKBOFa78Alw0YRqSslfAGf0oBXmUb938527AfHH0sN2flZ09uWccUem+09XOGx9W
         tPoUsbSAV55Rys2jwSyyPj8V35ILyqYUsKD+1NbgFs2usxd8VGFHU//lbyy8BzzAUGQM
         bsxlKv0/5LWwk3qxX/IOUQwjWVR1Y6uUk2W63KOUnWwjfW6XGeyMzJnO3YtP8wgvYYoz
         nrbDL2tiYJIM4BLIoRVlXoFP7W9TIkl+WZZdhA+kZpk51pAxFcG5RrvcM0ZIsdIPOKkX
         3F/Q==
X-Gm-Message-State: AO0yUKX1kin1ag6Z8D+gYeE06eBctCKCC+B8nKkm4Dj3uitiGz7o30zU
	fqV//JF/+WcFVkEWHO75MoMnH9kriNE=
X-Google-Smtp-Source: AK7set+m+ig9UuFSBij8snfu9amN9IICs8s52DRunUmPOfjXrZudNPhvqtm4JSdn6gJEQLB7ilGKjA==
X-Received: by 2002:a17:906:b7d8:b0:927:d9ad:804d with SMTP id fy24-20020a170906b7d800b00927d9ad804dmr7402772ejb.7.1678900916167;
        Wed, 15 Mar 2023 10:21:56 -0700 (PDT)
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
Subject: [PATCH v8 3/5] xen: change <asm/bug.h> to <xen/bug.h>
Date: Wed, 15 Mar 2023 19:21:45 +0200
Message-Id: <ab7e8ffada67a973e58a8b76dc39d4cc6f8b9fa2.1678900513.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678900513.git.oleksii.kurochko@gmail.com>
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
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
5. Remove BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH, BUG_LINE_HI_WIDTH from
  x86's <asm.bug.h> to not to produce #undef for them and #define again
  with the same values as in <xen/bug.h>. These #undef and #define will
  be anyway removed in the patch [2]
6. Remove <asm/bug.h> from <x86/acpi/cpufreq/cpufreq.c> and
  <drivers/cpufreq/cpufreq.c> as nothing from <xen/bug.h> are used in
  <*/cpufreq.c>

In the following two patches x86 and ARM archictectures will be
switched fully:
[1] xen/arm: switch ARM to use generic implementation of bug.h
[2] xen/x86: switch x86 to use generic implemetation of bug.h

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V8:
 * remove <asm/bug.h> from <x86/acpi/cpufreq/cpufreq.c> and
   <drivers/cpufreq/cpufreq.c> as nothing from <xen/bug.h> are used in
   <*/cpufreq.c>
 * update the commit message
---
Changes in V7:
 * Remove #undef {BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH, BUG_LINE_HI_WIDTH} from
   ARM and x86:
   * for ARM was created separate patch where the defines are removed as
     unused.
   * for x86, the defines were removed now not to produce #undef of them to remove
            them again in the following-up patch
 * Update commit message
 * Add Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V6:
	- change the inclusion order of <xen/bug.h>.
	- add #undef of BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH for ARM & x86
	  as they were introduced unconditionally in <xen/bug.h>.
	- update the commit message
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
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |  1 -
 xen/arch/x86/include/asm/asm_defns.h |  2 +-
 xen/arch/x86/include/asm/bug.h       | 19 ++-----------------
 xen/drivers/cpufreq/cpufreq.c        |  1 -
 xen/include/xen/lib.h                |  2 +-
 9 files changed, 11 insertions(+), 37 deletions(-)

diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index d6c98505bf..cacaf014ab 100644
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
@@ -9,6 +11,8 @@
 # error "unknown ARM variant"
 #endif
 
+#define BUG_FRAME_STRUCT
+
 struct bug_frame {
     signed int loc_disp;    /* Relative address to the bug address */
     signed int file_disp;   /* Relative address to the filename */
@@ -22,13 +26,6 @@ struct bug_frame {
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
@@ -85,12 +82,6 @@ struct bug_frame {
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
index c27cbb2304..2e0067fbe5 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -35,7 +35,6 @@
 #include <xen/sched.h>
 #include <xen/timer.h>
 #include <xen/xmalloc.h>
-#include <asm/bug.h>
 #include <asm/msr.h>
 #include <asm/io.h>
 #include <asm/processor.h>
diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
index d9431180cf..baaaccb26e 100644
--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -6,8 +6,8 @@
 /* NB. Auto-generated from arch/.../asm-offsets.c */
 #include <asm/asm-offsets.h>
 #endif
-#include <asm/bug.h>
 #include <asm/x86-defns.h>
+#include <xen/bug.h>
 #include <xen/stringify.h>
 #include <asm/cpufeature.h>
 #include <asm/alternative.h>
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
index a94520ee57..2321c7dd07 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -39,7 +39,6 @@
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
2.39.2


