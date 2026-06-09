Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QWUaBlTFJ2p31wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 09:48:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF765D5D1
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 09:48:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="fhT/BnDr";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1332440.1594893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWrC3-00015A-Kl; Tue, 09 Jun 2026 07:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332440.1594893; Tue, 09 Jun 2026 07:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWrC3-00012R-I5; Tue, 09 Jun 2026 07:48:15 +0000
Received: by outflank-mailman (input) for mailman id 1332440;
 Tue, 09 Jun 2026 07:48:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tglx@kernel.org>) id 1wWrC2-000125-Jw
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 07:48:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWrC1-00514K-It
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 09:48:13 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tglx@kernel.org>)
 id 6a27c52d-5cb7-0a2a0a5109dd-0a2a4505d0f2-44
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 09:48:13 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tglx@kernel.org>)
 id 6a27c53b-aaa8-0a2a45050019-aceafc1fb6b4-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 09:48:13 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0796A438AB;
 Tue,  9 Jun 2026 07:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB4D1F00893;
 Tue,  9 Jun 2026 07:48:10 +0000 (UTC)
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
	s=k20260515; t=1780991290;
	bh=iiljLo4Dj3SESslIfwzIuSptLw3aAN39KXfU2xj2Ngk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fhT/BnDr+KIL6FSHMueMDrXiAeihxCx9XYmV4sQEsCrgZ1a/wLUlA82c1I6chu2MM
	 rwKusfZOsEM3kx5pEdK9ggrNvlOkxF1bXbC0sEg1cxOzYdFCuBBw2Q4HB3K+Tk2mgF
	 cv0n962KH23nlUg4uss93akTXM5KJMfq8JYgGQ0evU2dHo+DKQ9+YcNw/k+9RPPLKp
	 J47WOewPhoa36WNJqXt4oaEjhDK0itmBDVBlKuYN0GyqnPG07ArrFllQqbbqboqHCC
	 oIieu3huEj6Hct6nh+p+M18BgnBSbKYb1ebIk/0iA2wklf1pZ6SvQa5gkT9+Y/gL8Z
	 WvHbYAtwWzDSg==
From: Thomas Gleixner <tglx@kernel.org>
To: Sean Christopherson <seanjc@google.com>, David Woodhouse
 <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Kiryl Shutsemau <kas@kernel.org>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu
 <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>, Long Li
 <longli@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, Alexey
 Makhalov <alexey.makhalov@broadcom.com>, Jan Kiszka
 <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, Daniel
 Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-coco@lists.linux.dev, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org, Tom
 Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>,
 Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v4 10/47] x86/tsc: Consolidate forcing of
 X86_FEATURE_TSC_KNOWN_FREQ for PV code
In-Reply-To: <aidEfvTMjLa2zt43@google.com>
References: <20260529144435.704127-1-seanjc@google.com>
 <20260529144435.704127-11-seanjc@google.com> <877boc554l.ffs@fw13>
 <eef867eae15e30d08482ba16a1a32159745b64a7.camel@infradead.org>
 <aidEfvTMjLa2zt43@google.com>
Date: Tue, 09 Jun 2026 09:48:07 +0200
Message-ID: <87a4t440js.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1780991293-DA374443-90C67E9D/0/0
X-purgate-type: clean
X-purgate-size: 2818
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,alien8.de,linux.intel.com,kernel.org,microsoft.com,broadcom.com,siemens.com,infradead.org,suse.com,google.com,zytor.com,intel.com,oracle.com,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,outlook.com];
	FORGED_RECIPIENTS(0.00)[m:seanjc@google.com,m:dwmw2@infradead.org,m:pbonzini@redhat.com,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:mhklinux@outlook.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72CF765D5D1

On Mon, Jun 08 2026 at 15:38, Sean Christopherson wrote:
> On Sat, Jun 06, 2026, David Woodhouse wrote:
>> > Along with:
>> >=20
>> > =C2=A0=C2=A0 if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tsc_khz_early)
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Ignoring non=
-sensical tsc_early_khz command line argument\n");
>> >=20
>> > or something daft like that.
>
> Ya, I ended up in the same place once Sashiko pointed out that skipping t=
he SNP/TDX
> setup was hazardous[*], and also once I realized that tsc_khz_early *comp=
lemented*
> the refinement instead of replacing it.
>
> This is what I have locally:
>
>         if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
>                 known_tsc_khz =3D snp_secure_tsc_init();
>         else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
>                 known_tsc_khz =3D tdx_tsc_init();
>
>         /*
>          * If the TSC frequency wasn't provided by trusted firmware, try =
to get
>          * it from the hypervisor (which is untrusted when running as a C=
oCo guest).
>          */
>         if (!known_tsc_khz && x86_init.hyper.get_tsc_khz)
>                 known_tsc_khz =3D x86_init.hyper.get_tsc_khz();
>
>         /*
>          * Mark the TSC frequency as known if it was obtained from a hype=
rvisor
>          * or trusted firmware.  Don't mark the frequency as known if the=
 user
>          * specified the frequency, as the user-provided frequency is int=
ended
>          * as a "starting point", not a known, guaranteed frequency.
>          */
>         if (known_tsc_khz && !tsc_early_khz)
>                 setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);

If the frequenct is known via the above then you want to set the
KNOWN_FREQ feature bit unconditionally. SNP/TDX/hypervisor override the
command line argument as you print below.

>         /*
>          * Ignore the user-provided TSC frequency if the exact frequency =
was
>          * obtained from trusted firmware or the hypervisor, as the user-
>          * provided frequency is intended as a "starting point", not a kn=
own,
>          * guaranteed frequency.
>          */
>         if (!known_tsc_khz)
>                 known_tsc_khz =3D tsc_early_khz;
>         else if (tsc_early_khz)
>                 pr_err("Ignoring 'tsc_early_khz' in favor of firmware/hyp=
ervisor.\n");

>> All the nonsense about updating it every time we enter a CPU could just
>> go away completely.
>
> But to Thomas' point, why bother?  For actual old hardware, kvmclock is w=
hat it
> is.  For modern hardware, it's completely antiquated.

I agree, but we are not forced to make it a first class citizen to the
detriment of sane systems.

Thanks,

        tglx

