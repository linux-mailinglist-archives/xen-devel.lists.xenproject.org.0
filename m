Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6698AD3B7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 20:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710191.1109304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBe-0000bv-HP; Mon, 22 Apr 2024 18:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710191.1109304; Mon, 22 Apr 2024 18:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryyBe-0000aE-Bw; Mon, 22 Apr 2024 18:14:42 +0000
Received: by outflank-mailman (input) for mailman id 710191;
 Mon, 22 Apr 2024 18:14:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/m7Q=L3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ryyBc-0000IX-66
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 18:14:40 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2edcb1ec-00d4-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 20:14:39 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34b1e35155aso1321394f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 11:14:39 -0700 (PDT)
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
X-Inumbo-ID: 2edcb1ec-00d4-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1713809678; x=1714414478; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQHzbKjDaYMcDY7B8SUQVz+z/Tfqym852xnTGj/zaZg=;
        b=fkoAkh4o4FnDA99uQNTZb7WraJWXKC2aG6unhYS0rrZIufQCDn5N70MWM/DTyZSA5z
         NeAjzvm/PJimblHVJgb4bHXzM9Rr0w7UkGOTJJ+nuzOZmXh9lx9GQJw22NhP/Tj8+/5R
         ONR1uM/azVB0mFU3xpualaMwOxWW1MqD8zjLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713809678; x=1714414478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQHzbKjDaYMcDY7B8SUQVz+z/Tfqym852xnTGj/zaZg=;
        b=Z7KNvKuGyja0RlV16mPa1yOseYZr+SWfrDlIsD7bMyGklWTHPTswUlpk60ISuWE/vP
         dc6QSsNuoPQANdB/hkBgM2FPllFzgn/iebrIsBhUzxbZQxBySnuJdu4AgoZDcGQqRIRQ
         wwni3mbGpvxsTfsAZxYhWLO2I8FnlyxRVcZgS8DftwgzDcgfCVGywSAhYZc0tCUXvTW6
         TzsoOdz2cmRbtRxA38NEkKe4bW6EofTpZ2tXGJHDQ65YZnfFRg8cywtAJkZG367sjW2F
         4oMZ7mch5BHDJNvmkGaZiVm+ccdGx3XhC5zxiXoB3fMM5PsQmBTUg7ezuShTlyJshJdr
         7Cag==
X-Gm-Message-State: AOJu0YxiIHH3elVtiVQoD3vnH7iU0qSBo0jS+i1B6QYMJG+U4DX56ZRW
	Xg4d6SnOQJbQzmOLIVog4+Q0/c3PKIiHtfyPN3AhK2azt8gN/eYHk4/Ow4bQnC+7rDkD1LKPwpp
	HXPE=
X-Google-Smtp-Source: AGHT+IEW6kofzVvscdUp6IMKGrRkIje/J7JBh/Nc5qR/k31CnySuyyiwls0zSTGzIDDorCf57TnjJQ==
X-Received: by 2002:a5d:4a81:0:b0:341:cd0d:b78a with SMTP id o1-20020a5d4a81000000b00341cd0db78amr8767835wrq.48.1713809678533;
        Mon, 22 Apr 2024 11:14:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/6] x86/alternative: Walk all replacements in debug builds
Date: Mon, 22 Apr 2024 19:14:30 +0100
Message-Id: <20240422181434.3463252-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
References: <20240422181434.3463252-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In debug builds, walk all alternative replacements with x86_decode_lite().

This checks that we can decode all instructions, and also lets us check that
disp8's don't leave the replacement block.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 49 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 2e7ba6e0b833..5bd256365def 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -15,6 +15,7 @@
 #include <asm/traps.h>
 #include <asm/nmi.h>
 #include <asm/nops.h>
+#include <asm/x86_emulate.h>
 #include <xen/livepatch.h>
 
 #define MAX_PATCH_LEN (255-1)
@@ -464,6 +465,54 @@ static void __init _alternative_instructions(bool force)
 void __init alternative_instructions(void)
 {
     arch_init_ideal_nops();
+
+    /*
+     * Walk all replacement instructions with x86_decode_lite().  This checks
+     * both that we can decode all instructions within the replacement, and
+     * that any near branch with a disp8 stays within the alternative itself.
+     */
+    if ( IS_ENABLED(CONFIG_DEBUG) )
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
+                res = x86_decode_lite(ip, end);
+
+                if ( res.len <= 0 )
+                {
+                    printk("Alternative for %ps [%*ph]\n",
+                           ALT_ORIG_PTR(a), a->repl_len, repl);
+                    panic("Unable to decode instruction at +%u in alternative\n",
+                          (unsigned int)(unsigned long)(ip - repl));
+                }
+
+                if ( res.rel_type == REL_TYPE_d8 )
+                {
+                    int8_t *d8 = res.rel;
+                    void *target = ip + res.len + *d8;
+
+                    if ( target < repl || target > end )
+                    {
+                        printk("Alternative for %ps [%*ph]\n",
+                               ALT_ORIG_PTR(a), a->repl_len, repl);
+                        panic("'JMP/Jcc disp8' at +%u leaves alternative block\n",
+                              (unsigned int)(unsigned long)(ip - repl));
+                    }
+                }
+            }
+        }
+    }
+
     _alternative_instructions(false);
 }
 
-- 
2.30.2


