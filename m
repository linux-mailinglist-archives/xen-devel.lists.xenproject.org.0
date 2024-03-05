Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D84948719A3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 10:32:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688657.1073116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhR9O-0003xz-U3; Tue, 05 Mar 2024 09:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688657.1073116; Tue, 05 Mar 2024 09:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhR9O-0003vw-RV; Tue, 05 Mar 2024 09:31:54 +0000
Received: by outflank-mailman (input) for mailman id 688657;
 Tue, 05 Mar 2024 09:31:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXiD=KL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rhR9N-0003vq-AO
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 09:31:53 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 328086e5-dad3-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 10:31:52 +0100 (CET)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-68facd7ea4bso24821676d6.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 01:31:52 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 or33-20020a05621446a100b0068f455083fbsm5988780qvb.63.2024.03.05.01.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 01:31:50 -0800 (PST)
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
X-Inumbo-ID: 328086e5-dad3-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709631111; x=1710235911; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f7Hdyneh0bF9rKcOXYTu1KEF6mx7L0GYzE3MErGK9FE=;
        b=dccFRSrKsABZ49RTX00dP1P9tNJwaWRrmENZ1Qj3S1fBXkLn6D/CnJ3J7OH24teCO7
         SnI8Am0SKc1mpdVjDJ3Bq70CvCWU2HlR2XMR2yYLHdqRovrxxIf+E+85sjK7LJVcUbs/
         aUEpafppo67BMybKt7nGV+AGynBeOM65mVk7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709631111; x=1710235911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7Hdyneh0bF9rKcOXYTu1KEF6mx7L0GYzE3MErGK9FE=;
        b=voSWCpdNRrB4aF0GdEdCDcs6S8ud4otm+APHS7XGXN7ylT1U4SK6wxrIRqic+7s3Di
         WCWZ4knXTfl3l5Yok3kNtHWHYwBumgnam760zvMzBrQhv9ddctvWPgkh+G1WI3vfxyfg
         cLOhDwaYJgPlLKkzaMMMhjGGINrIPzUKWh8Jyu4drFK+XXZKQbTXPlpyDLsi5WvSqxPx
         wLxmpdk35fZognuvsBLuVASDXY3s4L2R4K/CD/hLE6YdIkX4KXyrXEgT3lBK6QpJut/Y
         bFuSeXUuMRP/hDvuFy4yi9e9pArkoZvdxl8QKs/Hv4IHDfxp54QIkWUGD6QvWeCGSNIm
         PWKQ==
X-Gm-Message-State: AOJu0YzEPkny3FH89nsiq3u11p667grzzcmNCaXnQ18L7em9hf8tWiXN
	GWn6yY4HIGXCpt1Zi8ft3N0veXj+5XWcs2BznXfivS0agwfCc6Hd6tuF5e9y79MEJNHopWUZQ+j
	g
X-Google-Smtp-Source: AGHT+IEVsPhLHwihvsLUKR+dooz4em4+DZA6bmfsmayJDeizklumS2XwHDvhV0BRCxN7vaY0NYu4/Q==
X-Received: by 2002:ad4:4d06:0:b0:690:766e:56d2 with SMTP id l6-20020ad44d06000000b00690766e56d2mr1362156qvl.4.1709631110952;
        Tue, 05 Mar 2024 01:31:50 -0800 (PST)
Date: Tue, 5 Mar 2024 10:31:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Neowutran <xen@neowutran.ovh>
Subject: Re: [PATCH] hvmloader/PCI: skip huge BARs in certain calculations
Message-ID: <ZebmhBHpFasxFfiW@macbook>
References: <090d572c-5196-46b2-9d6b-741b7cb66d97@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <090d572c-5196-46b2-9d6b-741b7cb66d97@suse.com>

On Mon, Mar 04, 2024 at 08:32:22AM +0100, Jan Beulich wrote:
> BARs of size 2Gb and up can't possibly fit below 4Gb: Both the bottom of
> the lower 2Gb range and the top of the higher 2Gb range have special
> purpose. Don't even have them influence whether to (perhaps) relocate
> low RAM.
> 
> Reported-by: Neowutran <xen@neowutran.ovh>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

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

I would maybe name this `BAR_RELOCATE_THRESH, `HUGE_BAR` is too
generic IMO.

And also use 256Mb instead of 1GB, but just having a limit is good
enough, we can further tune it afterwards.

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
> @@ -446,8 +455,9 @@ void pci_setup(void)
>           *   the code here assumes it to be.)
>           * Should either of those two conditions change, this code will break.
>           */
> -        using_64bar = bars[i].is_64bar && bar64_relocate
> -            && (mmio_total > (mem_resource.max - mem_resource.base));
> +        using_64bar = bars[i].is_64bar && bar64_relocate &&
> +            (mmio_total > (mem_resource.max - mem_resource.base) ||
> +             bar_sz > HUGE_BAR_THRESH);

There's a comment above this that starts with:

"Relocate to high memory if the total amount of MMIO needed is more
than the low MMIO available."

I would slightly reword it to:

"Relocate to high memory if the total amount of MMIO needed is more
than the low MMIO available or BARs bigger that HUGE_BAR_THRESH are
present."

Thanks, Roger.

