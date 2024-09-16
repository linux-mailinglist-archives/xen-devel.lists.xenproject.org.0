Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BE097A829
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 22:11:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799678.1209642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqI46-0003v5-5q; Mon, 16 Sep 2024 20:11:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799678.1209642; Mon, 16 Sep 2024 20:11:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqI46-0003sW-2t; Mon, 16 Sep 2024 20:11:18 +0000
Received: by outflank-mailman (input) for mailman id 799678;
 Mon, 16 Sep 2024 20:11:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3gN=QO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sqI44-0003sA-Fl
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 20:11:16 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2c6a651-7467-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 22:11:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8F6C2A43205;
 Mon, 16 Sep 2024 20:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F1FC4CECD;
 Mon, 16 Sep 2024 20:11:12 +0000 (UTC)
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
X-Inumbo-ID: d2c6a651-7467-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726517473;
	bh=7xxeWsqRcrCxoadi3+koKT0WOIpuhPaRbtLyPtA77bs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kExIBay3WywWDJXf4lrsk3I3J3fyBZjWFSUp2wll/2aYTJz2zyTblmY9kcagsPK5e
	 huZ6uT6Fnb+M0JEgCRX9c5YSuwG8c2/z5trX+eLloC+tDDjD61sRL5Uw60BMUQO3wq
	 G4fXlimhNjt5kXFJIJyENxLmOurRW7l48bvfA7NGoR7bCtnUMNFmP9j4llgblBWQXP
	 Hu0BfdXIPMbrX0Fw1UKp1gTXzgeZw2XAjtUGqLxQ98NjDqT7V7Qf/3x48DbFW91E2y
	 qqLcjQ+Q5FYvyr5WaGughNb1Sm23LpJmrkmSCSUnsu0d3wj6iukrPYlPS3vZsP+QdC
	 jj6I7czhS1+KA==
Date: Mon, 16 Sep 2024 13:11:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
    iommu@lists.linux.dev
Subject: Re: [PATCH v2 2/2] xen/swiotlb: fix allocated size
In-Reply-To: <d0075562-6a21-4a87-b7f5-854f09c0743a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2409161311010.1417852@ubuntu-linux-20-04-desktop>
References: <20240916064748.18071-1-jgross@suse.com> <20240916064748.18071-3-jgross@suse.com> <d0075562-6a21-4a87-b7f5-854f09c0743a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Sep 2024, Jan Beulich wrote:
> On 16.09.2024 08:47, Juergen Gross wrote:
> > The allocated size in xen_swiotlb_alloc_coherent() and
> > xen_swiotlb_free_coherent() is calculated wrong for the case of
> > XEN_PAGE_SIZE not matching PAGE_SIZE. Fix that.
> > 
> > Fixes: 7250f422da04 ("xen-swiotlb: use actually allocated size on check physical continuous")
> > Reported-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

