Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6D8AC98B2
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 02:58:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001774.1381895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAY9-0000pR-G5; Sat, 31 May 2025 00:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001774.1381895; Sat, 31 May 2025 00:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAY9-0000nz-CE; Sat, 31 May 2025 00:58:13 +0000
Received: by outflank-mailman (input) for mailman id 1001774;
 Sat, 31 May 2025 00:58:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLAY8-0000nt-2k
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:58:12 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d85b2d7-3dba-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 02:58:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9E306A4FD19;
 Sat, 31 May 2025 00:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D67C4CEEB;
 Sat, 31 May 2025 00:57:59 +0000 (UTC)
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
X-Inumbo-ID: 4d85b2d7-3dba-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748653081;
	bh=7Y77Y3K31XRyBwUrA9A6ORjCGqsUpFz3lQ5Ki8YB1dw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TlAyzxdArFFsiVGgATRFLZRK6E0ZcYv4/M+/VI09SAacosORxik+fucnQNYoXRkkF
	 KaO7gyZusi9lmnh7EWUKuR4Eungy2madiUsSwMm6udhSEhA0wscJhNiWM/LrztoOFM
	 ZUVer2ebu/U2MgyIYZMMx5ccP2AcsKdRL/hzWOWFzzESUR6h5wwaqDAuhKnt0XVk78
	 l2dYCg9jFuf7eQFcImFJokDKkKbdbS/TL0CGWQ1UasP/b9Q7wgKS2yGcnDTsXXtENp
	 9dXh4ejWhfDymQjl312yh/QLVOFi9FkQR1zGP/gM5rhQB+fLMM+VkFUcRvRu3IDVjp
	 Q2ajvWiD8dAVg==
Date: Fri, 30 May 2025 17:57:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Alejandro Vallejo <agarciav@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 07/19] arm/gnttab: Break cycle between asm/grant_table.h
 and xen/grant_table.h
In-Reply-To: <c94dd42c-a2be-4759-a5de-7c9db46acd16@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301757490.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-8-agarciav@amd.com> <c94dd42c-a2be-4759-a5de-7c9db46acd16@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Jason Andryuk wrote:
> On 2025-05-30 08:02, Alejandro Vallejo wrote:
> > xen/grant_table is meant to pull asm/grant_table, when it exists.
> > 
> > Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> 
> I think you can also remove this one:
> xen/arch/arm/dom0less-build.c:#include <asm/grant_table.h>
> 
> With that,
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>


Acked-by: Stefano Stabellini <sstabellini@kernel.org>

