Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD31AC1853
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994746.1377588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiS-00019H-VB; Thu, 22 May 2025 23:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994746.1377588; Thu, 22 May 2025 23:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiS-000179-S7; Thu, 22 May 2025 23:52:48 +0000
Received: by outflank-mailman (input) for mailman id 994746;
 Thu, 22 May 2025 23:52:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2C6A=YG=flex--seanjc.bounces.google.com=3zLgvaAYKCUUzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@srs-se1.protection.inumbo.net>)
 id 1uIFiR-0007r7-Hw
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:52:47 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db5f549f-3767-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 01:52:45 +0200 (CEST)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-30ebd48a3c7so5673946a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 16:52:45 -0700 (PDT)
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
X-Inumbo-ID: db5f549f-3767-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957964; x=1748562764; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=MSc6nvEfNa3Mk9v70O2GwrdpOydgfEuVH7IGLa1xnl8=;
        b=BN/j17S13O0j8U8TMB/UMTIZnTXHFTHCfSLnIQTLDl+xYGwj6VUI0tQPd89lFP35hW
         PAlHNo4wvvsxmpoZgHbNdA4/H8leSnjA+AF7vcsiKQ03GiTNWyAB5zy1gZUdrIGAd80t
         k9so4UVYWTxUH3PSZsnill7l0acSsbQmiYLAPtPcKRe1l+k/TSJHfyfhg7vXmVOXcZ8I
         ucv33kgs/Z4BpqSMX12mv/gBAb3X0/9SO5GWTBi3OK+Ovq2N2dt76A+VhdfjUByjc6z5
         GZWK1IFw/rYjYNYgsuOZD6jQJq3ie4OMIp43A3O8GP4XlfrK+C7p+bZPYT2M/xnU8tTQ
         ILsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957964; x=1748562764;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSc6nvEfNa3Mk9v70O2GwrdpOydgfEuVH7IGLa1xnl8=;
        b=X517fQJFGl0KEaQ2XQQWdSSNhcuacAVSG7/SeVDlwUDg5Q/vlljgqSGei6tYv9beYI
         MwgTgfNDh1WTzxOaAQc04e/PUcEamQijM9D0faCFDhNgCuNtCjnwvIxzCsyiWNAro4SU
         /nPPl/JLteCQymAxGCpcC8AgxVLLpRU/ojtxdnltOXTY3gF6jW4kzk0qc4/eFCEmNOia
         budMpaPk1n3I4hPEyv0G2NmgeY+OKn7bcI2uvVBSmDUAkgX4ucTP9/Gy2JOSY4SN2Iqj
         oZrn9XzZZLRMs+AjUTZAzy85gxT240uOYLM++Dro9oPHxEZUEGdQiQ4ArEYmDUv2bIyx
         Zq+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6TzH4MdYgtdimx/Yq/QrcUtlhCcs88He4wWxMmWxV2bkUyfxMGH14VK9AUo6AYJOgnbjGjGlXF9A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxREAwsIimhYqejSb6QCD11fpPJPBakjZdI3EH/MUXUErQl5axJ
	BSo8Pj1zZsDKpPXjipvxRj4zaRKSp2Ho/kZior94ndBghGHHYqLOFNf1mDo9bGXYhGRrdd5EGHH
	ZFOO6Xg==
