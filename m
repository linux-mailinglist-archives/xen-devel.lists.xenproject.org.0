Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFA432E6D6
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 11:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93629.176595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI88K-0007aK-K9; Fri, 05 Mar 2021 10:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93629.176595; Fri, 05 Mar 2021 10:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI88K-0007Zv-Gz; Fri, 05 Mar 2021 10:56:36 +0000
Received: by outflank-mailman (input) for mailman id 93629;
 Fri, 05 Mar 2021 10:56:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lI88I-0007Zq-P7
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 10:56:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d06de77-6b4e-428a-bd59-ac21c3bf37cc;
 Fri, 05 Mar 2021 10:56:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E11BAEB3;
 Fri,  5 Mar 2021 10:56:33 +0000 (UTC)
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
X-Inumbo-ID: 4d06de77-6b4e-428a-bd59-ac21c3bf37cc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614941793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/W3UtJWOjRrTeKK5wk4/2/Gl3MyHMnhevMBiZarEcGk=;
	b=AjcTipQLyiPI/l8cdUc37pEjNUD4cVAcooawzpxN5s8uaUMQztwdatruXS7GdU6KbUu1Iz
	RB8BhBvC6mr4qTrtzRz+r6mntMHqLrkjP1Bs5DB+CtD4/ijkA3YV+vRfotx5dCIrpI9jAK
	9ah5PhxOFtr9MrMCknfa+7X/2McLRNk=
Subject: Re: [PATCH v2 for-4.15] x86/msr: introduce an option for HVM relaxed
 rdmsr behavior
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20210304144755.35891-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fc2e724b-bada-ded3-97b4-26e9a0f3ff4a@suse.com>
Date: Fri, 5 Mar 2021 11:56:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304144755.35891-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.03.2021 15:47, Roger Pau Monne wrote:
> Introduce an option to allow selecting a less strict behaviour for
> rdmsr accesses targeting a MSR not explicitly handled by Xen. Since
> commit 84e848fd7a162f669 accesses to MSRs not explicitly handled by
> Xen result in the injection of a #GP to the guest. This is a behavior
> change since previously a #GP was only injected if accessing the MSR
> on the real hardware will also trigger a #GP.
> 
> This commit attempts to offer a fallback option similar to the
> previous behavior. Note however that the value of the underlying MSR
> is never leaked to the guest, as the newly introduced option only
> changes whether a #GP is injected or not.
> 
> Long term the plan is to properly handle all the MSRs, so the option
> introduced here should be considered a temporary resort for OSes that
> don't work properly with the new MSR policy. Any OS that requires this
> option to be enabled should be reported to
> xen-devel@lists.xenproject.org.

While the title says this is limited to HVM guests, I have to admit
that I fail to see why this is, and hence I would have hoped for
some clarification in the description. In particular I don't think
my "guest in early boot" workaround, of which I posted v2 earlier
today, can be assumed to be enough in the longer run. Recall that
it relaxes behavior only when the guest didn't install a handler
for #GP yet - this means it wouldn't help with any unguarded RDMSR
the guest might issue later, with a handler already installed.

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -760,6 +760,13 @@ int arch_domain_create(struct domain *d,
>                 d->domain_id);
>      }
>  
> +    if ( config->arch.domain_flags & ~XEN_X86_RDMSR_RELAXED )
> +    {
> +        printk(XENLOG_G_ERR "d%d: Invalid arch domain flags: %#x\n",
> +               d->domain_id, config->arch.domain_flags);
> +        return -EINVAL;
> +    }

This would look to better go into arch_sanitise_domain_config().
And if the flag remains HVM-only, that aspect should then also be
checked (i.e. the flag being set would then also need rejecting
for PV guests).

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
> @@ -1965,6 +1966,11 @@ static int svm_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
>          break;
>  
>      default:
> +        if ( d->arch.hvm.rdmsr_relaxed && !rdmsr_safe(msr, tmp) )
> +        {
> +            *msr_content = 0;
> +            break;
> +        }

You don't really need "tmp" here, do you? You could as well read
into *msr_content, as you're zapping the value afterwards anyway.

> --- a/xen/include/asm-x86/hvm/domain.h
> +++ b/xen/include/asm-x86/hvm/domain.h
> @@ -122,6 +122,9 @@ struct hvm_domain {
>  
>      bool_t                 is_s3_suspended;
>  
> +    /* Don't unconditionally inject #GP for unhandled MSRs reads. */
> +    bool rdmsr_relaxed;

If, again, this is to remain HVM-only, then you insertion wants
to honor the blank padding other field decls use. I'd also like
to ask for your insertion to be moved up a few lines, to after
"is_in_uc_mode". I have a patch queued already to also move
"is_s3_suspended" into that hole; it's from November last year,
so it looks like I simply forgot to post it.

Jan

