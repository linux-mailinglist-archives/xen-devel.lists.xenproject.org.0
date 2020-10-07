Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE6E2865D0
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 19:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3582.10249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQD95-0007jf-Ey; Wed, 07 Oct 2020 17:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3582.10249; Wed, 07 Oct 2020 17:22:31 +0000
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
	id 1kQD95-0007jG-Be; Wed, 07 Oct 2020 17:22:31 +0000
Received: by outflank-mailman (input) for mailman id 3582;
 Wed, 07 Oct 2020 17:22:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jbsw=DO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kQD93-0007jB-JD
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 17:22:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45a28bc3-6f61-4dd3-af6e-bdae6c7cb5cc;
 Wed, 07 Oct 2020 17:22:29 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB0C4206F7;
 Wed,  7 Oct 2020 17:22:27 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Jbsw=DO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kQD93-0007jB-JD
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 17:22:29 +0000
X-Inumbo-ID: 45a28bc3-6f61-4dd3-af6e-bdae6c7cb5cc
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 45a28bc3-6f61-4dd3-af6e-bdae6c7cb5cc;
	Wed, 07 Oct 2020 17:22:29 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CB0C4206F7;
	Wed,  7 Oct 2020 17:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602091348;
	bh=BC/9LdfiDiOOJJTSIiWe1hIAogFd2Q7zUrLorSYZVpg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iZtN0hc4SK3yr3PEuIdnlmmPAGzP5fGyY8ByUoaT2LhPoYdFMeI8HdY53sQSRQZtu
	 7/0HP/UfU/mZ67EHScBQhE6B8VsDA/615LeVB/P0LUVQwcmrdyipg8A+/E3KGAI7cd
	 vWuwbLyiomMnq4yrXhkS9TaMHiclgZ+/Noijz1DI=
Date: Wed, 7 Oct 2020 10:22:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: print update firmware only once
In-Reply-To: <4b3135ff-4795-e189-0430-da5627419e4e@xen.org>
Message-ID: <alpine.DEB.2.21.2010071022170.23978@sstabellini-ThinkPad-T480s>
References: <09d04b34e6b3b77ac206a42657b1b4116e7e11f3.1602068661.git.bertrand.marquis@arm.com> <4b3135ff-4795-e189-0430-da5627419e4e@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Oct 2020, Julien Grall wrote:
> Hi Bertrand,
> 
> On 07/10/2020 12:05, Bertrand Marquis wrote:
> > Fix enable_smccc_arch_workaround_1 to only print the warning asking to
> > update the firmware once.
> > 
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > ---
> >   xen/arch/arm/cpuerrata.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> > index 6c09017515..0c63dfa779 100644
> > --- a/xen/arch/arm/cpuerrata.c
> > +++ b/xen/arch/arm/cpuerrata.c
> > @@ -187,7 +187,7 @@ warn:
> >           ASSERT(system_state < SYS_STATE_active);
> >           warning_add("No support for ARM_SMCCC_ARCH_WORKAROUND_1.\n"
> >                       "Please update your firmware.\n");
> > -        warned = false;
> > +        warned = true;
> 
> Thanks for spotting it. It looks like I introduced this bug in commit
> 976319fa3de7f98b558c87b350699fffc278effc "xen/arm64: Kill PSCI_GET_VERSION as
> a variant-2 workaround".
> 
> I would suggest to add a fixes tag (can be done on commit).
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


