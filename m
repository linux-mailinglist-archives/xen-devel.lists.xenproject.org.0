Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11E2A2641A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 20:53:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880986.1291090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tf2V9-0003Pi-DH; Mon, 03 Feb 2025 19:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880986.1291090; Mon, 03 Feb 2025 19:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tf2V9-0003O8-AD; Mon, 03 Feb 2025 19:52:59 +0000
Received: by outflank-mailman (input) for mailman id 880986;
 Mon, 03 Feb 2025 19:52:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ioxk=U2=flex--seanjc.bounces.google.com=3lh6hZwYKCZsN95IE7BJJBG9.7JHS9I-89Q9GGDNON.S9IKMJE97O.JMB@srs-se1.protection.inumbo.net>)
 id 1tf2V7-0003O2-IA
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 19:52:57 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75c6f418-e268-11ef-a0e7-8be0dac302b0;
 Mon, 03 Feb 2025 20:52:56 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-216405eea1fso97317515ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 11:52:56 -0800 (PST)
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
X-Inumbo-ID: 75c6f418-e268-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738612374; x=1739217174; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4DCNVElxq2OdBlpMH7Nkzbl/aQqIemXOZXJQi0SM/U=;
        b=RViBIQ41cPhBqtOuMYTlf35djqnhH72w/txNh7yZr/QuBTQtgSKYYsOfMS6w1yE5k/
         wSOsCudXiw/7w+A3OZAjuygvSTrJRoxdJSirjLVYgLwHMEqF+NocNfSq56FaOc4q9qkp
         wdchPZ532sK9fZSFs9yPV0oQE6qIWp4hX4Zuk3H7rkY/KqIC61ds1ccQ4Dyz6YR5Lf9E
         kl8RXgxrY+DNqF8oQ6WHpmfpJXOVIuc+ETTi8H6VLudhHXqN4O0vxsg89kmlnAhJTisy
         hUjWOyLPTTfWtqzgP7aBI7L6ozkjFzCqr8IjN4RUcNLz6YAvLvDnTul3abPb//N64fqW
         UjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738612374; x=1739217174;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4DCNVElxq2OdBlpMH7Nkzbl/aQqIemXOZXJQi0SM/U=;
        b=hyshlrJ0gcUgxU3UeD61WM78beS3Fovi+8sDHHdUp7n8NJxV1kcmuMpvmfdM7hcapf
         pgRACb2oaEFYCcBY0WPDrjv5ePqusWQf6QxRDJDw3e2BazMvZK2A+8+BeA6KAm+phEuP
         PrsQZKb6bv1A2/R/pYV6Jgc99w5imLyF13rMVq4g9LPMgf6YscBa2AiDR5xc9Hhe/IjD
         ZHnoHqGt5e3vrAftoEzJD/gODK0XUJUDUX0fnyUjmIpwZgXbIxzr04hjLz1fjbWEiILm
         fXFBUG+7GgPucLAr3WcqvpTcY6aeZthFiSd+wBHTB0+mc5a5kBUu2EHCguBNLZJJ09Lf
         n1iw==
X-Forwarded-Encrypted: i=1; AJvYcCWULZOfbyqh0U6wQVR0SHGSUQ33j3+3pWUfmK2GzTEJqex6MpPYElG6579zepPYc2hR4BMKZKRbeKI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7CLMLdX6dwazLMmpxfSpPzRzvhpBajUl4zZV0GPwfK5FLBrrv
	Dgun0DImuQ/ZBCVnHB/1ormMBA+fvJdrIpPp6dnQPpK7baMrrUAhPMGG543SJJpgE4+OheMp8ai
	vpQ==
X-Google-Smtp-Source: AGHT+IGdTeFcZ8i5SvZ2bB5g1492lleQh9maGoQBlpXj01DaF5LbzkfV8PQhJ2gBHFVfNpv3sg2ev2woN1U=
X-Received: from pfsq1.prod.google.com ([2002:a05:6a00:2a1:b0:72d:4132:7360])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2287:b0:72d:a208:d366
 with SMTP id d2e1a72fcca58-72fd0c8bae3mr33309743b3a.20.1738612374524; Mon, 03
 Feb 2025 11:52:54 -0800 (PST)
