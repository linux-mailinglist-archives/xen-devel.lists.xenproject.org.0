Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC814E329D
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 23:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293224.498070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWQN4-0007v8-7p; Mon, 21 Mar 2022 22:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293224.498070; Mon, 21 Mar 2022 22:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWQN4-0007s8-4Y; Mon, 21 Mar 2022 22:19:26 +0000
Received: by outflank-mailman (input) for mailman id 293224;
 Mon, 21 Mar 2022 22:19:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/V3S=UA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWQN2-0007s2-FN
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 22:19:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5512168-a964-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 23:19:22 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C2EF6123A;
 Mon, 21 Mar 2022 22:19:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D44BC340E8;
 Mon, 21 Mar 2022 22:19:20 +0000 (UTC)
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
X-Inumbo-ID: f5512168-a964-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647901160;
	bh=vdT+FC7hDTnJhjUHbx1BSLoLTz3NXsF/5y/lA8sNP8k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iG7yqi1xIaqPMUWOfICK/m1rOZaDSViOuVKmLIclv9+c9qev7TjUS4veHRkgTdVdI
	 ogWdgOH5BH+MDsDTEhpREbICjupomZdBfbUZ4jZY2UoOqNFXd7otmEQVmZ/J8gahCJ
	 7PU8q9hJg1WgjvepyixBJYCMWfepz+vHoa57obJHezvmHU+zsV1fh4cTiC0P/qZfdy
	 R/TM+4bFgR9ApCnpjT97o9urVxOLSbNfGM9UI95uixEumZgt/8E4KGAzhU6Guf9Wkm
	 65YDGkV7KPBUSYU0zeZqIRljVoyKiX1/Dxa/CTZq8NUbEOb/FUs1NBFBk2qPMY8cZK
	 svUHdg0Ppc4UA==
Date: Mon, 21 Mar 2022 15:19:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, anthony.perard@citrix.com, 
    bertrand.marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
In-Reply-To: <aa148f5a-4ff2-bebc-2be9-f8b647b95386@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203211507290.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203181729490.2910984@ubuntu-linux-20-04-desktop> <20220319003221.3012314-2-sstabellini@kernel.org> <alpine.DEB.2.22.394.2203191842280.2910984@ubuntu-linux-20-04-desktop> <684d65b8-5de4-779c-d869-bac28e073091@xen.org>
 <alpine.DEB.2.22.394.2203211229430.2910984@ubuntu-linux-20-04-desktop> <aa148f5a-4ff2-bebc-2be9-f8b647b95386@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Mar 2022, Julien Grall wrote:
> On 21/03/2022 19:47, Stefano Stabellini wrote:
> > On Sun, 20 Mar 2022, Julien Grall wrote:
> > > On 20/03/2022 01:46, Stefano Stabellini wrote:
> > > > On Fri, 18 Mar 2022, Stefano Stabellini wrote:
> > > > > Add a minimal ARM32 smoke test based on qemu-system-arm, as provided
> > > > > by
> > > > > the test-artifacts qemu container. The minimal test simply boots Xen
> > > > > (built from previous build stages) and Dom0. The test is fetching the
> > > > > Dom0 kernel and initrd from Debian Jessie: they work just fine and
> > > > > this
> > > > > way we don't have to maintain a build for them too.
> > > > 
> > > > 
> > > > Thanks to the Xen fix recently submitted
> > > > (https://marc.info/?l=xen-devel&m=164774063802402) I'll be able to
> > > > update this script to use Debian Bullseye. I am thinking of merging the
> > > > below directly with this patch.
> > > > 
> > > > 
> > > > ---
> > > > 
> > > > automation: upgrade Debian to Bullseye for testing Xen aarch32
> > > > 
> > > > Also change initrd. As the new netboot initrd from Debian Bullseye is
> > > > huge (22MB), use a tiny initrd from Alpine Linux instead (only 2.5MB).
> > > 
> > > This is sounds odd to me. So we are going to use Bullseye but not really
> > > because we want to use a different initrd.
> > > 
> > > Why can't you get everything from the same place?
> > 
> > Because it doesn't work :-(
> > 
> > 
> > > > Also note that the huge Debian Bullseye initrd would cause QEMU to
> > > > crash due to the -device loader parameter.
> > > 
> > > Can you provide more details? Was this reported to QEMU?
> > 
> > QEMU core dumps when provided with the Debian Bullseye initrd binary to
> > load. I guessed it was due to the size and tried with a smaller size.
> > Everything worked with a smaller initrd. I also think that it is not a
> > good idea to use a 22MB initrd anyway so decided against the Debian
> > Bullseye initrd. 
> 
> Why is it a bad idea? In general, bigger file allows us to test corner cases.

That is also true.

This test is minimal, there is only dom0 booting, no domUs. To me, it
makes sense that also the initrd is small. In general 20-25MB is the
regular full size of a Linux arm64 rootfs. I think it makes sense to
stay below 10-15MB for arm32 if we can.

We could go up in size if we added the Xen tools and a domU to the
initrd and tested xl create. There is a test like that for arm64.

We can add more tests like that.


> > (For reference 22MB is basically the size of a fully
> > featured Yocto-build rootfs.) I did not file a bug to qemu-devel yet and
> > didn't investigate further on the QEMU side as I ran out of time.
> > 
> > Alpine Linux provides a very nice 2.5MB initrd. I tried to use both
> > kernel and initrd from Alpine Linux but unfortunately the Alpine Linux
> > kernel doesn't boot. I don't know why but I think it is because it might
> > be missing the console driver. I am not sure. There are a lot of
> > combinations that don't work and it is time consuming to investigate
> > them all. I have been trying to investigate only the most critical
> > things -- they are too many!
> > 
> > I should add that the Debian initrd is not the ideal initrd because it
> > is made to start the Debian installer. Here we just want a tiny busybox
> > initrd.
> > 
> > In general, I think it would be better if we could use the kernel and
> > initrd from the same source but I couldn't find one that works. I could
> > build one myself but it would be one more thing to maintain in
> > gitlab-ci. Also using u-boot might solve the problem of loading the
> > binary but again we would have to maintain a u-boot arm32 build in
> > gitlab-ci.
> > 
> > So in order of preference best to worst in my opinion:
> > 
> > 1) kernel and initrd from the same source
> > 2) kernel and initrd from different sources
> > 3) build your own kernel/initrd/u-boot
> > 
> > So I ended up doing 2). I tested it and it is sufficient to get the test
> > up and running.
> 
> Thanks for the explanation. So I think we should not call that an "Upgrade to
> Bullseye" because you are not using Debian. Instead, you borrowed a working
> kernel that happens to have everything you need built-in.
> 
> Also, can you update the commit message and provide a summary of this
> discussion?

Yes I can do that, thanks for the review!

