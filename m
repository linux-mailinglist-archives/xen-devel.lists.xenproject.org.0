Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EiqwLGVrRWqo/goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:32:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E806F0E08
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:32:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=Vu7hJsLU;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=google.com
Received: from list by lists.xenproject.org with outflank-mailman.1350367.1607847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fk-00006Y-Rl; Wed, 01 Jul 2026 19:32:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350367.1607847; Wed, 01 Jul 2026 19:32:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fk-0008Vs-MZ; Wed, 01 Jul 2026 19:32:36 +0000
Received: by outflank-mailman (input) for mailman id 1350367;
 Wed, 01 Jul 2026 19:32:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3T2tFagYKCZQG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 1wf0fi-0008Qn-Jj
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0fi-004o0g-0k
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:34 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3T2tFagYKCZQG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 6a456b30-2eae-0a2a0a5409dd-0a2a4503b1b4-28
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:34 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3T2tFagYKCZQG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 6a456b50-ec1a-0a2a45030019-d155d2caa8c0-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:33 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-8478e603285so1932638b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:33 -0700 (PDT)
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
        d=google.com; s=20251104; t=1782934352; x=1783539152; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=s/QSbcUaf8Mr1OX5FYkbnza8ilhhfuHPZoXwnM4X05U=;
        b=Vu7hJsLUEeYgH9PkViNQa5T4fMdukUhG9CkXMzhozwgwQPGZsGUrs07H4nnKkHcy82
         cfrd6TO/1M9j1+36W8ACqO6SsM4id9SmQnb5zESEPNDQaMjKqe3V8yww1vVva8+jc2y2
         1b7mksdfCcWHu4+kSNIzCe2TXb9yniEbfgL6C3Mq7gT8d9dcSiaGLqYCYYbbr0w10OdU
         PreOoqHxI9Uux959TBO8MeA4sI3sj6EG+n/BYhimwYZ7/NEtmmI0PRMk2FayybAyFYrA
         aiWARAhQ0t7oZSh4QKptv/T12oQEKUX/FsjJ5h8Rh+z4ruzE7zbhWtc5xSMFbX+vHgly
         7z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934352; x=1783539152;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/QSbcUaf8Mr1OX5FYkbnza8ilhhfuHPZoXwnM4X05U=;
        b=bzMtHaFNoIy5thsL3yi8dxljExlfzF9B+Fv228qMP+SNNv30jR03cW+RheYvkQbikQ
         9BmH5JsvtssYA457At3wPniSKrNAVjRgCULfGz2zENVnWGRvS0046LAZ4rshWD8U5hVc
         vgPazRzeYouBomZHCGSxvT/weOxkoWX8Dt7137zLB/1M6cCadWaaadtnGjOFCnecOEhs
         QzPCetS+WZGdi2m1IWFzcga5JGli+4ybHh6K8D81ige/uU87/U9grhL5dVFq8RMOXCay
         djNstwAJo1reOCRifa/OkX6cFv9dUkA9BDQ9yEBREjDAOFlnoCI66pVv5NyPnQPtEARN
         9sFA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2Ad7W+rHkajwkWikFdLRfAa1MlwggctIE6f6BG+pF7RyPpAqblHDjLzuP4NUuGA6uSCQyqZ1pdCA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWlh6Sv0Y3uE1wisMamqpBvXFlpJ2FZcETAY/lUvT+x3M24zkl
	Uojq+fDWjxhL0+Yq9p/AX4klboIUnoX5RSTgu8UXiVUrIDCTw9SNLABBzqJXmWDNq0KTbvanBhl
	kN/78PQ==
X-Received: from pfbhc3.prod.google.com ([2002:a05:6a00:6503:b0:846:aff8:5614])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e10:b0:842:499d:450e
 with SMTP id d2e1a72fcca58-847a82d978dmr5886277b3a.20.1782934351240; Wed, 01
 Jul 2026 12:32:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:25 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-5-seanjc@google.com>
Subject: [PATCH v5 04/51] x86/tsc: Restrict recalibrate_cpu_khz() export to
 p4-clockmod and powernow-k7
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
X-purgate-ID: tlsNG-33051d/1782934353-B4D805D1-24BC8097/0/0
X-purgate-type: clean
X-purgate-size: 837
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 43E806F0E08

Export recalibrate_cpu_khz() only for its two users, p4-clockmod.ko and
powernow-k7.ko, to help document that recalibration is relevant only to
ancient CPUs.

For all intents and purposes, no functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/tsc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 4393902c0ddd..482cc3a8999a 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -943,7 +943,7 @@ void recalibrate_cpu_khz(void)
 						    cpu_khz_old, cpu_khz);
 #endif
 }
-EXPORT_SYMBOL_GPL(recalibrate_cpu_khz);
+EXPORT_SYMBOL_FOR_MODULES(recalibrate_cpu_khz, "p4-clockmod,powernow-k7");
 
 
 static unsigned long long cyc2ns_suspend;
-- 
2.55.0.rc0.799.gd6f94ed593-goog


