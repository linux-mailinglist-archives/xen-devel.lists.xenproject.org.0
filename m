Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q5xMBRj+H2rgtgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 12:12:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D706636712
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 12:12:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=heqiJfYN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1326034.1591458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUia9-0006b9-6s; Wed, 03 Jun 2026 10:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326034.1591458; Wed, 03 Jun 2026 10:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUia9-0006Z2-4F; Wed, 03 Jun 2026 10:12:17 +0000
Received: by outflank-mailman (input) for mailman id 1326034;
 Wed, 03 Jun 2026 10:02:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kas@kernel.org>) id 1wUiQj-00055D-A7
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:02:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUiQi-00BMQ4-H8
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 12:02:32 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kas@kernel.org>)
 id 6a1ffbb4-2eae-0a2a0a5409dd-0a2a450a9976-16
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 12:02:32 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kas@kernel.org>)
 id 6a1ffbb6-56b3-0a2a450a0019-aceafc1fbbc0-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 12:02:31 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id F002540700;
 Wed,  3 Jun 2026 10:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BB81F00898;
 Wed,  3 Jun 2026 10:02:28 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfauth.phl.internal (Postfix) with ESMTP id 1B503F4007E;
 Wed,  3 Jun 2026 06:02:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 03 Jun 2026 06:02:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 06:02:25 -0400 (EDT)
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
	s=k20260515; t=1780480949;
	bh=V8fVwdI7wxnksQVE14DY2HWli3Oy9+kR4dG/B9JF5Y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=heqiJfYNfvCVfeDdF07xE4qHhG7Ix22oFDFTYVM3WDBZVFjjq7MdBm7RxPXb2NQ3h
	 wlPm/fq9mnt4GRJr7WluzoMlgjC2Kl3T10enIwOHJ1XpcPMo83xxJet1qDAoJ1C1JD
	 5XKUMVwQ6K/HPE0uhrHFM3U4IWwd0Tbk3NwNrZWaS8txhD7kZTaMg6w+5lvM8K01uY
	 //OoJ4TLPg+551ngLS3gx286ROaDNVBuWuY8QWxE7kMKzW/dfnSG/n5UV6niq98AxV
	 toH0afbm7Bb1/0qnLaXL2Xfmx4yRd7FHvPV5vtqCusZI3PhWlaVNLDGaeRYlkK2oBf
	 9MHHVXSJAHBKQ==
X-ME-Sender: <xms:tPsfauhaxGVEUgsvlHEIwecFN-9ZEF71setn4TDGW-FCZRyQ0LUDyA>
    <xme:tPsfamdy_fjRoYDOeR8cmy-cPfUgoaO8mBFumrmZMVa1jqXBPwZUvuLW59ggNGPh6
    y6Fg25GDh1rZ4Nor5r3OQmW7R6jePR7YEy-XB3OaBYhUGAYnBP5RIw>
X-ME-Received: <xmr:tPsfajmUqQ7cLJ253fvAZjjjhxIAhgwirNcqfwrQkow3MYEGcKhn-5N2p_izhw>
X-ME-Proxy-Cause: dmFkZTGuwFznDiQhelvFQOBp2/9r9H4fxoNNaEmxB6iOaHyiMwffQUPfC1FAZMpbzqIqkk
    CN9TCgwxMINXJSdtTnBkzIXOc6K717wq9QjeaoGXRWKTpKm0u+QpWfmKKW9HN3pL/A1+6p
    92lcvawl98fM5nvrzMFAJ0zCHVpCTPUX+0fcWGBVn0sUJNaILiDyF6WAR5GTLaYBf9LtF9
    HeIJf/jM6FJN5c4MVjb/Nm52s7djeDzHoqhhvyRfCScg4aR0UhUORBt/S3XR36+WsGhT7P
    bVueHPke7HzKjPxs+Lmcr4uF/2Rif/nWiVWI2Sn/X2KEDbfEm3ZjS1qdm+5tHCszTtFFts
    /VzzRZabQfVduEReAlUgkBJ79Z4LSt1cBS+rSnnFi9jDTiczC1H87ZS7qLCKADqoqzrmR4
    mGIz8sa4eqINRsLod/oLKxieYbrnEsfQXN/59nPX9ObnVXbRESfnOCNA6fc+BZp0oeNprP
    PvGGkzDmtovVRJkI3ywAfrhFpNJvUXD0fDzsSJPA0RLCqMYGu9iLwI5MlFSpJg7a/5udeS
    lJZWm/zw2dGecCf6mp/nhd1OdYPK7oDQIXbomfj0Bb9MYjyFb44nJOTTHxAkkFlEu1IJB4
    mvQH42vq4f+lwAhvj17/Vsi6xt4tXviwqxjQO+AmX3bH/ZlUDX8iOWPxS9lA
