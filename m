Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A231DC1ED
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 00:13:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbWxY-0000Nw-7v; Wed, 20 May 2020 22:13:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P2h4=7C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbWxX-0000No-3z
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 22:13:07 +0000
X-Inumbo-ID: 14ba0248-9ae7-11ea-b9cf-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14ba0248-9ae7-11ea-b9cf-bc764e2007e4;
 Wed, 20 May 2020 22:13:06 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1F19207F9;
 Wed, 20 May 2020 22:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590012786;
 bh=tq7/f6iaVdvUCdJrnIHbL8rMDfqcEiBj//6g+yk7qlY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=moJe1oYMc3HhHjpkA8qODSAdO3VyVNECSvn34rvJiCxojubSOBkFGuCV4UQlo0LoK
 oguvJ8RqU0gXpp6TJ7Bvm2cw5/MVctWOfNZMleqKeY+N9DaKadpHvKeFT05F/rQw8z
 BgUjHB3u/gQKyRAw+GYVBrKNjp9crbKTWiZU3gKc=
Date: Wed, 20 May 2020 15:13:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.14 0/3] Remove the 1GB limitation on Rasberry Pi
 4
In-Reply-To: <20200518113008.15422-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2005201512380.27502@sstabellini-ThinkPad-T480s>
References: <20200518113008.15422-1-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, minyard@acm.org, paul@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 roman@zededa.com, George Dunlap <george.dunlap@citrix.com>,
 jeff.kubascik@dornerworks.com, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 18 May 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> At the moment, a user who wants to boot Xen on the Raspberry Pi 4 can
> only use the first GB of memory.
> 
> This is because several devices cannot DMA above 1GB but Xen doesn't
> necessarily allocate memory for Dom0 below 1GB.
> 
> This small series is trying to address the problem by allowing a
> platform to restrict where Dom0 banks are allocated.
> 
> This is also a candidate for Xen 4.14. Without it, a user will not be
> able to use all the RAM on the Raspberry Pi 4.

The series looks good to me aside from the couple of minor issues being
discussed


> This series has only be slighlty tested. I would appreciate more test on
> the Rasbperry Pi 4 to confirm this removing the restriction.
> 
> Cheers,
> 
> Cc: paul@xen.org
> 
> Julien Grall (3):
>   xen/arm: Allow a platform to override the DMA width
>   xen/arm: Take into account the DMA width when allocating Dom0 memory
>     banks
>   xen/arm: plat: Allocate as much as possible memory below 1GB for dom0
>     for RPI
> 
>  xen/arch/arm/domain_build.c                | 32 +++++++++++++---------
>  xen/arch/arm/platform.c                    |  5 ++++
>  xen/arch/arm/platforms/brcm-raspberry-pi.c |  1 +
>  xen/include/asm-arm/mm.h                   |  2 ++
>  xen/include/asm-arm/numa.h                 |  5 ----
>  xen/include/asm-arm/platform.h             |  2 ++
>  6 files changed, 29 insertions(+), 18 deletions(-)
> 
> -- 
> 2.17.1
> 

