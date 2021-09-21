Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BAD413C77
	for <lists+xen-devel@lfdr.de>; Tue, 21 Sep 2021 23:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191910.342067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSnKv-0004gj-Gj; Tue, 21 Sep 2021 21:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191910.342067; Tue, 21 Sep 2021 21:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSnKv-0004df-DY; Tue, 21 Sep 2021 21:29:57 +0000
Received: by outflank-mailman (input) for mailman id 191910;
 Tue, 21 Sep 2021 21:29:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uuut=OL=google.com=seanjc@srs-us1.protection.inumbo.net>)
 id 1mSnKt-0004dW-IZ
 for xen-devel@lists.xenproject.org; Tue, 21 Sep 2021 21:29:55 +0000
Received: from mail-pj1-x1033.google.com (unknown [2607:f8b0:4864:20::1033])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b956dcc-2d48-4d64-93c4-6905fbb6f63b;
 Tue, 21 Sep 2021 21:29:54 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id dw14so546266pjb.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 14:29:54 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id w142sm103618pfc.47.2021.09.21.14.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 14:29:52 -0700 (PDT)
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
X-Inumbo-ID: 9b956dcc-2d48-4d64-93c4-6905fbb6f63b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LSn/kFygvp1Gc7LYRPSl9USN2eKVUYYqQK80C4S3HbY=;
        b=btxgeKmkbIeI+ZpOc6VlwSC4J1M0NxXCmAKO/nawCIYSv8cbGywGkAH3QCnwAqLAUI
         IOyxlnQF3u2reCho4aOS27m8AURN66z+f1gzEN4gfB+N1/w2JLIXtC4yGrRdYBUrXdWC
         Vx/SNzr0zgBg66Mt5tqVTWXtqNRo1cMW1HRk7P6/aIgQitN5dojnf/rmx3fJsNEBiKh4
         2oG4JdRFZ1cCImM5O4stFWaGUi4+BBk4LEDc8ZYoSTyQQ09FyLfXbzxkQRIwj2f3Y1ux
         qkOUO+HshbP+1GDpYX5TBWF68F9+FWvzry5+DIxEzwl/5EC5N4EFZsnTQtNpn8FiRBGK
         Np7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LSn/kFygvp1Gc7LYRPSl9USN2eKVUYYqQK80C4S3HbY=;
        b=70UGbx1MaPktxKoVGjiCDqLF6qJqd9nsKq8mS1KBbuce1/XppzLrSJoIZG6stnNWT2
         X7C4K4VAnmOCzzSEGEuXfTTfh+QrTo5kybnTzpk5rqWiG7/gN4N2w0/RDjW6VHSVBYlE
         OUGB2uBaFRD9Y5o92/zVrQ03NdwZ+nqcJRdC9IKl+/Bo9Sv9xLCu8tpvceRwwPi+TMEb
         Wmkz70AKpkbhBxmQd60I/brIirRecwEZWsN5biXuvNZm4chrOQ9s64H2Ne0FhDvpv2Fz
         +5+YFPH/o2tMEM3hC5+i7TUeb6XnDiFRfDHBxVJFt89nrJzOLXdOPsLmdVYdnSyXh60i
         tNtg==
X-Gm-Message-State: AOAM533cPGa9tms5RvF1kDwkYUkIZECoKNpG7ARzC5vkqMiH3SwbzzT+
	do+ZKf+oH7X8FHbJRHj2ir8S+g==
X-Google-Smtp-Source: ABdhPJzMgcR9UgCsbvPuA/02v4FkJblQW9htJs47A2YRdbvRMs4AQG7O660EDIsBZdZMmGrIa23JJg==
X-Received: by 2002:a17:902:bf42:b0:13d:b79f:a893 with SMTP id u2-20020a170902bf4200b0013db79fa893mr8518959pls.1.1632259793364;
        Tue, 21 Sep 2021 14:29:53 -0700 (PDT)
Date: Tue, 21 Sep 2021 21:29:48 +0000
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	Artem Kashkanov <artem.kashkanov@intel.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v2 05/13] perf: Force architectures to opt-in to guest
 callbacks
Message-ID: <YUpOzFW3K3iJAoWa@google.com>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828003558.713983-6-seanjc@google.com>
 <20210828194752.GC4353@worktop.programming.kicks-ass.net>
 <8ee13a69-f2c4-2413-2d6c-b6c0a559286e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ee13a69-f2c4-2413-2d6c-b6c0a559286e@redhat.com>

On Tue, Sep 21, 2021, Paolo Bonzini wrote:
> On 28/08/21 21:47, Peter Zijlstra wrote:
> > > +config HAVE_GUEST_PERF_EVENTS
> > > +	bool
> > 	depends on HAVE_KVM
> 
> It won't really do anything, since Kconfig does not detects conflicts
> between select' and 'depends on' clauses.

It does throw a WARN, though the build doesn't fail.

WARNING: unmet direct dependencies detected for HAVE_GUEST_PERF_EVENTS
  Depends on [n]: HAVE_KVM [=n] && HAVE_PERF_EVENTS [=y]
  Selected by [y]:
  - ARM64 [=y]

WARNING: unmet direct dependencies detected for HAVE_GUEST_PERF_EVENTS
  Depends on [n]: HAVE_KVM [=n] && HAVE_PERF_EVENTS [=y]
  Selected by [y]:
  - ARM64 [=y]

WARNING: unmet direct dependencies detected for HAVE_GUEST_PERF_EVENTS
  Depends on [n]: HAVE_KVM [=n] && HAVE_PERF_EVENTS [=y]
  Selected by [y]:
  - ARM64 [=y]

> Rather, should the symbol be selected by KVM, instead of ARM64 and X86?

By KVM, you mean KVM in arm64 and x86, correct?  Because HAVE_GUEST_PERF_EVENTS
should not be selected for s390, PPC, or MIPS.

Oh, and Xen also uses the callbacks on x86, which means the HAVE_KVM part is
arguabably wrong, even though it's guaranteed to be true for the XEN_PV case.
I'll drop that dependency and send out a separate series to clean up the arm64
side of HAVE_KVM.

The reason I didn't bury HAVE_GUEST_PERF_EVENTS under KVM (and XEN_PV) is that
there are number of references to the callbacks throught perf and I didn't want
to create #ifdef hell.

But I think I figured out a not-awful solution.  If there are wrappers+stubs for
the guest callback users, then the new Kconfig can be selected on-demand instead
of unconditionally by arm64 and x86.  That has the added bonus of eliminating
the relevant code paths for !KVM (and !XEN_PV on x86), with or without static_call.
It also obviates the needs for __KVM_WANT_GUEST_PERF_EVENTS or whatever I called
that thing.

It more or less requires defining the static calls in generic perf, but I think
that actually ends up being good thing as it consolidates more code without
introducing more #ifdefs.  The diffstats for the static_call() conversions are
also quite nice.

 include/linux/perf_event.h | 28 ++++++----------------------
 kernel/events/core.c       | 15 +++++++++++++++
 2 files changed, 21 insertions(+), 22 deletions(-)

I'll try to get a new version out today or tomorrow.

