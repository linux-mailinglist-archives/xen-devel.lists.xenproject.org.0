Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01F4868EBC
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:25:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686019.1067560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revak-00085z-Um; Tue, 27 Feb 2024 11:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686019.1067560; Tue, 27 Feb 2024 11:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revak-000833-QP; Tue, 27 Feb 2024 11:25:46 +0000
Received: by outflank-mailman (input) for mailman id 686019;
 Tue, 27 Feb 2024 11:25:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1revaj-0007l8-Ih
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:25:45 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f21e9684-d562-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 12:25:44 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-512e39226efso5576425e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 03:25:44 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 on33-20020a05621444a100b0068fcd643b9dsm4026531qvb.22.2024.02.27.03.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:25:42 -0800 (PST)
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
X-Inumbo-ID: f21e9684-d562-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709033143; x=1709637943; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adt3YzhrFcYBWzR8wX43amlG22Ma23x7ZH5fofejSpQ=;
        b=AvxkxG2156hQiKaZqE94OZXt9Z/SOQkbKp05QHlbelojlxbS+IYbJDz6ORDOujv51G
         +Wxqwr1F08v2J50ydEsmk/Xx/Gq5BFqs668lUfAv0CtNU5hGZdCo8k00Vi2KGJkdSgct
         hNdy0MtI4nGAaKv0rjtCGiHiptkDSdSeI8EoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033143; x=1709637943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adt3YzhrFcYBWzR8wX43amlG22Ma23x7ZH5fofejSpQ=;
        b=jE+SQ20eku5AEKdICf+lRtq0AZGWdNfGom8LEHt4CwKE2RTSstz7Kc0VAEHuHaIAdY
         UnuHt2RWKPkW7M3CSsQbSl4CFJP+Gl3GasHyO9h4fhsG9wb+ZZEiY+qpCOb1zNKMNfV6
         HE2xrwrXDHLOKy+B/59MkO7Xcrdvz3AbXhvwULpC9JjrcvYQBzGO+NvM4UrMdZfX1TIT
         GqV0Kat4wtG0cg89zNW0hI4AnrKqWQPbJf/Ti1wrZ3NICeBeJc5R8vW5yGTDH29nX2AG
         S+jYoy0wkkAUs8dlcL+shGLWksYLT23hOtG3j0WN8VLsQAgI4ehA2a7gVtVz8oijHtm0
         nDCQ==
X-Gm-Message-State: AOJu0Yw/r6V2W1q5ytZYg9Ji0kF5n0v5PjIaCDRFb36umnXaj/H1tbqy
	kPuvPjpU6v5kotacfCYzOYTlEEkxhS7sv1mporB47Et+SJYnXzxwlo/rGUVpdpJTZHYRCJQtIZc
	B
X-Google-Smtp-Source: AGHT+IFrcnfBqjubkVqz3lZabcZvN3Ua4viJGKpy6BgXTXfWXX5iv7XXj2buKAEP1g7vqVfsLqFjNQ==
X-Received: by 2002:ac2:5e85:0:b0:512:ed5f:3bf0 with SMTP id b5-20020ac25e85000000b00512ed5f3bf0mr5608169lfq.28.1709033143015;
        Tue, 27 Feb 2024 03:25:43 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 2/5] xen/livepatch: search for symbols in all loaded payloads
Date: Tue, 27 Feb 2024 12:25:25 +0100
Message-ID: <20240227112528.4540-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227112528.4540-1-roger.pau@citrix.com>
References: <20240227112528.4540-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When checking if an address belongs to a patch, or when resolving a symbol,
take into account all loaded livepatch payloads, even if not applied.

This is required in order for the pre-apply and post-revert hooks to work
properly, or else Xen won't detect the instruction pointer belonging to those
hooks as being part of the currently active text.

Move the RCU handling to be used for payload_list instead of applied_list, as
now the calls from trap code will iterate over the payload_list.

Fixes: 8313c864fa95 ('livepatch: Implement pre-|post- apply|revert hooks')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/common/livepatch.c | 49 +++++++++++++++---------------------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index d7f50e101858..14295bae8704 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -36,13 +36,14 @@
  * caller in schedule_work.
  */
 static DEFINE_SPINLOCK(payload_lock);
