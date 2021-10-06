Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9784E4249FD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 00:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203195.358266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYFcC-00030z-1J; Wed, 06 Oct 2021 22:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203195.358266; Wed, 06 Oct 2021 22:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYFcB-0002yn-T7; Wed, 06 Oct 2021 22:42:19 +0000
Received: by outflank-mailman (input) for mailman id 203195;
 Wed, 06 Oct 2021 22:42:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HdqS=O2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYFcA-0002yh-6P
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 22:42:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56a52a04-6b15-4334-8893-0f808bdae279;
 Wed, 06 Oct 2021 22:42:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 464D060FD8;
 Wed,  6 Oct 2021 22:42:16 +0000 (UTC)
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
X-Inumbo-ID: 56a52a04-6b15-4334-8893-0f808bdae279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633560136;
	bh=MxQr0kqs9NYKxf+SU5Ptr5l25m00+1tS9Cs9IznIuZI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e3CjZOvmC3CN6/uH4ZL+sPZAyQUWnPO1Fgus0sSOLREiPOgvpGmylf07+dorIVFQS
	 ugFOrsMfS45NQme9r0UP7G6ej5PKsbQHrXhP5C7MF/8NTvUe8hHIT1Z5cMr3qhSVFb
	 mGiM/Ybu25rcR09jSCjDIZeLwxhA4HmBreIVlo2+DMeJcKH2OnAt+gnOZZ04uEiGg8
	 /+1PVAvxWUpWm2FlYa8/86HtC24Ft+E35iTlXZQ1HMjC4hhSlpxzB5Qn5FM07ifVlz
	 GCkUYfKDvTmnPy5QUp9ZYUe9aPZpm4+xRknXAIkP5c/tyFZPnblTSTUPRf9AVEuhT8
	 /A9nZNrDi/JQA==
Date: Wed, 6 Oct 2021 15:42:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Volodymyr Babchuk <volodymyr_babchuk@epam.com>, tee-dev@lists.linaro.org
Subject: Re: [PATCH] xen/arm: optee: Fix arm_smccc_smc's a0 for
 OPTEE_SMC_DISABLE_SHM_CACHE
In-Reply-To: <e612c225-cda6-2c41-bf20-73314ebceb02@xen.org>
Message-ID: <alpine.DEB.2.21.2110061537310.3209@sstabellini-ThinkPad-T480s>
References: <1632750850-28600-1-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2109272151260.5022@sstabellini-ThinkPad-T480s> <e612c225-cda6-2c41-bf20-73314ebceb02@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Oct 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 28/09/2021 06:52, Stefano Stabellini wrote:
> > On Mon, 27 Sep 2021, Oleksandr Tyshchenko wrote:
> > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > 
> > > Fix a possible copy-paste error in arm_smccc_smc's first argument (a0)
> > > for OPTEE_SMC_DISABLE_SHM_CACHE case.
> > > 
> > > This error causes Linux > v5.14-rc5
> > > (b5c10dd04b7418793517e3286cde5c04759a86de
> > > optee: Clear stale cache entries during initialization) to stuck
> > > repeatedly issuing OPTEE_SMC_DISABLE_SHM_CACHE call and waiting for
> > > the result to be OPTEE_SMC_RETURN_ENOTAVAIL which will never happen.
> > > 
> > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > 
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > I added Fixes: and Backport: tags to the commit
> Per SUPPORT.MD, OP-TEE is still a technical preview. So I would argue that we
> should not do any backport because the feature itself is not officially
> considered supported.

Good point!


> That said, what's missing to make the feature officially supported?

If Oleksandr is also happy to make OP-TEE support in Xen "Supported" in
SUPPORT.md I'd be happy with that too. Specifically I suggest to change
it to:

Status: Supported, not security supported

Security Support is a bit of a heavy process and I am thinking that
"Supported, not security supported" would be an excellent next step.

