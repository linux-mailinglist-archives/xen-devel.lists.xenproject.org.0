Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yInbIhtyB2pX3wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:20:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0727A556A6C
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 21:20:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1310185.1581068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5M-0006nT-2C; Fri, 15 May 2026 19:20:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1310185.1581068; Fri, 15 May 2026 19:20:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNy5L-0006hv-TG; Fri, 15 May 2026 19:20:35 +0000
Received: by outflank-mailman (input) for mailman id 1310185;
 Fri, 15 May 2026 19:20:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3_nEHagYKCVcH3zC815DD5A3.1DBM3C-23K3AA7HIH.M3CEGD831I.DG5@flex--seanjc.bounces.google.com>)
 id 1wNy5J-0006Ho-QS
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 19:20:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNy5J-0039nU-6j
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 21:20:33 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3_nEHagYKCVcH3zC815DD5A3.1DBM3C-23K3AA7HIH.M3CEGD831I.DG5@flex--seanjc.bounces.google.com>)
 id 6a0771db-2eae-0a2a0a5409dd-0a2a450ca7e8-30
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:33 +0200
Received: from [209.85.216.74] (helo=mail-pj1-f74.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3_nEHagYKCVcH3zC815DD5A3.1DBM3C-23K3AA7HIH.M3CEGD831I.DG5@flex--seanjc.bounces.google.com>)
 id 6a0771ff-62f1-0a2a450c0019-d155d84ac4cc-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 21:20:33 +0200
Received: by mail-pj1-f74.google.com with SMTP id
 98e67ed59e1d1-365fd467cf6so93321a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 12:20:32 -0700 (PDT)
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
        d=google.com; s=20251104; t=1778872831; x=1779477631; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SQlmIR1hnrcjkd+R45vwU7fSi2OSjNiqFudElplFZs0=;
        b=Jq5aRqC1RASd+v9Vg1MdsRuHa+Mb7zO6K2HuLPV1LET1bNMZpZteQ8SzgyvPd27Qut
         uJctIIceAPdKcaGr2FWsxGO6UlokUX6S1IC4hwxSBeqSAR9+f8kWnnnAjCgfRRGgy0ej
         5ME+8wcwBzca3Pcu6wIRbESecT//uKKj0clH7X9NhZrrn7Vel73v+fxt7C0Jq01mTlR3
         7gDqH85F4y7UhPyX7wMY+jp2FfSiNlEhQbNm0kGa8GZOVIZ4jC9PDIdmFcNXw2M0qpJS
         IYbmVO37DHaXAlqsU/1lSXnoiYDna0jW0IdqZ7ogoWqUjdtZuyrU9+QDqBy7vIdDnpFM
         QPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872831; x=1779477631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SQlmIR1hnrcjkd+R45vwU7fSi2OSjNiqFudElplFZs0=;
        b=DzFLaIIBi2Rrtjh6ikoOHX0XFzVZVGqAVqL6SKIpB54HJzv/Q7NXQkF/FRUHYvXF86
         c5iVsiW++1CZRbHo47YUQufHVWE35jB7v5ASAqh3q3ceHVJ4Ke8LI+SgLpU40TfyUwOy
         7mJ2GZ8wUe3utFEvLpbnRESwuPncmqmTRa4PjSXMTff7ljglZnxKa4kHSMVhYszDKTTz
         VYi3AK0K8jots5hMfiCcOV2Rr3sFoLWaNNO7U6FJuvzD/BQS+ksGb0gFbftg6/jNGBoK
         6SXf8wlXRVYKuvFSn7g+QhDu8eWhcM56dL8lWLyCKqPm37mj41WYIWa7KQFuXMUVKjrh
         BpBA==
X-Forwarded-Encrypted: i=1; AFNElJ/GtVzRCJBAyGnehuc/L7NL0bLfZe4TLXt6cR/8jkDYfUUAhCACj8CP+6U5nQq9557XHCb9fn+3pWc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwFdGoSvFMlYnpcGsghnST/HK9m+vT5YDlhfjE/+envSJm1FlwF
	tU+7PaSA4rWk4MgcSaBG1Vc0GWbk+mjkDDIiw/ER35M7OLTNOo6CYCf47rxnu5pA3d0z4KYGPF5
	XDbSdiA==
X-Received: from pgmt14.prod.google.com ([2002:a63:224e:0:b0:c80:2399:151])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2fc4:b0:368:85fb:7b8b
 with SMTP id 98e67ed59e1d1-36951cb936amr5644652a91.22.1778872830766; Fri, 15
 May 2026 12:20:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 15 May 2026 12:19:07 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260515191942.1892718-7-seanjc@google.com>
Subject: [PATCH v3 06/41] x86/acrn: Mark TSC frequency as known when using
 ACRN for calibration
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
X-purgate-ID: tlsNG-d25034/1778872833-DBF7ACF5-46DFD8C9/0/0
X-purgate-type: clean
X-purgate-size: 901
X-Rspamd-Queue-Id: 0727A556A6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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

Mark the TSC frequency as known when using ACRN's PV CPUID information.
Per commit 81a71f51b89e ("x86/acrn: Set up timekeeping") and common sense,
the TSC freq is explicitly provided by the hypervisor.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/acrn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index c1506cb87d8c..2da3de4d470e 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -29,6 +29,7 @@ static void __init acrn_init_platform(void)
 	/* Install system interrupt handler for ACRN hypervisor callback */
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
 
+	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	tsc_register_calibration_routines(acrn_get_tsc_khz,
 					  acrn_get_tsc_khz);
 }
-- 
2.54.0.563.g4f69b47b94-goog


