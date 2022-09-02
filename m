Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418F65AA554
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 03:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397136.637605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTvpn-0004ss-1N; Fri, 02 Sep 2022 01:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397136.637605; Fri, 02 Sep 2022 01:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTvpm-0004q6-Ts; Fri, 02 Sep 2022 01:51:02 +0000
Received: by outflank-mailman (input) for mailman id 397136;
 Fri, 02 Sep 2022 01:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oTvpk-0004px-UT
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 01:51:00 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0f57694-2a61-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 03:50:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 28493B828C3;
 Fri,  2 Sep 2022 01:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6228C433D6;
 Fri,  2 Sep 2022 01:50:56 +0000 (UTC)
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
X-Inumbo-ID: b0f57694-2a61-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662083457;
	bh=kpvZcNv0Yk2sZhMzSSlCr20ObFRFOyBCoQqD7/vjsRY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PZV/uYVzmpiJmgsBAN/gWPfHeWXq2N8VbUeLQeulIls6D5IXnwlnLZRVATWRiT3Gj
	 CB08Np+/uUl8NOFFZfebQGz3bm4FUniNY1CnRp7TkaamzfpBQMK43jcJroBIHtZUMz
	 kWr4TroGrYJ/G9rWzuQmFXOeE3FZJnK8r9YXx1WtxPxDCTXga6svpScaZjqWXXG6/3
	 6DKowh122y1x8/ZIxFK6IUMiae2rlr/IimXzLqgdKGTSOqyYJhZ1HRxzCYUjmd/i5S
	 Y1t3wn4Ums0aVV6QLSbXeHwNoIR14LmRxM0HjmOOcuXn/4v0wd34eJbvZwfzm9fIet
	 jmnZQh3ZzkBqg==
Date: Thu, 1 Sep 2022 18:50:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Henry Wang <Henry.Wang@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
In-Reply-To: <fc0706f6-7635-6b0d-811a-c3ed41f481fc@xen.org>
Message-ID: <alpine.DEB.2.22.394.2209011849040.3931@ubuntu-linux-20-04-desktop>
References: <20220824073127.16762-1-Henry.Wang@arm.com> <20220824073127.16762-3-Henry.Wang@arm.com> <50bc7ce9-dc98-127b-d0db-40bf82929fc7@xen.org> <AS8PR08MB79913A96E64B31A02C985EB5927B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2209011003570.2375071@ubuntu-linux-20-04-desktop> <fc0706f6-7635-6b0d-811a-c3ed41f481fc@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Sep 2022, Julien Grall wrote:
> Hi Stefano,
> 
> On 01/09/2022 18:08, Stefano Stabellini wrote:
> > > > Also, what happen with UEFI? Is it easy to guarantee the region will not
> > > > be used?
> > > 
> > > For now I think it is not easy to guarantee that, do you have some ideas
> > > in mind? I think I can follow this in above follow-up series to improve
> > > things.
> > 
> > For clarity, are we worried that the region is used by the bootloader
> > for other things? For instance U-Boot or Tianocore placing some
> > firmware tables inside the range specified for xenheap?
> 
> Yes. I think it would be difficult for an admin to figure out which regions
> are used. Although they are likely (?) going to be static for a given
> UEFI/U-boot build.
> 
> My major concern is such bug can be very difficult to root cause because we
> have no safety in Xen. The most likely symptom would be random corruption.

Thanks for the clarification. Yeah, I think we'll have to do some
"creative thinking" to figure out a solution to this issue. I wonder if
U-boot or Tianocore have some sort of API (or build-time data) to know
the unavailable ranges.

In any case, I think we can postpone to after the release.

