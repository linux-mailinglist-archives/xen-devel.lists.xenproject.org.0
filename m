Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B854198DF11
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 17:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808903.1221014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GR-0000Q5-0T; Wed, 02 Oct 2024 15:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808903.1221014; Wed, 02 Oct 2024 15:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw1GQ-0000Mo-Sx; Wed, 02 Oct 2024 15:27:42 +0000
Received: by outflank-mailman (input) for mailman id 808903;
 Wed, 02 Oct 2024 15:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VgkK=Q6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sw1GP-0007h7-1W
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 15:27:41 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc034904-80d2-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 17:27:39 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so972951566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 08:27:39 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c299ac8esm880024566b.222.2024.10.02.08.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:27:37 -0700 (PDT)
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
X-Inumbo-ID: dc034904-80d2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727882858; x=1728487658; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kg1YWqxiODnPwg0lFMS5tFuPYMahV9xXqAF9qlsMRt8=;
        b=Q+JcH8yGgr2yd5wTyIbo+x6Uqnt8CWHYOQBl5/BmO9/oQxBS8Py9rMn0jRA5OqI96L
         eUhF25obs0iEM8tC63pDo/u2riF1Xs1QOk2zhhVdkvrNRTiLg2YtfVWgnfNgNVk9RIJr
         oYRhOcHXgDrdCHLUvJ1HrPf5/4AUpYn8PQMn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727882858; x=1728487658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kg1YWqxiODnPwg0lFMS5tFuPYMahV9xXqAF9qlsMRt8=;
        b=cBg9aVY8pYeI/YhNOy1zn9+xhSgiMnEAyNGsyklMuxH+4eliCXhKvo3xOhade1aU8/
         aTmWyQ3coqF+JNNjcqM5QOSBOtl405JwwBxR2qFj2mjWDeN6vGGa8D9G92xwi0JWkg9I
         1MnoK2eUWs3aDnc6c/bsjNeqq5UCV9uzB+IpsutaPpMGZnMtYRsstNiY2TFj13zpAPDE
         nKEe0rF+j/4PhvnsSJyOyY0LekVxA/EpqnDrNxEGGk6XNZDFVzrGK/avIQEDR930HNVG
         8DlOsS7GDaVWB8vaoVmr5ZhOUHpDm1p1fNLNjXWd47KXD7/wt0XVFveYhWWh0xK7I3Ig
         ZNaQ==
X-Gm-Message-State: AOJu0YyKxG8EHwoT+x+4R1RY2wg/MVlnvGK99/VAhKMXibeppcJRD6Rm
	dRtoaAfJoc0Fk1MuO2pYXeyfDHSJOMLTHAAR7BO+Gy3P+rSlg2UlDm5YRZOD8bF6A9BnLKsf5tG
	lWgI=
X-Google-Smtp-Source: AGHT+IHTV3eeo5X12pIQK8EIKOA8qaSxG31trYp1WwulYTh2n8MBG0DiWK277bEIyrZ7R7rCYZLcFg==
X-Received: by 2002:a17:907:8690:b0:a8b:6ee7:ba10 with SMTP id a640c23a62f3a-a98f8270815mr332802566b.33.1727882858549;
        Wed, 02 Oct 2024 08:27:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/7] x86/alternative: Indent the relocation logic
Date: Wed,  2 Oct 2024 16:27:22 +0100
Message-Id: <20241002152725.1841575-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
References: <20241002152725.1841575-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... to make subsequent patches legible.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 124 +++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 61 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 2dc759abd858..5ea7f51b007c 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -264,78 +264,80 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
         memcpy(buf, repl, a->repl_len);
 
