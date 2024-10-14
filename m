Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6A899C428
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 10:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818523.1231858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Gpr-0000Yp-2d; Mon, 14 Oct 2024 08:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818523.1231858; Mon, 14 Oct 2024 08:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0Gpq-0000Uw-Ru; Mon, 14 Oct 2024 08:53:50 +0000
Received: by outflank-mailman (input) for mailman id 818523;
 Mon, 14 Oct 2024 08:53:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qGCd=RK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t0Gpo-000862-WA
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 08:53:48 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3e625df-8a09-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 10:53:48 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a99ebb390a5so291037566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Oct 2024 01:53:48 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99a80f2446sm551817766b.206.2024.10.14.01.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 01:53:47 -0700 (PDT)
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
X-Inumbo-ID: d3e625df-8a09-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728896028; x=1729500828; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUEXdxMnhhDzo/2gzjHB2TfqPR4THpXflyTPiqcQYhg=;
        b=VZASOegr+0HPihLAeEU+kxpkZVIQ+yKWy96TH932Z58r+OKxuVRKJ5UjPsvQqmX/bt
         t62mn39jCTNwZQE2mS+mFFwVPuaLLbVU9UB5F56BRn5/V5yvj2SpNLeI646YQqwEQl/F
         UrbtxIIqypQitUjktuMjA4WT5D2Zq0AQv5o2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896028; x=1729500828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUEXdxMnhhDzo/2gzjHB2TfqPR4THpXflyTPiqcQYhg=;
        b=H3vK+N/FxhfXo2+OL1Z0HDZ4izsbbHbhS0fjgRMMYYnQy7NhVyOJNTphZKDUBo2yau
         Ou0ODyw7MhaJpyLx16HRTCO5rEtCMayN8tSdrIt2/5UUMLm/dtYsAyYDpHHYgWmjNCHr
         PzrXg0D88yqYixyOKRv+EZnQhDYmZb55YaQXug92SPhmxoTbG15ux2mmlRny7dP2VLvE
         xdeD7IcW0e2+csJKzkQlw+bJMcOTy7/x8APHlTGm77p0rHvkbk85gewH4yUyq1HcCJim
         vCkWhjB8CyGFgiKtsCiw5O4/6w39epMsNs4VPS7qDUoFZa+QM3fRp4Xvt7qlmQ7uVxZ0
         pH7Q==
X-Gm-Message-State: AOJu0Yw7kxRTkAHmpbs22+yp7UGDOTryR0BslO+r4KR56zdfEnb2m1jH
	YhIgP2K7GrpJFrJqJ9hcM1/DvNS5DKcfqy/Qm3koI2y7di3vlllSrIkxPa/z1DdeJdbE230FF43
	u
X-Google-Smtp-Source: AGHT+IFj+V1uiM2hGVgK8TpUoL7Vy0uU8dQnXhBfw/jVVNHHTVFzCF12fB6dz2k1PZfFxGX1yqzZdw==
X-Received: by 2002:a17:906:6a01:b0:a99:ee26:f416 with SMTP id a640c23a62f3a-a99ee270d76mr517229666b.14.1728896027803;
        Mon, 14 Oct 2024 01:53:47 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 5/6] x86/boot: Use trampoline_phys variable directly from C code
Date: Mon, 14 Oct 2024 09:53:31 +0100
Message-Id: <20241014085332.3254546-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more need to pass from assembly code.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
- split the 2 variable changes into 2 commits.

Changes since v2:
- revert commit order;
- avoid useless casts.
---
 xen/arch/x86/boot/head.S  | 6 +-----
 xen/arch/x86/boot/reloc.c | 8 ++++++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 5da7ac138f..dcda91cfda 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -510,13 +510,9 @@ trampoline_setup:
         mov     %esi, sym_esi(xen_phys_start)
         mov     %esi, sym_esi(trampoline_xen_phys_start)
 
-        /* Get bottom-most low-memory stack address. */
-        mov     sym_esi(trampoline_phys), %ecx
-        add     $TRAMPOLINE_SPACE,%ecx
-
         /* Save Multiboot / PVH info struct (after relocation) for later use. */
         mov     %ebx, %edx          /* Multiboot / PVH information address. */
-        /*      reloc(magic/eax, info/edx, trampoline/ecx) using fastcall. */
+        /*      reloc(magic/eax, info/edx) using fastcall. */
         call    reloc
 
 #ifdef CONFIG_PVH_GUEST
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 707d9c5f15..e50e161b27 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -19,6 +19,9 @@
 #include <xen/kconfig.h>
 #include <xen/multiboot.h>
 #include <xen/multiboot2.h>
+#include <xen/page-size.h>
+
+#include <asm/trampoline.h>
 
 #include <public/arch-x86/hvm/start_info.h>
 
@@ -344,9 +347,10 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, memctx *ctx)
 }
 
 /* SAF-1-safe */
-void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline)
+void *reloc(uint32_t magic, uint32_t in)
 {
-    memctx ctx = { trampoline };
+    /* Get bottom-most low-memory stack address. */
+    memctx ctx = { trampoline_phys + TRAMPOLINE_SPACE };
 
     switch ( magic )
     {
-- 
2.34.1


