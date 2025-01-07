Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173D4A042BE
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 15:39:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866399.1277728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVAjR-0008DT-KM; Tue, 07 Jan 2025 14:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866399.1277728; Tue, 07 Jan 2025 14:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVAjR-0008BI-HB; Tue, 07 Jan 2025 14:38:57 +0000
Received: by outflank-mailman (input) for mailman id 866399;
 Tue, 07 Jan 2025 14:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X79W=T7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVAjP-0008BB-CF
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 14:38:55 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e651ab7-cd05-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 15:38:54 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9f60bf4so27994310a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 06:38:54 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d80679eeb1sm24379347a12.48.2025.01.07.06.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 06:38:53 -0800 (PST)
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
X-Inumbo-ID: 1e651ab7-cd05-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736260733; x=1736865533; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+o5mFEbXgTgp0YRTW2/X+6Yd+zqJ5lqW6dKl4ry4elw=;
        b=bNVi8WzTYArc0ZRWCFGe2zGkg2Obr/8x7y4aZHjg0IJXtbQxhsojoPAweDXJoq5XwC
         0vti8rhcRVme0p+T3PITwhpuQE4nPGHOwJGY7F5ixp+aoDZLH7PuDl1gSXnXF7QtO5LR
         rABkfgkxFGvmd7Jg7JkaMi1/q0U2eoo+BZPV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736260733; x=1736865533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+o5mFEbXgTgp0YRTW2/X+6Yd+zqJ5lqW6dKl4ry4elw=;
        b=j7YYV92xLo9Mhtt9LgI72WSB2aywpPXHvxDn/pICnybtRo5Dlz7Hu9bNJbgslMG4RG
         lWboVDhGnH7xglUWUXhooKUy6AMRf5txR6n2qiP2OlK0ezMuQlrPv0ZWPPWHhSObAqMY
         ghLWiLMizAOarD0Q8fpzSK6jTlDOWR2uWRph+inL6eBNzwNnf87HwocsO7PV+6eo3W5m
         IYhgmLpkaDSSPORJdglkQ7HSIATpauhl+hOBF5PAOKrJEs1y8mx5ezATurYIdZarrXUT
         qq6NNx/VRsix8Zj6aQ6jsB2RJWA0kbuAI3/TC0CyS3izlLZYpnHe4Y1aOe4oeI/lxygc
         Umzg==
X-Forwarded-Encrypted: i=1; AJvYcCWpJsKVwqwclsu65f0XZ1IAFFaJs9y4Nw2zWVSJ8pnV0FcZE8+a2V1CCSAi9yHtXVCfll2R6y6UcJA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy6AyhI8CqF0napqA6jJa/2cxDNkWiWgaC4HtvETOq5Kj1lOoYp
	EKIt/yEMTNfC41VLnoSMwcaal8qbO0Qrkpc8bTBFaCemGJl/SxBKQfczzj9N5iM=
X-Gm-Gg: ASbGnctMur9DiC5ttBtwGy8hbHHliTN28vK7A3Y44jNeCP4Kdf0Jc4xAD9lsuV4+heG
	T4S6Mx9orJIcWRF2IIvAS96zXNgg+oHs7RR9CIDzYwWPszay/l/TW55ui7Ja9jvmINDno7pMBkm
	o/FsnNFFSq8jGfc5XwjddhptdgjN5U4J0H36auSP3vpPrVAkVBKoZPsHprPbqzUXL4ia3XB6y5U
	kbj5G8dsZI/XYBdUJK3USyes+sF0KcUPDt3WuK/CwulC+xAkXZtBdVpXdjkAQ==
X-Google-Smtp-Source: AGHT+IG+OB/MxNlHSNWxhU6mujwMsOQvexSmrvEEcoS2e0kXFtQuWbpA2J3fpvz6u15HDPAJRU+72A==
X-Received: by 2002:a50:cc04:0:b0:5d8:a46f:110b with SMTP id 4fb4d7f45d1cf-5d8a46f1123mr31452716a12.17.1736260733499;
        Tue, 07 Jan 2025 06:38:53 -0800 (PST)
Date: Tue, 7 Jan 2025 15:38:52 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] vpci: Add resizable bar support
Message-ID: <Z308fGa1daaM62Rf@macbook.local>
References: <20241219052143.3161332-1-Jiqian.Chen@amd.com>
 <d904c816-da83-418a-9bff-9988660af546@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d904c816-da83-418a-9bff-9988660af546@suse.com>

