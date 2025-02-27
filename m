Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED12A4729B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897578.1306332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbW-0005w8-G8; Thu, 27 Feb 2025 02:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897578.1306332; Thu, 27 Feb 2025 02:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbW-0005u1-Br; Thu, 27 Feb 2025 02:26:26 +0000
Received: by outflank-mailman (input) for mailman id 897578;
 Thu, 27 Feb 2025 02:26:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OOxu=VS=flex--seanjc.bounces.google.com=3r8u_ZwYKCYo6so1xqu22uzs.q20Bs1-rs9szzw676.Bs1352xsq7.25u@srs-se1.protection.inumbo.net>)
 id 1tnTUo-0005qU-Db
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:30 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45571ecb-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:29 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2fc43be27f8so1570831a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:29 -0800 (PST)
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
X-Inumbo-ID: 45571ecb-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622767; x=1741227567; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cUIL6SYLHU+yTwrAtTegZ21noDNMwlKuhwHKs3VPMSg=;
        b=bpkIl56Hgd9ZObF8Ur3HqS1ANUSqe2kP2SO9AipsYonh45flBgG0KX0UAw11OxVeFY
         4bG+UeElb7DtRs3fzp7UYCazs5af0x89OpwsQug7+V6/dQ0w6pBdFGpAbr1/ft5S8ooE
         wjUtSIqLCm5xVp07b2nUqlBdxa3lSRdCXx0/aEbj45U2SUUEzZLhoJUcF6zGAzCGViIg
         lPmoloxmwHXIav28bK9TwynRfAd0sCgBTxvsHd1WChlZZJwIC/zquHnJHUKdKzN3Tmn7
         7jKtg5AseKvziOviX5HjXVAYHOh2bEnfNrFM+J8oEbNoH6QO2C2qVMGvRzfaa2c1YXX1
         eNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622767; x=1741227567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUIL6SYLHU+yTwrAtTegZ21noDNMwlKuhwHKs3VPMSg=;
        b=FytxsfMaWf6QA/eYpw3/bWRa2ghs9PPMz2807uEi5H7wsfh4+ac5Bl3SifYPOI8edq
         l+RGzmcdHS9DXgN7ThWNlGoQbgfOExjF3jwiPeDvzFaU8E/vujfCf8321CkdWOsq83ST
         7m7bMvBz+rg8gLLXixvIPnPaJbc+6oxtalePCYMUrprUulMX6b6Rhnna4nxE5jp3zSGY
         QwEHOrS3S05uvRY85f8up32ImdRw2lrKZCYkv643/myQ4tavWXZvmQo3xpxHgbNOAtBL
         eeNgC0UnnTf16rOO55j+HCG0gHnYUhKfXZIGYfQd/zJy56h4j4pN+vKcGhATIb065Z5C
         +xEA==
X-Forwarded-Encrypted: i=1; AJvYcCUxqThM6v+XYntyhT5y4xfY9JIX7EcBnLzCpBqZXIHeWAn8ghBhpVqVpfS8JvfcmKzc7aMZOfs3c/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywu5ZrYr2p0S5gC3VLXXjGq9UjcdOB6UtobpN9ZMuBVsc0q/ryL
	e6ykpkrzgL61efVdSBCSHjZ/kN2XTe0hjJGW2TeNYgNJikaDOyXH3dQLj0w/ArBARSvU4zRCaD0
	GBg==
X-Google-Smtp-Source: AGHT+IHyh9LqedkCKW+Gv/tYRFdHEhi/V70ldbMXUa2l8chtlUNDSfd68q5Rf4dBrz6sq443DVBJXoiGfdY=
X-Received: from pja6.prod.google.com ([2002:a17:90b:5486:b0:2ef:95f4:4619])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d44:b0:2f6:f32e:90ac
 with SMTP id 98e67ed59e1d1-2fe7e2fe521mr9393579a91.11.1740622767576; Wed, 26
 Feb 2025 18:19:27 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:30 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-15-seanjc@google.com>
Subject: [PATCH v2 14/38] x86/kvmclock: Move sched_clock save/restore helpers
 up in kvmclock.c
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

Move kvmclock's sched_clock save/restore helper "up" so that they can
(eventually) be referenced by kvm_sched_clock_init().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 108 ++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index aae6fba21331..c78db52ae399 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -70,6 +70,25 @@ static int kvm_set_wallclock(const struct timespec64 *now)
 	return -ENODEV;
 }
 
