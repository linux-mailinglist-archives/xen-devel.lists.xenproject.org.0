Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A423BA04918
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 19:20:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866765.1278126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVEAW-0007s5-N7; Tue, 07 Jan 2025 18:19:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866765.1278126; Tue, 07 Jan 2025 18:19:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVEAW-0007pl-KS; Tue, 07 Jan 2025 18:19:08 +0000
Received: by outflank-mailman (input) for mailman id 866765;
 Tue, 07 Jan 2025 18:19:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X79W=T7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVEAU-0007pf-Fd
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 18:19:06 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e03fb257-cd23-11ef-99a4-01e77a169b0f;
 Tue, 07 Jan 2025 19:19:04 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3f28a4fccso25229502a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 10:19:04 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f00ea44sm2401057166b.135.2025.01.07.10.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 10:19:03 -0800 (PST)
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
X-Inumbo-ID: e03fb257-cd23-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736273944; x=1736878744; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gAIbsf9ZtPCezZdhE8Far66QKTwL6uzto59QSVGySmo=;
        b=aPlYbDTz+hgvtCmLldcnuFdwFaGWesVei9byUzipcYsuiZ3OUnxOv3TbDC3ZmVN5TN
         3mONSHvy8dVEh+cvCtIByXKVVBW+tRzt3fG8MZk50KoXdzvQFkpRTg+NekT0zIKEMeIw
         qzB4mZ0An/xOh4hd/kvtxVNrataJX6lJfw2C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736273944; x=1736878744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAIbsf9ZtPCezZdhE8Far66QKTwL6uzto59QSVGySmo=;
        b=tmhHi76m+K0Sv2gU/HYYjCundMP4fNYhHCLGR4fnVVt0AADnu7EmAPfnYWBjE2/b0P
         rrJ9amdv09kogwfmYwIRK69D5yV1sbxu6TRRFARYK1RSb8yHNFDdlJIvJx2Plo/4jNc7
         qwIvYZiVkDhM/oDfib12/or4qc1o4Hayw8yIbqI8+hmOmeRGTPyV0DQZ8efCLqUvp+37
         fKKNGhtZMZDGAEZ6Ri2CxHSkYlr35HaHazH2KhsN8dnFT0SqIe91aorjj6y36ni0LuEl
         C24BRRJ9fc0Zeaf+9310ktmj6vzXcJfkN++1vHMwJxeLKfa3UBMxMWT8hZqMAdctuO24
         v0ag==
X-Forwarded-Encrypted: i=1; AJvYcCWCX+1IhsjHuC5GsfL9wlq5DhZsKJAGDkimPJOG6xmxRYT/NMtjVRQyGREzx4rcmgC7gDooFrfXQj0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXMad7Rr2i8bfjz/0R9HEd1nvooWCe/d1lTze04KG5h2CYDet8
	AF46rwbcT5N6PVnWf1TM9gVPMZxPYMXeItRt0pXUqTwR0dPTXmAyZ+3r2i4Dbdk=
X-Gm-Gg: ASbGncuxhmUfse/Qca0Zo14naUtrX53iWuAJgXs/Ox3zlsuC/vL5Vc4ql5z7g7TzVDd
	DHnfrzbiXxMNlF1bdC8Y1YVz/WgjBQiWuTZ/BqTrgyhm4M7tW6XR/HhoP+FZIJ6cHh5l8A5iIsx
	3l2Wj6WCB+I6Fy9bwletBnYlP2pe91g48XDJAFCZbEwzFkMmcYcZIlsbUMil0+eOEpi213Kk/xP
	aIM4C97JfYE60wiAcZTiY+XNmnpTIWC3z3nCW8jS8VB4jaWI3NSyGWC3pdqVfRS9gQ=
