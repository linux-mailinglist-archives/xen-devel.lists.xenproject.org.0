Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107E258E313
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 00:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383219.618349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLXXC-0005o7-9I; Tue, 09 Aug 2022 22:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383219.618349; Tue, 09 Aug 2022 22:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLXXC-0005l4-62; Tue, 09 Aug 2022 22:17:10 +0000
Received: by outflank-mailman (input) for mailman id 383219;
 Tue, 09 Aug 2022 22:17:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lP5k=YN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oLXXB-0005ky-7E
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 22:17:09 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0141f169-1831-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 00:17:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB045B81A07;
 Tue,  9 Aug 2022 22:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0A35C433D6;
 Tue,  9 Aug 2022 22:17:04 +0000 (UTC)
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
X-Inumbo-ID: 0141f169-1831-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660083425;
	bh=1kMaJKSySqhyNCALNV5bz1PDGI+AhN72J9+P6bKwbTI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l90pl2IlJaIggt3fci15rUX4Flqlu0moQL9lW0m+zBuPS4lUoiAFfqPbkYl8RdDMI
	 OJ6QjlEoBYeiUhqJD4AZFyDbSnjUvW6vj/XQxR3cRkfCoP8VplEcdNNgZUJLQVWSAr
	 xM1Et1lrBV64B5lCy7grrHY62+cuUa6U8FGRlBtlm+84/QzGC6tI55ET6ECVcda7s3
	 yeje/5sb05W9qIcp3R4ZOWtZ7oZVZ6cT8GKurFptJlyo98xFVIiE5IfsJIAFP2+px8
	 j7EeGAbNUQPMgWNQhRt7wsqsc1FB/LacJmXQppqMtBEjmHN3TleKhdv+MyLGopGuZW
	 Evfw0vZqG0ttg==
Date: Tue, 9 Aug 2022 15:17:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayankuma@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefanos@xilinx.com, stefanos@amd.com, cardoe@cardoe.com
Subject: Re: [XEN v1] gitlab: automation: Fix the automation scripts
In-Reply-To: <20220809155711.39168-1-ayankuma@amd.com>
Message-ID: <alpine.DEB.2.22.394.2208091513230.3790@ubuntu-linux-20-04-desktop>
References: <20220809155711.39168-1-ayankuma@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Thanks Ayan. The issue is that Debian unstable moved forward so now
apt-get fails. I updated the build container and the issue went away (I
rebuilt (automation/build/debian/unstable-arm64v8.dockerfile). So the
issue is gone for now.

In general, I don't know if it is a good idea to apply this patch: on
one hand it would make the script harder to break in the future next
time Debian moves forward, but I am concerned about additional
bandwidth and unnecessary upgrading done to packages for every test that
we run.


On Tue, 9 Aug 2022, Ayan Kumar Halder wrote:
> One needs to run 'apt-get -qy upgrade' to upgrade the old packages so that
> the missing dependent packages are also installed.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> This is supposed to fix issues seen https://gitlab.com/xen-project/xen/-/jobs/2832045004
> The failure is :-
> root@4a175985cd71:/Users/ayankuma/alpine_vm/xen# apt-get -qy install --no-install-recommends u-boot-qemu u-boot-tools device-tree-compiler busybox-static cpio curl
> Reading package lists...
> Building dependency tree...
> Reading state information...
> Some packages could not be installed. This may mean that you have
> requested an impossible situation or if you are using the unstable
> distribution that some required packages have not yet been created
> or been moved out of Incoming.
> The following information may help to resolve the situation:
> 
> The following packages have unmet dependencies:
>  libc6-dev : Breaks: libglib2.0-dev (<= 2.72.3-1) but 2.70.2-1 is to be installed
> E: Error, pkgProblemResolver::Resolve generated breaks, this may be caused by held packages.
> 
> For this we need to upgrade the packages which will resolve the dependencies.
> 
>  automation/scripts/qemu-smoke-arm32.sh | 1 +
>  automation/scripts/qemu-smoke-arm64.sh | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
> index 530f3892fd..e7e733798c 100755
> --- a/automation/scripts/qemu-smoke-arm32.sh
> +++ b/automation/scripts/qemu-smoke-arm32.sh
> @@ -4,6 +4,7 @@ set -ex
>  
>  export DEBIAN_FRONTENT=noninteractive
>  apt-get -qy update
> +apt-get -qy upgrade
>  apt-get -qy install --no-install-recommends device-tree-compiler \
>                                              curl \
>                                              cpio
> diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
> index 497dbee15f..f714aacbb3 100755
> --- a/automation/scripts/qemu-smoke-arm64.sh
> +++ b/automation/scripts/qemu-smoke-arm64.sh
> @@ -23,6 +23,7 @@ fi
>  
>  export DEBIAN_FRONTENT=noninteractive
>  apt-get -qy update
> +apt-get -qy upgrade
>  apt-get -qy install --no-install-recommends u-boot-qemu \
>                                              u-boot-tools \
>                                              device-tree-compiler \
> -- 
> 2.17.1
> 

