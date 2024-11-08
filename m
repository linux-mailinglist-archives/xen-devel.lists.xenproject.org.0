Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83429C1F87
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 15:43:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832618.1247912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QCX-0004UR-8m; Fri, 08 Nov 2024 14:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832618.1247912; Fri, 08 Nov 2024 14:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QCX-0004TM-2s; Fri, 08 Nov 2024 14:43:05 +0000
Received: by outflank-mailman (input) for mailman id 832618;
 Fri, 08 Nov 2024 14:43:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9QCU-0004Ee-VT
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 14:43:02 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfafcbe4-9ddf-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 15:42:59 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c9c28c1ecbso2798355a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 06:42:59 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a1769asm242652866b.1.2024.11.08.06.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 06:42:56 -0800 (PST)
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
X-Inumbo-ID: bfafcbe4-9ddf-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzQiLCJoZWxvIjoibWFpbC1lZDEteDUzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJmYWZjYmU0LTlkZGYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDc2OTc5LjM1ODY2OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731076978; x=1731681778; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rvx6e7hDDh9yfZyKvdLwUiSvDhDIqKekI/oIecuoc9s=;
        b=l205x1p77vc/Cxpr+wZpBJLew2Hk2dTK2fwRinlrn+PcXuQ8fwT378DAH0YQEcn2Mo
         J5MkqZBfk2f4ApOWtYIBJ9wQKcmSqO3cuFjookg+5590Q0KtTQsDR88QYYfZlbGFGV+n
         dFd5Zmv8ENwLAGZ72L3KW2yVBlMKuMkxWseL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731076978; x=1731681778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rvx6e7hDDh9yfZyKvdLwUiSvDhDIqKekI/oIecuoc9s=;
        b=FdGDcoqVttsOsZjKmDSiXscswDd4uj+9tPbXCiXqDRUNi181mHEbus82NtNNKZLSS4
         7SsmQ9yqtY+gIgqY5e0T5Z/yqL29Etoeb8/Xmk/yqE39UnkhOBqCiPO2yCJ8LJzRqivJ
         5HTOqS0OaPOL4GNhNGpDRkGXHVoD9YLF3fzKsdJyzDB+iz6wjKiIqXNF6/KSp0LDkMve
         6v0he7HNoSDw14LSZ4vqKVc6e5Ll9v8nz5uF1Ca1D9r9N4HzrPMj+evPKr2WG/kvq2tt
         mWqEl1oKMvQTHhAb8zPq04DhJu/zA7xiSGjZbake+Wc9z/nnjoqxFqgSglDfPdTthRQB
         oUew==
X-Gm-Message-State: AOJu0YxfNJGr5XHSknFQis4rfNsh2abwSpTdPx9REp6YdsfeLmXlPk77
	ioyDw9wteySV7xUso1xl7uKocE3eGtkanXQZrd7jcHt1Ca+OrZCl4bUL1Qg/Tk1sC9GopitZHli
	v
X-Google-Smtp-Source: AGHT+IHh0V7LDjgbTI/cZZA70SUOsc2LiajlysWqvUWIbghIxkfUHTGMhcMvw2D8NLjByq4xxdb2IA==
X-Received: by 2002:a17:907:7f1f:b0:a99:f4be:7a6a with SMTP id a640c23a62f3a-a9eeffdc630mr299757066b.47.1731076977862;
        Fri, 08 Nov 2024 06:42:57 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/ucode: Rework AMD's microcode_fits()
Date: Fri,  8 Nov 2024 14:42:51 +0000
Message-Id: <20241108144252.315604-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108144252.315604-1-andrew.cooper3@citrix.com>
References: <20241108144252.315604-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This function is overloaded, creating complexity; 3 of 4 callers already only
want it for it's "applicable to this CPU or not" answer, and handle revision
calculations separately.

Change it to be microcode_fits_cpu(), returning a simple boolean.  The
checking of the equiv table can be simplified substantially too; A mapping
will only be inserted if it's correct for the CPU, so any nonzero equiv.sig
suffices to know that equiv.id is correct.

