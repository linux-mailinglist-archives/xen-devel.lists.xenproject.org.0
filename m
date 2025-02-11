Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B9A31150
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 17:28:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885751.1295555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tht7Z-000663-Q8; Tue, 11 Feb 2025 16:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885751.1295555; Tue, 11 Feb 2025 16:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tht7Z-00064I-NT; Tue, 11 Feb 2025 16:28:25 +0000
Received: by outflank-mailman (input) for mailman id 885751;
 Tue, 11 Feb 2025 16:28:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rIg+=VC=flex--seanjc.bounces.google.com=3pXqrZwYKCYw8uq3zsw44w1u.s42Du3-tuBu11y898.Du3574zus9.47w@srs-se1.protection.inumbo.net>)
 id 1tht7Y-00064C-IJ
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 16:28:24 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35d95168-e895-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 17:28:23 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fa480350a5so6307236a91.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 08:28:23 -0800 (PST)
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
X-Inumbo-ID: 35d95168-e895-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739291302; x=1739896102; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5MEK/stSb+AMRyC9Zhx6OFHXRnHPVcvklj9Pc8LhwOQ=;
        b=ryE7n77Fdx56qKzCPijkBHPhQhzrH1aAp4d/OpmDkQPRJa8njSSEMO0BdSABtoZLxZ
         9O8ygyzEdP5POAi3Aq/hMhTQ1JUQAew9Qew0/FhJC82Qd5Q0DMpnjowzY4J6AHCPHDxn
         /uNX4/2qiDVsbcnArOf6k/hNMvKC2j4GgtOYgPDjxsUj3De7L6WX31ydom4d8iPa6HaE
         jeaVErUpbSQYfyzsqmUoETjIMQhz+eqHsevQkA5QzqDtdmWeviLORQjcYYe7/PcKw0Vt
         Aem+VZXguq79SsyWfceQymEGabXgRb9wMScb1H5f4FVhv2XvBXdWRC7oqFqGgnoMvROv
         +a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291302; x=1739896102;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5MEK/stSb+AMRyC9Zhx6OFHXRnHPVcvklj9Pc8LhwOQ=;
        b=chbqIuqZqOBHfYz0EdTljfM1l70lIlzLyYfVscEUzWTNEbqiA3+FGc2FXCIF5l5nMC
         ys1RhaG4FtWHEPqIzea7IiCBxAGtYHJFTOdIHyNDSbZIjCxZs4Wx7Z1IGozeKxliPOVK
         qN8ACqIxbIzjttXw2yvvPUv8miK6INezB2uCRc8faoy8HaA3jolH9zdTBNy9A0/jiG98
         k70LZ3/ub8gglGmPMz27Xaow6qN4xzO9XGHACIEuSRKw4OPiJxdhx9N9QnXTATtNhXbK
         kOdF2iG3f2eo0QBgNaeGCY+K9MhtviRvW9GY2/QmuZKWnK+sGpDA0rhHq1DK859rSpa3
         Z02w==
X-Forwarded-Encrypted: i=1; AJvYcCUMPdvw+9oUqVEfHUr7ByxrA6u7Z5im612LoCt9f3gj8phSE3V1MV7rzXgGox8pCnkrxi4beiT26XY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/U5byaXsBS6Ki6NrHWoOVKVCruvF2OesI2a8Jiz8SUO85AVTH
	CSH6yTURPr8fqAUmnq3SaMxhubfUUZ0t6ZdvyQUHZVAF0L1EzXFLuWMMvkjvngPfCeg4sdtK+cs
	u9g==
X-Google-Smtp-Source: AGHT+IEW6FT5SzWSOj0JB0UAPg+blRK0ibYMj54XT+2rd1e326WroNU4nUmkSnUDL4aqV/75Jp14hq1SYiM=
X-Received: from pfrc11.prod.google.com ([2002:aa7:8e0b:0:b0:730:7648:7a74])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:188f:b0:732:2170:b69a
 with SMTP id d2e1a72fcca58-7322170b72bmr3189092b3a.18.1739291301572; Tue, 11
 Feb 2025 08:28:21 -0800 (PST)
Date: Tue, 11 Feb 2025 16:28:20 +0000
In-Reply-To: <20250211143919.GBZ6thF2Ryx-D2YpDz@fat_crate.local>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250211143919.GBZ6thF2Ryx-D2YpDz@fat_crate.local>
Message-ID: <Z6t6pMgAjHckWMs_@google.com>
Subject: Re: [PATCH 00/16] x86/tsc: Try to wrangle PV clocks vs. TSC
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
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
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 11, 2025, Borislav Petkov wrote:
> On Fri, Jan 31, 2025 at 06:17:02PM -0800, Sean Christopherson wrote:
> > And if the host provides the core crystal frequency in CPUID.0x15, then KVM
> > guests can use that for the APIC timer period instead of manually
> > calibrating the frequency.
> 
> Hmm, so that part: what's stopping the host from faking the CPUID leaf? I.e.,
> I would think that actually doing the work to calibrate the frequency would be
> more reliable/harder to fake to a guest than the guest simply reading some
> untrusted values from CPUID...

Not really.  Crafting an attack based on timing would be far more difficult than
tricking the guest into thinking the APIC runs at the "wrong" frequency.  The
APIC timer itself is controlled by the hypervisor, e.g. the host can emulate the
timer at the "wrong" freuquency on-demand.  Detecting that the guest is post-boot
and thus done calibrating is trivial.

> Or are we saying here: oh well, there are so many ways for a normal guest to
> be lied to so that we simply do the completely different approach and trust
> the HV to be benevolent when we're not dealing with confidential guests which
> have all those other things to keep the HV honest?

This.  Outside of CoCo, the hypervisor is 100% trusted.  And there's zero reason
for the hypervisor to lie, it can simply read/write all guest state.

