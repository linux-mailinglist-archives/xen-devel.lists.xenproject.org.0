Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFfVLKeAC2pvIgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 23:12:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9D6573A8E
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 23:12:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312248.1582392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP5Fe-0000cp-Aj; Mon, 18 May 2026 21:11:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312248.1582392; Mon, 18 May 2026 21:11:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wP5Fe-0000aI-7s; Mon, 18 May 2026 21:11:50 +0000
Received: by outflank-mailman (input) for mailman id 1312248;
 Mon, 18 May 2026 21:11:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3kYALagYKCRgG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 1wP5Fc-0000aC-NY
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 21:11:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wP5Fc-00FfbF-06
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 23:11:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3kYALagYKCRgG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 6a0b8076-e002-0a2a0a5209dd-0a2a450590fc-32
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 23:11:47 +0200
Received: from [209.85.214.201] (helo=mail-pl1-f201.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <3kYALagYKCRgG2yB704CC492.0CAL2B-12J2996GHG.L2BDFC720H.CF4@flex--seanjc.bounces.google.com>)
 id 6a0b8092-aaa8-0a2a45050019-d155d6c9c474-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 23:11:47 +0200
Received: by mail-pl1-f201.google.com with SMTP id
 d9443c01a7336-2ba3245a43dso29499985ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 14:11:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779138706; x=1779743506; darn=lists.xenproject.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M0HR0/OeCt5J6wDdP6oTOA3/U+zZIegjjUJa8wpeaiw=;
        b=oHa+fhmoEyvGpMxzcJoQbuLyHNZk6Kc2g4bme75/EsQzqLW7As0RohEzxvTbtFL17i
         i0ZJ6kfo7I2sU2rC+Tvvvv7QnGDhJ2fF/CElTc8u6bBej4EaK4sDQmjJhfRWctE0U8vs
         VcvQ73XBAvDw+JP5+UY7RzOd8luHTussH6IvPXNZt3Es6Kdbdc4PKo1QePag6HxJvBOj
         Py8q7q0+RUAwcjfBcs3qFcz1wk9sBW+lmRAoq8UPRTbukmTRJCmIpvBDCCSfZIx3J70Q
         18GdmiP8k/x0u0vRFwwZQy97OjdKUPucK9YsM9HgCI8jWc10rbC1MnhdXLRncMdCoUYK
         dxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779138706; x=1779743506;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M0HR0/OeCt5J6wDdP6oTOA3/U+zZIegjjUJa8wpeaiw=;
        b=nOOCVSdY4P1qrnw7bgtd7UCHFcLsjIUMH7pUUD9dVP10qTMn3gVkuy1R9NDkf8FWqa
         awUc+w4P4xaPjSX+xHs0hMDykebz3iKMS0MWjCiNu1IOsjhwkrXYVfi7fRRjOi0G60z6
         ySDISS8KHRwfghtO+FX6INtdLocqey+UZKR+epsSpqTaBqCoN0cpgiYdKKIQhauVUXMS
         YP4O9vFi0lN5s568TidCj0dhI5Nnpy0gS3QluKnrbyhDxQ73oC+oPPXwpGLVC9V3v/an
         8sqbd68CsZkbT/Zt0GYrNCXFGTglJ4V9Izi6AgQv23y7Z2kiu7Z0MtQIHjqVQduM+1Mr
         eWxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qMAigoBmFAF5syJhYRi5Qu05JsMGfkMGPTWSX4A3TpfBM4IjdFK1cqBfYGUjLwHg7hmUIBn+BR2E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBzifZ9E1ombSqeXusaCUs4paIir3XSvnBonFF7rSVy58wVxxY
	3p1J5PqTeo4zR+YoWZRDEbTmEHESs88X0yKMw0hlmgauF9xM9V1KJuoTX8N15G9AMq1NqwzA4PH
	m1zU7zw==
X-Received: from plhq16.prod.google.com ([2002:a17:903:11d0:b0:2b2:43c2:a183])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:11c4:b0:2bd:9766:bd2b
 with SMTP id d9443c01a7336-2bd9766be37mr135740745ad.19.1779138705542; Mon, 18
 May 2026 14:11:45 -0700 (PDT)
Date: Mon, 18 May 2026 14:11:44 -0700
In-Reply-To: <20260515191942.1892718-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com>
Message-ID: <aguAkMTrkSVPthal@google.com>
Subject: Re: [PATCH v3 00/41] x86: Try to wrangle PV clocks vs. TSC
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
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
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="us-ascii"
X-purgate-ID: tlsNG-c201ff/1779138707-E0A66443-D63935C1/0/0
X-purgate-type: clean
X-purgate-size: 1577
X-Spamd-Result: default: False [-0.69 / 15.00];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kas@kernel.org,m:pbonzini@redhat.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:tglx@kernel.org,m:jstultz@google.com,m:rick.p.edgecombe@intel.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:x86@kernel.org,m:linux-coco@lists.linux.dev,m:kvm@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:mhklinux@outlook.com,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:tglx@linutronix.de,m:dwmw@amazon.co.uk,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,microsoft.com,broadcom.com,siemens.com,linux.intel.com,infradead.org,suse.com,google.com,intel.com,oracle.com,lists.linux.dev,vger.kernel.org,lists.xenproject.org,outlook.com,amd.com,linutronix.de,amazon.co.uk];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2A9D6573A8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 15, 2026, Sean Christopherson wrote:
> Dave/Thomas/Peter/Boris, what's the going rate for bribes to take something
> like this through the tip tree?  
> 
> The bulk of the changes are in kvmclock and TSC, but pretty much every
> hypervisor's guest-side code gets touched at some point.  I am reaonsably
> confident in the correctness of the KVM changes.  Michael tested Hyper-V in
> v2, and while there were conflicts when rebasing, they were largely
> superficial (and I've just jinxed myself).  For all other hypervisors, assume
> the code is compile-tested only, but those changes are all quite small and
> straightforward.
> 
> The only changes that are questionable/contentious are the last two patches,
> which have KVM-as-a-guest use CPUID 0x16 to get the CPU frequency, even on
> AMD (that's the dubious part).  I very deliberately put them last, so that
> they can be dropped at will (I don't care terribly if those patches land).
> To merge them, I would want explicit Acks from Paolo and David W.
> 
> So, except for the last two patches, to get the stuff I really care about
> landed, I think/hope it's just the TSC and guest-side CoCo changes that need
> reviews/acks?

FYI, don't bother reviewing this version.  Sashiko found several glaring flaws,
but I just realized that sashiko-bot's emails are only being sent to myself and
linux-hyperv@vger.kernel.org.  I'll make sure to highlight the changes in the
next version.

In the meantime, Sashiko's feedback is archived on lore if you want to see me
get torched by AI :-)

