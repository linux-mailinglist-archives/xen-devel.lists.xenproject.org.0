Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043084B5124
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:07:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271777.466500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb45-00073Y-Gg; Mon, 14 Feb 2022 13:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271777.466500; Mon, 14 Feb 2022 13:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb44-0006u3-UY; Mon, 14 Feb 2022 13:06:48 +0000
Received: by outflank-mailman (input) for mailman id 271777;
 Mon, 14 Feb 2022 13:06:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3J-00023t-F4
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9d7fb2a-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:05:59 +0100 (CET)
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
X-Inumbo-ID: d9d7fb2a-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=FaRq4uMLqchtYBsH0ZZXc1AMBt9Hn3Liv9Sb03AHXI0=;
  b=B5cLgp3C7y0GYo1Ykoro8F+fHs3iqBrVbnXxYXnQ8Ps103Z/Ork7ywm9
   BppRO1s8pHAw5mcwYJPxhvo0zqj74n4WG53r5Q4qoQJ9vGKKxwiZnax/S
   JTOl/DIrzAupa/bRRKqynUEetcyY2hiGRKv1+KyiyvC7kZYn13etbgt3O
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3HmRFu2V3WurqLDDXunRl3owx5tt8Ietenwy3QtwnZ0FP18z5TgqQJdGbIDDBOpPso1OhSrLlN
 Q38UQ8lu75VdBRqISRBBmB7UJbhVIF9lbjg3dv4emhifGVkCHZB6kWwpdwjEOB5VdRUoH/xwZq
 9D4ebPhhXa5R6TSBUVsPXfF7mgDauGOzIqQJBU3tMWUMUOVf/2NACizqtDIVMb/IMIzZVkLWUu
 N1kWc0dFsktAVvvQS3kOVgP/bohZ/8s0fIdaUgI9zAvNLvaRl0H/wskze5jw5GV55seF+8s0zx
 tR8672NT/dAFTNpv+KV15bdD
X-SBRS: 5.1
X-MesageID: 63592666
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qM4d1K4AjQLSdC51ES03egxRtCbAchMFZxGqfqrLsTDasY5as4F+v
 mJLCGyDbP7cZzShc9t0Pomz80wOu5bQzNdnTAJuqi4zHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj29Iw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 pJiq6GycCgVGKzchdQjcDdkInBCIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQRquPP
 ZRHN1KDajyQWzRMJ30IOqhimequxVnRTQZH9nus8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvGtJk6TePisKQw2RvKmzJVWEZ+uUaHTeeRrAmRRe9dE
 mMo3Cs+sJgM12KXf4jBQEjtyJKbhSI0V91VGuw8zQiCzKvI/gqUblQ5oi59hM8O75FvG2Fzv
 rOdt5awXGE07uXJIZ6I3urM9VuP1T4pwXjujMPuZS8M+JHdrY46lXojpf4zQffu3rUZ9dwdq
 g1mTRTSZZ1O16bnNI3hpDgrZg5AQbCTEGYICv3/BD7N0++ATNfNi3aUwVba9+1cC42SU0OMu
 nMJ8+DHsrxSUsHdyXHVGb5XdF1M2xpiGGeC6WOD4rF7r2j9k5JdVdw4DM5CyLdBbZ9fJG6Bj
 L77sgJN/p5DVEZGnocsC79d//8ClPC6ffy8D6i8RoMXPvBZKV/WlAkzNBX49z28zyARfVQXZ
 M7znTCEVi1BV8yKDVOeGo8g7FPc7n5ilD2DHcihl3xKE9O2PRaodFvMC3PWBshR0U9OiFy9H
 w93O5TYxhNBfvf5ZyWLo4cfIUpTdSowBIzsqtwRfemGe1I0FGYkAv7X4LUgZ406wPgFyraWp
 imwCh1C1V7ypXzbMgHWOHptX6ziAMRkpnUhMC1yYVvxgyo/YZyi5bs0focseeV17/RqyPN5F
 qFXe8iJDvlVZC7A/jARMcv0oIB4LUz5jgOSJSu1JjM4esc4FQDO/9bleCrp9TUPUXXr5Zdv/
 eX421qCE5QZRglkAMLHU96Vzgu87SoHheZ/f0rUOd0PKk/ix5dndn7qhfgtLsBSdRianmmG1
 xybCAszrPXWp9Nn68HAgK2Jotv7E+Z6GUYGTWDX4azvaHvf92unh4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9utcHyo7J6zxh/GCSZZlumPbpsP32a0JQdraZK3LJY5VO7V
 0/nFgO24llV1BcJyGIsGTc=
