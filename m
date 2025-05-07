Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D75AAD8AE
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 09:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978258.1365084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZSX-0007k4-32; Wed, 07 May 2025 07:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978258.1365084; Wed, 07 May 2025 07:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZSX-0007hz-0I; Wed, 07 May 2025 07:44:53 +0000
Received: by outflank-mailman (input) for mailman id 978258;
 Wed, 07 May 2025 07:44:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zuHe=XX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCZSU-0007ht-Uk
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 07:44:51 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 272ed6f0-2b17-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 09:44:49 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39c31e4c3e5so4029544f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 00:44:49 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099ae834bsm16191367f8f.60.2025.05.07.00.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 00:44:48 -0700 (PDT)
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
X-Inumbo-ID: 272ed6f0-2b17-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746603888; x=1747208688; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0gmiiCpwxuueYbDKPa3Xc5A+KGpxSQE5kI4ghDqkk4s=;
        b=Pe/MKpMqTJ/yJyXgEZAHrxglxeoYtPLa54/llUqlsmIzlhgUdoxE4LzeRQqjKt32Oy
         tJFD562vJWkjZHxUbTb5PwqAOn1oIucu+3LrNAtCs8FtvlLZmnZ33lFTUYbmi9D9udE8
         Wyxw5asU6qBZqu8KGGFdS5qbjUISCY9STA3+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603888; x=1747208688;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gmiiCpwxuueYbDKPa3Xc5A+KGpxSQE5kI4ghDqkk4s=;
        b=AHqZHd66lew8+i6lZPpql9Qw3ZwiAx6urgo8vJqXLDNjlGYzica8S/aJVMNe3AF7JA
         WASyLtqB7C7Q2a4SdSM8FXd+Btt0OzFbiURGE3ZAPAPS6mDrm9vI1yRUqEMCz/kdXGxR
         jULHj9Y/ehqI4GfrtVxdlozGsOxcOlPNYYSNzsWaUjp8Ynvbc0cy3qSBtgyWFr9QsuWM
         2t24L4SV0aJwm77RiLynoG13eMNDpQ7QBZs4kKcpwlwDFIgwxCvjyfMOBup8Kj5EArW6
         jk6rWSsYG3UFi4tOF9zP6woFGhcwPzbCbj09+vN1lGUwW5IXB7JyvkOppGSM7Wc26kuW
         nRwQ==
X-Gm-Message-State: AOJu0YzV97zqGE3GwLK6YkX8MZ8TmsiArRzj9WfKU68bMaL/kF6X8vx6
	TCMJg0RfhFYqLl4/nIhq59/3cyw/L7UINr0KYA75ASJlQ39CuQ7LxyCP1KPF7yI=
X-Gm-Gg: ASbGnctnv8jsHNZruyKHNhYC00xFyoksPEqi/W2jWraZuDBYHE6DLhqY7bYkKkHQshq
	6eZvqdw/10fC/5wun5i0TAhDLcLLIdP2h19N/30YGI1qlEu2+Azb+j4YHiHr7HO8XjkzfAMhz67
	B8LazWG0f2Or13Tlrpiu8xVqS4MdvOYcouU3Yis0cir3eRiPcpBPEI6fztpfvoND3fn7/tHPc03
	H2LSd7KwQEyZ6/ZsikPchmkWjVk2LOfZOm83UZVWDI4R7YUorlfGH1AjFWz+/ScMfTki6MSQ2bQ
	l9OF0eRmVRHxr2TxaUnNObaFZiupeJdNMAFCfxtF8uMDmvX1GoQ=
X-Google-Smtp-Source: AGHT+IFWhboqL8UsZxpyvGYtMnvtp+eDFPiI4G9p7XSJq2+cLoA/6/3+dp21t66YJ/Agix5QIK40Qg==
X-Received: by 2002:adf:cc90:0:b0:3a0:b559:cefa with SMTP id ffacd0b85a97d-3a0b559d02bmr1110124f8f.57.1746603888565;
        Wed, 07 May 2025 00:44:48 -0700 (PDT)
Date: Wed, 7 May 2025 09:44:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: Re: [PATCH v20 2/2] vpci: translate virtual PCI bus topology for
 guests
