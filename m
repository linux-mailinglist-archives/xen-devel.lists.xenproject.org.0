Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13FA1E517A
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 00:51:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je4sg-0006i4-P6; Wed, 27 May 2020 22:50:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NoV=7J=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1je4sf-0006hz-IL
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 22:50:37 +0000
X-Inumbo-ID: 7aa93530-a06c-11ea-a789-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7aa93530-a06c-11ea-a789-12813bfff9fa;
 Wed, 27 May 2020 22:50:36 +0000 (UTC)
Received: from localhost (mobile-166-175-190-200.mycingular.net
 [166.175.190.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EEFC2071A;
 Wed, 27 May 2020 22:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590619836;
 bh=AC/qBVIz2RY3tjOrzusi4AN43Yd3fTkCrWWr78GG/34=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=VGr0mm/uYPh+W6nREpEC/OqhxQ54VwT0nXe0oLBmmhPRb48QhwaTYd3VgVQO3kJ59
 3UJbET/o9qWoUkvbv97YWwpxa2JX5FSr5+QalNF0uLbxOR60YCdltuCmj351kl/Iba
 V7Knj2in8qphInGIehOaq1LhmIuM1JqviKvUTM14=
Date: Wed, 27 May 2020 17:50:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/2] xen-pciback: Use dev_printk() when possible
Message-ID: <20200527225034.GA270348@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <612fee00-4e7c-9b90-511d-4efb7676cbed@oracle.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 27, 2020 at 03:34:26PM -0700, Boris Ostrovsky wrote:
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
> 
> Maybe then dev_dbg() ?

printk(KERN_DEBUG) always produces output, so I used
dev_printk(KERN_DEBUG) to retain that behavior.

dev_dbg() does not always produce output, since it depends on DEBUG or
CONFIG_DYNAMIC_DEBUG and the dynamic debug settings.

If dev_dbg() seems like the right thing, I would probably add a
separate patch on top to convert dev_printk(KERN_DEBUG) to dev_dbg().

Thanks for taking a look!  

Bjorn

