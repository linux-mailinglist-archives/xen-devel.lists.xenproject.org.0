Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB3155A389
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 23:33:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355909.583874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4quF-0005tr-2Z; Fri, 24 Jun 2022 21:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355909.583874; Fri, 24 Jun 2022 21:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4quE-0005r9-V5; Fri, 24 Jun 2022 21:31:58 +0000
Received: by outflank-mailman (input) for mailman id 355909;
 Fri, 24 Jun 2022 21:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b+8T=W7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o4quD-0005r3-K4
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 21:31:57 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11f40d04-f405-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 23:31:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2E86B82C48;
 Fri, 24 Jun 2022 21:31:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23222C34114;
 Fri, 24 Jun 2022 21:31:53 +0000 (UTC)
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
X-Inumbo-ID: 11f40d04-f405-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656106313;
	bh=W1rSOa14R6RGx69MRWTtq56HNTBQe1M4o61oyaeDxM0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o08nZowaJ4AAF753cK7cPIsiiuGK6qJSYL2xHLJk40STZYNNnSz1xvvgqj7tHLvfx
	 qEBi14xgO4dS6z6huN2DiOYKR6SfUldyZp+fm219Wf1AjYu4z7DTPQU2DS61aHynCM
	 SdLeJwIA3rCowDZjmONHHk8BKyy7cdUGpbrVtUzuFcIKpvbkQQ6ixgK/dgrQhDy5bs
	 LVVCG7oD3+M3THvxDrINLgM0cNNZa6W+6+JT9E4PdBtNO02XcHfYRioWrteAsTL1HX
	 kp6+1HyfBYaHlTo6WWTTITMoohrxsUETA8UcsWD8Vua94sG2TmqPcPdH7xLBdAxmZv
	 KKPytNcKC3SnQ==
Date: Fri, 24 Jun 2022 14:31:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, dmitry.semenets@gmail.com, 
    xen-devel@lists.xenproject.org, Dmytro Semenets <dmytro_semenets@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen: arm: Don't use stop_cpu() in halt_this_cpu()
In-Reply-To: <e60a4e68-ed00-6cc7-31ca-64bcfc4bbdc5@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206241414420.2410338@ubuntu-linux-20-04-desktop>
References: <20220623074428.226719-1-dmitry.semenets@gmail.com> <alpine.DEB.2.22.394.2206231457250.2410338@ubuntu-linux-20-04-desktop> <e60a4e68-ed00-6cc7-31ca-64bcfc4bbdc5@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Jun 2022, Julien Grall wrote:
> On 23/06/2022 23:07, Stefano Stabellini wrote:
> > On Thu, 23 Jun 2022, dmitry.semenets@gmail.com wrote:
> > > From: Dmytro Semenets <dmytro_semenets@epam.com>
> > So wouldn't it be better to remove the panic from the implementation of
> > call_psci_cpu_off?
> 
> I have asked to keep the panic() in call_psci_cpu_off(). If you remove the
> panic() then we will hide the fact that the CPU was not properly turned off
> and will consume more energy than expected.
> 
> The WFI loop is fine when shutting down or rebooting because we know this will
> only happen for a short period of time.

Yeah, I don't think we should hide that CPU_OFF failed. I think we
should print a warning. However, given that we know CPU_OFF can
reasonably fail in normal conditions returning DENIED when a Trusted OS
is present, then I think we should not panic.

If there was a way to distinguish a failure because a Trusted OS is
present (the "normal" failure) from other failures, I would suggest to:
- print a warning if failed due to a Trusted OS being present
- panic in other cases

Unfortunately it looks like in all cases the return code is DENIED :-(


Given that, I would not panic and only print a warning in all cases. Or
we could ASSERT which at least goes away in !DEBUG builds.


> > The reason I am saying this is that stop_cpu is called in a number of
> > places beyond halt_this_cpu and as far as I can tell any of them could
> > trigger the panic. (I admit they are unlikely places but still.)
> 
> This is one of the example where the CPU will not be stopped for a short
> period of time. We should deal with them differently (i.e. migrating the
> trusted OS or else) so we give all the chance for the CPU to be fully powered.
> 
> IMHO, this is a different issue and hence why I didn't ask Dmitry to solve it.

I see your point now. I was seeing the two things as one.

I think it is true that the WFI loop is likely to work. Also it is true
that from a power perspective it makes no different on power down or
reboot.  From that point of view this patch is OK.

But even on shut-down/reboot, why not do that as a fallback in case
CPU_OFF didn't work? It is going to work most of the times anyway, why
change the default for the few cases that doesn't work?

Given that this patch would work, I don't want to insist on this and let
you decide.


But even if we don't want to remove the panic as part of this patch, I
think we should remove the panic in a separate patch anyway, at least
until someone investigates and thinks of a strategy how to migrate the
TrustedOS as you suggested.


 
 
> > Also the PSCI spec explicitely mention CPU_OFF as a way to place CPUs in
> > a "known state" and doesn't offer any other examples. So although what
> > you wrote in the commit message is correct, using CPU_OFF seems to be
> > the less error prone way (in the sense of triggering firmware errors) to
> > place CPUs in a known state.
> 
> The section you are referring to is starting with "One way". This imply there
> are others methods.
> 
> FWIW, the spin loop above seems to be how Linux is dealing with the
> shutdown/reboot.
> 
> > 
> > So I would simply remove the panic from call_psci_cpu_off, so that we
> > try CPU_OFF first, and if it doesn't work, we use the WFI loop as
> > backup. Also we get to fix all the other callers of stop_cpu this way.
> This reads strange. In the previous paragraph you suggested the CPU off is a
> less error prone way to place CPUs in a known state. But here, you are
> softening the stance and suggesting to fallback to the WFI loop.
> 
> So to me this indicates that WFI loop is fine. Otherwise, wouldn't the user
> risk to see firmware errors (which BTW, I don't understand what sort of
> firmware errors you are worried)? If yes, why would it be acceptable?
> 
> For instance, Dmitry situation, the CPU0 would always WFI loop...


