Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27A4AFBCCB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 22:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035771.1408121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYslI-00072u-Tk; Mon, 07 Jul 2025 20:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035771.1408121; Mon, 07 Jul 2025 20:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYslI-000714-R5; Mon, 07 Jul 2025 20:48:28 +0000
Received: by outflank-mailman (input) for mailman id 1035771;
 Mon, 07 Jul 2025 20:48:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uYslH-00070y-I6
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 20:48:27 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9820328-5b73-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 22:48:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 558A045E6D;
 Mon,  7 Jul 2025 20:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736DEC4CEE3;
 Mon,  7 Jul 2025 20:48:22 +0000 (UTC)
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
X-Inumbo-ID: b9820328-5b73-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751921303;
	bh=P+D1nsZHVyELAqJRxc5jFGGqRpuqES7tsUBohvZycNk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ourZ/603YO498fOQXoVHjhiH7sgY+Ykm2ksi/FwSDrY83ONpTSq2nXCcqk7ooLAsJ
	 cg5RDsAb/5uohU4RoV+tPrQyAWQVbcPKuc9AH4zxW8wXumjV08MeZwchdD3PhjTw84
	 L61TPXkACZ1F1664VrSv8KoayMKj31yu7KUVaSsKNvT6A+0U3fmCuYlC68NuFBit1C
	 nc/nCO8IZrE5jv8JvboBWsX0a+x6SaitZdou/kDdXramEpbWEeyC2dqgK7VDIO6jHt
	 ipouagRnhA7/1M+JIp3gcIjZD+CmvEe08TeiuPACo/Pp0tnczmTvNfc24uTJd1mGJb
	 37/1iVIDUK/hA==
Date: Mon, 7 Jul 2025 13:48:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm64: Panic if direct map is too small
In-Reply-To: <20250704075428.33485-2-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507071348120.605088@ubuntu-linux-20-04-desktop>
References: <20250704075428.33485-1-michal.orzel@amd.com> <20250704075428.33485-2-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 4 Jul 2025, Michal Orzel wrote:
> Harden the code by panicing if direct map is too small for current memory
> layout taking into account possible PDX compression. Otherwise the assert
> is observed:
> Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72
> 
> At the moment, we don't set max_pdx denoting maximum usable PDX which
> should be based on max_page. Consolidate setting of max_page and max_pdx
> in init_pdx() for both arm32 and arm64. max_pdx will be used in the
> future to set up frametable mappings respecting the PDX grouping.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


