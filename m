Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BAE452E1C
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 10:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226214.390836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmutE-00072B-3W; Tue, 16 Nov 2021 09:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226214.390836; Tue, 16 Nov 2021 09:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmutD-00070C-W0; Tue, 16 Nov 2021 09:36:31 +0000
Received: by outflank-mailman (input) for mailman id 226214;
 Tue, 16 Nov 2021 09:36:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tZbI=QD=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1mmutC-000706-2W
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 09:36:30 +0000
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac32037e-46c0-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 10:36:28 +0100 (CET)
Received: by mail-ua1-f48.google.com with SMTP id p37so39361340uae.8
 for <xen-devel@lists.xenproject.org>; Tue, 16 Nov 2021 01:36:28 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id i27sm12214624uab.8.2021.11.16.01.36.26
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 01:36:26 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id p37so39361179uae.8
 for <xen-devel@lists.xenproject.org>; Tue, 16 Nov 2021 01:36:26 -0800 (PST)
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
X-Inumbo-ID: ac32037e-46c0-11ec-9787-a32c541c8605
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E0eR9zkAbihj7HFpbj20+RG8BagR/Ljq9p4NqypyKkY=;
        b=J/gSxnPyzVIRsOexPo+AIZf7gc5xdBSG3cu3LB/T1i6zpOn5cApdTB82ZfB4kQ6BmR
         CaRQwXq92zs8TFJ0FEXWTIlMImHsgGejizfCBBv5JY/Co/v3ywgSbi+/iwuWQOaxRC2p
         C6RiYHczfyXpU5BsOM957l72929Msl3SkJ040fy6mG1z5BTnGtNJ6zMsF9FiW2DqWYGS
         FVbAq0l07YD8jzuz1nb0+gFRsIw3TFwPCOFoYFUWOeRhEW/iEBVKXQdvXAXsN/DEXtS7
         UG2dcMTHZIaTrTpytLOlq8oPAlEIn0y2SSIDCt0pd8RhOVOOGkr2HM3TRekoang/JPbM
         mgFQ==
X-Gm-Message-State: AOAM533wNgGoIspOr4qPZQdk3shZa4xDyQYqfU7eaEu17VocyAaG6gva
	yl/HrIeGV2+QmyQK0AL5jfKDsxDU/9kUmw==
X-Google-Smtp-Source: ABdhPJxWlJB7e/irEIA8qEayxgjghJ0PGIqAdbmqQyg/c4UWF6LitM+KzATAgGcY+Y4iDyVktFai/A==
X-Received: by 2002:a67:f516:: with SMTP id u22mr54563260vsn.47.1637055387239;
        Tue, 16 Nov 2021 01:36:27 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr52824758vst.37.1637055386105;
 Tue, 16 Nov 2021 01:36:26 -0800 (PST)
MIME-Version: 1.0
References: <20211028061341.1479333-1-andr2000@gmail.com>
In-Reply-To: <20211028061341.1479333-1-andr2000@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Nov 2021 10:36:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEGtr5Js4QwyGBMLP_LzG8mk0Ovv9PiOpnU2-VVp+7dg@mail.gmail.com>
Message-ID: <CAMuHMdXEGtr5Js4QwyGBMLP_LzG8mk0Ovv9PiOpnU2-VVp+7dg@mail.gmail.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: xen-devel@lists.xenproject.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, julien@xen.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
	Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Content-Type: text/plain; charset="UTF-8"

Hi Oleksandr,

On Thu, Oct 28, 2021 at 8:15 AM Oleksandr Andrushchenko
<andr2000@gmail.com> wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
> Xen-pciback driver was designed to be built for x86 only. But it
> can also be used by other architectures, e.g. Arm.
>
> Currently PCI backend implements multiple functionalities at a time,
> such as:
> 1. It is used as a database for assignable PCI devices, e.g. xl
>    pci-assignable-{add|remove|list} manipulates that list. So, whenever
>    the toolstack needs to know which PCI devices can be passed through
>    it reads that from the relevant sysfs entries of the pciback.
> 2. It is used to hold the unbound PCI devices list, e.g. when passing
>    through a PCI device it needs to be unbound from the relevant device
>    driver and bound to pciback (strictly speaking it is not required
>    that the device is bound to pciback, but pciback is again used as a
>    database of the passed through PCI devices, so we can re-bind the
>    devices back to their original drivers when guest domain shuts down)
> 3. Device reset for the devices being passed through
> 4. Para-virtualised use-cases support
>
> The para-virtualised part of the driver is not always needed as some
> architectures, e.g. Arm or x86 PVH Dom0, are not using backend-frontend
> model for PCI device passthrough.
>
> For such use-cases make the very first step in splitting the
> xen-pciback driver into two parts: Xen PCI stub and PCI PV backend
> drivers.
>
> For that add new configuration options CONFIG_XEN_PCI_STUB and
> CONFIG_XEN_PCIDEV_STUB, so the driver can be limited in its
> functionality, e.g. no support for para-virtualised scenario.
> x86 platform will continue using CONFIG_XEN_PCIDEV_BACKEND for the
> fully featured backend driver.
>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks for your patch, which is now commit a67efff28832a597
("xen-pciback: allow compiling on other archs than x86")
in v5.16-rc1.

> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -181,10 +181,34 @@ config SWIOTLB_XEN
>         select DMA_OPS
>         select SWIOTLB
>
> +config XEN_PCI_STUB
> +       bool
> +
> +config XEN_PCIDEV_STUB
> +       tristate "Xen PCI-device stub driver"
> +       depends on PCI && !X86 && XEN
> +       depends on XEN_BACKEND
> +       select XEN_PCI_STUB
> +       default m

Please note that this means "default y" if CONFIG_MODULES=n.
Perhaps this should be "default m if MODULES" instead?

> +       help
> +         The PCI device stub driver provides limited version of the PCI
> +         device backend driver without para-virtualized support for guests.
> +         If you select this to be a module, you will need to make sure no
> +         other driver has bound to the device(s) you want to make visible to
> +         other guests.
> +
> +         The "hide" parameter (only applicable if backend driver is compiled
> +         into the kernel) allows you to bind the PCI devices to this module
> +         from the default device drivers. The argument is the list of PCI BDFs:
> +         xen-pciback.hide=(03:00.0)(04:00.0)
> +
> +         If in doubt, say m.
> +
>  config XEN_PCIDEV_BACKEND
>         tristate "Xen PCI-device backend driver"
>         depends on PCI && X86 && XEN
>         depends on XEN_BACKEND
> +       select XEN_PCI_STUB
>         default m
>         help
>           The PCI device backend driver allows the kernel to export arbitrary

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

