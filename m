Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E2945529E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 03:20:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227063.392606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnX1h-0006zZ-OC; Thu, 18 Nov 2021 02:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227063.392606; Thu, 18 Nov 2021 02:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnX1h-0006wC-L2; Thu, 18 Nov 2021 02:19:49 +0000
Received: by outflank-mailman (input) for mailman id 227063;
 Thu, 18 Nov 2021 02:19:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl7d=QF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mnX1f-0006w6-E1
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 02:19:47 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe5096c0-4815-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 03:19:45 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 293A6610D0;
 Thu, 18 Nov 2021 02:19:43 +0000 (UTC)
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
X-Inumbo-ID: fe5096c0-4815-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637201983;
	bh=F7UPXOnXCDsROKE0CgkwqMZuUaG9AUeBEsumTZJKjB8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d1lcpNr54BsZSdDEC8Vm8VxZM/EwkMTiJZLJed+zCy4lBj4Dj+oTq31rlNbXCH8O6
	 m96Ju3wmhYxL0BBAFre8kCyHMRTlEN2N4Y+2YKK+opJN+WDIhl4GiE5C4BJdXes+O/
	 LfDxPW6pBYrw2cMY8KzBQOd4s+ByNHZJJuSGdy9MF23xipCx0yAQ7yGYWyTp82Bvj8
	 eS/hTtHgao6agHAEaUb1epOZam/EPB/bHwj30DGEz5IDYi7SrYrkB+VIKe7Jih7q1W
	 xLuMtxjnbgVJ9TjgQckO8x2RqN6g49EBgPOoWP6R0I9fa0XrJcFHkaOj8GSzEuLsvD
	 VI3WRQsbAdyag==
Date: Wed, 17 Nov 2021 18:19:42 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
In-Reply-To: <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111171724330.1412361@ubuntu-linux-20-04-desktop>
References: <20211117095711.26596-1-luca.fancellu@arm.com> <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org> <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com> <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org> <1941B2BF-6451-4665-8591-DB14739121A9@arm.com>
 <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Nov 2021, Julien Grall wrote:
> > > > > On 17 Nov 2021, at 10:26, Julien Grall <julien@xen.org> wrote:
> > > > > 
> > > > > Hi Luca,
> > > > > 
> > > > > On 17/11/2021 09:57, Luca Fancellu wrote:
> > > > > > Currently Xen creates a default cpupool0 that contains all the cpu
> > > > > > brought up
> > > > > > during boot and it assumes that the platform has only one kind of
> > > > > > CPU.
> > > > > > This assumption does not hold on big.LITTLE platform, but putting
> > > > > > different
> > > > > > type of CPU in the same cpupool can result in instability and
> > > > > > security issues
> > > > > > for the domains running on the pool.
> > > > > 
> > > > > I agree that you can't move a LITTLE vCPU to a big pCPU. However...
> > > > > 
> > > > > > For this reason this serie introduces an architecture specific way
> > > > > > to create
> > > > > > different cpupool at boot time, this is particularly useful on ARM
> > > > > > big.LITTLE
> > > > > > platform where there might be the need to have different cpupools
> > > > > > for each type
> > > > > > of core, but also systems using NUMA can have different cpu pool for
> > > > > > each node.
> > > > > 
> > > > > ... from my understanding, all the vCPUs of a domain have to be in the
> > > > > same cpupool. So with this approach it is not possible:
> > > > >    1) to have a mix of LITTLE and big vCPUs in the domain
> > > > >    2) to create a domain spanning across two NUMA nodes
> > > > > 
> > > > > So I think we need to make sure that any solutions we go through will
> > > > > not prevent us to implement those setups.
> > > > The point of this patch is to make all cores available without breaking
> > > > the current behaviour of existing system.
> > > 
> > > I might be missing some context here. By breaking current behavior, do you
> > > mean user that may want to add "hmp-unsafe" on the command line?
> > 
> > Right, with hmp-unsafe the behaviour is now the same as without, only extra
> > cores are parked in other cpupools.
> > 
> > So you have a point in fact that behaviour is changed for someone who was
> > using hmp-unsafe before if this is activated.
> > The command line argument suggested by Jurgen definitely makes sense here.
> > 
> > We could instead do the following:
> > - when this is activated in the configuration, boot all cores and park them
> > in different pools (depending on command line argument). Current behaviour
> > not change if other pools are not used (but more cores will be on in xen)
> 
> From my understanding, it is possible to move a pCPU in/out a pool afterwards.
> So the security concern with big.LITTLE is still present, even though it would
> be difficult to hit it.

