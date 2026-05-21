Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EZNMblsD2qOLAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 22:36:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FAA5ABCF7
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 22:36:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315914.1585556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQA7a-0001Z2-NX; Thu, 21 May 2026 20:35:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315914.1585556; Thu, 21 May 2026 20:35:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQA7a-0001WL-Kc; Thu, 21 May 2026 20:35:58 +0000
Received: by outflank-mailman (input) for mailman id 1315914;
 Thu, 21 May 2026 20:35:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3qWwPagYKCRgG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 1wQA7Z-0001WD-2p
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 20:35:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQA7Y-004QRX-Bf
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 22:35:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3qWwPagYKCRgG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 6a0f6c6b-5cb7-0a2a0a5109dd-0a2a45068c0e-42
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 22:35:56 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3qWwPagYKCRgG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 6a0f6caa-7371-0a2a45060019-d155d6c9ecb0-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 22:35:56 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2baf7378ad0so68158605ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 13:35:55 -0700 (PDT)
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
        d=google.com; s=20251104; t=1779395754; x=1780000554; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipWhDnS3c8Of+slJErBTF5Vqt6ODkaCbWe9MFVov0zI=;
        b=ntZh7ZXBaSWRovqlpnIIgMPqdo4tu3T694iSQ13t9k3MjuKmkiemJ2X4FwkET2PuY+
         wuhmdYYaDOwT9dVloSv3eWUWq8VK0hyJVw80qTsDMlhH5Wj0dCvLcdk4uF82uWwxGDas
         lzeK83bpH7quj3SaT6BX2HvOWFI2icv4P2N8A+GDoSSc//4XWJHLXbk75VCBf6sux1/t
         Z/NeQiAsHTl1QzpnnSBNK3JqSKL/qEpRoVstu9bycH65ZdJhzI8Ls+16Lc5lUtvEcxBD
         lamocgY/GEx5jcUiYFexm0Kn+LACONtRufcgQxguaQVuA4lgueeOgXcW3aTRlGCuIkC+
         Yd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779395754; x=1780000554;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ipWhDnS3c8Of+slJErBTF5Vqt6ODkaCbWe9MFVov0zI=;
        b=AcH+W1v0kMmJ/sAKjHl1xPqBQNwCl/tn+XLg7MvFLSJlMJaQE6mzS4abm74DP2YMpU
         +3STs+qNv9u5zsYNRbxvTceFDy/82HUZ1kFoeWPLgxmvHA33mH15Hk6VN+nCEGRnCDDC
         FOWCl8lpbPiT9d0WlZ4sW8K2/wctHUFE/xYduuh43iwPZhUTAjkwrAff8vryRF7Z+LD8
         M6Kpzp/+rp3uMj8NUHI7yt1wuKNl4JfGgUWsmCDttadBwxdPJhz+Tx4xvdydCaa5/PJK
         64B/6c8dbNadQlgvhmE6nUT2SIKvb7RvmGZmU+VCPIszqm57Uxt0CDnXfpBRoQo1GozS
         YRzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/qO7K6H25Araqe+h0JW/TEHA8RGz7UwrYrmjd9HR6l26MuAkCIKaB22DMRfc6qKNAItfHwqPGQdGc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlrHZYkfPtP/gBbjRTVTJ8PoF0VnzvIsHrygJrAWwMLo+GKYn5
	hsNja88+Bpw1zBu0N0vgtVXtCvG6CNTTCEAo5MmfIKd1blL9s7/TFaKzOr7a/RAWZWBR2Aguw+0
	E7ofRHg==
X-Received: from pglv7.prod.google.com ([2002:a63:1507:0:b0:c80:192c:51ff])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d491:b0:3b2:8677:813e
 with SMTP id adf61e73a8af0-3b328ec5909mr476744637.42.1779395753857; Thu, 21
 May 2026 13:35:53 -0700 (PDT)
Date: Thu, 21 May 2026 13:35:53 -0700
In-Reply-To: <13d79ba1e0450068c9573ccd8deb3ec007aea8d6.camel@infradead.org>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-30-seanjc@google.com>
 <13d79ba1e0450068c9573ccd8deb3ec007aea8d6.camel@infradead.org>
Message-ID: <ag9sqdLCAqJwaaE-@google.com>
Subject: Re: [PATCH v3 29/41] x86/paravirt: Plumb a return code into __paravirt_set_sched_clock()
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
X-purgate-ID: tlsNG-16d1c6/1779395756-8D387D75-F3CD5B9E/0/0
X-purgate-type: clean
X-purgate-size: 909
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,microsoft.com,broadcom.com,siemens.com,linux.intel.com,infradead.org,suse.com,google.com,intel.com,oracle.com,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de];
	FORGED_RECIPIENTS(0.00)[m:dwmw2@infradead.org,m:kas@kernel.org,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
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
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 73FAA5ABCF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> > Add a return code to __paravirt_set_sched_clock() so that the kernel ca=
n
> > reject attempts to use a PV sched_clock without breaking the caller.=C2=
=A0 E.g.
> > when running as a CoCo VM with a secure TSC, using a PV clock is genera=
lly
> > undesirable.
> >=20
> > Note, kvmclock is the only PV clock that does anything "extra" beyond
> > simply registering itself as sched_clock, i.e. is the only caller that
> > needs to check the new return value.
> >=20
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
>=20
> Oooh... can we use this to reject the kvmclock when we have a stable
> and reliable TSC even for non-CoCo guests?

Yes, but I would much rather "fix" kvmclock to not even attempt to register=
 itself
as the sched_clock (which this series does).

