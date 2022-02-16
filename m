Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D5A4B9367
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 22:58:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274420.469882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKSJQ-0000gA-3K; Wed, 16 Feb 2022 21:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274420.469882; Wed, 16 Feb 2022 21:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKSJQ-0000do-0I; Wed, 16 Feb 2022 21:58:12 +0000
Received: by outflank-mailman (input) for mailman id 274420;
 Wed, 16 Feb 2022 21:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gZM=S7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nKSJO-0000dg-T4
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 21:58:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 872dda06-8f73-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 22:58:09 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AC80FB81ED8;
 Wed, 16 Feb 2022 21:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83F8C004E1;
 Wed, 16 Feb 2022 21:58:06 +0000 (UTC)
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
X-Inumbo-ID: 872dda06-8f73-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645048687;
	bh=Ly7wg5PxhZBmhhl5gwxaLos1qSdn3bNezTtOtZXBFHc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lwfmzPCxKgB1za8hb/gwJg2MUWmejm7wBgBcT3US30Gxsf8Bg2Kry3mYqCtusQ6BG
	 t2R6u6sJf/5QKXmabK1ww9yMr1I/+9iBsK4qq584Ux6j6OcdQg2+CJudSJmQq8CURL
	 kZM82RXfo24JFLFxjlWpvdxr0EhRUiTfI5+/ml7Hv0b2XTrF3h/uPja+HZ/8JSjLAZ
	 4JSxk7505/Z2o7dsQ2QRl8OXxq4o/o9gRb6fXXu9vkJp/wc0BBuCLhDpdxHuvpLRcr
	 /CZNDpC86qbjhtkpnOhwJ1bK8ST9EoKsyrzwKkszpq+c0WSaBBPZzkMOf6dWqYer+a
	 yJ9mhS4mto0EQ==
Date: Wed, 16 Feb 2022 13:58:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <wei.chen@arm.com>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot
 time
In-Reply-To: <53747C8B-681A-4474-B1DF-F08702322AB9@arm.com>
Message-ID: <alpine.DEB.2.22.394.2202161328430.43738@ubuntu-linux-20-04-desktop>
References: <20220215101551.23101-1-luca.fancellu@arm.com> <20220215101551.23101-5-luca.fancellu@arm.com> <alpine.DEB.2.22.394.2202151827380.43738@ubuntu-linux-20-04-desktop> <53747C8B-681A-4474-B1DF-F08702322AB9@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-329033661-1645047307=:43738"
Content-ID: <alpine.DEB.2.22.394.2202161335090.43738@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-329033661-1645047307=:43738
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2202161335091.43738@ubuntu-linux-20-04-desktop>

On Wed, 16 Feb 2022, Luca Fancellu wrote:
> > On 16 Feb 2022, at 02:45, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Tue, 15 Feb 2022, Luca Fancellu wrote:
> >> Introduce an architecture specific way to create different cpupools
> >> at boot time, this is particularly useful on ARM big.LITTLE system
> >> where there might be the need to have different cpupools for each type
> >> of core, but also systems using NUMA can have different cpu pools for
> >> each node.
> >> 
> >> The feature on arm relies on a specification of the cpupools from the
> >> device tree to build pools and assign cpus to them.
> >> 
> >> Documentation is created to explain the feature.
> >> 
> >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> >> ---
> >> docs/misc/arm/device-tree/cpupools.txt | 118 +++++++++++++++++++++++++
> >> xen/arch/arm/Kconfig                   |   9 ++
> >> xen/arch/arm/Makefile                  |   1 +
> >> xen/arch/arm/cpupool.c                 | 118 +++++++++++++++++++++++++
> >> xen/common/sched/cpupool.c             |   4 +-
> >> xen/include/xen/sched.h                |  11 +++
> >> 6 files changed, 260 insertions(+), 1 deletion(-)
> >> create mode 100644 docs/misc/arm/device-tree/cpupools.txt
> >> create mode 100644 xen/arch/arm/cpupool.c
> >> 
> >> diff --git a/docs/misc/arm/device-tree/cpupools.txt b/docs/misc/arm/device-tree/cpupools.txt
> >> new file mode 100644
> >> index 000000000000..7298b6394332
> >> --- /dev/null
> >> +++ b/docs/misc/arm/device-tree/cpupools.txt
> >> @@ -0,0 +1,118 @@
> >> +Boot time cpupools
> >> +==================
> >> +
> >> +On arm, when BOOT_TIME_CPUPOOLS is enabled in the Xen configuration, it is
> >> +possible to create cpupools during boot phase by specifying them in the device
> >> +tree.
> >> +
> >> +Cpupools specification nodes shall be direct childs of /chosen node.
> >> +Each cpupool node contains the following properties:
> >> +
> >> +- compatible (mandatory)
> >> +
> >> +    Must always include the compatiblity string: "xen,cpupool".
> >> +
> >> +- cpupool-id (mandatory)
> >> +
> >> +    Must be a positive integer number.
> > 
> 
> Hi Stefano,
> 
> Thank you for your review,
> 
> > Why is cpupool-id mandatory? It looks like it could be generated by Xen.
> > Or is it actually better to have the user specify it anyway?
> > 
> 
> Yes at first I thought to automatically generate that, however I needed a structure
> to map the id to the cpupool DT node. Here my doubt was about the size of the
> structure, because the user could even specify a cpupool for each cpu. I could allocate
> It dynamically and free it after domUs creation in setup_xen.
> What do you think could be the right way?

