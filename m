Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B706A246AC
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:20:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880113.1290329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te37X-0001ax-RY; Sat, 01 Feb 2025 02:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880113.1290329; Sat, 01 Feb 2025 02:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te37X-0001Z9-OO; Sat, 01 Feb 2025 02:20:31 +0000
Received: by outflank-mailman (input) for mailman id 880113;
 Sat, 01 Feb 2025 02:20:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lmx8=UY=flex--seanjc.bounces.google.com=3SoSdZwYKCQ05rn0wpt11tyr.p1zAr0-qr8ryyv565.Ar0241wrp6.14t@srs-se1.protection.inumbo.net>)
 id 1te34u-0002sH-9o
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:48 +0000
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [2607:f8b0:4864:20::64a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba3ee9d3-e042-11ef-a0e6-8be0dac302b0;
 Sat, 01 Feb 2025 03:17:47 +0100 (CET)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-216430a88b0so54945625ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:47 -0800 (PST)
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
X-Inumbo-ID: ba3ee9d3-e042-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376266; x=1738981066; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=AK/mWgvwJvlM2VErSRU3T5I3ox4v68bEfhNUVA1UAEc=;
        b=a5fOK0QBC6eTVz97q4HMhOCxi2dYAuAcLbVxNzHt34bG+ba1/vg8GTA4R9H23zxbB2
         OPDPZxj54469YkUNhjD3h/7jMDEOs0AOWpgw3DORGgCN1AJ8rNuvzqxVXXHt5BQw4ytc
         DF4iaOgWeRwEmB0PT9M78wwDflCr+cpKqSu1hKhnAfaZNy+T2Qdg+xNmArc4yojzhLRO
         nZTUVSG0bYRuiTO2i/lVY6hjooPiKwIgGlNJHYnz5BlOt1HYPXZaA2egp82huxMgnzNw
         GuVBGLptPnWFdHo8kGaprjlQbADcUewdM1oMWx/WOGXhW7+ubu07pJfHQ1CRcByKxHUQ
         oDdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376266; x=1738981066;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AK/mWgvwJvlM2VErSRU3T5I3ox4v68bEfhNUVA1UAEc=;
        b=DPQ8PmL6FFNVA9Zeli97h4p8xzJ6Zywf7mmaaV1n7aFI1PEGLpBpv1SNal8CgJ3WFH
         pCOgpK0vsBdwl6ED/7sw2XO4IrV9VSKoY/wZY+ssg9NSW0FWUI+JkgFJab+cnuu3CaiQ
         TeJrTI6oFQqwvqH3XjUQW3Al0w7TO9K4hfJhVf3SP4comax5+xojbjS8u48zgueowN6c
         5cgwTr3aFMT+ErKOJXQN9orZtvXA4JB/C5p4cU3Hzqy/xA6v1oCTa7IRdfW5RdZIWqGY
         L+uS0hV4kfkQYtngGf+uASZkGl0avbPCVvPPx3G2WrwWQYrs2L49dbc0guY6WZ8+TOQw
         nKwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLu65exguPOIqV1iR1kgqWdGoBK0rAvRX3qqQBrs2Gyd6I9VcRVkOOUo/Xs1qSTA6fPuY98duGFn8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxh6ZeAygdy/uswQhdvv0i/9eqjHTry6Hkx2wNnmvXZjfUDaXSe
	Pm3abbIEreaAlCnqggQ9HsAXX2L9fkloB+n8DJqIPcbxSd+iXdJx+vPLR35EjGfY7BczmfnCtWc
	iNw==
X-Google-Smtp-Source: AGHT+IGIBUdgj+cCgBZpvoXPxY6FOVmtNbk7sDeQo6dqnIl0GeJKfhw5O39y3pDqzJDExNb4JeazGQgwjQ8=
X-Received: from pjbdy6.prod.google.com ([2002:a17:90b:6c6:b0:2ef:7483:e770])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:11c3:b0:215:b1a3:4701
 with SMTP id d9443c01a7336-21dd7d64c1emr194518565ad.13.1738376266294; Fri, 31
 Jan 2025 18:17:46 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:13 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-12-seanjc@google.com>
Subject: [PATCH 11/16] x86/paravirt: Don't use a PV sched_clock in CoCo guests
 with trusted TSC
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
index 55c819673a9d..980440d34997 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -88,6 +88,15 @@ DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
 
 void __paravirt_set_sched_clock(u64 (*func)(void), bool stable)
 {
+	/*
+	 * Don't replace TSC with a PV clock when running as a CoCo guest and
+	 * the TSC is secure/trusted; PV clocks are emulated by the hypervisor,
+	 * which isn't in the guest's TCB.
+	 */
+	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC) ||
+	    boot_cpu_has(X86_FEATURE_TDX_GUEST))
+		return;
+
 	if (!stable)
 		clear_sched_clock_stable();
 
-- 
2.48.1.362.g079036d154-goog


