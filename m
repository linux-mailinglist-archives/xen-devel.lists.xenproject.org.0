Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F86304638
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 19:27:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75404.135770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4T2i-0000hS-0z; Tue, 26 Jan 2021 18:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75404.135770; Tue, 26 Jan 2021 18:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4T2h-0000h3-Tj; Tue, 26 Jan 2021 18:26:19 +0000
Received: by outflank-mailman (input) for mailman id 75404;
 Tue, 26 Jan 2021 18:26:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4T2h-0000gy-24
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 18:26:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1175d09d-db78-45e6-b647-de1be20cd0f9;
 Tue, 26 Jan 2021 18:26:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FB62207BC;
 Tue, 26 Jan 2021 18:26:17 +0000 (UTC)
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
X-Inumbo-ID: 1175d09d-db78-45e6-b647-de1be20cd0f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611685577;
	bh=abtO3RAm6Hn7mmYf4RLA+aTAQjRjKGymTLDaAGREULU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dGyXl338IAFFwwBZtOQ/MGkFvbAN4zLo6Pj59FcxtDALiRPf0/3eOvAYC1cS1/ggM
	 xx0ESbHP8sTyMkq2Ets2qM3fhsWcqz83JXi2ACaWdxdiNKaHkkvZyGLUvgMXUm7/5Y
	 cNiiqKZsXcK4YD0Pdybk7mkriknjpCYeZLNC959PzczKLfscEbTd9bkjoC70rkeTsK
	 JQuthb70478+FeBnq3MiNpCmrVCKQK3HAJtmtjlvpRi63zI2GdnQweL8pu2Z8BCujs
	 BWPjxgv9XTL4A7yjKZC4JbpaA8RH+i9mlyGCb4TiJ9Yo4IUQThtSigy4oNGMBK2y9P
	 EBoUtOcivHTKA==
Date: Tue, 26 Jan 2021 10:26:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org, 
    jbeulich@suse.com, wl@xen.org
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
In-Reply-To: <616b0552-33fc-360e-664c-44178e5afc6a@xen.org>
Message-ID: <alpine.DEB.2.21.2101261024070.20638@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s> <20210125212747.26676-1-sstabellini@kernel.org> <616b0552-33fc-360e-664c-44178e5afc6a@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 26 Jan 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 25/01/2021 21:27, Stefano Stabellini wrote:
> >   config ARM_SSBD
> > -	bool "Speculative Store Bypass Disable" if EXPERT
> > +	bool "Speculative Store Bypass Disable (UNSUPPORTED)" if UNSUPPORTED
> >   	depends on HAS_ALTERNATIVE
> >   	default y
> >   	help
> > @@ -87,7 +87,7 @@ config ARM_SSBD
> >   	  If unsure, say Y.
> >     config HARDEN_BRANCH_PREDICTOR
> > -	bool "Harden the branch predictor against aliasing attacks" if EXPERT
> > +	bool "Harden the branch predictor against aliasing attacks
> > (UNSUPPORTED)" if UNSUPPORTED
> >   	default y
> >   	help
> >   	  Speculation attacks against some high-performance processors rely on
> 
> I read through the back and forth between Bertrand and Jan about
> "UNSUPPORTED". However, I still don't understand why those two options are
> moved to UNSUPPORTED.
> 
> Both options will only build the code to enable the mitigation. The decision
> is still based on the processor you are running on.
> 
> In addition to that, ARM_SSBD can also be forced enabled/disabled on the
> command line.

Yes, you are right. HARDEN_BRANCH_PREDICTOR and ARM_SSBD should remain
EXPERT as they are today. It was a mistake to change them to
UNSUPPORTED.


> A user may want to compile out the code if the target processor is not the
> affected by the two issues. This wouldn't be much different to Xen deciding to
> not enabling the mitigation.
> 
> I would view the two options as supported but not security supported. So this
> seems to fit exactly in the definition of EXPERT rather than UNSUPPORTED.

Yes, I'll leave them unmodified.

