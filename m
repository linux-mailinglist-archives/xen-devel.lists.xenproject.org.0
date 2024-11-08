Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9069C1F85
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 15:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832619.1247916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QCX-0004ZC-E2; Fri, 08 Nov 2024 14:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832619.1247916; Fri, 08 Nov 2024 14:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9QCX-0004UL-Ay; Fri, 08 Nov 2024 14:43:05 +0000
Received: by outflank-mailman (input) for mailman id 832619;
 Fri, 08 Nov 2024 14:43:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALGw=SD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t9QCV-0004Ek-5c
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 14:43:03 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beb32690-9ddf-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 15:42:57 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a0c7abaa6so257497566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 06:42:57 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a1769asm242652866b.1.2024.11.08.06.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 06:42:55 -0800 (PST)
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
X-Inumbo-ID: beb32690-9ddf-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJlYjMyNjkwLTlkZGYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDc2OTc3LjY4ODMxOCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731076976; x=1731681776; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzOnLS8oEDSa6W+7YLbE30LQXdw68icgkxCi29QgKBU=;
        b=dZYwQHfZ4OFiZE8ubGjLp6Lnbmv7vPDKzKYMlreL9qBWEmCsHZhDQr7OR0d/t2C6Bj
         USyy6jblzzLOwH/4qNeTSnbpyCNj8UM7JlYjtQRmsu2ZYMiYN9MyePGbDTUTtxid5hMy
         9Uu7KxyRl9GnHKLVEIL3fJHBboMnW7QdjdKbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731076976; x=1731681776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzOnLS8oEDSa6W+7YLbE30LQXdw68icgkxCi29QgKBU=;
        b=CmDepuanYpAU7Yg6RJL5FwVlJImvtdHJK6KCzY9ZJSloHIdezpRTACqw3eWr/YZf5i
         H+qUQYp7KpPEtHJ/4KMjVUegpexip+6FS+t03ouxmauGqju+O66Q7FAde5yi15JxN4IO
         A0KgtJwbDesIfSt9WgcQVYbPHZEoFy/6y1jpCD488w9sa1ac3xqTJQoqoJrnUjzETDKD
         0lWivEkkYEsSkySegM4PamfR8dLlP5sv2nHu0/Ud6DIy0EXc4t13lD3/2MWHHUTk5xct
         kEuJnoB45kCt3KUEF/LD1HYUBwkx/jTxTS7hw76u2h8CWKYEvoKhMZjYPX+XzuG7U4Ud
         fPGA==
X-Gm-Message-State: AOJu0YxiBHO0PnAShJk7dy1D5zJOKEeqNUL1MzE5+wxl2N1aCiWYVLs9
	bYrKbr0fTnBEpW8M4odRK5Lr//nePljXP9D+C8hRWT9ubbFThBRhdxVbXU7jTuJOqsiS0Xcd0On
	q
X-Google-Smtp-Source: AGHT+IEQ6sbZoLMaTddFbkrfA1iRfdl7IHL/JmblKm5yn3lEQSqpnR+YO+84Ndq0KeFDNh/gVny08w==
X-Received: by 2002:a17:907:1c98:b0:a99:543e:94b4 with SMTP id a640c23a62f3a-a9ef001909amr264353766b.56.1731076976421;
        Fri, 08 Nov 2024 06:42:56 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86/ucode: Rework Intel's microcode_update_match()
Date: Fri,  8 Nov 2024 14:42:50 +0000
Message-Id: <20241108144252.315604-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108144252.315604-1-andrew.cooper3@citrix.com>
References: <20241108144252.315604-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This function is overloaded, creating complexity; 3 of 4 callers already only
want it for it's "applicable to this CPU or not" answer, and handle revision
calculations separately.

Change it to be microcode_fits_cpu(), returning a simple boolean.

Notably, this removes a path where cpu_request_microcode() inspects
currently-loaded microcode revision, just to discard the answer.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/intel.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index aad6a693e800..3f37792ab4b5 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -248,9 +248,8 @@ static enum microcode_match_result compare_revisions(
     return OLD_UCODE;
 }
 
-/* Check an update against the CPU signature and current update revision */
-static enum microcode_match_result microcode_update_match(
-    const struct microcode_patch *mc)
+/* Check whether this microcode patch is applicable for the current CPU. */
+static bool microcode_fits_cpu(const struct microcode_patch *mc)
 {
     const struct extended_sigtable *ext;
     unsigned int i;
@@ -260,18 +259,15 @@ static enum microcode_match_result microcode_update_match(
 
     /* Check the main microcode signature. */
     if ( signature_matches(cpu_sig, mc->sig, mc->pf) )
-        goto found;
+        return true;
 
     /* If there is an extended signature table, check each of them. */
     if ( (ext = get_ext_sigtable(mc)) != NULL )
         for ( i = 0; i < ext->count; ++i )
             if ( signature_matches(cpu_sig, ext->sigs[i].sig, ext->sigs[i].pf) )
-                goto found;
-
-    return MIS_UCODE;
+                return true;
 
- found:
-    return compare_revisions(cpu_sig->rev, mc->rev);
+    return false;
 }
 
 static enum microcode_match_result cf_check compare_patch(
@@ -281,8 +277,8 @@ static enum microcode_match_result cf_check compare_patch(
      * Both patches to compare are supposed to be applicable to local CPU.
      * Just compare the revision number.
      */
-    ASSERT(microcode_update_match(old) != MIS_UCODE);
-    ASSERT(microcode_update_match(new) != MIS_UCODE);
+    ASSERT(microcode_fits_cpu(old));
+    ASSERT(microcode_fits_cpu(new));
 
     return compare_revisions(old->rev, new->rev);
 }
@@ -297,11 +293,11 @@ static int cf_check apply_microcode(const struct microcode_patch *patch,
     enum microcode_match_result result;
     bool ucode_force = flags & XENPF_UCODE_FORCE;
 
-    result = microcode_update_match(patch);
-
-    if ( result == MIS_UCODE )
+    if ( !microcode_fits_cpu(patch) )
         return -EINVAL;
 
+    result = compare_revisions(old_rev, patch->rev);
+
     if ( !ucode_force && (result == SAME_UCODE || result == OLD_UCODE) )
         return -EEXIST;
 
@@ -365,7 +361,7 @@ static struct microcode_patch *cf_check cpu_request_microcode(
          * If the new update covers current CPU, compare updates and store the
          * one with higher revision.
          */
-        if ( (microcode_update_match(mc) != MIS_UCODE) &&
+        if ( microcode_fits_cpu(mc) &&
              (!saved || compare_revisions(saved->rev, mc->rev) == NEW_UCODE) )
             saved = mc;
 
-- 
2.39.5


