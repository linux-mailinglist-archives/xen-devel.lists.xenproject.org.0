Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ECA302D69
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 22:18:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74496.133920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l49Fi-0006vb-69; Mon, 25 Jan 2021 21:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74496.133920; Mon, 25 Jan 2021 21:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l49Fi-0006vC-2l; Mon, 25 Jan 2021 21:18:26 +0000
Received: by outflank-mailman (input) for mailman id 74496;
 Mon, 25 Jan 2021 21:18:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9fV7=G4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l49Fg-0006v7-3C
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 21:18:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fb89a38-e064-46db-8d7d-637a62723542;
 Mon, 25 Jan 2021 21:18:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E10B520679;
 Mon, 25 Jan 2021 21:18:21 +0000 (UTC)
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
X-Inumbo-ID: 6fb89a38-e064-46db-8d7d-637a62723542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611609502;
	bh=g7a1B4XnMYSCCKownl592lBPSCh5t7fpuH/XNnUgDSU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eWNC6MSzukUdv/E/RSLKy1yJa26AY5xfQ99BiwDvoJw/siG0ZwOEKb2mkC6y1JKf9
	 lcMKfCm5ffKhOBexjPZkW5szG/yJLRgmd+mtBTFb8LcbnoNz8GPB2l0J4Gx72TsLZs
	 bO4QQ/4BhL19qA+MKdMzF55vG+RvpVRGNWy4VIjmphG1qWJv8lYnnW5THSKqiOlQPf
	 ra1GbAcW3gNsEs/64Rr1PMInoXe+3OVgIsHamuJJAQXFgoRzJJ/gQkE1WUNcbIBaov
	 6SGJ9eDP73TLPSPiA8s3hBHGD6yhDR0PqbkHkwS1SCsmdQEt5fDVw1xWF9fE0LzjQ2
	 byu2XKn2+xDcQ==
Date: Mon, 25 Jan 2021 13:18:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org, 
    julien@xen.org, wl@xen.org, Bertrand.Marquis@arm.com, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] xen: EXPERT clean-up and introduce UNSUPPORTED
In-Reply-To: <e4a5cba7-6101-1e4b-199b-d1a01d65da9a@suse.com>
Message-ID: <alpine.DEB.2.21.2101251253100.20638@sstabellini-ThinkPad-T480s>
References: <20210123021950.1270-1-sstabellini@kernel.org> <e4a5cba7-6101-1e4b-199b-d1a01d65da9a@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Jan 2021, Jan Beulich wrote:
> On 23.01.2021 03:19, Stefano Stabellini wrote:
> > --- a/xen/Kconfig
> > +++ b/xen/Kconfig
> > @@ -34,8 +34,15 @@ config DEFCONFIG_LIST
> >  	option defconfig_list
> >  	default ARCH_DEFCONFIG
> >  
> > +config UNSUPPORTED
> > +	bool "Configure UNSUPPORTED features"
> > +	help
> > +	  This option allows certain unsupported Xen options to be changed,
> > +	  which includes non-security-supported, experimental, and tech
> > +	  preview features as defined by SUPPORT.md.
> 
> And by implication anything not depending on UNSUPPORTED is
> supported? I didn't think this was the case (some unsupported
> code can't even be turned off via Kconfig), so I think this
> needs clarifying here, so we won't end up with people
> considering some feature supported which really isn't. That's
> irrespective of the reference to SUPPORT.md.

I'll clarify.


> >  config EXPERT
> > -	bool "Configure standard Xen features (expert users)"
> > +	bool "Configure EXPERT features"
> >  	help
> >  	  This option allows certain base Xen options and settings
> >  	  to be disabled or tweaked. This is for specialized environments
> 
> I'd like to suggest to move UNSUPPORTED past this one, to
> then have that have "default EXPERT".

Sure, good idea.

