Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DECA3423BA
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 18:54:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99357.188922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNJJq-0001h7-Mc; Fri, 19 Mar 2021 17:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99357.188922; Fri, 19 Mar 2021 17:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNJJq-0001gl-J6; Fri, 19 Mar 2021 17:53:54 +0000
Received: by outflank-mailman (input) for mailman id 99357;
 Fri, 19 Mar 2021 17:53:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mBZJ=IR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lNJJo-0001gg-Oi
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 17:53:52 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5ccc73d-eff0-4bd8-a522-da24adbc0ade;
 Fri, 19 Mar 2021 17:53:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89AF661940;
 Fri, 19 Mar 2021 17:53:50 +0000 (UTC)
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
X-Inumbo-ID: b5ccc73d-eff0-4bd8-a522-da24adbc0ade
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616176430;
	bh=BEJ9RkjzI1WOzBgPTlN0SlBzqS9pkrrm/I4Zj4Xc4NQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P5JMoiWykU6EzK9XYK5IDb80VfXP71S9Pz8byPp/It9vQfXmFRKLi/CuafX0HoUwk
	 /CGv/cmF2n/4WVBKpGGdUjisXfzCRa5EuOiQab96RkjeTt+O78kU5oHjJYIhzD+Djt
	 ezABY1BoTBvc7vYyUIF3Pk51ueODqq8Ej21ComrLRUslWVU11KFb78FnduNBy9b4mf
	 79o9PmKczGojp+VT836U450mNCwXK0dTLlWv0O+Uky5BfQNu50LJ9zXLvi6J7jHZe4
	 EaA6NBX/skSLbLs7aCwoI6B1TM9He/5iUpchZ4A/2Gc8kLxahI66mjWv03DhkIrQGq
	 OCvoaaXdRCjbA==
Date: Fri, 19 Mar 2021 10:53:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, jgross@suse.com, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] xen/arm: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
In-Reply-To: <47d6b423-5414-f14a-2730-74834bfa18f5@oracle.com>
Message-ID: <alpine.DEB.2.21.2103191050120.439@sstabellini-ThinkPad-T480s>
References: <20210225235158.24001-1-sstabellini@kernel.org> <4707b219-eee1-22e8-8dd3-6b7d821de333@oracle.com> <alpine.DEB.2.21.2103181612260.439@sstabellini-ThinkPad-T480s> <47d6b423-5414-f14a-2730-74834bfa18f5@oracle.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Mar 2021, Boris Ostrovsky wrote:
> On 3/18/21 7:28 PM, Stefano Stabellini wrote:
> >
> > So, I'll follow you suggestion, keep the x86 side named as it is today,
> > and provide a tiny wrapper so that we can still have an arch-neutral
> > xen_swiotlb_detect function (on x86 just calls pci_xen_swiotlb_detect.)
> 
> 
> But now on x86 side we end up with a routine that noone calls. And pci_xen_swiotlb_detect() becomes not __init and so it will have to stick around after boot for no good reason. (You could have made it __ref btw).
> 
> 
> I think we should leave x86 alone. And if there is a declaration in include/xen/swiotlb-xen.h that's only relevant to ARM --- well, so be it. Or perhaps you can create arch/arm/include/asm/xen/swiotlb-xen.h

Yeah I wanted to avoid creating arch/arm/include/asm/xen/swiotlb-xen.h
because I would have to do one of the following:

1) add one more #include <asm/xen/swiotlb-xen.h> to arch/arm64/mm/dma-mapping.c
   (#include <xen/swiotlb-xen.h> is there already)
2) add #include <asm/xen/swiotlb-xen.h> to include/xen/swiotlb-xen.h

What's your preference? If I have to create
arch/arm/include/asm/xen/swiotlb-xen.h, I would go with 2).