X-Google-Smtp-Source: AGHT+IFtihXA1ixlkcjuYPXGi/3nyMcTJqsYkMUIphzCaA6DcRFEslloczpIHH8OqTcj441vz3MgX+UAWJI=
X-Received: from pjb7.prod.google.com ([2002:a17:90b:2f07:b0:2fe:800f:23a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c02:b0:2fe:80cb:ac05
 with SMTP id 98e67ed59e1d1-310e96c946emr1657552a91.9.1747957964380; Thu, 22
 May 2025 16:52:44 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:16 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-7-seanjc@google.com>
Subject: [PATCH v3 06/13] sched/wait: Drop WQ_FLAG_EXCLUSIVE from add_wait_queue_priority()
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

Drop the setting of WQ_FLAG_EXCLUSIVE from add_wait_queue_priority() and
instead have callers manually add the flag prior to adding their structure
to the queue.  Blindly setting WQ_FLAG_EXCLUSIVE is flawed, as the nature
of exclusive, priority waiters means that only the first waiter added will
ever receive notifications.

Pushing the flawed behavior to callers will allow fixing the problem one
hypervisor at a time (KVM added the flawed API, and then KVM's code was
copy+pasted nearly verbatim by Xen and Hyper-V), and will also allow for
adding an API that provides true exclusivity, i.e. that guarantees at most
one priority waiter is in the queue.

Opportunistically add a comment in Hyper-V to call out the mess.  Xen
privcmd's irqfd_wakefup() doesn't actually operate in exclusive mode, i.e.
can be "fixed" simply by dropping WQ_FLAG_EXCLUSIVE.  And KVM is primed to
switch to the aforementioned fully exclusive API, i.e. won't be carrying
the flawed code for long.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/mshv_eventfd.c | 8 ++++++++
 drivers/xen/privcmd.c     | 1 +
 kernel/sched/wait.c       | 4 ++--
 virt/kvm/eventfd.c        | 1 +
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/mshv_eventfd.c b/drivers/hv/mshv_eventfd.c
index 8dd22be2ca0b..b348928871c2 100644
--- a/drivers/hv/mshv_eventfd.c
+++ b/drivers/hv/mshv_eventfd.c
@@ -368,6 +368,14 @@ static void mshv_irqfd_queue_proc(struct file *file, wait_queue_head_t *wqh,
 			container_of(polltbl, struct mshv_irqfd, irqfd_polltbl);
 
 	irqfd->irqfd_wqh = wqh;
+
+	/*
+	 * TODO: Ensure there isn't already an exclusive, priority waiter, e.g.
+	 * that the irqfd isn't already bound to another partition.  Only the
+	 * first exclusive waiter encountered will be notified, and
+	 * add_wait_queue_priority() doesn't enforce exclusivity.
+	 */
+	irqfd->irqfd_wait.flags |= WQ_FLAG_EXCLUSIVE;
 	add_wait_queue_priority(wqh, &irqfd->irqfd_wait);
 }
 
diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 13a10f3294a8..c08ec8a7d27c 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -957,6 +957,7 @@ irqfd_poll_func(struct file *file, wait_queue_head_t *wqh, poll_table *pt)
 	struct privcmd_kernel_irqfd *kirqfd =
 		container_of(pt, struct privcmd_kernel_irqfd, pt);
 
+	kirqfd->wait.flags |= WQ_FLAG_EXCLUSIVE;
 	add_wait_queue_priority(wqh, &kirqfd->wait);
 }
 
diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index 51e38f5f4701..4ab3ab195277 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -40,7 +40,7 @@ void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_
 {
 	unsigned long flags;
 
-	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
+	wq_entry->flags |= WQ_FLAG_PRIORITY;
 	spin_lock_irqsave(&wq_head->lock, flags);
 	__add_wait_queue(wq_head, wq_entry);
 	spin_unlock_irqrestore(&wq_head->lock, flags);
@@ -64,7 +64,7 @@ EXPORT_SYMBOL(remove_wait_queue);
  * the non-exclusive tasks. Normally, exclusive tasks will be at the end of
  * the list and any non-exclusive tasks will be woken first. A priority task
  * may be at the head of the list, and can consume the event without any other
- * tasks being woken.
+ * tasks being woken if it's also an exclusive task.
  *
  * There are circumstances in which we can try to wake a task which has already
  * started to run but is not in state TASK_RUNNING. try_to_wake_up() returns
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 04877b297267..c7969904637a 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -316,6 +316,7 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
 
 	spin_release(&kvm->irqfds.lock.dep_map, _RET_IP_);
+	irqfd->wait.flags |= WQ_FLAG_EXCLUSIVE;
 	add_wait_queue_priority(wqh, &irqfd->wait);
 	spin_acquire(&kvm->irqfds.lock.dep_map, 0, 0, _RET_IP_);
 
-- 
2.49.0.1151.ga128411c76-goog


