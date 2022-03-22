Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8714E454E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 18:41:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293615.498822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWiUd-00014n-LP; Tue, 22 Mar 2022 17:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293615.498822; Tue, 22 Mar 2022 17:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWiUd-00012U-IB; Tue, 22 Mar 2022 17:40:27 +0000
Received: by outflank-mailman (input) for mailman id 293615;
 Tue, 22 Mar 2022 17:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+E5=UB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWiUc-00012O-R8
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 17:40:26 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27e53a24-aa07-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 18:40:25 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9B1D5B81D2E;
 Tue, 22 Mar 2022 17:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3324C340EC;
 Tue, 22 Mar 2022 17:40:22 +0000 (UTC)
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
X-Inumbo-ID: 27e53a24-aa07-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647970823;
	bh=nOY8lzCdaCZbH420j/ZDsLev1CHwxxeUemG4nquF+Mc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XzX2URVY1q475BIfJhYgB9GCJBWpA4+jujuMzVs/cqZF6t+a1rI2+05WwWiD33l+/
	 S9mnDQK54JRcr+muNH/ImamP4m7SlW51pzFKx1oqbE/7VzbaNZwD/VviGMwz4fCnOR
	 AKLm/eGxbTR7P9Z1yt5ZidJzI2D5yXhjL6o1TbubQ+EVFV6m3D5nU5AEKHXbk2oB/0
	 J8RAatRrAxrMVuzW7j1lnx1vdBWNz8uMwhYqBNSKUhQ3IpfM6i25T2SF9rgO58shjX
	 ixMOYlb2oAL/o5GDNlBcKM75efQ+yLf9Rsh+xayObFDUzhWic+IcOX7g4vJLrI8yXz
	 lIxJkOYU+OuMQ==
Date: Tue, 22 Mar 2022 10:40:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
In-Reply-To: <27898878-F215-4993-805E-BAF04D2D07BC@arm.com>
Message-ID: <alpine.DEB.2.22.394.2203221035490.2910984@ubuntu-linux-20-04-desktop>
References: <20220318152541.7460-1-luca.fancellu@arm.com> <20220318152541.7460-5-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2203211541030.2910984@ubuntu-linux-20-04-desktop> <27898878-F215-4993-805E-BAF04D2D07BC@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-793075401-1647970699=:2910984"
Content-ID: <alpine.DEB.2.22.394.2203221038240.2910984@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-793075401-1647970699=:2910984
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2203221038241.2910984@ubuntu-linux-20-04-desktop>

On Tue, 22 Mar 2022, Luca Fancellu wrote:
> >> +- cpupool-sched (optional)
> >> +
> >> +    Must be a string having the name of a Xen scheduler, it has no effect when
> >> +    used in conjunction of a cpupool-id equal to zero, in that case the
> >> +    default Xen scheduler is selected (sched=<...> boot argument).
> >> +    Check the sched=<...> boot argument for allowed values.
> > 
> > I am happy with this version of the device tree bindings, thanks for
> > your efforts to update them. Only one comment left: please update the
> > description not to include "cpupool-id" given that there is no
> > cpupool-id property anymore :-)
> > 
> 
> Hi Stefano,
> 
> Thank you for your review,
> 
> Yes I missed that! I will fix in the next serie.
> 
> >> 
> >> +/*
> >> + * pool_cpu_map:   Index is logical cpu number, content is cpupool id, (-1) for
> >> + *                 unassigned.
> >> + * pool_sched_map: Index is cpupool id, content is scheduler id, (-1) for
> >> + *                 unassigned.
> >> + */
> >> +static int __initdata pool_cpu_map[NR_CPUS]   = { [0 ... NR_CPUS-1] = -1 };
> >> +static int __initdata pool_sched_map[NR_CPUS] = { [0 ... NR_CPUS-1] = -1 };
> >> +static unsigned int __initdata next_pool_id;
> >> +
> >> +#ifdef CONFIG_HAS_DEVICE_TREE
> > 
> > BOOT_TIME_CPUPOOLS depends on HAS_DEVICE_TREE, so it is not possible to
> > have BOOT_TIME_CPUPOOLS but not HAS_DEVICE_TREE ?
> 
> Yes you are right, the ifdef is not needed at this stage since only arch with device tree are
> using it, if x86 would like to implement a command line version then the code will be ifdef-ined
> later.
> 
> > 
> > 
> >> +#define BTCPUPOOLS_DT_NODE_NO_REG     (-1)
> >> +#define BTCPUPOOLS_DT_NODE_NO_LOG_CPU (-2)
> >> +
> >> +static int __init get_logical_cpu_from_hw_id(unsigned int hwid)
> >> +{
> >> +    unsigned int i;
> >> +
> >> +    for ( i = 0; i < nr_cpu_ids; i++ )
> >> +        if ( cpu_physical_id(i) == hwid )
> >> +            return i;
> >> +
> >> +    return -1;
> >> +}
> > 
> > I wonder if there is a better way to implement this function but I am
> > not sure. Also, it might be better to avoid premature optimizations.
> > 
> > That said, we could check first the simple case where hwid==i. Looking
> > at various existing device tree, it seems to be the most common case.
> > 
> > This is not a requirement, just a hand-wavy suggestion. I think the
> > patch is also OK as is.
> > 
> 
> Not sure to understand here, at least on FVP (the first DT I have around), hwid != i,
> Or maybe I didn’t understand what you mean

I am not surprised. In many boards hwid == i, but it is not a guarantee
at all.

To be honest mine was not really a concrete suggestion, more like the
beginning of a discussion on the subject. The goal would be to avoid
having to scan the __cpu_logical_map array every time without adding a
second data structure. I don't feel strongly about it but I thought I
would mention it anyway just in case you (or someone else) gets a better
idea on how to do this.
--8323329-793075401-1647970699=:2910984--

