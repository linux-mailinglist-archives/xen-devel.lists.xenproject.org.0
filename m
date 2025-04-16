Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1D3A90E0E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 23:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956677.1350014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Ahz-0003qz-9c; Wed, 16 Apr 2025 21:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956677.1350014; Wed, 16 Apr 2025 21:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Ahz-0003oc-63; Wed, 16 Apr 2025 21:54:15 +0000
Received: by outflank-mailman (input) for mailman id 956677;
 Wed, 16 Apr 2025 21:54:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcVf=XC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5Ahx-0003oW-9T
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 21:54:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53c08b9e-1b0d-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 23:54:11 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 23C5F5C4B78;
 Wed, 16 Apr 2025 21:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E65FAC4CEE2;
 Wed, 16 Apr 2025 21:54:07 +0000 (UTC)
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
X-Inumbo-ID: 53c08b9e-1b0d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744840448;
	bh=AIca6PD3eL4hvLSuKG3tGUI0XWLSH51RQM00ZKruOd8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q7odyWiC7ahhg9x6tibzHMhYp5yfdllLsx9O8FmqCT+NlzyJJkvTlP173ai/d/ajt
	 4k1WBQtg6Fg1oQLdVjR6vs7t78HUrGFSUxbAvis0lcUZBfomPol33tpEmGIY00RxUF
	 k8sg//UJl9v7XLjyNmOfSkSpI9kdt7cI+jG8pZzKFSTdzhEz/wZ65wsyBRACb1W4U7
	 YVL8ve1ntWgZiKbH29PeukrbZ53OCm3unALt1vG5+oZXYdpr2vsX6/av+CMSQnmWl1
	 dTtEpg+sxjysng1+yqRMfaA/cJ+Gc5f5qV+pULyppxM8cgpnLiTkhcNGNydRg+ha8U
	 w5cKRLlN8VRHw==
Date: Wed, 16 Apr 2025 14:54:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3 2/6] CI: avoid repacking initrd as part of the test
 job
In-Reply-To: <2e2156cc-1bf0-4585-bb31-faca5321fec3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2504161452230.8008@ubuntu-linux-20-04-desktop>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com> <20250414110903.2355303-3-andrew.cooper3@citrix.com> <alpine.DEB.2.22.394.2504151637100.8008@ubuntu-linux-20-04-desktop> <2e2156cc-1bf0-4585-bb31-faca5321fec3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-364384658-1744840448=:8008"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-364384658-1744840448=:8008
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 16 Apr 2025, Andrew Cooper wrote:
> On 16/04/2025 12:48 am, Stefano Stabellini wrote:
> >> diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
> >> index c4be71464246..e2376cb51cb4 100755
> >> --- a/automation/scripts/qubes-x86-64.sh
> >> +++ b/automation/scripts/qubes-x86-64.sh
> >> @@ -164,16 +164,13 @@ ${domU_extra_config}
> >>  "
> >>  
> >>  if [ -n "$domU_check" ]; then
> >> -    # DomU
> >> +    # DomU rootfs
> >> +    cp binaries/rootfs.cpio.gz binaries/domU-rootfs.cpio.gz
> >> +
> >> +    # test-local configuration
> >>      mkdir -p rootfs
> >>      cd rootfs
> >> -    # fakeroot is needed to preserve device nodes in rootless podman container
> >> -    fakeroot -s ../fakeroot-save tar xzf ../binaries/initrd.tar.gz
> >> -    mkdir proc
> >> -    mkdir run
> >> -    mkdir srv
> >> -    mkdir sys
> >> -    rm var/run
> >> +    mkdir -p etc/local.d
> >>      echo "#!/bin/sh
> > I am worried about the drop of fakeroot because the newly created dirs
> > and files we'll have user as owner instead of root.
> >
> > I suggest we fix this for consistency, and cpio -R 0:0 might suffice.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/9737393986#L1087
> 
> It seems to be all root anyway.  I'm not entirely sure why, but it does
> explain why everything is working, given the attempt to have non-root
> containers.

Hi Andrew, thank you for looking into this. I am truly surprised to see
xen.start marked as root.root. Given that it is what we want I will not
complain though :-)
--8323329-364384658-1744840448=:8008--

