Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D186FE44
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 11:03:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688262.1072284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh59s-0006Oc-G6; Mon, 04 Mar 2024 10:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688262.1072284; Mon, 04 Mar 2024 10:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh59s-0006Mn-DC; Mon, 04 Mar 2024 10:02:56 +0000
Received: by outflank-mailman (input) for mailman id 688262;
 Mon, 04 Mar 2024 10:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0qD=KK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rh59q-0006Mf-Fr
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 10:02:54 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50b4a666-da0e-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 11:02:32 +0100 (CET)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-42e89610ed8so25571851cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 02:02:31 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 r13-20020ac8794d000000b0042ef2aec595sm726086qtt.67.2024.03.04.02.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 02:02:30 -0800 (PST)
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
X-Inumbo-ID: 50b4a666-da0e-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709546551; x=1710151351; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s/G6blyqMTssk1cXnyPmi1uDTIHsC/KVDdHuUdT+F6I=;
        b=AaRsEwcTLzWLfGHmTPMjD97vKgVtCcnbE5SM12cp4qaBLEbiQNg0BCiHuy3RIMqvcv
         xxu1ZXCB3WhpBYg3U86AbX8hdP+mZPxlCHBipRpJjR97syGXqDR9NkZq8agjuS2hN2an
         ktj2XzHLIVFVUrKETumXmERB6KXR9hzmw0ooc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709546551; x=1710151351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/G6blyqMTssk1cXnyPmi1uDTIHsC/KVDdHuUdT+F6I=;
        b=F9sq1nZ1olWhqXEPQboMmkVexRbnYwhOBUr8nOVoHIT4Mi4Yh+uFyp6rmO+pavxUpA
         EUNl/0G4/QUa8ZhpAKZ2mVn7AehE+/tLs4bRec57t1syRLmXf0hRNhE4vD2LxNL1svaT
         T3V+kC/GMqn1q1pXCAeD9VK3XRLzDGPDa0L3qhbHwOQx4HZGCx9vw7o/sfn2/2lPmjda
         ZRj6t+6nUzfy5IwKqtUulg8ZB3bzdQ2h6rXtslL8XA881K/fEpbcn+IaRegIGBtpTSvu
         lbbKegyHBzPVIy3XA7lDNFAGmnK8x4JfIsrMr3I694G4i2SrqFskgthTXgivCAm7EIec
         je/g==
X-Gm-Message-State: AOJu0YzPTAVJCA8ZghhFQ9eKO55pPGaBsSVfOQsShWesks9De7LJ5Y/F
	GJqD52/JuQWIwwdAA9o6a+3GJc27dmUqmgdYTRUcPuUquayaWkWb//m3ojxxd1Y=
X-Google-Smtp-Source: AGHT+IFZ9mk7e0sQ+CQ51MjCdAUkEwC2OBX5jF8SNuzKRcTxl1o6HPYh/XJo75hsJZxYHrVL2hKlaw==
X-Received: by 2002:a05:622a:11ca:b0:42e:9146:a0bd with SMTP id n10-20020a05622a11ca00b0042e9146a0bdmr12425331qtk.49.1709546550747;
        Mon, 04 Mar 2024 02:02:30 -0800 (PST)
Date: Mon, 4 Mar 2024 11:02:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Neowutran <xen@neowutran.ovh>
Subject: Re: [PATCH] hvmloader/PCI: skip huge BARs in certain calculations
Message-ID: <ZeWcNGRsjGgUosJY@macbook>
References: <090d572c-5196-46b2-9d6b-741b7cb66d97@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <090d572c-5196-46b2-9d6b-741b7cb66d97@suse.com>

On Mon, Mar 04, 2024 at 08:32:22AM +0100, Jan Beulich wrote:
> BARs of size 2Gb and up can't possibly fit below 4Gb: Both the bottom of
> the lower 2Gb range and the top of the higher 2Gb range have special
> purpose. Don't even have them influence whether to (perhaps) relocate
> low RAM.

Here you mention 2Gb BARs, yet the code below sets the maximum BAR
size supported below 4Gb to 1Gb.

