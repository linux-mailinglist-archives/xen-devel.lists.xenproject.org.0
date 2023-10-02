Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 790787B5D1C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 00:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611785.951342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRNl-00007h-Jq; Mon, 02 Oct 2023 22:27:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611785.951342; Mon, 02 Oct 2023 22:27:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnRNl-00004r-HC; Mon, 02 Oct 2023 22:27:17 +0000
Received: by outflank-mailman (input) for mailman id 611785;
 Mon, 02 Oct 2023 22:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oggk=FQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qnRNk-0008WO-37
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 22:27:16 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d30e3a06-6172-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 00:27:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7FB6DCE104D;
 Mon,  2 Oct 2023 22:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD766C433C7;
 Mon,  2 Oct 2023 22:27:02 +0000 (UTC)
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
X-Inumbo-ID: d30e3a06-6172-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696285624;
	bh=agxx6g+aoO8QNtmXb7LTwbjod4UE6pmvSb5gqS/S0Ag=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p42BjtszruZ/jR3mPvcqSfkmgKOwVebZyBQn3AP3xNGjIrCO4eASg86Mn66hSgqZC
	 RdfbzkEbDfRoGybbU5zcpoj/0Ro6l+I8/91d7e0SwSrKm6/l/NjaH8vXK4mweTuL4o
	 us5eAI1lwmOjEIgt4mpPqdkf47ndQZfBhtI5dxnUF0QCUkVSuEYby3YtQM3tYmPRkd
	 ht3Ls4X8IQJBfOnCNaSIR8mvuOgssfMJiyeUXXN9of23RrDmcJ7ht0HF4roZ9df8kc
	 5HqkCtJGKfMkfALEtXUt9g96c1qo88NnJ84min+THHusz74SB/HPud4xjFcf414ff0
	 Dzy4yob8UZoNA==
Date: Mon, 2 Oct 2023 15:27:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
In-Reply-To: <38AD4AA5-D038-4114-A614-80BF91FB51FB@arm.com>
Message-ID: <alpine.DEB.2.22.394.2310021512210.2348112@ubuntu-linux-20-04-desktop>
References: <20230927140133.631192-1-luca.fancellu@arm.com> <20230927140133.631192-4-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2309281726440.1996340@ubuntu-linux-20-04-desktop> <725342EA-730F-4961-88A4-43EC0CBAD5BA@arm.com>
 <alpine.DEB.2.22.394.2309291242570.2348112@ubuntu-linux-20-04-desktop> <bc2a043a-9836-429b-88bb-6bedda5343bf@xen.org> <38AD4AA5-D038-4114-A614-80BF91FB51FB@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-242397748-1696284850=:2348112"
Content-ID: <alpine.DEB.2.22.394.2310021515050.2348112@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-242397748-1696284850=:2348112
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2310021515051.2348112@ubuntu-linux-20-04-desktop>

On Mon, 2 Oct 2023, Bertrand Marquis wrote:
> > On 2 Oct 2023, at 10:26, Julien Grall <julien@xen.org> wrote:
> > On 29/09/2023 20:48, Stefano Stabellini wrote:
> >> On Fri, 29 Sep 2023, Luca Fancellu wrote:
> >>>> On 29 Sep 2023, at 01:33, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>>> 
> >>>> On Wed, 27 Sep 2023, Luca Fancellu wrote:
> >>>>> Currently the dom0less feature code is mostly inside domain_build.c
> >>>>> and setup.c, it is a feature that may not be useful to everyone so
> >>>>> put the code in a different compilation module in order to make it
> >>>>> easier to disable the feature in the future.
> >>>>> 
> >>>>> Move gic_interrupt_t in domain_build.h to use it with the function
> >>>>> declaration, move its comment above the declaration.
> >>>>> 
> >>>>> The following functions are now visible externally from domain_build
> >>>>> because they are used also from the dom0less-build module:
> >>>>> - get_allocation_size
> >>>>> - set_interrupt
> >>>>> - domain_fdt_begin_node
> >>>>> - make_memory_node
> >>>>> - make_resv_memory_node
> >>>>> - make_hypervisor_node
> >>>>> - make_psci_node
> >>>>> - make_cpus_node
> >>>>> - make_timer_node
> >>>>> - handle_device_interrupts
> >>>>> - construct_domain
> >>>>> - process_shm
> >>>>> 
> >>>>> The functions allocate_static_memory and assign_static_memory_11
> >>>>> are now externally visible, so put their declarations into
> >>>>> domain_build.h and move the #else and stub definition in the header
> >>>>> as well.
> >>>>> 
> >>>>> Move is_dom0less_mode from setup.c to dom0less-build.c and make it
> >>>>> externally visible.
> >>>>> 
> >>>>> Where spotted, fix code style issues.
> >>>>> 
> >>>>> No functional change is intended.
> >>>>> 
> >>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >>>> 
> >>>> This is great! A couple of questions.
> >>>> 
> >>>> Why was allocate_static_memory not moved to dom0less-build.c ?
> >>> 
> >>> My aim is to decouple the features, so in patch 4 we move (just once as Julien suggested)
> >>> the static memory code on a module on its own, because we can have a guest booted with
> >>> dom0less feature but having it with static memory is optional.
> >> OK
> >>>> Would it make sense to also move construct_dom0 to dom0less-build.c
> >>>> given the similarities with construct_domU? I am not sure about this.
> >>>> 
> >>> 
> >>> We can’t do that because the final goal of this serie is to have a Kconfig disabling dom0less,
> >>> so in that case we will end up removing from the compilation also construct_dom0.
> >> OK. Probably we can't do much better than this.
> >> One more question on the code movement, and I would also like Julien and
> >> Bertrand to express their opinions on this.
> >> Given that code movement is painful from a git history perspective, and
> >> given that we have to move dom0less code to xen/common anyway to make
> >> it available to RISC-V and also x86, could we do it in one shot here?
> > 
> > Looking at the name of the functions, I would expect that we would need another code movement in the future to move back Arm specific function under arch/arm/. So we would end up with two code movement as well.
> > 
> > I would prefer if we wait until RISC-V/x86 needs it so we don't unnecessarily move Arm specific code in common/.
> 
> I agree with Julien here.
> Moving the code now will mean moving part of it back in arm in the future once we have a second user of this.
> I would rather wait for the need to come so that we do this cleanly.
> 
> Also using hyperlaunch name now would be weird as there was no agreement on the naming (as far as I know) so far.

RISC-V is already using dom0less code, however in a downstream
repository. To make progress faster the code was copied (not shared)
from arch/arm to arch/riscv. More details on the Xen community call this
week. https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv_aia_support/xen/arch/riscv/domain_build.c?ref_type=heads

Hyperlaunch also needs dom0less code to be made common to make progress:
https://marc.info/?l=xen-devel&m=169154172700539

So I think that there is an immediate RISC-V and X86 need.

But the point about "moving the code now will mean moving part of it
back in arm in the future" is valid. How do we move forward?

I don't think we want to block Luca's progress to wait for more
plumbings done on x86 or RISC-V. Also we don't want to scope creep
Luca's series too much.

But I think the goal should be to move dom0less code to xen/common as
soon as possible and make it arch neutral. How do we get there?
--8323329-242397748-1696284850=:2348112--

