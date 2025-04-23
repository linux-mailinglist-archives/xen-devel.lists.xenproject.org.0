Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7912A97BED
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 03:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963782.1354765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVs-0002J1-6P; Wed, 23 Apr 2025 01:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963782.1354765; Wed, 23 Apr 2025 01:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVs-0002FT-1s; Wed, 23 Apr 2025 01:02:56 +0000
Received: by outflank-mailman (input) for mailman id 963782;
 Wed, 23 Apr 2025 01:02:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7OVq-0000o7-Nd
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 01:02:54 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeb9fdbb-1fde-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 03:02:52 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so60202285e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 18:02:53 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2326dsm6707635e9.15.2025.04.22.18.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 18:02:51 -0700 (PDT)
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
X-Inumbo-ID: aeb9fdbb-1fde-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745370172; x=1745974972; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Car784Mg7m/YLG0YJpvUcaWm7zKGiPIHLzmw/ReGrpU=;
        b=CchcjBVMooWXmEQy5dnwCxDF+wmyKeycAw1nqkWwRgBpHFIrilg2DV26YWhiaUcz9x
         RyiT6wFA1ia9K8n3nRqHSw5ab0CjApJUCJ6UOPFLGzm07aUcwNi7a4MYltR2AYIYT4Te
         zlYE0qk3ubAx6lA6GvC+nv6nShUj1dU8un2n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745370172; x=1745974972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Car784Mg7m/YLG0YJpvUcaWm7zKGiPIHLzmw/ReGrpU=;
        b=IWlIsdV2ZA9vC54S7wKFpnh0EOg9ige8JoWE/4zrLXBBunyLOWxZxJFXLHuBx7U09F
         N7+KwQk4JjKR3XTSiK493yz5kl+8yfMq/wL+Ac5eohmwBelJeHGXLh0lNn6aRm9lUy3g
         6nCuwQomD6KpLcmRGzyOrevVRJj8qzbDW5KwGPXNDrkP4bQOtI3W25fO0Cf+9rx3pwVA
         tbUPczEpjqbPWzgRW1V148suNctEi6o3fboWQnQ4GOckV4SoNxHpy28E0wCqvTJw2Ya0
         HMJIelRMcV0ONuNSXypacuj2p4DJJriMJ67IKAPidrKtZpywSsYj6bnVDF7Y14X9rsAA
         sBrA==
X-Gm-Message-State: AOJu0YzHtA6qcuZWK/GoASWXZ94QpUysqzqUAEeW7wVG8xKO+xYl6g8u
	N9QXevOOjc0y2/WtQP5Q7V7udc4Sqvyo+Kh0OBjQCY1ATZucqNox8Y06DRV8msGcKhACBKHZ28M
	E
X-Gm-Gg: ASbGncuLUJS7CDpOfRIHujcEBHt1QivF46JqZdWqGtFtTAV/o47/3lvFg8BC30sXQBM
	B+cgXKK0f/9F9kjqhgUgKxhN2Ce7bStqNEXpnqJyWbT4h2i+wdGvr8RWG3E6qE4eDfE2PkZrb1v
	VaQ5tWNSI4pAH4vF33YG7cC8pH0SdaBALxEPxgh7dh/z+RmLrtjLC2vGqE0gcP9dBKM86sLJvJs
	tfcTklBzb6NOM485X1WB3MM5LvCW5bJy+MgFJqdfIFN047GVuboLBzNgwShgXGmh+aEhWhi20vI
	RH1Y24GJ/Uiny86SgfcGUzM5ewmWbbBpMnOqcmXClnmaTkRKXkhAJ+8y7HjuzA==
X-Google-Smtp-Source: AGHT+IHCwz6HUV+NnETadrfzXBEL0LGCaI1Bo4OwY8mvAP0xChdNkPdYskXTtgnH8JOWTKFH6CTRLw==
X-Received: by 2002:a05:600c:1c28:b0:440:6a37:be30 with SMTP id 5b1f17b1804b1-4406aba5c25mr143876665e9.16.1745370172253;
        Tue, 22 Apr 2025 18:02:52 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 6/8] xen/livepatch: Support new altcall scheme
