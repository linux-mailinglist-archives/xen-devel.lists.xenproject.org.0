Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C409AE5F6
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825238.1239444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xn7-0004rV-Pi; Thu, 24 Oct 2024 13:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825238.1239444; Thu, 24 Oct 2024 13:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3xn7-0004p4-Lr; Thu, 24 Oct 2024 13:22:17 +0000
Received: by outflank-mailman (input) for mailman id 825238;
 Thu, 24 Oct 2024 13:22:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd6X=RU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t3xn6-0004KA-Gz
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 13:22:16 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc07d42f-920a-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 15:22:14 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so118895566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 06:22:14 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912ee592sm618574766b.79.2024.10.24.06.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 06:22:11 -0700 (PDT)
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
X-Inumbo-ID: fc07d42f-920a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729776133; x=1730380933; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vje9cjl7S3MEL0v41NICuEDrNpFT2GOVFHe2wP6D174=;
        b=MXhSz/AgaUTb1+YOyikG/qnyiGBComM/0+9LBZy/bdTjMPfQxNtnFMCpaU0nErfP1f
         YzAL+afDDYjz4BGriFJzxfwUYgkicL3g+6gpjzEkOxoacP0dWlFlWhm/r4+cJkXUNLuR
         /mQdldKTrIqExclRjxWKwhBQC9BjS/tEdHlrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729776133; x=1730380933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vje9cjl7S3MEL0v41NICuEDrNpFT2GOVFHe2wP6D174=;
        b=tSH+PBaulgyhXJ8p2IfeW11ctEgspbr7gz/TAVI2F+Qk+3Vs7WGsGCdRkd69sMdSTY
         VqGCz+8dByBTFnke0jiXaBoe3R/z5XULebS594XfaVOdVdEzZ8Ffc9DNNioZWmFR68ZY
         yA4dKiVK4iWvbGj4X5MrFlYZqVMF8BpDIXEShr5VKJmpQrmg26+/pf/xhZ3aHk9Vhk6y
         bckHQ4T6NbDgUbd76fBcGQ1ECBojCM84lFrFlHZlyrL2/+WItUX+jNiRE4iig2YdrXcb
         KpPK/qYgZLOPnkriFlgGIhaa0vZcfc6ABOqLHB8sDf+Q7qX8km8rTSyT0rfH1dpVQNTy
         SSkA==
X-Gm-Message-State: AOJu0YzLwEuEd9pX8FzmdzzOREOGwlr7bM9bAq6HVBDV3Icf3/g1T/Nd
	xWO3VROug9bgykYARHIInkbrliRv67Dc/S616AaemgumFco0KQ5hE4LL5JtTzKkgNQErHw462pY
	U
X-Google-Smtp-Source: AGHT+IHOOtGnTEQAVB2sdCQ4P24Dc8w6u4STtsxpipSi9dy2lm9XP0oMoJtBQDdXW4FOf+OM7Hg54A==
X-Received: by 2002:a17:907:6e8c:b0:a9a:46f5:d6d7 with SMTP id a640c23a62f3a-a9abf8459d0mr589610666b.5.1729776133455;
        Thu, 24 Oct 2024 06:22:13 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/5] x86/ucode: Drop the parse_blob() wrapper
Date: Thu, 24 Oct 2024 14:22:02 +0100
Message-Id: <20241024132205.987042-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024132205.987042-1-andrew.cooper3@citrix.com>
References: <20241024132205.987042-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This separates the collect_cpu_info() and cpu_request_microcode() calls for
later cleanup, and frees up the name to be reused a little differently.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/core.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 21077b449c38..cad38d859eee 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -237,19 +237,6 @@ static struct patch_with_flags nmi_patch =
     .patch  = ZERO_BLOCK_PTR,
 };
 
-/*
- * Return a patch that covers current CPU. If there are multiple patches,
- * return the one with the highest revision number. Return error If no
- * patch is found and an error occurs during the parsing process. Otherwise
- * return NULL.
- */
-static struct microcode_patch *parse_blob(const char *buf, size_t len)
-{
-    alternative_vcall(ucode_ops.collect_cpu_info);
-
-    return alternative_call(ucode_ops.cpu_request_microcode, buf, len, true);
-}
-
 static void microcode_free_patch(const struct microcode_patch *patch)
 {
     xfree((struct microcode_patch *)patch);
@@ -616,7 +603,10 @@ static long cf_check ucode_update_hcall_cont(void *data)
         goto put;
     }
 
-    patch_with_flags.patch = parse_blob(buffer->buffer, buffer->len);
+    alternative_vcall(ucode_ops.collect_cpu_info);
+    patch_with_flags.patch = alternative_call(ucode_ops.cpu_request_microcode,
+                                              (const void *)buffer->buffer,
+                                              buffer->len, true);
     patch_with_flags.flags = buffer->flags;
     xfree(buffer);
     if ( IS_ERR(patch_with_flags.patch) )
@@ -797,7 +787,8 @@ static int __init early_update_cache(const void *data, size_t len)
     if ( !data )
         return -ENOMEM;
 
-    patch = parse_blob(data, len);
+    alternative_vcall(ucode_ops.collect_cpu_info);
+    patch = alternative_call(ucode_ops.cpu_request_microcode, data, len, true);
     if ( IS_ERR(patch) )
     {
         printk(XENLOG_WARNING "Parsing microcode blob error %ld\n",
-- 
2.39.5


