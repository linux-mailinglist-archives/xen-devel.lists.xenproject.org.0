Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A709D2B16
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 17:37:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840705.1256202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDREG-0006uo-HO; Tue, 19 Nov 2024 16:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840705.1256202; Tue, 19 Nov 2024 16:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDREG-0006tL-Ef; Tue, 19 Nov 2024 16:37:28 +0000
Received: by outflank-mailman (input) for mailman id 840705;
 Tue, 19 Nov 2024 16:37:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o1Xh=SO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tDREF-0006tD-0G
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 16:37:27 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e2adce5-a694-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 17:37:24 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53b34ed38easo1285693e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 08:37:24 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20dffd7cbsm664196366b.117.2024.11.19.08.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 08:37:23 -0800 (PST)
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
X-Inumbo-ID: 8e2adce5-a694-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmEiLCJoZWxvIjoibWFpbC1sZjEteDEyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjhlMmFkY2U1LWE2OTQtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDM0MjQ0LjQyMTA1MSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732034244; x=1732639044; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QSOuZprL5vzhvSM/FcpDoSesmRoOSSFJWyMwk0w1i1c=;
        b=GRX24/w9LVYFXxvYNgnL8BStyNlDTflHjD7TbW8INw2rf1DGd4PFBThEX8d+rxbs3b
         E72o9SneDpM8GWT5TWA1E1c94ehlzfU4ki1w65wraUhQua0U0bFTlGIQtufqenctvKum
         qbhYrwUsc1mD/rpnzGwWeF1PUUp9BKQXnoDYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732034244; x=1732639044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QSOuZprL5vzhvSM/FcpDoSesmRoOSSFJWyMwk0w1i1c=;
        b=MRFw/OhKfmCRg7jS/AfixQOqifnR3rkyp01HiOEf6bc13og/vtTW+utsU6Gv8V/E+l
         HDbnY7NZ/+dLxwI0UbrfzuwR4x19sfreWjCOJYvCHgVrEM/C55yTVK9T67gJFEuwAhJ0
         qW+oUV4syx7ONiDrJIHmGgLsuGa6+n6kSFgoeW8QNLfCxpHuXfvg446xD2iuhsgaZKCE
         2cvmitRqXEd33hSOIB5CyHiAn3QRsQv3pGFSH16mChhO8/3ajVpHykRsIn2spJEImgvU
         VWfM7TncFi1JWts3/3EL8tGYVi68h5qEktROtI/XVh7dp7EDO7Iz+CLpwovwbvTdOcP7
         PPyQ==
X-Gm-Message-State: AOJu0Yx+aZAfvdyGT/PfyPPVqhoTKNPQ6G+b64wvkBCoekPRmmrxruwQ
	qoP53OPutjwsL3EkOOsG2ddxqyxiIWsxSX9PQ/dbF2qCEaJ11MLywuZ54k/gx44=
X-Google-Smtp-Source: AGHT+IHV9Jw4FBSrTHtLTHZ96DzBydTJEgNfLDu/vdqr/3Du4veD5x+KbaV5WCX01pByTY/8TmN3Ow==
X-Received: by 2002:a19:6405:0:b0:53d:abd2:d564 with SMTP id 2adb3069b0e04-53dabd2d5b2mr6059161e87.24.1732034243760;
        Tue, 19 Nov 2024 08:37:23 -0800 (PST)
Date: Tue, 19 Nov 2024 17:37:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/4] x86/msi: fix Misra Rule 20.7 in msi.h
Message-ID: <Zzy-woJaXwW27wkd@macbook>
References: <20241119103444.23296-1-roger.pau@citrix.com>
 <20241119103444.23296-3-roger.pau@citrix.com>
 <05127810-a5d3-46f7-9a5b-8f5ac1ab8b87@citrix.com>
 <ZzyjIgx0faIV31kM@macbook>
 <d6d2cd7f-35ba-4480-b21a-b3ddef0e6d73@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6d2cd7f-35ba-4480-b21a-b3ddef0e6d73@citrix.com>

