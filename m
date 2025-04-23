Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB9A97BF0
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 03:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963781.1354755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVq-00021v-Ro; Wed, 23 Apr 2025 01:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963781.1354755; Wed, 23 Apr 2025 01:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVq-0001zi-NU; Wed, 23 Apr 2025 01:02:54 +0000
Received: by outflank-mailman (input) for mailman id 963781;
 Wed, 23 Apr 2025 01:02:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7OVp-0000o7-Go
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 01:02:53 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adfa9e1d-1fde-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 03:02:51 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so60202185e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 18:02:51 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2326dsm6707635e9.15.2025.04.22.18.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 18:02:50 -0700 (PDT)
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
X-Inumbo-ID: adfa9e1d-1fde-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745370171; x=1745974971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az5L3AwTen2X3hdYSvHBPLsXM8erZfsxm7tPT2WuzcM=;
        b=MCOTSkLhYaRq+hIqlwtxj3afDYyjkDl/ZhkgXZGXQl1rgK9fer32P7F3rFFGEfvZUG
         XAWXyPf+ZAqxrM8nUmUzSxs+gIHzC5/gkDNlBswHnlCq/YulV4P7BVGjKs2jilI5jC6R
         EzFnSA6eZc4WGRYwY5tyv/NQO/Kuwb5UG2pq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745370171; x=1745974971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Az5L3AwTen2X3hdYSvHBPLsXM8erZfsxm7tPT2WuzcM=;
        b=kPrxHcRvufn8ysk3L1UHxAxaleiE+M/Uq8moPCiTol3ik8gxTCK1sPJy2yESgj7mNp
         bB6KCxBiRRe+fjvDxCuMCkYe8Ir7xcGBdjkbP/xkE3BW50OUoKJ3MisR3xWQ0absDaYG
         KOM3/YIYruQWzl0CS9XP/I+4sD73+aL+HoNkVExT0q3pfPHFog7PhppKS79xhfcsRark
         cGw9t8b6kCyRWJrGEaEVkqtBWUGtzkk7r+NZ5g1vfHpDjAJ7H9NIIdIONoGAZWyVgC4V
         qU8z22Vz7CKi+NAvd7u+muC8tSZZVxeEHDKAPL4p3ToPWFBLEVu/DXJ4CaW0idJLO1Bc
         2+XA==
X-Gm-Message-State: AOJu0Yz1ck47lV6wk7OoXlSHcBIytwXeX+OA1n7wMsD992Hh7CptNDOt
	EO5EmFGYAFx9aOfK451351gpgDXV9iOVFl8ohpfTbKJ98oBd1DBoZZDfJhfrSHPdOvhDQxoNsQC
	+
X-Gm-Gg: ASbGncs9MKmwSl7CdJgMPZ/7FtIS0Xp7qNpPSXTeJiZRBVpCsDCK/AMLHhnrCc5kj8J
	UJxJvPHtY2vhC7iVJIg8WrDmOdLwryPZf0J1L8JPe7wqvRmYSed1HnlJ3PMv9M7No5htLHQUokh
	k8snJH7BdJGtqrEsGEdzs921A002NnZPnIeYo0H9sGD3bwc0Ji1LE9TY4S9bfjURWd6T8DYXbby
	7Xh3qkpj8SaVC7fi18FbyR25Fow5iUL/qaVAFWnyHFSRRS6kRyxeYqo4dUyGybtOx9H3QYJ24Wa
	A4+n6w2zaM6loteIEsiyznSofanPejRkMUMgPh6BHvv2cdUs9+RfKY9rM210UQ==
X-Google-Smtp-Source: AGHT+IEcxiy7BCMC8dQM+wTEIGNnjB9Ygk8LgBhJdkXFw8myBmCXysxUCn4C1uwaGlXg9SIIKR4tqA==
X-Received: by 2002:a05:600c:1c9d:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-4406ab93151mr166134125e9.9.1745370170847;
        Tue, 22 Apr 2025 18:02:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/8] x86/altcall: Introduce new simpler scheme
Date: Wed, 23 Apr 2025 02:02:34 +0100
Message-Id: <20250423010237.1528582-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Encoding altcalls as regular alternatives leads to an unreasonable amount of
complexity in _apply_alternatives().

Introduce apply_alt_calls(), and an .alt_call_sites section which simply
tracks the source address (relative, to save on space).  That's literally all
that is needed in order to devirtualise the function pointers.

apply_alt_calls() is mostly as per _apply_alternatives(), except the size is
known to be 6 bytes.  Drop the logic for JMP *RIPREL, as there's no support
for tailcall optimisations, nor a feasbile plan on how to introduce support.
Pad with a redundant prefix to avoid needing a separate NOP on the end.

Wire it up in nmi_apply_alternatives(), although the section is empty at this
juncture so nothing happens in practice.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Finding a 6-byte UD instruction that is distinct from ud2 turns out to be
quite challengning.  The easy way involves a length changing prefix, which is
best avoided.  Suggestions for alternative patterns welcome.

---
 xen/arch/x86/alternative.c                  | 94 +++++++++++++++++++++
 xen/arch/x86/include/asm/alternative-call.h |  7 ++
 xen/arch/x86/xen.lds.S                      |  4 +
 3 files changed, 105 insertions(+)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 4b9f8d860153..f6594e21a14c 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -388,6 +388,92 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
     return 0;
 }
 