X-ME-Proxy: <xmx:tPsfaixl8twHiScZRF0l3aPUkADDTTORVWaND_noCCfDud9HhsTR5Q>
    <xmx:tPsfalcLZ32BWK_NdqC_-FR1DBldNJTO6IRNGnlVk2pTTVI454R5Rg>
    <xmx:tPsfajhekMHXMQ6qYg0RgZ4pegrE87GtuiN4Aa5Q13qUrGdoLAXSdw>
    <xmx:tPsfap-OinTX938zNS5LgCJfS2x6J85u1U-3v3h3dj98T7oCnvJ1vg>
    <xmx:tPsfapa94FWneQTrYxrkNAOdSEUGyY-WiNNfJ2K6qxxwDuEUGbG_4uoT>
Feedback-ID: i10464835:Fastmail
Date: Wed, 3 Jun 2026 11:02:19 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, 	Long Li <longli@microsoft.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 	Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, 	Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, 	Juergen Gross <jgross@suse.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 	John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
 	Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 	Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 	Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-coco@lists.linux.dev,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 	Tom Lendacky <thomas.lendacky@amd.com>,
 Nikunj A Dadhania <nikunj@amd.com>,
 	David Woodhouse <dwmw2@infradead.org>,
 Michael Kelley <mhklinux@outlook.com>,
 	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 07/47] x86/tdx: Force TSC frequency with CPUID-based
 info provided by the TDX-Module
Message-ID: <ah_7jEMnqs80gXLG@thinkstation>
References: <20260529144435.704127-1-seanjc@google.com>
 <20260529144435.704127-8-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529144435.704127-8-seanjc@google.com>
X-purgate-ID: tlsNG-4011c0/1780480952-7CC7A8B7-7CFA4D75/0/0
X-purgate-type: clean
X-purgate-size: 1975
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,alien8.de,linux.intel.com,microsoft.com,broadcom.com,siemens.com,infradead.org,suse.com,google.com,zytor.com,intel.com,oracle.com,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amazon.co.uk,amd.com,outlook.com,linutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:dwmw@amazon.co.uk,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw2@infradead.org,m:mhklinux@outlook.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER(0.00)[kas@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[kas@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thinkstation:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D706636712

On Fri, May 29, 2026 at 07:43:54AM -0700, Sean Christopherson wrote:
> When running as a TDX guest, explicitly set the TSC frequency to a known
> value, using CPUID-based information, instead of potentially relying on a
> hypervisor-controlled PV routine.  For TDX guests, CPUID.0x15 is always
> emulated by the TDX-Module, i.e. the information from CPUID is more
> trustworthy than the information provided by the hypervisor.

Right. EBX is configurable by TD_PARAMS.TSC_FREQUENCY at TD build. The
rest is fixed.

> To maintain backwards compatibility with TDX guest kernels that use native
> calibration, and because it's the least awful option, retain
> native_calibrate_tsc()'s stuffing of the local APIC bus period using the
> core crystal frequency.  While it's entirely possible for the hypervisor
> to emulate the APIC timer at a different frequency than the core crystal
> frequency, the commonly accepted interpretation of Intel's SDM is that APIC
> timer runs at the core crystal frequency when that latter is enumerated via
> CPUID:
> 
>   The APIC timer frequency will be the processor’s bus clock or core
>   crystal clock frequency (when TSC/core crystal clock ratio is enumerated
>   in CPUID leaf 0x15).
> 
> If the hypervisor is malicious and deliberately runs the APIC timer at the
> wrong frequency, nothing would stop the hypervisor from modifying the
> frequency at any time, i.e. attempting to manually calibrate the frequency
> out of paranoia would be futile.

Agreed.

> Deliberately leave CPU frequency calibration as is, since the TDX-Module
> doesn't provide any guarantees with respect to CPUID.0x16.

It is fixed to zeros. Sounds like a guarantee to me :P

> Signed-off-by: Sean Christopherson <seanjc@google.com>

Looks sane to me. Including your reasoning about tsc_early_khz= in reply
to Sashiko.

Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

