Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB45894FE
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 01:45:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380117.614103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJO2H-0005N5-JC; Wed, 03 Aug 2022 23:44:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380117.614103; Wed, 03 Aug 2022 23:44:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJO2H-0005KZ-F8; Wed, 03 Aug 2022 23:44:21 +0000
Received: by outflank-mailman (input) for mailman id 380117;
 Wed, 03 Aug 2022 23:44:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7Vd=YH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oJO2F-0005K5-Vq
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 23:44:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fdb64be-1386-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 01:44:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3DCCC616EA;
 Wed,  3 Aug 2022 23:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAF8C433D6;
 Wed,  3 Aug 2022 23:44:15 +0000 (UTC)
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
X-Inumbo-ID: 2fdb64be-1386-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659570255;
	bh=pyFhZdrc+BbfeXa6cTgSbQju22oiS8xtcQfZeLqe9EE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i81h0apMg0NkaP1bVXhoxHlnjhNABtApLJcrj6I1AXy5LCoa1WESRK9OKNMBSpuep
	 uKvNmkMJvJFD7rXinDR5fyi+fT8qFUHNEBJ98NoD8WsWd8HlOIdiwoYx4pkX+T6VQ5
	 k0yIDEQkG4faR2Gphf+7CJQ2VAEfjm/1mY8mxzhRyV1rywy570IDmYesa+lX4lYPJC
	 cZw1dNunfcq77LHdIl8/Ze6shrWpziPNOs+bQ+mCRJwiGapgT8+59J71QJLIAZKX67
	 rgAlJ4Epy0bNsArV8AAcvZ73gXJakX1CGwqBn/Tt85P78CTkyenXgaxT3EQ7AWoQMI
	 s0UhCgL6ueNcQ==
Date: Wed, 3 Aug 2022 16:44:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Anthony Perard <anthony.perard@citrix.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.16.2
In-Reply-To: <b37c1dcc-eb80-c5ac-30e8-626084e689b0@suse.com>
Message-ID: <alpine.DEB.2.22.394.2208031515210.3147284@ubuntu-linux-20-04-desktop>
References: <5622e17f-c424-87a4-d7c4-bbe1dee4743c@suse.com> <e52776d1-ed65-cf0d-bbc8-1431c183d73c@xen.org> <b37c1dcc-eb80-c5ac-30e8-626084e689b0@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Aug 2022, Jan Beulich wrote:
> On 03.08.2022 11:29, Julien Grall wrote:
> > On 27/07/2022 08:26, Jan Beulich wrote:
> >> All,
> > 
> > Hi Jan,
> > 
> >> the release is due in about two weeks time.
> >>
> >> Please point out backports you find missing from the respective staging
> >> branch, but which you consider relevant. I'm surprised in particular
> >> that no Arm backports have appeared on the branch at all since 4.16.1
> >> had gone out.
> > 
> > Stefano is meant to look after the backports so I have held off doing 
> > them (although I don't really want to take that responsability :)). 
> > Below a potential list:
> > 
> > - af570d1c90f1 "xen/arm: Advertise workaround 1 if we apply 3"
> > - 95604873ccf5 "arm/its: enable LPIs before mapping the collection table"
> > - 407b13a71e32 "xen/arm: p2m don't fall over on FEAT_LPA enabled hw"
> > - aa1cba100bff "xen/arm: Avoid overflow using MIDR_IMPLEMENTOR_MASK"
> > - ee11f092b515 "xen: arm: Don't use stop_cpu() in halt_this_cpu()"
> > - 6655eb81092a "xen/arm: avoid overflow when setting vtimer in context 
> > switch"
> > - 25424d1a6b7b "xen/arm: head: Add missing isb after writing to 
> > SCTLR_EL2/HSCTLR"
> > - 800f21499e0e "arm/vgic-v3: fix virq offset in the rank when storing 
> > irouter"
> 
> Since Julien's mail was directed at me (only), FTAOD: You're going to
> take care of these, no action needed on my part?

Done; no action needed on your part.

