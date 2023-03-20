Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 965996C230F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 21:42:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512128.791835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peMKG-0001G8-T8; Mon, 20 Mar 2023 20:41:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512128.791835; Mon, 20 Mar 2023 20:41:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peMKG-0001Da-QR; Mon, 20 Mar 2023 20:41:52 +0000
Received: by outflank-mailman (input) for mailman id 512128;
 Mon, 20 Mar 2023 20:41:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSrZ=7M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1peMKF-0001DU-Lr
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 20:41:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a33800f9-c75f-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 21:41:50 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6732B61800;
 Mon, 20 Mar 2023 20:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1101EC433D2;
 Mon, 20 Mar 2023 20:41:46 +0000 (UTC)
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
X-Inumbo-ID: a33800f9-c75f-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679344907;
	bh=hONGXQ7/6TrMEBm/7OQ2PJ6hG20wQyi7r12+gnrU4TM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UPbXOtIWIpobJep02jBoqyl5O9uOd0hxl9zvj3TSloc5Q4pZKFt6HjHqM4NciRSUn
	 6OR6Ud2MMmThLpfZM9ulZhsay8RDAcM8RLLmCdpkkI3h+G7ViV71ak++JBhYl6KIY+
	 8cIbz/dBNhhtKHH8ImHjJlr7yI4NhsNHhZBWmPK3ho2uciYD4YKcSiDwYyR7bTEdOv
	 Q/VQH4/p5ioytZP6+olpkX1lACcfkEGKSdI6GxZRrdcc7yTIMnL3sHcMOjiCz5cxHB
	 pi/5l9Bw0IoGNGxoO3DghM/lfwtYhqJfCIDd/vqrX2w2mlUDO3OFtusLcb8flFl899
	 7z7m9RSjH4csA==
Date: Mon, 20 Mar 2023 13:41:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a suspend test on an Alder Lake
 system
In-Reply-To: <ZBjDu+EEvQ51hWFU@mail-itl>
Message-ID: <alpine.DEB.2.22.394.2303201337580.3359@ubuntu-linux-20-04-desktop>
References: <cover.5a69c1f96ff446a5872e9dbf6308be9ab278f9df.1679023966.git-series.marmarek@invisiblethingslab.com> <aa4385f5291ebc06551414e4d8cbf7cdd3996eef.1679023966.git-series.marmarek@invisiblethingslab.com> <alpine.DEB.2.22.394.2303171539520.3359@ubuntu-linux-20-04-desktop>
 <ZBULiU0222GlcC1W@mail-itl> <alpine.DEB.2.22.394.2303201258140.3359@ubuntu-linux-20-04-desktop> <ZBjDu+EEvQ51hWFU@mail-itl>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1753774809-1679344907=:3359"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1753774809-1679344907=:3359
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 20 Mar 2023, Marek Marczykowski-Górecki wrote:
> On Mon, Mar 20, 2023 at 01:08:42PM -0700, Stefano Stabellini wrote:
> > On Sat, 18 Mar 2023, Marek Marczykowski-Górecki wrote:
> > > On Fri, Mar 17, 2023 at 04:10:22PM -0700, Stefano Stabellini wrote:
> > > > On Fri, 17 Mar 2023, Marek Marczykowski-Górecki wrote:
> > > > > +fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> > > > 
> > > > I am a bit confused about it: are you sure you need fakeroot for this?
> > > > This script is running inside a container as root already? Are you using
> > > > Docker on the RPi4 to run this job?
> > > 
> > > This is running in a rootless podman container. But even with docker,
> > > for device files to work (see commit message) it would need to run
> > > privileged container, which I'd like to avoid.
> > 
> > Are you sure? I can run a non-privileged container with device assigned
> > just fine with Docker and
> >  
> >   devices = ["/dev/ttyUSB0:/dev/ttyUSB0"]
> > 
> > in the gitlab-runner config.toml.
> 
> It isn't about accessing existing devices, it's about creating them
> (unpacking rootfs which contains static /dev) and then packing it back
> still having those devices.

OK for that definitely you don't need a privileged container. A regular
container comes with "root" by default, but without all the privileges
that "root" normally allows outside of a container. That is enough (at
least in my environments) to pack/unpack a rootfs successfully without
fakeroot. Maybe this is a podman-specific limitation?

If you are curious to try, you should be able to run a simple
pack/unpack rootfs with Docker (of course without --privileged) without
issues.
--8323329-1753774809-1679344907=:3359--

