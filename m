Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oC4yHcObj2mORwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 22:46:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273A2139AA9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 22:46:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231894.1536821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr0za-0004fs-CF; Fri, 13 Feb 2026 21:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231894.1536821; Fri, 13 Feb 2026 21:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr0za-0004eO-9B; Fri, 13 Feb 2026 21:46:26 +0000
Received: by outflank-mailman (input) for mailman id 1231894;
 Fri, 13 Feb 2026 21:46:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9cwp=AR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vr0zY-0004eI-Cf
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 21:46:24 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d084236-0925-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 22:46:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id AA5F243CDC;
 Fri, 13 Feb 2026 21:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A146EC116C6;
 Fri, 13 Feb 2026 21:46:15 +0000 (UTC)
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
X-Inumbo-ID: 6d084236-0925-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771019176;
	bh=KFPScMimbqg2ZskFFSMcwPtRwgWkT2VJuTcbSbUOl8Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cilrmGdABoyoAdmwP3XIyRsycGXnD7MdwvfsS+FcpB6L7XrcbCNDJuq5xLk1yaeE2
	 yRvn+PgjPP3DszhuYFbMQQ/9OY1D9Fv4CqC4Yk7dzSNjWW5gfUla8uSkR/WjI8AZgy
	 HViNOBwwgUbE576vZbilEketW6Q4CXrkAWVF5t4YkbO99dU7iI/7IG1ahh7PrtHh03
	 IQ5Xv5Qqcj10AniF9opXYrzW4z8gP1NyfpjxmxNHK4D0xOF/fZdPAe8M7wWoGMHMbe
	 kWeI7R4vG81jep5JQfV5eso0ab/7WvBMBo48iwya6V7gOUhKGY8VWw+aP9fuZ77DbC
	 PGKuUMJnFTv3g==
Date: Fri, 13 Feb 2026 13:46:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, roger.pau@citrix.com, 
    andrew.cooper3@citrix.com, jason.andryuk@amd.com, 
    alejandro.garciavallejo@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/hvm: Add Kconfig option to disable nested
 virtualization
In-Reply-To: <7a3b72b4-23f9-410f-8d0d-08d9adaaf1a7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2602131342090.6031@ubuntu-linux-20-04-desktop>
References: <20260206210554.126443-1-stefano.stabellini@amd.com> <7a3b72b4-23f9-410f-8d0d-08d9adaaf1a7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:stefano.stabellini@amd.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 273A2139AA9
X-Rspamd-Action: no action

On Mon, 9 Feb 2026, Jan Beulich wrote:
> On 06.02.2026 22:05, Stefano Stabellini wrote:
> > --- a/xen/arch/x86/hvm/Kconfig
> > +++ b/xen/arch/x86/hvm/Kconfig
> > @@ -92,4 +92,14 @@ config MEM_SHARING
> >  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
> >  	depends on INTEL_VMX
> >  
> > +config NESTED_VIRT
> > +	bool "Nested virtualization support"
> > +	depends on AMD_SVM || INTEL_VMX
> 
> Should be HVM? Or else have separate NESTED_SVM and NESTED_VMX?
> 
> > +	default n
> 
> Please omit such a redundant line.

done and done

> > --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> > +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> > @@ -26,6 +26,13 @@
> >  #define nsvm_efer_svm_enabled(v) \
> >      (!!((v)->arch.hvm.guest_efer & EFER_SVME))
> >  
> > +#define NSVM_INTR_NOTHANDLED     3
> > +#define NSVM_INTR_NOTINTERCEPTED 2
> > +#define NSVM_INTR_FORCEVMEXIT    1
> > +#define NSVM_INTR_MASKED         0
> 
> It feels suspicious that all of these need moving ...
> 
> > +#ifdef CONFIG_NESTED_VIRT
> 
> ... ahead of this.

Not needed anymore


> > --- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
> > +++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
> > @@ -25,9 +25,21 @@ enum nestedhvm_vmexits {
> >  /* Nested HVM on/off per domain */
> >  static inline bool nestedhvm_enabled(const struct domain *d)
> >  {
> > -    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
> > +    return IS_ENABLED(CONFIG_NESTED_VIRT) &&
> > +           (d->options & XEN_DOMCTL_CDF_nested_virt);
> >  }
> >  
> > +/* Nested paging */
> > +#define NESTEDHVM_PAGEFAULT_DONE       0
> > +#define NESTEDHVM_PAGEFAULT_INJECT     1
> > +#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
> > +#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
> > +#define NESTEDHVM_PAGEFAULT_MMIO       4
> > +#define NESTEDHVM_PAGEFAULT_RETRY      5
> > +#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
> > +
> > +#ifdef CONFIG_NESTED_VIRT
> 
> Same here.

the stub nestedhvm_hap_nested_page_fault() returns
NESTEDHVM_PAGEFAULT_L0_ERROR, so these defines must be available
unconditionally.


> > --- a/xen/arch/x86/mm/hap/Makefile
> > +++ b/xen/arch/x86/mm/hap/Makefile
> > @@ -2,5 +2,5 @@ obj-y += hap.o
> >  obj-y += guest_walk_2.o
> >  obj-y += guest_walk_3.o
> >  obj-y += guest_walk_4.o
> > -obj-y += nested_hap.o
> > -obj-$(CONFIG_INTEL_VMX) += nested_ept.o
> > +obj-$(CONFIG_NESTED_VIRT) += nested_hap.o
> > +obj-$(filter $(CONFIG_NESTED_VIRT),$(CONFIG_INTEL_VMX)) += nested_ept.o
> 
> Maybe slightly easier to read as
> 
> nested-y := nested_hap.o
> nested-$(CONFIG_INTEL_VMX) += nested_ept.o
> obj-$(CONFIG_NESTED_VIRT) += $(nested-y)

OK
    

> > --- a/xen/arch/x86/sysctl.c
> > +++ b/xen/arch/x86/sysctl.c
> > @@ -103,6 +103,8 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
> >          pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
> >      if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
> >          pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
> > +    if ( hvm_nested_virt_supported() )
> > +        pi->capabilities |= XEN_SYSCTL_PHYSCAP_nestedhvm;
> >  }
> >  
> >  long arch_do_sysctl(
> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -100,9 +100,11 @@ struct xen_sysctl_tbuf_op {
> >  /* Xen supports the Grant v1 and/or v2 ABIs. */
> >  #define XEN_SYSCTL_PHYSCAP_gnttab_v1     (1u << 8)
> >  #define XEN_SYSCTL_PHYSCAP_gnttab_v2     (1u << 9)
> > +/* The platform supports nested HVM. */
> > +#define XEN_SYSCTL_PHYSCAP_nestedhvm     (1u << 10)
> 
> Doesn't this want introducing up front, for the tool stack to make use of?

What do you mean by "up front" in this context? In a separate toolstack
patch?