-        /* 0xe8/0xe9 are relative branches; fix the offset. */
-        if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
         {
-            /*
-             * Detect the special case of indirect-to-direct branch patching:
-             * - replacement is a direct CALL/JMP (opcodes 0xE8/0xE9; already
-             *   checked above),
-             * - replacement's displacement is -5 (pointing back at the very
-             *   insn, which makes no sense in a real replacement insn),
-             * - original is an indirect CALL/JMP (opcodes 0xFF/2 or 0xFF/4)
-             *   using RIP-relative addressing.
-             * Some branch destinations may still be NULL when we come here
-             * the first time. Defer patching of those until the post-presmp-
-             * initcalls re-invocation (with force set to true). If at that
-             * point the branch destination is still NULL, insert "UD2; UD0"
-             * (for ease of recognition) instead of CALL/JMP.
-             */
-            if ( a->cpuid == X86_FEATURE_ALWAYS &&
-                 *(int32_t *)(buf + 1) == -5 &&
-                 a->orig_len >= 6 &&
-                 orig[0] == 0xff &&
-                 orig[1] == (*buf & 1 ? 0x25 : 0x15) )
+            /* 0xe8/0xe9 are relative branches; fix the offset. */
+            if ( a->repl_len >= 5 && (*buf & 0xfe) == 0xe8 )
             {
-                long disp = *(int32_t *)(orig + 2);
-                const uint8_t *dest = *(void **)(orig + 6 + disp);
-
-                if ( dest )
+                /*
+                 * Detect the special case of indirect-to-direct branch patching:
+                 * - replacement is a direct CALL/JMP (opcodes 0xE8/0xE9; already
+                 *   checked above),
+                 * - replacement's displacement is -5 (pointing back at the very
+                 *   insn, which makes no sense in a real replacement insn),
+                 * - original is an indirect CALL/JMP (opcodes 0xFF/2 or 0xFF/4)
+                 *   using RIP-relative addressing.
+                 * Some branch destinations may still be NULL when we come here
+                 * the first time. Defer patching of those until the post-presmp-
+                 * initcalls re-invocation (with force set to true). If at that
+                 * point the branch destination is still NULL, insert "UD2; UD0"
+                 * (for ease of recognition) instead of CALL/JMP.
+                 */
+                if ( a->cpuid == X86_FEATURE_ALWAYS &&
+                     *(int32_t *)(buf + 1) == -5 &&
+                     a->orig_len >= 6 &&
+                     orig[0] == 0xff &&
+                     orig[1] == (*buf & 1 ? 0x25 : 0x15) )
                 {
-                    /*
-                     * When building for CET-IBT, all function pointer targets
-                     * should have an endbr64 instruction.
-                     *
-                     * If this is not the case, leave a warning because
-                     * something is probably wrong with the build.  A CET-IBT
-                     * enabled system might have exploded already.
-                     *
-                     * Otherwise, skip the endbr64 instruction.  This is a
-                     * marginal perf improvement which saves on instruction
-                     * decode bandwidth.
-                     */
-                    if ( IS_ENABLED(CONFIG_XEN_IBT) )
+                    long disp = *(int32_t *)(orig + 2);
+                    const uint8_t *dest = *(void **)(orig + 6 + disp);
+
+                    if ( dest )
                     {
-                        if ( is_endbr64(dest) )
-                            dest += ENDBR64_LEN;
-                        else
-                            printk(XENLOG_WARNING
-                                   "altcall %ps dest %ps has no endbr64\n",
-                                   orig, dest);
+                        /*
+                         * When building for CET-IBT, all function pointer targets
+                         * should have an endbr64 instruction.
+                         *
+                         * If this is not the case, leave a warning because
+                         * something is probably wrong with the build.  A CET-IBT
+                         * enabled system might have exploded already.
+                         *
+                         * Otherwise, skip the endbr64 instruction.  This is a
+                         * marginal perf improvement which saves on instruction
+                         * decode bandwidth.
+                         */
+                        if ( IS_ENABLED(CONFIG_XEN_IBT) )
+                        {
+                            if ( is_endbr64(dest) )
+                                dest += ENDBR64_LEN;
+                            else
+                                printk(XENLOG_WARNING
+                                       "altcall %ps dest %ps has no endbr64\n",
+                                       orig, dest);
+                        }
+
+                        disp = dest - (orig + 5);
+                        ASSERT(disp == (int32_t)disp);
+                        *(int32_t *)(buf + 1) = disp;
                     }
-
-                    disp = dest - (orig + 5);
-                    ASSERT(disp == (int32_t)disp);
-                    *(int32_t *)(buf + 1) = disp;
-                }
-                else if ( force )
-                {
-                    buf[0] = 0x0f;
-                    buf[1] = 0x0b;
-                    buf[2] = 0x0f;
-                    buf[3] = 0xff;
-                    buf[4] = 0xff;
+                    else if ( force )
+                    {
+                        buf[0] = 0x0f;
+                        buf[1] = 0x0b;
+                        buf[2] = 0x0f;
+                        buf[3] = 0xff;
+                        buf[4] = 0xff;
+                    }
+                    else
+                        continue;
                 }
+                else if ( force && system_state < SYS_STATE_active )
+                    ASSERT_UNREACHABLE();
                 else
-                    continue;
+                    *(int32_t *)(buf + 1) += repl - orig;
             }
             else if ( force && system_state < SYS_STATE_active )
                 ASSERT_UNREACHABLE();
-            else
-                *(int32_t *)(buf + 1) += repl - orig;
         }
-        else if ( force && system_state < SYS_STATE_active  )
-            ASSERT_UNREACHABLE();
 
         a->priv = 1;
 
-- 
2.39.5


