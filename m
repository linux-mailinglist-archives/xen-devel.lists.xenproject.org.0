Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIvQFhtyB2pX3wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:20:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B8C556A67
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310207.1581131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5b-0000ts-1s; Fri, 15 May 2026 19:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310207.1581131; Fri, 15 May 2026 19:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5a-0000nv-FM; Fri, 15 May 2026 19:20:50 +0000
Received: by outflank-mailman (input) for mailman id 1310207;
 Fri, 15 May 2026 19:20:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3DHIHagYKCWUVHDQMFJRRJOH.FRPaHQ-GHYHOOLVWV.aHQSURMHFW.RUJ@flex--seanjc.bounces.google.com>)
 id 1wNy5X-0000C1-Op
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:20:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy5X-007OOK-4i
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:20:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3DHIHagYKCWUVHDQMFJRRJOH.FRPaHQ-GHYHOOLVWV.aHQSURMHFW.RUJ@flex--seanjc.bounces.google.com>)
 id 6a077201-bab6-0a2a0a5309dd-0a2a45069cfa-24
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:47 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3DHIHagYKCWUVHDQMFJRRJOH.FRPaHQ-GHYHOOLVWV.aHQSURMHFW.RUJ@flex--seanjc.bounces.google.com>)
 id 6a07720d-7371-0a2a45060019-d155d7c9a4d8-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:46 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c70f19f0f37so46291a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:20:46 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872845; x=1779477645; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/y8QjMIN78jXY0C38vMz/eIP3YtBj5/Xygk6fhPK+NQ=;
        b=uAbHNbaw7coMfGAR52XwFiL+6sJ1Dc+MCUxYnIr3LhiUBElt+la8hoyk62WGoPkowV
         Z7+iVasgRcfrmOetCUIG4b9FtDIQZBXZJG9z5XTszG25AapaK4IakM30SFxu7R4B1RP3
         U6pJXxEhRy7kfBPnmEIorAkq58LYJ3uHHptpzwz7JvfJUkn144wbLS2nkqn8ibdOD+nX
         0sJqaDDY795y6EAcaDGuD3YJAnBVHR1enUr6cnW39WSJlK5iALHM6FJxCffLUzrmAzAq
         00jJydKwXko7EEsCTijIayjKTyRqsqsxAUHZSoZAtYuTJfxZYgcokV/x4k73KV029rwL
         XS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872845; x=1779477645;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/y8QjMIN78jXY0C38vMz/eIP3YtBj5/Xygk6fhPK+NQ=;
        b=F/tSWhsbEFGDji0jJoW5cRH1cS5tem+NXqcSrVVorwcDNnkmJVgSK/8ETz//p01qb2
         NCma19D+K8fw0pqpgWXvZY1cS7deA0jt+6h+gGjzYJkxbPj6i0/eeQb9FF0VkbIWql4t
         2FaQB58+2a1xOrM8yI1ogSJqnAWX/5ZaEsNR5/QcqlwpotBSg1+5XYm4qm3i1AHno2Ow
         EzWn34LMpGSff7N3RCyoK9kvMiGuLnk4f+C9yoDdYTe09L7WamoqUuIV8folc6pi4bfa
         mIsS+iis+rz3sM5PabFWqTPjeZUv/sbt3Bw1KI8ZTblHGWdoaGBhYmd+aGNSv3ndL0VC
         w6tw==
X-Forwarded-Encrypted: i=1; AFNElJ+DUHOy0sqln6v6zZY5Y4lgcjGB7XqXOsZEaTBLZkHltAZ0uQ+JxGOF3awLbXcTwCRW99Zq9uflt9A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhFIe/FvdZfkjYOUODj49DGA+f442sLvKtJmfuw35lchNNt5uy
	/A0Q+a5PlbaaYF6lDaPdUliQ0Du6VqN7J1vbciEIp/lYmnrrX5gltKijNya1BfYt1TQ+7PYWnKO
	uKjDtaA==
X-Received: from pgbda3.prod.google.com ([2002:a05:6a02:2383:b0:c73:bc95:cca8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4328:b0:3a2:cf6d:aa04
 with SMTP id adf61e73a8af0-3b0bdd00bfbmr9342014637.8.1778872844563; Fri, 15
 May 2026 12:20:44 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:14 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-14-seanjc@google.com>
Subject: [PATCH v3 13/41] x86/paravirt: Move handling of unstable PV clocks
 into paravirt_set_sched_clock()
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
X-purgate-ID: tlsNG-16d1c6/1778872847-8C07ED75-AE88070B/0/0
X-purgate-type: clean
X-purgate-size: 2517
X-Rspamd-Queue-Id: E0B8C556A67
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

Move the handling of unstable PV clocks, of which kvmclock is the only
example, into paravirt_set_sched_clock().  This will allow modifying
paravirt_set_sched_clock() to keep using the TSC for sched_clock in
certain scenarios without unintentionally marking the TSC-based clock as
unstable.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/timer.h | 7 ++++++-
 arch/x86/kernel/kvmclock.c   | 5 +----
 arch/x86/kernel/tsc.c        | 5 ++++-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
index c71b466d6ace..fe41d40a9ae6 100644
--- a/arch/x86/include/asm/timer.h
+++ b/arch/x86/include/asm/timer.h
@@ -14,7 +14,12 @@ extern int no_timer_check;
 extern bool using_native_sched_clock(void);
 
 #ifdef CONFIG_PARAVIRT
-void paravirt_set_sched_clock(u64 (*func)(void));
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable);
+
+static inline void paravirt_set_sched_clock(u64 (*func)(void))
+{
+	__paravirt_set_sched_clock(func, true);
+}
 #endif
 
 /*
diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 006e3a13500b..1cbdb48e5503 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -12,7 +12,6 @@
 #include <linux/hardirq.h>
 #include <linux/cpuhotplug.h>
 #include <linux/sched.h>
-#include <linux/sched/clock.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/set_memory.h>
@@ -94,10 +93,8 @@ static noinstr u64 kvm_sched_clock_read(void)
 
 static inline void kvm_sched_clock_init(bool stable)
 {
-	if (!stable)
-		clear_sched_clock_stable();
 	kvm_sched_clock_offset = kvm_clock_read();
-	paravirt_set_sched_clock(kvm_sched_clock_read);
+	__paravirt_set_sched_clock(kvm_sched_clock_read, stable);
 
 	pr_info("kvm-clock: using sched offset of %llu cycles",
 		kvm_sched_clock_offset);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 021612c22b84..567d30b30a5a 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -280,8 +280,11 @@ bool using_native_sched_clock(void)
 	return static_call_query(pv_sched_clock) == native_sched_clock;
 }
 
-void paravirt_set_sched_clock(u64 (*func)(void))
+void __paravirt_set_sched_clock(u64 (*func)(void), bool stable)
 {
+	if (!stable)
+		clear_sched_clock_stable();
+
 	static_call_update(pv_sched_clock, func);
 }
 #else
-- 
2.54.0.563.g4f69b47b94-goog


