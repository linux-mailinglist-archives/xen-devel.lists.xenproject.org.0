Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5C7AD2478
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 18:55:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010377.1388477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOfmX-00082W-5J; Mon, 09 Jun 2025 16:55:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010377.1388477; Mon, 09 Jun 2025 16:55:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOfmX-00081S-1u; Mon, 09 Jun 2025 16:55:33 +0000
Received: by outflank-mailman (input) for mailman id 1010377;
 Mon, 09 Jun 2025 16:55:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SsVL=YY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uOfmW-00081M-55
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 16:55:32 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85872c0c-4552-11f0-b894-0df219b8e170;
 Mon, 09 Jun 2025 18:55:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5E6B8A50654;
 Mon,  9 Jun 2025 16:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA4EC4CEEB;
 Mon,  9 Jun 2025 16:55:15 +0000 (UTC)
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
X-Inumbo-ID: 85872c0c-4552-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749488117;
	bh=5n2knWaj7T5mQNjtDLMXh7xAptfM3zcBKO+L5sCu4Dk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BEZyHBbuwTjJ2q/6bqECB/uZDiX8jvL4prEuSpmawSf8zWpk47zNyZlmXHFVmOevd
	 8/KdhmilLQKAKOL9wgVdKSsXU+bQLF/IaLN6IwaXFVbPI/xKx1IJg3QsJ60/KKRQk4
	 JxIl/rlZpaYxRLgw6ZmmoIcVRfUVAQFfOEUbUiVKQzSVHtpWCqJ9X2Dm4fNcmBIDOW
	 HfTh/17IFpeNvbqUaivTqpSqwlbf2e7hJjPkvteqGaOz2AkVwa2s+T53sXfyK/6MrV
	 739R29dNWWMuTkBBdOXfn2oOEb5wwPV1g9v84rJ/zHtRGGylJDn1eSChkrM+on5+yF
	 vm49NMP8QiFqA==
Date: Mon, 9 Jun 2025 09:55:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 08/15] xen/dt: Move bootfdt functions to
 xen/bootfdt.h
In-Reply-To: <DAHVNGP3WZWX.1IZ7RJEVRFDI9@amd.com>
Message-ID: <alpine.DEB.2.22.394.2506090953180.2495561@ubuntu-linux-20-04-desktop>
References: <20250605194810.2782031-1-agarciav@amd.com> <20250605194810.2782031-9-agarciav@amd.com> <633ffa7f-cf26-4ec3-a153-28404c39d882@amd.com> <DAFD99VSFIEP.1VCU7C02XMFPO@amd.com> <alpine.DEB.2.22.394.2506061203360.2495561@ubuntu-linux-20-04-desktop>
 <DAHVNGP3WZWX.1IZ7RJEVRFDI9@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Jun 2025, Alejandro Vallejo wrote:
> On Fri Jun 6, 2025 at 9:59 PM CEST, Stefano Stabellini wrote:
> > On Fri, 6 Jun 2025, Alejandro Vallejo wrote:
> >> On Fri Jun 6, 2025 at 10:59 AM CEST, Michal Orzel wrote:
> >> >
> >> >
> >> > On 05/06/2025 21:48, Alejandro Vallejo wrote:
> >> >> Part of an unpicking process to extract bootfdt contents independent of bootinfo
> >> >> to a separate file for x86 to take.
> >> >> 
> >> >> Move functions required for early FDT parsing from device_tree.h and arm's
> >> >> setup.h onto bootfdt.h
> >> >> 
> >> >> Declaration motion only. Not a functional change.
> >> >> 
> >> >> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> >> >> ---
> >> >> v2:
> >> >>   * Remove the u32 identifiers in the device_tree_get_u32() implementation
> >> > I don't understand the reasoning behind changing u32->uint32_t only for one
> >> > function in this patch while leaving others unmodified. Also what about u64?
> >> > Either don't change any or change all.
> >> 
> >> Sure. Let's call the original u32->uint32_t change a misplaced mutation and
> >> move on. The point is the motion, not these cleanups on top.
> >
> > Yes I agree. I know from past experience that Jan doesn't mind changes
> > during code movements, but for me it is important that changes and code
> > movement are separate. That is because I have almost automatic ways to
> > check that code movement is correct if there are no changes. It saves me
> > a lot of time during review. Then I can look at the individual changes
> > separately.
> 
> That's interesting. Could you please share the runes? That's one side of
> review I still struggle with.

I use vim to generate two source files, one with the code corresponding
to the - lines (with the - prefix) and one with the code corresponding
to the + lines (without the + prefix). Then I diff the two files. This
method is a bit crude but very effective and managed to spot issues this
way more than once.

