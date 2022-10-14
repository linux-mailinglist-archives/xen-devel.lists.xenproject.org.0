Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6460E5FF48A
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 22:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423128.669616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojRHk-0000MH-Cc; Fri, 14 Oct 2022 20:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423128.669616; Fri, 14 Oct 2022 20:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojRHk-0000Ji-9m; Fri, 14 Oct 2022 20:28:00 +0000
Received: by outflank-mailman (input) for mailman id 423128;
 Fri, 14 Oct 2022 20:27:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cdf0=2P=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ojRHi-0000Jc-OS
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 20:27:58 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af533c48-4bfe-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 22:27:55 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A84F7B818B2;
 Fri, 14 Oct 2022 20:27:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0DB8C433C1;
 Fri, 14 Oct 2022 20:27:52 +0000 (UTC)
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
X-Inumbo-ID: af533c48-4bfe-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665779273;
	bh=rhXfl9tYWrC7olZgnEtU52Lf8/82r8LP+/hrcfkJZbo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Mb6lK8QS4+I7BHspOHkFU6XGqCJOyBGjXgu5nkA/wI3Pg8Jan/3q2CP4pD8S2OX3o
	 f/4ROk3mT+egVlE9x+NNKq25EdH2mvGxYbu7f7/LlZl9sMwXJ+GnQGVrVvHsNZM3zA
	 z4z9LAtxPJHAx8LjMKzfcWuWx4x+1ssHopzd8nNH6utPVbZSyzeCcjh01dozCpQ2jU
	 sxQh44VMLmRzqG+h4sCdDPP4nFrOyAdvu4DLSPBYe7FCYss6yBRM0skxid4NjDIyve
	 XvVFtzw2bXP9NuZVArlUaqZfkvNsMy9rN8PdSZ+YJtR5WwsRhpHheht1e5sS6JgjxJ
	 ljyJbn9uWQlcg==
Date: Fri, 14 Oct 2022 13:27:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 0/3] Yocto Gitlab CI
In-Reply-To: <cover.1665561024.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.22.394.2210141325240.3690179@ubuntu-linux-20-04-desktop>
References: <cover.1665561024.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Oct 2022, Bertrand Marquis wrote:
> This patch series is a first attempt to check if we could use Yocto in
> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
> 
> The first patch is creating a container with all elements required to
> build Yocto, a checkout of the yocto layers required and an helper
> script to build and run xen on qemu with yocto.
> 
> The second patch is creating containers with a first build of yocto done
> so that susbsequent build with those containers would only rebuild what
> was changed and take the rest from the cache.
> 
> The third patch is adding a way to easily clean locally created
> containers.
> 
> This is is mainly for discussion and sharing as there are still some
> issues/problem to solve:
> - building the qemu* containers can take several hours depending on the
>   network bandwith and computing power of the machine where those are
>   created
> - produced containers containing the cache have a size between 8 and
>   12GB depending on the architecture. We might need to store the build
>   cache somewhere else to reduce the size. If we choose to have one
>   single image, the needed size is around 20GB and we need up to 40GB
>   during the build, which is why I splitted them.
> - during the build and run, we use a bit more then 20GB of disk which is
>   over the allowed size in gitlab
> 
> Once all problems passed, this can be used to build and run dom0 on qemu
> with a modified Xen on the 3 archs in less than 10 minutes.

The build still doesn't work for me. I found the reason:

  create archive failed: cpio: write failed - Cannot allocate memory

It is a "silly" out of memory error. I tried to solve the problem by
adding:

  export RPM_BUILD_NCPUS=8

at the beginning of build-yocto.sh but it didn't work. I realize that
this error might be considered a workstation configuration error at my
end but I cannot find a way past it. Any suggestions?

