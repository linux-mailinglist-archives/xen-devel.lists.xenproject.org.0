Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B507DA246B2
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:20:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880152.1290359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te37r-0003ku-P1; Sat, 01 Feb 2025 02:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880152.1290359; Sat, 01 Feb 2025 02:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te37r-0003in-KB; Sat, 01 Feb 2025 02:20:51 +0000
Received: by outflank-mailman (input) for mailman id 880152;
 Sat, 01 Feb 2025 02:20:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jBhQ=UY=flex--seanjc.bounces.google.com=3ToSdZwYKCRE9vr40tx55x2v.t53Ev4-uvCv22z9A9.Ev46850vtA.58x@srs-se1.protection.inumbo.net>)
 id 1te34z-0002if-8r
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:53 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc88896b-e042-11ef-99a4-01e77a169b0f;
 Sat, 01 Feb 2025 03:17:51 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2f5538a2356so4881593a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:51 -0800 (PST)
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
X-Inumbo-ID: bc88896b-e042-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376270; x=1738981070; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZKnHj9nGtIPNyoOdVCsq53ZVe6onbdoIhwKKzEiQlk=;
        b=Jd934xFiT8pZMSQsjBdG0e9YkEXik+BqlWo9iByf1zh6oqCzzWF366XOC5d0bC7yf8
         F21aJKxvx7uNqPvK3pBAlKLiS6kYOQngLbWVOitvMdsq2aJ5Ihr1BoW9pqQD4tYqdSyA
         +aoEgRwOeGU7XdJ5es0ssW5FHSZpVngNkfbiGnkA3yeaSEBc9tkjkXeMGQT8KLNz9GV2
         LyJIrHe6aRaU5XR3iw9OuxVuKW7rPJQHH+x+w8dkNGzXv+ha1cDtDsZ0EdymvizKJV3W
         SRSga5j57QOVQGN6lAtlKsX5D0HIf3gyVBwd6D4pRz6i95yW3H2k3bb7/r6EM0RrGC3u
         nN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376270; x=1738981070;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ZKnHj9nGtIPNyoOdVCsq53ZVe6onbdoIhwKKzEiQlk=;
        b=vDX30hWAnp3tzdKfdzGLB50O5r8HsI7Qp0NoiGP5SXorYIr2UmTHMoTp1oCZglh4TJ
         1cyoxuMlOHOMdd+2NFseU1qC1+8eeim8eOZgIZzbJ/hxWL+i7eKPJtOHXxDJaL9MgDY0
         QFJrYBW7ziZikJPuwHL+53PRdnPyfqPnMr6fWx3GiQUg4BxiSKgTIiundD2LhjyyuAYj
         Ac34QFjsh259fNd77VNKwEtSI8LzPAVUQVfqH5rzhdjOLCXwbBdqdQ+4wjRA4ideTBOA
         oQa8v6+qMFZvDBw698wATK2Zvh3YLczjZXFZa4c9HdRR5DNiIzutFz/7+ZnkSbeSaUuq
         6DCw==
X-Forwarded-Encrypted: i=1; AJvYcCURQaGDlhS2tfwo/sZJB0Mn6ZE3Re9R81wNTlo2B4bvdNSlrj6wDe0584GTjAXMR3VeHLoPmXLjRwk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzwgjuYYBzCNNxj4cPZzJgtEqd6hJo4uSkTGAX8M34tH3Ug+LZ
	sL+w6DHhUaDtVyuofZGLl6qagxTXdv06xdMsJ4c/wdEnAEj/EVFbq+UgTpOlz4Safnm1FmyGdRQ
	6YQ==
X-Google-Smtp-Source: AGHT+IFgXEe7/w9yeWgyg6qQLihx/5RXWr7kMK6/niF7ETqn4L9GsYCh+B6w5nh2NPJ849LxusX87Gxqnac=
X-Received: from pfiy14.prod.google.com ([2002:a05:6a00:190e:b0:724:eefc:69ef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9a6:b0:725:e1de:c0bf
 with SMTP id d2e1a72fcca58-72fd0bf47cdmr18371303b3a.9.1738376270050; Fri, 31
 Jan 2025 18:17:50 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:15 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-14-seanjc@google.com>
Subject: [PATCH 13/16] x86/kvmclock: Get CPU base frequency from CPUID when
 it's available
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

If CPUID.0x16 is present and valid, use the CPU frequency provided by
CPUID instead of assuming that the virtual CPU runs at the same
frequency as TSC and/or kvmclock.  Back before constant TSCs were a
thing, treating the TSC and CPU frequencies as one and the same was
somewhat reasonable, but now it's nonsensical, especially if the
hypervisor explicitly enumerates the CPU frequency.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index a7c4ae7f92e2..66e53b15dd1d 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -102,6 +102,20 @@ static inline void kvm_sched_clock_init(bool stable)
 		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
 }
 
+static unsigned long kvm_get_cpu_khz(void)
+{
+	unsigned int cpu_khz;
+
+	/*
+	 * Prefer CPUID over kvmclock when possible, as the base CPU frequency
+	 * isn't necessary the same as the kvmlock "TSC" frequency.
+	 */
+	if (!cpuid_get_cpu_freq(&cpu_khz))
+		return cpu_khz;
+
+	return pvclock_tsc_khz(this_cpu_pvti());
+}
+
 /*
  * If we don't do that, there is the possibility that the guest
  * will calibrate under heavy load - thus, getting a lower lpj -
@@ -332,7 +346,7 @@ void __init kvmclock_init(void)
 	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
 	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
 
-	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_tsc_khz,
+	tsc_register_calibration_routines(kvm_get_tsc_khz, kvm_get_cpu_khz,
 					  tsc_properties);
 
 	x86_platform.get_wallclock = kvm_get_wallclock;
-- 
2.48.1.362.g079036d154-goog


