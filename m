Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGTiOIymGWrtyAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D069603D8D
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322223.1588563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySZ-0005nN-RJ; Fri, 29 May 2026 14:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322223.1588563; Fri, 29 May 2026 14:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySZ-0005dU-8E; Fri, 29 May 2026 14:45:15 +0000
Received: by outflank-mailman (input) for mailman id 1322223;
 Fri, 29 May 2026 14:45:13 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3dKYZagYKCX8vhdqmfjrrjoh.frp0hq-ghyhoolvwv.0hqsurmhfw.ruj@flex--seanjc.bounces.google.com>)
 id 1wSySW-0005M9-Vv
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:45:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSySW-00BR7N-CV
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:45:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3dKYZagYKCX8vhdqmfjrrjoh.frp0hq-ghyhoolvwv.0hqsurmhfw.ruj@flex--seanjc.bounces.google.com>)
 id 6a19a677-5cb7-0a2a0a5109dd-0a2a4503ba56-2
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:12 +0200
Received: from [209.85.216.73] (helo=mail-pj1-f73.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3dKYZagYKCX8vhdqmfjrrjoh.frp0hq-ghyhoolvwv.0hqsurmhfw.ruj@flex--seanjc.bounces.google.com>)
 id 6a19a676-672d-0a2a45030019-d155d849bdac-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:11 +0200
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-368b68a33adso19435850a91.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:11 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780065910; x=1780670710; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=dFi7v06+6W1FLZftWdDZ5nEL1MuL8W1WaU9VoOY7VWI=;
        b=KPMOzrmDnTfinTfoUnw+erj/bhDgg0+m5+TOXJHHsccsTnp75NZORkdvQ8DwjKajOQ
         CMogFWKefBpOlxtXOpDg3val6UjNe4EWcWTBRXqAcnDTzMwBN/3C3uIQYWsqpZbgUfMn
         R/UGwkbcG4eqsoFGz3URwDFebXqB6OcPWIcetFe9wENhKmEkyWdW8bVBGJPMdzHc5oIn
         8tBt0q08wzmc3X35+J20P9VMVOnK0p7Qnsf475jYT61AxkFqQ6Nife53GruRIPPLGYfI
         nsJmkc/h5rHFiSpzSg7GqXQKooYCcclA91b7bG4grhyQJqNAX3/L2Zyguh7STzVFXHsO
         UQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065910; x=1780670710;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFi7v06+6W1FLZftWdDZ5nEL1MuL8W1WaU9VoOY7VWI=;
        b=bM2Ux0P+Z6S4Kwy3WpxS1aQOgVhsdtT8uoG/ajupSizC8Jnmb6pntrqLrkSsHM5UeC
         BnKbrxLYkJDEueYrVOKR/5UrTGjdn+DMER5NlT+Ojbs5JWAUKwL043m9Z3npafhPWt/5
         8B4sCRBg3QCj5zGI5hsA3BG/xn7L2GWDEKZ0DrTv8k0K+0WbHMXoQ4glaoj9e9FE0q7k
         CHA+okZB0juDAUltZ465Njk5O6+1heOcz5aGIIvwj+MjxbaEswDWaUt0/QSYx2eG+3cj
         hcY9/n1ninVdlbcmshecP7MUfFJRhkzsmFDnF4aGjlO9IY1yfrvR4mcNwpCm/jueWgHF
         TjqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DGp1ReoQUzfyp2mKmkf0U7hvKiKniZinWcyDKDFk/ku1yHpVp+tELHmvxd386ybGerPChct6rQO0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTAvX2h8XRwp4lfbqaQibHcCuKXa4emWDv36Fqm9oyZyerHpph
	I19fPLDsa6K0YwAbU2xmxjpcM+AlFmInHtxXIm+1wnR1/AZWaQMMuL9OpUFswmf6nltjUUliAF2
	51EqADQ==
X-Received: from pjwy3.prod.google.com ([2002:a17:90a:d0c3:b0:369:1a1a:82d5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:518e:b0:35f:b6a1:8d27
 with SMTP id 98e67ed59e1d1-36bbcd92760mr4080563a91.18.1780065908349; Fri, 29
 May 2026 07:45:08 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:44:01 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-15-seanjc@google.com>
Subject: [PATCH v4 14/47] x86/kvmclock: Rename kvm_get_tsc_khz() to kvmclock_get_tsc_khz()
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
X-purgate-ID: tlsNG-33051d/1780065912-39171938-6E0A3D6E/0/0
X-purgate-type: clean
X-purgate-size: 1630
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 9D069603D8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename kvm_get_tsc_khz() to kvmclock_get_tsc_khz() in anticipation of
adding support for getting TSC info from PV CPUID, i.e. in a KVM specific
way, but without non-kvmclock.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 69752b170e0a..c4a782a0c903 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -115,7 +115,7 @@ static inline void kvm_sched_clock_init(bool stable)
  * poll of guests can be running and trouble each other. So we preset
  * lpj here
  */
-static unsigned int __init kvm_get_tsc_khz(void)
+static unsigned int __init kvmclock_get_tsc_khz(void)
 {
 	return pvclock_tsc_khz(this_cpu_pvti());
 }
@@ -125,7 +125,7 @@ static void __init kvm_get_preset_lpj(void)
 	unsigned long khz;
 	u64 lpj;
 
-	khz = kvm_get_tsc_khz();
+	khz = kvmclock_get_tsc_khz();
 
 	lpj = ((u64)khz * 1000);
 	do_div(lpj, HZ);
@@ -320,8 +320,8 @@ void __init kvmclock_init(void)
 	flags = pvclock_read_flags(&hv_clock_boot[0].pvti);
 	kvm_sched_clock_init(flags & PVCLOCK_TSC_STABLE_BIT);
 
-	x86_init.hyper.get_tsc_khz = kvm_get_tsc_khz;
-	x86_init.hyper.get_cpu_khz = kvm_get_tsc_khz;
+	x86_init.hyper.get_tsc_khz = kvmclock_get_tsc_khz;
+	x86_init.hyper.get_cpu_khz = kvmclock_get_tsc_khz;
 	x86_platform.get_wallclock = kvm_get_wallclock;
 	x86_platform.set_wallclock = kvm_set_wallclock;
 #ifdef CONFIG_X86_LOCAL_APIC
-- 
2.54.0.823.g6e5bcc1fc9-goog


