Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739303F9B1C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173762.317027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJdB9-0003yA-Ea; Fri, 27 Aug 2021 14:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173762.317027; Fri, 27 Aug 2021 14:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJdB9-0003wB-BN; Fri, 27 Aug 2021 14:49:59 +0000
Received: by outflank-mailman (input) for mailman id 173762;
 Fri, 27 Aug 2021 14:49:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4zmw=NS=google.com=seanjc@srs-us1.protection.inumbo.net>)
 id 1mJdB8-0003w5-4W
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:49:58 +0000
Received: from mail-pj1-x1033.google.com (unknown [2607:f8b0:4864:20::1033])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e321015-096b-4d2c-be67-84e060c4f7b5;
 Fri, 27 Aug 2021 14:49:57 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id fz10so4728213pjb.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Aug 2021 07:49:55 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id x4sm6940653pff.126.2021.08.27.07.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 07:49:54 -0700 (PDT)
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
X-Inumbo-ID: 1e321015-096b-4d2c-be67-84e060c4f7b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=14M76fSGlvACgnYuGU3A/x3DEJPAcKiBE8JXzhdP/4U=;
        b=pLAL3YBvEH241wYB1s4aywKaz7QeJRhSbGv+nktb/1x+GCOg0VVDMExMGUZWmZPsDc
         NVzspVTDa3lSW0dyJijr23zu+7tSFARHT4kxKiTs7I83HrgoOR9ZjAM+CS/Hri3F1VJJ
         2cgbzigcjgD1FFxs8iuFU4QSJYpY905pXBKXs7PumwcHwyCCbOr2tLcIMDqqbkJHwm7W
         OY/wxvG8MYV6F0/ygGfrV94k17Tq04+ngUI3kmNaGgMrAB+BvHmQiIoMrL8UQ47WIDLc
         HbsUHl+jyqAkK128CP0oKREgIRQL0mf5zrS45lyHYrnz5h3QUE60Siq/ksEiSLoHHDKJ
         dUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=14M76fSGlvACgnYuGU3A/x3DEJPAcKiBE8JXzhdP/4U=;
        b=MyqWKP+jv1xMpezlucY9XrbaUKEmngo/gIQ0BbJgd8XqYuQ4AJ8dJsgfksoPmJZsgD
         3pcj8TndvNFIHb+wlgfRgIdC0PTRwTxM7gSC9yBA6SUINrPnbI5cwEA4tZlYQOcYOiw0
         WM+i1ExJC92b3HWOxgnSkZ/myD5EDFXmOyYFPI3jVuHxkNyM8lxFsF4SapF1sPZa2gHr
         4vNUbXnC87MYineMaehGiSvLJ8s3ThsJskog7qQZhRl8U4QVSjQOYU5zzDyEa0BwdKvB
         T1MbC9x5wvdGAG3kJx4l+g8fNUkVsNrlGZoC/zzXWP3qrH7fI6qWHL/njrs0+dbNuW4Z
         CsVw==
X-Gm-Message-State: AOAM531TEB2Qw2XFi64UaCUgQEBsQF0oq6dc/Bej3HqSn2oxkTS+GnLn
	sKpv40uf/499veev3RpYWeQ/tg==
X-Google-Smtp-Source: ABdhPJwNNMMmz636sWquZ+PrJBprWwR45xsHh4a4A1+VNHMucrkqN70WbnI4m5X0u5NEISGgHsWDDA==
X-Received: by 2002:a17:90a:1b0d:: with SMTP id q13mr23772297pjq.217.1630075794782;
        Fri, 27 Aug 2021 07:49:54 -0700 (PDT)
Date: Fri, 27 Aug 2021 14:49:50 +0000
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
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
Subject: Re: [PATCH 05/15] perf: Track guest callbacks on a per-CPU basis
Message-ID: <YSj7jq32U8Euf38o@google.com>
References: <20210827005718.585190-1-seanjc@google.com>
 <20210827005718.585190-6-seanjc@google.com>
 <YSiRBQQE7md7ZrNC@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSiRBQQE7md7ZrNC@hirez.programming.kicks-ass.net>

On Fri, Aug 27, 2021, Peter Zijlstra wrote:
> On Thu, Aug 26, 2021 at 05:57:08PM -0700, Sean Christopherson wrote:
> > Use a per-CPU pointer to track perf's guest callbacks so that KVM can set
> > the callbacks more precisely and avoid a lurking NULL pointer dereference.
> 
> I'm completely failing to see how per-cpu helps anything here...

It doesn't help until KVM is converted to set the per-cpu pointer in flows that
are protected against preemption, and more specifically when KVM only writes to
the pointer from the owning CPU.  

> > On x86, KVM supports being built as a module and thus can be unloaded.
> > And because the shared callbacks are referenced from IRQ/NMI context,
> > unloading KVM can run concurrently with perf, and thus all of perf's
> > checks for a NULL perf_guest_cbs are flawed as perf_guest_cbs could be
> > nullified between the check and dereference.
> 
> No longer allowing KVM to be a module would be *AWESOME*. I detest how
> much we have to export for KVM :/
> 
> Still, what stops KVM from doing a coherent unreg? Even the
> static_call() proposed in the other patch, unreg can do
> static_call_update() + synchronize_rcu() to ensure everybody sees the
> updated pointer (would require a quick audit to see all users are with
> preempt disabled, but I think your using per-cpu here already imposes
> the same).

Ignoring static call for the moment, I don't see how the unreg side can be safe
using a bare single global pointer.  There is no way for KVM to prevent an NMI
from running in parallel on a different CPU.  If there's a more elegant solution,
especially something that can be backported, e.g. an rcu-protected pointer, I'm
all for it.  I went down the per-cpu path because it allowed for cleanups in KVM,
but similar cleanups can be done without per-cpu perf callbacks.

As for static calls, I certainly have no objection to employing static calls for
the callbacks, but IMO we should not be relying on static call for correctness,
i.e. the existing bug needs to be fixed first.

