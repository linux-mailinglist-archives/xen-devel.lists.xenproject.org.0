Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631ACA47295
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897531.1306310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbK-0003gA-28; Thu, 27 Feb 2025 02:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897531.1306310; Thu, 27 Feb 2025 02:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbJ-0003Uz-BR; Thu, 27 Feb 2025 02:26:13 +0000
Received: by outflank-mailman (input) for mailman id 897531;
 Thu, 27 Feb 2025 02:26:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xPCj=VS=flex--seanjc.bounces.google.com=3ycu_ZwYKCaQWIERNGKSSKPI.GSQbIR-HIZIPPMWXW.bIRTVSNIGX.SVK@srs-se1.protection.inumbo.net>)
 id 1tnTVD-0005qU-Gl
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:55 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 549ff9e5-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:54 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2f83e54432dso1546794a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:54 -0800 (PST)
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
X-Inumbo-ID: 549ff9e5-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622793; x=1741227593; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=P4tBmLUacP8DGxGQBI6X9mo8c2uhJ9G5VZle1I388Hk=;
        b=zAeu1pwzHmdkhNT40HUtzMwGG5lHKkXCah/BLKvHIVTqaFKFeb1Qtf0yz5eY7L9AXS
         yln5XE0Gs0PawpvSE3bdcthUsB1DEU3CsEIjSbvSQQJlalnCg34hWpdXLw5mm+sUxM9y
         vjoctYUNcim/37upo7LCSVsa8QHGsYwvE01EC3CcFoVIsg/rokgzQIW1aHKmRQsTDgoP
         WqQRSeEeIQOSn+kZoXuc9zAn7Z2vntBtE2rnncvKJypMVL12RJc9mqgzCUn0cA3p/wVt
         dyreOJDq41uSisnZ0RtoXlbrEhIM87ZuIXN9rx7dZCc2bJvVAtF/x8DgIBH86fHTF0zf
         UjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622793; x=1741227593;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4tBmLUacP8DGxGQBI6X9mo8c2uhJ9G5VZle1I388Hk=;
        b=aQlYSuYJ3dxTPVHgD8xHCtdInHGXZ9LkczzhissbOWVO9IejwtEKJaVv5twvVUofvM
         sfeL5fSNjhf4bRXMkS+T/7zJK795twoaBlZdS06HD0trsybnNuM9yQo0PajLKN8OSnmW
         4ggEwrmqYqAShvUb2idtmJeQXG01ujyXpWzBxxDtHqGfWJS+qajuquJgIQZCArTPX8r0
         ZxgF8qGwx5Jn0/9JLUKw3tZrsaqG7RF+m3p8KKo5wK5fUCgB74SSWxR8+jYbWn+3vB1m
         y5lhKutvij4p3pfmGvVBlKI0FDajSi0rSc1VH29ePtmK4bagRRGOuPKNoJcTBkdt40eR
         EJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCXaJShNf+UE6FvSZDTv9dvazB9rNWTje6hEBOSBjKjs51bMU9USPHtXPUrvNa5/kcd95c8XxCnjHw8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzxEwgDomfZMsg+1NfO20itHj6OgQs7FO5ed1lwuKEXsqA3jqIU
	ops0iIk59mcP2GacbjbzIlVR3pnK/uUDl7+mEgrZdMAn7o39IG92lBINAhnkuDR0OsIg0BR1Wxh
	UPw==
X-Google-Smtp-Source: AGHT+IGdVjOlq0BY70ioN6i4xVGmLOeDmFSQNBlkaPaHsOsARCADALqyiFXLpG70t8VDnA7M1OSlhaskPoo=
X-Received: from pjbsw3.prod.google.com ([2002:a17:90b:2c83:b0:2fa:15aa:4d2b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:54cd:b0:2f2:8bdd:cd8b
 with SMTP id 98e67ed59e1d1-2fe7e3b1756mr8832651a91.29.1740622793310; Wed, 26
 Feb 2025 18:19:53 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:45 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-30-seanjc@google.com>
Subject: [PATCH v2 29/38] x86/paravirt: Plumb a return code into __paravirt_set_sched_clock()
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

Add a return code to __paravirt_set_sched_clock() so that the kernel can
reject attempts to use a PV sched_clock without breaking the caller.  E.g.
when running as a CoCo VM with a secure TSC, using a PV clock is generally
undesirable.

Note, kvmclock is the only PV clock that does anything "extra" beyond
simply registering itself as sched_clock, i.e. is the only caller that
needs to check the new return value.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/paravirt.h | 6 +++---
 arch/x86/kernel/kvmclock.c      | 7 +++++--
 arch/x86/kernel/paravirt.c      | 5 +++--
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index e6d5e77753c4..5de31b22aa5f 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -28,14 +28,14 @@ u64 dummy_sched_clock(void);
 DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
 DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);
 
-void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				       void (*save)(void), void (*restore)(void));
+int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				      void (*save)(void), void (*restore)(void));
 
 static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
 						     void (*save)(void),
 						     void (*restore)(void))
 {
-	__paravirt_set_sched_clock(func, true, save, restore);
+	(void)__paravirt_set_sched_clock(func, true, save, restore);
 }
 
 static __always_inline u64 paravirt_sched_clock(void)
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 76884dfc77f4..1dbe12ecb26e 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -337,9 +337,12 @@ static int kvmclock_setup_percpu(unsigned int cpu)
 
 static void __init kvm_sched_clock_init(bool stable)
 {
+	if (__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
+				       kvm_save_sched_clock_state,
+				       kvm_restore_sched_clock_state))
+		return;
+
 	kvm_sched_clock_offset = kvm_clock_read();
-	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
-				   kvm_save_sched_clock_state, kvm_restore_sched_clock_state);
 	kvmclock_is_sched_clock = true;
 
 	/*
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 92bf831a63b1..a3a1359cfc26 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -86,8 +86,8 @@ static u64 native_steal_clock(int cpu)
 DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
 DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
 
-void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				       void (*save)(void), void (*restore)(void))
+int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				      void (*save)(void), void (*restore)(void))
 {
 	if (!stable)
 		clear_sched_clock_stable();
@@ -95,6 +95,7 @@ void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 	static_call_update(pv_sched_clock, func);
 	x86_platform.save_sched_clock_state = save;
 	x86_platform.restore_sched_clock_state = restore;
+	return 0;
 }
 
 /* These are in entry.S */
-- 
2.48.1.711.g2feabab25a-goog


