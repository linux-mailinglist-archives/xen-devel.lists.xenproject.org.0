Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMhmF4qmGWptyAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162CA603D62
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322218.1588547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySW-00059u-Am; Fri, 29 May 2026 14:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322218.1588547; Fri, 29 May 2026 14:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySW-00055S-1f; Fri, 29 May 2026 14:45:12 +0000
Received: by outflank-mailman (input) for mailman id 1322218;
 Fri, 29 May 2026 14:45:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3cqYZagYKCX0tfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@flex--seanjc.bounces.google.com>)
 id 1wSyST-0004e7-Um
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:45:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyST-004cke-AC
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:45:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3cqYZagYKCX0tfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@flex--seanjc.bounces.google.com>)
 id 6a19a66d-e002-0a2a0a5209dd-0a2a4503e0ca-36
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:09 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3cqYZagYKCX0tfbokdhpphmf.dpnyfo-efwfmmjtut.yfoqspkfdu.psh@flex--seanjc.bounces.google.com>)
 id 6a19a673-672d-0a2a45030019-d155d6c9e419-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:08 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2ba718173d1so106710825ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:08 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780065907; x=1780670707; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gZ7qyLV4Qg2/G7AZdfT7QLEMZtHiHfovzBdDbSmwy9M=;
        b=pJ36dnr+yV5ViiYVHOialiY0hSB6KS+OdtCdrEacSyXHjzK+/Vz4SkQ77bPqHhVTNq
         FQRiG4Y23k5uSSZCWQrmLZZ1bNKL92P8FJ3Mh+e6SRWzGquvUhblxSAlhZf/OeZqg4sQ
         93vaCQBpkwVSln/RVOoNjrJUV8zhhZB8LyTnYmfOuBnnC3sJbAD6rWZSOmB1tR6Pie5z
         Juth9AApnqslgcxkQmfUxL1AxBq/MHkD7OTVd7RjyimbvJQJkH9+XTGNXJlA7EgfilxH
         8OXT8+xTfnp2+sczDrgfEBoEA/NtjOZg32Qlo7BbE69v5qqLuLk21kl92MlXwkQYC2P4
         Ln2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065907; x=1780670707;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZ7qyLV4Qg2/G7AZdfT7QLEMZtHiHfovzBdDbSmwy9M=;
        b=aZp+cij/sE7Gk2y7ol70c2du823NiklEXPRcwvpEiLZGE3Iebd5ZfFTxwFojJVgnwI
         auc4JGHfkJP6Z74qh3UNkQtBRd+XYaah2g0azLC+Q9b2OfmhqrNTxnUkc8DAS0vSNn6R
         UeoURey72q5Whgy6zyMzuesi/AQCKpAgFWrvYvIo25515tKIp0nnNrbbTOSckRhMSuxc
         gzWQ95V6mux8a86BnUmsb5dv3OY/bURY/xsoepKs0RTvuSxajJYRz5hOAiwj3Jl1b2hg
         UDth+ECJsjE62HacSFvwMzOoEM/AIK3CDsfDNakLr88I/X746Rep3lcgWQbJt0kxACEv
         IcNw==
X-Forwarded-Encrypted: i=1; AFNElJ9KgYUDOg4UrGybCO3zC/UWa8vcJPw98/+oyMwKl1ru1+vH5gUjLED0OyTCtU94exiOFPSmCAT+NAA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTofmJvfwFMo6L0iF/Ee01StL0v0KM3c78EXcAE/dSNNr5htj2
	4T1j/DvbAXKvDLFTwoQUUUbcK6k+WkVZZYMUJ29kGCDQuEtQrDGPyYQN+s2mxmMve3d9Mih7h1H
	RyH/ebw==
X-Received: from plblk13.prod.google.com ([2002:a17:903:8cd:b0:2bf:1cdf:9e4b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f785:b0:2bf:b17:ae3c
 with SMTP id d9443c01a7336-2bf3684e2c2mr1144355ad.25.1780065906739; Fri, 29
 May 2026 07:45:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:44:00 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-14-seanjc@google.com>
Subject: [PATCH v4 13/47] x86/tsc: Fold native_calibrate_cpu() into recalibrate_cpu_khz()
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
X-purgate-ID: tlsNG-33051d/1780065909-39D7B938-E97B3FC3/0/0
X-purgate-type: clean
X-purgate-size: 1495
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
X-Rspamd-Queue-Id: 162CA603D62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fold the guts of native_calibrate_cpu() into its sole remaining caller,
recalibrate_cpu_khz() to eliminate the extra SMP=n #ifdef, and so that it's
more obvious that directly invoking the early vs. late calibration routines
in determine_cpu_tsc_frequencies() is intentional.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 534462c81c78..3e911f0f7364 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -945,21 +945,6 @@ static unsigned long native_calibrate_cpu_early(void)
 	return fast_calibrate;
 }
 
-#ifndef CONFIG_SMP
-/**
- * native_calibrate_cpu - calibrate the cpu
- */
-static unsigned long native_calibrate_cpu(void)
-{
-	unsigned long tsc_freq = native_calibrate_cpu_early();
-
-	if (!tsc_freq)
-		tsc_freq = native_calibrate_cpu_late();
-
-	return tsc_freq;
-}
-#endif
-
 void recalibrate_cpu_khz(void)
 {
 #ifndef CONFIG_SMP
@@ -968,7 +953,10 @@ void recalibrate_cpu_khz(void)
 	if (!boot_cpu_has(X86_FEATURE_TSC))
 		return;
 
-	cpu_khz = native_calibrate_cpu();
+	cpu_khz = native_calibrate_cpu_early();
+	if (!cpu_khz)
+		cpu_khz = native_calibrate_cpu_late();
+
 	if (!boot_cpu_has(X86_FEATURE_TSC_KNOWN_FREQ))
 		tsc_khz = native_calibrate_tsc();
 	if (tsc_khz == 0)
-- 
2.54.0.823.g6e5bcc1fc9-goog