X-Google-Smtp-Source: AGHT+IEhjoCZ3aghGleOZVMHtffnrIotqUsAD7Qst7gqIuEftDvU4SmQ8W8vbGkePAYDB700v7+4YA==
X-Received: by 2002:a17:907:2d2c:b0:aa6:8a1b:8b78 with SMTP id a640c23a62f3a-aac271318f9mr4703318266b.6.1736273943711;
        Tue, 07 Jan 2025 10:19:03 -0800 (PST)
Date: Tue, 7 Jan 2025 19:19:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] vpci: Add resizable bar support
Message-ID: <Z31wFjWadOkzTDK3@macbook.local>
References: <20241219052143.3161332-1-Jiqian.Chen@amd.com>
 <d904c816-da83-418a-9bff-9988660af546@suse.com>
 <Z308fGa1daaM62Rf@macbook.local>
 <fb1b00fe-5740-4c0e-81d9-ec9fd9a4a1c3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb1b00fe-5740-4c0e-81d9-ec9fd9a4a1c3@suse.com>

On Tue, Jan 07, 2025 at 04:58:07PM +0100, Jan Beulich wrote:
> On 07.01.2025 15:38, Roger Pau Monné wrote:
> > On Tue, Jan 07, 2025 at 11:06:33AM +0100, Jan Beulich wrote:
> >> On 19.12.2024 06:21, Jiqian Chen wrote:
> >>> --- /dev/null
> >>> +++ b/xen/drivers/vpci/rebar.c
> >>> @@ -0,0 +1,131 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>> +/*
> >>> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
> >>> + *
> >>> + * Author: Jiqian Chen <Jiqian.Chen@amd.com>
> >>> + */
> >>> +
> >>> +#include <xen/sched.h>
> >>> +#include <xen/vpci.h>
> >>> +
> >>> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> >>> +                                      unsigned int reg,
> >>> +                                      uint32_t val,
> >>> +                                      void *data)
> >>> +{
> >>> +    struct vpci_bar *bar = data;
> >>> +    uint64_t size = PCI_REBAR_CTRL_SIZE(val);
> >>> +
> >>> +    if ( bar->enabled )
> >>> +    {
> >>> +        /*
> >>> +         * Refuse to resize a BAR while memory decoding is enabled, as
> >>> +         * otherwise the size of the mapped region in the p2m would become
> >>> +         * stale with the newly set BAR size, and the position of the BAR
> >>> +         * would be reset to undefined.  Note the PCIe specification also
> >>> +         * forbids resizing a BAR with memory decoding enabled.
> >>> +         */
> >>> +        if ( size != bar->size )
> >>> +            gprintk(XENLOG_ERR,
> >>> +                    "%pp: refuse to resize BAR with memory decoding enabled\n",
> >>> +                    &pdev->sbdf);
> >>> +        return;
> >>> +    }
> >>> +
> >>> +    if ( !((size >> PCI_REBAR_SIZE_BIAS) & bar->resizable_sizes) )
> >>> +        gprintk(XENLOG_WARNING,
> >>> +                "%pp: new size %#lx is not supported by hardware\n",
> >>> +                &pdev->sbdf, size);
> >>> +
> >>> +    bar->size = size;
> >>
> >> Shouldn't at least this be in an "else" to the if() above?
> > 
> > I think this was already raised in a previous version - would be good
> > to know how real hardware behaves when an invalid size is set.  Is the
> > BAR register still reset?
> 
> I'm pretty sure what happens is undefined. I'd expect though that the
> BAR size then doesn't change. Which would require the above assignment
> to not be unconditional.

Might be better to just re-size the BAR, like you suggested to fetch
the BAR position from the register, instead of assuming 0.

> >>> +        if ( index >= PCI_HEADER_NORMAL_NR_BARS )
> >>> +        {
> >>> +            /*
> >>> +             * TODO: for failed pathes, need to hide ReBar capability
> >>> +             * from hardware domain instead of returning an error.
> >>> +             */
> >>> +            printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
> >>> +                   pdev->domain, &pdev->sbdf, index);
> >>> +            return -EINVAL;
> >>
> >> With the TODO unaddressed, is it actually appropriate to return an error
> >> here? Shouldn't we continue in a best effort manner? (Question also to
> >> Roger as the maintainer.)
> > 
> > It would indeed be better to shallow the error and return 0, however
> > the handlers added in this loop would need removing if no error is
> > returned.
> 
> Would they? For those BARs where things worked fine I would think they
> could be left in place.

