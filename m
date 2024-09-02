Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6059688ED
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 15:33:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787949.1197407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7Av-0000yu-3P; Mon, 02 Sep 2024 13:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787949.1197407; Mon, 02 Sep 2024 13:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7Au-0000vL-Rz; Mon, 02 Sep 2024 13:32:56 +0000
Received: by outflank-mailman (input) for mailman id 787949;
 Mon, 02 Sep 2024 13:32:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl7As-0000uL-OJ
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 13:32:54 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id daa11806-692f-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 15:32:52 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c0a9f2b967so4016000a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 06:32:52 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196975sm562333666b.135.2024.09.02.06.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:32:50 -0700 (PDT)
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
X-Inumbo-ID: daa11806-692f-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725283971; x=1725888771; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkjCsz/TTC6SLbAh60aBVRxv3OTDCBQ4EzpkKj3S5ug=;
        b=Gd1NTWoSjj79AVK9xEMB4IHLESKHqVM9boIALpsRoxvc/aiCNeO4gU2ZN5SgWTqIh7
         6anaJ1qvYUdW7aZHhB3ZTQ2bUGizlmhF5Tr543cJdCuC/KvBkxqChd30v6rDQNXrgBHk
         0vc3b87MdSCJ4oayUJ42aELX0WCnQh39W+2q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725283971; x=1725888771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkjCsz/TTC6SLbAh60aBVRxv3OTDCBQ4EzpkKj3S5ug=;
        b=E/b4+5ACzQ5bx6SGVBuOoytW1dFOeW1ILhm36dk5VNSmmX0FgBUPt+TxFmZyCeiXNx
         2WhtbmG+XNfFRy+tw43BnYOX87KBJRyuIUoRSI8V0YspEzU/lKmkYWsqE4VePj/YnLZ8
         sGeMZF62q/JE+QhAmabA0EJfX1hDpTAXu7SYoNSV9O/BCPCuO4bYBZffdeJ+ZbLoPf3/
         Ze0wibmx4pN9OmMehEB0sJ+EY2mlAXz/6EwcoW6Ugk3DJ127MgtNlEzbGhZXv78reOrR
         3hMF5w+ms/5uy2/riFFX7mao6psw4OVKCeTFdVRr9I1JfUKcbaPJobCoTqVBISbRehsi
         KPGg==
X-Gm-Message-State: AOJu0Yz/qqobozablDF7cPBG+U5MM5tmcOGeT5qVtz8Z24dLnb5e9Lcw
	Ho2BGPezA+eVYSeXGYm5F+SWd2EWMeXAOhQoY1MuIYAQQ1l0CTL89CDvD9xJCdXxBWb37/vLXFr
	G
X-Google-Smtp-Source: AGHT+IGLiZWsjP904HzU5d+Lqwsu331ymEnmmqjv5MvEuswF7Gkc+QrUPOrkKmjl1yJdP48f1/EmGw==
X-Received: by 2002:a17:907:1c9f:b0:a8a:18f9:269f with SMTP id a640c23a62f3a-a8a18f92a81mr42918266b.60.1725283970945;
        Mon, 02 Sep 2024 06:32:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH 1/4] x86/boot: Use <xen/types.h>
Date: Mon,  2 Sep 2024 14:32:29 +0100
Message-Id: <20240902133232.3302839-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
References: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... rather than opencoding locally.  This also covers NULL and *_MAX.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/cmdline.c |  2 ++
 xen/arch/x86/boot/defs.h    | 17 -----------------
 xen/arch/x86/boot/reloc.c   |  2 ++
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index b8ad7f3a144a..28a47da7ab02 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -31,6 +31,8 @@ asm (
     );
 
 #include <xen/kconfig.h>
+#include <xen/types.h>
+
 #include "defs.h"
 #include "video.h"
 
diff --git a/xen/arch/x86/boot/defs.h b/xen/arch/x86/boot/defs.h
index ee1a4da6af03..cf9a80d116f3 100644
--- a/xen/arch/x86/boot/defs.h
+++ b/xen/arch/x86/boot/defs.h
@@ -20,14 +20,10 @@
 #ifndef __BOOT_DEFS_H__
 #define __BOOT_DEFS_H__
 
-#include <xen/stdbool.h>
-
 #define __maybe_unused	__attribute__((__unused__))
 #define __packed	__attribute__((__packed__))
 #define __stdcall	__attribute__((__stdcall__))
 
-#define NULL		((void *)0)
-
 #define ALIGN_UP(arg, align) \
                 (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))
 
@@ -47,17 +43,4 @@
 
 #define tolower(c)	((c) | 0x20)
 
-typedef unsigned char u8;
-typedef unsigned short u16;
-typedef unsigned int u32;
-typedef unsigned long long u64;
-typedef unsigned int size_t;
-typedef u8 uint8_t;
-typedef u16 uint16_t;
-typedef u32 uint32_t;
-typedef u64 uint64_t;
-
-#define UINT16_MAX	((uint16_t)(~0U))
-#define UINT_MAX	(~0U)
-
 #endif /* __BOOT_DEFS_H__ */
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 589e026ff9fb..ac8b58b69581 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -26,6 +26,8 @@ asm (
     "    jmp  reloc                    \n"
     );
 
+#include <xen/types.h>
+
 #include "defs.h"
 
 #include <xen/kconfig.h>
-- 
2.39.2


