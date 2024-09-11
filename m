Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BB8974F1F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 11:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796349.1205896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soK4q-0000Sh-OL; Wed, 11 Sep 2024 09:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796349.1205896; Wed, 11 Sep 2024 09:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soK4q-0000PY-LL; Wed, 11 Sep 2024 09:55:56 +0000
Received: by outflank-mailman (input) for mailman id 796349;
 Wed, 11 Sep 2024 09:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2J2y=QJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1soK4p-0000PN-Cl
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 09:55:55 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08e35874-7024-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 11:55:54 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7a81bd549eso197252566b.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 02:55:54 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25c61185sm594309566b.100.2024.09.11.02.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 02:55:52 -0700 (PDT)
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
X-Inumbo-ID: 08e35874-7024-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726048553; x=1726653353; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6owM1Qo38hyYWvztDo7A9EosvXe0kmeN5gLxPEpHgo=;
        b=dZwjGL/GJMAgck5qhHxXVH9frc1zT53xslwCOUYYFB+C9vcPxi8U+uXKckCSFyS57G
         Iljfkm25isJOe1FVgcvDpMDl4p2wp+QElV/+YHn2aWWZ31eUDO5UOHTfZjctnvv6Valp
         1mEV+1C8HGPfJc8npHkY/ScYRcuYQp6tvxm3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726048553; x=1726653353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6owM1Qo38hyYWvztDo7A9EosvXe0kmeN5gLxPEpHgo=;
        b=r71MDhdSKa6BgwRlyTa8OwdynzHQBifuVypg3mY6AaaeS2CV86OvgeI9v1vexnZJbg
         O2rUfVWRSI160nI/N1Zy9iI9lYnUdgifQHz7WX9vaudZk7BUa3bPfHxWdBWcAleJZk5G
         gA2ek7Ern6EVtKuu73JLTMg18b4YPe82OOFFNHsTlhmr1bXMm78/tl2A7u5UfiIuvm7z
         DSFneeIfKwAMiKRwuP+qB/8KI7m+mW4kfPwCzTRxJC4zuR8qce17xI4VYVIN5RdJCXHY
         ycaumBNWrvC88umioupAcypsYCnlt6cHdkNniHbHKUu8rLfByOwncaKZV04F/yvORMxd
         uX8A==
X-Gm-Message-State: AOJu0YyPlkj1H25g64Di0mCdghosB1vd+8BMKfmYkzlQX0zNCBZO0nij
	3dqKnFjAX9irfMkARxyivz43SXw73qrhpeaXgHQ0Q90OApmo/VUZCPyQ6c8jSRT4sVhAzqEuld7
	f
X-Google-Smtp-Source: AGHT+IHPccyAPX0GJkL6HfHPxGCwMW1GWlkMlOYUYho6BqXtPMQpAjrk3KHzq0Uz0eKUsIxzcQiJ5Q==
X-Received: by 2002:a17:907:7e97:b0:a8d:592d:f76 with SMTP id a640c23a62f3a-a9004a66234mr291940666b.48.1726048553328;
        Wed, 11 Sep 2024 02:55:53 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86: Put trampoline in separate .init.trampoline section
Date: Wed, 11 Sep 2024 10:55:50 +0100
Message-Id: <20240911095550.31139-1-frediano.ziglio@cloud.com>
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
to easily disassembly that section.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since last version:
- use completely separate section even on final executables
  (suggested by Jan Beulich).

Changes since v1:
- remove useless align.
---
 xen/arch/x86/boot/head.S | 5 +++--
 xen/arch/x86/xen.lds.S   | 5 +++++
 2 files changed, 8 insertions(+), 2 deletions(-)

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
index d48de67cfd..390870e463 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -269,6 +269,11 @@ SECTIONS
        __ctors_end = .;
   } PHDR(text)
 
+  . = ALIGN(PAGE_SIZE);
+  DECL_SECTION(.init.trampoline) {
+       *(.init.trampoline)
+  } PHDR(text)
+
 #ifndef EFI
   /*
    * With --orphan-sections=warn (or =error) we need to handle certain linker
-- 
2.34.1


