Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41AE4576CF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 19:56:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228211.394841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo92u-0001Mt-Vg; Fri, 19 Nov 2021 18:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228211.394841; Fri, 19 Nov 2021 18:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo92u-0001Js-SO; Fri, 19 Nov 2021 18:55:36 +0000
Received: by outflank-mailman (input) for mailman id 228211;
 Fri, 19 Nov 2021 18:55:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TVl8=QG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mo92s-0001Jh-IX
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 18:55:34 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4487bdd3-496a-11ec-a9d2-d9f7a1cc8784;
 Fri, 19 Nov 2021 19:55:32 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B2BD761AA2;
 Fri, 19 Nov 2021 18:55:29 +0000 (UTC)
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
X-Inumbo-ID: 4487bdd3-496a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637348130;
	bh=7+5c6ESX5WUZoGJmhyQOFIgVFAHdUcMLLqCv4dbEQdE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A2VON8A4peZP/hIzmPKfdQJmdA7pVrf72yqaA971DkIo05RYNKAfF5BHHTSWOFvRu
	 w1M084Nn6QghOaszX1Je4zkO36xbzBoWamzmS33eKCEdFlmjSoML+TbM7kfOmDucSX
	 ng4gEW8zzgm+RFjJ2PyUAPrkr0sINY0yqNmPqT6GnG2PVhYx9i9mPldewPeAOsTzic
	 N4cBAucYd5CLCWVkUHx/mNtRI2u2LWHRvIp+aDOB2W5hv9Pwr1pxnESHzCTkpu0/tt
	 o/ELGO8/0v4+Trba2vNcimL6hR2n6OPgLalc2pLc4O7593wdjvwMj1/gZ1hYX05mZt
	 ibUQR6CvIdnpA==
Date: Fri, 19 Nov 2021 10:55:27 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 0/2] Boot time cpupools
In-Reply-To: <17cd2c69-56cb-15b9-d381-f854aea55d27@xen.org>
Message-ID: <alpine.DEB.2.22.394.2111191052050.1412361@ubuntu-linux-20-04-desktop>
References: <20211117095711.26596-1-luca.fancellu@arm.com> <26c01edc-46a9-47eb-0c9d-986b92e02158@xen.org> <B20FC780-3E2D-4B4A-BF1D-CF34763D237E@arm.com> <d42781c4-b01b-9064-4c90-ff99d960958b@xen.org> <1941B2BF-6451-4665-8591-DB14739121A9@arm.com>
 <f744c406-9801-a001-fb8e-90680cebb0c9@xen.org> <alpine.DEB.2.22.394.2111171724330.1412361@ubuntu-linux-20-04-desktop> <17cd2c69-56cb-15b9-d381-f854aea55d27@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Nov 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 18/11/2021 02:19, Stefano Stabellini wrote:
