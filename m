Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B13584873
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 00:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377197.610282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHCRC-0005pK-O4; Thu, 28 Jul 2022 22:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377197.610282; Thu, 28 Jul 2022 22:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHCRC-0005mw-LE; Thu, 28 Jul 2022 22:57:02 +0000
Received: by outflank-mailman (input) for mailman id 377197;
 Thu, 28 Jul 2022 22:57:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oHCRB-0005md-RG
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 22:57:01 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95becba6-0ec8-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 00:57:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B2296CE259A;
 Thu, 28 Jul 2022 22:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74F0C433B5;
 Thu, 28 Jul 2022 22:56:55 +0000 (UTC)
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
X-Inumbo-ID: 95becba6-0ec8-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659049016;
	bh=7HcUjbpRugDsm/OaanGW6Nhd2FkfLulFUst1ug6kHDE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gIPx7UJ6dkf+8hdT4QaFayC1fsNCXn8rScevHGK31NBM/UgYRmvCiVZsAkx1DSW6R
	 2SB7XPOpZWwFqV3q1FR4hCX/Y0yie1Lj5dhKBd5cHun/WfG/EGG9Tkdr4lXA8OZ5IV
	 VqC9lqqz/2tI51eQCU8ZECJXgmYyrO138aIj+8WEz2SmuI2esHQ6Jz9qC8Wf7EZXNh
	 hDq2K9AAhRHhe4dJRXnbvh5sV4N/9Zthw8xpQf1wBVB4Fb/JdsLxVVO8jD/7sGmZeT
	 5fmMHeyzujjvhkEzADBQfCE6BYmFmwZZldxq7wRL6NnfcY9kxbTnxYzk6BycFiDcHi
	 dxbqYqwj36gYQ==
Date: Thu, 28 Jul 2022 15:56:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7
 violation
In-Reply-To: <c71c9522-2df5-35a3-d39c-706d5c9d5263@xen.org>
Message-ID: <alpine.DEB.2.22.394.2207281551140.4648@ubuntu-linux-20-04-desktop>
References: <20220728134943.1185621-1-burzalodowa@gmail.com> <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org> <83c17bf6-b9b2-a297-6f7f-dd08231d0f90@suse.com> <c71c9522-2df5-35a3-d39c-706d5c9d5263@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 28 Jul 2022, Julien Grall wrote:
> On 28/07/2022 15:20, Jan Beulich wrote:
> > On 28.07.2022 15:56, Julien Grall wrote:
> > > On 28/07/2022 14:49, Xenia Ragiadakou wrote:
> > > > --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> > > > +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> > > > @@ -461,7 +461,7 @@
> > > >    /* Access to system registers */
> > > >       #define WRITE_SYSREG64(v, name) do {                    \
> > > > -    uint64_t _r = v;                                    \
> > > > +    uint64_t _r = (v);                                              \
> > > 
> > > I am failing to see why the parentheses are necessary here. Could you
> > > give an example where the lack of them would end up to different code?
> > 
> > I think it is merely good practice to parenthesize the right sides of =.
> > Indeed with assignment operators having second to lowest precedence, and
> > with comma (the lowest precedence one) requiring parenthesization at the
> > macro invocation site, there should be no real need for parentheses here.
> 
> I am not really happy with adding those parentheses because they are
> pointless. But if there are a consensus to use it, then the commit message
> should be updated to clarify this is just here to please MISRA (to me "need"
> implies it would be bug).

Let me premise that I don't know if this counts as a MISRA violation or
not. (Also I haven't checked if cppcheck/eclair report it as violation.)

But I think the reason for making the change would be to follow our
coding style / coding practices. It makes the code simpler to figure out
that it is correct, to review and maintain if we always add the
parenthesis even in cases like this one where they are not strictly
necessary. We are going to save our future selves some mental cycles.

So the explanation on the commit message could be along those lines.

