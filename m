Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id khjXHoimGWrtyAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB47603D34
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322224.1588573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySb-0006Aa-VY; Fri, 29 May 2026 14:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322224.1588573; Fri, 29 May 2026 14:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySb-00065I-8p; Fri, 29 May 2026 14:45:17 +0000
Received: by outflank-mailman (input) for mailman id 1322224;
 Fri, 29 May 2026 14:45:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3dqYZagYKCYExjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 1wSySY-0005Z2-3k
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:45:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSySX-000xsX-GA
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:45:13 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3dqYZagYKCYExjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 6a19a677-bab6-0a2a0a5309dd-0a2a4505b9fc-4
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:13 +0200
Received: from [209.85.216.73] (helo=mail-pj1-f73.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3dqYZagYKCYExjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 6a19a677-aaa8-0a2a45050019-d155d849ac39-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:13 +0200
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-367f715cbd0so13424836a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:12 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780065911; x=1780670711; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FoqgLgRaMBwMlzlRb5ZdKmNASLSl22kGdknpkiNEuDA=;
        b=bfgS0DUt/SbtEwKQJVBheJUrxY5bMLKeYEYyY6Jg1KpQNdS3mq/GRiinFyEzR2itXY
         HRMNOqu4CrVYiZs0dFpxtknfM0uycmnb775MtUaHaIkp8yu8xCdSHKStUiGNI9BFvLrI
         aLjGgvajZ1VCPobOC1emgOTU9qA4qIkK0JOQPi1K+9U7GhERP0W4pOHFk0Rh5tKzaQto
         4iPoAv0J3FMDoVq9vbZkH+BLCjbBy9zevcpol0L5cu7dGoJXdgBVeYTeE3kkW7uv6c5b
         SUnRng4nUrTlBUQQfeDz0hnK+sBHLcZyJ+KU55w1ucZd8aLIyzP0BphfPpNaHS/zM75t
         sKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065911; x=1780670711;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FoqgLgRaMBwMlzlRb5ZdKmNASLSl22kGdknpkiNEuDA=;
        b=O+lJih2s7sDq/qBVAM8U73Nz9D8iD/JE69vilqOdXcJVE2UcvupARWNIg0osqD9j9k
         28xz/2Or46IIXFuROCJQXq180tsRVU28kEKnQwU4+5hr8Ml+SXWqo8dY1YdUv9qHktOm
         uXF6UoHToQANIrnDVpOKFHA5w8Pf2jL0sLCXzM5CxTgKFuYxc18Twjzf4811PSyqkfKL
         CeLYBTstHgMavnnowqld9IkGba2o23S3ZTZKmlQSJUXC16JK7C4OgnKxi9aPtTL6imIk
         gBuFRmoDJwYxNeS4v74rTpsFBo48UVsWmUtrwxWLJ2nPU932rJuVPHTPDnWFCUc/v98O
         TPNw==
X-Forwarded-Encrypted: i=1; AFNElJ/+J4jOKlEdqOxguT1vb8EwZR/w9vxEfVX7kkF1QfbQ4uzqk0fTJe7fZAYxFWX3JNPIEVC+OEydpiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJb/iITz30DDfTrD0+YUEpz87rVPNacfdX6EAD+xab46UhhT8H
	g6qjExmSe7le4GZkuS9OreowNKJLNaxOlK6UxNXK7kmZTG7CaG6PcOMmwwZPduoPiMNsbuacEbM
	M9h4DlQ==
X-Received: from plbjh24.prod.google.com ([2002:a17:903:3298:b0:2bf:14c9:866d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4c2:b0:2bf:2589:7bc2
 with SMTP id d9443c01a7336-2bf367d3ab7mr1162735ad.15.1780065910985; Fri, 29
 May 2026 07:45:10 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:44:03 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-17-seanjc@google.com>
Subject: [PATCH v4 16/47] x86/kvm: Obtain TSC frequency from PV CPUID if present
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1780065913-E119B443-5351C6B5/0/0
X-purgate-type: clean
X-purgate-size: 5045
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[zytor.com,intel.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amazon.co.uk,amd.com,infradead.org,outlook.com,linutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:dwmw@amazon.co.uk,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw2@infradead.org,m:mhklinux@outlook.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lkml.org:url,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: EEB47603D34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Woodhouse <dwmw@amazon.co.uk>

In https://lkml.org/lkml/2008/10/1/246 a proposal was made for generic
CPUID conventions across hypervisors. It was mostly shot down in flames,
but the leaf at 0x40000010 containing timing information didn't die.

It's used by XNU and FreeBSD guests under all hypervisors=C2=B9=C2=B2 to de=
termine
the TSC frequency, and also exposed by the EC2 Nitro hypervisor (as
well as, presumably, VMware). FreeBSD's Bhyve is probably just about
to start exposing it too.

Use it under KVM to obtain the TSC frequency more accurately, instead of
reverse-calculating the frequency from the mul/shift values in the KVM
clock.  Use the information to get the CPU frequency as well (kvmclock
feeds in kvm_get_tsc_khz() for both TSC and CPU calibration), as the info
from CPUID is superior in every way; whether or not kvmclock should be
overriding CPU calibration in the first place is an entirely different
question.

Use the info from CPUID even if the user explicitly disables kvmclock, or
if it's unsupported.  The PV CPUID leaf has no dependency on kvmclock, and
is in fact more useful if kvmclock is disabled since the kernel won't be
able to use kvmclock to derive a derive the TSC frequency.

Before:
[    0.000020] tsc: Detected 2900.014 MHz processor

After:
[    0.000020] tsc: Detected 2900.015 MHz processor

$ cpuid -1 -l 0x40000010
CPU:
   hypervisor generic timing information (0x40000010):
      TSC frequency (Hz) =3D 2900015
      bus frequency (Hz) =3D 1000000

Note!  *Independently* query for non-null get_{cpu,tsc}_khz() overrides so
that kvmclock doesn't clobber x86_init.hyper.get_cpu_khz() if/when KVM adds
support for getting the CPU frequency separately from the TSC frequency.

=C2=B9 https://github.com/apple/darwin-xnu/blob/main/osfmk/i386/cpuid.c
=C2=B2 https://github.com/freebsd/freebsd-src/commit/4a432614f68

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvm.c      | 33 +++++++++++++++++++++++++++++++++
 arch/x86/kernel/kvmclock.c |  6 ++++--
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index dcef84da304b..909d3e5e5bcd 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -49,6 +49,8 @@
 #include <asm/svm.h>
 #include <asm/e820/api.h>
=20
+static unsigned int kvm_tsc_khz_cpuid __initdata;
+
 DEFINE_STATIC_KEY_FALSE_RO(kvm_async_pf_enabled);
=20
 static int kvmapf =3D 1;
@@ -911,6 +913,21 @@ bool kvm_para_available(void)
 }
 EXPORT_SYMBOL_GPL(kvm_para_available);
=20
+static u32 __init kvm_cpuid_timing_info_leaf(void)
+{
+	u32 base =3D kvm_cpuid_base();
+
+	if (!base || cpuid_eax(base) < (base | KVM_CPUID_TIMING_INFO))
+		return 0;
+
+	return base | KVM_CPUID_TIMING_INFO;
+}
+
+static unsigned int __init kvm_get_tsc_khz(void)
+{
+	return kvm_tsc_khz_cpuid;
+}
+
 unsigned int kvm_arch_para_features(void)
 {
 	return cpuid_eax(kvm_cpuid_base() | KVM_CPUID_FEATURES);
@@ -960,6 +977,7 @@ static void __init kvm_init_platform(void)
 		.mask_lo =3D (u32)(~(SZ_4G - tolud - 1)) | MTRR_PHYSMASK_V,
 		.mask_hi =3D (BIT_ULL(boot_cpu_data.x86_phys_bits) - 1) >> 32,
 	};
+	u32 timing_info_leaf;
=20
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
 	    kvm_para_has_feature(KVM_FEATURE_MIGRATION_CONTROL)) {
@@ -1007,6 +1025,21 @@ static void __init kvm_init_platform(void)
 			wrmsrq(MSR_KVM_MIGRATION_CONTROL,
 			       KVM_MIGRATION_READY);
 	}
+
+	/*
+	 * If KVM advertises the frequency directly in CPUID, use that instead
+	 * of reverse-calculating it from the KVM clock data, or worse, trying
+	 * to calibratate the TSC using an emulated device.
+	 */
+	timing_info_leaf =3D kvm_cpuid_timing_info_leaf();
+	if (timing_info_leaf) {
+		kvm_tsc_khz_cpuid =3D cpuid_eax(timing_info_leaf);
+		if (kvm_tsc_khz_cpuid) {
+			x86_init.hyper.get_tsc_khz =3D kvm_get_tsc_khz;
+			x86_init.hyper.get_cpu_khz =3D kvm_get_tsc_khz;
+		}
+	}
+
 	kvmclock_init();
 	x86_platform.apic_post_init =3D kvm_apic_init;
=20
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index c4a782a0c903..404f60741aa8 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -320,8 +320,10 @@ void __init kvmclock_init(void)
 	flags =3D pvclock_read_flags(&hv_clock_boot[0].pvti);
 	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
=20
-	x86_init.hyper.get_tsc_khz =3D kvmclock_get_tsc_khz;
-	x86_init.hyper.get_cpu_khz =3D kvmclock_get_tsc_khz;
+	if (!x86_init.hyper.get_tsc_khz)
+		x86_init.hyper.get_tsc_khz =3D kvmclock_get_tsc_khz;
+	if (!x86_init.hyper.get_cpu_khz)
+		x86_init.hyper.get_cpu_khz =3D kvmclock_get_tsc_khz;
 	x86_platform.get_wallclock =3D kvm_get_wallclock;
 	x86_platform.set_wallclock =3D kvm_set_wallclock;
 #ifdef CONFIG_X86_LOCAL_APIC
--=20
2.54.0.823.g6e5bcc1fc9-goog


