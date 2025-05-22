Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 239C6AC1850
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994744.1377555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiP-0000FL-86; Thu, 22 May 2025 23:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994744.1377555; Thu, 22 May 2025 23:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiP-0000A0-1h; Thu, 22 May 2025 23:52:45 +0000
Received: by outflank-mailman (input) for mailman id 994744;
 Thu, 22 May 2025 23:52:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rzkE=YG=flex--seanjc.bounces.google.com=3ybgvaAYKCUIwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@srs-se1.protection.inumbo.net>)
 id 1uIFiN-0007r8-9m
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:52:43 +0000
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [2607:f8b0:4864:20::54a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9627086-3767-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 01:52:42 +0200 (CEST)
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-b090c7c2c6aso5541503a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 16:52:42 -0700 (PDT)
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
X-Inumbo-ID: d9627086-3767-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957961; x=1748562761; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=f7qvTnT5s0mxP5eCWb+NaTk8UKR3m+k6rkKzLbxKznI=;
        b=d/pYycVGIAw9dOdEkv1ZwdExtSGoDw3+LkySo2/0B3lQ667/oUPDoRbTBkQBqZdLac
         BC72uYdMjf9fdA1wJ0nP8Amu7jG15GhoWm0fODVQEcRDnK4lJwY7VqOTq5eRPzxeC1kT
         ED3UUGN5EBWPgexAd8MgGlQo53I1m7ETxf7GVD3sDeaGY1DB9185ezrFHXff9CKpqD3X
         rAuv/zMS6BZRtMfS95ZPQmco3R3b4c9sUrVW15JG3pyKqw36H7QHf/uJhRsGSsd98QMC
         EBrTfZAZNlina0eH6g3W9EM10dQoJXv+lxGAn4oHYHavBL3M2jl6KTm2i79U6bsANo7+
         oAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957961; x=1748562761;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7qvTnT5s0mxP5eCWb+NaTk8UKR3m+k6rkKzLbxKznI=;
        b=fe9VIcU49zOybkcXPPDSSkNYEDRbOQdPWQJmfKxj2WuOaxdc6Zh1LU385PoIZNAbMh
         syyJd/zu3x1DfuY/eAn1EH6Xqsi9xhpiaYAZ73fsdhW9gjQ2AGwyU7lAMfvbPJEOpQdX
         nxen1jw99nIpKeROQ18UwPo3huO3ulkKGnc2VBM0CZrinyxDudFROFQ9uMvId4BVZEPZ
         nR+3++1r2jyHC1LhS67B5TKhaBBgktZVdgBj3sFP8mp2utwN+l1N8ewJSJAE9q2PZSxv
         OF02DQ1r2in6PgINhPf1u1cW1+MpWkGJXWYworrSDqRxH5M4cfg+MY2Vl786J7FmLJcs
         ko/g==
X-Forwarded-Encrypted: i=1; AJvYcCVbtrjSLR/iFmzfjgta9ASnb9n/J4iBIDYZKXUvSXt1wuHGkVYmvSYfz1aZNbCqqxj63EgahTigkww=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrpxGU2ACbm8ZhBxajLd/LFboO6rf/X61FnRWHNfAfDcugUCb9
	Ry8KqGe6rN+xsg+IK+sdpF+uGJPoAhZKZ5rSvTjbB362l2KYHhdgth0IzGAPIJ1A5JL758eqxn6
	1H3Pixg==
X-Google-Smtp-Source: AGHT+IFhLIWMr3ct7tle+BqkfXynUt92dE5T1Ga0fMI6fA92WD5PFOynQ9QIYOuFaunMobUQi3Ht7v2BK94=
X-Received: from pjbsz13.prod.google.com ([2002:a17:90b:2d4d:b0:30e:7d59:f3a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfc7:b0:301:c5cb:7b13
 with SMTP id 98e67ed59e1d1-30e830c6247mr35762810a91.3.1747957961111; Thu, 22
 May 2025 16:52:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:14 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-5-seanjc@google.com>
Subject: [PATCH v3 04/13] KVM: Add irqfd to KVM's list via the vfs_poll() callback
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

Add the irqfd structure to KVM's list of irqfds in kvm_irqfd_register(),
i.e. via the vfs_poll() callback.  This will allow taking irqfds.lock
across the entire registration sequence (add to waitqueue, add to list),
and more importantly will allow inserting into KVM's list if and only if
adding to the waitqueue succeeds (spoiler alert), without needing to
juggle return codes in weird ways.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 102 +++++++++++++++++++++++++--------------------
 1 file changed, 57 insertions(+), 45 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 8b9a87daa2bb..99274d60335d 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -245,34 +245,14 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
 	return ret;
 }
 
-struct kvm_irqfd_pt {
-	struct kvm_kernel_irqfd *irqfd;
-	poll_table pt;
-};
-
-static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
-			       poll_table *pt)
-{
-	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
-	struct kvm_kernel_irqfd *irqfd = p->irqfd;
-
-	/*
-	 * Add the irqfd as a priority waiter on the eventfd, with a custom
-	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
-	 * underlying eventfd is signaled.
-	 */
-	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
-
-	add_wait_queue_priority(wqh, &irqfd->wait);
-}
-
-/* Must be called under irqfds.lock */
 static void irqfd_update(struct kvm *kvm, struct kvm_kernel_irqfd *irqfd)
 {
 	struct kvm_kernel_irq_routing_entry *e;
 	struct kvm_kernel_irq_routing_entry entries[KVM_NR_IRQCHIPS];
 	int n_entries;
 
+	lockdep_assert_held(&kvm->irqfds.lock);
+
 	n_entries = kvm_irq_map_gsi(kvm, entries, irqfd->gsi);
 
 	write_seqcount_begin(&irqfd->irq_entry_sc);
@@ -286,6 +266,49 @@ static void irqfd_update(struct kvm *kvm, struct kvm_kernel_irqfd *irqfd)
 	write_seqcount_end(&irqfd->irq_entry_sc);
 }
 
+struct kvm_irqfd_pt {
+	struct kvm_kernel_irqfd *irqfd;
+	struct kvm *kvm;
+	poll_table pt;
+	int ret;
+};
+
+static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
+			       poll_table *pt)
+{
+	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
+	struct kvm_kernel_irqfd *irqfd = p->irqfd;
+	struct kvm_kernel_irqfd *tmp;
+	struct kvm *kvm = p->kvm;
+
+	spin_lock_irq(&kvm->irqfds.lock);
+
+	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
+		if (irqfd->eventfd != tmp->eventfd)
+			continue;
+		/* This fd is used for another irq already. */
+		p->ret = -EBUSY;
+		spin_unlock_irq(&kvm->irqfds.lock);
+		return;
+	}
+
+	irqfd_update(kvm, irqfd);
+
+	list_add_tail(&irqfd->list, &kvm->irqfds.items);
+
+	spin_unlock_irq(&kvm->irqfds.lock);
+
+	/*
+	 * Add the irqfd as a priority waiter on the eventfd, with a custom
+	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
+	 * underlying eventfd is signaled.
+	 */
+	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
+
+	add_wait_queue_priority(wqh, &irqfd->wait);
+	p->ret = 0;
+}
+
 #if IS_ENABLED(CONFIG_HAVE_KVM_IRQ_BYPASS)
 void __attribute__((weak)) kvm_arch_irq_bypass_stop(
 				struct irq_bypass_consumer *cons)
