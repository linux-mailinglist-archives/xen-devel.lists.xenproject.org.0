Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C67A769AB52
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 13:22:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497072.767995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSzku-0006fa-AT; Fri, 17 Feb 2023 12:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497072.767995; Fri, 17 Feb 2023 12:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSzku-0006dr-7P; Fri, 17 Feb 2023 12:22:24 +0000
Received: by outflank-mailman (input) for mailman id 497072;
 Fri, 17 Feb 2023 12:22:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VZJw=6N=citrix.com=prvs=405a65846=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSzks-0006dl-64
 for xen-devel@lists.xenproject.org; Fri, 17 Feb 2023 12:22:22 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7bc8775-aebd-11ed-93b5-47a8fe42b414;
 Fri, 17 Feb 2023 13:22:18 +0100 (CET)
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
X-Inumbo-ID: b7bc8775-aebd-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676636538;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v/Z10Nzrk4M4mUynfU62eVEu+jUOB6oerTObnDnAw5U=;
  b=DUJS/Bf3QZcSjbRO07AWJsGWJtr2m3q4L6ugtuxpNvJOySSi0O/2ETjn
   ookJc6XewHSWzb5G95JKnozOx3WEzj/pDDr4astzk38xvzb6luBUGHH6s
   Mh/+oJqk5i1lNL2ZuusiQ2jFQDQRm9YFPmQAxT3PxKIaLKfx52m+A7Oi/
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96302008
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:BbQ3pamZlmSazE+NAxe916vo5gyXJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKX2+Ba/jbZTOhc4p/Ooi1o08HsJ+DyN9gQAQ5ri1nRCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5QCGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cM/b2sifAuYu+Hs8bG3GupljM4qdsa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthfG/
 Tqcpzypav0cHMCQ9geL/Uqzv8LegwfQWdJKRZjh+vE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTRAjClAq8cL4nIJpvxHDHtVqGqS81NKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKvFmSx28zaK7onAMFh
 2eK4GtsCGd7ZifCUEOOS9vZ5z4W5abhD8/5cfvfc8BDZJN8HCfeon4wOBHKgzi9yxN8+U3aB
 Xt8WZzxZUv29Iw9lGbmLwvj+eFDKt8CKZP7GsmgkkXPPUu2b3+JU7YVWGZinchghJ5oVD79q
 o4FX+PTkkU3bQELSnWPmWLlBQxQfCdT6FGfg5A/S9Nv1SI/QT94W66Jkeh4E2Gn9owM/tr1E
 riGchcw4DLCabfvc21mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:50adT6+7yJxv7PNTNoxuk+BjI+orL9Y04lQ7vn2ZhyY1TiX+rb
 HJoB17726StN91YhsdcL+7VZVoLUmxyXcx2/hzAV9NNDOWxFdAb7sSkLcL+lXbalLDH5dmpN
 ldmspFaOEYfGIK6foSuzPIaurIqePvmMuVbKXlvhVQpGdRBJ2IhD0JbzpzfHcZeOBuP+tJKL
 OsouRGuhu9cjAtYsygAH5tZZm4m/T70LznfD8bDFod5AOPlDOl76OSKWni4j4uFx1O3JY/+i
 z/nwb4/6WutOz+4hLQzGPI9f1t6avc4+oGKsyQq9Qfbg/hjQulf+1aKsW/gAw=
X-IronPort-AV: E=Sophos;i="5.97,304,1669093200"; 
   d="scan'208";a="96302008"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1] xen: Work around Clang-IAS macro expansion bug
Date: Fri, 17 Feb 2023 12:22:03 +0000
Message-ID: <20230217122203.790737-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230217001914.762929-1-andrew.cooper3@citrix.com>
References: <20230217001914.762929-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

https://github.com/llvm/llvm-project/issues/60792

It turns out that Clang-IAS does not expand \@ uniquely in a translaition
unit, and the XSA-426 change tickles this bug:

  <instantiation>:4:1: error: invalid symbol redefinition
  .L1_fill_rsb_loop:
  ^
  make[3]: *** [Rules.mk:247: arch/x86/acpi/cpu_idle.o] Error 1

Extend DO_OVERWRITE_RSB with an optional parameter so C callers can mux %= in
too, which Clang does seem to expand properly.

