Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3909EAD08DE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 22:00:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008804.1387965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNdEF-0005ld-IS; Fri, 06 Jun 2025 19:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008804.1387965; Fri, 06 Jun 2025 19:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNdEF-0005ip-FS; Fri, 06 Jun 2025 19:59:51 +0000
Received: by outflank-mailman (input) for mailman id 1008804;
 Fri, 06 Jun 2025 19:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNdEE-0005gT-5h
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 19:59:50 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ccd23e1a-4310-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 21:59:49 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 89DC849F5B;
 Fri,  6 Jun 2025 19:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B55FC4CEEB;
 Fri,  6 Jun 2025 19:59:46 +0000 (UTC)
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
X-Inumbo-ID: ccd23e1a-4310-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749239987;
	bh=/A3ZcJBNH2YZ/Vl+1PMhBqGcJeXmBWYHrJbmCgyR3G8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NcTbdQV2c6d5rpagNxX9KMuGytDBABiruDVXXpU+GfnEnf2gV+8IkC5xmV0HxQi0J
	 OqqZR3y8w/YzAix3RMdEZ81eU321IlJKjFE60jf5vrQG22pId8JVB0JAJ8t32NSt8u
	 MX9h/1MhN6xXk3XtDqshnPqhQLc8VUv6OfdCR/hiU5K0j0rQXzMvjVzsDB4pQ1jHKk
	 e43xnFqGzXnMbFCpsxiFbF9za5Czy7uq7k/r9pmhtGlSEawxABRwCq1PWPhfh7pTdd
	 1cALO2TdqPNOLao1buZoupDemBYm2+tdQWhdEgQ9f8nKyFT0uTn35czeVFlYiwHAMA
	 Q5SK4elmeZ6Uw==
Date: Fri, 6 Jun 2025 12:59:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 08/15] xen/dt: Move bootfdt functions to
 xen/bootfdt.h
In-Reply-To: <DAFD99VSFIEP.1VCU7C02XMFPO@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506061203360.2495561@ubuntu-linux-20-04-desktop>
References: <20250605194810.2782031-1-agarciav@amd.com> <20250605194810.2782031-9-agarciav@amd.com> <633ffa7f-cf26-4ec3-a153-28404c39d882@amd.com> <DAFD99VSFIEP.1VCU7C02XMFPO@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Jun 2025, Alejandro Vallejo wrote:
> On Fri Jun 6, 2025 at 10:59 AM CEST, Michal Orzel wrote:
> >
> >
> > On 05/06/2025 21:48, Alejandro Vallejo wrote:
> >> Part of an unpicking process to extract bootfdt contents independent of bootinfo
> >> to a separate file for x86 to take.
> >> 
> >> Move functions required for early FDT parsing from device_tree.h and arm's
> >> setup.h onto bootfdt.h
> >> 
> >> Declaration motion only. Not a functional change.
> >> 
> >> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> >> ---
> >> v2:
> >>   * Remove the u32 identifiers in the device_tree_get_u32() implementation
> > I don't understand the reasoning behind changing u32->uint32_t only for one
> > function in this patch while leaving others unmodified. Also what about u64?
> > Either don't change any or change all.
> 
> Sure. Let's call the original u32->uint32_t change a misplaced mutation and
> move on. The point is the motion, not these cleanups on top.

Yes I agree. I know from past experience that Jan doesn't mind changes
during code movements, but for me it is important that changes and code
movement are separate. That is because I have almost automatic ways to
check that code movement is correct if there are no changes. It saves me
a lot of time during review. Then I can look at the individual changes
separately.

