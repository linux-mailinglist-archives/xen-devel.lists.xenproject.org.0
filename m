Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED87A6789
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 17:02:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604862.942387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicET-0004k1-Bz; Tue, 19 Sep 2023 15:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604862.942387; Tue, 19 Sep 2023 15:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicET-0004hq-9C; Tue, 19 Sep 2023 15:01:45 +0000
Received: by outflank-mailman (input) for mailman id 604862;
 Tue, 19 Sep 2023 15:01:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+GSz=FD=citrix.com=prvs=61920ccf8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qicER-0004hk-SD
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 15:01:43 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e5c92cc-56fd-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 17:01:41 +0200 (CEST)
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
X-Inumbo-ID: 6e5c92cc-56fd-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695135701;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XiBujX9PNvgiTmmue4/CPkKhzecl8JFFLO6da/m2ZtI=;
  b=Cc83lbpJcwkRe3a3s3wBeaEM+6jqZg6mjvlwitQbM2eb6KP9h9m1mW5Z
   BHVRtkvrh1XTppQuo6YsknQUuucS7K8yQjthz7kRbhA9Pp4sdZ1hGy56d
   kY4VPnJaUOSgUDmBkDnGw6+dlsSwuIhk76j+SiG/1Da1cqCTqOlCh/Iub
   Y=;
X-CSE-ConnectionGUID: /dOcb3KHQy+W9g9JxBCISA==
X-CSE-MsgGUID: kE9WnLUcSQSGI9gZ2yUYXg==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 122969720
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:tOWcLq8JJmXdLk0Y+diGDrUDkH6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GtLWjqGaK7bM2LyfIh/PIm180lXsJTSzNIyQVZppCE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks11BjOkGlA5AdmNKka5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkJ+
 dsTImsuTimSxN3nz+OZWsNHp/8KeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxBzJ+
 DOZpTyR7hcyN/HO9jyhz3mXv9TgvHL0atgDKYyI+as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 mJlhPuwW2Yp6ufMDyvAqPHN92ja1TUpwXEqIiMjRgFewPnascIM3x2ebMZJO4+Op4igcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVdoBiN2dDB0zWirhRdMOS
 BG7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHWoXkwPxbNhzC8wCDAdJ3T3
 r/BK66R4YsyU/w7nFJauc9NuVPU+szO7TyKHs2qp/hW+bGfeGSUWd843KimN4gEAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/FqmhmreVY/RDt9V6KPn9vMueVNxsxoqwsBx
 VnlMmcw9bY1rSScdW1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:6cjZFalpWhvnHGV4rLgy/+sXDXHpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-Talos-CUID: =?us-ascii?q?9a23=3AwHde6msOa1t2L9aGRF9CGSmS6ItiflrWxizzA3a?=
 =?us-ascii?q?pSlk4R+y3WXW72ZhNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A1+gD7Q9GR8GCEfyykYxWrs2Qf8RFspuoLH0Gqqw?=
 =?us-ascii?q?9lOjVOh4qKgqsvDviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,159,1688443200"; 
   d="scan'208";a="122969720"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/entry: Partially revert IST-exit checks
Date: Tue, 19 Sep 2023 16:01:08 +0100
Message-ID: <20230919150108.1233582-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The patch adding check_ist_exit() neglected to consider reset_stack_and_jump()
leaving C and entering one of the Xen exit paths.  The value in %r12 is stale,
and depending on compiler decisions may not be 0.

This shows up in Gitlab CI for the Clang build:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/5112783827

and in OSSTest for GCC 8:

  http://logs.test-lab.xenproject.org/osstest/logs/183045/test-amd64-amd64-xl-qemuu-debianhvm-amd64/serial-pinot0.log

There's no straightforward way to reconstruct the IST-exit-ness on the
exit-to-guest path after a context switch.  For now, we only need IST-exit on
the return-to-Xen path.

Fixes: 21bdc25b05a0 ("x86/entry: Track the IST-ness of an entry for the exit paths")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Rewrite.
---
 xen/arch/x86/x86_64/compat/entry.S | 9 +--------
 xen/arch/x86/x86_64/entry.S        | 9 +--------
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index 7504bfb4f326..bd5abd8040bd 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -117,15 +117,8 @@ compat_process_trap:
         call  compat_create_bounce_frame
         jmp   compat_test_all_events
 
-/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
+/* %rbx: struct vcpu, interrupts disabled */
 ENTRY(compat_restore_all_guest)
-
-#ifdef CONFIG_DEBUG
-        mov   %rsp, %rdi
-        mov   %r12, %rsi
-        call  check_ist_exit
-#endif
-
         ASSERT_INTERRUPTS_DISABLED
         mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
         and   UREGS_eflags(%rsp),%r11d
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 988ef6cbc628..5ca74f5f62b2 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -142,15 +142,8 @@ process_trap:
 
         .section .text.entry, "ax", @progbits
 
-/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
+/* %rbx: struct vcpu, interrupts disabled */
 restore_all_guest:
-
-#ifdef CONFIG_DEBUG
-        mov   %rsp, %rdi
-        mov   %r12, %rsi
-        call  check_ist_exit
-#endif
-
         ASSERT_INTERRUPTS_DISABLED
 
         /* Stash guest SPEC_CTRL value while we can read struct vcpu. */

base-commit: ea36ac0de27c2a7c847a2a52c3e0f97a45864d81
-- 
2.30.2