As far as I know moving a pCPU in/out of a pool is something that cannot
happen automatically: it requires manual intervention to the user and it
is uncommon. We could print a warning or simply return error to prevent
the action from happening. Or something like:

"This action might result in memory corruptions and invalid behavior. Do
you want to continue? [Y/N]


> I am also concerned that it would be more difficult to detect any
> misconfiguration. So I think this option would still need to be turned on only
> if hmp-unsafe are the new command line one are both on.
> 
> If we want to enable it without hmp-unsafe on, we would need to at least lock
> the pools.

Locking the pools is a good idea.

My preference is not to tie this feature to the hmp-unsafe command line,
more on this below.


> > - when hmp-unsafe is on, this feature will be turned of (if activated in
> > configuration) and all cores would be added in the same pool.
> > 
> > What do you think ?
> 
> I am split. On one hand, this is making easier for someone to try big.LITTLE
> as you don't have manually pin vCPUs. On the other hand, this is handling a
> single use-case and you would need to use hmp-unsafe and pinning if you want
> to get more exotic setup (e.g. a domain with big.LITTLE).
> 
> Another possible solution is to pin dom0 vCPUs (AFAIK they are just sticky by
> default) and then create the pools from dom0 userspace. My assumption is for
> dom0less we would want to use pinning instead.
> 
> That said I would like to hear from Xilinx and EPAM as, IIRC, they are already
> using hmp-unsafe in production.

This discussion has been very interesting, it is cool to hear new ideas
like this one. I have a couple of thoughts to share.

First I think that the ability of creating cpupools at boot time is
super important. It goes way beyond big.LITTLE. It would be incredibly
useful to separate real-time (sched=null) and non-real-time
(sched=credit2) workloads. I think it will only become more important
going forward so I'd love to see an option to configure cpupools that
works for dom0less. It could be based on device tree properties rather
than kconfig options.

It is true that if we had the devicetree-based cpupool configuration I
mentioned, then somebody could use it to create cpupools matching
big.LITTLE. So "in theory" it solves the problem. However, I think that
for big.LITTLE it would be suboptimal. For big.LITTLE it would be best
if Xen configured the cpupools automatically rather than based on the
device tree configuration. That way, it is going to work automatically
without extra steps even in the simplest Xen setups.

So I think that it is a good idea to have a command line option (better
than a kconfig option) to trigger the MIDR-based cpupool creation at
boot time. The option could be called midr-cpupools=on/off or
hw-cpupools=on/off for example.

In terms of whether it should be the default or not, I don't feel
strongly about it. Unfortunately we (Xilinx) rely on a number of
non-default options already so we are already in the situation where we
have to be extra-careful at the options passed. I don't think that
adding one more would make a significant difference either way.


But my preference is *not* to tie the new command line option with
hmp-unsafe because if you use midr-cpupools and don't mess with the
pools then it is actually safe. We could even lock the cpupools like
Julien suggested or warn/return error on changing the cpupools. In this
scenario, it would be detrimental to also pass hmp-unsafe: it would
allow actually unsafe configurations that the user wanted to avoid by
using midr-cpupools. It would end up disabling checks we could put in
place to make midr-cpupools safer.

So in short I think it should be:

- midr-cpupools alone
cpupools created at boot, warning/errors on changing cpupools

- midr-cpupools + hmp-unsafe
cpupools created at boot, changing cpupools is allowed (we could still
warn but no errors)

- hmp-unsafe alone
same as today with hmp-unsafe


For the default as I said I don't have a strong preference. I think
midr-cpupools could be "on" be default.

