Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351DB53F2AE
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 01:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342725.567794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyMNx-0007Rr-Hb; Mon, 06 Jun 2022 23:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342725.567794; Mon, 06 Jun 2022 23:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyMNx-0007PS-EB; Mon, 06 Jun 2022 23:43:49 +0000
Received: by outflank-mailman (input) for mailman id 342725;
 Mon, 06 Jun 2022 23:43:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HB7Z=WN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nyMNw-0007PM-E3
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 23:43:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 816ba312-e5f2-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 01:43:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 24B3AB81A99;
 Mon,  6 Jun 2022 23:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617FAC385A9;
 Mon,  6 Jun 2022 23:43:43 +0000 (UTC)
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
X-Inumbo-ID: 816ba312-e5f2-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654559023;
	bh=2RsyEJs423JMN7A4DtLut/N786UxEQNyTITZ2k18fmk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Trpi4HAVxEqaKQq4B+EdeXeU+KZkabNoC/7XURg0Z/+qu5AtKD4f3zRolw/7wIX10
	 N/B8UeHfiiUzZb1bQyFzl8sN0JzdXg2D/3XzGIz16C8yz0m59b0HIIWV3yldkT9JTJ
	 fWwq71Nn5rMyKGiew4pGv+/7TaLA6SHgmURb54Nk1rXBo1muZ1bblrVmNDkR6QdQ9y
	 v7QOHLt0tyfeJGKz+ezS1Ftkn4FFoN0VMw/C7HV/qliXWQ8APfO06dEZeQgEE+C1wB
	 XwG3Y1K87Db1701zGVxDWwaEY1DP3Y0MpD9NlcYc+DrBt8Dw+7SkemjECmnbxVRIXB
	 goYLcu/X0N9eg==
Date: Mon, 6 Jun 2022 16:43:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr <olekstysh@gmail.com>
cc: Masahiro Yamada <masahiroy@kernel.org>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    moderated for non-subscribers <xen-devel@lists.xenproject.org>, 
    Stephen Rothwell <sfr@canb.auug.org.au>, 
    Julien Grall <julien.grall@arm.com>, 
    Shannon Zhao <shannon.zhao@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen: unexport __init-annotated
 xen_xlate_map_ballooned_pages()
In-Reply-To: <20c9cd23-429f-896c-b59b-c518ff2562e2@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2206061643250.277622@ubuntu-linux-20-04-desktop>
References: <20220606045920.4161881-1-masahiroy@kernel.org> <20c9cd23-429f-896c-b59b-c518ff2562e2@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Jun 2022, Oleksandr wrote:
> On 06.06.22 07:59, Masahiro Yamada wrote:
> 
> Hello
> 
> > EXPORT_SYMBOL and __init is a bad combination because the .init.text
> > section is freed up after the initialization. Hence, modules cannot
> > use symbols annotated __init. The access to a freed symbol may end up
> > with kernel panic.
> > 
> > modpost used to detect it, but it has been broken for a decade.
> > 
> > Recently, I fixed modpost so it started to warn it again, then this
> > showed up in linux-next builds.
> > 
> > There are two ways to fix it:
> > 
> >    - Remove __init
> >    - Remove EXPORT_SYMBOL
> > 
> > I chose the latter for this case because none of the in-tree call-sites
> > (arch/arm/xen/enlighten.c, arch/x86/xen/grant-table.c) is compiled as
> > modular.
> 
> Good description.
> 
> 
> > 
> > Fixes: 243848fc018c ("xen/grant-table: Move xlated_setup_gnttab_pages to
> > common place")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> I think the patch is correct.
> 
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > 
> >   drivers/xen/xlate_mmu.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/xen/xlate_mmu.c b/drivers/xen/xlate_mmu.c
> > index 34742c6e189e..f17c4c03db30 100644
> > --- a/drivers/xen/xlate_mmu.c
> > +++ b/drivers/xen/xlate_mmu.c
> > @@ -261,7 +261,6 @@ int __init xen_xlate_map_ballooned_pages(xen_pfn_t
> > **gfns, void **virt,
> >     	return 0;
> >   }
> > -EXPORT_SYMBOL_GPL(xen_xlate_map_ballooned_pages);
> >     struct remap_pfn {
> >   	struct mm_struct *mm;
> 
> -- 
> Regards,
> 
> Oleksandr Tyshchenko
> 

