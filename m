Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A2CA47212
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897379.1306119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUi-0008VL-BC; Thu, 27 Feb 2025 02:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897379.1306119; Thu, 27 Feb 2025 02:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUi-0008Po-4S; Thu, 27 Feb 2025 02:19:24 +0000
Received: by outflank-mailman (input) for mailman id 897379;
 Thu, 27 Feb 2025 02:19:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tQbn=VS=flex--seanjc.bounces.google.com=3qMu_ZwYKCYMzlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@srs-se1.protection.inumbo.net>)
 id 1tnTUg-0005qU-G3
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:22 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 411b7768-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:21 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc1c7c8396so1083061a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:21 -0800 (PST)
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
X-Inumbo-ID: 411b7768-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622760; x=1741227560; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yCluOSGlRhOy+WE1mTtSxuryf3jXdB/g/GtrHZOBhNw=;
        b=jhj5R6Pbyj7HPRfMhXii6TDUEoQxKTkTia213p42enH2TU6SrbxrvsI1Kr0luv1aOO
         kfmdiLXWkzBlKmm+7hITQoX+kaahp0OnTJZLZKOxQ3b7o4E9FpuHSuU2/wzHDdYcgFbs
         MNnBemY9lHGhjCx4r9NAWLcpB5pzXMSvSnZ09+cKXpMHkul6p6RulEJ+wwejnGad6dVs
         VFkp+SgKCteIapK/MGhc01tNIQuj0s/jIWxUKoZg+s/k6Gx8JhM3lEWhhPq1jqxg1P1p
         FqAjE7KIYY+kOFGWmt1skLbuLh9o50Z0UD3D4AvNLqwxFm4kHTTlsp6WpQrVovenr6RU
         ZmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622760; x=1741227560;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCluOSGlRhOy+WE1mTtSxuryf3jXdB/g/GtrHZOBhNw=;
        b=bmDIic+sqSc4Wgsvrtvhhy157ar6IHejzrPkN0+9eR/o/dBhT6TEQymVCFbeKnD4N9
         kj5rYsOzBLwq64j1tcRK9bSIjpBziqbdFEf/xWUAZpq4yrthqHwo/mnpka3E3WdYmEEn
         4ZqCitvpFFtd8QK4gJ+wpYdm2Vhh9NaFo3kffu0I4JcbzW8qyfkqIfLMbHRmYllAaZfY
         Y8BQ7dhTP7AgFkSvtUxDkNifkzu/bk6YQ3iPqyvrJ2b8K9KWTqsWwsdd6lh1IKOGWurK
         qjaJB+KO2Y5bEBq1XZADs5Q81GR476ty2fOABYa6Y1sQzIevu6EzZmZQmPlbuLnzdW85
         eYAg==
X-Forwarded-Encrypted: i=1; AJvYcCUy1PnpSoyd1Jufdyq3E/diP5vusjGJ9iRBuoCa9Gwx0ublWYUqGL9smJsbgDSqR5Z2VD7BFZgdeqs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtGWnjhHDCGZmImwI7LWp4lG+EPkIRFfpltC9ZYdCzNRgyavsV
	G5cn27gHlgztwXAz3RgJ/sa6/ccS47z9884ZioFuHhbxq+5xbrJaq4Kj1D1i+wbbdxqmozIsp5z
	lHQ==
X-Google-Smtp-Source: AGHT+IEg2qVczQMppIuK2WVUrcQpfIoWQRuX4zIj2kwQnn94y9fLsBQqATNYRMsqTAxp9OZvbzuNSvbgNPw=
X-Received: from pgte20.prod.google.com ([2002:a65:6894:0:b0:ae1:49ef:10d4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:8004:b0:1f0:e368:4a48
 with SMTP id adf61e73a8af0-1f0e3684a6fmr22807696637.8.1740622760519; Wed, 26
 Feb 2025 18:19:20 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:26 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-11-seanjc@google.com>
Subject: [PATCH v2 10/38] clocksource: hyper-v: Don't save/restore TSC offset
 when using HV sched_clock
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

Now that Hyper-V overrides the sched_clock save/restore hooks if and only
sched_clock itself is set to the Hyper-V timer, drop the invocation of the
"old" save/restore callbacks.  When the registration of the PV sched_clock
was done separate from overriding the save/restore hooks, it was possible
for Hyper-V to clobber the TSC save/restore callbacks without actually
switching to the Hyper-V timer.

Enabling a PV sched_clock is a one-way street, i.e. the kernel will never
revert to using TSC for sched_clock, and so there is no need to invoke the
TSC save/restore hooks (and if there was, it belongs in common PV code).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/clocksource/hyperv_timer.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index 5a52d0acf31f..4a21874e91b9 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -524,9 +524,6 @@ static __always_inline void hv_setup_sched_clock(void *sched_clock)
 }
 #elif defined CONFIG_PARAVIRT
 static u64 hv_ref_counter_at_suspend;
-static void (*old_save_sched_clock_state)(void);
-static void (*old_restore_sched_clock_state)(void);
-
 /*
  * Hyper-V clock counter resets during hibernation. Save and restore clock
  * offset during suspend/resume, while also considering the time passed
@@ -536,8 +533,6 @@ static void (*old_restore_sched_clock_state)(void);
  */
 static void hv_save_sched_clock_state(void)
 {
-	old_save_sched_clock_state();
-
 	hv_ref_counter_at_suspend = hv_read_reference_counter();
 }
 
@@ -550,8 +545,6 @@ static void hv_restore_sched_clock_state(void)
 	 *                - reference counter (time) now.
 	 */
 	hv_sched_clock_offset -= (hv_ref_counter_at_suspend - hv_read_reference_counter());
-
-	old_restore_sched_clock_state();
 }
 
 static __always_inline void hv_setup_sched_clock(void *sched_clock)
@@ -559,10 +552,7 @@ static __always_inline void hv_setup_sched_clock(void *sched_clock)
 	/* We're on x86/x64 *and* using PV ops */
 	paravirt_set_sched_clock(sched_clock);
 
-	old_save_sched_clock_state = x86_platform.save_sched_clock_state;
 	x86_platform.save_sched_clock_state = hv_save_sched_clock_state;
-
-	old_restore_sched_clock_state = x86_platform.restore_sched_clock_state;
 	x86_platform.restore_sched_clock_state = hv_restore_sched_clock_state;
 }
 #else /* !CONFIG_GENERIC_SCHED_CLOCK && !CONFIG_PARAVIRT */
-- 
2.48.1.711.g2feabab25a-goog


