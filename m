Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FDC80E58C
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 09:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652690.1018706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCxp9-0006Qm-Lb; Tue, 12 Dec 2023 08:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652690.1018706; Tue, 12 Dec 2023 08:09:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCxp9-0006P7-Ha; Tue, 12 Dec 2023 08:09:03 +0000
Received: by outflank-mailman (input) for mailman id 652690;
 Tue, 12 Dec 2023 08:09:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IzYH=HX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCxp8-0006P1-Kz
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 08:09:02 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3c1b4aa-98c5-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 09:09:00 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c2a444311so52324015e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 00:08:58 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c500a00b004094e565e71sm15611143wmr.23.2023.12.12.00.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 00:08:58 -0800 (PST)
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
X-Inumbo-ID: b3c1b4aa-98c5-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702368538; x=1702973338; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZ9ea9ok6ZP/daUsmJ5Nh5VRT1Vhh0QOAkcU3YgmvrE=;
        b=QiOE3uZaJCFu4pfr21wSWKF2VskHlKneAlM8uGIxWO+6fdatlJU1QUnoTQFJASwsKa
         EfPDnF6VLKFIJ1r5DfaNbuy988Pv7Nia8i4mTPMK8VXXlzRccB9CUl9wRba50hsWO5MN
         z6EhgW2xkf2nbWzGCULBxaAWk/IYmq3ksnSOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368538; x=1702973338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZ9ea9ok6ZP/daUsmJ5Nh5VRT1Vhh0QOAkcU3YgmvrE=;
        b=MboOo2I31vgiFE8z5kX6v7rnhzl+KWPIKMxHfeutscSvtyCEJlw1gUNUT/EFpLUhDh
         f4AYpOfpKe1SexWBBD+SpuoNS+F9wBR2NLRX+rvQeTVZdUG9XiV0mzapmfikotguL54X
         BrkoY1kx/IYRrp9mW4acCoIW7Q/wDV//6qMsxK+5dQFSWi8kwZoJXWrbdZ1iTAme9g6F
         9tb/G4s2EGK08jIsB3rBoJz7kVvnqk0UTJlYgVDXN2uadrO+OWurM/wpW6aFRrFDXydi
         ROcdPYMIuOGSGL1lRxk6TH27JFI+BP7lMLYCfp5vVjPTsHPgN9L9xvNr0FrrhUTeoB8a
         em9A==
X-Gm-Message-State: AOJu0YxNdwWM/OgYhUp1rKFE7S0hVofHE2ieWDNsfLdt+Bcmw3ys6LHP
	xTu4hT5PxnGhC/5BrzD2yT3HWg==
X-Google-Smtp-Source: AGHT+IFiLEbU7MXeHb/3JUtaP7dLoEfB9T02V0TbySRKV6sYpsT8WjQ7hIYcImSy3eOwCQDp6dIJng==
X-Received: by 2002:a05:600c:28e:b0:40c:53d4:391 with SMTP id 14-20020a05600c028e00b0040c53d40391mr34795wmk.24.1702368538240;
        Tue, 12 Dec 2023 00:08:58 -0800 (PST)
Date: Tue, 12 Dec 2023 09:08:57 +0100
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
Subject: Re: [RFC KERNEL PATCH v3 1/3] xen/pci: Add xen_reset_device_state
 function
Message-ID: <ZXgVGWLZEnLt0Pqn@macbook>
References: <20231210161519.1550860-1-Jiqian.Chen@amd.com>
 <20231210161519.1550860-2-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231210161519.1550860-2-Jiqian.Chen@amd.com>

On Mon, Dec 11, 2023 at 12:15:17AM +0800, Jiqian Chen wrote:
> When device on dom0 side has been reset, the vpci on Xen side
> won't get notification, so that the cached state in vpci is
> all out of date with the real device state.
> To solve that problem, add a new function to clear all vpci
> device state when device is reset on dom0 side.
> 
> And call that function in pcistub_init_device. Because when
> using "pci-assignable-add" to assign a passthrough device in
> Xen, it will reset passthrough device and the vpci state will
> out of date, and then device will fail to restore bar state.
> 
> Co-developed-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
>  drivers/xen/pci.c                  | 12 ++++++++++++
>  drivers/xen/xen-pciback/pci_stub.c |  4 ++++
>  include/xen/interface/physdev.h    |  8 ++++++++
>  include/xen/pci.h                  |  6 ++++++
>  4 files changed, 30 insertions(+)
> 
> diff --git a/drivers/xen/pci.c b/drivers/xen/pci.c
> index 72d4e3f193af..e9b30bc09139 100644
> --- a/drivers/xen/pci.c
> +++ b/drivers/xen/pci.c
> @@ -177,6 +177,18 @@ static int xen_remove_device(struct device *dev)
>  	return r;
>  }
>  
> +int xen_reset_device_state(const struct pci_dev *dev)
> +{
> +	struct physdev_pci_device device = {
> +		.seg = pci_domain_nr(dev->bus),
> +		.bus = dev->bus->number,
> +		.devfn = dev->devfn
> +	};
> +
> +	return HYPERVISOR_physdev_op(PHYSDEVOP_pci_device_state_reset, &device);
> +}
> +EXPORT_SYMBOL_GPL(xen_reset_device_state);
> +
>  static int xen_pci_notifier(struct notifier_block *nb,
>  			    unsigned long action, void *data)
>  {
> diff --git a/drivers/xen/xen-pciback/pci_stub.c b/drivers/xen/xen-pciback/pci_stub.c
> index e34b623e4b41..24f599eaec14 100644
> --- a/drivers/xen/xen-pciback/pci_stub.c
> +++ b/drivers/xen/xen-pciback/pci_stub.c
> @@ -421,6 +421,10 @@ static int pcistub_init_device(struct pci_dev *dev)
>  	else {
>  		dev_dbg(&dev->dev, "resetting (FLR, D3, etc) the device\n");
>  		__pci_reset_function_locked(dev);
> +		if (!xen_pv_domain())
> +			err = xen_reset_device_state(dev);
> +		if (err)
> +			goto config_release;

I think you are missing other instances where
__pci_reset_function_locked() is called in pci_stub.c?  See
pcistub_device_release() and pcistub_put_pci_dev().

Overall I'm not sure why the hypercall wrapper needs to live in
xen/pci.c.  I think it would be better if you could create a static
wrapper in pci_stub.c that does the call to
__pci_reset_function_locked() plus PHYSDEVOP_pci_device_state_reset.
That would make it less likely that new callers of
__pci_reset_function_locked() are introduced without noticing the need
to also call PHYSDEVOP_pci_device_state_reset.

Thanks, Roger.

