Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329BE9023F5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 16:21:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737300.1143562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftL-0000ye-M1; Mon, 10 Jun 2024 14:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737300.1143562; Mon, 10 Jun 2024 14:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftL-0000wy-Iv; Mon, 10 Jun 2024 14:20:59 +0000
Received: by outflank-mailman (input) for mailman id 737300;
 Mon, 10 Jun 2024 14:20:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ow3=NM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGftK-0008MI-O1
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 14:20:58 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6f335bc-2734-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 16:20:57 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-7952b60b4d7so300652285a.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 07:20:57 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b0822399ccsm6739426d6.123.2024.06.10.07.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 07:20:55 -0700 (PDT)
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
X-Inumbo-ID: a6f335bc-2734-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718029255; x=1718634055; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGTwxJouy4hdHEkmRULV0M0hn4a97amWG2LKmAA4/LI=;
        b=gdPTr4yNpyzE5fZUnwiRORL5A1efOheLMHHR0UTvaLk9Ph0eCTVj/Z/WqhFkfubKrD
         aluOFtmfm0P9hP7rvGy//Rwqq4pjVK/S8F1SKTwWf9ZEhUV2zpBNyA4VaXJTYHID1CJB
         sXzOu56ykRSeU4qSAmYNbV8gPvS/mGUc1mxvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718029255; x=1718634055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGTwxJouy4hdHEkmRULV0M0hn4a97amWG2LKmAA4/LI=;
        b=ndv6p356hElMnpJE/XKF9pC53yvbGjBEc/0tL2ch23rybEc3Sk+i50DrUZCExHwOtI
         17OK9OKuSrG4XvgttLcsl6UTyqWyD5KVyQtFzme6XOr5UmVkXfduK8ryPfxzrLj4aS9k
         DeaXfW0U0SKtFmLhjVoCV+uUpArX9OiNAcZuYjMWxx3s7L6xro5brSiTLAmNx6xBQZM4
         joKUgJSH31zrz94HFlzXguRTavbkXVcxl8fpz3E7hHvidOla7mPssT/9iGxD+TmWqkkl
         O/qDv30UU4DNFUV+bgp0a6nMDVQm+bk3wOR2wc6oT3B5hKEjGjR/kdtP9AntbO+1HfT6
         srVQ==
X-Gm-Message-State: AOJu0Yx9wtC9F5aWJKcgH0Lx2RD0wnjvBax8q7/kGmFVdjAqZHw8VVfj
	HgYCf7uBl6adFnbt68H88XT6IXWq3uxte6hFpFWj4yx6fbwEyh6LbCwrrmOGgprvmVp75f2cH0C
	D
X-Google-Smtp-Source: AGHT+IFxyBZcjImT23c50YxZ3XhRQ3nOFbdcVSIf3HtTe5DOm8honhk2yNmjD3TfewFRcmiHX1JqGA==
X-Received: by 2002:a05:6214:4520:b0:6af:2344:5811 with SMTP id 6a1803df08f44-6b059f93d58mr116646196d6.55.1718029255616;
        Mon, 10 Jun 2024 07:20:55 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 4/7] x86/irq: restrict CPU movement in set_desc_affinity()
Date: Mon, 10 Jun 2024 16:20:40 +0200
Message-ID: <20240610142043.11924-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240610142043.11924-1-roger.pau@citrix.com>
References: <20240610142043.11924-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If external interrupts are using logical mode it's possible to have an overlap
between the current ->arch.cpu_mask and the provided mask (or TARGET_CPUS).  If
that's the case avoid assigning a new vector and just move the interrupt to a
member of ->arch.cpu_mask that overlaps with the provided mask and is online.

While there also add an extra assert to ensure the mask containing the possible
destinations is not empty before calling cpu_mask_to_apicid(), as at that point
having an empty mask is not expected.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 263e502bc0f6..306e7756112f 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -837,19 +837,38 @@ void cf_check irq_complete_move(struct irq_desc *desc)
 
 unsigned int set_desc_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
-    int ret;
-    unsigned long flags;
     cpumask_t dest_mask;
 
     if ( mask && !cpumask_intersects(mask, &cpu_online_map) )
         return BAD_APICID;
 
-    spin_lock_irqsave(&vector_lock, flags);
-    ret = _assign_irq_vector(desc, mask ?: TARGET_CPUS);
-    spin_unlock_irqrestore(&vector_lock, flags);
+    /*
+     * mask input set can contain CPUs that are not online.  To decide whether
+     * the interrupt needs to be migrated restrict the input mask to the CPUs
+     * that are online.
+     */
+    if ( mask )
+        cpumask_and(&dest_mask, mask, &cpu_online_map);
+    else
+        cpumask_copy(&dest_mask, TARGET_CPUS);
 
-    if ( ret < 0 )
-        return BAD_APICID;
+    /*
+     * Only move the interrupt if there are no CPUs left in ->arch.cpu_mask
+     * that can handle it, otherwise just shuffle it around ->arch.cpu_mask
+     * to an available destination.
+     */
+    if ( !cpumask_intersects(desc->arch.cpu_mask, &dest_mask) )
+    {
+        int ret;
+        unsigned long flags;
+
+        spin_lock_irqsave(&vector_lock, flags);
+        ret = _assign_irq_vector(desc, mask ?: TARGET_CPUS);
+        spin_unlock_irqrestore(&vector_lock, flags);
+
+        if ( ret < 0 )
+            return BAD_APICID;
+    }
 
     if ( mask )
     {
@@ -862,6 +881,7 @@ unsigned int set_desc_affinity(struct irq_desc *desc, const cpumask_t *mask)
         cpumask_copy(&dest_mask, desc->arch.cpu_mask);
     }
     cpumask_and(&dest_mask, &dest_mask, &cpu_online_map);
+    ASSERT(!cpumask_empty(&dest_mask));
 
     return cpu_mask_to_apicid(&dest_mask);
 }
-- 
2.44.0


