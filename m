Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLrEJkZTHmqDigkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 05:51:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 403C7627E37
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 05:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324383.1589950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUG91-0007GV-1l; Tue, 02 Jun 2026 03:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324383.1589950; Tue, 02 Jun 2026 03:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUG90-0007Dj-Rh; Tue, 02 Jun 2026 03:50:22 +0000
Received: by outflank-mailman (input) for mailman id 1324383;
 Tue, 02 Jun 2026 03:50:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bp@alien8.de>) id 1wUG8y-0007DN-Om
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 03:50:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUG8w-00FQbX-F1
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 05:50:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bp@alien8.de>)
 id 6a1e52e7-2eae-0a2a0a5409dd-0a2a450be174-24
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:50:18 +0200
Received: from [65.109.113.108] (helo=mail.alien8.de)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bp@alien8.de>)
 id 6a1e52f9-212f-0a2a450b0019-416d716c9a58-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:50:18 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BDD1140E0140; 
 Tue,  2 Jun 2026 03:50:16 +0000 (UTC)
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rZ_Ke2IbpmQx; Tue,  2 Jun 2026 03:50:07 +0000 (UTC)
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id ADDBA40E01B5;
 Tue,  2 Jun 2026 03:49:27 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=alien8 header.d=alien8.de header.i="@alien8.de" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780372206; bh=HH13uV+Z55mhxzoi6FErPEsztGrj9z0uUROqU3Stz7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BRMb1T+l+1IEZY4TOjMQ4w9ReoLidSSyCALG5lXh6uQPdtJJQdXO/YpIwNlbAph4G
	 l/Dh+tFMKmPgVvKipIF2u99KtO2EN4cAREtpsqdKPkOqerozWTYAFwi46Wybtw/fbe
	 +vmegLk87Rbq8vbD1H6DVOK2BrOKVAvWoMdxIbDT51x5lCY8z551GuWp9FhHp5+car
	 VfJLFeyoLUyJO6c15FDGEfyv+Rbc53q3q5OSovUcXOREzvcqEjbwoVe0Y7wIViYOYy
	 dK617hXkXVl9eYOJXWLlMawnI/pzDgQLxVC0VmuhZxwuyaJg1r6HaVHRONeWchNvGu
	 vuUBlnvH9mmhMammOcSRyPnYSNm/ouhxvpjBC/kkh+mImmroEj5FFwKdESFRHD587M
	 WZc+lXnb/l4BjyEVAAGNP2cLctZRPQKFYevllLAVNJtLle0Ashf1Pb13YdcdHN1spM
	 rkF/jhg93VsSnzNK3JT36gNuh51JJh4mRth91IoSXBMOPYx6eLMZftQjrevQIQewk4
	 r73TYm4D6cnm0I9ePqYDRkUs1jK14EW1+rpqzoVUj1phZqDDalP0khp5WsBql7Ff4D
	 DlzFTsjW4cZGQdPzsWOWFWXdC25leop27h508hIBBoyX6ymrK7PIpoEE1rrc0t6G1Y
	 cqjQSDM1OdJJ7XcJilcWD9FQ=
Date: Mon, 1 Jun 2026 20:49:16 -0700
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Kiryl Shutsemau <kas@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juergen Gross <jgross@suse.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 02/47] x86/tsc: Add a standalone helpers for getting
 TSC info from CPUID.0x15
Message-ID: <20260602034916.GGah5SvARd77mkvxe3@fat_crate.local>
References: <20260529144435.704127-1-seanjc@google.com>
 <20260529144435.704127-3-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529144435.704127-3-seanjc@google.com>
X-purgate-ID: tlsNG-42698a/1780372218-19969F3B-939E435D/0/0
X-purgate-type: clean
X-purgate-size: 1401
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,linux.intel.com,microsoft.com,broadcom.com,siemens.com,infradead.org,suse.com,google.com,zytor.com,intel.com,oracle.com,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amazon.co.uk,amd.com,outlook.com,linutronix.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:dwmw@amazon.co.uk,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw2@infradead.org,m:mhklinux@outlook.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alien8.de:dkim,fat_crate.local:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[alien8.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 403C7627E37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 07:43:49AM -0700, Sean Christopherson wrote:
> +static int cpuid_get_tsc_info(struct cpuid_tsc_info *info)
> +{
> +	unsigned int ecx_hz, edx;
> +
> +	memset(info, 0, sizeof(*info));

Let's not clear this unnecessarily...

> +
> +	if (boot_cpu_data.cpuid_level < CPUID_LEAF_TSC)
> +		return -ENOENT;

... just to return here...

> +
> +	/* CPUID 15H TSC/Crystal ratio, plus optionally Crystal Hz */
> +	cpuid(CPUID_LEAF_TSC, &info->denominator, &info->numerator, &ecx_hz, &edx);
> +
> +	if (!info->denominator || !info->numerator)
> +		return -ENOENT;

... or here.

We wanna clear it here, when we'll return success.

> +
> +	/*
> +	 * Note, some CPUs provide the multiplier information, but not the core

	Note: some CPUs...

> +	 * crystal frequency.  The multiplier information is still useful for
> +	 * such CPUs, as the crystal frequency can be gleaned from CPUID.0x16.
> +	 */
> +	info->crystal_khz = ecx_hz / 1000;
> +	return 0;
> +}
> +
> +int __init cpuid_get_tsc_freq(struct cpuid_tsc_info *info)
> +{
> +	if (cpuid_get_tsc_info(info) || !info->crystal_khz)
> +		return -ENOENT;
> +
> +	info->tsc_khz = info->crystal_khz * info->numerator / info->denominator;
> +	return 0;
> +}

Unused here. Add it with its first user pls.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

