Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A6FAC1846
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994753.1377619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiY-00029e-B1; Thu, 22 May 2025 23:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994753.1377619; Thu, 22 May 2025 23:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiY-00026Z-5G; Thu, 22 May 2025 23:52:54 +0000
Received: by outflank-mailman (input) for mailman id 994753;
 Thu, 22 May 2025 23:52:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h2TN=YG=flex--seanjc.bounces.google.com=30bgvaAYKCUo4qmzvos00sxq.o0y9qz-pq7qxxu454.9qz130vqo5.03s@srs-se1.protection.inumbo.net>)
 id 1uIFiW-0007r8-00
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:52:52 +0000
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [2607:f8b0:4864:20::449])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de6add53-3767-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 01:52:51 +0200 (CEST)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-742d077bdfaso6775833b3a.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 16:52:51 -0700 (PDT)
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
X-Inumbo-ID: de6add53-3767-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957969; x=1748562769; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=m999gU/AqGpWG+L7ciDbK5wL4BJk8SCse59imt7h3LE=;
        b=hsB98DvMK1p82HYlVdLnCcji2tPQ8OoFh2bEdK/16AtowbJoKG9ERQTi4zQTa5F6hy
         DE4n3NKL1rkCfOtNPtAuR7lwqPiaeqyrkzvasoMzdP8b8zLs3qcw/59v0YbEgVTsS+P2
         IqsVFunr8yrfeUf/nMZOnZsT1LRUvQN8PnB7Mx2MtBkpo/l2NMLj0gMIcED6aZh9uMXh
         mVUvCQYe2zhHE5IV6kQkIvBB8lrBJ48qtkV/EpvWGt0KV6l10V+5q6snkPqnDMeGwoOi
         2DwjdAG8dyoGSlpQ9HYqxpGAtskR3YlcAxIMwlYqFxGoVXMMJT1bIIFHnMRAm/eZEtVC
         XVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957969; x=1748562769;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m999gU/AqGpWG+L7ciDbK5wL4BJk8SCse59imt7h3LE=;
        b=vTulvtqjSBjjrowQ7+Nd3cu3BtcMODpaNT/QdTKNfWO9d9QaqgzxqA+2vkBpu6UAjp
         EL0oVpFvftd7ETiMPmp2aGPIS6kOQe0JbbvGTlKMyxzgiWRC5VSnwJRhtSKvsXvZdONg
         xgpZiJl/SkjETeYNjVwB9mOUiDxdQkq4N0AQxjleqWeDs62WZznaureh4p4Akom7TUIt
         EOqXhdwTKKAsWftNHi+nuNVHNg+/geGh1rAm9ZGltv0p78RLB7l0+afP2CY9ADtZwDJg
         k8bXgeRkzGR+QJB3TkASvZyE3Ey4FJzkxt9j2T0bDPd1MNGXFqseU/sXyLRKMT18CvMt
         2/9g==
X-Forwarded-Encrypted: i=1; AJvYcCWlVpA22LZ7B3O8j5eOGQwH3gdAQs8Gcz2oYgqcjiU9XKQYVu2b1Zqq6OBmvUqxV7Lz364a3Z4va7A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzN4u9C1TO88OkuZLpWlx++evAN4u/GoFZpVojxrEB48n6D2uej
	LeWCxm9YIG+Y7upPKA7hvgGB3Wb/wnEw/ZFwmX6PYIZzJl8w1WiqdzTc8EEQL7kXhYeDdjqazGR
	rC30gcg==
