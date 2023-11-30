Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC17B7FF1D2
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 15:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644745.1006176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8i4C-0004gM-HN; Thu, 30 Nov 2023 14:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644745.1006176; Thu, 30 Nov 2023 14:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8i4C-0004c2-Bs; Thu, 30 Nov 2023 14:31:00 +0000
Received: by outflank-mailman (input) for mailman id 644745;
 Thu, 30 Nov 2023 14:30:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Jom=HL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r8i4B-0004Xw-Hf
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 14:30:59 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1390815a-8f8d-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 15:30:58 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bc7706520so1480969e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Nov 2023 06:30:58 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 m40-20020a05600c3b2800b004042dbb8925sm5931131wms.38.2023.11.30.06.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:30:56 -0800 (PST)
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
X-Inumbo-ID: 1390815a-8f8d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701354657; x=1701959457; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us5MRK85UaF1YkoiOqLuWe1/EFiuRH9wxTjWYuva1v4=;
        b=nfdtOu6K2LPFfMV9mQs5GKbUkMMYvSDa+qR0LQH5eL7+URjLnBx9aMnWtdgCFubDhI
         /k2EhDVE4Zq8wyDbaTlXVtMcvbkUK4JkY3PBeCyg1b9QHX+Eejkl2/6YOMh+ewzycobL
         80VOxIMiujx9jN+EpVl543cUs1gn3rqE2CMaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701354657; x=1701959457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=us5MRK85UaF1YkoiOqLuWe1/EFiuRH9wxTjWYuva1v4=;
        b=oqq0Y/C/TznlN0mDvRqv0mT4PLQduiPyA0StIUdLmItLkrz6+QKV3Odgl3NR3nRhMD
         pmG/ZpLkA8jqIDzL5/zJnZhSV5xH3oRfSwl26KlPRoELzZlHShJOAl3HBnjMawlfTseZ
         P5wnviKl1O8od2mVQHi4rnWI6aW3Y67JJ5rmh2/fG2nd/p7vKSI1Ymj1TYz/qV/RpTDg
         DRef976HrEPl6GqRnrNXditL/dpZUNaWDhEDN3oTnlTXDDSqT9E5jq1VdoSzqe0MpUp5
         DjWxpfjmB6kUCe88uk9y6pa+l3wNTdPdr6g/aynxpfHSsDc7udKziYzKJb4WcgsONI6N
         Uwrw==
X-Gm-Message-State: AOJu0YyFOMCEqmZHcXEFp4/tA2XJ7zbMo6nI/IxdXwl9U4dqpixsuHk+
	P5CUuRnjpflfbbZP+qBbJkS3hKyUNNqhg6bJrMw=
X-Google-Smtp-Source: AGHT+IHX9mQXwQI70TCAgfsOvIZgxCkfzZx6FLSpP6X1ZlxZNCNPhwvqTzRoHRynHEITwxTynST/4w==
X-Received: by 2002:a2e:a175:0:b0:2c9:bb85:8d45 with SMTP id u21-20020a2ea175000000b002c9bb858d45mr4586305ljl.25.1701354656993;
        Thu, 30 Nov 2023 06:30:56 -0800 (PST)
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
Subject: [PATCH 1/5] xen/livepatch: register livepatch regions when loaded
Date: Thu, 30 Nov 2023 15:29:40 +0100
Message-ID: <20231130142944.46322-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130142944.46322-1-roger.pau@citrix.com>
References: <20231130142944.46322-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently livepatch regions are registered as virtual regions only after the
livepatch has been applied.

This can lead to issues when using the pre-apply or post-revert hooks, as at
the point the livepatch is not in the virtual regions list.  If a livepatch
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
 xen/common/livepatch.c      |  5 +++--
 xen/common/virtual_region.c | 40 +++++++++++--------------------------
 2 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 1209fea2566c..3199432f11f5 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -942,6 +942,8 @@ static int prepare_payload(struct payload *payload,
         }
     }
 
+    register_virtual_region(region);
+
     return 0;
 }
 
@@ -1071,6 +1073,7 @@ static int build_symbol_table(struct payload *payload,
 static void free_payload(struct payload *data)
 {
     ASSERT(spin_is_locked(&payload_lock));
+    unregister_virtual_region(&data->region);
     list_del(&data->list);
     payload_cnt--;
     payload_version++;
@@ -1386,7 +1389,6 @@ static inline void apply_payload_tail(struct payload *data)
      * The applied_list is iterated by the trap code.
      */
     list_add_tail_rcu(&data->applied_list, &applied_list);
-    register_virtual_region(&data->region);
 
     data->state = LIVEPATCH_STATE_APPLIED;
 }
@@ -1432,7 +1434,6 @@ static inline void revert_payload_tail(struct payload *data)
      * The applied_list is iterated by the trap code.
      */
     list_del_rcu(&data->applied_list);
-    unregister_virtual_region(&data->region);
 
     data->reverted = true;
     data->state = LIVEPATCH_STATE_CHECKED;
diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index 5f89703f513b..b444253848cf 100644
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
@@ -58,38 +52,28 @@ const struct virtual_region *find_text_region(unsigned long addr)
 
 void register_virtual_region(struct virtual_region *r)
 {
-    ASSERT(!local_irq_is_enabled());
+    unsigned long flags;
 
+    spin_lock_irqsave(&virtual_region_lock, flags);
     list_add_tail_rcu(&r->list, &virtual_region_list);
+    spin_unlock_irqrestore(&virtual_region_lock, flags);
 }
 
 static void remove_virtual_region(struct virtual_region *r)
 {
-    unsigned long flags;
+     unsigned long flags;
 
-    spin_lock_irqsave(&virtual_region_lock, flags);
-    list_del_rcu(&r->list);
-    spin_unlock_irqrestore(&virtual_region_lock, flags);
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
+     spin_lock_irqsave(&virtual_region_lock, flags);
+     list_del_rcu(&r->list);
+     spin_unlock_irqrestore(&virtual_region_lock, flags);
 }
 
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
 
 #if defined(CONFIG_LIVEPATCH) && defined(CONFIG_X86)
-- 
2.43.0


