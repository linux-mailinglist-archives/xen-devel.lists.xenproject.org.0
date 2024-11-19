Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C449D27F9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840203.1256036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDP6t-0007ly-F7; Tue, 19 Nov 2024 14:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840203.1256036; Tue, 19 Nov 2024 14:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDP6t-0007jA-AE; Tue, 19 Nov 2024 14:21:43 +0000
Received: by outflank-mailman (input) for mailman id 840203;
 Tue, 19 Nov 2024 14:21:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydLn=SO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tDP6s-0007dt-Lb
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:21:42 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 966b8a53-a681-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 15:21:37 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a99eb8b607aso127619266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:21:37 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e043316sm656195366b.135.2024.11.19.06.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 06:21:36 -0800 (PST)
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
X-Inumbo-ID: 966b8a53-a681-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijk2NmI4YTUzLWE2ODEtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI2MDk3Ljc5MTM3NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732026097; x=1732630897; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aLvJ3gMSLd1W/oSfXodJhG+t9ir2LHLsSl1Al3oYzmA=;
        b=M6UrcmZc3d/05iwU331jq0/XoSmL1WpjvN4yu9Tnq/Tab4X54z3/YZFERUjUl7r1Qb
         bv44n9y/4Hr1InE3SWH3aDVJdZkBrYMjEAVx782JKm7TV12UyNTl8dmIQHoxuAY8A++E
         VpfOOZN4okl6kE81kLO15K5MLEvjRCna8R5VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732026097; x=1732630897;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLvJ3gMSLd1W/oSfXodJhG+t9ir2LHLsSl1Al3oYzmA=;
        b=pFf9VMy0aEA1jPuI1UhVEddzBIG/BVCltuF0j0OeJbfovWcl9p3EljdJq+RN/ZbR18
         0HuD/OdNVU/wTf6oViPc6/EYaGByMhf8PcWkJCt5rHvl2DJAXHZixpqVUsuyBfv4xE08
         QcUicpo9SrQFthkcMf9AU24zOi37FmqVPSNFsiabR3P6dt/KlakMfoXctw3VIVSX8Qjo
         qrvA84nBP66Dy7A3TN1EiGJcKSv4+UIfVRbu/lB6zDi/cPRHIc8m+i6Da4bwRFgkTyYZ
         YjI8+6cOXPiHcTVmw7G0tMCS6PYYudFtaVF8IY8Y2MJAfd/wxO1aGwzVzakpTBgKJ2Zg
         wsHw==
X-Forwarded-Encrypted: i=1; AJvYcCWpFyeNYeHcCvcJuuL4cfjGj5BiPcMsoWrz3fzb8tGCIKJp2Y4lFoLpCSuJ84ExvfSROqwCLK/xc2E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzxt+QZOXIbQpoekoOVDNDJTVt0xEovBpQw7g1MMGOT8QqEDJHH
	Ggq1HHD5yfdmAxDUm4S68ZDOnhQUWN281pgMxRnm9Cek9+xbBlqXuyLKb1cssZ8=
X-Google-Smtp-Source: AGHT+IEgQU73TcXWqZKsN3ETJG5Le2bVQ0Y2zrc24Y6PPWJwkjhyGZrVZTELzle//NNPgvUoXeCOwQ==
X-Received: by 2002:a17:907:3f98:b0:a9a:26a1:1963 with SMTP id a640c23a62f3a-aa4833f66c5mr1567138966b.7.1732026097185;
        Tue, 19 Nov 2024 06:21:37 -0800 (PST)
Message-ID: <05127810-a5d3-46f7-9a5b-8f5ac1ab8b87@citrix.com>
Date: Tue, 19 Nov 2024 14:21:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/msi: fix Misra Rule 20.7 in msi.h
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20241119103444.23296-1-roger.pau@citrix.com>
 <20241119103444.23296-3-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241119103444.23296-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/11/2024 10:34 am, Roger Pau Monne wrote:
> Prune unused macros and adjust the remaining ones to parenthesize macro
> arguments.
>
> No functional change intended.
>
> Singed-off-by: Roger Pau Monné <roger.pau@citrix.com>

It's a little early for carol season, isn't it?

It would help to identify which macros are being dropped, because the
diff is far from simple to read.

AFAICT, its:

  msi_disable()
  msi_enable()
  msix_enable()
  msix_disable()
  msix_unmask()
  msix_mask()

Splitting this change does make a marginal improvement in the diff, and
a substantial improvement in `git diff --color-word`'s ability to review
this change.

You've also introduced uses of MASK_EXTR() and MASK_INSR(), which at
least ought to be noted in the commit message.  Technically I think it's
a bugfix for multi_msi_enable(), because I think it now won't overflow
the 3-bit field if an overly large num is passed in.


