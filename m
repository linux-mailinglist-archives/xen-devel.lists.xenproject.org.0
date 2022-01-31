Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B714A5268
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 23:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263337.456031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEfBN-0004MW-3T; Mon, 31 Jan 2022 22:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263337.456031; Mon, 31 Jan 2022 22:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEfBN-0004K3-0a; Mon, 31 Jan 2022 22:29:57 +0000
Received: by outflank-mailman (input) for mailman id 263337;
 Mon, 31 Jan 2022 22:29:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6sSE=SP=gmail.com=groeck7@srs-se1.protection.inumbo.net>)
 id 1nEfBL-0004Jx-3t
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 22:29:55 +0000
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [2607:f8b0:4864:20::c32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e39f550-82e5-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 23:29:53 +0100 (CET)
Received: by mail-oo1-xc32.google.com with SMTP id
 f11-20020a4abb0b000000b002e9abf6bcbcso3578435oop.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Jan 2022 14:29:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g4sm9441095otg.61.2022.01.31.14.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 14:29:50 -0800 (PST)
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
X-Inumbo-ID: 4e39f550-82e5-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=HIrK/ll1TuZEnp2gfWjGUr6nhrl/RDbWrtbWrrFF7+Q=;
        b=FWRJLJWX37blE6SLGzHmlsU0MZaU9sC2V0CKgL2guyKi7ulFdCvCxfSgomLcISQkgy
         Ghq8SQIK4GU/McVbpX2lJ7OYShY6Lw5N7YDemT7S61dxt4UkLuWkbDmiWtLV762XImzN
         iPIwaCk0oidTkqG5YTSOx1D94ZX/cJ8UT38VexR809vDAIRCTgiUw9WdmH8i4zF4TaOY
         sjkQKwFCacqbbThjmKuhVAZ23rOdKjSaGbe/NcrwAPbrDF4+HCEGEKm+QiAzCwCa95P5
         wn42EJBxoXEh5EO4PWRYI2RctRR7vXFMjMJ7lAfqUaFIvg6vDktEasPwIfoCZezXf5fQ
         Un3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition;
        bh=HIrK/ll1TuZEnp2gfWjGUr6nhrl/RDbWrtbWrrFF7+Q=;
        b=rVHFVWbYWyB8s3OzarpdsVGFAOH4DwoEBCVZmlpEpBDAXHBlKFkISHY61ry66quV7Y
         wD1MFEEFpeTpKzJX/fZRYVixn38fgr6mj2UrZXML5b20qKgqyzpyOKwfaGCVpRLpUFUZ
         W1HRg0dYDQAPEv6AKqSOxmfhcYVBtSpR3GIaqLQi97dvk5/aC7OEPrWM2jHssi1uPuGM
         DTDUjHawjpTw/63bx8eHBfiKU/K0URXvPmFlkRqAYZQyRqSQDn9MyjU18MYB3HBagVbD
         R4q08NdVL/ed6cVnJB5WKKDIlHJOddqqpHD8Cniycu3NMNquDn1dDyegcYthUGHhyUvn
         uBNg==
X-Gm-Message-State: AOAM530rX7DRkL/z38m2p5LtTaXgFAtVSQW4SYzRvWmnN65FP4ziL/+e
	Bvq090Xk3QFZbWZ+L5maqJU=
X-Google-Smtp-Source: ABdhPJx+o1YTpwbEBbSj59Y5iWO00V4GxVy7uT2QJWPM1Z04rC1/i4P0mk8FIqDSuUFbw+Zw9FPkQg==
X-Received: by 2002:a4a:7656:: with SMTP id w22mr11304612ooe.79.1643668190906;
        Mon, 31 Jan 2022 14:29:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 31 Jan 2022 14:29:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Stuart Yoder <stuyoder@gmail.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sinan Kaya <okaya@kernel.org>, iommu@lists.linux-foundation.org,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Cedric Le Goater <clg@kaod.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Megha Dey <megha.dey@intel.com>, Juergen Gross <jgross@suse.com>,
	Tero Kristo <kristo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>, Marc Zygnier <maz@kernel.org>,
	dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
Message-ID: <20220131222949.GA3467472@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 31, 2022 at 10:16:41PM +0100, Thomas Gleixner wrote:
> Guenter,
> 
> On Mon, Jan 31 2022 at 07:21, Guenter Roeck wrote:
> > Sure. Please see http://server.roeck-us.net/qemu/x86/.
> > The logs are generated with with v5.16.4.
> 
> thanks for providing the data. It definitely helped me to leave the
> state of not seeing the wood for the trees. Fix below.
> 
> Thanks,
> 
>         tglx
> ---
> Subject: PCI/MSI: Remove bogus warning in pci_irq_get_affinity()
> From: Thomas Gleixner <tglx@linutronix.de>
> Date: Mon, 31 Jan 2022 22:02:46 +0100
> 
> The recent overhaul of pci_irq_get_affinity() introduced a regression when
> pci_irq_get_affinity() is called for an MSI-X interrupt which was not
> allocated with affinity descriptor information.
> 
> The original code just returned a NULL pointer in that case, but the rework
> added a WARN_ON() under the assumption that the corresponding WARN_ON() in
> the MSI case can be applied to MSI-X as well.
> 
> In fact the MSI warning in the original code does not make sense either
> because it's legitimate to invoke pci_irq_get_affinity() for a MSI
> interrupt which was not allocated with affinity descriptor information.
> 
> Remove it and just return NULL as the original code did.
> 
> Fixes: f48235900182 ("PCI/MSI: Simplify pci_irq_get_affinity()")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  drivers/pci/msi/msi.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -1111,7 +1111,8 @@ const struct cpumask *pci_irq_get_affini
>  	if (!desc)
>  		return cpu_possible_mask;
>  
> -	if (WARN_ON_ONCE(!desc->affinity))
> +	/* MSI[X] interrupts can be allocated without affinity descriptor */
> +	if (!desc->affinity)
>  		return NULL;
>  
>  	/*

