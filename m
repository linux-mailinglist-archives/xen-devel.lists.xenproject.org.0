Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA544A472A3
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897617.1306362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbr-00089t-Dg; Thu, 27 Feb 2025 02:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897617.1306362; Thu, 27 Feb 2025 02:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbr-00088D-8z; Thu, 27 Feb 2025 02:26:47 +0000
Received: by outflank-mailman (input) for mailman id 897617;
 Thu, 27 Feb 2025 02:26:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=781f=VS=flex--seanjc.bounces.google.com=3uMu_ZwYKCZMF1xA6z3BB381.zB9K1A-01I1885FGF.K1ACEB61zG.BE3@srs-se1.protection.inumbo.net>)
 id 1tnTV0-0005qU-FF
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:42 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a7ff58a-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:37 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-22126a488d7so8276585ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:37 -0800 (PST)
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
X-Inumbo-ID: 4a7ff58a-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622776; x=1741227576; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=DqrQU03sQXOQDWLkbiIYCQHYscRa6LsfmxFd/y9lSQI=;
        b=MOrzuNjphMzLzWSAxt0FRr6Sn3t+yVH7K4wk8nTVo7tWGA01Hm6lhfbx4wWibVW66p
         eqJRe3e0cJ+G6yxSQDIJzvy+zrETBYefayFgLcqdf4hOLXe9cO6OMmb0e6fFKQ5fJa5c
         AzfqdIkSi4OvsEMVhn0wNZY54+BLFP5yuHLIbI0HJ3Kyj4mM4xFRJYeNQvOji5mHnO/i
         i5K8QviHztECCMU7MVZvH/LcHsfRzgq2VtmuOhIpHVvwtRG5HE4SQdH07lcDfB50KHoC
         cse6wFvjMKUAho0jQHljr5H/JyzyjDdvn4eCMI0SdjvqnV8Ue1obK45ooOLLwfmSJB+G
         3y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622776; x=1741227576;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DqrQU03sQXOQDWLkbiIYCQHYscRa6LsfmxFd/y9lSQI=;
        b=Zf7v//qKeQ6WEJ431ZQWhNYYxZY7p1GfEi1Ff3JvVbw2gRAOmzq2AKYuBvwse2ZSHu
         Xm65/caY+/xG+BCHMaFpzQNab0gmBm9U97qjQJuyu8un0sCAF7C4XVh2MsPMa8fP5/dY
         jmVOLcJsqoi600A5Z08+9shmHxS2oRUZV33erseE/FTGFbgwHvw1wdOUL269JSuIQqf3
         /nmk+Cbpinafepj+O8KirIs/uXJmguS56USlwjqVwMNOfYn9ogGQY29aaLl1NNyqzOGZ
         lESKB2oITBRvo9UTy8xauZaqGqav7YmGGKcq//zbx7UQ3f3462NyhVvGp22NrFgR7bkV
         39vA==
X-Forwarded-Encrypted: i=1; AJvYcCXHWuKMkmYDSd5qyKKobjUfM0Hjbo59hwudRXBu9Q71rH4oj+Pvy95UhCSHS6+HNx46d7PDFgqC6iE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtLtmMTnaGVa4xUTi+17oQKmo2fRETsXg2QtwtSi5fsEE7vj2I
	WTLzbprDV1JA40UftzV6ITX0PbgaxhcNQPXx+Mq45ScekvfvPBn+H1Ub7gsDdTPvfSOJ6JpiRo3
	Vwg==
X-Google-Smtp-Source: AGHT+IEOb0ihEjgZTJgsK50piH41vKgvY42fSlJ0VND1RngWC+UvT9KhzxC1r0flylu86Z/N4Su58D1alpU=
X-Received: from pllg7.prod.google.com ([2002:a17:902:7407:b0:223:2747:3d22])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d58e:b0:21f:140e:2929
 with SMTP id d9443c01a7336-22307b52eb5mr158736135ad.15.1740622776273; Wed, 26
 Feb 2025 18:19:36 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:35 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-20-seanjc@google.com>
Subject: [PATCH v2 19/38] x86/kvmclock: Move kvm_sched_clock_init() down in kvmclock.c
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"

Move kvm_sched_clock_init() "down" so that it can reference the global
kvm_clock structure without needing a forward declaration.

Opportunistically mark the helper as "__init" instead of "inline" to make
its usage more obvious; modern compilers don't need a hint to inline a
single-use function, and an extra CALL+RET pair during boot is a complete
non-issue.  And, if the compiler ignores the hint and does NOT inline the
function, the resulting code may not get discarded after boot due lack of
an __init annotation.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 1ad3878cc1d9..934ee4a4c6d4 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -133,19 +133,6 @@ static void kvm_restore_sched_clock_state(void)
 	kvm_register_clock("primary cpu clock, resume");
 }
 
-static inline void kvm_sched_clock_init(bool stable)
-{
-	kvm_sched_clock_offset = kvm_clock_read();
-	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
-				   kvm_save_sched_clock_state, kvm_restore_sched_clock_state);
-
-	pr_info("kvm-clock: using sched offset of %llu cycles",
-		kvm_sched_clock_offset);
-
-	BUILD_BUG_ON(sizeof(kvm_sched_clock_offset) >
-		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
-}
-
 void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
 {
 	/*
@@ -302,6 +289,19 @@ static int kvmclock_setup_percpu(unsigned int cpu)
 	return p ? 0 : -ENOMEM;
 }
 
+static void __init kvm_sched_clock_init(bool stable)
+{
+	kvm_sched_clock_offset = kvm_clock_read();
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
+				   kvm_save_sched_clock_state, kvm_restore_sched_clock_state);
+
+	pr_info("kvm-clock: using sched offset of %llu cycles",
+		kvm_sched_clock_offset);
+
+	BUILD_BUG_ON(sizeof(kvm_sched_clock_offset) >
+		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
+}
+
 void __init kvmclock_init(void)
 {
 	u8 flags;
-- 
2.48.1.711.g2feabab25a-goog