Bloat-o-meter reports:

add/remove: 0/0 grow/shrink: 3/1 up/down: 15/-61 (-46)
Function                                     old     new   delta
set_iommu_interrupt_handler                  366     373      +7
write_msi_msg                                348     352      +4
init_msi                                     574     578      +4
pci_enable_msi                              1084    1023     -61


Taking the first example, that's caused by swapping this:

> iommu->msi.msi.mpos = ( ((!!(control & 0x80)) == 1) ?
> iommu->msi.msi_attrib.pos+16 : iommu->msi.msi_attrib.pos+16 -4);

for this:

> iommu->msi.msi.mpos = ((iommu->msi.msi_attrib.pos) + 16 -
> (((!!((control) & 0x80))) ? 0 : 4));

and code generation changing from a CMOV to straight-line arithmetic.

In write_msi_msg(), we actually drop a conditional branch and replace it
with straight-line arithmetic.

init_msi() gets a substantial restructuring, but it looks like two
branches are dropped.

pci_enable_msi() has the biggest change, but doesn't obviously reduce
the number of branches.  There is clearly less register setup around
existing branches, so my best guess is that the new macro forms are more
amenable to common-sub-expression-elimination.


Either way, it's all minor.  Staring at the diff for long enough, I'm
pretty sure it's all good.

> ---
>  xen/arch/x86/include/asm/msi.h | 35 ++++++++++++++--------------------
>  1 file changed, 14 insertions(+), 21 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
> index 748bc3cd6d8b..49a576383288 100644
> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -147,33 +147,26 @@ int msi_free_irq(struct msi_desc *entry);
>   */
>  #define NR_HP_RESERVED_VECTORS 	20
>  
> -#define msi_control_reg(base)		(base + PCI_MSI_FLAGS)
> -#define msi_lower_address_reg(base)	(base + PCI_MSI_ADDRESS_LO)
> -#define msi_upper_address_reg(base)	(base + PCI_MSI_ADDRESS_HI)
> +#define msi_control_reg(base)		((base) + PCI_MSI_FLAGS)
> +#define msi_lower_address_reg(base)	((base) + PCI_MSI_ADDRESS_LO)
> +#define msi_upper_address_reg(base)	((base) + PCI_MSI_ADDRESS_HI)
>  #define msi_data_reg(base, is64bit)	\
> -	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
> +	((base) + ((is64bit) ? PCI_MSI_DATA_64 : PCI_MSI_DATA_32))
>  #define msi_mask_bits_reg(base, is64bit) \
> -	( (is64bit == 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4)
> +	((base) + PCI_MSI_MASK_BIT - ((is64bit) ? 0 : 4))
>  #define msi_pending_bits_reg(base, is64bit) \
>  	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
> -#define msi_disable(control)		control &= ~PCI_MSI_FLAGS_ENABLE
>  #define multi_msi_capable(control) \
> -	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
> +	(1U << MASK_EXTR(control, PCI_MSI_FLAGS_QMASK))
>  #define multi_msi_enable(control, num) \
> -	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
> -#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
> -#define is_mask_bit_support(control)	(!!(control & PCI_MSI_FLAGS_MASKBIT))
> -#define msi_enable(control, num) multi_msi_enable(control, num); \
> -	control |= PCI_MSI_FLAGS_ENABLE
> -
> -#define msix_control_reg(base)		(base + PCI_MSIX_FLAGS)
> -#define msix_table_offset_reg(base)	(base + PCI_MSIX_TABLE)
> -#define msix_pba_offset_reg(base)	(base + PCI_MSIX_PBA)
> -#define msix_enable(control)	 	control |= PCI_MSIX_FLAGS_ENABLE
> -#define msix_disable(control)	 	control &= ~PCI_MSIX_FLAGS_ENABLE
> -#define msix_table_size(control) 	((control & PCI_MSIX_FLAGS_QSIZE)+1)
> -#define msix_unmask(address)	 	(address & ~PCI_MSIX_VECTOR_BITMASK)
> -#define msix_mask(address)		(address | PCI_MSIX_VECTOR_BITMASK)
> +	((control) |= MASK_INSR(fls(num) - 1, PCI_MSI_FLAGS_QSIZE))
> +#define is_64bit_address(control)	!!((control) & PCI_MSI_FLAGS_64BIT)
> +#define is_mask_bit_support(control)	!!((control) & PCI_MSI_FLAGS_MASKBIT)

You need to retain the outermost brackets for other MISRA reasons.

I'm happy to fix up on commit, even splitting the patch (seeing as I've
already done the split in order to review the rest).

~Andrew

