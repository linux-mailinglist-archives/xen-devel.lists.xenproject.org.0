Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E4E5B7AD1
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 21:29:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406617.648990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYBaY-0004lY-OU; Tue, 13 Sep 2022 19:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406617.648990; Tue, 13 Sep 2022 19:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYBaY-0004iX-Lk; Tue, 13 Sep 2022 19:28:54 +0000
Received: by outflank-mailman (input) for mailman id 406617;
 Tue, 13 Sep 2022 19:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVF+=ZQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oYBaW-0004iR-Ad
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 19:28:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b3af72a-339a-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 21:28:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 54C8E61552;
 Tue, 13 Sep 2022 19:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C40C433C1;
 Tue, 13 Sep 2022 19:28:48 +0000 (UTC)
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
X-Inumbo-ID: 4b3af72a-339a-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663097328;
	bh=7Qy2pf6lStgBgnZ9B5Pnmqjsv8fmEWyK4UeTZVi+NT8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EJ4nkHB8oGkH9Gj/frfCojf2rFGjbFD/SvX5gwZiBh4F66ulR9TL4lHynLi91gHY+
	 M8TkGo6U6ykaZ6N3+amBvxwJK9yoN0tgJdkKYDSkjg0hzF6oaNCHewcItwILJ38dCp
	 wBjbzG4Z8I91i1tVJMLg9nJFol1IpQfpyveTjAggbtkiogRHKPBjglOTibantofrZQ
	 bvWG2cO1jEkwiU8gDvexcNFjz0gbiz7KaPIOvrV4m01tNBeJthsHmQf1vAFVZzQ1jH
	 UW89T8JSVx8ApDyZAhWbaYYCrAcHVZE06JcELyK2PbWeazSD1+HAeIkfU7E959qIdk
	 GMAJfzuAVEsnA==
Date: Tue, 13 Sep 2022 12:28:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org, 
    sstabellini@kernel.org
Subject: Re: [ImageBuilder 0/2] Use lopper to generate partial dts
In-Reply-To: <81eee8c0-03e4-fa41-757d-ee749ebcbe07@amd.com>
Message-ID: <alpine.DEB.2.22.394.2209131215390.157835@ubuntu-linux-20-04-desktop>
References: <20220912115934.19552-1-michal.orzel@amd.com> <64aadcab-5f41-6d2f-4dc9-39415016816a@amd.com> <81eee8c0-03e4-fa41-757d-ee749ebcbe07@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Sep 2022, Michal Orzel wrote:
> Hi Ayan,
> 
> On 12/09/2022 18:27, Ayan Kumar Halder wrote:
> > Hi Michal,
> > 
> > On 12/09/2022 12:59, Michal Orzel wrote:
> >> This patch series introduces support to generate automatically passthrough
> >> device trees using lopper. This feature should be used with care as the
> >> corresponding lopper changes are still in an early support state. Current
> >> integration has been tested with several devices from ZynqMP ZCU102 board
> >> e.g. serial, spi, ahci, mmc.
> >>
> >> When using this feature, make sure to use the latest lopper's master branch
> >> status [1].
> > 
> > I am guessing that this is the first time the imagebuilder is using 
> > script from an external repo. There might always be a possibility that 
> > future changes to lopper (master branch) might not be backward 
> > compatible or might break something in imagebuilder.
> > 
> > As such, will it make things better if lopper is included as a 
> > gitsubmodule for imagebuilder. This way a specific revision of lopper 
> > will be in sync with a specific revision of imagebuilder.
> > 
> > Please let me know your thoughts.
>
> I think it could be beneficial in the future but not in the current state.
> The reason why is that the lopper changes are in an early support state
> (I try to highlight it on each occasion). This means that in the near
> future we will be improving lopper extract assists to cover some corner cases.
> Adding lopper as a submodule now, would result in a need of additional commits
> for the ImageBuilder fetching new lopper changes each time we improve something
> in lopper. I think we do not need such overhead at this stage.
> 
> Also lopper's README states that "Internal interfaces are subject to change"
> so we can assume that the interface given to the user will not change.

Forward and backward compatibility is something we'll need to think
about at some point.

Personally I dislike git submodules and I would try to avoid using them
unless strictly necessary. However, we could specify a commit-id or tag
to use (the same way Yocto specifies component versions.)

Given that it is still early stage for this feature, I think we could
ignore the problem for now and come back to it in the future.

Or we could change this patch series now to take as LOPPER_PATH input
something like a SRC_URI in Yocto, which could be any of the following:

git://some.host/somepath;branch=branchX,branchY;name=nameX,nameY
https://some.host/somepath;branch=branchX,branchY;name=nameX,nameY
file://local.path/to/file.txt

If we did this, it would be more future proof and we could use the
https:// URI by default with the "master" or "master-next" branch so
that we would automatically get the latest updates. In the future we
would specificy a stable branch instead (e.g. v0.2022.x).

