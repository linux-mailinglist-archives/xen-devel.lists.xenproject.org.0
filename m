Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65913A74F91
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 18:37:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931041.1333532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyDdK-0004CS-St; Fri, 28 Mar 2025 17:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931041.1333532; Fri, 28 Mar 2025 17:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyDdK-00049W-Pg; Fri, 28 Mar 2025 17:36:42 +0000
Received: by outflank-mailman (input) for mailman id 931041;
 Fri, 28 Mar 2025 17:36:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tyDdK-0003ug-4y
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 17:36:42 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 351f0710-0bfb-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 18:36:40 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43ce70f9afbso25094825e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 10:36:40 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efdff2sm77485715e9.17.2025.03.28.10.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 10:36:39 -0700 (PDT)
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
X-Inumbo-ID: 351f0710-0bfb-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743183400; x=1743788200; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eb510Sz4jwK6HudhekiqhzPdrg8Izlk7/h2Nnn+atMM=;
        b=KC8i2+hc80+auIYgfXNfHgXtpYA1ZWdtp+hUjqByHNK7RPNZhSUPgRmwxtE+XMgYuC
         rMr/VkO3q07rdemKQ5xCUAsAlCFaVGMTJONyc/srf7gz9i68iHSFA2x1MC0/u1BBsGe2
         3uqua2MkZqQ48tfeEOQKk77Rp1TGZd45Q1ySk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743183400; x=1743788200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eb510Sz4jwK6HudhekiqhzPdrg8Izlk7/h2Nnn+atMM=;
        b=n3hwPRJBpbmJ3aeTQizN9d9KBJE5C1x9qLuXeflQ0UJVCyHRi4dEnBlM1jhXqkiXkq
         +2CCDJ6r9UOaIzDZaU9YVR00ylpr3MIU1bZATp0wBIHqFyZ0wH/AwbxZAHCNfawDi5hE
         O6XRyW0ZEDd7iM9q7bO3zA0J6kuXdl/yuMkbeXA3SUwTRRmdY+ISFfm2aNVVZceY2Q7O
         8E9886xC66alW/fA+jBz5oAPFBZTG7OFHaVjhTonYDpFMA3BTV341jky9c0CSaDcz3QG
         S0D2mnG6V6Lla91Tw7ig6zp7p0NJHo00bVzt5Xtq5OFan7ayShV6RXAPxsv4W4C7KVGO
         Gq7w==
X-Gm-Message-State: AOJu0YxOiFuyVEu00b01LNyGeelVUppadl2e+KAomxFMkkecj1BgFqXS
	kTrcjZn2WhdUYK8F8H/mo3cmNrUItPRorPPhp4/HCZ2YR+XujYJUSj40frat8ij9Q2LuWezjMri
	+u0k=
X-Gm-Gg: ASbGncvP8FUUPq5OBu2i5g8AqmCols4SmPcAd8FU4NjDivVfRkH+1I3VIARD1gkOR5C
	pjd23dHG3KJU5liLsW2qFySE8HFquKH+fT+qWd1Z+ouU4GBdPv2CbPEFCI2BSjCDawsPimEWTTr
	vwEDKRIi9AExKKLnyZTbGPyXauBi0kDP9rS4eMcJ9iou7WmMTh7veKu5tc926yCMh73INK6J5/y
	gdnrJ4DUtiyvjraJ6SeheIJmE3XKxMVdHDiogGIQszG1MzQ8jFSKCJeyw2WaqogCyKjx2NsycS/
	81g7TJHeIsmztGu3xSmaxFWpp+glOWToH7lBbGk/GgLfGE8qSr55o8mIAt64BQ1+ufgICfdqbhf
	iWbhZNDic+i2Q9waNo9ld+kVC3ne9
X-Google-Smtp-Source: AGHT+IFsu51n6ocw5x63uB2WGAgmrS1OWXdzA8DKortXtjEkphBT7d7yn+VjCKbypxqJv2Uo+/S+pA==
X-Received: by 2002:a05:600c:c0f:b0:43d:b51:46fb with SMTP id 5b1f17b1804b1-43db61d8dd7mr3689055e9.2.1743183399691;
        Fri, 28 Mar 2025 10:36:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86emul: Fix blowfish build in 64bit-clean environments
