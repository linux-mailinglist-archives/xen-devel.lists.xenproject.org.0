Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A068D327F
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 11:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731691.1137366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCa-0007dL-KZ; Wed, 29 May 2024 09:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731691.1137366; Wed, 29 May 2024 09:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCFCa-0007aB-H9; Wed, 29 May 2024 09:02:32 +0000
Received: by outflank-mailman (input) for mailman id 731691;
 Wed, 29 May 2024 09:02:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJ4/=NA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sCFCZ-0006YK-BK
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 09:02:31 +0000
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [2607:f8b0:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cfd3434-1d9a-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 11:02:29 +0200 (CEST)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3d1bb1c3a88so1045063b6e.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 02:02:29 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-794abcc0f27sm450462085a.31.2024.05.29.02.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 02:02:26 -0700 (PDT)
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
X-Inumbo-ID: 2cfd3434-1d9a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716973347; x=1717578147; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51wZoBHUI8YnkZDZQOJzY42CcaN9TxiSHoaNW33FOv0=;
        b=a9GP9EOSCE9MyHLQzMFUWTVJIFmRByi4NJctgTO6GqhZhTfXgO5XMTfwZT5/AT2Xdy
         wDjWbO+rbibgxjT8Zusy3iO/ntGE33szBsBxE1KxPL2RTqWJBtUSubNOyFFxfipbSZuK
         xVOcrdnzXC4kJmPGjeTktumriXTH+Yb4+Gu4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716973347; x=1717578147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51wZoBHUI8YnkZDZQOJzY42CcaN9TxiSHoaNW33FOv0=;
        b=Os2n9ISTbcGzhLtelnL3KKHgp21fiw8QMjmSZYnpkuTjTgHfZpLH8hHaTdIpM82Lq3
         69g/RXvFwV5oEqVpfmt+CFTQMGnGt4GdjJiUEUW7WkqO33+huXvaaDQGo3T0rFgGUBip
         Fs9y6uo5VfJSDeT48KXgT0w+j1icjRCje1/+7CXcwCibJZ18esNJsD+2ckjFHNm+YduX
         jVjyqUsZb6Ll9t10jo2wuWwNM4hp+8iQF929BFr2fwJhDgDH0+5tYuJyHd1vouzCLWT9
         efJasPt6Xkm9OxKUBI9hY33VoP9MgQmi6gVbZ8rqveh5J7MCrlmCQFap0YRc2g0VENP9
         Hx0Q==
X-Gm-Message-State: AOJu0Yx8whlMjgbDJS3eKrWjsFKwPQU12JK3zG+NXWZMmPcMrqFZOlxI
	8B1A1oe61VtycBgXwLpfI4pTqq/7dljQ7y2vQrkOXEekSg0558mUcwZHi779Sd15K31l+Qx5PIr
	y
X-Google-Smtp-Source: AGHT+IFfACwML2Op18jla+kB7L8l2Ckh1hot8lils5Zo/p1hrUkHo+HwbRRecuy/K1vQlG/qE76xBg==
X-Received: by 2002:a05:6870:a54b:b0:24f:df37:75dc with SMTP id 586e51a60fabf-24fdf383398mr11135367fac.51.1716973347325;
        Wed, 29 May 2024 02:02:27 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH for-4.19 4/9] x86/irq: describe how the interrupt CPU movement works
Date: Wed, 29 May 2024 11:01:26 +0200
Message-ID: <20240529090132.59434-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240529090132.59434-1-roger.pau@citrix.com>
References: <20240529090132.59434-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The logic to move interrupts across CPUs is complex, attempt to provide a
comment that describes the expected behavior so users of the interrupt system
have more context about the usage of the arch_irq_desc structure fields.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/irq.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 413994d2133b..80a3aa7a88b9 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -28,6 +28,32 @@ typedef struct {
 
 struct irq_desc;
 
+/*
+ * Xen logic for moving interrupts around CPUs allows manipulating interrupts
+ * that target remote CPUs.  The logic to move an interrupt from CPU(s) is as
+ * follows:
+ *
+ * 1. cpu_mask and vector is copied to old_cpu_mask and old_vector.
+ * 2. New cpu_mask and vector are set, vector is setup at the new destination.
+ * 3. move_in_progress is set.
+ * 4. Interrupt source is updated to target new CPU and vector.
+ * 5. Interrupts arriving at old_cpu_mask are processed normally.
+ * 6. When an interrupt is delivered at the new destination (cpu_mask) as part
+ *    of acking the interrupt move_in_progress is cleared and move_cleanup_count
+ *    is set to the weight of online CPUs in old_cpu_mask.
+ *    IRQ_MOVE_CLEANUP_VECTOR is sent to all CPUs in old_cpu_mask.
+ * 7. When receiving IRQ_MOVE_CLEANUP_VECTOR CPUs in old_cpu_mask clean the
+ *    vector entry and decrease the count in move_cleanup_count.  The CPU that
+ *    sets move_cleanup_count to 0 releases the vector.
+ *
+ * Note that when interrupt movement (either move_in_progress or
+ * move_cleanup_count set) is in progress it's not possible to move the
+ * interrupt to yet a different CPU.
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


