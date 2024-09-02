Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE779688EF
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 15:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787951.1197416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7Av-00016F-GG; Mon, 02 Sep 2024 13:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787951.1197416; Mon, 02 Sep 2024 13:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7Av-00010E-CA; Mon, 02 Sep 2024 13:32:57 +0000
Received: by outflank-mailman (input) for mailman id 787951;
 Mon, 02 Sep 2024 13:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl7Au-0000uL-C1
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 13:32:56 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbe618a8-692f-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 15:32:54 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso3930531a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 06:32:54 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196975sm562333666b.135.2024.09.02.06.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:32:52 -0700 (PDT)
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
X-Inumbo-ID: dbe618a8-692f-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725283973; x=1725888773; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFl3TVf1HFUGf5X7Hzvme/0k6OhCaTh4d95heeg1LWs=;
        b=r1zOi23shx0w1DjBKvQm/20YvsRD0/MqDpWthKptYDoovB1lMAEA4/s13ptFAs6Cd1
         kO2MZBc+UQtekHY9bXmMGo+l0UJc4BbUmDaJZ2iySH4BVF+kP8u/nhqo9btoSgo4W350
         ImZkYoS7o3dDGeWdKej8RWHy/taBtg1wJHJMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725283973; x=1725888773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFl3TVf1HFUGf5X7Hzvme/0k6OhCaTh4d95heeg1LWs=;
        b=qXuqmFTOhMXJ51Y9xAVF46I51z4oC1dtSnwFSs+FpqCo0P0Quzv7bueOTBe8t8vqgL
         c0J/Jh5bMlEb1xbwEeHQjFhSCEEGdO6Od8po3QE9IXUKmaa1tRHErcvRTf+nB2G9FM8Z
         YXAGTqEoAt8TwH9X6+KwoSmP6ajbl3hUtg1WlY9OdY9ZAeAQxBw65FcJ3QgHMf0Gr2BL
         mZF/AwnYi95F6GfE0BVkDejVQiELh+kgReaoxOsZTG0K7vLkCQ5iL0h9wS/eJK58dXno
         4J7vX1wQaQ56O5srftzcEXYL3m+7pSooJkJbybLBlSRPNpLHP8vf9XaNcoJmOotWA9Pj
         vx6A==
X-Gm-Message-State: AOJu0Yxeb6uZRtj1NQt41J7D0TYVHe5GizXHYnDprzSnZ5jg1qD/xfig
	uAAF52DKrdUQ2bn7T/u/Aew3nxflG0vE8OuL3kQqs9xvZ1f9wyGjwoCkSLlfCaYCy25OyaagIXf
	p
X-Google-Smtp-Source: AGHT+IHfpkYzaJzrhNVmY/WHkSEWAtrtKnBlyANpKf08/odYzlNkMz+SUEQ2t9VNTdzNSpgDDzZwbw==
X-Received: by 2002:a17:907:2d88:b0:a86:9e85:2619 with SMTP id a640c23a62f3a-a89827a3c54mr1495834066b.25.1725283972949;
        Mon, 02 Sep 2024 06:32:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH 3/4] x86/boot: Use <xen/compiler.h>
Date: Mon,  2 Sep 2024 14:32:31 +0100
Message-Id: <20240902133232.3302839-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
References: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... rather than opencoding locally.  __stdcall is x86-only and not something
we want to introduce to Xen generically, so opencode it in the two positions
where it matters.

With this, defs.h is empty so delete it.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>

I was hoping to do away with stdcall entirely and use fastcall instead, but
I've clearly got something wrong and the result doesn't boot.
---
 xen/arch/x86/boot/cmdline.c |  5 +++--
 xen/arch/x86/boot/defs.h    | 27 ---------------------------
 xen/arch/x86/boot/reloc.c   |  7 +++----
 3 files changed, 6 insertions(+), 33 deletions(-)
 delete mode 100644 xen/arch/x86/boot/defs.h

diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index b7375d106678..bdd5b95c224b 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -30,11 +30,11 @@ asm (
     "    jmp  cmdline_parse_early      \n"
     );
 
+#include <xen/compiler.h>
 #include <xen/kconfig.h>
 #include <xen/macros.h>
 #include <xen/types.h>
 
-#include "defs.h"
 #include "video.h"
 
 /* Keep in sync with trampoline.S:early_boot_opts label! */
@@ -347,7 +347,8 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
 #endif
 
 /* SAF-1-safe */
-void __stdcall cmdline_parse_early(const char *cmdline, early_boot_opts_t *ebo)
+void __attribute__((__stdcall__))
+cmdline_parse_early(const char *cmdline, early_boot_opts_t *ebo)
 {
     if ( !cmdline )
         return;
diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
deleted file mode 100644
index 4d519ac4f5ea..000000000000
--- a/xen/arch/x86/boot/defs.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/*
- * Copyright (c) 2016 Oracle and/or its affiliates. All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program.  If not, see <http://www.gnu.org/licenses/>.
- *
- * max() was copied from xen/xen/include/xen/kernel.h.
- */
-
-#ifndef __BOOT_DEFS_H__
-#define __BOOT_DEFS_H__
-
-#define __maybe_unused	__attribute__((__unused__))
-#define __packed	__attribute__((__packed__))
-#define __stdcall	__attribute__((__stdcall__))
-
-#endif /* __BOOT_DEFS_H__ */
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index eb9902d73fd9..1e3a30fab0c6 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -26,11 +26,10 @@ asm (
     "    jmp  reloc                    \n"
     );
 
+#include <xen/compiler.h>
 #include <xen/macros.h>
 #include <xen/types.h>
 
-#include "defs.h"
-
 #include <xen/kconfig.h>
 #include <xen/multiboot.h>
 #include <xen/multiboot2.h>
@@ -354,8 +353,8 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
 }
 
 /* SAF-1-safe */
-void *__stdcall reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
-                      uint32_t video_info)
+void *__attribute__((__stdcall__))
+reloc(uint32_t magic, uint32_t in, uint32_t trampoline, uint32_t video_info)
 {
     alloc = trampoline;
 
-- 
2.39.2


