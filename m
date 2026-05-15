Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGJrAi9zB2r03wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:25:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97699556C35
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:25:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310391.1581324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyA3-0003vB-1h; Fri, 15 May 2026 19:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310391.1581324; Fri, 15 May 2026 19:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyA2-0003nZ-Px; Fri, 15 May 2026 19:25:26 +0000
Received: by outflank-mailman (input) for mailman id 1310391;
 Fri, 15 May 2026 19:25:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3MXIHagYKCYo6so1xqu22uzs.q20Bs1-rs9szzw676.Bs1352xsq7.25u@flex--seanjc.bounces.google.com>)
 id 1wNyA1-0003gN-8F
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:25:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNyA0-00Dx3J-Kx
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:25:24 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3MXIHagYKCYo6so1xqu22uzs.q20Bs1-rs9szzw676.Bs1352xsq7.25u@flex--seanjc.bounces.google.com>)
 id 6a0772f2-5cb7-0a2a0a5109dd-0a2a45069d3a-40
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:25:24 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3MXIHagYKCYo6so1xqu22uzs.q20Bs1-rs9szzw676.Bs1352xsq7.25u@flex--seanjc.bounces.google.com>)
 id 6a077232-7371-0a2a45060019-d155d2cad42e-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:21:24 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-82f6e6a3a76so260904b3a.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:21:23 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872882; x=1779477682; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=CJ9Kqslov6eJXg3tHpdlTt5rxLZvQw1ej96frcIls5c=;
        b=nYLWfiY55hDUBYOGV5jepJJzeZhVOIRUPUD54I/NscZ7oIIknycoxi8bA38rI4/Yea
         Yn/rWDwlaQ8SCR0r0MLcJsqSYNfw1wshTHz3eswbA16EaGxB9muFSwDt/2FC5RSXl/O6
         X7t1sS4p4Aebgx5O2Hz3s1J80xw1BF8T9HB2JcK1R0j5e2SZZyIw2hAewDs8Vxlb2TUY
         0uZey2FM5Td+OwzCdXy1WLu4RNGxjfiHJHbdGiRw+mkb1+J2d7U2KpuLfd6dzSE2h6LX
         ofEPIqPU0/QBjhFXOM1LFqz1maRK7s2kwFwjzife6fZWuCVfMev3vJve91k13DE9QKG/
         f7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872882; x=1779477682;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJ9Kqslov6eJXg3tHpdlTt5rxLZvQw1ej96frcIls5c=;
        b=fWJshJ1kWgOwrm74CFz1fP17Q51S9kisKfv3OzI6LDu1HIIb2B9PGt/XYlkPIRy8Zo
         fninjYCkhWNYWUVJ4FwFM8KMVyyLg1FV4u5Aq6K6nqZNE5qMeXCP9WIAFGZelV2wlg2I
         +i1mtysvPWEb8SWt+LuIycnNf2B0/uI9hu0VkaPCjNSFB8vHf8MMxbJb34IhdGBCB+du
         TN6OQuJpRKm1Vp9kyEw4bAvWEPMbsuLwcJcPi2oRcieXEfJePj0Vue1oQ9PtKDx+Khqt
         IixrMiyqsG72zVLEZjn+RJ9TyW/yJ/Cr8s4YJbTo4Mv419lB9C/kP9acazAuAv4HiNGE
         wEuQ==
X-Forwarded-Encrypted: i=1; AFNElJ85199OdsXCeMg6aj9pnccNIXrt+6y42EMxhOrdLnc387eerJG1MF9P3pMfqnBRLtgruMBIh67fe0g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymrBRym7snDaLJIeh2VYWBuDR/ZbFqRZKtuhBKGRlmieh/hHpm
	lDLsHZGlcwJE4/FOIAW7zNCJy/oEtkX9IXE4KKXcZAJv6zE0pqPZ+gPom8QBMYecY+jjx82vR3v
	pjEmTAg==
X-Received: from pfmm20.prod.google.com ([2002:a05:6a00:2494:b0:835:43a4:4aaa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d19:b0:82f:a89e:e16f
 with SMTP id d2e1a72fcca58-83f33b2f58fmr5940174b3a.14.1778872881979; Fri, 15
 May 2026 12:21:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:40 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-40-seanjc@google.com>
Subject: [PATCH v3 39/41] x86/paravirt: Move using_native_sched_clock() stub
 into timer.h
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
X-purgate-ID: tlsNG-16d1c6/1778872884-8C87AD75-6B0CE198/0/0
X-purgate-type: clean
X-purgate-size: 1740
X-Rspamd-Queue-Id: 97699556C35
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

Now that timer.h ended up with CONFIG_PARAVIRT #ifdeffery anyways, move the
PARAVIRT=n using_native_sched_clock() stub into timer.h as a "free"
optimization.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 5 +++--
 arch/x86/kernel/tsc.c        | 2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index ab1271bd9c3b..d8cb9c84f2c7 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -11,9 +11,9 @@ extern void recalibrate_cpu_khz(void);
 
 extern int no_timer_check;
 
-extern bool using_native_sched_clock(void);
-
 #ifdef CONFIG_PARAVIRT
+extern bool using_native_sched_clock(void);
+
 int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 				      void (*save)(void), void (*restore)(void),
 				      void (*start_secondary));
@@ -27,6 +27,7 @@ static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
 void paravirt_sched_clock_start_secondary(void);
 #else
 static inline void paravirt_sched_clock_start_secondary(void) { }
+static inline bool using_native_sched_clock(void) { return true; }
 #endif
 
 /*
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index f78e86494dec..1b569954ae5e 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -316,8 +316,6 @@ int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 }
 #else
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
-
-bool using_native_sched_clock(void) { return true; }
 #endif
 
 notrace u64 sched_clock(void)
-- 
2.54.0.563.g4f69b47b94-goog


