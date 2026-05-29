Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC6CEJCmGWrtyAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A9E603DBF
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 16:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322236.1588607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySm-0008Gd-2i; Fri, 29 May 2026 14:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322236.1588607; Fri, 29 May 2026 14:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSySk-0007zH-VV; Fri, 29 May 2026 14:45:26 +0000
Received: by outflank-mailman (input) for mailman id 1322236;
 Fri, 29 May 2026 14:45:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3fKYZagYKCYc3plyunrzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@flex--seanjc.bounces.google.com>)
 id 1wSySe-0006hx-9T
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:45:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSySd-004cke-LT
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 16:45:19 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3fKYZagYKCYc3plyunrzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@flex--seanjc.bounces.google.com>)
 id 6a19a66f-e002-0a2a0a5209dd-0a2a4502d7a8-44
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:19 +0200
Received: from [209.85.215.202] (helo=mail-pg1-f202.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3fKYZagYKCYc3plyunrzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@flex--seanjc.bounces.google.com>)
 id 6a19a67d-af86-0a2a45020019-d155d7cac48b-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 16:45:19 +0200
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-c8294d8c48eso9079962a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 07:45:18 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780065917; x=1780670717; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YpIj1ucaijezC9S67db1/B7YVcsq/H2nz/z97RNrYsc=;
        b=fDzpz1UOVuiTwjLKxeqhoEH0DbqJ8D18B/HnO6g0z9MWZBuP3pfeKrSVQi+1zmjSva
         k8qs9oDmNJBe2go03pNg5nnfryKgnwdyiUF5a/BxN6Gk5MJIpovShgaJqQj1mBJE7I6m
         /QBlK+RatgPI+rTC3Zgbn5B6P2OblYwoQfAsz5hP9L0mlcua/szLfosgQcSWdP+68V/G
         ILthrePrxT7wzso1G6M+vY44/kZIwJBLGJUugnBxEhKuxGYyq62ZIjT7EYharzvtiqnE
         L2A9hpq/bkYIP8ALWD83bmwiwv1o6WId2RJF9qkTT+yKidAuQpoU3KOZQEdVuj1zhpVV
         WW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065917; x=1780670717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpIj1ucaijezC9S67db1/B7YVcsq/H2nz/z97RNrYsc=;
        b=HV8+/HB/6azQH6tKMtuX5ml3bE6lzmgE2VbhUCWypkBHaSO3/x9xxY4CW8Vpd2GuI0
         IkjJD6774HdUTPzwImwcydi7NPqItYq3pXKGJxYr5WY4eobB51elwj+T/wLFbo0/S3QN
         jB98T7T3fL1LLD+iSq3+873zo4/ZFvbbQj2+dhKHL+0hpC+J4zdymaSTK3T6Cn6tmKMI
         8zzsSgy98W+Fw9+U9MzNluU7ZGuosy1aUKfKB3oStDxdoX5Q+PtZtwAC2fFHjFGD1wvU
         J81hiHD3H9F96AO6+h/1/yPgLcA4hOghnuAMiZfP1oI3nd1raPwa59bJS8QYI5oqul45
         OJlg==
X-Forwarded-Encrypted: i=1; AFNElJ/1uJ0HzEmvkhKBf8W/oZOxlHUHNw4nEGANlTOSlIsZPPT5d9zsXJ3Osr9SP9G0ePH7VvM+dRQguIk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvkmIUEib7Yir91zBLn/fBYMzl7uLnJ2HPhz51dCYIh95WcSGS
	HTlmALJeUYCyxWourz2hZW6EPWKOMfNxYPu9BWhdRTNvm9Gdv6lNIqVLI9x9t2YZGx6e/5/2IZx
	tl72DpQ==
X-Received: from pgnm19.prod.google.com ([2002:a63:7d53:0:b0:c79:1600:6a09])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:244f:b0:3a0:67d:bba9
 with SMTP id adf61e73a8af0-3b4120a47c0mr3641480637.45.1780065916828; Fri, 29
 May 2026 07:45:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 07:44:08 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529144435.704127-22-seanjc@google.com>
Subject: [PATCH v4 21/47] x86/xen: Obtain TSC frequency from CPUID if present
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
X-purgate-ID: tlsNG-720697/1780065919-83563161-8B56DD70/0/0
X-purgate-type: clean
X-purgate-size: 1314
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
X-Rspamd-Queue-Id: E6A9E603DBF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Woodhouse <dwmw@amazon.co.uk>

The Xen CPUID leaf 3, sub-leaf 0, ECX provides the guest TSC frequency
in kHz directly. Use it when available instead of reverse-calculating
the frequency from the pvclock tsc_to_system_mul and tsc_shift values,
which loses precision.

This mirrors the equivalent change for KVM guests using the generic
0x40000010 timing leaf.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
[sean: drop non-Xen changes]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/time.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 487ad838c441..36d66abf5379 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -42,6 +42,17 @@ static unsigned int __init xen_tsc_khz(void)
 {
 	struct pvclock_vcpu_time_info *info =
 		&HYPERVISOR_shared_info->vcpu_info[0].time;
+	u32 base = xen_cpuid_base();
+	u32 eax, ebx, ecx, edx;
+
+	/*
+	 * If Xen provides the guest TSC frequency directly in CPUID
+	 * (leaf 3, sub-leaf 0, ECX), use that instead of reverse-
+	 * calculating from the pvclock mul/shift.
+	 */
+	cpuid_count(base + 3, 0, &eax, &ebx, &ecx, &edx);
+	if (ecx)
+		return ecx;
 
 	return pvclock_tsc_khz(info);
 }
-- 
2.54.0.823.g6e5bcc1fc9-goog


