Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E7DA472A5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:26:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897627.1306389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbw-0000eu-NR; Thu, 27 Feb 2025 02:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897627.1306389; Thu, 27 Feb 2025 02:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTbw-0000XU-D9; Thu, 27 Feb 2025 02:26:52 +0000
Received: by outflank-mailman (input) for mailman id 897627;
 Thu, 27 Feb 2025 02:26:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFpP=VS=flex--seanjc.bounces.google.com=3wsu_ZwYKCZ0PB7KG9DLLDIB.9LJUBK-ABSBIIFPQP.UBKMOLGB9Q.LOD@srs-se1.protection.inumbo.net>)
 id 1tnTVA-0005qU-GQ
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:52 +0000
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [2607:f8b0:4864:20::64a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5096aaac-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:47 +0100 (CET)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-22107b29ac3so7797435ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:47 -0800 (PST)
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
X-Inumbo-ID: 5096aaac-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622786; x=1741227586; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3WIlT5dxc8eqreSuMAUxshuXGBEM8C/NLPwcD1zy3Y0=;
        b=4Tn+HIhTEofezILu9LoLr1+pu4sBPUvjgk3YbPzy3M0AXjaXsUbZc4f6OR46LFkdHd
         xciMaZqRjYs9i8IlJcCFsXIKUhq357GYjhw/8k2kwgHHXHLhdRLEjrmJXqkb/BAm4Blo
         nlMlJftWNE+2aydySXvYI1v8NY0/b3vk0j4P+EreGa30VYXHy41E4Tpxsxj9qASbqZrF
         pz6zd1luV3gjXWWMi8+kLvZxHZuWuEHmd05S62mi1r17x9bOlsRtSLOTNUl30lUmHV1L
         Dgqulh3zfVGUM0FQ4UTFDhyfKqhNwiqDSlw0+OslEpFXCdDVslX3qA8EppCYsSoGhrc9
         PfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622786; x=1741227586;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WIlT5dxc8eqreSuMAUxshuXGBEM8C/NLPwcD1zy3Y0=;
        b=pBfn8g52sZb2u7+SrPjtdiu2x28t9qsilOhu9eXbSR3C4gfmpgQ3Mi+vQMJmJV++1R
         PrN3KqdEfUdFL98LsA5iMLWcC/V5ykzjyp6Vzi87aR9Q2DNg8BnxAnr42G+4yOW0XHgM
         /UuL7rdOhm5QsMPT0JM4/LgdoT0dwK+5Fm+kKQusFsK+pcGyhZ59hLgWXTfNUhe2iWZj
         pYoeKeEPzypdUofgR3Jm22Lhk28etdcwJSjjw/qGtPpT5QQsHu/+0skrhuTpYweDa9kp
         2JFyVCo3cHr4jh0CfyADMbGttjPnMoCyrS9VeNdl/5Tl3xJJ4xPGTwJL3iS84Hc/5eBd
         j1Eg==
X-Forwarded-Encrypted: i=1; AJvYcCX/5Q0fgb7TMow7A6XNTNRB0mGDgxw0JCUtdWLrETFN/QOzUOW4TzC1BsBUgfIpIxCZQwKZ1dH45Iw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTC2fNGBINAsPX2TBLLe3WxWgTTA7zrgV5m5+TcLSCr3rg6DU8
	z575FgCnVes/xzDGGsyR3OlNEQTKMTvfh3LIFt5TAp1rgsssv7yvvxXgQ+rGs/tqcW74z2Npb4h
	aqw==
X-Google-Smtp-Source: AGHT+IEKa+U3XmhHVLGnMc9mY3OxJMjJ1pR3+E2erpOOt4xnyyZwND9G3ZoTVgYNZ7eny0ZZLwJ5fe0HKa8=
X-Received: from pjvf4.prod.google.com ([2002:a17:90a:da84:b0:2ea:3a1b:f493])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e80e:b0:21f:3d0d:2408
 with SMTP id d9443c01a7336-2234a28af91mr27386885ad.10.1740622786458; Wed, 26
 Feb 2025 18:19:46 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:41 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-26-seanjc@google.com>
Subject: [PATCH v2 25/38] x86/kvmclock: Hook clocksource.suspend/resume when
 kvmclock isn't sched_clock
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

Save/restore kvmclock across suspend/resume via clocksource hooks when
kvmclock isn't being used for sched_clock.  This will allow using kvmclock
as a clocksource (or for wallclock!) without also using it for sched_clock.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 0580fe1aefa0..319f8b2d0702 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -130,7 +130,17 @@ static void kvm_setup_secondary_clock(void)
 
 static void kvm_restore_sched_clock_state(void)
 {
-	kvm_register_clock("primary cpu clock, resume");
+	kvm_register_clock("primary cpu, sched_clock resume");
+}
+
+static void kvmclock_suspend(struct clocksource *cs)
+{
+	kvmclock_disable();
+}
+
+static void kvmclock_resume(struct clocksource *cs)
+{
+	kvm_register_clock("primary cpu, clocksource resume");
 }
 
 void kvmclock_cpu_action(enum kvm_guest_cpu_action action)
@@ -201,6 +211,8 @@ static struct clocksource kvm_clock = {
 	.flags	= CLOCK_SOURCE_IS_CONTINUOUS,
 	.id     = CSID_X86_KVM_CLK,
 	.enable	= kvm_cs_enable,
+	.suspend = kvmclock_suspend,
+	.resume = kvmclock_resume,
 };
 
 static void __init kvmclock_init_mem(void)
@@ -295,6 +307,15 @@ static void __init kvm_sched_clock_init(bool stable)
 	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
 				   kvm_save_sched_clock_state, kvm_restore_sched_clock_state);
 
+	/*
+	 * The BSP's clock is managed via dedicated sched_clock save/restore
+	 * hooks when kvmclock is used as sched_clock, as sched_clock needs to
+	 * be kept alive until the very end of suspend entry, and restored as
+	 * quickly as possible after resume.
+	 */
+	kvm_clock.suspend = NULL;
+	kvm_clock.resume = NULL;
+
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
 
-- 
2.48.1.711.g2feabab25a-goog


