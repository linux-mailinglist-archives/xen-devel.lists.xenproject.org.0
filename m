Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A562954B9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 00:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10147.26846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVMPw-0006mp-Mg; Wed, 21 Oct 2020 22:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10147.26846; Wed, 21 Oct 2020 22:17:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVMPw-0006mQ-JN; Wed, 21 Oct 2020 22:17:12 +0000
Received: by outflank-mailman (input) for mailman id 10147;
 Wed, 21 Oct 2020 22:17:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kVMPv-0006mL-0x
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 22:17:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b32b3a73-8ee3-4cfe-b3b2-9c2bc18c36fb;
 Wed, 21 Oct 2020 22:17:10 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE281241A3;
 Wed, 21 Oct 2020 22:17:08 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=01QD=D4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kVMPv-0006mL-0x
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 22:17:11 +0000
X-Inumbo-ID: b32b3a73-8ee3-4cfe-b3b2-9c2bc18c36fb
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b32b3a73-8ee3-4cfe-b3b2-9c2bc18c36fb;
	Wed, 21 Oct 2020 22:17:10 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EE281241A3;
	Wed, 21 Oct 2020 22:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603318629;
	bh=6KuZqfguu7FYtFJKwVcmdvYA+41YZTjOZ1wPXfq5t0I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=0umyfJEOTCl7WFGZRdGyPhU7VCRIz5goxL6w8OJXMTqAY34qxejd8R3ilF9v898LM
	 jn4t62lXpJcvdsjasgbsmByjBb33SsjZyBwA5Hz83FpE3jOabcpVxknx8n3rCsBqE3
	 7/GzLelVB0On7/P4mDllPWeM8H+zidO6wcLOXw9Q=
Date: Wed, 21 Oct 2020 15:17:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, george.dunlap@citrix.com, 
    ian.jackson@eu.citrix.com, jbeulich@suse.com, julien@xen.org, wl@xen.org, 
    Bertrand.Marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2 01/14] kernel-doc: public/arch-arm.h
In-Reply-To: <1659282c-dc07-ee3e-9c1d-654861643b72@citrix.com>
Message-ID: <alpine.DEB.2.21.2010211508450.12247@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2010201646370.12247@sstabellini-ThinkPad-T480s> <20201021000011.15351-1-sstabellini@kernel.org> <1659282c-dc07-ee3e-9c1d-654861643b72@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-152475288-1603318629=:12247"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-152475288-1603318629=:12247
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 21 Oct 2020, Andrew Cooper wrote:
> On 21/10/2020 00:59, Stefano Stabellini wrote:
> > diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> > index c365b1b39e..409697dede 100644
> > --- a/xen/include/public/arch-arm.h
> > +++ b/xen/include/public/arch-arm.h
> > @@ -201,7 +208,9 @@ typedef uint64_t xen_pfn_t;
> >  #define PRI_xen_pfn PRIx64
> >  #define PRIu_xen_pfn PRIu64
> >  
> > -/*
> > +/**
> > + * DOC: XEN_LEGACY_MAX_VCPUS
> > + *
> >   * Maximum number of virtual CPUs in legacy multi-processor guests.
> >   * Only one. All other VCPUS must use VCPUOP_register_vcpu_info.
> >   */
> 
> I suppose I don't really want to know why this exists in the ARM ABI? 
> It looks to be a misfeature.
> 
> Shouldn't it be labelled as obsolete ?  (Is that even a thing you can do
> in kernel-doc?  It surely must be...)

I tried not to make any content changes as part of this series, but as
we are looking into this, I could append patches to the end of the
series to make some additional changes. I.e. I'd prefer to keep the
mechanical patches mechanical.

In regards to XEN_LEGACY_MAX_VCPUS, it is part of struct shared_info so
it must be defined. It makes sense to define it to the smallest number
given that the newer interface (VCPUOP_register_vcpu_info) is preferred.

In regards to labelling things as obsolete, I couldn't find a way to do
it with kernel-doc, but keep in mind that the end goal is to use
doxygen. It might become possible then.


> > @@ -299,26 +308,28 @@ struct vcpu_guest_context {
> >  typedef struct vcpu_guest_context vcpu_guest_context_t;
> >  DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
> >  
> > -/*
> > +
> > +/**
> > + * struct xen_arch_domainconfig - arch-specific domain creation params
> > + *
> >   * struct xen_arch_domainconfig's ABI is covered by
> >   * XEN_DOMCTL_INTERFACE_VERSION.
> >   */
> > +struct xen_arch_domainconfig {
> > +    /** @gic_version: IN/OUT parameter */
> >  #define XEN_DOMCTL_CONFIG_GIC_NATIVE    0
> >  #define XEN_DOMCTL_CONFIG_GIC_V2        1
> >  #define XEN_DOMCTL_CONFIG_GIC_V3        2
> > -
> > +    uint8_t gic_version;
> 
> Please can we have a newline in here, and elsewhere separating blocks of
> logically connected field/constant/comments.
> 
> It will make a world of difference to the readability of the header
> files themselves.

Sure, I can do that
--8323329-152475288-1603318629=:12247--

