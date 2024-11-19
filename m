Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5E9D285A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:40:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840307.1256075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPOE-00066j-I4; Tue, 19 Nov 2024 14:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840307.1256075; Tue, 19 Nov 2024 14:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPOE-00064x-Eu; Tue, 19 Nov 2024 14:39:38 +0000
Received: by outflank-mailman (input) for mailman id 840307;
 Tue, 19 Nov 2024 14:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDPOC-00064r-L3
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:39:36 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16961fd5-a684-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 15:39:31 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5cfddb70965so1490170a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:39:31 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cfdbba50ecsm1095315a12.83.2024.11.19.06.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:39:30 -0800 (PST)
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
X-Inumbo-ID: 16961fd5-a684-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE2OTYxZmQ1LWE2ODQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDI3MTcxLjgzOTA1Mywic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732027171; x=1732631971; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=46V6yXTOiqZXRFj/oeBE1xj8PyZEbjNAzpTXo/gxHkQ=;
        b=G3OfT+UJOXZSLwzoovqizuj3FIonEHDpeOlSyZ5FZKKdAEDVlW4cTsW1iRoQPBnRjV
         U0pgzmOHp3mbrQRKOvsfl00nJ1LhudgCvRLmfvFph2d1mE0Md2/oX4+K6uvfmuzI11PY
         diQkI/czgVrECLetSbmdQPXx4LL1SFj6RLWTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732027171; x=1732631971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46V6yXTOiqZXRFj/oeBE1xj8PyZEbjNAzpTXo/gxHkQ=;
        b=tYgNdEdAGObo5FV+4xOCDh8nQ9AkaO0Z9+tR6KAuay74aeMJd0l6MyI2oZuTWLEape
         5JlhcJhIDlay28fnNJV3XCsHHZMNxsLLwN251Bo18tCXkSV1KmVAcXXofxHFzKP9BmbJ
         sdaP/25ZdJm26Un2c73kxVannxyY23Wd9fvl6SD8/k2s8JbwyOv1Mr8Qtwvy+qU1VM4R
         qwxQMa1RX+NwaOO33mtSzOoXQyDeaX8LNf+hGXgUxmMnEbvl98F4dtv2vjz6Wx9X4gEh
         7bmGQ/1NZwf15//xWacrVcLcaL6Pd1MrPLY9btXQu7JoSFtQYs5xGViW38YDqaZxsceR
         uAEg==
X-Gm-Message-State: AOJu0YwRdluEkakCfG0d+kmLkctmO84FlIz7Y2WO7j+4KBMKjRLQJCWF
	jvqA6wk27mwMLq1bQuTFHLz/6j48CeCWxL5kKuVnS4OilkeftGWuDMQ7JxeZXQA=
X-Google-Smtp-Source: AGHT+IHQRlOf4Cjo/GwctiEeq/jQpx+SLtC35jtYBRm79xaQ4924XzuyVoh2sj1VIVYsetZ1FQd+7g==
X-Received: by 2002:aa7:d615:0:b0:5cf:bf0b:d2ce with SMTP id 4fb4d7f45d1cf-5cfbf0bd4d4mr5489286a12.21.1732027171222;
        Tue, 19 Nov 2024 06:39:31 -0800 (PST)
Date: Tue, 19 Nov 2024 15:39:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/4] x86/msi: fix Misra Rule 20.7 in msi.h
Message-ID: <ZzyjIgx0faIV31kM@macbook>
References: <20241119103444.23296-1-roger.pau@citrix.com>
 <20241119103444.23296-3-roger.pau@citrix.com>
 <05127810-a5d3-46f7-9a5b-8f5ac1ab8b87@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05127810-a5d3-46f7-9a5b-8f5ac1ab8b87@citrix.com>

On Tue, Nov 19, 2024 at 02:21:35PM +0000, Andrew Cooper wrote:
> On 19/11/2024 10:34 am, Roger Pau Monne wrote:
> > Prune unused macros and adjust the remaining ones to parenthesize macro
> > arguments.
> >
> > No functional change intended.
> >
> > Singed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> It's a little early for carol season, isn't it?
> 
> It would help to identify which macros are being dropped, because the
> diff is far from simple to read.
> 
> AFAICT, its:
> 
>   msi_disable()
>   msi_enable()
>   msix_enable()
>   msix_disable()
>   msix_unmask()
>   msix_mask()
> 
> Splitting this change does make a marginal improvement in the diff, and
> a substantial improvement in `git diff --color-word`'s ability to review
> this change.

Hm, yes, it would likely be easier to parse, I just went on a spree to
clean it up.

> You've also introduced uses of MASK_EXTR() and MASK_INSR(), which at
> least ought to be noted in the commit message.  Technically I think it's
> a bugfix for multi_msi_enable(), because I think it now won't overflow
> the 3-bit field if an overly large num is passed in.

Hm, I've become used to MASK_{EXTR,INSR}(), so the change felt natural
since I was already adjusting the code.

