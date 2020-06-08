Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923731F1E5E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 19:31:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiLbq-0007p3-4e; Mon, 08 Jun 2020 17:30:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yn46=7V=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jiLbo-0007oy-L9
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 17:30:52 +0000
X-Inumbo-ID: ccbe40e6-a9ad-11ea-b2a0-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ccbe40e6-a9ad-11ea-b2a0-12813bfff9fa;
 Mon, 08 Jun 2020 17:30:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 417F2206A4;
 Mon,  8 Jun 2020 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591637451;
 bh=vlCR5/ExWqtewebKOTcJOXQkQ+zVe/VeVp0XsbZNGWE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=WlB9cv5dfhHaUhAt8Kom2paoC803v6q7j/baG6PpnTJYundKfVWZyLVQN+pVceImt
 pJjOqp9t2aVAjUtuGaZt23LWg3xCf9gmIaJNpQ4vIFuowqy8uKiSQ8jN3MxXW4zlKA
 hFrgDGFEf1twm2j9xn8BK/GXGQbveJ/8DGTKJCCo=
Date: Mon, 8 Jun 2020 10:30:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH for-4.14] xen/arm: mm: Access a PT entry before the table
 is unmapped
In-Reply-To: <20200607155154.15928-1-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2006081030060.2815@sstabellini-ThinkPad-T480s>
References: <20200607155154.15928-1-julien@xen.org>
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, 7 Jun 2020, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> xen_pt_next_level() will retrieve the MFN from the entry right after the
> page-table has been unmapped.
> 
> After calling xen_unmap_table(), there is no guarantee the mapping will
> still be valid. Depending on the implementation, this may result to a
> data abort in Xen.
> 
> Re-order the code to retrieve the MFN before the table is unmapped.
> 
> Fixes: 53abb9a1dcd9 ("xen/arm: mm: Rework Xen page-tables walk during update")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> I spotted this issue while reworking how page-tables are mapped on Arm64
> during early boot. However the problem should be already there on Arm32.
> 
> I am actually quite amazed we haven't seen any crash on Arm32 because
> there is no direct map. So the mapping will not exist after calling
> xen_unmap_table().
> 
> I suspect this works because unmap_domain_page() doesn't flush the
> TLBs. So the TLB still likely have the entry cached (joy!).

  \0/

Damn!

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> This patch is a candidate for Xen 4.14 and should also be backported.
> ---
>  xen/arch/arm/mm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 1b14f4934570..9e2ff7c8005d 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1036,6 +1036,7 @@ static int xen_pt_next_level(bool read_only, unsigned int level,
>  {
>      lpae_t *entry;
>      int ret;
> +    mfn_t mfn;
>  
>      entry = *table + offset;
>  
> @@ -1053,8 +1054,10 @@ static int xen_pt_next_level(bool read_only, unsigned int level,
>      if ( lpae_is_mapping(*entry, level) )
>          return XEN_TABLE_SUPER_PAGE;
>  
> +    mfn = lpae_get_mfn(*entry);
> +
>      xen_unmap_table(*table);
> -    *table = xen_map_table(lpae_get_mfn(*entry));
> +    *table = xen_map_table(mfn);
>  
>      return XEN_TABLE_NORMAL_PAGE;
>  }
> -- 
> 2.17.1
> 