Date: Fri, 28 Mar 2025 17:36:37 +0000
Message-Id: <20250328173637.892960-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In a 64bit-clean environment, blowfish fails:

  make[6]: Leaving directory
  '/builddir/build/BUILD/xen-4.19.1/tools/tests/x86_emulator'
  In file included from /usr/include/features.h:535,
                   from /usr/include/bits/libc-header-start.h:33,
                   from /usr/include/stdint.h:26,
                   from
  /usr/lib/gcc/x86_64-xenserver-linux/12/include/stdint.h:9,
                   from blowfish.c:18:
  /usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No such
  file or directory
      7 | # include <gnu/stubs-32.h>
        |           ^~~~~~~~~~~~~~~~
  compilation terminated.
  make[6]: *** [testcase.mk:15: blowfish.bin] Error 1

because of lack of glibc-i386-devel or equivelent.  It's non-fatal, but
reduces the content in test_x86_emulator, which we do care about running.

Instead, convert all emulator testcases to being freestanding builds, resuing
the tools/firmware/include/ headers.

This in turn requires making firmware's stdint.h compatible with 64bit builds.
We now have compiler types for every standard type we use.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/firmware/include/stdint.h      | 27 ++++++++++-----------------
 tools/tests/x86_emulator/testcase.mk |  3 ++-
 2 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/tools/firmware/include/stdint.h b/tools/firmware/include/stdint.h
index 16a0b6de19c2..5c41cb8bdafc 100644
--- a/tools/firmware/include/stdint.h
+++ b/tools/firmware/include/stdint.h
@@ -1,21 +1,14 @@
 #ifndef _STDINT_H_
 #define _STDINT_H_
 
-#if defined(__LP64__) || defined(__P64__)
-#error "32bit only header"
-#endif
-
-typedef unsigned char uint8_t;
-typedef signed char int8_t;
-
-typedef unsigned short uint16_t;
-typedef signed short int16_t;
-
-typedef unsigned int uint32_t;
-typedef signed int int32_t;
-
-typedef unsigned long long uint64_t;
-typedef signed long long int64_t;
+typedef __INT8_TYPE__        int8_t;
+typedef __UINT8_TYPE__      uint8_t;
+typedef __INT16_TYPE__      int16_t;
+typedef __UINT16_TYPE__    uint16_t;
+typedef __INT32_TYPE__      int32_t;
+typedef __UINT32_TYPE__    uint32_t;
+typedef __INT64_TYPE__      int64_t;
+typedef __UINT64_TYPE__    uint64_t;
 
 #define INT8_MIN        (-0x7f-1)
 #define INT16_MIN       (-0x7fff-1)
@@ -32,8 +25,8 @@ typedef signed long long int64_t;
 #define UINT32_MAX      0xffffffffu
 #define UINT64_MAX      0xffffffffffffffffull
 
-typedef uint32_t uintptr_t;
+typedef __UINTPTR_TYPE__  uintptr_t;
 
-#define UINTPTR_MAX     UINT32_MAX
+#define UINTPTR_MAX     __UINTPTR_MAX__
 
 #endif
diff --git a/tools/tests/x86_emulator/testcase.mk b/tools/tests/x86_emulator/testcase.mk
index 7875b95d7c97..e47fd0917b54 100644
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -4,7 +4,8 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
-CFLAGS += -fno-builtin -fno-stack-protector -g0 $($(TESTCASE)-cflags)
+CFLAGS += -ffreestanding -nostdinc -I$(XEN_ROOT)/tools/firmware/include
+CFLAGS += -fno-stack-protector -g0 $($(TESTCASE)-cflags)
 
 LDFLAGS_DIRECT += $(shell { $(LD) -v --warn-rwx-segments; } >/dev/null 2>&1 && echo --no-warn-rwx-segments)
 
-- 
2.39.5


