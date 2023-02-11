Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2989A692C18
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 01:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493737.763753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQdrD-0003O1-2l; Sat, 11 Feb 2023 00:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493737.763753; Sat, 11 Feb 2023 00:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQdrC-0003Lb-WF; Sat, 11 Feb 2023 00:35:11 +0000
Received: by outflank-mailman (input) for mailman id 493737;
 Sat, 11 Feb 2023 00:35:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mMB=6H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pQdrB-0003LN-Ja
 for xen-devel@lists.xenproject.org; Sat, 11 Feb 2023 00:35:09 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eea33dd6-a9a3-11ed-93b5-47a8fe42b414;
 Sat, 11 Feb 2023 01:35:07 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 36BC3B825B6;
 Sat, 11 Feb 2023 00:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FDC6C433EF;
 Sat, 11 Feb 2023 00:35:03 +0000 (UTC)
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
X-Inumbo-ID: eea33dd6-a9a3-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676075705;
	bh=uau6Q8yjbCes0epO1WxHdWSk8LWiToScWHNk9jAsh7w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=U1E2d7/nHlvdb48npqoxgDRB8IQgXyjdedNjdA6eaRPS3P7alZ9Ijgmmym/eLUCg5
	 ZGsfP0qnLpWDK3j1WcpJoP1BG/oGSEpahjYIDh5UG4vZAcRvU/qR5NfdGXpAdSSNn5
	 gftn8cVdBnyZryuCknOumyK4RVZr+TcY0ku2mJqQH+WTDfjVi6qDerF/Q5x9M+MxbF
	 diU2O9zIZuoIhUMOtwl7whpqLOyod3mu2oyKDqgbaghuGW80sRFPoLN1m5dQKLkZGt
	 dfDeUqdlS95SQD6XsCfCV2rAfzYNym3jlDhJK6zHCF6Dinvm1AyTU4fMsI7oVBvrUS
	 HAVDXRVT6L4BQ==
Date: Fri, 10 Feb 2023 16:35:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, jbeulich@suse.com, wl@xen.org, 
    rahul.singh@arm.com
Subject: Re: [XEN v3 7/9] xen/arm: guest_walk: LPAE specific bits should be
 enclosed within "ifndef CONFIG_ARM_PA_32"
In-Reply-To: <20230208120529.22313-8-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2302101634340.4661@ubuntu-linux-20-04-desktop>
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com> <20230208120529.22313-8-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Feb 2023, Ayan Kumar Halder wrote:
> In the subsequent patch, we introduce "CONFIG_ARM_PA_32" to support
> 32 bit physical addresses. Thus, the code specific to
> "Large Physical Address Extension" (ie LPAE) should be enclosed within
> "ifndef CONFIG_ARM_PA_32".

this statement needs an  update


> Refer xen/arch/arm/include/asm/short-desc.h, "short_desc_l1_supersec_t"
> unsigned int extbase1:4;    /* Extended base address, PA[35:32] */
> unsigned int extbase2:4;    /* Extended base address, PA[39:36] */
> 
> Thus, extbase1 and extbase2 are not valid when 32 bit physical addresses
> are supported.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Aside from the above:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Changes from -
> v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
> 
> v2 - 1. Reordered this patch so that it appears after CONFIG_ARM_PA_32 is
> introduced (in 6/9).
> 
>  xen/arch/arm/guest_walk.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index 43d3215304..0feb7b76ec 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -154,8 +154,10 @@ static bool guest_walk_sd(const struct vcpu *v,
>              mask = (1ULL << L1DESC_SUPERSECTION_SHIFT) - 1;
>              *ipa = gva & mask;
>              *ipa |= (paddr_t)(pte.supersec.base) << L1DESC_SUPERSECTION_SHIFT;
> +#ifndef CONFIG_ARM_PA_32
>              *ipa |= (paddr_t)(pte.supersec.extbase1) << L1DESC_SUPERSECTION_EXT_BASE1_SHIFT;
>              *ipa |= (paddr_t)(pte.supersec.extbase2) << L1DESC_SUPERSECTION_EXT_BASE2_SHIFT;
> +#endif /* CONFIG_ARM_PA_32 */
>          }
>  
>          /* Set permissions so that the caller can check the flags by herself. */
> -- 
> 2.17.1
> 
> 

