Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kYwDLNFrRWrj/goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:34:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464B76F0EC0
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:34:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=fai+YAy4;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=google.com
Received: from list by lists.xenproject.org with outflank-mailman.1350605.1608144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0hc-0006V0-9f; Wed, 01 Jul 2026 19:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350605.1608144; Wed, 01 Jul 2026 19:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0hc-0006SC-5v; Wed, 01 Jul 2026 19:34:32 +0000
Received: by outflank-mailman (input) for mailman id 1350605;
 Wed, 01 Jul 2026 19:34:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3iGtFagYKCc0Bxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--seanjc.bounces.google.com>)
 id 1wf0hb-0006GX-7D
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:34:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0ha-00BqTu-KD
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:34:30 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3iGtFagYKCc0Bxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--seanjc.bounces.google.com>)
 id 6a456bb3-bab6-0a2a0a5309dd-0a2a45098636-22
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:34:30 +0200
Received: from [209.85.215.202] (helo=mail-pg1-f202.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3iGtFagYKCc0Bxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--seanjc.bounces.google.com>)
 id 6a456b89-97e6-0a2a45090019-d155d7cab537-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:33:30 +0200
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-c9d5a5b63c5so883487a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:33:30 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934408; x=1783539208; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ukYnz5D3jEol4z1WUeRHDVtFiLPopAappLYurzMw/rI=;
        b=fai+YAy4/7XjQOg3T8VNf8nCwAkpKElDiQdCM9h3UBYGCGvjbht5/BdJjeFGt5ysz7
         vLMS3DAE+EGnvGfMDBlPXTQxld0qa0u6BH1I1arGeiu0r2r/NYtI/gFcG7mXE9XOnpSa
         lqrZUMDdR4HVILaEcjZqpKgNy6h/w4OZSRehvzLK23wDu3rBVAqvKd1r2X9KndCJF6/y
         NA5/cvl/hiXdt2DaY3D+JADpMA+FNH6xJUud8G4b2JU6MBbA/Ah56kAiNGh6HnZMqmMb
         RZi8ymrgF97UCOYLkwg8mLYJig0tyT/5Cs6W3XWTrn2PE14inMcFDXJtChXZBRV6a4b/
         A1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934408; x=1783539208;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukYnz5D3jEol4z1WUeRHDVtFiLPopAappLYurzMw/rI=;
        b=Hl0RSSTB3URgFDmsQtWequubqha1EK+6xHg+AknTLEK9g6L+iAz0FtzLoJtB2/OI83
         jWBt7DjRHABICIQV8/YSiwwZXdoordc4okBVHikEebdgHBcesKgBojKj/1QqQFFKGuTl
         tdSSEr950RT9pDKjVPwWgDOqQEl2ZFywSGAk7F5dSuznTUbjKgdzCE7HLG/3tMJ3Qsi7
         FFNzn8D/f71MOJNHCQCuX5XCRr6he8KM5gxuzjflgGh1q7UxJYvqCUE3kn10o6A1BHfB
         b2thaPVTd7aD5N03CLmdG/y0J5lsZDyBp/7sdL9Ok6Pzg5vA8kkT/9U0rZH0zadXl3fe
         bOgg==
X-Forwarded-Encrypted: i=1; AFNElJ8YGL7eepovLa53nGRecguAEe17BztJFT3tteTX1yDuh4g6qeOoDzlUjGbRXv9l8KE7B6kBDaJnDNo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyV/fAM+w31TVEFAhJRlbWNJQiLP0QY3JJsxSi1WtCrwptfExE+
	AV/3muG3qRwPw55ChrwPkr+QLvmFiTMlaa6TQc3rkoOHp/Aa+mO/TDY7uMrzhBhdod9h3BrYD3H
	sKOdP6g==
X-Received: from pgad26.prod.google.com ([2002:a05:6a02:4f5a:b0:c99:d21a:f6b7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:748b:b0:3bf:d1f9:b1db
 with SMTP id adf61e73a8af0-3bfed5e1001mr3530009637.52.1782934408107; Wed, 01
 Jul 2026 12:33:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:32:12 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-52-seanjc@google.com>
Subject: [PATCH v5 51/51] x86/kvm: Get local APIC bus frequency from PV CPUID
 Timing Info
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1782934410-46327986-871ED5DB/13/0
X-purgate-type: clean
X-purgate-size: 1407
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zytor.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,amazon.co.uk,infradead.org,outlook.com,linutronix.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:mhklinux@outlook.com
 ,m:tglx@linutronix.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amazon.co.uk:email];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 464B76F0EC0

When running as a KVM guest with PV timing info provided by the host,
stuff the APIC timer period/frequency with the local APIC bus frequency
reported in CPUID.0x40000010.EBX instead of trying to calibrate/guess the
frequency.

See Documentation/virt/kvm/x86/cpuid.rst for details.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index f9a6346077b0..beea0b6aa78e 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -990,7 +990,7 @@ static void __init kvm_init_platform(void)
 		.mask_lo = (u32)(~(SZ_4G - tolud - 1)) | MTRR_PHYSMASK_V,
 		.mask_hi = (BIT_ULL(boot_cpu_data.x86_phys_bits) - 1) >> 32,
 	};
-	u32 timing_info_leaf;
+	u32 timing_info_leaf, apic_khz;
 	bool tsc_is_reliable;
 
 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT) &&
@@ -1052,6 +1052,11 @@ static void __init kvm_init_platform(void)
 			x86_init.hyper.get_tsc_khz = kvm_get_tsc_khz;
 			x86_init.hyper.get_cpu_khz = kvm_get_tsc_khz;
 		}
+
+		/* The leaf also includes the local APIC bus/timer frequency.*/
+		apic_khz = cpuid_ebx(timing_info_leaf);
+		if (apic_khz)
+			apic_set_timer_period_khz(apic_khz, "KVM hypervisor");
 	}
 
 	/*
-- 
2.55.0.rc0.799.gd6f94ed593-goog


