Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A927B729E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 22:40:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612347.952250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnmBd-0006kC-MP; Tue, 03 Oct 2023 20:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612347.952250; Tue, 03 Oct 2023 20:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnmBd-0006iJ-Jh; Tue, 03 Oct 2023 20:40:09 +0000
Received: by outflank-mailman (input) for mailman id 612347;
 Tue, 03 Oct 2023 20:40:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPao=FR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnmBc-0006iD-AN
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 20:40:08 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08dd7624-622d-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 22:40:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 51DCDB81C04;
 Tue,  3 Oct 2023 20:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF86AC433C8;
 Tue,  3 Oct 2023 20:40:02 +0000 (UTC)
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
X-Inumbo-ID: 08dd7624-622d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696365603;
	bh=uUVD4OP9wvKYRPo9eC5i2jTLOZSo7/zAldhjVvLgLmo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z8yS4y1yeBb87c7Mnv+v3FBnOylMtlF4r0Jllgu6G3uAFHviOUgL7Z+NLJk4bddHl
	 rKUAf9I6UrSjUBlI81c1HMQsvfShKRrvZtndJTFC8HQoPEtfyymxlngctElLXPgtKD
	 tdQoo+KSMENEvvJus5aS3/QTZfXh0SVFmcI0sgKxf4PjhPzCDC7PVGYsufj6ua6wmx
	 SQz8vi9HYLl611MHZ5bh/WkhXWcpnSDbORYawn7MwdHAlG7bOpaBDzmDYqcLnIo/BP
	 keyzBPfAJ85bpaIQpcgYSoZYweW+cxavO0B6U3ZhwAQYH/Xo2ZuPRX8P3J/YhvvZXN
	 GDo7qVpVCyowQ==
Date: Tue, 3 Oct 2023 13:40:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Luca Fancellu <Luca.Fancellu@arm.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
In-Reply-To: <257cb1d3-e5b6-45cc-9b61-4710991693fb@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310031317360.2348112@ubuntu-linux-20-04-desktop>
References: <20230927140133.631192-1-luca.fancellu@arm.com> <20230927140133.631192-4-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2309281726440.1996340@ubuntu-linux-20-04-desktop> <725342EA-730F-4961-88A4-43EC0CBAD5BA@arm.com>
 <alpine.DEB.2.22.394.2309291242570.2348112@ubuntu-linux-20-04-desktop> <bc2a043a-9836-429b-88bb-6bedda5343bf@xen.org> <38AD4AA5-D038-4114-A614-80BF91FB51FB@arm.com> <alpine.DEB.2.22.394.2310021512210.2348112@ubuntu-linux-20-04-desktop>
 <0348B5FA-D65C-4D70-99A4-47398BD4266C@arm.com> <dc16dc72-4a35-457d-b019-2351e3051c32@amd.com> <alpine.DEB.2.22.394.2310031242560.2348112@ubuntu-linux-20-04-desktop> <257cb1d3-e5b6-45cc-9b61-4710991693fb@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1040605223-1696364300=:2348112"
Content-ID: <alpine.DEB.2.22.394.2310031321120.2348112@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1040605223-1696364300=:2348112
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2310031321121.2348112@ubuntu-linux-20-04-desktop>

