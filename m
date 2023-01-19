Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE918674756
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 00:43:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481391.746240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIeZ9-0004Qb-8u; Thu, 19 Jan 2023 23:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481391.746240; Thu, 19 Jan 2023 23:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIeZ9-0004O3-6A; Thu, 19 Jan 2023 23:43:31 +0000
Received: by outflank-mailman (input) for mailman id 481391;
 Thu, 19 Jan 2023 23:43:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYO0=5Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIeZ8-0004Nx-4T
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 23:43:30 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12a1f598-9853-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 00:43:28 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CF55FB82789;
 Thu, 19 Jan 2023 23:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D709C433F0;
 Thu, 19 Jan 2023 23:43:25 +0000 (UTC)
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
X-Inumbo-ID: 12a1f598-9853-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674171806;
	bh=9VWpDFe3f8eAs3RtU1u9vTUoSekoLFXFThbQ4KuH3JY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YYzxIqR8O4a1jLodlS7cuARNcIoAtzVy27mmdWHnOXCQ2DW0eRFMu5ioMcGXIB2BF
	 ueiKzkGSeXBgLIdMkFz03vUbADxmS66zmm7G3L52hYrl1pEvosIbv3FonHHCb6C5/6
	 oypXuaZRqH1Hiu70QjJ/RhMTvCrBl3UIs2Tug5jCmlAmnWfrsAiO/O/ldXq/wGCHqw
	 HgLiibUbXmqT9aBIkBLpFIVgPD1yKSik/DMXw/VFu0lKw80aWfhkA1/YP2TPFxxS6X
	 O5LmBktYnpycM/ZBipAT3IUavso0rToq3bU2Ak/+aeLiVoTp2xndM267Wce19c1/7x
	 38yrvymudSwkQ==
Date: Thu, 19 Jan 2023 15:43:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v2 08/11] xen/arm: guest_walk: LPAE specific bits should
 be enclosed within "ifndef CONFIG_ARM_PA_32"
In-Reply-To: <20230117174358.15344-9-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301191541460.731018@ubuntu-linux-20-04-desktop>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com> <20230117174358.15344-9-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
> In the subsequent patch, we introduce "CONFIG_ARM_PA_32" to support
> 32 bit physical addresses. Thus, the code specific to
> "Large Page Address Extension" (ie LPAE) should be enclosed within
> "ifndef CONFIG_ARM_PA_32".
> 
> Refer xen/arch/arm/include/asm/short-desc.h, "short_desc_l1_supersec_t"
> unsigned int extbase1:4;    /* Extended base address, PA[35:32] */
> unsigned int extbase2:4;    /* Extended base address, PA[39:36] */
> 
> Thus, extbase1 and extbase2 are not valid when 32 bit physical addresses
> are supported.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

This patch should be merged with patch 9: we shouldn't start to use a
new kconfig symbol before it is defined.


> ---
> 
> Changes from -
> v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
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

