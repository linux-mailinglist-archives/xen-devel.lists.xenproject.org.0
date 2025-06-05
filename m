Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35318ACF9F7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 01:20:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007686.1386953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNJrp-0002aP-P9; Thu, 05 Jun 2025 23:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007686.1386953; Thu, 05 Jun 2025 23:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNJrp-0002Y8-Lu; Thu, 05 Jun 2025 23:19:25 +0000
Received: by outflank-mailman (input) for mailman id 1007686;
 Thu, 05 Jun 2025 23:19:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBp0=YU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNJro-0002X0-3e
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 23:19:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 831defed-4263-11f0-a300-13f23c93f187;
 Fri, 06 Jun 2025 01:19:22 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 000485C4B0F;
 Thu,  5 Jun 2025 23:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24098C4CEE7;
 Thu,  5 Jun 2025 23:19:18 +0000 (UTC)
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
X-Inumbo-ID: 831defed-4263-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749165560;
	bh=alA63gTBbzXXVmHAEUYuMUxgGLSdAJkDIn+1a+EE9qM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HlLeOwUYmLeH7cCM8jSgyJqrvKLGLvZ3FODc5ZbrcJ3FmyOfW/VjYXvNFIc8UPkb8
	 LrEphA3zFNAokPi/y8LauaSP6HHpmbEFJ0xEg6eNxQLOb2CsIsEA5ddM8iio++w7TW
	 bY5Raten4uF/VOXCmrZjcJcwEsKH4RgSjz2ZjMka1XYWhvgSg8aYukillTJAKHvWh4
	 Isoot9RlbFHp/03UieCulTEzASLmfhtQoboxECRVIUSlRxQJsaNH7/jfhrmqO5i4Y8
	 JqeWYVv1G40puZkxr5QuHDPO8FEYTv9uXszcCPXe5qoybfuMIgmEEO0YulYzD/4KWk
	 BHher1zAtSgXA==
Date: Thu, 5 Jun 2025 16:19:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 12/19] xen/dt: Move bootfdt functions to xen/bootfdt.h
In-Reply-To: <DAESPUKPILGY.3MLDXU7XG65X1@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506051617470.2495561@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-13-agarciav@amd.com> <a66c11c4-cfac-4934-b1f5-e07c728db8de@apertussolutions.com> <DAESPUKPILGY.3MLDXU7XG65X1@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 5 Jun 2025, Alejandro Vallejo wrote:
> On Mon Jun 2, 2025 at 10:25 PM CEST, Daniel P. Smith wrote:
> >> +/* Helper to read a big number; size is in cells (not bytes) */
> >> +static inline u64 dt_read_number(const __be32 *cell, int size)
> >> +{
> >> +    u64 r = 0;
> >> +
> >> +    while ( size-- )
> >> +        r = (r << 32) | be32_to_cpu(*(cell++));
> >> +    return r;
> >> +}
> >
> > I know you are trying to keep code changes to a minimal but let's not 
> > allow poorly constructed logic like this to continue to persist. This is 
> > an unbounded, arbitrary read function that is feed parameters via 
> > externally input. The DT spec declares only two number types for a 
> > property, u32 and u64, see Table 2.3 in Section 2.2.4. There is no 
> > reason to have an unbounded, arbitrary read function lying around 
> > waiting to be leveraged in exploitation.
> 
> Seeing how it's a big lump of code motion, I really don't want to play games
> or I will myself lose track of what I changed and what I didn't.
> 
> While I agree it should probably be a switch statement (or factored away
> altogether), this isn't the place for it.

The improvement suggested by Daniel should be in a separate patch from
the code movement to make it easier to review, but it can still be part
of the patch series.

