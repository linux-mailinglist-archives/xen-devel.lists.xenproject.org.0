Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id knXQHyQHKGpV7gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 14:29:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7766600FF
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 14:29:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=popXHDN6;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=google.com
Received: from list by lists.xenproject.org with outflank-mailman.1333190.1595716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWvZH-0007ii-JT; Tue, 09 Jun 2026 12:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333190.1595716; Tue, 09 Jun 2026 12:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWvZH-0007hL-Gg; Tue, 09 Jun 2026 12:28:31 +0000
Received: by outflank-mailman (input) for mailman id 1333190;
 Tue, 09 Jun 2026 12:28:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <36gYoagYKCe8jVReaTXffXcV.TfdoVe-UVmVccZjkj.oVegifaVTk.fiX@flex--seanjc.bounces.google.com>)
 id 1wWvZF-0007hA-LU
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 12:28:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWvZF-004JZe-25
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 14:28:29 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <36gYoagYKCe8jVReaTXffXcV.TfdoVe-UVmVccZjkj.oVegifaVTk.fiX@flex--seanjc.bounces.google.com>)
 id 6a2806e2-2eae-0a2a0a5409dd-0a2a4505dd7a-32
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 14:28:29 +0200
Received: from [209.85.210.202] (helo=mail-pf1-f202.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <36gYoagYKCe8jVReaTXffXcV.TfdoVe-UVmVccZjkj.oVegifaVTk.fiX@flex--seanjc.bounces.google.com>)
 id 6a2806eb-aaa8-0a2a45050019-d155d2caac64-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 14:28:28 +0200
Received: by mail-pf1-f202.google.com with SMTP id
 d2e1a72fcca58-8423efdbe6fso3569522b3a.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 05:28:28 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781008107; x=1781612907; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unmnrNbCXlEEjkFhHM3DLJAuHv468WBx57rOjaror7w=;
        b=popXHDN6mSBVa6iCU1Gotn/R5dx26dDsQqE6MWFrPy8u80jFuay6pwSoRiuzltz2vr
         me2NMOeSIzvrhXCHeHrjS2iRSwxB0XjHHKgTCiGs0Pn+/YY96tde053jNsjskF89DIsz
         RaxGE9FhjAYXgUFbSr2I9MONsY20HHsnkF9k2urluhgUASGeUZCYMUKqo8Za1Im6uBqh
         Rlqf+Mn6mXHgYNbUZ5bqWz3mhP+rtAhEtpWHzLPInBF3GEcEL1RZKl8Qjlh4iweAVTuB
         LpXuP0q9YsxCJUf7oSjMKG2wlIgoJQ32VDgIUtYVX7uFD/jndWQv/BjNolWIilRbDWCp
         n8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781008107; x=1781612907;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=unmnrNbCXlEEjkFhHM3DLJAuHv468WBx57rOjaror7w=;
        b=NhDeKFtSKUD/9Mgq/VyubVyLOdnj/LqpDGzdLaPPkhCeiPTWqIS1lRDx32BTBKAEK2
         SZGCw6JhzctL6vowu98w2cjEkmowkKpilemiEZOzU2tNBwRDmpVmiBk0YpfmwCOgKffz
         FuRF8v/DzRhbYYo/gFe0hZ+aBKPOFvC/kZw0NKsxryoNx26iwJBd65vn7vFRO5R0E4/O
         zvbb4LSUqKwbkU8aRnpb7xUYggkn6iFHmGg0KxT4IZexvLm5WMy7Zn2ZxwvBaJNBLxUE
         EYllFdPSzPVBG5jeeCuwvamxmy7P4f1kaWZjX6X2yl5O9j2CgacsMW2FZUmVxWIk6CWY
         z+ow==
