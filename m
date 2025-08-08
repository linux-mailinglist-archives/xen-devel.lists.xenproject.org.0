Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FD9B1EF6D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:23:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075025.1437523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcg-0007Se-3v; Fri, 08 Aug 2025 20:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075025.1437523; Fri, 08 Aug 2025 20:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTcf-0007KS-Ut; Fri, 08 Aug 2025 20:23:29 +0000
Received: by outflank-mailman (input) for mailman id 1075025;
 Fri, 08 Aug 2025 20:23:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcd-0005tJ-TY
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:27 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 895497cd-7495-11f0-b898-0df219b8e170;
 Fri, 08 Aug 2025 22:23:25 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso16617565e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:25 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:23 -0700 (PDT)
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
X-Inumbo-ID: 895497cd-7495-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684604; x=1755289404; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caOVNgxtLJ5K64XlKHZ2JgkxvEgD9Gt7Q0o1sCQ6UZg=;
        b=PLE7MiksilklFd+GuyiBAfcnEzz2AHJOe8fGD8lp/JL4eBNo+D1M7JR05TA/WHgwY+
         YUZxMXmqHRvmqpCiuUpK4JZmbyPxqA7wyIUi9usm0o4FcT+RrY0Jbg4yjBofnvu2JBfs
         SSwzugldX1ndxjdagwjCFfuks0mhsF3/yjAsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684604; x=1755289404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caOVNgxtLJ5K64XlKHZ2JgkxvEgD9Gt7Q0o1sCQ6UZg=;
        b=BSmEGvIfzMVaHEI39nfUcaEDTyl/lTmUw5tFT0X7htHGLuSXZFiTbeMV50EZcHwzo+
         yd/I/MpsHQhaZHQYtT14IkWTumLJrETYCVn4KZLXP8+TeCC4m6xBceUQEfhq1JxiuCP1
         hJnbSK8n9gTomGr6XVv7j/N27uCi49xQnQWtCvOQHbS5ONpZ0OLtge88TJyGpyZt07v2
         spCs9PjtIa5dm9zMzC49WjZFhpkeo/qpaYHY+1pd/3WiHc8MQaZtwKuYNgtVVObekGcO
         MsXbaSM1BGiDUbJwJSXCIKxC93lu7rJoPhfD0nRr6MAET0hGlAnXBsfIEp830qAhXRHg
         IBxg==
X-Gm-Message-State: AOJu0YwVbgc9ULesr5RGN+xSKgSiSEyGOWL81GefASoacGzJFSHM+FlY
	1gUbwOiUO07CypUsGGIDFVFl4CEvQowc0mxYz+R9lSa0bARAoQJ4V9Z+AMiNjZeypwB0deDklZQ
	OB6qH9L0=
X-Gm-Gg: ASbGnctPEYpZTmx669sQ910jwRPFrUwCPtK9J4JjLrMgh2apEVLpFOw4uZKLk+3aH3T
	mOatoW0+dT/nPNaEao8ubBHSHbC4oSzk1U+uzKauMkDo+MITEM3C7MkMZd2rX7JqHDk7UolJcZh
	tkCDSmJJm8Tg6B903NIUKXN1ZY63kVnR14Xbx7Ztd1iLeirfiDib11K1aJWlVnkFQirKj6/Xq43
	xA3fBekl0TThmZpxhL1PGX+QJRBUi2SDdb3GqG+1Ox/YV3MhUkVXwMsoJtzQXsP47Im/sZw4TnZ
	QK4OBDDr+nnC2ltWduOAW0s54WA1Qx6ErkocPB0cBLNsw6nhSYwEhi8zrXZHdgNrsRQo0vZ83ky
	f0B/NLALZQddC8hKLS0VgQfX01e5WsDwxX9otPftQfCqKXDtUAxhzrgrapm00Mz9nFwI1hFuj2e
	u8
X-Google-Smtp-Source: AGHT+IGOw0qlDsxnoU+vKA/UvdlwbYyhckxJzdRWuP44Ae/YhL3fBnTji410tsUsLoTPsQG0MJuVlQ==
X-Received: by 2002:a05:6000:290b:b0:3b7:8fcc:a1e3 with SMTP id ffacd0b85a97d-3b900b5108cmr3392835f8f.48.1754684604384;
        Fri, 08 Aug 2025 13:23:24 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 06/22] x86/traps: Introduce bsp_traps_reinit()
Date: Fri,  8 Aug 2025 21:22:58 +0100
Message-Id: <20250808202314.1045968-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... to abstract away updating the refereces to the old BSP stack.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/traps.h | 1 +
 xen/arch/x86/setup.c             | 6 +-----
 xen/arch/x86/traps-setup.c       | 9 +++++++++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/traps.h b/xen/arch/x86/include/asm/traps.h
index 7414420e57d8..6ae451d3fc70 100644
--- a/xen/arch/x86/include/asm/traps.h
+++ b/xen/arch/x86/include/asm/traps.h
@@ -9,6 +9,7 @@
 
 void bsp_early_traps_init(void);
 void traps_init(void);
+void bsp_traps_reinit(void);
 void percpu_traps_init(void);
 
 extern unsigned int ler_msr;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 64f02699e1aa..c8c408e02436 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -902,11 +902,7 @@ static void __init noreturn reinit_bsp_stack(void)
     unsigned long *stack = (void*)(get_stack_bottom() & ~(STACK_SIZE - 1));
     int rc;
 
-    /* Update TSS and ISTs */
-    load_system_tables();
-
-    /* Update SYSCALL trampolines */
-    percpu_traps_init();
+    bsp_traps_reinit();
 
     stack_base[0] = stack;
 
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index 7713f427d344..370f4d5f7b60 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -107,6 +107,15 @@ void __init traps_init(void)
     percpu_traps_init();
 }
 
+/*
+ * Re-initialise all state referencing the early-boot stack.
+ */
+void bsp_traps_reinit(void)
+{
+    load_system_tables();
+    percpu_traps_init();
+}
+
 /*
  * Set up per-CPU linkage registers for exception, interrupt and syscall
  * handling.
-- 
2.39.5


