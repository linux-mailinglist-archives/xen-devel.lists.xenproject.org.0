Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JTrCQKtGWpyyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:13:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7036045D5
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:13:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322531.1588837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSytN-0006re-36; Fri, 29 May 2026 15:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322531.1588837; Fri, 29 May 2026 15:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSytM-0006oU-VO; Fri, 29 May 2026 15:12:56 +0000
Received: by outflank-mailman (input) for mailman id 1322531;
 Fri, 29 May 2026 15:12:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3yKsZagYKCd0RD9MIBFNNFKD.BNLWDM-CDUDKKHRSR.WDMOQNIDBS.NQF@flex--seanjc.bounces.google.com>)
 id 1wSytL-0006hh-NO
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:12:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSytL-00EPc7-44
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:12:55 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3yKsZagYKCd0RD9MIBFNNFKD.BNLWDM-CDUDKKHRSR.WDMOQNIDBS.NQF@flex--seanjc.bounces.google.com>)
 id 6a19ace8-bab6-0a2a0a5309dd-0a2a45029910-30
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:12:55 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3yKsZagYKCd0RD9MIBFNNFKD.BNLWDM-CDUDKKHRSR.WDMOQNIDBS.NQF@flex--seanjc.bounces.google.com>)
 id 6a19abc9-af86-0a2a45020019-d155d6cad51a-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:07:54 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2bf335549b8so2361035ad.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:07:54 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780067273; x=1780672073; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kJfvO9zjLIcNgxwydf05ic8q1+t5yL6F8Cppp5YBjVQ=;
        b=UizcT8LN2SULS0lGSRIt4tEfLto3wy+puzsiGpnr2Iqz1vQTcW3j6WXFULeWw4xlnj
         DhBYjhHunER4ldilBglfakc0oAZTI/IYss2P4YTJkQQR/biFyDEJrRfWDAuyWFqafjJa
         KfJkUiM06gsqyxura79MyTMfOT8Aup3OPLRNbGg8MCE8MroLNfy1TCRWshJ/QnnxjTie
         vKkKMtyxj2gLBFq772KvJkyfLOSYQ0h1pGJuh+Pnqj7Pokh5DxV3VXPxypgUrV1Vr7S5
         QV3UKhaTryQWIgnFnBK7ap7a1CcBWfb9FR697inViSVdyst/sMpGz4FF/+P3HwqPIagE
         Xcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067273; x=1780672073;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJfvO9zjLIcNgxwydf05ic8q1+t5yL6F8Cppp5YBjVQ=;
        b=C/5086fj/akA5gj+ZmO+2XUzWMT1iwrxEKkCntvIqJP7lGwKNYzlNmGI7s0mpvKI/F
         GoLwhPA8AHiITZnjXC8ewejsxhhGrtuo5LFU+LycidqfEqFheVHE3z+YGGRNkuvW913z
         dG8sO8oCuWT0MDbHkLsoKWV3oMW4Wtj6PpxA0LYVEEKWi5AfLAKJzImOjDv7punxBvmY
         INuv7OB12J9cv5ovv8oWJc7CrQFmDsqR2pG5FVqowmpC6OJpuDxnNktCp4RZSZyIZCHq
         mc9PTMjyNgbEMHY5n289WZJWJayCY84cpafmljNzMAvNm+VkZUrk4kdQM6ni0fvoGxpt
         tJiA==
X-Forwarded-Encrypted: i=1; AFNElJ800lyP8HezJ2eX+Gv1sQEqS08avpWLR7rwmJrHKGt8/5u6/plDLLlaXoF8X1PK195KyVkeDHso3/s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUmdHvPaaAeWq83ZYcQnymfMTxBu6NNaTyTV09Z93xv1mKDYw3
	Tp/QyaUbOJlS1JmQgPcfi6gOQB2U3ak8v2DA5QtQZ6fGVdX3w/xgIBXpzYwN6Fyyn5Fo4T63+jw
	/b9TR/g==
X-Received: from pldy13.prod.google.com ([2002:a17:902:cacd:b0:2b2:a70b:98ea])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b64:b0:2bf:305a:312a
 with SMTP id d9443c01a7336-2bf3680a163mr2618575ad.22.1780067272464; Fri, 29
 May 2026 08:07:52 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:07:41 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150741.714145-1-seanjc@google.com>
Subject: [PATCH v4 30/47] x86/xen/time: NOP-ify x86_platform's sched_clock
 save/restore hooks
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
X-purgate-ID: tlsNG-720697/1780067274-A8979161-B7B4A640/13/0
X-purgate-type: clean
X-purgate-size: 1103
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
X-Rspamd-Queue-Id: 9D7036045D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

NOP-ify the x86_platform sched_clock save/restore hooks when setting up
Xen's PV clock to make it somewhat obvious the hooks aren't used when
running as a Xen guest (Xen uses a paravirtualized suspend/resume flow).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/time.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 36d66abf5379..640b71d22d97 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -578,6 +578,12 @@ static void __init xen_init_time_common(void)
 	xen_sched_clock_offset = xen_clocksource_read();
 	static_call_update(pv_steal_clock, xen_steal_clock);
 	paravirt_set_sched_clock(xen_sched_clock);
+	/*
+	 * Xen has paravirtualized suspend/resume and so doesn't use the common
+	 * x86 sched_clock save/restore hooks.
+	 */
+	x86_platform.save_sched_clock_state = x86_init_noop;
+	x86_platform.restore_sched_clock_state = x86_init_noop;
 
 	x86_init.hyper.get_tsc_khz = xen_tsc_khz;
 	x86_platform.get_wallclock = xen_get_wallclock;
-- 
2.54.0.823.g6e5bcc1fc9-goog