Date: Mon, 3 Feb 2025 11:52:53 -0800
In-Reply-To: <fb1d32fb-f213-350f-95a4-766c88a6249c@amd.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-9-seanjc@google.com>
 <fb1d32fb-f213-350f-95a4-766c88a6249c@amd.com>
Message-ID: <Z6EelTYbVIcmGH5Q@google.com>
Subject: Re: [PATCH 08/16] x86/tsc: Pass KNOWN_FREQ and RELIABLE as params to registration
From: Sean Christopherson <seanjc@google.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, jailhouse-dev@googlegroups.com, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Feb 03, 2025, Tom Lendacky wrote:
> On 1/31/25 20:17, Sean Christopherson wrote:
> > Add a "tsc_properties" set of flags and use it to annotate whether the
> > TSC operates at a known and/or reliable frequency when registering a
> > paravirtual TSC calibration routine.  Currently, each PV flow manually
> > sets the associated feature flags, but often in haphazard fashion that
> > makes it difficult for unfamiliar readers to see the properties of the
> > TSC when running under a particular hypervisor.
> > 
> > The other, bigger issue with manually setting the feature flags is that
> > it decouples the flags from the calibration routine.  E.g. in theory, PV
> > code could mark the TSC as having a known frequency, but then have its
> > PV calibration discarded in favor of a method that doesn't use that known
> > frequency.  Passing the TSC properties along with the calibration routine
> > will allow adding sanity checks to guard against replacing a "better"
> > calibration routine with a "worse" routine.
> > 
> > As a bonus, the flags also give developers working on new PV code a heads
> > up that they should at least mark the TSC as having a known frequency.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/coco/sev/core.c       |  6 ++----
> >  arch/x86/coco/tdx/tdx.c        |  7 ++-----
> >  arch/x86/include/asm/tsc.h     |  8 +++++++-
> >  arch/x86/kernel/cpu/acrn.c     |  4 ++--
> >  arch/x86/kernel/cpu/mshyperv.c | 10 +++++++---
> >  arch/x86/kernel/cpu/vmware.c   |  7 ++++---
> >  arch/x86/kernel/jailhouse.c    |  4 ++--
> >  arch/x86/kernel/kvmclock.c     |  4 ++--
> >  arch/x86/kernel/tsc.c          |  8 +++++++-
> >  arch/x86/xen/time.c            |  4 ++--
> >  10 files changed, 37 insertions(+), 25 deletions(-)
> > 
> 
> > diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
> > index d6f079a75f05..6e4a2053857c 100644
> > --- a/arch/x86/kernel/cpu/vmware.c
> > +++ b/arch/x86/kernel/cpu/vmware.c
> > @@ -385,10 +385,10 @@ static void __init vmware_paravirt_ops_setup(void)
> >   */
> >  static void __init vmware_set_capabilities(void)
> >  {
> > +	/* TSC is non-stop and reliable even if the frequency isn't known. */
> >  	setup_force_cpu_cap(X86_FEATURE_CONSTANT_TSC);
> >  	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
> 
> Should this line be deleted, too, or does the VMware flow require this
> to be done separate from the tsc_register_calibration_routines() call?

No idea, I just didn't want to break existing setups.  I assume VMware hypervisors
will always advertise the TSC frequency, but nothing in the code guarantees that.

The check on the hypervisor providing the TSC frequency has existed since the
original support was added, and the CONSTANT+RELIABLE logic was added immediately
after.  So even if it the above code _shouldn't_ be needed, I don't want to be
the sucker that finds out :-)

  395628ef4ea12ff0748099f145363b5e33c69acb x86: Skip verification by the watchdog for TSC clocksource.
  eca0cd028bdf0f6aaceb0d023e9c7501079a7dda x86: Add a synthetic TSC_RELIABLE feature bit.
  88b094fb8d4fe43b7025ea8d487059e8813e02cd x86: Hypervisor detection and get tsc_freq from hypervisor

