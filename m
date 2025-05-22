Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12605AC1847
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994743.1377549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiO-00009r-TV; Thu, 22 May 2025 23:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994743.1377549; Thu, 22 May 2025 23:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiO-00007D-N4; Thu, 22 May 2025 23:52:44 +0000
Received: by outflank-mailman (input) for mailman id 994743;
 Thu, 22 May 2025 23:52:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QYbL=YG=flex--seanjc.bounces.google.com=3x7gvaAYKCUAugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@srs-se1.protection.inumbo.net>)
 id 1uIFiM-0007r7-G9
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:52:42 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d870caa6-3767-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 01:52:41 +0200 (CEST)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-30e895056f0so9150893a91.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 16:52:40 -0700 (PDT)
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
X-Inumbo-ID: d870caa6-3767-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957959; x=1748562759; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xAZka5nPnl0zzhBog63136UQG1pDC/RMIYFF12/LKjA=;
        b=MfriG8WAWJLdD2wlERMwN89EIDy+/ncmRYs8fyD7yjdTDWe0PioxwzLRblp4vZzPjV
         BJ3k4k0vhCICdd/tkxpp0E3H2CIBFw9QqryATTbaTvVi2Tnt9Mn9zeL8/x9yaVp/jtbU
         5g08/k+2qGN7M8FKSFv+u7bObQRtqXeyUdyURrfT48I5WGBj+aTiaUulnZn7qCU5aqtx
         0KQQJb5WF8hT79cGTZ1E2n7nCk3FSpFTTCDe7Hn1WR4lkjUWiZ5Ii2r6owG5YurXAJBM
         KL0ad9eYzLedPE3du7aNzldwXgj9GGpUZ3axY6nDfAp+Fkz0/4yZnjJCRke4IL3IFNqH
         0CGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957959; x=1748562759;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAZka5nPnl0zzhBog63136UQG1pDC/RMIYFF12/LKjA=;
        b=u0xje4XRU1MFa7OBZs34YZD73CSfyQXriTYkAbD56yz7LWXsXOn48rMV83FRNp7QqP
         1+5HH+yH+6wBYnwS2e+XtKH1lQyi4wEntABMjQeuI7FnMptkxw2roaTn2+Uu31kVsXgm
         CYHvaIlRKQ9jZftq5BYUhuTeuXrafUeO4nJuOM29ODzNQn31+bajBSpetrxRrabMuND6
         WrIyL9CHzaf9Zzib7faVQG9+nO4N8baxXGsEqU8WP15DxYyymtjPaqZ6Hx2q+oGpoZjM
         k9qMhY9de/RbVExoetD8q3rHoQet8plon851XkguAAtmkYL6vmfywzTGjX70p+ixD7Et
         To7g==
X-Forwarded-Encrypted: i=1; AJvYcCXHemQDUJjr01+EMurf2cbkwtaOvJ/Mzw0FsSTLWmU+I4y0ExjeSUwweSJRgJl0Mze0XxG85WD1GGc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEE3c8B0k9Cchu4a0lKmMZ8UWZ305LzHUdWZX2GQopcrU+J593
	t2mj4ypjmKmNvbWr8+jfLWGvMO4iBj3Je12BGD6zSV9usJlCQlhp8DcMORcV/9EhEbFfBS/hSvS
	JStyTBg==
X-Google-Smtp-Source: AGHT+IFTlML74x7TQE+fmnLc60J6Zc3gXJFbZA8aAHEiRQLh+dPZA/uq2RIsrb3gSzl5/rJlFLqbanul+U8=
X-Received: from pja13.prod.google.com ([2002:a17:90b:548d:b0:2ef:786a:1835])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51cb:b0:2ee:fa0c:cebc
 with SMTP id 98e67ed59e1d1-310e96e87e5mr1351003a91.20.1747957959540; Thu, 22
 May 2025 16:52:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:13 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-4-seanjc@google.com>
Subject: [PATCH v3 03/13] KVM: Initialize irqfd waitqueue callback when adding
 to the queue
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

Initialize the irqfd waitqueue callback immediately prior to inserting the
irqfd into the eventfd's waitqueue.  Pre-initializing the state in a
completely different context is all kinds of confusing, and incorrectly
suggests that the waitqueue function needs to be initialize prior to
vfs_poll().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 42c02c35e542..8b9a87daa2bb 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -256,6 +256,13 @@ static void kvm_irqfd_register(struct file *file, wait_queue_head_t *wqh,
 	struct kvm_irqfd_pt *p = container_of(pt, struct kvm_irqfd_pt, pt);
 	struct kvm_kernel_irqfd *irqfd = p->irqfd;
 
+	/*
+	 * Add the irqfd as a priority waiter on the eventfd, with a custom
+	 * wake-up handler, so that KVM *and only KVM* is notified whenever the
+	 * underlying eventfd is signaled.
+	 */
+	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
+
 	add_wait_queue_priority(wqh, &irqfd->wait);
 }
 
@@ -395,12 +402,6 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 		mutex_unlock(&kvm->irqfds.resampler_lock);
 	}
 
-	/*
-	 * Install our own custom wake-up handling so we are notified via
-	 * a callback whenever someone signals the underlying eventfd
-	 */
-	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
-
 	/*
 	 * Set the irqfd routing and add it to KVM's list before registering
 	 * the irqfd with the eventfd, so that the routing information is valid
-- 
2.49.0.1151.ga128411c76-goog


