Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGAcOU5zB2pZ4AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:26:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5E3556C72
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:26:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310447.1581374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyAZ-0007Ah-9J; Fri, 15 May 2026 19:25:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310447.1581374; Fri, 15 May 2026 19:25:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNyAZ-00077T-2u; Fri, 15 May 2026 19:25:59 +0000
Received: by outflank-mailman (input) for mailman id 1310447;
 Fri, 15 May 2026 19:25:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3FnIHagYKCW8fRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 1wNyAX-00070z-MK
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:25:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNyAX-001Io4-2j
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:25:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3FnIHagYKCW8fRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 6a07733e-bab6-0a2a0a5309dd-0a2a450a9760-16
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:25:57 +0200
Received: from [209.85.215.202] (helo=mail-pg1-f202.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3FnIHagYKCW8fRNaWPTbbTYR.PbZkRa-QRiRYYVfgf.kRacebWRPg.beT@flex--seanjc.bounces.google.com>)
 id 6a077217-56b3-0a2a450a0019-d155d7cae871-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:56 +0200
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-c82ba4715b6so177092a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:20:56 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872855; x=1779477655; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=BtD3/8r1rxxPL0bRTCD1R2r93qIzEoWuEeKvRfTm7KE=;
        b=HsDsOJ5TmzzZjymMZsul4uHCQN/rnP6CZBrRU3MFmPwDHLd6cFqaI/7aUEQgYIgMTv
         2nFQ1y8+Z8fhbxSadnw+tcURbNYqztfkxD0asPvyGKXrlM9SJMRcmEzqPMgWP1OhCsnN
         QSe/B9n0kBrdwIypcwPiXsSM/d+dAiusTEK0pxbOJppIOsIzq6cz1t0rzNgh/730QraG
         Mr2DXe2SKF/vV+3fa4412O3jnIYPNVWgkUKqSU5H8kY+02iI6w9u1r4wkyOyVeab9bGs
         odCd+odxfEnsr5l7R87Bc2KyT540Dir9h4boiY4QdfI5ZACCFulKd5ac4xqjij6g7x9L
         vvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872855; x=1779477655;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BtD3/8r1rxxPL0bRTCD1R2r93qIzEoWuEeKvRfTm7KE=;
        b=kRcFjw309qYfw6xRDYdbxagfUfQg9hWBTUl0Jj+45MKjjANtH93K8WUoXT50m9t7Hx
         Y4kIEUg9Vb5Bq4XSYP32L7mEf770Zd1sijzovKCGorPQ5arggqWVQveRlXAkV3oHI7Gt
         EriPdYJbWrtr4nFF9lclFS3b4KXzBq6o0m/wW53wVXzqhLXTU86en+Bskz2tG2hVZnVN
         xRxY1EMWF9E0VZMQ/3YoPaidmABEDYSQxKphOLPYNytmdDB/4VT5x8nyMWGZzB2Kajij
         KPBEny0jjDGSDqxtDbE9coqSI+sKt7pCkdqx82KcyqjI4XmwTtnQnGNXgwGMlhrG2er9
         ZRJA==
X-Forwarded-Encrypted: i=1; AFNElJ/X1RtBjOZCrbWBgxVXfU9GgeHuKkG6IcgVZR3yVdr75dFFiKXuShKQxnnAH/ZoMW1bE3iv/Mr1MNc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXZWtO709kRpExRBpuXYPDXMj+eZ2ZvKIoQpQZbxAUB9tvyNrl
	8dfz1LLIYfvi/TOzqQqNAb7hNmludpJGQrMODI0cKaiGu9vaGvm43RSXmfpplGxebLC4koebERF
	KsW+vRA==
X-Received: from pfbly26.prod.google.com ([2002:a05:6a00:759a:b0:82f:a4cc:2fb3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ac86:b0:82a:805a:7e2
 with SMTP id d2e1a72fcca58-83f33c4ed90mr5838917b3a.9.1778872854522; Fri, 15
 May 2026 12:20:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:23 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-23-seanjc@google.com>
Subject: [PATCH v3 22/41] x86/pvclock: WARN if pvclock's valid_flags are overwritten
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
X-purgate-ID: tlsNG-4011c0/1778872856-7357C8B7-20A91D32/13/0
X-purgate-type: clean
X-purgate-size: 730
X-Rspamd-Queue-Id: DE5E3556C72
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

WARN if the common PV clock valid_flags are overwritten; all PV clocks
expect that they are the one and only PV clock, i.e. don't guard against
another PV clock having modified the flags.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/pvclock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/pvclock.c b/arch/x86/kernel/pvclock.c
index a51adce67f92..8d098841a225 100644
--- a/arch/x86/kernel/pvclock.c
+++ b/arch/x86/kernel/pvclock.c
@@ -21,6 +21,7 @@ static struct pvclock_vsyscall_time_info *pvti_cpu0_va __ro_after_init;
 
 void __init pvclock_set_flags(u8 flags)
 {
+	WARN_ON(valid_flags);
 	valid_flags = flags;
 }
 
-- 
2.54.0.563.g4f69b47b94-goog


