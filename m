Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310687B3ACB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 21:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610679.950164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmJU1-0007D4-Rp; Fri, 29 Sep 2023 19:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610679.950164; Fri, 29 Sep 2023 19:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qmJU1-0007AQ-P5; Fri, 29 Sep 2023 19:49:05 +0000
Received: by outflank-mailman (input) for mailman id 610679;
 Fri, 29 Sep 2023 19:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qmJU0-0007AK-4J
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 19:49:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c2346cb-5f01-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 21:49:01 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4BD761F96;
 Fri, 29 Sep 2023 19:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBA1C433C8;
 Fri, 29 Sep 2023 19:48:58 +0000 (UTC)
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
X-Inumbo-ID: 3c2346cb-5f01-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696016939;
	bh=tmQEkieqWFC2ArBs2Uw6mo4JCU0RmXKSjJbDYXVpN58=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rpqFveqWPi0z4ODOcBt4kWudpiUaa6m6q/iWwlas6YtFx+kPTQ6zNg8L5BckiqSOw
	 dykIN8qZszNcvblHZ0nc+jY2vbwguSdxDFN5bwE5kNLAG4OTv2xrEA7kLhVXvrjths
	 5OrrQIUrGN2VdNpahGnDXZSsCQTypExzESzaY00gIenjCy96v4stT0rUW/n7cxKMyw
	 HllwDYbWtxpKcqCl+ZR7NDiHISZmGYzoGdwLJ0+aTeSlRfR8nqhXIm7Prs1s+XqwyY
	 sS5Thdx7oKYXWwSYK9xfxbkSjC2lNnwm1nIwDYyKyhSZ8SkLIzNLbUdgeKIvB/B48i
	 UanmHlZTj9efA==
Date: Fri, 29 Sep 2023 12:48:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
In-Reply-To: <725342EA-730F-4961-88A4-43EC0CBAD5BA@arm.com>
Message-ID: <alpine.DEB.2.22.394.2309291242570.2348112@ubuntu-linux-20-04-desktop>
References: <20230927140133.631192-1-luca.fancellu@arm.com> <20230927140133.631192-4-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2309281726440.1996340@ubuntu-linux-20-04-desktop> <725342EA-730F-4961-88A4-43EC0CBAD5BA@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1360969929-1696016668=:2348112"
Content-ID: <alpine.DEB.2.22.394.2309291244320.2348112@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1360969929-1696016668=:2348112
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2309291244321.2348112@ubuntu-linux-20-04-desktop>

On Fri, 29 Sep 2023, Luca Fancellu wrote:
> > On 29 Sep 2023, at 01:33, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Wed, 27 Sep 2023, Luca Fancellu wrote:
> >> Currently the dom0less feature code is mostly inside domain_build.c
> >> and setup.c, it is a feature that may not be useful to everyone so
> >> put the code in a different compilation module in order to make it
> >> easier to disable the feature in the future.
> >> 
> >> Move gic_interrupt_t in domain_build.h to use it with the function
> >> declaration, move its comment above the declaration.
> >> 
> >> The following functions are now visible externally from domain_build
> >> because they are used also from the dom0less-build module:
> >> - get_allocation_size
> >> - set_interrupt
> >> - domain_fdt_begin_node
> >> - make_memory_node
> >> - make_resv_memory_node
> >> - make_hypervisor_node
> >> - make_psci_node
> >> - make_cpus_node
> >> - make_timer_node
> >> - handle_device_interrupts
> >> - construct_domain
> >> - process_shm
> >> 
> >> The functions allocate_static_memory and assign_static_memory_11
> >> are now externally visible, so put their declarations into
> >> domain_build.h and move the #else and stub definition in the header
> >> as well.
> >> 
> >> Move is_dom0less_mode from setup.c to dom0less-build.c and make it
> >> externally visible.
> >> 
> >> Where spotted, fix code style issues.
> >> 
> >> No functional change is intended.
> >> 
> >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > 
> > This is great! A couple of questions.
> > 
> > Why was allocate_static_memory not moved to dom0less-build.c ?
> 
> My aim is to decouple the features, so in patch 4 we move (just once as Julien suggested)
> the static memory code on a module on its own, because we can have a guest booted with
> dom0less feature but having it with static memory is optional.

OK


> > Would it make sense to also move construct_dom0 to dom0less-build.c
> > given the similarities with construct_domU? I am not sure about this.
> > 
> 
> We can’t do that because the final goal of this serie is to have a Kconfig disabling dom0less,
> so in that case we will end up removing from the compilation also construct_dom0.

OK. Probably we can't do much better than this.


One more question on the code movement, and I would also like Julien and
Bertrand to express their opinions on this.

Given that code movement is painful from a git history perspective, and
given that we have to move dom0less code to xen/common anyway to make
it available to RISC-V and also x86, could we do it in one shot here?

I am not asking to refactor the code to make it buildable on RISC-V or
X86. I am only asking to move the code to xen/common/dom0less (or
xen/common/hyperlaunch or xen/common/domain-builder as Danien and
Christopher called it) the same way you are doing it as part of this
series. It shouldn't require additional work on your side I hope.
--8323329-1360969929-1696016668=:2348112--

