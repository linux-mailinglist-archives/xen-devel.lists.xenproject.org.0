Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0469C633F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 22:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834939.1250759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAyIL-0002gY-DO; Tue, 12 Nov 2024 21:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834939.1250759; Tue, 12 Nov 2024 21:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAyIL-0002aE-9f; Tue, 12 Nov 2024 21:19:29 +0000
Received: by outflank-mailman (input) for mailman id 834939;
 Tue, 12 Nov 2024 21:19:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qpNK=SH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tAyIJ-0002GE-OU
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 21:19:27 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c90b5a56-a13b-11ef-99a3-01e77a169b0f;
 Tue, 12 Nov 2024 22:19:22 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a99f646ff1bso922054666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 13:19:22 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0defaefsm762049066b.164.2024.11.12.13.19.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 13:19:19 -0800 (PST)
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
X-Inumbo-ID: c90b5a56-a13b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmMiLCJoZWxvIjoibWFpbC1lajEteDYyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM5MGI1YTU2LWExM2ItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDQ2MzYyLjE1MzI3Miwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731446361; x=1732051161; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXeqEdvAbZY1hWBgh5PB6EHEOkfnXP4Z7DiK6RDTCRc=;
        b=Y6eo8II4Sft87xefMFJ5TAX4WO5E7olFZJqfqbEh9+EhcIGtX9UJdH6nPGTuyKJ4jS
         n+Emac6sgclu57N2Bz/TMrg44yfbyn+cfTcpbpyBLS4vFSX011hXASBG4xwJQKndFnKP
         CELceyCN3WoyuJspyOjnaf1UnX0ZcHGnjgUxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731446361; x=1732051161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXeqEdvAbZY1hWBgh5PB6EHEOkfnXP4Z7DiK6RDTCRc=;
        b=aD2Zlm6SaN1oNHvZopxa+X19UkR6mfOZdKMoFHnQl4Ze566pLjhqxTeT82nhj8AoJ5
         PYw6bWlD1kBHre1e+RatGJa3bam0Yg3i9IKcTNUET6ZmhzOkEwi//JPHc/ONvdKVAkOv
         pefygGdB7LYuVO8HTQlGoolD/BAcPksFcjXfs0XERtFEvuaHTvoqYTDElNSVbu3hYth7
         ywD8BWQtuNE3dRLsMfPHxyWWIpPVSVZwSfdrXDU/TCb2/fwCq6Bn+tOMwDKglWO/gY5c
         hHuZQhxPLpKxFjRR26/XJ6/w20tOFcWFlhq3YDbu6wgjnXRhs+ahSU3zI7O+x2ERG+wJ
         Udgw==
X-Gm-Message-State: AOJu0Yx7I9qt/Uzp2alfkog29x24aohe8RVRtcnfiBKPPwDtSxfTh6MU
	owCt/+QapeSyimFeI2+/8Qynth5UIpMT21MwOaEbPn3T7QBqz8F3VjtE2DQH3A8TnOJUCTqy0Pz
	l
X-Google-Smtp-Source: AGHT+IFjrmJwiNSREOn7qFXBleK0HcSvHQ14DMXgAqdWjXwH2NYh+4Itd++JTpf1sV0e8HYJTjMHjw==
X-Received: by 2002:a17:907:1b0e:b0:a9a:1792:f05 with SMTP id a640c23a62f3a-aa1b10a45a5mr450483466b.31.1731446361142;
        Tue, 12 Nov 2024 13:19:21 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/3] x86/ucode: Fix cache handling in microcode_update_helper()
Date: Tue, 12 Nov 2024 21:19:14 +0000
Message-Id: <20241112211915.1473121-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
References: <20241112211915.1473121-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

microcode_update_cache() now has a single caller, but inlining it shows how
unnecessarily complicated the logic really is.

Outside of error paths, there is always one microcode patch to free.  Its
either result of parse_blob(), or it's the old cached value.

In order to fix this, have a local patch pointer (mostly to avoid the
unnecessary verbosity of patch_with_flags.patch), and always free it at the
end.  The only error path needing care is the IS_ERR(patch) path, which is
easy enough to handle.

Also, widen the scope of result.  We only need to call compare_patch() once,
and the answer is still good later when updating the cache.  In order to
update the cache, simply SWAP() the patch and the cache pointers, allowing the
singular xfree() at the end to cover both cases.