X-Google-Smtp-Source: AGHT+IGGw5zwjY0zFLgdg4fHQ7nOB9U/xbrTeYpuWgtfAceUKGlpNANWH4gnTKB5jligEj9ALMrYFDn6jAg=
X-Received: from pfjd1.prod.google.com ([2002:a05:6a00:2441:b0:730:743a:f2b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3c82:b0:742:b3a6:db16
 with SMTP id d2e1a72fcca58-745ed90b8e2mr1286378b3a.20.1747957969447; Thu, 22
 May 2025 16:52:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:19 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-10-seanjc@google.com>
Subject: [PATCH v3 09/13] KVM: Disallow binding multiple irqfds to an eventfd
 with a priority waiter
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

Disallow binding an irqfd to an eventfd that already has a priority waiter,
i.e. to an eventfd that already has an attached irqfd.  KVM always
operates in exclusive mode for EPOLL_IN (unconditionally returns '1'),
i.e. only the first waiter will be notified.

KVM already disallows binding multiple irqfds to an eventfd in a single
VM, but doesn't guard against multiple VMs binding to an eventfd.  Adding
the extra protection reduces the pain of a userspace VMM bug, e.g. if
userspace fails to de-assign before re-assigning when transferring state
for intra-host migration, then the migration will explicitly fail as
opposed to dropping IRQs on the destination VM.

Temporarily keep KVM's manual check on irqfds.items, but add a WARN, e.g.
to allow sanity checking the waitqueue enforcement.

Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 55 +++++++++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 18 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index c7969904637a..7b2e1f858f6d 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -291,38 +291,57 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 	struct kvm_kernel_irqfd *tmp;
 	struct kvm *kvm = p->kvm;
 
+	/*
+	 * Note, irqfds.lock protects the irqfd's irq_entry, i.e. its routing,
+	 * and irqfds.items.  It does NOT protect registering with the eventfd.
+	 */
 	spin_lock_irq(&kvm->irqfds.lock);
 
-	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
-		if (irqfd->eventfd != tmp->eventfd)
-			continue;
-		/* This fd is used for another irq already. */
-		p->ret = -EBUSY;
-		spin_unlock_irq(&kvm->irqfds.lock);
-		return;
-	}
-
+	/*
+	 * Initialize the routing information prior to adding the irqfd to the
+	 * eventfd's waitqueue, as irqfd_wakeup() can be invoked as soon as the
+	 * irqfd is registered.
+	 */
 	irqfd_update(kvm, irqfd);
 
-	list_add_tail(&irqfd->list, &kvm->irqfds.items);
-
 	/*
 	 * Add the irqfd as a priority waiter on the eventfd, with a custom
 	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
-	 * underlying eventfd is signaled.  Temporarily lie to lockdep about
-	 * holding irqfds.lock to avoid a false positive regarding potential
-	 * deadlock with irqfd_wakeup() (see irqfd_wakeup() for details).
+	 * underlying eventfd is signaled.
 	 */
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
 
+	/*
+	 * Temporarily lie to lockdep about holding irqfds.lock to avoid a
+	 * false positive regarding potential deadlock with irqfd_wakeup()
+	 * (see irqfd_wakeup() for details).
+	 *
+	 * Adding to the wait queue will fail if there is already a priority
+	 * waiter, i.e. if the eventfd is associated with another irqfd (in any
+	 * VM).  Note, kvm_irqfd_deassign() waits for all in-flight shutdown
+	 * jobs to complete, i.e. ensures the irqfd has been removed from the
+	 * eventfd's waitqueue before returning to userspace.
+	 */
 	spin_release(&kvm->irqfds.lock.dep_map, _RET_IP_);
-	irqfd->wait.flags |= WQ_FLAG_EXCLUSIVE;
-	add_wait_queue_priority(wqh, &irqfd->wait);
+	p->ret = add_wait_queue_priority_exclusive(wqh, &irqfd->wait);
 	spin_acquire(&kvm->irqfds.lock.dep_map, 0, 0, _RET_IP_);
+	if (p->ret)
+		goto out;
 
+	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
+		if (irqfd->eventfd != tmp->eventfd)
+			continue;
+
+		WARN_ON_ONCE(1);
+		/* This fd is used for another irq already. */
+		p->ret = -EBUSY;
+		goto out;
+	}
+
+	list_add_tail(&irqfd->list, &kvm->irqfds.items);
+
+out:
 	spin_unlock_irq(&kvm->irqfds.lock);
-
-	p->ret = 0;
 }
 
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
-- 
2.49.0.1151.ga128411c76-goog


