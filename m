Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB394A4729F
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897612.1306348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbo-0007Zx-5A; Thu, 27 Feb 2025 02:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897612.1306348; Thu, 27 Feb 2025 02:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbo-0007WI-16; Thu, 27 Feb 2025 02:26:44 +0000
Received: by outflank-mailman (input) for mailman id 897612;
 Thu, 27 Feb 2025 02:26:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Njr2=VS=flex--seanjc.bounces.google.com=3tMu_ZwYKCY8Bxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@srs-se1.protection.inumbo.net>)
 id 1tnTUt-00063X-PE
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:35 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4875acc8-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:34 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-2210305535bso12713345ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:34 -0800 (PST)
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
X-Inumbo-ID: 4875acc8-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622773; x=1741227573; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=iUPGjlm6EABKAwlimnT9Yj0uy9Y0kc3vikfZk6zMyUM=;
        b=wGmFhVUxZ15qHzYCAZmewBLmyp/Eu581w701AgHZPUQ9+Ww1W8Z9G5ML8wo102ZXt4
         jY6UeZtB9By2V0udvxnTJhLohBxBLUhFZdcxagixbd8Jd9/0jw+1BZvZEFnyYf5AbeXq
         80Lu5n0NyQzRv5eMKejbaiAFY2mP1zCD2COhtnWXxPA67bBSQlMNtvqsPVatp/vARKZ6
         PjJ50bDM1FlEsQSjdQ4t+/ZWzUPFjzg7g/wGHHF6WheIRK67G+xq04qkiYaxOVe7cxn/
         tYz1Embx8Vp0XSd5DOeLkGHu+EWCT7LCBU3ctZ6+Gb2FRqqvZWXLLOLaKlWFI799Ocfn
         8TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622773; x=1741227573;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUPGjlm6EABKAwlimnT9Yj0uy9Y0kc3vikfZk6zMyUM=;
        b=Q7cCoO7F6WTb00wuAf2jGkIC9BAceERHmXMzprKSgwE4c60sBxP0S5GxGbYo91Rh3f
         1/a1jRWWxS7YVe3r6L0WVy/PpC0ouO89Ck9YFLJk4PvRIviQJiH1n7mEFL6/E9J6AZFo
         6GqUHm2h0h8rgAiz3hK3zexD6bR5YSeLEwNz4bpRGuj9bKTLKs6XZ5eUxJU8XXF3IsOZ
         5DjID9oZObsm5Ngqn43qeWcuhc4ngxOfSirStSLyh10OYaavz9MbISphZp0iPpfI+8CA
         pYj5DJV0VsRvOf569JaPWRwf/x5VhkqTI0ZxhvKAI3xgVpkDBHGO1S0vB/+KwKC1TScI
         DE5w==
X-Forwarded-Encrypted: i=1; AJvYcCVGzvlAiuvkUUxyqY3HXwMVfpWIcs0ClEnE0m25PQddAETeseaIm9N7S+wopFMH6NOcdhqv0pksSj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyor9GNoGTolafLCs/DYYq/iFOAbOZ+um7A96khEvaPgoO/cae3
	XT1gM8dR7ZLQmDUBvqDXcnRZWXbd3rs0AFLhyXO+0HDq4LNpOa2WEkHKsvMarReywBmRLY1s2OG
	85A==
X-Google-Smtp-Source: AGHT+IESbVD77xvo7C+ciGzHtrGqGL0Rj+DzLIK2/TaODo5QawXajXsWSJTUc7OSugj7U0H5GgKBaGLNEhI=
X-Received: from pfld12.prod.google.com ([2002:a05:6a00:198c:b0:732:7e28:8f7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1813:b0:732:6221:7180
 with SMTP id d2e1a72fcca58-73426c943c4mr38161657b3a.5.1740622772828; Wed, 26
 Feb 2025 18:19:32 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:33 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-18-seanjc@google.com>
Subject: [PATCH v2 17/38] x86/tsc: WARN if TSC sched_clock save/restore used
 with PV sched_clock
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

Now that all PV clocksources override the sched_clock save/restore hooks
when overriding sched_clock, WARN if the "default" TSC hooks are invoked
when using a PV sched_clock, e.g. to guard against regressions.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 472d6c71d3a5..5501d76243c8 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -990,7 +990,7 @@ static unsigned long long cyc2ns_suspend;
 
 void tsc_save_sched_clock_state(void)
 {
-	if (!sched_clock_stable())
+	if (!sched_clock_stable() || WARN_ON_ONCE(!using_native_sched_clock()))
 		return;
 
 	cyc2ns_suspend = sched_clock();
@@ -1010,7 +1010,7 @@ void tsc_restore_sched_clock_state(void)
 	unsigned long flags;
 	int cpu;
 
-	if (!sched_clock_stable())
+	if (!sched_clock_stable() || WARN_ON_ONCE(!using_native_sched_clock()))
 		return;
 
 	local_irq_save(flags);
-- 
2.48.1.711.g2feabab25a-goog


