Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 167D2A67554
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 14:40:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919153.1323666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuXAf-00045G-1Q; Tue, 18 Mar 2025 13:39:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919153.1323666; Tue, 18 Mar 2025 13:39:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuXAe-00042H-V4; Tue, 18 Mar 2025 13:39:52 +0000
Received: by outflank-mailman (input) for mailman id 919153;
 Tue, 18 Mar 2025 13:39:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuXAd-00042B-GH
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 13:39:51 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7715697c-03fe-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 14:39:50 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so21067615e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 06:39:50 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffc450esm135822655e9.23.2025.03.18.06.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 06:39:49 -0700 (PDT)
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
X-Inumbo-ID: 7715697c-03fe-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742305189; x=1742909989; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXGv23NPh+tGX8vWvRcwGSVIvbvGoqtQphbDEkTX4io=;
        b=jGJc9HB6aWZYU44bljCZWG9GKqg5un90XMN19WHs6w0rShmc2QfT6FcgN8Sz/w1jXd
         xg/Oona3Lo8wBxoZ6m+5Sbq9JKgDixCWdZyVTgkUoNJ5kDc86rrizXRn6jn+TCZkw51h
         hWloICLMTuEA4ubUGgWD7kQ5iUAT/9vqQqRkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742305189; x=1742909989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXGv23NPh+tGX8vWvRcwGSVIvbvGoqtQphbDEkTX4io=;
        b=wm0tL3rg5xrie0B5169pzuduCDDW/EW8AKl7xEqXnJKb3nvqOGln02GXSBq+bQ9abu
         OMHTEpC8dIDQMoug/A9HksGlUrA8Bf140xDtV2blIzSWuh+awYZpf9BiJ1juxWJHaLQp
         ficKbT2LNsjHP+WObVISUwE5OyoLf8/pIjZMRs+lyCDfvoa1X0vaMrBOYP6vlgi/tYWE
         uKw64p8pnke2AsB0lWoh1Ijnc+1E0LWxDV2VOoWUI/0dBYAmFDPx6tPc1afNxBJZX7QU
         fhkV579gP6hNKcHNCHBvBcTnen9CnZW4pDh3hiQVEfPPRRDkfgv2LArkKIEeKhSaK9Cp
         nleA==
X-Gm-Message-State: AOJu0YyvojK7VfSDUUbeRLMMXpWV8wKKUxGOFrb2SCYJYNvwR5RhnWXS
	7LzTKCG1LJ24Anuz8z4gg2WdNwfQoUMuQ/Nryo+FeWsH8Bg6QCeDOW3OLKgaPLUObzOrsOfV7Au
	7
X-Gm-Gg: ASbGncsAYXj1TatkqHWLTCIwrIOemWgcWmTjUTt3dYR0AYhu3saxk8yIqDjBJYTFxM+
	JvXgYkw5pQsTOMv8UzFA/qW53MGtV7X2NduF6O1viuYv1ggBVy9bxVekekOMCaU5WI2sgfthMgS
	kfvsjhs+orA/OQ2pGCtQ933301U0Btjft8Dn1Metx7EeITWeE4aCNLbMl+v/9e42bD+VuLbs1BA
	L5wi/Jr6/YN+/SpgtycupIvzm6RcELag0QV61TQmtIlndMEgWNbwg6CqMg4X8cPL3kjeScTqpjo
	TyfD30e4daXMcjwAV4xK9rc2e7g0DRJdcUbKxUXMelGtMXH1nQUSHwzNVVwbLbGFadF0OZOSxu2
	1Wc6T8rjmPUUHcq1GmeSeqWy5
X-Google-Smtp-Source: AGHT+IGlaJe1U60gLuuUcstCiKUhTRTBH8LNFF7gPgpvrk0lOOBowJLd6uXMS+GGpc5fMU9Ua/s+qw==
X-Received: by 2002:a05:600c:3516:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-43d3b9ccb70mr22943035e9.26.1742305189607;
        Tue, 18 Mar 2025 06:39:49 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/compiler: Fix the position of the visibility pragma
Date: Tue, 18 Mar 2025 13:39:47 +0000
Message-Id: <20250318133947.607492-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This needs to be ahead of everything.  Right now, it is after xen/init.h being
included for -DINIT_SECTIONS_ONLY

  # 1 "./include/xen/compiler.h" 1
  # 83 "./include/xen/compiler.h"
  # 1 "./include/xen/init.h" 1
  # 62 "./include/xen/init.h"
  typedef int (*initcall_t)(void);
  typedef void (*exitcall_t)(void);
  # 72 "./include/xen/init.h"
  void do_presmp_initcalls(void);
  void do_initcalls(void);
  # 84 "./include/xen/compiler.h" 2
  # 122 "./include/xen/compiler.h"
  #pragma GCC visibility push(hidden)

Fixes: 84c4461b7d3a ("Force out-of-line instances of inline functions into .init.text in init-only code")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/include/xen/compiler.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index b118e4ba62eb..636a85bc417d 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -15,6 +15,11 @@
 # endif
 #endif
 
+#ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
+/* Results in more efficient PIC code (no indirections through GOT or PLT). */
+#pragma GCC visibility push(hidden)
+#endif
+
 #define barrier()     __asm__ __volatile__("": : :"memory")
 
 #define likely(x)     __builtin_expect(!!(x),1)
@@ -118,11 +123,6 @@
 #define __must_be_array(a) \
   BUILD_BUG_ON_ZERO(__builtin_types_compatible_p(typeof(a), typeof(&(a)[0])))
 
-#ifdef CONFIG_CC_HAS_VISIBILITY_ATTRIBUTE
-/* Results in more efficient PIC code (no indirections through GOT or PLT). */
-#pragma GCC visibility push(hidden)
-#endif
-
 /* Make the optimizer believe the variable can be manipulated arbitrarily. */
 #define OPTIMIZER_HIDE_VAR(var) __asm__ ( "" : "+g" (var) )
 

base-commit: 77be740e8182fa6b31291a8ae983d253187e9b50
-- 
2.39.5


