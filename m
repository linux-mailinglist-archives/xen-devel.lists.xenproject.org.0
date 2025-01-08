Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20ECA054D7
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 08:56:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866934.1278317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQuk-00011t-Kl; Wed, 08 Jan 2025 07:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866934.1278317; Wed, 08 Jan 2025 07:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVQuk-00010N-Hv; Wed, 08 Jan 2025 07:55:42 +0000
Received: by outflank-mailman (input) for mailman id 866934;
 Wed, 08 Jan 2025 07:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVQui-00010H-Ov
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 07:55:40 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f34ff225-cd95-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 08:55:38 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa69107179cso2735273566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 23:55:38 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe3958sm2448030666b.96.2025.01.07.23.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 23:55:37 -0800 (PST)
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
X-Inumbo-ID: f34ff225-cd95-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736322938; x=1736927738; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=15/fxpnRPGsuKaRUiaA9l+EFhd190Bo2vicC3mODEfM=;
        b=Tq39DrDtZuP/ppmjHPD5494LfxD0BK7okNH/qXy0L889hfEi6LpbtDr4TvYnakEeiW
         lASHofQmU/DegbD7JKdTfMVwJa9jssW3UqWcMYBlCuvk8ENJyYSwhTzutgQ7Jsc+fQRc
         8AIzx0f71uIJIEdxVSsjXwROm8z59wRQhu3CY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736322938; x=1736927738;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15/fxpnRPGsuKaRUiaA9l+EFhd190Bo2vicC3mODEfM=;
        b=B/z+y7xUKl78/Y8mnLCFSOr/Us+WKL5SrHBxGuYCM9Gz4bi72h2lOdf6p62HnmEpIW
         VlxKXJYuRiTPfAqr6HHtum/4U4cwZGtnHEt4RgctE2ttftaZOGy1m1QcW3jCSPJ4zBzP
         KWgObvZle1Ras0JGL7qiIZtaq9DLxchuZ0tRCYob/vDW2C6tPQHqP8UA4TquUJjSg2uG
         cmhOLw3iW/xkQjYlSndSv5XW+lFxMAB24EI6bQGgyBlKTSylwwUxhvcRiS7hSZ4E9Xi+
         6U35yF+DpejkNL7ihl8cfRh6PrBUHHWFldgPL7zvBbP5rSiGeKiTaLJTe93xMWiyslUK
         sfOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL+6qySEJj6oBJCT/YhSibIkXGBmp9O+MTfVit/jAC7oEWCkbNzQFMLe+giuo9y6C5/GFuliii2ko=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yztr2kq9Ag+IJBMuVMZtG322GPdYI+N4Ra9FCy/vdQHCwmRgWun
	eiw81CxjbqRbmW1Mkrz9XUr1+FGeWCLmfiH4IjmE5gywdXtnoUSUBzJ1LRI1UOyxDewlY+SPR+B
	G
X-Gm-Gg: ASbGncunvyMNH6ge4QODfKl57AIWcUbKMxGOkT1MvnJZCSe35zszye8ixxlkj/0v/5W
	0az21WyfXrChljVccBAM+vKEsD9FeYw6RKb5sjgo8eOgcKPc2u7GCwnzjJEERH/AVmkw5zDuQUw
	pgbcqfWFMq2Nd5tISTFqilOG9l7DdG9R/CvCeyMy4WL1PCvP5FEBXiu2FkkPKh4ZGJm/tZxbuSo
	LIqCUrXCCbSvfAhb7AuA4KdqXZLfDlTJouvP0PjhMOCydyPKTW6DwtCdFYvZ9dWx6c=
X-Google-Smtp-Source: AGHT+IGx4YHCvLunMDLeCrMT+UUY+9lmsa77uLKyoQSx7UXn6wApZBuMpbpS2TnupdoI6VC19Rjl2A==
X-Received: by 2002:a17:906:c106:b0:aa5:b1b9:5d6a with SMTP id a640c23a62f3a-ab2abc91217mr132216066b.54.1736322938301;
        Tue, 07 Jan 2025 23:55:38 -0800 (PST)
Date: Wed, 8 Jan 2025 08:55:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jiqian Chen <Jiqian.Chen@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] vpci: Add resizable bar support
Message-ID: <Z34veAxGFCg25Zrb@macbook.local>
References: <20241219052143.3161332-1-Jiqian.Chen@amd.com>
 <d904c816-da83-418a-9bff-9988660af546@suse.com>
 <Z308fGa1daaM62Rf@macbook.local>
 <fb1b00fe-5740-4c0e-81d9-ec9fd9a4a1c3@suse.com>
 <Z31wFjWadOkzTDK3@macbook.local>
 <d5e37e59-2a05-4184-9b1e-ca0bf77f201c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5e37e59-2a05-4184-9b1e-ca0bf77f201c@suse.com>

