Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7600340ED5F
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 00:31:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188801.338121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQzu9-00061N-LX; Thu, 16 Sep 2021 22:30:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188801.338121; Thu, 16 Sep 2021 22:30:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQzu9-0005z8-IC; Thu, 16 Sep 2021 22:30:53 +0000
Received: by outflank-mailman (input) for mailman id 188801;
 Thu, 16 Sep 2021 22:30:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BmaE=OG=google.com=seanjc@srs-us1.protection.inumbo.net>)
 id 1mQzu7-0005yk-QR
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 22:30:51 +0000
Received: from mail-pf1-x42a.google.com (unknown [2607:f8b0:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c867e3d-7d09-4fd7-894e-c9a69cc21db6;
 Thu, 16 Sep 2021 22:30:50 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id x7so7239345pfa.8
 for <xen-devel@lists.xenproject.org>; Thu, 16 Sep 2021 15:30:50 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id b1sm3951150pjl.4.2021.09.16.15.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 15:30:49 -0700 (PDT)
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
X-Inumbo-ID: 8c867e3d-7d09-4fd7-894e-c9a69cc21db6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SbpJPJ4GLHhtaxBB1xHIdRhJVAuKGVRHlo9Wp9BtXvg=;
        b=igafNvMA1/3Bo/Hn8R9+USa5il0ulFxjx+nPIh2XyZCbl93vTOyT82CSDzdcKRJJgO
         FkJ5tfOZgSqPwIB2uy13Vsv6TyxDZo5SSSg6NO0tCl0m6iggfHrPIgqTtDvi9KZvPNYG
         8S05G6PCVB/DKu6Qps+LsPTZQ05wevCQFNZ+BICkpGZZdeZrOwvM4eNTBKGGZV/zaEby
         /Uo1noNrpUpRnME+TSkjRKmfn4qrb0maTPZTyYR72JBGteB/DiewqWAa7W2K5Npk1E/o
         h4Ealz2zUj5Dq5lsSJIpFakB2CCLO0hEG1zQ+M9xbiD1cysQ1HBn46apv1+McHJBcrYb
         Amkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SbpJPJ4GLHhtaxBB1xHIdRhJVAuKGVRHlo9Wp9BtXvg=;
        b=59nd1ceaspCwzX7w3Mv86OQVxNXb0FVHc5ra7AN93doYd9zhQ3d5VN++eTLYyvoZIE
         VEh+LnotO2Y6zGxG8Js6vm3LPxjLGmX2Y7ZuQTrt4ZbeHCp6Fn5i9QUkEbVgBD/nAKV9
         RnGeRBmQjmxc2CnTUhGKySnC0HdL8xLTJAr0cVWtrBkcka3zR/Ewe8HLwPOZ6atht9ub
         iA/E1wZFHy75MWInajoml5GcqYTLAVoySXzpprre8hR84HRGL+OHhf0dALbLzs3zg4Kg
         G88TN+MBL2OzoBZ1+ojR5PE4bWKUlRFVFRZxZY/PMZieaht3HQlbPMJ+foqn1ac0pdX8
         q0LQ==
X-Gm-Message-State: AOAM533lbYKwd1g/Q3ZfVH+6FNT8ZpFhoQ4mxFuZ9VE6nZzg2llLfiBY
	hMAq9POTwkEF06zX27PCNwqt5w==
X-Google-Smtp-Source: ABdhPJx9Zno3oAszEpQSd/n4PnO2QNAuNkUGb12hjpp8HsLen9cxO4C/uNjsvLGvYRAHddpH9w+INQ==
X-Received: by 2002:a63:6ec9:: with SMTP id j192mr7022031pgc.115.1631831449675;
        Thu, 16 Sep 2021 15:30:49 -0700 (PDT)
Date: Thu, 16 Sep 2021 22:30:45 +0000
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
Subject: Re: [PATCH v2 05/13] perf: Force architectures to opt-in to guest
 callbacks
Message-ID: <YUPFlb6r1udRKcBH@google.com>
References: <20210828003558.713983-1-seanjc@google.com>
 <20210828003558.713983-6-seanjc@google.com>
 <20210828194752.GC4353@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210828194752.GC4353@worktop.programming.kicks-ass.net>

On Sat, Aug 28, 2021, Peter Zijlstra wrote:
> On Fri, Aug 27, 2021 at 05:35:50PM -0700, Sean Christopherson wrote:
> > diff --git a/init/Kconfig b/init/Kconfig
> > index 55f9f7738ebb..9ef51ae53977 100644
> > --- a/init/Kconfig
> > +++ b/init/Kconfig
> > @@ -1776,6 +1776,9 @@ config HAVE_PERF_EVENTS
> >  	help
> >  	  See tools/perf/design.txt for details.
> >  
> > +config HAVE_GUEST_PERF_EVENTS
> > +	bool
> 	depends on HAVE_KVM
> 
> ?

Ah, nice!  We can go even further to:

	depends on HAVE_PERF_EVENTS && HAVE_KVM

though I'm pretty sure all architectures that select HAVE_KVM also select
HAVE_PERF_EVENTS.

Huh.  arm64 doesn't select HAVE_KVM even though it selects almost literally every
other HAVE_KVM_* config.  arm64 has some other weirdness with CONFIG_KVM, I'll add
a patch or two to fix that stuff and amend this patch as above.

Thanks again!

