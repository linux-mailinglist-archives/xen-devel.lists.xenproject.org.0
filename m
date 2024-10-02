Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A8D98DF0B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:27:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808902.1221002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GP-0008Si-Qw; Wed, 02 Oct 2024 15:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808902.1221002; Wed, 02 Oct 2024 15:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GP-0008Pb-JB; Wed, 02 Oct 2024 15:27:41 +0000
Received: by outflank-mailman (input) for mailman id 808902;
 Wed, 02 Oct 2024 15:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw1GN-0007h7-Vx
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:27:39 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db2f3685-80d2-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 17:27:38 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so986424266b.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:27:38 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299ac8esm880024566b.222.2024.10.02.08.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:27:36 -0700 (PDT)
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
X-Inumbo-ID: db2f3685-80d2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727882857; x=1728487657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OYNqhpKRgZXD8+6+AhbIpT8QNeVjNGqQsR7u8ru59I=;
        b=bgZ6vCv6CL3Yk4zQrlPy9O+4COEFiqNa2NUzpA3sziLKHuovyQmdlHA/8ge3XwFeQw
         SOs2o4DqyIXezOuCPbnD17FpHtV3J1iZzuxunOsCQNJLPQBbQ1/yDWy+P4f8L0eKCnNx
         4wLCaaiSVI8uebUwmjj0nOCtrxAUJx+jNosuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882857; x=1728487657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OYNqhpKRgZXD8+6+AhbIpT8QNeVjNGqQsR7u8ru59I=;
        b=lyqkjF9C4IY0B5hxgilOpGRA3nCV5MkZWzvbOldh7PTWzLVe0BFvjtW/LijU78NKnH
         ugg0uJP/49KHp77yY75+h68x8n0aRSsAV23rodPSK6QMAd+NRWE+3o/IH6fP8YqmxFxP
         R0Xz6GKqALvfq8XHTcaX7YsmGtu/ZsiKVzjZ5pNMU+uoSpZxhGvaR8UAcix8YPbrrwN9
         kjyhVyaGABxBjcuL5lvR62w3RAtBqxJGtqe33k0/vvf0/qRNTJWjv5Fw8f7Aih3W7C+H
         IfJ4Ry34huY15OYVP3jhKfDNN6DwvuQ9MhERN/d+LxSWl+RUd4XoJaCrkyWGSJNrV6tF
         peMw==
X-Gm-Message-State: AOJu0YzR3Ujw5VrCSr8lX1RAS3R8Sy7OublKndq3DFW7k+IdsmH0xhkH
	zoIQkOD4uytE5E092WTHxA3FJhk+K93KEG/NzXBduznnZRkoNjytybv3Ni9fdbLgxgSunV6cvmp
	0dDc=
X-Google-Smtp-Source: AGHT+IGyps52t9eHsJjMQR/F6NQEncBxc2igwnQUXEn+2dI/dBTnAiVOxq0yisZwo57aulhs1Sa6DQ==
X-Received: by 2002:a17:907:703:b0:a8b:6ee7:ba17 with SMTP id a640c23a62f3a-a98f83ff431mr349107466b.55.1727882856976;
        Wed, 02 Oct 2024 08:27:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/7] x86/alternative: Walk all replacements during self tests
Date: Wed,  2 Oct 2024 16:27:21 +0100
Message-Id: <20241002152725.1841575-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
References: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When self tests are active, walk all alternative replacements with
x86_decode_lite().

This checks that we can decode all instructions, and also lets us check that
disp8's don't leave the replacement block as such a case will definitely
malfunction.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <JBeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Rebase over API changes in patch 1
 * Use +%lu and drop casts
 * Swap to CONFIG_SELF_TESTS
---
 xen/arch/x86/alternative.c | 52 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 1ba35cb9ede9..2dc759abd858 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -15,6 +15,7 @@
 #include <asm/traps.h>
 #include <asm/nmi.h>
 #include <asm/nops.h>
+#include <asm/x86_emulate.h>
 #include <xen/livepatch.h>
 
 #define MAX_PATCH_LEN (255-1)
@@ -490,6 +491,57 @@ static void __init _alternative_instructions(bool force)
 void __init alternative_instructions(void)
 {
     arch_init_ideal_nops();
+
+    /*
+     * Walk all replacement instructions with x86_decode_lite().  This checks
+     * both that we can decode all instructions within the replacement, and
+     * that any near branch with a disp8 stays within the alternative itself.
+     */
+    if ( IS_ENABLED(CONFIG_SELF_TESTS) )
+    {
+        struct alt_instr *a;
+
+        for ( a = __alt_instructions;
+              a < __alt_instructions_end; ++a )
+        {
+            void *repl = ALT_REPL_PTR(a);
+            void *ip = repl, *end = ip + a->repl_len;
+
+            if ( !a->repl_len )
+                continue;
+
+            for ( x86_decode_lite_t res; ip < end; ip += res.len )
+            {
+                const int8_t *d8;
+                const void *target;
+
+                res = x86_decode_lite(ip, end);
+
+                if ( res.len == 0 )
+                {
+                    printk("Alt for %ps [%*ph]\n",
+                           ALT_ORIG_PTR(a), a->repl_len, repl);
+                    panic("  Unable to decode instruction at +%lu in alternative\n",
+                          ip - repl);
+                }
+
+                if ( res.rel_sz != 1 )
+                    continue;
+
+                d8 = res.rel;
+                target = ip + res.len + *d8;
+
+                if ( target < repl || target > end )
+                {
+                    printk("Alt for %ps [%*ph]\n",
+                           ALT_ORIG_PTR(a), a->repl_len, repl);
+                    panic("  'JMP/Jcc disp8' at +%lu leaves alternative block\n",
+                          ip - repl);
+                }
+            }
+        }
+    }
+
     _alternative_instructions(false);
 }
 
-- 
2.39.5


