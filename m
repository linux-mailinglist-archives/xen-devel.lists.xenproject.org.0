Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0uTEFmlrRWq6/goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:32:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D566F0E38
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:32:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=gbdGjLPv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=google.com
Received: from list by lists.xenproject.org with outflank-mailman.1350364.1607819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fe-0007oC-2K; Wed, 01 Jul 2026 19:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350364.1607819; Wed, 01 Jul 2026 19:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fd-0007mU-Vl; Wed, 01 Jul 2026 19:32:29 +0000
Received: by outflank-mailman (input) for mailman id 1350364;
 Wed, 01 Jul 2026 19:32:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3SWtFagYKCY4Aws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@flex--seanjc.bounces.google.com>)
 id 1wf0fc-0007Zv-SD
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0fc-00Bw10-95
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:28 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3SWtFagYKCY4Aws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@flex--seanjc.bounces.google.com>)
 id 6a456b35-bab6-0a2a0a5309dd-0a2a450a9d4e-16
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:28 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3SWtFagYKCY4Aws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@flex--seanjc.bounces.google.com>)
 id 6a456b4a-e40e-0a2a450a0019-d155d6cac001-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:28 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2c80f89b64bso15742295ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:27 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934346; x=1783539146; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=esF5eJj/7ACJs9NShhG3o0+XzSBpzRsvPz4C7FhhKMM=;
        b=gbdGjLPvfSHGpnVGpCwK7ucojnV45lSdH+Lk6BO1No0nRwZavh8NOnaS9xwxrVSUXE
         UKdqxnMsYhWoqj/nIUbM9LSUjZ0iXgvN6d/qN0MkU6plvKrkwJ4wp3nao5phv+y9Gtsn
         cG8Z10qjKoBfQ+9fgdAD5mE9NsvU2uDW0eLnKvprKI6k7XSaw663hdOJgSZnKS2LddGx
         7kvQJGJN9QsIeMcKg67ceih1NTnAdBvpkmPscJlI6AAI5l+XDXtdZgUjyhBAsp8pN1cQ
         2h7fCh6OGZbg5aYcJLv1Ddeal1uJkTMMo4wLZx1fkyv8t9wPDl8kq2pWG8Y2JFthJQat
         /W0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934346; x=1783539146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esF5eJj/7ACJs9NShhG3o0+XzSBpzRsvPz4C7FhhKMM=;
        b=VXCxBsF8BhG427lMR8CuLR+esaGE2ZK+mJWQGnU8g5jrR23Xr80zf23ZH8Oh/4sXjv
         Jx0f/2pNMnrCn66oxcarM5g50p2ZfoFdXgmH5z5Bm33yiEHPdStbGdnhJJ66W/t45aRE
         bbvqdNPagI9VeufmOWxHlvJ0ImoVawJ39yRaDBajGPvvqR2GdpuE8pyoCEyQaLAfcCXq
         Wy6nZZJvL0ZN8DmcnsvJN93uc9YNMcD2EVPcX3xwy4Au2QrS3ZCYNY1HzcsUAcOqig1S
         VBP3/DNfun1TlPJYjoyOluR2lzjXKG4ByOfdPeY4e23DWdmCbMYzHD8qRddJ0nAxWmxS
         ymhA==
X-Forwarded-Encrypted: i=1; AHgh+RpgXwACTmF8tJwt8dHwWZiyay5TdhXGy38D3TjidMjVh32Bua/YRlxakYOI8rjbvV1eCp1s2K7LZeM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVZd4amDY+iqn7uZFCZiGjL09wCReGjZI6Y6fa5bV+vaaQd7jk
	8w0jKmHVT47MqgmQc5gwnjOcaf7tdP2AJinoLnhJsAFhKaGgiZuqrIjJMZj/tRiaQbvTntYIU21
	Iev8rEg==
X-Received: from plfz4.prod.google.com ([2002:a17:902:d544:b0:2c7:f3dc:ae29])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e811:b0:2c9:f73d:4b38
 with SMTP id d9443c01a7336-2ca7e6db91bmr32521425ad.19.1782934345724; Wed, 01
 Jul 2026 12:32:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:22 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-2-seanjc@google.com>
Subject: [PATCH v5 01/51] x86/apic: Provide helpers to set local APIC timer
 period in hz and khz
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1782934348-D7935DDE-2F08127A/0/0
X-purgate-type: clean
X-purgate-size: 5605
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zytor.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,amazon.co.uk,infradead.org,outlook.com,linutronix.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:mhklinux@outlook.com
 ,m:tglx@linutronix.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09D566F0E38

Add and use APIs to set the local APIC timer period instead of open coding
the subtle HZ math in a all external callers, and make lapic_timer_period
local to apic.c.  Provide APIs to specify the frequency in both hertz and
kilohertz so that Hyper-V and VMware code aren't forced to lose precision.

