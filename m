Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3FB98E3F7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 22:09:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809009.1221119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw5ex-0006uK-Uv; Wed, 02 Oct 2024 20:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809009.1221119; Wed, 02 Oct 2024 20:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw5ex-0006sX-Qv; Wed, 02 Oct 2024 20:09:19 +0000
Received: by outflank-mailman (input) for mailman id 809009;
 Wed, 02 Oct 2024 20:09:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw5ew-0006rI-3a
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 20:09:18 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33c27f29-80fa-11ef-a0ba-8be0dac302b0;
 Wed, 02 Oct 2024 22:09:17 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c89f3f28b6so128046a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 13:09:17 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c882405bb8sm7939677a12.12.2024.10.02.13.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 13:09:15 -0700 (PDT)
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
X-Inumbo-ID: 33c27f29-80fa-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727899756; x=1728504556; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8mpxVnw2rtIsaSdMnuwMlxzK800socadVEux++4FjuU=;
        b=j7oTTqofEU6gw4rzqDrJGmf75cKv3AVEKjlT1eav3zIoQyg7fzEGyqAegrqF7n+9k6
         Ya5x3X7B4WvdLBpYZu39H754pBkJ6SMFdn/KAlRUB9vD/wLDxz5v19j+TnJmfB0AksOl
         ++mHpEAapbOojB7mjHjg81lNzL0JX00cPgN48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727899756; x=1728504556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mpxVnw2rtIsaSdMnuwMlxzK800socadVEux++4FjuU=;
        b=L2ifUeo5SLFdBhZkJV8QCVQNaei4Ca6JFAcDucnjqWE5gKrnR38eocqkqp/+QR2lZW
         2nh0eVwN7Pb6g/hhL3PIV1PTVzo2swukUFyqtDPoSC6SdTcMHbOanxA6iG5nwYo09nFV
         3X6DzMCZXS8NFPRMSTYooGp7R3E8FpIL+wrlk04Vx/5AycQmtwCLDiCsZH8u2XKbFdax
         OT6I5BfjVp6Nq6EgF1VBu9Fb7hOzxvB2tI7/u6nrkonZ1CL/YBSWh5lc8vLeUSkGvSWi
         qTANpDWcC4SFXzJe7Bikt7YxL5yFQDwi/5aCsUmp3sLPCDzybcYvEZ2IYMvTM8QBof/I
         DSxw==
X-Gm-Message-State: AOJu0YxvLiJgC0UTTEt7XkzCOt957vMFPVNRGUHBSmi/w8zRh1C+yJHU
	LIlz4UWjDqr1JLdJa6MHqs5+XWbOtbEz2OWmHzLKIDQoWQjlA6cRM23VD91Z2mY+e9Qut8JmqbV
	hz6U=
X-Google-Smtp-Source: AGHT+IEixX0Bsej9XM12xmY27f0Lzd6EtV/5EFDvjGApFVel/3DcNQCYom44RLt6QUltjbo5CfWTAA==
X-Received: by 2002:a05:6402:4402:b0:5c5:c060:420d with SMTP id 4fb4d7f45d1cf-5c8b1b6ffebmr3405946a12.25.1727899756072;
        Wed, 02 Oct 2024 13:09:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Convert remaining uses of the legacy ALIGN
Date: Wed,  2 Oct 2024 21:09:13 +0100
Message-Id: <20241002200913.1963443-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are only two remaining standalone uses the legacy ALIGN macro.

Drop these by switching the .incbin's over to using FUNC()/END() which has
alignment handled internally.  While the incbin's aren't technically one
single function, they're as good as one single function.

Finally, expand ALIGN inside the legacy ENTRY() macro in order to remove ALIGN
itself.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

before/after builds show no change at all, except for
cmdline_parse_early()/reloc() ELF metadata.
---
 xen/arch/x86/boot/head.S | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 6a06f6c9ea46..837740477c6e 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -10,9 +10,8 @@
 #include <asm/cpufeature.h>
 #include <public/elfnote.h>
 
-#define ALIGN .align CONFIG_FUNCTION_ALIGNMENT, CODE_FILL
 #define ENTRY(name)                             \
-  ALIGN;                                        \
+  .align CONFIG_FUNCTION_ALIGNMENT, CODE_FILL;  \
   GLOBAL(name)
 #define GLOBAL(name)                            \
   .globl name;                                  \
@@ -850,13 +849,13 @@ trampoline_setup:
          * cmdline and reloc are written in C, and linked to be 32bit PIC with
          * entrypoints at 0 and using the fastcall convention.
          */
-        ALIGN
-cmdline_parse_early:
+FUNC_LOCAL(cmdline_parse_early)
         .incbin "cmdline.bin"
+END(cmdline_parse_early)
 
-        ALIGN
-reloc:
+FUNC_LOCAL(reloc)
         .incbin "reloc.bin"
+END(reloc)
 
 ENTRY(trampoline_start)
 #include "trampoline.S"

base-commit: 41190d2ceb03b12ffc17a66c04de519c26a6052a
-- 
2.39.5


