Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 357C57FF1CD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644747.1006200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8i4F-0005Ka-1n; Thu, 30 Nov 2023 14:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644747.1006200; Thu, 30 Nov 2023 14:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8i4E-0005Iw-V7; Thu, 30 Nov 2023 14:31:02 +0000
Received: by outflank-mailman (input) for mailman id 644747;
 Thu, 30 Nov 2023 14:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8i4D-0004Xw-T7
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:31:01 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15128e0c-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:31:00 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40b27b498c3so9579515e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 06:31:00 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 bg36-20020a05600c3ca400b003fe1fe56202sm2226753wmb.33.2023.11.30.06.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:30:58 -0800 (PST)
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
X-Inumbo-ID: 15128e0c-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701354659; x=1701959459; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUZtNykyKvrHHFaeVoASWNDGSUHrb0gwHyinLU+xjEQ=;
        b=XTFQUqEnHUxUKHXVzlorajYqYBpDdkveaZSWLJeQwUSzyrVDqxHDVVmFlfZtGIkp7m
         gqn0ovNu+2Ss6rIE+GnosGlqVqW7c2AecTeiorqJWuvvJHUMpg2/cArFLMHJoHbV1uJm
         xmQJhHyrhluGCv3W3A9YetlT5kY6TACnyNSe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701354659; x=1701959459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUZtNykyKvrHHFaeVoASWNDGSUHrb0gwHyinLU+xjEQ=;
        b=CUf4tbD82JbFHadRdg2IT0LyWBeB/hRscC4Auqp6xhaYgMz4z03zOW/raLRr9GDkXX
         fUq2QJxCB0IA4v1aBlpREHAfRxRizxsW6XM+YfFX9+rWcHRqVnM+47NNts04cJIQQH6q
         vqFE3tqCc2sl5T9tqaIany3XB3JpG/gg2BaGLVjPMQ58clzJtKDPkInkUOsy29poQ9Ru
         o1wyV4cj6mROcmJbBj15EHnoNVN9pa0wCSd2rT83vH052LOU2MebmhfL7GpTUQ4xUX1j
         ZcO1BRT6g0bAr4nSyT2XiMo68+oRGiZ/TrUqwre7GHHoFNJf4BEtQewfuYxXVej8uQ7Q
         OUqg==
X-Gm-Message-State: AOJu0YyTW0lGRoOAA6Yu1v8i7mp++XMR0nv3xmcMnlmz9WP4BlW3kGuy
	uiLgKNZ+DC3U+Zuw8a8QJ5dEKOhIrabHPkzdovs=
X-Google-Smtp-Source: AGHT+IGAVFqkVLj5bVZ4+QcNWWYXd2BLQa0cqBXLGFoth88i5xyK5H6M1+aGiy8iRj2AyeI5qo4C9Q==
X-Received: by 2002:a05:600c:354e:b0:40b:51c2:6910 with SMTP id i14-20020a05600c354e00b0040b51c26910mr4366825wmq.29.1701354658965;
        Thu, 30 Nov 2023 06:30:58 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 3/5] xen/livepatch: fix norevert test attempt to open-code revert
Date: Thu, 30 Nov 2023 15:29:42 +0100
Message-ID: <20231130142944.46322-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130142944.46322-1-roger.pau@citrix.com>
References: <20231130142944.46322-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The purpose of the norevert test is to install a dummy handler that replaces
the internal Xen revert code, and then perform the revert in the post-revert
hook.  For that purpose the usage of the previous common_livepatch_revert() is
not enough, as that just reverts specific functions, but not the whole state of
the payload.

Remove both common_livepatch_{apply,revert}() and instead expose
revert_payload{,_tail}() in order to perform the patch revert from the
post-revert hook.

Fixes: 6047104c3ccc ('livepatch: Add per-function applied/reverted state tracking marker')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/livepatch.c                        | 41 +++++++++++++++++--
 xen/include/xen/livepatch.h                   | 32 ++-------------
 .../livepatch/xen_action_hooks_norevert.c     | 22 +++-------
 3 files changed, 46 insertions(+), 49 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 4e775be66571..d81f3d11d655 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -1367,7 +1367,22 @@ static int apply_payload(struct payload *data)
     ASSERT(!local_irq_is_enabled());
 
     for ( i = 0; i < data->nfuncs; i++ )
-        common_livepatch_apply(&data->funcs[i], &data->fstate[i]);
+    {
+        const struct livepatch_func *func = &data->funcs[i];
+        struct livepatch_fstate *state = &data->fstate[i];
+
+        /* If the action has been already executed on this function, do nothing. */
+        if ( state->applied == LIVEPATCH_FUNC_APPLIED )
+        {
+            printk(XENLOG_WARNING LIVEPATCH
+                   "%s: %s has been already applied before\n",
+                   __func__, func->name);
+            continue;
+        }
+
+        arch_livepatch_apply(func, state);
+        state->applied = LIVEPATCH_FUNC_APPLIED;
+    }
 
     arch_livepatch_revive();
 
