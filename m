Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMtZAUx1F2piFwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 00:50:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF83C5EAC41
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 00:50:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320799.1587952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSN4r-0001sa-DC; Wed, 27 May 2026 22:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320799.1587952; Wed, 27 May 2026 22:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSN4r-0001q3-9f; Wed, 27 May 2026 22:50:17 +0000
Received: by outflank-mailman (input) for mailman id 1320799;
 Wed, 27 May 2026 22:50:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <wei.liu@kernel.org>) id 1wSN4p-0001pk-ER
 for xen-devel@lists.xenproject.org; Wed, 27 May 2026 22:50:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSN4o-0003Si-Qk
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 00:50:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <wei.liu@kernel.org>)
 id 6a177500-e002-0a2a0a5209dd-0a2a4508ba08-22
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 00:50:14 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <wei.liu@kernel.org>)
 id 6a177525-63b5-0a2a45080019-aceafc1fdf68-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 00:50:14 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id E51DD4093F;
 Wed, 27 May 2026 22:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB701F000E9;
 Wed, 27 May 2026 22:50:12 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779922212;
	bh=GkJ3bVBiuZQji2Ar/qCbKZ6GVH9IRMh8D8UCLnr9oL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nvHw6RfUo8q13AfIMSrfTXDnKC9TNLDz0TfgHCd2nAa7Rw0UjAxRs3PuQXAC70E4j
	 dUV1hwv8WgHSfxZTiVKtOmKoDRBvPNTMpfcCslLv244RjTgo5c6gRI5GHB7zSHISWE
	 +rOtjJEE4nQT8elNuQ+u2LpOrQI3xCZDHWpdl618JKxPF0n3G8f7YVeVwxbx6DPccG
	 gNOhaGkupr2qae3+gXPonWvl/UxwhoB09REhet3n6B/5aJtpf6NgtajOJaN7jmtUW9
	 k8x/PEH/sgeC+TFB3zT6b58ZeWVmK9c5NvlRkPOwb6lxLgv8IM8cbHvhO9q+ci1l3c
	 O7AO2Zur6/Jsw==
Date: Wed, 27 May 2026 15:50:11 -0700
From: Wei Liu <wei.liu@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, John Stultz <jstultz@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stephen Boyd <sboyd@kernel.org>, x86@kernel.org,
	linux-coco@lists.linux.dev, kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Michael Kelley <mhklinux@outlook.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH v3 08/41] clocksource: hyper-v: Drop wrappers to
 sched_clock save/restore helpers
Message-ID: <20260527225011.GF3518940@liuwe-devbox-debian-v2.local>
References: <20260515191942.1892718-1-seanjc@google.com>
 <20260515191942.1892718-9-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515191942.1892718-9-seanjc@google.com>
X-purgate-ID: tlsNG-c1860d/1779922214-BD360DB1-4C39A058/0/0
X-purgate-type: clean
X-purgate-size: 474
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,microsoft.com,broadcom.com,siemens.com,linux.intel.com,infradead.org,suse.com,google.com,intel.com,oracle.com,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de,amazon.co.uk];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:kas@kernel.org,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,m:dwmw@amazon.co.uk,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[liuwe-devbox-debian-v2.local:mid,outlook.com:email];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_SENDER(0.00)[wei.liu@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wei.liu@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EF83C5EAC41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 15, 2026 at 12:19:09PM -0700, Sean Christopherson wrote:
> Now that all of the Hyper-V reference counter sched_clock code is located
> in a single file, drop the superfluous wrappers for the save/restore flows.
> 
> No functional change intended.
> 
> Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Wei Liu <wei.liu@kernel.org>

