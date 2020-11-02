Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C847C2A361D
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 22:42:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17937.42667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZha6-0003MC-Nj; Mon, 02 Nov 2020 21:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17937.42667; Mon, 02 Nov 2020 21:41:38 +0000
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
	id 1kZha6-0003Ln-Kb; Mon, 02 Nov 2020 21:41:38 +0000
Received: by outflank-mailman (input) for mailman id 17937;
 Mon, 02 Nov 2020 21:41:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q6w=EI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kZha5-0003Li-OA
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 21:41:37 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 516f7b90-4a80-4f29-a5bb-4e9304106864;
 Mon, 02 Nov 2020 21:41:37 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B62922226;
 Mon,  2 Nov 2020 21:41:35 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=0q6w=EI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kZha5-0003Li-OA
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 21:41:37 +0000
X-Inumbo-ID: 516f7b90-4a80-4f29-a5bb-4e9304106864
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 516f7b90-4a80-4f29-a5bb-4e9304106864;
	Mon, 02 Nov 2020 21:41:37 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9B62922226;
	Mon,  2 Nov 2020 21:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604353296;
	bh=1IbfQyS4uyoGg+tEuYRBMLFmab7hE8yyN2GX0BZIHSk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J2K0jJvpTDVDwpEfiEWMDSX3FCp3wPBUmBhQ2HmWrr1AhUMkDyqN6JQC3rVkqIWkW
	 ibRxILEJ7uzxq0VZNFw/w/Zb9uiHqzsqCFNQTZXPpdwJzB2TT/Ry6xYigXS2DgrF1O
	 U17NscmteM6Zg91mnFSm12HRDOL3rFcCZou2mmsw=
Date: Mon, 2 Nov 2020 13:41:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org, 
    julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH] xen: EXPERT clean-up
In-Reply-To: <cd44d479-8dba-6311-9386-0c8c1134d07e@suse.com>
Message-ID: <alpine.DEB.2.21.2011021332460.5812@sstabellini-ThinkPad-T480s>
References: <20201031002405.4545-1-sstabellini@kernel.org> <cd44d479-8dba-6311-9386-0c8c1134d07e@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 2 Nov 2020, Jan Beulich wrote:
> On 31.10.2020 01:24, Stefano Stabellini wrote:
> > --- a/xen/Kconfig
> > +++ b/xen/Kconfig
> > @@ -35,14 +35,13 @@ config DEFCONFIG_LIST
> >  	default ARCH_DEFCONFIG
> >  
> >  config EXPERT
> > -	bool "Configure standard Xen features (expert users)"
> > +	bool "Configure EXPERT features"
> >  	help
> > -	  This option allows certain base Xen options and settings
> > -	  to be disabled or tweaked. This is for specialized environments
> > -	  which can tolerate a "non-standard" Xen.
> > -	  Only use this if you really know what you are doing.
> > -	  Xen binaries built with this option enabled are not security
> > -	  supported.
> > +	  This option allows certain experimental (see SUPPORT.md) Xen
> > +	  options and settings to be enabled/disabled. This is for
> > +	  specialized environments which can tolerate a "non-standard" Xen.
> > +	  Only use this if you really know what you are doing.  Xen binaries
> > +	  built with this option enabled are not security supported.
> >  	default n
> 
> I'm definitely in favor of this - it was more than once that I
> wondered about the prompt text.

Thanks, I agree!


> > @@ -79,8 +79,8 @@ config SBSA_VUART_CONSOLE
> >  	  SBSA Generic UART implements a subset of ARM PL011 UART.
> >  
> >  config ARM_SSBD
> > -	bool "Speculative Store Bypass Disable" if EXPERT
> > -	depends on HAS_ALTERNATIVE
> > +	bool "Speculative Store Bypass Disable"
> > +	depends on HAS_ALTERNATIVE && EXPERT
> >  	default y
> 
> At the example of this, I'm afraid when the default isn't "n"
> (or there's no default directive at all, as ought to be
> equivalent to and preferred over "default n"), such a
> transformation is not functionally identical: Before your
> change, with !EXPERT this option defaults to y. After your
> change this option is unavailable (which resolves to it being
> off for all consuming purposes).
> 
> IOW there are reasons to have "if ..." attached to the prompts
> (for this construct indeed only making the prompt conditional,
> not the entire option), but there are also cases where the
> cleanup you do is indeed desirable / helpful.

Yeah, thanks for catching it, it is obviously a problem.

My intention was just to "tag" somehow the options to EXPERT so that it
would show on the menu. Maybe a better, simpler, way to do it is
to add the word "EXPERT" to the one line prompt:

 config ARM_SSBD
-	bool "Speculative Store Bypass Disable" if EXPERT
+	bool "Speculative Store Bypass Disable (EXPERT)" if EXPERT
 	depends on HAS_ALTERNATIVE
 	default y
 	help


What do you think?

