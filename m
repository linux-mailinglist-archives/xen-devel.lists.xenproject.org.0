Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1861F7FC06F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643400.1003581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r825q-0005XC-SM; Tue, 28 Nov 2023 17:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643400.1003581; Tue, 28 Nov 2023 17:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r825q-0005Tz-PS; Tue, 28 Nov 2023 17:41:54 +0000
Received: by outflank-mailman (input) for mailman id 643400;
 Tue, 28 Nov 2023 17:41:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PT6c=HJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r825o-0005Ts-Uq
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:41:53 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69a7bea6-8e15-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 18:41:51 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40b4a8db331so10853255e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Nov 2023 09:41:51 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 h17-20020a5d5491000000b0033307ffb19fsm4440761wrv.37.2023.11.28.09.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 09:41:50 -0800 (PST)
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
X-Inumbo-ID: 69a7bea6-8e15-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701193310; x=1701798110; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p01uU/HUMxa7CGZkx8Qb8b+bDgJZ8Ga7cwAsgScQFo4=;
        b=ufe8bVzaKFRsyKRCwScRQMdSEPxMk8kgyI/f8dd5+Inx2j8HDcQQZojusksr7PInoZ
         ay8+zkLn97hs63OxTnzqKZBMO0lBbY76oRcC2sHUwg504AZ2EkIlzdhjUOA4YTD8wqSz
         4gW3CqUaBlvcrJeHz3TRKV+NH6OW4JcdnzE00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701193310; x=1701798110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p01uU/HUMxa7CGZkx8Qb8b+bDgJZ8Ga7cwAsgScQFo4=;
        b=QgZObf6Cp4BzvpwX4i8HP9kYkFCJHnSuZ/WT5uzd5llxQT/RW0ZBVyaK+ohlaJOIjW
         poQaVqi3PFwVGGj3S+8v4RLwzX0vLu80wmuB9iKsVz9hfX/+zPtknuw3Pa6yNuViqDey
         WAtGJweIOJiv9IZSWAbUbOuEYfOGC6c1bPgf3/0lATsOKmbGHj4EncU71xYcPp+WZKp0
         zzAgfKmWYkMMsbpU6yYumXSJHvNK47oj0ZocWQ+hWUirSmE2bG6Mf+yNf2DanGjocO/k
         yf6vpIzSZ8B2NtHsmLrrodiQ4KvHoInyibPRyj+OrbmJZjDJKlrTx2T3T0Lg08r8rSDz
         JL5A==
X-Gm-Message-State: AOJu0Ywk9AmKMyGWQ7p9gb5N/lrKNm/I0aWICdW1varQ6g591zPiB5wC
	Rs6XwEujhsS+cQ0TtZ0nwtA16wlk9VAEX6fZNAQ=
X-Google-Smtp-Source: AGHT+IHq9SG6ctHJ3JAtYuYEV3jUijn+fooDLrQtilf64q0J9uDwcHObw2EQTqesAgvuTfDv/j2ywA==
X-Received: by 2002:adf:ecc9:0:b0:333:1096:656 with SMTP id s9-20020adfecc9000000b0033310960656mr1714909wro.33.1701193310323;
        Tue, 28 Nov 2023 09:41:50 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] xen/livepatch: fix livepatch tests
Date: Tue, 28 Nov 2023 18:41:31 +0100
Message-ID: <20231128174131.38642-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current set of in-tree livepatch tests in xen/test/livepatch started
failing after the constify of the payload funcs array, and the movement of the
status data into a separate array.

Fix the tests so they respect the constness of the funcs array and also make
use of the new location of the per-func state data.

Fixes: 82182ad7b46e ('livepatch: do not use .livepatch.funcs section to store internal state')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I will see about getting those tests build in gitlab, in the meantime we should
take this fix in order to unblock osstest.
---
 xen/test/livepatch/xen_action_hooks.c         | 12 +++++-----
 xen/test/livepatch/xen_action_hooks_marker.c  | 20 ++++++++++-------
 xen/test/livepatch/xen_action_hooks_noapply.c | 22 +++++++++++--------
 xen/test/livepatch/xen_action_hooks_nofunc.c  |  6 ++---
 .../livepatch/xen_action_hooks_norevert.c     | 22 +++++++++++--------
 xen/test/livepatch/xen_prepost_hooks.c        |  8 +++----
 xen/test/livepatch/xen_prepost_hooks_fail.c   |  2 +-
 7 files changed, 53 insertions(+), 39 deletions(-)

