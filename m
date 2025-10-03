Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF75BB85BF
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136895.1473380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oev-0006bf-Mz; Fri, 03 Oct 2025 22:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136895.1473380; Fri, 03 Oct 2025 22:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oev-0006SB-GQ; Fri, 03 Oct 2025 22:53:53 +0000
Received: by outflank-mailman (input) for mailman id 1136895;
 Fri, 03 Oct 2025 22:53:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oet-0004mF-JG
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:51 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d45fc517-a0ab-11f0-9d14-b5c5bf9af7f9;
 Sat, 04 Oct 2025 00:53:51 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so1974940f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:51 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:49 -0700 (PDT)
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
X-Inumbo-ID: d45fc517-a0ab-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532030; x=1760136830; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCapiM0xH65oD0m1ksMUosmI8lWBCkb+MdhiFcZvJp8=;
        b=lg4HrcY4+B3IogBxjk5ybz1iOGRvLkOMQwQ2ocFcMuo5XGqQHSqpRJ4rzk+r4BqVP9
         4mQ4FAc91F+T0nnjlMPc5SxpbFoAJdxD0q4gThN39uLq0PpT1LeNeSqOBS8Gf0Au6nsn
         ReUKNyKSeb+qgYH1+paGgJ/673dvQCJKrTNVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532030; x=1760136830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCapiM0xH65oD0m1ksMUosmI8lWBCkb+MdhiFcZvJp8=;
        b=pX30xfPZrfgmtZvLW6T5FICQ61b28UFODIsHPR+1FpjsnjnOtHaDN/JAqITK2XBHSu
         PY6vyCI00Ny+sTJh0GWVRWgyT5G58UjbJ+9TMd08/aQn4PdKX8Yn0JokMedh0DyWDF9D
         Xnts7cVjfngFU9GlUsdejsf6LvZCDpKrPjK6+qf6dHFHW+Jgn/mdo3dFVbBsE2sC1GEh
         isXE0CXcSMvYFoirY9qtMw0jvJc+cu9i9l2FeW2w3gVstHDubtoUbXj/u/nwqIeYikNo
         HoeL6l/a9REcWy30XtrnjNp7gokxUukvyV5cAoSq625uzYjromZALhfr1NsokDc5NeFF
         3mKw==
X-Gm-Message-State: AOJu0YyIpnD+jsMcd0lqd7KK/LRRbjxoRcuMDedrFx8xz1iSIC27L5JS
	nj12JMI0h80E478pArkOnMxx0BjwdOVelYvJeoQZ0CIImJkLrT6z7cx3nUx4Ed4qlenNTuPXUIJ
	dp+CHXw4FFg==
X-Gm-Gg: ASbGncuql1iI/nABun244YSwSAcSECa+01sPYC1Pd2OfOVnK2tO1BAkudMfl3JgCmjS
	5nnoQTUBJwYiXZfiU60q0wlvENeUcaoCAxm3Ohay/YWg5BMzMbJXFyOJpGaxeBXYcuaL3g/0rb5
	EMTEmvihBU7cqkngQxJCLokPLwsaK8Ruir8TuMgTW2h+OzraflEtL64U9nb9tp1HMrd6if74I73
	cCv03M/8Cr/ok0gfYa+SPD2a3ycr+1wF2mnmc9dflZEhUI2CEaoLig6P6a2GS2hl7JLZLjWWujh
	C1X+HOkRPrcYR3+dSVDu9zt2ZrOZzN4AsJJPISrcsMlmA/JkOI+RitXLRAy9lKSN+4f0/jUnlJO
	/Cbr0IXVuG0J/0LzwAJP2uY3f1P+2wzafmBnlTlXfJBoAgRID2EKarhJK7DfZYlOY2kPUIJwPA1
	AE36raHuGE+vo60GYSeR9g
X-Google-Smtp-Source: AGHT+IHDK5cVhEjzRuhbRNjA7VIYhVu6Tnt6vNSpbzNgDiwBKK5lWyaZUWlRFcLNL5u6vX9rhV1aSA==
X-Received: by 2002:a05:6000:1842:b0:3ec:dd16:fc16 with SMTP id ffacd0b85a97d-425671b23bfmr2836608f8f.43.1759532030450;
        Fri, 03 Oct 2025 15:53:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 08/22] x86/traps: Skip Supervisor Shadow Stack tokens in FRED mode
Date: Fri,  3 Oct 2025 23:53:20 +0100
Message-Id: <20251003225334.2123667-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FRED doesn't use Supervisor Shadow Stack tokens.  Skip setting them up.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v3:
 * Move further still

v2:
 * New
---
 xen/arch/x86/mm.c    | 12 +++++++++---
 xen/arch/x86/setup.c |  8 ++++----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b929d15d0050..043e6aa9d73a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -129,6 +129,7 @@
 #include <asm/shadow.h>
 #include <asm/shared.h>
 #include <asm/trampoline.h>
+#include <asm/traps.h>
 #include <asm/x86_emulate.h>
 
 #include <public/memory.h>
@@ -6441,8 +6442,13 @@ static void write_sss_token(unsigned long *ptr)
 
 void memguard_guard_stack(void *p)
 {
-    /* IST Shadow stacks.  4x 1k in stack page 0. */
-    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
+    /*
+     * IST Shadow stacks.  4x 1k in stack page 0.
+     *
+     * With IDT delivery, we need Supervisor Shadow Stack tokens at the base
+     * of each stack.  With FRED delivery, these no longer exist.
+     */
+    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && !opt_fred )
     {
         write_sss_token(p + (IST_MCE * IST_SHSTK_SIZE) - 8);
         write_sss_token(p + (IST_NMI * IST_SHSTK_SIZE) - 8);
@@ -6453,7 +6459,7 @@ void memguard_guard_stack(void *p)
 
     /* Primary Shadow Stack.  1x 4k in stack page 5. */
     p += PRIMARY_SHSTK_SLOT * PAGE_SIZE;
-    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
+    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && !opt_fred )
         write_sss_token(p + PAGE_SIZE - 8);
 
     map_pages_to_xen((unsigned long)p, virt_to_mfn(p), 1, PAGE_HYPERVISOR_SHSTK);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 44da5efa1d20..160a9611f456 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1923,10 +1923,6 @@ void asmlinkage __init noreturn __start_xen(void)
 
     system_state = SYS_STATE_boot;
 
-    bsp_stack = cpu_alloc_stack(0);
-    if ( !bsp_stack )
-        panic("No memory for BSP stack\n");
-
     console_init_ring();
     vesa_init();
 
@@ -2111,6 +2107,10 @@ void asmlinkage __init noreturn __start_xen(void)
 
     console_init_postirq();
 
+    bsp_stack = cpu_alloc_stack(0); /* Needs to know IDT vs FRED */
+    if ( !bsp_stack )
+        panic("No memory for BSP stack\n");
+
     system_state = SYS_STATE_smp_boot;
 
     do_presmp_initcalls();
-- 
2.39.5


