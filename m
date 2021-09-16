Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4639340ECC2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 23:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188776.338085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQz80-0007Q7-4v; Thu, 16 Sep 2021 21:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188776.338085; Thu, 16 Sep 2021 21:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQz80-0007Nk-1i; Thu, 16 Sep 2021 21:41:08 +0000
Received: by outflank-mailman (input) for mailman id 188776;
 Thu, 16 Sep 2021 21:41:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BmaE=OG=google.com=seanjc@srs-us1.protection.inumbo.net>)
 id 1mQz7z-0007Ne-AW
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 21:41:07 +0000
Received: from mail-pl1-x631.google.com (unknown [2607:f8b0:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 133a1bce-1998-46de-ae64-6ab81342fef7;
 Thu, 16 Sep 2021 21:41:06 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id f21so4789521plb.4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Sep 2021 14:41:06 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id z11sm4163558pff.144.2021.09.16.14.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 14:41:04 -0700 (PDT)
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
X-Inumbo-ID: 133a1bce-1998-46de-ae64-6ab81342fef7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=H6MB2ODxA8ncTb3aji91NU1uUQ9q1AebxOl6ENeKyck=;
        b=MXQC+ZfLxlKAl3MhEJW1BaTu7x3eZBr25vDIOP4P1K/hKKNsBxR9bYAbQrcXeqx0IT
         UwrZDJawrFH60RbkF94BswFhIwo0cou0aN+gLacubbeU6IcTTMJrkdfHEYWn3Q3CVBfY
         FWOlqrCFMP2DA28EATBAk/sg6Cxl8pCwP9qJHgGrwzQTOnAwwW0mxDrD/8RBAtDi8Sen
         7O4AbiMouCC1KnoWzOLrohcS9Vtb2Dd0sBl4eKlMlTi8+NrzRnGujJOfnGMsmwaTYUXB
         tHZDCMU2HvcsbXJF8DOiqaPVnBEOB3kiFk+1tNf5dSr4/Tt9/mMCbKmuD1xBAf0iTv/g
         rERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H6MB2ODxA8ncTb3aji91NU1uUQ9q1AebxOl6ENeKyck=;
        b=yjoE+1br+58vp8BuDViQInopId4wYFIS3uOEx3fcwAjOYYI2ELUiVeZGhRMGa8bpTg
         WJrAbbVogpLLng/XmxO0fRvklcw8ll6B+bDu9SiR+PlAHiByYrCl6oGUrM2Jb9cl4Iht
         +SpL0MMhVIScM0vgBZabG/ZheIg96INb9e+JXjSt/BA1bdpwmMJ97WpNqhWkypP86PHu
         mdtU+y30ankARF7w2WTq4cFhH9dkiQ1NhfCGZaXv8QQNdth4udnjIiAJpkaA3x26iNsh
         jlf9fXV6W+yz3cRXiCU4lxLJw9EfcYnIPRNDzcWfJr9PjabVA3HE3U3GQyJDTpBt43aj
         TIYg==
X-Gm-Message-State: AOAM533gSA4jgKutF8c7Yr0+9ia1x5+lXthavIZw4C5AUPmkTKQQe8BW
	XDE75az6A8TtRZBOke6ooVongw==
X-Google-Smtp-Source: ABdhPJyEB8CLbdwiUNdfZdvrZtOKbQbkduopskaqSrtZd3BkA7cXNgyeY28844ULJzTSWyVMUXnICw==
X-Received: by 2002:a17:903:244e:b0:13c:802d:92c with SMTP id l14-20020a170903244e00b0013c802d092cmr6486996pls.78.1631828465371;
        Thu, 16 Sep 2021 14:41:05 -0700 (PDT)
Date: Thu, 16 Sep 2021 21:41:01 +0000
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
Subject: Re: [PATCH v2 01/13] perf: Ensure perf_guest_cbs aren't reloaded
 between !NULL check and deref
Message-ID: <YUO57TlEGlUk2Q03@google.com>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828003558.713983-2-seanjc@google.com>
 <20210828194421.GB4353@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828194421.GB4353@worktop.programming.kicks-ass.net>

On Sat, Aug 28, 2021, Peter Zijlstra wrote:
> On Fri, Aug 27, 2021 at 05:35:46PM -0700, Sean Christopherson wrote:
> > diff --git a/kernel/events/core.c b/kernel/events/core.c
> > index 464917096e73..2126f6327321 100644
> > --- a/kernel/events/core.c
> > +++ b/kernel/events/core.c
> > @@ -6491,14 +6491,19 @@ struct perf_guest_info_callbacks *perf_guest_cbs;
> >  
> >  int perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
> >  {
> > -	perf_guest_cbs = cbs;
> > +	if (WARN_ON_ONCE(perf_guest_cbs))
> > +		return -EBUSY;
> > +
> > +	WRITE_ONCE(perf_guest_cbs, cbs);
> > +	synchronize_rcu();
> 
> You're waiting for all NULL users to go away? :-) IOW, we can do without
> this synchronize_rcu() call.

Doh, right.  I was thinking KVM needed to wait for in-progress NMI to exit to
ensure guest PT interrupts are handled correctly, but obviously the NMI handler
needs to exit for that CPU to get into a guest...

> >  	return 0;
> >  }
> >  EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
> >  
> >  int perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
> >  {
> > -	perf_guest_cbs = NULL;
> 
> 	if (WARN_ON_ONCE(perf_guest_cbs != cbs))
> 		return -EBUSY;
> 
> ?

Works for me.  I guess I'm more optimistic about people not being morons :-)

