Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2D598DF13
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:27:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808905.1221035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GU-00018y-Pc; Wed, 02 Oct 2024 15:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808905.1221035; Wed, 02 Oct 2024 15:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GU-00014a-Gq; Wed, 02 Oct 2024 15:27:46 +0000
Received: by outflank-mailman (input) for mailman id 808905;
 Wed, 02 Oct 2024 15:27:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw1GS-0007h7-2V
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:27:44 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddca10f1-80d2-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 17:27:42 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so232419666b.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:27:42 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299ac8esm880024566b.222.2024.10.02.08.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:27:40 -0700 (PDT)
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
X-Inumbo-ID: ddca10f1-80d2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727882861; x=1728487661; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKsfnfRQgiEGAkaEc12PpOtnWnQ5PN0UH+J+RGQf2wM=;
        b=p39tyRywlNP6KMhvZaoy8017ChgOGyzamCzTw7owvE7vfz1AU872Ibo4WW3NY3W5K8
         lWDK3yBwt5EU21pgZHdWcjiftI7Z1I2GhfVr7DeOyZRnc6yhkLwr9R/a66J2Un1yHq0J
         o3r5elTtpLZP7E0EoZITdQQhH2p2MEMrAQ1r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882861; x=1728487661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKsfnfRQgiEGAkaEc12PpOtnWnQ5PN0UH+J+RGQf2wM=;
        b=m/ljHGeKeWTJaJ2ZX3l03glw6plOCn+2i1+pPdELW/fS5VJ4jAYYnVxxNOg7UDRcze
         PB7kvLtE5xcqK2eHoafnZVN6MDnv66rrmlGl99CiUrx/C+RRuOevdnhu/GIFattr1Nfh
         9MntphfLc4s8KUxRCclTai5XoHiYHMipOV9RtjaIUQz7mxAjo2s6MLlLoSEaWCueXfUh
         FlDebufl6NDrAxScoSIyoozBKZ0bWCwTOx6qfRR0KmzBL7NONHJ6BkDwaDi18d1fjz23
         gi2zSNf5FSAFrefLNTPpjHj797EnwPmNvsmJOQMiH+6jr73ihy0k7MLUN/W7fMqNkhQv
         df6Q==
X-Gm-Message-State: AOJu0Yw0fRVAnL9U7UEHLYWnThbsLG1SKpKZEo3dYi0txXJLzBfSruRK
	0CH60hazesz7YJz84O7mkQvjv35S+zb4RJOZ2tt8IJRAdQcDxftqt+KUXaWE8ZZzqxYAMn2xseh
	KS6E=
X-Google-Smtp-Source: AGHT+IH8hwKmXlccN1whSvfTN4yPqkVDyedjNvhrBux41Exg2tJba+6aRWj33Y7UXrUf1gJuuf5KpA==
X-Received: by 2002:a17:906:794c:b0:a90:b6e8:6919 with SMTP id a640c23a62f3a-a98f83615e1mr357768666b.48.1727882861402;
        Wed, 02 Oct 2024 08:27:41 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 6/7] x86/alternative: Relocate all insn-relative fields
Date: Wed,  2 Oct 2024 16:27:24 +0100
Message-Id: <20241002152725.1841575-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
References: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
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
index b745f112154a..da1a4af56377 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -264,10 +264,31 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
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
+                const uint8_t *target;
+
+                res = x86_decode_lite(ip, end);
+
+                if ( res.len == 0 )
+                {
+                    printk("Alt for %ps [%*ph]\n"
+                           "  Unable to decode instruction at +%lu in alternative\n",
+                           ALT_ORIG_PTR(a), a->repl_len, repl, ip - repl);
+                    return -EINVAL;
+                }
+
+                if ( res.rel_sz != 4 )
+                    continue;
+
+                d32 = res.rel;
+
                 /*
                  * Detect the special case of indirect-to-direct branch patching:
                  * - replacement is a direct CALL/JMP (opcodes 0xE8/0xE9; already
@@ -337,14 +358,23 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
                          */
                         goto skip_this_alternative;
                     }
+
+                    continue;
+                }
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
                 }
-                else if ( force && system_state < SYS_STATE_active )
-                    ASSERT_UNREACHABLE();
-                else
-                    *(int32_t *)(buf + 1) += repl - orig;
+
+                *d32 += repl - orig;
             }
-            else if ( force && system_state < SYS_STATE_active )
-                ASSERT_UNREACHABLE();
         }
 
         a->priv = 1;
-- 
2.39.5