+/*
+ * At build time, alternative calls are emitted as:
+ *   ff 15 xx xx xx xx  =>  call *disp32(%rip)
+ *
+ * During boot, we devirtualise by editing to:
+ *   2e e8 xx xx xx xx  =>  cs call disp32
+ *
+ * or, if the function pointer is still NULL, poison to:
+ *   0f 0b 0f 0b 0f 0b  =>  ud2a (x3)
+ */
+static int init_or_livepatch apply_alt_calls(
+    const struct alt_call *start, const struct alt_call *end)
+{
+    const struct alt_call *a;
+
+    for ( a = start; a < end; a++ )
+    {
+        const uint8_t *dest;
+        uint8_t buf[6], *orig = ALT_CALL_PTR(a);
+        long disp;
+
+        /* It's likely that this won't change, but check just to be safe. */
+        BUILD_BUG_ON(ALT_CALL_LEN(a) != 6);
+
+        if ( orig[0] != 0xff || orig[1] != 0x15 )
+        {
+            printk(XENLOG_ERR
+                   "Altcall for %ps [%6ph] not CALL *RIPREL\n",
+                   orig, orig);
+            return -EINVAL;
+        }
+
+        disp = *(int32_t *)(orig + 2);
+        dest = *(const void **)(orig + 6 + disp);
+
+        if ( dest )
+        {
+            /*
+             * When building for CET-IBT, all function pointer targets
+             * should have an endbr64 instruction.
+             *
+             * If this is not the case, leave a warning because
+             * something is probably wrong with the build.  A CET-IBT
+             * enabled system might have exploded already.
+             *
+             * Otherwise, skip the endbr64 instruction.  This is a
+             * marginal perf improvement which saves on instruction
+             * decode bandwidth.
+             */
+            if ( IS_ENABLED(CONFIG_XEN_IBT) )
+            {
+                if ( is_endbr64(dest) )
+                    dest += ENDBR64_LEN;
+                else
+                    printk(XENLOG_WARNING
+                           "Altcall %ps dest %ps has no endbr64\n",
+                           orig, dest);
+            }
+
+            disp = dest - (orig + 6);
+            ASSERT(disp == (int32_t)disp);
+
+            buf[0] = 0x2e;
+            buf[1] = 0xe8;
+            *(int32_t *)(buf + 2) = disp;
+        }
+        else
+        {
+            /*
+             * The function pointer is still NULL.  Seal the whole call, as
+             * it's not used.
+             */
+            buf[0] = 0x0f;
+            buf[1] = 0x0b;
+            buf[2] = 0x0f;
+            buf[3] = 0x0b;
+            buf[4] = 0x0f;
+            buf[5] = 0x0b;
+        }
+
+        text_poke(orig, buf, sizeof(buf));
+    }
+
+    return 0;
+}
+
 #ifdef CONFIG_LIVEPATCH
 int apply_alternatives(struct alt_instr *start, struct alt_instr *end)
 {
@@ -401,6 +487,7 @@ static unsigned int __initdata alt_todo;
 static unsigned int __initdata alt_done;
 
 extern struct alt_instr __alt_instructions[], __alt_instructions_end[];
+extern struct alt_call __alt_call_sites_start[], __alt_call_sites_end[];
 
 /*
  * At boot time, we patch alternatives in NMI context.  This means that the
@@ -435,6 +522,13 @@ static int __init cf_check nmi_apply_alternatives(
         if ( rc )
             panic("Unable to apply alternatives: %d\n", rc);
 
+        if ( alt_todo & ALT_CALLS )
+        {
+            rc = apply_alt_calls(__alt_call_sites_start, __alt_call_sites_end);
+            if ( rc )
+                panic("Unable to apply alternative calls: %d\n", rc);
+        }
+
         /*
          * Reinstate perms on .text to be RX.  This also cleans out the dirty
          * bits, which matters when CET Shstk is active.
diff --git a/xen/arch/x86/include/asm/alternative-call.h b/xen/arch/x86/include/asm/alternative-call.h
index 828ea32a9625..49a04a7cc45b 100644
--- a/xen/arch/x86/include/asm/alternative-call.h
+++ b/xen/arch/x86/include/asm/alternative-call.h
@@ -4,6 +4,13 @@
 
 #include <asm/alternative.h>
 
+/* Simply the relative position of the source call. */
+struct alt_call {
+    int32_t offset;
+};
+#define ALT_CALL_PTR(a) ((void *)&(a)->offset + (a)->offset)
+#define ALT_CALL_LEN(a) (6)
+
 /*
  * Machinery to allow converting indirect to direct calls, when the called
  * function is determined once at boot and later never changed.
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index d4dd6434c466..53bafc98a536 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -260,6 +260,10 @@ SECTIONS
         __alt_instructions = .;
         *(.altinstructions)
         __alt_instructions_end = .;
+        . = ALIGN(4);
+        __alt_call_sites_start = .;
+        *(.alt_call_sites)
+        __alt_call_sites_end = .;
 
        LOCK_PROFILE_DATA
 
-- 
2.39.5


