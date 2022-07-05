Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010FD567A90
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 01:09:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361664.591306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8rev-0002K8-4T; Tue, 05 Jul 2022 23:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361664.591306; Tue, 05 Jul 2022 23:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8rev-0002HP-0X; Tue, 05 Jul 2022 23:08:45 +0000
Received: by outflank-mailman (input) for mailman id 361664;
 Tue, 05 Jul 2022 23:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TIdu=XK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o8ret-0002HJ-BC
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 23:08:43 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69102048-fcb7-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 01:08:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BE659B81A49;
 Tue,  5 Jul 2022 23:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31FEC341C7;
 Tue,  5 Jul 2022 23:08:38 +0000 (UTC)
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
X-Inumbo-ID: 69102048-fcb7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657062519;
	bh=r1VDUMkTnRYUiegjaiup8SAtXqOPuKp/Q0u2H7QOE24=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VDoNxz47GhCu/Z6UiG/g8rtERqz9z+wehRxOUZO5GETtoGiyJWeXpBBlDtwFP8/Nh
	 x+SbN8HqXhhobn2Q0NNIm/9vkUWMT69bl6ogDP+Sg/Y41mzLURQxv+9NYiW8PEacFx
	 fR2Zjw0LEveCWht4ZtKzyOT9wrtFFFunKt4WAtB8jhFukTwIjR65cZdF1lmrDcJ3u2
	 +c02SaY1m0VPQZvS11Ciu/lHCM66SN/w9T7Ak9Ha7uG47Hz8NgbATI+fhTitsG7LPk
	 +XhBX0K4iO+spsF1c5ObrzKBmz314+nFENFsXawQABgfYtLNHTtzUcEhlXutPrdvaI
	 u6TqrYupQYyKg==
Date: Tue, 5 Jul 2022 16:08:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/4] xen/arm: traps: Fix MISRA C 2012 Rule 8.4
 violations
In-Reply-To: <0afd7250-b157-7fb2-1fdb-78955d2bf262@xen.org>
Message-ID: <alpine.DEB.2.22.394.2207051604270.2354836@ubuntu-linux-20-04-desktop>
References: <20220705210218.483854-1-burzalodowa@gmail.com> <20220705210218.483854-2-burzalodowa@gmail.com> <f0f36355-29c5-7355-f784-4d844ebc5566@xen.org> <0accbe13-2155-185f-5d77-a590e1855af3@gmail.com> <0afd7250-b157-7fb2-1fdb-78955d2bf262@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Jul 2022, Julien Grall wrote:
> Hi Xenia,
> 
> On 05/07/2022 22:49, Xenia Ragiadakou wrote:
> > On 7/6/22 00:28, Julien Grall wrote:
> > > Hi Xenia,
> > > 
> > > On 05/07/2022 22:02, Xenia Ragiadakou wrote:
> > > > Add the function prototypes of the functions below in <asm/processor.h>
> > > > header
> > > > file so that they are visible before the function definitions in
> > > > traps.c.
> > > > enter_hypervisor_from_guest_preirq()
> > > > enter_hypervisor_from_guest()
> > > > do_trap_hyp_sync()
> > > > do_trap_guest_sync()
> > > > do_trap_irq()
> > > > do_trap_fiq()
> > > > leave_hypervisor_to_guest()
> > > 
> > > I have actually came across those missing prototypes in the past and I
> > > have refrained to add them because they are not meant to be called from C.
> > > 
> > > While I agree this is a violation of Misra C, I am still not convinced
> > > they should be added (there is no need to verify the prototype).
> > 
> > Yes, there is no need. Here, I decided to follow the example of
> > do_trap_hyp_serror() and do_trap_guest_serror() for consistency.
> 
> do_trap_guest_serror() is called from C code (see arch/arm32/traps.c).
> 
> do_trap_hyp_serror() is called only from assembly. I would argue that if you
> want consistency, then you should drop the prototype rather than modifying 90%
> of the other examples.
> 
> Otherwise, this is not really consistency but more a design choice (you want
> to be fully compliant with MISRA).

Actually I am not sure that MISRA requires prototypes for assembly
functions only meant to be called from assembly. I think MISRA requires
detailed docs for anything assembly, but I don't think it requires C
prototypes for all assembly functions.

So I think we could skip them for now. At some point we'll discuss what
we need to do for the assembly code but we haven't tackled that yet.

