Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMNtDC6sGWpEyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:09:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7866044F8
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322475.1588747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSypw-0000I7-7A; Fri, 29 May 2026 15:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322475.1588747; Fri, 29 May 2026 15:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSypw-0000Gk-4B; Fri, 29 May 2026 15:09:24 +0000
Received: by outflank-mailman (input) for mailman id 1322475;
 Fri, 29 May 2026 15:09:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <346sZagYKCfgxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 1wSypv-0000Gb-B0
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:09:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSypu-00BVNk-Nz
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:09:22 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <346sZagYKCfgxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 6a19ac18-2eae-0a2a0a5409dd-0a2a4505bfc8-10
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:09:22 +0200
Received: from [209.85.215.202] (helo=mail-pg1-f202.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <346sZagYKCfgxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 6a19abe5-aaa8-0a2a45050019-d155d7cab199-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:08:22 +0200
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-c8292e18166so7029776a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:08:22 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780067300; x=1780672100; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=hiLxlYw3clwD2dLxI09vlAh7vN9DHw/HVEHbWWzJKBk=;
        b=t4SchzvOrZ2XyVOaJV+FEC94DaEErk3MY0wW+9jAXkc4sl12364IWzmGl4MKmFQt/W
         x5+AWrS2muBFN9KJDJ6nGslH6Yynpy/qhN3VXDre1q2jnu3YzMhJUaBDWO9fP7ZX2CEA
         PNu/I9WE7r6i0RhqsaB3LEnVjoMcS6JX3FktnpTYIQLOevjtd6hyevUNyON+1WDOcmOl
         guf6n/W8UMawOWeeF/La/S6k1Sn9fT6T4cqL4JORfH4NhXhZMVQO3uGkcscPJGgPU0OT
         YRG42qqRep1IBfkX5isAagTJjWpf2r1kYBT9GaupB3kf3gqHZ1yH+EUWpJBPHl7FBWWQ
         hIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067300; x=1780672100;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiLxlYw3clwD2dLxI09vlAh7vN9DHw/HVEHbWWzJKBk=;
        b=gf4IgJeJJgzokkP/vvUZH9F0eC5H734UhyPpmteVD3qj8EOS26MK2xuh67L2yAHVRY
         r0c1SxkkLQXsYwRxXzDgraGImIP1GOjEOy9dyLIb3bFoT5bo7bPBMODL82QvadGfbxeX
         Q+2g4UDjnrwtgOBndIIeWDH6z+PEUsWd2R8aU+rpvNZg4aQj5SLep+cTF+XLRS+rEg5n
         qNI9BCxPyMkw9Rb289K4IXSlx4gFVwez1KQH1pxg5NIBLWD4nh3YBIoaxIoLR1Or6DYS
         3ZBnPrWacuLwB0O9I+qxncddbF9Wzpd/p1l7OmvZOMxkXlPAp8wtRdOD9oN11Ev9fHLX
         3uEw==
X-Forwarded-Encrypted: i=1; AFNElJ+HrYfMRyq+HkPZgSFnSyM80uRsE5E+rMZByTNElceqE936L5R170zxCkrKBeGjA0jmyoh2slwuPH0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzuFHTiC7XDbGrm4jYeColdHLgIHOeSSSwZPIjh4ay9B0fKjAF
	o28tfave/m6R80RRfME+Uskugjw56hzJE0exTLqR5BFUVCNVoxSf8RJCyTNvayi2KdNb2EJSzPm
	mr0TMNA==
X-Received: from pgx6.prod.google.com ([2002:a63:1746:0:b0:c79:81bb:79ef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9149:b0:3b2:a958:a725
 with SMTP id adf61e73a8af0-3b411e478f7mr4139551637.41.1780067299927; Fri, 29
 May 2026 08:08:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:18 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150818.714760-1-seanjc@google.com>
Subject: [PATCH v4 40/47] x86/kvmclock: Hook clocksource.suspend/resume when
 kvmclock isn't sched_clock
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
X-purgate-ID: tlsNG-c201ff/1780067302-D8B78443-16F20FE7/13/0
X-purgate-type: clean
X-purgate-size: 2030
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amazon.co.uk:email];
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
X-Rspamd-Queue-Id: 8F7866044F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Save/restore kvmclock across suspend/resume via clocksource hooks when
kvmclock isn't being used for sched_clock.  This will allow using kvmclock
as a clocksource (or for wallclock!) without also using it for sched_clock.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 4e304f1c887d..5dfac79a5d30 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -131,7 +131,17 @@ static void kvm_setup_secondary_clock(void)
 
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
@@ -296,6 +308,15 @@ static __init void kvm_sched_clock_init(bool stable)
 				   kvm_save_sched_clock_state,
 				   kvm_restore_sched_clock_state);
 
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
2.54.0.823.g6e5bcc1fc9-goog