Drop compare_header() too, which is simiarly overloaded, and use
compare_revisions() directly.

Notably, this removes a path where cpu_request_microcode() inspects
currently-loaded microcode revision, just to discard the answer.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c | 49 ++++++++++++++++----------------
 1 file changed, 24 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index c7a779c1d885..3861fec6565a 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -182,36 +182,31 @@ static enum microcode_match_result compare_revisions(
     return OLD_UCODE;
 }
 
-static enum microcode_match_result microcode_fits(
-    const struct microcode_patch *patch)
-{
-    unsigned int cpu = smp_processor_id();
-    const struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
-
-    if ( equiv.sig != sig->sig ||
-         equiv.id  != patch->processor_rev_id )
-        return MIS_UCODE;
-
-    return compare_revisions(sig->rev, patch->patch_id);
-}
-
-static enum microcode_match_result compare_header(
-    const struct microcode_patch *new, const struct microcode_patch *old)
+/*
+ * Check whether this microcode patch is applicable for the current CPU.
+ *
+ * AMD microcode blobs only have the "equivalent CPU identifier" which is a 16
+ * bit contraction of the 32 bit Family/Model/Stepping.
+ *
+ * We expect to only be run after scan_equiv_cpu_table() has found a valid
+ * mapping for the current CPU.  If this is violated, the 0 in equiv.id will
+ * cause the patch to be rejected too.
+ */
+static bool microcode_fits_cpu(const struct microcode_patch *patch)
 {
-    if ( new->processor_rev_id != old->processor_rev_id )
-        return MIS_UCODE;
+    ASSERT(equiv.sig);
 
-    return compare_revisions(old->patch_id, new->patch_id);
+    return equiv.id == patch->processor_rev_id;
 }
 
 static enum microcode_match_result cf_check compare_patch(
     const struct microcode_patch *new, const struct microcode_patch *old)
 {
     /* Both patches to compare are supposed to be applicable to local CPU. */
-    ASSERT(microcode_fits(new) != MIS_UCODE);
-    ASSERT(microcode_fits(old) != MIS_UCODE);
+    ASSERT(microcode_fits_cpu(new));
+    ASSERT(microcode_fits_cpu(old));
 
-    return compare_header(new, old);
+    return compare_revisions(old->patch_id, new->patch_id);
 }
 
 static int cf_check apply_microcode(const struct microcode_patch *patch,
@@ -221,12 +216,14 @@ static int cf_check apply_microcode(const struct microcode_patch *patch,
     unsigned int cpu = smp_processor_id();
     struct cpu_signature *sig = &per_cpu(cpu_sig, cpu);
     uint32_t rev, old_rev = sig->rev;
-    enum microcode_match_result result = microcode_fits(patch);
+    enum microcode_match_result result;
     bool ucode_force = flags & XENPF_UCODE_FORCE;
 
-    if ( result == MIS_UCODE )
+    if ( !microcode_fits_cpu(patch) )
         return -EINVAL;
 
+    result = compare_revisions(old_rev, patch->patch_id);
+
     /*
      * Allow application of the same revision to pick up SMT-specific changes
      * even if the revision of the other SMT thread is already up-to-date.
@@ -396,8 +393,10 @@ static struct microcode_patch *cf_check cpu_request_microcode(
              * If the new ucode covers current CPU, compare ucodes and store the
              * one with higher revision.
              */
-            if ( (microcode_fits(mc->patch) != MIS_UCODE) &&
-                 (!saved || (compare_header(mc->patch, saved) == NEW_UCODE)) )
+            if ( microcode_fits_cpu(mc->patch) &&
+                 (!saved ||
+                  compare_revisions(saved->patch_id,
+                                    mc->patch->patch_id) == NEW_UCODE) )
             {
                 saved = mc->patch;
                 saved_size = mc->len;
-- 
2.39.5