This also removes all callers microcode_free_patch() which fixes the need to
cast away const to allow it to compile.  This also removed several violations
of MISRA Rule 11.8 which disallows casting away const.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/cpu/microcode/core.c | 66 +++++++++++--------------------
 1 file changed, 24 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 5897ec54032a..0cc5daa251e2 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -86,7 +86,7 @@ struct patch_with_flags {
 static bool ucode_in_nmi = true;
 
 /* Protected by microcode_mutex */
-static const struct microcode_patch *microcode_cache;
+static struct microcode_patch *microcode_cache;
 
 /*
  * opt_mod_idx and opt_scan have subtle semantics.
@@ -192,33 +192,6 @@ static struct microcode_patch *parse_blob(const char *buf, size_t len)
     return alternative_call(ucode_ops.cpu_request_microcode, buf, len, true);
 }
 
-static void microcode_free_patch(const struct microcode_patch *patch)
-{
-    xfree((struct microcode_patch *)patch);
-}
-
-/* Return true if cache gets updated. Otherwise, return false */
-static bool microcode_update_cache(const struct microcode_patch *patch)
-{
-    ASSERT(spin_is_locked(&microcode_mutex));
-
-    if ( !microcode_cache )
-        microcode_cache = patch;
-    else if ( alternative_call(ucode_ops.compare_patch,
-                               patch, microcode_cache) == NEW_UCODE )
-    {
-        microcode_free_patch(microcode_cache);
-        microcode_cache = patch;
-    }
-    else
-    {
-        microcode_free_patch(patch);
-        return false;
-    }
-
-    return true;
-}
-
 /* Returns true if ucode should be loaded on a given cpu */
 static bool is_cpu_primary(unsigned int cpu)
 {
@@ -496,6 +469,8 @@ struct ucode_buf {
 
 static long cf_check microcode_update_helper(void *data)
 {
+    struct microcode_patch *patch = NULL;
+    enum microcode_match_result result;
     int ret;
     struct ucode_buf *buffer = data;
     unsigned int cpu, updated;
@@ -524,17 +499,20 @@ static long cf_check microcode_update_helper(void *data)
         goto put;
     }
 
-    patch_with_flags.patch = parse_blob(buffer->buffer, buffer->len);
+    patch = parse_blob(buffer->buffer, buffer->len);
     patch_with_flags.flags = buffer->flags;
+
     xfree(buffer);
-    if ( IS_ERR(patch_with_flags.patch) )
+
+    if ( IS_ERR(patch) )
     {
-        ret = PTR_ERR(patch_with_flags.patch);
+        ret = PTR_ERR(patch);
+        patch = NULL;
         printk(XENLOG_WARNING "Parsing microcode blob error %d\n", ret);
         goto put;
     }
 
-    if ( !patch_with_flags.patch )
+    if ( !patch )
     {
         printk(XENLOG_WARNING "microcode: couldn't find any matching ucode in "
                               "the provided blob!\n");
@@ -549,10 +527,7 @@ static long cf_check microcode_update_helper(void *data)
     spin_lock(&microcode_mutex);
     if ( microcode_cache )
     {
-        enum microcode_match_result result;
-
-        result = alternative_call(ucode_ops.compare_patch,
-                                  patch_with_flags.patch, microcode_cache);
+        result = alternative_call(ucode_ops.compare_patch, patch, microcode_cache);
 
         if ( result != NEW_UCODE &&
              !(ucode_force && (result == OLD_UCODE || result == SAME_UCODE)) )
@@ -561,12 +536,13 @@ static long cf_check microcode_update_helper(void *data)
             printk(XENLOG_WARNING
                    "microcode: couldn't find any newer%s revision in the provided blob!\n",
                    ucode_force ? " (or a valid)" : "");
-            microcode_free_patch(patch_with_flags.patch);
             ret = -EEXIST;
 
             goto put;
         }
     }
+    else
+        result = NEW_UCODE;
     spin_unlock(&microcode_mutex);
 
     cpumask_clear(&cpu_callin_map);
@@ -593,14 +569,18 @@ static long cf_check microcode_update_helper(void *data)
      *   this requirement can be relaxed in the future. Right now, this is
      *   conservative and good.
      */
+    patch_with_flags.patch = patch;
     ret = stop_machine_run(do_microcode_update, &patch_with_flags, NR_CPUS);
 
     updated = atomic_read(&cpu_updated);
     if ( updated > 0 )
     {
-        spin_lock(&microcode_mutex);
-        microcode_update_cache(patch_with_flags.patch);
-        spin_unlock(&microcode_mutex);
+        if ( result == NEW_UCODE )
+        {
+            spin_lock(&microcode_mutex);
+            SWAP(patch, microcode_cache);
+            spin_unlock(&microcode_mutex);
+        }
 
         /*
          * Refresh the raw CPU policy, in case the features have changed.
@@ -615,8 +595,6 @@ static long cf_check microcode_update_helper(void *data)
         if ( ctxt_switch_masking )
             alternative_vcall(ctxt_switch_masking, current);
     }
-    else
-        microcode_free_patch(patch_with_flags.patch);
 
     if ( updated && updated != nr_cores )
         printk(XENLOG_ERR "ERROR: Updating microcode succeeded on %u cores and failed\n"
@@ -627,6 +605,10 @@ static long cf_check microcode_update_helper(void *data)
 
  put:
     put_cpu_maps();
+
+    /* The parsed blob or old cached value, whichever we're not keeping. */
+    xfree(patch);
+
     return ret;
 }
 
-- 
2.39.5


