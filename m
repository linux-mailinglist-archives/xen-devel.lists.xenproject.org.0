Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AAAA472A2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897620.1306373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbs-00005O-OT; Thu, 27 Feb 2025 02:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897620.1306373; Thu, 27 Feb 2025 02:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbs-0008RY-K9; Thu, 27 Feb 2025 02:26:48 +0000
Received: by outflank-mailman (input) for mailman id 897620;
 Thu, 27 Feb 2025 02:26:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZtn=VS=flex--seanjc.bounces.google.com=3wMu_ZwYKCZsN95IE7BJJBG9.7JHS9I-89Q9GGDNON.S9IKMJE97O.JMB@srs-se1.protection.inumbo.net>)
 id 1tnTV5-00063X-SF
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:47 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fa8b661-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:46 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2fbff6426f5so1023516a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:46 -0800 (PST)
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
X-Inumbo-ID: 4fa8b661-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622785; x=1741227585; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qN8YI5wmqMG6yVEs+7cu8Sw/AfoU86Z3NaGBSlCYqu0=;
        b=VqxlZ8u3A9VuOK4nb63P+b/hscjZnqQeFj/mLqrrblGm+Nu0A+8RDqn6EexwcYGrWQ
         KdSJ2uI/6kuUPtG01edtsXm99kO4KLxKXtLAsdAHSIFoGJHoONJgf2MV5LA/6CYIPzsS
         CEhjN03WP1kDpkKSE/727M3uz9b9SfMOitP9tAV+6WqzOLm5u2miWrzuLXyTywfivBX7
         9L0dSRG/6b3Yk90UpXafoy6+11CKte/ltszDrAg7ComHVg2LmJhoeCtEqpbntOgLY78V
         FNwXTFYQKXCOqfA/Eo0Ei1v1hTpph1xoyK5SSU2OOjbPuiVF08OCjF4of2s4uqQnvIa9
         oAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622785; x=1741227585;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qN8YI5wmqMG6yVEs+7cu8Sw/AfoU86Z3NaGBSlCYqu0=;
        b=xG0a7uD5m3SQEKt6ZZaBd67liBRUWu+DRgjotGBR5vL6VZg/xCLq/scMms63j+Bl9q
         H1DGC8QAcBcFhP1t3w0XmBTfN47h/bJreyEUnlxhIQ9l+9QLMK3oLE9eSK4TcGErylQ8
         5bWfCkGfgMYB6AzQRWxjUedgQ0JqNlwAaZv2p8coMCZ+eBgwOLrZBz/UyyD5yn3gzUVN
         tbw3PquN6Tul+8zkcxC/jzEI7VU7HgqMa9l33Qi18H2vUZwPWZos9PNi1t2GHOBcJNvG
         J9Wx9xvLJzFbHp/b8h4ZNkyGWZBfxg40vfXDnTuLaG9OT+tcEg86a275DMXkh/Mclvi3
         kPdg==
X-Forwarded-Encrypted: i=1; AJvYcCWXOyWZqXJywfMNVUCNa0c/7ON+Y3i68YTKoMYEuZpsmG1qP60oUP3j2IMZkub4C6ONRtyrE+GTHxI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyATi1fubndOA0bwIAQFCbimuXQdAdnCks2R2/bpAi7lt1qE2j
	3chqJKJ6/Bws1O2FL/R+uxa71JbdBc2pgVOsmMdpg7Okn1vAWjN6qtAKIMz0jiVydK5cAQrP9Df
	oqg==
X-Google-Smtp-Source: AGHT+IEw7VZRln4iIrg1rWM/7IZnuYkNWSUUNxKKGfY9HmA7vrLySNMf4INY1k647TDU8xAK61s1yi1H724=
X-Received: from pjbsw12.prod.google.com ([2002:a17:90b:2c8c:b0:2fa:284f:adae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5243:b0:2f4:434d:c7f0
 with SMTP id 98e67ed59e1d1-2fe68ada3e8mr17648463a91.12.1740622784911; Wed, 26
 Feb 2025 18:19:44 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:40 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-25-seanjc@google.com>
Subject: [PATCH v2 24/38] timekeeping: Resume clocksources before reading
 persistent clock
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

When resuming timekeeping after suspend, restore clocksources prior to
reading the persistent clock.  Paravirt clocks, e.g. kvmclock, tie the
validity of a PV persistent clock to a clocksource, i.e. reading the PV
persistent clock will return garbage if the underlying PV clocksource
hasn't been enabled.  The flaw has gone unnoticed because kvmclock is a
mess and uses its own suspend/resume hooks instead of the clocksource
suspend/resume hooks, which happens to work by sheer dumb luck (the
kvmclock resume hook runs before timekeeping_resume()).

Note, there is no evidence that any clocksource supported by the kernel
depends on a persistent clock.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/time/timekeeping.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index 1e67d076f195..332d053fa9ce 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -1794,11 +1794,16 @@ void timekeeping_resume(void)
 	u64 cycle_now, nsec;
 	unsigned long flags;
 
-	read_persistent_clock64(&ts_new);
-
 	clockevents_resume();
 	clocksource_resume();
 
+	/*
+	 * Read persistent time after clocksources have been resumed.  Paravirt
+	 * clocks have a nasty habit of piggybacking a persistent clock on a
+	 * system clock, and may return garbage if the system clock is suspended.
+	 */
+	read_persistent_clock64(&ts_new);
+
 	raw_spin_lock_irqsave(&tk_core.lock, flags);
 
 	/*
-- 
2.48.1.711.g2feabab25a-goog


