Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A29A47290
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897512.1306283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbB-00022H-CR; Thu, 27 Feb 2025 02:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897512.1306283; Thu, 27 Feb 2025 02:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbB-0001yP-3I; Thu, 27 Feb 2025 02:26:05 +0000
Received: by outflank-mailman (input) for mailman id 897512;
 Thu, 27 Feb 2025 02:26:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0tL=VS=flex--seanjc.bounces.google.com=3x8u_ZwYKCaIUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@srs-se1.protection.inumbo.net>)
 id 1tnTVC-0005qU-GY
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:54 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53945838-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:52 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fea1685337so792101a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:52 -0800 (PST)
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
X-Inumbo-ID: 53945838-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622791; x=1741227591; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=w772IaQ5YRbZvSP+H3ufucBFIq7F/07nn6vrGLJgcY8=;
        b=M0wfsNdgYDrakqB6sVRnOUEpd5awj+N4zJY4GUa5TyA/FH7/6o3DsUecgp9hvKyLFc
         AzMnrPcYERuf759wstpiN0yqaHJz51nXzc1zFAwEpx6CX1QYNIyXtsoYcqn5xWoQ/k86
         jJp9/J5ILo7H+hq9Ne1vqSU1pK0WtVMFaU8qomY252NxvC2F+uGR/vzYE6Ou1TOJBZLf
         Q7Qz3cEDKH3fU93ZHsHMvRxjrTdjuqA2hGj2L26MA8JB3YFudC0f9GgjdiDy1Ob4z9nQ
         DtHYwuYKhC+JtyPaaN8kjxhzWPOU0DkuHs7xz5EcC42Ztechfh7KDAAC3Lr+W8n8qf4p
         nHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622791; x=1741227591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w772IaQ5YRbZvSP+H3ufucBFIq7F/07nn6vrGLJgcY8=;
        b=E+64/F8NOAbRx/PV3j46NTY+zdx25ml9MnGjCuuHuTjdyD49jUfFEgkeHdmtNgPTR+
         yIRu4ANdJEH6nPklMyUN4vHYDhWHco4SdTG2DdYju8BrT56bt4gWZnAyaTcxF0DraBVV
         nvSe/BCP1K6SFnox2Vx6g78Vf/Q8/VozKJ3w0HxercJ72dgCNRZXD2MFpqn2jQmwbaWH
         dJNpcY8RFdqdjP2qeOLqfm82DcN6nBXcSshGXIo63Vg2oxAcEXqg9MDrK6ZXx8KjWRhw
         KGIG2x9T+Le0YWYxFwXZZnjDHmS+V6pvP/iV6adWP/hyu39IKqnM7J6DC9pSel/mVu3G
         99bw==
X-Forwarded-Encrypted: i=1; AJvYcCWkPESRIktiugc7t1lPHpcW7wqm4BrI/TSQHnMPZQ77NASMQCB8PeNrTXaFn2qlxTrAgJodhe0PK24=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+ZU5S+kmJR83og8NCMQ1qZY06I3fKc2YovMWNb937ivC4UgXk
	fI6kMzkMyyns7WntspcOs/r5Ae1sRHj1VpDd+s6W0dBnuKbdxKHasci5xpVC5iJJGDrz4+8v449
	mYg==
X-Google-Smtp-Source: AGHT+IFwaP3Gmshvc7uvq62wN2IryjydNwW4vN0WeuDaKx0968TrkTSYTEdNA9orJIr9gY0PmdxDWYBBhxM=
X-Received: from pjbsm1.prod.google.com ([2002:a17:90b:2e41:b0:2f8:4024:b59a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2688:b0:2f9:d0cd:3403
 with SMTP id 98e67ed59e1d1-2fea12fcb22mr2427211a91.16.1740622791492; Wed, 26
 Feb 2025 18:19:51 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:44 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-29-seanjc@google.com>
Subject: [PATCH v2 28/38] x86/paravirt: Mark __paravirt_set_sched_clock() as __init
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

Annotate __paravirt_set_sched_clock() as __init, and make its wrapper
__always_inline to ensure sanitizers don't result in a non-inline version
hanging around.  All callers run during __init, and changing sched_clock
after boot would be all kinds of crazy.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/paravirt.h | 9 +++++----
 arch/x86/kernel/paravirt.c      | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index dc26a3c26527..e6d5e77753c4 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -28,11 +28,12 @@ u64 dummy_sched_clock(void);
 DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
 DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);
 
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				void (*save)(void), void (*restore)(void));
+void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				       void (*save)(void), void (*restore)(void));
 
-static inline void paravirt_set_sched_clock(u64 (*func)(void),
-					    void (*save)(void), void (*restore)(void))
+static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
+						     void (*save)(void),
+						     void (*restore)(void))
 {
 	__paravirt_set_sched_clock(func, true, save, restore);
 }
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 9673cd3a3f0a..92bf831a63b1 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -86,8 +86,8 @@ static u64 native_steal_clock(int cpu)
 DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
 DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
 
-void __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				void (*save)(void), void (*restore)(void))
+void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				       void (*save)(void), void (*restore)(void))
 {
 	if (!stable)
 		clear_sched_clock_stable();
-- 
2.48.1.711.g2feabab25a-goog