> Reported-by: Neowutran <xen@neowutran.ovh>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> If we wanted to fit e.g. multiple 1Gb BARs, it would likely be prudent
> to similarly avoid low RAM relocation in the first place. Yet accounting
> for things differently depending on how many large BARs there are would
> require more intrusive code changes.
> 
> That said, I'm open to further lowering of the threshold. That'll
> require different justification then, though.
> 
> --- a/tools/firmware/hvmloader/pci.c
> +++ b/tools/firmware/hvmloader/pci.c
> @@ -33,6 +33,13 @@ uint32_t pci_mem_start = HVM_BELOW_4G_MM
>  const uint32_t pci_mem_end = RESERVED_MEMBASE;
>  uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
>  
> +/*
> + * BARs larger than this value are put in 64-bit space unconditionally.  That
> + * is, such BARs also don't play into the determination of how big the lowmem
> + * MMIO hole needs to be.
> + */
> +#define HUGE_BAR_THRESH GB(1)

I would be fine with defining this to an even lower number, like
256Mb, as to avoid as much as possible memory relocation in order to
make the MMIO hole bigger.

> +
>  enum virtual_vga virtual_vga = VGA_none;
>  unsigned long igd_opregion_pgbase = 0;
>  
> @@ -286,9 +293,11 @@ void pci_setup(void)
>              bars[i].bar_reg = bar_reg;
>              bars[i].bar_sz  = bar_sz;
>  
> -            if ( ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> -                  PCI_BASE_ADDRESS_SPACE_MEMORY) ||
> -                 (bar_reg == PCI_ROM_ADDRESS) )
> +            if ( is_64bar && bar_sz > HUGE_BAR_THRESH )
> +                bar64_relocate = 1;
> +            else if ( ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
> +                       PCI_BASE_ADDRESS_SPACE_MEMORY) ||
> +                      (bar_reg == PCI_ROM_ADDRESS) )
>                  mmio_total += bar_sz;
>  
>              nr_bars++;
> @@ -367,7 +376,7 @@ void pci_setup(void)
>              pci_mem_start = hvm_info->low_mem_pgend << PAGE_SHIFT;
>      }
>  
> -    if ( mmio_total > (pci_mem_end - pci_mem_start) )
> +    if ( mmio_total > (pci_mem_end - pci_mem_start) || bar64_relocate )
>      {
>          printf("Low MMIO hole not large enough for all devices,"
>                 " relocating some BARs to 64-bit\n");

Is the above message now accurate?  Given the current code the low
MMIO could be expanded up to 2Gb, yet BAR relocation will happen
unconditionally once a 1Gb BAR is found.

> @@ -446,8 +455,9 @@ void pci_setup(void)
>           *   the code here assumes it to be.)
>           * Should either of those two conditions change, this code will break.
>           */
> -        using_64bar = bars[i].is_64bar && bar64_relocate
> -            && (mmio_total > (mem_resource.max - mem_resource.base));
> +        using_64bar = bars[i].is_64bar && bar64_relocate &&
> +            (mmio_total > (mem_resource.max - mem_resource.base) ||
> +             bar_sz > HUGE_BAR_THRESH);
>          bar_data = pci_readl(devfn, bar_reg);
>  
>          if ( (bar_data & PCI_BASE_ADDRESS_SPACE) ==
> @@ -467,7 +477,8 @@ void pci_setup(void)
>                  resource = &mem_resource;
>                  bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
>              }
> -            mmio_total -= bar_sz;
> +            if ( bar_sz <= HUGE_BAR_THRESH )
> +                mmio_total -= bar_sz;

I'm missing the part where hvmloader notifies QEMU of the possibly
expanded base and size memory PCI MMIO regions, so that those are
reflected in the PCI root complex registers?

Overall I think we could simplify the code by having a hardcoded 1Gb
PCI MMIO hole below 4Gb, fill it with all the 32bit BARs and
(re)locate all 64bit BARs above 4Gb (not that I'm requesting you to do
it here).

Thanks, Roger.

