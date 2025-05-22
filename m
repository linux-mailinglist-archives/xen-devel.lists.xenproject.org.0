Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844FBAC184B
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994745.1377577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiQ-0000nN-PD; Thu, 22 May 2025 23:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994745.1377577; Thu, 22 May 2025 23:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiQ-0000je-JX; Thu, 22 May 2025 23:52:46 +0000
Received: by outflank-mailman (input) for mailman id 994745;
 Thu, 22 May 2025 23:52:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m1py=YG=flex--seanjc.bounces.google.com=3yrgvaAYKCUMxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@srs-se1.protection.inumbo.net>)
 id 1uIFiO-0007r8-Rz
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:52:44 +0000
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [2607:f8b0:4864:20::549])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da6b248c-3767-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 01:52:44 +0200 (CEST)
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-b26db9af463so7984317a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 16:52:44 -0700 (PDT)
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
X-Inumbo-ID: da6b248c-3767-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957963; x=1748562763; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LLDErP7lwjTldw1/pS35D8l5zAYowrsUowCS37TMy6E=;
        b=4Z9HlAh0tIAtkeGWx2MKYDQeKydD6nTNydX7x10wNJMA00pbuOzz6ENBFpM85VhCmQ
         r6o8aje4oIo0pSJKXY0Z9nJzDgaVXalyJxcfnmN0q0qslADmp26OVxyuJ5nXsQk4wtnG
         fP2nGZJmCRzEzrHT3mXelUVWF2l9AmhHtJXLlhrC6ZYNq+In/z6iVECUW2ht2Hjka9re
         REbPLCQWAOtMe0ndDarvjbZwlI6HEFQ7rGpnzwwb9NFtYu5f7JdXszi7ZMYcE7y2GiPz
         uqNDTR6TFED8fjOUVWq35jTo30rvHnP4fWkHYYTBf6SQ/m59cCM6lG4qNDhlfl+02bQA
         Ev4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957963; x=1748562763;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LLDErP7lwjTldw1/pS35D8l5zAYowrsUowCS37TMy6E=;
        b=h7t+bDUeVP6cffMOW6e/NYYFGW05EpuHxzdTA6E4fkbN19rTxZXNlGMHof9WabT5zs
         yZTkO/cT0tj4EfkjsjcKIPYtXsuHV/roJ2XDmQzOTQJXMq7qFzPOgLeZ4BZVzavXyZnQ
         gfqYoPmkezJxJdQQ5oBJubewhb9IzuE86kTjxoy4TXEUz8xI/sVMvOkLqRR9qPendpfM
         gMnuFrIgjY+5P6nqCVp3s6eCfhonIKihfwdazyu3fr9pHVvfFZtWJuE1BcXV//RzBnJG
         24L7FrmGTKEYzU5rXVhgxt52CwK18gMZysWgaoCxfLWzfk0cs8FIfoQTnZChY6+i4ZWx
         30fA==
X-Forwarded-Encrypted: i=1; AJvYcCWoznDIyUEmGGyWWuafqJlAvO4LE/UFGvtrVvpiHPpVKCHtzCEsHWU+bPZTz8rDgCVaybVn3tCIlv4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQ/uytPyI5dunC0cfvq/nvdIYzYKx91lJ3qtk6XXPcYi429SRi
	pDBMJBh5P0seY/qb+BByb9RNNfY7/1YTycHtxt4Me/0rMdiNIcgX4FEZcj2nNqJZfBnXyNjPbFf
	vvYSylQ==
X-Google-Smtp-Source: AGHT+IHOq6Cu35CTphJBsObc11lhP6kmwx8FMCg+YC2dNqr/wE8KG8ou9486KEEIS+EkPDFQhABlYWoiNSA=
X-Received: from plhi16.prod.google.com ([2002:a17:903:2ed0:b0:22e:4a61:5545])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e808:b0:22e:3c2:d477
 with SMTP id d9443c01a7336-233f21ae905mr11694945ad.25.1747957962830; Thu, 22
 May 2025 16:52:42 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:15 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-6-seanjc@google.com>
Subject: [PATCH v3 05/13] KVM: Add irqfd to eventfd's waitqueue while holding irqfds.lock
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

Add an irqfd to its target eventfd's waitqueue while holding irqfds.lock,
which is mildly terrifying but functionally safe.  irqfds.lock is taken
inside the waitqueue's lock, but if and only if the eventfd is being
released, i.e. that path is mutually exclusive with registration as KVM
holds a reference to the eventfd (and obviously must do so to avoid UAF).

This will allow using the eventfd's waitqueue to enforce KVM's requirement
that eventfd is assigned to at most one irqfd, without introducing races.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 99274d60335d..04877b297267 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -204,6 +204,11 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
 	int ret = 0;
 
 	if (flags & EPOLLIN) {
+		/*
+		 * WARNING: Do NOT take irqfds.lock in any path except EPOLLHUP,
+		 * as KVM holds irqfds.lock when registering the irqfd with the
+		 * eventfd.
+		 */
 		u64 cnt;
 		eventfd_ctx_do_read(irqfd->eventfd, &cnt);
 
@@ -225,6 +230,11 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
 		/* The eventfd is closing, detach from KVM */
 		unsigned long iflags;
 
+		/*
+		 * Taking irqfds.lock is safe here, as KVM holds a reference to
+		 * the eventfd when registering the irqfd, i.e. this path can't
+		 * be reached while kvm_irqfd_add() is running.
+		 */
 		spin_lock_irqsave(&kvm->irqfds.lock, iflags);
 
 		/*
@@ -296,16 +306,21 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 
 	list_add_tail(&irqfd->list, &kvm->irqfds.items);
 
-	spin_unlock_irq(&kvm->irqfds.lock);
-
 	/*
 	 * Add the irqfd as a priority waiter on the eventfd, with a custom
 	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
-	 * underlying eventfd is signaled.
+	 * underlying eventfd is signaled.  Temporarily lie to lockdep about
+	 * holding irqfds.lock to avoid a false positive regarding potential
+	 * deadlock with irqfd_wakeup() (see irqfd_wakeup() for details).
 	 */
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
 
+	spin_release(&kvm->irqfds.lock.dep_map, _RET_IP_);
 	add_wait_queue_priority(wqh, &irqfd->wait);
+	spin_acquire(&kvm->irqfds.lock.dep_map, 0, 0, _RET_IP_);
+
+	spin_unlock_irq(&kvm->irqfds.lock);
+
 	p->ret = 0;
 }
 
-- 
2.49.0.1151.ga128411c76-goog


