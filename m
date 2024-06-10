Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A279023F3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 16:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737298.1143538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftH-0000JC-9d; Mon, 10 Jun 2024 14:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737298.1143538; Mon, 10 Jun 2024 14:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGftH-0000CU-6M; Mon, 10 Jun 2024 14:20:55 +0000
Received: by outflank-mailman (input) for mailman id 737298;
 Mon, 10 Jun 2024 14:20:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ow3=NM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sGftF-00007Q-DN
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 14:20:53 +0000
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [2607:f8b0:4864:20::1135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4542401-2734-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 16:20:52 +0200 (CEST)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-62cf4d32dceso296927b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 07:20:52 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b07b4b999csm12151576d6.63.2024.06.10.07.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 07:20:50 -0700 (PDT)
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
X-Inumbo-ID: a4542401-2734-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718029251; x=1718634051; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DO8Ho59BP8Cja4wQL980lT7rQ+BqnpHm8XHoOOnAnmY=;
        b=BgIP2REMw6cxRnkppT294rIeiTMVH57PORLjt6+oxx5ictq+LSLyFEr+g8rlq+MvME
         RsMOIYregntOZMHwtjgMIBq24z7otUeL9K+PDWOOPNX+U3Z68Y4cRfcMkhLImCAW5INw
         1zmFxCC0KcrOVtsFmsu+FPeFwJNdS2DKnhR/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718029251; x=1718634051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO8Ho59BP8Cja4wQL980lT7rQ+BqnpHm8XHoOOnAnmY=;
        b=NEyOjF/nOa78oNfx+amOXQak2lWnKH+eD+IL9AI/3uKm/Xwwom7pTCgMVZw222QUD9
         zQ6xhZVKhhN1iW4V3ujl3Kyp6+4wGotq3gHpndZsTe5ahDEmP+c+6/etsiuMysyoTFR+
         g8QyXF/3kH1g1JcQHwPoo7Dq0BVlm53kc7nJcF1qwPeA/3kZhYKHw5Tgt7uQMxbPx2CQ
         XsyZPXDoBvs2lgPSyvKV3FMeyW7hUOX6nANC+jAAGtAdNfbveqf6frK+15kLRTPj8GXn
         4ykHYMzuYSqm0vocs+wkwY8xNdgGFSU1mKwdP2Gf9rjydYApTYMNyFquynV66XhlNMpw
         TGgw==
X-Gm-Message-State: AOJu0YypvDd6RBsaHZ5aw7u9pJwOqQKTHndjbtwPKYLI4hRkjfNchcmk
	fnIcJ7pBETNJmnA4I9DG4HdELbqmAqWvIHZOYDqUoaf5dq/Zd5JzerLVf3IjcPQJeceqbyE7rV7
	u
X-Google-Smtp-Source: AGHT+IEoMYN3SXv7692z9fWNkS/rCmIyG+AjwRjuRyQB6tQ2K4ivPZvs/F+EjKLE4LDTVnXU8Z9psw==
X-Received: by 2002:a0d:cb0a:0:b0:61e:a3a:2538 with SMTP id 00721157ae682-62cd55d157emr87669307b3.18.1718029251068;
        Mon, 10 Jun 2024 07:20:51 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/7] x86/irq: describe how the interrupt CPU movement works
Date: Mon, 10 Jun 2024 16:20:38 +0200
Message-ID: <20240610142043.11924-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240610142043.11924-1-roger.pau@citrix.com>
References: <20240610142043.11924-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The logic to move interrupts across CPUs is complex, attempt to provide a
comment that describes the expected behavior so users of the interrupt system
have more context about the usage of the arch_irq_desc structure fields.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Mention the logic involved in IRQ_MOVE_PENDING and the reduction of
   old_cpu_mask.
---
 xen/arch/x86/include/asm/irq.h | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 413994d2133b..94f634ce10a1 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -28,6 +28,44 @@ typedef struct {
 
 struct irq_desc;
 
+/*
+ * Xen logic for moving interrupts around CPUs allows manipulating interrupts
+ * that target remote CPUs.  The logic to move an interrupt from CPU(s) is as
+ * follows:
+ *
+ * 1. irq_set_affinity() is called with the new destination mask, such mask is
+ *    copied into pending_mask and IRQ_MOVE_PENDING is set in status to notice
+ *    an affinity change has been requested.
+ * 2. An interrupt acked with the IRQ_MOVE_PENDING will trigger the logic to
+ *    migrate it to a destination in pending_mask as long as the mask contains
+ *    any online CPUs.
+ * 3. cpu_mask and vector is copied to old_cpu_mask and old_vector.
+ * 4. New cpu_mask and vector are set, vector is setup at the new destination.
+ * 5. move_in_progress is set.
+ * 6. Interrupt source is updated to target new CPU and vector.
+ * 7. Interrupts arriving at old_cpu_mask are processed normally.
+ * 8. When the first interrupt is delivered at the new destination (cpu_mask) as
+ *    part of acking the interrupt the cleanup of the old destination(s) is
+ *    engaged.  move_in_progress is cleared and old_cpu_mask is
+ *    reduced to the online CPUs.  If the result is empty the old vector is
+ *    released.  Otherwise move_cleanup_count is set to the weight of online
+ *    CPUs in old_cpu_mask and IRQ_MOVE_CLEANUP_VECTOR is sent to them.
+ * 9. When receiving IRQ_MOVE_CLEANUP_VECTOR CPUs in old_cpu_mask clean the
+ *    vector entry and decrease the count in move_cleanup_count.  The CPU that
+ *    sets move_cleanup_count to 0 releases the vector.
+ *
+ * Note that when interrupt movement (either move_in_progress or
+ * move_cleanup_count set) is in progress it's not possible to move the
+ * interrupt to yet a different CPU.
+ *
+ * Interrupt movements done by fixup_irqs() skip setting IRQ_MOVE_PENDING and
+ * pending_mask as the movement must be performed right away, and so start
+ * directly from step 3.
+ *
+ * By keeping the vector in the old CPU(s) configured until the interrupt is
+ * acked on the new destination Xen allows draining any pending interrupts at
+ * the old destinations.
+ */
 struct arch_irq_desc {
         s16 vector;                  /* vector itself is only 8 bits, */
         s16 old_vector;              /* but we use -1 for unassigned  */
-- 
2.44.0