Message-ID: <aBsPbyqL0XpjEdeo@macbook.lan>
References: <20250418185840.335816-1-stewart.hildebrand@amd.com>
 <20250418185840.335816-3-stewart.hildebrand@amd.com>
 <aBnvlY3Dfc_Wpljw@macbook.lan>
 <3693f1ef-e305-4a6b-bb4e-3b842418387f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3693f1ef-e305-4a6b-bb4e-3b842418387f@amd.com>

On Tue, May 06, 2025 at 11:05:13PM -0400, Stewart Hildebrand wrote:
> On 5/6/25 07:16, Roger Pau Monné wrote:
> > Hello,
> > 
> > Sorry I haven't looked at this before, I was confused with the cover
> > letter having ARM in the subject and somehow assumed all the code was
> > ARM related.
> 
> No worries, thanks for taking a look.
> 
> > On Fri, Apr 18, 2025 at 02:58:37PM -0400, Stewart Hildebrand wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>  static int vpci_register_cmp(const struct vpci_register *r1,
> >>                               const struct vpci_register *r2)
> >>  {
> >> @@ -438,7 +473,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
> >>      const struct pci_dev *pdev;
> >>      const struct vpci_register *r;
> >>      unsigned int data_offset = 0;
> >> -    uint32_t data = ~(uint32_t)0;
> >> +    uint32_t data = 0xffffffffU >> (32 - 8 * size);
> > 
> > This seems kind of unrelated to the rest of the code in the patch,
> > why is this needed?  Isn't it always fine to return all ones, and let
> > the caller truncate to the required size?
> > 
> > Otherwise the code in vpci_read_hw() also needs to be adjusted.
> 
> On Arm, since 9a5e22b64266 ("xen/arm: check read handler behavior") we
> assert that the read handlers don't set any bits above the access size.

I see.  That kind of diverges from x86 behavior, that AFAICT (see
memcpy() at tail of hvmemul_do_io()) instead truncates the memcpy to
the size of the access.

Maybe it would be better to instead of asserting just truncate the
returned value to the given size, as that would allow to just return
~0 from handlers without having to care about the specific access
size.

> I had adjusted data here due to returning it directly from vpci_read()
> in the current form of the patch. With your suggestion below we would
> only need to adjust vpci_read_hw() (and then data here would not
> strictly need adjusting).

Both returns would need adjusting IMO, and it should have been part of
9a5e22b64266 I think, since that's the commit that introduced the
checking.

> 
> > And
> > you can likely use GENMASK(size * 8, 0) as it's easier to read.
> 
> OK. I'll then also provide a definition for GENMASK in
> tools/tests/vpci/emul.h.
> 
> >>  
> >>      if ( !size )
> >>      {
> >> @@ -453,9 +488,21 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
> >>       * pci_lock is sufficient.
> >>       */
> >>      read_lock(&d->pci_lock);
> >> -    pdev = pci_get_pdev(d, sbdf);
> >> -    if ( !pdev && is_hardware_domain(d) )
> >> -        pdev = pci_get_pdev(dom_xen, sbdf);
> >> +    if ( is_hardware_domain(d) )
> >> +    {
> >> +        pdev = pci_get_pdev(d, sbdf);
> >> +        if ( !pdev )
> >> +            pdev = pci_get_pdev(dom_xen, sbdf);
> >> +    }
> >> +    else
> >> +    {
> >> +        pdev = translate_virtual_device(d, &sbdf);
> >> +        if ( !pdev )
> >> +        {
> >> +            read_unlock(&d->pci_lock);
> >> +            return data;
> >> +        }
> > 
> > You don't need this checking here, as the check below will already be
> > enough AFAICT, iow:
> > 
> >     if ( is_hardware_domain(d) )
> >     {
> >         pdev = pci_get_pdev(d, sbdf);
> >         if ( !pdev )
> >             pdev = pci_get_pdev(dom_xen, sbdf);
> >     }
> >     else
> >         pdev = translate_virtual_device(d, &sbdf);
> > 
> >     if ( !pdev || !pdev->vpci )
> >     {
> >         read_unlock(&d->pci_lock);
> >         return vpci_read_hw(sbdf, reg, size);
> >     }
> > 
> > Achieves the same and is more compact by having a single return for
> > all the possible cases?  Same for the write case below.
> 
> Seeing as there is a is_hardware_domain check inside vpci_read_hw(),
> that is okay. I'll make the adjustment here and in vpci_write.

Yup, vpci_read_hw() is already prepared to handle calls from
!is_hardware_domain() contexts.

Thanks, Roger.

