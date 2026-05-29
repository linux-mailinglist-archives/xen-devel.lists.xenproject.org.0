Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLtqJhStGWpEyQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:13:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F7604600
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 17:13:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1322555.1588872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyth-0000BM-A8; Fri, 29 May 2026 15:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1322555.1588872; Fri, 29 May 2026 15:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSyth-00008Y-65; Fri, 29 May 2026 15:13:17 +0000
Received: by outflank-mailman (input) for mailman id 1322555;
 Fri, 29 May 2026 15:13:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <326sZagYKCfAkWSfbUYggYdW.UgepWf-VWnWddaklk.pWfhjgbWUl.gjY@flex--seanjc.bounces.google.com>)
 id 1wSytf-0008WJ-I8
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 15:13:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSyte-00EPhQ-V5
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 17:13:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <326sZagYKCfAkWSfbUYggYdW.UgepWf-VWnWddaklk.pWfhjgbWUl.gjY@flex--seanjc.bounces.google.com>)
 id 6a19acf7-bab6-0a2a0a5309dd-0a2a450588d6-16
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:13:14 +0200
Received: from [209.85.216.73] (helo=mail-pj1-f73.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <326sZagYKCfAkWSfbUYggYdW.UgepWf-VWnWddaklk.pWfhjgbWUl.gjY@flex--seanjc.bounces.google.com>)
 id 6a19abdc-aaa8-0a2a45050019-d155d849b81f-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 17:08:14 +0200
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-367bb9caa54so12862631a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 08:08:13 -0700 (PDT)
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
        d=google.com; s=20251104; t=1780067292; x=1780672092; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0jsX4kmzCmqMaCGwN5oKHLOUS2DjjzJWXK44/xdBtv0=;
        b=Nc6mwJcKKh5bjz5XJLcW/kzxfHsar5wXYOuxkpm+tF6hztOQv0BgzQgigaENNrADTB
         mE5doMNjmZWUjVkM/RSWaAF84oYDrFxjlpLmyPLlww4rsQ/RyBDXjKLbOrn639SA+gMT
         BaELtDfx8CV8b+4UuYUPTyMY5nyGQL/tr1xRvw4FRjYOzO/yyLQbG8arjY3LIlN3Lv/e
         /S839s8LZc70OnM564/DGQSUhWS2MdXHPQBMo8QRVMYhu83ZFEAdnZRhOldcja6ecHXu
         XNr7BdkhhbDwYmm1VzFg8YHkcIZpxxhgvPtvd60whoczQA3cT00STngF1opAjTezMMm6
         ydlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780067292; x=1780672092;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jsX4kmzCmqMaCGwN5oKHLOUS2DjjzJWXK44/xdBtv0=;
        b=Ri3QI+in7SLAt4prTwzMCMSXWutKWb6zr0fIqrO9DStgsGBGP/EHaj1uVcSM++EN87
         luFZV2aLIgY40wI1M+VjerybkGCVxVe+6uQ9hjEm87xNLyNGZfhnz2b06mYNs625kwRP
         b8zTKKKNhINKF670cQIFEyCzpwBl3fYi04yZ8JhDwspycPX8eWwlVxHfhpDde0FLgLEj
         hFsW8kT/87wYTLEh09aBXptIHWlVEcamFYCOYfzvn2eW0P3C5hhSBk/sh1c5m9rgc+/t
         YZUykSnqPbYlBos7JWWx/hnESmPlJmYxkqKCPYsovUZqxZi6g8yYugghHlJ5kvyB6eF0
         ufwA==
X-Forwarded-Encrypted: i=1; AFNElJ/cL4ARq+SPtslVB7cqQstQCMj7WlKZWCdSfBHE+uwZJZCwLxi1RmDdpLeN9e/QJqyvUZeUjKZ5lIA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4/Yh8aTkiEIv29h4wbcCnaTcKKh+loSx8ivNmmEe4YRCkshvl
	773j0CkAco/NoUKticpLWqIkIBhwczeu39u7MKU8AGE3be2VyJzgAOD0bO1AbkDTk9Vn73ySmp2
	1hE2nAg==
X-Received: from pgvi5.prod.google.com ([2002:a65:61a5:0:b0:c82:2dd8:9d49])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6b87:b0:3b3:d4a:793b
 with SMTP id adf61e73a8af0-3b411e5b284mr4378476637.43.1780067291927; Fri, 29
 May 2026 08:08:11 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 29 May 2026 08:08:10 -0700
In-Reply-To: <20260529144435.704127-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260529150810.714572-1-seanjc@google.com>
Subject: [PATCH v4 37/47] x86/pvclock: WARN if pvclock's valid_flags are overwritten
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
X-purgate-ID: tlsNG-c201ff/1780067294-DBF66443-8BD9AEF0/13/0
X-purgate-type: clean
X-purgate-size: 780
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amazon.co.uk:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
X-Rspamd-Queue-Id: 920F7604600
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

WARN if the common PV clock valid_flags are overwritten; all PV clocks
expect that they are the one and only PV clock, i.e. don't guard against
another PV clock having modified the flags.

Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
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
2.54.0.823.g6e5bcc1fc9-goog


