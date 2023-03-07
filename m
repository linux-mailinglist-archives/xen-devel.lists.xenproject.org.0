Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199916AE559
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:50:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507548.781208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZaH-000398-Na; Tue, 07 Mar 2023 15:50:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507548.781208; Tue, 07 Mar 2023 15:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZaH-00035G-Ge; Tue, 07 Mar 2023 15:50:37 +0000
Received: by outflank-mailman (input) for mailman id 507548;
 Tue, 07 Mar 2023 15:50:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zeiT=67=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pZZaF-0002jw-Si
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:50:36 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc2aa390-bcff-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 16:50:34 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso10716571wmq.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 07:50:34 -0800 (PST)
Received: from fedora.. (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c080700b003e21ba8684dsm13450744wmp.26.2023.03.07.07.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 07:50:33 -0800 (PST)
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
X-Inumbo-ID: cc2aa390-bcff-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678204234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdAbCYBuyKjn949EJzxdCxEuOobxphs23ThoiGVDWyI=;
        b=qRy8dMZ73mI7bvlMUMK1KbaHimifCeZ+TGJojUbvRHbMseaspWUjox77UD07qEkxul
         1lWy1ea5A9ntIROf7kMj3Rl2yprEaN7M1sDFeUg2mOX78ejv385LjCfzATlg6aKc2YXb
         OBrEOPIdhH4OQyvjKgecaYUPqN8ESV8PpNGrS68lwp7DxLd+XAzs/kN80NF/zSFxyoks
         88Tec8H+ULBthmGVSd0+NwgrHhKD/S3xOGMJuVxF/WJLDvERx6tAw8v1jBixgrUf00Jw
         nKuwgkyDB8lA0dpwvKdRNiT7ewT03da66c6cjwOQZgcLI0M7SU/V8BZAytuV2DEIZt8i
         yAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678204234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdAbCYBuyKjn949EJzxdCxEuOobxphs23ThoiGVDWyI=;
        b=j2wqqP7b7+5imH1DB5m5LCSEnLKlrtlo3Q4yCMOU0hxA7FcLt/RIleIc6rR1Slw3bU
         X+5KGuF8UHZFXelo/gwCgGE0kxwz3XUKje8cBI7KB2z6bZ7s2NHmY8ZZSwx6424IF/bm
         xfkOA8ZZs4jROut9MbY7tB8v0DDvCcimGSN51zwksYTg++KVfioTewvDtg9PLGh0rIym
         L2GhSMiuNh97FIbUgAawr6ZQP+/adMVpBgHuw/H9k6kPQwNjUExdZZSNUecc6tE5isNq
         Uepql1D1q5ML24IGDoTBFhZ/K+i1Wi1Hwxe29NEvfsHdgMhqRy6LeqFCG3U2uF0rUtCi
         w/NQ==
X-Gm-Message-State: AO0yUKUn1W4R5BDq6TlxYlgx0kAYUgN2Aeg79dHOdZ4xm/lcizsjBVQc
	W3FQCFw8EvPE1AyJwwwZRxXKzkIBlfY=
X-Google-Smtp-Source: AK7set9ojmXXdl1g77F/MlLkraj3E5pit7HljWz8wg/mHRidKezK2J+rD9ZrW/GNz1nsfbGl605mgQ==
X-Received: by 2002:a05:600c:1c1f:b0:3eb:246d:7efd with SMTP id j31-20020a05600c1c1f00b003eb246d7efdmr12778524wms.2.1678204233866;
        Tue, 07 Mar 2023 07:50:33 -0800 (PST)
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
Subject: [PATCH v6 2/4] xen: change <asm/bug.h> to <xen/bug.h>
Date: Tue,  7 Mar 2023 17:50:24 +0200
Message-Id: <d8722046783462504d5396f7f880ff62b1ef9a90.1678202233.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1678202233.git.oleksii.kurochko@gmail.com>
References: <cover.1678202233.git.oleksii.kurochko@gmail.com>
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
5. It was added undef of BUG_DISP_WIDTH, BUG_LINE_LO_WIDTH
  for ARM & x86 as they were introduced unconditionally in <xen/bug.h>.
  The macros should be defined before <asm/bug.h> in <xen/bug.h> as x86's
  <asm/bug.h> implementation requires them in case when the header is
  included in assembly code.
  The macros will be deleted in the following patches where
  the architectures will be switched fully to generic implementation.

In the following two patches x86 and ARM archictectures will be
switched fully:
* xen/arm: switch ARM to use generic implementation of bug.h
* xen/x86: switch x86 to use generic implemetation of bug.h

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/arm/include/asm/bug.h       | 21 ++++++++-------------
 xen/arch/arm/include/asm/div64.h     |  2 +-
 xen/arch/arm/vgic/vgic-v2.c          |  2 +-
 xen/arch/arm/vgic/vgic.c             |  2 +-
 xen/arch/x86/acpi/cpufreq/cpufreq.c  |  2 +-
 xen/arch/x86/include/asm/asm_defns.h |  2 +-
 xen/arch/x86/include/asm/bug.h       | 19 ++++++-------------
 xen/drivers/cpufreq/cpufreq.c        |  2 +-
 xen/include/xen/lib.h                |  2 +-
 9 files changed, 21 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/include/asm/bug.h b/xen/arch/arm/include/asm/bug.h
index f4088d0913..9ed9412fa8 100644
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
@@ -9,10 +11,16 @@
 # error "unknown ARM variant"
 #endif
 
+#undef BUG_DISP_WIDTH
+#undef BUG_LINE_LO_WIDTH
+#undef BUG_LINE_HI_WIDTH
+
 #define BUG_DISP_WIDTH    24
 #define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
 #define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
 
+#define BUG_FRAME_STRUCT
+
 struct bug_frame {
     signed int loc_disp;    /* Relative address to the bug address */
     signed int file_disp;   /* Relative address to the filename */
@@ -26,13 +34,6 @@ struct bug_frame {
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
@@ -89,12 +90,6 @@ struct bug_frame {
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
index b7265bdfbe..ff5cca1f19 100644
--- a/xen/arch/x86/include/asm/bug.h
+++ b/xen/arch/x86/include/asm/bug.h
@@ -1,19 +1,18 @@
 #ifndef __X86_BUG_H__
 #define __X86_BUG_H__
 
+#undef BUG_DISP_WIDTH
+#undef BUG_LINE_LO_WIDTH
+#undef BUG_LINE_HI_WIDTH
+
 #define BUG_DISP_WIDTH    24
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
@@ -80,12 +79,6 @@ struct bug_frame {
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


