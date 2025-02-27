Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A08CA4728C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897501.1306258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTb5-0000in-S0; Thu, 27 Feb 2025 02:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897501.1306258; Thu, 27 Feb 2025 02:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTb5-0000bA-5f; Thu, 27 Feb 2025 02:25:59 +0000
Received: by outflank-mailman (input) for mailman id 897501;
 Thu, 27 Feb 2025 02:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1lEt=VS=flex--seanjc.bounces.google.com=308u_ZwYKCa4gSObXQUccUZS.QcalSb-RSjSZZWghg.lSbdfcXSQh.cfU@srs-se1.protection.inumbo.net>)
 id 1tnTVO-00063X-U9
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:20:06 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b08f7d6-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:20:05 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fce2954a10so1537182a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:20:05 -0800 (PST)
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
X-Inumbo-ID: 5b08f7d6-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622804; x=1741227604; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tqdKNUZqbb8d2CJvLoLFEQfT4OY26dkczDpR+rA3UIo=;
        b=h+jDYWr79d7/qby+mpfQpw9mTI+8xzZ6SpHtXzcjKgGdrRVStaQiM7E/5YSZfpICoB
         4/Dx7wUFR8RGR/gFdWD5YqioUEf3e+txRiRtX0zPyl7TEeNaVmOmVyUUga95J6OkpIbh
         Ej6a33+mHuAzJFYLw6dA5DK9sgDoDpqL6OFJdmuZdwgBEtSufWhZupZOVVsmcw4oHGEy
         3RfhKJP/jnuQmndynztU/cKBPg9eqe6I78vr9lt8AzJ2Je6xMSJizUjFBEsBGac1yAIh
         PEplV9IzBnoK/MGaqzR+b1maDX35xWVt1ubYIxEDs3WxA4OGkIDhMbkmnKe29ShTWXzl
         qRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622804; x=1741227604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqdKNUZqbb8d2CJvLoLFEQfT4OY26dkczDpR+rA3UIo=;
        b=A5O5t5idWdt2JpK9ceBRwAa5R++e6MdgCtsyyvPQCh3XoOocSZF2hJDPXQBVszSRcm
         tTnyw6rBhRArRVdQLylGDSBC83/dsO7/wZ3DpdruPs7YtPwcarMXj/37yWf+d8muvaDs
         FNkJ0xZtyRQRbmtZrbwcYORGTymxAuQ7OemDrHngPmPE77SidVX5vDTy+qE3rcVFw+2/
         3do3nEYpADUoqczMokwubF8rVKMePXQEz+OjxjA1sLRI26hiEa/GvkgMJrYk8GBNE4Sq
         Z7OhQvFqcu/RBTGLCvrdVcuOZLy7pKUByqpkra5TXlGZTg4xd1MhzWZ7mbfXiViad6jq
         lvdg==
X-Forwarded-Encrypted: i=1; AJvYcCVPxK5vhjabS26h9x/PB0GZJO6Y0V7iIMjxs/d09eARA8QMNPWNtY4GzXbaLC5vlCuTwSyT1JxNW5g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNviiD+QkpHl4zcZT2AYBwJkifSXS28ISF6UEtZkIEHxeH03mT
	5uZgylk+tiRnZ5Z2CHYob8b+ECq+1hkNLV4FhPHMFe+/cTbAhKODG9gXj9cr6/3ylpdpob3lQEb
	06A==
X-Google-Smtp-Source: AGHT+IGMz3bH4S0o1xgsITZANeNn+Z/tGuVwcYyVyvqnl2NMWrRx99tESpyiBKte9PgB4aGO5q0vwXh4uHk=
X-Received: from pjuj3.prod.google.com ([2002:a17:90a:d003:b0:2fc:b544:749e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c84:b0:2fc:c262:ef4b
 with SMTP id 98e67ed59e1d1-2fce86cf0e0mr42953377a91.18.1740622803772; Wed, 26
 Feb 2025 18:20:03 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:51 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-36-seanjc@google.com>
Subject: [PATCH v2 35/38] x86/kvmclock: Get TSC frequency from CPUID when its available
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
index c45b321533e5..3efb837c7406 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -188,6 +188,16 @@ void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
 	}
 }
 
+static unsigned long kvm_get_tsc_khz(void)
+{
+	struct cpuid_tsc_info info;
+
+	if (!cpuid_get_tsc_freq(&info))
+		return info.tsc_khz;
+
+	return pvclock_tsc_khz(this_cpu_pvti());
+}
+
 static unsigned long kvm_get_cpu_khz(void)
 {
 	unsigned int cpu_khz;
@@ -211,11 +221,6 @@ static unsigned long kvm_get_cpu_khz(void)
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
2.48.1.711.g2feabab25a-goog


