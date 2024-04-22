Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA348AD3B9
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 20:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710192.1109310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBe-0000g5-QD; Mon, 22 Apr 2024 18:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710192.1109310; Mon, 22 Apr 2024 18:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBe-0000bt-KB; Mon, 22 Apr 2024 18:14:42 +0000
Received: by outflank-mailman (input) for mailman id 710192;
 Mon, 22 Apr 2024 18:14:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/m7Q=L3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ryyBd-0000IX-6N
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 18:14:41 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f64d62a-00d4-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 20:14:40 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a5872b74c44so46930866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 11:14:40 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z15-20020a170906668f00b00a51d073da7esm5994224ejo.82.2024.04.22.11.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 11:14:38 -0700 (PDT)
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
X-Inumbo-ID: 2f64d62a-00d4-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713809679; x=1714414479; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31yUgd5YK+pN4dRkn1LMnihd6GkdbjUm1b+8i5iacEg=;
        b=R8PB8SYRh8z3v+Cn85Jjbb74Z10LovtcXj6ymwCs2nfNJZki8WLNxy/auZMP+8np1g
         3UrKFthyTFQU4JYfs7JkbUYkNsTBzzy5D5aqEAA08QulrinS90Bqd6DckYwBhlL4jigh
         Lsn50J/FNrHi9cBv5RTpwIxvV3ENJ71hnw6ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713809679; x=1714414479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31yUgd5YK+pN4dRkn1LMnihd6GkdbjUm1b+8i5iacEg=;
        b=oM2Zm/nKzwWEWmg9mARcP99h3lv4HWNNCHi+Lpv2rkSFjPysZSzcb+ewU0WosV8jwn
         SuISFefjdc9tvZcGx/wdq26bNpM2Kf8JgMDpM+3Z0HvIAqSZ1Y/vTBrjKguUMZsTC2Ic
         0iwV+POn0begZM5WI25cr7kuYyXCAxblY9syDpjiYuR8yzjxjdS1Ozpwbmr9ReeSEdH1
         aXtukBXWyvvBV/yPaMF724KuQQD1YBsJ7T4XLHf5V/nO+k4qG7EHoAWhnrCOmCiZ8PQ1
         1xMtvJ6b6QVQ+AbcOyz5zbLJeDRzDkbI9uoE6stycf4117DYukwDqXwP0Xpa2Z26VPle
         /IOQ==
X-Gm-Message-State: AOJu0YzZk8fI+mWgpVG6674mu7AFPXHXoiIimJ6kfcmp1FtJlpUvbYVz
	VtA7kzFu3+SZAn6BnPyOxjWO4BBYhUZfXkvQU8N78rGZi5p3Kn3KmhlTJGYbRtHFz+QJW78JYcA
	1Q2E=
X-Google-Smtp-Source: AGHT+IG+1HMvF1SwFEh23Uw5BDoD1AN36ExhwVuxXRvPOWRV9QQwPpCghdo+Q9ydNqUU6Qfd296HkA==
X-Received: by 2002:a17:906:7708:b0:a51:969e:ba0 with SMTP id q8-20020a170906770800b00a51969e0ba0mr6257278ejm.44.1713809679358;
        Mon, 22 Apr 2024 11:14:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/6] x86/alternative: Intend the relocation logic
Date: Mon, 22 Apr 2024 19:14:31 +0100
Message-Id: <20240422181434.3463252-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... to make subsequent patches legible.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 126 +++++++++++++++++++------------------
 1 file changed, 64 insertions(+), 62 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 5bd256365def..2ca4dfd569bc 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -244,78 +244,80 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
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
-            else if ( force && system_state < SYS_STATE_active )
+            else if ( force && system_state < SYS_STATE_active  )
                 ASSERT_UNREACHABLE();
-            else
-                *(int32_t *)(buf + 1) += repl - orig;
         }
-        else if ( force && system_state < SYS_STATE_active  )
-            ASSERT_UNREACHABLE();
 
         a->priv = 1;
 
-- 
2.30.2