X-Forwarded-Encrypted: i=1; AFNElJ/b4ZaWpmBcvg968d0qBks8WRA7O7ZYnb4Zl527MiDWkrD34qnIOQZOd4mNsccVfk4Hvou6VPa/eEE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1BHKtjYN95+5I9Yruwrak/3557lAHdpM81BbSKR2K8iapm+NP
	koWU/H5s5E7HGO7oHOZLJjFZyfsjfdUE6mJhYdKsfrm05DkRrx1SbedlHF4Td1mGi4ZEewFzSc9
	DoekLiw==
X-Received: from pfjf5.prod.google.com ([2002:a05:6a00:22c5:b0:842:4720:4013])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2910:b0:842:6fce:6171
 with SMTP id d2e1a72fcca58-8430a62f307mr3223335b3a.3.1781008106459; Tue, 09
 Jun 2026 05:28:26 -0700 (PDT)
Date: Tue, 9 Jun 2026 05:28:24 -0700
In-Reply-To: <87a4t440js.ffs@fw13>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com> <20260529144435.704127-11-seanjc@google.com>
 <877boc554l.ffs@fw13> <eef867eae15e30d08482ba16a1a32159745b64a7.camel@infradead.org>
 <aidEfvTMjLa2zt43@google.com> <87a4t440js.ffs@fw13>
Message-ID: <aigG6NdLZtbc7prD@google.com>
Subject: Re: [PATCH v4 10/47] x86/tsc: Consolidate forcing of
 X86_FEATURE_TSC_KNOWN_FREQ for PV code
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Michael Kelley <mhklinux@outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1781008108-D9F76443-34CAEA80/0/0
X-purgate-type: clean
X-purgate-size: 2126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[infradead.org,redhat.com,alien8.de,linux.intel.com,kernel.org,microsoft.com,broadcom.com,siemens.com,suse.com,google.com,zytor.com,intel.com,oracle.com,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,outlook.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:dwmw2@infradead.org,m:pbonzini@redhat.com,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:mhklinux@outlook.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[google.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC7766600FF

On Tue, Jun 09, 2026, Thomas Gleixner wrote:
> On Mon, Jun 08 2026 at 15:38, Sean Christopherson wrote:
> > On Sat, Jun 06, 2026, David Woodhouse wrote:
> >> > Along with:
> >> >=20
> >> > =C2=A0=C2=A0 if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
> >> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tsc_khz_early)
> >> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Ignoring n=
on-sensical tsc_early_khz command line argument\n");
> >> >=20
> >> > or something daft like that.
> >
> > Ya, I ended up in the same place once Sashiko pointed out that skipping=
 the SNP/TDX
> > setup was hazardous[*], and also once I realized that tsc_khz_early *co=
mplemented*
> > the refinement instead of replacing it.
> >
> > This is what I have locally:
> >
> >         if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
> >                 known_tsc_khz =3D snp_secure_tsc_init();
> >         else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
> >                 known_tsc_khz =3D tdx_tsc_init();
> >
> >         /*
> >          * If the TSC frequency wasn't provided by trusted firmware, tr=
y to get
> >          * it from the hypervisor (which is untrusted when running as a=
 CoCo guest).
> >          */
> >         if (!known_tsc_khz && x86_init.hyper.get_tsc_khz)
> >                 known_tsc_khz =3D x86_init.hyper.get_tsc_khz();
> >
> >         /*
> >          * Mark the TSC frequency as known if it was obtained from a hy=
pervisor
> >          * or trusted firmware.  Don't mark the frequency as known if t=
he user
> >          * specified the frequency, as the user-provided frequency is i=
ntended
> >          * as a "starting point", not a known, guaranteed frequency.
> >          */
> >         if (known_tsc_khz && !tsc_early_khz)
> >                 setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
>=20
> If the frequenct is known via the above then you want to set the
> KNOWN_FREQ feature bit unconditionally. SNP/TDX/hypervisor override the
> command line argument as you print below.

Doh, forgot to remove that check when I shuffled things around.  Thank you!