On Wed, Jan 08, 2025 at 08:19:55AM +0100, Jan Beulich wrote:
> On 07.01.2025 19:19, Roger Pau Monné wrote:
> > On Tue, Jan 07, 2025 at 04:58:07PM +0100, Jan Beulich wrote:
> >> On 07.01.2025 15:38, Roger Pau Monné wrote:
> >>> On Tue, Jan 07, 2025 at 11:06:33AM +0100, Jan Beulich wrote:
> >>>> On 19.12.2024 06:21, Jiqian Chen wrote:
> >>>>> --- /dev/null
> >>>>> +++ b/xen/drivers/vpci/rebar.c
> >>>>> @@ -0,0 +1,131 @@
> >>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
> >>>>> +/*
> >>>>> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
> >>>>> + *
> >>>>> + * Author: Jiqian Chen <Jiqian.Chen@amd.com>
> >>>>> + */
> >>>>> +
> >>>>> +#include <xen/sched.h>
> >>>>> +#include <xen/vpci.h>
> >>>>> +
> >>>>> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> >>>>> +                                      unsigned int reg,
> >>>>> +                                      uint32_t val,
> >>>>> +                                      void *data)
> >>>>> +{
> >>>>> +    struct vpci_bar *bar = data;
> >>>>> +    uint64_t size = PCI_REBAR_CTRL_SIZE(val);
> >>>>> +
> >>>>> +    if ( bar->enabled )
> >>>>> +    {
> >>>>> +        /*
> >>>>> +         * Refuse to resize a BAR while memory decoding is enabled, as
> >>>>> +         * otherwise the size of the mapped region in the p2m would become
> >>>>> +         * stale with the newly set BAR size, and the position of the BAR
> >>>>> +         * would be reset to undefined.  Note the PCIe specification also
> >>>>> +         * forbids resizing a BAR with memory decoding enabled.
> >>>>> +         */
> >>>>> +        if ( size != bar->size )
> >>>>> +            gprintk(XENLOG_ERR,
> >>>>> +                    "%pp: refuse to resize BAR with memory decoding enabled\n",
> >>>>> +                    &pdev->sbdf);
> >>>>> +        return;
> >>>>> +    }
> >>>>> +
> >>>>> +    if ( !((size >> PCI_REBAR_SIZE_BIAS) & bar->resizable_sizes) )
> >>>>> +        gprintk(XENLOG_WARNING,
> >>>>> +                "%pp: new size %#lx is not supported by hardware\n",
> >>>>> +                &pdev->sbdf, size);
> >>>>> +
> >>>>> +    bar->size = size;
> >>>>
> >>>> Shouldn't at least this be in an "else" to the if() above?
> >>>
> >>> I think this was already raised in a previous version - would be good
> >>> to know how real hardware behaves when an invalid size is set.  Is the
> >>> BAR register still reset?
> >>
> >> I'm pretty sure what happens is undefined. I'd expect though that the
> >> BAR size then doesn't change. Which would require the above assignment
> >> to not be unconditional.
> > 
> > Might be better to just re-size the BAR, like you suggested to fetch
> > the BAR position from the register, instead of assuming 0.
> 
> FTAOD by "re-size" you mean re-obtain its size (seeing we're talking of
> re-sizable BARs here)? As kind of confirmed ...

Indeed, I meant to re-obtain the size (I can see that being
confusing in this context, sorry).

> >>>>> --- a/xen/drivers/vpci/vpci.c
> >>>>> +++ b/xen/drivers/vpci/vpci.c
> >>>>> @@ -232,6 +232,12 @@ void cf_check vpci_hw_write16(
> >>>>>      pci_conf_write16(pdev->sbdf, reg, val);
> >>>>>  }
> >>>>>  
> >>>>> +void cf_check vpci_hw_write32(
> >>>>> +    const struct pci_dev *pdev, unsigned int reg, uint32_t val, void *data)
> >>>>> +{
> >>>>> +    pci_conf_write32(pdev->sbdf, reg, val);
> >>>>> +}
> >>>>
> >>>> This function is being added just to handle writing of a r/o register.
> >>>> Can't you better re-use vpci_ignored_write()?
> >>>
> >>> But vpci_ignored_write() ignores the write, OTOH here the write is
> >>> propagated to the hardware.
> >>
> >> Right, just for the hardware to drop it. I wouldn't have commented if
> >> the function needed to do things like this already existed. Adding yet
> >> another cf_check function just for this is what made me give the remark.
> > 
> > According to the spec yes, they will be ignored.  Yet for the hardware
> > domain we try to avoid changing behavior from native as much as
> > possible, hence propagating the write seems more appropriate.
> 
> Okay; you're the maintainer of this code anyway.

Thanks for all your input Jan, you might not be the maintainer but
have certainly reviewed all vPCI code.

Roger.

