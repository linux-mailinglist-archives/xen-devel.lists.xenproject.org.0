Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJfVOO6sGWpEyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:12:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FAD6045B6
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322516.1588810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyt4-0005Sf-2W; Fri, 29 May 2026 15:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322516.1588810; Fri, 29 May 2026 15:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyt3-0005Qy-UU; Fri, 29 May 2026 15:12:37 +0000
Received: by outflank-mailman (input) for mailman id 1322516;
 Fri, 29 May 2026 15:12:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <38KsZagYKCQczlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 1wSyt2-0005Oj-6h
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:12:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyt1-005uea-Fl
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:12:35 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <38KsZagYKCQczlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 6a19accf-5cb7-0a2a0a5109dd-0a2a4502b5c6-26
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:12:35 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <38KsZagYKCQczlhuqjnvvnsl.jvt4lu-kl2lsspz0z.4luwyvqlj0.vyn@flex--seanjc.bounces.google.com>)
 id 6a19abf1-af86-0a2a45020019-d155d6c9a9b4-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:08:34 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2bf2bc4371bso3028935ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:08:34 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780067313; x=1780672113; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UfrlcsEyKDSqAVUZDFPjPbjb9qd7cdvAZhMFheCkbts=;
        b=VEAc2cOMsYQ/WBBpvTCgDgE8hzLiatTISgRV7sQX5pPw7mVs5OQlubbYjsCwiMNQ3A
         wUIQp1/vWfci5i/DSVf80mLPpNtuTLNP3oPzLd0qzxIe/+g8KMw/hZS0emj57FlS85kW
         XrxFvy4dAnItNWKWCwitbqvE8FiGAkaNPFrNtvNH7MwuZMxPEkruaVN8PPOh/5QVNL/V
         PF+4y0ot+m/HTLiE/tylnp8UFt1W4GaV26I5LEVm82DaAoQbOYlXuAqYH1edx+fS4+6J
         LZPHwML4j4j27u+w59BKt8A6sB3Rai/NbPvE7s+GbkI/k0ijp5usV4q8fisKF+O6Sidz
         zs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067313; x=1780672113;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfrlcsEyKDSqAVUZDFPjPbjb9qd7cdvAZhMFheCkbts=;
        b=WxxXoR1NwODSmtsi3i1zl7UGOuS25cczLysJQWc2n75zlvFNeKqKo4K7YEPEtKOcic
         jGleKHPHqt4nsoCuDgA/zb/Ot4hBpj2PlRo/BP9411u6tSp1Dbcae4As8ok93PkMR8xo
         iGsVyc69Jz/nRb/udG8eSLNo7or108MGWKx3mxwOho1Ozf4wzzqupvVrpaKd6H1m4xMv
         m5rg1WEKvG8YCXduLvnnNUrpZ68fjhceT/kv4UHnkvU8ml3/S5bOMlPfLTmddQFnAznV
         GJWZb4hdX3NxoRSjf/FWiqb4PwlbN75/5AUNRUYIKPVwvzOFabFW2u1yBi7VucP/stV2
         yZIg==
X-Forwarded-Encrypted: i=1; AFNElJ8WG+n2wwpTgCYgvKXCcjCH6IL8xd2Bkp556rMelvyLfxsmIK3cjp92vFmXndzbLR1VfgPs+A65Dvs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUI1uLq1hAEWyAHWxuml83E9Gbi7pqf7AIaG+uFsnt75xuJbmc
	qOcdowPA+QWgiQmlGTzLwr3byTfGTzu2iIWIXAdhWtgOL/STDRYe4Q51ui0ewuCPe22qe3lrvlZ
	0odPExg==
X-Received: from plpp10.prod.google.com ([2002:a17:902:c70a:b0:2bd:56ce:d8ea])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc85:b0:2bc:ac76:c1d0
 with SMTP id d9443c01a7336-2bf20de3033mr36747075ad.17.1780067312791; Fri, 29
 May 2026 08:08:32 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:30 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150830.715007-1-seanjc@google.com>
Subject: [PATCH v4 45/47] x86/kvmclock: Use TSC for sched_clock if it's
 constant and non-stop
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
X-purgate-ID: tlsNG-720697/1780067315-A937C161-BD326D31/13/0
X-purgate-type: clean
X-purgate-size: 2230
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
X-Rspamd-Queue-Id: 49FAD6045B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Prefer the TSC over kvmclock for sched_clock if the TSC is constant,
nonstop, and not marked unstable via command line.  I.e. use the same
criteria as tweaking the clocksource rating so that TSC is preferred over
kvmclock.  Per the below comment from native_sched_clock(), sched_clock
is more tolerant of slop than clocksource; using TSC for clocksource but
not sched_clock makes little to no sense, especially now that KVM CoCo
guests with a trusted TSC use TSC, not kvmclock.

        /*
         * Fall back to jiffies if there's no TSC available:
         * ( But note that we still use it if the TSC is marked
         *   unstable. We do this because unlike Time Of Day,
         *   the scheduler clock tolerates small errors and it's
         *   very important for it to be as fast as the platform
         *   can achieve it. )
         */

The only advantage of using kvmclock is that doing so allows for early
and common detection of PVCLOCK_GUEST_STOPPED, but that code has been
broken for over two years with nary a complaint, i.e. it can't be
_that_ valuable.  And as above, certain types of KVM guests are losing
the functionality regardless, i.e. acknowledging PVCLOCK_GUEST_STOPPED
needs to be decoupled from sched_clock() no matter what.

Link: https://lore.kernel.org/all/Z4hDK27OV7wK572A@google.com
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 1336c24f59cf..cd65ad328637 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -374,7 +374,6 @@ void __init kvmclock_init(bool prefer_tsc)
 			 PVCLOCK_TSC_STABLE_BIT;
 	}
 
-	kvm_sched_clock_init(stable);
 
 	if (!x86_init.hyper.get_tsc_khz)
 		x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
@@ -394,6 +393,8 @@ void __init kvmclock_init(bool prefer_tsc)
 	 */
 	if (prefer_tsc)
 		kvm_clock.rating = 299;
+	else
+		kvm_sched_clock_init(stable);
 
 	clocksource_register_hz(&kvm_clock, NSEC_PER_SEC);
 	pv_info.name = "KVM";
-- 
2.54.0.823.g6e5bcc1fc9-goog


