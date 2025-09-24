Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB69BB9C438
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 23:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129727.1469545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Ww0-0005Yc-HM; Wed, 24 Sep 2025 21:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129727.1469545; Wed, 24 Sep 2025 21:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1Ww0-0005Wd-ES; Wed, 24 Sep 2025 21:21:56 +0000
Received: by outflank-mailman (input) for mailman id 1129727;
 Wed, 24 Sep 2025 21:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mTDa=4D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1v1Wvy-0005WS-QL
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 21:21:54 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ba1fbad-998c-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 23:21:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CBBAE44761;
 Wed, 24 Sep 2025 21:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892F6C4CEF8;
 Wed, 24 Sep 2025 21:21:47 +0000 (UTC)
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
X-Inumbo-ID: 7ba1fbad-998c-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758748908;
	bh=M5aVdWR5CNz8WiT95YERrCl2nb5p78koFdCQP8Bz/YI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aGq8FLsDCaN2/NWnddqfblnsnuscWMlZ9Qvbq714+U3IHYOiDWFdpts7IjbSx9zlb
	 5ZdqjRke0SN+ZE82BOXcs62AZ0x6FycYjdqPuxy/4CyorWFQ4Ej+TCwkZH+fAfSV+i
	 yarOG8DT5ZXfFU5CtfH84u3+4GmuxBYvh3eoqo8tCOIPG+bjm/sMPBusu9cWBBOl/J
	 BIXIld/GF5hi9lNgfL1kbSnWull39CiqYFIIQt5mErGidMwT1Dyp8DSHHETF1PH/Rf
	 sIE+UMdZ9maI6Rr9QAiuJxS2Ccn8KmHEzdT3R6ELztJ72oBQXP2DVmGjch4sYQEZYL
	 zGDR80Taq2QWg==
Date: Wed, 24 Sep 2025 14:21:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] CI: Switch the alpine containers to be non-root
In-Reply-To: <2c91d873-7f13-4f78-a0d8-8f67f06c88b2@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2509241414580.2244509@ubuntu-linux-20-04-desktop>
References: <20250910113416.1835988-1-andrew.cooper3@citrix.com> <aMFnqW7xgbL1ZSBi@mail-itl> <2c91d873-7f13-4f78-a0d8-8f67f06c88b2@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-525722612-1758748908=:2244509"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-525722612-1758748908=:2244509
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 10 Sep 2025, Andrew Cooper wrote:
> On 10/09/2025 12:57 pm, Marek Marczykowski-Górecki wrote:
> > On Wed, Sep 10, 2025 at 12:34:16PM +0100, Andrew Cooper wrote:
> >> Testing on staging-4.19 is hitting a reliable failure, caused by alpine/3.18
> >> being a root build container, but debian/12-x86_64 being a non-root test
> >> container.  Specifically, the test container can't copy XEN_PAGING_DIR and
> >> XEN_DUMP_DIR (both 700) from the build root in order to construct the initrd.
> >>
> >> staging-4.20 and later do not repack the initrd in this way, so are not
> >> affected.
> >>
> >> Switch both alpine containers to being non-root.  This is still slightly
> >> fragile, but better than depending on using root containers for both.
> > This will likely explode done as is...
> >
> > First, grub.cfg is not writable anymore:
> > https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/11305545275#L170
> >
> > I'm not sure what 'user' gets remapped to here, but the whole container
> > is running under rootless podman, as gitlab-runner user. Files on the
> > host are owned by gitlab-runner user.
> >
> > But second, repacking initrd as non-root, without any extra care will
> > result in broken initrd. At the very least /sbin/mount is suid root -
> > when repacked as normal user, it will end up as suid to non-root,
> > breaking it quite effectively. I've run into this issue when needing to
> > repack rootfs anyway and ended up using fakeroot (again):
> > https://gitlab.com/xen-project/people/marmarek/xen/-/commit/bab939159127a9f8e56e119c1fa553c7bbb6d4f7
> >
> > At least your "CI: Create initrd fragments explicitly as root" patch may
> > need backporting, but TBH I'm not sure if that's enough. /dev will
> > likely be messed up too.
> 
> There's a lot of collateral damage here.  Summarising things a little.
> 
> * We cannot change the root-ness of alpine/3.18-arm64v8.  Like
> xilinx-xenial, it does need root to drive real hardware

Apologies for joining this thread late. I wanted to add that it is
OK to separate containers intended to drive real hardware, such
as xenial-xilinx, from regular build containers. For example,
3.18-arm64v8 could be moved out and used only in .adl-x86-64,
similar to how xenial-xilinx is used only in .xilinx-arm64.
Normal build jobs, such as alpine-3.18-gcc-arm64, could use a
different container.

I suggest we rename 3.18-arm64v8 to something else and create a new
3.18-arm64v8 specifically for builds, to be used only in build jobs.

The renamed original 3.18-arm64v8, together with xenial-xilinx, could be
moved under test-artifacts/ or another appropriate location, as they do
not quite belong with the other build containers. This separation also
aligns with the root/non-root distinction.

--8323329-525722612-1758748908=:2244509--

