Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE74868EBB
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 12:25:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686018.1067549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revaj-0007og-LV; Tue, 27 Feb 2024 11:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686018.1067549; Tue, 27 Feb 2024 11:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1revaj-0007mH-Ib; Tue, 27 Feb 2024 11:25:45 +0000
Received: by outflank-mailman (input) for mailman id 686018;
 Tue, 27 Feb 2024 11:25:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gEZ=KE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1revai-0007l8-83
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 11:25:44 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0a095c5-d562-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 12:25:41 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5101cd91017so6097290e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 03:25:41 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 ow34-20020a05620a822200b00783f8693df1sm3495000qkn.37.2024.02.27.03.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 03:25:40 -0800 (PST)
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
X-Inumbo-ID: f0a095c5-d562-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709033141; x=1709637941; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbRmLbHcypo3JwhtnaEO0O2QVQTm0Ebx3zCXiOOR5V4=;
        b=c3GlLnhuurlM5WjFBDmPEqJWlVF8ym2CfaFqjLPRoDl+7hSVrX/klAj4/4Lc1JMS9L
         tHtvfepIxuGKDZJC+N2hGLvkGU/9AgF4yC8sCbq2qjBuwh8jaWBQtZw/fdZ8ygzhMMCF
         KEpetiMEQdcH2Kte/IoBlsGsQgUVpYN8SwgQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709033141; x=1709637941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbRmLbHcypo3JwhtnaEO0O2QVQTm0Ebx3zCXiOOR5V4=;
        b=JHyEho1WmQEpza3H/ylJLVsz72AjQ8njhCBpR7kxVELvOQhRvF/bob+g3g1L8NJLRp
         IVSu/5sN8kWgjEwHY1CXff4KnZHO+gdpIM5Hj+TR6Zm6B+yxDCezPnVwmSnYMeQFUEuX
         OzAyG1qTMWYPiq63pqWZQFEcLtab+a793GRCIMRkqWpuOd/wWh+1CaCz8+m3QNcAcnu8
         eLIhv50481G9iiqgpAsnfVKwV5/06wRJ6niI0la1NatK2/ReVobsQjfwouUwrollZ8Vh
         RZwVfhyBLgvTUh/KMMwCpEAaNkg7forGudThc+Fb776gYlVLZwNungtD6Yp/sY1m1LmL
         0tJA==
X-Gm-Message-State: AOJu0YwZIKJ39vp1j5qGtx1ItdsswihkFWu1WEM9+JfAjgooj82NN3u6
	X+bruyDNujcmAm7I1ZJGcWUbvjUSHqtGsATROTfSW0B+9UqfDgTc9oXiep4EkKJBQDGLFQ+++vt
	v
X-Google-Smtp-Source: AGHT+IHPcPdLXOxgviX0WjqxhQH7g/pIM3M7XqU6ugPtHAfWzob4fpoIF5FsyyX+Mazt8klqsRoXZg==
X-Received: by 2002:a19:6405:0:b0:512:acf1:6970 with SMTP id y5-20020a196405000000b00512acf16970mr5150205lfb.35.1709033140736;
        Tue, 27 Feb 2024 03:25:40 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/5] xen/livepatch: register livepatch regions when loaded
Date: Tue, 27 Feb 2024 12:25:24 +0100
Message-ID: <20240227112528.4540-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227112528.4540-1-roger.pau@citrix.com>
References: <20240227112528.4540-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently livepatch regions are registered as virtual regions only after the
livepatch has been applied.

This can lead to issues when using the pre-apply or post-revert hooks, as at
that point the livepatch is not in the virtual regions list.  If a livepatch
pre-apply hook contains a WARN() it would trigger an hypervisor crash, as the
code to handle the bug frame won't be able to find the instruction pointer that
triggered the #UD in any of the registered virtual regions, and hence crash.

Fix this by adding the livepatch payloads as virtual regions as soon as loaded,
and only remove them once the payload is unloaded.  This requires some changes
to the virtual regions code, as the removal of the virtual regions is no longer
done in stop machine context, and hence an RCU barrier is added in order to
make sure there are no users of the virtual region after it's been removed from
the list.

Fixes: 8313c864fa95 ('livepatch: Implement pre-|post- apply|revert hooks')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Add the virtual region in livepatch_upload().
 - Make unregister_virtual_region() depend on CONFIG_LIVEPATCH.
