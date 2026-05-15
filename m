Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHiKBktzB2pZ4AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:26:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51A9556C5B
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:26:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310442.1581346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyAU-0006Mn-4M; Fri, 15 May 2026 19:25:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310442.1581346; Fri, 15 May 2026 19:25:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyAU-0006Kw-0O; Fri, 15 May 2026 19:25:54 +0000
Received: by outflank-mailman (input) for mailman id 1310442;
 Fri, 15 May 2026 19:25:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3EXIHagYKCWoaMIVRKOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@flex--seanjc.bounces.google.com>)
 id 1wNyAS-0006HZ-HR
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:25:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNyAR-001Io4-Tr
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:25:51 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3EXIHagYKCWoaMIVRKOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@flex--seanjc.bounces.google.com>)
 id 6a07733e-bab6-0a2a0a5309dd-0a2a450a9760-2
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:25:51 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3EXIHagYKCWoaMIVRKOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@flex--seanjc.bounces.google.com>)
 id 6a077212-56b3-0a2a450a0019-d155d2cac582-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:51 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-835423c69ffso75083b3a.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:20:51 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872849; x=1779477649; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HUz/DYTZsMDp3XmDdx4uAZCV01b5NalrmHfGrDrQY4I=;
        b=X+eevLshy+6MvFh3A1hJ2i+4MhR+LFb+FBk3xQ/tCAwZoZRyrdgrmMqknWBXkNCR+d
         CrGaHCbl2nCcYn5jLaWg30oE8p7HntZxg+g+qaIL3TWiZ/wXQwjSIHvuw9qB003YVgej
         ADavq+0Rr7YgEQ6LHxhTJFe7F0OusGcy24P75hhgnjoVODGp3IAIv0nhCmz0COoh42+l
         W6by+zWCdRdJj46wdDF/XiyNUrE2HTTB3lAmOEn67mV2Z/B9wPI+Fi5kW8AchWjvS76W
         8F5a0B2B3aYIOjUYjYXSLK17B1pPAIY3NM+2t8nv+j98ogyJdLwrDoTNdfoZ60/kPQA9
         j9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872849; x=1779477649;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUz/DYTZsMDp3XmDdx4uAZCV01b5NalrmHfGrDrQY4I=;
        b=o/PkjsM3UNDiRbrDJDLZgxNMRoMpkttasQ9vX4qyesjpWheAKt0/2+EQiKdXQxVNwT
         xCNPxskCCzKQPWyJYMVIBrHkGhq5Nt4bEsWf+59bta0ddNhX/UkEsudxZYp6TXnjDLNE
         ZdYmnijqhViRFbApNFOa879Do1l4oLcVK3apL3Z+bBemv3uOwFs8lwMPLkCFHeumzRdr
         vdyhLyyCH7IxujKLDi1bqWkrlgQkcvalLMPpeYV9H/VaK4D1zVSUyApy6Fw+onzGdrXG
         iqC9w8iaamy7qGZc1rP1HGknp8TtojsYsKV6LJDCsRVMDUFySE+THZwYKGppSdQAkegh
         LGQw==
X-Forwarded-Encrypted: i=1; AFNElJ8YrxdtEZpePq0w4xSjgWyvhNdJzf4sv+yeol0Hk6UCHG9Yl2oi7gqphT25UgMqJqvKNBYFR+0l3NM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzy3QQp9Zob3rj1hUXcoLCUkf0xbs4BBhMelH7mV2mKp0Fp0xQV
	8aTmv1GZJyhtQwxtZdE9zjGQwxkXZwMPuMjx+x/gxrCQnvfmZoP10h8C8hWLun5NT95KB+qXqNo
	SD9YJ0Q==
X-Received: from pfmm20.prod.google.com ([2002:a05:6a00:2494:b0:835:43a4:4aaa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6ca2:b0:83d:b11f:7979
 with SMTP id d2e1a72fcca58-83f33c60deemr6247193b3a.29.1778872849160; Fri, 15
 May 2026 12:20:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:18 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-18-seanjc@google.com>
Subject: [PATCH v3 17/41] x86/tsc: WARN if TSC sched_clock save/restore used
 with PV sched_clock
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
X-purgate-ID: tlsNG-4011c0/1778872851-7236B8B7-28DCF8B3/0/0
X-purgate-type: clean
X-purgate-size: 1339
X-Rspamd-Queue-Id: C51A9556C5B
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

Now that all PV clocksources override the sched_clock save/restore hooks
when overriding sched_clock, WARN if the "default" TSC hooks are invoked
when using a PV sched_clock, e.g. to guard against regressions.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 567d30b30a5a..b14c4ada89a3 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -984,9 +984,17 @@ EXPORT_SYMBOL_GPL(recalibrate_cpu_khz);
 
 static unsigned long long cyc2ns_suspend;
 
+static __always_inline bool tsc_is_save_restore_needed(void)
+{
+	if (WARN_ON_ONCE(!using_native_sched_clock()))
+		return false;
+
+	return static_branch_likely(&__use_tsc) || sched_clock_stable();
+}
+
 void tsc_save_sched_clock_state(void)
 {
-	if (!static_branch_likely(&__use_tsc) && !sched_clock_stable())
+	if (!tsc_is_save_restore_needed())
 		return;
 
 	cyc2ns_suspend = sched_clock();
@@ -1006,7 +1014,7 @@ void tsc_restore_sched_clock_state(void)
 	unsigned long flags;
 	int cpu;
 
-	if (!static_branch_likely(&__use_tsc) && !sched_clock_stable())
+	if (!tsc_is_save_restore_needed())
 		return;
 
 	local_irq_save(flags);
-- 
2.54.0.563.g4f69b47b94-goog


