Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168561FFDA2
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 00:00:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm2Zy-0000tK-P3; Thu, 18 Jun 2020 22:00:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dWRf=77=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jm2Zx-0000tF-VV
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 22:00:14 +0000
X-Inumbo-ID: 15c3fffc-b1af-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15c3fffc-b1af-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 22:00:13 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6AF2320773;
 Thu, 18 Jun 2020 22:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592517612;
 bh=W5lSpBNi/2zBEZMgGS4FlPiTuC7YUa6vQZ+95L6WU2I=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=dia08sogqOwOE/qt+Ws0RmUmEUdt7+dVb2Kf1FWdYsDF1qO6C3fFWq3obtFS7fWDj
 XLDJdZKn4oWGmaGW3+noFYXOBU45kjULDx8yF/hSG5CjuFahDxE2NIbYClJb7gGnXO
 bXGyhZZ8+eg/dEMm1E8sFpyk98x+BKaVHDIQcp6c=
Date: Thu, 18 Jun 2020 15:00:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: UEFI support in ARM DomUs
In-Reply-To: <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
Message-ID: <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Peng Fan <peng.fan@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 18 Jun 2020, Julien Grall wrote:
> On 18/06/2020 06:22, Oleksandr Andrushchenko wrote:
> > 
> > On 6/4/20 6:31 PM, Stefano Stabellini wrote:
> > > On Thu, 4 Jun 2020, Oleksandr Andrushchenko wrote:
> > > > On 6/4/20 4:57 AM, Peng Fan wrote:
> > > > > Grall <julien@xen.org>;
> > > > > > Nataliya Korovkina <malus.brandywine@gmail.com>
> > > > > > Subject: UEFI support in ARM DomUs
> > > > > We have made U-Boot run inside XEN DomU, but just only PV console
> > > > > part,
> > > > > not implement other frontend drivers currently. Would this help for
> > > > > your
> > > > > case if enable EFI in U-Boot?
> > > > Well, we have a working PV block implementation on top of that on iMX8
> > > > 
> > > > platform, mostly ported from mini-os. Currently we are finalizing the
> > > > work
> > > > 
> > > > and cleaning up (it's going to take a week or so hopefully). Then, we
> > > > we'll post
> > > > 
> > > > it on our public github. We are also thinking about upstreaming the
> > > > work, but it may
> > > > 
> > > > take quite some time if the whole idea fits u-boot's view on such an
> > > > extension at all.
> > > Yes please to both of you! :-)
> > > 
> > > In the meantime, while we wait for those changes to go upstream in
> > > uboot, could you please post a branch on github and a link on this email
> > > thread?
> > 
> > It took a bit more time than we expected, but here we go [1]:
> > 
> > this is in form of a pull-request as we would love to hear from the
> > 
> > community and it is easier to discuss the code (please leave comments there)
> > 
> > 1. There is code originating from MiniOS and work done by Peng, so we
> > 
> > would like to ask the respective copyright owners to raise their hands and
> 
> Not everyone are closely watching xen-devel. So if you want to find out who
> are the copyright owners, then your best solution is to go through the git log
> and CC the authors.

That is true. But why do you want to contact them? It doesn't look like
there would be any licensing issues.

 
> > let us *fix inappropriate licensing* if any.
> > 
> > 2. Please note, the series has a HACK to move the RAM base as it is expected
> > by
> > 
> > our test platform (iMX8), so others will need to remove or modify that.
> > 
> > 3. There is a limitation already noted by Peng that we do not have serial
> > output
> > 
> > until MMU is setup, so we have introduced xen_early_printk helper which
> > always
> > 
> > works, so you can use that for early stage debugging.
> > 
> > 4. Minimal memory size supported is ~129M because of dtb placement by Xen
> > tools
> 
> Hmmm... Why? What's wrong with booting a guest with just 64MB?

I agree that it would be nice to support 64MB at least as a minimum. We
are talking about embedded here, every byte counts :-)


> > 
> > 5. We use -D__XEN__ to access some of the hidden defines we need such as
> > 
> > GUEST_RAM0_BASE and the friends as there is no other way but manually
> > defining the
> > 
> > same which is not cute.
> 
> I have replied to this in the pull request. But I want to bring the
> conversation here to have a wider discussion.
> 
> For a first, __XEN__ should really only be defined by the hypervisor and not
> used by the guest. This is used to gate non-stable ABI (such as the tools) and
> anything behind it hasn't been vetted to work in other build configuration
> that the one used by Xen.
> 
> In general, we expect the guest to discover everything for the device-tree
> because the memory layout is not stable (we want to be able to reshuffle as we
> add more features).
> 
> I know that EDK2/Tianocore can be built once and work on every Xen
> configuration. It would be ideal that U-boot follow the same. If it is really
> not possible, then we should explore a path that is preventing to define
> __XEN__.
> 
> How much does U-boot expect to know about the memory layout? Does it require
> to know all the memory banks? Or would it be sufficient for it to know the
> start address of the first bank and the minimum of RAM?

Copy/pasting here from my comment on the pull request plus additional
thoughts.

Uboot is one of those embedded projects that typically assumes that all
the information about the platform is available at *build time*. It is
meant to be built tailored for a specific version of a specific board. A
Uboot binary is not expected to be "portable" across different versions
of the platform or different platforms. In other words, it is not
expected to be portable across Xen versions.

This is a different model meant for different use-cases. I don't think
it is a problem "philosophically" to let Uboot know about Xen details at
build time. Yes, that is not what we did historically but it is very
much in the spirit of Uboot.

But of course the least Uboot depends on these details the better
because it will be more flexible, but it could very well be that we
won't be able to reach the point where the binary works on any version
like we did with Tianocore. The two projects work differently.


That said, I think Julien is right that we need to be careful on how we
expose these information to Uboot, i.e. defining __XEN__ to build Uboot
doesn't seem like a good idea because we enable definitions that were
never meant to be used outside of a Xen build. Also, it wouldn't be easy
to know exactly which definitions are actively used by Uboot and which
ones aren't.

If we are going to make Uboot dependent on version-specific information
of the Xen interface, it would be better to be very clear about which
definitions we are using. So that one day if we need to change them, we
can find them easily.

So I think it would be better to introduce a set of defines with the
minimum amount of information required by Uboot statically. That way,
at least we have a single place where to find all the version-specific
definitions that Uboot is using. We can also manage versioning of the
Xen interface (like we do in QEMU) if we have to.

