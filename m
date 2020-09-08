Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD65626120F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Sep 2020 15:36:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFdnV-0007e5-OQ; Tue, 08 Sep 2020 13:36:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wd5i=CR=gmail.com=wei.liu.linux@srs-us1.protection.inumbo.net>)
 id 1kFdnU-0007du-9h
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2020 13:36:32 +0000
X-Inumbo-ID: b73c804e-fb92-412b-8dc1-98f5c72e1ec5
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b73c804e-fb92-412b-8dc1-98f5c72e1ec5;
 Tue, 08 Sep 2020 13:36:31 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b79so17202617wmb.4
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2020 06:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g+fF122O7R17ki64qXX6rnyePilfcGBCv1/ck2Kz2cE=;
 b=MplEPFXvU6C1e0MMmBkgBFcf5+oHELxVcAGt4JV/yofEg6o2F6V45XqfQMSU8NEpXI
 46TR8J1+AXMjbf7Ol2pOOQk3wc5b53fjNGX/KdoKVMu6UqD9pJY1RrsVIxwxcWi7Inz4
 GdPrOmUp+miQf/4iN0EtWxanWr0RFKRZ0J8EeeDpy7er7PjDqSDjNr9JBu0OvSrETlGE
 3Huj8Y/gV7VPwGE5e3xZiEs8A9dwqBdmu49oEjsDsQfFAW7H56DVSG4fucgz09Oz7zDW
 bHlolIQVJcklXhZLpRx53lwMcDjgalcjYhtu0aA+tOU+26oiAkasr+yY9mhVoRy61C5x
 lD5w==
X-Gm-Message-State: AOAM530V+ups37yvgRrg8bwwv0M/eR2icRMQ+c3VXSGULTKa+Kfy3B1F
 LxEeFjjutAQyJdqvYbkf0ZA=
X-Google-Smtp-Source: ABdhPJw43xrSDZbM980Q1wyWmczcPUCg8AtgaZXw5a+lncrCANbP6dkN49Y+7fuL7XSHkRq9MvMZ7w==
X-Received: by 2002:a1c:678a:: with SMTP id b132mr4764047wmc.10.1599572190886; 
 Tue, 08 Sep 2020 06:36:30 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v128sm31250006wme.2.2020.09.08.06.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 06:36:30 -0700 (PDT)
Date: Tue, 8 Sep 2020 13:36:29 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [patch V2 18/46] x86/msi: Consolidate MSI allocation
Message-ID: <20200908133628.ekh2jbasjf6bxa5z@liuwe-devbox-debian-v2>
References: <20200826111628.794979401@linutronix.de>
 <20200826112332.466405395@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826112332.466405395@linutronix.de>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Aug 26, 2020 at 01:16:46PM +0200, Thomas Gleixner wrote:
[...]
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -1534,7 +1534,7 @@ static struct irq_chip hv_msi_irq_chip =
>  static irq_hw_number_t hv_msi_domain_ops_get_hwirq(struct msi_domain_info *info,
>  						   msi_alloc_info_t *arg)
>  {
> -	return arg->msi_hwirq;
> +	return arg->hwirq;
>  }

Acked-by: Wei Liu <wei.liu@kernel.org>

