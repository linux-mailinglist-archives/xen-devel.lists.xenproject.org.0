Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4A5A246B4
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:21:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880156.1290369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te37u-0004EA-2A; Sat, 01 Feb 2025 02:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880156.1290369; Sat, 01 Feb 2025 02:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te37t-0004Bg-TJ; Sat, 01 Feb 2025 02:20:53 +0000
Received: by outflank-mailman (input) for mailman id 880156;
 Sat, 01 Feb 2025 02:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqBJ=UY=flex--seanjc.bounces.google.com=3UYSdZwYKCRQCyu73w08805y.w86Hy7-xyFy552CDC.Hy79B83ywD.8B0@srs-se1.protection.inumbo.net>)
 id 1te354-0002sH-97
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:58 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bea32ac2-e042-11ef-a0e6-8be0dac302b0;
 Sat, 01 Feb 2025 03:17:55 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2ee5616e986so7263369a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:55 -0800 (PST)
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
X-Inumbo-ID: bea32ac2-e042-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376274; x=1738981074; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLts4lXwUIqNNu2uIA1UT+VV0O42NNK5wDATllLGuXo=;
        b=FuNITsbrKWPRCl2JwhrfsW9hA43s/NqlEGpmlqcM0jKby7WWhDi2p1ncQQbKTrzM/2
         xJDXpJGP3Tc4tyBqL17bWf5L9c4lYSahI5UCFYc5NgFTWAOQbqlqX84hYWofoMStaotG
         ZpHZvBnL+8MmdqM0ApTFvggHMhihi60e4I/4h19YS3WL8Xy0FiIsYWqqkB/sg19LJxoH
         bCFzdTXrIWiG7qZam5Dl2CUeZnFHLTdjy0l+nv6+ctRsFXDO06rY41W9XvvOYwyCL7ds
         9FVURu8HLO30U0emgV0YJWZeMRmRu/BxpL/oXp5rkEH/TaLOL6X1CHjthd03aJ7Sa0Gb
         fIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376274; x=1738981074;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MLts4lXwUIqNNu2uIA1UT+VV0O42NNK5wDATllLGuXo=;
        b=MFKTKgLPhZSnW9o3FoE9D66tvLwC6SSXyq1/Ip04YR+q56f/BoT4j4767busdyyIgw
         yZUbfvbrZDLdGxmBGA5vfXCsLQe614IF3KP13EVAH36I8SN8E8OC10wp2MmAJtF0mmFl
         sPwlQwr94u+Y6U/yZ1k8csCQxr4yz3YhR1Z/rvhuA44vZySm61tEHb72EHzHQhbCTh2K
         5VMYL5d9xiYLWbhv+/wg56zVLdMSgJFDmufftloGSbgI4BMdO83vawtYs3iTuzcJdmW5
         zvbMpM5+eSRAUfcRh2uWQDk18wm9b6cTm2u5F6sHO8OtcQoFr4DUJsgGxuRZ0V0rRZc6
         pA8w==
X-Forwarded-Encrypted: i=1; AJvYcCX6uFm5flK18pnu/faeEf42YR9k/EbUsKVtcLQRUnth/ygppMu4FAIKoNURyp7b86DKsBhP79EsEd4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7vVmRmSogCNLCEVsCwI8YgxpfN50Oi8lTM2qq++kFgeWXzMXY
	CCj93T/0SHFGO1k/A3YtT4wIR6Zzuf/2+Oe+WAzpbN+lyGGlNZo2q0Y4PrwDqwYWQ/86L8Ydbzs
	5Kg==
X-Google-Smtp-Source: AGHT+IFZkSSDE4sQNSYE1P+oxZtfHJOA6RLwDBSraCmTI0kfGCTz9b39MqhkWv/tuyQdm2uggkOJw5pWH7U=
X-Received: from pjbfr16.prod.google.com ([2002:a17:90a:e2d0:b0:2ea:5c73:542c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:53c4:b0:2ee:d63f:d77
 with SMTP id 98e67ed59e1d1-2f83abd7ccfmr20755900a91.9.1738376273601; Fri, 31
 Jan 2025 18:17:53 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:17 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-16-seanjc@google.com>
Subject: [PATCH 15/16] x86/kvmclock: Stuff local APIC bus period when core
 crystal freq comes from CPUID
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
Content-Transfer-Encoding: quoted-printable

When running as a KVM guest with kvmclock support enabled, stuff the APIC
timer period/frequency with the core crystal frequency from CPUID.0x15 (if
CPUID.0x15 is provided).  KVM's ABI adheres to Intel's SDM, which states
that the APIC timer runs at the core crystal frequency when said frequency
is enumerated via CPUID.0x15.

  The APIC timer frequency will be the processor=E2=80=99s bus clock or cor=
e
  crystal clock frequency (when TSC/core crystal clock ratio is enumerated
  in CPUID leaf 0x15).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 0ec867807b84..9d05d070fe25 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -106,8 +106,18 @@ static unsigned long kvm_get_tsc_khz(void)
 {
 	unsigned int __tsc_khz, crystal_khz;
=20
-	if (!cpuid_get_tsc_freq(&__tsc_khz, &crystal_khz))
+	/*
+	 * Prefer CPUID over kvmclock when possible, as CPUID also includes the
+	 * core crystal frequency, i.e. the APIC timer frequency.  When the core
+	 * crystal frequency is enumerated in CPUID.0x15, KVM's ABI is that the
+	 * (virtual) APIC BUS runs at the same frequency.
+	 */
+	if (!cpuid_get_tsc_freq(&__tsc_khz, &crystal_khz)) {
+#ifdef CONFIG_X86_LOCAL_APIC
+		lapic_timer_period =3D crystal_khz * 1000 / HZ;
+#endif
 		return __tsc_khz;
+	}
=20
 	return pvclock_tsc_khz(this_cpu_pvti());
 }
--=20
2.48.1.362.g079036d154-goog


