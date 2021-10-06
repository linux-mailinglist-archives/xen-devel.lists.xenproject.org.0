Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB3424ABD
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 01:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203204.358278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYGjE-0001WF-Ct; Wed, 06 Oct 2021 23:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203204.358278; Wed, 06 Oct 2021 23:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYGjE-0001Sm-8a; Wed, 06 Oct 2021 23:53:40 +0000
Received: by outflank-mailman (input) for mailman id 203204;
 Wed, 06 Oct 2021 23:53:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HdqS=O2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYGjD-0001Sg-En
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 23:53:39 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fe05511-2700-11ec-bfb3-12813bfff9fa;
 Wed, 06 Oct 2021 23:53:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F68760F4F;
 Wed,  6 Oct 2021 23:53:37 +0000 (UTC)
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
X-Inumbo-ID: 9fe05511-2700-11ec-bfb3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633564417;
	bh=2ew6kwRO9IN7xHy0/aVljndUL9hn4l2DPhnwBkGgJgU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qut7pVVHnLHrCJ4REXA42HLANJ/fUCy58TkpMm3hPxNjOT/6ROZfpU2Ug+3hWqAi0
	 Q82E1wjyOfyzRi0GME+/Pwtq2ZCeUDz80JVFW3E++fxOH8Dg3iAu89Y0V6TgMtZFTH
	 achEyMPey7VxkFQcdoUDeOUigxSI5bFoTLgl9biksrRXpaDQI/ihRwmkDr7HpU6pIC
	 2X8o7mK4XEgjNeQW5HfTCwdH9djObbm0MMG5ECmAKufA6z0vhHo6iNPwkbihAsOOWo
	 M81CpTPaShzF//MEnI4ISR9rM3ACyCQI7QH9Je26aR6skJm0Wlb28OAFqVNJ8UQLSp
	 o+GM+nMouXecQ==
Date: Wed, 6 Oct 2021 16:53:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, 
    Julien Grall <julien@xen.org>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PING] Re: [PATCH] xen/arm: optee: Allocate anonymous domheap
 pages
In-Reply-To: <81f7699b-69c1-da52-a1a7-5000343bf872@gmail.com>
Message-ID: <alpine.DEB.2.21.2110061639050.3209@sstabellini-ThinkPad-T480s>
References: <1630935741-17088-1-git-send-email-olekstysh@gmail.com> <alpine.DEB.2.21.2109231308200.17979@sstabellini-ThinkPad-T480s> <87bl4jrovq.fsf@epam.com> <81f7699b-69c1-da52-a1a7-5000343bf872@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Oct 2021, Oleksandr wrote:
> Hello all
> 
> Gentle reminder.
 
Many thanks for the ping, this patch fell off my radar.


 
> On 23.09.21 23:57, Volodymyr Babchuk wrote:
> > Hi Stefano,
> > 
> > Stefano Stabellini <sstabellini@kernel.org> writes:
> > 
> > > On Mon, 6 Sep 2021, Oleksandr Tyshchenko wrote:
> > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > 
> > > > Allocate anonymous domheap pages as there is no strict need to
> > > > account them to a particular domain.
> > > > 
> > > > Since XSA-383 "xen/arm: Restrict the amount of memory that dom0less
> > > > domU and dom0 can allocate" the dom0 cannot allocate memory outside
> > > > of the pre-allocated region. This means if we try to allocate
> > > > non-anonymous page to be accounted to dom0 we will get an
> > > > over-allocation issue when assigning that page to the domain.
> > > > The anonymous page, in turn, is not assigned to any domain.
> > > > 
> > > > CC: Julien Grall <jgrall@amazon.com>
> > > > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > > > Acked-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > > Only one question, which is more architectural: given that these pages
> > > are "unlimited", could the guest exploit the interface somehow to force
> > > Xen to allocate an very high number of anonymous pages?
> > > 
> > > E.g. could a domain call OPTEE_SMC_RPC_FUNC_ALLOC in a loop to force Xen
> > > to exaust all memory pages?
> > Generally, OP-TEE mediator tracks all resources allocated and imposes
> > limits on them.
> > 
> > OPTEE_SMC_RPC_FUNC_ALLOC case is a bit different, because it is issued
> > not by domain, but by OP-TEE itself. As OP-TEE is more trusted piece of
> > system we allow it to request as many buffers as it wants. Also, we know
> > that OP-TEE asks only for one such buffer per every standard call. And
> > number of simultaneous calls is limited by number of OP-TEE threads,
> > which is quite low: typically only two.

So let me repeat it differently to see if I understood correctly:

- OPTEE_SMC_RPC_FUNC_ALLOC is only called by OP-TEE, not by the domain
- OPTEE is trusted and only call it twice anyway

I am OK with this argument, but do we have a check to make sure a domU
cannot issue OPTEE_SMC_RPC_FUNC_ALLOC?


Looking at the patch, there are other two places, in addition to
OPTEE_SMC_RPC_FUNC_ALLOC, where the anonymous memory pages can be
allocated:

1) copy_std_request
2) translate_noncontig

We need to prove that neither 1) or 2) can result in a domU exausting
Xen memory.

In the case of 1), it looks like the memory is freed before returning to
the DomU, right? If so, it should be no problem?

In the case of 2), it looks like the memory could outlive the call where
it is allocated. Is there any kind of protection against issuing
something like OPTEE_MSG_ATTR_TYPE_TMEM_INOUT in a loop? Is it OP-TEE
itself that would refuse the attempt? Thus, the idea is that
do_call_with_arg will return error and we'll just free the memory there?

I cannot see a check for errors returned by do_call_with_arg and memory
freeing done because of that. Sorry I am not super familiar with the
code, I am just trying to make sure we are not offering to DomUs an easy
way to crash the system.

It looks like they could be called from one of the OPTEE operations that
a domU could request? Is there a limit for them?

