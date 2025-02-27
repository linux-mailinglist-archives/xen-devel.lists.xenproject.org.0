Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB0A4728D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897484.1306231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTb1-00082U-4C; Thu, 27 Feb 2025 02:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897484.1306231; Thu, 27 Feb 2025 02:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTb0-0007qm-Mn; Thu, 27 Feb 2025 02:25:54 +0000
Received: by outflank-mailman (input) for mailman id 897484;
 Thu, 27 Feb 2025 02:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3WRD=VS=flex--seanjc.bounces.google.com=3v8u_ZwYKCZoM84HD6AIIAF8.6IGR8H-78P8FFCMNM.R8HJLID86N.ILA@srs-se1.protection.inumbo.net>)
 id 1tnTV7-0005qU-Fn
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:49 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ec514aa-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:44 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2f81a0d0a18so1091531a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:44 -0800 (PST)
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
X-Inumbo-ID: 4ec514aa-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622783; x=1741227583; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Za0nk5QeJovZveNmDgTJSzh3R0hb/7p0/gaKYZ4C/Vs=;
        b=Q5q2J/VjzoU+MMZ2merUpsvt4BFtgiTRf0sDvkFD4U6xwqPnu1LSys7fgsAf5yR9yF
         SpoJ53WspMLmuOZtGPm3xrFxJJZ8kieBtnrVM6qYjcYhx0FdozfXu9j9rKxfy2BwnnAi
         f/jDtWh5RFXyKfUqxuNjXdmDQUNupJhGvbWePrzSWnmc9ZaFfGqrSFI6m66dp8a8I+Ya
         HcxceJ8PLFygCaMItvADDlFnPSclPKU74xYspK/yAeYDS49bHXl/YJs7ehzCzKDXoclt
         zM5vmeejTDfPKadKC5Cd8CmEEig7avwdjc6zymHn59xz4iZcwr0LHms8+EPjpRsTQ9Jl
         jYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622783; x=1741227583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Za0nk5QeJovZveNmDgTJSzh3R0hb/7p0/gaKYZ4C/Vs=;
        b=nHk3UCOJjswsWO03CILbmS4cfSzyTo9RuIO33fM94MdzwR0tdLZE5y8YOvbFI0hiWo
         JATZoNPys0SX7MpR313VRZcuvZ8jfgnV5Ka0MwZOqP1/v0hpcXgQezRFaYP1fud1jKST
         48HbNb8UKENAbzAjMxTPy5kxBYuAKEMs78FgVtcIgcYfzdKtrceIqPkXVQBoJVh2SdfI
         cHu/XXlhSOcRRBr8FdlN4xclEpki49mALkPbviiVjRpWbxgszhpqMF7BpYUuxFCKlbTy
         in8j/Zgi4buiEaU98npoV1auDEAq3fg0NfTfJJOoHF6zpkdFWqUaz9uAMULnOX0LwPb2
         IC3A==
X-Forwarded-Encrypted: i=1; AJvYcCWMHLYiQxxbkhqGy7LK7udu/zWNHrjCOtVPTxcF3zoFl7PHC1VX2K4q+Cl2xxboeSCE+7jkjmhvhYg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5wS1vQsgsMn3bShGAyoz1pi6l3UtGIn+0UPLL9Y+WDnFrGen5
	JGDevl6vL+nTPJQI/zDvmLmotnidur3aGxbeDH/u9lZz23IntuTN0+uoDLYeLlE4z9g1io/5q+E
	QqQ==
X-Google-Smtp-Source: AGHT+IHPEy5y9WPVcI/hX8J+CDDBk9ezIawKhLRmwSNwFlW/vj5Sb4uKTsOn6iseYydXRMp+Q/+8QjZLtQQ=
X-Received: from pjbsm1.prod.google.com ([2002:a17:90b:2e41:b0:2f8:4024:b59a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d2d0:b0:2ee:b6c5:1def
 with SMTP id 98e67ed59e1d1-2fe68ad9ef3mr15165448a91.8.1740622783395; Wed, 26
 Feb 2025 18:19:43 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:39 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-24-seanjc@google.com>
Subject: [PATCH v2 23/38] x86/kvmclock: Refactor handling of
 PVCLOCK_TSC_STABLE_BIT during kvmclock_init()
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

Clean up the setting of PVCLOCK_TSC_STABLE_BIT during kvmclock init to
make it somewhat obvious that pvclock_read_flags() must be called *after*
pvclock_set_flags().

Note, in theory, a different PV clock could have set PVCLOCK_TSC_STABLE_BIT
in the supported flags, i.e. reading flags only if
KVM_FEATURE_CLOCKSOURCE_STABLE_BIT is set could very, very theoretically
result in a change in behavior.  In practice, the kernel only supports a
single PV clock.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 934ee4a4c6d4..0580fe1aefa0 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -304,7 +304,7 @@ static void __init kvm_sched_clock_init(bool stable)
 
 void __init kvmclock_init(void)
 {
-	u8 flags;
+	bool stable = false;
 
 	if (!kvm_para_available() || !kvmclock)
 		return;
@@ -331,11 +331,18 @@ void __init kvmclock_init(void)
 	kvm_register_clock("primary cpu clock");
 	pvclock_set_pvti_cpu0_va(hv_clock_boot);
 
-	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE_STABLE_BIT))
+	if (kvm_para_has_feature(KVM_FEATURE_CLOCKSOURCE_STABLE_BIT)) {
 		pvclock_set_flags(PVCLOCK_TSC_STABLE_BIT);
 
-	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
-	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
+		/*
+		 * Check if the clock is stable *after* marking TSC_STABLE as a
+		 * valid flag.
+		 */
+		stable = pvclock_read_flags(&hv_clock_boot[0].pvti) &
+			 PVCLOCK_TSC_STABLE_BIT;
+	}
+
+	kvm_sched_clock_init(stable);
 
 	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz);
 
-- 
2.48.1.711.g2feabab25a-goog


