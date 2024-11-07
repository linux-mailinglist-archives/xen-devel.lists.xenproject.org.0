Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E29F9C0593
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 13:21:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831768.1247158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t91Vw-0003u2-Hb; Thu, 07 Nov 2024 12:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831768.1247158; Thu, 07 Nov 2024 12:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t91Vw-0003qf-B8; Thu, 07 Nov 2024 12:21:28 +0000
Received: by outflank-mailman (input) for mailman id 831768;
 Thu, 07 Nov 2024 12:21:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd42=SC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t91Vv-0003Uj-8q
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 12:21:27 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd731a90-9d02-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 13:21:23 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5ceccffadfdso1144762a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 04:21:23 -0800 (PST)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b5c91esm727688a12.4.2024.11.07.04.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 04:21:21 -0800 (PST)
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
X-Inumbo-ID: cd731a90-9d02-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNkNzMxYTkwLTlkMDItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTgyMDgzLjU4MjU3NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730982082; x=1731586882; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVZQOpTTpM2S/e3rLNR3YwvXv7wCxv2Z+w11Kz7Jc/g=;
        b=qolGz+oYeKF3B686Z2usJizG+p3SXjQ71i8I4nNSUiXWJwXJ6Ssx18Fw8xhtfolLgJ
         po4n1hzwotK1YZPlbsAKoF/zmWgWNhIUhIXEQGcMYtTuCIYExisNPmq9hyFR3agWyQuZ
         KPkGlxel/x264BqDTUii+1Fm3QpVbJfvIjDQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730982082; x=1731586882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVZQOpTTpM2S/e3rLNR3YwvXv7wCxv2Z+w11Kz7Jc/g=;
        b=FCHSz5lITD/FPObe2PqRxIKxqPlvrykEQ6+sKMKjNO4Qzen0v6DdKhXz6wH/LFFmHh
         kPTbDDo/k13irK8ayP2VNzgb64NAcMSp9pa58eKuzz4dL4aAXmhGR89ccj+d91bcyjQ6
         +3N4peuFeBWsZBw9kXjamOWUMrnhP2ZdTV/WoEwO6vqPeUW5TuYPKxUe7rTFiyhlPlUN
         7mqzJHtlgqfj9Y/+YqUa6gdocBMr0lQ6z8FRlHKhP2U6nxqoRbPCd+qGZvxX1a5bCue3
         hiBsou28H5Zn+CZP3zdoX9EoaIrn9Q7DC2LtZWfIduiPa/bJBq7UuQb5ywu2tqMfxRO6
         A0Pw==
X-Gm-Message-State: AOJu0Yxv0NfWqd7+O3DLLuEV2O0JVX/zm+jLX2g6/nf34l/kNkKaE30m
	/vv7ndbeDqSrZsE3fDErwXYhKDxoFEEoWY87cPgHiTWxUYfVcJe2BKk6X6IKhim7evAe0tCAF0H
	A
X-Google-Smtp-Source: AGHT+IGWMic17q7tsN1mJCztBO+K8U9AP6DY+ZFvHixitFldko5Xa+0H3e44iwcr5m94BjL2g1uPeA==
X-Received: by 2002:a05:6402:5242:b0:5ce:f7c2:65fe with SMTP id 4fb4d7f45d1cf-5cf05a5976emr1020450a12.28.1730982082259;
        Thu, 07 Nov 2024 04:21:22 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/ucode: Fold microcode_update_cpu() and fix error handling
Date: Thu,  7 Nov 2024 12:21:16 +0000
Message-Id: <20241107122117.4073266-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241107122117.4073266-1-andrew.cooper3@citrix.com>
References: <20241107122117.4073266-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fold microcode_update_cpu() into its single remaining caller and simplify the
logic by removing the patch != NULL path with microcode_mutex held.

Explain why we bother grabbing the microcode revision even if we can't load
microcode.

Furthermore, delete the -EIO path.  An error updating microcode on AP boot or
S3 resume is certainly bad, but freeing the cache is about the worst possible
action we can take in response; it prevents subsequent APs from taking an
update they might have accepted.

This avoids a double collect_cpu_info() call on each AP.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 49 +++++++++----------------------
 1 file changed, 14 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index d9406ec3fd34..fd4b08b45388 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -263,40 +263,6 @@ static bool cf_check wait_cpu_callout(unsigned int nr)
     return atomic_read(&cpu_out) >= nr;
 }
 
-/*
- * Load a microcode update to current CPU.
- *
- * If no patch is provided, the cached patch will be loaded. Microcode update
- * during APs bringup and CPU resuming falls into this case.
- */
-static int microcode_update_cpu(const struct microcode_patch *patch,
-                                unsigned int flags)
-{
-    int err;
-
-    alternative_vcall(ucode_ops.collect_cpu_info);
-
-    spin_lock(&microcode_mutex);
-    if ( patch )
-        err = alternative_call(ucode_ops.apply_microcode, patch, flags);
-    else if ( microcode_cache )
-    {
-        err = alternative_call(ucode_ops.apply_microcode, microcode_cache,
-                               flags);
-        if ( err == -EIO )
-        {
-            microcode_free_patch(microcode_cache);
-            microcode_cache = NULL;
-        }
-    }
-    else
-        /* No patch to update */
-        err = -ENOENT;
-    spin_unlock(&microcode_mutex);
-
-    return err;
-}
-
 static bool wait_for_state(typeof(loading_state) state)
 {
     typeof(loading_state) cur_state;
@@ -702,13 +668,26 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
 /* Load a cached update to current cpu */
 int microcode_update_one(void)
 {
+    int rc;
+
+    /*
+     * This path is used for APs and S3 resume.  Read the microcode revision
+     * if possible, even if we can't load microcode.
+     */
     if ( ucode_ops.collect_cpu_info )
         alternative_vcall(ucode_ops.collect_cpu_info);
 
     if ( !ucode_ops.apply_microcode )
         return -EOPNOTSUPP;
 
-    return microcode_update_cpu(NULL, 0);
+    spin_lock(&microcode_mutex);
+    if ( microcode_cache )
+        rc = alternative_call(ucode_ops.apply_microcode, microcode_cache, 0);
+    else
+        rc = -ENOENT;
+    spin_unlock(&microcode_mutex);
+
+    return rc;
 }
 
 /*
-- 
2.39.5


