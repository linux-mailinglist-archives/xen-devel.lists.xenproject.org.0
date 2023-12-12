Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859A480E735
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:18:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652761.1018782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCyu8-0004V7-8y; Tue, 12 Dec 2023 09:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652761.1018782; Tue, 12 Dec 2023 09:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCyu8-0004Sm-5p; Tue, 12 Dec 2023 09:18:16 +0000
Received: by outflank-mailman (input) for mailman id 652761;
 Tue, 12 Dec 2023 09:18:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IzYH=HX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCyu6-0004Sg-VO
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:18:14 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fcaf3ad-98cf-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 10:18:12 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3332efd75c9so4878548f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 01:18:12 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0040c490db950sm5631023wmq.47.2023.12.12.01.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 01:18:12 -0800 (PST)
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
X-Inumbo-ID: 5fcaf3ad-98cf-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702372692; x=1702977492; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9WELy4DAZTSrhx4zGGjgQkw3W/tbMhWv9d+cZpR74m0=;
        b=sR8OaL8C0bLenlUb4kg+RBX2KkxdwuEa8Qt2xvPH/DG+3yrQjIx6qn+CADolTP6PYi
         4E3ZHeergOv67VjudURLbGCvL7ChTe4wE1R5zq+jMvQs09mjoNEq3kSxkVMI6UDExhEn
         5h/L13tNVTHy8jnI8VzUo7l0pCST3WFF2zhwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702372692; x=1702977492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9WELy4DAZTSrhx4zGGjgQkw3W/tbMhWv9d+cZpR74m0=;
        b=mYrPCgH/RKL8x5PL0uF1ecnmMqYA5zgjYe58ZEU93zDNMPN7Yo/DzZmIWkTAG5x91r
         TAY3IUzJKIEzV4kvT2D7znCXLAAaAOA1JyR7thz3NZxzbHy/hLPe86S+gIwmcV5nDqHR
         JeXD1F8WOqUdbi6DIuZaVExFitD2/1u/ZMEIxIoZ1N/Gvqgs9X66F8Yma1r2Wu4WwTa0
         BNPDgXP8nJ9GrmV0sFx/Z+908/UzvpIRRSNBzuu/uwqe8FqqbRcEm+zwg2+7M5DxhkGc
         NoOug5FDoJlOnwyFscIlNe6tIP/t130MRqA1aRm/1uFPN4ZHopi/27j4aRdDwywjmW2T
         q2FQ==
X-Gm-Message-State: AOJu0Yx9hTBAcJFdHOkUcN8K/2kiB+XNoVTn5fRrfBa/SHPN4wpU8fjU
	hAfvwi4qNnh64LXNrg1bCuuNMg==
X-Google-Smtp-Source: AGHT+IFgKgRKA6Hj8FA4QbKIfcIE89wBNkiyNGzHcW1HguHNOiTJp2Iwm2e75u6BvwbtAJwHlC1s8w==
X-Received: by 2002:a05:600c:1c1f:b0:40b:4c54:3d6d with SMTP id j31-20020a05600c1c1f00b0040b4c543d6dmr1419794wms.8.1702372692352;
        Tue, 12 Dec 2023 01:18:12 -0800 (PST)
Date: Tue, 12 Dec 2023 10:18:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v3 3/3] PCI/sysfs: Add gsi sysfs for pci_dev
Message-ID: <ZXglU0EtBrRNiWVp@macbook>
References: <20231210161519.1550860-1-Jiqian.Chen@amd.com>
 <20231210161519.1550860-4-Jiqian.Chen@amd.com>
 <ZXdNf0HWs4nAVPeF@macbook>
 <BL1PR12MB584910C2E370BBCC8A312733E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584910C2E370BBCC8A312733E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Tue, Dec 12, 2023 at 06:34:27AM +0000, Chen, Jiqian wrote:
> 
> On 2023/12/12 01:57, Roger Pau Monné wrote:
> > On Mon, Dec 11, 2023 at 12:15:19AM +0800, Jiqian Chen wrote:
> >> There is a need for some scenarios to use gsi sysfs.
> >> For example, when xen passthrough a device to dumU, it will
> >> use gsi to map pirq, but currently userspace can't get gsi
> >> number.
> >> So, add gsi sysfs for that and for other potential scenarios.
> >>
> >> Co-developed-by: Huang Rui <ray.huang@amd.com>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> >> ---
> >>  drivers/acpi/pci_irq.c  |  1 +
> >>  drivers/pci/pci-sysfs.c | 11 +++++++++++
> >>  include/linux/pci.h     |  2 ++
> >>  3 files changed, 14 insertions(+)
> >>
> >> diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
> >> index 630fe0a34bc6..739a58755df2 100644
> >> --- a/drivers/acpi/pci_irq.c
> >> +++ b/drivers/acpi/pci_irq.c
> >> @@ -449,6 +449,7 @@ int acpi_pci_irq_enable(struct pci_dev *dev)
> >>  		kfree(entry);
> >>  		return 0;
> >>  	}
> >> +	dev->gsi = gsi;
> > 
> > It would be better if the gsi if fetched without requiring calling
> > acpi_pci_irq_enable(), as the gsi doesn't require the interrupt to be
> > enabled.  The gsi is known at boot time and won't change for the
> > lifetime of the device.
> Do you have any suggest places to do this?

I'm not an expert on this, but drivers/pci/pci-sysfs.c would seem like
a better place, together with the rest of the resources.

Maybe my understanding is incorrect, but given the suggested placement
in acpi_pci_irq_enable() I think the device would need to bind the
interrupt in order for the gsi node to appear on sysfs?

Would the current approach work if the device is assigned to pciback
on the kernel command line, and thus never owned by any driver in
dom0?

> > 
> >>  
> >>  	rc = acpi_register_gsi(&dev->dev, gsi, triggering, polarity);
> >>  	if (rc < 0) {
> >> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> >> index 2321fdfefd7d..c51df88d079e 100644
> >> --- a/drivers/pci/pci-sysfs.c
> >> +++ b/drivers/pci/pci-sysfs.c
> >> @@ -71,6 +71,16 @@ static ssize_t irq_show(struct device *dev,
> >>  }
> >>  static DEVICE_ATTR_RO(irq);
> >>  
> >> +static ssize_t gsi_show(struct device *dev,
> >> +			struct device_attribute *attr,
> >> +			char *buf)
> >> +{
> >> +	struct pci_dev *pdev = to_pci_dev(dev);
> > 
> > const
> Do you mean "const struct pci_dev *pdev = to_pci_dev(dev);" ?

Yup.

Thanks, Roger.

