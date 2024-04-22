Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA298AD3B5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 20:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710195.1109344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBh-0001ce-Ob; Mon, 22 Apr 2024 18:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710195.1109344; Mon, 22 Apr 2024 18:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBh-0001Zz-Ku; Mon, 22 Apr 2024 18:14:45 +0000
Received: by outflank-mailman (input) for mailman id 710195;
 Mon, 22 Apr 2024 18:14:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/m7Q=L3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ryyBf-0000Oz-If
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 18:14:43 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30822915-00d4-11ef-b4bb-af5377834399;
 Mon, 22 Apr 2024 20:14:42 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a5872b74c44so46933066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 11:14:42 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170906668f00b00a51d073da7esm5994224ejo.82.2024.04.22.11.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 11:14:40 -0700 (PDT)
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
X-Inumbo-ID: 30822915-00d4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713809681; x=1714414481; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnv/4DDYEmGIANJ07M3XY3Ct96pjBr7ZvuszXz6nRKc=;
        b=QzpJtI54AXreZkGZCRZZWsDlIs9qxLUDDh/+69vjiW9tEa6Gan13OcnMTcnl2GBhLJ
         CtUdJNSCtiiW0pMXxkR7GhaMosMBBj4oilGVCrFvaZ/CX6M7pIDI8vEP3hAp6cO/+/FA
         ltgIqXVkf0Ybz8/1fTA2dUqFp01Q2YIFJG/Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713809681; x=1714414481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qnv/4DDYEmGIANJ07M3XY3Ct96pjBr7ZvuszXz6nRKc=;
        b=UV3y7Ab06TOJMUZW5M3QB05GIvIt7ukm4F1PAk0/e9gwG67NAS9At8CLF3IWgXI14N
         13AczqnawMxz4DE6a6A2KcryJA5/NpvClssuHw2shom85xsZha+wG/Bu76/tdYPPSn6Z
         YxtIi/dmr5Ggyyxs5QB4OvRFjp4iFtnB9CLLSDSzS77hjFZ+2H3jEUMLw7scFewgiY5R
         /MEe/ZxOPmfvoKH4zJWDVw4rRQZ7tp1uiKeQrwrt12gmiP25qrZ4CRo1FKgyovY1o/WC
         XWWWXLufWzLA9WAXbUXggq7fuoM52YAZ2d5mdALLxpKx/LZnKV0J5XDDoIsofjmUy7zM
         ZNWA==
X-Gm-Message-State: AOJu0Yw6J/krc7Kv9OPWmHiLH+GkI1w45lajDjaF6NBWzl2CTcB9m0Vl
	0pRTxk1nZ38hkoUqKUO2PVBt1QstdJHktHFBnXSkUf5zFMB60o5n+s6/zMeWkEHyryRNjQBdLy4
	jXds=
X-Google-Smtp-Source: AGHT+IENu/P+oqdgoIPmfD0QCWOFEWg+4TnWMcAxsx2C9L/ECrh0opFdNPWnQ9cnJbJNMSXQoIR0AQ==
X-Received: by 2002:a17:906:a0b:b0:a52:33b0:fcb1 with SMTP id w11-20020a1709060a0b00b00a5233b0fcb1mr6665155ejf.32.1713809681291;
        Mon, 22 Apr 2024 11:14:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/6] x86/alternative: Relocate all insn-relative fields
Date: Mon, 22 Apr 2024 19:14:33 +0100
Message-Id: <20240422181434.3463252-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, relocation of displacements is restricted to finding 0xe8/e9 as the
first byte of the replacement, but this is overly restrictive.

Use x86_decode_lite() to find and adjust all insn-relative fields.

As with disp8's not leaving the replacemnet block, some disp32's don't either.
e.g. the RSB stuffing loop.  These stay unmodified.

For now, leave the altcall devirtualisation alone.  These require more care to
transform into the new scheme.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 46 +++++++++++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index c86ea235e865..4d7dc9418cf0 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -244,10 +244,31 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
         memcpy(buf, repl, a->repl_len);
 
+        /* Walk buf[] and adjust any insn-relative operands. */
+        if ( a->repl_len )
         {
-            /* 0xe8/0xe9 are relative branches; fix the offset. */
-            if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
+            uint8_t *ip = buf, *end = ip + a->repl_len;
+
+            for ( x86_decode_lite_t res; ip < end; ip += res.len )
             {
+                int32_t *d32;
+                uint8_t *target;
+
+                res = x86_decode_lite(ip, end);
+
+                if ( res.len <= 0 )
+                {
+                    printk("Alternative for %ps [%*ph]\n",
+                           ALT_ORIG_PTR(a), a->repl_len, repl);
+                    printk("Unable to decode instruction in alternative - ignoring.\n");
+                    goto skip_this_alternative;
+                }
+
+                if ( res.rel_type != REL_TYPE_d32 )
+                    continue;
+
+                d32 = res.rel;
+
                 /*
                  * Detect the special case of indirect-to-direct branch patching:
                  * - replacement is a direct CALL/JMP (opcodes 0xE8/0xE9; already
@@ -317,14 +338,23 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
                          */
                         goto skip_this_alternative;
                     }
+
+                    continue;
                 }
-                else if ( force && system_state < SYS_STATE_active )
-                    ASSERT_UNREACHABLE();
-                else
-                    *(int32_t *)(buf + 1) += repl - orig;
+
+                target = ip + res.len + *d32;
+
+                if ( target >= buf && target <= end )
+                {
+                    /*
+                     * Target doesn't leave the replacement block.  e.g. RSB
+                     * stuffing.  Leave it unmodified.
+                     */
+                    continue;
+                }
+
+                *d32 += repl - orig;
             }
-            else if ( force && system_state < SYS_STATE_active  )
-                ASSERT_UNREACHABLE();
         }
 
         a->priv = 1;
-- 
2.30.2


