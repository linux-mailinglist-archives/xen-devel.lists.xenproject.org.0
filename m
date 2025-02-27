Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A5A4727E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:25:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897453.1306162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTah-0005Kr-Ra; Thu, 27 Feb 2025 02:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897453.1306162; Thu, 27 Feb 2025 02:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTah-0005Iq-Nl; Thu, 27 Feb 2025 02:25:35 +0000
Received: by outflank-mailman (input) for mailman id 897453;
 Thu, 27 Feb 2025 02:25:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DII1=VS=flex--seanjc.bounces.google.com=31cu_ZwYKCbAiUQdZSWeeWbU.SecnUd-TUlUbbYiji.nUdfheZUSj.ehW@srs-se1.protection.inumbo.net>)
 id 1tnTVQ-00063X-Jk
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:20:08 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c06baf9-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:20:07 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-220ee2e7746so7721785ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:20:07 -0800 (PST)
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
X-Inumbo-ID: 5c06baf9-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622805; x=1741227605; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIteN/a7AZFre1KWgiuGeMT9S5HjiwYxYNebWBQLyrA=;
        b=asI0nJNsczcNUCxSFHXPsDZW5yIxjZbWtUPYBB3Zyz57F0cPXyGvxhsO5Cu63Yn6Q9
         j5faga0kCgcTSf/SdfWN5vQP55ui/cXocAH8N0OSfT2my1LipIYxDPr7OiyN2vAei0uj
         HE3XxCxTfZY4ZgMGQh4BWceHMBrApupJnUwR4yIfcLrE3+HnlUzlyXPG4RpAZ8PhP4Vs
         5MTXSUyDnLYUB/l/95fp+Yys/PavTLTUTFfwWEZsEwoZyf/JpxuYlynEloUpYwJ4Ets1
         kvc7ZbNi0rvL0Uvg7QyycC+8UYWKX9+eLGpJLgWtPETAgkECts/WqcwHcPrSXPiKAPaW
         N3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622805; x=1741227605;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pIteN/a7AZFre1KWgiuGeMT9S5HjiwYxYNebWBQLyrA=;
        b=drOLvk+9Uq7N5FZNh0+1m0+8YN8WOQH4MZNM98kS3pIaCWb02k0avevx6YleLyGJQN
         2YpgLFubIQ2jWeobotP1e4qntoinVOvhGPm15kNWjhtuPgy+ToQOu0l4mHQyRqUbAnKh
         zTYoRoAsZ2EODqpDGAt24Z75Nb1BkQ4pvrs139kThp9lvCzDb6XuzNju/gvUQdu7ZCPT
         B9Ns2qpXNXLvKLYBJzSfZnLR4+C/eWzQejGEK8Q8C2QHAvxUy8xlVTZ+4eXI6xYMP79Q
         PE6c9bANUd9NNmK9DTH/wND43LmVBBGjpdKgIKryJbL5utmFmmSZLN9yenjPZgqFWefv
         BYyg==
X-Forwarded-Encrypted: i=1; AJvYcCWnf9ISgiKlISTmCJiz3PQn5YeywOkdUjm901EFely+BLLY0OFddCP+tjM1VEU7CHQfyjhUXt1kPt4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2BqPPB/sJrdi9ITTGJIxoAKfIewffcrB4lLb6nafNXKZuLeKP
	NyWA0AyCn3RNt4C9VD11355OYPuQ+CC8arma5NSKrBYTSe4gpKixVfEt99lD3Hxt0EUvQ+tG0qG
	DQg==
X-Google-Smtp-Source: AGHT+IGP2cZX6cw4gCRMv2fLrFe/TXNI5NPzTOobUK44ADJodiEA9LQbSXwMRfyGc0rCQ4WOggdSpeUhPyc=
X-Received: from pfhk13.prod.google.com ([2002:aa7:998d:0:b0:730:479d:3482])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2181:b0:731:ff1b:dd6a
 with SMTP id d2e1a72fcca58-7348be4c455mr8342588b3a.20.1740622805598; Wed, 26
 Feb 2025 18:20:05 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:52 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-37-seanjc@google.com>
Subject: [PATCH v2 36/38] x86/kvmclock: Stuff local APIC bus period when core
 crystal freq comes from CPUID
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
index 3efb837c7406..80d9c86e0671 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -192,8 +192,18 @@ static unsigned long kvm_get_tsc_khz(void)
 {
 	struct cpuid_tsc_info info;
=20
-	if (!cpuid_get_tsc_freq(&info))
+	/*
+	 * Prefer CPUID over kvmclock when possible, as CPUID also includes the
+	 * core crystal frequency, i.e. the APIC timer frequency.  When the core
+	 * crystal frequency is enumerated in CPUID.0x15, KVM's ABI is that the
+	 * (virtual) APIC BUS runs at the same frequency.
+	 */
+	if (!cpuid_get_tsc_freq(&info)) {
+#ifdef CONFIG_X86_LOCAL_APIC
+		lapic_timer_period =3D info.crystal_khz * 1000 / HZ;
+#endif
 		return info.tsc_khz;
+	}
=20
 	return pvclock_tsc_khz(this_cpu_pvti());
 }
--=20
2.48.1.711.g2feabab25a-goog


