Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1138D5A5768
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 01:07:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394715.634220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSnpM-0001Lt-B2; Mon, 29 Aug 2022 23:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394715.634220; Mon, 29 Aug 2022 23:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSnpM-0001Jo-6q; Mon, 29 Aug 2022 23:05:56 +0000
Received: by outflank-mailman (input) for mailman id 394715;
 Mon, 29 Aug 2022 23:05:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8JDB=ZB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oSnpK-0001Ji-DH
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 23:05:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 207c1ad8-27ef-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 01:05:52 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F160B61323;
 Mon, 29 Aug 2022 23:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D59DC433C1;
 Mon, 29 Aug 2022 23:05:49 +0000 (UTC)
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
X-Inumbo-ID: 207c1ad8-27ef-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661814350;
	bh=zKxtNTfDdSBYCEppLVwL87h0fqJg8BfpUE/nzMRBmX0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FN60WYU2JChh1zG9SKb1XbaSkZo3V7neoj1TPLGHhn9A0rCj9ImcuokB3E+a99qHP
	 nkFIolMM7Ncu7NLioyq1uKj5ZJPMGNjYAA1ZSzsSvUSSrc+AtffqHzfMhDvh3ppHkU
	 BlrVUF8NghR3VUm4CMwn1HyrHQgsVr/cSlyNTlwPtBOsOzcwZ/F1BZRGzivNWCk2dQ
	 4JJeIIfnZPrsp9yGc9mh+WjjjBV6e69tSvo3ookYRyLQdqDsY0GpWK6ICcAsn4Up7c
	 MUzST41tIjbQnBn8MmiO8SVKimJwcZtwweQ7ub1uDOu8s+/xil9+uZzsDsb7affYbm
	 EVLBBDxGTmepA==
Date: Mon, 29 Aug 2022 16:05:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksandr <olekstysh@gmail.com>
cc: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org, 
    bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/arm: pci: modify pci_find_host_bridge_node
 argument to const pdev
In-Reply-To: <8e09ddde-1170-b489-f17d-83df7543dbad@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208291605420.1134492@ubuntu-linux-20-04-desktop>
References: <cover.1660746990.git.rahul.singh@arm.com> <5f0f92fe734d3c8478c98a90b7eb85e032d7b9ce.1660746990.git.rahul.singh@arm.com> <8e09ddde-1170-b489-f17d-83df7543dbad@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Aug 2022, Oleksandr wrote:
> On 17.08.22 17:45, Rahul Singh wrote:
> Hello Rahul
> 
> > Modify pci_find_host_bridge_node argument to const pdev to avoid
> > converting the dev to pdev in pci_find_host_bridge_node and also
> > constify the return.
> > 
> > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> 
> 
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

 
> > ---
> > Changes in v2:
> >   - this patch is introduced in this version
> > ---
> >   xen/arch/arm/include/asm/pci.h     | 3 ++-
> >   xen/arch/arm/pci/pci-host-common.c | 4 ++--
> >   2 files changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> > index 7c7449d64f..80a2431804 100644
> > --- a/xen/arch/arm/include/asm/pci.h
> > +++ b/xen/arch/arm/include/asm/pci.h
> > @@ -106,7 +106,8 @@ bool pci_ecam_need_p2m_hwdom_mapping(struct domain *d,
> >                                        struct pci_host_bridge *bridge,
> >                                        uint64_t addr);
> >   struct pci_host_bridge *pci_find_host_bridge(uint16_t segment, uint8_t
> > bus);
> > -struct dt_device_node *pci_find_host_bridge_node(struct device *dev);
> > +const struct dt_device_node *
> > +pci_find_host_bridge_node(const struct pci_dev *pdev);
> >   int pci_get_host_bridge_segment(const struct dt_device_node *node,
> >                                   uint16_t *segment);
> >   diff --git a/xen/arch/arm/pci/pci-host-common.c
> > b/xen/arch/arm/pci/pci-host-common.c
> > index fd8c0f837a..89ef30028e 100644
> > --- a/xen/arch/arm/pci/pci-host-common.c
> > +++ b/xen/arch/arm/pci/pci-host-common.c
> > @@ -243,10 +243,10 @@ err_exit:
> >   /*
> >    * Get host bridge node given a device attached to it.
> >    */
> > -struct dt_device_node *pci_find_host_bridge_node(struct device *dev)
> > +const struct dt_device_node *
> > +pci_find_host_bridge_node(const struct pci_dev *pdev)
> >   {
> >       struct pci_host_bridge *bridge;
> > -    struct pci_dev *pdev = dev_to_pci(dev);
> >         bridge = pci_find_host_bridge(pdev->seg, pdev->bus);
> >       if ( unlikely(!bridge) )
> 
> -- 
> Regards,
> 
> Oleksandr Tyshchenko
> 

