Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D694E30E9
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 20:48:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293189.497981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWO0Q-00063U-HL; Mon, 21 Mar 2022 19:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293189.497981; Mon, 21 Mar 2022 19:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWO0Q-00061W-Dq; Mon, 21 Mar 2022 19:47:54 +0000
Received: by outflank-mailman (input) for mailman id 293189;
 Mon, 21 Mar 2022 19:47:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/V3S=UA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nWO0O-00061Q-Gx
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 19:47:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca24a57b-a94f-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 20:47:51 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7B67960EC7;
 Mon, 21 Mar 2022 19:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DD0C340E8;
 Mon, 21 Mar 2022 19:47:48 +0000 (UTC)
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
X-Inumbo-ID: ca24a57b-a94f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647892068;
	bh=bvbwWkdCzHlz8Pg22uJFUMHYRmW1OXELfyL5dOl96Ok=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TX4J3hxAVWirvkaHtExKV9gNjMkzPbKVb7sY4UQDPlcny7NtOjMuQ46wumcZ8BE0m
	 n+UXoRfU5Kx0sM13ppXwOyrvUUT7nI73wzz8FE8TXSoa303VI5wysdXw/k/iWKh9eI
	 LofD/vN2/N/grhTyif91GrhKCT5f7P64No0FBpt5aPwZKENSMyT9E5sh6SkxYpSmOr
	 RFziI9Gi86iNxN1ppRmlbuCczM2/zNP9GqeAiWKAwQ+eBjmNpJy5v8RXrEopEeo8os
	 92FXbsYvxnYU4Um0/k4tP1u6coTOoPLMVf13iccy1ynjmEa6sqmXffWsn+/T+o3hRC
	 N2ga7LCQUuu+g==
Date: Mon, 21 Mar 2022 12:47:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, cardoe@cardoe.com, wl@xen.org, 
    andrew.cooper3@citrix.com, anthony.perard@citrix.com, 
    bertrand.marquis@arm.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v3 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
In-Reply-To: <684d65b8-5de4-779c-d869-bac28e073091@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203211229430.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203181729490.2910984@ubuntu-linux-20-04-desktop> <20220319003221.3012314-2-sstabellini@kernel.org> <alpine.DEB.2.22.394.2203191842280.2910984@ubuntu-linux-20-04-desktop> <684d65b8-5de4-779c-d869-bac28e073091@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 20 Mar 2022, Julien Grall wrote:
> On 20/03/2022 01:46, Stefano Stabellini wrote:
> > On Fri, 18 Mar 2022, Stefano Stabellini wrote:
> > > Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
> > > the test-artifacts qemu container. The minimal test simply boots Xen
> > > (built from previous build stages) and Dom0. The test is fetching the
> > > Dom0 kernel and initrd from Debian Jessie: they work just fine and this
> > > way we don't have to maintain a build for them too.
> > 
> > 
> > Thanks to the Xen fix recently submitted
> > (https://marc.info/?l=xen-devel&m=164774063802402) I'll be able to
> > update this script to use Debian Bullseye. I am thinking of merging the
> > below directly with this patch.
> > 
> > 
> > ---
> > 
> > automation: upgrade Debian to Bullseye for testing Xen aarch32
> > 
> > Also change initrd. As the new netboot initrd from Debian Bullseye is
> > huge (22MB), use a tiny initrd from Alpine Linux instead (only 2.5MB).
> 
> This is sounds odd to me. So we are going to use Bullseye but not really
> because we want to use a different initrd.
> 
> Why can't you get everything from the same place?

Because it doesn't work :-(


> > Also note that the huge Debian Bullseye initrd would cause QEMU to
> > crash due to the -device loader parameter.
> 
> Can you provide more details? Was this reported to QEMU?

QEMU core dumps when provided with the Debian Bullseye initrd binary to
load. I guessed it was due to the size and tried with a smaller size.
Everything worked with a smaller initrd. I also think that it is not a
good idea to use a 22MB initrd anyway so decided against the Debian
Bullseye initrd. (For reference 22MB is basically the size of a fully
featured Yocto-build rootfs.) I did not file a bug to qemu-devel yet and
didn't investigate further on the QEMU side as I ran out of time.

Alpine Linux provides a very nice 2.5MB initrd. I tried to use both
kernel and initrd from Alpine Linux but unfortunately the Alpine Linux
kernel doesn't boot. I don't know why but I think it is because it might
be missing the console driver. I am not sure. There are a lot of
combinations that don't work and it is time consuming to investigate
them all. I have been trying to investigate only the most critical
things -- they are too many! 

I should add that the Debian initrd is not the ideal initrd because it
is made to start the Debian installer. Here we just want a tiny busybox
initrd.

In general, I think it would be better if we could use the kernel and
initrd from the same source but I couldn't find one that works. I could
build one myself but it would be one more thing to maintain in
gitlab-ci. Also using u-boot might solve the problem of loading the
binary but again we would have to maintain a u-boot arm32 build in
gitlab-ci.

So in order of preference best to worst in my opinion:

1) kernel and initrd from the same source
2) kernel and initrd from different sources
3) build your own kernel/initrd/u-boot

So I ended up doing 2). I tested it and it is sufficient to get the test
up and running.

 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > 
> > diff --git a/automation/scripts/qemu-smoke-arm32.sh
> > b/automation/scripts/qemu-smoke-arm32.sh
> > index 162922ace5..d554de7939 100755
> > --- a/automation/scripts/qemu-smoke-arm32.sh
> > +++ b/automation/scripts/qemu-smoke-arm32.sh
> > @@ -5,11 +5,20 @@ set -ex
> >   export DEBIAN_FRONTENT=noninteractive
> >   apt-get -qy update
> >   apt-get -qy install --no-install-recommends device-tree-compiler \
> > -                                            curl
> > +                                            curl \
> > +                                            cpio
> >     cd binaries
> > -curl --fail --silent --show-error --location --output vmlinuz
> > http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/vmlinuz
> > -curl --fail --silent --show-error --location --output initrd.gz
> > http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/initrd.gz
> > +# Use the kernel from Debian
> > +curl --fail --silent --show-error --location --output vmlinuz
> > http://http.us.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
> > +# Use a tiny initrd based on busybox from Alpine Linux
> > +curl --fail --silent --show-error --location --output initrd.tar.gz
> > https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
> > +
> > +mkdir rootfs
> > +cd rootfs
> > +tar xvzf ../initrd.tar.gz
> > +find . | cpio -H newc -o | gzip > ../initrd.gz
> > +cd ..
> >     kernel=`stat -L --printf="%s" vmlinuz`
> >   initrd=`stat -L --printf="%s" initrd.gz`
> > @@ -68,5 +77,5 @@ timeout -k 1 240 \
> >      -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
> >     set -e
> > -(grep -q "^BusyBox" smoke.serial) || exit 1
> > +(grep -q "^/ #" smoke.serial) || exit 1
> >   exit 0