> > On Wed, 17 Nov 2021, Julien Grall wrote:
> > > > > > > On 17 Nov 2021, at 10:26, Julien Grall <julien@xen.org> wrote:
> > > > > > > 
> > > > > > > Hi Luca,
> > > > > > > 
> > > > > > > On 17/11/2021 09:57, Luca Fancellu wrote:
> > > > > > > > Currently Xen creates a default cpupool0 that contains all the
> > > > > > > > cpu
> > > > > > > > brought up
> > > > > > > > during boot and it assumes that the platform has only one kind
> > > > > > > > of
> > > > > > > > CPU.
> > > > > > > > This assumption does not hold on big.LITTLE platform, but
> > > > > > > > putting
> > > > > > > > different
> > > > > > > > type of CPU in the same cpupool can result in instability and
> > > > > > > > security issues
> > > > > > > > for the domains running on the pool.
> > > > > > > 
> > > > > > > I agree that you can't move a LITTLE vCPU to a big pCPU.
> > > > > > > However...
> > > > > > > 
> > > > > > > > For this reason this serie introduces an architecture specific
> > > > > > > > way
> > > > > > > > to create
> > > > > > > > different cpupool at boot time, this is particularly useful on
> > > > > > > > ARM
> > > > > > > > big.LITTLE
> > > > > > > > platform where there might be the need to have different
> > > > > > > > cpupools
> > > > > > > > for each type
> > > > > > > > of core, but also systems using NUMA can have different cpu pool
> > > > > > > > for
> > > > > > > > each node.
> > > > > > > 
> > > > > > > ... from my understanding, all the vCPUs of a domain have to be in
> > > > > > > the
> > > > > > > same cpupool. So with this approach it is not possible:
> > > > > > >     1) to have a mix of LITTLE and big vCPUs in the domain
> > > > > > >     2) to create a domain spanning across two NUMA nodes
> > > > > > > 
> > > > > > > So I think we need to make sure that any solutions we go through
> > > > > > > will
> > > > > > > not prevent us to implement those setups.
> > > > > > The point of this patch is to make all cores available without
> > > > > > breaking
> > > > > > the current behaviour of existing system.
> > > > > 
> > > > > I might be missing some context here. By breaking current behavior, do
> > > > > you
> > > > > mean user that may want to add "hmp-unsafe" on the command line?
> > > > 
> > > > Right, with hmp-unsafe the behaviour is now the same as without, only
> > > > extra
> > > > cores are parked in other cpupools.
> > > > 
> > > > So you have a point in fact that behaviour is changed for someone who
> > > > was
> > > > using hmp-unsafe before if this is activated.
> > > > The command line argument suggested by Jurgen definitely makes sense
> > > > here.
> > > > 
> > > > We could instead do the following:
> > > > - when this is activated in the configuration, boot all cores and park
> > > > them
> > > > in different pools (depending on command line argument). Current
> > > > behaviour
> > > > not change if other pools are not used (but more cores will be on in
> > > > xen)
> > > 
> > >  From my understanding, it is possible to move a pCPU in/out a pool
> > > afterwards.
> > > So the security concern with big.LITTLE is still present, even though it
> > > would
> > > be difficult to hit it.
> > 
> > As far as I know moving a pCPU in/out of a pool is something that cannot
> > happen automatically: it requires manual intervention to the user and it
> > is uncommon. We could print a warning or simply return error to prevent
> > the action from happening. Or something like:
> > 
> > "This action might result in memory corruptions and invalid behavior. Do
> > you want to continue? [Y/N]
> > 
> > 
> > > I am also concerned that it would be more difficult to detect any
> > > misconfiguration. So I think this option would still need to be turned on
> > > only
> > > if hmp-unsafe are the new command line one are both on.
> > > 
> > > If we want to enable it without hmp-unsafe on, we would need to at least
> > > lock
> > > the pools.
> > 
> > Locking the pools is a good idea.
> > 
> > My preference is not to tie this feature to the hmp-unsafe command line,
> > more on this below.
> 
> The only reason I suggested to tie with hmp-unsafe is if you (or anyone else)
> really wanted to use a version where the pool are unlocked.
> 
> If we are going to implement the lock, then I think the hmp-unsafe would not
> be necessary for such configuration.
> 
> > 
> > 
> > > > - when hmp-unsafe is on, this feature will be turned of (if activated in
> > > > configuration) and all cores would be added in the same pool.
> > > > 
> > > > What do you think ?
> > > 
> > > I am split. On one hand, this is making easier for someone to try
> > > big.LITTLE
> > > as you don't have manually pin vCPUs. On the other hand, this is handling
> > > a
> > > single use-case and you would need to use hmp-unsafe and pinning if you
> > > want
> > > to get more exotic setup (e.g. a domain with big.LITTLE).
> > > 
> > > Another possible solution is to pin dom0 vCPUs (AFAIK they are just sticky
> > > by
> > > default) and then create the pools from dom0 userspace. My assumption is
> > > for
> > > dom0less we would want to use pinning instead.
> > > 
> > > That said I would like to hear from Xilinx and EPAM as, IIRC, they are
> > > already
> > > using hmp-unsafe in production.
> > 
> > This discussion has been very interesting, it is cool to hear new ideas
> > like this one. I have a couple of thoughts to share.
> > 
> > First I think that the ability of creating cpupools at boot time is
> > super important. It goes way beyond big.LITTLE. It would be incredibly
> > useful to separate real-time (sched=null) and non-real-time
> > (sched=credit2) workloads. I think it will only become more important
> > going forward so I'd love to see an option to configure cpupools that
> > works for dom0less. It could be based on device tree properties rather
> > than kconfig options.
> > 
> > It is true that if we had the devicetree-based cpupool configuration I
> > mentioned, then somebody could use it to create cpupools matching
> > big.LITTLE. > So "in theory" it solves the problem. However, I think that
> > for big.LITTLE it would be suboptimal. For big.LITTLE it would be best
> > if Xen configured the cpupools automatically rather than based on the
> > device tree configuration. 
> 
> This brings one question. How do Linux detect and use big.LITTLE? Is there a
> Device-Tree binding?
> 
> [...]
> 
> > So I think that it is a good idea to have a command line option (better
> > than a kconfig option) to trigger the MIDR-based cpupool creation at
> > boot time. The option could be called midr-cpupools=on/off or
> > hw-cpupools=on/off for example.
> > In terms of whether it should be the default or not, I don't feel
> > strongly about it.
> 
> On by default means this will security supported and we need to be reasonably
> confident this cannot be broken.
> 
> In this case, I am not only referring to moving a pCPU between pool but also
> Xen doing the right thing (e.g. finding the minimum cache line size).
> 
> 
> [...]
> 
> > - midr-cpupools alone
> > cpupools created at boot, warning/errors on changing cpupools >
> > - midr-cpupools + hmp-unsafe
> > cpupools created at boot, changing cpupools is allowed (we could still
> > warn but no errors)
> > 
> > - hmp-unsafe alone
> > same as today with hmp-unsafe
> 
> I like better Juergen's version. But before agreeing on the command line , I
> would like to understand how Linux is dealing with big.LITTLE today (see my
> question above).

I also like Juergen's version better :-)

The device tree binding that covers big.LITTLE is the same that covers
cpus: Documentation/devicetree/bindings/arm/cpus.yaml

So basically, you can tell it is a big.LITTLE system because the
compatible strings differ between certain cpus, e.g.:

      cpu@0 {
        device_type = "cpu";
        compatible = "arm,cortex-a15";
        reg = <0x0>;
      };

      cpu@1 {
        device_type = "cpu";
        compatible = "arm,cortex-a15";
        reg = <0x1>;
      };

      cpu@100 {
        device_type = "cpu";
        compatible = "arm,cortex-a7";
        reg = <0x100>;
      };

      cpu@101 {
        device_type = "cpu";
        compatible = "arm,cortex-a7";
        reg = <0x101>;
      };


> > For the default as I said I don't have a strong preference. I think
> > midr-cpupools could be "on" be default.
> 
> I think this should be off at the beginning until the feature is matured
> enough. We are soon opening the tree again for the next development cycle. So
> I think we have enough time to make sure everything work properly to have
> turned on by default before next release.

That's fine

