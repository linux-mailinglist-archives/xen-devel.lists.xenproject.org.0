Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNBpC4qmGWptyAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A7C603D54
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322215.1588538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySU-0004q6-VD; Fri, 29 May 2026 14:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322215.1588538; Fri, 29 May 2026 14:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySU-0004nL-IT; Fri, 29 May 2026 14:45:10 +0000
Received: by outflank-mailman (input) for mailman id 1322215;
 Fri, 29 May 2026 14:45:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3caYZagYKCXwxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 1wSySS-0004Mz-Gd
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:45:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSySR-000xsX-TU
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:45:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3caYZagYKCXwxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 6a19a66f-bab6-0a2a0a5309dd-0a2a4506bce2-20
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:07 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3caYZagYKCXwxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@flex--seanjc.bounces.google.com>)
 id 6a19a672-7371-0a2a45060019-d155d6c9a535-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:07 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2bf11699875so19123545ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:07 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780065906; x=1780670706; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Ep5voyn6wy8bCsLD4fpqMEGPbCHcjvgsIyxbB5uxkeU=;
        b=R9dv5ikHetQ3QKTEFDaBzSvmZkOjV4Q8SlvmlrBEhHTGuRRBGaNPgFSY6oheDAxx4i
         LpiEDanQYR4sAL+Ub0icU8VYtwsPtpDxnldDr2G2HHc0uKaBJmcOR2y6eS8ONerSC7Sc
         NWgl8rSW6nayGrmN328OMIDJxXOhTptRPapPOlwTcqYbwsxAVPLElb947zh0ntJDdEam
         ciGUHLZG1xgXQeRH25nReBIJUHBusMNrMRAPwicBwWC04/zTE0OpXV78N3ppdKI28/v+
         xkE1zRroql060EM/WiNbXG+JFYPj9llv6UrBRguanpFp7BPvesYEa/znLufQsASYJlSN
         chfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065906; x=1780670706;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ep5voyn6wy8bCsLD4fpqMEGPbCHcjvgsIyxbB5uxkeU=;
        b=ofCNPdpSQExpITcMwghlKAIMS2PvewVYdXsGIp7hIaVe9nz/JgzwbcTlLbmu7bHRe0
         c7qz57JleOy5lw8X11fd2rZo0xPLeBpAEwtsGL/+6k8XRSooTNlpK2FY5hpUgEFPeoYV
         1iyabKUxBrk2FVXKLSoaf648+PK2cnpJCcmX1CLzUAYOwIgZFEul8INi6J5fi7YN+Di/
         wlrwTx0a8Lf7iGw+c+hYA/VKwPWPjhazsfwi8GVSXLX1oJSTYEdqkIi96CNVtALV8och
         N9jPn7kPruJ50YdHq4DLN2KJyL7UAO4pcFIJSGghRvn4J+9HFSIhkXH8o/ww0OM7aFwf
         M2qA==
X-Forwarded-Encrypted: i=1; AFNElJ8ET14sDqZeBC/64Uu9su+7AK/Q0WNBGuzTZel5Jrv+afV9pQCNq+i7AeXvsJ3lWnFee5fTTIohY6A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIsmrscWifbNzUCTpood8IV+UrpI1F0WfLG8JO/iA5JkXXuwQy
	ryPnnzjBrivYIeP0mZc6Dy+axRFMXryqUrRPI8stZ03DxiKV09OkEHCrUf1w5Y7TNbBVtV0DR/d
	/LsQQuw==
X-Received: from plbv2.prod.google.com ([2002:a17:903:44c2:b0:2bf:2808:7225])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:144b:b0:2bc:dca9:f0ed
 with SMTP id d9443c01a7336-2bf20dbeeb3mr34014545ad.15.1780065905419; Fri, 29
 May 2026 07:45:05 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:43:59 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-13-seanjc@google.com>
Subject: [PATCH v4 12/47] x86/tsc: Rename pit_hpet_ptimer_calibrate_cpu() => native_calibrate_cpu_late()
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
X-purgate-ID: tlsNG-16d1c6/1780065907-86F73D75-E51F5F0C/0/0
X-purgate-type: clean
X-purgate-size: 1430
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
X-Rspamd-Queue-Id: D6A7C603D54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rename the late CPU calibration routine so that its relationship to the
early routine is more obvious and intuitive.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 5b4b6e43c94c..534462c81c78 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -779,7 +779,7 @@ static unsigned long cpu_khz_from_cpuid(void)
  * calibrate cpu using pit, hpet, and ptimer methods. They are available
  * later in boot after acpi is initialized.
  */
-static unsigned long pit_hpet_ptimer_calibrate_cpu(void)
+static unsigned long native_calibrate_cpu_late(void)
 {
 	u64 tsc1, tsc2, delta, ref1, ref2;
 	unsigned long tsc_pit_min = ULONG_MAX, tsc_ref_min = ULONG_MAX;
@@ -954,7 +954,7 @@ static unsigned long native_calibrate_cpu(void)
 	unsigned long tsc_freq = native_calibrate_cpu_early();
 
 	if (!tsc_freq)
-		tsc_freq = pit_hpet_ptimer_calibrate_cpu();
+		tsc_freq = native_calibrate_cpu_late();
 
 	return tsc_freq;
 }
@@ -1497,7 +1497,7 @@ static bool __init determine_cpu_tsc_frequencies(bool early,
 		else
 			tsc_khz = native_calibrate_tsc();
 	} else {
-		cpu_khz = pit_hpet_ptimer_calibrate_cpu();
+		cpu_khz = native_calibrate_cpu_late();
 	}
 
 	/*
-- 
2.54.0.823.g6e5bcc1fc9-goog


