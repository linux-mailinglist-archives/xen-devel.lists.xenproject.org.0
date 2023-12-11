Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE22980D4C6
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 18:57:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652462.1018322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCkWx-0001Kx-FZ; Mon, 11 Dec 2023 17:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652462.1018322; Mon, 11 Dec 2023 17:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCkWx-0001Hs-CB; Mon, 11 Dec 2023 17:57:23 +0000
Received: by outflank-mailman (input) for mailman id 652462;
 Mon, 11 Dec 2023 17:57:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ojZ6=HW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCkWv-0001Hm-S0
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 17:57:21 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bb07bad2-984e-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 18:57:20 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40c3ca9472dso27193245e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 09:57:20 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 m3-20020a5d56c3000000b003334520e49bsm9101723wrw.53.2023.12.11.09.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 09:57:19 -0800 (PST)
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
X-Inumbo-ID: bb07bad2-984e-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702317440; x=1702922240; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PZ+R8B3wHCuWt284dmb9Of0onfh+d3cgp76iNW/6Qqk=;
        b=OTqOnTDN08vfURVusn8WrCsbe7I9o/PvI1b0o9pdD6X1gVVUkUp+K9kWvpiRIl87E+
         pMmDK+zAw66vh/aZjHQC5EPWXD9RQLzXn3XGEp5+LpW+PfdkyZTwzd9JToY+8aIbokfl
         y1/LvPV9TvztrPFuR5o0g2kXT5LbpfcWj41ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702317440; x=1702922240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZ+R8B3wHCuWt284dmb9Of0onfh+d3cgp76iNW/6Qqk=;
        b=q0w+qYwEksc+I2HU2M8VgtOoMm6jLGjf34IVDcyOTcO64vH0GB5pAlqtCe8E3GSOXt
         8Ya3jqutjXC8H8BIgXi6VPqm4QGFdqiklpvtcC9XjUU2FzTl7EIs6RtfTGYWMQpojDtv
         jyQ25BZZcpub+5ZmgvymBnP71LgmKG1haYeWSDH/CYflxEpvw0WZerfHHcdzvbuSoyZu
         fUEAgtIZOF54pK0PeYKMe1o9oC3uOFAakVzsgB2wspLZADmUiq/LsLx4qj6Pr+UI2DGb
         gQtLrO1vA7GTEnJNiH/Gjamox6/VNZTgbJVtly/EMhXI48En/07IgdZMldXio13Y0g24
         1M2A==
X-Gm-Message-State: AOJu0YzMZqjm5fzFuEFBWLYH7mfULp0RkxJ3aFMcFWlnwAaTu6EVXxZH
	HxzVqofwuITZVU02fPXMMjE0lg==
X-Google-Smtp-Source: AGHT+IHhS8zwI1NybzNdNGlVlhUK2j8AuOrYo5xAxBVkRUX7U4OlrMBon1SmCu4zLgRRSqo6ThubwA==
X-Received: by 2002:a05:600c:1ca3:b0:40c:243d:daa6 with SMTP id k35-20020a05600c1ca300b0040c243ddaa6mr1570231wms.8.1702317440373;
        Mon, 11 Dec 2023 09:57:20 -0800 (PST)
Date: Mon, 11 Dec 2023 18:57:19 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org,
	Alex Deucher <Alexander.Deucher@amd.com>,
	Christian Koenig <Christian.Koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Honglei Huang <Honglei1.Huang@amd.com>,
	Julia Zhang <Julia.Zhang@amd.com>, Huang Rui <Ray.Huang@amd.com>
Subject: Re: [RFC KERNEL PATCH v3 3/3] PCI/sysfs: Add gsi sysfs for pci_dev
Message-ID: <ZXdNf0HWs4nAVPeF@macbook>
References: <20231210161519.1550860-1-Jiqian.Chen@amd.com>
 <20231210161519.1550860-4-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231210161519.1550860-4-Jiqian.Chen@amd.com>

On Mon, Dec 11, 2023 at 12:15:19AM +0800, Jiqian Chen wrote:
> There is a need for some scenarios to use gsi sysfs.
> For example, when xen passthrough a device to dumU, it will
> use gsi to map pirq, but currently userspace can't get gsi
> number.
> So, add gsi sysfs for that and for other potential scenarios.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  drivers/acpi/pci_irq.c  |  1 +
>  drivers/pci/pci-sysfs.c | 11 +++++++++++
>  include/linux/pci.h     |  2 ++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/drivers/acpi/pci_irq.c b/drivers/acpi/pci_irq.c
> index 630fe0a34bc6..739a58755df2 100644
> --- a/drivers/acpi/pci_irq.c
> +++ b/drivers/acpi/pci_irq.c
> @@ -449,6 +449,7 @@ int acpi_pci_irq_enable(struct pci_dev *dev)
>  		kfree(entry);
>  		return 0;
>  	}
> +	dev->gsi = gsi;

It would be better if the gsi if fetched without requiring calling
acpi_pci_irq_enable(), as the gsi doesn't require the interrupt to be
enabled.  The gsi is known at boot time and won't change for the
lifetime of the device.

>  
>  	rc = acpi_register_gsi(&dev->dev, gsi, triggering, polarity);
>  	if (rc < 0) {
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 2321fdfefd7d..c51df88d079e 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -71,6 +71,16 @@ static ssize_t irq_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(irq);
>  
> +static ssize_t gsi_show(struct device *dev,
> +			struct device_attribute *attr,
> +			char *buf)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);

const

Thanks, Roger.

