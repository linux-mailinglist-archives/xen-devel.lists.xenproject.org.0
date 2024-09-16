Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4050979E9F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 11:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799363.1209359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq8HX-0008P2-9q; Mon, 16 Sep 2024 09:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799363.1209359; Mon, 16 Sep 2024 09:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq8HX-0008Na-5o; Mon, 16 Sep 2024 09:44:31 +0000
Received: by outflank-mailman (input) for mailman id 799363;
 Mon, 16 Sep 2024 09:44:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wse+=QO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sq8HV-0008NU-Qx
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 09:44:29 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44714156-7410-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 11:44:28 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso508230866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 02:44:28 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f4416sm291635766b.60.2024.09.16.02.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2024 02:44:27 -0700 (PDT)
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
X-Inumbo-ID: 44714156-7410-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726479868; x=1727084668; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxzMjZsG492N+ESYIzjtWdU0RNYoCUFjlB+Vf9Vw0RE=;
        b=P9cdG+36mMQcd+K4RiTp54akhz99Fh59xMYRnuQtOVNW37gCBQXn7YNPUz1v7cBZzc
         nOmCoqYbN5M2mC9bIP2kc4VUe6y29Cwj2D1SSjHKk+WObUr/K94Ee/4z/2dXki+iUTXK
         +tJu1TpjVs7vdoxaybQf+XZKZad4abK/lqylQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726479868; x=1727084668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxzMjZsG492N+ESYIzjtWdU0RNYoCUFjlB+Vf9Vw0RE=;
        b=FQD/1mZJ22RZaKLP1zSmTaKPH7hBA7dSyQkZjeRdRvEysuTxBkM32wmMGrIOxamdWs
         vmjCJ2ZCFgcH/NV1txGVOJAeN0XBqsG+0loWY+tN9nq8mnhXMEXQ74V1wSFmU40ClFQA
         7BbXEFkydKR2wKVb+G8uuOaFsZXlK4h2kngTwMnteY6+sQCVH1KiqEknkrxfXB8UB/Dz
         an74S6miuGMTjXSfTGFRs/Sddeb2Qg7WxFe4nHojElTU7OcaLTC8vOk2U0lzZD//F2fh
         0YuSDTsyqU9+MjdmdD2JzJOWgQVuJ0NyYj2K9s7xisb0t+CDQ5Tfh/AH5U3Jd7pW3JAH
         saNQ==
X-Gm-Message-State: AOJu0YwT8aVIYNHjLZMNf+NhV4wP8yBuUewnJ3YnzlmBWRKX+LnBfJqC
	+Cic5vuwQ76VFtiGE4E92cvJZK+W/k3gD0e5YwnRUTYaCqKMNmdlr9qgYhnrLEPfPcMumJyDbM0
	p
X-Google-Smtp-Source: AGHT+IH34nXtwDfxJIlG6+S0e0tKmv3HcCtfLHESXK+0qE+L4ceBZkmlMjtv2f0Tx3heKJKTAya5nQ==
X-Received: by 2002:a17:907:c88d:b0:a80:f358:5d55 with SMTP id a640c23a62f3a-a90295a6a7cmr1535636166b.33.1726479867943;
        Mon, 16 Sep 2024 02:44:27 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3] x86: Put trampoline in separate .init.trampoline section
Date: Mon, 16 Sep 2024 10:44:24 +0100
Message-Id: <20240916094424.74002-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change put the trampoline in a separate, not executable section.
The trampoline contains a mix of code and data (data which
is modified from C code during early start so must be writable).
This is in preparation for W^X patch in order to satisfy UEFI CA
memory mitigation requirements.
At the moment .init.text and .init.data in EFI mode are put together
so they will be in the same final section as before this patch.
Putting in a separate section (even in final executables) allows
to easily disassembly that section. As we need to have a writable
section and as we can't have code and data together to satisfy W^X
requirement we need to have a data section. However tools like objdump
by default do not disassemble data sections. Forcing disassembly of
data sections would result in a very large output and possibly crash
of tools. Putting in a separate section allows to selectively
disassemble that part of code using a command like

    objdump -m i386 -j .init.trampoline -d xen-syms

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since last version:
- use completely separate section even on final executables
  (suggested by Jan Beulich).

Changes since v1:
- remove useless align.

Changes since v2:
- remove change to alignment;
- improved commit message.
---
 xen/arch/x86/boot/head.S | 5 +++--
 xen/arch/x86/xen.lds.S   | 4 ++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 12bbb97f33..493286a9fb 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -882,8 +882,9 @@ cmdline_parse_early:
 reloc:
         .incbin "reloc.bin"
 
+#include "x86_64.S"
+
+        .section .init.trampoline, "aw", @progbits
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
-
-#include "x86_64.S"
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index d48de67cfd..22fb7d8458 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -269,6 +269,10 @@ SECTIONS
        __ctors_end = .;
   } PHDR(text)
 
+  DECL_SECTION(.init.trampoline) {
+       *(.init.trampoline)
+  } PHDR(text)
+
 #ifndef EFI
   /*
    * With --orphan-sections=warn (or =error) we need to handle certain linker
-- 
2.34.1


