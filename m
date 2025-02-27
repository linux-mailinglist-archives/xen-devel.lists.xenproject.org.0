Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6931A47294
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897522.1306301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbH-0003Fx-Ep; Thu, 27 Feb 2025 02:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897522.1306301; Thu, 27 Feb 2025 02:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbH-0003D7-76; Thu, 27 Feb 2025 02:26:11 +0000
Received: by outflank-mailman (input) for mailman id 897522;
 Thu, 27 Feb 2025 02:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IRk0=VS=flex--seanjc.bounces.google.com=3y8u_ZwYKCaYYKGTPIMUUMRK.IUSdKT-JKbKRROYZY.dKTVXUPKIZ.UXM@srs-se1.protection.inumbo.net>)
 id 1tnTVG-00063X-0K
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:58 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55b94b10-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:56 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc1a4c14d4so1064519a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:56 -0800 (PST)
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
X-Inumbo-ID: 55b94b10-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622795; x=1741227595; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3F6YIZD9bSIlkGuU2KG3Ao1xkSJhhKmqbmLiePXFSIM=;
        b=Lnlxozbi/yN1o8Viq02FIzcgGRLBgPRx8p6Zpm8qLLfWaZ1q16o82uHa+WMrfwJyR/
         /OwNdsSWqBssiky9mrtndvrblBVFFahshAK2jagf+y7Gx6S58gBYqBdu85jno1GlwcvY
         xTivkPIjiKNzFH7eJRsyQzxijdm/AAU6uyQYuZV3A1zX6hm798SD0W3pz8CaZunBFIFQ
         5pPjDqq4LZlxzIxQ4S/saRE1OjVoyg6FNyK/L2jOd/kbY0D9p7wE1dXG+51DNsz8sVT4
         99cgkVovaYDzdR9h5VPEi3byJ2XxuWQ4FnQoS5hnzjEZUa+LHiiWs7P7JS2atmUbhvjv
         hCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622795; x=1741227595;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3F6YIZD9bSIlkGuU2KG3Ao1xkSJhhKmqbmLiePXFSIM=;
        b=Pj0OMFL7ZlN/Zc2qcdkkARiQG56prihcokYRddXHpmGBfnCCabP/HwUWPbS7ZBB/2H
         9sEGYWYNaigslvW4XlVeHR8Shh9xSpln4mG9BCxHHNZ1p2H8brfBe9GLVQ1Ewyd+K/AT
         3R9yJbhVxbBl9NQvH9zdwbCWSuETtk6hOorsWvXSh54uKmA8OdmY3yL4H/O/eoWwy64D
         +sfGB6bm/4QEmg3i614oXIRtOh5uYTsYlaw3pO09gcsmJ54zIJN+QBZ5bqeGJizYfzVR
         0EToreMppz89AzayUvyfBd1ZIrsIMRJka/1c+PkiI6ASjVpuHsqDREXsPXT7lhbIBwfO
         5rjA==
X-Forwarded-Encrypted: i=1; AJvYcCUZlJtigV5ng+ahUYUIpax0fiA37vQOj4Le/5S/SQlKTz+HYRjKIxlf7oY4iSG/5PwFnL6XogWSJs8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzz/weqbJc8Rw+korELYe8LaNRQm65aFCrXEB4d22W1SDubp0b0
	ZQdgpYK5Lu7S5JTDSDFrFk2dStZ13D48IY5okNtSkp9Db2QrLVT7M61JGRG4JW7ILjhz6wBBGBU
	rHA==
X-Google-Smtp-Source: AGHT+IGJ6z3saIzRbkZlSBZLnZw7mlbnCfDCjtlOA/kyHI3FVoB/Y5gfMuQ1H6WQ1/ZAhh6gzh0XRDRpGl4=
X-Received: from pfbfb4.prod.google.com ([2002:a05:6a00:2d84:b0:732:1ead:f8ac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1509:b0:1f2:e2b0:dd91
 with SMTP id adf61e73a8af0-1f2e2b0ddb7mr3698859637.21.1740622795028; Wed, 26
 Feb 2025 18:19:55 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:46 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-31-seanjc@google.com>
Subject: [PATCH v2 30/38] x86/paravirt: Don't use a PV sched_clock in CoCo
 guests with trusted TSC
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

Silently ignore attempts to switch to a paravirt sched_clock when running
as a CoCo guest with trusted TSC.  In hand-wavy theory, a misbehaving
hypervisor could attack the guest by manipulating the PV clock to affect
guest scheduling in some weird and/or predictable way.  More importantly,
reading TSC on such platforms is faster than any PV clock, and sched_clock
is all about speed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/paravirt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index a3a1359cfc26..c538c608d9fb 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -89,6 +89,15 @@ DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 				      void (*save)(void), void (*restore)(void))
 {
+	/*
+	 * Don't replace TSC with a PV clock when running as a CoCo guest and
+	 * the TSC is secure/trusted; PV clocks are emulated by the hypervisor,
+	 * which isn't in the guest's TCB.
+	 */
+	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC) ||
+	    boot_cpu_has(X86_FEATURE_TDX_GUEST))
+		return -EPERM;
+
 	if (!stable)
 		clear_sched_clock_stable();
 
-- 
2.48.1.711.g2feabab25a-goog


