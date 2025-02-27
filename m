Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC5CA47219
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:19:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897377.1306113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUh-0008Nz-Kl; Thu, 27 Feb 2025 02:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897377.1306113; Thu, 27 Feb 2025 02:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUh-0008JF-C7; Thu, 27 Feb 2025 02:19:23 +0000
Received: by outflank-mailman (input) for mailman id 897377;
 Thu, 27 Feb 2025 02:19:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=spl/=VS=flex--seanjc.bounces.google.com=3psu_ZwYKCYExjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@srs-se1.protection.inumbo.net>)
 id 1tnTUf-00063X-KE
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:21 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 400dc887-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:20 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc404aaed5so1539241a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:20 -0800 (PST)
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
X-Inumbo-ID: 400dc887-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622759; x=1741227559; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=M9J4vMOsFh+KFESDavQmkJXQ4sHD+OspEOtA7Gz9lOo=;
        b=kBMCtQTlzwT17dQYBNJWc9bKWsopHxZmCAeRB7bx9TAq5bLcxA7wtVi7ssglwJ52Bw
         lISBR+xA+YYBVd2hC5R0cMqKhbahYj3bxiQJyeqjNtBUnxv13eBH5vr4K9WsLf4q3qhF
         1LmRAFd3dilGyJ6cj2cm76QiTHB89WJBXX/Wem0lST/iOzBOP1wMWQ9YM7j1KTI018VQ
         O032z3q4aEmnO7AB1ERh1uJbe/vB4ulQUZ1ao2d1FEH48mtoE62Eeui7+75ymDZ7srMY
         r24Hnqef5v35XzYjJscjLk8Z95EdCOEV1SnVlvH+DZtoouIvhoZKGjGFuhKmdUKjM317
         rBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622759; x=1741227559;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9J4vMOsFh+KFESDavQmkJXQ4sHD+OspEOtA7Gz9lOo=;
        b=TKaMTdRPzMN0W+N0l8OXoJpAPtMSSW81vPaRRLpUcW1St1B7RQPsmeB9Tc9AT6pDXh
         8+EnwFba5I74ogBkBoyqBao9O9qvCS5Hqv+MpBt0o73lUgvUn4fXay8sfR9Gzk7j82x6
         uS3QZXRtZxHqXWuX3Vaeiy9uU5L5xOWwMn2H04Cs2EmWAXRiADZX0assqQfwUQT2or5a
         4Srzb9uEKpLlLXuJAFniw8mWMIsABLqOA0m8szI6libUprJ8lJwB4GWpCH5+D9Q7Dx4o
         L1+c8NWzmxkMaxb6GXTmyDdxGo2xZ6RqYLagTMhBXHvEY0tzt3oRhPOJz/AEhd6S3Ags
         YieQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVJKek9IGTpH/A+oW2F/N0RDCkZ1nZtGbF2DAxNe8Rq3cz2CaEDx4hKM6wSpO2irn3ko9RhJH9Lvw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzIUvkNIyVTov3L3KYHKlmetuRQdGqhMwnUKVfSRC/foNDvKl2
	Ek+OsaLrTBTic8cZ/QYqLy+15Z4lJ3AQYOWFfhOzDDSK8MlOLU1hKcDUVA5QLyd2gkjzykS5xe0
	Y5Q==
X-Google-Smtp-Source: AGHT+IHGg2YNnpdN9W11waKGKjVdoMsbSztU341tlOE27g2wibRX2aXDt93sxEvHQRpF0p5gOf3qjCfl60c=
X-Received: from pjbsn14.prod.google.com ([2002:a17:90b:2e8e:b0:2fc:15bf:92f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dc5:b0:2f6:be57:49d2
 with SMTP id 98e67ed59e1d1-2fe7e32b7c8mr10195616a91.17.1740622758747; Wed, 26
 Feb 2025 18:19:18 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:25 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-10-seanjc@google.com>
Subject: [PATCH v2 09/38] clocksource: hyper-v: Drop wrappers to sched_clock
 save/restore helpers
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

Now that all of the Hyper-V timer sched_clock code is located in a single
file, drop the superfluous wrappers for the save/restore flows.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/clocksource/hyperv_timer.c | 34 +++++-------------------------
 include/clocksource/hyperv_timer.h |  2 --
 2 files changed, 5 insertions(+), 31 deletions(-)

diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index 86a55167bf5d..5a52d0acf31f 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -471,17 +471,6 @@ static void resume_hv_clock_tsc(struct clocksource *arg)
 	hv_set_msr(HV_MSR_REFERENCE_TSC, tsc_msr.as_uint64);
 }
 
-/*
- * Called during resume from hibernation, from overridden
- * x86_platform.restore_sched_clock_state routine. This is to adjust offsets
- * used to calculate time for hv tsc page based sched_clock, to account for
- * time spent before hibernation.
- */
-void hv_adj_sched_clock_offset(u64 offset)
-{
-	hv_sched_clock_offset -= offset;
-}
-
 #ifdef HAVE_VDSO_CLOCKMODE_HVCLOCK
 static int hv_cs_enable(struct clocksource *cs)
 {
@@ -545,12 +534,14 @@ static void (*old_restore_sched_clock_state)(void);
  * based clocksource, proceeds from where it left off during suspend and
  * it shows correct time for the timestamps of kernel messages after resume.
  */
-static void save_hv_clock_tsc_state(void)
+static void hv_save_sched_clock_state(void)
 {
+	old_save_sched_clock_state();
+
 	hv_ref_counter_at_suspend = hv_read_reference_counter();
 }
 
-static void restore_hv_clock_tsc_state(void)
+static void hv_restore_sched_clock_state(void)
 {
 	/*
 	 * Adjust the offsets used by hv tsc clocksource to
@@ -558,23 +549,8 @@ static void restore_hv_clock_tsc_state(void)
 	 * adjusted value = reference counter (time) at suspend
 	 *                - reference counter (time) now.
 	 */
-	hv_adj_sched_clock_offset(hv_ref_counter_at_suspend - hv_read_reference_counter());
-}
-/*
- * Functions to override save_sched_clock_state and restore_sched_clock_state
- * functions of x86_platform. The Hyper-V clock counter is reset during
- * suspend-resume and the offset used to measure time needs to be
- * corrected, post resume.
- */
-static void hv_save_sched_clock_state(void)
-{
-	old_save_sched_clock_state();
-	save_hv_clock_tsc_state();
-}
+	hv_sched_clock_offset -= (hv_ref_counter_at_suspend - hv_read_reference_counter());
 
-static void hv_restore_sched_clock_state(void)
-{
-	restore_hv_clock_tsc_state();
 	old_restore_sched_clock_state();
 }
 
diff --git a/include/clocksource/hyperv_timer.h b/include/clocksource/hyperv_timer.h
index d48dd4176fd3..a4c81a60f53d 100644
--- a/include/clocksource/hyperv_timer.h
+++ b/include/clocksource/hyperv_timer.h
@@ -38,8 +38,6 @@ extern void hv_remap_tsc_clocksource(void);
 extern unsigned long hv_get_tsc_pfn(void);
 extern struct ms_hyperv_tsc_page *hv_get_tsc_page(void);
 
-extern void hv_adj_sched_clock_offset(u64 offset);
-
 static __always_inline bool
 hv_read_tsc_page_tsc(const struct ms_hyperv_tsc_page *tsc_pg,
 		     u64 *cur_tsc, u64 *time)
-- 
2.48.1.711.g2feabab25a-goog


