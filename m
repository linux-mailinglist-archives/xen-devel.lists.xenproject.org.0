Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854A2AC184C
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994741.1377530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiL-00086P-8A; Thu, 22 May 2025 23:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994741.1377530; Thu, 22 May 2025 23:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiL-00084t-3J; Thu, 22 May 2025 23:52:41 +0000
Received: by outflank-mailman (input) for mailman id 994741;
 Thu, 22 May 2025 23:52:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDJc=YG=flex--seanjc.bounces.google.com=3xLgvaAYKCT0rdZmibfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@srs-se1.protection.inumbo.net>)
 id 1uIFiJ-0007r8-GG
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:52:39 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6642a4a-3767-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 01:52:37 +0200 (CEST)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-30ec5cc994eso4775751a91.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 16:52:37 -0700 (PDT)
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
X-Inumbo-ID: d6642a4a-3767-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957956; x=1748562756; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=fNuJRaVfcGFWhloS77D8uzxF90F27fj3ZGGYCvgzPHs=;
        b=S02NSlmYBHb6e/jE0SOApVE9sJVKrNUnG+JQPBLhpF4CiV7+g68wUE5zeGXKwp5zxp
         SwAhu/WvpLafS6T3cqt6/VsXU8ZAF4lFE4Lohj7FKdJyBD6Ce5HSr9t0mim3dG+dilm4
         99cy6cpu82ixzsmXEzeG27iISFWawFFqI8tUdXwilMdt7om+n3qQw6b0QkthLtzFfiEP
         NwnOIO5wcNKL03OEeELbSAKmQCT9d8pX0oeYZU0dxZz5baeG6tfLzOoBwokEed8eLGCs
         wlZzaI2mw0ZoEenh138vq9on9k+1xzD+aF28XDDfQwhMiLBJfFu5fmXYhwCpcU+UZIDU
         gjmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957956; x=1748562756;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNuJRaVfcGFWhloS77D8uzxF90F27fj3ZGGYCvgzPHs=;
        b=ezNAKSoWom/Yb9gRic13X9ksMF5ci1gSGpBHgJFWIVDqfuAPHZ41reCsTxIq6Muwnd
         KqjupuQsEECD9+C5xtDf/k3A/OsMb0Ez3v/JEDL+OwddT41pjtpH3/6fJ75WElEFg92Z
         kex2FYNWRBp3Pebr5YuXZKH8CeiVrp/TpychmC7iVvTBOAIsqTJh2CJbImhQOyGKS3rV
         hzxSVGtA5YWHAbnuF947hAf+BtUof/ZlGNdHheXAev/topjpia017QTEGTItl4pb6wRX
         g/9DUPa1ebHRZjBukchIQH2tPIZ+09FypVU3DyLH3obLPt4aofUglMy8Vz9NGFHKKJMJ
         vj2w==
X-Forwarded-Encrypted: i=1; AJvYcCXZsfMXzAxx5lyuoRY0Oh0aZ+uDeC9XX99ek4ZCwI/6HhUMkKBR24XUiImQzpRI5kmsWncuM17eVZg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlT6b0Nd94ceg60s/9Rl72xR7O5lmURZTjCagQXfuoPOFBk+0H
	tRFzZw4sR9exjaMsSOEU4R+BkCqKHVzBnE3AZdjlqJrkjKAd/arIS3XzEdDKWW0rujLVs1oY8y7
	5ZdCWhQ==
X-Google-Smtp-Source: AGHT+IHgxAzddO6m+7e1Ux4Efuqi1mCB//KSOWWOaHVhE0t5XleZFmJZnVv1KlYKH2ltYJauaNiIFWTKLOM=
X-Received: from pjbqo12.prod.google.com ([2002:a17:90b:3dcc:b0:2ea:3a1b:f493])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a50:b0:2fa:157e:c790
 with SMTP id 98e67ed59e1d1-30e7d4fe8c3mr35719761a91.5.1747957956077; Thu, 22
 May 2025 16:52:36 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:11 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-2-seanjc@google.com>
Subject: [PATCH v3 01/13] KVM: Use a local struct to do the initial vfs_poll()
 on an irqfd
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

Use a function-local struct for the poll_table passed to vfs_poll(), as
nothing in the vfs_poll() callchain grabs a long-term reference to the
structure, i.e. its lifetime doesn't need to be tied to the irqfd.  Using
a local structure will also allow propagating failures out of the polling
callback without further polluting kvm_kernel_irqfd.

Opportunstically rename irqfd_ptable_queue_proc() to kvm_irqfd_register()
to capture what it actually does.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_irqfd.h |  1 -
 virt/kvm/eventfd.c        | 26 +++++++++++++++++---------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index 8ad43692e3bb..44fd2a20b09e 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -55,7 +55,6 @@ struct kvm_kernel_irqfd {
 	/* Used for setup/shutdown */
 	struct eventfd_ctx *eventfd;
 	struct list_head list;
-	poll_table pt;
 	struct work_struct shutdown;
 	struct irq_bypass_consumer consumer;
 	struct irq_bypass_producer *producer;
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 11e5d1e3f12e..39e42b19d9f7 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -245,12 +245,17 @@ irqfd_wakeup(wait_queue_entry_t *wait, unsigned mode, int sync, void *key)
 	return ret;
 }
 
-static void
-irqfd_ptable_queue_proc(struct file *file, wait_queue_head_t *wqh,
-			poll_table *pt)
+struct kvm_irqfd_pt {
+	struct kvm_kernel_irqfd *irqfd;
+	poll_table pt;
+};
+
+static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
+			       poll_table *pt)
 {
-	struct kvm_kernel_irqfd *irqfd =
-		container_of(pt, struct kvm_kernel_irqfd, pt);
+	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
+	struct kvm_kernel_irqfd *irqfd = p->irqfd;
+
 	add_wait_queue_priority(wqh, &irqfd->wait);
 }
 
@@ -305,6 +310,7 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 {
 	struct kvm_kernel_irqfd *irqfd, *tmp;
 	struct eventfd_ctx *eventfd = NULL, *resamplefd = NULL;
+	struct kvm_irqfd_pt irqfd_pt;
 	int ret;
 	__poll_t events;
 	int idx;
@@ -394,7 +400,6 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	 * a callback whenever someone signals the underlying eventfd
 	 */
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
-	init_poll_funcptr(&irqfd->pt, irqfd_ptable_queue_proc);
 
 	spin_lock_irq(&kvm->irqfds.lock);
 
@@ -416,11 +421,14 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	spin_unlock_irq(&kvm->irqfds.lock);
 
 	/*
-	 * Check if there was an event already pending on the eventfd
-	 * before we registered, and trigger it as if we didn't miss it.
+	 * Register the irqfd with the eventfd by polling on the eventfd.  If
+	 * there was en event pending on the eventfd prior to registering,
+	 * manually trigger IRQ injection.
 	 */
-	events = vfs_poll(fd_file(f), &irqfd->pt);
+	irqfd_pt.irqfd = irqfd;
+	init_poll_funcptr(&irqfd_pt.pt, kvm_irqfd_register);
 
+	events = vfs_poll(fd_file(f), &irqfd_pt.pt);
 	if (events & EPOLLIN)
 		schedule_work(&irqfd->inject);
 
-- 
2.49.0.1151.ga128411c76-goog


