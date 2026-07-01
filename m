Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IO8YGGZrRWqw/goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:32:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2B6F0E14
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:32:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=fKuzCDIm;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=google.com
Received: from list by lists.xenproject.org with outflank-mailman.1350372.1607872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fo-0000qh-4a; Wed, 01 Jul 2026 19:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350372.1607872; Wed, 01 Jul 2026 19:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fo-0000kc-02; Wed, 01 Jul 2026 19:32:40 +0000
Received: by outflank-mailman (input) for mailman id 1350372;
 Wed, 01 Jul 2026 19:32:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3UmtFagYKCZcJ51EA37FF7C5.3FDO5E-45M5CC9JKJ.O5EGIFA53K.FI7@flex--seanjc.bounces.google.com>)
 id 1wf0fm-0000Ks-1X
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0fl-00B3ua-Eq
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:37 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3UmtFagYKCZcJ51EA37FF7C5.3FDO5E-45M5CC9JKJ.O5EGIFA53K.FI7@flex--seanjc.bounces.google.com>)
 id 6a456b3e-5cb7-0a2a0a5109dd-0a2a4506aae4-24
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:37 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3UmtFagYKCZcJ51EA37FF7C5.3FDO5E-45M5CC9JKJ.O5EGIFA53K.FI7@flex--seanjc.bounces.google.com>)
 id 6a456b53-08de-0a2a45060019-d155d7c9e100-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:37 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c96b4f58ddcso763901a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:36 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934355; x=1783539155; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IPCn9toL5FYXOHslttK0Lqj/45O4+f3kFotppLV6+ls=;
        b=fKuzCDImPpzNTZoIiyIzudIzmp7PizB2cS8gFCEMti89zInSppOOer90Uaa3SlUzVV
         TRIthsiBEGLm12JGRsIU9nJIW/LfY56kg8MBtOURzSTW90lUkv0Ejcz3ChZsMTSWH6pR
         JI1T+Q4oj/LzZjRh3aW8eh9WXQjYd4OLyeIbB3iVSmA8y3M6Qllwy7WbNhdRlAJt+B94
         P6EQnNVIY550MiHy9Vmd91gMFBh4xiUrCyObX19Lmdqa6KhAPrgX8rdT4esUZT93Y6L6
         VlOK249Sz/OMf0Xa/RmEbO40q9YBKSMnvgCd1+PzUTf3B7vCJtucCwW5Q7kZQUEl/0Fi
         wNbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934355; x=1783539155;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPCn9toL5FYXOHslttK0Lqj/45O4+f3kFotppLV6+ls=;
        b=SOBTWvg56CoQgyRzIhniFsTz4keq1x2/LYn9EvdXsT5IgY5bTnjaWxltYHMovEykAA
         4Dufgv+iYDR/s7ClK3bUndhlw/XwDUfpyCCFTuBwkv8G2cJP0LhuxlWkvQTtCKhe2Lc3
         Fv0aYsM1eQWIKcRDi4VZUuZGBwhhIBKnqEFU68Ox6MjRh+5oN9ybox0KnIZ9n1qQF8Kf
         Ea8QDh3vWRGp93HM+YkNXqJSeBfYhO8v46Z65lFrcdbVq9Tl9OGPWNPDbSj7vwsUWHl0
         imEwysStr+z9mSMWhsxLOuBNEkHyJ7nmKUqEdAkDz4QZTkfRBn6+nexFZwDT/ij7MBmZ
         pmUw==
X-Forwarded-Encrypted: i=1; AFNElJ+heBJCj2AD8Rb7gJ+D+Abu1qjQvyjNrHuV2KKPYMrujOlHU9XrVt6vezUchnyce6veMhhXjFUxMMo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVijIU1K4KX+vsX4ayrCN8pb2PkGZTVj4Ej82V2uhMl6akEI9T
	+5Julx7rKgGTlIVu6l4w/18hlutYBnRqCx8JOMmNSNyNhvanJlzTMcmVs6XZeT5/ZHG9lP6OsuD
	XvYvaIg==
X-Received: from pgll126.prod.google.com ([2002:a63:2584:0:b0:c85:1159:ffb2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6705:b0:3bf:7bf7:7913
 with SMTP id adf61e73a8af0-3bff40c93d7mr2592804637.14.1782934354816; Wed, 01
 Jul 2026 12:32:34 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:28 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-8-seanjc@google.com>
Subject: [PATCH v5 07/51] x86/sev: Move check for SNP Secure TSC support to tsc_early_init()
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-16d1c6/1782934357-C5D3D68D-E6CE8521/0/0
X-purgate-type: clean
X-purgate-size: 1587
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zytor.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,amazon.co.uk,infradead.org,outlook.com,linutronix.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:mhklinux@outlook.com
 ,m:tglx@linutronix.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amazon.co.uk:email];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EC2B6F0E14

Move the check on having a Secure TSC to the common tsc_early_init() so
that it's obvious that having a Secure TSC is conditional, and to prepare
for adding TDX to the mix (blindly initializing *both* SNP and TDX TSC
logic looks especially weird).

No functional change intended.

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Nikunj A Dadhania <nikunj@amd.com>
Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/sev/core.c | 3 ---
 arch/x86/kernel/tsc.c    | 3 ++-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 665de1aea0ee..403dcea86452 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -2025,9 +2025,6 @@ void __init snp_secure_tsc_init(void)
 	unsigned long tsc_freq_mhz;
 	void *mem;
 
-	if (!cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
-		return;
-
 	mem = early_memremap_encrypted(sev_secrets_pa, PAGE_SIZE);
 	if (!mem) {
 		pr_err("Unable to get TSC_FACTOR: failed to map the SNP secrets page.\n");
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 482cc3a8999a..8f1604ffe986 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1509,7 +1509,8 @@ void __init tsc_early_init(void)
 	if (is_early_uv_system())
 		return;
 
-	snp_secure_tsc_init();
+	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
+		snp_secure_tsc_init();
 
 	if (!determine_cpu_tsc_frequencies(true))
 		return;
-- 
2.55.0.rc0.799.gd6f94ed593-goog


