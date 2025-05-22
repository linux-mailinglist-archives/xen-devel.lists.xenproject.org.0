Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5D1AC184D
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 01:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994757.1377639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFic-0002rS-6k; Thu, 22 May 2025 23:52:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994757.1377639; Thu, 22 May 2025 23:52:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIFib-0002oZ-V2; Thu, 22 May 2025 23:52:57 +0000
Received: by outflank-mailman (input) for mailman id 994757;
 Thu, 22 May 2025 23:52:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+3KA=YG=flex--seanjc.bounces.google.com=31LgvaAYKCU07tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@srs-se1.protection.inumbo.net>)
 id 1uIFia-0007r7-3I
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 23:52:56 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e03f2c8b-3767-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 01:52:54 +0200 (CEST)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-30e8aec4689so7733011a91.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 16:52:54 -0700 (PDT)
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
X-Inumbo-ID: e03f2c8b-3767-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957972; x=1748562772; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jjMNjs+bdNtZTb3Wdy6sSLCs56ksmcfEkIHqJR2gBFc=;
        b=UeglZ0gAZC/jLBoMIB9KNvdoRZnuqbQwj7Vr2df98rbD5hMnj5FwYpLTLo2sKd1eDv
         f1ZKiSoPOoX8i8jwPWTBZ/jvDUjoFyFbyPLv8l6LnlnrnPAO2olYnieASNnQmpkj2+Cx
         IMQDIGWC+GumCz/anvk9X7xwezzZKn3MNVd6ih0QhWZbXqbXgmGI8T0DjcELH9mChp3F
         oJIl5nFUvEKoBEbPPS7g0V7oRbN19TvogXV1/okSJNdjvW1tZUTaJDIoCWhAhXVlwspK
         GGrpHF9rHOox9AWvdF1YeMotFF7mfRS4Y//H1J/NOfIfEUVyIRLo+z00LmLMyp9u/Xi+
         rxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957972; x=1748562772;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jjMNjs+bdNtZTb3Wdy6sSLCs56ksmcfEkIHqJR2gBFc=;
        b=HyPihbm4pe3Ca1feTGEKtWp5PaAlsfY+/z13uFHoEwDcayM3WGHD8oz6q8WGby0SCZ
         J8YSkh4mqOoND1YRTuZDLKkzjp1uWXrchulynkP0IGtNRBsp7Y12RqVApeEFeNnw3zOO
         uiuhmUSs32PUORxCOI9/XI82n4NAMGfkRozkBbw6xxPzWo2mKQK6zaDBTEyA2jFZTiUB
         yzreGS1aAdacZw5lQEYXC2eeOSrWRDNVz1PPp6OiWUQGnZf+GjvC4wgXQfkEMe4vNkYc
         gR+AIxea6ALlC9v+toOImiTxcx+/wEjf1gOPDCiBDm0FyJuImrJirS+7avyfckFKx50k
         SrOg==
X-Forwarded-Encrypted: i=1; AJvYcCUN2a1G4hB2ocrLiDOoWAJyM5tUivGtWNb8SSP82nogtj6HBLHtlQJPnG+ZiXcrN91f2Sl8J7YddWs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybjHXswrrmn5TYTN2Hc4kUb6lmqPwo+ELLL1e1veOjde0SFEEy
	2YrBTMFN5bG312gyb8Fd7eoQv3FpPvAVBGMa5zMWF69Dp4FX4FwFftaTn373/2m7yrxCYPY7Sst
	CgHJjdA==
X-Google-Smtp-Source: AGHT+IH+y/4Vqk1KMF3LjOCFUbppIPh5ZUErAvUoiEDW2SE/2hXGiqyTLKxlZ9Xh8ZuSjxO0WF45GST49oM=
X-Received: from pjbdy5.prod.google.com ([2002:a17:90b:6c5:b0:2fc:1356:bcc3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:510f:b0:2ff:58e1:2bb1
 with SMTP id 98e67ed59e1d1-310e973e510mr1311217a91.32.1747957972660; Thu, 22
 May 2025 16:52:52 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:52:21 -0700
In-Reply-To: <20250522235223.3178519-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250522235223.3178519-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522235223.3178519-12-seanjc@google.com>
Subject: [PATCH v3 11/13] KVM: selftests: Assert that eventfd() succeeds in
 Xen shinfo test
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

Assert that eventfd() succeeds in the Xen shinfo test instead of skipping
the associated testcase.  While eventfd() is outside the scope of KVM, KVM
unconditionally selects EVENTFD, i.e. the syscall should always succeed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/x86/xen_shinfo_test.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 287829f850f7..34d180cf4eed 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -548,14 +548,11 @@ int main(int argc, char *argv[])
 
 	if (do_eventfd_tests) {
 		irq_fd[0] = eventfd(0, 0);
+		TEST_ASSERT(irq_fd[0] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[0]));
+
 		irq_fd[1] = eventfd(0, 0);
+		TEST_ASSERT(irq_fd[1] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[1]));
 
-		/* Unexpected, but not a KVM failure */
-		if (irq_fd[0] == -1 || irq_fd[1] == -1)
-			do_evtchn_tests = do_eventfd_tests = false;
-	}
-
-	if (do_eventfd_tests) {
 		irq_routes.info.nr = 2;
 
 		irq_routes.entries[0].gsi = 32;
-- 
2.49.0.1151.ga128411c76-goog


