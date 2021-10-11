Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B7942927B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:47:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206167.361676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwZX-00025p-2d; Mon, 11 Oct 2021 14:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206167.361676; Mon, 11 Oct 2021 14:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZwZW-000242-Vk; Mon, 11 Oct 2021 14:46:34 +0000
Received: by outflank-mailman (input) for mailman id 206167;
 Mon, 11 Oct 2021 14:46:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dU1l=O7=google.com=seanjc@srs-us1.protection.inumbo.net>)
 id 1mZwZV-00023w-17
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:46:33 +0000
Received: from mail-pg1-x533.google.com (unknown [2607:f8b0:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29561fa5-a2ab-4b62-9457-b3a92549c0a1;
 Mon, 11 Oct 2021 14:46:32 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id r2so11021463pgl.10
 for <xen-devel@lists.xenproject.org>; Mon, 11 Oct 2021 07:46:32 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id x129sm8062008pfc.140.2021.10.11.07.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 07:46:30 -0700 (PDT)
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
X-Inumbo-ID: 29561fa5-a2ab-4b62-9457-b3a92549c0a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DBJ7ew0y4wvSmKi4WuGSAOH7oUWp7VGZaMnxUGUZnug=;
        b=WUgGM/f+tuPQ7vGNX0cNBBwPv0afu/Zf4dQxhALEj1CWce6SG/QX3MDYljf0Gbuor/
         sj1ONxiUie1VuDLeZqyzP3U8wgCb5jI5/lPjBFHrG3lQw2dxyh3W+h6mZVvyEvJz8G7y
         1nEPJR+H3CxD/4MNWxAGoi6oKI9swc9dOAfsAmuD9ToN3kvenxSiEM2lWlzMHV2o9VoH
         KyJiDN0gZI6nT02ZPzo0daWaK+RTn7Ob4pOSdy5AEMo6f68pgZs/vQbuhgd7TqLjMpzx
         27dHqDzBC8kH05vyX+/CHU4byC6ZoMfjoSir4u7rmWajgW3NJ9i2O+wJZUYyUoDZl7A9
         85aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DBJ7ew0y4wvSmKi4WuGSAOH7oUWp7VGZaMnxUGUZnug=;
        b=oJzSeV4KEeFHm2CO6uSxotEo3JtHugqb5Ok5RP47MtEZazl3P7+9NXkRjBcxVl/Cl+
         VDn+IjJA16baOTpPbjwPO2V/8bS7Gm0fS3Ogp1d7IylbtQc8G5a8+W52ieAR7kU4EZwW
         aMHhnGobAYTKtVCOudNtw7tWxLzaIe+kUuLoSipapGAHY5BhFVDnPbMw2MnlMtNCfO1K
         pmGDKe8kBfaM2iK2Tim1QVbKtz3y7hB9NBJij96JLq0b8esskMx1x4CMgIaWW8GFgLKq
         CtV9/8ieygYZmL9fLks0dcJdrVyjkK4QpBn41wJ+CxCfd7DqFHocMLqYgVk0EMUpCHOT
         k13A==
X-Gm-Message-State: AOAM5328oeD/58zmU0PSeD5QathK2zsv/Gp7Jq8/7Dc8g1hyDNvTiLMd
	1izGqap9Aon+LRrgAl3rTc3dPg==
X-Google-Smtp-Source: ABdhPJy9JeaIFsaMhzjKrm4gRLnqTQlHrSTvgGmlHsrREml2i4T5hhC4ZlLxJitHkoHCOL8HD11SpQ==
X-Received: by 2002:a63:c:: with SMTP id 12mr18698297pga.477.1633963591022;
        Mon, 11 Oct 2021 07:46:31 -0700 (PDT)
Date: Mon, 11 Oct 2021 14:46:25 +0000
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>,
	Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Wanpeng Li <wanpengli@tencent.com>,
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Artem Kashkanov <artem.kashkanov@intel.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>
Subject: Re: [PATCH v3 12/16] KVM: Move x86's perf guest info callbacks to
 generic KVM
Message-ID: <YWROQSGPuPf3wfC9@google.com>
References: <20210922000533.713300-1-seanjc@google.com>
 <20210922000533.713300-13-seanjc@google.com>
 <87wnmjq4y3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wnmjq4y3.wl-maz@kernel.org>

On Mon, Oct 11, 2021, Marc Zyngier wrote:
> On Wed, 22 Sep 2021 01:05:29 +0100, Sean Christopherson <seanjc@google.com> wrote:
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index ed940aec89e0..828b6eaa2c56 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -673,6 +673,14 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
> >  void kvm_perf_init(void);
> >  void kvm_perf_teardown(void);
> >  
> > +#ifdef CONFIG_GUEST_PERF_EVENTS
> > +static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
> 
> Pardon my x86 ignorance, what is PMI? PMU Interrupt?

Ya, Performance Monitoring Interrupt.  I didn't realize the term wasn't common
perf terminology.  Maybe kvm_arch_perf_events_in_guest() to be less x86-centric?

> > +{
> > +	/* Any callback while a vCPU is loaded is considered to be in guest. */
> > +	return !!vcpu;
> > +}
> > +#endif
> 
> Do you really need this #ifdef?

Nope, should compile fine without it, though simply dropping the #ifdef would make
make the semantics of the function wrong, even if nothing consumes it.  Tweak it
to use IS_ENABLED()?

	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;

