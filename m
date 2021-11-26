Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF2D45EE86
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232757.403699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauV-00068P-8Y; Fri, 26 Nov 2021 13:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232757.403699; Fri, 26 Nov 2021 13:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauU-0005zA-Ji; Fri, 26 Nov 2021 13:05:02 +0000
Received: by outflank-mailman (input) for mailman id 232757;
 Fri, 26 Nov 2021 13:04:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauR-0002zD-GO
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:04:59 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 750f485a-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:04:58 +0100 (CET)
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
X-Inumbo-ID: 750f485a-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931898;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1m9xOwxe8Ri/U/q6tx5wCyVpE1aVwbjAxBpIt6ZgzWI=;
  b=LmGn6gUg8ZzrV7/hXfyjVbWQYvWf6UB71QJMCZmh+um8kruuhkzpkoV2
   Jz5l1tNUMojmV4K9hXIuINgg+KC+ymp4qUbWRLWnl/dN1SxbsKJ6P24kq
   +y3nqE2nAcqS1J1ygdUjCxW2J6IA81UZ56W11nlie8WXvV6aZg5mVKdzI
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uhEoPZybOJgCWemvUXicnrQPzSPxjiFlhay76PvHGtGlfRUkPIrbwG9xRGYIx3r/c51cAPKXU6
 n4YUzHkeONztXQgdJ+NrQH0leKkXA63/8B2AFMUdObluYbuOtSU6bHW4W0jTK9rWlaxMGEAvbl
 jMXqJTd/uW/c+zFdcDdWf6IunPNfMJF4yyUG4blthdKqCLWRfmDzdyehbUUVUF54z5kWgNp5gc
 qy4Gcs2pNR1DvCQc4wIkn4mlMqPnHixrynWq/96tIo5gOub0rcVpQbeN8jxTLRPP9TFsRzJ4FL
 5FqqVDGfk8BJy3UUESLdxWz/
X-SBRS: 5.1
X-MesageID: 59063946
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:I3tceq4QwI85Mvi30N9NjAxRtPXAchMFZxGqfqrLsTDasY5as4F+v
 msbWmCCbK3fZGqhKIt0bY/jpkIA6MPczYdnQQZr+SA2Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2NAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z9
 M9MqqOqdUQQEIKWl8A6VTV0MjBEIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTTK6AP
 JtFN1KDajzvajEUZ3w7FKkZs8iyokfaWDBgsQiK8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u10bTDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc+ZKEvIF8j3O84T7uQm9IW4oYh9QUsNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbs1oWtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9D3gbQ4xawZRGp8crVnl
 CNf8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggfxg5bJtbKGO3P
 BS7VeZtCHl7ZyDCgUhfOd/ZNijX5fK4SYSNug78MrKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWPnOKrNVNdA9SdhDWx/ne8qRqSwJKGSI+cElJNhMb6epJl1VNk/sHm+HW0
 Gu6X0MEmlPziWeecVeBa2x5aaOpVpF69CppMSspNFeu+n4ifYfws/tPK8ppJeEqpL550Pp5b
 /gZYMHcUP5BfSvKpmYGZp7noY08KBny3VCSPzCoaSQUdoJ7Q1Cb4cftewbirXFcDie+ucYkj
 aen0wfXHcgKSwh4VZ6EY/Oz1VKh+3ManbsqDUfPJ9BSfmTq8ZRrdHOt3qNmfZlUJEyalDWA1
 guQDRMJnsX3otc4oIvTmKSJj4a1CO8iTEBUKHbWsOStPi7A82v9nYIZCLSUfSrQXX/f8bm5Y
 bkH1On1NfAKkQoYs4d4FLo3n6sy68G2+u1fxwVgWn7Kc06qGvVrJXzfhZtDsahEx7l4vwqqW
 x3QpokGaOvRYM61QkQMIAcFb/iY0aBGkzbf2v05PUHm6XIl57GAS0hTY0GBhSE1wGGZ62/5L
 TPNYPIr1jE=
IronPort-HdrOrdr: A9a23:+qFMb6hWCXZxiPKLBE5zCf9byXBQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="59063946"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 34/65] x86/nmi: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:15 +0000
Message-ID: <20211126123446.32324-35-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
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
index 49f0d902e5bb..ea5fa832e4a4 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -174,7 +174,7 @@ static nmi_callback_t *saved_nmi_callback;
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
index 07981db74cff..76b1b779b33c 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -741,7 +741,8 @@ static cpumask_t show_state_mask;
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


