Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2423FAC1848
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994758.1377650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFid-0003F4-VD; Thu, 22 May 2025 23:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994758.1377650; Thu, 22 May 2025 23:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFid-00037p-N9; Thu, 22 May 2025 23:52:59 +0000
Received: by outflank-mailman (input) for mailman id 994758;
 Thu, 22 May 2025 23:52:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ux7D=YG=flex--seanjc.bounces.google.com=31rgvaAYKCU89vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@srs-se1.protection.inumbo.net>)
 id 1uIFib-0007r7-D4
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:52:57 +0000
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [2607:f8b0:4864:20::54a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e13ed2dc-3767-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 01:52:55 +0200 (CEST)
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-b270145b864so3364564a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 16:52:55 -0700 (PDT)
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
X-Inumbo-ID: e13ed2dc-3767-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957974; x=1748562774; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EKiGsGdj01NsitpTuPJ3Ew8X7lvRxIwEPSz2u8YI9Cs=;
        b=aIEeDpG0kVlc73Z4xovesQ5Bk5o65TfuMnQIPzHxq/0LQUd02gHrh6wOjpnmXfIJag
         gXFQzh/lV1j85Hi4rbxuYoq/is9ctigG+xsITwi9d70lQo573zTTQQg/GuGnKl/s83Ro
         Mu9vJKhqKvZmhsDvI2UWOD55TF7ZLMM7iW1RQhXnTq6FHv3ab1XTQsuqXXkYP1Mb7tid
         h+V/rYpA1V03p+SKTiDMNIL1T6YRK4rXQQ/lK6pqdY1jPoyscOIpO0MPynI89uMIU3i2
         eJPOnEGHw2H2TUjYjYR8uSX2LWB+82ztmek9uM5s9x5bDBeZUDT7OT4mJNPgZsybjfBR
         lRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957974; x=1748562774;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EKiGsGdj01NsitpTuPJ3Ew8X7lvRxIwEPSz2u8YI9Cs=;
        b=Qnfg2Yx6gJp+34TGvQUQ5YSi16YLtCOCjyxOBLz2r39SL398wWJPYKv+p95hBly0FS
         4kIzTGWPCFRZN6siuNW7ntYLho6/q8by1YLc9K1Hq+ItGMVfq237MAESvHBuMcPf72W6
         i8n2BW38Oku1ScXBdwTAF/xD11zVHDTPugZpcvCDaagEEEId/gJkhvAXGAPLrr5A6EYp
         brbDbVKsGmTkMPrK/4hvD3lSxbwuqUhgH844f6wUgK7JQFHYaqFe4oC5LqaN6DPo+DKH
         /cMIktxoWg7n9JMQvkdN5dRAL6EE1xnG+rmaVRjf1HF+jOOYQGXRuuxR/9emlOT3PRoX
         yRpg==
X-Forwarded-Encrypted: i=1; AJvYcCWSX0qXdz+1hBOfcH5W6y2wg5pJx9vCT1PQsD0OFpt3P0mF3heayEgoCm/dMRX9v9dZfWeij6+dVVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy74fnaiH2sjXWPTlwtMZoiNk1mczqKi1Ya7jb/Cs78DodCLbnx
	vUqwcYIjHQL2WLJEyx/XpqT2V7eSNN+PevIAFm2DPV5wubA7aQ86dMjGpx6sO6QgDYrMjH74PZF
	48NxOKw==
X-Google-Smtp-Source: AGHT+IFfHuwPoraxH7fHOxcJKjCs5i19crB1g3gqYt+qVLkDFB/zR2OG4BEQkHLANHuLxCZWJd/rEXtT30s=
X-Received: from pga16.prod.google.com ([2002:a05:6a02:4f90:b0:af2:3385:de87])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d527:b0:206:aa42:8e7c
 with SMTP id adf61e73a8af0-2170cc715a0mr39501029637.18.1747957974292; Thu, 22
 May 2025 16:52:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:22 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-13-seanjc@google.com>
Subject: [PATCH v3 12/13] KVM: selftests: Add utilities to create eventfds and
 do KVM_IRQFD
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

Add helpers to create eventfds and to (de)assign eventfds via KVM_IRQFD.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c  | 12 ++----
 .../testing/selftests/kvm/include/kvm_util.h  | 40 +++++++++++++++++++
 .../selftests/kvm/x86/xen_shinfo_test.c       | 18 ++-------
 3 files changed, 47 insertions(+), 23 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index f4ac28d53747..a09dd423c2d7 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -620,18 +620,12 @@ static void kvm_routing_and_irqfd_check(struct kvm_vm *vm,
 	 * that no actual interrupt was injected for those cases.
 	 */
 
-	for (f = 0, i = intid; i < (uint64_t)intid + num; i++, f++) {
-		fd[f] = eventfd(0, 0);
-		TEST_ASSERT(fd[f] != -1, __KVM_SYSCALL_ERROR("eventfd()", fd[f]));
-	}
+	for (f = 0, i = intid; i < (uint64_t)intid + num; i++, f++)
+		fd[f] = kvm_new_eventfd();
 
 	for (f = 0, i = intid; i < (uint64_t)intid + num; i++, f++) {
-		struct kvm_irqfd irqfd = {
-			.fd  = fd[f],
-			.gsi = i - MIN_SPI,
-		};
 		assert(i <= (uint64_t)UINT_MAX);
-		vm_ioctl(vm, KVM_IRQFD, &irqfd);
+		kvm_assign_irqfd(vm, i - MIN_SPI, fd[f]);
 	}
 
 	for (f = 0, i = intid; i < (uint64_t)intid + num; i++, f++) {
diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 373912464fb4..4f7bf8f000bb 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -18,6 +18,7 @@
 #include <asm/atomic.h>
 #include <asm/kvm.h>
 
+#include <sys/eventfd.h>
 #include <sys/ioctl.h>
 
 #include "kvm_util_arch.h"
@@ -496,6 +497,45 @@ static inline int vm_get_stats_fd(struct kvm_vm *vm)
 	return fd;
 }
 
+static inline int __kvm_irqfd(struct kvm_vm *vm, uint32_t gsi, int eventfd,
+			      uint32_t flags)
+{
+	struct kvm_irqfd irqfd = {
+		.fd = eventfd,
+		.gsi = gsi,
+		.flags = flags,
+		.resamplefd = -1,
+	};
+
+	return __vm_ioctl(vm, KVM_IRQFD, &irqfd);
+}
+
+static inline void kvm_irqfd(struct kvm_vm *vm, uint32_t gsi, int eventfd,
+			      uint32_t flags)
+{
+	int ret = __kvm_irqfd(vm, gsi, eventfd, flags);
+
+	TEST_ASSERT_VM_VCPU_IOCTL(!ret, KVM_IRQFD, ret, vm);
+}
+
+static inline void kvm_assign_irqfd(struct kvm_vm *vm, uint32_t gsi, int eventfd)
+{
+	kvm_irqfd(vm, gsi, eventfd, 0);
+}
+
+static inline void kvm_deassign_irqfd(struct kvm_vm *vm, uint32_t gsi, int eventfd)
+{
+	kvm_irqfd(vm, gsi, eventfd, KVM_IRQFD_FLAG_DEASSIGN);
+}
+
+static inline int kvm_new_eventfd(void)
+{
+	int fd = eventfd(0, 0);
+
+	TEST_ASSERT(fd >= 0, __KVM_SYSCALL_ERROR("eventfd()", fd));
+	return fd;
+}
+
 static inline void read_stats_header(int stats_fd, struct kvm_stats_header *header)
 {
 	ssize_t ret;
diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 34d180cf4eed..23909b501ac2 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -547,11 +547,8 @@ int main(int argc, char *argv[])
 	int irq_fd[2] = { -1, -1 };
 
 	if (do_eventfd_tests) {
-		irq_fd[0] = eventfd(0, 0);
-		TEST_ASSERT(irq_fd[0] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[0]));
-
-		irq_fd[1] = eventfd(0, 0);
-		TEST_ASSERT(irq_fd[1] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[1]));
+		irq_fd[0] = kvm_new_eventfd();
+		irq_fd[1] = kvm_new_eventfd();
 
 		irq_routes.info.nr = 2;
 
@@ -569,15 +566,8 @@ int main(int argc, char *argv[])
 
 		vm_ioctl(vm, KVM_SET_GSI_ROUTING, &irq_routes.info);
 
-		struct kvm_irqfd ifd = { };
-
-		ifd.fd = irq_fd[0];
-		ifd.gsi = 32;
-		vm_ioctl(vm, KVM_IRQFD, &ifd);
-
-		ifd.fd = irq_fd[1];
-		ifd.gsi = 33;
-		vm_ioctl(vm, KVM_IRQFD, &ifd);
+		kvm_assign_irqfd(vm, 32, irq_fd[0]);
+		kvm_assign_irqfd(vm, 33, irq_fd[1]);
 
 		struct sigaction sa = { };
 		sa.sa_handler = handle_alrm;
-- 
2.49.0.1151.ga128411c76-goog


