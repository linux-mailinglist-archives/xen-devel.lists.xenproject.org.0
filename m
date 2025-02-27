Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCCCA472A7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:27:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897630.1306404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbz-0001D8-6K; Thu, 27 Feb 2025 02:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897630.1306404; Thu, 27 Feb 2025 02:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbz-00018t-1S; Thu, 27 Feb 2025 02:26:55 +0000
Received: by outflank-mailman (input) for mailman id 897630;
 Thu, 27 Feb 2025 02:26:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0e95=VS=flex--seanjc.bounces.google.com=3u8u_ZwYKCZYI40D926EE6B4.2ECN4D-34L4BB8IJI.N4DFHE942J.EH6@srs-se1.protection.inumbo.net>)
 id 1tnTV1-00063X-86
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:43 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c9efc0d-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:41 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2fbff6426f5so1023400a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:41 -0800 (PST)
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
X-Inumbo-ID: 4c9efc0d-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622780; x=1741227580; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kU2lFcUz0RS/25JB9tsyegi1crsFJmJvQFST0gISHao=;
        b=dj7MugigeW8T3upUlj7yLWUbOANaFMSVYZGWnYDqHHmXlMB9oLtXeaNdxdUq9/N5Us
         D9I6oIhP4lL+/1b+q0DyBWOtWo8qi50baq9cummqnLEcHzHEoH1e1C9GQWEm9iePvii6
         A4lxBVw2RxXuPae9XuETkkhtax9bVjf/DYudUnaK9dfJ7tfr4PweRt9vc45QtkzMdmr8
         43ZZX1EraJFHxOuGDCVA4tVlqIGXt0nHU1n55Vk1h5znzBUAqSRG8ilfQlzaBb+HFPrv
         dczM88G6K1+xAUpIkWa/0b5/eGNh4PI2UblixrP/h43wDJv4eraXKlfnuft3n10+57aw
         L+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622780; x=1741227580;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kU2lFcUz0RS/25JB9tsyegi1crsFJmJvQFST0gISHao=;
        b=capsnjW+kgpjPjwHUAeUKbg+0WHkm6UOrPi6h0wpbroF5ntoYAB8OYBr+Yinpllp7x
         G8AnoPtDLsmn2K6sF8F8SSMccy6WPoJKa4JAOY+lSbLVFIQEbPGcD4Vhvbfsh8nlsD+D
         rmW2YOizQdmMsRJ1f2fK8BXPG1JhQfoajEdrqqZpv0whNK/t866HC2/o9HMnFnYFNJSS
         iByOOXFLpil1TIKrDuFH2jtMSNMw/RJXPWbSmKh2tiFTNSJa3BhJTy8LQa0VYoTh0rk3
         ymVBsnDgwl3FN6VoT0ahgQdJuJGkrmTn6+crUWJ0yFdyOhfuxTRhxbdwZFrOT43hh3xw
         yI4A==
X-Forwarded-Encrypted: i=1; AJvYcCUJg28p6fD5Q03sUSV2rtp+XnzDy32mX4Ap27RNFvYFPbVedjmOtIDcwNUn4KXR7eyKv3CRrMuGAQ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywk8VApYdehjTp5zfpbrAJPuhXnMOAeC2c4YXgttkV3P9G2tYmw
	TC2DkiS6NvIQ5bQOHwZqeYgIFuSn5/binKKqxRHFL/5XeEpA7aQ/27CH6v198C2sfNHo4OIfbqd
	Brw==
X-Google-Smtp-Source: AGHT+IGPqE+K3f21q2ak8FFNHYsAgDpuaP0E98T4gncRvFB5lVR5BPc4qf0azJ1lc37DAZgmd7FgPnilX0Q=
X-Received: from pjbsh7.prod.google.com ([2002:a17:90b:5247:b0:2f2:e97a:e77f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc44:b0:2f6:f107:fae6
 with SMTP id 98e67ed59e1d1-2fe68cf3f5fmr12813327a91.23.1740622779809; Wed, 26
 Feb 2025 18:19:39 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:37 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-22-seanjc@google.com>
Subject: [PATCH v2 21/38] x86/pvclock: Mark setup helpers and related various
 as __init/__ro_after_init
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

Now that Xen PV clock and kvmclock explicitly do setup only during init,
tag the common PV clock flags/vsyscall variables and their mutators with
__init.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/pvclock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index b3f81379c2fc..a51adce67f92 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -16,10 +16,10 @@
 #include <asm/pvclock.h>
 #include <asm/vgtod.h>
 
-static u8 valid_flags __read_mostly = 0;
-static struct pvclock_vsyscall_time_info *pvti_cpu0_va __read_mostly;
+static u8 valid_flags __ro_after_init = 0;
+static struct pvclock_vsyscall_time_info *pvti_cpu0_va __ro_after_init;
 
-void pvclock_set_flags(u8 flags)
+void __init pvclock_set_flags(u8 flags)
 {
 	valid_flags = flags;
 }
@@ -153,7 +153,7 @@ void pvclock_read_wallclock(struct pvclock_wall_clock *wall_clock,
 	set_normalized_timespec64(ts, now.tv_sec, now.tv_nsec);
 }
 
-void pvclock_set_pvti_cpu0_va(struct pvclock_vsyscall_time_info *pvti)
+void __init pvclock_set_pvti_cpu0_va(struct pvclock_vsyscall_time_info *pvti)
 {
 	WARN_ON(vclock_was_used(VDSO_CLOCKMODE_PVCLOCK));
 	pvti_cpu0_va = pvti;
-- 
2.48.1.711.g2feabab25a-goog