@@ -1383,7 +1398,7 @@ static inline void apply_payload_tail(struct payload *data)
     data->state = LIVEPATCH_STATE_APPLIED;
 }
 
-static int revert_payload(struct payload *data)
+int revert_payload(struct payload *data)
 {
     unsigned int i;
     int rc;
@@ -1398,7 +1413,25 @@ static int revert_payload(struct payload *data)
     }
 
     for ( i = 0; i < data->nfuncs; i++ )
-        common_livepatch_revert(&data->funcs[i], &data->fstate[i]);
+    {
+        const struct livepatch_func *func = &data->funcs[i];
+        struct livepatch_fstate *state = &data->fstate[i];
+
+        /*
+         * If the apply action hasn't been executed on this function, do
+         * nothing.
+         */
+        if ( !func->old_addr || state->applied == LIVEPATCH_FUNC_NOT_APPLIED )
+        {
+            printk(XENLOG_WARNING LIVEPATCH
+                   "%s: %s has not been applied before\n",
+                   __func__, func->name);
+            continue;
+        }
+
+        arch_livepatch_revert(func, state);
+        state->applied = LIVEPATCH_FUNC_NOT_APPLIED;
+    }
 
     /*
      * Since we are running with IRQs disabled and the hooks may call common
@@ -1416,7 +1449,7 @@ static int revert_payload(struct payload *data)
     return 0;
 }
 
-static inline void revert_payload_tail(struct payload *data)
+void revert_payload_tail(struct payload *data)
 {
     list_del(&data->applied_list);
 
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index df339a134e40..9da8b6939878 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -136,35 +136,11 @@ void arch_livepatch_post_action(void);
 void arch_livepatch_mask(void);
 void arch_livepatch_unmask(void);
 
-static inline void common_livepatch_apply(const struct livepatch_func *func,
-                                          struct livepatch_fstate *state)
-{
-    /* If the action has been already executed on this function, do nothing. */
-    if ( state->applied == LIVEPATCH_FUNC_APPLIED )
-    {
-        printk(XENLOG_WARNING LIVEPATCH "%s: %s has been already applied before\n",
-                __func__, func->name);
-        return;
-    }
-
-    arch_livepatch_apply(func, state);
-    state->applied = LIVEPATCH_FUNC_APPLIED;
-}
+/* Only for testing purposes. */
+struct payload;
+int revert_payload(struct payload *data);
+void revert_payload_tail(struct payload *data);
 
-static inline void common_livepatch_revert(const struct livepatch_func *func,
-                                           struct livepatch_fstate *state)
-{
-    /* If the apply action hasn't been executed on this function, do nothing. */
-    if ( !func->old_addr || state->applied == LIVEPATCH_FUNC_NOT_APPLIED )
-    {
-        printk(XENLOG_WARNING LIVEPATCH "%s: %s has not been applied before\n",
-                __func__, func->name);
-        return;
-    }
-
-    arch_livepatch_revert(func, state);
-    state->applied = LIVEPATCH_FUNC_NOT_APPLIED;
-}
 #else
 
 /*
diff --git a/xen/test/livepatch/xen_action_hooks_norevert.c b/xen/test/livepatch/xen_action_hooks_norevert.c
index 3e21ade6abfc..074f8e1d56ce 100644
--- a/xen/test/livepatch/xen_action_hooks_norevert.c
+++ b/xen/test/livepatch/xen_action_hooks_norevert.c
@@ -96,26 +96,14 @@ static int revert_hook(livepatch_payload_t *payload)
 
 static void post_revert_hook(livepatch_payload_t *payload)
 {
-    int i;
+    unsigned long flags;
 
     printk(KERN_DEBUG "%s: Hook starting.\n", __func__);
 
-    for (i = 0; i < payload->nfuncs; i++)
-    {
-        const struct livepatch_func *func = &payload->funcs[i];
-        struct livepatch_fstate *fstate = &payload->fstate[i];
-
-        BUG_ON(revert_cnt != 1);
-        BUG_ON(fstate->applied != LIVEPATCH_FUNC_APPLIED);
-
-        /* Outside of quiesce zone: MAY TRIGGER HOST CRASH/UNDEFINED BEHAVIOR */
-        arch_livepatch_quiesce();
-        common_livepatch_revert(payload);
-        arch_livepatch_revive();
-        BUG_ON(fstate->applied == LIVEPATCH_FUNC_APPLIED);
-
-        printk(KERN_DEBUG "%s: post reverted: %s\n", __func__, func->name);
-    }
+    local_irq_save(flags);
+    revert_payload(payload);
+    revert_payload_tail(payload);
+    local_irq_restore(flags);
 
     printk(KERN_DEBUG "%s: Hook done.\n", __func__);
 }
-- 
2.43.0