Maybe we can achieve the goal with the structure we already have:
pool_cpu_map. pool_cpu_map returns struct cpupool*, which has a
unsigned int cpupool_id field. As a pCPU can only be in 1 cpupool, we
could for each dom0less domain:

- get the xen,cpupool phandle from "domain-cpupool"
- get the first CPU phandle from "cpupool-cpus" in xen,cpupool
- from the CPU node phandle get the CPU number from "reg"
- pool_cpu_map[cpu_reg]->cpupool_id is the id that we need

It should be fast as they are all direct accesses (no walking long lists
or binary trees.)


> Or the dom0less guest could specify the id, but I like it more when using a phandle to the
> Xen,cpupool node. 

No, I think the ID is something Xen should generate.


> >> +- cpupool-cpus (mandatory)
> >> +
> >> +    Must be a list of device tree phandle to nodes describing cpus (e.g. having
> >> +    device_type = "cpu"), it can't be empty.
> >> +
> >> +- cpupool-sched (optional)
> >> +
> >> +    Must be a string having the name of a Xen scheduler, it has no effect when
> >> +    used in conjunction of a cpupool-id equal to zero, in that case the
> >> +    default Xen scheduler is selected (sched=<...> boot argument).
> > 
> > I don't get why cpupool-id == 0 should trigger a special cpupool-sched
> > behavior.
> 
> Cpupool with id 0 is embedded in Xen, it has its own special case handling in cpupool_create
> that is giving it the default scheduler. I thought it was better to leave it as it was, however the
> cpupool0 scheduler can be modified using sched= boot args as it was before.
> 
> > 
> > 
> >> +Constraints
> >> +===========
> >> +
> >> +The cpupool with id zero is implicitly created even if not specified, that pool
> >> +must have at least one cpu assigned, otherwise Xen will stop.
> >> +
> >> +Every cpu brought up by Xen will be assigned to the cpupool with id zero if it's
> >> +not assigned to any other cpupool.
> >> +
> >> +If a cpu is assigned to a cpupool, but it's not brought up correctly, Xen will
> >> +stop.
> > 
> > Thank you for documenting the constraints, but why do we have them?
> > Imagine a user specifying 3 cpu pools and imagine the cpupool-id is
> > optional and missing. We could take care of the cpupool-id generation in
> > Xen and we could also assign the default scheduler everywhere
> > cpupool-sched is not specified. Maybe I am missing something?
> 
> Yes we could make the cpupool-id optional, my doubts are in the fist comment above.
> Whenever the cpupool-sched is not specified, the current behaviour is to use the default scheduler.
> 
> > 
> > Does cpupool0 has to exist? I guess the answer could be yes, but if it
> > is specified as id of one of the pools we are fine, otherwise it could
> > be automatically generated by Xen.
> 
> Yes cpupool0 needs to exists, however it is still generated by Xen regardless of the DT
> specifications. In fact you could not specify in the DT any xen,cpupool compatible node
> with the cpupool-id == 0 and Xen will generate the cpupool0 anyway
> (Xen internals are tied with the existence of a cpupool0).
> 
> > 
> > In any case, I don't think that cpupool0 has to have the default
> > scheduler?
> 
> Ok I think I can create a function to assign a scheduler to the cpupool0 after its creation,
> I would need to test it to be sure I don’t find something strange.
> 
> > 
> > My suggestion would be:
> > 
> > - make cpupool-id optional
> > - assign automatically cpupool-ids starting from 0
> >    - respect cpupool-ids chosen by the user
> 
> Ok, it would start from 1 because cpupool0 always exists
> 
> > - if some CPUs are left out (not specified in any pool) add an extra cpupool
> >    - the extra cpupool doesn't have to be cpupool-id == 0, it could be
> >      cpupool-id == n
> >    - the extra cpupool uses the default scheduler
> 
> I gave all the unassigned cpus to cpupool0 to reflect the current behaviour, so that
> a user that doesn’t specify any xen,cpupool node ends up in a system reflecting the
> current behaviour as the feature is not enabled.
> However I can say, if no xen,cpupool nodes are found then assign cpus to cpupool0,
> else assign them to a new cpupool and...
> 
> > 
> > If the user created cpupools in device tree covering all CPUs and also
> > specified all cpupool-ids everywhere, and none of them are 0 (no cpupool
> > in the system is cpupool0) then panic. (Assuming that cpupool0 is
> > required.)
> 
> … panic if cpupool0 has no cpus.

That could be a good plan.

However, if cpupool0 has to have CPU0 (as Juergen wrote) then we could
automatically assign cpupool-id == 0 to whatever xen,cpupool node has
CPU0:

- if CPU0 is unassigned, cpupool0 is the one with all the unassigned CPUs
- if CPU0 is assigned to one of the xen,cpupool nodes, then that cpupool
  gets id == 0

Alternative we could fix the Xen limitation that cpupool0 has to have
CPU0.

In any case the good thing is that from a device interface perspective,
it doesn't matter. The device tree description doesn't have to change.
The user doesn't need to care how Xen comes up with the IDs.
--8323329-329033661-1645047307=:43738--