On Tue, 3 Oct 2023, Julien Grall wrote:
> On 03/10/2023 20:52, Stefano Stabellini wrote:
> > On Tue, 3 Oct 2023, Michal Orzel wrote:
> > > On 03/10/2023 09:44, Luca Fancellu wrote:
> > > > Given that the status after the move to common of the above functions is
> > > > not very clean, I’ve decided to don’t do that,
> > > > however if you are fine with it, I can do the modification and who is
> > > > going to work further on the subject can consolidate
> > > > and make them build for other architecture.
> > > > 
> > > Another option would be to hold off for a while until work on
> > > hyperlaunch/RISCV dom0less starts to better understand the needs,
> > > concepts and to avoid multiple code movement which results in a horrible
> > > history. I know this is not nice but I can tell you that
> > > I had to stop working on some features like FLASK with dom0less, static
> > > domids for dom0less domUs, because according to the hyperlaunch design,
> > > this will need to be common. With hyperlaunch, everything starts with the
> > > domain configuration that is supposed to be arch neutral, so
> > > until this is done, it's difficult to do anything in this area.
> > 
> > This is not good. In an ideal world, Hyperlaunch shouldn't block
> > progress for dom0less. We shouldn't have to wait many months to make
> > progress on FLASK with dom0less, static domids for dom0less domUs, etc.
> > because of potential Hyperlaunch implications.
> 
> It depends what are the implications. If it means that the bindings will
> change a release after. Then I think we should instead work on standardizing
> Hyperlaunch (or whichever name we decide to use) earlier so our users can rely
> on the interface for multiple revisions.
> 
> We could of course decide to maintain both interfaces. But this means more
> maintenance work which could have been avoided by fast tracking Hyperlaunch
> (it is not like we don't know it is coming...).
> 
> > In my option a delay of few weeks might be OK; we should be reasonable.
> > But a delay of few months is not. Cosidering review times, release
> > schedules etc. it could become a very significant delay. >
> > Also, hyperlaunch contributors are not familiar with dom0less and are
> > not familiar with arm. (This is so true that they have their own
> > reimplementation of the parser.) I think the dom0less separation / code
> > movement is better done by us in the arm community because we know the
> > code far better.
> 
> I think we need both the arm and hyperlaunch community to work together (see
> more below).
> 
> > 
> > So I think Luca's suggestion above is in the right direction. I would
> > follow Luca's suggestion with only one difference: I would keep
> > prepare_dtb_domU in the arm code, together with make_gicv*_domU_node and
> > make_vpl011_uart_node. I would move the rest to common.
> 
> Luca's pointed out that some function (such as construct_domU) would contain
> reference to Arm specific code. So with your proposal, I am under the
> impression that we would move code that would then end up to be moved again in
> a few months time. So it is defeating your goal (even though the movement will
> hopefully be smaller).

I was assuming that e.g. construct_domU would reference ARM code, but
the ARM code would live under arch/arm. So yes construct_domU would need
some refactoring in the future to make the call generic instead of
arm-specific, but wouldn't require significant additional code movement.

But maybe I am wrong. I don't know if Luca has a clearer picture in his
mind.


> As I wrote above, I don't think the Arm community alone is in the position to
> decide what should be in common and what should be in arch specific. We need
> the hyperlaunch community to agree on their approach so we can know which
> split makes sense. This is similar to the on-going MMU split to cater the MPU.
> We looked the MPU code to decide of the best split.
> 
> A potential approach would be to look at the RISC-V implementation of dom0less
> and see the common parts. But then we are going in the the scope creep you
> mention earlier.

I didn't do a proper investigation and I didn't look at the RISC-V or
hyperlaunch code in details. From my discussions with both groups, here
is my understanding of arm-specific things we currently have:

- 1:1 memory mapping / static memory / static heap because they are
  currently unimplemented on other arches
- most domU device tree building because most of virtual devices are
  different (timer, interrupt controller, uart, etc)
- the equivalent for dom0: the gic/timer device tree generated nodes
- the blacklist at the beginning of handle_node
- for hyperlaunch, we need to support "module-index" as a way to get the
  physical address of a module
- reserved_memory doesn't exist on x86
- a couple of dom0less device tree properties are arm-specific, such as
  "sve" and "vpl011"

This is me hand-waiving, so it might not be useful.


> So overall, I feel that Lucas' approach is better until Hyperlaunch gain
> momentum.

I am OK with Luca's original approach. I just wanted to open the
discussion in case there is a better way.
--8323329-1040605223-1696364300=:2348112--

