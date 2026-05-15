Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJWDKBxyB2qc3wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:21:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F951556AB2
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:21:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310184.1581054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5K-0006OU-Nk; Fri, 15 May 2026 19:20:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310184.1581054; Fri, 15 May 2026 19:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5K-0006K9-Ho; Fri, 15 May 2026 19:20:34 +0000
Received: by outflank-mailman (input) for mailman id 1310184;
 Fri, 15 May 2026 19:20:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3_HEHagYKCVUF1xA6z3BB381.zB9K1A-01I1885FGF.K1ACEB61zG.BE3@flex--seanjc.bounces.google.com>)
 id 1wNy5J-0006Dh-0E
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:20:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy5I-0039nU-CT
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:20:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3_HEHagYKCVUF1xA6z3BB381.zB9K1A-01I1885FGF.K1ACEB61zG.BE3@flex--seanjc.bounces.google.com>)
 id 6a0771fd-2eae-0a2a0a5409dd-0a2a4502be44-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:32 +0200
Received: from [209.85.210.201] (helo=mail-pf1-f201.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3_HEHagYKCVUF1xA6z3BB381.zB9K1A-01I1885FGF.K1ACEB61zG.BE3@flex--seanjc.bounces.google.com>)
 id 6a0771fd-af86-0a2a45020019-d155d2c9a97b-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:30 +0200
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-8230d6d54a5so1056912b3a.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:20:30 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872829; x=1779477629; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ikDY1x359wvY/+q3wacNdXpEm487YvEWh2udCoEd+NA=;
        b=OZbRHsKSLwHbxyLI5+CWSdjSTBsqE8EudA31+iur5m2mHA9m7kbCMKJDxtOE++2Gyo
         eYE+8lHk/tsDy/59f+DIuJMur4LZF64iF9p7izC8id8yM3MMqoh1ZnsWwx5ssJQWjSpi
         kBpfAUFfp2s5pYdLPFWNeVMmwxHUHHPy/wiaGbbOBYMu7/vFrYwD/KQ+z5+i/OI4jTkV
         EqFDPC5WaBcQYuHvevhhMRiZ6cfjr9ZnGrTeqVK6jJEWMkzE0dAYAas0LdpR9fR7Qcx7
         vuohKhpFKbYsJLUUWM2fqloZc8OdL6CE9sx95S/MDX6C54d/coD1hJ2IDiLEbWWJDBQI
         zI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872829; x=1779477629;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikDY1x359wvY/+q3wacNdXpEm487YvEWh2udCoEd+NA=;
        b=Hs4L9/FZLFqhdccCgX/U8VTLxPm4XI48XP+KaU4nPNTY/8MOZ7eGLbtb+59OpdZiaP
         9F+ERlO2KUSoY+J6sZ7S0CVQz4h+MWRHt/0UV7Yl4oHOr0Kyb4v3c0DcagFEAkEsAFFA
         uMgWgRcK/O8CGUaxGg7y6U4pdtWOvSAvr64/sCwi4uggSc44KXMJKzF9fD1YiB/M1qLK
         2tMW5Ms3d8vZSHE098adoyILIeI/v9VfqOwGwNjrqfJU7FVAZGit3MoNhh6ORQjo0+2u
         mgGc6xFWveIkVje3odZr0P+F1f+xwovzbzCYXfAo3gYlXixSIRFRndyPC0UUFLMLt7MR
         X9vQ==
X-Forwarded-Encrypted: i=1; AFNElJ/v8fklv3MCI598bFORUqa5jb9KyUB8ECtvQPiwBdZDCxabIcp0bCi7pxmiv8stihT3ikf+6jdJs34=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydalLHPiNji+gaSu12owcMwnKoCGOB+Cziwf2f2U5L/dpNBwq6
	GYx+gkxnCzvkelWpfXGn8nf7lXxqxb/oUdZyenw/5Y0Ne0aGz8PlkrefYbNKlOyKz7dls3KTtK9
	zczR0bA==
X-Received: from pfbgg10.prod.google.com ([2002:a05:6a00:630a:b0:83a:d498:99fb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a907:b0:835:447b:a2ac
 with SMTP id d2e1a72fcca58-83f18d5b8f5mr8777489b3a.5.1778872828431; Fri, 15
 May 2026 12:20:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:05 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-5-seanjc@google.com>
Subject: [PATCH v3 04/41] x86/sev: Move check for SNP Secure TSC support to tsc_early_init()
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
X-purgate-ID: tlsNG-720697/1778872831-A9B70161-310994C1/0/0
X-purgate-type: clean
X-purgate-size: 1533
X-Rspamd-Queue-Id: 3F951556AB2
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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

Move the check on having a Secure TSC to the common tsc_early_init() so
that it's obvious that having a Secure TSC is conditional, and to prepare
for adding TDX to the mix (blindly initializing *both* SNP and TDX TSC
logic looks especially weird).

No functional change intended.

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c | 3 ---
 arch/x86/kernel/tsc.c    | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 14ced854cd83..39fb50697542 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2029,9 +2029,6 @@ void __init snp_secure_tsc_init(void)
 	unsigned long tsc_freq_mhz;
 	void *mem;
 
-	if (!cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
-		return;
-
 	mem = early_memremap_encrypted(sev_secrets_pa, PAGE_SIZE);
 	if (!mem) {
 		pr_err("Unable to get TSC_FACTOR: failed to map the SNP secrets page.\n");
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 7e639c0a94a2..243999692aea 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1559,7 +1559,8 @@ void __init tsc_early_init(void)
 	if (is_early_uv_system())
 		return;
 
-	snp_secure_tsc_init();
+	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
+		snp_secure_tsc_init();
 
 	if (!determine_cpu_tsc_frequencies(true))
 		return;
-- 
2.54.0.563.g4f69b47b94-goog


