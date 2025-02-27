Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01149A47283
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:25:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897460.1306178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTaq-00060x-Ff; Thu, 27 Feb 2025 02:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897460.1306178; Thu, 27 Feb 2025 02:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTaq-0005xQ-A1; Thu, 27 Feb 2025 02:25:44 +0000
Received: by outflank-mailman (input) for mailman id 897460;
 Thu, 27 Feb 2025 02:25:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P3Qo=VS=flex--seanjc.bounces.google.com=3ucu_ZwYKCZQG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@srs-se1.protection.inumbo.net>)
 id 1tnTV2-0005qU-FT
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:44 +0000
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [2607:f8b0:4864:20::64a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b84a399-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:39 +0100 (CET)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-2217a4bfcc7so6991145ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:39 -0800 (PST)
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
X-Inumbo-ID: 4b84a399-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622778; x=1741227578; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Fan7xWhbYPUjoe6Gj73DFLAXBBtIUty3w4hEBXyAFt4=;
        b=uN1liozK+r1vGE8azzH9vy6u2FEILmjHx3OBBoSxV9e0UnzrgzYrTI6vSQf9glFgO8
         A/EURcOmx+94RDs3lDvDnN6KsVJkEu80deNqWvEUxBGE8ZFVi7XQdYgWHOr7vF313LMO
         za3D08j/hyJEVu18Jes8duXg019uPbI464JqU445eJ/FhDW12NN6FR7J2RbFoR3bAszY
         V9ppLjv6VzAHnbu7d9duLOO+CXk0BE4xP4E0xq4a/2xVcOhPhuNPGGK2cb2LzBppYaKX
         JNGvHnnYgEpRWvqkDBTVfqQ5yaM7VDFQuKjswcwhzytpoeiIa0/DsB79eWgWLS5BGMz+
         e+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622778; x=1741227578;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fan7xWhbYPUjoe6Gj73DFLAXBBtIUty3w4hEBXyAFt4=;
        b=JSoODSdzGou92nXSt5S1/e2WtiNhjdboL2nlSZpni6eLTpApF9plVZWUU+ZlS5/G1Q
         P9q1yx7bd0qPNPe8C4V5ebNCRXBiVpsIDFfbqiVLMXTjt/SeihPCp9q/nQVoDxskfu5D
         BSfusUYZJTHwwtsn3hS9wWjYGPEVsF/NDzQesIoXbN25v/IddeD2yBg89gndvv/GmWPP
         p5UPi1jdRmRTrgFsGKuL6d1VN6JpmsyfYK7MH/zP1mGBE50CYkTnbqUcNkhNb8/jOaA2
         eWOWDb9b8HdSQYtoMgQaIJIA6uUi3JbCpsyz8QazXfkPuT3GG4Eo8eOFkvh1GeA9F+uc
         M2Og==
X-Forwarded-Encrypted: i=1; AJvYcCVzoa1ix3Um0RKLufwkfTErtiuedd6FGHhr1TZ2q1LBF7hFspiMrc5Ryx/HR2mHPwJe7bc0j3C4gqA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8xjbvYmZtC3qLbIsSwdM4vwScX4ntSTchnzjLzUBkRg0gptz2
	RIrpnPHeShCheBXNM08AgQwanacDJnlT9w19nQU/a4LVc0T52iU05Ucwk8bigTjT0UH+t2QEz8P
	E4g==
X-Google-Smtp-Source: AGHT+IEIDOZ4TbuvBdNqbq0BRf/iBYYL2tXyd/xxECXyr6rznFcwd1mvvnFfD4EHjsDge5bCz6C8+YGYPK0=
X-Received: from plbje3.prod.google.com ([2002:a17:903:2643:b0:223:4e55:d29a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e80d:b0:220:f5d7:6405
 with SMTP id d9443c01a7336-221a0edbfc3mr358957175ad.16.1740622777972; Wed, 26
 Feb 2025 18:19:37 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:36 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-21-seanjc@google.com>
Subject: [PATCH v2 20/38] x86/xen/time: Mark xen_setup_vsyscall_time_info() as __init
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

Annotate xen_setup_vsyscall_time_info() as being used only during kernel
initialization; it's called only by xen_time_init(), which is already
tagged __init.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 3179f850352d..13e5888c4501 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -441,7 +441,7 @@ void xen_restore_time_memory_area(void)
 	xen_sched_clock_offset = xen_clocksource_read() - xen_clock_value_saved;
 }
 
-static void xen_setup_vsyscall_time_info(void)
+static void __init xen_setup_vsyscall_time_info(void)
 {
 	struct vcpu_register_time_memory_area t;
 	struct pvclock_vsyscall_time_info *ti;
-- 
2.48.1.711.g2feabab25a-goog


