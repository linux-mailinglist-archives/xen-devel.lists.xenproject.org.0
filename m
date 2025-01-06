Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E46A02445
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 12:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865696.1276962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUlGF-0005S2-NC; Mon, 06 Jan 2025 11:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865696.1276962; Mon, 06 Jan 2025 11:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUlGF-0005QP-KY; Mon, 06 Jan 2025 11:27:07 +0000
Received: by outflank-mailman (input) for mailman id 865696;
 Mon, 06 Jan 2025 11:27:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFJS=T6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tUlGE-0005Pz-Im
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 11:27:06 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2268b738-cc21-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 12:26:55 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso97690145e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 03:26:55 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e528sm48242271f8f.83.2025.01.06.03.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 03:26:54 -0800 (PST)
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
X-Inumbo-ID: 2268b738-cc21-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736162815; x=1736767615; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A7OP8fAG/F5Kp1fylhgwCJW5UrsQ9AfjRS2QwrkoD2Q=;
        b=Y8zKB689A9bDXO+xTonjH1qCc4wgaQ9sk0g06mZ7C9M99Dvan5+Xv8IQw32eqW9AEO
         6hn9BwP3MtfCP7EjRrnHAlZu5/84CRM0LXdV4gDwp/L1S5seKeOleN2tm42RrBG9pjmH
         my9aixmPilvWGRjm/CAabFJRYAZelVj5cffzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736162815; x=1736767615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7OP8fAG/F5Kp1fylhgwCJW5UrsQ9AfjRS2QwrkoD2Q=;
        b=b3X3QF2/XePeOUbwIhCtCae/uV8WVoxs1bmui1Q4ebXnni8S7T/XYm+6SAAHGHZv9X
         RmgPp2V+2AR/sF3IeOIW8q4ipdIIQg2srNrpo7N4wDBhAk+as+EKayi6tVffEr1KvVIt
         eLC6ZAj5F1g/A2PbprqrZZKbGAkyYsUyA8BqgCNaITTGG+D1zVVFoOr/7w6AOWB2lPUK
         s+T5p1SgurgQqWwle5Esh+XBKiXdhPVPdQyPEMLFvPf7K88julumtHYJDUuDmOWKo07w
         59WgC/zh7OKBSi+GN6IMAMEjIh8yPmkyhUbJxERa3DcdBUZXlvRFY9L7zDGdF5AyFQ3p
         5l5A==
X-Gm-Message-State: AOJu0YyAvWzwTvqwrWTE2wFR2oyORoo2h6ccZnp7zsxD6DWzD4WH+1hS
	d35OcZIUwH9vB8KfwjKQsfNqh1UVyx4mD/K2Y1k9iZ6aAGvJEqSJfCJAbGGmN6l+UeMHZU1bgZ1
	wM0qSDQ==
X-Gm-Gg: ASbGncsDyV8JwT/MzXPpP4rbK70hRnsU6+pdBm+ABg2pEfDq/ITd/lZbaAuiHi6sDBI
	XDfRw6Hu4EkQxzrRF4neimTyZdKEicWUU1TScG2X27CsLycx/2vf4pJFpb5GgMgEAdnAj7HUvsq
	hCemXgrDI8fFbD996X3Q1Hta411ZIPUlLdrdFNDqWDrgZa2JmphXDmWs1ma7tQrn4YP1NZN8u0x
	yGBepU1l78EelGKuyH5MaPQCBqMPHdLi63QNK4CnL/w+ByscZrfOXUkk3tCyTyNwnevLwUpbV4O
	Qfo2aVxLLv+RZyWFicYU3NUwg1R8p9mjyeEU
X-Google-Smtp-Source: AGHT+IEI8bQVed9DJiAHzMMIk5oad9Up6bbs99zf9kGUmgKuzBsFhh610ODfVmpqfdf7KcFI21KT9Q==
X-Received: by 2002:a05:6000:18ab:b0:386:1cd3:8a05 with SMTP id ffacd0b85a97d-38a223fd47fmr54971460f8f.54.1736162814616;
        Mon, 06 Jan 2025 03:26:54 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Fix zap_low_mappings() to map less of the trampoline
Date: Mon,  6 Jan 2025 11:26:52 +0000
Message-Id: <20250106112652.579310-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Regular data access into the trampoline is via the directmap.

As now discussed quite extensively in asm/trampoline.h, the trampoline is
arranged so that only the AP and S3 paths need an identity mapping, and that
they fit within a single page.

Right now, PFN_UP(trampoline_end - trampoline_start) is 2, causing more than
expected of the trampoline to be mapped.  Cut it down just the single page it
ought to be.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

There's not an obvious candidate for a Fixes tag.
---
 xen/arch/x86/x86_64/mm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 389d813ebe63..d4e6a9c0a2e0 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -718,14 +718,16 @@ void __init zap_low_mappings(void)
 {
     BUG_ON(num_online_cpus() != 1);
 
-    /* Remove aliased mapping of first 1:1 PML4 entry. */
+    /* Stop using l?_bootmap[] mappings. */
     l4e_write(&idle_pg_table[0], l4e_empty());
     flush_local(FLUSH_TLB_GLOBAL);
 
-    /* Replace with mapping of the boot trampoline only. */
+    /*
+     * Insert an identity mapping of the AP/S3 part of the trampoline, which
+     * is arranged to fit in a single page.
+     */
     map_pages_to_xen(trampoline_phys, maddr_to_mfn(trampoline_phys),
-                     PFN_UP(trampoline_end - trampoline_start),
-                     __PAGE_HYPERVISOR_RX);
+                     1, __PAGE_HYPERVISOR_RX);
 }
 
 int setup_compat_arg_xlat(struct vcpu *v)
-- 
2.39.5