On Tue, Nov 19, 2024 at 03:35:34PM +0000, Andrew Cooper wrote:
> On 19/11/2024 2:39 pm, Roger Pau Monné wrote:
> > On Tue, Nov 19, 2024 at 02:21:35PM +0000, Andrew Cooper wrote:
> >> On 19/11/2024 10:34 am, Roger Pau Monne wrote:
> >>> ---
> >>>  xen/arch/x86/include/asm/msi.h | 35 ++++++++++++++--------------------
> >>>  1 file changed, 14 insertions(+), 21 deletions(-)
> >>>
> >>> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
> >>> index 748bc3cd6d8b..49a576383288 100644
> >>> --- a/xen/arch/x86/include/asm/msi.h
> >>> +++ b/xen/arch/x86/include/asm/msi.h
> >>> @@ -147,33 +147,26 @@ int msi_free_irq(struct msi_desc *entry);
> >>>   */
> >>>  #define NR_HP_RESERVED_VECTORS 	20
> >>>  
> >>> -#define msi_control_reg(base)		(base + PCI_MSI_FLAGS)
> >>> -#define msi_lower_address_reg(base)	(base + PCI_MSI_ADDRESS_LO)
> >>> -#define msi_upper_address_reg(base)	(base + PCI_MSI_ADDRESS_HI)
> >>> +#define msi_control_reg(base)		((base) + PCI_MSI_FLAGS)
> >>> +#define msi_lower_address_reg(base)	((base) + PCI_MSI_ADDRESS_LO)
> >>> +#define msi_upper_address_reg(base)	((base) + PCI_MSI_ADDRESS_HI)
> >>>  #define msi_data_reg(base, is64bit)	\
> >>> -	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
> >>> +	((base) + ((is64bit) ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32))
> >>>  #define msi_mask_bits_reg(base, is64bit) \
> >>> -	( (is64bit == 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4)
> >>> +	((base) + PCI_MSI_MASK_BIT - ((is64bit) ? 0 : 4))
> >>>  #define msi_pending_bits_reg(base, is64bit) \
> >>>  	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
> >>> -#define msi_disable(control)		control &= ~PCI_MSI_FLAGS_ENABLE
> >>>  #define multi_msi_capable(control) \
> >>> -	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
> >>> +	(1U << MASK_EXTR(control, PCI_MSI_FLAGS_QMASK))
> >>>  #define multi_msi_enable(control, num) \
> >>> -	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
> >>> -#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
> >>> -#define is_mask_bit_support(control)	(!!(control & PCI_MSI_FLAGS_MASKBIT))
> >>> -#define msi_enable(control, num) multi_msi_enable(control, num); \
> >>> -	control |= PCI_MSI_FLAGS_ENABLE
> >>> -
> >>> -#define msix_control_reg(base)		(base + PCI_MSIX_FLAGS)
> >>> -#define msix_table_offset_reg(base)	(base + PCI_MSIX_TABLE)
> >>> -#define msix_pba_offset_reg(base)	(base + PCI_MSIX_PBA)
> >>> -#define msix_enable(control)	 	control |= PCI_MSIX_FLAGS_ENABLE
> >>> -#define msix_disable(control)	 	control &= ~PCI_MSIX_FLAGS_ENABLE
> >>> -#define msix_table_size(control) 	((control & PCI_MSIX_FLAGS_QSIZE)+1)
> >>> -#define msix_unmask(address)	 	(address & ~PCI_MSIX_VECTOR_BITMASK)
> >>> -#define msix_mask(address)		(address | PCI_MSIX_VECTOR_BITMASK)
> >>> +	((control) |= MASK_INSR(fls(num) - 1, PCI_MSI_FLAGS_QSIZE))
> >>> +#define is_64bit_address(control)	!!((control) & PCI_MSI_FLAGS_64BIT)
> >>> +#define is_mask_bit_support(control)	!!((control) & PCI_MSI_FLAGS_MASKBIT)
> >> You need to retain the outermost brackets for other MISRA reasons.
> > I was borderline on dropping those braces, as I was expecting Misra to
> > require them.
> >
> >> I'm happy to fix up on commit, even splitting the patch (seeing as I've
> >> already done the split in order to review the rest).
> > Fine, by split I think you mean the pruning of unused macros vs the
> > fixing of the parentheses?
> 
> Split pruning out into another patch, fold the bracket fix into this one.

If you want I can do that myself, as I will likely need to resend #3
to drop the unneeded __maybe_unused attribute.

Thanks, Roger.