Hm, it's kind of partial support, but yes, that could likely be fine.
Then the return here should be a continue instead.

> >>> +        }
> >>> +
> >>> +        bar = &pdev->vpci->header.bars[index];
> >>> +        if ( bar->type != VPCI_BAR_MEM64_LO && bar->type != VPCI_BAR_MEM32 )
> >>> +        {
> >>> +            printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
> >>> +                   pdev->domain, &pdev->sbdf, index);
> >>> +            return -EINVAL;
> >>
> >> Same question here then.
> >>
> >>> +        }
> >>> +
> >>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, vpci_hw_write32,
> >>> +                               rebar_offset + PCI_REBAR_CAP(i), 4, NULL);
> >>> +        if ( rc )
> >>> +        {
> >>> +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CAP rc=%d\n",
> >>> +                   pdev->domain, &pdev->sbdf, rc);
> >>> +            return rc;
> >>> +        }
> >>> +
> >>> +        rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
> >>> +                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
> >>> +        if ( rc )
> >>> +        {
> >>> +            printk(XENLOG_ERR "%pd %pp: fail to add reg of REBAR_CTRL rc=%d\n",
> >>> +                   pdev->domain, &pdev->sbdf, rc);
> >>> +            return rc;
> >>> +        }
> >>> +
> >>> +        bar->resizable_sizes |=
> >>> +            (pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CAP(i)) >>
> >>> +             PCI_REBAR_CAP_SHIFT);
> >>
> >> Imo this would better use = in place of |= and (see also below) would also
> >> better use MASK_EXTR() just like ...
> >>
> >>> +        bar->resizable_sizes |=
> >>> +            ((uint64_t)MASK_EXTR(ctrl, PCI_REBAR_CTRL_SIZES) <<
> >>> +             (32 - PCI_REBAR_CAP_SHIFT));
> >>
> >> ... this one does.
> >>
> >> Further I think you want to truncate the value for 32-bit BARs, such that
> >> rebar_ctrl_write() would properly reject attempts to set sizes of 4G and
> >> above for them.
> > 
> > For the hardware domain at least we shouldn't add such restriction -
> > Xen in general allows dom0 to do things it would otherwise consider
> > invalid, in case it has to deal with hardware quirks.
> > 
> > Rather than reject Xen should just print a warning that the sizes
> > supported by the device are likely invalid.
> 
> And do what when memory decode is re-enabled on the device? What size a
> P2M update should it do then?

You did suggest to re-read the BARs positions after a ctrl write, we
might as well read the BAR size and use that to be on the safe side.

> >>> --- a/xen/drivers/vpci/vpci.c
> >>> +++ b/xen/drivers/vpci/vpci.c
> >>> @@ -232,6 +232,12 @@ void cf_check vpci_hw_write16(
> >>>      pci_conf_write16(pdev->sbdf, reg, val);
> >>>  }
> >>>  
> >>> +void cf_check vpci_hw_write32(
> >>> +    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
> >>> +{
> >>> +    pci_conf_write32(pdev->sbdf, reg, val);
> >>> +}
> >>
> >> This function is being added just to handle writing of a r/o register.
> >> Can't you better re-use vpci_ignored_write()?
> > 
> > But vpci_ignored_write() ignores the write, OTOH here the write is
> > propagated to the hardware.
> 
> Right, just for the hardware to drop it. I wouldn't have commented if
> the function needed to do things like this already existed. Adding yet
> another cf_check function just for this is what made me give the remark.

According to the spec yes, they will be ignored.  Yet for the hardware
domain we try to avoid changing behavior from native as much as
possible, hence propagating the write seems more appropriate.

Thanks, Roger.

