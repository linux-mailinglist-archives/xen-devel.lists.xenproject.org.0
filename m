Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A6FA2468C
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880067.1290308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34w-0005e5-3u; Sat, 01 Feb 2025 02:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880067.1290308; Sat, 01 Feb 2025 02:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34v-0005ZF-TN; Sat, 01 Feb 2025 02:17:49 +0000
Received: by outflank-mailman (input) for mailman id 880067;
 Sat, 01 Feb 2025 02:17:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/5/f=UY=flex--seanjc.bounces.google.com=3SISdZwYKCQs3plyunrzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@srs-se1.protection.inumbo.net>)
 id 1te34u-0002if-0q
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:48 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b962a0a4-e042-11ef-99a4-01e77a169b0f;
 Sat, 01 Feb 2025 03:17:46 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-2163a2a1ec2so84584285ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:46 -0800 (PST)
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
X-Inumbo-ID: b962a0a4-e042-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376265; x=1738981065; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=W1XV2ZKxBzpt6fRRKseHNiWV51nuIILy1d39LBlT9SE=;
        b=YSnjWB045BPExheFD6uLi7ri+u9ukE9dLTuS43BIdkV+HnTv3swk9S/l+KtwhR2gQe
         4v2rrsnvCRSltcMz+21PRkGBAWIao+ILmVk+bz+8ClkaOp/QjSmPFhjFI/uXpcD6L1Gn
         RqnqUr11j7CwiZjzg9de9ATzWZvavnoLqw9tJm5ZbXZ3D7piXfV5UBT3v3ftannuzKJT
         TQqzyqNV9czKtkIvePy0349/2lS4Mr1GO30AFfkNvl4rItVB3XdFMB0/Q+8FwUumcFq+
         NHUfxl3ztEWzPv800VsARDu7yFSK7KYiF9Pz+9EkBmcTb/WCF33mejbDZtFY0jlczj5Q
         mCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376265; x=1738981065;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W1XV2ZKxBzpt6fRRKseHNiWV51nuIILy1d39LBlT9SE=;
        b=sq6nNtHglsav0xHMmQB49i7M9//u6ChmR2RHEHkeALhB+hJ8EJ1vCljprOeezuqcJ5
         dVUWWf/+TTkF9Co8Y5PoPOS0k7Vc6zmn2qnaRe/c0OB1EO1hFISriNsFM7qhE1ys4RCd
         9YwYl2m8m4WygPnDrHkSwMLGsKiLrXYxwuA/QYZM8E+QHn1a5tAPpQn/phQTWBT/TM50
         TtTk6+1njyWskF+Ti4VoTNvLqoy3GnO0qpCLtk8/d3yNHhJkBHrDpY3WNJVRGQkfCY9K
         nRr4+ZsdScMHMiBquDWJfttN00sab2zmsramsj1C6MJHv0ViQreCgCPQCTiL1H7HmtD8
         DATQ==
X-Forwarded-Encrypted: i=1; AJvYcCXag+VTmtFArNWS87zwAmjXpjrZoWuAIG4mijYQ9rmlRsJhbuDnJxL5kDQEQKK+xHYPM4YPlCGyLm8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5SpHsF+iFsgxhU8HtdTEeKVGyglvpzROk/R8O4IFMIXe5jqWs
	PmBLkpaYLSoGNfMJZsaSdw+gMIQR+hwPQfzxC1dWBPPdpZwuBn3LywywQostR+g2vJDERlIpT1l
	qaQ==
X-Google-Smtp-Source: AGHT+IGSSeREbj02hPb3cDa39T9c0oKEk7xpncELnx14V1Vrs2HnSpCp6+OTk/Z1j4CkHarX3h8UUIGOLcI=
X-Received: from pjbsb14.prod.google.com ([2002:a17:90b:50ce:b0:2f4:465d:5c61])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:244c:b0:215:f1c2:fcc4
 with SMTP id d9443c01a7336-21dd7deeff4mr227157665ad.41.1738376264849; Fri, 31
 Jan 2025 18:17:44 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:12 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-11-seanjc@google.com>
Subject: [PATCH 10/16] x86/paravirt: Move handling of unstable PV clocks into paravirt_set_sched_clock()
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Sean Christopherson <seanjc@google.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Move the handling of unstable PV clocks, of which kvmclock is the only
example, into paravirt_set_sched_clock().  This will allow modifying
paravirt_set_sched_clock() to keep using the TSC for sched_clock in
certain scenarios without unintentionally marking the TSC-based clock as
unstable.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/paravirt.h | 7 ++++++-
 arch/x86/kernel/kvmclock.c      | 5 +----
 arch/x86/kernel/paravirt.c      | 6 +++++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 041aff51eb50..cfceabd5f7e1 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -28,7 +28,12 @@ u64 dummy_sched_clock(void);
 DECLARE_STATIC_CALL(pv_steal_clock, dummy_steal_clock);
 DECLARE_STATIC_CALL(pv_sched_clock, dummy_sched_clock);
 
-void paravirt_set_sched_clock(u64 (*func)(void));
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable);
+
+static inline void paravirt_set_sched_clock(u64 (*func)(void))
+{
+	__paravirt_set_sched_clock(func, true);
+}
 
 static __always_inline u64 paravirt_sched_clock(void)
 {
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index b41ac7f27b9f..890535ddc059 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -12,7 +12,6 @@
 #include <linux/hardirq.h>
 #include <linux/cpuhotplug.h>
 #include <linux/sched.h>
-#include <linux/sched/clock.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/set_memory.h>
@@ -93,10 +92,8 @@ static noinstr u64 kvm_sched_clock_read(void)
 
 static inline void kvm_sched_clock_init(bool stable)
 {
-	if (!stable)
-		clear_sched_clock_stable();
 	kvm_sched_clock_offset = kvm_clock_read();
-	paravirt_set_sched_clock(kvm_sched_clock_read);
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable);
 
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 1ccaa3397a67..55c819673a9d 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -14,6 +14,7 @@
 #include <linux/highmem.h>
 #include <linux/kprobes.h>
 #include <linux/pgtable.h>
+#include <linux/sched/clock.h>
 #include <linux/static_call.h>
 
 #include <asm/bug.h>
@@ -85,8 +86,11 @@ static u64 native_steal_clock(int cpu)
 DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
 DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
 
-void paravirt_set_sched_clock(u64 (*func)(void))
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable)
 {
+	if (!stable)
+		clear_sched_clock_stable();
+
 	static_call_update(pv_sched_clock, func);
 }
 
-- 
2.48.1.362.g079036d154-goog


