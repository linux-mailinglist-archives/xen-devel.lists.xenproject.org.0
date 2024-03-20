Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FB1881A45
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 00:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696159.1086820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn5kH-0001dc-Qo; Wed, 20 Mar 2024 23:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696159.1086820; Wed, 20 Mar 2024 23:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn5kH-0001b5-Np; Wed, 20 Mar 2024 23:53:21 +0000
Received: by outflank-mailman (input) for mailman id 696159;
 Wed, 20 Mar 2024 23:53:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iFPB=K2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rn5kF-0001az-V9
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 23:53:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05eb7649-e715-11ee-afde-a90da7624cb6;
 Thu, 21 Mar 2024 00:53:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D237960C84;
 Wed, 20 Mar 2024 23:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752CBC433C7;
 Wed, 20 Mar 2024 23:53:15 +0000 (UTC)
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
X-Inumbo-ID: 05eb7649-e715-11ee-afde-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710978796;
	bh=gkd7ejGUwM4leY38+kndu78bO61qIqQLQ2AbPuP3s6M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gGQ2gKcdFpJdCSX4pA/wF6Na8O/PpEo1ln9+oxy5G77ZrTgs/iQbYAJY4hCU9rOj6
	 0uVKMfm26e9xZV3e0ST3o7oHupeAyVe4Sk90A/TcXVUSmsFvIUDR26Fn/NrQ5VaKdj
	 Ok+akfUjfH8p7ZIcGu0e5zb9Frcq1+j6fsvLi1HMMNRyQ7gQGRsLKiSjJxFu/JVoeh
	 4sji6gfJztkzZdJgKZBKW3VWKBaphvEtAEkjLjctWcov6M+NoIrc+h2ipGSD6PNUl+
	 z7VBIuZjxghdsSedkzC3cGmOM+2tNNhyDret0v6e/AH8/MSOg/QVr1YkkzAOQ1v9oy
	 hM1uu7bqe4OJg==
Date: Wed, 20 Mar 2024 16:53:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: John Ernberg <john.ernberg@actia.se>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Peng Fan <peng.fan@nxp.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jonas Blixt <jonas.blixt@actia.se>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
In-Reply-To: <849f3f5a-b960-444a-a10e-1f2df36c22a7@xen.org>
Message-ID: <alpine.DEB.2.22.394.2403201647030.1569010@ubuntu-linux-20-04-desktop>
References: <20240131114952.305805-1-john.ernberg@actia.se> <20240131114952.305805-2-john.ernberg@actia.se> <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org> <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se> <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
 <a265ea2d-9b5f-4726-9395-448b1b669839@actia.se> <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org> <DU0PR04MB94170CB1F77E3D594A6D0E9488402@DU0PR04MB9417.eurprd04.prod.outlook.com> <5a0c8f09-4f01-45e9-892c-86342c0d0ec5@xen.org> <08ae764c-3490-4dd1-ab70-7a855a98d16d@actia.se>
 <911ec1bb-3733-4f37-839e-673a88e408ff@actia.se> <ab61278a-f3f1-41de-a0b2-eca6f19be103@xen.org> <848794f3-a337-49d9-84db-a969970f071b@actia.se> <48038c7f-d7cd-4100-a41b-8042bcb93208@xen.org> <967020E7-3D03-416A-8BFC-6F4E4BD9D7B5@arm.com>
 <c17e0eeb-b679-4685-9ae9-6662c2035500@actia.se> <849f3f5a-b960-444a-a10e-1f2df36c22a7@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Mar 2024, Julien Grall wrote:
> Hi John,
> 
> On 20/03/2024 16:24, John Ernberg wrote:
> > Hi Bertrand,
> > 
> > On 3/13/24 11:07, Bertrand Marquis wrote:
> > > Hi,
> > > 
> > > > On 8 Mar 2024, at 15:04, Julien Grall <julien@xen.org> wrote:
> > > > 
> > > > Hi John,
> > > > 
> > > > Thank you for the reply.
> > > > 
> > > > On 08/03/2024 13:40, John Ernberg wrote:
> > > > > On 3/7/24 00:07, Julien Grall wrote:
> > > > > >    > Ping on the watchdog discussion bits.
> > > > > > 
> > > > > > Sorry for the late reply.
> > > > > > 
> > > > > > On 06/03/2024 13:13, John Ernberg wrote:
> > > > > > > On 2/9/24 14:14, John Ernberg wrote:
> > > > > > > > 
> > > > > > > > >       * IMX_SIP_TIMER_*:  This seems to be related to the
> > > > > > > > > watchdog.
> > > > > > > > > Shouldn't dom0 rely on the watchdog provided by Xen instead?
> > > > > > > > > So those
> > > > > > > > > call will be used by Xen.
> > > > > > > > 
> > > > > > > > That is indeed a watchdog SIP, and also for setting the SoC
> > > > > > > > internal RTC
> > > > > > > > if it is being used.
> > > > > > > > 
> > > > > > > > I looked around if there was previous discussion and only really
> > > > > > > > found [3].
> > > > > > > > Is the xen/xen/include/watchdog.h header meant to be for this
> > > > > > > > kind of
> > > > > > > > watchdog support or is that more for the VM watchdog? Looking at
> > > > > > > > the x86
> > > > > > > > ACPI NMI watchdog it seems like the former, but I have never
> > > > > > > > worked with
> > > > > > > > x86 nor ACPI.
> > > > > > 
> > > > > > include/watchdog.h contains helper to configure the watchdog for
> > > > > > Xen. We
> > > > > > also have per-VM watchdog and this is configured by the hypercall
> > > > > > SCHEDOP_watchdog.
> > > > > > 
> > > > > > > > 
> > > > > > > > Currently forwarding it to Dom0 has not caused any watchdog
> > > > > > > > resets with
> > > > > > > > our watchdog timeout settings, our specific Dom0 setup and VM
> > > > > > > > count.
> > > > > > 
> > > > > > IIUC, the SMC API for the watchdog would be similar to the ACPI NMI
> > > > > > watchdog. So I think it would make more sense if this is not exposed
> > > > > > to
> > > > > > dom0 (even if Xen is doing nothing with it).
> > > > > > 
> > > > > > Can you try to hide the SMCs and check if dom0 still behave
> > > > > > properly?
> > > > > > 
> > > > > > Cheers,
> > > > > > 
> > > > > This SMC manages a hardware watchdog, if it's not pinged within a
> > > > > specific interval the entire board resets.
> > > > 
> > > > Do you know what's the default interval? Is it large enough so Xen +
> > > > dom0 can boot (at least up to when the watchdog driver is initialized)?
> > > > 
> > > > > If I block the SMCs the watchdog driver in Dom0 will fail to ping the
> > > > > watchdog, triggering a board reset because the system looks to have
> > > > > become unresponsive. The reason this patch set started is because we
> > > > > couldn't ping the watchdog when running with Xen.
> > > > > In our specific system the bootloader enables the watchdog as early as
> > > > > possible so that we can get watchdog protection for as much of the
> > > > > boot
> > > > > as we possibly can.
> > > > > So, if we are to block the SMC from Dom0, then Xen needs to take over
> > > > > the pinging. It could be implemented similarly to the NMI watchdog,
> > > > > except that the system will reset if the ping is missed rather than
> > > > > backtrace.
> > > > > It would also mean that Xen will get a whole watchdog driver-category
> > > > > due to the watchdog being vendor and sometimes even SoC specific when
> > > > > it
> > > > > comes to Arm.
> > > > > My understanding of the domain watchdog code is that today the domain
> > > > > needs to call SCHEDOP_watchdog at least once to start the watchdog
> > > > > timer. Since watchdog protection through the whole boot process is
> > > > > desirable we'd need some core changes, such as an option to start the
> > > > > domain watchdog on init. >
> > > > > It's quite a big change to make
> > > > 
> > > > For clarification, above you seem to mention two changes:
> > > > 
> > > > 1) Allow Xen to use the HW watchdog
> > > > 2) Allow the domain to use the watchdog early
> > > > 
> > > > I am assuming by big change, you are referring to 2?
> > > > 
> > > > , while I am not against doing it if it
> > > > > makes sense, I now wonder if Xen should manage hardware watchdogs.
> > > > > Looking at the domain watchdog code it looks like if a domain does not
> > > > > get enough execution time, the watchdog will not be pinged enough and
> > > > > the guest will be reset. So either watchdog approach requires Dom0 to
> > > > > get execution time. Dom0 also needs to service all the PV backends
> > > > > it's
> > > > > responsible for. I'm not sure it's valuable to add another layer of
> > > > > watchdog for this scenario as the end result (checking that the entire
> > > > > system works) is achieved without it as well.
> > > > > So, before I try to find the time to make a proposal for moving the
> > > > > hardware watchdog bit to Xen, do we really want it?
> > > > 
> > > > Thanks for the details. Given that the watchdog is enabled by the
> > > > bootloader, I think we want Xen to drive the watchdog for two reasons:
> > > > 1) In true dom0less environment, dom0 would not exist
> > > > 2) You are relying on Xen + Dom0 to boot (or at least enough to get the
> > > > watchdog working) within the watchdog interval.
> > > 
> > > Definitely we need to consider the case where there is no Dom0.
> > > 
> > > I think there are in fact 3 different use cases here:
> > > - watchdog fully driven in a domain (dom0 or another): would work if it is
> > > expected
> > >     that Xen + Domain boot time is under the watchdog initial refresh
> > > rate. I think this
> > >     could make sense on some applications where your system depends on a
> > > specific
> > >     domain to be properly booted to work. This would require an initial
> > > refresh time
> > >     configurable in the boot loader probably.
> > 
> > This is our use-case. ^
> > 
> > Our dom0 is monitoring and managing the other domains in our system.
> > Without dom0 working the system isn't really working as a whole.
> > 
> > @Julien: Would you be ok with the patch set continuing in the direction
> > of the
> > original proposal, letting another party (or me at a later time) implement
> > the fully driven by Xen option?
> I am concerned about this particular point from Bertrand:
> 
> "would work if it is expected that Xen + Domain boot time is under the
> watchdog initial refresh rate."
> 
> How will a user be able to figure out how to initially configure the watchdog?
> Is this something you can easily configure in the bootloader at runtime?
> 
> 
> Overall, I am not for this approach at least in the current status. I would be
> more inclined if there are some documentations explaining how this is supposed
> to be configured on NXP, so others can use the code.
>
> Anyway, this is why we have multiple Arm maintainers for this kind of
> situation. If they other agrees with you, then they can ack the patch and this
> can be merged.


The approach here would not be my choice either. However, I think it
would be nice to have better support for NXP imx8 boards in upstream
Xen. To that end, I would ack these patches but I would ask to add a
document under xen.git/docs/ explaining the approach, limitations, and
requirements, so that someone else can use the code effectively.

