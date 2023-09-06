Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EFD7932F6
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 02:42:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595959.929662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgcX-00051w-SS; Wed, 06 Sep 2023 00:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595959.929662; Wed, 06 Sep 2023 00:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgcX-0004zP-PQ; Wed, 06 Sep 2023 00:42:13 +0000
Received: by outflank-mailman (input) for mailman id 595959;
 Wed, 06 Sep 2023 00:42:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdgcW-0004zJ-IP
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 00:42:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 368796c4-4c4e-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 02:42:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8387160EB2;
 Wed,  6 Sep 2023 00:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F5AC433C7;
 Wed,  6 Sep 2023 00:42:07 +0000 (UTC)
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
X-Inumbo-ID: 368796c4-4c4e-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693960928;
	bh=4g6yjLjb05lD8yhE8Udv193WIPJtl/okthMcWiSnY+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VXjz+zUQLSrn/1m266OQcebmWnnp3Nqj6RTKHrEvgUeHSoS9IkYPjmPm5w4DFdSU9
	 hbrxpc9hQlStN/RjN4IeT3hiCtItkrCp/sYM8uOiD5QBCEiWWZJlsdR2SKR9uY0ibB
	 7p2/RdBrtpP9cnEkd/fyXLF8ze5DtS91s3HfaRS55hmMesak3wmKQuiQq+wrWV/3An
	 Td2Otae6MDW7nWL3FHzyfM6Gtb1k9iTAjhT030e42AZfVv60Zjehs/8Qux1i42K/cY
	 O+xm8ewwQl2AGS3HVQOhnITRO7ct6nZnMIJXQpfzo91hFrPneOt1YVAfeYCI68DpjX
	 8IKa+j2F0uQ1w==
Date: Tue, 5 Sep 2023 17:42:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org, 
    julien@xen.org, sstabellini@kernel.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v11 15/20] arm/asm/setup.h: Update struct map_range_data
 to add rangeset.
In-Reply-To: <eb2c932d-c096-55bf-aec3-a8e311f4a6d7@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309051741560.6458@ubuntu-linux-20-04-desktop>
References: <20230901045947.32351-1-vikram.garhwal@amd.com> <20230901045947.32351-16-vikram.garhwal@amd.com> <eb2c932d-c096-55bf-aec3-a8e311f4a6d7@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 4 Sep 2023, Michal Orzel wrote:
> On 01/09/2023 06:59, Vikram Garhwal wrote:
> > Add rangesets for IRQs and IOMEMs. This was done to accommodate dynamic overlay
> > node addition/removal operations. With overlay operations, new IRQs and IOMEMs
> > are added in dt_host and routed. While removing overlay nodes, nodes are removed
> > from dt_host and their IRQs and IOMEMs routing is also removed. Storing IRQs and
> > IOMEMs in the rangeset will avoid re-parsing the device tree nodes to get the
> > IOMEM and IRQ ranges for overlay remove ops.
> > 
> > Dynamic overlay node add/remove will be introduced in follow-up patches.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > 
> > ---
> > Changes from v10:
> >     Replace paddr_to_pfn(PAGE_ALIGN()) with paddr_to_pfn_aligned().
> >     Change data type of irq.
> >     fix function change for handle_device().
> >     Remove unnecessary change .d = d in mr_data.
> > ---
> > ---
> >  xen/arch/arm/device.c            | 43 +++++++++++++++++++++++++-------
> >  xen/arch/arm/domain_build.c      |  4 +--
> >  xen/arch/arm/include/asm/setup.h |  9 ++++---
> >  3 files changed, 42 insertions(+), 14 deletions(-)
> > 
> > diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> > index 327e4d24fb..1f631d3274 100644
> > --- a/xen/arch/arm/device.c
> > +++ b/xen/arch/arm/device.c
> > @@ -165,6 +165,15 @@ int map_range_to_domain(const struct dt_device_node *dev,
> >      dt_dprintk("  - MMIO: %010"PRIx64" - %010"PRIx64" P2MType=%x\n",
> >                 addr, addr + len, mr_data->p2mt);
> >  
> > +    if ( mr_data->iomem_ranges )
> > +    {
> > +        res = rangeset_add_range(mr_data->iomem_ranges,
> > +                                 paddr_to_pfn(addr),
> > +                                 paddr_to_pfn_aligned(addr + len - 1));
> > +        if ( res )
> > +            return res;
> > +    }
> > +
> >      return 0;
> >  }
> >  
> > @@ -178,10 +187,11 @@ int map_range_to_domain(const struct dt_device_node *dev,
> >   */
> >  int map_device_irqs_to_domain(struct domain *d,
> >                                struct dt_device_node *dev,
> > -                              bool need_mapping)
> > +                              bool need_mapping,
> > +                              struct rangeset *irq_ranges)
> >  {
> >      unsigned int i, nirq;
> > -    int res;
> > +    int res, irq;
> You could make use of res to store irq just as it was done before without introducing new local var.
> Anyway, if you think it improves readability:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

