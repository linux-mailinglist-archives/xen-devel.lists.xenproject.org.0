Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F9CAC184A
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994750.1377608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiW-0001k0-1P; Thu, 22 May 2025 23:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994750.1377608; Thu, 22 May 2025 23:52:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiV-0001gU-Pv; Thu, 22 May 2025 23:52:51 +0000
Received: by outflank-mailman (input) for mailman id 994750;
 Thu, 22 May 2025 23:52:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aH/H=YG=flex--seanjc.bounces.google.com=3z7gvaAYKCUg2okxtmqyyqvo.myw7ox-no5ovvs232.7oxz1ytom3.y1q@srs-se1.protection.inumbo.net>)
 id 1uIFiT-0007r8-Vp
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:52:49 +0000
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [2607:f8b0:4864:20::549])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd5eaf73-3767-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 01:52:49 +0200 (CEST)
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-b0e0c573531so5862164a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 16:52:49 -0700 (PDT)
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
X-Inumbo-ID: dd5eaf73-3767-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957968; x=1748562768; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=vuHVtgMNklQ3DNdNkMUrgN1tyOO7CrPEj2V6DIP2LQI=;
        b=z1FOj35cJ/Nz/F/qzEhCbePRqrmWrwKSN5oFtorPj3GY9LLhQUr7hC4vrnCpAeSbST
         6ZcmhYxpV8PFOLiC5q9UnDP8t9Zes2+vd06LVXe0plWzphnCPgSMWj8GXwBRUxxwT/+h
         aARKadhL/W9/v7ZxSc//6jLy5MIVZeEdJoR7D5cGkt8QVRh6c7xipG9IANc/TgVevYWz
         kD1cXuWk2R72RUMu4GPyZ0d63qaw5/X+yNinBJGOEZ1jchoaZLyRCPOjGtz7Y8CPTdcd
         AItQbcaAzWPdwEIf5THA9eRvYXHfY7YFGhbGvNaIc1ttPBBvRJn9idwdYdqyEOjWzNEt
         ZVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957968; x=1748562768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vuHVtgMNklQ3DNdNkMUrgN1tyOO7CrPEj2V6DIP2LQI=;
        b=Jw5AChvUXGZB9obxXd+wPoY/m2Dp/znCXxsbSwS7TXKq4DNpQikOJKOlUHlMnKi3ge
         CRSk7AKAl1+FstNW1rt/L65APsaISS84HEh3D61r0KRDgc9ra/Nd/KX3I+1LYzKMYqcz
         4MahdzgxewEuL52H4fvkc3VwoBhJBCg36DQb9LaNSAMHFPDiDDh2Lhi6q2r5lXY5VSxh
         Qe0dAouSvmam82fjhfmjTi/U+x5yHIFwljWDZq/+0eQTKArywU//+ZYMZTEqGJjrOLoW
         1E/7VwE1+5ajlArvJ71DcF2+yTvfyEsEsGgAJAysTXIxDS2UsH4QOl4GL8pehL1wthvR
         UG/w==
X-Forwarded-Encrypted: i=1; AJvYcCWThNiX+b6eG45BmP4ZNaJnvMBpQ0uChncwWU8fN3Li6BjjN69LaG7sCpfTY873Jjs+gttA6Fjd0JY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyg2ezylpXLOn+CdiKrQyxi6YooupFlDGtuRncN4guCY1Nf5mAa
	zlErvj/7xRnLhmhskjriJZN+4kwOqxI6H9J5onZoE1NMrrrnHJXO45nAQsunZ4exDuqmtquUyuv
	5q5wSGg==
X-Google-Smtp-Source: AGHT+IHikqs98z49j0Kkg2uX1c0LCZJ4TnpoZgPhfD1i2QFTska6FVqOIcx30KNoejfw/K9L53iBDs4oCi4=
X-Received: from pga7.prod.google.com ([2002:a05:6a02:4f87:b0:b26:e751:bb70])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:faf:b0:223:62f5:fd44
 with SMTP id d9443c01a7336-231d459a467mr365010445ad.40.1747957967798; Thu, 22
 May 2025 16:52:47 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:18 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-9-seanjc@google.com>
Subject: [PATCH v3 08/13] sched/wait: Add a waitqueue helper for fully
 exclusive priority waiters
From: Sean Christopherson <seanjc@google.com>
To: "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, 
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, K Prateek Nayak <kprateek.nayak@amd.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a waitqueue helper to add a priority waiter that requires exclusive
wakeups, i.e. that requires that it be the _only_ priority waiter.  The
API will be used by KVM to ensure that at most one of KVM's irqfds is
bound to a single eventfd (across the entire kernel).

Open code the helper instead of using __add_wait_queue() so that the
common path doesn't need to "handle" impossible failures.

Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/wait.h |  2 ++
 kernel/sched/wait.c  | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 965a19809c7e..09855d819418 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -164,6 +164,8 @@ static inline bool wq_has_sleeper(struct wait_queue_head *wq_head)
 extern void add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
 extern void add_wait_queue_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
 extern void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
+extern int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
+					     struct wait_queue_entry *wq_entry);
 extern void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
 
 static inline void __add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index 4ab3ab195277..15632c89c4f2 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -47,6 +47,24 @@ void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_
 }
 EXPORT_SYMBOL_GPL(add_wait_queue_priority);
 
+int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
+				      struct wait_queue_entry *wq_entry)
+{
+	struct list_head *head = &wq_head->head;
+
+	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
+
+	guard(spinlock_irqsave)(&wq_head->lock);
+
+	if (!list_empty(head) &&
+	    (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
+		return -EBUSY;
+
+	list_add(&wq_entry->entry, head);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(add_wait_queue_priority_exclusive);
+
 void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
 {
 	unsigned long flags;
-- 
2.49.0.1151.ga128411c76-goog