Opportunistically use mul_u64_u32_div() to harden against the possibility
that the period in Khz is greater than 4294967, i.e. if the APIC timer runs
at ~4.29 GHz.  As pointed out by Sashiko, 4294968 * 1000 == 0x1_000002c0,
and thus a Khz period of 4294968 would silently overflow the 32-bit
unsigned integer used by most callers.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/apic.h    |  3 ++-
 arch/x86/kernel/apic/apic.c    | 12 +++++++++++-
 arch/x86/kernel/cpu/mshyperv.c |  5 +----
 arch/x86/kernel/cpu/vmware.c   |  4 +---
 arch/x86/kernel/jailhouse.c    |  2 +-
 arch/x86/kernel/tsc.c          |  2 +-
 arch/x86/kernel/tsc_msr.c      |  2 +-
 7 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 9cd493d467d4..cd84a94688a2 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -63,7 +63,6 @@ extern int apic_verbosity;
 extern int local_apic_timer_c2_ok;
 
 extern bool apic_is_disabled;
-extern unsigned int lapic_timer_period;
 
 extern enum apic_intr_mode_id apic_intr_mode;
 enum apic_intr_mode_id {
@@ -138,6 +137,8 @@ void register_lapic_address(unsigned long address);
 extern void setup_boot_APIC_clock(void);
 extern void setup_secondary_APIC_clock(void);
 extern void lapic_update_tsc_freq(void);
+extern void apic_set_timer_period_hz(u64 period_hz, const char *source);
+extern void apic_set_timer_period_khz(u64 period_khz, const char *source);
 
 #ifdef CONFIG_X86_64
 static inline bool apic_force_enable(unsigned long addr)
diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index aa1e19979aa8..8d3d930576fd 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -176,7 +176,7 @@ static struct resource lapic_resource = {
 };
 
 /* Measured in ticks per HZ. */
-unsigned int lapic_timer_period = 0;
+static unsigned int lapic_timer_period;
 
 static void apic_pm_activate(void);
 
@@ -796,6 +796,16 @@ bool __init apic_needs_pit(void)
 	return lapic_timer_period == 0;
 }
 
+void apic_set_timer_period_khz(u64 period_khz, const char *source)
+{
+	lapic_timer_period = mul_u64_u32_div(period_khz, 1000, HZ);
+}
+
+void apic_set_timer_period_hz(u64 period_hz, const char *source)
+{
+	lapic_timer_period = div_u64(period_hz, HZ);
+}
+
 static int __init calibrate_APIC_clock(void)
 {
 	struct clock_event_device *levt = this_cpu_ptr(&lapic_events);
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 185d4f677ec0..87beecec76f0 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -646,10 +646,7 @@ static void __init ms_hyperv_init_platform(void)
 		u64	hv_lapic_frequency;
 
 		rdmsrq(HV_X64_MSR_APIC_FREQUENCY, hv_lapic_frequency);
-		hv_lapic_frequency = div_u64(hv_lapic_frequency, HZ);
-		lapic_timer_period = hv_lapic_frequency;
-		pr_info("Hyper-V: LAPIC Timer Frequency: %#x\n",
-			lapic_timer_period);
+		apic_set_timer_period_hz(hv_lapic_frequency, "Hyper-V hypervisor");
 	}
 
 	register_nmi_handler(NMI_UNKNOWN, hv_nmi_unknown, NMI_FLAG_FIRST,
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 34b73573b108..36f779dd311d 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -424,9 +424,7 @@ static void __init vmware_platform_setup(void)
 
 #ifdef CONFIG_X86_LOCAL_APIC
 		/* Skip lapic calibration since we know the bus frequency. */
-		lapic_timer_period = ecx / HZ;
-		pr_info("Host bus clock speed read from hypervisor : %u Hz\n",
-			ecx);
+		apic_set_timer_period_hz(ecx, "VMware hypervisor");
 #endif
 	} else {
 		pr_warn("Failed to get TSC freq from the hypervisor\n");
diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index f58ce9220e0f..f2d4ef89c085 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -65,7 +65,7 @@ static void jailhouse_get_wallclock(struct timespec64 *now)
 
 static void __init jailhouse_timer_init(void)
 {
-	lapic_timer_period = setup_data.v1.apic_khz * (1000 / HZ);
+	apic_set_timer_period_khz(setup_data.v1.apic_khz, "Jailhouse hypervisor");
 }
 
 static unsigned long jailhouse_get_tsc(void)
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index ce10ae4b298b..f9ecc9256863 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -717,7 +717,7 @@ unsigned long native_calibrate_tsc(void)
 	 * lapic_timer_period here to avoid having to calibrate the APIC
 	 * timer later.
 	 */
-	lapic_timer_period = crystal_khz * 1000 / HZ;
+	apic_set_timer_period_khz(crystal_khz, "CPUID 0x15/0x16");
 #endif
 
 	return crystal_khz * ebx_numerator / eax_denominator;
diff --git a/arch/x86/kernel/tsc_msr.c b/arch/x86/kernel/tsc_msr.c
index 48e6cc1cb017..7e990871e041 100644
--- a/arch/x86/kernel/tsc_msr.c
+++ b/arch/x86/kernel/tsc_msr.c
@@ -211,7 +211,7 @@ unsigned long cpu_khz_from_msr(void)
 		pr_err("Error MSR_FSB_FREQ index %d is unknown\n", index);
 
 #ifdef CONFIG_X86_LOCAL_APIC
-	lapic_timer_period = (freq * 1000) / HZ;
+	apic_set_timer_period_khz(freq, "MSR_FSB_FREQ");
 #endif
 
 	/*
-- 
2.55.0.rc0.799.gd6f94ed593-goog


