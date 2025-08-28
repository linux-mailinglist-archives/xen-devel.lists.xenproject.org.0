Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F13B3A3B6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 17:11:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099188.1453146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHa-0001Wi-AR; Thu, 28 Aug 2025 15:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099188.1453146; Thu, 28 Aug 2025 15:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ureHa-0001Vi-5V; Thu, 28 Aug 2025 15:11:22 +0000
Received: by outflank-mailman (input) for mailman id 1099188;
 Thu, 28 Aug 2025 15:11:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FrxM=3I=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ureCS-00035A-9Z
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 15:06:04 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 833b9e54-8420-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 17:06:02 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45a1b0c8867so8922895e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 08:06:02 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6fe5sm78394535e9.5.2025.08.28.08.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 08:06:00 -0700 (PDT)
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
X-Inumbo-ID: 833b9e54-8420-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756393561; x=1756998361; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2et+2oZD9rWfaE5nLOfIkpTesEtTkjTqJrxIqC+gq64=;
        b=V6j4bQ/3NwFRUcz+IvRAcG1zn+jeOjEyx6oIuGpPzLJHjOhtDp4LDt1vVT9U9ktrSh
         cQgyfgIB1Rv5SKVUYswTHejf7jXHDp9JXQgX9UnMQFKXCiFRuA5HTCIuHNvQ3i/B2is/
         2V0+dGDzcdvjwkUsoCyH+4hHrNTtpcLJ5KI0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393561; x=1756998361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2et+2oZD9rWfaE5nLOfIkpTesEtTkjTqJrxIqC+gq64=;
        b=hgKJPi9HClcKzpYvvmCc8B+bxFuzCSHcoS68qPQV9CpXyuV3UuoxD90kJ34SASR+cZ
         PrVqnrZElfHO2snD5V7ZJhLEQ+uknMRx/zNa3SikxSyegeWZueLfuQL4/b+njFgePyqh
         +M6YfYOfTlnDn4f/YsnLO19Tqo/t0mtTZVQKv25thGdqB+UPFUpdusos1moe/hNsRMaH
         zRLS7Yg4WQ7xBcMnm83+gexkfXe8pfvf/GOmbsEdIznN/3U64ngZAxYeqV/3Pg2iMehe
         AYzna/Gqqgz0tVtwxZfDzyY3XZ5H0n27Pnt4Sj8h5G2L/iQ7KwCq+SkyY8CyICDKUXUA
         e83w==
X-Gm-Message-State: AOJu0YxhKGCuzZFDUdpWgqKQ6Tyyx7uBvKQiPQe+SMbBiEzWUj614vn0
	kljiDLrwRFzbUazJvOaJRQ+LxCS1sSPNf+7GSJEfK9kLXAHWqrlOnh0685b/Gtv7iWq5QSTiQEe
	yX2Tr
X-Gm-Gg: ASbGncv/gGE2mrURZRlH3FkimkNxi9S8rbTOHW/l6FtKHpc/41RFZ50u7Ewa0/Xi2V5
	yTmQ0MKjS3HaleEV3l5l3g17ZNCDSNz9t624bwUmIk59Fi0e4m2PrYf4Ov6c8JSCFFJSQ/7G/ol
	/q/Z/GrCsKIHBRSEftbADTi0DUSCooV1dKOvvN9PJlbq1EBECXVVZ95RpW3VJJ8qqM4rgM2r/ig
	iioS+m1RGrfvxaldekZ2Uc3WSC9/RCOf962SD+ldqphf/nB499i3IJCWCTVEF716MvjPwN9rj9v
	ty6SPg3/ZTELzArOruVRk3A9F5FXD/k1sNv09MYf2IYPlgrQM8p7U/GLAX6urquG8zz+/5UKORd
	g8G8G9sm8inQUSy4PbHfAeGMMwdDegdJI9bdDVhUkvgXcqf9Sa2mP9OE5tKkVESrXLEU18zZhyT
	m5tcPFFfpNtOw=
X-Google-Smtp-Source: AGHT+IHH+zJV5UfrsUeom95ghPAsaEWKEmHh1kjer9oxDwGRi33LJwB66/dHYyJMRP3i1Dq40aeeQw==
X-Received: by 2002:a05:600c:4715:b0:459:db54:5f34 with SMTP id 5b1f17b1804b1-45b517d902bmr246207235e9.31.1756393561452;
        Thu, 28 Aug 2025 08:06:01 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 09/23] x86/traps: Skip Supervisor Shadow Stack tokens in FRED mode
Date: Thu, 28 Aug 2025 16:03:55 +0100
Message-Id: <20250828150409.901315-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250828150409.901315-1-andrew.cooper3@citrix.com>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

FRED doesn't use Supervisor Shadow Stack tokens.  Skip setting them up.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

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
index 73799fcc684c..c767d0451574 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1920,10 +1920,6 @@ void asmlinkage __init noreturn __start_xen(void)
 
     system_state = SYS_STATE_boot;
 
-    bsp_stack = cpu_alloc_stack(0);
-    if ( !bsp_stack )
-        panic("No memory for BSP stack\n");
-
     console_init_ring();
     vesa_init();
 
@@ -2077,6 +2073,10 @@ void asmlinkage __init noreturn __start_xen(void)
 
     traps_init(); /* Needs stubs allocated. */
 
+    bsp_stack = cpu_alloc_stack(0); /* Needs to know IDT vs FRED */
+    if ( !bsp_stack )
+        panic("No memory for BSP stack\n");
+
     cpu_init();
 
     rcu_init();
-- 
2.39.5


