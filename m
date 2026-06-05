Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NDtyMgfDImp0dQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 14:37:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688036483A1
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 14:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YEmTZWq3;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1329452.1593582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVTna-0003PK-Ot; Fri, 05 Jun 2026 12:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329452.1593582; Fri, 05 Jun 2026 12:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVTna-0003MW-Lb; Fri, 05 Jun 2026 12:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1329452;
 Fri, 05 Jun 2026 12:37:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tglx@kernel.org>) id 1wVTnY-0003MG-Uc
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 12:37:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVTnW-009rQn-Ky
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 14:37:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tglx@kernel.org>)
 id 6a22c2de-5cb7-0a2a0a5109dd-0a2a450b9c38-42
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 14:37:14 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tglx@kernel.org>)
 id 6a22c2f9-212f-0a2a450b0019-ac6904fecc5e-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 14:37:14 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 529DF601F5;
 Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B0B1F00893;
 Fri,  5 Jun 2026 12:37:11 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780663032;
	bh=5W6FiCPw6sX6Mb9wMs7Y8uennTDZr6e1xX3L0BW5MJY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YEmTZWq3dmUMH12jc/DFu/P4OzcULMgWKzk+y8GZ2rhlb8n7qhyCDBCHw3xHKlFm9
	 KVFiUJuI8WqYf4gVlg0KIfDVESYWvU9coOvSXxaaEpQGfqw86+RrMazwrYVG7phoWz
	 8ULdotuRnveudrTehApXe/p3rsX97IhOHfDklWPuNSP8QP7jgjeqf9ReklwS9qgISR
	 s6UYCikKByY1nzH3/pR4dS8lA5/wXlDQiziSmJdE2KUBdAvlGGUFeSOJ/pgA9SUGOA
	 QKppWOWpDZWGMhV4kceQk+T/u8V6Uy/xLJZAj2+XZUEShBrRSDpJ+Eq5uMTH3UgVmT
	 lWqJi0DUTsDgQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Kiryl Shutsemau <kas@kernel.org>, Sean Christopherson <seanjc@google.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Long Li <longli@microsoft.com>, Ajay Kaher
 <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz
 <jstultz@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe
 <rick.p.edgecombe@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, David
 Woodhouse <dwmw@amazon.co.uk>, Tom Lendacky <thomas.lendacky@amd.com>,
 Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw2@infradead.org>,
 Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v4 02/47] x86/tsc: Add a standalone helpers for getting
 TSC info from CPUID.0x15
In-Reply-To: <20260529144435.704127-3-seanjc@google.com>
References: <20260529144435.704127-1-seanjc@google.com>
 <20260529144435.704127-3-seanjc@google.com>
Date: Fri, 05 Jun 2026 14:37:09 +0200
Message-ID: <87cxy55fka.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
X-purgate-ID: tlsNG-42698a/1780663034-22D77F3B-0CF458A2/0/0
X-purgate-type: clean
X-purgate-size: 362
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FREEMAIL_CC(0.00)[zytor.com,intel.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amazon.co.uk,amd.com,infradead.org,outlook.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[tglx@kernel.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:pbonzini@redhat.com,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:dwmw@amazon.co.uk,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw2@infradead.org,m:mhklinux@outlook.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fw13:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 688036483A1

On Fri, May 29 2026 at 07:43, Sean Christopherson wrote:
>  		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
> -		crystal_khz = eax_base_mhz * 1000 *
> -			eax_denominator / ebx_numerator;
> +		info.crystal_khz = eax_base_mhz * 1000 *
> +			info.denominator / info.numerator;

Please get rid of this ugly line break. You have 100 characters.


