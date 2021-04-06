Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C1355FD8
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 02:01:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106340.203352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTvby-0002y3-RV; Tue, 06 Apr 2021 23:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106340.203352; Tue, 06 Apr 2021 23:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTvby-0002xh-O4; Tue, 06 Apr 2021 23:59:58 +0000
Received: by outflank-mailman (input) for mailman id 106340;
 Tue, 06 Apr 2021 23:59:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uncx=JD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lTvbw-0002xc-GD
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 23:59:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c297de3-5cdc-4712-a160-ba235a8187bb;
 Tue, 06 Apr 2021 23:59:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF34F613B9;
 Tue,  6 Apr 2021 23:59:53 +0000 (UTC)
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
X-Inumbo-ID: 6c297de3-5cdc-4712-a160-ba235a8187bb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617753594;
	bh=OR9OcYc6YvrC6IDS8xbTnjc2Vdj0o0KpbzWyx/hD04g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IY1XUZtRTC9rqi7AqRviOghnSS2AyDI8F61iAY0gfgkl9DBzoGlKz6SJZKKY+XVC9
	 giBOt0PTnQ/wv9Tyeo1KCUklk0bVwT/kIeTs2Tp688nwC9nLMUoyo4GkYDsRjso2Jv
	 iSNS/ooR4byb+ZP+E5NatwSNODkEuIZuSRpiWCWCKkTU055FByjWYOC/I0VA3l4bg5
	 e92vwVeMpEFN4Bhe8yd9sXTyuhUXeh+cTxrMmI5w3CJavbCqYzEhS89As+uhYOo5Rk
	 EUfpoYjrRzpaI33QmPyT25JtNZ7lf6tMz0c1jrgqWkTM4SYmx8g4IdMVMtk0EJP5J3
	 h8cNsveAxHIZQ==
Date: Tue, 6 Apr 2021 16:59:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, brian.woods@xilinx.com
Subject: Re: [PATCH v3 0/3] Generic SMMU Bindings
In-Reply-To: <80de3eb5-b338-af4e-42eb-d358f51d0bd7@xen.org>
Message-ID: <alpine.DEB.2.21.2104061606080.31460@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s> <80de3eb5-b338-af4e-42eb-d358f51d0bd7@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 5 Apr 2021, Julien Grall wrote:
> On 26/01/2021 22:58, Stefano Stabellini wrote:
> > Hi all,
> 
> Hi Stefano,
> 
> > This series introduces support for the generic SMMU bindings to
> > xen/drivers/passthrough/arm/smmu.c.
> > 
> > The last version of the series was
> > https://marc.info/?l=xen-devel&m=159539053406643
> Some changes in the SMMU drivers went in recently. I believe this touched
> similar area to this series. Would you be able to check that this series still
> work as intented?

Thanks for the heads up, no, unfortunately they don't work :-(

They badly clash. I did the forward port of the three patches but they
fail at runtime in my tests. I ran out of time to figure out what is the
problem, and I'll have to pick it up at some point in the future (it
might not be any time soon unfortunately).

Rahul, if you have any ideas about what the problem is please let me
know. This is the branch with the forward port:

http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git smmu-generic