IronPort-HdrOrdr: A9a23:wn6HVa7CyBCeH2h1PgPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="63592666"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 38/70] x86/nmi: CFI hardening
Date: Mon, 14 Feb 2022 12:50:55 +0000
Message-ID: <20220214125127.17985-39-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/alternative.c        | 4 ++--
 xen/arch/x86/cpu/microcode/core.c | 3 ++-
 xen/arch/x86/crash.c              | 3 ++-
 xen/arch/x86/livepatch.c          | 2 +-
 xen/arch/x86/oprofile/nmi_int.c   | 2 +-
 xen/arch/x86/traps.c              | 3 ++-
 6 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 1cb531c9df83..436047abe021 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -324,8 +324,8 @@ static unsigned int __initdata alt_done;
  * condition where an NMI hits while we are midway though patching some
  * instructions in the NMI path.
  */
-static int __init nmi_apply_alternatives(const struct cpu_user_regs *regs,
-                                         int cpu)
+static int __init cf_check nmi_apply_alternatives(
+    const struct cpu_user_regs *regs, int cpu)
 {
     /*
      * More than one NMI may occur between the two set_nmi_callback() below.
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index c07f68ba350e..f84dafa82693 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -376,7 +376,8 @@ static int primary_thread_work(const struct microcode_patch *patch)
     return ret;
 }
 
-static int microcode_nmi_callback(const struct cpu_user_regs *regs, int cpu)
+static int cf_check microcode_nmi_callback(
+    const struct cpu_user_regs *regs, int cpu)
 {
     unsigned int primary = cpumask_first(this_cpu(cpu_sibling_mask));
     int ret;
diff --git a/xen/arch/x86/crash.c b/xen/arch/x86/crash.c
index f6264946a681..c383f718f5bd 100644
--- a/xen/arch/x86/crash.c
+++ b/xen/arch/x86/crash.c
@@ -36,7 +36,8 @@ static unsigned int crashing_cpu;
 static DEFINE_PER_CPU_READ_MOSTLY(bool, crash_save_done);
 
 /* This becomes the NMI handler for non-crashing CPUs, when Xen is crashing. */
-static int noreturn do_nmi_crash(const struct cpu_user_regs *regs, int cpu)
+static int noreturn cf_check do_nmi_crash(
+    const struct cpu_user_regs *regs, int cpu)
 {
     stac();
 
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index d056b1ed8b41..37c9b8435eda 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -175,7 +175,7 @@ static nmi_callback_t *saved_nmi_callback;
  * Note that because of this NOP code the do_nmi is not safely patchable.
  * Also if we do receive 'real' NMIs we have lost them.
  */
-static int mask_nmi_callback(const struct cpu_user_regs *regs, int cpu)
+static int cf_check mask_nmi_callback(const struct cpu_user_regs *regs, int cpu)
 {
     /* TODO: Handle missing NMI/MCE.*/
     return 1;
diff --git a/xen/arch/x86/oprofile/nmi_int.c b/xen/arch/x86/oprofile/nmi_int.c
index 6ebe20bd1d3e..a90b72825818 100644
--- a/xen/arch/x86/oprofile/nmi_int.c
+++ b/xen/arch/x86/oprofile/nmi_int.c
@@ -95,7 +95,7 @@ bool nmi_oprofile_send_virq(void)
 	return v;
 }
 
-static int nmi_callback(const struct cpu_user_regs *regs, int cpu)
+static int cf_check nmi_callback(const struct cpu_user_regs *regs, int cpu)
 {
 	int xen_mode, ovf;
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 485bd66971db..7b957101934e 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -752,7 +752,8 @@ static cpumask_t show_state_mask;
 static bool opt_show_all;
 boolean_param("async-show-all", opt_show_all);
 
-static int nmi_show_execution_state(const struct cpu_user_regs *regs, int cpu)
+static int cf_check nmi_show_execution_state(
+    const struct cpu_user_regs *regs, int cpu)
 {
     if ( !cpumask_test_cpu(cpu, &show_state_mask) )
         return 0;
-- 
2.11.0


