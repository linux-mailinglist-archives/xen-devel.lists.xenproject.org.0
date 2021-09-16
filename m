Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A946C40ECB8
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 23:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188769.338074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQz4q-00063P-Ld; Thu, 16 Sep 2021 21:37:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188769.338074; Thu, 16 Sep 2021 21:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQz4q-00061J-IK; Thu, 16 Sep 2021 21:37:52 +0000
Received: by outflank-mailman (input) for mailman id 188769;
 Thu, 16 Sep 2021 21:37:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BmaE=OG=google.com=seanjc@srs-us1.protection.inumbo.net>)
 id 1mQz4o-00060u-9N
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 21:37:50 +0000
Received: from mail-pj1-x102b.google.com (unknown [2607:f8b0:4864:20::102b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 088a6a5e-c2ac-448f-ac8f-fd5c79fec54f;
 Thu, 16 Sep 2021 21:37:49 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id k23so5541415pji.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Sep 2021 14:37:49 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id t15sm4013977pgk.13.2021.09.16.14.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 14:37:47 -0700 (PDT)
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
X-Inumbo-ID: 088a6a5e-c2ac-448f-ac8f-fd5c79fec54f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HRmclIUd+IXQYZmIP/8HeB41v2sSRX/lMU3hqPZHzVc=;
        b=Y5uK5usJpzBqYTtETIZzqzrlpEcCGhV1j72nBokzqPxRHfzfqcv9p8/VHqtByMLMa0
         7qnKk2mXRWZ/QVGLWlLUF5fmAtrANk6SVsEq1yvp8Onbj0l+EW2VdhbQ4ssaqq3XvXG+
         UIKM1VSQcdm2YELLCqHTNz0YRbJwYR+FmuDGCbuEaAumq4dsS2jCwrqpahV4jYDPFBXn
         +EFOprbkB9HNvtLDp/UkAPEYfLhp0RIxcvNz5Sev+mrGTECnwFfzaEXBv/uyDuKWSXl9
         MKEl69zQIthFjeiLPFYtD50iSHjTDfTtVEJ8PfVuNwd6e3VXHqiBdyMOjirUU+xrvFcM
         TwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HRmclIUd+IXQYZmIP/8HeB41v2sSRX/lMU3hqPZHzVc=;
        b=tMquEV7csHpPHpZqP9tYArW9smEKMOOvLZOtvYEVwuaalIUnbVb7hBnujox2uhE6BN
         vMTnqmjoDYktQ51USVN0u6xE5+LEHVu7LW79FawaAmGgvKe9rFT3DPXYWjGw1P6XMtg1
         uKTrQEaCiZ2EUQJR+bb0u1WcUTnBBCSjG+j4mMdDyp27IdOANQlUHe+x/7whCL5gYH/t
         pTyKCrxLzyl+rZjTiIZ0+AhWECrtS9DWBqCKD9MgjsHR2EAxP4Czxxduz3SquQ7Pknln
         EGj41t97F5CNb1Be6CWPzou8NKrUB686BB9hR0PpL9G6K6zhKO4hbdz2xI9HeYnga5ZJ
         7LUA==
X-Gm-Message-State: AOAM531ipQKbatYZUxciHf+s5j1SAMpwn9Nb6EuPErHZmkUHS8u+cioN
	1X6ucgcyAapNueQTF744sDwNiA==
X-Google-Smtp-Source: ABdhPJxrNs7jIZy34jmkRTyON4Y+9pNnsbkx7GECTLo7e1rXLwAWohi0Xxo5Jb11PEVRFoL9wO4HSQ==
X-Received: by 2002:a17:90b:1291:: with SMTP id fw17mr6609537pjb.135.1631828268138;
        Thu, 16 Sep 2021 14:37:48 -0700 (PDT)
Date: Thu, 16 Sep 2021 21:37:43 +0000
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
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
Subject: Re: [PATCH v2 00/13] perf: KVM: Fix, optimize, and clean up callbacks
Message-ID: <YUO5J/jTMa2KGbsq@google.com>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828201336.GD4353@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828201336.GD4353@worktop.programming.kicks-ass.net>

On Sat, Aug 28, 2021, Peter Zijlstra wrote:
> On Fri, Aug 27, 2021 at 05:35:45PM -0700, Sean Christopherson wrote:
> > Like Xu (2):
> >   perf/core: Rework guest callbacks to prepare for static_call support
> >   perf/core: Use static_call to optimize perf_guest_info_callbacks
> > 
> > Sean Christopherson (11):
> >   perf: Ensure perf_guest_cbs aren't reloaded between !NULL check and
> >     deref
> >   KVM: x86: Register perf callbacks after calling vendor's
> >     hardware_setup()
> >   KVM: x86: Register Processor Trace interrupt hook iff PT enabled in
> >     guest
> >   perf: Stop pretending that perf can handle multiple guest callbacks
> >   perf: Force architectures to opt-in to guest callbacks
> >   KVM: x86: Drop current_vcpu for kvm_running_vcpu + kvm_arch_vcpu
> >     variable
> >   KVM: x86: More precisely identify NMI from guest when handling PMI
> >   KVM: Move x86's perf guest info callbacks to generic KVM
> >   KVM: x86: Move Intel Processor Trace interrupt handler to vmx.c
> >   KVM: arm64: Convert to the generic perf callbacks
> >   KVM: arm64: Drop perf.c and fold its tiny bits of code into arm.c /
> >     pmu.c

Argh, sorry, I somehow managed to miss all of your replies.  I'll get back to
this series next week.  Thanks for the quick response!

> Lets keep the whole intel_pt crud inside x86...

In theory, I like the idea of burying intel_pt inside x86 (and even in Intel+VMX code
for the most part), but the actual implementation is a bit gross.  Because of the
whole "KVM can be a module" thing, either the static call and __static_call_return0
would need to be exported, or a new register/unregister pair would have to be exported.

The unregister path would also need its own synchronize_rcu().  In general, I
don't love duplicating the logic, but it's not the end of the world.

Either way works for me.  Paolo or Peter, do either of you have a preference?

> ---
> Index: linux-2.6/arch/x86/events/core.c
> ===================================================================
> --- linux-2.6.orig/arch/x86/events/core.c
> +++ linux-2.6/arch/x86/events/core.c
> @@ -92,7 +92,7 @@ DEFINE_STATIC_CALL_RET0(x86_pmu_guest_ge
>  
>  DEFINE_STATIC_CALL_RET0(x86_guest_state, *(perf_guest_cbs->state));
>  DEFINE_STATIC_CALL_RET0(x86_guest_get_ip, *(perf_guest_cbs->get_ip));
> -DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, *(perf_guest_cbs->handle_intel_pt_intr));
> +DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, unsigned int (*)(void));

FWIW, the param needs to be a raw function, not a function pointer. 

