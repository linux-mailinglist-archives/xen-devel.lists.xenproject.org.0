Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BC09D3510
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 09:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840945.1256468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDfmc-0002oS-Ag; Wed, 20 Nov 2024 08:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840945.1256468; Wed, 20 Nov 2024 08:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDfmc-0002lJ-82; Wed, 20 Nov 2024 08:09:54 +0000
Received: by outflank-mailman (input) for mailman id 840945;
 Wed, 20 Nov 2024 08:09:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E1p6=SP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDfmb-0002lD-6V
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 08:09:53 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d03a42e3-a716-11ef-99a3-01e77a169b0f;
 Wed, 20 Nov 2024 09:09:49 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9ed0ec0e92so562372766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 00:09:49 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e046b28sm736601666b.164.2024.11.20.00.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 00:09:48 -0800 (PST)
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
X-Inumbo-ID: d03a42e3-a716-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmQiLCJoZWxvIjoibWFpbC1lajEteDYyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQwM2E0MmUzLWE3MTYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDkwMTg5Ljg0MTc2NCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732090189; x=1732694989; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z4BZchq1cHyEbG4XTqODtrWgv2g5y6AN63FP/MyOct4=;
        b=i/DrNk1Mj3XEBVbaFWm16emWb+JX/2LMar2fVy54nfaUgHtveestl+hSLcYotScDZ6
         Ym+p+O7Ezwi6Q5+KoXMT2MfnPEE5FsCRVUTwN+Zr8bOvjf+wL7Dp7s6HkMQLPelKf9WT
         LJt/vhTZ3kPncUcX2/euScDeoCwt+HxIms9T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732090189; x=1732694989;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4BZchq1cHyEbG4XTqODtrWgv2g5y6AN63FP/MyOct4=;
        b=CBnUEALIb49ePlkE0jOpSozGHtBj0pVcYPUGVPHLjWReF6SEzlReHN/qnl9Ttk9eV8
         liFkMGjzZFtReFjLJAIIvd/WuXFjnlrM0V10eIiEYoyGLVodjQHh3TlV4rguENYWyh2T
         xzpxVKbZT5KlATTM8E/lJVP2MRWVQltMMUuXMqPdRbG0toWlla9Xaoy+f7rAG8mAe+6R
         YFxtZ1jg5x9DbZgKH/akUHcm+hpZUHKSOsPkDywXmzrNunp+0cPt/LrDKNAA//BjpDu1
         XyyFzArMSuvO34htx6g9tl48knznM2qQE8YpYpC0UFeYaHG8gthfVdIcuVAEVrQ9gZOt
         OfDg==
X-Gm-Message-State: AOJu0Yx0FkvsBfg41hfhIlcYyxc7r7R8hFKV8wIpqGrEgq+noklXl1Fk
	UwIVhzSmnrQaBHdyN4KSDjsc0UL3M5bbVBdYfMFQwpwPyLtfzpZuycJMNjfTbrI=
X-Google-Smtp-Source: AGHT+IGrCVR21yv0Wrgu4tubEKkGjfRMagzGKrd7m+fwQYvH2m4wd/LBToiZqbGbXTwcNIFkquGeFw==
X-Received: by 2002:a17:906:da81:b0:a9a:85b5:2aba with SMTP id a640c23a62f3a-aa4dd56ae2dmr150625866b.21.1732090189224;
        Wed, 20 Nov 2024 00:09:49 -0800 (PST)
Date: Wed, 20 Nov 2024 09:09:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] vpci: Add resizable bar support
Message-ID: <Zz2ZTD7ugA9MVzjO@macbook>
References: <20241113080027.244240-1-Jiqian.Chen@amd.com>
 <ZzyJu9mrwJhDJClE@macbook>
 <BL1PR12MB58495B6D78F5D63180552BACE7212@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58495B6D78F5D63180552BACE7212@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, Nov 20, 2024 at 02:30:33AM +0000, Chen, Jiqian wrote:
> On 2024/11/19 20:51, Roger Pau Monné wrote:
> > On Wed, Nov 13, 2024 at 04:00:27PM +0800, Jiqian Chen wrote:
> >> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> >> +                                      unsigned int reg,
> >> +                                      uint32_t val,
> >> +                                      void *data)
> >> +{
> >> +    uint32_t ctrl, index;
> >> +    struct vpci_bar *bars = pdev->vpci->header.bars;
> >> +
> >> +    ctrl = pci_conf_read32(pdev->sbdf, reg);
> >> +    if ( ctrl == val )
> >> +        return;
> >> +
> >> +    ctrl &= ~PCI_REBAR_CTRL_BAR_SIZE;
> >> +    if ( ctrl != ( val & ~PCI_REBAR_CTRL_BAR_SIZE ) )
> >> +        return;
> >> +
> >> +    index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
> >> +    bars[index].size = (1 << ((val & PCI_REBAR_CTRL_BAR_SIZE) >>
> >> +                              PCI_REBAR_CTRL_BAR_SHIFT)) *
> >> +                       PCI_REBAR_CTRL_BAR_UNIT;
> > 
> > One further comment: you also need to reset addr and guest_addr here
> > (possibly by reading them from the BAR register), as the specification
> > states that:
> How about just set them to 0, since the addr will be re-assigned by system and the addr of BAR register is also out of date.

Seems good, I assume Xen would also get 0 as the BAR register address
after having changed the size.

Thanks, Roger.