diff --git a/xen/test/livepatch/xen_action_hooks.c b/xen/test/livepatch/xen_action_hooks.c
index 39b531302731..fa0b3ab35f38 100644
--- a/xen/test/livepatch/xen_action_hooks.c
+++ b/xen/test/livepatch/xen_action_hooks.c
@@ -26,9 +26,10 @@ static int apply_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
-        func->applied = LIVEPATCH_FUNC_APPLIED;
+        fstate->applied = LIVEPATCH_FUNC_APPLIED;
         apply_cnt++;
 
         printk(KERN_DEBUG "%s: applying: %s\n", __func__, func->name);
@@ -47,9 +48,10 @@ static int revert_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
-        func->applied = LIVEPATCH_FUNC_NOT_APPLIED;
+        fstate->applied = LIVEPATCH_FUNC_NOT_APPLIED;
         revert_cnt++;
 
         printk(KERN_DEBUG "%s: reverting: %s\n", __func__, func->name);
@@ -68,7 +70,7 @@ static void post_revert_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
 
         printk(KERN_DEBUG "%s: reverted: %s\n", __func__, func->name);
     }
diff --git a/xen/test/livepatch/xen_action_hooks_marker.c b/xen/test/livepatch/xen_action_hooks_marker.c
index 4f807a577f25..d2e22f70d1f4 100644
--- a/xen/test/livepatch/xen_action_hooks_marker.c
+++ b/xen/test/livepatch/xen_action_hooks_marker.c
@@ -23,9 +23,10 @@ static int pre_apply_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
-        BUG_ON(func->applied == LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied == LIVEPATCH_FUNC_APPLIED);
         printk(KERN_DEBUG "%s: pre applied: %s\n", __func__, func->name);
     }
 
@@ -42,9 +43,10 @@ static void post_apply_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
-        BUG_ON(func->applied != LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied != LIVEPATCH_FUNC_APPLIED);
         printk(KERN_DEBUG "%s: post applied: %s\n", __func__, func->name);
     }
 
@@ -59,9 +61,10 @@ static int pre_revert_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
-        BUG_ON(func->applied != LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied != LIVEPATCH_FUNC_APPLIED);
         printk(KERN_DEBUG "%s: pre reverted: %s\n", __func__, func->name);
     }
 
@@ -78,9 +81,10 @@ static void post_revert_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
-        BUG_ON(func->applied == LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied == LIVEPATCH_FUNC_APPLIED);
         printk(KERN_DEBUG "%s: post reverted: %s\n", __func__, func->name);
     }
 
diff --git a/xen/test/livepatch/xen_action_hooks_noapply.c b/xen/test/livepatch/xen_action_hooks_noapply.c
index 4c55c156a621..646a5fd2f002 100644
--- a/xen/test/livepatch/xen_action_hooks_noapply.c
+++ b/xen/test/livepatch/xen_action_hooks_noapply.c
@@ -25,9 +25,10 @@ static int pre_apply_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
-        BUG_ON(func->applied == LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied == LIVEPATCH_FUNC_APPLIED);
         printk(KERN_DEBUG "%s: pre applied: %s\n", __func__, func->name);
     }
 
@@ -44,7 +45,7 @@ static int apply_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
 
         apply_cnt++;
         printk(KERN_DEBUG "%s: applying: %s\n", __func__, func->name);
@@ -63,10 +64,11 @@ static void post_apply_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
         BUG_ON(apply_cnt != 1);
-        BUG_ON(func->applied == LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied == LIVEPATCH_FUNC_APPLIED);
         printk(KERN_DEBUG "%s: post applied: %s\n", __func__, func->name);
     }
 
@@ -81,9 +83,10 @@ static int pre_revert_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
-        BUG_ON(func->applied == LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied == LIVEPATCH_FUNC_APPLIED);
         printk(KERN_DEBUG "%s: pre reverted: %s\n", __func__, func->name);
     }
 
@@ -100,9 +103,10 @@ static void post_revert_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
-        BUG_ON(func->applied == LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied == LIVEPATCH_FUNC_APPLIED);
         printk(KERN_DEBUG "%s: post reverted: %s\n", __func__, func->name);
     }
 
diff --git a/xen/test/livepatch/xen_action_hooks_nofunc.c b/xen/test/livepatch/xen_action_hooks_nofunc.c
index 2b4e90436fce..077c4c173888 100644
--- a/xen/test/livepatch/xen_action_hooks_nofunc.c
+++ b/xen/test/livepatch/xen_action_hooks_nofunc.c
@@ -23,7 +23,7 @@ static int apply_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
 
         apply_cnt++;
         printk(KERN_DEBUG "%s: applying: %s\n", __func__, func->name);
