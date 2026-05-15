Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NSyOEpzB2pZ4AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:26:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E2A556C5A
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310445.1581365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyAW-0006so-Qg; Fri, 15 May 2026 19:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310445.1581365; Fri, 15 May 2026 19:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyAW-0006p7-ND; Fri, 15 May 2026 19:25:56 +0000
Received: by outflank-mailman (input) for mailman id 1310445;
 Fri, 15 May 2026 19:25:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3FHIHagYKCW0dPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@flex--seanjc.bounces.google.com>)
 id 1wNyAV-0006lk-JZ
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:25:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNyAU-009QgV-Ve
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:25:54 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3FHIHagYKCW0dPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@flex--seanjc.bounces.google.com>)
 id 6a077318-e002-0a2a0a5209dd-0a2a450c9a16-48
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:25:54 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3FHIHagYKCW0dPLYUNRZZRWP.NZXiPY-OPgPWWTded.iPYacZUPNe.ZcR@flex--seanjc.bounces.google.com>)
 id 6a077215-62f1-0a2a450c0019-d155d6caadc5-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:54 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2baf7748d0aso1728035ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:20:54 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778872853; x=1779477653; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KhBZEy0/QKSWfL+Tze5jxYQtO7z6AVGLrSR5LBAuSZ4=;
        b=ifSz7xOtZD5lXSlk45xfJ8dX9fzV9EuJRL04SukQDcTHhXtI/vBk8HGTN5g5JJPSSQ
         r0yaawL4inzcm0WNt1DSYPB+Sz0IYzgqWq0bCZvXD4Dj7lF7Dh413PTSZwGctvr1adrN
         u4m0WDL7dxatFtKM97mC32rJBicpXHshX1aDcz++A2wlsmZxUZajgl1R0EXJS5fiOA8t
         m+Dt5yiVuhkR0c+eOAd9JTrqus6u1y0QwwjH00C3sZ1cpYeIM0V99QD4hGvu1l4K4i8O
         7Ta9B9UZKm4dW803uTCDFURxsyTMcE7CU7KXhOMf9nf34WPZ9mWhoUotv/XZhlIdkE55
         8hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872853; x=1779477653;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KhBZEy0/QKSWfL+Tze5jxYQtO7z6AVGLrSR5LBAuSZ4=;
        b=VqjD0JjdbwzwIKEKyqUM5Cmz2d9B5dAvEdBT/o44iUlgB07vgQ0UKchpTEkgcIgaq4
         XzYrmlxjO/ZymGHcQ6yU+VQ6NAWcbiNPfmlAWVuiYE5Lt73Ena44GEDcODW18+0uKEfF
         vZzYPs41R/UWFR4bP1I4Ekoo4Upi69CK9JIZ/mF2gWgOHDDQT/+E9z65GyAjtc2dOHoy
         u17v6B3ar7IVMQOmtJkilhzLoJ5bVo0WYx33oXw9AQZuXBxSSfMOdj0Jpleg26fqGYXq
         9wHA2DNyvAHaxkn+IZ4hUKMPyBIsBWV+09byqQu752oH0hYfLSWBOpEtvkMtN6KjCt28
         lvAQ==
X-Forwarded-Encrypted: i=1; AFNElJ/DT4CK+uoAOot6fkHzZd+P8LLdVxMHEMVI58uzaWh4BoVG8ASbjBOJR8GSltqyinz8TX9uF393Nfo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzT2qhDgp90vVF3YMv9s0WxhAFz8GtGqspSwLVTI+9yeYVs3EIG
	MXokrAGCTPmX50lHDzzwyWxXY2JW5kh6YrGTbf4FsxsPCLKdUS3Bvp/68vjaRotPceQODLL4u8Q
	WKL36KQ==
X-Received: from plbmo16.prod.google.com ([2002:a17:903:a90:b0:2ab:194e:4d54])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c28:b0:2ba:bfb5:9cc
 with SMTP id d9443c01a7336-2bd7e8d3b9fmr61656605ad.26.1778872852484; Fri, 15
 May 2026 12:20:52 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:21 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-21-seanjc@google.com>
Subject: [PATCH v3 20/41] x86/xen/time: Mark xen_setup_vsyscall_time_info() as __init
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d25034/1778872854-E3171CF5-6E1AC557/0/0
X-purgate-type: clean
X-purgate-size: 829
X-Rspamd-Queue-Id: 96E2A556C5A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,redhat.com,broadcom.com,oracle.com,kernel.org,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de,amazon.co.uk];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kas@kernel.org,m:pbonzini@redhat.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,m:dwmw@amazon.co.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

Annotate xen_setup_vsyscall_time_info() as being used only during kernel
initialization; it's called only by xen_time_init(), which is already
tagged __init.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/time.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index ee7095febfd1..f087bb76457d 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -444,7 +444,7 @@ void xen_restore_time_memory_area(void)
 	xen_sched_clock_offset = xen_clocksource_read() - xen_clock_value_saved;
 }
 
-static void xen_setup_vsyscall_time_info(void)
+static void __init xen_setup_vsyscall_time_info(void)
 {
 	struct vcpu_register_time_memory_area t;
 	struct pvclock_vsyscall_time_info *ti;
-- 
2.54.0.563.g4f69b47b94-goog


