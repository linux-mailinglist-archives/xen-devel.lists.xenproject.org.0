Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2959E1E54E7
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 06:09:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je9ph-0000Yj-1u; Thu, 28 May 2020 04:07:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3kFH=7K=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1je9pe-0000Ye-PE
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 04:07:50 +0000
X-Inumbo-ID: c89083b2-a098-11ea-a796-12813bfff9fa
Received: from smtprelay.hostedemail.com (unknown [216.40.44.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c89083b2-a098-11ea-a796-12813bfff9fa;
 Thu, 28 May 2020 04:07:45 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 8167D18029597;
 Thu, 28 May 2020 04:07:44 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:2:41:355:379:599:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1535:1593:1594:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3167:3354:3622:3865:3867:3868:3872:4050:4119:4321:4605:5007:7875:8603:10004:10848:11026:11232:11233:11658:11914:12043:12296:12297:12438:12740:12760:12895:13439:14659:21080:21451:21627:21990:30034:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: hill77_1b1293126d57
X-Filterd-Recvd-Size: 8369
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Thu, 28 May 2020 04:07:43 +0000 (UTC)
Message-ID: <d46604df8e64fd91c6fea5073c6cb5eb20184baf.camel@perches.com>
Subject: Re: [PATCH 1/2] xen-pciback: Use dev_printk() when possible
From: Joe Perches <joe@perches.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Juergen Gross <jgross@suse.com>
Date: Wed, 27 May 2020 21:07:41 -0700
In-Reply-To: <612fee00-4e7c-9b90-511d-4efb7676cbed@oracle.com>
References: <20200527174326.254329-1-helgaas@kernel.org>
 <20200527174326.254329-2-helgaas@kernel.org>
 <612fee00-4e7c-9b90-511d-4efb7676cbed@oracle.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 2020-05-27 at 15:34 -0700, Boris Ostrovsky wrote:
> On 5/27/20 1:43 PM, Bjorn Helgaas wrote:
> > @@ -155,8 +157,8 @@ int xen_pcibk_config_read(struct pci_dev *dev, int offset, int size,
> >  	u32 value = 0, tmp_val;
> >  
> >  	if (unlikely(verbose_request))
> > -		printk(KERN_DEBUG DRV_NAME ": %s: read %d bytes at 0x%x\n",
> > -		       pci_name(dev), size, offset);
> > +		dev_printk(KERN_DEBUG, &dev->dev, "read %d bytes at 0x%x\n",
> > +			   size, offset);
> 
> Maybe then dev_dbg() ?

It likely would be better to remove verbose_request altogether
and just use dynamic debugging and dev_dbg for all the output.

$ git grep -w -A3 verbose_request
drivers/pci/xen-pcifront.c:static int verbose_request;
drivers/pci/xen-pcifront.c:module_param(verbose_request, int, 0644);
drivers/pci/xen-pcifront.c-
drivers/pci/xen-pcifront.c-static int errno_to_pcibios_err(int errno)
drivers/pci/xen-pcifront.c-{
--
drivers/pci/xen-pcifront.c:	if (verbose_request)
drivers/pci/xen-pcifront.c-		dev_info(&pdev->xdev->dev,
drivers/pci/xen-pcifront.c-			 "read dev=%04x:%02x:%02x.%d - offset %x size %d\n",
drivers/pci/xen-pcifront.c-			 pci_domain_nr(bus), bus->number, PCI_SLOT(devfn),
--
drivers/pci/xen-pcifront.c:		if (verbose_request)
drivers/pci/xen-pcifront.c-			dev_info(&pdev->xdev->dev, "read got back value %x\n",
drivers/pci/xen-pcifront.c-				 op.value);
drivers/pci/xen-pcifront.c-
--
drivers/pci/xen-pcifront.c:	if (verbose_request)
drivers/pci/xen-pcifront.c-		dev_info(&pdev->xdev->dev,
drivers/pci/xen-pcifront.c-			 "write dev=%04x:%02x:%02x.%d - "
drivers/pci/xen-pcifront.c-			 "offset %x size %d val %x\n",
--
drivers/xen/xen-pciback/conf_space.c:	if (unlikely(verbose_request))
drivers/xen/xen-pciback/conf_space.c-		printk(KERN_DEBUG DRV_NAME ": %s: read %d bytes at 0x%x\n",
drivers/xen/xen-pciback/conf_space.c-		       pci_name(dev), size, offset);
drivers/xen/xen-pciback/conf_space.c-
--
drivers/xen/xen-pciback/conf_space.c:	if (unlikely(verbose_request))
drivers/xen/xen-pciback/conf_space.c-		printk(KERN_DEBUG DRV_NAME ": %s: read %d bytes at 0x%x = %x\n",
drivers/xen/xen-pciback/conf_space.c-		       pci_name(dev), size, offset, value);
drivers/xen/xen-pciback/conf_space.c-
--
drivers/xen/xen-pciback/conf_space.c:	if (unlikely(verbose_request))
drivers/xen/xen-pciback/conf_space.c-		printk(KERN_DEBUG
drivers/xen/xen-pciback/conf_space.c-		       DRV_NAME ": %s: write request %d bytes at 0x%x = %x\n",
drivers/xen/xen-pciback/conf_space.c-		       pci_name(dev), size, offset, value);
--
drivers/xen/xen-pciback/conf_space_header.c:		if (unlikely(verbose_request))
drivers/xen/xen-pciback/conf_space_header.c-			printk(KERN_DEBUG DRV_NAME ": %s: enable\n",
drivers/xen/xen-pciback/conf_space_header.c-			       pci_name(dev));
drivers/xen/xen-pciback/conf_space_header.c-		err = pci_enable_device(dev);
--
drivers/xen/xen-pciback/conf_space_header.c:		if (unlikely(verbose_request))
drivers/xen/xen-pciback/conf_space_header.c-			printk(KERN_DEBUG DRV_NAME ": %s: disable\n",
drivers/xen/xen-pciback/conf_space_header.c-			       pci_name(dev));
drivers/xen/xen-pciback/conf_space_header.c-		pci_disable_device(dev);
--
drivers/xen/xen-pciback/conf_space_header.c:		if (unlikely(verbose_request))
drivers/xen/xen-pciback/conf_space_header.c-			printk(KERN_DEBUG DRV_NAME ": %s: set bus master\n",
drivers/xen/xen-pciback/conf_space_header.c-			       pci_name(dev));
drivers/xen/xen-pciback/conf_space_header.c-		pci_set_master(dev);
--
drivers/xen/xen-pciback/conf_space_header.c:		if (unlikely(verbose_request))
drivers/xen/xen-pciback/conf_space_header.c-			printk(KERN_DEBUG DRV_NAME ": %s: clear bus master\n",
drivers/xen/xen-pciback/conf_space_header.c-			       pci_name(dev));
drivers/xen/xen-pciback/conf_space_header.c-		pci_clear_master(dev);
--
drivers/xen/xen-pciback/conf_space_header.c:		if (unlikely(verbose_request))
drivers/xen/xen-pciback/conf_space_header.c-			printk(KERN_DEBUG
drivers/xen/xen-pciback/conf_space_header.c-			       DRV_NAME ": %s: enable memory-write-invalidate\n",
drivers/xen/xen-pciback/conf_space_header.c-			       pci_name(dev));
--
drivers/xen/xen-pciback/conf_space_header.c:		if (unlikely(verbose_request))
drivers/xen/xen-pciback/conf_space_header.c-			printk(KERN_DEBUG
drivers/xen/xen-pciback/conf_space_header.c-			       DRV_NAME ": %s: disable memory-write-invalidate\n",
drivers/xen/xen-pciback/conf_space_header.c-			       pci_name(dev));
--
drivers/xen/xen-pciback/pciback.h:extern int verbose_request;
drivers/xen/xen-pciback/pciback.h-
drivers/xen/xen-pciback/pciback.h-void xen_pcibk_test_and_schedule_op(struct xen_pcibk_device *pdev);
drivers/xen/xen-pciback/pciback.h-#endif
--
drivers/xen/xen-pciback/pciback_ops.c:int verbose_request;
drivers/xen/xen-pciback/pciback_ops.c:module_param(verbose_request, int, 0644);
drivers/xen/xen-pciback/pciback_ops.c-
drivers/xen/xen-pciback/pciback_ops.c-static irqreturn_t xen_pcibk_guest_interrupt(int irq, void *dev_id);
drivers/xen/xen-pciback/pciback_ops.c-
--
drivers/xen/xen-pciback/pciback_ops.c:	if (unlikely(verbose_request))
drivers/xen/xen-pciback/pciback_ops.c-		printk(KERN_DEBUG DRV_NAME ": %s: enable MSI\n", pci_name(dev));
drivers/xen/xen-pciback/pciback_ops.c-
drivers/xen/xen-pciback/pciback_ops.c-	if (dev->msi_enabled)
--
drivers/xen/xen-pciback/pciback_ops.c:	if (unlikely(verbose_request))
drivers/xen/xen-pciback/pciback_ops.c-		printk(KERN_DEBUG DRV_NAME ": %s: MSI: %d\n", pci_name(dev),
drivers/xen/xen-pciback/pciback_ops.c-			op->value);
drivers/xen/xen-pciback/pciback_ops.c-
--
drivers/xen/xen-pciback/pciback_ops.c:	if (unlikely(verbose_request))
drivers/xen/xen-pciback/pciback_ops.c-		printk(KERN_DEBUG DRV_NAME ": %s: disable MSI\n",
drivers/xen/xen-pciback/pciback_ops.c-		       pci_name(dev));
drivers/xen/xen-pciback/pciback_ops.c-
--
drivers/xen/xen-pciback/pciback_ops.c:	if (unlikely(verbose_request))
drivers/xen/xen-pciback/pciback_ops.c-		printk(KERN_DEBUG DRV_NAME ": %s: MSI: %d\n", pci_name(dev),
drivers/xen/xen-pciback/pciback_ops.c-			op->value);
drivers/xen/xen-pciback/pciback_ops.c-	return 0;
--
drivers/xen/xen-pciback/pciback_ops.c:	if (unlikely(verbose_request))
drivers/xen/xen-pciback/pciback_ops.c-		printk(KERN_DEBUG DRV_NAME ": %s: enable MSI-X\n",
drivers/xen/xen-pciback/pciback_ops.c-		       pci_name(dev));
drivers/xen/xen-pciback/pciback_ops.c-
--
drivers/xen/xen-pciback/pciback_ops.c:				if (unlikely(verbose_request))
drivers/xen/xen-pciback/pciback_ops.c-					printk(KERN_DEBUG DRV_NAME ": %s: " \
drivers/xen/xen-pciback/pciback_ops.c-						"MSI-X[%d]: %d\n",
drivers/xen/xen-pciback/pciback_ops.c-						pci_name(dev), i,
--
drivers/xen/xen-pciback/pciback_ops.c:	if (unlikely(verbose_request))
drivers/xen/xen-pciback/pciback_ops.c-		printk(KERN_DEBUG DRV_NAME ": %s: disable MSI-X\n",
drivers/xen/xen-pciback/pciback_ops.c-			pci_name(dev));
drivers/xen/xen-pciback/pciback_ops.c-
--
drivers/xen/xen-pciback/pciback_ops.c:	if (unlikely(verbose_request))
drivers/xen/xen-pciback/pciback_ops.c-		printk(KERN_DEBUG DRV_NAME ": %s: MSI-X: %d\n",
drivers/xen/xen-pciback/pciback_ops.c-		       pci_name(dev), op->value);
drivers/xen/xen-pciback/pciback_ops.c-	return 0;



