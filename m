Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4C5BB85B2
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136896.1473393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oex-0006x6-6u; Fri, 03 Oct 2025 22:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136896.1473393; Fri, 03 Oct 2025 22:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oew-0006sK-Uk; Fri, 03 Oct 2025 22:53:54 +0000
Received: by outflank-mailman (input) for mailman id 1136896;
 Fri, 03 Oct 2025 22:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oev-0004mF-3B
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:53 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d53921e3-a0ab-11f0-9d14-b5c5bf9af7f9;
 Sat, 04 Oct 2025 00:53:52 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ee1381b835so2382795f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:52 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:50 -0700 (PDT)
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
X-Inumbo-ID: d53921e3-a0ab-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532032; x=1760136832; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0oNw5K4sXHgCeJnimopXredV1uQRxUZrdiBiQflIQU=;
        b=nK2fnpURZVqDyxm1BYzhzgGK3xvawOkA+cDZBOSUJixSybdX09MUfP2xbwQba/ps5Q
         vht9fDTWIu/9TsC7gLAnudQF+ZyeZ20wYwq0r+4bW/2XTmp7MiiEQm80SRB415rpUHvD
         M2HNMpl2xgGDh3YkgUhtrFb7Gy6ysj+2FlwaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532032; x=1760136832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0oNw5K4sXHgCeJnimopXredV1uQRxUZrdiBiQflIQU=;
        b=FLAbfWS461m3rPIXIJWPlUFNooHypnTJX965R27RNG44tQ4R6TeHifGZxw7Au6vnf+
         1ATG/RMh9eiBeGCy0Kz5h7/tkTMcuqSR8tNIyopnS9LP++ylN3YMBHEAMzTVxLFpNGQM
         Bf6+J9MiV9kE1iK/1qRm81kDWdy1uv1yFKuC4PaYpdnZ/u3gugfcak4+QfJtUpqD6Igm
         nH4MR2j9uDrp3czMsoIPXw6cMvfAENV8MkXjmiXyG3RztPbd1SMNlENTf3wmXxF8FSil
         TC5ftPUNqlULinxJ8naBEfRNTP3BttNEmF6JsiVhg3Jm26UV8udCO/CDtVVVzG43eTdX
         pcPw==
X-Gm-Message-State: AOJu0YzEpfvAVKeSM1Ripx8jwCCQUeT8wNeRSKdC8ygQAGRUGMTzLCwm
	xMG5iW2Hha0gAq2WV6bYAeTGfyP8SxE8x2b4GK9KK5lgEqck/CVNfcOhfbOQZ0WeZp/LM93I7FD
	Uo0eCY/UpbA==
X-Gm-Gg: ASbGncvfnF7CGZX2oeqZVaDkxjXKWYUkxW4kWaDi5PIyBXI05JXxnNOgh2vBSUjD4p7
	E+B2tJWo8tHD6juP5q5lorgSwHf10UBSl9e1lBB3VsVHDQI26sqYU+pwXwFzoot2t4VvJp2748L
	CVmYY5nQrXO+FeQg8EKcp9PtCk+s1ygZzvv5Q/hgm2oLktNfBDfFAAA9weY2rvdbuXI8LhDqN8b
	fHpVXBnatSgS6oI3L4qFYuH1lDfvDvDLiSo3m6dmlP5bGBqvFf2aDFw+V0vkvOETE3ShfGpEzZZ
	Hat7Y05rp19o35z93EEbfBIdBhh+uFI/vGO8UdW7i6HKUYn4gp7BTwj2XzIuoLBaVN65CPywVRb
	+70U+9G/gfR1Y+yOUqKBHEWh2PT9IeQXAMe3OQ5afkgwstb6dHFf283TFgFikNASAxqE9tmeTUN
	bu/26d3KB4e/HRohO+BbfXxGyn7T4+y8o=
X-Google-Smtp-Source: AGHT+IGJaNuPK6BEBxqC2I2IKYUBlSfm6IpSEEWnfS9veyaiaqXtOEoe1NrwHO5cx7d/p+cLCXy4aA==
X-Received: by 2002:a05:6000:4210:b0:407:7a7:1ca0 with SMTP id ffacd0b85a97d-425671463eemr3399578f8f.14.1759532031802;
        Fri, 03 Oct 2025 15:53:51 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 09/22] x86/traps: Make an IDT-specific #DB helper
