Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DE1332432
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 12:36:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95368.180046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJafM-0000N1-Ly; Tue, 09 Mar 2021 11:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95368.180046; Tue, 09 Mar 2021 11:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJafM-0000Mb-Hk; Tue, 09 Mar 2021 11:36:44 +0000
Received: by outflank-mailman (input) for mailman id 95368;
 Tue, 09 Mar 2021 11:36:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bv84=IH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJafK-0000MM-NT
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 11:36:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 899e468c-dfb4-421e-9ceb-1ab0cee4fc57;
 Tue, 09 Mar 2021 11:36:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C580DACBF;
 Tue,  9 Mar 2021 11:36:40 +0000 (UTC)
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
X-Inumbo-ID: 899e468c-dfb4-421e-9ceb-1ab0cee4fc57
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615289801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXEzlaOlJLycLmInSeoM0EvI4anAtdTKFIbfgVgmMUo=;
	b=aL+cGoN25Kl0mkXsI5tAJ37hriZAmVSh52E6naCPnm2HcuTYR7Q0PrxQDKvO98vmPEALEN
	9Ky+dfsg31n1i13q4SOckULrIkgtTJyMa4iPAl/pSgQIZikVg1Wws+anK89KJhSOJ75GZ9
	UGKaZstTpMQa/R6s3GyAXZhqsewCMm4=
Subject: Re: [PATCH v3 for-4.15] x86/msr: introduce an option for compatible
 MSR behavior selection
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20210309105634.7200-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37e82170-8097-1eda-95d9-23d235075a67@suse.com>
Date: Tue, 9 Mar 2021 12:36:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309105634.7200-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.03.2021 11:56, Roger Pau Monne wrote:
> Introduce an option to allow selecting a behavior similar to the pre
> Xen 4.15 one for accesses to MSRs not explicitly handled. Since commit
> 84e848fd7a162f669 and 322ec7c89f6640e accesses to MSRs not explicitly
> handled by Xen result in the injection of a #GP to the guest. This
> is a behavior change since previously a #GP was only injected if
> accessing the MSR on the real hardware would also trigger a #GP, or if
> the attempted to be set bits wouldn't match the hardware values (for
> PV).
> 
> This seems to be problematic for some guests, so introduce an option
> to fallback to this kind of legacy behavior without leaking the
> underlying MSR values to the guest.
> 
> When the option is set, for both PV and HVM don't inject a #GP to the
> guest on MSR read if reading the underlying MSR doesn't result in a
> #GP, do the same for writes and simply discard the value to be written
> on that case.
> 
> Note that for guests restored or migrated from previous Xen versions
> the option is enabled by default, in order to keep a compatible
> MSR behavior. Such compatibility is done at the libxl layer, to avoid
> higher-level toolstacks from having to know the details about this flag.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I'm generally okay with this approach, but wouldn't want to give it
my R-b until it's at least clear it's not entirely unacceptable to
anyone else (Andrew in particular). Couple of remarks:

> Changes since v2:
>  - Apply the option to both HVM and PV guest.
>  - Handle both reads and writes.

I take it that it's intentional that you didn't allow separate read
and write control?

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1795,6 +1795,7 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>      const struct domain *d = v->domain;
>      struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
>      const struct nestedsvm *nsvm = &vcpu_nestedsvm(v);
> +    uint64_t tmp;
>  
>      switch ( msr )
>      {

While to some degree a matter of taste, I think such variables needed
only inside a switch() and not needing an initializer would better
live in the respective switch()'s scope.

> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -875,6 +875,7 @@ static int read_msr(unsigned int reg, uint64_t *val,
>      const struct domain *currd = curr->domain;
>      const struct cpuid_policy *cp = currd->arch.cpuid;
>      bool vpmu_msr = false;
> +    uint64_t tmp;
>      int ret;
>  
>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
> @@ -986,6 +987,12 @@ static int read_msr(unsigned int reg, uint64_t *val,
>          }
>          /* fall through */
>      default:
> +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, tmp) )
> +        {
> +            *val = 0;
> +            return X86EMUL_OKAY;
> +        }
> +
>          gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
>          break;
>  
> @@ -1148,6 +1155,9 @@ static int write_msr(unsigned int reg, uint64_t val,
>          }
>          /* fall through */
>      default:
> +        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, val) )
> +            return X86EMUL_OKAY;
> +
>          gdprintk(XENLOG_WARNING,
>                   "WRMSR 0x%08x val 0x%016"PRIx64" unimplemented\n",
>                   reg, val);

So what are your thoughts wrt my change to this file? Drop it
altogether and require people to use this new option? Or do you
see both coexist? In the latter case, since you had suggested
that I drop the write side of my change - does your changing of
the write path indicate you've changed your mind?

Jan

