Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A550597C57E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 10:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800548.1210489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srC5c-0000Cz-Mk; Thu, 19 Sep 2024 08:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800548.1210489; Thu, 19 Sep 2024 08:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srC5c-0000BO-Iw; Thu, 19 Sep 2024 08:00:36 +0000
Received: by outflank-mailman (input) for mailman id 800548;
 Thu, 19 Sep 2024 08:00:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1exg=QR=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1srC5b-00089h-2G
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 08:00:35 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e06f027-765d-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 10:00:31 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a90188ae58eso63656766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Sep 2024 01:00:31 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612b3833sm686196966b.128.2024.09.19.01.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 01:00:30 -0700 (PDT)
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
X-Inumbo-ID: 3e06f027-765d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726732831; x=1727337631; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5XBTlP1TXEcRRwDcvdfbc6Qq+ncvIdAbw/WbPBlRnI=;
        b=LHfia2+e3S9pvMXM47L5mbcWDlea9AReM6Rh4ndg9xLrt5h7SRAe4z33xNA1MubsIx
         3e6jyw7xlt2JgIuPoIW3rHk5FgHgk9X8y/5/F/4fWHRokbqttCRv7uSod8gU7lFZgJsO
         xr7uomfjmr234AF5Zh8gHm+PT34NnhjekUjew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726732831; x=1727337631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5XBTlP1TXEcRRwDcvdfbc6Qq+ncvIdAbw/WbPBlRnI=;
        b=YlmLrK/XVyi0Os6mzYnnMD/SoG7FR9cZRiU/0HeM5P6QxAaktLeTMhG9lqVxPAgImj
         oWh3on4w/hoLjqiPC3MN7Ugq0OngdI+nMgvry+I9iKGwGRzYLnqH1jWi+9pgW5+xluhI
         wOPsJKQFLdpgMposgbPz7B20vyop+31Vou2JpspKYUTC9Y4WfbbNX2MWThmPNLcCFpWr
         ArVVWTpiYepZEF4JvNej3GQtywTN+2m6Fe5fD4OtJVIJXJXS/evubcnuRWZ3ZWhF3+gM
         eyYPBkwkaQ3DlBuK3wvu6yG9SKRhOWkEC8w5Os81beNgEoApWVKtULTbMDqEtLi5XMa0
         nVQg==
X-Gm-Message-State: AOJu0YyA1rFj8cyUq0Q/FxbNoYPv3c5M8QW8mL/MX7kpGcy1BPvU7zr5
	SwflzD6BtGdbnfXBdeCXFwA6sxnEaOYTr5WU28fzQLR9SS6SBNsPvcdYvTSpT24OGHKPqW6pqsk
	x
X-Google-Smtp-Source: AGHT+IESGS6X3JslvnpPsVjgHFuxRffa1ThI9Aoww6Jzb8p67+KQwdu33i5O57wA0HpSwxon7ulsuQ==
X-Received: by 2002:a17:906:fd8b:b0:a8a:792c:4116 with SMTP id a640c23a62f3a-a902961a5f8mr2292692366b.40.1726732830857;
        Thu, 19 Sep 2024 01:00:30 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/3] x86: Put trampoline in separate .init.trampoline section
Date: Thu, 19 Sep 2024 09:00:19 +0100
Message-Id: <20240919080021.20155-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240919080021.20155-1-frediano.ziglio@cloud.com>
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
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

Changes since v3:
- split commit, add more requirements.
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