---
 xen/common/livepatch.c      |  4 ++--
 xen/common/virtual_region.c | 42 ++++++++++++++-----------------------
 2 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 2c4b84382798..d7f50e101858 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -1071,6 +1071,7 @@ static int build_symbol_table(struct payload *payload,
 static void free_payload(struct payload *data)
 {
     ASSERT(spin_is_locked(&payload_lock));
+    unregister_virtual_region(&data->region);
     list_del(&data->list);
     payload_cnt--;
     payload_version++;
@@ -1170,6 +1171,7 @@ static int livepatch_upload(struct xen_sysctl_livepatch_upload *upload)
         INIT_LIST_HEAD(&data->list);
         INIT_LIST_HEAD(&data->applied_list);
 
+        register_virtual_region(&data->region);
         list_add_tail(&data->list, &payload_list);
         payload_cnt++;
         payload_version++;
@@ -1386,7 +1388,6 @@ static inline void apply_payload_tail(struct payload *data)
      * The applied_list is iterated by the trap code.
      */
     list_add_tail_rcu(&data->applied_list, &applied_list);
-    register_virtual_region(&data->region);
 
     data->state = LIVEPATCH_STATE_APPLIED;
 }
@@ -1432,7 +1433,6 @@ static inline void revert_payload_tail(struct payload *data)
      * The applied_list is iterated by the trap code.
      */
     list_del_rcu(&data->applied_list);
-    unregister_virtual_region(&data->region);
 
     data->reverted = true;
     data->state = LIVEPATCH_STATE_CHECKED;
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index ddac5c9147e5..e3a4dc8540df 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -23,14 +23,8 @@ static struct virtual_region core_init __initdata = {
 };
 
 /*
- * RCU locking. Additions are done either at startup (when there is only
- * one CPU) or when all CPUs are running without IRQs.
- *
- * Deletions are bit tricky. We do it when Live Patch (all CPUs running
- * without IRQs) or during bootup (when clearing the init).
- *
- * Hence we use list_del_rcu (which sports an memory fence) and a spinlock
- * on deletion.
+ * RCU locking. Modifications to the list must be done in exclusive mode, and
+ * hence need to hold the spinlock.
  *
  * All readers of virtual_region_list MUST use list_for_each_entry_rcu.
  */
@@ -58,41 +52,36 @@ const struct virtual_region *find_text_region(unsigned long addr)
 
 void register_virtual_region(struct virtual_region *r)
 {
-    ASSERT(!local_irq_is_enabled());
+    unsigned long flags;
 
+    spin_lock_irqsave(&virtual_region_lock, flags);
     list_add_tail_rcu(&r->list, &virtual_region_list);
+    spin_unlock_irqrestore(&virtual_region_lock, flags);
 }
 
-static void remove_virtual_region(struct virtual_region *r)
+/*
+ * Suggest inline so when !CONFIG_LIVEPATCH the function is not left
+ * unreachable after init code is removed.
+ */
+static void inline remove_virtual_region(struct virtual_region *r)
 {
     unsigned long flags;
 
     spin_lock_irqsave(&virtual_region_lock, flags);
     list_del_rcu(&r->list);
     spin_unlock_irqrestore(&virtual_region_lock, flags);
-    /*
-     * We do not need to invoke call_rcu.
-     *
-     * This is due to the fact that on the deletion we have made sure
-     * to use spinlocks (to guard against somebody else calling
-     * unregister_virtual_region) and list_deletion spiced with
-     * memory barrier.
-     *
-     * That protects us from corrupting the list as the readers all
-     * use list_for_each_entry_rcu which is safe against concurrent
-     * deletions.
-     */
 }
 
+#ifdef CONFIG_LIVEPATCH
 void unregister_virtual_region(struct virtual_region *r)
 {
-    /* Expected to be called from Live Patch - which has IRQs disabled. */
-    ASSERT(!local_irq_is_enabled());
-
     remove_virtual_region(r);
+
+    /* Assert that no CPU might be using the removed region. */
+    rcu_barrier();
 }
 
-#if defined(CONFIG_LIVEPATCH) && defined(CONFIG_X86)
+#ifdef CONFIG_X86
 void relax_virtual_region_perms(void)
 {
     const struct virtual_region *region;
@@ -117,6 +106,7 @@ void tighten_virtual_region_perms(void)
     rcu_read_unlock(&rcu_virtual_region_lock);
 }
 #endif
+#endif
 
 void __init unregister_init_virtual_region(void)
 {
-- 
2.44.0


