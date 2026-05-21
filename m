Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDZHLv1wD2o8MQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 22:54:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D7A5ABEDF
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 22:54:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315927.1585565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQAOk-0005it-2D; Thu, 21 May 2026 20:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315927.1585565; Thu, 21 May 2026 20:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQAOj-0005hB-Vd; Thu, 21 May 2026 20:53:41 +0000
Received: by outflank-mailman (input) for mailman id 1315927;
 Thu, 21 May 2026 20:53:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <30HAPagYKCUc1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 1wQAOi-0005h5-52
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 20:53:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQAOh-004TER-E5
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 22:53:39 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <30HAPagYKCUc1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 6a0f70a2-e002-0a2a0a5209dd-0a2a4506b134-18
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 22:53:39 +0200
Received: from [209.85.210.201] (helo=mail-pf1-f201.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <30HAPagYKCUc1njwslpxxpun.lxv6nw-mn4nuur121.6nwy0xsnl2.x0p@flex--seanjc.bounces.google.com>)
 id 6a0f70d1-7371-0a2a45060019-d155d2c9e1d3-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 22:53:39 +0200
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-8353fbc7ad5so3306944b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 13:53:38 -0700 (PDT)
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
        d=google.com; s=20251104; t=1779396817; x=1780001617; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtuSO9Df1yE7JlouGMlcWCEpEnvAH6qlC/HYl6ROkD4=;
        b=OSwruEvJMq1hIQHF8ejpwsQW1CDi8rgR2ypgBuXP8Lox1IDV53jRsfd6geFTJz39Nt
         R0YPwdHcpWR6s40D3RdbcJlg+bngIDV6bFr56DS3DOkvYwzsEgj/iOqNi31WV8Uk+IqY
         z4EsHWircUucj6IoN3lOcupj8C3KoqjoPFm1b5w4xY7+JPhBMrVLFlZhFDT7usHompDG
         SkNFFDtgiYobgGCIuq2G7ucCwIVcvq2jZm33rKXElr9HzCP+02eKa0mm29iJK3WMqPmq
         xYHje6hZ2Sod7tzhdq5dTQ95unbP6IXo4ji79ec0Y94asfxKSU0lWWeoP7TAzhOKMhxk
         3NPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779396817; x=1780001617;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mtuSO9Df1yE7JlouGMlcWCEpEnvAH6qlC/HYl6ROkD4=;
        b=pdVeWN+z/On+ttjm7trDKkG435gzvGaCoYpbxt7balqseL7gfxfRv+ZM620YxgisT5
         9lzWJowFIYAkZpUkyKhRIP14yN4oBqiVtZYqZk0DHserkVL/44NNW2Usol4OkdqapcXV
         kZvIjwzp2X5e7Wc2qQOggOpFUFzbOFEcYwbTMdBx2m0J//QpGGvKLDdoIoXRpSqT+0l3
         2XGc8V3gIthtU08R3nCXPFsn69raiN6nLCE1HkgzX4bt7Rpk+v4bq91u73qL2ttpgx+O
         9H5vecGP4PezCvBVMd6LGDM7FZFQO70qYdRp1q4d27R9idrYgQZg58ODROvxxwCwHFSz
         9wWQ==
X-Forwarded-Encrypted: i=1; AFNElJ86hW8nbweT8Df81btvPDYeIn9hllcT2GD5lkPO0Wx/isFON3QgCb7R+askAL4lIUMdAsZC1ycXLEU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzO4NDgPA2vJmwfrWifDkNufMwXm8G1IRfhJ280w/MbR9mo5qOj
	jZ8+MDnX1zRqi/RogGX1wNEi+8TQfHRMP6M0v6bJpsBztzkbkqtPBZ+bvoVce9rmlVHdx0hRK8G
	OxTQtvA==