Date: Wed, 23 Apr 2025 02:02:35 +0100
Message-Id: <20250423010237.1528582-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new altcall scheme uses an .alt_call_sites section.  Wire this up in very
much the same way as the .altinstructions section, although there is less
sanity checking necessary.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/alternative.c         |  6 ++++
 xen/common/livepatch.c             | 58 ++++++++++++++++++++++++++++++
 xen/include/xen/alternative-call.h |  8 +++--
 3 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index f6594e21a14c..22af224f08f7 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -479,6 +479,12 @@ int apply_alternatives(struct alt_instr *start, struct alt_instr *end)
 {
     return _apply_alternatives(start, end, true);
 }
+
+int livepatch_apply_alt_calls(const struct alt_call *start,
+                              const struct alt_call *end)
+{
+    return apply_alt_calls(start, end);
+}
 #endif
 
 #define ALT_INSNS (1U << 0)
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 6ce77bf021b7..be9b7e367553 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -905,6 +905,64 @@ static int prepare_payload(struct payload *payload,
 #endif
     }
 
+    sec = livepatch_elf_sec_by_name(elf, ".alt_call_sites");
+    if ( sec )
+    {
+#ifdef CONFIG_ALTERNATIVE_CALL
+        const struct alt_call *a, *start, *end;
+
+        if ( !section_ok(elf, sec, sizeof(*a)) )
+            return -EINVAL;
+
+        /* Tolerate an empty .alt_call_sites section... */
+        if ( sec->sec->sh_size == 0 )
+            goto alt_call_done;
+
+        /* ... but otherwise, there needs to be something to alter... */
+        if ( payload->text_size == 0 )
+        {
+            printk(XENLOG_ERR LIVEPATCH "%s Alternative calls provided, but no .text\n",
+                   elf->name);
+            return -EINVAL;
+        }
+
+        start = sec->addr;
+        end = sec->addr + sec->sec->sh_size;
+
+        for ( a = start; a < end; a++ )
+        {
+            const void *orig = ALT_CALL_PTR(a);
+            size_t len = ALT_CALL_LEN(a);
+
+            /* orig must be fully within .text. */
+            if ( orig       < payload->text_addr ||
+                 len        > payload->text_size ||
+                 orig + len > payload->text_addr + payload->text_size )
+            {
+                printk(XENLOG_ERR LIVEPATCH
+                       "%s: Alternative call %p+%#zx outside payload text %p+%#zx\n",
+                       elf->name, orig, len,
+                       payload->text_addr, payload->text_size);
+                return -EINVAL;
+            }
+        }
+
+        rc = livepatch_apply_alt_calls(start, end);
+        if ( rc )
+        {
+            printk(XENLOG_ERR LIVEPATCH "%s: Applying alternative calls failed: %d\n",
+                   elf->name, rc);
+            return rc;
+        }
+
+    alt_call_done:;
+#else /* CONFIG_ALTERNATIVE_CALL */
+        printk(XENLOG_ERR LIVEPATCH "%s: Alternative calls not supported\n",
+               elf->name);
+        return -EOPNOTSUPP;
+#endif /* !CONFIG_ALTERNATIVE_CALL */
+    }
+
     sec = livepatch_elf_sec_by_name(elf, ".ex_table");
     if ( sec )
     {
diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
index 3c855bfa44f5..767c2149bce7 100644
--- a/xen/include/xen/alternative-call.h
+++ b/xen/include/xen/alternative-call.h
@@ -17,8 +17,8 @@
  *   generation requirements are to emit a function pointer call at build
  *   time, and stash enough metadata to simplify the call at boot once the
  *   implementation has been resolved.
- * - Implement boot_apply_alt_calls() to convert the function pointer calls
- *   into direct calls on boot.
+ * - Implement {boot,livepatch}_apply_alt_calls() to convert the function
+ *   pointer calls into direct calls on boot/livepatch.
  * - Select ALTERNATIVE_CALL in Kconfig.
  *
  * To use:
@@ -65,6 +65,10 @@
  */
 void boot_apply_alt_calls(void);
 
+/* As per boot_apply_alt_calls() but for a livepatch. */
+int livepatch_apply_alt_calls(const struct alt_call *start,
+                              const struct alt_call *end);
+
 #else /* CONFIG_ALTERNATIVE_CALL */
 
 #define alternative_call(func, args...)  (func)(args)
-- 
2.39.5


