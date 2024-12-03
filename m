Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBEF9E10AE
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 02:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847165.1262312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIHPa-0000pv-It; Tue, 03 Dec 2024 01:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847165.1262312; Tue, 03 Dec 2024 01:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIHPa-0000iH-B3; Tue, 03 Dec 2024 01:09:10 +0000
Received: by outflank-mailman (input) for mailman id 847165;
 Tue, 03 Dec 2024 01:00:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=soDL=S4=flex--kevinloughlin.bounces.google.com=3KVhOZw0KAFQ60H497AG237492AA270.yA8@srs-se1.protection.inumbo.net>)
 id 1tIHHJ-0004Oy-Ft
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 01:00:37 +0000
Received: from mail-oa1-x4a.google.com (mail-oa1-x4a.google.com
 [2001:4860:4864:20::4a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01407258-b112-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 02:00:36 +0100 (CET)
Received: by mail-oa1-x4a.google.com with SMTP id
 586e51a60fabf-29e422f0433so1842407fac.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 17:00:36 -0800 (PST)
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
X-Inumbo-ID: 01407258-b112-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733187635; x=1733792435; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+a3eBnHKvD8AQod1gMB/LKTW1oN3to08D39Docv/eQ=;
        b=MAnPcCO5k7gMSM7zwVCsDFPTcrgDAHrL5jkMdpwuabPU6UeObqFqWAz2/fgtBHGkWt
         BgP3FkwM9i62CV4aR6a3Jy15/NdWpa6YBRg9EkaBfA0M3tVxjnchZnm9gyEoaHiRnGY2
         fEgXVNkruswC2eZeD6HuYZXHVILA8T6vuPVzsdbnOI6dQDeWY90q8IHyhth/gFQXo/l9
         oTRfkz6UqO/6wsMmnrRTxgs0xfIpqhSzsV/AhLdjwXBRmhusxV0jTqhpSexYsjDwVHNY
         /iDWb/ucSCz5/y1vKPmoq9oF6ucWxoxUIznfMxgCz6T4BpPIe0Ntmw1P62g51eftYa1c
         +tSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733187635; x=1733792435;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d+a3eBnHKvD8AQod1gMB/LKTW1oN3to08D39Docv/eQ=;
        b=uGvH6wv2ICY+RrF7hZSmIfbkwX5rDVk/z9bIJeGeqqC59ogMromlMsprDMX9MayrfM
         5hxbZbDCLj14QNyKty0UYdaqL5abveDxiMB+sAUSWEaUxGw9NBbRb0soC4b0tcAzUnWe
         1jLE/hE/roQmAZg+m9DetBDg/jNtqRjWQHRmAlWAYEUO8bknbKCYFV/noTz6Ps3P86x5
         9Xq9iff3tZc18FZNBdDpI4/GbGVLXknqASOZN/LOiEdApPUjFkWDIqkdwVXntKxBQLlY
         Yrk4VrcCsDgAMSX7Vgod0odD8m2YDgOUppb0cLXwubwqMhAAePEMfgLp7XIRDQa09u0y
         EluA==
X-Forwarded-Encrypted: i=1; AJvYcCVJVkbBTkK7PfybxCDRB1Vovf7u5h2EmlRQic7/ywcefHfh1nfCxhXgR/bapS5LnwGVP/1dwR16JHc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxneZbyNEZVy/16SMidNwKHDFboBydXU9GudeoRP8/KBHxalRG/
	t/p9IGvJKwv9t81fV5Te09xrlC5Whmi49UrT+mlTIGgWnVBsfKe4Qq53kdbru98uj8Z46Rx4Jga
	rnR+SXlLRFnnTLsTr5bx2yq5A8RBTKA==
X-Google-Smtp-Source: AGHT+IHlAWUl/6xhfzZLqge5+mtkzOWOXTSZQKntjfye63eE/1sMNIDsJdEGUh7DCOLnVMK90ja1kBMWTjMKXb6+Bxua
X-Received: from ioay19.prod.google.com ([2002:a6b:c413:0:b0:841:802b:8e24])
 (user=kevinloughlin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:2b85:b0:83a:872f:4b98 with SMTP id ca18e2360f4ac-8445b53e7d6mr104251439f.2.1733187625111;
 Mon, 02 Dec 2024 17:00:25 -0800 (PST)
Date: Tue,  3 Dec 2024 00:59:20 +0000
In-Reply-To: <20241203005921.1119116-1-kevinloughlin@google.com>
Mime-Version: 1.0
References: <20241203005921.1119116-1-kevinloughlin@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203005921.1119116-2-kevinloughlin@google.com>
Subject: [RFC PATCH 1/2] x86, lib, xenpv: Add WBNOINVD helper functions
From: Kevin Loughlin <kevinloughlin@google.com>
To: linux-kernel@vger.kernel.org
Cc: seanjc@google.com, pbonzini@redhat.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kvm@vger.kernel.org, thomas.lendacky@amd.com, 
	pgonda@google.com, sidtelang@google.com, mizhang@google.com, 
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

In line with WBINVD usage, add WBONINVD helper functions, accounting
for kernels built with and without CONFIG_PARAVIRT_XXL.

Signed-off-by: Kevin Loughlin <kevinloughlin@google.com>
---
 arch/x86/include/asm/paravirt.h       |  7 +++++++
 arch/x86/include/asm/paravirt_types.h |  1 +
 arch/x86/include/asm/smp.h            |  7 +++++++
 arch/x86/include/asm/special_insns.h  | 12 +++++++++++-
 arch/x86/kernel/paravirt.c            |  6 ++++++
 arch/x86/lib/cache-smp.c              | 12 ++++++++++++
 arch/x86/xen/enlighten_pv.c           |  1 +
 7 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index d4eb9e1d61b8..c040af2d8eff 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -187,6 +187,13 @@ static __always_inline void wbinvd(void)
 	PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT_XEN);
 }
 
+extern noinstr void pv_native_wbnoinvd(void);
+
+static __always_inline void wbnoinvd(void)
+{
+	PVOP_ALT_VCALL0(cpu.wbnoinvd, "wbnoinvd", ALT_NOT_XEN);
+}
+
 static inline u64 paravirt_read_msr(unsigned msr)
 {
 	return PVOP_CALL1(u64, cpu.read_msr, msr);
diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
index 8d4fbe1be489..9a3f38ad1958 100644
--- a/arch/x86/include/asm/paravirt_types.h
+++ b/arch/x86/include/asm/paravirt_types.h
@@ -87,6 +87,7 @@ struct pv_cpu_ops {
 #endif
 
 	void (*wbinvd)(void);
+	void (*wbnoinvd)(void);
 
 	/* cpuid emulation, mostly so that caps bits can be disabled */
 	void (*cpuid)(unsigned int *eax, unsigned int *ebx,
diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index ca073f40698f..ecf93a243b83 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -112,6 +112,7 @@ void native_play_dead(void);
 void play_dead_common(void);
 void wbinvd_on_cpu(int cpu);
 int wbinvd_on_all_cpus(void);
+int wbnoinvd_on_all_cpus(void);
 
 void smp_kick_mwait_play_dead(void);
 
@@ -160,6 +161,12 @@ static inline int wbinvd_on_all_cpus(void)
 	return 0;
 }
 
+static inline int wbnoinvd_on_all_cpus(void)
+{
+	wbnoinvd();
+	return 0;
+}
+
 static inline struct cpumask *cpu_llc_shared_mask(int cpu)
 {
 	return (struct cpumask *)cpumask_of(0);
diff --git a/arch/x86/include/asm/special_insns.h b/arch/x86/include/asm/special_insns.h
index aec6e2d3aa1d..c2d16ddcd79b 100644
--- a/arch/x86/include/asm/special_insns.h
+++ b/arch/x86/include/asm/special_insns.h
@@ -117,7 +117,12 @@ static inline void wrpkru(u32 pkru)
 
 static __always_inline void native_wbinvd(void)
 {
-	asm volatile("wbinvd": : :"memory");
+	asm volatile("wbinvd" : : : "memory");
+}
+
+static __always_inline void native_wbnoinvd(void)
+{
+	asm volatile("wbnoinvd" : : : "memory");
 }
 
 static inline unsigned long __read_cr4(void)
@@ -173,6 +178,11 @@ static __always_inline void wbinvd(void)
 	native_wbinvd();
 }
 
+static __always_inline void wbnoinvd(void)
+{
+	native_wbnoinvd();
+}
+
 #endif /* CONFIG_PARAVIRT_XXL */
 
 static __always_inline void clflush(volatile void *__p)
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index fec381533555..a66b708d8a1e 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -121,6 +121,11 @@ noinstr void pv_native_wbinvd(void)
 	native_wbinvd();
 }
 
+noinstr void pv_native_wbnoinvd(void)
+{
+	native_wbnoinvd();
+}
+
 static noinstr void pv_native_safe_halt(void)
 {
 	native_safe_halt();
@@ -149,6 +154,7 @@ struct paravirt_patch_template pv_ops = {
 	.cpu.write_cr0		= native_write_cr0,
 	.cpu.write_cr4		= native_write_cr4,
 	.cpu.wbinvd		= pv_native_wbinvd,
+	.cpu.wbnoinvd		= pv_native_wbnoinvd,
 	.cpu.read_msr		= native_read_msr,
 	.cpu.write_msr		= native_write_msr,
 	.cpu.read_msr_safe	= native_read_msr_safe,
diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
index 7af743bd3b13..7ac5cca53031 100644
--- a/arch/x86/lib/cache-smp.c
+++ b/arch/x86/lib/cache-smp.c
@@ -20,3 +20,15 @@ int wbinvd_on_all_cpus(void)
 	return 0;
 }
 EXPORT_SYMBOL(wbinvd_on_all_cpus);
+
+static void __wbnoinvd(void *dummy)
+{
+	wbnoinvd();
+}
+
+int wbnoinvd_on_all_cpus(void)
+{
+	on_each_cpu(__wbnoinvd, NULL, 1);
+	return 0;
+}
+EXPORT_SYMBOL(wbnoinvd_on_all_cpus);
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index d6818c6cafda..a5c76a6f8976 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -1162,6 +1162,7 @@ static const typeof(pv_ops) xen_cpu_ops __initconst = {
 		.write_cr4 = xen_write_cr4,
 
 		.wbinvd = pv_native_wbinvd,
+		.wbnoinvd = pv_native_wbnoinvd,
 
 		.read_msr = xen_read_msr,
 		.write_msr = xen_write_msr,
-- 
2.47.0.338.g60cca15819-goog