X-Received: from pfbg21.prod.google.com ([2002:a05:6a00:ae15:b0:82f:915e:291f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e06:b0:837:b97d:2fe
 with SMTP id d2e1a72fcca58-8415f18b012mr734843b3a.18.1779396816710; Thu, 21
 May 2026 13:53:36 -0700 (PDT)
Date: Thu, 21 May 2026 13:53:35 -0700
In-Reply-To: <44e0d60548d317fd59895f18bd17220dfb2f834b.camel@infradead.org>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-3-seanjc@google.com>
 <44e0d60548d317fd59895f18bd17220dfb2f834b.camel@infradead.org>
Message-ID: <ag9wz3RiJOtVZrK0@google.com>
Subject: Re: [PATCH v3 02/41] x86/tsc: Add helper to register CPU and TSC freq
 calibration routines
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
X-purgate-ID: tlsNG-16d1c6/1779396819-8757ED75-AB378057/0/0
X-purgate-type: clean
X-purgate-size: 4753
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,microsoft.com,broadcom.com,siemens.com,linux.intel.com,infradead.org,suse.com,google.com,intel.com,oracle.com,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:kas@kernel.org,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[google.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 28D7A5ABEDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > Add a helper to register non-native, i.e. PV and CoCo, CPU and TSC
> > frequency calibration routines.=C2=A0 This will allow consolidating han=
dling
> > of common TSC properties that are forced by hypervisor (PV routines),
> > and will also allow adding sanity checks to guard against overriding a
> > TSC calibration routine with a routine that is less robust/trusted.
> >=20
> > Make the CPU calibration routine optional, as Xen (very sanely) doesn't
> > assume the CPU runs as the same frequency as the TSC.
> >=20
> > Wrap the helper in an #ifdef to document that the kernel overrides
> > the native routines when running as a VM, and to guard against unwanted
> > usage.=C2=A0 Add a TODO to call out that AMD_MEM_ENCRYPT is a mess and =
doesn't
> > depend on HYPERVISOR_GUEST because it gates both guest and host code.
> >=20
> > No functional change intended.
> >=20
> > Reviewed-by: Michael Kelley <mhklinux@outlook.com>
> > Tested-by: Michael Kelley <mhklinux@outlook.com>
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>=20
> Mildly concerned that we might want to support multiple options =E2=80=94=
 does
> it have CPUID 0x15? Does it have 0x40000x10? Does it have a pvclock?
> There are various permutations of those which are perhaps best handled
> by *trying* each one, in some order, and populating a struct with the
> answers?
>=20
> But on the basis that perfect is the enemy of good,

This has been bothering me too.

Aha!  AHA!  Idea.

... 4 hours later ...

Mhahahaahah, victory is mine!!!!

TL;DR: Overriding x86_platform_ops hooks is dumb.

To your point about making an informed decision, that's essentialy what thi=
s series
is already doing, just in a very roundabout way:

  1. x86_platform.calibrate_{cpu,tsc}() are initialized to "native" version=
s
  2. Hypervisor init code runs and conditionally overrides calibrate_{cpu,t=
sc}()
  3. CoCo init code runs and conditionally overrides calibrate_{cpu,tsc}()

So the ordering you want is already there, as is "trying" each source to so=
me
extent, in the form of steps #2 and #3 overriding the hooks if and only if =
their
source of information is valid.  For all intents and purposes, the hardenin=
g I
was adding by formalizing the calibration overrides was to enforce the abov=
e ordering.

But that's obviously all but impossible to follow, _and_ it's pointless.

For every PV case, including TDX and SNP, "calibration" is simply informati=
on
retrieval, i.e. it never changes (barring broken hypervisors/firmware), and=
 the
information is always available during early boot.

Contrast that with the pre-CPUID CPU frequency calibration, where the frequ=
ency
might change, the kernel is making a best guest based on other timekeeping =
sources,
and not all timekeeping sources are available during early boot.

And so overriding x86_platform.calibrate_{cpu,tsc}() for PV code is complet=
ely
unecessary, because steps #2 and #3 already know the frequency when they ov=
erride
the hooks, and "success" is guaranteed, i.e. the kernel won't have to switc=
h to a
"late" calibration flow.

If we provide x86_hyper_init hooks:

	unsigned int (*get_tsc_khz)(void);
	unsigned int (*get_cpu_khz)(void);

then we can kill off x86_platform.calibrate_{cpu,tsc}() entirely, explicitl=
y
define the preferred ordering (user-forced =3D> CoCo =3D> Hypervisor =3D> n=
ative), and
depup some of the hypervisor code.

E.g. this is what I've got for the early flow.  Testing now.=20

  void __init tsc_early_init(void)
  {
	unsigned int known_cpu_khz =3D 0, known_tsc_khz =3D 0;

	if (!boot_cpu_has(X86_FEATURE_TSC))
		return;
	/* Don't change UV TSC multi-chassis synchronization */
	if (is_early_uv_system())
		return;

	if (x86_init.hyper.get_cpu_khz)
		known_cpu_khz =3D x86_init.hyper.get_cpu_khz();

	if (tsc_early_khz)
		known_tsc_khz =3D tsc_early_khz;
	else if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
		known_tsc_khz =3D snp_secure_tsc_init();
	else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
		known_tsc_khz =3D tdx_tsc_init();

	/*
	 * If the TSC frequency is still unknown, i.e. not provided by the user
	 * or by trusted firmware, try to get it from the hypervisor (which is
	 * untrusted when running as a CoCo guest).
	 */
	if (!known_tsc_khz && x86_init.hyper.get_tsc_khz)
		known_tsc_khz =3D x86_init.hyper.get_tsc_khz();

	if (known_tsc_khz)
		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);

	if (!determine_cpu_tsc_frequencies(true, known_cpu_khz, known_tsc_khz))
		return;
	tsc_enable_sched_clock();
  }

