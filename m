Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MN7SI4N2D2pEMgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 23:17:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D125AC155
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 23:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315961.1585591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQAlm-0002px-Bq; Thu, 21 May 2026 21:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315961.1585591; Thu, 21 May 2026 21:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQAlm-0002ne-8t; Thu, 21 May 2026 21:17:30 +0000
Received: by outflank-mailman (input) for mailman id 1315961;
 Thu, 21 May 2026 21:17:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3ZXYPagYKCeYaMIVRKOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@flex--seanjc.bounces.google.com>)
 id 1wQAlk-0002jc-QY
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 21:17:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQAlk-000AZp-6Y
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 23:17:28 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3ZXYPagYKCeYaMIVRKOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@flex--seanjc.bounces.google.com>)
 id 6a0f763e-5cb7-0a2a0a5109dd-0a2a4504d9aa-28
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:17:28 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3ZXYPagYKCeYaMIVRKOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@flex--seanjc.bounces.google.com>)
 id 6a0f7666-1dec-0a2a45040019-d155d6cae497-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 23:17:27 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2ba718173d1so113083305ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:17:27 -0700 (PDT)
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
        d=google.com; s=20251104; t=1779398246; x=1780003046; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jW9XtyrtynBxdJYPv96DfQ4Rw5zedPSv+/BbmcgSxI=;
        b=jScUDgRSeCSqlprq8ADZS69zrw6EHpR7+DvzGX+K5pm1f7kLoNFg5jmRri0ZhIQ/S+
         MXnIGLlDG1YMRteNRDeWw998Pa5++VqZDcHSO/apEdRiWikUWuX/+6rVeru7Zcq7ANhh
         RswIVz2C4X3LNE7KFr29tlg9InNNkII3lRoaMW2hCYu3YDJHFQHw1jDcsTQU6NUz0t76
         gLeFuxKzgF7Aem1vQWbTZoz6lAYh3jps8pm85etF5GR98aXTSUoegN4tD7KVB6I9uGqp
         9+5C+m+jYSOHg+fidPJHHDHwQpt0EwgUMXhBzrKdLvoHcqyYrhZpbr2G5qhUioB2jYk7
         TUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779398246; x=1780003046;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/jW9XtyrtynBxdJYPv96DfQ4Rw5zedPSv+/BbmcgSxI=;
        b=sdRgSQDvidb9zenTUiRmY8c2Pd3K0tBdIhiE8nt4KHLYv3agjjuUore0CazBtLirFp
         z7BPbOCwb9aIDGA2xzhwr1FvCtS14tTv0aM6pQD6ZND82vOk01d/BktBMSRXKVCvq1Ou
         I9yEW0PyXV77IjCLhqIqHFlInpv/A5bMRWj4DrnJTIVryejvSDrI8nd4rTf7qz9xvNL0
         Lnk3gqqnEee7YCWkDjyeGCrDGsPxN27+V6Vt+nFV2WQqqN9k590zzeZtzybCtM0rUfrS
         0LTyyL1SditBuNOdpm/hXGEuYxlFlCs9tSyhfLg/rvQL6HW9tYpdz//izpD0wh52MmWx
         ehSg==
X-Forwarded-Encrypted: i=1; AFNElJ8VTSEvQ+1hCVfsuV9FFLgjcessFFKAXCX7eSIhEMbsFbCehqz76u/CVt4by0hhQUMYast4jQTXpV4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoIlQ8Wl9uZbDGkRDxdiV1gj47urtBSkJpgfVDpp67IEl8Pzvc
	Z4gGs7u4dr30HMiO2AxD5xwxBej3hOyNHb8nQnSLIj9trvizWtVW5C+qjdsS1RzT9PcaxwmDZJJ
	hU+4hOQ==
X-Received: from plbkh13.prod.google.com ([2002:a17:903:64d:b0:2b0:c78a:4537])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ccd0:b0:2b4:5f19:1d34
 with SMTP id d9443c01a7336-2beb05eec0amr6266755ad.17.1779398245853; Thu, 21
 May 2026 14:17:25 -0700 (PDT)
Date: Thu, 21 May 2026 14:17:25 -0700
In-Reply-To: <342098f6bfe1e4c7b233433df8f79713b4220614.camel@infradead.org>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-3-seanjc@google.com>
 <44e0d60548d317fd59895f18bd17220dfb2f834b.camel@infradead.org>
 <ag9wz3RiJOtVZrK0@google.com> <342098f6bfe1e4c7b233433df8f79713b4220614.camel@infradead.org>
Message-ID: <ag92Ze_FADmL1llo@google.com>
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
X-purgate-ID: tlsNG-ebf023/1779398248-40F753FF-922242DB/0/0
X-purgate-type: clean
X-purgate-size: 2245
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[34];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 02D125AC155
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026, David Woodhouse wrote:
> On Thu, 2026-05-21 at 13:53 -0700, Sean Christopherson wrote:
> >=20
> > E.g. this is what I've got for the early flow.=C2=A0 Testing now.=20
> >=20
> > =C2=A0 void __init tsc_early_init(void)
> > =C2=A0 {
> > 	unsigned int known_cpu_khz =3D 0, known_tsc_khz =3D 0;
> >=20
> > 	if (!boot_cpu_has(X86_FEATURE_TSC))
> > 		return;
> > 	/* Don't change UV TSC multi-chassis synchronization */
> > 	if (is_early_uv_system())
> > 		return;
> >=20
> > 	if (x86_init.hyper.get_cpu_khz)
> > 		known_cpu_khz =3D x86_init.hyper.get_cpu_khz();
> >=20
> > 	if (tsc_early_khz)
> > 		known_tsc_khz =3D tsc_early_khz;
> > 	else if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
> > 		known_tsc_khz =3D snp_secure_tsc_init();
> > 	else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
> > 		known_tsc_khz =3D tdx_tsc_init();
> >=20
> > 	/*
> > 	 * If the TSC frequency is still unknown, i.e. not provided by the use=
r
> > 	 * or by trusted firmware, try to get it from the hypervisor (which is
> > 	 * untrusted when running as a CoCo guest).
> > 	 */
> > 	if (!known_tsc_khz && x86_init.hyper.get_tsc_khz)
> > 		known_tsc_khz =3D x86_init.hyper.get_tsc_khz();
> >=20
> > 	if (known_tsc_khz)
> > 		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
> >=20
> > 	if (!determine_cpu_tsc_frequencies(true, known_cpu_khz, known_tsc_khz)=
)
> > 		return;
> > 	tsc_enable_sched_clock();
> > =C2=A0 }
>=20
> That seems reasonable. Where does the call to native_calibrate_tsc()
> happen; is that from determine_cpu_tsc_frequencies()?=20

Yep.

static bool __init determine_cpu_tsc_frequencies(bool early,
						 unsigned int known_cpu_khz,
						 unsigned int known_tsc_khz)
{
	/* Make sure that cpu and tsc are not already calibrated */
	WARN_ON(cpu_khz || tsc_khz);

	if (early) {
		/*
		 * Early CPU calibration can only use methods that are available
		 * early in boot (obviously).
		 */
		if (known_cpu_khz)
			cpu_khz =3D known_cpu_khz;
		else
			cpu_khz =3D native_calibrate_cpu_early();
		if (known_tsc_khz)
			tsc_khz =3D known_tsc_khz;
		else
			tsc_khz =3D native_calibrate_tsc();
	} else {
		cpu_khz =3D pit_hpet_ptimer_calibrate_cpu();
	}

	...

