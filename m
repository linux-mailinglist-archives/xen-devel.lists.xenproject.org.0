Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4647AC184E
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994742.1377535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiL-00088e-FZ; Thu, 22 May 2025 23:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994742.1377535; Thu, 22 May 2025 23:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFiL-00086H-93; Thu, 22 May 2025 23:52:41 +0000
Received: by outflank-mailman (input) for mailman id 994742;
 Thu, 22 May 2025 23:52:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1F0=YG=flex--seanjc.bounces.google.com=3xbgvaAYKCT4xjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@srs-se1.protection.inumbo.net>)
 id 1uIFiJ-0007r8-Oi
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:52:39 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d76ab4e3-3767-11f0-a2fb-13f23c93f187;
 Fri, 23 May 2025 01:52:39 +0200 (CEST)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-30ed6bd1b4cso7380217a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 16:52:39 -0700 (PDT)
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
X-Inumbo-ID: d76ab4e3-3767-11f0-a2fb-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957958; x=1748562758; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tVNl4A6Kx8naMJGZ1E0eQITkQbAsVFllM1f24lX+kzQ=;
        b=noDC6S+BticMiYcuNJKOkeTMtP4beT8fdjgXk6B0+hiVy6R4DQwfvLSFf21OvymTih
         nTzV4rpqxWLOHdP2cy4SQqKuSX7TDw7regP1JEJ2H5LSDrxoPjx20v1xw7WYZ/li4WfM
         51IwvFOB8odrMuDFYooBdP1tDMxeuDTkn1NUTXyfK74vsu0plcOYPXlyXdjDAj/4mBI0
         /c70B+VBReZWhFoqOsTqELQvNrAyPWYIYw6pAtm9GOLKQlKJg5v+oAhTjp/QiLZnO1Mw
         6oVQnu+cil44dTm77E/dOJKzMKbMWXwpR/TsrnUAZKzpdQ4/VaJ7erUVhsWEZVLrpkSZ
         Zgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957958; x=1748562758;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVNl4A6Kx8naMJGZ1E0eQITkQbAsVFllM1f24lX+kzQ=;
        b=E2/ibupDYlJfZkUNUPUjtLEEHkM7fSppU/ifN1Xw9anmuT18PVHDzWlAd2tfOw4Qsj
         uWc7dl+vkhvUg/JQPJ1C8bLuWYMM9/KXJeTaQOv5khcom48eJuwzhxGpf1iwa+Fj9kQW
         IB+FIKG8rixLKu8fQDJgi2pmyYrRuX/SiviSywaPuy46eU3w6N3wZ1BjbQdHByD1UBIF
         9hooiGurwmiTM9SZAlOzmehOm2mi2js6f/yxn2UV6n8gfnmLqJmydHp99pfXHpvZfLnj
         Axvpbqdubezv+E1uXpZ6SzXyT/8mwxNgfuylW4zjkC5SoVWZ1JLbYd0RTe/AgEn9HpeA
         8UHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuf7GVcReFheD8cvFIk7Mt5ivddB1yGj+xnRSJirVKjFDgXi9Ce6/H6rUHFBsgskFgk9Wo3syk3YI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5PBSRBY6LxxtNi6IA9XmnURghqLf8d669twTPw8cxhrNaTWib
	Yi7bQKgUoRhruaRWFtTd7aKI6g1LRwtAgthU2ZZIt0QMCvWRJF+9ZnvmDw2x3SmCuFoayGEr1XX
	JdY1YUw==
X-Google-Smtp-Source: AGHT+IE81WM2WL+8EnB/6FCP5IRyDnOFUDXq+HJraLf558ghdMXYLyDo9m5RHDzKNMgflX319IgqoMhIQGU=
X-Received: from pjg13.prod.google.com ([2002:a17:90b:3f4d:b0:2ee:4a90:3d06])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e70f:b0:30a:2173:9f0b
 with SMTP id 98e67ed59e1d1-30e8322596bmr38028577a91.28.1747957957818; Thu, 22
 May 2025 16:52:37 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:12 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-3-seanjc@google.com>
Subject: [PATCH v3 02/13] KVM: Acquire SCRU lock outside of irqfds.lock during assignment
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

Acquire SRCU outside of irqfds.lock so that the locking is symmetrical,
and add a comment explaining why on earth KVM holds SRCU for so long.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/eventfd.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 39e42b19d9f7..42c02c35e542 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -401,6 +401,18 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	 */
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
 
+	/*
+	 * Set the irqfd routing and add it to KVM's list before registering
+	 * the irqfd with the eventfd, so that the routing information is valid
+	 * and stays valid, e.g. if there are GSI routing changes, prior to
+	 * making the irqfd visible, i.e. before it might be signaled.
+	 *
+	 * Note, holding SRCU ensures a stable read of routing information, and
+	 * also prevents irqfd_shutdown() from freeing the irqfd before it's
+	 * fully initialized.
+	 */
+	idx = srcu_read_lock(&kvm->irq_srcu);
+
 	spin_lock_irq(&kvm->irqfds.lock);
 
 	ret = 0;
@@ -409,11 +421,9 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 			continue;
 		/* This fd is used for another irq already. */
 		ret = -EBUSY;
-		spin_unlock_irq(&kvm->irqfds.lock);
-		goto fail;
+		goto fail_duplicate;
 	}
 
-	idx = srcu_read_lock(&kvm->irq_srcu);
 	irqfd_update(kvm, irqfd);
 
 	list_add_tail(&irqfd->list, &kvm->irqfds.items);
@@ -449,6 +459,9 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	srcu_read_unlock(&kvm->irq_srcu, idx);
 	return 0;
 
+fail_duplicate:
+	spin_unlock_irq(&kvm->irqfds.lock);
+	srcu_read_unlock(&kvm->irq_srcu, idx);
 fail:
 	if (irqfd->resampler)
 		irqfd_resampler_shutdown(irqfd);
-- 
2.49.0.1151.ga128411c76-goog