@@ -42,7 +42,7 @@ static int revert_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
 
         revert_cnt++;
         printk(KERN_DEBUG "%s: reverting: %s\n", __func__, func->name);
@@ -61,7 +61,7 @@ static void post_revert_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
 
         printk(KERN_DEBUG "%s: reverted: %s\n", __func__, func->name);
     }
diff --git a/xen/test/livepatch/xen_action_hooks_norevert.c b/xen/test/livepatch/xen_action_hooks_norevert.c
index ef77e720713e..1c4873f55640 100644
--- a/xen/test/livepatch/xen_action_hooks_norevert.c
+++ b/xen/test/livepatch/xen_action_hooks_norevert.c
@@ -25,9 +25,10 @@ static int pre_apply_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
-        BUG_ON(func->applied == LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied == LIVEPATCH_FUNC_APPLIED);
         printk(KERN_DEBUG "%s: pre applied: %s\n", __func__, func->name);
     }
 
@@ -44,9 +45,10 @@ static void post_apply_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
-        BUG_ON(func->applied != LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied != LIVEPATCH_FUNC_APPLIED);
         printk(KERN_DEBUG "%s: post applied: %s\n", __func__, func->name);
     }
 
@@ -62,8 +64,9 @@ static int pre_revert_hook(livepatch_payload_t *payload)
     for (i = 0; i < payload->nfuncs; i++)
     {
         struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
-        BUG_ON(func->applied != LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied != LIVEPATCH_FUNC_APPLIED);
         printk(KERN_DEBUG "%s: pre reverted: %s\n", __func__, func->name);
     }
 
@@ -80,7 +83,7 @@ static int revert_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
 
         revert_cnt++;
         printk(KERN_DEBUG "%s: reverting: %s\n", __func__, func->name);
@@ -99,16 +102,17 @@ static void post_revert_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
+        struct livepatch_fstate *fstate = &payload->fstate[i];
 
         BUG_ON(revert_cnt != 1);
-        BUG_ON(func->applied != LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied != LIVEPATCH_FUNC_APPLIED);
 
         /* Outside of quiesce zone: MAY TRIGGER HOST CRASH/UNDEFINED BEHAVIOR */
         arch_livepatch_quiesce();
         common_livepatch_revert(payload);
         arch_livepatch_revive();
-        BUG_ON(func->applied == LIVEPATCH_FUNC_APPLIED);
+        BUG_ON(fstate->applied == LIVEPATCH_FUNC_APPLIED);
 
         printk(KERN_DEBUG "%s: post reverted: %s\n", __func__, func->name);
     }
diff --git a/xen/test/livepatch/xen_prepost_hooks.c b/xen/test/livepatch/xen_prepost_hooks.c
index 889377d6ebfd..17f5af6a1921 100644
--- a/xen/test/livepatch/xen_prepost_hooks.c
+++ b/xen/test/livepatch/xen_prepost_hooks.c
@@ -30,7 +30,7 @@ static int pre_apply_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
 
         pre_apply_cnt++;
         printk(KERN_DEBUG "%s: applying: %s\n", __func__, func->name);
@@ -49,7 +49,7 @@ static void post_apply_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
 
         post_apply_cnt++;
         printk(KERN_DEBUG "%s: applied: %s\n", __func__, func->name);
@@ -66,7 +66,7 @@ static int pre_revert_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
 
         pre_revert_cnt++;
         printk(KERN_DEBUG "%s: reverting: %s\n", __func__, func->name);
@@ -86,7 +86,7 @@ static void post_revert_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
 
         post_revert_cnt++;
         printk(KERN_DEBUG "%s: reverted: %s\n", __func__, func->name);
diff --git a/xen/test/livepatch/xen_prepost_hooks_fail.c b/xen/test/livepatch/xen_prepost_hooks_fail.c
index c6feb5d32dbd..52fd7f642ecb 100644
--- a/xen/test/livepatch/xen_prepost_hooks_fail.c
+++ b/xen/test/livepatch/xen_prepost_hooks_fail.c
@@ -24,7 +24,7 @@ static int pre_apply_hook(livepatch_payload_t *payload)
 
     for (i = 0; i < payload->nfuncs; i++)
     {
-        struct livepatch_func *func = &payload->funcs[i];
+        const struct livepatch_func *func = &payload->funcs[i];
 
         printk(KERN_DEBUG "%s: pre applying: %s\n", __func__, func->name);
     }
-- 
2.43.0


