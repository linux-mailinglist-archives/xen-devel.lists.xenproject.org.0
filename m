Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJhqCjIGDmp25gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 21:06:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7374A597C03
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 21:06:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314317.1584281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPmF7-0000VY-Sh; Wed, 20 May 2026 19:06:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314317.1584281; Wed, 20 May 2026 19:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPmF7-0000Sl-Pr; Wed, 20 May 2026 19:06:09 +0000
Received: by outflank-mailman (input) for mailman id 1314317;
 Wed, 20 May 2026 19:06:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3HAYOagYKCbcpbXkgZdlldib.Zljubk-absbiifpqp.ubkmolgbZq.lod@flex--seanjc.bounces.google.com>)
 id 1wPmF5-0000Sa-Re
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 19:06:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPmF5-00BG1W-7p
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 21:06:07 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3HAYOagYKCbcpbXkgZdlldib.Zljubk-absbiifpqp.ubkmolgbZq.lod@flex--seanjc.bounces.google.com>)
 id 6a0e0608-5cb7-0a2a0a5109dd-0a2a4505a596-24
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 21:06:07 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3HAYOagYKCbcpbXkgZdlldib.Zljubk-absbiifpqp.ubkmolgbZq.lod@flex--seanjc.bounces.google.com>)
 id 6a0e061d-aaa8-0a2a45050019-d155d6cab9a8-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 21:06:06 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2bd6cc53fd6so53194455ad.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 12:06:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779303965; x=1779908765; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6WNRv8jV4IoEb/swCa+lI2OUcbnWLzJ/hZWZsifg+pw=;
        b=WN4B1m7Eqe1kDKwb0yBMWGpk5ahowPrWZmydymmyRQWSwFbHEkq6rrsNznrg6su25d
         prcXvaYRqnJVKKMeM1wfYgTS+MKuBPol5Ro7Xt4OU5Z+VGpnlkWfcmrTvK094yqTxZJf
         rgE1kxkuYtnHZeumI5sV87gkoamA9d17OLkhkeVM3Xch5Gb9hPss+6QZH3NDK8ql9iTR
         dA5zEs/S0qyuIsZ7LT8MEDFT7pVC/rRKpYq33eCm/WJQnVltzivto2ZElP5jdrKD+0Yg
         FUPsTKBkxgLB3MMpUAcEYkJvFBEME9yYwfjzgFZeCeKnelwzDkHY4kosTcPJeK+kT2r8
         LZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779303965; x=1779908765;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6WNRv8jV4IoEb/swCa+lI2OUcbnWLzJ/hZWZsifg+pw=;
        b=dJWxgdCgULIWfCKlorRQPNmdIMD/vUbpS8Fy/eApDZ7CwG3UxtN/iGFnEKAW07RDIR
         WPsJE5KXYp946eltdIs2OwGN9SYyARBmx01QVnBDF7xn7u/rw6sWGvM5d+Xj659FTs0J
         hOtGXzw4H8SUoFTtNpsXFKyyuA1+tT2Dm82vnwjawtsEEeLjmUNzS9qRNC9Vg0VIuiz8
         J8cufZPO32rN9FiVwkBTlm63AbPJMiXPPcQGZiTsak0tuUGh+yo6hvXwNAw8D/NLqEkd
         R1Sb6vLbk7aA6uamsHE4zo6AT0MY/P/FY10y2BIHqlrWj4hXflCYtcxOwyFRldyHP5oe
         RUbA==
X-Forwarded-Encrypted: i=1; AFNElJ+TA6sybeuknCpjWOmMq4EqfaHPxrRIOlgkMf+oCeaPOE7t70AOtF/ZzJXVLve/9wX2htocEtmHu6M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBg0diXG0Rt33gSzzz5GpZAlRg8kr/vj7acbaNQylFXTgQLffI
	nMaRAmeGpHnf1vATUbimU5ITqKNgGi+et4PS8WM8rAPawoXiDaDd9P+CzrrxjKWVoGw8HufIxK3
	C9VqjAQ==
X-Received: from plup11.prod.google.com ([2002:a17:903:4b2b:b0:2ba:67f8:6257])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:7d96:b0:2b0:bed1:46f7
 with SMTP id d9443c01a7336-2bd7e910f99mr193795045ad.37.1779303964438; Wed, 20
 May 2026 12:06:04 -0700 (PDT)
Date: Wed, 20 May 2026 12:06:02 -0700
In-Reply-To: <0a3aa07a1d3c4bec2b89f8026093969155b73caa.camel@infradead.org>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-42-seanjc@google.com>
 <0a3aa07a1d3c4bec2b89f8026093969155b73caa.camel@infradead.org>
Message-ID: <ag4GGqYv0DHoVx-C@google.com>
Subject: Re: [PATCH v3 41/41] x86/kvmclock: Get CPU base frequency from CPUID
 when it's available
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, x86@kernel.org, 
	linux-coco@lists.linux.dev, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1779303967-E3D67443-573BBDD1/0/0
X-purgate-type: clean
X-purgate-size: 1889
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,microsoft.com,broadcom.com,siemens.com,linux.intel.com,infradead.org,suse.com,google.com,intel.com,oracle.com,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:kas@kernel.org,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7374A597C03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > If CPUID.0x16 is present and valid, use the CPU frequency provided by
> > CPUID instead of assuming that the virtual CPU runs at the same
> > frequency as TSC and/or kvmclock.=C2=A0 Back before constant TSCs were =
a
> > thing, treating the TSC and CPU frequencies as one and the same was
> > somewhat reasonable, but now it's nonsensical, especially if the
> > hypervisor explicitly enumerates the CPU frequency.
> >=20
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> > =C2=A0arch/x86/kernel/kvmclock.c | 16 +++++++++++++++-
> > =C2=A01 file changed, 15 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
> > index 62c8ea2e6769..7607920ae386 100644
> > --- a/arch/x86/kernel/kvmclock.c
> > +++ b/arch/x86/kernel/kvmclock.c
> > @@ -190,6 +190,20 @@ void kvmclock_cpu_action(enum kvm_guest_cpu_action=
 action)
> > =C2=A0	}
> > =C2=A0}
> > =C2=A0
> > +static unsigned long kvm_get_cpu_khz(void)
> > +{
> > +	unsigned int cpu_khz;
> > +
> > +	/*
> > +	 * Prefer CPUID over kvmclock when possible, as the base CPU frequenc=
y
> > +	 * isn't necessarily the same as the kvmlock "TSC" frequency.
> > +	 */
> > +	if (!cpuid_get_cpu_freq(&cpu_khz))
> > +		return cpu_khz;
> > +
> > +	return pvclock_tsc_khz(this_cpu_pvti());
>=20
> I'm fine with this in principle but shouldn't the fallback be calling
> kvm_get_tsc_khz() instead of directly calling pvclock_tsc_khz()?

Oh, yeah, for this patch, definitely yes, so that there's no side effects. =
 The
question really should be answered in the context of "x86/kvmclock: Obtain =
TSC
frequency from CPUID if present", which subtly impacts the CPU frequency, b=
ut I
think the answer is "yes" there as well.

