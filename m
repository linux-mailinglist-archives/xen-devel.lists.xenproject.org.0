Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDDDOO6sGWpyyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:12:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476E26045B5
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322515.1588801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSysx-0005By-QN; Fri, 29 May 2026 15:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322515.1588801; Fri, 29 May 2026 15:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSysx-00059h-NY; Fri, 29 May 2026 15:12:31 +0000
Received: by outflank-mailman (input) for mailman id 1322515;
 Fri, 29 May 2026 15:12:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <36qsZagYKCQEtfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@flex--seanjc.bounces.google.com>)
 id 1wSysw-00059P-2h
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:12:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSysv-00EPYa-Ff
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:12:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <36qsZagYKCQEtfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@flex--seanjc.bounces.google.com>)
 id 6a19acc5-bab6-0a2a0a5309dd-0a2a450bbb3e-36
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:12:29 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <36qsZagYKCQEtfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@flex--seanjc.bounces.google.com>)
 id 6a19abeb-212f-0a2a450b0019-d155d6cabd69-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:08:28 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2bf1845bddfso13003305ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:08:28 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780067307; x=1780672107; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2eZ/5/NHYtlqNBUgYS8sS/KxrmMqlqE8QNmqFczaR90=;
        b=MV5cYKVyoqlzWyE+a5+5kVAqmLv0JHlZMJq8/3JPZkwrs58+o+kfC6FgSDmyfQ0Iwy
         T/PFPKWTepui9RTkRuhxE1BQf94ZT3uxzHy8CcgfMu8I9GLM+PhaZt2nMB2dVYoaVRP3
         X2/JEjUnX5e7jTIYlp+jMaEaK8Gi7+yRR9GBcuiBSefJIMUUFQMgdTl/++Zu2wqQ+i+s
         vrlrpo8TWuT8xm2WsyumfxnddNeAqjp2hIVVDM4G3b8xzyHP5WKCV4iYKxM33UU8PMKD
         pQtwBzkXivikA7/iceU0TecTElLmIb+YQtCVh3pOPdKPHa+WZnKG1BbkSWyplCljLz4k
         reeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067307; x=1780672107;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eZ/5/NHYtlqNBUgYS8sS/KxrmMqlqE8QNmqFczaR90=;
        b=hFbJj+00zbiqR4gjwoGIKFQuO8lHqTp59AhWlSvFLjvPfdSVN8AM3e2ftx5OX0ZQz8
         DcGPB49MqN9dalXXNfPkhU3ieoB3ziVPNNG951cMMMPxe1UAAvp7ySU8EW1KrOZwJrx2
         pmLXtVcCZnaBYL08OeryGJJr7/E8IN/qMKZ88rM5W4odq2+UZp6uSVdlRXS+QAt+BeA6
         68eQ1N3DCHNBd9Cw367diPcha688Nbj6jP40aK9nOYoB2TWlnqb8EsVsIAETUkxQZr+N
         gkE6QagzBCSRd5exuGYrf79oPYZ7zPLi3hu2QgjN5/uWMTceBP7oL1r9OpBiSNYCnsH3
         2iBA==
X-Forwarded-Encrypted: i=1; AFNElJ8sBvCXfo1R9KYolYGlD/VE1/xIMXxoaDScb73tocotaQchx2ytqbYVuWlywl1MEQ2sjGgfEyoNwfU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf7fEMZDkM9ZwD6A6YgHlkMtwWhot78AVLQPuVJPjoGC3eNoJR
	uRMNWYqEtOP3E8qz7UfBfkJEafya+Of8AvdJsDpTt6qCSPCVNqn66YIP758yo6r3GHmhtvItel8
	O11klfw==
X-Received: from plau10.prod.google.com ([2002:a17:903:304a:b0:2ba:67f8:6257])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c94c:b0:2bf:604:d5ad
 with SMTP id d9443c01a7336-2bf368904abmr2085275ad.37.1780067306314; Fri, 29
 May 2026 08:08:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:24 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150824.714934-1-seanjc@google.com>
Subject: [PATCH v4 43/47] x86/paravirt: Plumb a return code into __paravirt_set_sched_clock()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H . Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-42698a/1780067309-22589F3B-2F21E06D/0/0
X-purgate-type: clean
X-purgate-size: 3365
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
	FREEMAIL_CC(0.00)[zytor.com,intel.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amazon.co.uk,amd.com,infradead.org,outlook.com,linutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:dwmw@amazon.co.uk,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw2@infradead.org,m:mhklinux@outlook.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amazon.co.uk:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 476E26045B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a return code to __paravirt_set_sched_clock() so that the kernel can
reject attempts to use a PV sched_clock without breaking the caller.  E.g.
when running as a CoCo VM with a secure TSC, using a PV clock is generally
undesirable.

Note, kvmclock is the only PV clock that does anything "extra" beyond
simply registering itself as sched_clock, i.e. is the only caller that
needs to check the new return value.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 6 +++---
 arch/x86/kernel/kvmclock.c   | 9 ++++++---
 arch/x86/kernel/tsc.c        | 5 +++--
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index 96ae7feac47c..ca5c95d48c03 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -14,14 +14,14 @@ extern int no_timer_check;
 extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
-void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				       void (*save)(void), void (*restore)(void));
+int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				      void (*save)(void), void (*restore)(void));
 
 static __always_inline void paravirt_set_sched_clock(u64 (*func)(void),
 						     void (*save)(void),
 						     void (*restore)(void))
 {
-	__paravirt_set_sched_clock(func, true, save, restore);
+	(void)__paravirt_set_sched_clock(func, true, save, restore);
 }
 #endif
 
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 73fabfac2bc9..1336c24f59cf 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -310,10 +310,13 @@ static int kvmclock_setup_percpu(unsigned int cpu)
 
 static __init void kvm_sched_clock_init(bool stable)
 {
+	/* Ensure the offset is configured before making kvmclock visible! */
 	kvm_sched_clock_offset = kvm_clock_read();
-	__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
-				   kvm_save_sched_clock_state,
-				   kvm_restore_sched_clock_state);
+
+	if (__paravirt_set_sched_clock(kvm_sched_clock_read, stable,
+				       kvm_save_sched_clock_state,
+				       kvm_restore_sched_clock_state))
+		return;
 
 	/*
 	 * The BSP's clock is managed via dedicated sched_clock save/restore
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 6da0a3ac05c2..7bcf757bf551 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,8 +280,8 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
-void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
-				       void (*save)(void), void (*restore)(void))
+int __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
+				      void (*save)(void), void (*restore)(void))
 {
 	if (!stable)
 		clear_sched_clock_stable();
@@ -289,6 +289,7 @@ void __init __paravirt_set_sched_clock(u64 (*func)(void), bool stable,
 	static_call_update(pv_sched_clock, func);
 	x86_platform.save_sched_clock_state = save;
 	x86_platform.restore_sched_clock_state = restore;
+	return 0;
 }
 #else
 u64 sched_clock_noinstr(void) __attribute__((alias("native_sched_clock")));
-- 
2.54.0.823.g6e5bcc1fc9-goog


