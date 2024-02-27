Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7754868EBD
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686020.1067570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revan-0008Pj-Df; Tue, 27 Feb 2024 11:25:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686020.1067570; Tue, 27 Feb 2024 11:25:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revan-0008M1-8w; Tue, 27 Feb 2024 11:25:49 +0000
Received: by outflank-mailman (input) for mailman id 686020;
 Tue, 27 Feb 2024 11:25:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1reval-0007WG-7S
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:25:47 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f391e6f1-d562-11ee-afd6-a90da7624cb6;
 Tue, 27 Feb 2024 12:25:46 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-512fd840142so2473743e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 03:25:46 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 qj24-20020a056214321800b0068f9fd1d688sm4018394qvb.21.2024.02.27.03.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:25:45 -0800 (PST)
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
X-Inumbo-ID: f391e6f1-d562-11ee-afd6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709033145; x=1709637945; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyNyY8wN07OAJqlH/Vju+7fTgYfs6X4zDGd5JPLgEbI=;
        b=D6XIvQCJrAglvQtlVm3VzruKoSa+wJGOY9iSuMSRfO75lRyZ9ATsdfD8YVibjFi3TQ
         neKlcbMLLmCUhoEgDIDYJyam/VmhBtwrbN5LbAemBjh5oVx4ys/etJdsDqVll09WeCtb
         2ZMpka2SHsQtnqVUg16L8PXLvag95N6Dobe90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033145; x=1709637945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyNyY8wN07OAJqlH/Vju+7fTgYfs6X4zDGd5JPLgEbI=;
        b=qmP30Fc9FXXsCpCNhkXWf7JcrIEecUg9J4WHY3wHfgl7eoPfnoqZlTu9fMdJaX8XGM
         sZjd1ABpG3Yf/yDf/05mq4BJydppb+w6GzuMQeeuHQ5mKv9uA89eodcz081Iyw1/2vgl
         Vc2iqqkYT4ONY3K/EVt5Fw0qg05rkS/PEVshaYzKmA2oD///6bNE0i1cNBj/Jr0FWHNW
         46E02tXPZ2TySLGhsF6rJb5sKPvyWkS1ffGzGivluO0nU8kyohYAB5CwdILWTreTm9ZU
         J/h/HiG6Ml0UJUJkOxbPyAZXOIkAQ+ELWQtVS6UEGZpTQvOWBlliBfONGTqd2jU3HoFp
         5llg==
X-Gm-Message-State: AOJu0Yxa9j5ebesyGK3dLJKvmkUOtbWn08c/kIN0VpxbUv7geL6h70Uo
	/ZguVoqVXeQ3nTwJi6TQKc6XlZT/0zs6p8D/VuqBQpJl7UdXNhBGYHDoHG3BnJZk82mrNOabaT3
	H
X-Google-Smtp-Source: AGHT+IFK2BifGhYTEE4PkQH9bmj7jJsbCai+7Q5HGiCe5i5wxZUV6bppAL1KpT0Cm+eNWRY2nGA/Sg==
X-Received: by 2002:ac2:4a9e:0:b0:512:fb31:1ad1 with SMTP id l30-20020ac24a9e000000b00512fb311ad1mr3967371lfp.57.1709033145436;
        Tue, 27 Feb 2024 03:25:45 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 3/5] xen/livepatch: fix norevert test attempt to open-code revert
Date: Tue, 27 Feb 2024 12:25:26 +0100
Message-ID: <20240227112528.4540-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227112528.4540-1-roger.pau@citrix.com>
References: <20240227112528.4540-1-roger.pau@citrix.com>
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
Changes since v1:
 - Check return value of revert_payload().
---
 xen/common/livepatch.c                        | 41 +++++++++++++++++--
 xen/include/xen/livepatch.h                   | 32 ++-------------
 .../livepatch/xen_action_hooks_norevert.c     | 22 +++-------
 3 files changed, 46 insertions(+), 49 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 14295bae8704..5a7d5b7be0ad 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -1366,7 +1366,22 @@ static int apply_payload(struct payload *data)
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
 
@@ -1382,7 +1397,7 @@ static inline void apply_payload_tail(struct payload *data)
     data->state = LIVEPATCH_STATE_APPLIED;
 }
 
-static int revert_payload(struct payload *data)
+int revert_payload(struct payload *data)
 {
     unsigned int i;
     int rc;
@@ -1397,7 +1412,25 @@ static int revert_payload(struct payload *data)
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
@@ -1415,7 +1448,7 @@ static int revert_payload(struct payload *data)
     return 0;
 }
 
-static inline void revert_payload_tail(struct payload *data)
+void revert_payload_tail(struct payload *data)
 {
     list_del(&data->applied_list);
 
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index ad0eae28bd0d..d074a5bebecc 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -138,35 +138,11 @@ void arch_livepatch_post_action(void);
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
index c17385519263..c5fbab174680 100644
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
+    BUG_ON(revert_payload(payload));
+    revert_payload_tail(payload);
+    local_irq_restore(flags);
 
     printk(KERN_DEBUG "%s: Hook done.\n", __func__);
 }
-- 
2.44.0


