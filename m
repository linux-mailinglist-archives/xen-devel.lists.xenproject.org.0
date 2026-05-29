Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGiDCvunGWoIyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:51:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C0603F8A
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:51:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322379.1588648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyYY-0007oB-6D; Fri, 29 May 2026 14:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322379.1588648; Fri, 29 May 2026 14:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyYY-0007lN-2x; Fri, 29 May 2026 14:51:26 +0000
Received: by outflank-mailman (input) for mailman id 1322379;
 Fri, 29 May 2026 14:51:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3gKYZagYKCYs7tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--seanjc.bounces.google.com>)
 id 1wSyYW-0007kc-H4
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:51:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyYV-004dmp-QF
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:51:23 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3gKYZagYKCYs7tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--seanjc.bounces.google.com>)
 id 6a19a7e8-bab6-0a2a0a5309dd-0a2a4507a5b2-6
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:51:23 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3gKYZagYKCYs7tp2yrv33v0t.r31Ct2-stAt00x787.Ct2463ytr8.36v@flex--seanjc.bounces.google.com>)
 id 6a19a681-229c-0a2a45070019-d155d6c9a535-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:23 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2bf11699875so19126165ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:22 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780065921; x=1780670721; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xo1ZeU9J2iCPf0q+fMxBulUq0vgLWRTwNewVlxT3hiI=;
        b=haPhDUovUCuIPDqcXeKF7QCtPBuiOJt21VB/LjLG8QQVon3Kf/Kig1W2QHcYbW1WRT
         grjsPq0rAu8NAE69wsvzu9Ne4CiGc5/+7zSzFqt3oDToSDldQeeTZeXmA93w2Lf53RBj
         g+BRnb4mEr5DoFXwsKQDTIMdJXDrZm16Y2XTZzo+HNiy+RpOarVdOhprd8iRCroEcjBd
         BiFH7WexGEk52SNSmCaXCV7sUwb8/VwfzG8WR8xdFS3c6hU/M72UB0a8DiPYRWJYeuHW
         Mziv8LK/n265n7TTaq69D5UF9ecuI5qcaN+HovUrumx1vVNLZOfM2BkIOrVVmQQupQCc
         b+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065921; x=1780670721;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xo1ZeU9J2iCPf0q+fMxBulUq0vgLWRTwNewVlxT3hiI=;
        b=ZfQWTUT+ZeiKF8NGh8BbIalNxb8vE4C+wwlDOltd9ztVONKyGaaYUEZxI3G4ICxC1t
         cUoZJgl3YwlX3VCV35jo9pj+wzWUnloDhsWPG/Fe/5G9PlYZokbbngOYPfUgvioylKCT
         KKOMMSzMVwUZpWIJAKlVQtNSdp5kOqGgaOKdwWmAuy30AkEjaz+LKDRECiljJSol2gnJ
         8XOukjplJa/Y6Gg0NokO3y4ULm/paFzdhxZtJwWwCj5LBMwmu78RgwOsBAY0LX+Igh1G
         gsY8gZxlUCg9gebUINY8DBkug2xFUCq8LHRFl+awcR/1jj9I7xEynsIgMiQgNjVGJ139
         tuKw==
X-Forwarded-Encrypted: i=1; AFNElJ/bAN5WvqlPz8Wk4i342cJj2nwZj+tmL0Arc/yPCL1GrTE4K6mw0BGolo9sU9wwq/Gm8lwPvMp7qsw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmusB3eFh+wS9lp3BoxF6OorXUMSbZ/PjwiIgrpf153wiDTxJM
	AmMzn+yT8Ugdj+z9+oSUPfSSRsroMe09wLIwLyNiGvBRoRhNB7LIviqXCHRCQKFtBUExvvDCcgX
	FLo7CbA==
X-Received: from plblc15.prod.google.com ([2002:a17:902:fa8f:b0:2bf:238f:8196])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2448:b0:2b2:4fc1:f653
 with SMTP id d9443c01a7336-2bf20d4466cmr29629345ad.3.1780065920784; Fri, 29
 May 2026 07:45:20 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:44:11 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-25-seanjc@google.com>
Subject: [PATCH v4 24/47] clocksource: hyper-v: Don't save/restore TSC offset
 when using HV sched_clock
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
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
X-purgate-ID: tlsNG-ef75cf/1780065923-08F66C48-1232BD87/0/0
X-purgate-type: clean
X-purgate-size: 2763
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amazon.co.uk:email,outlook.com:email];
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
X-Rspamd-Queue-Id: 190C0603F8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that Hyper-V overrides the sched_clock save/restore hooks if and only
sched_clock itself is set to the Hyper-V reference counter, drop the
invocation of the "old" save/restore callbacks.  When the registration of
the PV sched_clock was done separately from overriding the save/restore
hooks, it was possible for Hyper-V to clobber the TSC save/restore
callbacks without actually switching to the Hyper-V refcounter.

Enabling a PV sched_clock is a one-way street, i.e. the kernel will never
revert to using TSC for sched_clock, and so there is no need to invoke the
TSC save/restore hooks (and if there was, it belongs in common PV code).

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Tested-by: Michael Kelley <mhklinux@outlook.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Acked-by: Wei Liu <wei.liu@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/clocksource/hyperv_timer.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyperv_timer.c
index 69c1c7264e5d..ac1d9f9c381c 100644
--- a/drivers/clocksource/hyperv_timer.c
+++ b/drivers/clocksource/hyperv_timer.c
@@ -527,9 +527,6 @@ static __always_inline void hv_setup_sched_clock(void *sched_clock)
 #include <asm/timer.h>
 
 static u64 hv_ref_counter_at_suspend;
-static void (*old_save_sched_clock_state)(void);
-static void (*old_restore_sched_clock_state)(void);
-
 /*
  * Hyper-V clock counter resets during hibernation. Save and restore clock
  * offset during suspend/resume, while also considering the time passed
@@ -539,8 +536,6 @@ static void (*old_restore_sched_clock_state)(void);
  */
 static void hv_save_sched_clock_state(void)
 {
-	old_save_sched_clock_state();
-
 	hv_ref_counter_at_suspend = hv_read_reference_counter();
 }
 
@@ -553,8 +548,6 @@ static void hv_restore_sched_clock_state(void)
 	 *                - reference counter (time) now.
 	 */
 	hv_sched_clock_offset -= (hv_ref_counter_at_suspend - hv_read_reference_counter());
-
-	old_restore_sched_clock_state();
 }
 
 static __always_inline void hv_setup_sched_clock(void *sched_clock)
@@ -562,10 +555,7 @@ static __always_inline void hv_setup_sched_clock(void *sched_clock)
 	/* We're on x86/x64 *and* using PV ops */
 	paravirt_set_sched_clock(sched_clock);
 
-	old_save_sched_clock_state = x86_platform.save_sched_clock_state;
 	x86_platform.save_sched_clock_state = hv_save_sched_clock_state;
-
-	old_restore_sched_clock_state = x86_platform.restore_sched_clock_state;
 	x86_platform.restore_sched_clock_state = hv_restore_sched_clock_state;
 }
 #else /* !CONFIG_GENERIC_SCHED_CLOCK && !CONFIG_PARAVIRT */
-- 
2.54.0.823.g6e5bcc1fc9-goog