> 
> Bloat-o-meter reports:
> 
> add/remove: 0/0 grow/shrink: 3/1 up/down: 15/-61 (-46)
> Function                                     old     new   delta
> set_iommu_interrupt_handler                  366     373      +7
> write_msi_msg                                348     352      +4
> init_msi                                     574     578      +4
> pci_enable_msi                              1084    1023     -61
> 
> 
> Taking the first example, that's caused by swapping this:
> 
> > iommu->msi.msi.mpos = ( ((!!(control & 0x80)) == 1) ?
> > iommu->msi.msi_attrib.pos+16 : iommu->msi.msi_attrib.pos+16 -4);
> 
> for this:
> 
> > iommu->msi.msi.mpos = ((iommu->msi.msi_attrib.pos) + 16 -
> > (((!!((control) & 0x80))) ? 0 : 4));
> 
> and code generation changing from a CMOV to straight-line arithmetic.
> 
> In write_msi_msg(), we actually drop a conditional branch and replace it
> with straight-line arithmetic.
> 
> init_msi() gets a substantial restructuring, but it looks like two
> branches are dropped.
> 
> pci_enable_msi() has the biggest change, but doesn't obviously reduce
> the number of branches.  There is clearly less register setup around
> existing branches, so my best guess is that the new macro forms are more
> amenable to common-sub-expression-elimination.
> 
> 
> Either way, it's all minor.  Staring at the diff for long enough, I'm
> pretty sure it's all good.

Thanks.

> > ---
> >  xen/arch/x86/include/asm/msi.h | 35 ++++++++++++++--------------------
> >  1 file changed, 14 insertions(+), 21 deletions(-)
> >
> > diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
> > index 748bc3cd6d8b..49a576383288 100644
> > --- a/xen/arch/x86/include/asm/msi.h
> > +++ b/xen/arch/x86/include/asm/msi.h
> > @@ -147,33 +147,26 @@ int msi_free_irq(struct msi_desc *entry);
> >   */
> >  #define NR_HP_RESERVED_VECTORS 	20
> >  
> > -#define msi_control_reg(base)		(base + PCI_MSI_FLAGS)
> > -#define msi_lower_address_reg(base)	(base + PCI_MSI_ADDRESS_LO)
> > -#define msi_upper_address_reg(base)	(base + PCI_MSI_ADDRESS_HI)
> > +#define msi_control_reg(base)		((base) + PCI_MSI_FLAGS)
> > +#define msi_lower_address_reg(base)	((base) + PCI_MSI_ADDRESS_LO)
> > +#define msi_upper_address_reg(base)	((base) + PCI_MSI_ADDRESS_HI)
> >  #define msi_data_reg(base, is64bit)	\
> > -	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
> > +	((base) + ((is64bit) ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32))
> >  #define msi_mask_bits_reg(base, is64bit) \
> > -	( (is64bit == 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4)
> > +	((base) + PCI_MSI_MASK_BIT - ((is64bit) ? 0 : 4))
> >  #define msi_pending_bits_reg(base, is64bit) \
> >  	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
> > -#define msi_disable(control)		control &= ~PCI_MSI_FLAGS_ENABLE
> >  #define multi_msi_capable(control) \
> > -	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
> > +	(1U << MASK_EXTR(control, PCI_MSI_FLAGS_QMASK))
> >  #define multi_msi_enable(control, num) \
> > -	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
> > -#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
> > -#define is_mask_bit_support(control)	(!!(control & PCI_MSI_FLAGS_MASKBIT))
> > -#define msi_enable(control, num) multi_msi_enable(control, num); \
> > -	control |= PCI_MSI_FLAGS_ENABLE
> > -
> > -#define msix_control_reg(base)		(base + PCI_MSIX_FLAGS)
> > -#define msix_table_offset_reg(base)	(base + PCI_MSIX_TABLE)
> > -#define msix_pba_offset_reg(base)	(base + PCI_MSIX_PBA)
> > -#define msix_enable(control)	 	control |= PCI_MSIX_FLAGS_ENABLE
> > -#define msix_disable(control)	 	control &= ~PCI_MSIX_FLAGS_ENABLE
> > -#define msix_table_size(control) 	((control & PCI_MSIX_FLAGS_QSIZE)+1)
> > -#define msix_unmask(address)	 	(address & ~PCI_MSIX_VECTOR_BITMASK)
> > -#define msix_mask(address)		(address | PCI_MSIX_VECTOR_BITMASK)
> > +	((control) |= MASK_INSR(fls(num) - 1, PCI_MSI_FLAGS_QSIZE))
> > +#define is_64bit_address(control)	!!((control) & PCI_MSI_FLAGS_64BIT)
> > +#define is_mask_bit_support(control)	!!((control) & PCI_MSI_FLAGS_MASKBIT)
> 
> You need to retain the outermost brackets for other MISRA reasons.

I was borderline on dropping those braces, as I was expecting Misra to
require them.

> I'm happy to fix up on commit, even splitting the patch (seeing as I've
> already done the split in order to review the rest).

Fine, by split I think you mean the pruning of unused macros vs the
fixing of the parentheses?

Thanks, Roger.

