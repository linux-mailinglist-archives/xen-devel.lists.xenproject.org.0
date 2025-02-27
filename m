Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF9AA47216
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:19:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897373.1306088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUc-0007VQ-Qh; Thu, 27 Feb 2025 02:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897373.1306088; Thu, 27 Feb 2025 02:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUc-0007OY-Jx; Thu, 27 Feb 2025 02:19:18 +0000
Received: by outflank-mailman (input) for mailman id 897373;
 Thu, 27 Feb 2025 02:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UJj9=VS=flex--seanjc.bounces.google.com=3o8u_ZwYKCX4ugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@srs-se1.protection.inumbo.net>)
 id 1tnTUb-0005qU-9Z
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:17 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e0f5d37-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:16 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc0bc05c00so1507791a91.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:16 -0800 (PST)
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
X-Inumbo-ID: 3e0f5d37-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622755; x=1741227555; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YtBqucRQyVVjFtgUlGbh/U8C9xbSv2L/3t5kwpG/0fs=;
        b=KNAtg8tWo9X0AQhlg9SQSFD7Smjra3pgMsgkpywJh/syOPi4T9+huMzm15Qo6yDnhH
         3bTNGPwswFMm4WA25KlTnQ6nTW18mDBAcE/ViZkKmdntJRMSfgqfZXvFYlQk6PVY6kQz
         sgQy4xp4oa8scPieu0OCUs9zUzhEG3mMTtFEEleI8earuM0vgL4WyXTa29oydcc/1bON
         c7rSIvYbb1JlC1m6HZoiUVTDH5fR3ywA8TYzOf+B5j/elscpDzA0agxc++3gZAQYSz8v
         IxceItMwRzrEIUHDjzYOIugNsDg9U/SnAiwbsOCBUfPCbrh+fOvjkrGO3W+wuId0nvQV
         e9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622755; x=1741227555;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtBqucRQyVVjFtgUlGbh/U8C9xbSv2L/3t5kwpG/0fs=;
        b=b3mm7snRTqbO+ZJO0pndztJTJEyM8H2aq47sOfJqFzZQsLNRvL4wliUQDR9eDs/HZn
         Ca9TuP1W4CXthI7+OXoP5xIVdRoYToHUs49XpkcFqY4h2pGl6aZq3m6s5NotKhlmGIf3
         FEip2oSMQHN70Hd3z2RTYCjyruPHtFhznDP+st3Zwk2uE2TlYc7T5pr6csREz3tWiZVD
         O/s7H0BV34bXkOcxg9yvO2PYZdL5RXrYXjW784qcb+r1Xn3frdrEe8pk78I3UWDUlxX7
         rsEOuyaDs/lALyVhdLGismdlmiTb5qfiS/TLCML6d3/LbyncGiJ/LRjIlofSs+Y/bhz3
         RPwA==
X-Forwarded-Encrypted: i=1; AJvYcCWSddeo1xTdiZzmF8K2MGuhusacUqxHWVss+i13ZoyOxCND/xPAxxKwAJmURtuCveSB24glFszolv0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKcbGmPcpzX/KDEu9i14Tm8Z6ocCSJKs1UvRMkrGvKhXvueoQV
	tiJVHlaXY31tJn0+GJflYy1YzR3nuwoJdOqeFLzcTjnN6jPio9lHFS75ktIukZO3lm3UwvvuLbK
	5oA==
X-Google-Smtp-Source: AGHT+IH9Y0SwBcAS02xHNq+a4IakpnWSLKqVw4P68iCQM2m6waYT1AwLAOPZPnrjzYdSpJiao+kBYkSTr34=
X-Received: from pjb4.prod.google.com ([2002:a17:90b:2f04:b0:2ef:78ff:bc3b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dc8:b0:2fa:ba3:5457
 with SMTP id 98e67ed59e1d1-2fe68ae6c4fmr17520974a91.17.1740622755379; Wed, 26
 Feb 2025 18:19:15 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:23 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-8-seanjc@google.com>
Subject: [PATCH v2 07/38] x86/acrn: Mark TSC frequency as known when using
 ACRN for calibration
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

Mark the TSC frequency as known when using ACRN's PV CPUID information.
Per commit 81a71f51b89e ("x86/acrn: Set up timekeeping") and common sense,
the TSC freq is explicitly provided by the hypervisor.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/acrn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index c1506cb87d8c..2da3de4d470e 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -29,6 +29,7 @@ static void __init acrn_init_platform(void)
 	/* Install system interrupt handler for ACRN hypervisor callback */
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
 
+	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	tsc_register_calibration_routines(acrn_get_tsc_khz,
 					  acrn_get_tsc_khz);
 }
-- 
2.48.1.711.g2feabab25a-goog