Date: Fri,  3 Oct 2025 23:53:21 +0100
Message-Id: <20251003225334.2123667-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FRED provides PENDING_DBG in the the stack frame, avoiding the need to read
%dr6 manually.

Rename do_debug() to handle_DB(), and update it to take a dbg field using
positive polarity.

Introduce a new handle_DB_IDT() which reads %dr6.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * New
---
 xen/arch/x86/traps.c        | 28 +++++++++++++++++-----------
 xen/arch/x86/x86_64/entry.S |  2 +-
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 545c42a10862..3fd0f5709a52 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1992,14 +1992,11 @@ void asmlinkage do_device_not_available(struct cpu_user_regs *regs)
 
 void nocall sysenter_eflags_saved(void);
 
-void asmlinkage do_debug(struct cpu_user_regs *regs)
+/* Handle #DB.  @dbg is PENDING_DBG, a.k.a. %dr6 with positive polarity. */
+static void handle_DB(struct cpu_user_regs *regs, unsigned long dbg)
 {
-    unsigned long dr6;
     struct vcpu *v = current;
 
-    /* Stash dr6 as early as possible. */
-    dr6 = read_debugreg(6);
-
     /*
      * At the time of writing (March 2018), on the subject of %dr6:
      *
@@ -2067,13 +2064,13 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
          * If however we do, safety measures need to be enacted.  Use a big
          * hammer and clear all debug settings.
          */
-        if ( dr6 & (DR_TRAP3 | DR_TRAP2 | DR_TRAP1 | DR_TRAP0) )
+        if ( dbg & (DR_TRAP3 | DR_TRAP2 | DR_TRAP1 | DR_TRAP0) )
         {
             unsigned int bp, dr7 = read_debugreg(7);
 
             for ( bp = 0; bp < 4; ++bp )
             {
-                if ( (dr6 & (1u << bp)) && /* Breakpoint triggered? */
+                if ( (dbg & (1u << bp)) && /* Breakpoint triggered? */
                      (dr7 & (3u << (bp * DR_ENABLE_SIZE))) && /* Enabled? */
                      ((dr7 & (3u << ((bp * DR_CONTROL_SIZE) + /* Insn? */
                                      DR_CONTROL_SHIFT))) == DR_RW_EXECUTE) )
@@ -2094,9 +2091,9 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
          * so ensure the message is ratelimited.
          */
         gprintk(XENLOG_WARNING,
-                "Hit #DB in Xen context: %04x:%p [%ps], stk %04x:%p, dr6 %lx\n",
+                "Hit #DB in Xen context: %04x:%p [%ps], stk %04x:%p, dbg %lx\n",
                 regs->cs, _p(regs->rip), _p(regs->rip),
-                regs->ss, _p(regs->rsp), dr6);
+                regs->ss, _p(regs->rsp), dbg);
 
         return;
     }
@@ -2108,7 +2105,7 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
      * by debugging actions completed behind it's back.
      */
     v->arch.dr6 = x86_merge_dr6(v->domain->arch.cpu_policy,
-                                v->arch.dr6, dr6 ^ X86_DR6_DEFAULT);
+                                v->arch.dr6, dbg);
 
     if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
     {
@@ -2116,7 +2113,16 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
         return;
     }
 
-    pv_inject_DB(dr6 ^ X86_DR6_DEFAULT);
+    pv_inject_DB(dbg);
+}
+
+/*
+ * When using IDT delivery, it is our responsibility to read %dr6.  Convert it
+ * to positive polarity.
+ */
+void asmlinkage handle_DB_IDT(struct cpu_user_regs *regs)
+{
+    handle_DB(regs, read_debugreg(6) ^ X86_DR6_DEFAULT);
 }
 
 void asmlinkage do_entry_CP(struct cpu_user_regs *regs)
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 39c7b9d17f9e..789687488c5f 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -1171,7 +1171,7 @@ FUNC(handle_ist_exception)
 .L_ ## vec ## _done:
 
         DISPATCH(X86_EXC_NMI, do_nmi)
-        DISPATCH(X86_EXC_DB,  do_debug)
+        DISPATCH(X86_EXC_DB,  handle_DB_IDT)
         DISPATCH(X86_EXC_MC,  do_machine_check)
 #undef DISPATCH
 
-- 
2.39.5


