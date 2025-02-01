Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B29A246AD
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:20:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880124.1290339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te37e-0002BZ-3t; Sat, 01 Feb 2025 02:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880124.1290339; Sat, 01 Feb 2025 02:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te37d-00028C-W5; Sat, 01 Feb 2025 02:20:38 +0000
Received: by outflank-mailman (input) for mailman id 880124;
 Sat, 01 Feb 2025 02:20:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXkV=UY=flex--seanjc.bounces.google.com=3T4SdZwYKCRIAws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@srs-se1.protection.inumbo.net>)
 id 1te351-0002sH-8J
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:55 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd8dcf6c-e042-11ef-a0e6-8be0dac302b0;
 Sat, 01 Feb 2025 03:17:53 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2ef6ef9ba3fso5187966a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:53 -0800 (PST)
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
X-Inumbo-ID: bd8dcf6c-e042-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376272; x=1738981072; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=H8aoO3CAJ0dqDpElLUQaiYDlNJUSBbklsVcflcMYifM=;
        b=CD2g0AMoI/CntnvxBw8DrbC2w1xRwr1azB9OICVhuZM9f2sjkR4a0n6z5C22psyK2R
         ZfKOGo41Pu1ANK5C0lgiVaXhPDtvJsCXNQfLqHDtZ/0YYef4f/sGZwxjBPpyVMbIYjYg
         djXMnRs9+81aB1jjYypCVTEPPT9E51RK5oyYEmeg31KMlmYdcRV/ewO55b1RFniO4szu
         6kFNulOpsvYw0NW8mbBJLa9onomWiC8dySaR4K76b+g5GfEdoy3WQyRcL8qO1aBUjFgQ
         W5DvBq+DUWIWG51ibaf2ylgYzd+X0fkVY0r6KaEaLgFRVeOQgklf0QdKV2TIbxY+XARv
         1X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376272; x=1738981072;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8aoO3CAJ0dqDpElLUQaiYDlNJUSBbklsVcflcMYifM=;
        b=GDnLbuYUpGWaDvR1gIjec3XhZU+D2UEmu5dwiB5Y+mtNn21uTallFbPKT/DSsjuygM
         FYUqWMpivf5rYFeKonuWg3WLPsHOiW9dYad1MY15a3vWTzH0DcdePjJHTGmP8QmfW8S7
         k4ofrwFFpQDtDo+ZC5vLo8llKP7noRImHl8oaunu89YEFjtxPQ+4n4vZ2BNDa5OD1fOs
         9f07H6255rFHbajznldMrsZX3iEjagzAbPK8JPSQ2BPQf+X2yRPPdIIx/7QnP4HVfzK8
         PyCQVItKvS37QNNNvMyACiB/E1E04IxEUoF/Ee3gS6QjOLnPgltt3XSSYKbzTLd8oPqo
         ne6A==
X-Forwarded-Encrypted: i=1; AJvYcCVIAD4uNHM0wxNXx+fP8LaBiNrrhNN+PHtsm/tQhgK4VX50+FIaVZwRg79jQviGxLk2kyf7fHVMaK4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8K8WwEpoXAKM4B4kOJV9u9Rhyjk00pOGA1szJI+J99GKCuT91
	phtdX9MhXpMhDiJVgRvrdyec6WRs+wnJ1QDcd9EeNUgh5HRocBNoDBtHuoNxI0Rxl4DcVZhAbID
	LgQ==
X-Google-Smtp-Source: AGHT+IFlM5iy+/YhDLhDvbxJ2kgMrd1qTg/6Z4sP06sibC0sgnf3CqMto9NWjotO4O8YEuu2B+OhUgsrUhU=
X-Received: from pjbsw14.prod.google.com ([2002:a17:90b:2c8e:b0:2f7:d453:e587])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d45:b0:2ee:8358:385
 with SMTP id 98e67ed59e1d1-2f83abb34bfmr19091952a91.4.1738376271854; Fri, 31
 Jan 2025 18:17:51 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:16 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-15-seanjc@google.com>
Subject: [PATCH 14/16] x86/kvmclock: Get TSC frequency from CPUID when its available
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

When kvmclock and CPUID.0x15 are both present, use the TSC frequency from
CPUID.0x15 instead of kvmclock's frequency.  Barring a misconfigured
setup, both sources should provide the same frequency, CPUID.0x15 is
arguably a better source when using the TSC over kvmclock, and most
importantly, using CPUID.0x15 will allow stuffing the local APIC timer
frequency based on the core crystal frequency, i.e. will allow skipping
APIC timer calibration.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 66e53b15dd1d..0ec867807b84 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -102,6 +102,16 @@ static inline void kvm_sched_clock_init(bool stable)
 		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
 }
 
+static unsigned long kvm_get_tsc_khz(void)
+{
+	unsigned int __tsc_khz, crystal_khz;
+
+	if (!cpuid_get_tsc_freq(&__tsc_khz, &crystal_khz))
+		return __tsc_khz;
+
+	return pvclock_tsc_khz(this_cpu_pvti());
+}
+
 static unsigned long kvm_get_cpu_khz(void)
 {
 	unsigned int cpu_khz;
@@ -125,11 +135,6 @@ static unsigned long kvm_get_cpu_khz(void)
  * poll of guests can be running and trouble each other. So we preset
  * lpj here
  */
-static unsigned long kvm_get_tsc_khz(void)
-{
-	return pvclock_tsc_khz(this_cpu_pvti());
-}
-
 static void __init kvm_get_preset_lpj(void)
 {
 	unsigned long khz;
-- 
2.48.1.362.g079036d154-goog


