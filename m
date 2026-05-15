Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA7qJSRzB2r03wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:25:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F866556C0B
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310367.1581301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy9s-0002bl-Ut; Fri, 15 May 2026 19:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310367.1581301; Fri, 15 May 2026 19:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy9s-0002YS-Lk; Fri, 15 May 2026 19:25:16 +0000
Received: by outflank-mailman (input) for mailman id 1310367;
 Fri, 15 May 2026 19:25:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3J3IHagYKCYAwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 1wNy9q-00025f-IO
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:25:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy9p-001IcX-Ui
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:25:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3J3IHagYKCYAwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 6a0772ea-2eae-0a2a0a5409dd-0a2a4504d0a2-30
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:25:13 +0200
Received: from [209.85.210.201] (helo=mail-pf1-f201.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3J3IHagYKCYAwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 6a077228-1dec-0a2a45040019-d155d2c9b86d-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:21:13 +0200
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-837d43e9ff3so95386b3a.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:21:13 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872871; x=1779477671; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=HRAsSS8xU7yGk1K8a9fV0Bzp4HNJreTB4TmSZ4FXvc4=;
        b=Km6eOLC1hI9myxPLNAKgpI3idmmwQ96Fu+FqKZYoNRkQVVUDnEbloB0XlqJOYpXLBE
         SkdGQCZ4RJxrn9zFbYCSk6pGD2u174YJLSt4dTjDKfpzXC841GfoNf5O7OVdbsjLZ100
         c20t20sBvoo4LxfnDONWPlttCbLCJU1cZR1iQiKrrjDIAjPAFXRKX6W8HX2Cq64O3SC8
         9zYDZ26AyxjijEZfSyziqzsZFeawI978vC8uW+smUY/TRBRpci67vi5ztIDu3AQsWcTF
         Tr2wWAKtTF8HEFlYPM0HvBphzAhVsNqX5wvyQrh67jGglhzj9kBfd5iv3b/EFIb7smQV
         00Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872871; x=1779477671;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRAsSS8xU7yGk1K8a9fV0Bzp4HNJreTB4TmSZ4FXvc4=;
        b=iETyqKYmN0DN1iFjQ/66FaW16q/qqsR2+8i+Oc/zyXmslV2ka9BYY/T6YA/NQiKSx1
         +IP2Fkc9Wa9bFXkpwFCxTJgR2f2F4yPWELCwHSjTVuioZVffm6Wbb7HbOXlhBGLa4AZp
         qsns26cXNsd6EBvrinRrkpC0W9VeCUedtAyIVMQlZE60d1gjOlK/7IqeyTFV0bKyUNBR
         JZSnYDM3o4aA3V2fAs9Y9l4eUO0Gj3URl9/JRWCtBub8SXVunVut8YSiYwia5orDo6Ay
         arQOlbkQIZTFnA4SdJ0URlUhLpraAIDmfYSu7aHFlULf+jm8Wmov44+7hjyhc649htCW
         MrAg==
X-Forwarded-Encrypted: i=1; AFNElJ+pPXZMLvoC0L+W3WJIsrJEODBC95cxkI5IBx5QmVnQ//CwERpmZBtPuIph0E6NOAaeRWAh+iItq/E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYwpO8dLgxDZT1m8xLU910TtAfjeMmXtBAWJD/Ve64ll9BSo3H
	uQYt9MLJ3VGrRE9DqwXg4ai0NX4U7kRbuuTL37NZ0JgDKokLchYMfUQDjrI9PBAt/BBT+MRugX1
	FaMqeJw==
X-Received: from pfdc5.prod.google.com ([2002:aa7:8c05:0:b0:82f:a75b:f7fa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ab0d:b0:839:e27c:6cce
 with SMTP id d2e1a72fcca58-83f33d97d9amr5480931b3a.37.1778872871152; Fri, 15
 May 2026 12:21:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:33 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-33-seanjc@google.com>
Subject: [PATCH v3 32/41] x86/tsc: Rejects attempts to override TSC
 calibration with lesser routine
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
X-purgate-ID: tlsNG-ebf023/1778872873-43B6B3FF-241EF507/13/0
X-purgate-type: clean
X-purgate-size: 1550
X-Rspamd-Queue-Id: 4F866556C0B
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

When registering a TSC frequency calibration routine, sanity check that
the incoming routine is as robust as the outgoing routine, and reject the
incoming routine if the sanity check fails.

Because native calibration routines only mark the TSC frequency as known
and reliable when they actually run, the effective progression of
capabilities is: None (native) => Known and maybe Reliable (PV) =>
Known and Reliable (CoCo).  Violating that progression for a PV override
is relatively benign, but messing up the progression when CoCo is
involved is more problematic, as it likely means a trusted source of
information (hardware/firmware) is being discarded in favor of a less
trusted source (hypervisor).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 98bef1d06fa9..7a261214fa3e 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1319,8 +1319,13 @@ void tsc_register_calibration_routines(unsigned long (*calibrate_tsc)(void),
 
 	if (properties & TSC_FREQUENCY_KNOWN)
 		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+	else if (WARN_ON(boot_cpu_has(X86_FEATURE_TSC_KNOWN_FREQ)))
+		return;
+
 	if (properties & TSC_RELIABLE)
 		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+	else if (WARN_ON(boot_cpu_has(X86_FEATURE_TSC_RELIABLE)))
+		return;
 
 	x86_platform.calibrate_tsc = calibrate_tsc;
 	if (calibrate_cpu)
-- 
2.54.0.563.g4f69b47b94-goog