-static LIST_HEAD(payload_list);
-
 /*
- * Patches which have been applied. Need RCU in case we crash (and then
- * traps code would iterate via applied_list) when adding entries on the list.
+ * Need RCU in case we crash (and then traps code would iterate via
+ * payload_list) when adding entries on the list.
  */
-static DEFINE_RCU_READ_LOCK(rcu_applied_lock);
+static DEFINE_RCU_READ_LOCK(rcu_payload_lock);
+static LIST_HEAD(payload_list);
+
+/* Patches which have been applied. Only modified from stop machine context. */
 static LIST_HEAD(applied_list);
 
 static unsigned int payload_cnt;
@@ -111,12 +112,8 @@ bool is_patch(const void *ptr)
     const struct payload *data;
     bool r = false;
 
-    /*
-     * Only RCU locking since this list is only ever changed during apply
-     * or revert context. And in case it dies there we need an safe list.
-     */
-    rcu_read_lock(&rcu_applied_lock);
-    list_for_each_entry_rcu ( data, &applied_list, applied_list )
+    rcu_read_lock(&rcu_payload_lock);
+    list_for_each_entry_rcu ( data, &payload_list, list )
     {
         if ( (ptr >= data->rw_addr &&
               ptr < (data->rw_addr + data->rw_size)) ||
@@ -130,7 +127,7 @@ bool is_patch(const void *ptr)
         }
 
     }
-    rcu_read_unlock(&rcu_applied_lock);
+    rcu_read_unlock(&rcu_payload_lock);
 
     return r;
 }
@@ -166,12 +163,8 @@ static const char *cf_check livepatch_symbols_lookup(
     const void *va = (const void *)addr;
     const char *n = NULL;
 
-    /*
-     * Only RCU locking since this list is only ever changed during apply
-     * or revert context. And in case it dies there we need an safe list.
-     */
-    rcu_read_lock(&rcu_applied_lock);
-    list_for_each_entry_rcu ( data, &applied_list, applied_list )
+    rcu_read_lock(&rcu_payload_lock);
+    list_for_each_entry_rcu ( data, &payload_list, list )
     {
         if ( va < data->text_addr ||
              va >= (data->text_addr + data->text_size) )
@@ -200,7 +193,7 @@ static const char *cf_check livepatch_symbols_lookup(
         n = data->symtab[best].name;
         break;
     }
-    rcu_read_unlock(&rcu_applied_lock);
+    rcu_read_unlock(&rcu_payload_lock);
 
     return n;
 }
@@ -1072,7 +1065,8 @@ static void free_payload(struct payload *data)
 {
     ASSERT(spin_is_locked(&payload_lock));
     unregister_virtual_region(&data->region);
-    list_del(&data->list);
+    list_del_rcu(&data->list);
+    rcu_barrier();
     payload_cnt--;
     payload_version++;
     free_payload_data(data);
@@ -1172,7 +1166,7 @@ static int livepatch_upload(struct xen_sysctl_livepatch_upload *upload)
         INIT_LIST_HEAD(&data->applied_list);
 
         register_virtual_region(&data->region);
-        list_add_tail(&data->list, &payload_list);
+        list_add_tail_rcu(&data->list, &payload_list);
         payload_cnt++;
         payload_version++;
     }
@@ -1383,11 +1377,7 @@ static int apply_payload(struct payload *data)
 
 static inline void apply_payload_tail(struct payload *data)
 {
-    /*
-     * We need RCU variant (which has barriers) in case we crash here.
-     * The applied_list is iterated by the trap code.
-     */
-    list_add_tail_rcu(&data->applied_list, &applied_list);
+    list_add_tail(&data->applied_list, &applied_list);
 
     data->state = LIVEPATCH_STATE_APPLIED;
 }
@@ -1427,12 +1417,7 @@ static int revert_payload(struct payload *data)
 
 static inline void revert_payload_tail(struct payload *data)
 {
-
-    /*
-     * We need RCU variant (which has barriers) in case we crash here.
-     * The applied_list is iterated by the trap code.
-     */
-    list_del_rcu(&data->applied_list);
+    list_del(&data->applied_list);
 
     data->reverted = true;
     data->state = LIVEPATCH_STATE_CHECKED;
-- 
2.44.0


