Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLIpKx9yB2qa3wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:21:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65423556AC8
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310217.1581150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5e-0001cG-EF; Fri, 15 May 2026 19:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310217.1581150; Fri, 15 May 2026 19:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5d-0001VK-UM; Fri, 15 May 2026 19:20:53 +0000
Received: by outflank-mailman (input) for mailman id 1310217;
 Fri, 15 May 2026 19:20:51 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3EHIHagYKCWkZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 1wNy5b-0000wI-9X
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:20:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy5a-0039ru-Kp
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:20:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3EHIHagYKCWkZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 6a077209-5cb7-0a2a0a5109dd-0a2a450aaabc-24
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:50 +0200
Received: from [209.85.215.201] (helo=mail-pg1-f201.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3EHIHagYKCWkZLHUQJNVVNSL.JVTeLU-KLcLSSPZaZ.eLUWYVQLJa.VYN@flex--seanjc.bounces.google.com>)
 id 6a077211-56b3-0a2a450a0019-d155d7c9e9be-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:50 +0200
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-c709551ec08so187596a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:20:50 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872848; x=1779477648; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=c0VSXuwvwTL0EdvBxlPRCLOC48TzlA2S3UU4EaITdRg=;
        b=NTfevY8y4WDIjPVRsl8tUMYHJboNemqhMsVVjM3paK4D7rkxZA/B0+6qPXxoO9U2BS
         W5xIhg60A2E0hupZfplxN1Eqn5l77TD/Lbalkl+CoxrE7nkKktdJkebmoyZQk9hCgO62
         aUfyRL0TgHnP9Ti61Ed8YYsmJ3wWxtugXE16Iqn2dYnJGJjwZ7/X7w5+yE9K9voIYaXo
         ZPyrZahlgI8hTduqS9VeKELH4cnT2n9wd5CJVhpbeCfRnrsLH/87KBZTI4zomFEQpw+D
         tpAFu0CmIhZVmP6Do23SAjmoqFWyluvWSxeKLw3Hi7BU1s20yTeNq4tZAfO4SYBxCX6L
         0DKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872848; x=1779477648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0VSXuwvwTL0EdvBxlPRCLOC48TzlA2S3UU4EaITdRg=;
        b=hPdO8LA8rL1gFRgAvbQfCgNn7dTHv4/tojBwYP8UnAC8M+1apG96sg58wtF330gNGy
         sCao3/RGByPIQlAiG1HxbabihmQXZRUHQFGplcllt9iOEwK3XjeTSMy4v/36DLvKPJRV
         5p/xydWk4NeFpO1opjAYG0Nd5mcvgCxI0QmBNC9MQ4EazLj+NsNZdtNCWB7CfZAL9sZx
         fl7+/nqIxfNAONJ8JAHCkU+aEqP1nQ+2vNp4ZE9zwYrNbSoVZNM+wTsoLIIwtcMwkO58
         0dAfswI8yRn4yg4eKu1cIUXIJEp1YF8VRh5c5ixu/NaQdLwGKihFE16PT7bOiPdPs0/M
         PN9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+m67F4FARiBorh4cIEIOKL4Cf33wJrQmc5vSawfilhfc6VwA8VZ8wCAX6tR/34wtH2kJmeFfllqh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfNF7vd1i15zarfpiFGomvf+gNm98MR58qbjW49yeI8uryyk9Z
	G7+uzeNnRUQcoZovw6M70Oc8PZFQAd3RZpIlgliniaVQsZgB/zJtdfwKpGWOn4ZYnkni7ysPvJs
	0pd59uA==
X-Received: from pfbff26.prod.google.com ([2002:a05:6a00:2f5a:b0:83e:dfc6:971])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1908:b0:82f:50cd:e586
 with SMTP id d2e1a72fcca58-83f33cb2c40mr5886442b3a.13.1778872848066; Fri, 15
 May 2026 12:20:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:17 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-17-seanjc@google.com>
Subject: [PATCH v3 16/41] x86/vmware: Nullify save/restore hooks when using
 VMware's sched_clock
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
X-purgate-ID: tlsNG-4011c0/1778872850-7C67F8B7-2B5C773B/0/0
X-purgate-type: clean
X-purgate-size: 1195
X-Rspamd-Queue-Id: 65423556AC8
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

Nullify the sched_clock save/restore hooks when using VMware's version of
sched_clock.  This will allow extending paravirt_set_sched_clock() to set
the save/restore hooks, without having to simultaneously change the
behavior of VMware guests.

Note, it's not at all obvious that it's safe/correct for VMware guests to
do nothing on suspend/resume, but that's a pre-existing problem.  Leave it
for a VMware expert to sort out.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/vmware.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index b88d9ca01202..b5cb66ca022b 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -347,8 +347,11 @@ static void __init vmware_paravirt_ops_setup(void)
 
 	vmware_cyc2ns_setup();
 
-	if (vmw_sched_clock)
+	if (vmw_sched_clock) {
 		paravirt_set_sched_clock(vmware_sched_clock);
+		x86_platform.save_sched_clock_state = NULL;
+		x86_platform.restore_sched_clock_state = NULL;
+	}
 
 	if (vmware_is_stealclock_available()) {
 		has_steal_clock = true;
-- 
2.54.0.563.g4f69b47b94-goog