+static void kvm_register_clock(char *txt)
+{
+	struct pvclock_vsyscall_time_info *src = this_cpu_hvclock();
+	u64 pa;
+
+	if (!src)
+		return;
+
+	pa = slow_virt_to_phys(&src->pvti) | 0x01ULL;
+	wrmsrl(msr_kvm_system_time, pa);
+	pr_debug("kvm-clock: cpu %d, msr %llx, %s", smp_processor_id(), pa, txt);
+}
+
+static void kvmclock_disable(void)
+{
+	if (msr_kvm_system_time)
+		native_write_msr(msr_kvm_system_time, 0, 0);
+}
+
 static u64 kvm_clock_read(void)
 {
 	u64 ret;
@@ -90,6 +109,30 @@ static noinstr u64 kvm_sched_clock_read(void)
 	return pvclock_clocksource_read_nowd(this_cpu_pvti()) - kvm_sched_clock_offset;
 }
 
+static void kvm_save_sched_clock_state(void)
+{
+	/*
+	 * Stop host writes to kvmclock immediately prior to suspend/hibernate.
+	 * If the system is hibernating, then kvmclock will likely reside at a
+	 * different physical address when the system awakens, and host writes
+	 * to the old address prior to reconfiguring kvmclock would clobber
+	 * random memory.
+	 */
+	kvmclock_disable();
+}
+
+#ifdef CONFIG_SMP
+static void kvm_setup_secondary_clock(void)
+{
+	kvm_register_clock("secondary cpu clock");
+}
+#endif
+
+static void kvm_restore_sched_clock_state(void)
+{
+	kvm_register_clock("primary cpu clock, resume");
+}
+
 static inline void kvm_sched_clock_init(bool stable)
 {
 	kvm_sched_clock_offset = kvm_clock_read();
@@ -102,6 +145,17 @@ static inline void kvm_sched_clock_init(bool stable)
 		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
 }
 
+void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
+{
+	/*
+	 * Don't disable kvmclock on the BSP during suspend.  If kvmclock is
+	 * being used for sched_clock, then it needs to be kept alive until the
+	 * last minute, and restored as quickly as possible after resume.
+	 */
+	if (action != KVM_GUEST_BSP_SUSPEND)
+		kvmclock_disable();
+}
+
 /*
  * If we don't do that, there is the possibility that the guest
  * will calibrate under heavy load - thus, getting a lower lpj -
@@ -161,60 +215,6 @@ static struct clocksource kvm_clock = {
 	.enable	= kvm_cs_enable,
 };
 
-static void kvm_register_clock(char *txt)
-{
-	struct pvclock_vsyscall_time_info *src = this_cpu_hvclock();
-	u64 pa;
-
-	if (!src)
-		return;
-
-	pa = slow_virt_to_phys(&src->pvti) | 0x01ULL;
-	wrmsrl(msr_kvm_system_time, pa);
-	pr_debug("kvm-clock: cpu %d, msr %llx, %s", smp_processor_id(), pa, txt);
-}
-
-static void kvmclock_disable(void)
-{
-	if (msr_kvm_system_time)
-		native_write_msr(msr_kvm_system_time, 0, 0);
-}
-
-static void kvm_save_sched_clock_state(void)
-{
-	/*
-	 * Stop host writes to kvmclock immediately prior to suspend/hibernate.
-	 * If the system is hibernating, then kvmclock will likely reside at a
-	 * different physical address when the system awakens, and host writes
-	 * to the old address prior to reconfiguring kvmclock would clobber
-	 * random memory.
-	 */
-	kvmclock_disable();
-}
-
-static void kvm_restore_sched_clock_state(void)
-{
-	kvm_register_clock("primary cpu clock, resume");
-}
-
-void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
-{
-	/*
-	 * Don't disable kvmclock on the BSP during suspend.  If kvmclock is
-	 * being used for sched_clock, then it needs to be kept alive until the
-	 * last minute, and restored as quickly as possible after resume.
-	 */
-	if (action != KVM_GUEST_BSP_SUSPEND)
-		kvmclock_disable();
-}
-
-#ifdef CONFIG_SMP
-static void kvm_setup_secondary_clock(void)
-{
-	kvm_register_clock("secondary cpu clock");
-}
-#endif
-
 static void __init kvmclock_init_mem(void)
 {
 	unsigned long ncpus;
-- 
2.48.1.711.g2feabab25a-goog