Fixes: 63305e5392ec ("x86/spec-ctrl: Mitigate Cross-Thread Return Address Predictions")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v1 (vs RFC):
 * Rename \foo to \x, reorder WRT \@ to avoid needing \() too.

I originally tried a parameter named uniq but this found a different Clang-IAS
bug:

  In file included from arch/x86/asm-macros.c:3:
  ./arch/x86/include/asm/spec_ctrl_asm.h:139:5: error: \u used with no following hex digits; treating as '\' followed by identifier [-Werror,-Wunicode]
  .L\@\uniq\()fill_rsb_loop:
      ^

It appears that Clang is looking for unicode escapes before completing
parameter substitution.  But the macro didn't originate from a context where a
unicode escape was even applicable to begin with.

The consequence is that you can't use macro prameters beginning with a u.
---
 xen/arch/x86/include/asm/spec_ctrl.h     |  4 ++--
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 18 +++++++++++-------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 3cf8a7d304d4..ddb2247fcb0a 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -83,7 +83,7 @@ static always_inline void spec_ctrl_new_guest_context(void)
     wrmsrl(MSR_PRED_CMD, PRED_CMD_IBPB);
 
     /* (ab)use alternative_input() to specify clobbers. */
-    alternative_input("", "DO_OVERWRITE_RSB", X86_BUG_IBPB_NO_RET,
+    alternative_input("", "DO_OVERWRITE_RSB x=%=", X86_BUG_IBPB_NO_RET,
                       : "rax", "rcx");
 }
 
@@ -172,7 +172,7 @@ static always_inline void spec_ctrl_enter_idle(struct cpu_info *info)
      *
      * (ab)use alternative_input() to specify clobbers.
      */
-    alternative_input("", "DO_OVERWRITE_RSB", X86_FEATURE_SC_RSB_IDLE,
+    alternative_input("", "DO_OVERWRITE_RSB x=%=", X86_FEATURE_SC_RSB_IDLE,
                       : "rax", "rcx");
 }
 
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index fab27ff5532b..1220f219f695 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -117,11 +117,15 @@
 .L\@_done:
 .endm
 
-.macro DO_OVERWRITE_RSB tmp=rax
+.macro DO_OVERWRITE_RSB tmp=rax x=
 /*
  * Requires nothing
  * Clobbers \tmp (%rax by default), %rcx
  *
+ * x= is an optional parameter to work around
+ * https://github.com/llvm/llvm-project/issues/60792 where Clang-IAS doesn't
+ * expand \@ uniquely, and is intended for muxing %= in too.
+ *
  * Requires 256 bytes of {,shadow}stack space, but %rsp/SSP has no net
  * change. Based on Google's performance numbers, the loop is unrolled to 16
  * iterations and two calls per iteration.
@@ -136,27 +140,27 @@
     mov $16, %ecx                   /* 16 iterations, two calls per loop */
     mov %rsp, %\tmp                 /* Store the current %rsp */
 
-.L\@_fill_rsb_loop:
+.L\x\@_fill_rsb_loop:
 
     .irp n, 1, 2                    /* Unrolled twice. */
-    call .L\@_insert_rsb_entry_\n   /* Create an RSB entry. */
+    call .L\x\@_insert_rsb_entry_\n /* Create an RSB entry. */
     int3                            /* Halt rogue speculation. */
 
-.L\@_insert_rsb_entry_\n:
+.L\x\@_insert_rsb_entry_\n:
     .endr
 
     sub $1, %ecx
-    jnz .L\@_fill_rsb_loop
+    jnz .L\x\@_fill_rsb_loop
     mov %\tmp, %rsp                 /* Restore old %rsp */
 
 #ifdef CONFIG_XEN_SHSTK
     mov $1, %ecx
     rdsspd %ecx
     cmp $1, %ecx
-    je .L\@_shstk_done
+    je .L\x\@_shstk_done
     mov $64, %ecx                   /* 64 * 4 bytes, given incsspd */
     incsspd %ecx                    /* Restore old SSP */
-.L\@_shstk_done:
+.L\x\@_shstk_done:
 #endif
 .endm
 
-- 
2.30.2


