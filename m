Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAD2304647
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 19:28:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75409.135785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4T4r-0000p8-Fb; Tue, 26 Jan 2021 18:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75409.135785; Tue, 26 Jan 2021 18:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4T4r-0000ol-CB; Tue, 26 Jan 2021 18:28:33 +0000
Received: by outflank-mailman (input) for mailman id 75409;
 Tue, 26 Jan 2021 18:28:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ePBE=G5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l4T4p-0000of-TR
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 18:28:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ece49048-6fc8-4696-b2e1-954e6b0ed019;
 Tue, 26 Jan 2021 18:28:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C129207BC;
 Tue, 26 Jan 2021 18:28:30 +0000 (UTC)
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
X-Inumbo-ID: ece49048-6fc8-4696-b2e1-954e6b0ed019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611685710;
	bh=KrlLPuMWpOMejkdlYTFbFgGbPUs2fMBfX4hGtP/gZNw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=prjQoVfs4MlN0BbWKChg7LJEi83a1+GDw/9wK6JInfL2c/eArtRJ1qHCOVO08IZGP
	 ltdG32zo2xu1caJ3TBr9OiMGcZEEu+oAJ++PXZDU/kKeI189HEt2/Do3czI5ty9HFI
	 uNfCht/497aajuNKrfPQDRr+BRVDaogfxuexI9bHP1fSn/sSku6mTkvICFTyemh+QZ
	 2zzhixaAmswbanL8SF+mEK7m9GHqB4nYBedPoAREM5MMVOmsEjEchmY52HUr0THogV
	 dfMNJsV9YlABMjM6/+xePmS4eVYT+G0UAoQ+M0CuxXUtdpJFQP0sfgkoDG3iphSso9
	 xd0quYvce0B7g==
Date: Tue, 26 Jan 2021 10:28:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "iwj@xenproject.org" <iwj@xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 1/2] xen: EXPERT clean-up and introduce UNSUPPORTED
In-Reply-To: <1199ab03-ecfe-386c-7488-ca4f794b0683@suse.com>
Message-ID: <alpine.DEB.2.21.2101261027300.20638@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s> <20210125212747.26676-1-sstabellini@kernel.org> <bbdbb0d2-24d7-4e46-1303-706c6c3036c3@suse.com> <8F34AC6E-2337-42C3-B612-A5414F9E16BE@arm.com> <01da05ea-6c34-8d8e-4277-e29bc54cb67d@suse.com>
 <5CB981E5-27BC-4B7E-B494-EFFDE8A4A1A9@arm.com> <1199ab03-ecfe-386c-7488-ca4f794b0683@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-537225780-1611685710=:20638"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-537225780-1611685710=:20638
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 26 Jan 2021, Jan Beulich wrote:
> On 26.01.2021 12:17, Bertrand Marquis wrote:
> > 
> > 
> >> On 26 Jan 2021, at 11:11, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 26.01.2021 12:06, Bertrand Marquis wrote:
> >>>> On 26 Jan 2021, at 09:22, Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 25.01.2021 22:27, Stefano Stabellini wrote:
> >>>>> @@ -77,7 +77,7 @@ config SBSA_VUART_CONSOLE
> >>>>> 	  SBSA Generic UART implements a subset of ARM PL011 UART.
> >>>>>
> >>>>> config ARM_SSBD
> >>>>> -	bool "Speculative Store Bypass Disable" if EXPERT
> >>>>> +	bool "Speculative Store Bypass Disable (UNSUPPORTED)" if UNSUPPORTED
> >>>>> 	depends on HAS_ALTERNATIVE
> >>>>> 	default y
> >>>>> 	help
> >>>>> @@ -87,7 +87,7 @@ config ARM_SSBD
> >>>>> 	  If unsure, say Y.
> >>>>>
> >>>>> config HARDEN_BRANCH_PREDICTOR
> >>>>> -	bool "Harden the branch predictor against aliasing attacks" if EXPERT
> >>>>> +	bool "Harden the branch predictor against aliasing attacks (UNSUPPORTED)" if UNSUPPORTED
> >>>>> 	default y
> >>>>> 	help
> >>>>> 	  Speculation attacks against some high-performance processors rely on
> >>>>
> >>>> Both of these default to y and have their _prompt_
> >>>> conditional upon EXPERT. Which means only an expert can turn them
> >>>> _off_. Which doesn't make it look like these are unsupported? Or
> >>>> if anything, turning them off is unsupported?
> >>>
> >>> ...You could see that as EXPERT/UNSUPPORTED options can only be
> >>> “modified” from their default value if EXPERT/UNSUPPORTED is activated.
> >>
> >> But this is nothing you can recognize when configuring Xen
> >> (i.e. seeing just these prompts).
> > 
> > Maybe something we could explain more clearly in the UNSUPPORTED/EXPERT
> > config parameters instead ?
> > We could also make that more clear in the help of such parameters directly.
> > 
> > I do not see how we could make that more clear directly in the prompt (as
> > making it too long is not a good solution).
> 
> My main request is that such tags be added only if there's
> absolutely no ambiguity. Anything else (requiring longer
> explanations in many cases) should be expressed in the help
> text of the option, or in yet other ways (a referral to
> SUPPORT.md comes to mind).

I actually agree completely with you. In the case of ARM_SSBD and
HARDEN_BRANCH_PREDICTOR, they should remain as they are today I think.
--8323329-537225780-1611685710=:20638--

