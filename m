Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB867FF1D0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644746.1006183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8i4C-0004ra-QL; Thu, 30 Nov 2023 14:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644746.1006183; Thu, 30 Nov 2023 14:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8i4C-0004go-Nf; Thu, 30 Nov 2023 14:31:00 +0000
Received: by outflank-mailman (input) for mailman id 644746;
 Thu, 30 Nov 2023 14:30:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8i4B-0004ZQ-Kg
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:30:59 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1427b2f2-8f8d-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 15:30:58 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c9b8aa4fc7so13200381fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 06:30:58 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c4f0600b0040b3829eb50sm2147422wmq.20.2023.11.30.06.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:30:57 -0800 (PST)
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
X-Inumbo-ID: 1427b2f2-8f8d-11ee-98e4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701354658; x=1701959458; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQRBfy8mxD2fxhjluFNHS4DopwBarTdVQ7BkPng8IXA=;
        b=fLpvoDYL2GeqVCJfPWD6BV5HubfDTFZ/eX1e5FI51hjWxrOjcy2IQ7d4Xr7twO75uv
         Rm69GXTpdgTT9r5WgCpDUBjGWTiva5FzhuK5+BK39kuLzpTdxb81rCq4JxKg37SsmpRp
         eUCrJamRlYPzcMaTuwvVxq5rwGfTWQQScYmcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701354658; x=1701959458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQRBfy8mxD2fxhjluFNHS4DopwBarTdVQ7BkPng8IXA=;
        b=p5qHIeZZaY1zY1sS+HnF/xROFwxwMVcFQZnI8EJaheMdTYJZSDw4y2rjp6HSfmpgFh
         hGJKcKSx4zgr6B+E327QFRwBiT4T9HQSuZDJBDNZ2wKZC+lB2+1tFtIm19t1z1OXm9tA
         DkRvwSbZJ0d/vNVIcK3AwXwDFVAm9tvQM6XrLYzaf77pW69GvyXxKM8oZm8bqYrWIj8M
         MU7dXutkWLMia6wBCEFStS4iENjJQBstWjp38eOhXkZegdcNJekYLzWd6TpwN9yiTL1y
         bQ757U9PtpTF5mrnYC/f53J0RC7pk9Wn7zGBhuanFBNiWrXxwEXGa8Nw15bUjxaZp8r7
         Hl/w==
X-Gm-Message-State: AOJu0Yxu0D2O1qte+3d9iIuYLAsm0cC6XluhnghSOXRfTjpqh5D3tvMY
	CQkw7mhJ9WBOsloIkBMB23m3L7reJcBmWH4pAZ8=
X-Google-Smtp-Source: AGHT+IHE30j/1wq34RhYhglOCCZK2jwlEJyT0jRNofnQ19p5C9uTjAO/znofEM90kRWHMPbDis9o0w==
X-Received: by 2002:a2e:7804:0:b0:2c9:af4f:4ca9 with SMTP id t4-20020a2e7804000000b002c9af4f4ca9mr6677816ljc.13.1701354657965;
        Thu, 30 Nov 2023 06:30:57 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 2/5] xen/livepatch: search for symbols in all loaded payloads
Date: Thu, 30 Nov 2023 15:29:41 +0100
Message-ID: <20231130142944.46322-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130142944.46322-1-roger.pau@citrix.com>
References: <20231130142944.46322-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When checking if an address belongs to a patch, or when resolving a symbol,
take into account all loaded livepatch payloads, even if not applied.

This is required in order for the pre-apply and post-revert hooks to work
properly, or else Xen won't detect the intruction pointer belonging to those
hooks as being part of the currently active text.

Move the RCU handling to be used for payload_list instead of applied_list, as
now the calls from trap code will iterate over the payload_list.

Fixes: 8313c864fa95 ('livepatch: Implement pre-|post- apply|revert hooks')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/livepatch.c | 49 +++++++++++++++---------------------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 3199432f11f5..4e775be66571 100644
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
@@ -1074,7 +1067,8 @@ static void free_payload(struct payload *data)
 {
     ASSERT(spin_is_locked(&payload_lock));
     unregister_virtual_region(&data->region);
-    list_del(&data->list);
+    list_del_rcu(&data->list);
+    rcu_barrier();
     payload_cnt--;
     payload_version++;
     free_payload_data(data);
@@ -1173,7 +1167,7 @@ static int livepatch_upload(struct xen_sysctl_livepatch_upload *upload)
         INIT_LIST_HEAD(&data->list);
         INIT_LIST_HEAD(&data->applied_list);
 
-        list_add_tail(&data->list, &payload_list);
+        list_add_tail_rcu(&data->list, &payload_list);
         payload_cnt++;
         payload_version++;
     }
@@ -1384,11 +1378,7 @@ static int apply_payload(struct payload *data)
 
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
@@ -1428,12 +1418,7 @@ static int revert_payload(struct payload *data)
 
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
2.43.0


