Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B149F28E810
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 22:47:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7010.18363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSnfa-00053h-ND; Wed, 14 Oct 2020 20:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7010.18363; Wed, 14 Oct 2020 20:46:46 +0000
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
	id 1kSnfa-00053I-Jg; Wed, 14 Oct 2020 20:46:46 +0000
Received: by outflank-mailman (input) for mailman id 7010;
 Wed, 14 Oct 2020 20:46:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zgx5=DV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kSnfY-00053D-K4
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 20:46:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 50ac3311-7e5c-4a73-98af-912f2ee08f40;
 Wed, 14 Oct 2020 20:46:44 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA7F022248;
 Wed, 14 Oct 2020 20:46:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zgx5=DV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kSnfY-00053D-K4
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 20:46:44 +0000
X-Inumbo-ID: 50ac3311-7e5c-4a73-98af-912f2ee08f40
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 50ac3311-7e5c-4a73-98af-912f2ee08f40;
	Wed, 14 Oct 2020 20:46:44 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CA7F022248;
	Wed, 14 Oct 2020 20:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602708403;
	bh=XCqiykSQEa9rXNobIGoRiRoA8bmB2pG3qVdERVEa67E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jwOyaaBvNYUb4WHMvTvyzr2JjO/xaNRdUOMiFVUB9Oc6S6OezD5mRi0WNMLZ7F2yP
	 SrwF3wWnrKzhDMU81jXNjACy4RC1irvsOfqSDjVkAhQrcsuosaqD7JoKbuT33r6caS
	 uBVUgQf36ipYYV/7JJVfkc3Q74Lq1e7dnTWkyAwA=
Date: Wed, 14 Oct 2020 13:46:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, 
    "open list:X86" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Warn user on cpu errata 832075
In-Reply-To: <5A45EDA3-B01B-4AC3-B2CB-77CF90D024AD@arm.com>
Message-ID: <alpine.DEB.2.21.2010141346130.10386@sstabellini-ThinkPad-T480s>
References: <f11fe960a111530501fd0c20893bec4e32edf3cb.1602671985.git.bertrand.marquis@arm.com> <c22235d1-9124-74f2-5856-58f7f44dc0b7@xen.org> <5A45EDA3-B01B-4AC3-B2CB-77CF90D024AD@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-897259223-1602708402=:10386"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-897259223-1602708402=:10386
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 14 Oct 2020, Bertrand Marquis wrote:
> > On 14 Oct 2020, at 12:11, Julien Grall <julien@xen.org> wrote:
> > 
> > Hi Bertrand,
> > 
> > On 14/10/2020 11:41, Bertrand Marquis wrote:
> >> When a Cortex A57 processor is affected by CPU errata 832075, a guest
> >> not implementing the workaround for it could deadlock the system.
> >> Add a warning during boot informing the user that only trusted guests
> >> should be executed on the system.
> > 
> > I think we should update SUPPORT.MD to say we will not security support those processors. Stefano, what do you think?
> 
> That could make sense to do that yes.
> If Stefano confirms then i can do this in a v2

Yes, I confirm

 
> >> An equivalent warning is already given to the user by KVM on cores
> >> affected by this errata.
> > 
> > I don't seem to find the warning in Linux. Do you have a link?
> 
> sure:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=abf532cceaca9c21a148498091f87de1b8ae9b49
> 
> > 
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >>  xen/arch/arm/cpuerrata.c | 21 +++++++++++++++++++++
> >>  1 file changed, 21 insertions(+)
> >> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> >> index 6c09017515..8f9ab6dde1 100644
> >> --- a/xen/arch/arm/cpuerrata.c
> >> +++ b/xen/arch/arm/cpuerrata.c
> >> @@ -240,6 +240,26 @@ static int enable_ic_inv_hardening(void *data)
> >>    #endif
> >>  +#ifdef CONFIG_ARM64_ERRATUM_832075
> >> +
> >> +static int warn_device_load_acquire_errata(void *data)
> >> +{
> >> +    static bool warned = false;
> >> +
> >> +    if ( !warned )
> >> +    {
> >> +        warning_add("This CPU is affected by the errata 832075.\n"
> >> +                    "Guests without required CPU erratum workarounds\n"
> >> +                    "can deadlock the system!\n"
> >> +                    "Only trusted guests should be used on this system.\n");
> >> +        warned = true;
> > 
> > I was going to suggest to use WARN_ON_ONCE() but it looks like it never made upstream :(.
> 
> I did do this as it was done in the smc warning function (that’s why i pushed a patch for it).
> 
> Cheers
> Bertrand
> 
> > 
> >> +    }
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +#endif
> >> +
> >>  #ifdef CONFIG_ARM_SSBD
> >>    enum ssbd_state ssbd_state = ARM_SSBD_RUNTIME;
> >> @@ -419,6 +439,7 @@ static const struct arm_cpu_capabilities arm_errata[] = {
> >>          .capability = ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE,
> >>          MIDR_RANGE(MIDR_CORTEX_A57, 0x00,
> >>                     (1 << MIDR_VARIANT_SHIFT) | 2),
> >> +        .enable = warn_device_load_acquire_errata,
> >>      },
> >>  #endif
> >>  #ifdef CONFIG_ARM64_ERRATUM_834220
> > 
> > -- 
> > Julien Grall
> 
> 
--8323329-897259223-1602708402=:10386--

