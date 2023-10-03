Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C977B7219
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 21:53:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612331.952220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnlRt-0003nw-Pj; Tue, 03 Oct 2023 19:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612331.952220; Tue, 03 Oct 2023 19:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnlRt-0003lr-Ml; Tue, 03 Oct 2023 19:52:53 +0000
Received: by outflank-mailman (input) for mailman id 612331;
 Tue, 03 Oct 2023 19:52:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPao=FR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnlRs-0003ll-9n
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 19:52:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e43f05e-6226-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 21:52:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C27CFB81C08;
 Tue,  3 Oct 2023 19:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A07C433C8;
 Tue,  3 Oct 2023 19:52:47 +0000 (UTC)
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
X-Inumbo-ID: 6e43f05e-6226-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696362768;
	bh=qfB3NMDnrKvEPdPVqdW8HyS8l7RCPbLsE6Inbx66mok=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=j+xFcrmok6FN4Q4rGmOR2KGD1w/rLYt4g+V3sdv1MaNTE7n6rToipfr+P/R/CxTus
	 tpSM/G06vWCroAmOw4iSxXYS+kb82B9IB31uiPZuLqvRtSxkqHwA2lvEuxifwQn+6C
	 w48OYIIldLxyjvY/p/kfeqpaY3EO9a3H7j8qzGcoUjRPTXN864MzHzfaHZGCyYGMER
	 YmZJUEfjuhAV4vSm7vL+wLj7Z3fYstVk6ewLTKgmPrieZIUCdGQby6+oGPQFS6FN+t
	 E+JGNLuoEt/Wwdre/9S9vXteZ/P9KbmeFnzDch6JR8ZEdyfzEUhwVIuqMQUvqo3Wct
	 UAQsEU5tfYHjg==
Date: Tue, 3 Oct 2023 12:52:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
In-Reply-To: <dc16dc72-4a35-457d-b019-2351e3051c32@amd.com>
Message-ID: <alpine.DEB.2.22.394.2310031242560.2348112@ubuntu-linux-20-04-desktop>
References: <20230927140133.631192-1-luca.fancellu@arm.com> <20230927140133.631192-4-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2309281726440.1996340@ubuntu-linux-20-04-desktop> <725342EA-730F-4961-88A4-43EC0CBAD5BA@arm.com>
 <alpine.DEB.2.22.394.2309291242570.2348112@ubuntu-linux-20-04-desktop> <bc2a043a-9836-429b-88bb-6bedda5343bf@xen.org> <38AD4AA5-D038-4114-A614-80BF91FB51FB@arm.com> <alpine.DEB.2.22.394.2310021512210.2348112@ubuntu-linux-20-04-desktop>
 <0348B5FA-D65C-4D70-99A4-47398BD4266C@arm.com> <dc16dc72-4a35-457d-b019-2351e3051c32@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-559697055-1696362451=:2348112"
Content-ID: <alpine.DEB.2.22.394.2310031247330.2348112@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-559697055-1696362451=:2348112
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2310031247331.2348112@ubuntu-linux-20-04-desktop>

On Tue, 3 Oct 2023, Michal Orzel wrote:
> On 03/10/2023 09:44, Luca Fancellu wrote:
> >>>>> Given that code movement is painful from a git history perspective, and
> >>>>> given that we have to move dom0less code to xen/common anyway to make
> >>>>> it available to RISC-V and also x86, could we do it in one shot here?
> >>>>
> >>>> Looking at the name of the functions, I would expect that we would need another code movement in the future to move back Arm specific function under arch/arm/. So we would end up with two code movement as well.
> >>>>
> >>>> I would prefer if we wait until RISC-V/x86 needs it so we don't unnecessarily move Arm specific code in common/.
> >>>
> >>> I agree with Julien here.
> >>> Moving the code now will mean moving part of it back in arm in the future once we have a second user of this.
> >>> I would rather wait for the need to come so that we do this cleanly.
> >>>
> >>> Also using hyperlaunch name now would be weird as there was no agreement on the naming (as far as I know) so far.
> >>
> >> RISC-V is already using dom0less code, however in a downstream
> >> repository. To make progress faster the code was copied (not shared)
> >> from arch/arm to arch/riscv. More details on the Xen community call this
> >> week. https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv_aia_support/xen/arch/riscv/domain_build.c?ref_type=heads
> >>
> >> Hyperlaunch also needs dom0less code to be made common to make progress:
> >> https://marc.info/?l=xen-devel&m=169154172700539
> >>
> >> So I think that there is an immediate RISC-V and X86 need.
> >>
> >> But the point about "moving the code now will mean moving part of it
> >> back in arm in the future" is valid. How do we move forward?
> >>
> >> I don't think we want to block Luca's progress to wait for more
> >> plumbings done on x86 or RISC-V. Also we don't want to scope creep
> >> Luca's series too much.
> >>
> >> But I think the goal should be to move dom0less code to xen/common as
> >> soon as possible and make it arch neutral. How do we get there?
> > 
> > So here is why I felt painful doing now a move to the common code, but maybe you (maintainers) can give me some
> > feedbacks.
> > 
> > I see that the functions that might be put in common are these, some of them however have arm specific code in them:
> > 
> > is_dom0less_mode
> > allocate_bank_memory
> > allocate_memory
> > handle_passthrough_prop
> > handle_prop_pfdt
> > scan_pfdt_node
> > check_partial_fdt
> > domain_p2m_pages
> > alloc_xenstore_evtchn
> > domain_handle_dtb_bootmodule (contains reference to the gic)
> > prepare_dtb_domU (have reference to psci, gic, vpl011)
> > construct_domU (have reference to vpl011, static shared memory)
> > create_domUs(have reference to vpl011, sve)
> > 
> > Here the functions that can stay in arm code:
> > 
> > make_gicv2_domU_node
> > make_gicv3_domU_node
> > make_gic_domU_node
> > make_vpl011_uart_node
> > 
> > 
> > Given that the status after the move to common of the above functions is not very clean, I’ve decided to don’t do that,
> > however if you are fine with it, I can do the modification and who is going to work further on the subject can consolidate
> > and make them build for other architecture.
> > 
> Another option would be to hold off for a while until work on hyperlaunch/RISCV dom0less starts to better understand the needs,
> concepts and to avoid multiple code movement which results in a horrible history. I know this is not nice but I can tell you that
> I had to stop working on some features like FLASK with dom0less, static domids for dom0less domUs, because according to the hyperlaunch design,
> this will need to be common. With hyperlaunch, everything starts with the domain configuration that is supposed to be arch neutral, so
> until this is done, it's difficult to do anything in this area.

This is not good. In an ideal world, Hyperlaunch shouldn't block
progress for dom0less. We shouldn't have to wait many months to make
progress on FLASK with dom0less, static domids for dom0less domUs, etc.
because of potential Hyperlaunch implications.

In my option a delay of few weeks might be OK; we should be reasonable.
But a delay of few months is not. Cosidering review times, release
schedules etc. it could become a very significant delay.

Also, hyperlaunch contributors are not familiar with dom0less and are
not familiar with arm. (This is so true that they have their own
reimplementation of the parser.) I think the dom0less separation / code
movement is better done by us in the arm community because we know the
code far better.

So I think Luca's suggestion above is in the right direction. I would
follow Luca's suggestion with only one difference: I would keep
prepare_dtb_domU in the arm code, together with make_gicv*_domU_node and
make_vpl011_uart_node. I would move the rest to common.
--8323329-559697055-1696362451=:2348112--

