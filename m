Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E30F2A97BEF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 03:03:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963779.1354736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVo-0001Vt-1l; Wed, 23 Apr 2025 01:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963779.1354736; Wed, 23 Apr 2025 01:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVn-0001U0-Tt; Wed, 23 Apr 2025 01:02:51 +0000
Received: by outflank-mailman (input) for mailman id 963779;
 Wed, 23 Apr 2025 01:02:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7OVm-0000oH-K2
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 01:02:50 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad6af910-1fde-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 03:02:50 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so60202035e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 18:02:50 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2326dsm6707635e9.15.2025.04.22.18.02.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 18:02:48 -0700 (PDT)
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
X-Inumbo-ID: ad6af910-1fde-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745370169; x=1745974969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exMk98fnpxUzFTmE09OArkpIowUpunQwoLTBGbFt2Tg=;
        b=ceyCFnjKtT1PhgwhpZj6iqeRYcOdoBqgcbd7EpAA0KGdKmR4K4nXtXzeiCM6Ia8Hfk
         BfPKljDpKq3BdShTU97s+b+cOU3YIYf3IhPiW+hVj+4Mw9TT+yvvlsoqKrCClLsZFVM5
         sY8otVNTKOk0Oaei7ie1GAj7MYTKpURPQPF3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745370169; x=1745974969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exMk98fnpxUzFTmE09OArkpIowUpunQwoLTBGbFt2Tg=;
        b=m33eOJmY8SNV6GBskPgY6YRRf9Z1HMu+jsaSbsyrYirUkSuJx8YPdZDOiODDa/glsJ
         2WjyAwpdlFnzQHqLq96u7JCYy0LgAmPUtCi/xKGAHey0GYZpkk7QL4+D1t9Zzk53vRHe
         4PsNUL1yh7C/4vLOXfvZp7KXRM+56kzsklBDOSAJxH1sck5HkR7nMkqBbsQ3uKJWYag+
         KWT6X/EliVbGI4Xu1OhwJQOJ+bj3FDwDmfsz09ouzVTqhfY+ZiATPZCfOL2oD0iy7MyJ
         /r0z5qSoxsqmZDAsp8DB5sBtGwre1DVRMW5T1E9p8uPFgS6hidNOzadA6ZurZVkfOW8h
         j6Yw==
X-Gm-Message-State: AOJu0YzI9JTUhrPPJPBRRiyPF7Kn7gd9AojghenHAN7bWMhPQ+AB0PHz
	Xz5ENCJeXK/Z5KdkLszEW0CWRpfSjJkTik/CrxZU8hmKkfqLtWjMxWFEVb7scFmXwfiNo3DeuQN
	7
X-Gm-Gg: ASbGncsn9X40Vle4chA6B2czeLdV4Wcs1FM8bebTVpcGFrSvFFp1I42BvcReo3adckc
	eP7Y8XNxoC3e9v1t5W4w3yaTqRW2qJc8CcLRJVRVd4krievCNmqcpPYOgefy6L/1OWhs0jdLd6G
	ekeTq6mTVZmNc6ZxyHqKAN7Vh/SvTMZlzQt9GSuKmKIipzwBlWWgOp78df9/ghRaj/9lK9LqqZV
	TsTyiNgibDxNK3o6PMWZyjee1HEi5aJK+sKUVyKV5QDd0PTk6K1E/tsypZb10uFkxeh6iRpO99b
	0sILBPP0rcF08zZb3CQbqzGPlUSPzbxuqSDevTsIRAdWaI0kKcpqWG6eej8law==
X-Google-Smtp-Source: AGHT+IH4X0icwZPWLJVXoteY83CJDqNeTRyDblvh+veuV/K4x3dPMcKehsphiBwyufugxNA23Nt/ig==
X-Received: by 2002:a05:600c:3d09:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-4406abfad84mr136167215e9.25.1745370169420;
        Tue, 22 Apr 2025 18:02:49 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 4/8] x86/alternatives: Factor seal_endbr64() out of _apply_alternatives()
Date: Wed, 23 Apr 2025 02:02:33 +0100
Message-Id: <20250423010237.1528582-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are going to need to reposition the call in a change with several moving
parts.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c | 70 ++++++++++++++++++++++----------------
 1 file changed, 40 insertions(+), 30 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 9aa591b364a4..4b9f8d860153 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -162,6 +162,44 @@ text_poke(void *addr, const void *opcode, size_t len)
 extern void *const __initdata_cf_clobber_start[];
 extern void *const __initdata_cf_clobber_end[];
 
+/*
+ * In CET-IBT enabled builds, clobber endbr64 instructions after altcall has
+ * finished optimising all indirect branches to direct ones.
+ */
+static void __init seal_endbr64(void)
+{
+    void *const *val;
+    unsigned int clobbered = 0;
+
+    if ( !cpu_has_xen_ibt )
+        return;
+
+    /*
+     * This is some minor structure (ab)use.  We walk the entire contents
+     * of .init.{ro,}data.cf_clobber as if it were an array of pointers.
+     *
+     * If the pointer points into .text, and at an endbr64 instruction,
+     * nop out the endbr64.  This causes the pointer to no longer be a
+     * legal indirect branch target under CET-IBT.  This is a
+     * defence-in-depth measure, to reduce the options available to an
+     * adversary who has managed to hijack a function pointer.
+     */
+    for ( val = __initdata_cf_clobber_start;
+          val < __initdata_cf_clobber_end;
+          val++ )
+    {
+        void *ptr = *val;
+
+        if ( !is_kernel_text(ptr) || !is_endbr64(ptr) )
+            continue;
+
+        place_endbr64_poison(ptr);
+        clobbered++;
+    }
+
+    printk("altcall: Optimised away %u endbr64 instructions\n", clobbered);
+}
+
 /*
  * Replace instructions with better alternatives for this CPU type.
  * This runs before SMP is initialized to avoid SMP problems with
@@ -344,36 +382,8 @@ static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
      * Clobber endbr64 instructions now that altcall has finished optimising
      * all indirect branches to direct ones.
      */
-    if ( force && cpu_has_xen_ibt && system_state < SYS_STATE_active )
-    {
-        void *const *val;
-        unsigned int clobbered = 0;
-
-        /*
-         * This is some minor structure (ab)use.  We walk the entire contents
-         * of .init.{ro,}data.cf_clobber as if it were an array of pointers.
-         *
-         * If the pointer points into .text, and at an endbr64 instruction,
-         * nop out the endbr64.  This causes the pointer to no longer be a
-         * legal indirect branch target under CET-IBT.  This is a
-         * defence-in-depth measure, to reduce the options available to an
-         * adversary who has managed to hijack a function pointer.
-         */
-        for ( val = __initdata_cf_clobber_start;
-              val < __initdata_cf_clobber_end;
-              val++ )
-        {
-            void *ptr = *val;
-
-            if ( !is_kernel_text(ptr) || !is_endbr64(ptr) )
-                continue;
-
-            place_endbr64_poison(ptr);
-            clobbered++;
-        }
-
-        printk("altcall: Optimised away %u endbr64 instructions\n", clobbered);
-    }
+    if ( force && system_state < SYS_STATE_active )
+        seal_endbr64();
 
     return 0;
 }
-- 
2.39.5