@@ -315,7 +338,7 @@ bool __attribute__((weak)) kvm_arch_irqfd_route_changed(
 static int
 kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 {
-	struct kvm_kernel_irqfd *irqfd, *tmp;
+	struct kvm_kernel_irqfd *irqfd;
 	struct eventfd_ctx *eventfd = NULL, *resamplefd = NULL;
 	struct kvm_irqfd_pt irqfd_pt;
 	int ret;
@@ -414,32 +437,22 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	 */
 	idx = srcu_read_lock(&kvm->irq_srcu);
 
-	spin_lock_irq(&kvm->irqfds.lock);
-
-	ret = 0;
-	list_for_each_entry(tmp, &kvm->irqfds.items, list) {
-		if (irqfd->eventfd != tmp->eventfd)
-			continue;
-		/* This fd is used for another irq already. */
-		ret = -EBUSY;
-		goto fail_duplicate;
-	}
-
-	irqfd_update(kvm, irqfd);
-
-	list_add_tail(&irqfd->list, &kvm->irqfds.items);
-
-	spin_unlock_irq(&kvm->irqfds.lock);
-
 	/*
-	 * Register the irqfd with the eventfd by polling on the eventfd.  If
-	 * there was en event pending on the eventfd prior to registering,
-	 * manually trigger IRQ injection.
+	 * Register the irqfd with the eventfd by polling on the eventfd, and
+	 * simultaneously and the irqfd to KVM's list.  If there was en event
+	 * pending on the eventfd prior to registering, manually trigger IRQ
+	 * injection.
 	 */
 	irqfd_pt.irqfd = irqfd;
+	irqfd_pt.kvm = kvm;
 	init_poll_funcptr(&irqfd_pt.pt, kvm_irqfd_register);
 
 	events = vfs_poll(fd_file(f), &irqfd_pt.pt);
+
+	ret = irqfd_pt.ret;
+	if (ret)
+		goto fail_poll;
+
 	if (events & EPOLLIN)
 		schedule_work(&irqfd->inject);
 
@@ -460,8 +473,7 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	srcu_read_unlock(&kvm->irq_srcu, idx);
 	return 0;
 
-fail_duplicate:
-	spin_unlock_irq(&kvm->irqfds.lock);
+fail_poll:
 	srcu_read_unlock(&kvm->irq_srcu, idx);
 fail:
 	if (irqfd->resampler)
-- 
2.49.0.1151.ga128411c76-goog


