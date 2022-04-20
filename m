Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6425507DA9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 02:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308522.524292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngyJ6-0001Q4-Vm; Wed, 20 Apr 2022 00:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308522.524292; Wed, 20 Apr 2022 00:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngyJ6-0001O0-Sg; Wed, 20 Apr 2022 00:34:56 +0000
Received: by outflank-mailman (input) for mailman id 308522;
 Wed, 20 Apr 2022 00:34:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBwa=U6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ngyJ5-0001Nu-F9
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 00:34:55 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b258ad80-c041-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 02:34:54 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9BED1B811C7;
 Wed, 20 Apr 2022 00:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9548C385A7;
 Wed, 20 Apr 2022 00:34:51 +0000 (UTC)
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
X-Inumbo-ID: b258ad80-c041-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650414892;
	bh=iRq8BXl9iMFT+K6WlY9Njhg/Dz0k3u7vlWsm6hS6vHs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=D4Znh4nc2FtQ0RWdPtMVVElHDQanv0jzV6kykOdphWzAiYQudMwSJO+b1NW7PcRRl
	 1/oLcM4fpyYqPdAiu+7hm6ZLfC4KbHcguzvGs3S04cfaGo8Osncc4WcE3XoDODTYQ8
	 Y13Ev4aQ9/xFOeg/xHP4r4o8jFxpPvIbUmyvcjCom+SlEQGpxAurw3zTZH/Wokdpmo
	 csDG9VcFZrhSFrbEg0+1QZGXmXN8nzTybCGr+DHaa3O0qs598FVuy9m3SrlqQjRuOZ
	 PlHGrse8KPAozz8mQDAwqrXy2uq9G0Kp9Espp5zkhymvJiwjHTnKiY8egI7XQL3BR/
	 4vUJvKLwpLXig==
Date: Tue, 19 Apr 2022 17:34:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Make use of DT_MATCH_TIMER in make_timer_node
In-Reply-To: <c2030fd0-8aed-6a68-e275-77d22f972dfc@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204191729120.915916@ubuntu-linux-20-04-desktop>
References: <20220414095843.102305-1-michal.orzel@arm.com> <alpine.DEB.2.22.394.2204151609140.915916@ubuntu-linux-20-04-desktop> <c2030fd0-8aed-6a68-e275-77d22f972dfc@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Apr 2022, Michal Orzel wrote:
> Hi Stefano,
> 
> On 16.04.2022 01:10, Stefano Stabellini wrote:
> > On Thu, 14 Apr 2022, Michal Orzel wrote:
> >> DT_MATCH_TIMER stores the compatible timer ids and as such should be
> >> used in all the places where we need to refer to them. make_timer_node
> >> explicitly lists the same ids as the ones defined in DT_MATCH_TIMER so
> >> make use of this macro instead.
> >>
> >> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> > 
> > This is a good cleanup, thanks! time.h is not currently included by
> > domain_build.c, I think we should add:
> > 
> > #include <asm/time.h>
> > 
> > to domain_build.c 
> > 
> asm/time.h is included by xen/time.h which is included by xen/irq.h.
> That is why there is no build failure and the patch itself is correct.
> 
> Furthermore DT_MATCH_TIMER is already used in domain_build.c (handle_node)
> together with other constructs like TIMER_PHYS_SECURE_PPI defined in asm/time.h.

OK, fair point. We should disentangle the headers at some point but
given that this patch is not making anything worse:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

and committed