On Tue, Jan 07, 2025 at 11:06:33AM +0100, Jan Beulich wrote:
> On 19.12.2024 06:21, Jiqian Chen wrote:
> > --- /dev/null
> > +++ b/xen/drivers/vpci/rebar.c
> > @@ -0,0 +1,131 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
> > + *
> > + * Author: Jiqian Chen <Jiqian.Chen@amd.com>
> > + */
> > +
> > +#include <xen/sched.h>
> > +#include <xen/vpci.h>
> > +
> > +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> > +                                      unsigned int reg,
> > +                                      uint32_t val,
> > +                                      void *data)
> > +{
> > +    struct vpci_bar *bar = data;
> > +    uint64_t size = PCI_REBAR_CTRL_SIZE(val);
> > +
> > +    if ( bar->enabled )
> > +    {
> > +        /*
> > +         * Refuse to resize a BAR while memory decoding is enabled, as
> > +         * otherwise the size of the mapped region in the p2m would become
> > +         * stale with the newly set BAR size, and the position of the BAR
> > +         * would be reset to undefined.  Note the PCIe specification also
> > +         * forbids resizing a BAR with memory decoding enabled.
> > +         */
> > +        if ( size != bar->size )
> > +            gprintk(XENLOG_ERR,
> > +                    "%pp: refuse to resize BAR with memory decoding enabled\n",
> > +                    &pdev->sbdf);
> > +        return;
> > +    }
> > +
> > +    if ( !((size >> PCI_REBAR_SIZE_BIAS) & bar->resizable_sizes) )
> > +        gprintk(XENLOG_WARNING,
> > +                "%pp: new size %#lx is not supported by hardware\n",
> > +                &pdev->sbdf, size);
> > +
> > +    bar->size = size;
> 
> Shouldn't at least this be in an "else" to the if() above?

I think this was already raised in a previous version - would be good
to know how real hardware behaves when an invalid size is set.  Is the
BAR register still reset?

> > +    bar->addr = 0;
> 
> For maximum compatibility with the behavior on bare metal, would we
> perhaps better ...
> 
> > +    bar->guest_addr = 0;
> > +    pci_conf_write32(pdev->sbdf, reg, val);
> 
> ... re-read the BAR from hardware after this write?
> 
> Similar consideration may apply to ->guest_addr: Driver writers knowing
> how their hardware behaves may expect that merely some of the bits of
> the address get cleared (if the size increases).

Since we only plan to enable the capability for the hardware domain,
and in that case addr == guest_addr always, it's fine to just read
from the BAR register and update the fields.  If we do this we might
as well check that the newly reported BAR size matches what Xen
expects on debug builds at least.

> > +static int cf_check init_rebar(struct pci_dev *pdev)
> > +{
> > +    uint32_t ctrl;
> > +    unsigned int nbars;
> > +    unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
> > +                                                        PCI_EXT_CAP_ID_REBAR);
> > +
> > +    if ( !rebar_offset )
> > +        return 0;
> > +
> > +    if ( !is_hardware_domain(pdev->domain) )
> > +    {
> > +        printk(XENLOG_ERR "%pp: resizable BARs unsupported for unpriv %pd\n",
> > +               &pdev->sbdf, pdev->domain);
> > +        return -EOPNOTSUPP;
> > +    }
> > +
> > +    ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(0));
> > +    nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
> > +
> > +    for ( unsigned int i = 0; i < nbars; i++ )
> > +    {
> > +        int rc;
> > +        struct vpci_bar *bar;
> > +        unsigned int index;
> > +
> > +        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
> > +        index = ctrl & PCI_REBAR_CTRL_BAR_IDX;;
> 
> Nit: No double semicolons please.
> 
> > +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
> > +        {
> > +            /*
> > +             * TODO: for failed pathes, need to hide ReBar capability
> > +             * from hardware domain instead of returning an error.
> > +             */
> > +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
> > +                   pdev->domain, &pdev->sbdf, index);
> > +            return -EINVAL;
> 
> With the TODO unaddressed, is it actually appropriate to return an error
> here? Shouldn't we continue in a best effort manner? (Question also to
> Roger as the maintainer.)

It would indeed be better to shallow the error and return 0, however
the handlers added in this loop would need removing if no error is
returned.

> > +        }
> > +
> > +        bar = &pdev->vpci->header.bars[index];
> > +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
> > +        {
> > +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
> > +                   pdev->domain, &pdev->sbdf, index);
> > +            return -EINVAL;
> 
> Same question here then.
> 
> > +        }
> > +
> > +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
> > +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
> > +        if ( rc )
> > +        {
> > +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CAP rc=%d\n",
> > +                   pdev->domain, &pdev->sbdf, rc);
> > +            return rc;
> > +        }
> > +
> > +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> > +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
> > +        if ( rc )
> > +        {
> > +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CTRL rc=%d\n",
> > +                   pdev->domain, &pdev->sbdf, rc);
> > +            return rc;
> > +        }
> > +
> > +        bar->resizable_sizes |=
> > +            (pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CAP(i)) >>
> > +             PCI_REBAR_CAP_SHIFT);
> 
> Imo this would better use = in place of |= and (see also below) would also
> better use MASK_EXTR() just like ...
> 
> > +        bar->resizable_sizes |=
> > +            ((uint64_t)MASK_EXTR(ctrl, PCI_REBAR_CTRL_SIZES) <<
> > +             (32 - PCI_REBAR_CAP_SHIFT));
> 
> ... this one does.
> 
> Further I think you want to truncate the value for 32-bit BARs, such that
> rebar_ctrl_write() would properly reject attempts to set sizes of 4G and
> above for them.

For the hardware domain at least we shouldn't add such restriction -
Xen in general allows dom0 to do things it would otherwise consider
invalid, in case it has to deal with hardware quirks.

Rather than reject Xen should just print a warning that the sizes
supported by the device are likely invalid.

> > --- a/xen/drivers/vpci/vpci.c
> > +++ b/xen/drivers/vpci/vpci.c
> > @@ -232,6 +232,12 @@ void cf_check vpci_hw_write16(
> >      pci_conf_write16(pdev->sbdf, reg, val);
> >  }
> >  
> > +void cf_check vpci_hw_write32(
> > +    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
> > +{
> > +    pci_conf_write32(pdev->sbdf, reg, val);
> > +}
> 
> This function is being added just to handle writing of a r/o register.
> Can't you better re-use vpci_ignored_write()?

But vpci_ignored_write() ignores the write, OTOH here the write is
propagated to the hardware.

Thanks, Roger.

