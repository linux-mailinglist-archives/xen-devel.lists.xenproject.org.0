Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /h2pHhtyB2qM3wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:20:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F161B556A6A
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310204.1581118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5Y-0000Hh-5z; Fri, 15 May 2026 19:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310204.1581118; Fri, 15 May 2026 19:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5X-0000BW-Sk; Fri, 15 May 2026 19:20:47 +0000
Received: by outflank-mailman (input) for mailman id 1310204;
 Fri, 15 May 2026 19:20:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3C3IHagYKCWQUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--seanjc.bounces.google.com>)
 id 1wNy5W-0008Te-KR
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:20:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy5W-009Q6I-0i
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:20:46 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3C3IHagYKCWQUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--seanjc.bounces.google.com>)
 id 6a0771f7-e002-0a2a0a5209dd-0a2a45098270-26
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:45 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3C3IHagYKCWQUGCPLEIQQING.EQOZGP-FGXGNNKUVU.ZGPRTQLGEV.QTI@flex--seanjc.bounces.google.com>)
 id 6a07720c-2497-0a2a45090019-d155d2cab11a-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:45 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-82fa6c3a77cso78703b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:20:45 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872844; x=1779477644; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=62wrPM0lWE30yV9zyxGJWUHaw5WRQ2hiTxFnD7TdkoU=;
        b=oiyjUbdNfDoFCTDIVfxwpeBvXvuurV4x9T9C/Byz0DpIVwZdyT1nOLD2xrpKIUlgnH
         FFVr+sGuvaRwi0J8RIHN1p3V48chMU1Y/X7VasRO9lmXs3Ph2aDScNPHcBtIcZXVCDxW
         KoTR+ThJ0b65p6bInInAKWyZ6h4FCGT8pS1R2JoK911NQvtzqjadZOibWLrtY2zklIpC
         IBESYLkpyWGQVh4yoReq9sA5L6ke6mIRH1NRlboICvI+C8Zw064BGj6Ok5pr+mF6qIad
         f/XMwbJ/i0dcbvr8Whe5JMMPgSV6jDMjurxRgwGMUYrNVToNAVeAikKPadusSEVRGFfQ
         DR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872844; x=1779477644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62wrPM0lWE30yV9zyxGJWUHaw5WRQ2hiTxFnD7TdkoU=;
        b=UZcsQaWDcVk1KTyL6rYYLBkReSh/cRapK6UgAlVcBa1GSpQxvpTRpgb+1+5NdMIYwU
         Zyr06BlxN2DCVilq/qec5fkpAwD1Tn8zadAzxcPQR3kA30eC3xiZ4ThyOEbU0NC13rDt
         z9v/tXc+QP8nl7vIJYzo/PR9TXIzJurY39UvHDslR/rsLQpPUdvbDqwdcPnuPvNX40/8
         lWiuMyH9H8NSDg/cLR7BQgyeQWg0n8sWqt2sfjwiYDlhLkQ4+hTpmnrXPA4xc1ffsWCY
         NTn0U84DnhcnIj2xKCS+UWV5Lie83QLMQVdHwpUvYK2nYsNNBrkdtZkD28S2CDRW7lmh
         vfzw==
X-Forwarded-Encrypted: i=1; AFNElJ+drciCkDdNpRMKel2ADecGw6T1Ytj+2jHsKvkOyHkTvTdG56AbjwIQKkjikV08KW/9XuHSUG9Fi24=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQOUKw5p6qWqbcyyrBsA2usuWuFEPFip3K4T29U33Ibm7XF7wM
	Mo/q8wRfxaLjo3AsOb8/PwGrVqut+lG8/fCu8j0UJL/PPBGgkbajwdBF+PDkuk0QDwUxDvzxXGp
	XO0SGfg==
X-Received: from pfbg4.prod.google.com ([2002:a05:6a00:ae04:b0:82f:c34b:9799])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4193:b0:83e:eeab:aff8
 with SMTP id d2e1a72fcca58-83f33d24d7cmr6075416b3a.25.1778872843406; Fri, 15
 May 2026 12:20:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:13 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-13-seanjc@google.com>
Subject: [PATCH v3 12/41] x86/paravirt: Remove unnecessary PARAVIRT=n stub for paravirt_set_sched_clock()
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
X-purgate-ID: tlsNG-bad1c0/1778872845-88970A53-64006DA5/0/0
X-purgate-type: clean
X-purgate-size: 1520
X-Rspamd-Queue-Id: F161B556A6A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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

Remove the unnecessary paravirt_set_sched_clock() stub for PARAVIRT=n, as
all callers are gated by PARAVIRT=y.  Eliminating the stub will avoid a
pile of pointless churn as the "real" implementation evolves.

No functional change intended.

Fixes: 39965afb1151 ("x86/paravirt: Move paravirt_sched_clock() related code into tsc.c")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 3 +++
 arch/x86/kernel/tsc.c        | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index fda18bcb19b4..c71b466d6ace 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -12,7 +12,10 @@ extern void recalibrate_cpu_khz(void);
 extern int no_timer_check;
 
 extern bool using_native_sched_clock(void);
+
+#ifdef CONFIG_PARAVIRT
 void paravirt_set_sched_clock(u64 (*func)(void));
+#endif
 
 /*
  * We use the full linear equation: f(x) = a + b*x, in order to allow
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index e00f53e3dd8d..021612c22b84 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -288,7 +288,6 @@ void paravirt_set_sched_clock(u64 (*func)(void))
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
 
 bool using_native_sched_clock(void) { return true; }
-void paravirt_set_sched_clock(u64 (*func)(void)) { }
 #endif
 
 notrace u64 sched_clock(void)
-- 
2.54.0.563.g4f69b47b94-goog


