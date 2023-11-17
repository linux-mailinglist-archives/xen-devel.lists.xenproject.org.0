Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1732D7EEA74
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 01:51:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634775.990266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3n4e-00007U-19; Fri, 17 Nov 2023 00:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634775.990266; Fri, 17 Nov 2023 00:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3n4d-00004v-UZ; Fri, 17 Nov 2023 00:51:07 +0000
Received: by outflank-mailman (input) for mailman id 634775;
 Fri, 17 Nov 2023 00:51:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5d38=G6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r3n4c-0008WV-Ro
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 00:51:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 636e7f4c-84e3-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 01:51:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C14CFB81E12;
 Fri, 17 Nov 2023 00:51:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC614C433C8;
 Fri, 17 Nov 2023 00:51:02 +0000 (UTC)
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
X-Inumbo-ID: 636e7f4c-84e3-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700182264;
	bh=Jnr/5tdEafWGgOr/LVZyKbe6eLy6JdNyvd3cPdHSNQc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=btNFbREMGcTwPQuvM3r+dscGk5fUb5me2RKCrbIgeudzDm9RaiSWl3o8ZmXadGGnq
	 vAJuYxmXvM3T5SC0S7KKY7KKtaxfk8PHAAe5Ao39TTq9K/8v+dyJApgFSnUo4Rri/1
	 /rYJyeodJO0VACHjE0RJbve6u0S3qkCslD24q2hw9zfkJtMD2EZOkSzREmq1xGjSIU
	 0i236qgv5lqDOX0dq5zvO4IPg+nuTVw0HkXJRbqa+x1/W+rMzk6ltIH+SQDbvXRs+y
	 G9t8ZOID2fUDVFK2AZ1/w3DM4h03DG9MzzfyizG2ugMV5Sc+zMyF7uYVJpahpD4rvu
	 fM2IXVo/3TRoA==
Date: Thu, 16 Nov 2023 16:51:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
In-Reply-To: <2c358b80-ad87-4e36-84ca-96380a8f39e4@xen.org>
Message-ID: <alpine.DEB.2.22.394.2311161649380.773207@ubuntu-linux-20-04-desktop>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com> <20231012220854.2736994-14-volodymyr_babchuk@epam.com> <d6a58e73-da51-40f1-a2f7-576274945585@xen.org> <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop>
 <2c358b80-ad87-4e36-84ca-96380a8f39e4@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Nov 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 16/11/2023 23:28, Stefano Stabellini wrote:
> > On Thu, 16 Nov 2023, Julien Grall wrote:
> > > IIUC, this means that Xen will allocate the BDF. I think this will become
> > > a
> > > problem quite quickly as some of the PCI may need to be assigned at a
> > > specific
> > > vBDF (I have the intel graphic card in mind).
> > > 
> > > Also, xl allows you to specificy the slot (e.g. <bdf>@<vslot>) which would
> > > not
> > > work with this approach.
> > > 
> > > For dom0less passthrough, I feel the virtual BDF should always be
> > > specified in
> > > device-tree. When a domain is created after boot, then I think you want to
> > > support <bdf>@<vslot> where <vslot> is optional.
> > 
> > Hi Julien,
> > 
> > I also think there should be a way to specify the virtual BDF, but if
> > possible (meaning: it is not super difficult to implement) I think it
> > would be very convenient if we could let Xen pick whatever virtual BDF
> > Xen wants when the user doesn't specify the virtual BDF. That's
> > because it would make it easier to specify the configuration for the
> > user. Typically the user doesn't care about the virtual BDF, only to
> > expose a specific host device to the VM. There are exceptions of course
> > and that's why I think we should also have a way for the user to
> > request a specific virtual BDF. One of these exceptions are integrated
> > GPUs: the OS drivers used to have hardcoded BDFs. So it wouldn't work if
> > the device shows up at a different virtual BDF compared to the host.
> 
> If you let Xen allocating the vBDF, then wouldn't you need a way to tell the
> toolstack/Device Models which vBDF was allocated?
> 
> > 
> > Thinking more about this, one way to simplify the problem would be if we
> > always reuse the physical BDF as virtual BDF for passthrough devices. I
> > think that would solve the problem and makes it much more unlikely to
> > run into drivers bugs.
> 
> This works so long you have only one physical segment (i.e. hostbridge). If
> you have multiple one, then you either have to expose multiple hostbridge to
> the guest (which is not great) or need someone to allocate the vBDF.
> 
> > 
> > And we allocate a "special" virtual BDF space for emulated devices, with
> > the Root Complex still emulated in Xen. For instance, we could reserve
> > ff:xx:xx.
> Hmmm... Wouldn't this means reserving ECAM space for 256 buses? Obviously, we
> could use 5 (just as random number). Yet, it still requires to reserve more
> memory than necessary.
> 
> > and in case of clashes we could refuse to continue.
> 
> Urgh. And what would be the solution users triggering this clash?
> 
> > Or we could
> > allocate the first free virtual BDF, after all the pasthrough devices.
> 
> This is only works if you don't want to support PCI hotplug. It may not be a
> thing for embedded, but it is used by cloud. So you need a mechanism that
> works with hotplug as well.
> 
> > 
> > Example:
> > - the user wants to assign physical 00:11.5 and b3:00.1 to the guest
> > - Xen create virtual BDFs 00:11.5 and b3:00.1 for the passthrough devices
> > - Xen allocates the next virtual BDF for emulated devices: b4:xx.x
> > - If more virtual BDFs are needed for emulated devices, Xen allocates
> >    b5:xx.x >
> > I still think, no matter the BDF allocation scheme, that we should try
> > to avoid as much as possible to have two different PCI Root Complex
> > emulators. Ideally we would have only one PCI Root Complex emulated by
> > Xen. Having 2 PCI Root Complexes both of them emulated by Xen would be
> > tolerable but not ideal. The worst case I would like to avoid is to have
> > two PCI Root Complexes, one emulated by Xen and one emulated by QEMU.
> 
> So while I agree that one emulated hostbridge is the best solution, I don't
> think your proposal would work. As I wrote above, you may have a system with
> multiple physical hostbridge. It would not be possible to assign two PCI
> devices with the same BDF but from different segment.
> 
> I agree unlikely, but if we can avoid it then it would be best. There are one
> scheme which fits that:
>   1. If the vBDF is not specified, then pick a free one.
>   2. Otherwise check if the specified vBDF is free. If not return an error.
> 
> This scheme should be used for both virtual and physical. This is pretty much
> the algorithm used by QEMU today. It works, so what's would be the benefits to
> do something different?

I am OK with that. I was trying to find a way that could work without
user intervention in almost 100% of the cases. I think both 1. and 2.
you proposed are fine.

