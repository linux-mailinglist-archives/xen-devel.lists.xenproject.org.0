Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5/HYJYBpKGqpDgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 21:29:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4554A663B09
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 21:29:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=qP9JOyxy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=google.com
Received: from list by lists.xenproject.org with outflank-mailman.1333814.1596986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX288-00056P-Ih; Tue, 09 Jun 2026 19:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333814.1596986; Tue, 09 Jun 2026 19:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wX288-00053d-FB; Tue, 09 Jun 2026 19:28:56 +0000
Received: by outflank-mailman (input) for mailman id 1333814;
 Tue, 09 Jun 2026 19:28:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3c2koagYKCUAugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@flex--seanjc.bounces.google.com>)
 id 1wX286-00053X-NJ
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 19:28:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wX286-00E9kZ-4J
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 21:28:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3c2koagYKCUAugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@flex--seanjc.bounces.google.com>)
 id 6a28696a-bab6-0a2a0a5309dd-0a2a450b910e-16
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 21:28:54 +0200
Received: from [209.85.216.73] (helo=mail-pj1-f73.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3c2koagYKCUAugcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@flex--seanjc.bounces.google.com>)
 id 6a286974-212f-0a2a450b0019-d155d849bc5a-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 21:28:53 +0200
Received: by mail-pj1-f73.google.com with SMTP id
 98e67ed59e1d1-36d982d932aso7369106a91.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 12:28:53 -0700 (PDT)
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
        d=google.com; s=20251104; t=1781033332; x=1781638132; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=guAeemkMCkyys/PJ2ZLLCH34LSaDcqFIXbZHYNdXwyE=;
        b=qP9JOyxyAjmg0eRalWSkkHIVIknItf8kV/V2C5Cx7bp1X90yZIvAzoyFmVhfAF3/Rc
         sMi4EatI4joKq8J4Qdiyzw3MR0wd6SMyR648DZzra28qGEKzREGYSzTh0Hq64gzw4Ygv
         ElDGda2mU2ISicxQYzAv4B6o9id0Twfk2EYerbHDVqJ1Ow/f9XKIcCYTaKGy9MFNLG6H
         twc5WpARPyQvo9FpjPl182rWKYa15PNqrJ1mltgQbrIyFSEZCydSE5qqy96p6OfLvqwc
         RSsHPym6PSdFk/6PyaQfMd8dnyn9uot4yYp8qI5H2LJf+tP43kg89Pd02fVTYbT+xgM2
         AtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781033332; x=1781638132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=guAeemkMCkyys/PJ2ZLLCH34LSaDcqFIXbZHYNdXwyE=;
        b=SxvLQoXFNA5dHRJwNgVUgOkVSnidDNshi0SkITeFP0wP0Ceh+eoTuIv1lnYX00OzhT
         JeU8WjK+bk+y0xg+iX09R2p5pZAAd73UD1vhq3UV1pO0e3M6HKHblJ2cgJdmrINWtYfW
         6LgsCDMj08yqDY7DqD7Y0S1QhcKFPUIXTLhuU7kr2BL9FC1xFR2aETZalLrjorDrLQme
         MBo/jtI5j0W2eOnb3eeHLBDOws+HnMcmAA0lw1qNxk0xf1kxhlNvabxXPLqncm1DQmI1
         gCJ2jcMwrlqPswCeUhgbTtCgNLnU3CIOOB2IBqil1rNUd0DjsqKzZJ5+GlAi205Ropu6
         9Fmg==
X-Forwarded-Encrypted: i=1; AFNElJ+VzflAn9hKQXmh4eMRIuA4kqyFQns9uQLnrn6XW6tGf8IWivwvjCI1eJhycrdBBc06qpDBnzYTUPI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcjCSkI+ECvNYXelR2qUXiYtPbNjpmbcs1mNPdTZ73WTeMgJZX
	EAQlGgxI9t4N/NKniFb4fpudtpBXhSwZOmU5cZyB+f5E5x2ZOD/F/PCU3F073YrpxyG2MHn7U+a
	o7bscKQ==
X-Received: from pjbgq16.prod.google.com ([2002:a17:90b:1050:b0:36d:c3f4:8460])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:390c:b0:36d:f28b:72e2
 with SMTP id 98e67ed59e1d1-370ef2ec248mr22562261a91.8.1781033331787; Tue, 09
 Jun 2026 12:28:51 -0700 (PDT)
Date: Tue, 9 Jun 2026 12:28:50 -0700
In-Reply-To: <20260602034916.GGah5SvARd77mkvxe3@fat_crate.local>
Mime-Version: 1.0
References: <20260529144435.704127-1-seanjc@google.com> <20260529144435.704127-3-seanjc@google.com>
 <20260602034916.GGah5SvARd77mkvxe3@fat_crate.local>
Message-ID: <aihpch8FG6Esl3Jx@google.com>
Subject: Re: [PATCH v4 02/47] x86/tsc: Add a standalone helpers for getting
 TSC info from CPUID.0x15
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
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
	xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-42698a/1781033334-19D6FF3B-25255361/0/0
X-purgate-type: clean
X-purgate-size: 1032
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[redhat.com,kernel.org,linux.intel.com,microsoft.com,broadcom.com,siemens.com,infradead.org,suse.com,google.com,zytor.com,intel.com,oracle.com,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amazon.co.uk,amd.com,outlook.com,linutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bp@alien8.de,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:hpa@zytor.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:dwmw@amazon.co.uk,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw2@infradead.org,m:mhklinux@outlook.com,m:tglx@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
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
X-Rspamd-Queue-Id: 4554A663B09

On Mon, Jun 01, 2026, Borislav Petkov wrote:
> On Fri, May 29, 2026 at 07:43:49AM -0700, Sean Christopherson wrote:
> > +static int cpuid_get_tsc_info(struct cpuid_tsc_info *info)
> > +{
> > +	unsigned int ecx_hz, edx;
> > +
> > +	memset(info, 0, sizeof(*info));
> 
> Let's not clear this unnecessarily...
> 
> > +
> > +	if (boot_cpu_data.cpuid_level < CPUID_LEAF_TSC)
> > +		return -ENOENT;
> 
> ... just to return here...
> 
> > +
> > +	/* CPUID 15H TSC/Crystal ratio, plus optionally Crystal Hz */
> > +	cpuid(CPUID_LEAF_TSC, &info->denominator, &info->numerator, &ecx_hz, &edx);
> > +
> > +	if (!info->denominator || !info->numerator)
> > +		return -ENOENT;
> 
> ... or here.
> 
> We wanna clear it here, when we'll return success.

Actually, if we take the approach of relying on the user to check the return
code, then there's no need to zero the struct since all fields will be explicitly
written, especially if we drop the "tsc_khz" field.  I was zeroing the field
purely as defense in depth.

